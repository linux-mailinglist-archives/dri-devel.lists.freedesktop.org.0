Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2461507386
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 18:44:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAF1E10F11C;
	Tue, 19 Apr 2022 16:44:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 960DC10F11C
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 16:44:31 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 23F82B81BF8;
 Tue, 19 Apr 2022 16:44:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D40C0C385A5;
 Tue, 19 Apr 2022 16:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650386668;
 bh=hFaUfBHHZyua9/0SIUVCF7GfRjXY8twBhb6ozCWe2ig=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Fo/tKcUroKIiRisEELy+Quhv3E8Useos/6dFZnWrT0uevB2S46HiM7GoogmEpRySA
 bDcDcRDtP9O6a9u5D33IHltlhiammHzC7GF2SDnzFHXvXnuXIUSzwDhpuo1jO5Gz0P
 ClrMmdWLuCqC1z0YjcwVHVnX5Z9gzl+nUlu0FeQj08vu9jzopfFFz4FL5eECm7RAuY
 ZZnyMXTBeUQSFy8p9Mptsd2e6ZImS2jV5cNayGF6QWNDOzx1yetY2gGClWhEb/tHjZ
 HIvMbgIPWC5wXvKwPJXPhpoTLr0+ZUb12OFRhVWafG0AiuetotoT6K/V2ymNZOPWy4
 luzaLbrzw3CFQ==
From: Arnd Bergmann <arnd@kernel.org>
To: robert.jarzmik@free.fr,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 43/48] ARM: mmp: rename pxa_register_device
Date: Tue, 19 Apr 2022 18:38:05 +0200
Message-Id: <20220419163810.2118169-44-arnd@kernel.org>
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

In a multiplatform kernel that includes both pxa and mmp, we get a link
failure from the clash of two pxa_register_device functions.

Rename the one in mach-mmp to mmp_register_device, along with with the
rename of pxa_device_desc.

Acked-by: Lubomir Rintel <lkundrak@v3.sk>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-mmp/devices.c |  2 +-
 arch/arm/mach-mmp/devices.h | 10 +++----
 arch/arm/mach-mmp/mmp2.h    | 48 ++++++++++++++---------------
 arch/arm/mach-mmp/pxa168.h  | 60 ++++++++++++++++++-------------------
 arch/arm/mach-mmp/pxa910.h  | 38 +++++++++++------------
 arch/arm/mach-mmp/ttc_dkb.c |  6 ++--
 6 files changed, 82 insertions(+), 82 deletions(-)

diff --git a/arch/arm/mach-mmp/devices.c b/arch/arm/mach-mmp/devices.c
index 18bee66a671f..79f4a2aa5475 100644
--- a/arch/arm/mach-mmp/devices.c
+++ b/arch/arm/mach-mmp/devices.c
@@ -14,7 +14,7 @@
 #include <linux/soc/mmp/cputype.h>
 #include "regs-usb.h"
 
-int __init pxa_register_device(struct pxa_device_desc *desc,
+int __init mmp_register_device(struct mmp_device_desc *desc,
 				void *data, size_t size)
 {
 	struct platform_device *pdev;
diff --git a/arch/arm/mach-mmp/devices.h b/arch/arm/mach-mmp/devices.h
index 4df596c5c201..d4920ebfebc5 100644
--- a/arch/arm/mach-mmp/devices.h
+++ b/arch/arm/mach-mmp/devices.h
@@ -7,7 +7,7 @@
 #define MAX_RESOURCE_DMA	2
 
 /* structure for describing the on-chip devices */
-struct pxa_device_desc {
+struct mmp_device_desc {
 	const char	*dev_name;
 	const char	*drv_name;
 	int		id;
@@ -18,7 +18,7 @@ struct pxa_device_desc {
 };
 
 #define PXA168_DEVICE(_name, _drv, _id, _irq, _start, _size, _dma...)	\
-struct pxa_device_desc pxa168_device_##_name __initdata = {		\
+struct mmp_device_desc pxa168_device_##_name __initdata = {		\
 	.dev_name	= "pxa168-" #_name,				\
 	.drv_name	= _drv,						\
 	.id		= _id,						\
@@ -29,7 +29,7 @@ struct pxa_device_desc pxa168_device_##_name __initdata = {		\
 };
 
 #define PXA910_DEVICE(_name, _drv, _id, _irq, _start, _size, _dma...)	\
-struct pxa_device_desc pxa910_device_##_name __initdata = {		\
+struct mmp_device_desc pxa910_device_##_name __initdata = {		\
 	.dev_name	= "pxa910-" #_name,				\
 	.drv_name	= _drv,						\
 	.id		= _id,						\
@@ -40,7 +40,7 @@ struct pxa_device_desc pxa910_device_##_name __initdata = {		\
 };
 
 #define MMP2_DEVICE(_name, _drv, _id, _irq, _start, _size, _dma...)	\
-struct pxa_device_desc mmp2_device_##_name __initdata = {		\
+struct mmp_device_desc mmp2_device_##_name __initdata = {		\
 	.dev_name	= "mmp2-" #_name,				\
 	.drv_name	= _drv,						\
 	.id		= _id,						\
@@ -50,7 +50,7 @@ struct pxa_device_desc mmp2_device_##_name __initdata = {		\
 	.dma		= { _dma },					\
 }
 
-extern int pxa_register_device(struct pxa_device_desc *, void *, size_t);
+extern int mmp_register_device(struct mmp_device_desc *, void *, size_t);
 extern int pxa_usb_phy_init(void __iomem *phy_reg);
 extern void pxa_usb_phy_deinit(void __iomem *phy_reg);
 
diff --git a/arch/arm/mach-mmp/mmp2.h b/arch/arm/mach-mmp/mmp2.h
index adafc4fba8f4..3ebc1bb13f71 100644
--- a/arch/arm/mach-mmp/mmp2.h
+++ b/arch/arm/mach-mmp/mmp2.h
@@ -15,28 +15,28 @@ extern void mmp2_clear_pmic_int(void);
 
 #include "devices.h"
 
-extern struct pxa_device_desc mmp2_device_uart1;
-extern struct pxa_device_desc mmp2_device_uart2;
-extern struct pxa_device_desc mmp2_device_uart3;
-extern struct pxa_device_desc mmp2_device_uart4;
-extern struct pxa_device_desc mmp2_device_twsi1;
-extern struct pxa_device_desc mmp2_device_twsi2;
-extern struct pxa_device_desc mmp2_device_twsi3;
-extern struct pxa_device_desc mmp2_device_twsi4;
-extern struct pxa_device_desc mmp2_device_twsi5;
-extern struct pxa_device_desc mmp2_device_twsi6;
-extern struct pxa_device_desc mmp2_device_sdh0;
-extern struct pxa_device_desc mmp2_device_sdh1;
-extern struct pxa_device_desc mmp2_device_sdh2;
-extern struct pxa_device_desc mmp2_device_sdh3;
-extern struct pxa_device_desc mmp2_device_asram;
-extern struct pxa_device_desc mmp2_device_isram;
+extern struct mmp_device_desc mmp2_device_uart1;
+extern struct mmp_device_desc mmp2_device_uart2;
+extern struct mmp_device_desc mmp2_device_uart3;
+extern struct mmp_device_desc mmp2_device_uart4;
+extern struct mmp_device_desc mmp2_device_twsi1;
+extern struct mmp_device_desc mmp2_device_twsi2;
+extern struct mmp_device_desc mmp2_device_twsi3;
+extern struct mmp_device_desc mmp2_device_twsi4;
+extern struct mmp_device_desc mmp2_device_twsi5;
+extern struct mmp_device_desc mmp2_device_twsi6;
+extern struct mmp_device_desc mmp2_device_sdh0;
+extern struct mmp_device_desc mmp2_device_sdh1;
+extern struct mmp_device_desc mmp2_device_sdh2;
+extern struct mmp_device_desc mmp2_device_sdh3;
+extern struct mmp_device_desc mmp2_device_asram;
+extern struct mmp_device_desc mmp2_device_isram;
 
 extern struct platform_device mmp2_device_gpio;
 
 static inline int mmp2_add_uart(int id)
 {
-	struct pxa_device_desc *d = NULL;
+	struct mmp_device_desc *d = NULL;
 
 	switch (id) {
 	case 1: d = &mmp2_device_uart1; break;
@@ -47,13 +47,13 @@ static inline int mmp2_add_uart(int id)
 		return -EINVAL;
 	}
 
-	return pxa_register_device(d, NULL, 0);
+	return mmp_register_device(d, NULL, 0);
 }
 
 static inline int mmp2_add_twsi(int id, struct i2c_pxa_platform_data *data,
 				  struct i2c_board_info *info, unsigned size)
 {
-	struct pxa_device_desc *d = NULL;
+	struct mmp_device_desc *d = NULL;
 	int ret;
 
 	switch (id) {
@@ -71,12 +71,12 @@ static inline int mmp2_add_twsi(int id, struct i2c_pxa_platform_data *data,
 	if (ret)
 		return ret;
 
-	return pxa_register_device(d, data, sizeof(*data));
+	return mmp_register_device(d, data, sizeof(*data));
 }
 
 static inline int mmp2_add_sdhost(int id, struct sdhci_pxa_platdata *data)
 {
-	struct pxa_device_desc *d = NULL;
+	struct mmp_device_desc *d = NULL;
 
 	switch (id) {
 	case 0: d = &mmp2_device_sdh0; break;
@@ -87,17 +87,17 @@ static inline int mmp2_add_sdhost(int id, struct sdhci_pxa_platdata *data)
 		return -EINVAL;
 	}
 
-	return pxa_register_device(d, data, sizeof(*data));
+	return mmp_register_device(d, data, sizeof(*data));
 }
 
 static inline int mmp2_add_asram(struct sram_platdata *data)
 {
-	return pxa_register_device(&mmp2_device_asram, data, sizeof(*data));
+	return mmp_register_device(&mmp2_device_asram, data, sizeof(*data));
 }
 
 static inline int mmp2_add_isram(struct sram_platdata *data)
 {
-	return pxa_register_device(&mmp2_device_isram, data, sizeof(*data));
+	return mmp_register_device(&mmp2_device_isram, data, sizeof(*data));
 }
 
 #endif /* __ASM_MACH_MMP2_H */
diff --git a/arch/arm/mach-mmp/pxa168.h b/arch/arm/mach-mmp/pxa168.h
index dff651b9f252..34f907cd165a 100644
--- a/arch/arm/mach-mmp/pxa168.h
+++ b/arch/arm/mach-mmp/pxa168.h
@@ -21,24 +21,24 @@ extern void pxa168_clear_keypad_wakeup(void);
 
 #include "devices.h"
 
-extern struct pxa_device_desc pxa168_device_uart1;
-extern struct pxa_device_desc pxa168_device_uart2;
-extern struct pxa_device_desc pxa168_device_uart3;
-extern struct pxa_device_desc pxa168_device_twsi0;
-extern struct pxa_device_desc pxa168_device_twsi1;
-extern struct pxa_device_desc pxa168_device_pwm1;
-extern struct pxa_device_desc pxa168_device_pwm2;
-extern struct pxa_device_desc pxa168_device_pwm3;
-extern struct pxa_device_desc pxa168_device_pwm4;
-extern struct pxa_device_desc pxa168_device_ssp1;
-extern struct pxa_device_desc pxa168_device_ssp2;
-extern struct pxa_device_desc pxa168_device_ssp3;
-extern struct pxa_device_desc pxa168_device_ssp4;
-extern struct pxa_device_desc pxa168_device_ssp5;
-extern struct pxa_device_desc pxa168_device_nand;
-extern struct pxa_device_desc pxa168_device_fb;
-extern struct pxa_device_desc pxa168_device_keypad;
-extern struct pxa_device_desc pxa168_device_eth;
+extern struct mmp_device_desc pxa168_device_uart1;
+extern struct mmp_device_desc pxa168_device_uart2;
+extern struct mmp_device_desc pxa168_device_uart3;
+extern struct mmp_device_desc pxa168_device_twsi0;
+extern struct mmp_device_desc pxa168_device_twsi1;
+extern struct mmp_device_desc pxa168_device_pwm1;
+extern struct mmp_device_desc pxa168_device_pwm2;
+extern struct mmp_device_desc pxa168_device_pwm3;
+extern struct mmp_device_desc pxa168_device_pwm4;
+extern struct mmp_device_desc pxa168_device_ssp1;
+extern struct mmp_device_desc pxa168_device_ssp2;
+extern struct mmp_device_desc pxa168_device_ssp3;
+extern struct mmp_device_desc pxa168_device_ssp4;
+extern struct mmp_device_desc pxa168_device_ssp5;
+extern struct mmp_device_desc pxa168_device_nand;
+extern struct mmp_device_desc pxa168_device_fb;
+extern struct mmp_device_desc pxa168_device_keypad;
+extern struct mmp_device_desc pxa168_device_eth;
 
 /* pdata can be NULL */
 extern int __init pxa168_add_usb_host(struct mv_usb_platform_data *pdata);
@@ -48,7 +48,7 @@ extern struct platform_device pxa168_device_gpio;
 
 static inline int pxa168_add_uart(int id)
 {
-	struct pxa_device_desc *d = NULL;
+	struct mmp_device_desc *d = NULL;
 
 	switch (id) {
 	case 1: d = &pxa168_device_uart1; break;
@@ -59,13 +59,13 @@ static inline int pxa168_add_uart(int id)
 	if (d == NULL)
 		return -EINVAL;
 
-	return pxa_register_device(d, NULL, 0);
+	return mmp_register_device(d, NULL, 0);
 }
 
 static inline int pxa168_add_twsi(int id, struct i2c_pxa_platform_data *data,
 				  struct i2c_board_info *info, unsigned size)
 {
-	struct pxa_device_desc *d = NULL;
+	struct mmp_device_desc *d = NULL;
 	int ret;
 
 	switch (id) {
@@ -79,12 +79,12 @@ static inline int pxa168_add_twsi(int id, struct i2c_pxa_platform_data *data,
 	if (ret)
 		return ret;
 
-	return pxa_register_device(d, data, sizeof(*data));
+	return mmp_register_device(d, data, sizeof(*data));
 }
 
 static inline int pxa168_add_pwm(int id)
 {
-	struct pxa_device_desc *d = NULL;
+	struct mmp_device_desc *d = NULL;
 
 	switch (id) {
 	case 1: d = &pxa168_device_pwm1; break;
@@ -95,12 +95,12 @@ static inline int pxa168_add_pwm(int id)
 		return -EINVAL;
 	}
 
-	return pxa_register_device(d, NULL, 0);
+	return mmp_register_device(d, NULL, 0);
 }
 
 static inline int pxa168_add_ssp(int id)
 {
-	struct pxa_device_desc *d = NULL;
+	struct mmp_device_desc *d = NULL;
 
 	switch (id) {
 	case 1: d = &pxa168_device_ssp1; break;
@@ -111,17 +111,17 @@ static inline int pxa168_add_ssp(int id)
 	default:
 		return -EINVAL;
 	}
-	return pxa_register_device(d, NULL, 0);
+	return mmp_register_device(d, NULL, 0);
 }
 
 static inline int pxa168_add_nand(struct pxa3xx_nand_platform_data *info)
 {
-	return pxa_register_device(&pxa168_device_nand, info, sizeof(*info));
+	return mmp_register_device(&pxa168_device_nand, info, sizeof(*info));
 }
 
 static inline int pxa168_add_fb(struct pxa168fb_mach_info *mi)
 {
-	return pxa_register_device(&pxa168_device_fb, mi, sizeof(*mi));
+	return mmp_register_device(&pxa168_device_fb, mi, sizeof(*mi));
 }
 
 static inline int pxa168_add_keypad(struct pxa27x_keypad_platform_data *data)
@@ -129,11 +129,11 @@ static inline int pxa168_add_keypad(struct pxa27x_keypad_platform_data *data)
 	if (cpu_is_pxa168())
 		data->clear_wakeup_event = pxa168_clear_keypad_wakeup;
 
-	return pxa_register_device(&pxa168_device_keypad, data, sizeof(*data));
+	return mmp_register_device(&pxa168_device_keypad, data, sizeof(*data));
 }
 
 static inline int pxa168_add_eth(struct pxa168_eth_platform_data *data)
 {
-	return pxa_register_device(&pxa168_device_eth, data, sizeof(*data));
+	return mmp_register_device(&pxa168_device_eth, data, sizeof(*data));
 }
 #endif /* __ASM_MACH_PXA168_H */
diff --git a/arch/arm/mach-mmp/pxa910.h b/arch/arm/mach-mmp/pxa910.h
index 2dfe38e4acc1..6ace5a8aa15b 100644
--- a/arch/arm/mach-mmp/pxa910.h
+++ b/arch/arm/mach-mmp/pxa910.h
@@ -13,28 +13,28 @@ extern void __init pxa910_init_irq(void);
 
 #include "devices.h"
 
-extern struct pxa_device_desc pxa910_device_uart1;
-extern struct pxa_device_desc pxa910_device_uart2;
-extern struct pxa_device_desc pxa910_device_twsi0;
-extern struct pxa_device_desc pxa910_device_twsi1;
-extern struct pxa_device_desc pxa910_device_pwm1;
-extern struct pxa_device_desc pxa910_device_pwm2;
-extern struct pxa_device_desc pxa910_device_pwm3;
-extern struct pxa_device_desc pxa910_device_pwm4;
-extern struct pxa_device_desc pxa910_device_nand;
+extern struct mmp_device_desc pxa910_device_uart1;
+extern struct mmp_device_desc pxa910_device_uart2;
+extern struct mmp_device_desc pxa910_device_twsi0;
+extern struct mmp_device_desc pxa910_device_twsi1;
+extern struct mmp_device_desc pxa910_device_pwm1;
+extern struct mmp_device_desc pxa910_device_pwm2;
+extern struct mmp_device_desc pxa910_device_pwm3;
+extern struct mmp_device_desc pxa910_device_pwm4;
+extern struct mmp_device_desc pxa910_device_nand;
 extern struct platform_device pxa168_device_usb_phy;
 extern struct platform_device pxa168_device_u2o;
 extern struct platform_device pxa168_device_u2ootg;
 extern struct platform_device pxa168_device_u2oehci;
-extern struct pxa_device_desc pxa910_device_disp;
-extern struct pxa_device_desc pxa910_device_fb;
-extern struct pxa_device_desc pxa910_device_panel;
+extern struct mmp_device_desc pxa910_device_disp;
+extern struct mmp_device_desc pxa910_device_fb;
+extern struct mmp_device_desc pxa910_device_panel;
 extern struct platform_device pxa910_device_gpio;
 extern struct platform_device pxa910_device_rtc;
 
 static inline int pxa910_add_uart(int id)
 {
-	struct pxa_device_desc *d = NULL;
+	struct mmp_device_desc *d = NULL;
 
 	switch (id) {
 	case 1: d = &pxa910_device_uart1; break;
@@ -44,13 +44,13 @@ static inline int pxa910_add_uart(int id)
 	if (d == NULL)
 		return -EINVAL;
 
-	return pxa_register_device(d, NULL, 0);
+	return mmp_register_device(d, NULL, 0);
 }
 
 static inline int pxa910_add_twsi(int id, struct i2c_pxa_platform_data *data,
 				  struct i2c_board_info *info, unsigned size)
 {
-	struct pxa_device_desc *d = NULL;
+	struct mmp_device_desc *d = NULL;
 	int ret;
 
 	switch (id) {
@@ -64,12 +64,12 @@ static inline int pxa910_add_twsi(int id, struct i2c_pxa_platform_data *data,
 	if (ret)
 		return ret;
 
-	return pxa_register_device(d, data, sizeof(*data));
+	return mmp_register_device(d, data, sizeof(*data));
 }
 
 static inline int pxa910_add_pwm(int id)
 {
-	struct pxa_device_desc *d = NULL;
+	struct mmp_device_desc *d = NULL;
 
 	switch (id) {
 	case 1: d = &pxa910_device_pwm1; break;
@@ -80,11 +80,11 @@ static inline int pxa910_add_pwm(int id)
 		return -EINVAL;
 	}
 
-	return pxa_register_device(d, NULL, 0);
+	return mmp_register_device(d, NULL, 0);
 }
 
 static inline int pxa910_add_nand(struct pxa3xx_nand_platform_data *info)
 {
-	return pxa_register_device(&pxa910_device_nand, info, sizeof(*info));
+	return mmp_register_device(&pxa910_device_nand, info, sizeof(*info));
 }
 #endif /* __ASM_MACH_PXA910_H */
diff --git a/arch/arm/mach-mmp/ttc_dkb.c b/arch/arm/mach-mmp/ttc_dkb.c
index 4f240760d4aa..345b2e6d5c7e 100644
--- a/arch/arm/mach-mmp/ttc_dkb.c
+++ b/arch/arm/mach-mmp/ttc_dkb.c
@@ -253,12 +253,12 @@ static struct spi_board_info spi_board_info[] __initdata = {
 
 static void __init add_disp(void)
 {
-	pxa_register_device(&pxa910_device_disp,
+	mmp_register_device(&pxa910_device_disp,
 		&dkb_disp_info, sizeof(dkb_disp_info));
 	spi_register_board_info(spi_board_info, ARRAY_SIZE(spi_board_info));
-	pxa_register_device(&pxa910_device_fb,
+	mmp_register_device(&pxa910_device_fb,
 		&dkb_fb_info, sizeof(dkb_fb_info));
-	pxa_register_device(&pxa910_device_panel,
+	mmp_register_device(&pxa910_device_panel,
 		&dkb_tpo_panel_info, sizeof(dkb_tpo_panel_info));
 }
 #endif
-- 
2.29.2

