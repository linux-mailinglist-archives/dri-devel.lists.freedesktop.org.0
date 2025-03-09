Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1D7A5879B
	for <lists+dri-devel@lfdr.de>; Sun,  9 Mar 2025 20:36:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8D9710E25D;
	Sun,  9 Mar 2025 19:36:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="r9PkUDAT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C68DD10E266
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Mar 2025 19:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=YAkUjNLNCjv+yvfpQR/TU0k2FV8ltLB9WNQ+5r3dGxA=; b=r9PkUDATJDvB0uqR
 xpbRltmA+b1366OfP0pPDxwzU9TelNNmupogR3vNxY/8ZP+kPA+4cppFoy5t7ko/UT2DJcD9UPak8
 iBYfh3qNRBll9u2Mio9WUpFAJvoUqYgLug8htfNBws0ZYWDsJY4JcOv6zcG2yYc7K8X8SY/KCEAqF
 LG1+13F280qodxHIBd9Jw6eczcT49Re1DbYGxprQLSJPUH5CDUzd5zjpb4U4QFQ/ikZT3qA3w7fCo
 G34QiCBXbhxntu7EXsr2M0lmZHXeiyYinUgBoucGpm0SwVKGjIQpxuTYllXcTMmEz+6zmoi/sASIQ
 rANdDuGjIxYRnFLiSw==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1trMS1-003kFU-0e;
 Sun, 09 Mar 2025 19:36:41 +0000
From: linux@treblig.org
To: arnd@arndb.de, lee@kernel.org, dmitry.torokhov@gmail.com, sre@kernel.org,
 lgirdwood@gmail.com, broonie@kernel.org, alexandre.belloni@bootlin.com,
 danielt@kernel.org, jingoohan1@gmail.com, deller@gmx.de,
 linus.walleij@linaro.org, brgl@bgdev.pl, tsbogend@alpha.franken.de
Cc: linux-mips@vger.kernel.org, linux-input@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 4/9] mfd: pcF50633-gpio: Remove
Date: Sun,  9 Mar 2025 19:36:07 +0000
Message-ID: <20250309193612.251929-5-linux@treblig.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250309193612.251929-1-linux@treblig.org>
References: <20250309193612.251929-1-linux@treblig.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Dr. David Alan Gilbert" <linux@treblig.org>

The pcf50633 was used as part of the OpenMoko devices but
the support for its main chip was recently removed in:
commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support")

See https://lore.kernel.org/all/Z8z236h4B5A6Ki3D@gallifrey/

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 arch/mips/configs/ip27_defconfig  |  1 -
 drivers/mfd/Kconfig               |  7 ---
 drivers/mfd/Makefile              |  1 -
 drivers/mfd/pcf50633-gpio.c       | 92 -------------------------------
 include/linux/mfd/pcf50633/gpio.h | 48 ----------------
 5 files changed, 149 deletions(-)
 delete mode 100644 drivers/mfd/pcf50633-gpio.c
 delete mode 100644 include/linux/mfd/pcf50633/gpio.h

diff --git a/arch/mips/configs/ip27_defconfig b/arch/mips/configs/ip27_defconfig
index 66085bb71bc4..0a9ec09aff65 100644
--- a/arch/mips/configs/ip27_defconfig
+++ b/arch/mips/configs/ip27_defconfig
@@ -256,7 +256,6 @@ CONFIG_I2C_STUB=m
 # CONFIG_HWMON is not set
 CONFIG_THERMAL=y
 CONFIG_MFD_PCF50633=m
-CONFIG_PCF50633_GPIO=m
 # CONFIG_VGA_ARB is not set
 CONFIG_LEDS_LP3944=m
 CONFIG_LEDS_PCA955X=m
diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 051272126fe1..766453ef6c2d 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1129,13 +1129,6 @@ config MFD_PCF50633
 	  facilities, and registers devices for the various functions
 	  so that function-specific drivers can bind to them.
 
-config PCF50633_GPIO
-	tristate "NXP PCF50633 GPIO"
-	depends on MFD_PCF50633
-	help
-	  Say yes here if you want to include support GPIO for pins on
-	  the PCF50633 chip.
-
 config MFD_PM8XXX
 	tristate "Qualcomm PM8xxx PMIC chips driver"
 	depends on ARM || HEXAGON || COMPILE_TEST
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index e085da3f13c3..d769e40251c8 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -185,7 +185,6 @@ obj-$(CONFIG_MFD_MT6397)	+= mt6397.o
 
 pcf50633-objs			:= pcf50633-core.o pcf50633-irq.o
 obj-$(CONFIG_MFD_PCF50633)	+= pcf50633.o
-obj-$(CONFIG_PCF50633_GPIO)	+= pcf50633-gpio.o
 obj-$(CONFIG_RZ_MTU3)		+= rz-mtu3.o
 obj-$(CONFIG_ABX500_CORE)	+= abx500-core.o
 obj-$(CONFIG_MFD_DB8500_PRCMU)	+= db8500-prcmu.o
diff --git a/drivers/mfd/pcf50633-gpio.c b/drivers/mfd/pcf50633-gpio.c
deleted file mode 100644
index 3e368219479a..000000000000
--- a/drivers/mfd/pcf50633-gpio.c
+++ /dev/null
@@ -1,92 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/* NXP PCF50633 GPIO Driver
- *
- * (C) 2006-2008 by Openmoko, Inc.
- * Author: Balaji Rao <balajirrao@openmoko.org>
- * All rights reserved.
- *
- * Broken down from monstrous PCF50633 driver mainly by
- * Harald Welte, Andy Green and Werner Almesberger
- */
-
-#include <linux/kernel.h>
-#include <linux/module.h>
-
-#include <linux/mfd/pcf50633/core.h>
-#include <linux/mfd/pcf50633/gpio.h>
-#include <linux/mfd/pcf50633/pmic.h>
-
-static const u8 pcf50633_regulator_registers[PCF50633_NUM_REGULATORS] = {
-	[PCF50633_REGULATOR_AUTO]	= PCF50633_REG_AUTOOUT,
-	[PCF50633_REGULATOR_DOWN1]	= PCF50633_REG_DOWN1OUT,
-	[PCF50633_REGULATOR_DOWN2]	= PCF50633_REG_DOWN2OUT,
-	[PCF50633_REGULATOR_MEMLDO]	= PCF50633_REG_MEMLDOOUT,
-	[PCF50633_REGULATOR_LDO1]	= PCF50633_REG_LDO1OUT,
-	[PCF50633_REGULATOR_LDO2]	= PCF50633_REG_LDO2OUT,
-	[PCF50633_REGULATOR_LDO3]	= PCF50633_REG_LDO3OUT,
-	[PCF50633_REGULATOR_LDO4]	= PCF50633_REG_LDO4OUT,
-	[PCF50633_REGULATOR_LDO5]	= PCF50633_REG_LDO5OUT,
-	[PCF50633_REGULATOR_LDO6]	= PCF50633_REG_LDO6OUT,
-	[PCF50633_REGULATOR_HCLDO]	= PCF50633_REG_HCLDOOUT,
-};
-
-int pcf50633_gpio_set(struct pcf50633 *pcf, int gpio, u8 val)
-{
-	u8 reg;
-
-	reg = gpio - PCF50633_GPIO1 + PCF50633_REG_GPIO1CFG;
-
-	return pcf50633_reg_set_bit_mask(pcf, reg, 0x07, val);
-}
-EXPORT_SYMBOL_GPL(pcf50633_gpio_set);
-
-u8 pcf50633_gpio_get(struct pcf50633 *pcf, int gpio)
-{
-	u8 reg, val;
-
-	reg = gpio - PCF50633_GPIO1 + PCF50633_REG_GPIO1CFG;
-	val = pcf50633_reg_read(pcf, reg) & 0x07;
-
-	return val;
-}
-EXPORT_SYMBOL_GPL(pcf50633_gpio_get);
-
-int pcf50633_gpio_invert_set(struct pcf50633 *pcf, int gpio, int invert)
-{
-	u8 val, reg;
-
-	reg = gpio - PCF50633_GPIO1 + PCF50633_REG_GPIO1CFG;
-	val = !!invert << 3;
-
-	return pcf50633_reg_set_bit_mask(pcf, reg, 1 << 3, val);
-}
-EXPORT_SYMBOL_GPL(pcf50633_gpio_invert_set);
-
-int pcf50633_gpio_invert_get(struct pcf50633 *pcf, int gpio)
-{
-	u8 reg, val;
-
-	reg = gpio - PCF50633_GPIO1 + PCF50633_REG_GPIO1CFG;
-	val = pcf50633_reg_read(pcf, reg);
-
-	return val & (1 << 3);
-}
-EXPORT_SYMBOL_GPL(pcf50633_gpio_invert_get);
-
-int pcf50633_gpio_power_supply_set(struct pcf50633 *pcf,
-					int gpio, int regulator, int on)
-{
-	u8 reg, val, mask;
-
-	/* the *ENA register is always one after the *OUT register */
-	reg = pcf50633_regulator_registers[regulator] + 1;
-
-	val = !!on << (gpio - PCF50633_GPIO1);
-	mask = 1 << (gpio - PCF50633_GPIO1);
-
-	return pcf50633_reg_set_bit_mask(pcf, reg, mask, val);
-}
-EXPORT_SYMBOL_GPL(pcf50633_gpio_power_supply_set);
-
-MODULE_DESCRIPTION("NXP PCF50633 GPIO Driver");
-MODULE_LICENSE("GPL");
diff --git a/include/linux/mfd/pcf50633/gpio.h b/include/linux/mfd/pcf50633/gpio.h
deleted file mode 100644
index f589e35795f1..000000000000
--- a/include/linux/mfd/pcf50633/gpio.h
+++ /dev/null
@@ -1,48 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * gpio.h -- GPIO driver for NXP PCF50633
- *
- * (C) 2006-2008 by Openmoko, Inc.
- * All rights reserved.
- */
-
-#ifndef __LINUX_MFD_PCF50633_GPIO_H
-#define __LINUX_MFD_PCF50633_GPIO_H
-
-#include <linux/mfd/pcf50633/core.h>
-
-#define PCF50633_GPIO1		1
-#define PCF50633_GPIO2		2
-#define PCF50633_GPIO3		3
-#define PCF50633_GPO		4
-
-#define PCF50633_REG_GPIO1CFG	0x14
-#define PCF50633_REG_GPIO2CFG	0x15
-#define PCF50633_REG_GPIO3CFG	0x16
-#define PCF50633_REG_GPOCFG 	0x17
-
-#define PCF50633_GPOCFG_GPOSEL_MASK	0x07
-
-enum pcf50633_reg_gpocfg {
-	PCF50633_GPOCFG_GPOSEL_0	= 0x00,
-	PCF50633_GPOCFG_GPOSEL_LED_NFET	= 0x01,
-	PCF50633_GPOCFG_GPOSEL_SYSxOK	= 0x02,
-	PCF50633_GPOCFG_GPOSEL_CLK32K	= 0x03,
-	PCF50633_GPOCFG_GPOSEL_ADAPUSB	= 0x04,
-	PCF50633_GPOCFG_GPOSEL_USBxOK	= 0x05,
-	PCF50633_GPOCFG_GPOSEL_ACTPH4	= 0x06,
-	PCF50633_GPOCFG_GPOSEL_1	= 0x07,
-	PCF50633_GPOCFG_GPOSEL_INVERSE	= 0x08,
-};
-
-int pcf50633_gpio_set(struct pcf50633 *pcf, int gpio, u8 val);
-u8 pcf50633_gpio_get(struct pcf50633 *pcf, int gpio);
-
-int pcf50633_gpio_invert_set(struct pcf50633 *, int gpio, int invert);
-int pcf50633_gpio_invert_get(struct pcf50633 *pcf, int gpio);
-
-int pcf50633_gpio_power_supply_set(struct pcf50633 *,
-					int gpio, int regulator, int on);
-#endif /* __LINUX_MFD_PCF50633_GPIO_H */
-
-
-- 
2.48.1

