Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 551D224271F
	for <lists+dri-devel@lfdr.de>; Wed, 12 Aug 2020 10:59:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E50176E0F8;
	Wed, 12 Aug 2020 08:59:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78ED66E0F8
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 08:59:03 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id t23so1384682ljc.3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 01:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HyB6tuy71k266TLGIwU4bCchbZS0owgEMQti8CCVIaI=;
 b=oTb9TG7qevspFqO60TnDcPw+fjsd+0QDCnuANtnrUhI+wb1XL+d+/L3Xgeoz4sA/DF
 94IdXXFcRgo0VVSvrbOpafYE37K5u7WD0k8CEHDX+qa4NcRmUSBUHCMqxEa7vtiCxJVi
 WTjGRyDX7Pjj3MIGssU9J9ROTIjxqU9zyAjvssqwNA7DNeRu0zlXEjx72Sif8n4ZNYCx
 BJutV2TKG0Iu2oGOX3vMDJZAcm4TKAhbGQ8Kb55Ul5sTrGv5Yz0Ompc+Or0BU8Nn53bm
 Koo34EHH56StJCF81N6sS+7Mn+WQq3WjRRCAxTcY4gwgA0l3nlbCCJiblsIkz64YSquC
 EZzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HyB6tuy71k266TLGIwU4bCchbZS0owgEMQti8CCVIaI=;
 b=BuYMvXgUivnJKRgyqguLfWJtFCwQQAkHPmzkmU1VjTpGCd+Tara35ZxnwweECRFx18
 WNdC4+yOBUb6BbIh7cYpzsKFur7+DJaEyGf2KAkJqo6VCEzdTVX2tYeR2sLJqUaXGyTk
 V/ixgEKRPdC5A+OzqToo+3fM/wctLRGt/wxGfmAkvH/p/GJCS2P4HwE4a1640Hp1hM79
 Bm1hz+SWy/LyyPOMXECB9j3jZp2Ryu00aLgKJslEMSIB7TvVK4wTDQTTjJwLvKEu6E3t
 5z6NUj3ZixBvLJ4j5xW9Xx9bX8I17J3EhLlAYmwU9UaxOrAXbeRsBj0cv+CbVams4JxJ
 /F2Q==
X-Gm-Message-State: AOAM533UKa86Kt3juTve1b8dZg15mEXJ1PauAgHmy8c42QmqhtQfxFyL
 GQAX2JNfSuwq3wwTdgAtb1W8sA==
X-Google-Smtp-Source: ABdhPJymuNaRdH+aNw5RsK419YE4GH8ToSAnoy8CTYfsRiSGq5ImcYTonmH4C0Xjl9yZqXUtth6rsA==
X-Received: by 2002:a2e:b70b:: with SMTP id j11mr4474536ljo.259.1597222741847; 
 Wed, 12 Aug 2020 01:59:01 -0700 (PDT)
Received: from localhost.bredbandsbolaget
 (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
 by smtp.gmail.com with ESMTPSA id 132sm325676lfo.16.2020.08.12.01.59.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2020 01:59:01 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3 v2] backlight: Add Kinetic KTD253 backlight driver
Date: Wed, 12 Aug 2020 10:58:50 +0200
Message-Id: <20200812085850.2643820-3-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200812085850.2643820-1-linus.walleij@linaro.org>
References: <20200812085850.2643820-1-linus.walleij@linaro.org>
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
Cc: Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Kinetic KTD253 backlight driver is controlled with a
single GPIO line, but still supports a range of brightness
settings by sending fast pulses on the line.

This is based off the source code release for the Samsung
GT-S7710 mobile phone.

Cc: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Expose the 32 actual hardware levels of brightness directly
  instead of using an interpolated "brightness" table.
- Use the new backlight_get_brightness() helper.
- Call backlight_update_status() in probe instead of calling
  local functions to sync brightness.
- Sort includes alphabetically.
- Name the GPIO line "enable" and grab that in accordance
  with the change to the DT bindings.
---
 MAINTAINERS                                |   6 +
 drivers/video/backlight/Kconfig            |   8 +
 drivers/video/backlight/Makefile           |   1 +
 drivers/video/backlight/ktd253-backlight.c | 198 +++++++++++++++++++++
 4 files changed, 213 insertions(+)
 create mode 100644 drivers/video/backlight/ktd253-backlight.c

diff --git a/MAINTAINERS b/MAINTAINERS
index e627ed60d75a..4c93e3a7be11 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9711,6 +9711,12 @@ F:	Documentation/admin-guide/auxdisplay/ks0108.rst
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
index 87f9fc238d28..d83c87b902c1 100644
--- a/drivers/video/backlight/Kconfig
+++ b/drivers/video/backlight/Kconfig
@@ -182,6 +182,14 @@ config BACKLIGHT_IPAQ_MICRO
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
index 13463b99f1f9..685f3f1ca4df 100644
--- a/drivers/video/backlight/Makefile
+++ b/drivers/video/backlight/Makefile
@@ -35,6 +35,7 @@ obj-$(CONFIG_BACKLIGHT_GPIO)		+= gpio_backlight.o
 obj-$(CONFIG_BACKLIGHT_HP680)		+= hp680_bl.o
 obj-$(CONFIG_BACKLIGHT_HP700)		+= jornada720_bl.o
 obj-$(CONFIG_BACKLIGHT_IPAQ_MICRO)	+= ipaq_micro_bl.o
+obj-$(CONFIG_BACKLIGHT_KTD253)		+= ktd253-backlight.o
 obj-$(CONFIG_BACKLIGHT_LM3533)		+= lm3533_bl.o
 obj-$(CONFIG_BACKLIGHT_LM3630A)		+= lm3630a_bl.o
 obj-$(CONFIG_BACKLIGHT_LM3639)		+= lm3639_bl.o
diff --git a/drivers/video/backlight/ktd253-backlight.c b/drivers/video/backlight/ktd253-backlight.c
new file mode 100644
index 000000000000..e3fee3f1f582
--- /dev/null
+++ b/drivers/video/backlight/ktd253-backlight.c
@@ -0,0 +1,198 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Backlight driver for the Kinetic KTD253
+ * Based on code and know-how from the Samsung GT-S7710
+ * Gareth Phillips <gareth.phillips@samsung.com>
+ */
+#include <linux/backlight.h>
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/fb.h>
+#include <linux/gpio/consumer.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/limits.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/slab.h>
+
+/* Current ratio is n/32 from 1/32 to 32/32 */
+#define KTD253_MIN_RATIO 1
+#define KTD253_MAX_RATIO 32
+#define KTD253_DEFAULT_RATIO 13
+
+#define KTD253_T_LOW_NS (200 + 10) /* Additional 10ns as safety factor */
+#define KTD253_T_HIGH_NS (200 + 10) /* Additional 10ns as safety factor */
+#define KTD253_T_OFF_MS 3
+
+struct ktd253_backlight {
+	struct device *dev;
+	struct backlight_device *bl;
+	struct gpio_desc *gpiod;
+	u16 ratio;
+};
+
+static int ktd253_backlight_update_status(struct backlight_device *bl)
+{
+	struct ktd253_backlight *ktd253 = bl_get_data(bl);
+	int brightness = backlight_get_brightness(bl);
+	u16 target_ratio;
+	u16 current_ratio = ktd253->ratio;
+	unsigned long flags;
+
+	dev_dbg(ktd253->dev, "new brightness/ratio: %d/32\n", brightness);
+
+	target_ratio = brightness;
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
+		max_brightness = KTD253_MAX_RATIO;
+	if (max_brightness > KTD253_MAX_RATIO) {
+		/* Clamp brightness to hardware max */
+		dev_err(dev, "illegal max brightness specified\n");
+		max_brightness = KTD253_MAX_RATIO;
+	}
+
+	ret = device_property_read_u32(dev, "default-brightness", &brightness);
+	if (ret)
+		brightness = KTD253_DEFAULT_RATIO;
+	if (brightness > max_brightness) {
+		/* Clamp default brightness to max brightness */
+		dev_err(dev, "default brightness exceeds max brightness\n");
+		brightness = max_brightness;
+	}
+
+	if (brightness)
+		/* This will be the default ratio when the KTD253 is enabled */
+		ktd253->ratio = KTD253_MAX_RATIO;
+	else
+		ktd253->ratio = 0;
+
+	ktd253->gpiod = devm_gpiod_get(dev, "enable",
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
+	} else {
+		bl->props.brightness = 0;
+		bl->props.power = FB_BLANK_POWERDOWN;
+	}
+
+	ktd253->bl = bl;
+	platform_set_drvdata(pdev, bl);
+	backlight_update_status(bl);
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
