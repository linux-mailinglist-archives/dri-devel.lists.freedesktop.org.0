Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D16226FC5
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jul 2020 22:35:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0551689E05;
	Mon, 20 Jul 2020 20:35:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19FD489E08
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 20:35:23 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id q7so21730073ljm.1
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 13:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uRo9EdYadeSHfWc3w5HzcQwlKy6cTkikAo9K/0JHwHo=;
 b=xoEgnIu5VO5MY/m5ZXunTu4suP8heSTunV5TLZByQPwx/BhfkTxuaZlLnLeK8PhQ33
 7ff8tXr7qCqRc4Lw1b+Q69MOHATFUtqNmyJDbWuG98r5c7TAAatyibWJqhK6BR6IeMjJ
 chrn73pykCae9chbKs6FJ4frDSY1Y+mQg8P02y+8wQp1X5JRnkdG127wluWOrMwWHF+8
 S8Uvs+pZUAEADFciI1nYDoTzfeLAK4J+MMrxBuMp45V1BIqr28c5HgbEI5ikDKVpdr4F
 nkQTbhigF49LpcvkeO2As/7IEdAh6Zrgr6VgJKM4Hz1lBeop3s3nW81UAGP5GtSZY4o5
 ZVWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uRo9EdYadeSHfWc3w5HzcQwlKy6cTkikAo9K/0JHwHo=;
 b=ms9bBjnB3HMVqqqRzXaZUQIYiAbPxgEoANi4k48uqc1I5v0yDxnXthcKQqZGV7xM8b
 NPI6shs/BcUun+7r29xPL9En+/pqNCL707FJH6J3jSrIdDMAjsPDH59j/bGSoG7FjCOz
 q7//IOaZixm7HtvpotzDm/BLKo6Y/0E/UP3vCZlvJQ4zDEBz44A7pWuFzLF3kYfmZhgB
 oNWgOX+OTbYgvZhfuMqiQpC3Asz1MFGmF/t42NSUzEGyg+In9waIae7uXStff10x49SS
 r9jNs14CjIxfxLU+zQiuMrD2vrp/5v84ntE4cTVo2ZIMXs6hEwHh9ToqMsZe0TMRo50B
 oTgw==
X-Gm-Message-State: AOAM5339bIBI35/M3Lk/n6O/Yw36eTCX2R4R+IToufdsx0jxUSe0huNA
 M8BgP/mm+/rMU1403+mg7qiVyA==
X-Google-Smtp-Source: ABdhPJwezis85ILHHrud26O/M6yjSAlvBotN1CpSZrbeceY8aHaFh0INwK56irstMSkEZOblGC6nDw==
X-Received: by 2002:a2e:981a:: with SMTP id a26mr11433503ljj.337.1595277321404; 
 Mon, 20 Jul 2020 13:35:21 -0700 (PDT)
Received: from localhost.bredbandsbolaget
 (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
 by smtp.gmail.com with ESMTPSA id y24sm3435076ljy.91.2020.07.20.13.35.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 13:35:20 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2 v1] backlight: Add Kinetic KTD253 backlight driver
Date: Mon, 20 Jul 2020 22:35:06 +0200
Message-Id: <20200720203506.3883129-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200720203506.3883129-1-linus.walleij@linaro.org>
References: <20200720203506.3883129-1-linus.walleij@linaro.org>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Kinetic KTD253 backlight driver is controlled with a
single GPIO line, but still supports a range of brightness
settings by sending fast pulses on the line.

This is based off the source code release for the Samsung
GT-S7710 mobile phone.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 MAINTAINERS                                |   6 +
 drivers/video/backlight/Kconfig            |   8 +
 drivers/video/backlight/Makefile           |   1 +
 drivers/video/backlight/ktd253-backlight.c | 254 +++++++++++++++++++++
 4 files changed, 269 insertions(+)
 create mode 100644 drivers/video/backlight/ktd253-backlight.c

diff --git a/MAINTAINERS b/MAINTAINERS
index b4a43a9e7fbc..ea6fcc5bb79e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9610,6 +9610,12 @@ F:	Documentation/admin-guide/auxdisplay/ks0108.rst
 F:	drivers/auxdisplay/ks0108.c
 F:	include/linux/ks0108.h
 
+KTD253 BACKLIGHT DRIVER
+M:	Linus Walleij <linus.walleij@linaro.org>
+S:	Maintained
+F:	Documentation/devicetree/bindings/leds/backlight/kinetic,ktd253.yaml
+F:	drivers/video/backlight/ktd253-backlight.c
+
 L3MDEV
 M:	David Ahern <dsahern@kernel.org>
 L:	netdev@vger.kernel.org
diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
index 7d22d7377606..6a74c60707b4 100644
--- a/drivers/video/backlight/Kconfig
+++ b/drivers/video/backlight/Kconfig
@@ -190,6 +190,14 @@ config BACKLIGHT_IPAQ_MICRO
 	  computers. Say yes if you have one of the h3100/h3600/h3700
 	  machines.
 
+config BACKLIGHT_KTD253
+	tristate "Backlight Driver for Kinetic KTD253"
+	depends on GPIOLIB || COMPILE_TEST
+	help
+	  Say y to enabled the backlight driver for the Kinetic KTD253
+	  which is a 1-wire GPIO-controlled backlight found in some mobile
+	  phones.
+
 config BACKLIGHT_LM3533
 	tristate "Backlight Driver for LM3533"
 	depends on MFD_LM3533
diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlight/Makefile
index 0c1a1524627a..d50cd12574ae 100644
--- a/drivers/video/backlight/Makefile
+++ b/drivers/video/backlight/Makefile
@@ -36,6 +36,7 @@ obj-$(CONFIG_BACKLIGHT_GPIO)		+= gpio_backlight.o
 obj-$(CONFIG_BACKLIGHT_HP680)		+= hp680_bl.o
 obj-$(CONFIG_BACKLIGHT_HP700)		+= jornada720_bl.o
 obj-$(CONFIG_BACKLIGHT_IPAQ_MICRO)	+= ipaq_micro_bl.o
+obj-$(CONFIG_BACKLIGHT_KTD253)		+= ktd253-backlight.o
 obj-$(CONFIG_BACKLIGHT_LM3533)		+= lm3533_bl.o
 obj-$(CONFIG_BACKLIGHT_LM3630A)		+= lm3630a_bl.o
 obj-$(CONFIG_BACKLIGHT_LM3639)		+= lm3639_bl.o
diff --git a/drivers/video/backlight/ktd253-backlight.c b/drivers/video/backlight/ktd253-backlight.c
new file mode 100644
index 000000000000..d460d1fef329
--- /dev/null
+++ b/drivers/video/backlight/ktd253-backlight.c
@@ -0,0 +1,254 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Backlight driver for the Kinetic KTD253
+ * Based on code and know-how from the Samsung GT-S7710
+ * Gareth Phillips <gareth.phillips@samsung.com>
+ */
+#include <linux/backlight.h>
+#include <linux/err.h>
+#include <linux/fb.h>
+#include <linux/gpio/consumer.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/slab.h>
+#include <linux/delay.h>
+#include <linux/limits.h>
+
+/* Current ratio is n/32 from 1/32 to 32/32 */
+#define KTD253_MIN_RATIO 1
+#define KTD253_MAX_RATIO 32
+#define KTD253_DEFAULT_RATIO 13
+
+/* With the table we use this is 24/32 current ratio actually */
+#define KTD253_MAX_BRIGHTNESS 255
+#define KTD253_DEFAULT_BRIGHTNESS 160
+
+#define KTD253_T_LOW_NS (200 + 10) /* Additional 10ns as safety factor */
+#define KTD253_T_HIGH_NS (200 + 10) /* Additional 10ns as safety factor */
+#define KTD253_T_OFF_MS 3
+
+struct ktd253_backlight {
+	struct device *dev;
+	struct gpio_desc *gpiod;
+	u16 ratio;
+	unsigned int brightness;
+};
+
+/*
+ * The following table is used to convert brightness level to the LED
+ * Current Ratio expressed as (full current) /(n * 32).
+ * i.e. 1 = 1/32 full current. Zero indicates LED is powered off.
+ * The table is intended to allow the brightness level to be "tuned"
+ * to compensate for non-linearity of brightness relative to current.
+ */
+static const u16 ktd253_brightness_to_current_ratio[] = {
+	0,      /* (0/32) KTD253_BACKLIGHT_OFF */
+	39,     /* (1/32) KTD253_MIN_RATIO */
+	58,     /* (2/32) */
+	67,     /* (3/32) */
+	76,     /* (4/32) */
+	85,     /* (5/32) */
+	94,     /* (6/32) */
+	104,    /* (7/32) */
+	113,    /* (8/32) */
+	122,    /* (9/32) */
+	131,    /* (10/32) */
+	145,    /* (11/32) */
+	159,    /* (12/32) */
+	169,    /* (13/32) */
+	179,    /* (14/32) */
+	189,    /* (15/32) */
+	196,    /* (16/32) */
+	203,    /* (17/32) */
+	210,    /* (18/32) */
+	217,    /* (19/32) */
+	224,    /* (20/32) */
+	231,    /* (21/32) */
+	238,    /* (22/32) */
+	245,    /* (23/32) */
+	255,    /* (24/32) */
+	300,    /* (25/32) */
+	300,    /* (26/32) */
+	300,    /* (27/32) */
+	300,    /* (28/32) */
+	300,    /* (29/32) */
+	300,    /* (30/32) */
+	300,    /* (31/32) */
+	300     /* (32/32) KTD253_MAX_RATIO */
+
+};
+
+/* Inspired by gpio_bl.c */
+static int ktd253_backlight_get_next_brightness(struct backlight_device *bl)
+{
+	int brightness = bl->props.brightness;
+
+	if (bl->props.power != FB_BLANK_UNBLANK ||
+	    bl->props.fb_blank != FB_BLANK_UNBLANK ||
+	    bl->props.state & (BL_CORE_SUSPENDED | BL_CORE_FBBLANK))
+		brightness = 0;
+
+	return brightness;
+}
+
+static int ktd253_backlight_update_status(struct backlight_device *bl)
+{
+	struct ktd253_backlight *ktd253 = bl_get_data(bl);
+	int brightness = ktd253_backlight_get_next_brightness(bl);
+	u16 target_ratio;
+	u16 current_ratio = ktd253->ratio;
+	unsigned long flags;
+
+	dev_dbg(ktd253->dev, "new brightness: %d\n", brightness);
+
+	/* Look up the current ratio */
+	for (target_ratio = KTD253_MAX_RATIO; target_ratio > 0; target_ratio--) {
+		if (brightness > ktd253_brightness_to_current_ratio[target_ratio - 1])
+			break;
+	}
+
+	dev_dbg(ktd253->dev, "new ratio: %d/32\n", target_ratio);
+
+	if (target_ratio == current_ratio)
+		/* This is already right */
+		return 0;
+
+	if (target_ratio == 0) {
+		gpiod_set_value_cansleep(ktd253->gpiod, 0);
+		/*
+		 * We need to keep the GPIO low for at least this long
+		 * to actually switch the KTD253 off.
+		 */
+		msleep(KTD253_T_OFF_MS);
+		ktd253->ratio = 0;
+		return 0;
+	}
+
+	if (current_ratio == 0) {
+		gpiod_set_value_cansleep(ktd253->gpiod, 1);
+		ndelay(KTD253_T_HIGH_NS);
+		/* We always fall back to this when we power on */
+		current_ratio = KTD253_MAX_RATIO;
+	}
+
+	/*
+	 * WARNING:
+	 * The loop to set the correct current level is performed
+	 * with interrupts disabled as it is timing critical.
+	 * The maximum number of cycles of the loop is 32
+	 * so the time taken will be (T_LOW_NS + T_HIGH_NS + loop_time) * 32,
+	 */
+	local_irq_save(flags);
+	while (current_ratio != target_ratio) {
+		/*
+		 * These GPIO operations absolutely can NOT sleep so no
+		 * _cansleep suffixes, and no using GPIO expanders on
+		 * slow buses for this!
+		 */
+		gpiod_set_value(ktd253->gpiod, 0);
+		ndelay(KTD253_T_LOW_NS);
+		gpiod_set_value(ktd253->gpiod, 1);
+		ndelay(KTD253_T_HIGH_NS);
+		/* After 1/32 we loop back to 32/32 */
+		if (current_ratio == KTD253_MIN_RATIO)
+			current_ratio = KTD253_MAX_RATIO;
+		else
+			current_ratio--;
+	}
+	local_irq_restore(flags);
+	ktd253->ratio = current_ratio;
+
+	dev_dbg(ktd253->dev, "new ratio set to %d/32\n", target_ratio);
+
+	return 0;
+}
+
+static const struct backlight_ops ktd253_backlight_ops = {
+	.options	= BL_CORE_SUSPENDRESUME,
+	.update_status	= ktd253_backlight_update_status,
+};
+
+static int ktd253_backlight_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct backlight_device *bl;
+	struct ktd253_backlight *ktd253;
+	u32 max_brightness;
+	u32 brightness;
+	int ret;
+
+	ktd253 = devm_kzalloc(dev, sizeof(*ktd253), GFP_KERNEL);
+	if (!ktd253)
+		return -ENOMEM;
+	ktd253->dev = dev;
+
+	ret = device_property_read_u32(dev, "max-brightness", &max_brightness);
+	if (ret)
+		max_brightness = KTD253_MAX_BRIGHTNESS;
+
+	ret = device_property_read_u32(dev, "default-brightness", &brightness);
+	if (ret)
+		brightness = KTD253_DEFAULT_BRIGHTNESS;
+
+	if (brightness)
+		/* This will be the default ratio when the KTD253 is enabled */
+		ktd253->ratio = KTD253_MAX_RATIO;
+	else
+		ktd253->ratio = 0;
+
+	ktd253->gpiod = devm_gpiod_get(dev, NULL,
+				       brightness ? GPIOD_OUT_HIGH :
+				       GPIOD_OUT_LOW);
+	if (IS_ERR(ktd253->gpiod)) {
+		ret = PTR_ERR(ktd253->gpiod);
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "gpio line missing or invalid.\n");
+		return ret;
+	}
+	gpiod_set_consumer_name(ktd253->gpiod, dev_name(dev));
+
+	bl = devm_backlight_device_register(dev, dev_name(dev), dev, ktd253,
+					    &ktd253_backlight_ops, NULL);
+	if (IS_ERR(bl)) {
+		dev_err(dev, "failed to register backlight\n");
+		return PTR_ERR(bl);
+	}
+	bl->props.max_brightness = max_brightness;
+	/* When we just enable the GPIO line we set max brightness */
+	if (brightness) {
+		bl->props.brightness = brightness;
+		bl->props.power = FB_BLANK_UNBLANK;
+		ktd253_backlight_update_status(bl);
+	} else {
+		bl->props.brightness = 0;
+		bl->props.power = FB_BLANK_POWERDOWN;
+	}
+
+	platform_set_drvdata(pdev, bl);
+
+	return 0;
+}
+
+static const struct of_device_id ktd253_backlight_of_match[] = {
+	{ .compatible = "kinetic,ktd253" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, ktd253_backlight_of_match);
+
+static struct platform_driver ktd253_backlight_driver = {
+	.driver = {
+		.name = "ktd253-backlight",
+		.of_match_table = ktd253_backlight_of_match,
+	},
+	.probe		= ktd253_backlight_probe,
+};
+module_platform_driver(ktd253_backlight_driver);
+
+MODULE_AUTHOR("Linus Walleij <linus.walleij@linaro.org>");
+MODULE_DESCRIPTION("Kinetic KTD253 Backlight Driver");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:ktd253-backlight");
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
