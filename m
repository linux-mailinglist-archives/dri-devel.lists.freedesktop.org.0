Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7F2CABCA5
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 03:04:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CF8410E387;
	Mon,  8 Dec 2025 02:04:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="GJIo+4RI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D619610E387
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Dec 2025 02:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Cc:Subject:From:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=gug9CwpDqb+TCtvtvwUyKvSMovynSjoGfeuTquKCNd8=; b=GJIo+4RI9zScb6ah6vv9oRpxzU
 Y7EWECcyRQu8nbLGARUrNfg8Tf31lmCdvheA4wizeMRNn8jd2oQZcDFAKM3XtpJOFHgKAIFmFxcTv
 bVNsYdJ2WBssI0QGKWm0dAlXfAEFt4dYUFXweq8dChvTJhlWS/bFlbMLpmvwR8sVH4LLAn+moUc/e
 dwPO4XIr7ox2E+EE6HCxsIqlryksDU81uTSUtjnVkU5jqxCVHQsxgXSQICjzZd9bGt39Vynmmg2y9
 bmZm1gVEVFJDMuvAUWQJs1vvVlr2tI/R5csgXX7eLqAEJF5YMH5r3nH7sEBdxlHU/k0O4WlY47CKF
 weAnAEQw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vSQbi-0000000CRpl-40tu; Mon, 08 Dec 2025 02:04:11 +0000
Message-ID: <22b92ddf-6321-41b5-8073-f9c7064d3432@infradead.org>
Date: Sun, 7 Dec 2025 18:04:09 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
From: Randy Dunlap <rdunlap@infradead.org>
Subject: Kconfig dangling references (BZ 216748)
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Arnd Bergmann
 <arnd@arndb.de>, andrew.jones@linux.dev, linux-omap@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-sound@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-mips@vger.kernel.org, asahi@lists.linux.dev,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Paul Kocialkowski <paulk@sys-base.io>, chrome-platform@lists.linux.dev,
 Paul Cercueil <paul@crapouillou.net>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-gpio@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>,
 Vaibhav Hiremath <hvaibhav.linux@gmail.com>, linux-sh@vger.kernel.org,
 x86@kernel.org, Max Filippov <jcmvbkbc@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

from  https://bugzilla.kernel.org/show_bug.cgi?id=216748

The bugzilla entry includes a Perl script and a shell script.
This is the edited result of running them (I removed some entries that were noise).

I'll try to Cc: all of the relevant mailing lists or individuals.


ARCH_HAS_HOLES_MEMORYMODEL ---
arch/arm/mach-omap1/Kconfig:7:	select ARCH_HAS_HOLES_MEMORYMODEL

ARM_ERRATA_794072 ---
arch/arm/mach-npcm/Kconfig:33:	select ARM_ERRATA_794072

ARM_SMC_MBOX ---
arch/arm64/Kconfig.platforms:375:	select ARM_SMC_MBOX

CLK_FIXED_FCH ---
sound/soc/amd/Kconfig:11:	select CLK_FIXED_FCH
sound/soc/amd/Kconfig:48:	select CLK_FIXED_FCH
sound/soc/amd/acp/Kconfig:107:	select CLK_FIXED_FCH

CONFIG_STM ---
drivers/hwtracing/stm/Kconfig:16:	default CONFIG_STM  # should be STM
drivers/hwtracing/stm/Kconfig:31:	default CONFIG_STM

CPU_HAS_LOAD_STORE_LR ---
arch/mips/Kconfig:1411:	select CPU_HAS_LOAD_STORE_LR

DRM_KMS_DMA_HELPER ---
drivers/gpu/drm/adp/Kconfig:9:	select DRM_KMS_DMA_HELPER
drivers/gpu/drm/logicvc/Kconfig:7:	select DRM_KMS_DMA_HELPER

EXTCON_TCSS_CROS_EC ---
drivers/usb/typec/ucsi/Kconfig:76:	depends on !EXTCON_TCSS_CROS_EC

MACH_JZ4755 ---
drivers/clk/ingenic/Kconfig:20:	default MACH_JZ4755
drivers/pinctrl/pinctrl-ingenic.c:158:	IS_ENABLED(CONFIG_MACH_JZ4755) << ID_JZ4755 |
drivers/pinctrl/pinctrl-ingenic.c:4616:		.data = IF_ENABLED(CONFIG_MACH_JZ4755, &jz4755_chip_info)

MACH_JZ4760 ---
drivers/clk/ingenic/Kconfig:40:	default MACH_JZ4760
drivers/pinctrl/pinctrl-ingenic.c:159:	IS_ENABLED(CONFIG_MACH_JZ4760) << ID_JZ4760 |
drivers/pinctrl/pinctrl-ingenic.c:4620:		.data = IF_ENABLED(CONFIG_MACH_JZ4760, &jz4760_chip_info)
drivers/pinctrl/pinctrl-ingenic.c:4624:		.data = IF_ENABLED(CONFIG_MACH_JZ4760, &jz4760_chip_info)

MACH_STM32MP25 ---
drivers/pinctrl/stm32/Kconfig:58:	default MACH_STM32MP25 || (ARCH_STM32 && ARM64)

MFD_AIROHA_AN8855 ---
drivers/nvmem/Kconfig:33:	depends on MFD_AIROHA_AN8855 || COMPILE_TEST

MFD_TN48M_CPLD ---
drivers/gpio/Kconfig:1624:	depends on MFD_TN48M_CPLD || COMPILE_TEST
drivers/reset/Kconfig:365:	depends on MFD_TN48M_CPLD || COMPILE_TEST
drivers/reset/Kconfig:366:	default MFD_TN48M_CPLD

MIPS_BAIKAL_T1 ---
drivers/ata/Kconfig:197:	select MFD_SYSCON if (MIPS_BAIKAL_T1 || COMPILE_TEST)
drivers/bus/Kconfig:43:	depends on MIPS_BAIKAL_T1 || COMPILE_TEST
drivers/bus/Kconfig:58:	depends on MIPS_BAIKAL_T1 || COMPILE_TEST
drivers/clk/baikal-t1/Kconfig:4:	depends on (MIPS_BAIKAL_T1 && OF) || COMPILE_TEST
drivers/clk/baikal-t1/Kconfig:5:	default MIPS_BAIKAL_T1
drivers/clk/baikal-t1/Kconfig:20:	default MIPS_BAIKAL_T1
drivers/clk/baikal-t1/Kconfig:33:	default MIPS_BAIKAL_T1
drivers/clk/baikal-t1/Kconfig:45:	default MIPS_BAIKAL_T1
drivers/hwmon/Kconfig:462:	depends on MIPS_BAIKAL_T1 || COMPILE_TEST
drivers/i2c/busses/Kconfig:589:	select MFD_SYSCON if MIPS_BAIKAL_T1
drivers/memory/Kconfig:69:	depends on MIPS_BAIKAL_T1 || COMPILE_TEST
drivers/mtd/maps/Kconfig:81:	depends on MIPS_BAIKAL_T1 || COMPILE_TEST
drivers/pci/controller/dwc/Kconfig:89:	depends on MIPS_BAIKAL_T1 || COMPILE_TEST
drivers/spi/Kconfig:370:	depends on MIPS_BAIKAL_T1 || COMPILE_TEST

PINCTRL_MILBEAUT ---
arch/arm/mach-milbeaut/Kconfig:16:	select PINCTRL_MILBEAUT

SND_SOC_AC97_BUS_NEW ---
sound/soc/pxa/Kconfig:21:	select SND_SOC_AC97_BUS_NEW

SND_SOC_CS35L56_CAL_SYSFS_COMMON ---
sound/soc/codecs/Kconfig:920:	select SND_SOC_CS35L56_CAL_SYSFS_COMMON

TEST_KUNIT_DEVICE_HELPERS ---
drivers/iio/test/Kconfig:11:	select TEST_KUNIT_DEVICE_HELPERS

USB_HSIC_USB3613 ---
drivers/staging/greybus/Kconfig:209:	depends on USB_HSIC_USB3613 || COMPILE_TEST
drivers/staging/greybus/arche-platform.c:26:#if IS_ENABLED(CONFIG_USB_HSIC_USB3613)

USB_OHCI_SH ---
arch/sh/Kconfig:334:	select USB_OHCI_SH if USB_OHCI_HCD
arch/sh/Kconfig:344:	select USB_OHCI_SH if USB_OHCI_HCD
arch/sh/Kconfig:429:	select USB_OHCI_SH if USB_OHCI_HCD
arch/sh/Kconfig:455:	select USB_OHCI_SH if USB_OHCI_HCD
arch/sh/configs/sh7757lcr_defconfig:61:CONFIG_USB_OHCI_SH=y

X86_P6_NOP ---
arch/x86/Kconfig.cpufeatures:41:	depends on X86_64 || X86_P6_NOP
arch/x86/Makefile_32.cpu:48:ifneq ($(CONFIG_X86_P6_NOP),y)

XTENSA_PLATFORM_ESP32 ---
drivers/tty/serial/Kconfig:1598:	depends on XTENSA_PLATFORM_ESP32 || (COMPILE_TEST && OF)
drivers/tty/serial/Kconfig:1611:	depends on XTENSA_PLATFORM_ESP32 || (COMPILE_TEST && OF)


-- 
~Randy

