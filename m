Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9CE31E9E91
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jun 2020 08:52:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C8466E138;
	Mon,  1 Jun 2020 06:52:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD78A6E138
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jun 2020 06:52:35 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id m18so6757956ljo.5
 for <dri-devel@lists.freedesktop.org>; Sun, 31 May 2020 23:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vDqVAIjccZnYRUpLcbxJO82lc5tSgraJEEtyeI//9cw=;
 b=CEXAusFgeTZ1RgVQ9hS2P6VoCaZ82REziAk3UsxYQeACDlGmILLx/1tyRgu5k/gsHK
 7bhDWlYPZxQ//HvR95PuodmqLBjecdAs3P/yv6AvhsvKnd/T7BIUgwHXAQvim2XUOXMO
 02RqhhhLt6EAxVEE4xFd1MfMrb3dQ70WWXGsEyjblCUE521UmSz3KzCLMKGd2YyjTBcp
 DN8/HmhnXU41qBZ26BynfdCgn47BZOI6N0wZJI1qSDjwg81QvvH/nZRdJVbIqO7Imddy
 c8BhPMbJ4xv51Q0pkZ1PdoSyGoZR0Nsw5F57UEp666T/rTZbD6uwwH+nQU2V/+J4GRSP
 hlWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=vDqVAIjccZnYRUpLcbxJO82lc5tSgraJEEtyeI//9cw=;
 b=iCJbtu/nVU66peZ+vZEwmSGrhNXEVs9KE7L659DfQeRgtvVMETdnCBXbz+dgm00mnB
 zLNFw7d+6pDoHAQ9/vEJs34yqOemIvmnMPcLRW9sFNfnhpzafbw8s45bSp9zaTveJJYy
 BTM4A/oHB8rOaE+m17cW3M47VolCj/ypRa3NlNLoiJM787LxTpt2eIXAui/QwuhZ293s
 0DkrBWuBy9z5lXhMCDKMGCKZgl3mGo0Dhge2j07KjnVRmzE9h73Da0uQXSM2hms2kDM3
 bz7ciwLvmRZk+IC5YFIYYc3za7CChF0hkaykVAZKkxhxRSCwlFmslrAwBrK5jen5k+IM
 r3jQ==
X-Gm-Message-State: AOAM533nPFq4g39AEitIqFlh9CQoCO7CdAqWnKJK8CoHRsNglgEKb2Eq
 r0y0GZJG1unJPcAVJde0f9L8vfocK78=
X-Google-Smtp-Source: ABdhPJx/qq0CrraGku2u6S8qFTum2RKXM4M4pOEdTsmcCFc4PeCAn382lO6xEJ0gLuJxdJ41zO8/VQ==
X-Received: by 2002:a2e:a0cd:: with SMTP id f13mr6644884ljm.139.1590994353880; 
 Sun, 31 May 2020 23:52:33 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:281d:a604:434c:a58d])
 by smtp.gmail.com with ESMTPSA id e13sm2540462ljl.117.2020.05.31.23.52.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 May 2020 23:52:33 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v3 08/13] backlight: remove the unused backlight_bl driver
Date: Mon,  1 Jun 2020 08:52:02 +0200
Message-Id: <20200601065207.492614-9-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200601065207.492614-1-sam@ravnborg.org>
References: <20200601065207.492614-1-sam@ravnborg.org>
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
index 7d22d7377606..14abfeee8868 100644
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
index 0c1a1524627a..9b998cfdc56d 100644
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
index c1c7b1666a9b..6bd981a600ef 100644
--- a/include/linux/backlight.h
+++ b/include/linux/backlight.h
@@ -453,15 +453,6 @@ static inline void * bl_get_data(struct backlight_device *bl_dev)
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
