Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A051220BA64
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jun 2020 22:37:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52CAF6E49D;
	Fri, 26 Jun 2020 20:37:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 453636E49D
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 20:37:49 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id t9so5846814lfl.5
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 13:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QW94rD0l59fFYc+4Q3d54IcHrSYKu6sVXjIJXkSz8L4=;
 b=SmowkzZkM1wMmQFn+CqkWQ0t2/lGsP231rkn9kW2SUdZB0ne3vg0K3LfKW+UCpVd3v
 HqC18HNRwNBGvSzTifmmHdjfCOxOXYxjo5O1JoIkk1h6D6cfVWc5Ebe5UespoYaJOKGS
 jbj3ugy5kzh5XuU/xYcg6mASEkGY/Kn2fiB4rCkP8EbWi+n1ySMeRZITcc1FqPO7K2No
 8QGxN4F3prozD0NZ02ISisUSPXLmmKweDZPjXugw9A+VdA8Dgb0Mt4aachvhBkl6c+8U
 eGAeK9pCQIwceitfk9iGnOrCbJgCUk9GnDJ/DLno13JYQI/0RKtzl5PSN0lkUZEQGIqB
 fW2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QW94rD0l59fFYc+4Q3d54IcHrSYKu6sVXjIJXkSz8L4=;
 b=sydlGSxN/JWsbmoIxXD9dsyytfV7Xe6ooF3/s+vjkpwyKw7zfqv4kWRcRB3EozZ4wv
 YJsJRrqU6grFwyOoRiVOkBtK7uDpazCDJZMOTd2BYlwhwwqCkohS6GoVj3ZWNImYJffh
 mgW9ufdbM/K300xfgd3+fGSnKBiIwiT4QrdY14Uk32vOR4ZOZwFnd7RBI7kGYTWhNStA
 M2iV+VIX0VtdMPbCSJRmbwmJdsHADYq0d0bYFOibtDN+kNH2fQme7F2YbQFWwbn9yMV2
 KQbXD6L1foMWxiwtpzz02mRTuodXbWm0kDBDXmxUNDKge0TwTtNgr8SfLpRx8Ol2CjVv
 WE7Q==
X-Gm-Message-State: AOAM531Olc/1pRqMJcN0x+6GPkxisEX/e1MctFetgG6uNmKdUPqMdV1/
 m+gdXQ+uwL1XwE31pUrrksNBaA==
X-Google-Smtp-Source: ABdhPJwukXegpLKuldo/KRCgDgRL6ccKx11nIM2VjL36ZSE9Jhmp3BibXI6VfRQzOm7KrmZirJc9+A==
X-Received: by 2002:ac2:52ac:: with SMTP id r12mr2779255lfm.175.1593203867515; 
 Fri, 26 Jun 2020 13:37:47 -0700 (PDT)
Received: from genomnajs.lan
 (c-d63ee155.152980-0-69706f6e6c79.bbcust.telenor.se. [85.225.62.214])
 by smtp.gmail.com with ESMTPSA id a21sm475056ljn.2.2020.06.26.13.37.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2020 13:37:47 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] backlight: sky81452: Privatize platform data
Date: Fri, 26 Jun 2020 22:37:42 +0200
Message-Id: <20200626203742.336780-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200626203742.336780-1-linus.walleij@linaro.org>
References: <20200626203742.336780-1-linus.walleij@linaro.org>
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
Cc: Gyungoh Yoo <jack.yoo@skyworksinc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The only way the platform data for the SKY81452 ever gets populated
is through the device tree.

The MFD device is bothered with this for no reason at all. Just
allocate the platform data in the driver and be happy.

Cc: Gyungoh Yoo <jack.yoo@skyworksinc.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/mfd/sky81452.c                        |  2 -
 drivers/video/backlight/sky81452-backlight.c  | 34 +++++++++++++----
 include/linux/mfd/sky81452.h                  |  2 -
 .../linux/platform_data/sky81452-backlight.h  | 37 -------------------
 4 files changed, 27 insertions(+), 48 deletions(-)
 delete mode 100644 include/linux/platform_data/sky81452-backlight.h

diff --git a/drivers/mfd/sky81452.c b/drivers/mfd/sky81452.c
index 76eedfae8553..3ad35bf0c015 100644
--- a/drivers/mfd/sky81452.c
+++ b/drivers/mfd/sky81452.c
@@ -47,8 +47,6 @@ static int sky81452_probe(struct i2c_client *client,
 	memset(cells, 0, sizeof(cells));
 	cells[0].name = "sky81452-backlight";
 	cells[0].of_compatible = "skyworks,sky81452-backlight";
-	cells[0].platform_data = pdata->bl_pdata;
-	cells[0].pdata_size = sizeof(*pdata->bl_pdata);
 	cells[1].name = "sky81452-regulator";
 	cells[1].platform_data = pdata->regulator_init_data;
 	cells[1].pdata_size = sizeof(*pdata->regulator_init_data);
diff --git a/drivers/video/backlight/sky81452-backlight.c b/drivers/video/backlight/sky81452-backlight.c
index 81d2c8f3ca50..83ccb3d940fa 100644
--- a/drivers/video/backlight/sky81452-backlight.c
+++ b/drivers/video/backlight/sky81452-backlight.c
@@ -15,7 +15,6 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
-#include <linux/platform_data/sky81452-backlight.h>
 #include <linux/slab.h>
 
 /* registers */
@@ -41,6 +40,29 @@
 #define SKY81452_DEFAULT_NAME "lcd-backlight"
 #define SKY81452_MAX_BRIGHTNESS	(SKY81452_CS + 1)
 
+/**
+ * struct sky81452_platform_data
+ * @name:	backlight driver name.
+		If it is not defined, default name is lcd-backlight.
+ * @gpios_enable:GPIO descriptor which control EN pin
+ * @enable:	Enable mask for current sink channel 1, 2, 3, 4, 5 and 6.
+ * @ignore_pwm:	true if DPWMI should be ignored.
+ * @dpwm_mode:	true is DPWM dimming mode, otherwise Analog dimming mode.
+ * @phase_shift:true is phase shift mode.
+ * @short_detecion_threshold:	It should be one of 4, 5, 6 and 7V.
+ * @boost_current_limit:	It should be one of 2300, 2750mA.
+ */
+struct sky81452_bl_platform_data {
+	const char *name;
+	struct gpio_desc *gpiod_enable;
+	unsigned int enable;
+	bool ignore_pwm;
+	bool dpwm_mode;
+	bool phase_shift;
+	unsigned int short_detection_threshold;
+	unsigned int boost_current_limit;
+};
+
 #define CTZ(b) __builtin_ctz(b)
 
 static int sky81452_bl_update_status(struct backlight_device *bd)
@@ -251,17 +273,15 @@ static int sky81452_bl_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct regmap *regmap = dev_get_drvdata(dev->parent);
-	struct sky81452_bl_platform_data *pdata = dev_get_platdata(dev);
+	struct sky81452_bl_platform_data *pdata;
 	struct backlight_device *bd;
 	struct backlight_properties props;
 	const char *name;
 	int ret;
 
-	if (!pdata) {
-		pdata = sky81452_bl_parse_dt(dev);
-		if (IS_ERR(pdata))
-			return PTR_ERR(pdata);
-	}
+	pdata = sky81452_bl_parse_dt(dev);
+	if (IS_ERR(pdata))
+		return PTR_ERR(pdata);
 
 	ret = sky81452_bl_init_device(regmap, pdata);
 	if (ret < 0) {
diff --git a/include/linux/mfd/sky81452.h b/include/linux/mfd/sky81452.h
index d469aa481243..b08570ff34df 100644
--- a/include/linux/mfd/sky81452.h
+++ b/include/linux/mfd/sky81452.h
@@ -9,11 +9,9 @@
 #ifndef _SKY81452_H
 #define _SKY81452_H
 
-#include <linux/platform_data/sky81452-backlight.h>
 #include <linux/regulator/machine.h>
 
 struct sky81452_platform_data {
-	struct sky81452_bl_platform_data *bl_pdata;
 	struct regulator_init_data *regulator_init_data;
 };
 
diff --git a/include/linux/platform_data/sky81452-backlight.h b/include/linux/platform_data/sky81452-backlight.h
deleted file mode 100644
index d6f46670d923..000000000000
--- a/include/linux/platform_data/sky81452-backlight.h
+++ /dev/null
@@ -1,37 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * sky81452.h	SKY81452 backlight driver
- *
- * Copyright 2014 Skyworks Solutions Inc.
- * Author : Gyungoh Yoo <jack.yoo@skyworksinc.com>
- */
-
-#ifndef _SKY81452_BACKLIGHT_H
-#define _SKY81452_BACKLIGHT_H
-
-#include <linux/gpio/consumer.h>
-
-/**
- * struct sky81452_platform_data
- * @name:	backlight driver name.
-		If it is not defined, default name is lcd-backlight.
- * @gpios_enable:GPIO descriptor which control EN pin
- * @enable:	Enable mask for current sink channel 1, 2, 3, 4, 5 and 6.
- * @ignore_pwm:	true if DPWMI should be ignored.
- * @dpwm_mode:	true is DPWM dimming mode, otherwise Analog dimming mode.
- * @phase_shift:true is phase shift mode.
- * @short_detecion_threshold:	It should be one of 4, 5, 6 and 7V.
- * @boost_current_limit:	It should be one of 2300, 2750mA.
- */
-struct sky81452_bl_platform_data {
-	const char *name;
-	struct gpio_desc *gpiod_enable;
-	unsigned int enable;
-	bool ignore_pwm;
-	bool dpwm_mode;
-	bool phase_shift;
-	unsigned int short_detection_threshold;
-	unsigned int boost_current_limit;
-};
-
-#endif
-- 
2.25.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
