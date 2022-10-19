Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D88604B14
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 17:20:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A232510F268;
	Wed, 19 Oct 2022 15:20:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 938DB10F268
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Oct 2022 15:20:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 088C661839;
 Wed, 19 Oct 2022 15:20:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B55BC433D6;
 Wed, 19 Oct 2022 15:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666192815;
 bh=OHnFw0JhLweZiz1MQUA1JZLc1dJxeCgP07D/rnW6zd4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=untci+/VB0LLnWeB2Wvp55+ab4w9tkXF5NfFqbqB30zosPvay2h+oJay8MLP3rydj
 a/qZwLJs2h0S0ByUbglJxnwgFXtaX2FYdKoJRlwBNpIj0WrLjEOLxWf3rCTv47y9Vq
 cQNtXpZl//qFXnAHdZ91AZ0HfQhr/oyn+dZByNUw0XDn/mIBxzZayg9uJPi3+7T/2l
 kfp83tfGL3qbD6cRbwDG8Gd0+Ldir5WazJRgFIEq2plXg85e6OzzqaXdUa5d/pGM3v
 AyZiAwIN1dWJbR1eOYDCCWXwt9zvphICi/0tagJJbvTbcRN8aCeMGRXjjxGkncboWW
 MjSz6wbmso7cQ==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Helge Deller <deller@gmx.de>
Subject: [PATCH 15/17] fbdev: omapfb: remove unused board support
Date: Wed, 19 Oct 2022 17:03:37 +0200
Message-Id: <20221019150410.3851944-15-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20221019150410.3851944-1-arnd@kernel.org>
References: <20221019144119.3848027-1-arnd@kernel.org>
 <20221019150410.3851944-1-arnd@kernel.org>
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
Cc: linux-fbdev@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, Tony Lindgren <tony@atomide.com>,
 Angelo Arrifano <miknix@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Marek Vasut <marek.vasut@gmail.com>,
 linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

A number of omap1 based board files got removed, so the corresponding
framebuffer drivers are no longer used. The remaining ones are for
ams_delta, osk and palmTE, which are still part of the mainline kernel.

Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc: Tony Lindgren <tony@atomide.com>
Cc: linux-omap@vger.kernel.org
Cc: Marek Vasut <marek.vasut@gmail.com>
Cc: Angelo Arrifano <miknix@gmail.com>
Cc: Imre Deak <imre.deak@intel.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/video/fbdev/omap/Kconfig         |  9 ---
 drivers/video/fbdev/omap/Makefile        |  6 --
 drivers/video/fbdev/omap/lcd_h3.c        | 82 --------------------
 drivers/video/fbdev/omap/lcd_htcherald.c | 59 --------------
 drivers/video/fbdev/omap/lcd_inn1510.c   | 69 -----------------
 drivers/video/fbdev/omap/lcd_inn1610.c   | 99 ------------------------
 drivers/video/fbdev/omap/lcd_palmtt.c    | 65 ----------------
 drivers/video/fbdev/omap/lcd_palmz71.c   | 59 --------------
 8 files changed, 448 deletions(-)
 delete mode 100644 drivers/video/fbdev/omap/lcd_h3.c
 delete mode 100644 drivers/video/fbdev/omap/lcd_htcherald.c
 delete mode 100644 drivers/video/fbdev/omap/lcd_inn1510.c
 delete mode 100644 drivers/video/fbdev/omap/lcd_inn1610.c
 delete mode 100644 drivers/video/fbdev/omap/lcd_palmtt.c
 delete mode 100644 drivers/video/fbdev/omap/lcd_palmz71.c

diff --git a/drivers/video/fbdev/omap/Kconfig b/drivers/video/fbdev/omap/Kconfig
index b1786cf1b486..a6548283451f 100644
--- a/drivers/video/fbdev/omap/Kconfig
+++ b/drivers/video/fbdev/omap/Kconfig
@@ -40,15 +40,6 @@ config FB_OMAP_LCD_MIPID
 	  the Mobile Industry Processor Interface DBI-C/DCS
 	  specification. (Supported LCDs: Philips LPH8923, Sharp LS041Y3)
 
-config FB_OMAP_LCD_H3
-	bool "TPS65010 LCD controller on OMAP-H3"
-	depends on MACH_OMAP_H3 || COMPILE_TEST
-	depends on TPS65010=y
-	default y
-	help
-	  Say Y here if you want to have support for the LCD on the
-	  H3 board.
-
 config FB_OMAP_DMA_TUNE
 	bool "Set DMA SDRAM access priority high"
 	depends on FB_OMAP
diff --git a/drivers/video/fbdev/omap/Makefile b/drivers/video/fbdev/omap/Makefile
index b88e02f5cb1f..504edb9c09dd 100644
--- a/drivers/video/fbdev/omap/Makefile
+++ b/drivers/video/fbdev/omap/Makefile
@@ -17,16 +17,10 @@ objs-y$(CONFIG_FB_OMAP_LCDC_EXTERNAL) += sossi.o
 objs-y$(CONFIG_FB_OMAP_LCDC_HWA742) += hwa742.o
 
 lcds-y$(CONFIG_MACH_AMS_DELTA) += lcd_ams_delta.o
-lcds-y$(CONFIG_FB_OMAP_LCD_H3) += lcd_h3.o
 lcds-y$(CONFIG_MACH_OMAP_PALMTE) += lcd_palmte.o
-lcds-y$(CONFIG_MACH_OMAP_PALMTT) += lcd_palmtt.o
-lcds-y$(CONFIG_MACH_OMAP_PALMZ71) += lcd_palmz71.o
-lcds-$(CONFIG_ARCH_OMAP16XX)$(CONFIG_MACH_OMAP_INNOVATOR) += lcd_inn1610.o
-lcds-$(CONFIG_ARCH_OMAP15XX)$(CONFIG_MACH_OMAP_INNOVATOR) += lcd_inn1510.o
 lcds-y$(CONFIG_MACH_OMAP_OSK) += lcd_osk.o
 
 lcds-y$(CONFIG_FB_OMAP_LCD_MIPID) += lcd_mipid.o
-lcds-y$(CONFIG_MACH_HERALD) += lcd_htcherald.o
 
 omapfb-objs := $(objs-yy)
 
diff --git a/drivers/video/fbdev/omap/lcd_h3.c b/drivers/video/fbdev/omap/lcd_h3.c
deleted file mode 100644
index 1766dff767bb..000000000000
--- a/drivers/video/fbdev/omap/lcd_h3.c
+++ /dev/null
@@ -1,82 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * LCD panel support for the TI OMAP H3 board
- *
- * Copyright (C) 2004 Nokia Corporation
- * Author: Imre Deak <imre.deak@nokia.com>
- */
-
-#include <linux/module.h>
-#include <linux/platform_device.h>
-#include <linux/mfd/tps65010.h>
-#include <linux/gpio.h>
-
-#include "omapfb.h"
-
-#define MODULE_NAME	"omapfb-lcd_h3"
-
-static int h3_panel_enable(struct lcd_panel *panel)
-{
-	int r = 0;
-
-	/* GPIO1 and GPIO2 of TPS65010 send LCD_ENBKL and LCD_ENVDD signals */
-	r = tps65010_set_gpio_out_value(GPIO1, HIGH);
-	if (!r)
-		r = tps65010_set_gpio_out_value(GPIO2, HIGH);
-	if (r)
-		pr_err(MODULE_NAME ": Unable to turn on LCD panel\n");
-
-	return r;
-}
-
-static void h3_panel_disable(struct lcd_panel *panel)
-{
-	int r = 0;
-
-	/* GPIO1 and GPIO2 of TPS65010 send LCD_ENBKL and LCD_ENVDD signals */
-	r = tps65010_set_gpio_out_value(GPIO1, LOW);
-	if (!r)
-		tps65010_set_gpio_out_value(GPIO2, LOW);
-	if (r)
-		pr_err(MODULE_NAME ": Unable to turn off LCD panel\n");
-}
-
-static struct lcd_panel h3_panel = {
-	.name		= "h3",
-	.config		= OMAP_LCDC_PANEL_TFT,
-
-	.data_lines	= 16,
-	.bpp		= 16,
-	.x_res		= 240,
-	.y_res		= 320,
-	.pixel_clock	= 12000,
-	.hsw		= 12,
-	.hfp		= 14,
-	.hbp		= 72 - 12,
-	.vsw		= 1,
-	.vfp		= 1,
-	.vbp		= 0,
-	.pcd		= 0,
-
-	.enable		= h3_panel_enable,
-	.disable	= h3_panel_disable,
-};
-
-static int h3_panel_probe(struct platform_device *pdev)
-{
-	omapfb_register_panel(&h3_panel);
-	return 0;
-}
-
-static struct platform_driver h3_panel_driver = {
-	.probe		= h3_panel_probe,
-	.driver		= {
-		.name	= "lcd_h3",
-	},
-};
-
-module_platform_driver(h3_panel_driver);
-
-MODULE_AUTHOR("Imre Deak");
-MODULE_DESCRIPTION("LCD panel support for the TI OMAP H3 board");
-MODULE_LICENSE("GPL");
diff --git a/drivers/video/fbdev/omap/lcd_htcherald.c b/drivers/video/fbdev/omap/lcd_htcherald.c
deleted file mode 100644
index d1c615c516dd..000000000000
--- a/drivers/video/fbdev/omap/lcd_htcherald.c
+++ /dev/null
@@ -1,59 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * File: drivers/video/omap/lcd-htcherald.c
- *
- * LCD panel support for the HTC Herald
- *
- * Copyright (C) 2009 Cory Maccarrone <darkstar6262@gmail.com>
- * Copyright (C) 2009 Wing Linux
- *
- * Based on the lcd_htcwizard.c file from the linwizard project:
- * Copyright (C) linwizard.sourceforge.net
- * Author: Angelo Arrifano <miknix@gmail.com>
- * Based on lcd_h4 by Imre Deak <imre.deak@nokia.com>
- */
-
-#include <linux/module.h>
-#include <linux/platform_device.h>
-
-#include "omapfb.h"
-
-/* Found on WIZ200 (miknix) and some HERA110 models (darkstar62) */
-static struct lcd_panel htcherald_panel_1 = {
-	.name		= "lcd_herald",
-	.config		= OMAP_LCDC_PANEL_TFT |
-			  OMAP_LCDC_INV_HSYNC |
-			  OMAP_LCDC_INV_VSYNC |
-			  OMAP_LCDC_INV_PIX_CLOCK,
-	.bpp		= 16,
-	.data_lines	= 16,
-	.x_res		= 240,
-	.y_res		= 320,
-	.pixel_clock	= 6093,
-	.pcd		= 0, /* 15 */
-	.hsw		= 10,
-	.hfp		= 10,
-	.hbp		= 20,
-	.vsw		= 3,
-	.vfp		= 2,
-	.vbp		= 2,
-};
-
-static int htcherald_panel_probe(struct platform_device *pdev)
-{
-	omapfb_register_panel(&htcherald_panel_1);
-	return 0;
-}
-
-static struct platform_driver htcherald_panel_driver = {
-	.probe		= htcherald_panel_probe,
-	.driver		= {
-		.name	= "lcd_htcherald",
-	},
-};
-
-module_platform_driver(htcherald_panel_driver);
-
-MODULE_AUTHOR("Cory Maccarrone");
-MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION("LCD panel support for the HTC Herald");
diff --git a/drivers/video/fbdev/omap/lcd_inn1510.c b/drivers/video/fbdev/omap/lcd_inn1510.c
deleted file mode 100644
index bb915637e9b6..000000000000
--- a/drivers/video/fbdev/omap/lcd_inn1510.c
+++ /dev/null
@@ -1,69 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * LCD panel support for the TI OMAP1510 Innovator board
- *
- * Copyright (C) 2004 Nokia Corporation
- * Author: Imre Deak <imre.deak@nokia.com>
- */
-
-#include <linux/module.h>
-#include <linux/platform_device.h>
-#include <linux/io.h>
-
-#include <linux/soc/ti/omap1-soc.h>
-
-#include "omapfb.h"
-
-static void __iomem *omap1510_fpga_lcd_panel_control;
-
-static int innovator1510_panel_enable(struct lcd_panel *panel)
-{
-	__raw_writeb(0x7, omap1510_fpga_lcd_panel_control);
-	return 0;
-}
-
-static void innovator1510_panel_disable(struct lcd_panel *panel)
-{
-	__raw_writeb(0x0, omap1510_fpga_lcd_panel_control);
-}
-
-static struct lcd_panel innovator1510_panel = {
-	.name		= "inn1510",
-	.config		= OMAP_LCDC_PANEL_TFT,
-
-	.bpp		= 16,
-	.data_lines	= 16,
-	.x_res		= 240,
-	.y_res		= 320,
-	.pixel_clock	= 12500,
-	.hsw		= 40,
-	.hfp		= 40,
-	.hbp		= 72,
-	.vsw		= 1,
-	.vfp		= 1,
-	.vbp		= 0,
-	.pcd		= 12,
-
-	.enable		= innovator1510_panel_enable,
-	.disable	= innovator1510_panel_disable,
-};
-
-static int innovator1510_panel_probe(struct platform_device *pdev)
-{
-	omap1510_fpga_lcd_panel_control = (void __iomem *)pdev->dev.platform_data;
-	omapfb_register_panel(&innovator1510_panel);
-	return 0;
-}
-
-static struct platform_driver innovator1510_panel_driver = {
-	.probe		= innovator1510_panel_probe,
-	.driver		= {
-		.name	= "lcd_inn1510",
-	},
-};
-
-module_platform_driver(innovator1510_panel_driver);
-
-MODULE_AUTHOR("Imre Deak");
-MODULE_DESCRIPTION("LCD panel support for the TI OMAP1510 Innovator board");
-MODULE_LICENSE("GPL");
diff --git a/drivers/video/fbdev/omap/lcd_inn1610.c b/drivers/video/fbdev/omap/lcd_inn1610.c
deleted file mode 100644
index 901b28f35fab..000000000000
--- a/drivers/video/fbdev/omap/lcd_inn1610.c
+++ /dev/null
@@ -1,99 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * LCD panel support for the TI OMAP1610 Innovator board
- *
- * Copyright (C) 2004 Nokia Corporation
- * Author: Imre Deak <imre.deak@nokia.com>
- */
-
-#include <linux/module.h>
-#include <linux/platform_device.h>
-
-#include <linux/gpio.h>
-#include "omapfb.h"
-
-#define MODULE_NAME	"omapfb-lcd_h3"
-
-static int innovator1610_panel_init(struct lcd_panel *panel,
-				    struct omapfb_device *fbdev)
-{
-	int r = 0;
-
-	/* configure GPIO(14, 15) as outputs */
-	if (gpio_request_one(14, GPIOF_OUT_INIT_LOW, "lcd_en0")) {
-		pr_err(MODULE_NAME ": can't request GPIO 14\n");
-		r = -1;
-		goto exit;
-	}
-	if (gpio_request_one(15, GPIOF_OUT_INIT_LOW, "lcd_en1")) {
-		pr_err(MODULE_NAME ": can't request GPIO 15\n");
-		gpio_free(14);
-		r = -1;
-		goto exit;
-	}
-exit:
-	return r;
-}
-
-static void innovator1610_panel_cleanup(struct lcd_panel *panel)
-{
-	gpio_free(15);
-	gpio_free(14);
-}
-
-static int innovator1610_panel_enable(struct lcd_panel *panel)
-{
-	/* set GPIO14 and GPIO15 high */
-	gpio_set_value(14, 1);
-	gpio_set_value(15, 1);
-	return 0;
-}
-
-static void innovator1610_panel_disable(struct lcd_panel *panel)
-{
-	/* set GPIO13, GPIO14 and GPIO15 low */
-	gpio_set_value(14, 0);
-	gpio_set_value(15, 0);
-}
-
-static struct lcd_panel innovator1610_panel = {
-	.name		= "inn1610",
-	.config		= OMAP_LCDC_PANEL_TFT,
-
-	.bpp		= 16,
-	.data_lines	= 16,
-	.x_res		= 320,
-	.y_res		= 240,
-	.pixel_clock	= 12500,
-	.hsw		= 40,
-	.hfp		= 40,
-	.hbp		= 72,
-	.vsw		= 1,
-	.vfp		= 1,
-	.vbp		= 0,
-	.pcd		= 12,
-
-	.init		= innovator1610_panel_init,
-	.cleanup	= innovator1610_panel_cleanup,
-	.enable		= innovator1610_panel_enable,
-	.disable	= innovator1610_panel_disable,
-};
-
-static int innovator1610_panel_probe(struct platform_device *pdev)
-{
-	omapfb_register_panel(&innovator1610_panel);
-	return 0;
-}
-
-static struct platform_driver innovator1610_panel_driver = {
-	.probe		= innovator1610_panel_probe,
-	.driver		= {
-		.name	= "lcd_inn1610",
-	},
-};
-
-module_platform_driver(innovator1610_panel_driver);
-
-MODULE_AUTHOR("Imre Deak");
-MODULE_DESCRIPTION("LCD panel support for the TI OMAP1610 Innovator board");
-MODULE_LICENSE("GPL");
diff --git a/drivers/video/fbdev/omap/lcd_palmtt.c b/drivers/video/fbdev/omap/lcd_palmtt.c
deleted file mode 100644
index 703af0bc5c92..000000000000
--- a/drivers/video/fbdev/omap/lcd_palmtt.c
+++ /dev/null
@@ -1,65 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * LCD panel support for Palm Tungsten|T
- * Current version : Marek Vasut <marek.vasut@gmail.com>
- *
- * Modified from lcd_inn1510.c
- */
-
-/*
-GPIO11 - backlight
-GPIO12 - screen blanking
-GPIO13 - screen blanking
-*/
-
-#include <linux/platform_device.h>
-#include <linux/module.h>
-#include <linux/io.h>
-#include <linux/gpio.h>
-
-#include "omapfb.h"
-
-static unsigned long palmtt_panel_get_caps(struct lcd_panel *panel)
-{
-	return OMAPFB_CAPS_SET_BACKLIGHT;
-}
-
-static struct lcd_panel palmtt_panel = {
-	.name		= "palmtt",
-	.config		= OMAP_LCDC_PANEL_TFT | OMAP_LCDC_INV_VSYNC |
-			OMAP_LCDC_INV_HSYNC | OMAP_LCDC_HSVS_RISING_EDGE |
-			OMAP_LCDC_HSVS_OPPOSITE,
-	.bpp		= 16,
-	.data_lines	= 16,
-	.x_res		= 320,
-	.y_res		= 320,
-	.pixel_clock	= 10000,
-	.hsw		= 4,
-	.hfp		= 8,
-	.hbp		= 28,
-	.vsw		= 1,
-	.vfp		= 8,
-	.vbp		= 7,
-	.pcd		= 0,
-
-	.get_caps	= palmtt_panel_get_caps,
-};
-
-static int palmtt_panel_probe(struct platform_device *pdev)
-{
-	omapfb_register_panel(&palmtt_panel);
-	return 0;
-}
-
-static struct platform_driver palmtt_panel_driver = {
-	.probe		= palmtt_panel_probe,
-	.driver		= {
-		.name	= "lcd_palmtt",
-	},
-};
-
-module_platform_driver(palmtt_panel_driver);
-
-MODULE_AUTHOR("Marek Vasut <marek.vasut@gmail.com>");
-MODULE_DESCRIPTION("LCD panel support for Palm Tungsten|T");
-MODULE_LICENSE("GPL");
diff --git a/drivers/video/fbdev/omap/lcd_palmz71.c b/drivers/video/fbdev/omap/lcd_palmz71.c
deleted file mode 100644
index a955c908ab14..000000000000
--- a/drivers/video/fbdev/omap/lcd_palmz71.c
+++ /dev/null
@@ -1,59 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * LCD panel support for the Palm Zire71
- *
- * Original version : Romain Goyet
- * Current version : Laurent Gonzalez
- * Modified for zire71 : Marek Vasut
- */
-
-#include <linux/module.h>
-#include <linux/platform_device.h>
-#include <linux/io.h>
-
-#include "omapfb.h"
-
-static unsigned long palmz71_panel_get_caps(struct lcd_panel *panel)
-{
-	return OMAPFB_CAPS_SET_BACKLIGHT;
-}
-
-static struct lcd_panel palmz71_panel = {
-	.name		= "palmz71",
-	.config		= OMAP_LCDC_PANEL_TFT | OMAP_LCDC_INV_VSYNC |
-			  OMAP_LCDC_INV_HSYNC | OMAP_LCDC_HSVS_RISING_EDGE |
-			  OMAP_LCDC_HSVS_OPPOSITE,
-	.data_lines	= 16,
-	.bpp		= 16,
-	.pixel_clock	= 24000,
-	.x_res		= 320,
-	.y_res		= 320,
-	.hsw		= 4,
-	.hfp		= 8,
-	.hbp		= 28,
-	.vsw		= 1,
-	.vfp		= 8,
-	.vbp		= 7,
-	.pcd		= 0,
-
-	.get_caps	= palmz71_panel_get_caps,
-};
-
-static int palmz71_panel_probe(struct platform_device *pdev)
-{
-	omapfb_register_panel(&palmz71_panel);
-	return 0;
-}
-
-static struct platform_driver palmz71_panel_driver = {
-	.probe		= palmz71_panel_probe,
-	.driver		= {
-		.name	= "lcd_palmz71",
-	},
-};
-
-module_platform_driver(palmz71_panel_driver);
-
-MODULE_AUTHOR("Romain Goyet, Laurent Gonzalez, Marek Vasut");
-MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION("LCD panel support for the Palm Zire71");
-- 
2.29.2

