//Project – Querying a Large Relational Database

--Get all the details from the person table including email ID, phone number, and phone
number type

select * from [person].[person]

select * from [Person].[PersonPhone]

select * from [Person].[PhoneNumberType]

select * from [Person].[EmailAddress]


select p.*,ph.PhoneNumber,pht.Name,pe.EmailAddress from [person].[person] as p
inner join
[Person].[PersonPhone] as ph
on p.BusinessEntityID=ph.BusinessEntityID
inner join
[Person].[PhoneNumberType] as pht
on ph.PhoneNumberTypeID=pht.PhoneNumberTypeID
inner join
[Person].[EmailAddress] as pe
on pe.BusinessEntityID=p.BusinessEntityID


In Other way(without inner join),


select p.*,ph.PhoneNumber,pht.Name,pe.EmailAddress from [person].[person] as p,
[Person].[PersonPhone] as ph,
[Person].[PhoneNumberType] as pht,
[Person].[EmailAddress] as pe
where p.BusinessEntityID=ph.BusinessEntityID and ph.PhoneNumberTypeID=pht.PhoneNumberTypeID
and pe.BusinessEntityID=p.BusinessEntityID

--Get the details of the sales header order made in May 2011

select * from [Sales].[SalesOrderHeader]

select * from [Sales].[SalesOrderHeader] where MONTH(OrderDate)=6 AND YEAR(OrderDate) = 2011


--Get the details of the sales details order made in the month of May 2011

select * from [Sales].[SalesOrderDetail]
select * from [Sales].[SalesOrderHeader]


select * from [Sales].[SalesOrderDetail] AS SOD
INNER JOIN
[Sales].[SalesOrderHeader] AS SOH
ON SOD.SalesOrderID=SOH.SalesOrderID
WHERE MONTH(OrderDate)= 5 AND YEAR(ORDERDATE)=2011

--Get the total sales made in May 2011

SELECT * FROM [Sales].[SalesTerritory]
select * from [Sales].[SalesOrderDetail]



SELECT SUM(LINETOTAL) FROM [Sales].[SalesOrderDetail]
WHERE SalesOrderID IN(SELECT SalesOrderID FROM [Sales].[SalesOrderHeader]
WHERE MONTH(OrderDate)= 5 AND YEAR(ORDERDATE)=2011)


--Get the total sales made in the year 2011 by month order by increasing sales

SELECT MONTH(ORDERDATE),SUM(TotalDue) AS SALES_VALUE FROM [Sales].[SalesOrderHeader]
WHERE YEAR(ORDERDATE)=2011
GROUP BY MONTH(ORDERDATE)
ORDER BY SALES_VALUE DESC


--Get the total sales made to the customer with FirstName='Gustavo' and LastName ='Achong'

SELECT * FROM 
[Sales].[SalesPerson] AS SP
INNER JOIN
[Person].[Person] AS PP
ON SP.BUSINESSENTITYID
=PP.BUSINESSENTITYID
WHERE
FirstName='Gustavo' AND LastName ='Achong'


