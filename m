Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE39420AFA5
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jun 2020 12:25:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 767B56EC62;
	Fri, 26 Jun 2020 10:25:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D0C86EC62
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 10:25:05 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id 9so9774177ljv.5
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 03:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TNjCAgKAbk+msi5pmTXJi15eJti80Wxw8XhtgKoiBWg=;
 b=tLZDmBeJsuQfZeiznHfGuvEM0wNsbctBKmcqcSBeZqUe4r0xz1l/F4HAr7tYjHHv9E
 I9OGWGPh+kP3mbl8AIc3SSBrRtNGH8OJ4aHGgOe1rcq/u0LS94z/nvcdD+fF+j7ry210
 vW3nw+JAKZPHSdK9utUZKsErRIh03iG0+xyRU6dugYGdxeb46nOP+JmzuGMc9KPYPiYC
 +g+Dg881dWSd4GNjgIkqRXQgj+N7WaKjA5z8A6vgjfeEEAO3JrpvYTGdm7Fl6zAVSJgr
 t+JfJ0V7xxz/sZYAneWFaYiOIwPiQ17jfvUGUFWbrcgRGNqDxApj9xJe+JpN6L9jsG8Y
 8XCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TNjCAgKAbk+msi5pmTXJi15eJti80Wxw8XhtgKoiBWg=;
 b=aqlpz3OIknYhh0it9ChCqnoPDOQRcsVoSbd5khWxbSSZ3nnNZ/GsewpTqSUt3dyTUi
 FT5k/dkXg0Iw2r8N2olGRe5paLPpLwiu9JsVVUBYA5MSulpk7Vc4Il3+Gzzc9O9hA0pU
 PcZZzasoye789gmKCxK8B/uyeEeA75R1ylQkXt9H/xIzI71rasCnLM4Z5Covcyy0lFXT
 LN9AnCNvolFCZUPkU3nMJMFxgTBk5Bki5cGGXfYc+gEZT6lV+DR7P6Us3lv/oxEQWMix
 fXyhhsOFpIocEQ21AT5NokiTlvjS8VRDt8dGGBT6hx9wVYf1WBUYT2+xVZkkGhpsrH6G
 3TmA==
X-Gm-Message-State: AOAM533JNjzHMs/of7JsQL/fHVcfQgcoHtz8uGitLnGv/RWc/h+pcc/1
 CLpXJmtdjZQIgQ7sZElSdGHzxQ==
X-Google-Smtp-Source: ABdhPJwaYiLKuuBzVDCK7oQNxoQ4n+lIDMMtQLPJROPMkS3yl5UnhYwhSt9rkmvfXLX95ial2uwtzQ==
X-Received: by 2002:a2e:b8c2:: with SMTP id s2mr1179823ljp.368.1593167103481; 
 Fri, 26 Jun 2020 03:25:03 -0700 (PDT)
Received: from genomnajs.lan
 (c-d63ee155.152980-0-69706f6e6c79.bbcust.telenor.se. [85.225.62.214])
 by smtp.gmail.com with ESMTPSA id i8sm6311559lja.18.2020.06.26.03.25.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2020 03:25:02 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH] backlight: Delete the OT200 backlight driver
Date: Fri, 26 Jun 2020 12:25:00 +0200
Message-Id: <20200626102500.292230-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.25.4
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

This driver has no in-kernel users. The device can only be populated
by board files since it does not support device tree nor ACPI,
and nothing in the kernel creates a device named "ot200-backlight".

This driver has been in the kernel since 2012. If it is used by
out-of-tree code that code should have been upstreamed by now,
it's been 8 years.

It uses the idiomatic forked GPIO of the CS5535 which combines
pin control and GPIO into its private custom interface, which
causes me a headache because that is not how we do things these
days: we creates separate pin control and GPIO drivers.

Delete this unused driver.

Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/video/backlight/Kconfig    |   7 --
 drivers/video/backlight/Makefile   |   1 -
 drivers/video/backlight/ot200_bl.c | 162 -----------------------------
 3 files changed, 170 deletions(-)
 delete mode 100644 drivers/video/backlight/ot200_bl.c

diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
index 7d22d7377606..95c546cc8774 100644
--- a/drivers/video/backlight/Kconfig
+++ b/drivers/video/backlight/Kconfig
@@ -386,13 +386,6 @@ config BACKLIGHT_LP8788
 	help
 	  This supports TI LP8788 backlight driver.
 
-config BACKLIGHT_OT200
-	tristate "Backlight driver for ot200 visualisation device"
-	depends on CS5535_MFGPT && GPIO_CS5535
-	help
-	  To compile this driver as a module, choose M here: the module will be
-	  called ot200_bl.
-
 config BACKLIGHT_PANDORA
 	tristate "Backlight driver for Pandora console"
 	depends on TWL4030_CORE
diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlight/Makefile
index 0c1a1524627a..2072d21b60f7 100644
--- a/drivers/video/backlight/Makefile
+++ b/drivers/video/backlight/Makefile
@@ -45,7 +45,6 @@ obj-$(CONFIG_BACKLIGHT_LP8788)		+= lp8788_bl.o
 obj-$(CONFIG_BACKLIGHT_LV5207LP)	+= lv5207lp.o
 obj-$(CONFIG_BACKLIGHT_MAX8925)		+= max8925_bl.o
 obj-$(CONFIG_BACKLIGHT_OMAP1)		+= omap1_bl.o
-obj-$(CONFIG_BACKLIGHT_OT200)		+= ot200_bl.o
 obj-$(CONFIG_BACKLIGHT_PANDORA)		+= pandora_bl.o
 obj-$(CONFIG_BACKLIGHT_PCF50633)	+= pcf50633-backlight.o
 obj-$(CONFIG_BACKLIGHT_PWM)		+= pwm_bl.o
diff --git a/drivers/video/backlight/ot200_bl.c b/drivers/video/backlight/ot200_bl.c
deleted file mode 100644
index 23ee7106c72a..000000000000
--- a/drivers/video/backlight/ot200_bl.c
+++ /dev/null
@@ -1,162 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (C) 2012 Bachmann electronic GmbH
- *	Christian Gmeiner <christian.gmeiner@gmail.com>
- *
- * Backlight driver for ot200 visualisation device from
- * Bachmann electronic GmbH.
- */
-
-#include <linux/module.h>
-#include <linux/fb.h>
-#include <linux/backlight.h>
-#include <linux/gpio.h>
-#include <linux/platform_device.h>
-#include <linux/cs5535.h>
-
-static struct cs5535_mfgpt_timer *pwm_timer;
-
-/* this array defines the mapping of brightness in % to pwm frequency */
-static const u8 dim_table[101] = {0, 0, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2,
-				  2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 4, 4, 4, 4,
-				  4, 5, 5, 5, 5, 6, 6, 6, 7, 7, 7, 8, 8, 9, 9,
-				  10, 10, 11, 11, 12, 12, 13, 14, 15, 15, 16,
-				  17, 18, 19, 20, 21, 22, 23, 24, 26, 27, 28,
-				  30, 31, 33, 35, 37, 39, 41, 43, 45, 47, 50,
-				  53, 55, 58, 61, 65, 68, 72, 75, 79, 84, 88,
-				  93, 97, 103, 108, 114, 120, 126, 133, 140,
-				  147, 155, 163};
-
-struct ot200_backlight_data {
-	int current_brightness;
-};
-
-#define GPIO_DIMM	27
-#define SCALE		1
-#define CMP1MODE	0x2	/* compare on GE; output high on compare
-				 * greater than or equal */
-#define PWM_SETUP	(SCALE | CMP1MODE << 6 | MFGPT_SETUP_CNTEN)
-#define MAX_COMP2	163
-
-static int ot200_backlight_update_status(struct backlight_device *bl)
-{
-	struct ot200_backlight_data *data = bl_get_data(bl);
-	int brightness = bl->props.brightness;
-
-	if (bl->props.state & BL_CORE_FBBLANK)
-		brightness = 0;
-
-	/* enable or disable PWM timer */
-	if (brightness == 0)
-		cs5535_mfgpt_write(pwm_timer, MFGPT_REG_SETUP, 0);
-	else if (data->current_brightness == 0) {
-		cs5535_mfgpt_write(pwm_timer, MFGPT_REG_COUNTER, 0);
-		cs5535_mfgpt_write(pwm_timer, MFGPT_REG_SETUP,
-			MFGPT_SETUP_CNTEN);
-	}
-
-	/* apply new brightness value */
-	cs5535_mfgpt_write(pwm_timer, MFGPT_REG_CMP1,
-		MAX_COMP2 - dim_table[brightness]);
-	data->current_brightness = brightness;
-
-	return 0;
-}
-
-static int ot200_backlight_get_brightness(struct backlight_device *bl)
-{
-	struct ot200_backlight_data *data = bl_get_data(bl);
-	return data->current_brightness;
-}
-
-static const struct backlight_ops ot200_backlight_ops = {
-	.update_status	= ot200_backlight_update_status,
-	.get_brightness	= ot200_backlight_get_brightness,
-};
-
-static int ot200_backlight_probe(struct platform_device *pdev)
-{
-	struct backlight_device *bl;
-	struct ot200_backlight_data *data;
-	struct backlight_properties props;
-	int retval = 0;
-
-	/* request gpio */
-	if (devm_gpio_request(&pdev->dev, GPIO_DIMM,
-				"ot200 backlight dimmer") < 0) {
-		dev_err(&pdev->dev, "failed to request GPIO %d\n", GPIO_DIMM);
-		return -ENODEV;
-	}
-
-	/* request timer */
-	pwm_timer = cs5535_mfgpt_alloc_timer(7, MFGPT_DOMAIN_ANY);
-	if (!pwm_timer) {
-		dev_err(&pdev->dev, "MFGPT 7 not available\n");
-		return -ENODEV;
-	}
-
-	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
-	if (!data) {
-		retval = -ENOMEM;
-		goto error_devm_kzalloc;
-	}
-
-	/* setup gpio */
-	cs5535_gpio_set(GPIO_DIMM, GPIO_OUTPUT_ENABLE);
-	cs5535_gpio_set(GPIO_DIMM, GPIO_OUTPUT_AUX1);
-
-	/* setup timer */
-	cs5535_mfgpt_write(pwm_timer, MFGPT_REG_CMP1, 0);
-	cs5535_mfgpt_write(pwm_timer, MFGPT_REG_CMP2, MAX_COMP2);
-	cs5535_mfgpt_write(pwm_timer, MFGPT_REG_SETUP, PWM_SETUP);
-
-	data->current_brightness = 100;
-	props.max_brightness = 100;
-	props.brightness = 100;
-	props.type = BACKLIGHT_RAW;
-
-	bl = devm_backlight_device_register(&pdev->dev, dev_name(&pdev->dev),
-					&pdev->dev, data, &ot200_backlight_ops,
-					&props);
-	if (IS_ERR(bl)) {
-		dev_err(&pdev->dev, "failed to register backlight\n");
-		retval = PTR_ERR(bl);
-		goto error_devm_kzalloc;
-	}
-
-	platform_set_drvdata(pdev, bl);
-
-	return 0;
-
-error_devm_kzalloc:
-	cs5535_mfgpt_free_timer(pwm_timer);
-	return retval;
-}
-
-static int ot200_backlight_remove(struct platform_device *pdev)
-{
-	/* on module unload set brightness to 100% */
-	cs5535_mfgpt_write(pwm_timer, MFGPT_REG_COUNTER, 0);
-	cs5535_mfgpt_write(pwm_timer, MFGPT_REG_SETUP, MFGPT_SETUP_CNTEN);
-	cs5535_mfgpt_write(pwm_timer, MFGPT_REG_CMP1,
-		MAX_COMP2 - dim_table[100]);
-
-	cs5535_mfgpt_free_timer(pwm_timer);
-
-	return 0;
-}
-
-static struct platform_driver ot200_backlight_driver = {
-	.driver		= {
-		.name	= "ot200-backlight",
-	},
-	.probe		= ot200_backlight_probe,
-	.remove		= ot200_backlight_remove,
-};
-
-module_platform_driver(ot200_backlight_driver);
-
-MODULE_DESCRIPTION("backlight driver for ot200 visualisation device");
-MODULE_AUTHOR("Christian Gmeiner <christian.gmeiner@gmail.com>");
-MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:ot200-backlight");
-- 
2.25.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
