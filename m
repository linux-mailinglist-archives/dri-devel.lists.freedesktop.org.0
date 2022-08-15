Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5821592B20
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 11:06:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4E80991C6;
	Mon, 15 Aug 2022 09:05:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79C92B09DA
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 09:03:23 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id 24so6040022pgr.7
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 02:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=rsqOzg+8z0odTvi0QRBHtWn8a4RjW0UauP4nVAZ6vck=;
 b=NHKbJ+5Us229eXYZUHOliKTB7IYRSEEVMypXPvvpNSxqoXxTaNCT6T2kA+FT0BXZtE
 ySvL8HfvCPeqLENm4L+8j7J3T2cEGap5k5cuukCLV3HbwVBABBLSMiE/dHKkZUc/0FkJ
 /VhS7TGNhU+DYrYmgl73EokTeBK79PepGp42tgrUsIo2oSbrM6r94DxZAkcFsZUTxnFc
 P1vv7n9/13HGSuJyJCfPo/9vVdvPhDsYoiqfHSr4VuGmAUMmb8yjCcaopGf6D1YHAJ8h
 mIfl2xVp4m7GpMzxh158KQy/MDznTYvzyruGfyFdWGw+oNwV2J7AoO0DpOXrqsE2uWWv
 Yjhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=rsqOzg+8z0odTvi0QRBHtWn8a4RjW0UauP4nVAZ6vck=;
 b=uf3qwEX0U7LEkESxMRa4lEa3P3G7n7mPi8yf1eyx9S/pwkcBay0mCcSe65m2yfDvG8
 90ZdgosfXwUgrN+++AGdCaqO+8LGrL23eF+cJoTBB6z+6JLIQLBGIbEnMrRsreQAi7Qr
 2VnP7bZL+K7Y881DQ1uFNn8cE3wYasoCvgevGmBNX62dI9tIK/3MENqDeLjsfk3fDZt9
 zQk6VcWdDD+tz03ES1ChHDrR5YwUM25ziqKEo5iOGFwl3GSyT8ABLYTdtVs2jKc9Vp+z
 +yl2ddpGh47iCaHpFO+WXKERwuhBuJQd7QVL2XflAl2CGHZSfRCI2E4TiaPCBb7n6Ot0
 cF7Q==
X-Gm-Message-State: ACgBeo1cLOKgAPMwh5H/7g++Dpjqna0Qv1KhVUxmugB3yC/SnojWOSaV
 FpDeYUphMZeX6tMoNNXOHo4=
X-Google-Smtp-Source: AA6agR5SmgsY3B2WP1f7UyaTMQc9J3dkqGWZ1G1PqGzpJ6aB/khumz0WIw8P4gEWj4uUIEZUjcWQ3Q==
X-Received: by 2002:a65:6d13:0:b0:41d:7380:e9cc with SMTP id
 bf19-20020a656d13000000b0041d7380e9ccmr13078929pgb.153.1660554202604; 
 Mon, 15 Aug 2022 02:03:22 -0700 (PDT)
Received: from DESKTOP-IBN2BAQ.localdomain ([123.110.155.185])
 by smtp.gmail.com with ESMTPSA id
 a17-20020a656411000000b00412a708f38asm5491612pgv.35.2022.08.15.02.03.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 02:03:22 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 pavel@ucw.cz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
 gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
 linux@roeck-us.net, heikki.krogerus@linux.intel.com, deller@gmx.de,
 broonie@kernel.org, mazziesaccount@gmail.com, lgirdwood@gmail.com,
 andriy.shevchenko@linux.intel.com
Subject: [RESEND PATCH v8 12/12] video: backlight: mt6370: Add MediaTek MT6370
 support
Date: Mon, 15 Aug 2022 17:01:25 +0800
Message-Id: <20220815090125.27705-13-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220815090125.27705-1-peterwu.pub@gmail.com>
References: <20220815090125.27705-1-peterwu.pub@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 szunichen@gmail.com, alice_chen@richtek.com, linux-pm@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 cy_huang@richtek.com, chiaen_wu@richtek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: ChiaEn Wu <chiaen_wu@richtek.com>

MediaTek MT6370 is a SubPMIC consisting of a single cell battery charger
with ADC monitoring, RGB LEDs, dual channel flashlight, WLED backlight
driver, display bias voltage supply, one general purpose LDO, and the
USB Type-C & PD controller complies with the latest USB Type-C and PD
standards.

Add support for the MediaTek MT6370 backlight driver.
It controls 4 channels of 8 series WLEDs in
2048 (only for MT6370/MT6371) / 16384 (only for MT6372)
current steps (30 mA) in exponential or linear mapping curves.

Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
---

v8
- Add missing header file <linux/property.h>
- Remove useledd header file <linux/of_device.h>
- Revise the comment of 'mt6370_check_vendor_info()'
---
 drivers/video/backlight/Kconfig            |  13 +
 drivers/video/backlight/Makefile           |   1 +
 drivers/video/backlight/mt6370-backlight.c | 351 +++++++++++++++++++++
 3 files changed, 365 insertions(+)
 create mode 100644 drivers/video/backlight/mt6370-backlight.c

diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
index a003e02e13ce..936ba1e4d35e 100644
--- a/drivers/video/backlight/Kconfig
+++ b/drivers/video/backlight/Kconfig
@@ -268,6 +268,19 @@ config BACKLIGHT_MAX8925
 	  If you have a LCD backlight connected to the WLED output of MAX8925
 	  WLED output, say Y here to enable this driver.
 
+config BACKLIGHT_MT6370
+	tristate "MediaTek MT6370 Backlight Driver"
+	depends on MFD_MT6370
+	help
+	  This enables support for Mediatek MT6370 Backlight driver.
+	  It's commonly used to drive the display WLED. There are 4 channels
+	  inside, and each channel supports up to 30mA of current capability
+	  with 2048 current steps (only for MT6370/MT6371) or 16384 current
+	  steps (only for MT6372) in exponential or linear mapping curves.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called "mt6370-backlight".
+
 config BACKLIGHT_APPLE
 	tristate "Apple Backlight Driver"
 	depends on X86 && ACPI
diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlight/Makefile
index cae2c83422ae..e815f3f1deff 100644
--- a/drivers/video/backlight/Makefile
+++ b/drivers/video/backlight/Makefile
@@ -44,6 +44,7 @@ obj-$(CONFIG_BACKLIGHT_LP855X)		+= lp855x_bl.o
 obj-$(CONFIG_BACKLIGHT_LP8788)		+= lp8788_bl.o
 obj-$(CONFIG_BACKLIGHT_LV5207LP)	+= lv5207lp.o
 obj-$(CONFIG_BACKLIGHT_MAX8925)		+= max8925_bl.o
+obj-$(CONFIG_BACKLIGHT_MT6370)		+= mt6370-backlight.o
 obj-$(CONFIG_BACKLIGHT_OMAP1)		+= omap1_bl.o
 obj-$(CONFIG_BACKLIGHT_PANDORA)		+= pandora_bl.o
 obj-$(CONFIG_BACKLIGHT_PCF50633)	+= pcf50633-backlight.o
diff --git a/drivers/video/backlight/mt6370-backlight.c b/drivers/video/backlight/mt6370-backlight.c
new file mode 100644
index 000000000000..844c94655633
--- /dev/null
+++ b/drivers/video/backlight/mt6370-backlight.c
@@ -0,0 +1,351 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2022 Richtek Technology Corp.
+ *
+ * Author: ChiaEn Wu <chiaen_wu@richtek.com>
+ */
+
+#include <linux/backlight.h>
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/gpio/consumer.h>
+#include <linux/kernel.h>
+#include <linux/minmax.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+
+#define MT6370_REG_DEV_INFO		0x100
+#define MT6370_REG_BL_EN		0x1A0
+#define MT6370_REG_BL_BSTCTRL		0x1A1
+#define MT6370_REG_BL_PWM		0x1A2
+#define MT6370_REG_BL_DIM2		0x1A4
+
+#define MT6370_VENID_MASK		GENMASK(7, 4)
+#define MT6370_BL_EXT_EN_MASK		BIT(7)
+#define MT6370_BL_EN_MASK		BIT(6)
+#define MT6370_BL_CODE_MASK		BIT(0)
+#define MT6370_BL_CH_MASK		GENMASK(5, 2)
+#define MT6370_BL_CH_SHIFT		2
+#define MT6370_BL_DIM2_COMMON_MASK	GENMASK(2, 0)
+#define MT6370_BL_DIM2_COMMON_SHIFT	3
+#define MT6370_BL_DIM2_6372_MASK	GENMASK(5, 0)
+#define MT6370_BL_DIM2_6372_SHIFT	6
+#define MT6370_BL_PWM_EN_MASK		BIT(7)
+#define MT6370_BL_PWM_HYS_EN_MASK	BIT(2)
+#define MT6370_BL_PWM_HYS_SEL_MASK	GENMASK(1, 0)
+#define MT6370_BL_OVP_EN_MASK		BIT(7)
+#define MT6370_BL_OVP_SEL_MASK		GENMASK(6, 5)
+#define MT6370_BL_OVP_SEL_SHIFT		5
+#define MT6370_BL_OC_EN_MASK		BIT(3)
+#define MT6370_BL_OC_SEL_MASK		GENMASK(2, 1)
+#define MT6370_BL_OC_SEL_SHIFT		1
+
+#define MT6370_BL_PWM_HYS_TH_MIN_STEP	1
+#define MT6370_BL_PWM_HYS_TH_MAX_STEP	64
+#define MT6370_BL_OVP_MIN_UV		17000000
+#define MT6370_BL_OVP_MAX_UV		29000000
+#define MT6370_BL_OVP_STEP_UV		4000000
+#define MT6370_BL_OCP_MIN_UA		900000
+#define MT6370_BL_OCP_MAX_UA		1800000
+#define MT6370_BL_OCP_STEP_UA		300000
+#define MT6370_BL_MAX_COMMON_BRIGHTNESS	2048
+#define MT6370_BL_MAX_6372_BRIGHTNESS	16384
+#define MT6370_BL_MAX_CH		15
+
+enum {
+	MT6370_VID_COMMON = 1,
+	MT6370_VID_6372,
+};
+
+struct mt6370_priv {
+	u8 dim2_mask;
+	u8 dim2_shift;
+	int def_max_brightness;
+	struct backlight_device *bl;
+	struct device *dev;
+	struct gpio_desc *enable_gpio;
+	struct regmap *regmap;
+};
+
+static int mt6370_bl_update_status(struct backlight_device *bl_dev)
+{
+	struct mt6370_priv *priv = bl_get_data(bl_dev);
+	int brightness = backlight_get_brightness(bl_dev);
+	unsigned int enable_val;
+	u8 brightness_val[2];
+	int ret;
+
+	if (brightness) {
+		brightness_val[0] = (brightness - 1) & priv->dim2_mask;
+		brightness_val[1] = (brightness - 1) >> priv->dim2_shift;
+
+		ret = regmap_raw_write(priv->regmap, MT6370_REG_BL_DIM2,
+				       brightness_val, sizeof(brightness_val));
+		if (ret)
+			return ret;
+	}
+
+	gpiod_set_value(priv->enable_gpio, !!brightness);
+
+	enable_val = brightness ? MT6370_BL_EN_MASK : 0;
+	return regmap_update_bits(priv->regmap, MT6370_REG_BL_EN,
+				  MT6370_BL_EN_MASK, enable_val);
+}
+
+static int mt6370_bl_get_brightness(struct backlight_device *bl_dev)
+{
+	struct mt6370_priv *priv = bl_get_data(bl_dev);
+	unsigned int enable;
+	u8 brightness_val[2];
+	int brightness, ret;
+
+	ret = regmap_read(priv->regmap, MT6370_REG_BL_EN, &enable);
+	if (ret)
+		return ret;
+
+	if (!(enable & MT6370_BL_EN_MASK))
+		return 0;
+
+	ret = regmap_raw_read(priv->regmap, MT6370_REG_BL_DIM2,
+			      brightness_val, sizeof(brightness_val));
+	if (ret)
+		return ret;
+
+	brightness = brightness_val[1] << priv->dim2_shift;
+	brightness += brightness_val[0] & priv->dim2_mask;
+
+	return brightness + 1;
+}
+
+static const struct backlight_ops mt6370_bl_ops = {
+	.options = BL_CORE_SUSPENDRESUME,
+	.update_status = mt6370_bl_update_status,
+	.get_brightness = mt6370_bl_get_brightness,
+};
+
+static int mt6370_init_backlight_properties(struct mt6370_priv *priv,
+					    struct backlight_properties *props)
+{
+	struct device *dev = priv->dev;
+	u8 prop_val;
+	u32 brightness, ovp_uV, ocp_uA;
+	unsigned int mask, val;
+	int ret;
+
+	/* Vendor optional properties */
+	val = 0;
+	if (device_property_read_bool(dev, "mediatek,bled-pwm-enable"))
+		val |= MT6370_BL_PWM_EN_MASK;
+
+	if (device_property_read_bool(dev, "mediatek,bled-pwm-hys-enable"))
+		val |= MT6370_BL_PWM_HYS_EN_MASK;
+
+	ret = device_property_read_u8(dev,
+				      "mediatek,bled-pwm-hys-input-th-steps",
+				      &prop_val);
+	if (!ret) {
+		prop_val = clamp_val(prop_val,
+				     MT6370_BL_PWM_HYS_TH_MIN_STEP,
+				     MT6370_BL_PWM_HYS_TH_MAX_STEP);
+		prop_val = prop_val <= 1 ? 0 :
+			   prop_val <= 4 ? 1 :
+			   prop_val <= 16 ? 2 : 3;
+		val |= prop_val;
+	}
+
+	ret = regmap_update_bits(priv->regmap, MT6370_REG_BL_PWM,
+				 val, val);
+	if (ret)
+		return ret;
+
+	val = 0;
+	if (device_property_read_bool(dev, "mediatek,bled-ovp-shutdown"))
+		val |= MT6370_BL_OVP_EN_MASK;
+
+	ret = device_property_read_u32(dev, "mediatek,bled-ovp-microvolt",
+				       &ovp_uV);
+	if (!ret) {
+		ovp_uV = clamp_val(ovp_uV, MT6370_BL_OVP_MIN_UV,
+				   MT6370_BL_OVP_MAX_UV);
+		ovp_uV = DIV_ROUND_UP(ovp_uV - MT6370_BL_OVP_MIN_UV,
+				      MT6370_BL_OVP_STEP_UV);
+		val |= ovp_uV << MT6370_BL_OVP_SEL_SHIFT;
+	}
+
+	if (device_property_read_bool(dev, "mediatek,bled-ocp-shutdown"))
+		val |= MT6370_BL_OC_EN_MASK;
+
+	ret = device_property_read_u32(dev, "mediatek,bled-ocp-microamp",
+				       &ocp_uA);
+	if (!ret) {
+		ocp_uA = clamp_val(ocp_uA, MT6370_BL_OCP_MIN_UA,
+				   MT6370_BL_OCP_MAX_UA);
+		ocp_uA = DIV_ROUND_UP(ocp_uA - MT6370_BL_OCP_MIN_UA,
+				      MT6370_BL_OCP_STEP_UA);
+		val |= ocp_uA << MT6370_BL_OC_SEL_SHIFT;
+	}
+
+	ret = regmap_update_bits(priv->regmap, MT6370_REG_BL_BSTCTRL,
+				 val, val);
+	if (ret)
+		return ret;
+
+	/* Common properties */
+	ret = device_property_read_u32(dev, "max-brightness", &brightness);
+	if (ret)
+		brightness = priv->def_max_brightness;
+
+	props->max_brightness = min_t(u32, brightness, priv->def_max_brightness);
+
+	ret = device_property_read_u32(dev, "default-brightness", &brightness);
+	if (ret)
+		brightness = props->max_brightness;
+
+	props->brightness = min_t(u32, brightness, props->max_brightness);
+
+	val = 0;
+	if (device_property_read_bool(dev, "mediatek,bled-exponential-mode-enable")) {
+		val |= MT6370_BL_CODE_MASK;
+		props->scale = BACKLIGHT_SCALE_NON_LINEAR;
+	} else
+		props->scale = BACKLIGHT_SCALE_LINEAR;
+
+	ret = device_property_read_u8(dev, "mediatek,bled-channel-use",
+				      &prop_val);
+	if (ret) {
+		dev_err(dev, "mediatek,bled-channel-use DT property missing\n");
+		return ret;
+	}
+
+	if (!prop_val || prop_val > MT6370_BL_MAX_CH) {
+		dev_err(dev,
+			"No channel specified or over than upper bound (%d)\n",
+			prop_val);
+		return -EINVAL;
+	}
+
+	mask = MT6370_BL_EXT_EN_MASK | MT6370_BL_CH_MASK;
+	val |= prop_val << MT6370_BL_CH_SHIFT;
+
+	if (priv->enable_gpio)
+		val |= MT6370_BL_EXT_EN_MASK;
+
+	return regmap_update_bits(priv->regmap, MT6370_REG_BL_EN, mask, val);
+}
+
+static int mt6370_check_vendor_info(struct mt6370_priv *priv)
+{
+	/*
+	 * Because MT6372 uses 14 bits to control the brightness,
+	 * MT6370 and MT6371 use 11 bits.
+	 * This function is used to check the vendor's ID and
+	 * set the relative hardware mask, shift and
+	 * default maximum brightness value that should be used.
+	 */
+	unsigned int dev_info, hw_vid, of_vid;
+	int ret;
+
+	ret = regmap_read(priv->regmap, MT6370_REG_DEV_INFO, &dev_info);
+	if (ret)
+		return ret;
+
+	of_vid = (uintptr_t)device_get_match_data(priv->dev);
+	hw_vid = FIELD_GET(MT6370_VENID_MASK, dev_info);
+	hw_vid = (hw_vid == 0x9 || hw_vid == 0xb) ? MT6370_VID_6372 : MT6370_VID_COMMON;
+	if (hw_vid != of_vid)
+		return dev_err_probe(priv->dev, -EINVAL,
+				     "Buggy DT, wrong compatible string\n");
+
+	if (hw_vid == MT6370_VID_6372) {
+		priv->dim2_mask = MT6370_BL_DIM2_6372_MASK;
+		priv->dim2_shift = MT6370_BL_DIM2_6372_SHIFT;
+		priv->def_max_brightness = MT6370_BL_MAX_6372_BRIGHTNESS;
+	} else {
+		priv->dim2_mask = MT6370_BL_DIM2_COMMON_MASK;
+		priv->dim2_shift = MT6370_BL_DIM2_COMMON_SHIFT;
+		priv->def_max_brightness = MT6370_BL_MAX_COMMON_BRIGHTNESS;
+	}
+
+	return 0;
+}
+
+static int mt6370_bl_probe(struct platform_device *pdev)
+{
+	struct backlight_properties props = {
+		.type = BACKLIGHT_RAW,
+	};
+	struct device *dev = &pdev->dev;
+	struct mt6370_priv *priv;
+	int ret;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->dev = dev;
+
+	priv->regmap = dev_get_regmap(dev->parent, NULL);
+	if (!priv->regmap)
+		return dev_err_probe(dev, -ENODEV, "Failed to get regmap\n");
+
+	ret = mt6370_check_vendor_info(priv);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to check vendor info\n");
+
+	priv->enable_gpio = devm_gpiod_get_optional(dev, "enable",
+						    GPIOD_OUT_HIGH);
+	if (IS_ERR(priv->enable_gpio))
+		return dev_err_probe(dev, PTR_ERR(priv->enable_gpio),
+				     "Failed to get 'enable' gpio\n");
+
+	ret = mt6370_init_backlight_properties(priv, &props);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to init backlight properties\n");
+
+	priv->bl = devm_backlight_device_register(dev, pdev->name, dev, priv,
+						  &mt6370_bl_ops, &props);
+	if (IS_ERR(priv->bl))
+		return dev_err_probe(dev, PTR_ERR(priv->bl),
+				     "Failed to register backlight\n");
+
+	backlight_update_status(priv->bl);
+	platform_set_drvdata(pdev, priv);
+
+	return 0;
+}
+
+static int mt6370_bl_remove(struct platform_device *pdev)
+{
+	struct mt6370_priv *priv = platform_get_drvdata(pdev);
+	struct backlight_device *bl_dev = priv->bl;
+
+	bl_dev->props.brightness = 0;
+	backlight_update_status(priv->bl);
+
+	return 0;
+}
+
+static const struct of_device_id mt6370_bl_of_match[] = {
+	{ .compatible = "mediatek,mt6370-backlight", .data = (void *)MT6370_VID_COMMON },
+	{ .compatible = "mediatek,mt6372-backlight", .data = (void *)MT6370_VID_6372 },
+	{}
+};
+MODULE_DEVICE_TABLE(of, mt6370_bl_of_match);
+
+static struct platform_driver mt6370_bl_driver = {
+	.driver = {
+		.name = "mt6370-backlight",
+		.of_match_table = mt6370_bl_of_match,
+	},
+	.probe = mt6370_bl_probe,
+	.remove = mt6370_bl_remove,
+};
+module_platform_driver(mt6370_bl_driver);
+
+MODULE_AUTHOR("ChiaEn Wu <chiaen_wu@richtek.com>");
+MODULE_DESCRIPTION("MediaTek MT6370 Backlight Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.34.1

