Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6BEE507385
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 18:44:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7880110F116;
	Tue, 19 Apr 2022 16:44:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0675110F11B
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 16:44:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A0723B81BFC;
 Tue, 19 Apr 2022 16:44:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21D49C385B6;
 Tue, 19 Apr 2022 16:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650386660;
 bh=/6iIOutIe2dthl0F9tUwRrWmTz1Y+vHGyZSNFuNK4W0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=r9TzRbN2wJ9anV7WP0E3rP1S1Cki++xSivN4dBdyNHhyWwMh/MI+BtyAeqgYlBYXV
 ItPRfCU6w7MqI+MFhEsR5oorVEigDVDTfLVzE3yCgnLfKVyWW3gfUdTAbpfQ+0xMlv
 4h+YVQk5XgEEoQXPsOwj0Fou41j1UM7Ct/jvU8LRL/8ndMFQ+B79JydmegZ2DAQ0SW
 JwbK17hawoV1JcDkXQOweIbtoMS6G5Dy/AtPICtIdIqThqKAcNwIk2Z+V0Gk8YY1UC
 qolXwRGVZyysQKzmwpm1PVfh5Wsw43vmB7v0Jz+vdy/0bIr6cZp8M8u+LOSFSklyM5
 I5AkVeQlQC3Hw==
From: Arnd Bergmann <arnd@kernel.org>
To: robert.jarzmik@free.fr,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 42/48] ARM: mmp: remove tavorevb board support
Date: Tue, 19 Apr 2022 18:38:04 +0200
Message-Id: <20220419163810.2118169-43-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220419163810.2118169-1-arnd@kernel.org>
References: <20220419163810.2118169-1-arnd@kernel.org>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-usb@vger.kernel.org,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, linux-fbdev@vger.kernel.org,
 Dominik Brodowski <linux@dominikbrodowski.net>, linux-mips@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-mtd@lists.infradead.org,
 Tomas Cech <sleep_walker@suse.com>, linux-clk@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-rtc@vger.kernel.org,
 Helge Deller <deller@gmx.de>, Marek Vasut <marek.vasut@gmail.com>,
 Paul Parsons <lost.distance@yahoo.com>, Sergey Lapin <slapin@ossfans.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org,
 linux-input@vger.kernel.org, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Lubomir Rintel <lkundrak@v3.sk>, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Stephen Boyd <sboyd@kernel.org>, patches@opensource.cirrus.com,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 alsa-devel@alsa-project.org, Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

There are two tavorevb boards in the kernel, one using a PXA930 chip in
mach-pxa, and one using the later PXA910 chip in mach-mmp.  They use the
same board number, which is generally a bad idea, and in a multiplatform
kernel, we can end up with funny link errors like this one resulting
from two boards gettting controlled by the same Kconfig symbol:

arch/arm/mach-mmp/tavorevb.o: In function `tavorevb_init':
tavorevb.c:(.init.text+0x4c): undefined reference to `pxa910_device_uart1'
tavorevb.c:(.init.text+0x50): undefined reference to `pxa910_device_gpio'
tavorevb.o:(.arch.info.init+0x54): undefined reference to `pxa910_init_irq'
tavorevb.o:(.arch.info.init+0x58): undefined reference to `pxa910_timer_init'

The mach-pxa TavorEVB seems much more complete than the mach-mmp one
that supports only uart, gpio and ethernet. Further, I could find no
information about the board on the internet aside from references to
the Linux kernel, so I assume this was never available outside of Marvell
and can be removed entirely.

There is a third board named TavorEVB in the Kconfig description,
but this refers to the "TTC_DKB" machine. The two are clearly
related, so I change the Kconfig description to just list both
names.

Cc: Lubomir Rintel <lkundrak@v3.sk>
Reviewed-by: Lubomir Rintel <lkundrak@v3.sk>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-mmp/Kconfig    |  10 +---
 arch/arm/mach-mmp/Makefile   |   1 -
 arch/arm/mach-mmp/tavorevb.c | 113 -----------------------------------
 3 files changed, 1 insertion(+), 123 deletions(-)
 delete mode 100644 arch/arm/mach-mmp/tavorevb.c

diff --git a/arch/arm/mach-mmp/Kconfig b/arch/arm/mach-mmp/Kconfig
index 0dd999212944..92a730a573b9 100644
--- a/arch/arm/mach-mmp/Kconfig
+++ b/arch/arm/mach-mmp/Kconfig
@@ -39,16 +39,8 @@ config MACH_AVENGERS_LITE
 	  Say 'Y' here if you want to support the Marvell PXA168-based
 	  Avengers Lite Development Board.
 
-config MACH_TAVOREVB
-	bool "Marvell's PXA910 TavorEVB Development Board"
-	depends on ARCH_MULTI_V5
-	select CPU_PXA910
-	help
-	  Say 'Y' here if you want to support the Marvell PXA910-based
-	  TavorEVB Development Board.
-
 config MACH_TTC_DKB
-	bool "Marvell's PXA910 TavorEVB Development Board"
+	bool "Marvell's PXA910 TavorEVB/TTC_DKB Development Board"
 	depends on ARCH_MULTI_V5
 	select CPU_PXA910
 	help
diff --git a/arch/arm/mach-mmp/Makefile b/arch/arm/mach-mmp/Makefile
index e3758f7e1fe7..81338db77ec7 100644
--- a/arch/arm/mach-mmp/Makefile
+++ b/arch/arm/mach-mmp/Makefile
@@ -24,7 +24,6 @@ endif
 obj-$(CONFIG_MACH_ASPENITE)	+= aspenite.o
 obj-$(CONFIG_MACH_ZYLONITE2)	+= aspenite.o
 obj-$(CONFIG_MACH_AVENGERS_LITE)+= avengers_lite.o
-obj-$(CONFIG_MACH_TAVOREVB)	+= tavorevb.o
 obj-$(CONFIG_MACH_TTC_DKB)	+= ttc_dkb.o
 obj-$(CONFIG_MACH_BROWNSTONE)	+= brownstone.o
 obj-$(CONFIG_MACH_FLINT)	+= flint.o
diff --git a/arch/arm/mach-mmp/tavorevb.c b/arch/arm/mach-mmp/tavorevb.c
deleted file mode 100644
index 3261d2322198..000000000000
--- a/arch/arm/mach-mmp/tavorevb.c
+++ /dev/null
@@ -1,113 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- *  linux/arch/arm/mach-mmp/tavorevb.c
- *
- *  Support for the Marvell PXA910-based TavorEVB Development Platform.
- */
-#include <linux/gpio.h>
-#include <linux/gpio-pxa.h>
-#include <linux/init.h>
-#include <linux/kernel.h>
-#include <linux/platform_device.h>
-#include <linux/smc91x.h>
-
-#include <asm/mach-types.h>
-#include <asm/mach/arch.h>
-#include "addr-map.h"
-#include "mfp-pxa910.h"
-#include "pxa910.h"
-#include "irqs.h"
-
-#include "common.h"
-
-static unsigned long tavorevb_pin_config[] __initdata = {
-	/* UART2 */
-	GPIO47_UART2_RXD,
-	GPIO48_UART2_TXD,
-
-	/* SMC */
-	SM_nCS0_nCS0,
-	SM_ADV_SM_ADV,
-	SM_SCLK_SM_SCLK,
-	SM_SCLK_SM_SCLK,
-	SM_BE0_SM_BE0,
-	SM_BE1_SM_BE1,
-
-	/* DFI */
-	DF_IO0_ND_IO0,
-	DF_IO1_ND_IO1,
-	DF_IO2_ND_IO2,
-	DF_IO3_ND_IO3,
-	DF_IO4_ND_IO4,
-	DF_IO5_ND_IO5,
-	DF_IO6_ND_IO6,
-	DF_IO7_ND_IO7,
-	DF_IO8_ND_IO8,
-	DF_IO9_ND_IO9,
-	DF_IO10_ND_IO10,
-	DF_IO11_ND_IO11,
-	DF_IO12_ND_IO12,
-	DF_IO13_ND_IO13,
-	DF_IO14_ND_IO14,
-	DF_IO15_ND_IO15,
-	DF_nCS0_SM_nCS2_nCS0,
-	DF_ALE_SM_WEn_ND_ALE,
-	DF_CLE_SM_OEn_ND_CLE,
-	DF_WEn_DF_WEn,
-	DF_REn_DF_REn,
-	DF_RDY0_DF_RDY0,
-};
-
-static struct pxa_gpio_platform_data pxa910_gpio_pdata = {
-	.irq_base	= MMP_GPIO_TO_IRQ(0),
-};
-
-static struct smc91x_platdata tavorevb_smc91x_info = {
-	.flags	= SMC91X_USE_16BIT | SMC91X_NOWAIT,
-};
-
-static struct resource smc91x_resources[] = {
-	[0] = {
-		.start	= SMC_CS1_PHYS_BASE + 0x300,
-		.end	= SMC_CS1_PHYS_BASE + 0xfffff,
-		.flags	= IORESOURCE_MEM,
-	},
-	[1] = {
-		.start	= MMP_GPIO_TO_IRQ(80),
-		.end	= MMP_GPIO_TO_IRQ(80),
-		.flags	= IORESOURCE_IRQ | IORESOURCE_IRQ_HIGHEDGE,
-	}
-};
-
-static struct platform_device smc91x_device = {
-	.name		= "smc91x",
-	.id		= 0,
-	.dev		= {
-		.platform_data = &tavorevb_smc91x_info,
-	},
-	.num_resources	= ARRAY_SIZE(smc91x_resources),
-	.resource	= smc91x_resources,
-};
-
-static void __init tavorevb_init(void)
-{
-	mfp_config(ARRAY_AND_SIZE(tavorevb_pin_config));
-
-	/* on-chip devices */
-	pxa910_add_uart(1);
-	platform_device_add_data(&pxa910_device_gpio, &pxa910_gpio_pdata,
-				 sizeof(struct pxa_gpio_platform_data));
-	platform_device_register(&pxa910_device_gpio);
-
-	/* off-chip devices */
-	platform_device_register(&smc91x_device);
-}
-
-MACHINE_START(TAVOREVB, "PXA910 Evaluation Board (aka TavorEVB)")
-	.map_io		= mmp_map_io,
-	.nr_irqs	= MMP_NR_IRQS,
-	.init_irq       = pxa910_init_irq,
-	.init_time	= pxa910_timer_init,
-	.init_machine   = tavorevb_init,
-	.restart	= mmp_restart,
-MACHINE_END
-- 
2.29.2

