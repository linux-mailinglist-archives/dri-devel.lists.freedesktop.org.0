Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 587802250A5
	for <lists+dri-devel@lfdr.de>; Sun, 19 Jul 2020 10:08:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7BEF6E3DA;
	Sun, 19 Jul 2020 08:08:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 374C36E3DA
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jul 2020 08:08:16 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id e4so17046121ljn.4
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jul 2020 01:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3pU79wxtbww6roS9uIbXD9qGkU3KQAUXqY3ZtmbUmbU=;
 b=relhOJV2rBxQLvDKZwQVhMUEHY42VOn3ztsnziT4XtJ55o0g32FOErD9/M5EMX1E8M
 8750tZNld6pc2HNrK5KnKXjVVFHGl0WYKnI6njuQ94djfHBOOSXlkTdZSzdAm6fO6Cc7
 0Hu76sVQK0LT2lz03iXHOwDHJ0pmWxnZX+gO4rJ3acPwkCpSs/XZya7ULdEhl6nIOIWR
 ZSf2lR9G+vnky8Vh85TI1aNucMtVot4x77UKZzBerjkfi+N+3HyhuhqudG6Sb5xbOds3
 o4hoWGFJxrsR4c5dZSNV9cqMEjyAXM4CvwpNoahscpV126jEA6cQVlEQOjMf9hy9MwaG
 LyQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=3pU79wxtbww6roS9uIbXD9qGkU3KQAUXqY3ZtmbUmbU=;
 b=Tv5MdMiDotZ6H6/VWxkehOzdATXhME//KonpidnjE4f6o+lLDGhcdsMmZg2bWGW9ik
 s71jct7im2IWSTGsJrlWcWD3WP/2B+3UhHUUgam6m4nkV7m16pnvTzlUDAplVeTT9zpu
 GcfHk98AaY8RC8Pi/UarxpXTwzk8mGIAJXn5NeYlWu08OLhuB/vBQTCPxcCoM3/EPCzm
 lamTY5cewSYSpm9KXf+RD0MuXLIf1JFUnvgELMVh5OjQ6WZrWUNPVBLhrt+rJ/ZDVMo2
 G1Kw43AfzN0/0gRF5NOSXrq+NXDgvy2SZua0ePT3jlVfAFQ1rEB7O17Rc0lBmWqCMvm1
 8BOQ==
X-Gm-Message-State: AOAM532X4xsRo+StJeCiz/VEAxMco76hOm9HAWJMrxX3TdLlP5spkvM/
 JW19l0iDhutjvP8DmQ8Hh5vv5DwSqFs=
X-Google-Smtp-Source: ABdhPJzqNdoC/a3lNcJPXSd+9XgjSCt9m/i8prqNnvnlNwScJeKMqoODjJ+wDiBuy2XG4kfa9Y9ZNg==
X-Received: by 2002:a05:651c:1105:: with SMTP id
 d5mr8323213ljo.62.1595146094366; 
 Sun, 19 Jul 2020 01:08:14 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:d5fe:fe9c:fc06:b74c])
 by smtp.gmail.com with ESMTPSA id 72sm732407lfh.97.2020.07.19.01.08.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jul 2020 01:08:13 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v5 08/19] backlight: remove the unused backlight_bl driver
Date: Sun, 19 Jul 2020 10:07:32 +0200
Message-Id: <20200719080743.8560-9-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200719080743.8560-1-sam@ravnborg.org>
References: <20200719080743.8560-1-sam@ravnborg.org>
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
Cc: linux-pwm@vger.kernel.org,
 Support Opensource <support.opensource@diasemi.com>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Jonathan Corbet <corbet@lwn.net>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Andy Gross <agross@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
 Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>, patches@opensource.cirrus.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The backlight_bl driver required initialization using
struct generic_bl_info. As there are no more references
to this struct there is no users left.
So it is safe to delete the driver.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>
---
 drivers/video/backlight/Kconfig      |   8 --
 drivers/video/backlight/Makefile     |   1 -
 drivers/video/backlight/generic_bl.c | 110 ---------------------------
 include/linux/backlight.h            |   9 ---
 4 files changed, 128 deletions(-)
 delete mode 100644 drivers/video/backlight/generic_bl.c

diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
index 95c546cc8774..87f9fc238d28 100644
--- a/drivers/video/backlight/Kconfig
+++ b/drivers/video/backlight/Kconfig
@@ -173,14 +173,6 @@ config BACKLIGHT_EP93XX
 	  To compile this driver as a module, choose M here: the module will
 	  be called ep93xx_bl.
 
-config BACKLIGHT_GENERIC
-	tristate "Generic (aka Sharp Corgi) Backlight Driver"
-	default y
-	help
-	  Say y to enable the generic platform backlight driver previously
-	  known as the Corgi backlight driver. If you have a Sharp Zaurus
-	  SL-C7xx, SL-Cxx00 or SL-6000x say y.
-
 config BACKLIGHT_IPAQ_MICRO
 	tristate "iPAQ microcontroller backlight driver"
 	depends on MFD_IPAQ_MICRO
diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlight/Makefile
index 2072d21b60f7..13463b99f1f9 100644
--- a/drivers/video/backlight/Makefile
+++ b/drivers/video/backlight/Makefile
@@ -31,7 +31,6 @@ obj-$(CONFIG_BACKLIGHT_CLASS_DEVICE)	+= backlight.o
 obj-$(CONFIG_BACKLIGHT_DA903X)		+= da903x_bl.o
 obj-$(CONFIG_BACKLIGHT_DA9052)		+= da9052_bl.o
 obj-$(CONFIG_BACKLIGHT_EP93XX)		+= ep93xx_bl.o
-obj-$(CONFIG_BACKLIGHT_GENERIC)		+= generic_bl.o
 obj-$(CONFIG_BACKLIGHT_GPIO)		+= gpio_backlight.o
 obj-$(CONFIG_BACKLIGHT_HP680)		+= hp680_bl.o
 obj-$(CONFIG_BACKLIGHT_HP700)		+= jornada720_bl.o
diff --git a/drivers/video/backlight/generic_bl.c b/drivers/video/backlight/generic_bl.c
deleted file mode 100644
index 8fe63dbc8590..000000000000
--- a/drivers/video/backlight/generic_bl.c
+++ /dev/null
@@ -1,110 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- *  Generic Backlight Driver
- *
- *  Copyright (c) 2004-2008 Richard Purdie
- */
-
-#include <linux/module.h>
-#include <linux/kernel.h>
-#include <linux/init.h>
-#include <linux/platform_device.h>
-#include <linux/mutex.h>
-#include <linux/fb.h>
-#include <linux/backlight.h>
-
-static int genericbl_intensity;
-static struct backlight_device *generic_backlight_device;
-static struct generic_bl_info *bl_machinfo;
-
-static int genericbl_send_intensity(struct backlight_device *bd)
-{
-	int intensity = bd->props.brightness;
-
-	if (bd->props.power != FB_BLANK_UNBLANK)
-		intensity = 0;
-	if (bd->props.state & BL_CORE_FBBLANK)
-		intensity = 0;
-	if (bd->props.state & BL_CORE_SUSPENDED)
-		intensity = 0;
-
-	bl_machinfo->set_bl_intensity(intensity);
-
-	genericbl_intensity = intensity;
-
-	if (bl_machinfo->kick_battery)
-		bl_machinfo->kick_battery();
-
-	return 0;
-}
-
-static int genericbl_get_intensity(struct backlight_device *bd)
-{
-	return genericbl_intensity;
-}
-
-static const struct backlight_ops genericbl_ops = {
-	.options = BL_CORE_SUSPENDRESUME,
-	.get_brightness = genericbl_get_intensity,
-	.update_status  = genericbl_send_intensity,
-};
-
-static int genericbl_probe(struct platform_device *pdev)
-{
-	struct backlight_properties props;
-	struct generic_bl_info *machinfo = dev_get_platdata(&pdev->dev);
-	const char *name = "generic-bl";
-	struct backlight_device *bd;
-
-	bl_machinfo = machinfo;
-	if (!machinfo->limit_mask)
-		machinfo->limit_mask = -1;
-
-	if (machinfo->name)
-		name = machinfo->name;
-
-	memset(&props, 0, sizeof(struct backlight_properties));
-	props.type = BACKLIGHT_RAW;
-	props.max_brightness = machinfo->max_intensity;
-	bd = devm_backlight_device_register(&pdev->dev, name, &pdev->dev,
-					NULL, &genericbl_ops, &props);
-	if (IS_ERR(bd))
-		return PTR_ERR(bd);
-
-	platform_set_drvdata(pdev, bd);
-
-	bd->props.power = FB_BLANK_UNBLANK;
-	bd->props.brightness = machinfo->default_intensity;
-	backlight_update_status(bd);
-
-	generic_backlight_device = bd;
-
-	dev_info(&pdev->dev, "Generic Backlight Driver Initialized.\n");
-	return 0;
-}
-
-static int genericbl_remove(struct platform_device *pdev)
-{
-	struct backlight_device *bd = platform_get_drvdata(pdev);
-
-	bd->props.power = 0;
-	bd->props.brightness = 0;
-	backlight_update_status(bd);
-
-	dev_info(&pdev->dev, "Generic Backlight Driver Unloaded\n");
-	return 0;
-}
-
-static struct platform_driver genericbl_driver = {
-	.probe		= genericbl_probe,
-	.remove		= genericbl_remove,
-	.driver		= {
-		.name	= "generic-bl",
-	},
-};
-
-module_platform_driver(genericbl_driver);
-
-MODULE_AUTHOR("Richard Purdie <rpurdie@rpsys.net>");
-MODULE_DESCRIPTION("Generic Backlight Driver");
-MODULE_LICENSE("GPL");
diff --git a/include/linux/backlight.h b/include/linux/backlight.h
index 0f425b32e6be..8f2005a6f8a9 100644
--- a/include/linux/backlight.h
+++ b/include/linux/backlight.h
@@ -454,15 +454,6 @@ static inline void * bl_get_data(struct backlight_device *bl_dev)
 	return dev_get_drvdata(&bl_dev->dev);
 }
 
-struct generic_bl_info {
-	const char *name;
-	int max_intensity;
-	int default_intensity;
-	int limit_mask;
-	void (*set_bl_intensity)(int intensity);
-	void (*kick_battery)(void);
-};
-
 #ifdef CONFIG_OF
 struct backlight_device *of_find_backlight_by_node(struct device_node *node);
 #else
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
