Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF9D37C3B7
	for <lists+dri-devel@lfdr.de>; Wed, 12 May 2021 17:22:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 109DF6EC35;
	Wed, 12 May 2021 15:22:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C0EF6EC35
 for <dri-devel@lists.freedesktop.org>; Wed, 12 May 2021 15:22:01 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id i5so13680982pgm.0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 May 2021 08:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=4VfONO8iWnXjc4bLmF+kdWkzrEctN65wmhdy3hiN/bI=;
 b=hUI+kuNQs2ujPVBmzBWQuVygOVs8rtpqKdUM4coqoU2PEpEgJ0Qlu8bLr4OZmGYKCg
 db+7P4lb/eocQlGIKI1HN12DqXBaplF6DCK4wfxAWq7ZmRfRbzcp48F8Jx/F790Yu5AC
 AseYFw9nqyZgVIsGQmkDRpLB8efu8wuQbWEn6WHtfyOl/TXTGIyxTNx2w29bnZ/4J1qK
 38rarFwjOJNxlz6Dtw9C0VPJHMEzE4KvXziTYKdYTmn3v6Td7aJ7htuB6294f9wru0h5
 EukPDmPFQNe0l83R45o3Py4pNvE2FWDezZhx1UETgRAMGspXIW6WDO9unXAPd51d66xi
 oT0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=4VfONO8iWnXjc4bLmF+kdWkzrEctN65wmhdy3hiN/bI=;
 b=fbaBag67SJIgwu1J0v2L4Bjqw/cGLE+QqpyF9rGYi+1vsfSNkpOQwCirq9NmkWWNuy
 IduvcSoO1cpYZ8y7Mz3LX2AiLwyodC/fOgF1Uhr3MX6dGnNsjKD2ui/R0mYmLizeBUI9
 j+f3iWEcz+pT5WHHA/fmD48uIs8+7FvAQ1AuWqDqeNXacL9qqOaJ1KxUO9ZXhCIoeYoV
 H/cr4MG18r35TwZegiOKumVzbb8yK1F6NBVgGmJLi4gy7hk3VXV/4sVIpDc0XNZLvR8g
 wCvVm5HhpvPCscVUmT/Z1VS1azs0XkfdD2qowngHG/4l1zFQEQdVVsxkst2ZLG/pVMIj
 qogQ==
X-Gm-Message-State: AOAM533gESEonLbPt647trZO8hvoxAQ+47wKHS+GbxZO/rQsFhhyZMX2
 KEyBo/aS6snNHvXB2v8unEKTjNVfWbpl9g==
X-Google-Smtp-Source: ABdhPJxwb16HfQdLUBd5Wg0WcTt+8A/CRBQa2fpPY7UqWgwbDvv4oFzQisHj3HXlU9Bb5Ql5ljofwA==
X-Received: by 2002:a05:6a00:16c2:b029:228:964e:8b36 with SMTP id
 l2-20020a056a0016c2b0290228964e8b36mr36679868pfc.11.1620832920806; 
 Wed, 12 May 2021 08:22:00 -0700 (PDT)
Received: from localhost.localdomain (1-171-3-209.dynamic-ip.hinet.net.
 [1.171.3.209])
 by smtp.gmail.com with ESMTPSA id t133sm228633pgb.0.2021.05.12.08.21.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 May 2021 08:22:00 -0700 (PDT)
From: cy_huang <u0084500@gmail.com>
To: lee.jones@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com, b.zolnierkie@samsung.com,
 pavel@ucw.cz, robh+dt@kernel.org
Subject: [PATCH v7 4/4] backlight: rt4831: Adds support for Richtek RT4831
 backlight
Date: Wed, 12 May 2021 23:21:40 +0800
Message-Id: <1620832900-8347-4-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1620832900-8347-1-git-send-email-u0084500@gmail.com>
References: <1620832900-8347-1-git-send-email-u0084500@gmail.com>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 cy_huang@richtek.com, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: ChiYuan Huang <cy_huang@richtek.com>

Adds support for Richtek RT4831 backlight.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
---
since v7
- Fix typo 'common' to 'commonly' in Kconfig description.
---
 drivers/video/backlight/Kconfig            |   8 ++
 drivers/video/backlight/Makefile           |   1 +
 drivers/video/backlight/rt4831-backlight.c | 203 +++++++++++++++++++++++++++++
 3 files changed, 212 insertions(+)
 create mode 100644 drivers/video/backlight/rt4831-backlight.c

diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
index d83c87b..858f6df 100644
--- a/drivers/video/backlight/Kconfig
+++ b/drivers/video/backlight/Kconfig
@@ -289,6 +289,14 @@ config BACKLIGHT_QCOM_WLED
 	  If you have the Qualcomm PMIC, say Y to enable a driver for the
 	  WLED block. Currently it supports PM8941 and PMI8998.
 
+config BACKLIGHT_RT4831
+	tristate "Richtek RT4831 Backlight Driver"
+	depends on MFD_RT4831
+	help
+	  This enables support for Richtek RT4831 Backlight driver.
+	  It's commonly used to drive the display WLED. There're four channels
+	  inisde, and each channel can provide up to 30mA current.
+
 config BACKLIGHT_SAHARA
 	tristate "Tabletkiosk Sahara Touch-iT Backlight Driver"
 	depends on X86
diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlight/Makefile
index 685f3f1..cae2c83 100644
--- a/drivers/video/backlight/Makefile
+++ b/drivers/video/backlight/Makefile
@@ -49,6 +49,7 @@ obj-$(CONFIG_BACKLIGHT_PANDORA)		+= pandora_bl.o
 obj-$(CONFIG_BACKLIGHT_PCF50633)	+= pcf50633-backlight.o
 obj-$(CONFIG_BACKLIGHT_PWM)		+= pwm_bl.o
 obj-$(CONFIG_BACKLIGHT_QCOM_WLED)	+= qcom-wled.o
+obj-$(CONFIG_BACKLIGHT_RT4831)		+= rt4831-backlight.o
 obj-$(CONFIG_BACKLIGHT_SAHARA)		+= kb3886_bl.o
 obj-$(CONFIG_BACKLIGHT_SKY81452)	+= sky81452-backlight.o
 obj-$(CONFIG_BACKLIGHT_TOSA)		+= tosa_bl.o
diff --git a/drivers/video/backlight/rt4831-backlight.c b/drivers/video/backlight/rt4831-backlight.c
new file mode 100644
index 00000000..42155c7
--- /dev/null
+++ b/drivers/video/backlight/rt4831-backlight.c
@@ -0,0 +1,203 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <dt-bindings/leds/rt4831-backlight.h>
+#include <linux/backlight.h>
+#include <linux/bitops.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+
+#define RT4831_REG_BLCFG	0x02
+#define RT4831_REG_BLDIML	0x04
+#define RT4831_REG_ENABLE	0x08
+
+#define RT4831_BLMAX_BRIGHTNESS	2048
+
+#define RT4831_BLOVP_MASK	GENMASK(7, 5)
+#define RT4831_BLOVP_SHIFT	5
+#define RT4831_BLPWMEN_MASK	BIT(0)
+#define RT4831_BLEN_MASK	BIT(4)
+#define RT4831_BLCH_MASK	GENMASK(3, 0)
+#define RT4831_BLDIML_MASK	GENMASK(2, 0)
+#define RT4831_BLDIMH_MASK	GENMASK(10, 3)
+#define RT4831_BLDIMH_SHIFT	3
+
+struct rt4831_priv {
+	struct device *dev;
+	struct regmap *regmap;
+	struct backlight_device *bl;
+};
+
+static int rt4831_bl_update_status(struct backlight_device *bl_dev)
+{
+	struct rt4831_priv *priv = bl_get_data(bl_dev);
+	int brightness = backlight_get_brightness(bl_dev);
+	unsigned int enable = brightness ? RT4831_BLEN_MASK : 0;
+	u8 v[2];
+	int ret;
+
+	if (brightness) {
+		v[0] = (brightness - 1) & RT4831_BLDIML_MASK;
+		v[1] = ((brightness - 1) & RT4831_BLDIMH_MASK) >> RT4831_BLDIMH_SHIFT;
+
+		ret = regmap_raw_write(priv->regmap, RT4831_REG_BLDIML, v, sizeof(v));
+		if (ret)
+			return ret;
+	}
+
+	return regmap_update_bits(priv->regmap, RT4831_REG_ENABLE, RT4831_BLEN_MASK, enable);
+
+}
+
+static int rt4831_bl_get_brightness(struct backlight_device *bl_dev)
+{
+	struct rt4831_priv *priv = bl_get_data(bl_dev);
+	unsigned int val;
+	u8 v[2];
+	int ret;
+
+	ret = regmap_read(priv->regmap, RT4831_REG_ENABLE, &val);
+	if (ret)
+		return ret;
+
+	if (!(val & RT4831_BLEN_MASK))
+		return 0;
+
+	ret = regmap_raw_read(priv->regmap, RT4831_REG_BLDIML, v, sizeof(v));
+	if (ret)
+		return ret;
+
+	ret = (v[1] << RT4831_BLDIMH_SHIFT) + (v[0] & RT4831_BLDIML_MASK) + 1;
+
+	return ret;
+}
+
+static const struct backlight_ops rt4831_bl_ops = {
+	.options = BL_CORE_SUSPENDRESUME,
+	.update_status = rt4831_bl_update_status,
+	.get_brightness = rt4831_bl_get_brightness,
+};
+
+static int rt4831_parse_backlight_properties(struct rt4831_priv *priv,
+					     struct backlight_properties *bl_props)
+{
+	struct device *dev = priv->dev;
+	u8 propval;
+	u32 brightness;
+	unsigned int val = 0;
+	int ret;
+
+	/* common properties */
+	ret = device_property_read_u32(dev, "max-brightness", &brightness);
+	if (ret)
+		brightness = RT4831_BLMAX_BRIGHTNESS;
+
+	bl_props->max_brightness = min_t(u32, brightness, RT4831_BLMAX_BRIGHTNESS);
+
+	ret = device_property_read_u32(dev, "default-brightness", &brightness);
+	if (ret)
+		brightness = bl_props->max_brightness;
+
+	bl_props->brightness = min_t(u32, brightness, bl_props->max_brightness);
+
+	/* vendor properties */
+	if (device_property_read_bool(dev, "richtek,pwm-enable"))
+		val = RT4831_BLPWMEN_MASK;
+
+	ret = regmap_update_bits(priv->regmap, RT4831_REG_BLCFG, RT4831_BLPWMEN_MASK, val);
+	if (ret)
+		return ret;
+
+	ret = device_property_read_u8(dev, "richtek,bled-ovp-sel", &propval);
+	if (ret)
+		propval = RT4831_BLOVPLVL_21V;
+
+	propval = min_t(u8, propval, RT4831_BLOVPLVL_29V);
+	ret = regmap_update_bits(priv->regmap, RT4831_REG_BLCFG, RT4831_BLOVP_MASK,
+				 propval << RT4831_BLOVP_SHIFT);
+	if (ret)
+		return ret;
+
+	ret = device_property_read_u8(dev, "richtek,channel-use", &propval);
+	if (ret) {
+		dev_err(dev, "richtek,channel-use DT property missing\n");
+		return ret;
+	}
+
+	if (!(propval & RT4831_BLCH_MASK)) {
+		dev_err(dev, "No channel specified\n");
+		return -EINVAL;
+	}
+
+	return regmap_update_bits(priv->regmap, RT4831_REG_ENABLE, RT4831_BLCH_MASK, propval);
+}
+
+static int rt4831_bl_probe(struct platform_device *pdev)
+{
+	struct rt4831_priv *priv;
+	struct backlight_properties bl_props = { .type = BACKLIGHT_RAW,
+						 .scale = BACKLIGHT_SCALE_LINEAR };
+	int ret;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->dev = &pdev->dev;
+
+	priv->regmap = dev_get_regmap(pdev->dev.parent, NULL);
+	if (!priv->regmap) {
+		dev_err(&pdev->dev, "Failed to init regmap\n");
+		return -ENODEV;
+	}
+
+	ret = rt4831_parse_backlight_properties(priv, &bl_props);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to parse backlight properties\n");
+		return ret;
+	}
+
+	priv->bl = devm_backlight_device_register(&pdev->dev, pdev->name, &pdev->dev, priv,
+						  &rt4831_bl_ops, &bl_props);
+	if (IS_ERR(priv->bl)) {
+		dev_err(&pdev->dev, "Failed to register backlight\n");
+		return PTR_ERR(priv->bl);
+	}
+
+	backlight_update_status(priv->bl);
+	platform_set_drvdata(pdev, priv);
+
+	return 0;
+}
+
+static int rt4831_bl_remove(struct platform_device *pdev)
+{
+	struct rt4831_priv *priv = platform_get_drvdata(pdev);
+	struct backlight_device *bl_dev = priv->bl;
+
+	bl_dev->props.brightness = 0;
+	backlight_update_status(priv->bl);
+
+	return 0;
+}
+
+static const struct of_device_id __maybe_unused rt4831_bl_of_match[] = {
+	{ .compatible = "richtek,rt4831-backlight", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, rt4831_bl_of_match);
+
+static struct platform_driver rt4831_bl_driver = {
+	.driver = {
+		.name = "rt4831-backlight",
+		.of_match_table = rt4831_bl_of_match,
+	},
+	.probe = rt4831_bl_probe,
+	.remove = rt4831_bl_remove,
+};
+module_platform_driver(rt4831_bl_driver);
+
+MODULE_AUTHOR("ChiYuan Huang <cy_huang@richtek.com>");
+MODULE_LICENSE("GPL v2");
-- 
2.7.4

