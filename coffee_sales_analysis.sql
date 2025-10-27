-- 1. Create table
CREATE TABLE coffee_sales (
    order_id NUMBER PRIMARY KEY,
    product_name VARCHAR2(100),
    product_category VARCHAR2(50),
    product_type VARCHAR2(50),
    size VARCHAR2(20),
    quantity NUMBER,
    price NUMBER,
    total_amount NUMBER,
    order_time DATE,
    location VARCHAR2(50)
);

-- 2. Total quantity sold
SELECT SUM(quantity) AS total_quantity FROM coffee_sales;

-- 3. Total transactions
SELECT COUNT(DISTINCT order_id) AS total_transactions FROM coffee_sales;

-- 4. Total revenue
SELECT SUM(total_amount) AS total_revenue FROM coffee_sales;

-- 5. Top 10 products by quantity
SELECT product_name, SUM(quantity) AS total_qty
FROM coffee_sales
GROUP BY product_name
ORDER BY total_qty DESC
FETCH FIRST 10 ROWS ONLY;

-- 6. Location-wise sales
SELECT location, SUM(total_amount) AS total_sales
FROM coffee_sales
GROUP BY location;

-- 7. Hourly sales trend
SELECT TO_CHAR(order_time, 'HH24') AS hour, SUM(total_amount) AS total_sales
FROM coffee_sales
GROUP BY TO_CHAR(order_time, 'HH24')
ORDER BY hour;

-- 8. Product category distribution
SELECT product_category, SUM(quantity) AS total_qty
FROM coffee_sales
GROUP BY product_category
ORDER BY total_qty DESC;

-- 9. Product type distribution
SELECT product_type, SUM(quantity) AS total_qty
FROM coffee_sales
GROUP BY product_type
ORDER BY total_qty DESC;

-- 10. Size-wise sales
SELECT size, SUM(total_amount) AS total_sales
FROM coffee_sales
GROUP BY size;
