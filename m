Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2EE506DB2
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 15:39:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6D5A10EF95;
	Tue, 19 Apr 2022 13:39:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99F9410EF95
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 13:39:53 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0C647616A3;
 Tue, 19 Apr 2022 13:39:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 356D1C385B0;
 Tue, 19 Apr 2022 13:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650375592;
 bh=8q6Kcm45o4hfMaS4KO2xUUwlzHF/dRLSCx2ycbmM2jM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OgmmYGrmtBNTwP0hCIY2RRe2mYaIftLuJ9OAVdYZvDleZcdZ/6LPlvQThD8t4drPE
 e4GTt4uIWh8cT6kZaI5XpPeUyLnOtfrJOYRguM9hj4PAws3Nw6EJsErSkHU1o96SDp
 CJK1ClRy1PNIBDwJEdrTaAupJfBbsWzoUyxDI/TgIMrsKD8viQ8fdfp8EJGbT+yU0/
 8XgF5eboJCt8z5/M3YL3N4OJjP2al4MR7iSjKD4PDfsLgdyuBVPNvGv/0iJ/g176J+
 GpCXmp/q9iOjw7VrGYG72DN9pQVr66GHwhD+MR1FtySUnjMsgDitc2xmLrwnqX0sN8
 yniK00Bea96aQ==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-omap@vger.kernel.org, tony@atomide.com, aaro.koskinen@iki.fi,
 jmkrzyszt@gmail.com
Subject: [PATCH 18/41] ARM: omap: remove debug-leds driver
Date: Tue, 19 Apr 2022 15:37:00 +0200
Message-Id: <20220419133723.1394715-19-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220419133723.1394715-1-arnd@kernel.org>
References: <20220419133723.1394715-1-arnd@kernel.org>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-fbdev@vger.kernel.org,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Lee Jones <lee.jones@linaro.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Kevin Hilman <khilman@kernel.org>, Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Helge Deller <deller@gmx.de>, Russell King <linux@armlinux.org.uk>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alan Stern <stern@rowland.harvard.edu>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 Felipe Balbi <balbi@kernel.org>, Paul Walmsley <paul@pwsan.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org,
 alsa-devel@alsa-project.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

It has been impossible to select this driver for six years
without anyone noticing, so just kill it completely.

Fixes: 54ea18e8866a ("ARM: OMAP2+: Remove board file for H4")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/plat-omap/Kconfig      |  10 --
 arch/arm/plat-omap/Makefile     |   4 -
 arch/arm/plat-omap/debug-leds.c | 171 --------------------------------
 3 files changed, 185 deletions(-)
 delete mode 100644 arch/arm/plat-omap/debug-leds.c

diff --git a/arch/arm/plat-omap/Kconfig b/arch/arm/plat-omap/Kconfig
index dfa19d5030e3..dc53ea8e5bbb 100644
--- a/arch/arm/plat-omap/Kconfig
+++ b/arch/arm/plat-omap/Kconfig
@@ -11,16 +11,6 @@ config ARCH_OMAP_OTG
 
 comment "OMAP Feature Selections"
 
-config OMAP_DEBUG_DEVICES
-	bool
-	help
-	  For debug cards on TI reference boards.
-
-config OMAP_DEBUG_LEDS
-	def_bool y if NEW_LEDS
-	depends on OMAP_DEBUG_DEVICES
-	select LEDS_CLASS
-
 config POWER_AVS_OMAP
 	bool "AVS(Adaptive Voltage Scaling) support for OMAP IP versions 1&2"
 	depends on (ARCH_OMAP3 || ARCH_OMAP4) && PM
diff --git a/arch/arm/plat-omap/Makefile b/arch/arm/plat-omap/Makefile
index 98a7b607873a..68ccec9de106 100644
--- a/arch/arm/plat-omap/Makefile
+++ b/arch/arm/plat-omap/Makefile
@@ -7,7 +7,3 @@ ccflags-$(CONFIG_ARCH_MULTIPLATFORM) := -I$(srctree)/arch/arm/plat-omap/include
 
 # Common support
 obj-y := sram.o dma.o
-
-# omap_device support (OMAP2+ only at the moment)
-
-obj-$(CONFIG_OMAP_DEBUG_LEDS) += debug-leds.o
diff --git a/arch/arm/plat-omap/debug-leds.c b/arch/arm/plat-omap/debug-leds.c
deleted file mode 100644
index 2b698d074874..000000000000
--- a/arch/arm/plat-omap/debug-leds.c
+++ /dev/null
@@ -1,171 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * linux/arch/arm/plat-omap/debug-leds.c
- *
- * Copyright 2011 by Bryan Wu <bryan.wu@canonical.com>
- * Copyright 2003 by Texas Instruments Incorporated
- */
-
-#include <linux/kernel.h>
-#include <linux/init.h>
-#include <linux/platform_device.h>
-#include <linux/leds.h>
-#include <linux/io.h>
-#include <linux/platform_data/gpio-omap.h>
-#include <linux/slab.h>
-
-#include <asm/mach-types.h>
-
-/* Many OMAP development platforms reuse the same "debug board"; these
- * platforms include H2, H3, H4, and Perseus2.  There are 16 LEDs on the
- * debug board (all green), accessed through FPGA registers.
- */
-
-/* NOTE:  most boards don't have a static mapping for the FPGA ... */
-struct h2p2_dbg_fpga {
-	/* offset 0x00 */
-	u16		smc91x[8];
-	/* offset 0x10 */
-	u16		fpga_rev;
-	u16		board_rev;
-	u16		gpio_outputs;
-	u16		leds;
-	/* offset 0x18 */
-	u16		misc_inputs;
-	u16		lan_status;
-	u16		lan_reset;
-	u16		reserved0;
-	/* offset 0x20 */
-	u16		ps2_data;
-	u16		ps2_ctrl;
-	/* plus also 4 rs232 ports ... */
-};
-
-static struct h2p2_dbg_fpga __iomem *fpga;
-
-static u16 fpga_led_state;
-
-struct dbg_led {
-	struct led_classdev	cdev;
-	u16			mask;
-};
-
-static const struct {
-	const char *name;
-	const char *trigger;
-} dbg_leds[] = {
-	{ "dbg:d4", "heartbeat", },
-	{ "dbg:d5", "cpu0", },
-	{ "dbg:d6", "default-on", },
-	{ "dbg:d7", },
-	{ "dbg:d8", },
-	{ "dbg:d9", },
-	{ "dbg:d10", },
-	{ "dbg:d11", },
-	{ "dbg:d12", },
-	{ "dbg:d13", },
-	{ "dbg:d14", },
-	{ "dbg:d15", },
-	{ "dbg:d16", },
-	{ "dbg:d17", },
-	{ "dbg:d18", },
-	{ "dbg:d19", },
-};
-
-/*
- * The triggers lines up below will only be used if the
- * LED triggers are compiled in.
- */
-static void dbg_led_set(struct led_classdev *cdev,
-			      enum led_brightness b)
-{
-	struct dbg_led *led = container_of(cdev, struct dbg_led, cdev);
-	u16 reg;
-
-	reg = readw_relaxed(&fpga->leds);
-	if (b != LED_OFF)
-		reg |= led->mask;
-	else
-		reg &= ~led->mask;
-	writew_relaxed(reg, &fpga->leds);
-}
-
-static enum led_brightness dbg_led_get(struct led_classdev *cdev)
-{
-	struct dbg_led *led = container_of(cdev, struct dbg_led, cdev);
-	u16 reg;
-
-	reg = readw_relaxed(&fpga->leds);
-	return (reg & led->mask) ? LED_FULL : LED_OFF;
-}
-
-static int fpga_probe(struct platform_device *pdev)
-{
-	struct resource	*iomem;
-	int i;
-
-	iomem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!iomem)
-		return -ENODEV;
-
-	fpga = ioremap(iomem->start, resource_size(iomem));
-	writew_relaxed(0xff, &fpga->leds);
-
-	for (i = 0; i < ARRAY_SIZE(dbg_leds); i++) {
-		struct dbg_led *led;
-
-		led = kzalloc(sizeof(*led), GFP_KERNEL);
-		if (!led)
-			break;
-
-		led->cdev.name = dbg_leds[i].name;
-		led->cdev.brightness_set = dbg_led_set;
-		led->cdev.brightness_get = dbg_led_get;
-		led->cdev.default_trigger = dbg_leds[i].trigger;
-		led->mask = BIT(i);
-
-		if (led_classdev_register(NULL, &led->cdev) < 0) {
-			kfree(led);
-			break;
-		}
-	}
-
-	return 0;
-}
-
-static int fpga_suspend_noirq(struct device *dev)
-{
-	fpga_led_state = readw_relaxed(&fpga->leds);
-	writew_relaxed(0xff, &fpga->leds);
-
-	return 0;
-}
-
-static int fpga_resume_noirq(struct device *dev)
-{
-	writew_relaxed(~fpga_led_state, &fpga->leds);
-	return 0;
-}
-
-static const struct dev_pm_ops fpga_dev_pm_ops = {
-	.suspend_noirq = fpga_suspend_noirq,
-	.resume_noirq = fpga_resume_noirq,
-};
-
-static struct platform_driver led_driver = {
-	.driver.name	= "omap_dbg_led",
-	.driver.pm	= &fpga_dev_pm_ops,
-	.probe		= fpga_probe,
-};
-
-static int __init fpga_init(void)
-{
-	if (machine_is_omap_h4()
-			|| machine_is_omap_h3()
-			|| machine_is_omap_h2()
-			|| machine_is_omap_perseus2()
-			)
-		return platform_driver_register(&led_driver);
-	return 0;
-}
-fs_initcall(fpga_init);
-- 
2.29.2

