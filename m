Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA90F5484C2
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 13:13:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 436C010E46A;
	Mon, 13 Jun 2022 11:13:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B681110E468
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 11:13:52 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 g10-20020a17090a708a00b001ea8aadd42bso5644909pjk.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 04:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WyrmKsYSTK52+yXgs1VGgiXSRnWks4qyg2oye3t5qyc=;
 b=i2QqvHYCHyukFpJBLjG0rU00YjN7H5Tsw1q9ioVPHeIOF9lgtnBR4shoML0ukpYAn4
 hqwzFPS4K2C8cTstgfKBGOuVcFLA0J/rV6I2o2/dT8//c6mur65DCUieLPoks/M0VHvC
 N0gDf6Ca/RPH2b7lCK+x4TEaaNwDw/P5FZEfvNHgxUfXYlwpD3fxAWAyh19UGwa4Y31d
 YB3yWCqWj8fOXpEejxMUflf3zkV04Std6UaMQaN/dnIMIl5REioUGzVGNshBTnZbWFva
 MjE4pI1xgsHg4H7BwHKGgxLBneT/ZJ4zT6JSBCm/PzIrSkEApX6pIoHrCvkrcELGDFJy
 5S2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WyrmKsYSTK52+yXgs1VGgiXSRnWks4qyg2oye3t5qyc=;
 b=zXmYdwfMYD7uuj9P0b8p00OqCpuCphJgr2vIHpz6KZPRpVvEWN2v4xaC0PUlagask0
 lEaTV71m97j0OWiLDwM7PQkwvxmtzm/DkULc9eY0Q1V9Coxg2iab9zHGKrEUr4urbpgL
 Ag0/vn5wvYOY/dHoS385CoUdZsTsv2YvxgiGasljM7+EquhBrprCaL3TPima/8YP20BO
 TEtsBPrVcmXzuRMKXY1fUnGpQ203qRjaeE5JhiL/z8bx3VVDjNJ6sGf2LVYhmIfuu8mQ
 M3cztnn99DainUK8Yp3+Rex1K1gVGhqVJckClmH6z1XqTr3VrhES0Pqpz2f/Qn7jc6EU
 qL4A==
X-Gm-Message-State: AOAM533+OeM/AkFUwS7y4K3430qQZiMYvrV5A2H2ac92OtJHxsyA/Epu
 4Cy+FKMBDSSW4i7HBazAXvk=
X-Google-Smtp-Source: ABdhPJyYCI9XgxVM1FtHKJngxG40BxuJFmwFN2aaDbA62KL/KVDkRpjD1zYl9v7sBO9Xn20BGeUuKA==
X-Received: by 2002:a17:903:4045:b0:168:b7ca:19b0 with SMTP id
 n5-20020a170903404500b00168b7ca19b0mr17042967pla.66.1655118832186; 
 Mon, 13 Jun 2022 04:13:52 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-72-115-109.emome-ip.hinet.net.
 [42.72.115.109]) by smtp.gmail.com with ESMTPSA id
 g17-20020a056a000b9100b0051b4e53c487sm5199989pfj.45.2022.06.13.04.13.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 04:13:51 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: jic23@kernel.org, lars@metafoo.de, matthias.bgg@gmail.com,
 lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 pavel@ucw.cz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Subject: [PATCH v2 15/15] video: backlight: mt6370: Add Mediatek MT6370 support
Date: Mon, 13 Jun 2022 19:11:46 +0800
Message-Id: <20220613111146.25221-16-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220613111146.25221-1-peterwu.pub@gmail.com>
References: <20220613111146.25221-1-peterwu.pub@gmail.com>
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
 szunichen@gmail.com, linux-pm@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, ChiaEn Wu <chiaen_wu@richtek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: ChiaEn Wu <chiaen_wu@richtek.com>

Add Mediatek MT6370 Backlight support.

Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
---
 drivers/video/backlight/Kconfig            |   9 +
 drivers/video/backlight/Makefile           |   1 +
 drivers/video/backlight/mt6370-backlight.c | 339 +++++++++++++++++++++
 3 files changed, 349 insertions(+)
 create mode 100644 drivers/video/backlight/mt6370-backlight.c

diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
index a003e02e13ce..ec1589ad88bb 100644
--- a/drivers/video/backlight/Kconfig
+++ b/drivers/video/backlight/Kconfig
@@ -268,6 +268,15 @@ config BACKLIGHT_MAX8925
 	  If you have a LCD backlight connected to the WLED output of MAX8925
 	  WLED output, say Y here to enable this driver.
 
+config BACKLIGHT_MT6370
+	tristate "Mediatek MT6370 Backlight Driver"
+	depends on MFD_MT6370
+	help
+	  This enables support for Mediatek MT6370 Backlight driver.
+	  It's commonly used to drive the display WLED. There're 4 channels
+	  inisde, and each channel supports up to 30mA of current capability
+	  with 2048 current steps in exponential or linear mapping curves.
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
index 000000000000..a443c677cb7e
--- /dev/null
+++ b/drivers/video/backlight/mt6370-backlight.c
@@ -0,0 +1,339 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/backlight.h>
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/gpio/consumer.h>
+#include <linux/gpio/driver.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
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
+#define MT6370_BL_CONFIG_MASK		BIT(0)
+#define MT6370_BL_CH_MASK		GENMASK(5, 2)
+#define MT6370_BL_DIM2_MASK		GENMASK(2, 0)
+#define MT6370_BL_DUMMY_6372_MASK	GENMASK(2, 0)
+#define MT6370_BL_DIM2_6372_SHIFT	3
+#define MT6370_BL_PWM_EN_MASK		BIT(7)
+#define MT6370_BL_PWM_HYS_EN_MASK	BIT(2)
+#define MT6370_BL_PWM_HYS_SEL_MASK	GENMASK(1, 0)
+#define MT6370_BL_OVP_EN_MASK		BIT(7)
+#define MT6370_BL_OVP_SEL_MASK		GENMASK(6, 5)
+#define MT6370_BL_OC_EN_MASK		BIT(3)
+#define MT6370_BL_OC_SEL_MASK		GENMASK(2, 1)
+
+#define MT6370_BL_MAX_BRIGHTNESS	2048
+#define MT6370_BL_MAX_CH		15
+
+enum {
+	MT6370_VID_COMMON = 0,
+	MT6370_VID_6372,
+};
+
+struct mt6370_priv {
+	int vid_type;
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
+		brightness_val[0] = (brightness - 1) & MT6370_BL_DIM2_MASK;
+		brightness_val[1] = (brightness - 1)
+				    >> fls(MT6370_BL_DIM2_MASK);
+
+		/*
+		 * To make MT6372 using 14 bits to control the brightness
+		 * backward compatible with 11 bits brightness control
+		 * (like MT6370 and MT6371 do), we left shift the value
+		 * and pad with 1 to remaining bits. Hence, the MT6372's
+		 * backlight brightness will be almost the same as MT6370's
+		 * and MT6371's.
+		 */
+		if (priv->vid_type == MT6370_VID_6372) {
+			brightness_val[0] <<= MT6370_BL_DIM2_6372_SHIFT;
+			brightness_val[0] |= MT6370_BL_DUMMY_6372_MASK;
+		}
+
+		ret = regmap_raw_write(priv->regmap, MT6370_REG_BL_DIM2,
+				       brightness_val, sizeof(brightness_val));
+		if (ret)
+			return ret;
+	}
+
+	if (priv->enable_gpio)
+		gpiod_set_value(priv->enable_gpio, brightness ? 1 : 0);
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
+	if (priv->vid_type == MT6370_VID_6372)
+		brightness_val[0] >>= MT6370_BL_DIM2_6372_SHIFT;
+
+	brightness = brightness_val[1] << fls(MT6370_BL_DIM2_MASK);
+	brightness += (brightness_val[0] & MT6370_BL_DIM2_MASK);
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
+	u32 brightness;
+	unsigned int mask, val;
+	int ret;
+
+	/* Vendor optional properties
+	 * if property not exist, keep value in default.
+	 */
+	if (device_property_read_bool(dev, "mediatek,bled-pwm-enable")) {
+		ret = regmap_update_bits(priv->regmap, MT6370_REG_BL_PWM,
+					 MT6370_BL_PWM_EN_MASK,
+					 MT6370_BL_PWM_EN_MASK);
+		if (ret)
+			return ret;
+	}
+
+	if (device_property_read_bool(dev, "mediatek,bled-pwm-hys-enable")) {
+		ret = regmap_update_bits(priv->regmap, MT6370_REG_BL_PWM,
+					 MT6370_BL_PWM_HYS_EN_MASK,
+					 MT6370_BL_PWM_HYS_EN_MASK);
+		if (ret)
+			return ret;
+	}
+
+	ret = device_property_read_u8(dev, "mediatek,bled-pwm-hys-input-bit",
+				      &prop_val);
+	if (!ret) {
+		val = min_t(u8, prop_val, 3)
+		      << (ffs(MT6370_BL_PWM_HYS_SEL_MASK) - 1);
+		ret = regmap_update_bits(priv->regmap, MT6370_REG_BL_PWM,
+					 MT6370_BL_PWM_HYS_SEL_MASK, val);
+		if (ret)
+			return ret;
+	}
+
+	ret = device_property_read_u8(dev, "mediatek,bled-ovp-microvolt",
+				      &prop_val);
+	if (!ret) {
+		val = min_t(u8, prop_val, 3)
+		      << (ffs(MT6370_BL_OVP_SEL_MASK) - 1);
+		ret = regmap_update_bits(priv->regmap, MT6370_REG_BL_BSTCTRL,
+					 MT6370_BL_OVP_SEL_MASK, val);
+		if (ret)
+			return ret;
+	}
+
+	if (device_property_read_bool(dev, "mediatek,bled-ovp-shutdown")) {
+		ret = regmap_update_bits(priv->regmap, MT6370_REG_BL_BSTCTRL,
+					 MT6370_BL_OVP_EN_MASK,
+					 MT6370_BL_OVP_EN_MASK);
+		if (ret)
+			return ret;
+	}
+
+	ret = device_property_read_u8(dev, "mediatek,bled-ocp-microamp",
+				      &prop_val);
+	if (!ret) {
+		val = min_t(u8, prop_val, 3)
+		      << (ffs(MT6370_BL_OC_SEL_MASK) - 1);
+		ret = regmap_update_bits(priv->regmap, MT6370_REG_BL_BSTCTRL,
+					 MT6370_BL_OC_SEL_MASK, val);
+		if (ret)
+			return ret;
+	}
+
+	if (device_property_read_bool(dev, "mediatek,bled-ocp-shutdown")) {
+		ret = regmap_update_bits(priv->regmap, MT6370_REG_BL_BSTCTRL,
+					 MT6370_BL_OC_EN_MASK,
+					 MT6370_BL_OC_EN_MASK);
+		if (ret)
+			return ret;
+	}
+
+	/* Common properties */
+	ret = device_property_read_u32(dev, "max-brightness", &brightness);
+	if (ret)
+		brightness = MT6370_BL_MAX_BRIGHTNESS;
+
+	props->max_brightness = min_t(u32, brightness,
+				      MT6370_BL_MAX_BRIGHTNESS);
+
+	ret = device_property_read_u32(dev, "default-brightness", &brightness);
+	if (ret)
+		brightness = props->max_brightness;
+
+	props->brightness = min_t(u32, brightness, props->max_brightness);
+
+
+	ret = device_property_read_u8(dev, "mediatek,bled-channel-use",
+				      &prop_val);
+	if (ret) {
+		dev_err(dev, "mediatek,bled-channel-use DT property missing\n");
+		return ret;
+	}
+
+	if (!prop_val || prop_val > MT6370_BL_MAX_CH) {
+		dev_err(dev, "No channel specified (ch_val:%d)\n", prop_val);
+		return -EINVAL;
+	}
+
+	mask = MT6370_BL_EXT_EN_MASK | MT6370_BL_CH_MASK;
+	val = prop_val << (ffs(MT6370_BL_CH_MASK) - 1);
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
+	 * MT6372 uses 14 bits to control the brightness but MT6370 and MT6371
+	 * use 11 bits. They are different so we have to use this function to
+	 * check the vendor ID and use different methods to calculate the
+	 * brightness.
+	 */
+	unsigned int dev_info, vid;
+	int ret;
+
+	ret = regmap_read(priv->regmap, MT6370_REG_DEV_INFO, &dev_info);
+	if (ret)
+		return ret;
+
+	vid = FIELD_GET(MT6370_VENID_MASK, dev_info);
+	if (vid == 0x9 || vid == 0xb)
+		priv->vid_type = MT6370_VID_6372;
+	else
+		priv->vid_type = MT6370_VID_COMMON;
+
+	return 0;
+}
+
+static int mt6370_bl_probe(struct platform_device *pdev)
+{
+	struct mt6370_priv *priv;
+	struct backlight_properties props = {
+		.type = BACKLIGHT_RAW,
+		.scale = BACKLIGHT_SCALE_LINEAR,
+	};
+	int ret;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->dev = &pdev->dev;
+
+	priv->regmap = dev_get_regmap(pdev->dev.parent, NULL);
+	if (!priv->regmap)
+		dev_err_probe(&pdev->dev, -ENODEV, "Failed to get regmap\n");
+
+	ret = mt6370_check_vendor_info(priv);
+	if (ret)
+		dev_err_probe(&pdev->dev, ret, "Failed to check vendor info\n");
+
+	priv->enable_gpio = devm_gpiod_get_optional(&pdev->dev, "enable",
+						    GPIOD_OUT_HIGH);
+	if (IS_ERR(priv->enable_gpio))
+		dev_err_probe(&pdev->dev, PTR_ERR(priv->enable_gpio),
+			      "Failed to get 'enable' gpio\n");
+
+	ret = mt6370_init_backlight_properties(priv, &props);
+	if (ret)
+		dev_err_probe(&pdev->dev, ret,
+			      "Failed to init backlight properties\n");
+
+	priv->bl = devm_backlight_device_register(&pdev->dev, pdev->name,
+						  &pdev->dev, priv,
+						  &mt6370_bl_ops, &props);
+	if (IS_ERR(priv->bl))
+		dev_err_probe(&pdev->dev, PTR_ERR(priv->bl),
+			      "Failed to register backlight\n");
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
+static const struct of_device_id __maybe_unused mt6370_bl_of_match[] = {
+	{ .compatible = "mediatek,mt6370-backlight", },
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
+MODULE_DESCRIPTION("Mediatek MT6370 Backlight Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.25.1

