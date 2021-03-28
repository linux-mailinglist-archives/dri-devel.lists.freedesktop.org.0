Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C92934BCDF
	for <lists+dri-devel@lfdr.de>; Sun, 28 Mar 2021 17:24:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 858206E110;
	Sun, 28 Mar 2021 15:24:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68F6A6E110
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 15:24:37 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id t140so482664pgb.13
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 08:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=wahB+ST37szvPFRU+boN8nz2ZNmJPKmTJBK2TrgN1aU=;
 b=TNxI9reQHEiVIq8/H7vLUbhG8UENn9JZxG+j2VD3/fOSf9O32cJvFl1MRQ58nDFtgz
 kUqhlBzSfspSHMP0JbLSmC/DeB/BTmV4zo0HzLvSdnWOOXkyIH+UHNXNLlVjxdxGGa+R
 Yfq26/Fmjb36XJX9sK0Haokvs9Rfl+zXze/rIv6Pn//nYFmHKRRS22trKICy46+Qh9eG
 VKaEaw9bWZoHCQcREWCkb4LncCYGF0o5xJ2a1NP/JaRC0sPXKcH955bS3aQHYr0QbIVC
 mtut9YbAWepPPN8Z2wC2C4el9MMrAKnolo6xLFcxUyn8lTVdWrCYcg+m5xTjh9jgA691
 miGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=wahB+ST37szvPFRU+boN8nz2ZNmJPKmTJBK2TrgN1aU=;
 b=la61OvQnF8M1y630IzFS9rqt9hvPjnD08k59OXsj5LQeYgsFMQzbB+LNS6i0JW3qUh
 NyItwJFMww6CyQWgRy4bU+nq3xcY4zlFh0fMVbXwIqQgbDvTCVxWRHD/O+U3LCQSTmV4
 miHDVSpbCWT/Yr5i/3M1hqqzfcLPLb0ObGUpVWgoH6sOGYRI49d3mHp9/NG1fiH6jOW3
 4LVfqCx5ej7tgykF7epi28QM7F3tT9Ro4sQJN573MTqf2zT62Q4k3yUuZjitsUdJeRnA
 SsEpaT07kQwfyCZsUP9HMZKKx2gpf0MODtP5wMW9+e5EFxts+5sjPS91Yy4dIqvfSecQ
 h3Cg==
X-Gm-Message-State: AOAM532KuFoHylzbpszGibb65aqqQs5/30sipsqX6zBm3SAGrzYeedKu
 yhZ3fJVarAwqxRV6nTd/1TU=
X-Google-Smtp-Source: ABdhPJwF9YGxP2Mt/s66edav9McOh01pvWN33OaGFOjuAyXrl92DJ+k+ogGuDVK9VYazaTpU/S1TJA==
X-Received: by 2002:aa7:9493:0:b029:1f8:a493:b747 with SMTP id
 z19-20020aa794930000b02901f8a493b747mr22173975pfk.41.1616945076902; 
 Sun, 28 Mar 2021 08:24:36 -0700 (PDT)
Received: from localhost.localdomain (1-171-1-114.dynamic-ip.hinet.net.
 [1.171.1.114])
 by smtp.gmail.com with ESMTPSA id j188sm14651174pfd.64.2021.03.28.08.24.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 28 Mar 2021 08:24:36 -0700 (PDT)
From: cy_huang <u0084500@gmail.com>
To: lee.jones@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com, b.zolnierkie@samsung.com
Subject: [PATCH v6 4/4] backlight: rt4831: Adds support for Richtek RT4831
 backlight
Date: Sun, 28 Mar 2021 23:24:19 +0800
Message-Id: <1616945059-8718-4-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1616945059-8718-1-git-send-email-u0084500@gmail.com>
References: <1616945059-8718-1-git-send-email-u0084500@gmail.com>
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
Cc: ChiYuan Huang <cy_huang@richtek.com>, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: ChiYuan Huang <cy_huang@richtek.com>

Adds support for Richtek RT4831 backlight.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
since v6
- Fix Kconfig typo.
- Remove internal mutex lock.
- Add the prefix for max brightness.
- rename init_device_properties to parse_backlight_properties.
- Remove some warning message if default value is adopted.
- Add backlight property scale to LINEAR mapping.
- Fix regmap get to check NULL not IS_ERR.
---
 drivers/video/backlight/Kconfig            |   8 ++
 drivers/video/backlight/Makefile           |   1 +
 drivers/video/backlight/rt4831-backlight.c | 203 +++++++++++++++++++++++++++++
 3 files changed, 212 insertions(+)
 create mode 100644 drivers/video/backlight/rt4831-backlight.c

diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
index d83c87b..de96441 100644
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
+	  It's common used to drive the display WLED. There're four channels
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

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
