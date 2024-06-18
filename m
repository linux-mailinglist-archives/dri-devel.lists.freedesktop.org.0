Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D877590DD4C
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 22:22:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 023CE10E7A8;
	Tue, 18 Jun 2024 20:22:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UeiLeDAQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 877F410E0C3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 14:00:19 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-57a1fe6392eso7346860a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 07:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718719217; x=1719324017; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Iyl7EIOgIrVaZahoT7LEDslZvULejKLZ0v4aPQDoonI=;
 b=UeiLeDAQOgcIXrf1phpFgLNyolU+AEVfT/yhIHkonmBLgxp104VH0VQ47FWdibwDGf
 YMU3RO3nQErlWu+U7XHWkGzhjZupibctFBEDoBWGQtJOWaX+hXDk3EjHXR1aHiJwBMzW
 qePcYgVdv3q50s6xqetsH5aW/HsHnGtYf5fucsye5v5KByCl2IPqEvvrpiSKc2Adx8+D
 R/eEcc72WcL/eOPIPpIxO6KTBH903fSzTBlFWH/qU+E259DjMmL78IAO6g4qV83K8Y5c
 lhu7Z8EkTi33jAHc507p2fP1GmHh5hXVtY912tYzwADMwlr3noiJEsqVYtVTTnQ0wd66
 jFIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718719217; x=1719324017;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Iyl7EIOgIrVaZahoT7LEDslZvULejKLZ0v4aPQDoonI=;
 b=St8Pe5VU2irOxGpOLJTKoK3bXKC/LEGvCnIPjo4w8AsY9+dFU2hNg4XR9AufkkXQVz
 6F3XH47V/4yMXSlxXeTB5GjMmfbkL7OU+CjwRX/CB7cI0uR4yBm2b50izpp4KgKl8+IF
 eRBinGNzY01301pZzrQodpmmGBTNfgcF4a9dsn82ed0NK1JDVxkN3kBhhrQ6tg5vbR7C
 bBetg1F+CfebzT9YETVYA2QftuxUrRLIuQ3qDQtCvS9uRO4mQdaJPJFeSgg9+h4eW6N+
 ao71/+rKQa3gOU5AufJfps+oTmm1ufmRbemxI4BPK7SedKrZ3O3HPhnPbQ04yQt4wyAk
 oLMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXL6A6SGIepkroy40bBjDG3SPmbw6Lc7uZWo6V4n/NtrNU5aoSdhE6kg+werEXFTx4yRddO01R2PIGTlBEHL3/4eIChV9eog0q6GhkZxftR
X-Gm-Message-State: AOJu0Yya8iNSsSrwBQ9X9RH2V2D8cZS2PViA5XZk4s2/txjKvyFYsUCK
 ITr/ZiYcE63/28BJrJ9h1HujTqiCwowqxjqosHqe+2Sh68aDzWrOzTypymfx
X-Google-Smtp-Source: AGHT+IGGllCbRRfBvYmKtKXfQgz30xuR5BJBT8uIwbflUAozAyJ4/JF5SSTi5ZjGzFImDK2lcpqPHA==
X-Received: by 2002:a50:c346:0:b0:578:f472:d9d5 with SMTP id
 4fb4d7f45d1cf-57cbd906889mr7353992a12.37.1718719217184; 
 Tue, 18 Jun 2024 07:00:17 -0700 (PDT)
Received: from [127.0.1.1] (mm-167-232-122-178.mgts.dynamic.pppoe.byfly.by.
 [178.122.232.167]) by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-57cb72da156sm7731278a12.22.2024.06.18.07.00.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 07:00:16 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Tue, 18 Jun 2024 16:59:47 +0300
Subject: [PATCH v3 13/23] input: add max77705 haptic driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240618-starqltechn_integration_upstream-v3-13-e3f6662017ac@gmail.com>
References: <20240618-starqltechn_integration_upstream-v3-0-e3f6662017ac@gmail.com>
In-Reply-To: <20240618-starqltechn_integration_upstream-v3-0-e3f6662017ac@gmail.com>
To: Sebastian Reichel <sre@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@ucw.cz>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Chanwoo Choi <cw00.choi@samsung.com>, phone-devel@vger.kernel.org
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718719184; l=12244;
 i=dsankouski@gmail.com; s=20240618; h=from:subject:message-id;
 bh=/5IwQ99bQQRhP1wEuLRjxNnEs6zzgSHLcHa2YEf0U7U=;
 b=IwqH87QADreHlElJVBH5g4BbXvWQGNAdUcyW7w342IefcdtH3+/qzYsds1Feycq0cFdWX/lgJ
 hLq8aG1QBixAubL/2LUzHO+Svtbe1BLs23uvNyDAmy3jBOGBU0mNcYn
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=6pMMVVDDReSiRgPCbMOUauN5nS3ty4Sf5b7a2gi4x0M=
X-Mailman-Approved-At: Tue, 18 Jun 2024 20:22:03 +0000
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

Add support for haptic controller on MAX77705 Multifunction
device.

This driver supports external pwm and LRA (Linear Resonant Actuator) motor.
User can control the haptic device via force feedback framework.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
 drivers/input/misc/Kconfig           |  11 +
 drivers/input/misc/Makefile          |   1 +
 drivers/input/misc/max77705-haptic.c | 378 +++++++++++++++++++++++++++++++++++
 3 files changed, 390 insertions(+)

diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
index 6ba984d7f0b1..26f7b25a0b42 100644
--- a/drivers/input/misc/Kconfig
+++ b/drivers/input/misc/Kconfig
@@ -233,6 +233,17 @@ config INPUT_MAX77693_HAPTIC
 	  To compile this driver as module, choose M here: the
 	  module will be called max77693-haptic.
 
+config INPUT_MAX77705_HAPTIC
+	tristate "MAXIM MAX77705 haptic controller support"
+	depends on MFD_MAX77705 && PWM
+	select INPUT_FF_MEMLESS
+	help
+	  This option enables support for the haptic controller on
+	  MAXIM MAX77705 chip.
+
+	  To compile this driver as module, choose M here: the
+	  module will be called max77705-haptic.
+
 config INPUT_MAX8925_ONKEY
 	tristate "MAX8925 ONKEY support"
 	depends on MFD_MAX8925
diff --git a/drivers/input/misc/Makefile b/drivers/input/misc/Makefile
index 04296a4abe8e..4dea2720b757 100644
--- a/drivers/input/misc/Makefile
+++ b/drivers/input/misc/Makefile
@@ -51,6 +51,7 @@ obj-$(CONFIG_INPUT_KXTJ9)		+= kxtj9.o
 obj-$(CONFIG_INPUT_M68K_BEEP)		+= m68kspkr.o
 obj-$(CONFIG_INPUT_MAX77650_ONKEY)	+= max77650-onkey.o
 obj-$(CONFIG_INPUT_MAX77693_HAPTIC)	+= max77693-haptic.o
+obj-$(CONFIG_INPUT_MAX77705_HAPTIC)	+= max77705-haptic.o
 obj-$(CONFIG_INPUT_MAX8925_ONKEY)	+= max8925_onkey.o
 obj-$(CONFIG_INPUT_MAX8997_HAPTIC)	+= max8997_haptic.o
 obj-$(CONFIG_INPUT_MC13783_PWRBUTTON)	+= mc13783-pwrbutton.o
diff --git a/drivers/input/misc/max77705-haptic.c b/drivers/input/misc/max77705-haptic.c
new file mode 100644
index 000000000000..e92dcb4fff37
--- /dev/null
+++ b/drivers/input/misc/max77705-haptic.c
@@ -0,0 +1,378 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Based on max77693-haptic.c:
+ *	Copyright (C) 2014,2015 Samsung Electronics
+ *      Jaewon Kim <jaewon02.kim@samsung.com>
+ *      Krzysztof Kozlowski <krzk@kernel.org>
+ *
+ * Copyright (C) 2024 Dzmitry Sankouski <dsankouski@gmail.com>
+ *
+ * This program is not provided / owned by Maxim Integrated Products.
+ */
+
+#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/i2c.h>
+#include <linux/regmap.h>
+#include <linux/input.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/pwm.h>
+#include <linux/slab.h>
+#include <linux/workqueue.h>
+#include <linux/regulator/consumer.h>
+#include <linux/mfd/max77705.h>
+#include <linux/mfd/max77705-private.h>
+
+#define MAX_MAGNITUDE_SHIFT	16
+
+enum max77705_haptic_motor_type {
+	MAX77705_HAPTIC_ERM = 0,
+	MAX77705_HAPTIC_LRA,
+};
+
+enum max77705_haptic_pulse_mode {
+	MAX77705_HAPTIC_EXTERNAL_MODE = 0,
+	MAX77705_HAPTIC_INTERNAL_MODE,
+};
+
+enum max77705_haptic_pwm_divisor {
+	MAX77705_HAPTIC_PWM_DIVISOR_32 = 0,
+	MAX77705_HAPTIC_PWM_DIVISOR_64,
+	MAX77705_HAPTIC_PWM_DIVISOR_128,
+	MAX77705_HAPTIC_PWM_DIVISOR_256,
+};
+
+struct max77705_haptic {
+	enum max77705_types dev_type;
+
+	struct regmap *regmap_pmic;
+	struct regmap *regmap_haptic;
+	struct device *dev;
+	struct input_dev *input_dev;
+	struct pwm_device *pwm_dev;
+	struct regulator *motor_reg;
+
+	bool enabled;
+	bool suspend_state;
+	unsigned int magnitude;
+	unsigned int pwm_duty;
+	enum max77705_haptic_motor_type type;
+	enum max77705_haptic_pulse_mode mode;
+
+	struct work_struct work;
+};
+
+static int max77705_haptic_set_duty_cycle(struct max77705_haptic *haptic)
+{
+	struct pwm_args pargs;
+	int delta;
+	int error;
+
+	pwm_get_args(haptic->pwm_dev, &pargs);
+	delta = (pargs.period + haptic->pwm_duty) / 2;
+	error = pwm_config(haptic->pwm_dev, delta, pargs.period);
+	if (error) {
+		dev_err(haptic->dev, "failed to configure pwm: %d\n", error);
+		return error;
+	}
+
+	return 0;
+}
+
+static int max77705_haptic_bias(struct max77705_haptic *haptic, bool on)
+{
+	int error;
+
+	error = regmap_update_bits(haptic->regmap_haptic,
+							   MAX77705_PMIC_REG_MAINCTRL1,
+							   MAX77705_MAINCTRL1_BIASEN_MASK,
+							   on << MAX77705_MAINCTRL1_BIASEN_SHIFT);
+
+	if (error) {
+		dev_err(haptic->dev, "failed to %s bias: %d\n",
+			on ? "enable" : "disable", error);
+		return error;
+	}
+
+	return 0;
+}
+
+static int max77705_haptic_configure(struct max77705_haptic *haptic,
+				     bool enable)
+{
+	unsigned int value, config_reg;
+	int error;
+
+	value = ((haptic->type << MAX77705_CONFIG2_MODE_SHIFT) |
+		(enable << MAX77705_CONFIG2_MEN_SHIFT) |
+		(haptic->mode << MAX77705_CONFIG2_HTYP_SHIFT) |
+		MAX77705_HAPTIC_PWM_DIVISOR_128);
+	config_reg = MAX77705_PMIC_REG_MCONFIG;
+
+	error = regmap_write(haptic->regmap_haptic,
+			     config_reg, value);
+	if (error) {
+		dev_err(haptic->dev,
+			"failed to update haptic config: %d\n", error);
+		return error;
+	}
+
+	return 0;
+}
+
+static void max77705_haptic_enable(struct max77705_haptic *haptic)
+{
+	int error;
+
+	if (haptic->enabled)
+		return;
+
+	error = pwm_enable(haptic->pwm_dev);
+	if (error) {
+		dev_err(haptic->dev,
+			"failed to enable haptic pwm device: %d\n", error);
+		return;
+	}
+
+	error = max77705_haptic_configure(haptic, true);
+	if (error)
+		goto err_enable_config;
+
+	haptic->enabled = true;
+
+	return;
+
+err_enable_config:
+	pwm_disable(haptic->pwm_dev);
+}
+
+static void max77705_haptic_disable(struct max77705_haptic *haptic)
+{
+	int error;
+
+	if (!haptic->enabled)
+		return;
+
+	error = max77705_haptic_configure(haptic, false);
+	if (error)
+		return;
+
+	pwm_disable(haptic->pwm_dev);
+	haptic->enabled = false;
+}
+
+static void max77705_haptic_play_work(struct work_struct *work)
+{
+	struct max77705_haptic *haptic =
+			container_of(work, struct max77705_haptic, work);
+	int error;
+
+	error = max77705_haptic_set_duty_cycle(haptic);
+	if (error) {
+		dev_err(haptic->dev, "failed to set duty cycle: %d\n", error);
+		return;
+	}
+
+	if (haptic->magnitude)
+		max77705_haptic_enable(haptic);
+	else
+		max77705_haptic_disable(haptic);
+}
+
+static int max77705_haptic_play_effect(struct input_dev *dev, void *data,
+				       struct ff_effect *effect)
+{
+	struct max77705_haptic *haptic = input_get_drvdata(dev);
+	struct pwm_args pargs;
+	u64 period_mag_multi;
+
+	haptic->magnitude = effect->u.rumble.strong_magnitude;
+	if (!haptic->magnitude)
+		haptic->magnitude = effect->u.rumble.weak_magnitude;
+
+	/*
+	 * The magnitude comes from force-feedback interface.
+	 * The formula to convert magnitude to pwm_duty as follows:
+	 * - pwm_duty = (magnitude * pwm_period) / MAX_MAGNITUDE(0xFFFF)
+	 */
+	pr_info("magnitude: %d(%x)", haptic->magnitude, haptic->magnitude);
+	pwm_get_args(haptic->pwm_dev, &pargs);
+	period_mag_multi = (u64)pargs.period * haptic->magnitude;
+	haptic->pwm_duty = (unsigned int)(period_mag_multi >>
+						MAX_MAGNITUDE_SHIFT);
+
+	schedule_work(&haptic->work);
+
+	return 0;
+}
+
+static int max77705_haptic_open(struct input_dev *dev)
+{
+	struct max77705_haptic *haptic = input_get_drvdata(dev);
+	int error;
+
+	error = max77705_haptic_bias(haptic, true);
+	if (error)
+		return error;
+
+	error = regulator_enable(haptic->motor_reg);
+	if (error) {
+		dev_err(haptic->dev,
+			"failed to enable regulator: %d\n", error);
+		return error;
+	}
+
+	return 0;
+}
+
+static void max77705_haptic_close(struct input_dev *dev)
+{
+	struct max77705_haptic *haptic = input_get_drvdata(dev);
+	int error;
+
+	cancel_work_sync(&haptic->work);
+	max77705_haptic_disable(haptic);
+
+	error = regulator_disable(haptic->motor_reg);
+	if (error)
+		dev_err(haptic->dev,
+			"failed to disable regulator: %d\n", error);
+
+	max77705_haptic_bias(haptic, false);
+}
+
+static int max77705_haptic_probe(struct platform_device *pdev)
+{
+	struct max77705_dev *max77705 = dev_get_drvdata(pdev->dev.parent);
+	struct max77705_haptic *haptic;
+	int error;
+
+	haptic = devm_kzalloc(&pdev->dev, sizeof(*haptic), GFP_KERNEL);
+	if (!haptic)
+		return -ENOMEM;
+
+	haptic->regmap_pmic = max77705->regmap;
+	haptic->dev = &pdev->dev;
+	haptic->type = MAX77705_HAPTIC_LRA;
+	haptic->mode = MAX77705_HAPTIC_EXTERNAL_MODE;
+	haptic->suspend_state = false;
+
+	/* Variant-specific init */
+	haptic->dev_type = max77705->type;
+	haptic->regmap_haptic = max77705->regmap;
+
+	INIT_WORK(&haptic->work, max77705_haptic_play_work);
+
+	/* Get pwm and regulatot for haptic device */
+	haptic->pwm_dev = devm_pwm_get(&pdev->dev, NULL);
+	if (IS_ERR(haptic->pwm_dev)) {
+		dev_err(&pdev->dev, "failed to get pwm device\n");
+		return PTR_ERR(haptic->pwm_dev);
+	}
+
+	/*
+	 * FIXME: pwm_apply_args() should be removed when switching to the
+	 * atomic PWM API.
+	 */
+	pwm_apply_args(haptic->pwm_dev);
+
+	haptic->motor_reg = devm_regulator_get(&pdev->dev, "haptic");
+	if (IS_ERR(haptic->motor_reg)) {
+		dev_err(&pdev->dev, "failed to get regulator\n");
+		return PTR_ERR(haptic->motor_reg);
+	}
+
+	/* Initialize input device for haptic device */
+	haptic->input_dev = devm_input_allocate_device(&pdev->dev);
+	if (!haptic->input_dev) {
+		dev_err(&pdev->dev, "failed to allocate input device\n");
+		return -ENOMEM;
+	}
+
+	haptic->input_dev->name = "max77705-haptic";
+	haptic->input_dev->id.version = 1;
+	haptic->input_dev->dev.parent = &pdev->dev;
+	haptic->input_dev->open = max77705_haptic_open;
+	haptic->input_dev->close = max77705_haptic_close;
+	input_set_drvdata(haptic->input_dev, haptic);
+	input_set_capability(haptic->input_dev, EV_FF, FF_RUMBLE);
+
+	error = input_ff_create_memless(haptic->input_dev, NULL,
+				max77705_haptic_play_effect);
+	if (error) {
+		dev_err(&pdev->dev, "failed to create force-feedback\n");
+		return error;
+	}
+
+	error = input_register_device(haptic->input_dev);
+	if (error) {
+		dev_err(&pdev->dev, "failed to register input device\n");
+		return error;
+	}
+
+	platform_set_drvdata(pdev, haptic);
+
+	return 0;
+}
+
+static void max77705_haptic_remove(struct platform_device *pdev)
+{
+	struct max77705_haptic *haptic = platform_get_drvdata(pdev);
+
+	if (haptic->enabled)
+		max77705_haptic_disable(haptic);
+}
+
+static int max77705_haptic_suspend(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct max77705_haptic *haptic = platform_get_drvdata(pdev);
+
+	if (haptic->enabled) {
+		max77705_haptic_disable(haptic);
+		haptic->suspend_state = true;
+	}
+
+	return 0;
+}
+
+static int max77705_haptic_resume(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct max77705_haptic *haptic = platform_get_drvdata(pdev);
+
+	if (haptic->suspend_state) {
+		max77705_haptic_enable(haptic);
+		haptic->suspend_state = false;
+	}
+
+	return 0;
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(max77705_haptic_pm_ops,
+				max77705_haptic_suspend,
+				max77705_haptic_resume);
+
+static const struct of_device_id of_max77705_haptic_dt_match[] = {
+	{ .compatible = "maxim,max77705-haptic", },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, of_max77705_haptic_dt_match);
+
+static struct platform_driver max77705_haptic_driver = {
+	.driver		= {
+		.name	= "max77705-haptic",
+		.pm	= pm_sleep_ptr(&max77705_haptic_pm_ops),
+		.of_match_table = of_max77705_haptic_dt_match,
+	},
+	.probe		= max77705_haptic_probe,
+	.remove_new	= max77705_haptic_remove,
+};
+module_platform_driver(max77705_haptic_driver);
+
+MODULE_AUTHOR("Dzmitry Sankouski <dsankouski@gmail.com>");
+MODULE_AUTHOR("Jaewon Kim <jaewon02.kim@samsung.com>");
+MODULE_AUTHOR("Krzysztof Kozlowski <krzk@kernel.org>");
+MODULE_DESCRIPTION("MAXIM 77705/77705 Haptic driver");
+MODULE_LICENSE("GPL");

-- 
2.39.2

