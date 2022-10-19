Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF78604B11
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 17:19:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91D3310F261;
	Wed, 19 Oct 2022 15:19:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74ABA10F261
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Oct 2022 15:19:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A59EF61756;
 Wed, 19 Oct 2022 15:19:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89FFBC433D6;
 Wed, 19 Oct 2022 15:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666192776;
 bh=kXSlIp1TRH3h6jAEF0j9o6n7BaKsFbpIUtKAlEcb1So=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SvNmNUCGiRPhVogaJFJ4r8oO5FhCUIfiygaAe/pkhPkwPQOW70xtyWntGpBCFUYSE
 sFP9YGrB9VEatMDlF7G9rZ40W7xKNedXYWB/+4D4TB6ITrA5q2B/GcgqSpUiy64prh
 zdfMXV2Yy1b31YE1sat/y0uKNC0j6jJ6awvs4ky8G5oQwcqVZ1u6RGm9kBkX6dpdqk
 tKqWqMJys5cwegg1NEZz0K6ueAiacfkRnJpeIPEIX/lrqUxu3Z+hpe/gKOZ88OWopT
 hrrUBpAaZyQchSanGdYKXZCP5KsVy3sNHxQoUjdEEJu98R6b1ZebXLwiuSiGtX6DGN
 2hER1HnRXCD+Q==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-arm-kernel@lists.infradead.org, Paul Walmsley <paul@pwsan.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>
Subject: [PATCH 14/17] ARM: omap1: remove dead code
Date: Wed, 19 Oct 2022 17:03:36 +0200
Message-Id: <20221019150410.3851944-14-arnd@kernel.org>
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
Cc: Felipe Balbi <balbi@kernel.org>, linux-fbdev@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-spi@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Alan Stern <stern@rowland.harvard.edu>,
 linux-omap@vger.kernel.org, Bin Liu <b-liu@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

After the removal of the unused board files, I went through the
omap1 code to look for code that no longer has any callers
and remove that.

In particular, support for the omap7xx/omap8xx family is now
completely unused, so I'm only leaving omap15xx/omap16xx/omap59xx.

Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc: Tony Lindgren <tony@atomide.com>
Cc: linux-omap@vger.kernel.org
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-omap1/clock_data.c   | 17 +-----
 arch/arm/mach-omap1/common.h       |  8 ---
 arch/arm/mach-omap1/devices.c      | 58 ++-----------------
 arch/arm/mach-omap1/dma.c          | 25 +-------
 arch/arm/mach-omap1/i2c.c          | 14 +----
 arch/arm/mach-omap1/io.c           | 24 --------
 arch/arm/mach-omap1/irq.c          | 20 +------
 arch/arm/mach-omap1/irqs.h         |  9 ---
 arch/arm/mach-omap1/mcbsp.c        | 83 ---------------------------
 arch/arm/mach-omap1/mtd-xip.h      |  4 --
 arch/arm/mach-omap1/mux.c          | 52 -----------------
 arch/arm/mach-omap1/pm.c           | 76 ++++---------------------
 arch/arm/mach-omap1/pm.h           | 39 +------------
 arch/arm/mach-omap1/serial.c       | 15 -----
 arch/arm/mach-omap1/sleep.S        | 80 --------------------------
 arch/arm/mach-omap1/sram-init.c    |  7 +--
 arch/arm/mach-omap1/usb.c          | 34 +++--------
 drivers/spi/spi-omap-uwire.c       | 16 +-----
 drivers/usb/gadget/udc/omap_udc.c  | 24 +-------
 drivers/usb/host/ohci-omap.c       |  6 +-
 drivers/usb/musb/musb_dma.h        | 11 +---
 drivers/usb/phy/phy-isp1301-omap.c | 91 +-----------------------------
 drivers/video/fbdev/omap/lcdc.c    |  2 -
 include/linux/soc/ti/omap1-soc.h   | 35 ------------
 24 files changed, 39 insertions(+), 711 deletions(-)

diff --git a/arch/arm/mach-omap1/clock_data.c b/arch/arm/mach-omap1/clock_data.c
index 96d846c37c43..c58d200e4816 100644
--- a/arch/arm/mach-omap1/clock_data.c
+++ b/arch/arm/mach-omap1/clock_data.c
@@ -720,8 +720,6 @@ int __init omap1_clk_init(void)
 		cpu_mask |= CK_16XX;
 	if (cpu_is_omap1510())
 		cpu_mask |= CK_1510;
-	if (cpu_is_omap7xx())
-		cpu_mask |= CK_7XX;
 	if (cpu_is_omap310())
 		cpu_mask |= CK_310;
 
@@ -730,9 +728,6 @@ int __init omap1_clk_init(void)
 	ck_dpll1_p = &ck_dpll1;
 	ck_ref_p = &ck_ref;
 
-	if (cpu_is_omap7xx())
-		ck_ref.rate = 13000000;
-
 	pr_info("Clocks: ARM_SYSST: 0x%04x DPLL_CTL: 0x%04x ARM_CKCTL: 0x%04x\n",
 		omap_readw(ARM_SYSST), omap_readw(DPLL_CTL),
 		omap_readw(ARM_CKCTL));
@@ -771,12 +766,6 @@ int __init omap1_clk_init(void)
 		}
 	}
 
-	if (machine_is_omap_perseus2() || machine_is_omap_fsample()) {
-		/* Select slicer output as OMAP input clock */
-		omap_writew(omap_readw(OMAP7XX_PCC_UPLD_CTRL) & ~0x1,
-				OMAP7XX_PCC_UPLD_CTRL);
-	}
-
 	/* Amstrad Delta wants BCLK high when inactive */
 	if (machine_is_ams_delta())
 		omap_writel(omap_readl(ULPD_CLOCK_CTRL) |
@@ -784,11 +773,7 @@ int __init omap1_clk_init(void)
 				ULPD_CLOCK_CTRL);
 
 	/* Turn off DSP and ARM_TIMXO. Make sure ARM_INTHCK is not divided */
-	/* (on 730, bit 13 must not be cleared) */
-	if (cpu_is_omap7xx())
-		omap_writew(omap_readw(ARM_CKCTL) & 0x2fff, ARM_CKCTL);
-	else
-		omap_writew(omap_readw(ARM_CKCTL) & 0x0fff, ARM_CKCTL);
+	omap_writew(omap_readw(ARM_CKCTL) & 0x0fff, ARM_CKCTL);
 
 	/* Put DSP/MPUI into reset until needed */
 	omap_writew(0, ARM_RSTCT1);
diff --git a/arch/arm/mach-omap1/common.h b/arch/arm/mach-omap1/common.h
index 5ceff05e15c0..3fd9ed9efb12 100644
--- a/arch/arm/mach-omap1/common.h
+++ b/arch/arm/mach-omap1/common.h
@@ -35,14 +35,6 @@
 #include "soc.h"
 #include "i2c.h"
 
-#if defined(CONFIG_ARCH_OMAP730) || defined(CONFIG_ARCH_OMAP850)
-void omap7xx_map_io(void);
-#else
-static inline void omap7xx_map_io(void)
-{
-}
-#endif
-
 #ifdef CONFIG_ARCH_OMAP15XX
 void omap1510_fpga_init_irq(void);
 void omap15xx_map_io(void);
diff --git a/arch/arm/mach-omap1/devices.c b/arch/arm/mach-omap1/devices.c
index 80e94770582a..42d1631cecc0 100644
--- a/arch/arm/mach-omap1/devices.c
+++ b/arch/arm/mach-omap1/devices.c
@@ -63,8 +63,6 @@ static void omap_init_rtc(void)
 static inline void omap_init_rtc(void) {}
 #endif
 
-static inline void omap_init_mbox(void) { }
-
 /*-------------------------------------------------------------------------*/
 
 #if IS_ENABLED(CONFIG_MMC_OMAP)
@@ -73,22 +71,16 @@ static inline void omap1_mmc_mux(struct omap_mmc_platform_data *mmc_controller,
 			int controller_nr)
 {
 	if (controller_nr == 0) {
-		if (cpu_is_omap7xx()) {
-			omap_cfg_reg(MMC_7XX_CMD);
-			omap_cfg_reg(MMC_7XX_CLK);
-			omap_cfg_reg(MMC_7XX_DAT0);
-		} else {
-			omap_cfg_reg(MMC_CMD);
-			omap_cfg_reg(MMC_CLK);
-			omap_cfg_reg(MMC_DAT0);
-		}
+		omap_cfg_reg(MMC_CMD);
+		omap_cfg_reg(MMC_CLK);
+		omap_cfg_reg(MMC_DAT0);
 
 		if (cpu_is_omap1710()) {
 			omap_cfg_reg(M15_1710_MMC_CLKI);
 			omap_cfg_reg(P19_1710_MMC_CMDDIR);
 			omap_cfg_reg(P20_1710_MMC_DATDIR0);
 		}
-		if (mmc_controller->slots[0].wires == 4 && !cpu_is_omap7xx()) {
+		if (mmc_controller->slots[0].wires == 4) {
 			omap_cfg_reg(MMC_DAT1);
 			/* NOTE: DAT2 can be on W10 (here) or M15 */
 			if (!mmc_controller->slots[0].nomux)
@@ -154,8 +146,6 @@ static int __init omap_mmc_add(const char *name, int id, unsigned long base,
 	res[3].name = "tx";
 	res[3].flags = IORESOURCE_DMA;
 
-	if (cpu_is_omap7xx())
-		data->slots[0].features = MMC_OMAP7XX;
 	if (cpu_is_omap15xx())
 		data->slots[0].features = MMC_OMAP15XX;
 	if (cpu_is_omap16xx())
@@ -224,43 +214,6 @@ void __init omap1_init_mmc(struct omap_mmc_platform_data **mmc_data,
 
 /*-------------------------------------------------------------------------*/
 
-/* OMAP7xx SPI support */
-#if IS_ENABLED(CONFIG_SPI_OMAP_100K)
-
-struct platform_device omap_spi1 = {
-	.name           = "omap1_spi100k",
-	.id             = 1,
-};
-
-struct platform_device omap_spi2 = {
-	.name           = "omap1_spi100k",
-	.id             = 2,
-};
-
-static void omap_init_spi100k(void)
-{
-	if (!cpu_is_omap7xx())
-		return;
-
-	omap_spi1.dev.platform_data = ioremap(OMAP7XX_SPI1_BASE, 0x7ff);
-	if (omap_spi1.dev.platform_data)
-		platform_device_register(&omap_spi1);
-
-	omap_spi2.dev.platform_data = ioremap(OMAP7XX_SPI2_BASE, 0x7ff);
-	if (omap_spi2.dev.platform_data)
-		platform_device_register(&omap_spi2);
-}
-
-#else
-static inline void omap_init_spi100k(void)
-{
-}
-#endif
-
-/*-------------------------------------------------------------------------*/
-
-static inline void omap_init_sti(void) {}
-
 /* Numbering for the SPI-capable controllers when used for SPI:
  * spi		= 1
  * uwire	= 2
@@ -363,10 +316,7 @@ static int __init omap1_init_devices(void)
 	 * in alphabetical order so they're easier to sort through.
 	 */
 
-	omap_init_mbox();
 	omap_init_rtc();
-	omap_init_spi100k();
-	omap_init_sti();
 	omap_init_uwire();
 	omap1_init_rng();
 
diff --git a/arch/arm/mach-omap1/dma.c b/arch/arm/mach-omap1/dma.c
index c3f280c3c5d7..756966cb715f 100644
--- a/arch/arm/mach-omap1/dma.c
+++ b/arch/arm/mach-omap1/dma.c
@@ -261,22 +261,6 @@ static const struct platform_device_info omap_dma_dev_info = {
 	.num_res = 1,
 };
 
-/* OMAP730, OMAP850 */
-static const struct dma_slave_map omap7xx_sdma_map[] = {
-	{ "omap-mcbsp.1", "tx", SDMA_FILTER_PARAM(8) },
-	{ "omap-mcbsp.1", "rx", SDMA_FILTER_PARAM(9) },
-	{ "omap-mcbsp.2", "tx", SDMA_FILTER_PARAM(10) },
-	{ "omap-mcbsp.2", "rx", SDMA_FILTER_PARAM(11) },
-	{ "mmci-omap.0", "tx", SDMA_FILTER_PARAM(21) },
-	{ "mmci-omap.0", "rx", SDMA_FILTER_PARAM(22) },
-	{ "omap_udc", "rx0", SDMA_FILTER_PARAM(26) },
-	{ "omap_udc", "rx1", SDMA_FILTER_PARAM(27) },
-	{ "omap_udc", "rx2", SDMA_FILTER_PARAM(28) },
-	{ "omap_udc", "tx0", SDMA_FILTER_PARAM(29) },
-	{ "omap_udc", "tx1", SDMA_FILTER_PARAM(30) },
-	{ "omap_udc", "tx2", SDMA_FILTER_PARAM(31) },
-};
-
 /* OMAP1510, OMAP1610*/
 static const struct dma_slave_map omap1xxx_sdma_map[] = {
 	{ "omap-mcbsp.1", "tx", SDMA_FILTER_PARAM(8) },
@@ -371,13 +355,8 @@ static int __init omap1_system_dma_init(void)
 	p.dma_attr = d;
 	p.errata = configure_dma_errata();
 
-	if (cpu_is_omap7xx()) {
-		p.slave_map = omap7xx_sdma_map;
-		p.slavecnt = ARRAY_SIZE(omap7xx_sdma_map);
-	} else {
-		p.slave_map = omap1xxx_sdma_map;
-		p.slavecnt = ARRAY_SIZE(omap1xxx_sdma_map);
-	}
+	p.slave_map = omap1xxx_sdma_map;
+	p.slavecnt = ARRAY_SIZE(omap1xxx_sdma_map);
 
 	ret = platform_device_add_data(pdev, &p, sizeof(p));
 	if (ret) {
diff --git a/arch/arm/mach-omap1/i2c.c b/arch/arm/mach-omap1/i2c.c
index 22f945360599..94d3e7883e02 100644
--- a/arch/arm/mach-omap1/i2c.c
+++ b/arch/arm/mach-omap1/i2c.c
@@ -25,13 +25,8 @@ static struct platform_device omap_i2c_devices[1] = {
 
 static void __init omap1_i2c_mux_pins(int bus_id)
 {
-	if (cpu_is_omap7xx()) {
-		omap_cfg_reg(I2C_7XX_SDA);
-		omap_cfg_reg(I2C_7XX_SCL);
-	} else {
-		omap_cfg_reg(I2C_SDA);
-		omap_cfg_reg(I2C_SCL);
-	}
+	omap_cfg_reg(I2C_SDA);
+	omap_cfg_reg(I2C_SCL);
 }
 
 int __init omap_i2c_add_bus(struct omap_i2c_bus_platform_data *pdata,
@@ -68,10 +63,7 @@ int __init omap_i2c_add_bus(struct omap_i2c_bus_platform_data *pdata,
 
 	/* how the cpu bus is wired up differs for 7xx only */
 
-	if (cpu_is_omap7xx())
-		pdata->flags |= OMAP_I2C_FLAG_BUS_SHIFT_1;
-	else
-		pdata->flags |= OMAP_I2C_FLAG_BUS_SHIFT_2;
+	pdata->flags |= OMAP_I2C_FLAG_BUS_SHIFT_2;
 
 	pdev->dev.platform_data = pdata;
 
diff --git a/arch/arm/mach-omap1/io.c b/arch/arm/mach-omap1/io.c
index d2db9b8aed3f..72657413795f 100644
--- a/arch/arm/mach-omap1/io.c
+++ b/arch/arm/mach-omap1/io.c
@@ -31,22 +31,6 @@ static struct map_desc omap_io_desc[] __initdata = {
 	}
 };
 
-#if defined (CONFIG_ARCH_OMAP730) || defined (CONFIG_ARCH_OMAP850)
-static struct map_desc omap7xx_io_desc[] __initdata = {
-	{
-		.virtual	= OMAP7XX_DSP_BASE,
-		.pfn		= __phys_to_pfn(OMAP7XX_DSP_START),
-		.length		= OMAP7XX_DSP_SIZE,
-		.type		= MT_DEVICE
-	}, {
-		.virtual	= OMAP7XX_DSPREG_BASE,
-		.pfn		= __phys_to_pfn(OMAP7XX_DSPREG_START),
-		.length		= OMAP7XX_DSPREG_SIZE,
-		.type		= MT_DEVICE
-	}
-};
-#endif
-
 #ifdef CONFIG_ARCH_OMAP15XX
 static struct map_desc omap1510_io_desc[] __initdata = {
 	{
@@ -87,14 +71,6 @@ static void __init omap1_map_common_io(void)
 	iotable_init(omap_io_desc, ARRAY_SIZE(omap_io_desc));
 }
 
-#if defined (CONFIG_ARCH_OMAP730) || defined (CONFIG_ARCH_OMAP850)
-void __init omap7xx_map_io(void)
-{
-	omap1_map_common_io();
-	iotable_init(omap7xx_io_desc, ARRAY_SIZE(omap7xx_io_desc));
-}
-#endif
-
 #ifdef CONFIG_ARCH_OMAP15XX
 void __init omap15xx_map_io(void)
 {
diff --git a/arch/arm/mach-omap1/irq.c b/arch/arm/mach-omap1/irq.c
index 70868e9f19ac..9ccc784fd614 100644
--- a/arch/arm/mach-omap1/irq.c
+++ b/arch/arm/mach-omap1/irq.c
@@ -110,14 +110,6 @@ static void omap_irq_set_cfg(int irq, int fiq, int priority, int trigger)
 	irq_bank_writel(val, bank, offset);
 }
 
-#if defined (CONFIG_ARCH_OMAP730) || defined (CONFIG_ARCH_OMAP850)
-static struct omap_irq_bank omap7xx_irq_banks[] = {
-	{ .base_reg = OMAP_IH1_BASE,		.trigger_map = 0xb3f8e22f },
-	{ .base_reg = OMAP_IH2_BASE,		.trigger_map = 0xfdb9c1f2 },
-	{ .base_reg = OMAP_IH2_BASE + 0x100,	.trigger_map = 0x800040f3 },
-};
-#endif
-
 #ifdef CONFIG_ARCH_OMAP15XX
 static struct omap_irq_bank omap1510_irq_banks[] = {
 	{ .base_reg = OMAP_IH1_BASE,		.trigger_map = 0xb3febfff },
@@ -194,12 +186,6 @@ void __init omap1_init_irq(void)
 	int i, j, irq_base;
 	unsigned long nr_irqs;
 
-#if defined(CONFIG_ARCH_OMAP730) || defined(CONFIG_ARCH_OMAP850)
-	if (cpu_is_omap7xx()) {
-		irq_banks = omap7xx_irq_banks;
-		irq_bank_count = ARRAY_SIZE(omap7xx_irq_banks);
-	}
-#endif
 #ifdef CONFIG_ARCH_OMAP15XX
 	if (cpu_is_omap1510()) {
 		irq_banks = omap1510_irq_banks;
@@ -230,7 +216,7 @@ void __init omap1_init_irq(void)
 		pr_warn("Couldn't allocate IRQ numbers\n");
 		irq_base = 0;
 	}
-	omap_l2_irq = cpu_is_omap7xx() ? irq_base + 1 : irq_base;
+	omap_l2_irq = irq_base;
 	omap_l2_irq -= NR_IRQS_LEGACY;
 
 	domain = irq_domain_add_legacy(NULL, nr_irqs, irq_base, 0,
@@ -249,10 +235,6 @@ void __init omap1_init_irq(void)
 	irq_bank_writel(0x03, 0, IRQ_CONTROL_REG_OFFSET);
 	irq_bank_writel(0x03, 1, IRQ_CONTROL_REG_OFFSET);
 
-	/* Enable interrupts in global mask */
-	if (cpu_is_omap7xx())
-		irq_bank_writel(0x0, 0, IRQ_GMR_REG_OFFSET);
-
 	/* Install the interrupt handlers for each bank */
 	for (i = 0; i < irq_bank_count; i++) {
 		for (j = i * 32; j < (i + 1) * 32; j++) {
diff --git a/arch/arm/mach-omap1/irqs.h b/arch/arm/mach-omap1/irqs.h
index 2851acfe5ff3..3ab7050b1b6b 100644
--- a/arch/arm/mach-omap1/irqs.h
+++ b/arch/arm/mach-omap1/irqs.h
@@ -231,15 +231,6 @@
 #define IH_MPUIO_BASE		(OMAP_MAX_GPIO_LINES + IH_GPIO_BASE)
 #define OMAP_IRQ_END		(IH_MPUIO_BASE + 16)
 
-/* External FPGA handles interrupts on Innovator boards */
-#define	OMAP_FPGA_IRQ_BASE	(OMAP_IRQ_END)
-#ifdef	CONFIG_MACH_OMAP_INNOVATOR
-#define OMAP_FPGA_NR_IRQS	24
-#else
-#define OMAP_FPGA_NR_IRQS	0
-#endif
-#define OMAP_FPGA_IRQ_END	(OMAP_FPGA_IRQ_BASE + OMAP_FPGA_NR_IRQS)
-
 #define OMAP_IRQ_BIT(irq)	(1 << ((irq - NR_IRQS_LEGACY) % 32))
 
 #ifdef CONFIG_FIQ
diff --git a/arch/arm/mach-omap1/mcbsp.c b/arch/arm/mach-omap1/mcbsp.c
index 05c25c432449..72e399ec5ed9 100644
--- a/arch/arm/mach-omap1/mcbsp.c
+++ b/arch/arm/mach-omap1/mcbsp.c
@@ -89,83 +89,6 @@ static struct omap_mcbsp_ops omap1_mcbsp_ops = {
 #define OMAP1610_MCBSP2_BASE	0xfffb1000
 #define OMAP1610_MCBSP3_BASE	0xe1017000
 
-#if defined(CONFIG_ARCH_OMAP730) || defined(CONFIG_ARCH_OMAP850)
-struct resource omap7xx_mcbsp_res[][6] = {
-	{
-		{
-			.start = OMAP7XX_MCBSP1_BASE,
-			.end   = OMAP7XX_MCBSP1_BASE + SZ_256,
-			.flags = IORESOURCE_MEM,
-		},
-		{
-			.name  = "rx",
-			.start = INT_7XX_McBSP1RX,
-			.flags = IORESOURCE_IRQ,
-		},
-		{
-			.name  = "tx",
-			.start = INT_7XX_McBSP1TX,
-			.flags = IORESOURCE_IRQ,
-		},
-		{
-			.name  = "rx",
-			.start = 9,
-			.flags = IORESOURCE_DMA,
-		},
-		{
-			.name  = "tx",
-			.start = 8,
-			.flags = IORESOURCE_DMA,
-		},
-	},
-	{
-		{
-			.start = OMAP7XX_MCBSP2_BASE,
-			.end   = OMAP7XX_MCBSP2_BASE + SZ_256,
-			.flags = IORESOURCE_MEM,
-		},
-		{
-			.name  = "rx",
-			.start = INT_7XX_McBSP2RX,
-			.flags = IORESOURCE_IRQ,
-		},
-		{
-			.name  = "tx",
-			.start = INT_7XX_McBSP2TX,
-			.flags = IORESOURCE_IRQ,
-		},
-		{
-			.name  = "rx",
-			.start = 11,
-			.flags = IORESOURCE_DMA,
-		},
-		{
-			.name  = "tx",
-			.start = 10,
-			.flags = IORESOURCE_DMA,
-		},
-	},
-};
-
-#define omap7xx_mcbsp_res_0		omap7xx_mcbsp_res[0]
-
-static struct omap_mcbsp_platform_data omap7xx_mcbsp_pdata[] = {
-	{
-		.ops		= &omap1_mcbsp_ops,
-	},
-	{
-		.ops		= &omap1_mcbsp_ops,
-	},
-};
-#define OMAP7XX_MCBSP_RES_SZ		ARRAY_SIZE(omap7xx_mcbsp_res[1])
-#define OMAP7XX_MCBSP_COUNT		ARRAY_SIZE(omap7xx_mcbsp_res)
-#else
-#define omap7xx_mcbsp_res_0		NULL
-#define omap7xx_mcbsp_pdata		NULL
-#define OMAP7XX_MCBSP_RES_SZ		0
-#define OMAP7XX_MCBSP_COUNT		0
-#endif
-
 #ifdef CONFIG_ARCH_OMAP15XX
 struct resource omap15xx_mcbsp_res[][6] = {
 	{
@@ -418,12 +341,6 @@ static int __init omap1_mcbsp_init(void)
 	if (!cpu_class_is_omap1())
 		return -ENODEV;
 
-	if (cpu_is_omap7xx())
-		omap_mcbsp_register_board_cfg(omap7xx_mcbsp_res_0,
-					OMAP7XX_MCBSP_RES_SZ,
-					omap7xx_mcbsp_pdata,
-					OMAP7XX_MCBSP_COUNT);
-
 	if (cpu_is_omap15xx())
 		omap_mcbsp_register_board_cfg(omap15xx_mcbsp_res_0,
 					OMAP15XX_MCBSP_RES_SZ,
diff --git a/arch/arm/mach-omap1/mtd-xip.h b/arch/arm/mach-omap1/mtd-xip.h
index 5ae312ff08a1..cbeda46dd526 100644
--- a/arch/arm/mach-omap1/mtd-xip.h
+++ b/arch/arm/mach-omap1/mtd-xip.h
@@ -42,11 +42,7 @@ static inline unsigned long xip_omap_mpu_timer_read(int nr)
  * (see linux/mtd/xip.h)
  */
 
-#ifdef CONFIG_MACH_OMAP_PERSEUS2
-#define xip_elapsed_since(x)	(signed)((~xip_omap_mpu_timer_read(0) - (x)) / 7)
-#else
 #define xip_elapsed_since(x)	(signed)((~xip_omap_mpu_timer_read(0) - (x)) / 6)
-#endif
 
 /*
  * xip_cpu_idle() is used when waiting for a delay equal or larger than
diff --git a/arch/arm/mach-omap1/mux.c b/arch/arm/mach-omap1/mux.c
index 2d9458ff1d29..4456fbc8aa3d 100644
--- a/arch/arm/mach-omap1/mux.c
+++ b/arch/arm/mach-omap1/mux.c
@@ -21,52 +21,6 @@
 
 static struct omap_mux_cfg arch_mux_cfg;
 
-#if defined(CONFIG_ARCH_OMAP730) || defined(CONFIG_ARCH_OMAP850)
-static struct pin_config omap7xx_pins[] = {
-MUX_CFG_7XX("E2_7XX_KBR0",        12,   21,    0,   20,   1, 0)
-MUX_CFG_7XX("J7_7XX_KBR1",        12,   25,    0,   24,   1, 0)
-MUX_CFG_7XX("E1_7XX_KBR2",        12,   29,    0,   28,   1, 0)
-MUX_CFG_7XX("F3_7XX_KBR3",        13,    1,    0,    0,   1, 0)
-MUX_CFG_7XX("D2_7XX_KBR4",        13,    5,    0,    4,   1, 0)
-MUX_CFG_7XX("C2_7XX_KBC0",        13,    9,    0,    8,   1, 0)
-MUX_CFG_7XX("D3_7XX_KBC1",        13,   13,    0,   12,   1, 0)
-MUX_CFG_7XX("E4_7XX_KBC2",        13,   17,    0,   16,   1, 0)
-MUX_CFG_7XX("F4_7XX_KBC3",        13,   21,    0,   20,   1, 0)
-MUX_CFG_7XX("E3_7XX_KBC4",        13,   25,    0,   24,   1, 0)
-
-MUX_CFG_7XX("AA17_7XX_USB_DM",     2,   21,    0,   20,   0, 0)
-MUX_CFG_7XX("W16_7XX_USB_PU_EN",   2,   25,    0,   24,   0, 0)
-MUX_CFG_7XX("W17_7XX_USB_VBUSI",   2,   29,    6,   28,   1, 0)
-MUX_CFG_7XX("W18_7XX_USB_DMCK_OUT",3,    3,    1,    2,   0, 0)
-MUX_CFG_7XX("W19_7XX_USB_DCRST",   3,    7,    1,    6,   0, 0)
-
-/* MMC Pins */
-MUX_CFG_7XX("MMC_7XX_CMD",         2,    9,    0,    8,   1, 0)
-MUX_CFG_7XX("MMC_7XX_CLK",         2,   13,    0,   12,   1, 0)
-MUX_CFG_7XX("MMC_7XX_DAT0",        2,   17,    0,   16,   1, 0)
-
-/* I2C interface */
-MUX_CFG_7XX("I2C_7XX_SCL",         5,    1,    0,    0,   1, 0)
-MUX_CFG_7XX("I2C_7XX_SDA",         5,    5,    0,    0,   1, 0)
-
-/* SPI pins */
-MUX_CFG_7XX("SPI_7XX_1",           6,    5,    4,    4,   1, 0)
-MUX_CFG_7XX("SPI_7XX_2",           6,    9,    4,    8,   1, 0)
-MUX_CFG_7XX("SPI_7XX_3",           6,   13,    4,   12,   1, 0)
-MUX_CFG_7XX("SPI_7XX_4",           6,   17,    4,   16,   1, 0)
-MUX_CFG_7XX("SPI_7XX_5",           8,   25,    0,   24,   0, 0)
-MUX_CFG_7XX("SPI_7XX_6",           9,    5,    0,    4,   0, 0)
-
-/* UART pins */
-MUX_CFG_7XX("UART_7XX_1",          3,   21,    0,   20,   0, 0)
-MUX_CFG_7XX("UART_7XX_2",          8,    1,    6,    0,   0, 0)
-};
-#define OMAP7XX_PINS_SZ		ARRAY_SIZE(omap7xx_pins)
-#else
-#define omap7xx_pins		NULL
-#define OMAP7XX_PINS_SZ		0
-#endif	/* CONFIG_ARCH_OMAP730 || CONFIG_ARCH_OMAP850 */
-
 #if defined(CONFIG_ARCH_OMAP15XX) || defined(CONFIG_ARCH_OMAP16XX)
 static struct pin_config omap1xxx_pins[] = {
 /*
@@ -489,12 +443,6 @@ EXPORT_SYMBOL(omap_cfg_reg);
 
 int __init omap1_mux_init(void)
 {
-	if (cpu_is_omap7xx()) {
-		arch_mux_cfg.pins	= omap7xx_pins;
-		arch_mux_cfg.size	= OMAP7XX_PINS_SZ;
-		arch_mux_cfg.cfg_reg	= omap1_cfg_reg;
-	}
-
 	if (cpu_is_omap15xx() || cpu_is_omap16xx()) {
 		arch_mux_cfg.pins	= omap1xxx_pins;
 		arch_mux_cfg.size	= OMAP1XXX_PINS_SZ;
diff --git a/arch/arm/mach-omap1/pm.c b/arch/arm/mach-omap1/pm.c
index fce7d2b572bf..9761d8404949 100644
--- a/arch/arm/mach-omap1/pm.c
+++ b/arch/arm/mach-omap1/pm.c
@@ -69,7 +69,6 @@
 static unsigned int arm_sleep_save[ARM_SLEEP_SAVE_SIZE];
 static unsigned short dsp_sleep_save[DSP_SLEEP_SAVE_SIZE];
 static unsigned short ulpd_sleep_save[ULPD_SLEEP_SAVE_SIZE];
-static unsigned int mpui7xx_sleep_save[MPUI7XX_SLEEP_SAVE_SIZE];
 static unsigned int mpui1510_sleep_save[MPUI1510_SLEEP_SAVE_SIZE];
 static unsigned int mpui1610_sleep_save[MPUI1610_SLEEP_SAVE_SIZE];
 
@@ -166,10 +165,7 @@ static void omap_pm_wakeup_setup(void)
 	 * drivers must still separately call omap_set_gpio_wakeup() to
 	 * wake up to a GPIO interrupt.
 	 */
-	if (cpu_is_omap7xx())
-		level1_wake = OMAP_IRQ_BIT(INT_7XX_GPIO_BANK1) |
-			OMAP_IRQ_BIT(INT_7XX_IH2_IRQ);
-	else if (cpu_is_omap15xx())
+	if (cpu_is_omap15xx())
 		level1_wake = OMAP_IRQ_BIT(INT_GPIO_BANK1) |
 			OMAP_IRQ_BIT(INT_1510_IH2_IRQ);
 	else if (cpu_is_omap16xx())
@@ -178,12 +174,7 @@ static void omap_pm_wakeup_setup(void)
 
 	omap_writel(~level1_wake, OMAP_IH1_MIR);
 
-	if (cpu_is_omap7xx()) {
-		omap_writel(~level2_wake, OMAP_IH2_0_MIR);
-		omap_writel(~(OMAP_IRQ_BIT(INT_7XX_WAKE_UP_REQ) |
-				OMAP_IRQ_BIT(INT_7XX_MPUIO_KEYPAD)),
-				OMAP_IH2_1_MIR);
-	} else if (cpu_is_omap15xx()) {
+	if (cpu_is_omap15xx()) {
 		level2_wake |= OMAP_IRQ_BIT(INT_KEYBOARD);
 		omap_writel(~level2_wake,  OMAP_IH2_MIR);
 	} else if (cpu_is_omap16xx()) {
@@ -236,17 +227,7 @@ void omap1_pm_suspend(void)
 	 * Save interrupt, MPUI, ARM and UPLD control registers.
 	 */
 
-	if (cpu_is_omap7xx()) {
-		MPUI7XX_SAVE(OMAP_IH1_MIR);
-		MPUI7XX_SAVE(OMAP_IH2_0_MIR);
-		MPUI7XX_SAVE(OMAP_IH2_1_MIR);
-		MPUI7XX_SAVE(MPUI_CTRL);
-		MPUI7XX_SAVE(MPUI_DSP_BOOT_CONFIG);
-		MPUI7XX_SAVE(MPUI_DSP_API_CONFIG);
-		MPUI7XX_SAVE(EMIFS_CONFIG);
-		MPUI7XX_SAVE(EMIFF_SDRAM_CONFIG);
-
-	} else if (cpu_is_omap15xx()) {
+	if (cpu_is_omap15xx()) {
 		MPUI1510_SAVE(OMAP_IH1_MIR);
 		MPUI1510_SAVE(OMAP_IH2_MIR);
 		MPUI1510_SAVE(MPUI_CTRL);
@@ -288,9 +269,8 @@ void omap1_pm_suspend(void)
 	/* stop DSP */
 	omap_writew(omap_readw(ARM_RSTCT1) & ~(1 << DSP_EN), ARM_RSTCT1);
 
-		/* shut down dsp_ck */
-	if (!cpu_is_omap7xx())
-		omap_writew(omap_readw(ARM_CKCTL) & ~(1 << EN_DSPCK), ARM_CKCTL);
+	/* shut down dsp_ck */
+	omap_writew(omap_readw(ARM_CKCTL) & ~(1 << EN_DSPCK), ARM_CKCTL);
 
 	/* temporarily enabling api_ck to access DSP registers */
 	omap_writew(omap_readw(ARM_IDLECT2) | 1 << EN_APICK, ARM_IDLECT2);
@@ -366,13 +346,7 @@ void omap1_pm_suspend(void)
 	ULPD_RESTORE(ULPD_CLOCK_CTRL);
 	ULPD_RESTORE(ULPD_STATUS_REQ);
 
-	if (cpu_is_omap7xx()) {
-		MPUI7XX_RESTORE(EMIFS_CONFIG);
-		MPUI7XX_RESTORE(EMIFF_SDRAM_CONFIG);
-		MPUI7XX_RESTORE(OMAP_IH1_MIR);
-		MPUI7XX_RESTORE(OMAP_IH2_0_MIR);
-		MPUI7XX_RESTORE(OMAP_IH2_1_MIR);
-	} else if (cpu_is_omap15xx()) {
+	if (cpu_is_omap15xx()) {
 		MPUI1510_RESTORE(MPUI_CTRL);
 		MPUI1510_RESTORE(MPUI_DSP_BOOT_CONFIG);
 		MPUI1510_RESTORE(MPUI_DSP_API_CONFIG);
@@ -433,14 +407,7 @@ static int omap_pm_debug_show(struct seq_file *m, void *v)
 	ULPD_SAVE(ULPD_DPLL_CTRL);
 	ULPD_SAVE(ULPD_POWER_CTRL);
 
-	if (cpu_is_omap7xx()) {
-		MPUI7XX_SAVE(MPUI_CTRL);
-		MPUI7XX_SAVE(MPUI_DSP_STATUS);
-		MPUI7XX_SAVE(MPUI_DSP_BOOT_CONFIG);
-		MPUI7XX_SAVE(MPUI_DSP_API_CONFIG);
-		MPUI7XX_SAVE(EMIFF_SDRAM_CONFIG);
-		MPUI7XX_SAVE(EMIFS_CONFIG);
-	} else if (cpu_is_omap15xx()) {
+	if (cpu_is_omap15xx()) {
 		MPUI1510_SAVE(MPUI_CTRL);
 		MPUI1510_SAVE(MPUI_DSP_STATUS);
 		MPUI1510_SAVE(MPUI_DSP_BOOT_CONFIG);
@@ -486,21 +453,7 @@ static int omap_pm_debug_show(struct seq_file *m, void *v)
 		   ULPD_SHOW(ULPD_STATUS_REQ),
 		   ULPD_SHOW(ULPD_POWER_CTRL));
 
-	if (cpu_is_omap7xx()) {
-		seq_printf(m,
-			   "MPUI7XX_CTRL_REG	     0x%-8x \n"
-			   "MPUI7XX_DSP_STATUS_REG:      0x%-8x \n"
-			   "MPUI7XX_DSP_BOOT_CONFIG_REG: 0x%-8x \n"
-			   "MPUI7XX_DSP_API_CONFIG_REG:  0x%-8x \n"
-			   "MPUI7XX_SDRAM_CONFIG_REG:    0x%-8x \n"
-			   "MPUI7XX_EMIFS_CONFIG_REG:    0x%-8x \n",
-			   MPUI7XX_SHOW(MPUI_CTRL),
-			   MPUI7XX_SHOW(MPUI_DSP_STATUS),
-			   MPUI7XX_SHOW(MPUI_DSP_BOOT_CONFIG),
-			   MPUI7XX_SHOW(MPUI_DSP_API_CONFIG),
-			   MPUI7XX_SHOW(EMIFF_SDRAM_CONFIG),
-			   MPUI7XX_SHOW(EMIFS_CONFIG));
-	} else if (cpu_is_omap15xx()) {
+	if (cpu_is_omap15xx()) {
 		seq_printf(m,
 			   "MPUI1510_CTRL_REG             0x%-8x \n"
 			   "MPUI1510_DSP_STATUS_REG:      0x%-8x \n"
@@ -634,10 +587,7 @@ static int __init omap_pm_init(void)
 	 * These routines need to be in SRAM as that's the only
 	 * memory the MPU can see when it wakes up.
 	 */
-	if (cpu_is_omap7xx()) {
-		omap_sram_suspend = omap_sram_push(omap7xx_cpu_suspend,
-						   omap7xx_cpu_suspend_sz);
-	} else if (cpu_is_omap15xx()) {
+	if (cpu_is_omap15xx()) {
 		omap_sram_suspend = omap_sram_push(omap1510_cpu_suspend,
 						   omap1510_cpu_suspend_sz);
 	} else if (cpu_is_omap16xx()) {
@@ -652,9 +602,7 @@ static int __init omap_pm_init(void)
 
 	arm_pm_idle = omap1_pm_idle;
 
-	if (cpu_is_omap7xx())
-		irq = INT_7XX_WAKE_UP_REQ;
-	else if (cpu_is_omap16xx())
+	if (cpu_is_omap16xx())
 		irq = INT_1610_WAKE_UP_REQ;
 	else
 		irq = -1;
@@ -673,9 +621,7 @@ static int __init omap_pm_init(void)
 	omap_writew(ULPD_POWER_CTRL_REG_VAL, ULPD_POWER_CTRL);
 
 	/* Configure IDLECT3 */
-	if (cpu_is_omap7xx())
-		omap_writel(OMAP7XX_IDLECT3_VAL, OMAP7XX_IDLECT3);
-	else if (cpu_is_omap16xx())
+	if (cpu_is_omap16xx())
 		omap_writel(OMAP1610_IDLECT3_VAL, OMAP1610_IDLECT3);
 
 	suspend_set_ops(&omap_pm_ops);
diff --git a/arch/arm/mach-omap1/pm.h b/arch/arm/mach-omap1/pm.h
index d9165709c532..146dbfd90ba1 100644
--- a/arch/arm/mach-omap1/pm.h
+++ b/arch/arm/mach-omap1/pm.h
@@ -100,15 +100,7 @@
 #define OMAP1610_IDLECT3		0xfffece24
 #define OMAP1610_IDLE_LOOP_REQUEST	0x0400
 
-#define OMAP7XX_IDLECT1_SLEEP_VAL	0x16c7
-#define OMAP7XX_IDLECT2_SLEEP_VAL	0x09c7
-#define OMAP7XX_IDLECT3_VAL		0x3f
-#define OMAP7XX_IDLECT3		0xfffece24
-#define OMAP7XX_IDLE_LOOP_REQUEST	0x0C00
-
-#if     !defined(CONFIG_ARCH_OMAP730) && \
-	!defined(CONFIG_ARCH_OMAP850) && \
-	!defined(CONFIG_ARCH_OMAP15XX) && \
+#if     !defined(CONFIG_ARCH_OMAP15XX) && \
 	!defined(CONFIG_ARCH_OMAP16XX)
 #warning "Power management for this processor not implemented yet"
 #endif
@@ -125,17 +117,13 @@ extern void allow_idle_sleep(void);
 extern void omap1_pm_idle(void);
 extern void omap1_pm_suspend(void);
 
-extern void omap7xx_cpu_suspend(unsigned long, unsigned long);
 extern void omap1510_cpu_suspend(unsigned long, unsigned long);
 extern void omap1610_cpu_suspend(unsigned long, unsigned long);
-extern void omap7xx_idle_loop_suspend(void);
 extern void omap1510_idle_loop_suspend(void);
 extern void omap1610_idle_loop_suspend(void);
 
-extern unsigned int omap7xx_cpu_suspend_sz;
 extern unsigned int omap1510_cpu_suspend_sz;
 extern unsigned int omap1610_cpu_suspend_sz;
-extern unsigned int omap7xx_idle_loop_suspend_sz;
 extern unsigned int omap1510_idle_loop_suspend_sz;
 extern unsigned int omap1610_idle_loop_suspend_sz;
 
@@ -158,10 +146,6 @@ extern void omap_serial_wake_trigger(int enable);
 #define ULPD_RESTORE(x) omap_writew((ulpd_sleep_save[ULPD_SLEEP_SAVE_##x]), (x))
 #define ULPD_SHOW(x) ulpd_sleep_save[ULPD_SLEEP_SAVE_##x]
 
-#define MPUI7XX_SAVE(x) mpui7xx_sleep_save[MPUI7XX_SLEEP_SAVE_##x] = omap_readl(x)
-#define MPUI7XX_RESTORE(x) omap_writel((mpui7xx_sleep_save[MPUI7XX_SLEEP_SAVE_##x]), (x))
-#define MPUI7XX_SHOW(x) mpui7xx_sleep_save[MPUI7XX_SLEEP_SAVE_##x]
-
 #define MPUI1510_SAVE(x) mpui1510_sleep_save[MPUI1510_SLEEP_SAVE_##x] = omap_readl(x)
 #define MPUI1510_RESTORE(x) omap_writel((mpui1510_sleep_save[MPUI1510_SLEEP_SAVE_##x]), (x))
 #define MPUI1510_SHOW(x) mpui1510_sleep_save[MPUI1510_SLEEP_SAVE_##x]
@@ -235,27 +219,6 @@ enum mpui1510_save_state {
 #endif
 };
 
-enum mpui7xx_save_state {
-	MPUI7XX_SLEEP_SAVE_START = 0,
-	/*
-	 * MPUI registers 32 bits
-	 */
-	MPUI7XX_SLEEP_SAVE_MPUI_CTRL,
-	MPUI7XX_SLEEP_SAVE_MPUI_DSP_BOOT_CONFIG,
-	MPUI7XX_SLEEP_SAVE_MPUI_DSP_API_CONFIG,
-	MPUI7XX_SLEEP_SAVE_MPUI_DSP_STATUS,
-	MPUI7XX_SLEEP_SAVE_EMIFF_SDRAM_CONFIG,
-	MPUI7XX_SLEEP_SAVE_EMIFS_CONFIG,
-	MPUI7XX_SLEEP_SAVE_OMAP_IH1_MIR,
-	MPUI7XX_SLEEP_SAVE_OMAP_IH2_0_MIR,
-	MPUI7XX_SLEEP_SAVE_OMAP_IH2_1_MIR,
-#if defined(CONFIG_ARCH_OMAP730) || defined(CONFIG_ARCH_OMAP850)
-	MPUI7XX_SLEEP_SAVE_SIZE
-#else
-	MPUI7XX_SLEEP_SAVE_SIZE = 0
-#endif
-};
-
 enum mpui1610_save_state {
 	MPUI1610_SLEEP_SAVE_START = 0,
 	/*
diff --git a/arch/arm/mach-omap1/serial.c b/arch/arm/mach-omap1/serial.c
index 88928fc33b2e..c7f590645774 100644
--- a/arch/arm/mach-omap1/serial.c
+++ b/arch/arm/mach-omap1/serial.c
@@ -106,13 +106,6 @@ void __init omap_serial_init(void)
 {
 	int i;
 
-	if (cpu_is_omap7xx()) {
-		serial_platform_data[0].regshift = 0;
-		serial_platform_data[1].regshift = 0;
-		serial_platform_data[0].irq = INT_7XX_UART_MODEM_1;
-		serial_platform_data[1].irq = INT_7XX_UART_MODEM_IRDA_2;
-	}
-
 	if (cpu_is_omap15xx()) {
 		serial_platform_data[0].uartclk = OMAP1510_BASE_BAUD * 16;
 		serial_platform_data[1].uartclk = OMAP1510_BASE_BAUD * 16;
@@ -120,14 +113,6 @@ void __init omap_serial_init(void)
 	}
 
 	for (i = 0; i < ARRAY_SIZE(serial_platform_data) - 1; i++) {
-
-		/* Don't look at UARTs higher than 2 for omap7xx */
-		if (cpu_is_omap7xx() && i > 1) {
-			serial_platform_data[i].membase = NULL;
-			serial_platform_data[i].mapbase = 0;
-			continue;
-		}
-
 		/* Static mapping, never released */
 		serial_platform_data[i].membase =
 			ioremap(serial_platform_data[i].mapbase, SZ_2K);
diff --git a/arch/arm/mach-omap1/sleep.S b/arch/arm/mach-omap1/sleep.S
index f111b79512ce..6192f52d531a 100644
--- a/arch/arm/mach-omap1/sleep.S
+++ b/arch/arm/mach-omap1/sleep.S
@@ -61,86 +61,6 @@
  *
  */
 
-#if defined(CONFIG_ARCH_OMAP730) || defined(CONFIG_ARCH_OMAP850)
-	.align	3
-ENTRY(omap7xx_cpu_suspend)
-
-	@ save registers on stack
-	stmfd	sp!, {r0 - r12, lr}
-
-	@ Drain write cache
-	mov	r4, #0
-	mcr	p15, 0, r0, c7, c10, 4
-	nop
-
-	@ load base address of Traffic Controller
-	mov	r6, #TCMIF_ASM_BASE & 0xff000000
-	orr	r6, r6, #TCMIF_ASM_BASE & 0x00ff0000
-	orr	r6, r6, #TCMIF_ASM_BASE & 0x0000ff00
-
-	@ prepare to put SDRAM into self-refresh manually
-	ldr	r7, [r6, #EMIFF_SDRAM_CONFIG_ASM_OFFSET & 0xff]
-	orr	r9, r7, #SELF_REFRESH_MODE & 0xff000000
-	orr	r9, r9, #SELF_REFRESH_MODE & 0x000000ff
-	str	r9, [r6, #EMIFF_SDRAM_CONFIG_ASM_OFFSET & 0xff]
-
-	@ prepare to put EMIFS to Sleep
-	ldr	r8, [r6, #EMIFS_CONFIG_ASM_OFFSET & 0xff]
-	orr	r9, r8, #IDLE_EMIFS_REQUEST & 0xff
-	str	r9, [r6, #EMIFS_CONFIG_ASM_OFFSET & 0xff]
-
-	@ load base address of ARM_IDLECT1 and ARM_IDLECT2
-	mov	r4, #CLKGEN_REG_ASM_BASE & 0xff000000
-	orr	r4, r4, #CLKGEN_REG_ASM_BASE & 0x00ff0000
-	orr	r4, r4, #CLKGEN_REG_ASM_BASE & 0x0000ff00
-
-	@ turn off clock domains
-	@ do not disable PERCK (0x04)
-	mov	r5, #OMAP7XX_IDLECT2_SLEEP_VAL & 0xff
-	orr	r5, r5, #OMAP7XX_IDLECT2_SLEEP_VAL & 0xff00
-	strh	r5, [r4, #ARM_IDLECT2_ASM_OFFSET & 0xff]
-
-	@ request ARM idle
-	mov	r3, #OMAP7XX_IDLECT1_SLEEP_VAL & 0xff
-	orr	r3, r3, #OMAP7XX_IDLECT1_SLEEP_VAL & 0xff00
-	strh	r3, [r4, #ARM_IDLECT1_ASM_OFFSET & 0xff]
-
-	@ disable instruction cache
-	mrc	p15, 0, r9, c1, c0, 0
-	bic	r2, r9, #0x1000
-	mcr	p15, 0, r2, c1, c0, 0
-	nop
-
-/*
- * Let's wait for the next wake up event to wake us up. r0 can't be
- * used here because r0 holds ARM_IDLECT1
- */
-	mov	r2, #0
-	mcr	p15, 0, r2, c7, c0, 4		@ wait for interrupt
-/*
- * omap7xx_cpu_suspend()'s resume point.
- *
- * It will just start executing here, so we'll restore stuff from the
- * stack.
- */
-	@ re-enable Icache
-	mcr	p15, 0, r9, c1, c0, 0
-
-	@ reset the ARM_IDLECT1 and ARM_IDLECT2.
-	strh	r1, [r4, #ARM_IDLECT2_ASM_OFFSET & 0xff]
-	strh	r0, [r4, #ARM_IDLECT1_ASM_OFFSET & 0xff]
-
-	@ Restore EMIFF controls
-	str	r7, [r6, #EMIFF_SDRAM_CONFIG_ASM_OFFSET & 0xff]
-	str	r8, [r6, #EMIFS_CONFIG_ASM_OFFSET & 0xff]
-
-	@ restore regs and return
-	ldmfd	sp!, {r0 - r12, pc}
-
-ENTRY(omap7xx_cpu_suspend_sz)
-	.word	. - omap7xx_cpu_suspend
-#endif /* CONFIG_ARCH_OMAP730 || CONFIG_ARCH_OMAP850 */
-
 #ifdef CONFIG_ARCH_OMAP15XX
 	.align	3
 ENTRY(omap1510_cpu_suspend)
diff --git a/arch/arm/mach-omap1/sram-init.c b/arch/arm/mach-omap1/sram-init.c
index 27c42e2a21cc..79b5a24420f6 100644
--- a/arch/arm/mach-omap1/sram-init.c
+++ b/arch/arm/mach-omap1/sram-init.c
@@ -95,9 +95,7 @@ static void __init omap_detect_and_map_sram(void)
 	omap_sram_skip = SRAM_BOOTLOADER_SZ;
 	omap_sram_start = OMAP1_SRAM_PA;
 
-	if (cpu_is_omap7xx())
-		omap_sram_size = 0x32000;	/* 200K */
-	else if (cpu_is_omap15xx())
+	if (cpu_is_omap15xx())
 		omap_sram_size = 0x30000;	/* 192K */
 	else if (cpu_is_omap1610() || cpu_is_omap1611() ||
 			cpu_is_omap1621() || cpu_is_omap1710())
@@ -135,9 +133,6 @@ static void (*_omap_sram_reprogram_clock)(u32 dpllctl, u32 ckctl);
 void omap_sram_reprogram_clock(u32 dpllctl, u32 ckctl)
 {
 	BUG_ON(!_omap_sram_reprogram_clock);
-	/* On 730, bit 13 must always be 1 */
-	if (cpu_is_omap7xx())
-		ckctl |= 0x2000;
 	_omap_sram_reprogram_clock(dpllctl, ckctl);
 }
 
diff --git a/arch/arm/mach-omap1/usb.c b/arch/arm/mach-omap1/usb.c
index 0119f3ddb7a6..08d42abc4a0f 100644
--- a/arch/arm/mach-omap1/usb.c
+++ b/arch/arm/mach-omap1/usb.c
@@ -190,12 +190,6 @@ static struct platform_device udc_device = {
 
 static inline void udc_device_init(struct omap_usb_config *pdata)
 {
-	/* IRQ numbers for omap7xx */
-	if(cpu_is_omap7xx()) {
-		udc_resources[1].start = INT_7XX_USB_GENI;
-		udc_resources[2].start = INT_7XX_USB_NON_ISO;
-		udc_resources[3].start = INT_7XX_USB_ISO;
-	}
 	pdata->udc_device = &udc_device;
 }
 
@@ -238,8 +232,6 @@ static inline void ohci_device_init(struct omap_usb_config *pdata)
 	if (!IS_ENABLED(CONFIG_USB_OHCI_HCD))
 		return;
 
-	if (cpu_is_omap7xx())
-		ohci_resources[1].start = INT_7XX_USB_HHC_1;
 	pdata->ohci_device = &ohci_device;
 	pdata->ocpi_enable = &ocpi_enable;
 }
@@ -267,8 +259,6 @@ static struct platform_device otg_device = {
 
 static inline void otg_device_init(struct omap_usb_config *pdata)
 {
-	if (cpu_is_omap7xx())
-		otg_resources[1].start = INT_7XX_USB_OTG;
 	pdata->otg_device = &otg_device;
 }
 
@@ -297,14 +287,7 @@ static u32 __init omap1_usb0_init(unsigned nwires, unsigned is_device)
 	}
 
 	if (is_device) {
-		if (cpu_is_omap7xx()) {
-			omap_cfg_reg(AA17_7XX_USB_DM);
-			omap_cfg_reg(W16_7XX_USB_PU_EN);
-			omap_cfg_reg(W17_7XX_USB_VBUSI);
-			omap_cfg_reg(W18_7XX_USB_DMCK_OUT);
-			omap_cfg_reg(W19_7XX_USB_DCRST);
-		} else
-			omap_cfg_reg(W4_USB_PUEN);
+		omap_cfg_reg(W4_USB_PUEN);
 	}
 
 	if (nwires == 2) {
@@ -324,14 +307,11 @@ static u32 __init omap1_usb0_init(unsigned nwires, unsigned is_device)
 		 *  - OTG support on this port not yet written
 		 */
 
-		/* Don't do this for omap7xx -- it causes USB to not work correctly */
-		if (!cpu_is_omap7xx()) {
-			l = omap_readl(USB_TRANSCEIVER_CTRL);
-			l &= ~(7 << 4);
-			if (!is_device)
-				l |= (3 << 1);
-			omap_writel(l, USB_TRANSCEIVER_CTRL);
-		}
+		l = omap_readl(USB_TRANSCEIVER_CTRL);
+		l &= ~(7 << 4);
+		if (!is_device)
+			l |= (3 << 1);
+		omap_writel(l, USB_TRANSCEIVER_CTRL);
 
 		return 3 << 16;
 	}
@@ -698,7 +678,7 @@ void __init omap1_usb_init(struct omap_usb_config *_pdata)
 	ohci_device_init(pdata);
 	otg_device_init(pdata);
 
-	if (cpu_is_omap7xx() || cpu_is_omap16xx())
+	if (cpu_is_omap16xx())
 		omap_otg_init(pdata);
 	else if (cpu_is_omap15xx())
 		omap_1510_usb_init(pdata);
diff --git a/drivers/spi/spi-omap-uwire.c b/drivers/spi/spi-omap-uwire.c
index 29198e6815b2..20c87163d612 100644
--- a/drivers/spi/spi-omap-uwire.c
+++ b/drivers/spi/spi-omap-uwire.c
@@ -99,7 +99,7 @@ struct uwire_state {
  * Or, put it in a structure which is used throughout the driver;
  * that avoids having to issue two loads for each bit of static data.
  */
-static unsigned int uwire_idx_shift;
+static unsigned int uwire_idx_shift = 2;
 static void __iomem *uwire_base;
 
 static inline void uwire_write_reg(int idx, u16 val)
@@ -481,11 +481,6 @@ static int uwire_probe(struct platform_device *pdev)
 	}
 	clk_prepare_enable(uwire->ck);
 
-	if (cpu_is_omap7xx())
-		uwire_idx_shift = 1;
-	else
-		uwire_idx_shift = 2;
-
 	uwire_write_reg(UWIRE_SR3, 1);
 
 	/* the spi->mode bits understood by this driver: */
@@ -536,15 +531,6 @@ static struct platform_driver uwire_driver = {
 
 static int __init omap_uwire_init(void)
 {
-	/* FIXME move these into the relevant board init code. also, include
-	 * H3 support; it uses tsc2101 like H2 (on a different chipselect).
-	 */
-
-	if (machine_is_omap_h2()) {
-		/* defaults: W21 SDO, U18 SDI, V19 SCL */
-		omap_cfg_reg(N14_1610_UWIRE_CS0);
-		omap_cfg_reg(N15_1610_UWIRE_CS1);
-	}
 	return platform_driver_register(&uwire_driver);
 }
 
diff --git a/drivers/usb/gadget/udc/omap_udc.c b/drivers/usb/gadget/udc/omap_udc.c
index bea346e362b2..1be8c19f2a04 100644
--- a/drivers/usb/gadget/udc/omap_udc.c
+++ b/drivers/usb/gadget/udc/omap_udc.c
@@ -2036,12 +2036,7 @@ static irqreturn_t omap_udc_iso_irq(int irq, void *_dev)
 
 static inline int machine_without_vbus_sense(void)
 {
-	return machine_is_omap_innovator()
-		|| machine_is_omap_osk()
-		|| machine_is_omap_palmte()
-		|| machine_is_sx1()
-		/* No known omap7xx boards with vbus sense */
-		|| cpu_is_omap7xx();
+	return  machine_is_omap_osk() || machine_is_sx1();
 }
 
 static int omap_udc_start(struct usb_gadget *g,
@@ -2759,9 +2754,6 @@ static int omap_udc_probe(struct platform_device *pdev)
 	struct clk		*dc_clk = NULL;
 	struct clk		*hhc_clk = NULL;
 
-	if (cpu_is_omap7xx())
-		use_dma = 0;
-
 	/* NOTE:  "knows" the order of the resources! */
 	if (!request_mem_region(pdev->resource[0].start,
 			resource_size(&pdev->resource[0]),
@@ -2780,16 +2772,6 @@ static int omap_udc_probe(struct platform_device *pdev)
 		udelay(100);
 	}
 
-	if (cpu_is_omap7xx()) {
-		dc_clk = clk_get(&pdev->dev, "usb_dc_ck");
-		hhc_clk = clk_get(&pdev->dev, "l3_ocpi_ck");
-		BUG_ON(IS_ERR(dc_clk) || IS_ERR(hhc_clk));
-		/* can't use omap_udc_enable_clock yet */
-		clk_prepare_enable(dc_clk);
-		clk_prepare_enable(hhc_clk);
-		udelay(100);
-	}
-
 	INFO("OMAP UDC rev %d.%d%s\n",
 		omap_readw(UDC_REV) >> 4, omap_readw(UDC_REV) & 0xf,
 		config->otg ? ", Mini-AB" : "");
@@ -2914,7 +2896,7 @@ static int omap_udc_probe(struct platform_device *pdev)
 		goto cleanup1;
 	}
 #endif
-	if (cpu_is_omap16xx() || cpu_is_omap7xx()) {
+	if (cpu_is_omap16xx()) {
 		udc->dc_clk = dc_clk;
 		udc->hhc_clk = hhc_clk;
 		clk_disable(hhc_clk);
@@ -2933,7 +2915,7 @@ static int omap_udc_probe(struct platform_device *pdev)
 	if (!IS_ERR_OR_NULL(xceiv))
 		usb_put_phy(xceiv);
 
-	if (cpu_is_omap16xx() || cpu_is_omap7xx()) {
+	if (cpu_is_omap16xx()) {
 		clk_disable_unprepare(hhc_clk);
 		clk_disable_unprepare(dc_clk);
 		clk_put(hhc_clk);
diff --git a/drivers/usb/host/ohci-omap.c b/drivers/usb/host/ohci-omap.c
index cb29701df911..d7f594db56c6 100644
--- a/drivers/usb/host/ohci-omap.c
+++ b/drivers/usb/host/ohci-omap.c
@@ -107,10 +107,6 @@ static int ohci_omap_reset(struct usb_hcd *hcd)
 		hcd->power_budget = 8;
 	}
 
-	/* boards can use OTG transceivers in non-OTG modes */
-	need_transceiver = need_transceiver
-			|| machine_is_omap_h2() || machine_is_omap_h3();
-
 	/* XXX OMAP16xx only */
 	if (config->ocpi_enable)
 		config->ocpi_enable();
@@ -150,7 +146,7 @@ static int ohci_omap_reset(struct usb_hcd *hcd)
 	}
 
 	/* board-specific power switching and overcurrent support */
-	if (machine_is_omap_osk() || machine_is_omap_innovator()) {
+	if (machine_is_omap_osk()) {
 		u32	rh = roothub_a (ohci);
 
 		/* power switching (ganged by default) */
diff --git a/drivers/usb/musb/musb_dma.h b/drivers/usb/musb/musb_dma.h
index 7d67b69df0a0..be32c6f90848 100644
--- a/drivers/usb/musb/musb_dma.h
+++ b/drivers/usb/musb/musb_dma.h
@@ -61,12 +61,6 @@ struct musb_hw_ep;
 #define musb_dma_cppi41(musb)		0
 #endif
 
-#ifdef CONFIG_USB_TI_CPPI_DMA
-#define musb_dma_cppi(musb)		(musb->ops->quirks & MUSB_DMA_CPPI)
-#else
-#define musb_dma_cppi(musb)		0
-#endif
-
 #ifdef CONFIG_USB_TUSB_OMAP_DMA
 #define tusb_dma_omap(musb)		(musb->ops->quirks & MUSB_DMA_TUSB_OMAP)
 #else
@@ -79,9 +73,8 @@ struct musb_hw_ep;
 #define musb_dma_inventra(musb)		0
 #endif
 
-#if defined(CONFIG_USB_TI_CPPI_DMA) || defined(CONFIG_USB_TI_CPPI41_DMA)
-#define	is_cppi_enabled(musb)		\
-	(musb_dma_cppi(musb) || musb_dma_cppi41(musb))
+#if defined(CONFIG_USB_TI_CPPI41_DMA)
+#define	is_cppi_enabled(musb)		musb_dma_cppi41(musb)
 #else
 #define	is_cppi_enabled(musb)	0
 #endif
diff --git a/drivers/usb/phy/phy-isp1301-omap.c b/drivers/usb/phy/phy-isp1301-omap.c
index e5d3f206097c..394386a4bef8 100644
--- a/drivers/usb/phy/phy-isp1301-omap.c
+++ b/drivers/usb/phy/phy-isp1301-omap.c
@@ -77,51 +77,6 @@ struct isp1301 {
 
 /*-------------------------------------------------------------------------*/
 
-/* board-specific PM hooks */
-
-#if defined(CONFIG_MACH_OMAP_H2) || defined(CONFIG_MACH_OMAP_H3)
-
-#if IS_REACHABLE(CONFIG_TPS65010)
-
-#include <linux/mfd/tps65010.h>
-
-#else
-
-static inline int tps65010_set_vbus_draw(unsigned mA)
-{
-	pr_debug("tps65010: draw %d mA (STUB)\n", mA);
-	return 0;
-}
-
-#endif
-
-static void enable_vbus_draw(struct isp1301 *isp, unsigned mA)
-{
-	int status = tps65010_set_vbus_draw(mA);
-	if (status < 0)
-		pr_debug("  VBUS %d mA error %d\n", mA, status);
-}
-
-#else
-
-static void enable_vbus_draw(struct isp1301 *isp, unsigned mA)
-{
-	/* H4 controls this by DIP switch S2.4; no soft control.
-	 * ON means the charger is always enabled.  Leave it OFF
-	 * unless the OTG port is used only in B-peripheral mode.
-	 */
-}
-
-#endif
-
-static void enable_vbus_source(struct isp1301 *isp)
-{
-	/* this board won't supply more than 8mA vbus power.
-	 * some boards can switch a 100ma "unit load" (or more).
-	 */
-}
-
-
 /* products will deliver OTG messages with LEDs, GUI, etc */
 static inline void notresponding(struct isp1301 *isp)
 {
@@ -916,10 +871,8 @@ static void b_peripheral(struct isp1301 *isp)
 	usb_gadget_vbus_connect(isp->phy.otg->gadget);
 
 #ifdef	CONFIG_USB_OTG
-	enable_vbus_draw(isp, 8);
 	otg_update_isp(isp);
 #else
-	enable_vbus_draw(isp, 100);
 	/* UDC driver just set OTG_BSESSVLD */
 	isp1301_set_bits(isp, ISP1301_OTG_CONTROL_1, OTG1_DP_PULLUP);
 	isp1301_clear_bits(isp, ISP1301_OTG_CONTROL_1, OTG1_DP_PULLDOWN);
@@ -947,7 +900,6 @@ static void isp_update_otg(struct isp1301 *isp, u8 stat)
 				a_idle(isp, "idle");
 				fallthrough;
 			case OTG_STATE_A_IDLE:
-				enable_vbus_source(isp);
 				fallthrough;
 			case OTG_STATE_A_WAIT_VRISE:
 				/* we skip over OTG_STATE_A_WAIT_BCON, since
@@ -1023,7 +975,6 @@ static void isp_update_otg(struct isp1301 *isp, u8 stat)
 		case OTG_STATE_B_HOST:
 			if (likely(isp_bstat & OTG_B_SESS_VLD))
 				break;
-			enable_vbus_draw(isp, 0);
 #ifndef	CONFIG_USB_OTG
 			/* UDC driver will clear OTG_BSESSVLD */
 			isp1301_set_bits(isp, ISP1301_OTG_CONTROL_1,
@@ -1283,9 +1234,6 @@ isp1301_set_host(struct usb_otg *otg, struct usb_bus *host)
 
 	power_up(isp);
 
-	if (machine_is_omap_h2())
-		isp1301_set_bits(isp, ISP1301_MODE_CONTROL_1, MC1_DAT_SE0);
-
 	dev_info(&isp->client->dev, "A-Host sessions ok\n");
 	isp1301_set_bits(isp, ISP1301_INTERRUPT_RISING,
 		INTR_ID_GND);
@@ -1320,8 +1268,6 @@ isp1301_set_peripheral(struct usb_otg *otg, struct usb_gadget *gadget)
 
 	if (!gadget) {
 		omap_writew(0, OTG_IRQ_EN);
-		if (!otg->default_a)
-			enable_vbus_draw(isp, 0);
 		usb_gadget_vbus_disconnect(otg->gadget);
 		otg->gadget = NULL;
 		power_down(isp);
@@ -1352,9 +1298,6 @@ isp1301_set_peripheral(struct usb_otg *otg, struct usb_gadget *gadget)
 	power_up(isp);
 	isp->phy.otg->state = OTG_STATE_B_IDLE;
 
-	if (machine_is_omap_h2() || machine_is_omap_h3())
-		isp1301_set_bits(isp, ISP1301_MODE_CONTROL_1, MC1_DAT_SE0);
-
 	isp1301_set_bits(isp, ISP1301_INTERRUPT_RISING,
 		INTR_SESS_VLD);
 	isp1301_set_bits(isp, ISP1301_INTERRUPT_FALLING,
@@ -1380,16 +1323,6 @@ isp1301_set_peripheral(struct usb_otg *otg, struct usb_gadget *gadget)
 
 /*-------------------------------------------------------------------------*/
 
-static int
-isp1301_set_power(struct usb_phy *dev, unsigned mA)
-{
-	if (!the_transceiver)
-		return -ENODEV;
-	if (dev->otg->state == OTG_STATE_B_PERIPHERAL)
-		enable_vbus_draw(the_transceiver, mA);
-	return 0;
-}
-
 static int
 isp1301_start_srp(struct usb_otg *otg)
 {
@@ -1538,26 +1471,7 @@ isp1301_probe(struct i2c_client *i2c, const struct i2c_device_id *id)
 	}
 #endif
 
-	if (machine_is_omap_h2()) {
-		struct gpio_desc *gpiod;
-
-		/* full speed signaling by default */
-		isp1301_set_bits(isp, ISP1301_MODE_CONTROL_1,
-			MC1_SPEED);
-		isp1301_set_bits(isp, ISP1301_MODE_CONTROL_2,
-			MC2_SPD_SUSP_CTRL);
-
-		gpiod = devm_gpiod_get(&i2c->dev, NULL, GPIOD_IN);
-		if (IS_ERR(gpiod)) {
-			dev_err(&i2c->dev, "cannot obtain H2 GPIO\n");
-			goto fail;
-		}
-		gpiod_set_consumer_name(gpiod, "isp1301");
-		irq = gpiod_to_irq(gpiod);
-		isp->irq_type = IRQF_TRIGGER_FALLING;
-	} else {
-		irq = i2c->irq;
-	}
+	irq = i2c->irq;
 
 	status = request_irq(irq, isp1301_irq,
 			isp->irq_type, DRIVER_NAME, isp);
@@ -1569,15 +1483,12 @@ isp1301_probe(struct i2c_client *i2c, const struct i2c_device_id *id)
 
 	isp->phy.dev = &i2c->dev;
 	isp->phy.label = DRIVER_NAME;
-	isp->phy.set_power = isp1301_set_power;
-
 	isp->phy.otg->usb_phy = &isp->phy;
 	isp->phy.otg->set_host = isp1301_set_host;
 	isp->phy.otg->set_peripheral = isp1301_set_peripheral;
 	isp->phy.otg->start_srp = isp1301_start_srp;
 	isp->phy.otg->start_hnp = isp1301_start_hnp;
 
-	enable_vbus_draw(isp, 0);
 	power_down(isp);
 	the_transceiver = isp;
 
diff --git a/drivers/video/fbdev/omap/lcdc.c b/drivers/video/fbdev/omap/lcdc.c
index e7ce783e5215..abb8b11464e8 100644
--- a/drivers/video/fbdev/omap/lcdc.c
+++ b/drivers/video/fbdev/omap/lcdc.c
@@ -706,8 +706,6 @@ static int omap_lcdc_init(struct omapfb_device *fbdev, int ext_mode,
 
 	if (machine_is_ams_delta())
 		rate /= 4;
-	if (machine_is_omap_h3())
-		rate /= 3;
 	r = clk_set_rate(lcdc.lcd_ck, rate);
 	if (r) {
 		dev_err(fbdev->dev, "failed to adjust LCD rate\n");
diff --git a/include/linux/soc/ti/omap1-soc.h b/include/linux/soc/ti/omap1-soc.h
index 81008d400bb6..a42d9aa68648 100644
--- a/include/linux/soc/ti/omap1-soc.h
+++ b/include/linux/soc/ti/omap1-soc.h
@@ -20,22 +20,6 @@
 #undef MULTI_OMAP1
 #undef OMAP_NAME
 
-#ifdef CONFIG_ARCH_OMAP730
-# ifdef OMAP_NAME
-#  undef  MULTI_OMAP1
-#  define MULTI_OMAP1
-# else
-#  define OMAP_NAME omap730
-# endif
-#endif
-#ifdef CONFIG_ARCH_OMAP850
-# ifdef OMAP_NAME
-#  undef  MULTI_OMAP1
-#  define MULTI_OMAP1
-# else
-#  define OMAP_NAME omap850
-# endif
-#endif
 #ifdef CONFIG_ARCH_OMAP15XX
 # ifdef OMAP_NAME
 #  undef  MULTI_OMAP1
@@ -69,7 +53,6 @@ unsigned int omap_rev(void);
 /*
  * Macros to group OMAP into cpu classes.
  * These can be used in most places.
- * cpu_is_omap7xx():	True for OMAP730, OMAP850
  * cpu_is_omap15xx():	True for OMAP1510, OMAP5910 and OMAP310
  * cpu_is_omap16xx():	True for OMAP1610, OMAP5912 and OMAP1710
  */
@@ -89,23 +72,13 @@ static inline int is_omap ##subclass (void)		\
 	return (GET_OMAP_SUBCLASS == (id)) ? 1 : 0;	\
 }
 
-IS_OMAP_CLASS(7xx, 0x07)
 IS_OMAP_CLASS(15xx, 0x15)
 IS_OMAP_CLASS(16xx, 0x16)
 
-#define cpu_is_omap7xx()		0
 #define cpu_is_omap15xx()		0
 #define cpu_is_omap16xx()		0
 
 #if defined(MULTI_OMAP1)
-# if defined(CONFIG_ARCH_OMAP730)
-#  undef  cpu_is_omap7xx
-#  define cpu_is_omap7xx()		is_omap7xx()
-# endif
-# if defined(CONFIG_ARCH_OMAP850)
-#  undef  cpu_is_omap7xx
-#  define cpu_is_omap7xx()		is_omap7xx()
-# endif
 # if defined(CONFIG_ARCH_OMAP15XX)
 #  undef  cpu_is_omap15xx
 #  define cpu_is_omap15xx()		is_omap15xx()
@@ -115,14 +88,6 @@ IS_OMAP_CLASS(16xx, 0x16)
 #  define cpu_is_omap16xx()		is_omap16xx()
 # endif
 #else
-# if defined(CONFIG_ARCH_OMAP730)
-#  undef  cpu_is_omap7xx
-#  define cpu_is_omap7xx()		1
-# endif
-# if defined(CONFIG_ARCH_OMAP850)
-#  undef  cpu_is_omap7xx
-#  define cpu_is_omap7xx()		1
-# endif
 # if defined(CONFIG_ARCH_OMAP15XX)
 #  undef  cpu_is_omap15xx
 #  define cpu_is_omap15xx()		1
-- 
2.29.2

