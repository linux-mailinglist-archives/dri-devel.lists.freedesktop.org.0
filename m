Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9840D8D67AC
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 19:09:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0836010E597;
	Fri, 31 May 2024 17:08:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NBrCSbBa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 500F910E634
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 17:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717175333; x=1748711333;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3PIKjX4C8x631MS4CKk45aCDtHEPJ9w4WNa6zwbGgDg=;
 b=NBrCSbBaTnZHUmeUzU/XBbske1sWYQGRkD8SxAJq33PGPtasQh8R3oDh
 742Q5KzDIaI5MIdirV6FaCzrYsKL9nCk6+9grOlMUmF3X2OnD+PWG9EQQ
 jom1fqqawE0U3+hdpedcORBy/m73spizcAh84fw/oltjaVX9l3zPge1dY
 HXRziix5oaK1b2H4BJj0oEfbVHv4TCALbnrMhh1aR34sQAOUYpLSHrg+1
 CIygSZOuOlEbsyOFqWKWv9ObfWyAtrMWz+4a7CylAlI8uUyINR6p/J3HG
 pZ6o1+T4/p0rv/uwZ/bqM//snxm5/F5KFtiFQwAbdXz21tGuo9nHhcMqZ Q==;
X-CSE-ConnectionGUID: nNZ2pf+/SHufPAGgdnuzkQ==
X-CSE-MsgGUID: lwT06aKITuivgCt7dHRh+g==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="31224230"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="31224230"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 10:08:52 -0700
X-CSE-ConnectionGUID: mHQrX2IWRVa5+r7AUEnNXw==
X-CSE-MsgGUID: wQSkJeloQSqgY/IxW9qV6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="36163156"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa010.jf.intel.com with ESMTP; 31 May 2024 10:08:49 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id A6D02668; Fri, 31 May 2024 20:08:46 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-leds@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Cc: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Pavel Machek <pavel@ucw.cz>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Johan Hovold <jhovold@gmail.com>
Subject: [PATCH v1 4/4] mfd: lm3533: Remove the driver
Date: Fri, 31 May 2024 19:56:16 +0300
Message-ID: <20240531170844.1595468-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20240531170844.1595468-1-andriy.shevchenko@linux.intel.com>
References: <20240531170844.1595468-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver has no in kernel users and requires a board file
to be instantiated. Remove basically a dead code.

If ever needed, it can be reinstantiated and converted to one
that uses firmware node interfaces.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/mfd/lm3533-core.c  | 645 -------------------------------------
 include/linux/mfd/lm3533.h | 100 ------
 2 files changed, 745 deletions(-)
 delete mode 100644 drivers/mfd/lm3533-core.c
 delete mode 100644 include/linux/mfd/lm3533.h

diff --git a/drivers/mfd/lm3533-core.c b/drivers/mfd/lm3533-core.c
deleted file mode 100644
index c211183cecb2..000000000000
--- a/drivers/mfd/lm3533-core.c
+++ /dev/null
@@ -1,645 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * lm3533-core.c -- LM3533 Core
- *
- * Copyright (C) 2011-2012 Texas Instruments
- *
- * Author: Johan Hovold <jhovold@gmail.com>
- */
-
-#include <linux/module.h>
-#include <linux/init.h>
-#include <linux/kernel.h>
-#include <linux/err.h>
-#include <linux/gpio.h>
-#include <linux/i2c.h>
-#include <linux/mfd/core.h>
-#include <linux/regmap.h>
-#include <linux/seq_file.h>
-#include <linux/slab.h>
-#include <linux/uaccess.h>
-
-#include <linux/mfd/lm3533.h>
-
-
-#define LM3533_BOOST_OVP_MASK		0x06
-#define LM3533_BOOST_OVP_SHIFT		1
-
-#define LM3533_BOOST_FREQ_MASK		0x01
-#define LM3533_BOOST_FREQ_SHIFT		0
-
-#define LM3533_BL_ID_MASK		1
-#define LM3533_LED_ID_MASK		3
-#define LM3533_BL_ID_MAX		1
-#define LM3533_LED_ID_MAX		3
-
-#define LM3533_HVLED_ID_MAX		2
-#define LM3533_LVLED_ID_MAX		5
-
-#define LM3533_REG_OUTPUT_CONF1		0x10
-#define LM3533_REG_OUTPUT_CONF2		0x11
-#define LM3533_REG_BOOST_PWM		0x2c
-
-#define LM3533_REG_MAX			0xb2
-
-
-static struct mfd_cell lm3533_als_devs[] = {
-	{
-		.name	= "lm3533-als",
-		.id	= -1,
-	},
-};
-
-static struct mfd_cell lm3533_bl_devs[] = {
-	{
-		.name	= "lm3533-backlight",
-		.id	= 0,
-	},
-	{
-		.name	= "lm3533-backlight",
-		.id	= 1,
-	},
-};
-
-static struct mfd_cell lm3533_led_devs[] = {
-	{
-		.name	= "lm3533-leds",
-		.id	= 0,
-	},
-	{
-		.name	= "lm3533-leds",
-		.id	= 1,
-	},
-	{
-		.name	= "lm3533-leds",
-		.id	= 2,
-	},
-	{
-		.name	= "lm3533-leds",
-		.id	= 3,
-	},
-};
-
-int lm3533_read(struct lm3533 *lm3533, u8 reg, u8 *val)
-{
-	int tmp;
-	int ret;
-
-	ret = regmap_read(lm3533->regmap, reg, &tmp);
-	if (ret < 0) {
-		dev_err(lm3533->dev, "failed to read register %02x: %d\n",
-								reg, ret);
-		return ret;
-	}
-
-	*val = tmp;
-
-	dev_dbg(lm3533->dev, "read [%02x]: %02x\n", reg, *val);
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(lm3533_read);
-
-int lm3533_write(struct lm3533 *lm3533, u8 reg, u8 val)
-{
-	int ret;
-
-	dev_dbg(lm3533->dev, "write [%02x]: %02x\n", reg, val);
-
-	ret = regmap_write(lm3533->regmap, reg, val);
-	if (ret < 0) {
-		dev_err(lm3533->dev, "failed to write register %02x: %d\n",
-								reg, ret);
-	}
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(lm3533_write);
-
-int lm3533_update(struct lm3533 *lm3533, u8 reg, u8 val, u8 mask)
-{
-	int ret;
-
-	dev_dbg(lm3533->dev, "update [%02x]: %02x/%02x\n", reg, val, mask);
-
-	ret = regmap_update_bits(lm3533->regmap, reg, mask, val);
-	if (ret < 0) {
-		dev_err(lm3533->dev, "failed to update register %02x: %d\n",
-								reg, ret);
-	}
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(lm3533_update);
-
-static int lm3533_set_boost_freq(struct lm3533 *lm3533,
-						enum lm3533_boost_freq freq)
-{
-	int ret;
-
-	ret = lm3533_update(lm3533, LM3533_REG_BOOST_PWM,
-					freq << LM3533_BOOST_FREQ_SHIFT,
-					LM3533_BOOST_FREQ_MASK);
-	if (ret)
-		dev_err(lm3533->dev, "failed to set boost frequency\n");
-
-	return ret;
-}
-
-
-static int lm3533_set_boost_ovp(struct lm3533 *lm3533,
-						enum lm3533_boost_ovp ovp)
-{
-	int ret;
-
-	ret = lm3533_update(lm3533, LM3533_REG_BOOST_PWM,
-					ovp << LM3533_BOOST_OVP_SHIFT,
-					LM3533_BOOST_OVP_MASK);
-	if (ret)
-		dev_err(lm3533->dev, "failed to set boost ovp\n");
-
-	return ret;
-}
-
-/*
- * HVLED output config -- output hvled controlled by backlight bl
- */
-static int lm3533_set_hvled_config(struct lm3533 *lm3533, u8 hvled, u8 bl)
-{
-	u8 val;
-	u8 mask;
-	int shift;
-	int ret;
-
-	if (hvled == 0 || hvled > LM3533_HVLED_ID_MAX)
-		return -EINVAL;
-
-	if (bl > LM3533_BL_ID_MAX)
-		return -EINVAL;
-
-	shift = hvled - 1;
-	mask = LM3533_BL_ID_MASK << shift;
-	val = bl << shift;
-
-	ret = lm3533_update(lm3533, LM3533_REG_OUTPUT_CONF1, val, mask);
-	if (ret)
-		dev_err(lm3533->dev, "failed to set hvled config\n");
-
-	return ret;
-}
-
-/*
- * LVLED output config -- output lvled controlled by LED led
- */
-static int lm3533_set_lvled_config(struct lm3533 *lm3533, u8 lvled, u8 led)
-{
-	u8 reg;
-	u8 val;
-	u8 mask;
-	int shift;
-	int ret;
-
-	if (lvled == 0 || lvled > LM3533_LVLED_ID_MAX)
-		return -EINVAL;
-
-	if (led > LM3533_LED_ID_MAX)
-		return -EINVAL;
-
-	if (lvled < 4) {
-		reg = LM3533_REG_OUTPUT_CONF1;
-		shift = 2 * lvled;
-	} else {
-		reg = LM3533_REG_OUTPUT_CONF2;
-		shift = 2 * (lvled - 4);
-	}
-
-	mask = LM3533_LED_ID_MASK << shift;
-	val = led << shift;
-
-	ret = lm3533_update(lm3533, reg, val, mask);
-	if (ret)
-		dev_err(lm3533->dev, "failed to set lvled config\n");
-
-	return ret;
-}
-
-static void lm3533_enable(struct lm3533 *lm3533)
-{
-	if (gpio_is_valid(lm3533->gpio_hwen))
-		gpio_set_value(lm3533->gpio_hwen, 1);
-}
-
-static void lm3533_disable(struct lm3533 *lm3533)
-{
-	if (gpio_is_valid(lm3533->gpio_hwen))
-		gpio_set_value(lm3533->gpio_hwen, 0);
-}
-
-enum lm3533_attribute_type {
-	LM3533_ATTR_TYPE_BACKLIGHT,
-	LM3533_ATTR_TYPE_LED,
-};
-
-struct lm3533_device_attribute {
-	struct device_attribute dev_attr;
-	enum lm3533_attribute_type type;
-	union {
-		struct {
-			u8 id;
-		} output;
-	} u;
-};
-
-#define to_lm3533_dev_attr(_attr) \
-	container_of(_attr, struct lm3533_device_attribute, dev_attr)
-
-static ssize_t show_output(struct device *dev,
-				struct device_attribute *attr, char *buf)
-{
-	struct lm3533 *lm3533 = dev_get_drvdata(dev);
-	struct lm3533_device_attribute *lattr = to_lm3533_dev_attr(attr);
-	int id = lattr->u.output.id;
-	u8 reg;
-	u8 val;
-	u8 mask;
-	int shift;
-	int ret;
-
-	if (lattr->type == LM3533_ATTR_TYPE_BACKLIGHT) {
-		reg = LM3533_REG_OUTPUT_CONF1;
-		shift = id - 1;
-		mask = LM3533_BL_ID_MASK << shift;
-	} else {
-		if (id < 4) {
-			reg = LM3533_REG_OUTPUT_CONF1;
-			shift = 2 * id;
-		} else {
-			reg = LM3533_REG_OUTPUT_CONF2;
-			shift = 2 * (id - 4);
-		}
-		mask = LM3533_LED_ID_MASK << shift;
-	}
-
-	ret = lm3533_read(lm3533, reg, &val);
-	if (ret)
-		return ret;
-
-	val = (val & mask) >> shift;
-
-	return sysfs_emit(buf, "%u\n", val);
-}
-
-static ssize_t store_output(struct device *dev,
-					struct device_attribute *attr,
-					const char *buf, size_t len)
-{
-	struct lm3533 *lm3533 = dev_get_drvdata(dev);
-	struct lm3533_device_attribute *lattr = to_lm3533_dev_attr(attr);
-	int id = lattr->u.output.id;
-	u8 val;
-	int ret;
-
-	if (kstrtou8(buf, 0, &val))
-		return -EINVAL;
-
-	if (lattr->type == LM3533_ATTR_TYPE_BACKLIGHT)
-		ret = lm3533_set_hvled_config(lm3533, id, val);
-	else
-		ret = lm3533_set_lvled_config(lm3533, id, val);
-
-	if (ret)
-		return ret;
-
-	return len;
-}
-
-#define LM3533_OUTPUT_ATTR(_name, _mode, _show, _store, _type, _id) \
-	struct lm3533_device_attribute lm3533_dev_attr_##_name = \
-		{ .dev_attr	= __ATTR(_name, _mode, _show, _store), \
-		  .type		= _type, \
-		  .u.output	= { .id = _id }, }
-
-#define LM3533_OUTPUT_ATTR_RW(_name, _type, _id) \
-	LM3533_OUTPUT_ATTR(output_##_name, S_IRUGO | S_IWUSR, \
-					show_output, store_output, _type, _id)
-
-#define LM3533_OUTPUT_HVLED_ATTR_RW(_nr) \
-	LM3533_OUTPUT_ATTR_RW(hvled##_nr, LM3533_ATTR_TYPE_BACKLIGHT, _nr)
-#define LM3533_OUTPUT_LVLED_ATTR_RW(_nr) \
-	LM3533_OUTPUT_ATTR_RW(lvled##_nr, LM3533_ATTR_TYPE_LED, _nr)
-/*
- * Output config:
- *
- * output_hvled<nr>	0-1
- * output_lvled<nr>	0-3
- */
-static LM3533_OUTPUT_HVLED_ATTR_RW(1);
-static LM3533_OUTPUT_HVLED_ATTR_RW(2);
-static LM3533_OUTPUT_LVLED_ATTR_RW(1);
-static LM3533_OUTPUT_LVLED_ATTR_RW(2);
-static LM3533_OUTPUT_LVLED_ATTR_RW(3);
-static LM3533_OUTPUT_LVLED_ATTR_RW(4);
-static LM3533_OUTPUT_LVLED_ATTR_RW(5);
-
-static struct attribute *lm3533_attributes[] = {
-	&lm3533_dev_attr_output_hvled1.dev_attr.attr,
-	&lm3533_dev_attr_output_hvled2.dev_attr.attr,
-	&lm3533_dev_attr_output_lvled1.dev_attr.attr,
-	&lm3533_dev_attr_output_lvled2.dev_attr.attr,
-	&lm3533_dev_attr_output_lvled3.dev_attr.attr,
-	&lm3533_dev_attr_output_lvled4.dev_attr.attr,
-	&lm3533_dev_attr_output_lvled5.dev_attr.attr,
-	NULL,
-};
-
-#define to_dev_attr(_attr) \
-	container_of(_attr, struct device_attribute, attr)
-
-static umode_t lm3533_attr_is_visible(struct kobject *kobj,
-					     struct attribute *attr, int n)
-{
-	struct device *dev = kobj_to_dev(kobj);
-	struct lm3533 *lm3533 = dev_get_drvdata(dev);
-	struct device_attribute *dattr = to_dev_attr(attr);
-	struct lm3533_device_attribute *lattr = to_lm3533_dev_attr(dattr);
-	enum lm3533_attribute_type type = lattr->type;
-	umode_t mode = attr->mode;
-
-	if (!lm3533->have_backlights && type == LM3533_ATTR_TYPE_BACKLIGHT)
-		mode = 0;
-	else if (!lm3533->have_leds && type == LM3533_ATTR_TYPE_LED)
-		mode = 0;
-
-	return mode;
-};
-
-static struct attribute_group lm3533_attribute_group = {
-	.is_visible	= lm3533_attr_is_visible,
-	.attrs		= lm3533_attributes
-};
-
-static int lm3533_device_als_init(struct lm3533 *lm3533)
-{
-	struct lm3533_platform_data *pdata = dev_get_platdata(lm3533->dev);
-	int ret;
-
-	if (!pdata->als)
-		return 0;
-
-	lm3533_als_devs[0].platform_data = pdata->als;
-	lm3533_als_devs[0].pdata_size = sizeof(*pdata->als);
-
-	ret = mfd_add_devices(lm3533->dev, 0, lm3533_als_devs, 1, NULL,
-			      0, NULL);
-	if (ret) {
-		dev_err(lm3533->dev, "failed to add ALS device\n");
-		return ret;
-	}
-
-	lm3533->have_als = 1;
-
-	return 0;
-}
-
-static int lm3533_device_bl_init(struct lm3533 *lm3533)
-{
-	struct lm3533_platform_data *pdata = dev_get_platdata(lm3533->dev);
-	int i;
-	int ret;
-
-	if (!pdata->backlights || pdata->num_backlights == 0)
-		return 0;
-
-	if (pdata->num_backlights > ARRAY_SIZE(lm3533_bl_devs))
-		pdata->num_backlights = ARRAY_SIZE(lm3533_bl_devs);
-
-	for (i = 0; i < pdata->num_backlights; ++i) {
-		lm3533_bl_devs[i].platform_data = &pdata->backlights[i];
-		lm3533_bl_devs[i].pdata_size = sizeof(pdata->backlights[i]);
-	}
-
-	ret = mfd_add_devices(lm3533->dev, 0, lm3533_bl_devs,
-			      pdata->num_backlights, NULL, 0, NULL);
-	if (ret) {
-		dev_err(lm3533->dev, "failed to add backlight devices\n");
-		return ret;
-	}
-
-	lm3533->have_backlights = 1;
-
-	return 0;
-}
-
-static int lm3533_device_led_init(struct lm3533 *lm3533)
-{
-	struct lm3533_platform_data *pdata = dev_get_platdata(lm3533->dev);
-	int i;
-	int ret;
-
-	if (!pdata->leds || pdata->num_leds == 0)
-		return 0;
-
-	if (pdata->num_leds > ARRAY_SIZE(lm3533_led_devs))
-		pdata->num_leds = ARRAY_SIZE(lm3533_led_devs);
-
-	for (i = 0; i < pdata->num_leds; ++i) {
-		lm3533_led_devs[i].platform_data = &pdata->leds[i];
-		lm3533_led_devs[i].pdata_size = sizeof(pdata->leds[i]);
-	}
-
-	ret = mfd_add_devices(lm3533->dev, 0, lm3533_led_devs,
-			      pdata->num_leds, NULL, 0, NULL);
-	if (ret) {
-		dev_err(lm3533->dev, "failed to add LED devices\n");
-		return ret;
-	}
-
-	lm3533->have_leds = 1;
-
-	return 0;
-}
-
-static int lm3533_device_setup(struct lm3533 *lm3533,
-					struct lm3533_platform_data *pdata)
-{
-	int ret;
-
-	ret = lm3533_set_boost_freq(lm3533, pdata->boost_freq);
-	if (ret)
-		return ret;
-
-	return lm3533_set_boost_ovp(lm3533, pdata->boost_ovp);
-}
-
-static int lm3533_device_init(struct lm3533 *lm3533)
-{
-	struct lm3533_platform_data *pdata = dev_get_platdata(lm3533->dev);
-	int ret;
-
-	dev_dbg(lm3533->dev, "%s\n", __func__);
-
-	if (!pdata) {
-		dev_err(lm3533->dev, "no platform data\n");
-		return -EINVAL;
-	}
-
-	lm3533->gpio_hwen = pdata->gpio_hwen;
-
-	if (gpio_is_valid(lm3533->gpio_hwen)) {
-		ret = devm_gpio_request_one(lm3533->dev, lm3533->gpio_hwen,
-					GPIOF_OUT_INIT_LOW, "lm3533-hwen");
-		if (ret < 0) {
-			dev_err(lm3533->dev,
-				"failed to request HWEN GPIO %d\n",
-				lm3533->gpio_hwen);
-			return ret;
-		}
-	}
-
-	lm3533_enable(lm3533);
-
-	ret = lm3533_device_setup(lm3533, pdata);
-	if (ret)
-		goto err_disable;
-
-	lm3533_device_als_init(lm3533);
-	lm3533_device_bl_init(lm3533);
-	lm3533_device_led_init(lm3533);
-
-	ret = sysfs_create_group(&lm3533->dev->kobj, &lm3533_attribute_group);
-	if (ret < 0) {
-		dev_err(lm3533->dev, "failed to create sysfs attributes\n");
-		goto err_unregister;
-	}
-
-	return 0;
-
-err_unregister:
-	mfd_remove_devices(lm3533->dev);
-err_disable:
-	lm3533_disable(lm3533);
-
-	return ret;
-}
-
-static void lm3533_device_exit(struct lm3533 *lm3533)
-{
-	dev_dbg(lm3533->dev, "%s\n", __func__);
-
-	sysfs_remove_group(&lm3533->dev->kobj, &lm3533_attribute_group);
-
-	mfd_remove_devices(lm3533->dev);
-	lm3533_disable(lm3533);
-}
-
-static bool lm3533_readable_register(struct device *dev, unsigned int reg)
-{
-	switch (reg) {
-	case 0x10 ... 0x2c:
-	case 0x30 ... 0x38:
-	case 0x40 ... 0x45:
-	case 0x50 ... 0x57:
-	case 0x60 ... 0x6e:
-	case 0x70 ... 0x75:
-	case 0x80 ... 0x85:
-	case 0x90 ... 0x95:
-	case 0xa0 ... 0xa5:
-	case 0xb0 ... 0xb2:
-		return true;
-	default:
-		return false;
-	}
-}
-
-static bool lm3533_volatile_register(struct device *dev, unsigned int reg)
-{
-	switch (reg) {
-	case 0x34 ... 0x36:	/* zone */
-	case 0x37 ... 0x38:	/* adc */
-	case 0xb0 ... 0xb1:	/* fault */
-		return true;
-	default:
-		return false;
-	}
-}
-
-static bool lm3533_precious_register(struct device *dev, unsigned int reg)
-{
-	switch (reg) {
-	case 0x34:		/* zone */
-		return true;
-	default:
-		return false;
-	}
-}
-
-static const struct regmap_config regmap_config = {
-	.reg_bits	= 8,
-	.val_bits	= 8,
-	.max_register	= LM3533_REG_MAX,
-	.readable_reg	= lm3533_readable_register,
-	.volatile_reg	= lm3533_volatile_register,
-	.precious_reg	= lm3533_precious_register,
-};
-
-static int lm3533_i2c_probe(struct i2c_client *i2c)
-{
-	struct lm3533 *lm3533;
-
-	dev_dbg(&i2c->dev, "%s\n", __func__);
-
-	lm3533 = devm_kzalloc(&i2c->dev, sizeof(*lm3533), GFP_KERNEL);
-	if (!lm3533)
-		return -ENOMEM;
-
-	i2c_set_clientdata(i2c, lm3533);
-
-	lm3533->regmap = devm_regmap_init_i2c(i2c, &regmap_config);
-	if (IS_ERR(lm3533->regmap))
-		return PTR_ERR(lm3533->regmap);
-
-	lm3533->dev = &i2c->dev;
-	lm3533->irq = i2c->irq;
-
-	return lm3533_device_init(lm3533);
-}
-
-static void lm3533_i2c_remove(struct i2c_client *i2c)
-{
-	struct lm3533 *lm3533 = i2c_get_clientdata(i2c);
-
-	dev_dbg(&i2c->dev, "%s\n", __func__);
-
-	lm3533_device_exit(lm3533);
-}
-
-static const struct i2c_device_id lm3533_i2c_ids[] = {
-	{ "lm3533", 0 },
-	{ },
-};
-MODULE_DEVICE_TABLE(i2c, lm3533_i2c_ids);
-
-static struct i2c_driver lm3533_i2c_driver = {
-	.driver = {
-		   .name = "lm3533",
-	},
-	.id_table	= lm3533_i2c_ids,
-	.probe		= lm3533_i2c_probe,
-	.remove		= lm3533_i2c_remove,
-};
-
-static int __init lm3533_i2c_init(void)
-{
-	return i2c_add_driver(&lm3533_i2c_driver);
-}
-subsys_initcall(lm3533_i2c_init);
-
-static void __exit lm3533_i2c_exit(void)
-{
-	i2c_del_driver(&lm3533_i2c_driver);
-}
-module_exit(lm3533_i2c_exit);
-
-MODULE_AUTHOR("Johan Hovold <jhovold@gmail.com>");
-MODULE_DESCRIPTION("LM3533 Core");
-MODULE_LICENSE("GPL");
diff --git a/include/linux/mfd/lm3533.h b/include/linux/mfd/lm3533.h
deleted file mode 100644
index 77092f6363ad..000000000000
--- a/include/linux/mfd/lm3533.h
+++ /dev/null
@@ -1,100 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * lm3533.h -- LM3533 interface
- *
- * Copyright (C) 2011-2012 Texas Instruments
- *
- * Author: Johan Hovold <jhovold@gmail.com>
- */
-
-#ifndef __LINUX_MFD_LM3533_H
-#define __LINUX_MFD_LM3533_H
-
-#define LM3533_ATTR_RO(_name) \
-	DEVICE_ATTR(_name, S_IRUGO, show_##_name, NULL)
-#define LM3533_ATTR_RW(_name) \
-	DEVICE_ATTR(_name, S_IRUGO | S_IWUSR , show_##_name, store_##_name)
-
-struct device;
-struct regmap;
-
-struct lm3533 {
-	struct device *dev;
-
-	struct regmap *regmap;
-
-	int gpio_hwen;
-	int irq;
-
-	unsigned have_als:1;
-	unsigned have_backlights:1;
-	unsigned have_leds:1;
-};
-
-struct lm3533_ctrlbank {
-	struct lm3533 *lm3533;
-	struct device *dev;
-	int id;
-};
-
-struct lm3533_als_platform_data {
-	unsigned pwm_mode:1;		/* PWM input mode (default analog) */
-	u8 r_select;			/* 1 - 127 (ignored in PWM-mode) */
-};
-
-struct lm3533_bl_platform_data {
-	char *name;
-	u16 max_current;		/* 5000 - 29800 uA (800 uA step) */
-	u8 default_brightness;		/* 0 - 255 */
-	u8 pwm;				/* 0 - 0x3f */
-};
-
-struct lm3533_led_platform_data {
-	char *name;
-	const char *default_trigger;
-	u16 max_current;		/* 5000 - 29800 uA (800 uA step) */
-	u8 pwm;				/* 0 - 0x3f */
-};
-
-enum lm3533_boost_freq {
-	LM3533_BOOST_FREQ_500KHZ,
-	LM3533_BOOST_FREQ_1000KHZ,
-};
-
-enum lm3533_boost_ovp {
-	LM3533_BOOST_OVP_16V,
-	LM3533_BOOST_OVP_24V,
-	LM3533_BOOST_OVP_32V,
-	LM3533_BOOST_OVP_40V,
-};
-
-struct lm3533_platform_data {
-	int gpio_hwen;
-
-	enum lm3533_boost_ovp boost_ovp;
-	enum lm3533_boost_freq boost_freq;
-
-	struct lm3533_als_platform_data *als;
-
-	struct lm3533_bl_platform_data *backlights;
-	int num_backlights;
-
-	struct lm3533_led_platform_data *leds;
-	int num_leds;
-};
-
-extern int lm3533_ctrlbank_enable(struct lm3533_ctrlbank *cb);
-extern int lm3533_ctrlbank_disable(struct lm3533_ctrlbank *cb);
-
-extern int lm3533_ctrlbank_set_brightness(struct lm3533_ctrlbank *cb, u8 val);
-extern int lm3533_ctrlbank_get_brightness(struct lm3533_ctrlbank *cb, u8 *val);
-extern int lm3533_ctrlbank_set_max_current(struct lm3533_ctrlbank *cb,
-								u16 imax);
-extern int lm3533_ctrlbank_set_pwm(struct lm3533_ctrlbank *cb, u8 val);
-extern int lm3533_ctrlbank_get_pwm(struct lm3533_ctrlbank *cb, u8 *val);
-
-extern int lm3533_read(struct lm3533 *lm3533, u8 reg, u8 *val);
-extern int lm3533_write(struct lm3533 *lm3533, u8 reg, u8 val);
-extern int lm3533_update(struct lm3533 *lm3533, u8 reg, u8 val, u8 mask);
-
-#endif	/* __LINUX_MFD_LM3533_H */
-- 
2.43.0.rc1.1336.g36b5255a03ac

