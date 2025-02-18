Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B341A39D5E
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 14:27:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84FE310E027;
	Tue, 18 Feb 2025 13:27:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="T+whRsBz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8924F10E008
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 13:27:26 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-30613802a6bso56653471fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 05:27:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739885245; x=1740490045; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gkCRpK0BeCmhRhskxdzfGD2z6y1YGj4I4ZlWlgRRb38=;
 b=T+whRsBzSmFZ6uQJsoqHFCWU5i3NjAgNYg2CwbXPEw6mZI+/gXPZv7xvRqLlwzF7RN
 Qe43KuaKgKOjSrLbFxUePrMk8xt/F0WQC3rE5tiax0DKmNG7iyWDv01fCGlQZpsZe1cw
 6ho1qMFkZ8CfRuMlQ6pm1/ow3/zkYGYPfakBwHk3jdcNwFpx0L24+1nFnusPt/5SYkYf
 dkRGg95aUcOp3+ulQqP+2PLoWgtoRFPMjg6J7VKT/QZOi5wgpzNISOP7AOKTk66nCXWi
 htxgIjgP6C6QK6wf54yX4kwDPzP6J+YHgoG0DM2bpbvCrEqspjfBIHpfSHqBUQkg8m7N
 sntg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739885245; x=1740490045;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gkCRpK0BeCmhRhskxdzfGD2z6y1YGj4I4ZlWlgRRb38=;
 b=eFt0f5k63fQaDBoAMQYHo0qHyXx3BdQbvN/uDoIM5zQcghqUnVpS5hxj6NUktdyeuE
 auyMt9YHLJI7S8ZTDAiklZ0jLNYOM3wOeK8h3qmnA0XIcrHGnmSfGZDBC3DRIx65+9pq
 hauwimFD3ydJqo/75QhmXAjnJiEvicOYKHJJMCzURmRkXuYAg1WMcqXiGcdWBWzFlq6P
 86Nd1pIHUxkNPj0s3VOUN9EYemCjL4HAJfE50H/dJRhEw33w1Wm32Y9JkyyZyyNak1pN
 oAra6rAu8TMYVJ3YBPNgmI1Gu5d+ieazTXiS//Mmohsx3IGqS6jCb3R3AMUUSM5G8DQc
 xoGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNX8eLv/8pPCJtt74eouV4xm2dJT/uYEKNQMPQe8mKoIejPBOFjp++bzJk2Q2w2YkKLVZEfzRnSwg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyKGxFVOkHIBTEloydbBEJpcKLq9ZTap+VOfEDPy2SjvFeNLqVO
 gIUQYj9NajKayXeCJG9/GciHPtY94v0MR3/gUUYxrEbueYK8HBBd
X-Gm-Gg: ASbGnctPU5tvyM3GxoJGAlPS446jg/vP9/tu53WT9tpvJ5KUbvxAjZHWn7ApzEryw7N
 yWMhv1ykDNpFY3vrXnrr2JYX/sU4okI7Cl3kXgVfTZpDIT/ki/1G29UV+2ZjiB8lVspwQSMrgmH
 +h0WtSuZq7o3/w6vPifuOghY3pN2bE8YqcF2Yg1NMyqNaQ9pw6mfUE6Eo+EiNsp0octCCUnvmlM
 XUOQwwgXsJbeHa7fh6j2R5r7J3XwyGj4XW39kOxNdthKO5dNyWDV9e16aRCAGIs9p0lYlfFeSSd
 1/elbJI=
X-Google-Smtp-Source: AGHT+IFA9BdqfuTLbjjIH42folpuIWmd1HmnUBU4t6FtmQ+CIAkHMeMP5MlXyo9VpnH+IVm+HjVdxg==
X-Received: by 2002:a2e:bc0e:0:b0:308:e8d3:7571 with SMTP id
 38308e7fff4ca-30927afdfbcmr44730281fa.31.1739885244537; 
 Tue, 18 Feb 2025 05:27:24 -0800 (PST)
Received: from xeon.. ([188.163.112.51]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30917da0e64sm18300851fa.88.2025.02.18.05.27.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 05:27:23 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Pavel Machek <pavel@ucw.cz>,
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Svyatoslav Ryhel <clamor95@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-leds@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: [PATCH v2 2/2] mfd: lm3533: convert to use OF
Date: Tue, 18 Feb 2025 15:27:00 +0200
Message-ID: <20250218132702.114669-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250218132702.114669-1-clamor95@gmail.com>
References: <20250218132702.114669-1-clamor95@gmail.com>
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

Remove platform data and fully relay on OF and device tree
parsing and binding devices.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/iio/light/lm3533-als.c      |  40 ++++--
 drivers/leds/leds-lm3533.c          |  45 +++++--
 drivers/mfd/lm3533-core.c           | 199 ++++++++++------------------
 drivers/video/backlight/lm3533_bl.c |  68 +++++++---
 include/linux/mfd/lm3533.h          |  35 +----
 5 files changed, 186 insertions(+), 201 deletions(-)

diff --git a/drivers/iio/light/lm3533-als.c b/drivers/iio/light/lm3533-als.c
index 99f0b903018c..931ea66cad1a 100644
--- a/drivers/iio/light/lm3533-als.c
+++ b/drivers/iio/light/lm3533-als.c
@@ -16,9 +16,12 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/mfd/core.h>
+#include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/slab.h>
 #include <linux/uaccess.h>
+#include <linux/units.h>
 
 #include <linux/mfd/lm3533.h>
 
@@ -56,6 +59,9 @@ struct lm3533_als {
 
 	atomic_t zone;
 	struct mutex thresh_mutex;
+
+	unsigned pwm_mode:1;		/* PWM input mode (default analog) */
+	u8 r_select;			/* 1 - 127 (ignored in PWM-mode) */
 };
 
 
@@ -753,18 +759,17 @@ static int lm3533_als_set_resistor(struct lm3533_als *als, u8 val)
 	return 0;
 }
 
-static int lm3533_als_setup(struct lm3533_als *als,
-			    const struct lm3533_als_platform_data *pdata)
+static int lm3533_als_setup(struct lm3533_als *als)
 {
 	int ret;
 
-	ret = lm3533_als_set_input_mode(als, pdata->pwm_mode);
+	ret = lm3533_als_set_input_mode(als, als->pwm_mode);
 	if (ret)
 		return ret;
 
 	/* ALS input is always high impedance in PWM-mode. */
-	if (!pdata->pwm_mode) {
-		ret = lm3533_als_set_resistor(als, pdata->r_select);
+	if (!als->pwm_mode) {
+		ret = lm3533_als_set_resistor(als, als->r_select);
 		if (ret)
 			return ret;
 	}
@@ -828,22 +833,16 @@ static const struct iio_info lm3533_als_info = {
 
 static int lm3533_als_probe(struct platform_device *pdev)
 {
-	const struct lm3533_als_platform_data *pdata;
 	struct lm3533 *lm3533;
 	struct lm3533_als *als;
 	struct iio_dev *indio_dev;
+	u32 val;
 	int ret;
 
 	lm3533 = dev_get_drvdata(pdev->dev.parent);
 	if (!lm3533)
 		return -EINVAL;
 
-	pdata = dev_get_platdata(&pdev->dev);
-	if (!pdata) {
-		dev_err(&pdev->dev, "no platform data\n");
-		return -EINVAL;
-	}
-
 	indio_dev = devm_iio_device_alloc(&pdev->dev, sizeof(*als));
 	if (!indio_dev)
 		return -ENOMEM;
@@ -864,13 +863,21 @@ static int lm3533_als_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, indio_dev);
 
+	val = 200 * KILO; /* 200kOhm */
+	device_property_read_u32(&pdev->dev, "ti,resistor-value-ohm", &val);
+
+	/* Convert resitance into R_ALS value with 2v / 10uA * R */
+	als->r_select = DIV_ROUND_UP(2 * MICRO, 10 * val);
+
+	als->pwm_mode = device_property_read_bool(&pdev->dev, "ti,pwm-mode");
+
 	if (als->irq) {
 		ret = lm3533_als_setup_irq(als, indio_dev);
 		if (ret)
 			return ret;
 	}
 
-	ret = lm3533_als_setup(als, pdata);
+	ret = lm3533_als_setup(als);
 	if (ret)
 		goto err_free_irq;
 
@@ -907,9 +914,16 @@ static void lm3533_als_remove(struct platform_device *pdev)
 		free_irq(als->irq, indio_dev);
 }
 
+static const struct of_device_id lm3533_als_match_table[] = {
+	{ .compatible = "ti,lm3533-als" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, lm3533_match_table);
+
 static struct platform_driver lm3533_als_driver = {
 	.driver	= {
 		.name	= "lm3533-als",
+		.of_match_table = lm3533_als_match_table,
 	},
 	.probe		= lm3533_als_probe,
 	.remove		= lm3533_als_remove,
diff --git a/drivers/leds/leds-lm3533.c b/drivers/leds/leds-lm3533.c
index 45795f2a1042..e955c4ef0af5 100644
--- a/drivers/leds/leds-lm3533.c
+++ b/drivers/leds/leds-lm3533.c
@@ -10,8 +10,10 @@
 #include <linux/module.h>
 #include <linux/leds.h>
 #include <linux/mfd/core.h>
+#include <linux/mod_devicetable.h>
 #include <linux/mutex.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/slab.h>
 
 #include <linux/mfd/lm3533.h>
@@ -48,6 +50,9 @@ struct lm3533_led {
 
 	struct mutex mutex;
 	unsigned long flags;
+
+	u16 max_current;		/* 5000 - 29800 uA (800 uA step) */
+	u8 pwm;				/* 0 - 0x3f */
 };
 
 
@@ -632,23 +637,22 @@ static const struct attribute_group *lm3533_led_attribute_groups[] = {
 	NULL
 };
 
-static int lm3533_led_setup(struct lm3533_led *led,
-					struct lm3533_led_platform_data *pdata)
+static int lm3533_led_setup(struct lm3533_led *led)
 {
 	int ret;
 
-	ret = lm3533_ctrlbank_set_max_current(&led->cb, pdata->max_current);
+	ret = lm3533_ctrlbank_set_max_current(&led->cb, led->max_current);
 	if (ret)
 		return ret;
 
-	return lm3533_ctrlbank_set_pwm(&led->cb, pdata->pwm);
+	return lm3533_ctrlbank_set_pwm(&led->cb, led->pwm);
 }
 
 static int lm3533_led_probe(struct platform_device *pdev)
 {
 	struct lm3533 *lm3533;
-	struct lm3533_led_platform_data *pdata;
 	struct lm3533_led *led;
+	u32 val;
 	int ret;
 
 	dev_dbg(&pdev->dev, "%s\n", __func__);
@@ -657,12 +661,6 @@ static int lm3533_led_probe(struct platform_device *pdev)
 	if (!lm3533)
 		return -EINVAL;
 
-	pdata = dev_get_platdata(&pdev->dev);
-	if (!pdata) {
-		dev_err(&pdev->dev, "no platform data\n");
-		return -EINVAL;
-	}
-
 	if (pdev->id < 0 || pdev->id >= LM3533_LVCTRLBANK_COUNT) {
 		dev_err(&pdev->dev, "illegal LED id %d\n", pdev->id);
 		return -EINVAL;
@@ -673,8 +671,10 @@ static int lm3533_led_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	led->lm3533 = lm3533;
-	led->cdev.name = pdata->name;
-	led->cdev.default_trigger = pdata->default_trigger;
+	led->cdev.name = pdev->name;
+	led->cdev.default_trigger = "none";
+	device_property_read_string(&pdev->dev, "linux,default-trigger",
+				    &led->cdev.default_trigger);
 	led->cdev.brightness_set_blocking = lm3533_led_set;
 	led->cdev.brightness_get = lm3533_led_get;
 	led->cdev.blink_set = lm3533_led_blink_set;
@@ -702,7 +702,17 @@ static int lm3533_led_probe(struct platform_device *pdev)
 
 	led->cb.dev = led->cdev.dev;
 
-	ret = lm3533_led_setup(led, pdata);
+	/* 5000 - 29800 uA (800 uA step) */
+	val = 5000;
+	device_property_read_u32(&pdev->dev, "ti,max-current-microamp", &val);
+	led->max_current = val;
+
+	/* 0 - 0x3f */
+	val = 0;
+	device_property_read_u32(&pdev->dev, "ti,pwm-config-mask", &val);
+	led->pwm = val;
+
+	ret = lm3533_led_setup(led);
 	if (ret)
 		goto err_deregister;
 
@@ -739,9 +749,16 @@ static void lm3533_led_shutdown(struct platform_device *pdev)
 	lm3533_led_set(&led->cdev, LED_OFF);		/* disable blink */
 }
 
+static const struct of_device_id lm3533_led_match_table[] = {
+	{ .compatible = "ti,lm3533-leds" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, lm3533_match_table);
+
 static struct platform_driver lm3533_led_driver = {
 	.driver = {
 		.name = "lm3533-leds",
+		.of_match_table = lm3533_led_match_table,
 	},
 	.probe		= lm3533_led_probe,
 	.remove		= lm3533_led_remove,
diff --git a/drivers/mfd/lm3533-core.c b/drivers/mfd/lm3533-core.c
index 0a2409d00b2e..f535c09add6a 100644
--- a/drivers/mfd/lm3533-core.c
+++ b/drivers/mfd/lm3533-core.c
@@ -14,10 +14,13 @@
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/mfd/core.h>
+#include <linux/mod_devicetable.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/seq_file.h>
 #include <linux/slab.h>
 #include <linux/uaccess.h>
+#include <linux/units.h>
 
 #include <linux/mfd/lm3533.h>
 
@@ -42,44 +45,6 @@
 
 #define LM3533_REG_MAX			0xb2
 
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
 int lm3533_read(struct lm3533 *lm3533, u8 reg, u8 *val)
 {
 	int tmp;
@@ -376,136 +341,113 @@ static struct attribute_group lm3533_attribute_group = {
 	.attrs		= lm3533_attributes
 };
 
-static int lm3533_device_als_init(struct lm3533 *lm3533)
+static int lm3533_device_setup(struct lm3533 *lm3533)
 {
-	struct lm3533_platform_data *pdata = dev_get_platdata(lm3533->dev);
 	int ret;
 
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
+	ret = lm3533_set_boost_freq(lm3533, lm3533->boost_freq);
+	if (ret)
 		return ret;
-	}
 
-	lm3533->have_als = 1;
+	return lm3533_set_boost_ovp(lm3533, lm3533->boost_ovp);
+}
 
-	return 0;
+static void lm3533_remove_subdev(void *subdev)
+{
+	platform_device_unregister(subdev);
 }
 
-static int lm3533_device_bl_init(struct lm3533 *lm3533)
+static int lm3533_init_components(struct lm3533 *lm3533)
 {
-	struct lm3533_platform_data *pdata = dev_get_platdata(lm3533->dev);
-	int i;
+	struct device *dev = lm3533->dev;
+	struct platform_device_info subdev_info;
+	struct platform_device *subdev;
+	struct fwnode_handle *child;
+	const char *comatible;
+	u32 id = PLATFORM_DEVID_AUTO;
 	int ret;
 
-	if (!pdata->backlights || pdata->num_backlights == 0)
-		return 0;
+	memset(&subdev_info, 0, sizeof(subdev_info));
+	subdev_info.parent = dev;
 
-	if (pdata->num_backlights > ARRAY_SIZE(lm3533_bl_devs))
-		pdata->num_backlights = ARRAY_SIZE(lm3533_bl_devs);
+	device_for_each_child_node(dev, child) {
+		if (!fwnode_device_is_available(child))
+			continue;
 
-	for (i = 0; i < pdata->num_backlights; ++i) {
-		lm3533_bl_devs[i].platform_data = &pdata->backlights[i];
-		lm3533_bl_devs[i].pdata_size = sizeof(pdata->backlights[i]);
-	}
+		/* Fill up children flags used for attributes */
+		fwnode_property_read_string(child, "compatible", &comatible);
+		fwnode_property_read_u32(child, "reg", &id);
 
-	ret = mfd_add_devices(lm3533->dev, 0, lm3533_bl_devs,
-			      pdata->num_backlights, NULL, 0, NULL);
-	if (ret) {
-		dev_err(lm3533->dev, "failed to add backlight devices\n");
-		return ret;
-	}
+		if (!strcmp(comatible, "ti,lm3533-als"))
+			lm3533->have_als = 1;
 
-	lm3533->have_backlights = 1;
+		if (!strcmp(comatible, "ti,lm3533-backlight"))
+			lm3533->have_backlights = 1;
 
-	return 0;
-}
+		if (!strcmp(comatible, "ti,lm3533-leds"))
+			lm3533->have_leds = 1;
 
-static int lm3533_device_led_init(struct lm3533 *lm3533)
-{
-	struct lm3533_platform_data *pdata = dev_get_platdata(lm3533->dev);
-	int i;
-	int ret;
-
-	if (!pdata->leds || pdata->num_leds == 0)
-		return 0;
+		subdev_info.id = id;
+		subdev_info.fwnode = child;
+		subdev_info.name = fwnode_get_name(child);
+		subdev = platform_device_register_full(&subdev_info);
+		if (IS_ERR(subdev))
+			return dev_err_probe(dev, PTR_ERR(subdev),
+					     "register subdev for %s",
+					     subdev_info.name);
 
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
+		ret = devm_add_action_or_reset(dev, lm3533_remove_subdev, subdev);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "register subdev cleanup action for %s",
+					     subdev_info.name);
 	}
 
-	lm3533->have_leds = 1;
-
 	return 0;
 }
 
-static int lm3533_device_setup(struct lm3533 *lm3533,
-					struct lm3533_platform_data *pdata)
+static int lm3533_device_init(struct lm3533 *lm3533)
 {
+	u32 val;
 	int ret;
 
-	ret = lm3533_set_boost_freq(lm3533, pdata->boost_freq);
-	if (ret)
-		return ret;
-
-	return lm3533_set_boost_ovp(lm3533, pdata->boost_ovp);
-}
+	lm3533->hwen = devm_gpiod_get(lm3533->dev, "enable", GPIOD_OUT_LOW);
+	if (IS_ERR(lm3533->hwen))
+		return dev_err_probe(lm3533->dev, PTR_ERR(lm3533->hwen),
+				     "failed to request HWEN GPIO\n");
 
-static int lm3533_device_init(struct lm3533 *lm3533)
-{
-	struct lm3533_platform_data *pdata = dev_get_platdata(lm3533->dev);
-	int ret;
+	val = 16 * MICRO; /* 16V */
+	device_property_read_u32(lm3533->dev, "ti,boost-ovp-microvolt", &val);
 
-	dev_dbg(lm3533->dev, "%s\n", __func__);
+	/* boost_ovp is defined in microvolts, convert to enum value */
+	lm3533->boost_ovp = val / (8 * MICRO) - 2;
 
-	if (!pdata) {
-		dev_err(lm3533->dev, "no platform data\n");
-		return -EINVAL;
-	}
+	val = 500 * KILO; /* 500kHz */
+	device_property_read_u32(lm3533->dev, "ti,boost-freq-hz", &val);
 
-	lm3533->hwen = devm_gpiod_get(lm3533->dev, NULL, GPIOD_OUT_LOW);
-	if (IS_ERR(lm3533->hwen))
-		return dev_err_probe(lm3533->dev, PTR_ERR(lm3533->hwen), "failed to request HWEN GPIO\n");
-	gpiod_set_consumer_name(lm3533->hwen, "lm3533-hwen");
+	/* boost_freq is defined in Hz, convert to enum value */
+	lm3533->boost_freq = val / (500 * KILO) - 1;
 
 	lm3533_enable(lm3533);
 
-	ret = lm3533_device_setup(lm3533, pdata);
+	ret = lm3533_device_setup(lm3533);
 	if (ret)
 		goto err_disable;
 
-	lm3533_device_als_init(lm3533);
-	lm3533_device_bl_init(lm3533);
-	lm3533_device_led_init(lm3533);
+	ret = lm3533_init_components(lm3533);
+	if (ret) {
+		dev_err(lm3533->dev, "failed to init components\n");
+		goto err_disable;
+	}
 
 	ret = sysfs_create_group(&lm3533->dev->kobj, &lm3533_attribute_group);
 	if (ret < 0) {
 		dev_err(lm3533->dev, "failed to create sysfs attributes\n");
-		goto err_unregister;
+		goto err_disable;
 	}
 
 	return 0;
 
-err_unregister:
-	mfd_remove_devices(lm3533->dev);
 err_disable:
 	lm3533_disable(lm3533);
 
@@ -517,8 +459,6 @@ static void lm3533_device_exit(struct lm3533 *lm3533)
 	dev_dbg(lm3533->dev, "%s\n", __func__);
 
 	sysfs_remove_group(&lm3533->dev->kobj, &lm3533_attribute_group);
-
-	mfd_remove_devices(lm3533->dev);
 	lm3533_disable(lm3533);
 }
 
@@ -603,6 +543,12 @@ static void lm3533_i2c_remove(struct i2c_client *i2c)
 	lm3533_device_exit(lm3533);
 }
 
+static const struct of_device_id lm3533_match_table[] = {
+	{ .compatible = "ti,lm3533" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, lm3533_match_table);
+
 static const struct i2c_device_id lm3533_i2c_ids[] = {
 	{ "lm3533" },
 	{ }
@@ -612,6 +558,7 @@ MODULE_DEVICE_TABLE(i2c, lm3533_i2c_ids);
 static struct i2c_driver lm3533_i2c_driver = {
 	.driver = {
 		   .name = "lm3533",
+		   .of_match_table = lm3533_match_table,
 	},
 	.id_table	= lm3533_i2c_ids,
 	.probe		= lm3533_i2c_probe,
diff --git a/drivers/video/backlight/lm3533_bl.c b/drivers/video/backlight/lm3533_bl.c
index babfd3ceec86..38278bfa228b 100644
--- a/drivers/video/backlight/lm3533_bl.c
+++ b/drivers/video/backlight/lm3533_bl.c
@@ -9,7 +9,9 @@
 
 #include <linux/module.h>
 #include <linux/init.h>
+#include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/backlight.h>
 #include <linux/slab.h>
 
@@ -19,6 +21,7 @@
 #define LM3533_HVCTRLBANK_COUNT		2
 #define LM3533_BL_MAX_BRIGHTNESS	255
 
+#define LM3533_REG_OUTPUT_CONF1		0x10
 #define LM3533_REG_CTRLBANK_AB_BCONF	0x1a
 
 
@@ -27,6 +30,11 @@ struct lm3533_bl {
 	struct lm3533_ctrlbank cb;
 	struct backlight_device *bd;
 	int id;
+
+	u16 max_current;		/* 5000 - 29800 uA (800 uA step) */
+	u8 pwm;				/* 0 - 0x3f */
+	bool linear;
+	bool hvled;
 };
 
 
@@ -246,25 +254,39 @@ static struct attribute_group lm3533_bl_attribute_group = {
 	.attrs		= lm3533_bl_attributes
 };
 
-static int lm3533_bl_setup(struct lm3533_bl *bl,
-					struct lm3533_bl_platform_data *pdata)
+static int lm3533_bl_setup(struct lm3533_bl *bl)
 {
+	int id = lm3533_bl_get_ctrlbank_id(bl);
 	int ret;
 
-	ret = lm3533_ctrlbank_set_max_current(&bl->cb, pdata->max_current);
+	if (bl->linear) {
+		ret = lm3533_update(bl->lm3533, LM3533_REG_CTRLBANK_AB_BCONF,
+				    1 << (2 * id + 1), 1 << (2 * id + 1));
+		if (ret)
+			return ret;
+	}
+
+	if (bl->hvled) {
+		ret = lm3533_update(bl->lm3533, LM3533_REG_OUTPUT_CONF1,
+				    id | id << 1, BIT(0) | BIT(1));
+		if (ret)
+			return ret;
+	}
+
+	ret = lm3533_ctrlbank_set_max_current(&bl->cb, bl->max_current);
 	if (ret)
 		return ret;
 
-	return lm3533_ctrlbank_set_pwm(&bl->cb, pdata->pwm);
+	return lm3533_ctrlbank_set_pwm(&bl->cb, bl->pwm);
 }
 
 static int lm3533_bl_probe(struct platform_device *pdev)
 {
 	struct lm3533 *lm3533;
-	struct lm3533_bl_platform_data *pdata;
 	struct lm3533_bl *bl;
 	struct backlight_device *bd;
 	struct backlight_properties props;
+	u32 val;
 	int ret;
 
 	dev_dbg(&pdev->dev, "%s\n", __func__);
@@ -273,12 +295,6 @@ static int lm3533_bl_probe(struct platform_device *pdev)
 	if (!lm3533)
 		return -EINVAL;
 
-	pdata = dev_get_platdata(&pdev->dev);
-	if (!pdata) {
-		dev_err(&pdev->dev, "no platform data\n");
-		return -EINVAL;
-	}
-
 	if (pdev->id < 0 || pdev->id >= LM3533_HVCTRLBANK_COUNT) {
 		dev_err(&pdev->dev, "illegal backlight id %d\n", pdev->id);
 		return -EINVAL;
@@ -298,10 +314,10 @@ static int lm3533_bl_probe(struct platform_device *pdev)
 	memset(&props, 0, sizeof(props));
 	props.type = BACKLIGHT_RAW;
 	props.max_brightness = LM3533_BL_MAX_BRIGHTNESS;
-	props.brightness = pdata->default_brightness;
-	bd = devm_backlight_device_register(&pdev->dev, pdata->name,
-					pdev->dev.parent, bl, &lm3533_bl_ops,
-					&props);
+	props.brightness = LM3533_BL_MAX_BRIGHTNESS;
+	device_property_read_u32(&pdev->dev, "default-brightness", &props.brightness);
+	bd = devm_backlight_device_register(&pdev->dev, pdev->name, pdev->dev.parent,
+					    bl, &lm3533_bl_ops, &props);
 	if (IS_ERR(bd)) {
 		dev_err(&pdev->dev, "failed to register backlight device\n");
 		return PTR_ERR(bd);
@@ -320,7 +336,20 @@ static int lm3533_bl_probe(struct platform_device *pdev)
 
 	backlight_update_status(bd);
 
-	ret = lm3533_bl_setup(bl, pdata);
+	/* 5000 - 29800 uA (800 uA step) */
+	val = 5000;
+	device_property_read_u32(&pdev->dev, "ti,max-current-microamp", &val);
+	bl->max_current = val;
+
+	/* 0 - 0x3f */
+	val = 0;
+	device_property_read_u32(&pdev->dev, "ti,pwm-config-mask", &val);
+	bl->pwm = val;
+
+	bl->linear = device_property_read_bool(&pdev->dev, "ti,linear-mapping-mode");
+	bl->hvled = device_property_read_bool(&pdev->dev, "ti,hardware-controlled");
+
+	ret = lm3533_bl_setup(bl);
 	if (ret)
 		goto err_sysfs_remove;
 
@@ -381,10 +410,17 @@ static void lm3533_bl_shutdown(struct platform_device *pdev)
 	lm3533_ctrlbank_disable(&bl->cb);
 }
 
+static const struct of_device_id lm3533_bl_match_table[] = {
+	{ .compatible = "ti,lm3533-backlight" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, lm3533_match_table);
+
 static struct platform_driver lm3533_bl_driver = {
 	.driver = {
 		.name	= "lm3533-backlight",
 		.pm	= &lm3533_bl_pm_ops,
+		.of_match_table = lm3533_bl_match_table,
 	},
 	.probe		= lm3533_bl_probe,
 	.remove		= lm3533_bl_remove,
diff --git a/include/linux/mfd/lm3533.h b/include/linux/mfd/lm3533.h
index 69059a7a2ce5..3b28fc0970f6 100644
--- a/include/linux/mfd/lm3533.h
+++ b/include/linux/mfd/lm3533.h
@@ -27,6 +27,9 @@ struct lm3533 {
 	struct gpio_desc *hwen;
 	int irq;
 
+	u32 boost_ovp;
+	u32 boost_freq;
+
 	unsigned have_als:1;
 	unsigned have_backlights:1;
 	unsigned have_leds:1;
@@ -38,25 +41,6 @@ struct lm3533_ctrlbank {
 	int id;
 };
 
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
 enum lm3533_boost_freq {
 	LM3533_BOOST_FREQ_500KHZ,
 	LM3533_BOOST_FREQ_1000KHZ,
@@ -69,19 +53,6 @@ enum lm3533_boost_ovp {
 	LM3533_BOOST_OVP_40V,
 };
 
-struct lm3533_platform_data {
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
 extern int lm3533_ctrlbank_enable(struct lm3533_ctrlbank *cb);
 extern int lm3533_ctrlbank_disable(struct lm3533_ctrlbank *cb);
 
-- 
2.43.0

