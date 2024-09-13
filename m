Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 281D1978376
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 17:08:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96E9610ED2C;
	Fri, 13 Sep 2024 15:08:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Iq5y4L50";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1E6910ED2C
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 15:08:48 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-5c4146c7d5dso1242674a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 08:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726240127; x=1726844927; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ahWTGZu8xtSURP9GzlzlPy1xp3tDRlgc6c0AKCVoexk=;
 b=Iq5y4L50nT7EIxi4+y50FYOuU/YzWJVW1JsQHx7zyNXodicN5JgTMtZ4uoIzRE1pTr
 1ITP+D9HG9MbWDGEYATz9wH02HasQtmZWqs2EXSlok4+b5WO6Fji3TBTFr+h1F2zp0aF
 FK5MKpRkVC1RFtINywFigNt+sSZIGTALbrdz3K0+xmd81MAfcTWSIXrM7MJ9w595tjBr
 X9dbKPMhnFqExWjav2Rl3taCbhtUlUyeIYgYTI6ibPY7VFM10vXwoMNDU0E/3y6ZBCMG
 Qzo34lbakkUY+K1eSRcFk9AR+9y3rV/fy+c48uExJDrV1F/hckqchOkRlGza792YIHwP
 IuEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726240127; x=1726844927;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ahWTGZu8xtSURP9GzlzlPy1xp3tDRlgc6c0AKCVoexk=;
 b=cnoBas1jQbxTeVwtStjYmTlLkqbpMqFRZOVRxVDFnUXO4WWd91qt9UjMasohrCYprI
 09ykku5OdccOvo8JA5S+1mwad/VC3ymEGL9IlUxUf2WYHzALgZ6sr3Iec1q1RTtHsGHH
 mXH73y3yOxkAx2l3amCJ7r40xNsyKoeO4THmfp5EySilZ/ZLvk0VnjwuMCt1oMUgwfq/
 Jq7sn/m7qu5hLJ5ICQdv++vjIYyRMLNDWSIQoULMSsx7BKQ8gaSBcS8UhAMKbs5BEw+d
 pvgKa3tABty90JTmZnwkOdagcjhuNuW/0m+s4m4NCSQiHNzbi8ep6tezqdy8GroP28Z4
 e7PQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXU5xqS8qBqpHB4sn6jWhMlmAUl8WtOYrDDku3wP63Y07nJkTr0wVjOqFKReIluUgdHscxSg9bCY9E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxGEQ2U1E3nDQbvHPGNjg7lNbJc86yvDxIYHY/JjZMXq7VVxOUu
 EEbPYKqf5+NelaX/9Z/7F4hRHZUeB+ZHP+zsHlRI870dWKlnDDop
X-Google-Smtp-Source: AGHT+IGRt5AFeS3wRtD8rPkJeKt6sAW3sCB0CjqoyYMhFWR7JyO6UcA2Os0fgdDTdR2POOYyiFyO9w==
X-Received: by 2002:a05:6402:909:b0:5c0:ac1d:b970 with SMTP id
 4fb4d7f45d1cf-5c41e1b52f7mr2990485a12.32.1726240126941; 
 Fri, 13 Sep 2024 08:08:46 -0700 (PDT)
Received: from [127.0.1.1] ([178.127.153.210])
 by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd523b4sm7774318a12.51.2024.09.13.08.08.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2024 08:08:46 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Fri, 13 Sep 2024 18:07:56 +0300
Subject: [PATCH v4 13/27] leds: max77705: Add LEDs support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240913-starqltechn_integration_upstream-v4-13-2d2efd5c5877@gmail.com>
References: <20240913-starqltechn_integration_upstream-v4-0-2d2efd5c5877@gmail.com>
In-Reply-To: <20240913-starqltechn_integration_upstream-v4-0-2d2efd5c5877@gmail.com>
To: Sebastian Reichel <sre@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@ucw.cz>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, 
 Simona Vetter <simona@ffwll.ch>, cros-qcom-dts-watchers@chromium.org, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726240085; l=6747;
 i=dsankouski@gmail.com; s=20240618; h=from:subject:message-id;
 bh=M+OsxN2/WpgrY2WuTXnjhSOeH+HsWUOEWmKXapd+uZI=;
 b=+XwhRo/u1iXBMs1CErWIPnhwhGTnk/d3aSSfPiOQyIYSkQLPEB5gIILypvPWqnaNXnD/p5ESj
 M6dLBFDJFlJAcCJjrrEFO3ntk+QAydPTF7qib1WS1mtz6+olo/E6rCE
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=6pMMVVDDReSiRgPCbMOUauN5nS3ty4Sf5b7a2gi4x0M=
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

This adds basic support for LEDs for the max77705 PMIC.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>

---
Changes in v4:
- inline BLINK_(ON|OFF) macro
- remove camel case
- drop backwards compatibility(new driver)
- drop module alias
---
 MAINTAINERS                  |   1 +
 drivers/leds/Kconfig         |   6 ++
 drivers/leds/Makefile        |   1 +
 drivers/leds/leds-max77705.c | 158 +++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 166 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 716e66bb7982..444cc855a01e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14073,6 +14073,7 @@ F:	drivers/*/max14577*.c
 F:	drivers/*/max77686*.c
 F:	drivers/*/max77693*.c
 F:	drivers/*/max77705*.c
+F:	drivers/leds/leds-max77705.c
 F:	drivers/clk/clk-max77686.c
 F:	drivers/extcon/extcon-max14577.c
 F:	drivers/extcon/extcon-max77693.c
diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index b784bb74a837..292f9f1a237e 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -753,6 +753,12 @@ config LEDS_MAX77650
 	help
 	  LEDs driver for MAX77650 family of PMICs from Maxim Integrated.
 
+config LEDS_MAX77705
+	tristate "LED support for Maxim MAX77705 RGB"
+	depends on MFD_MAX77705 && LEDS_CLASS && I2C
+	help
+	  LED driver for MAX77705 MFD chip from Maxim Integrated.
+
 config LEDS_MAX8997
 	tristate "LED support for MAX8997 PMIC"
 	depends on LEDS_CLASS && MFD_MAX8997
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index 18afbb5a23ee..096bf244527d 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -60,6 +60,7 @@ obj-$(CONFIG_LEDS_LP8860)		+= leds-lp8860.o
 obj-$(CONFIG_LEDS_LT3593)		+= leds-lt3593.o
 obj-$(CONFIG_LEDS_MAX5970)		+= leds-max5970.o
 obj-$(CONFIG_LEDS_MAX77650)		+= leds-max77650.o
+obj-$(CONFIG_LEDS_MAX77705)		+= leds-max77705.o
 obj-$(CONFIG_LEDS_MAX8997)		+= leds-max8997.o
 obj-$(CONFIG_LEDS_MC13783)		+= leds-mc13783.o
 obj-$(CONFIG_LEDS_MENF21BMC)		+= leds-menf21bmc.o
diff --git a/drivers/leds/leds-max77705.c b/drivers/leds/leds-max77705.c
new file mode 100644
index 000000000000..6190c010b039
--- /dev/null
+++ b/drivers/leds/leds-max77705.c
@@ -0,0 +1,158 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Based on leds-max77650 driver:
+//		Copyright (C) 2018 BayLibre SAS
+//		Author: Bartosz Golaszewski <bgolaszewski@baylibre.com>
+//
+// LED driver for MAXIM 77705 MFD.
+// Copyright (C) 2024 Dzmitry Sankouski <dsankouski@gmail.org>
+
+#include <linux/i2c.h>
+#include <linux/leds.h>
+#include <linux/mfd/max77705-private.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#define MAX77705_LED_NUM_LEDS		4
+#define MAX77705_LED_EN_MASK		GENMASK(1, 0)
+#define MAX77705_LED_MAX_BRIGHTNESS	0xff
+
+struct max77705_led {
+	struct led_classdev cdev;
+	struct regmap *regmap;
+	unsigned int en_shift;
+	unsigned int reg_brightness;
+};
+
+static struct max77705_led *max77705_to_led(struct led_classdev *cdev)
+{
+	return container_of(cdev, struct max77705_led, cdev);
+}
+
+static int max77705_rgb_blink(struct led_classdev *cdev,
+				unsigned long *delay_on,
+				unsigned long *delay_off)
+{
+	struct max77705_led *led = max77705_to_led(cdev);
+	int value, on_value, off_value;
+
+	on_value = (((*delay_on < 100) ? 0 :
+			(*delay_on < 500) ? *delay_on/100 - 1 :
+			(*delay_on < 3250) ? (*delay_on - 500) / 250 + 4 : 15) << 4);
+	off_value = ((*delay_off < 1) ? 0x00 :
+			(*delay_off < 500) ? 0x01 :
+			(*delay_off < 5000) ? *delay_off / 500 :
+			(*delay_off < 8000) ? (*delay_off - 5000) / 1000 + 10 :
+			(*delay_off < 12000) ? (*delay_off - 8000) / 2000 + 13 : 15);
+	value = on_value | off_value;
+	return regmap_write(led->regmap, MAX77705_RGBLED_REG_LEDBLNK, value);
+}
+
+static int max77705_led_brightness_set(struct led_classdev *cdev,
+					enum led_brightness brightness)
+{
+	struct max77705_led *led = max77705_to_led(cdev);
+	int ret;
+	unsigned long blink_default = 0;
+
+	if (brightness == LED_OFF) {
+		// Flash OFF
+		ret = regmap_update_bits(led->regmap,
+					MAX77705_RGBLED_REG_LEDEN,
+					MAX77705_LED_EN_MASK << led->en_shift, 0);
+		max77705_rgb_blink(cdev, &blink_default, &blink_default);
+	} else {
+		// Set current
+		ret = regmap_write(led->regmap,
+				   led->reg_brightness, brightness);
+		if (ret < 0)
+			return ret;
+
+		ret = regmap_update_bits(led->regmap,
+					MAX77705_RGBLED_REG_LEDEN, LED_ON << led->en_shift,
+					MAX77705_LED_EN_MASK << led->en_shift);
+	}
+
+	return ret;
+}
+
+static int max77705_led_probe(struct platform_device *pdev)
+{
+	struct fwnode_handle *child;
+	struct max77705_led *leds, *led;
+	struct device *dev;
+	struct regmap *map;
+	int rv, num_leds;
+	u32 reg;
+
+	dev = &pdev->dev;
+
+	leds = devm_kcalloc(dev, sizeof(*leds),
+				MAX77705_LED_NUM_LEDS, GFP_KERNEL);
+	if (!leds)
+		return -ENOMEM;
+
+	map = dev_get_regmap(dev->parent, NULL);
+	if (!map)
+		return -ENODEV;
+
+	num_leds = device_get_child_node_count(dev);
+	if (!num_leds || num_leds > MAX77705_LED_NUM_LEDS)
+		return -ENODEV;
+
+	device_for_each_child_node(dev, child) {
+		struct led_init_data init_data = {};
+
+		rv = fwnode_property_read_u32(child, "reg", &reg);
+		if (rv || reg >= MAX77705_LED_NUM_LEDS) {
+			rv = -EINVAL;
+			goto err_node_put;
+		}
+
+		led = &leds[reg];
+		led->regmap = map;
+		led->reg_brightness = MAX77705_RGBLED_REG_LED0BRT + reg;
+		led->en_shift = 2 * reg;
+		led->cdev.brightness_set_blocking = max77705_led_brightness_set;
+		led->cdev.blink_set = max77705_rgb_blink;
+		led->cdev.max_brightness = MAX77705_LED_MAX_BRIGHTNESS;
+
+		init_data.fwnode = child;
+		init_data.devicename = "max77705";
+
+		rv = devm_led_classdev_register_ext(dev, &led->cdev,
+							&init_data);
+		if (rv)
+			goto err_node_put;
+
+		rv = max77705_led_brightness_set(&led->cdev, LED_OFF);
+		if (rv)
+			goto err_node_put;
+	}
+
+	return 0;
+err_node_put:
+	fwnode_handle_put(child);
+	return rv;
+}
+
+static const struct of_device_id max77705_led_of_match[] = {
+	{ .compatible = "maxim,max77705-led" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, max77705_led_of_match);
+
+static struct platform_driver max77705_led_driver = {
+	.driver = {
+		.name = "max77705-led",
+		.of_match_table = max77705_led_of_match,
+	},
+	.probe = max77705_led_probe,
+};
+module_platform_driver(max77705_led_driver);
+
+MODULE_DESCRIPTION("MAXIM 77705 LED driver");
+MODULE_AUTHOR("Bartosz Golaszewski <bgolaszewski@baylibre.com>");
+MODULE_AUTHOR("Dzmitry Sankouski <dsankouski@gmail.com>");
+MODULE_LICENSE("GPL");

-- 
2.39.2

