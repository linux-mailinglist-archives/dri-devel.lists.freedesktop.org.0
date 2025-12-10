Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F027CB2FC6
	for <lists+dri-devel@lfdr.de>; Wed, 10 Dec 2025 14:17:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 640B510E059;
	Wed, 10 Dec 2025 13:17:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=crapouillou.net header.i=@crapouillou.net header.b="RnCMPHJ8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 630 seconds by postgrey-1.36 at gabe;
 Wed, 10 Dec 2025 13:17:23 UTC
Received: from aposti.net (aposti.net [185.119.170.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73B2310E059
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 13:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1765372011;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=cDRFy6vcE6IK0n780GaRWgRqUqt6rq2uXI/t4/Gr+Mo=;
 b=RnCMPHJ8+5bLooq6YXu3nxjc4rHzf3q6p7Xq5Db7RIOUc6t+Xd3ujkkPR0UB3ezQtrVOcb
 eEW6BLRdJMR0FiH+oIzNU8lDYzI29mfeAEpWk0l8VPS1wWY4/shf0rvBVsaV0G+NMHf00k
 +Cudz+YjfUoQ/V5j0AoCmAvEmoGw5dk=
Message-ID: <4b6db1eb455fff8e3c7372943faa5ef179c1d19f.camel@crapouillou.net>
Subject: Re: Kconfig dangling references (BZ 216748)
From: Paul Cercueil <paul@crapouillou.net>
To: Randy Dunlap <rdunlap@infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Arnd Bergmann
 <arnd@arndb.de>, 	andrew.jones@linux.dev, linux-omap@vger.kernel.org,
 openbmc@lists.ozlabs.org, 	linux-sound@vger.kernel.org, Alexander Shishkin	
 <alexander.shishkin@linux.intel.com>, linux-mips@vger.kernel.org, 
 asahi@lists.linux.dev, "dri-devel@lists.freedesktop.org"	
 <dri-devel@lists.freedesktop.org>, Paul Kocialkowski <paulk@sys-base.io>, 
 chrome-platform@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-gpio@vger.kernel.org, Srinivas Kandagatla	 <srini@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Matti Vaittinen	
 <mazziesaccount@gmail.com>, Jonathan Cameron <jic23@kernel.org>, Vaibhav
 Hiremath <hvaibhav.linux@gmail.com>, linux-sh@vger.kernel.org,
 x86@kernel.org, Max Filippov	 <jcmvbkbc@gmail.com>
Date: Wed, 10 Dec 2025 14:06:41 +0100
In-Reply-To: <22b92ddf-6321-41b5-8073-f9c7064d3432@infradead.org>
References: <22b92ddf-6321-41b5-8073-f9c7064d3432@infradead.org>
Autocrypt: addr=paul@crapouillou.net; prefer-encrypt=mutual;
 keydata=mQENBF0KhcEBCADkfmrzdTOp/gFOMQX0QwKE2WgeCJiHPWkpEuPH81/HB2dpjPZNW03ZM
 LQfECbbaEkdbN4YnPfXgcc1uBe5mwOAPV1MBlaZcEt4M67iYQwSNrP7maPS3IaQJ18ES8JJ5Uf5Uz
 FZaUawgH+oipYGW+v31cX6L3k+dGsPRM0Pyo0sQt52fsopNPZ9iag0iY7dGNuKenaEqkYNjwEgTtN
 z8dt6s3hMpHIKZFL3OhAGi88wF/21isv0zkF4J0wlf9gYUTEEY3Eulx80PTVqGIcHZzfavlWIdzhe
 +rxHTDGVwseR2Y1WjgFGQ2F+vXetAB8NEeygXee+i9nY5qt9c07m8mzjABEBAAG0JFBhdWwgQ2VyY
 3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0PokBTgQTAQoAOBYhBNdHYd8OeCBwpMuVxnPua9InSr
 1BBQJdCoXBAhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEHPua9InSr1BgvIH/0kLyrI3V0f
 33a6D3BJwc1grbygPVYGuC5l5eMnAI+rDmLR19E2yvibRpgUc87NmPEQPpbbtAZt8On/2WZoE5OIP
 dlId/AHNpdgAtGXo0ZX4LGeVPjxjdkbrKVHxbcdcnY+zzaFglpbVSvp76pxqgVg8PgxkAAeeJV+ET
 4t0823Gz2HzCL/6JZhvKAEtHVulOWoBh368SYdolp1TSfORWmHzvQiCCCA+j0cMkYVGzIQzEQhX7U
 rf9N/nhU5/SGLFEi9DcBfXoGzhyQyLXflhJtKm3XGB1K/pPulbKaPcKAl6rIDWPuFpHkSbmZ9r4KF
 lBwgAhlGy6nqP7O3u7q23hRU=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Randy,

Le dimanche 07 d=C3=A9cembre 2025 =C3=A0 18:04 -0800, Randy Dunlap a =C3=A9=
crit=C2=A0:
> from=C2=A0 https://bugzilla.kernel.org/show_bug.cgi?id=3D216748
>=20
> The bugzilla entry includes a Perl script and a shell script.
> This is the edited result of running them (I removed some entries
> that were noise).
>=20
> I'll try to Cc: all of the relevant mailing lists or individuals.
>=20
>=20
> ARCH_HAS_HOLES_MEMORYMODEL ---
> arch/arm/mach-omap1/Kconfig:7:	select ARCH_HAS_HOLES_MEMORYMODEL
>=20
> ARM_ERRATA_794072 ---
> arch/arm/mach-npcm/Kconfig:33:	select ARM_ERRATA_794072
>=20
> ARM_SMC_MBOX ---
> arch/arm64/Kconfig.platforms:375:	select ARM_SMC_MBOX
>=20
> CLK_FIXED_FCH ---
> sound/soc/amd/Kconfig:11:	select CLK_FIXED_FCH
> sound/soc/amd/Kconfig:48:	select CLK_FIXED_FCH
> sound/soc/amd/acp/Kconfig:107:	select CLK_FIXED_FCH
>=20
> CONFIG_STM ---
> drivers/hwtracing/stm/Kconfig:16:	default CONFIG_STM=C2=A0 # should
> be STM
> drivers/hwtracing/stm/Kconfig:31:	default CONFIG_STM
>=20
> CPU_HAS_LOAD_STORE_LR ---
> arch/mips/Kconfig:1411:	select CPU_HAS_LOAD_STORE_LR
>=20
> DRM_KMS_DMA_HELPER ---
> drivers/gpu/drm/adp/Kconfig:9:	select DRM_KMS_DMA_HELPER
> drivers/gpu/drm/logicvc/Kconfig:7:	select DRM_KMS_DMA_HELPER
>=20
> EXTCON_TCSS_CROS_EC ---
> drivers/usb/typec/ucsi/Kconfig:76:	depends on
> !EXTCON_TCSS_CROS_EC
>=20
> MACH_JZ4755 ---
> drivers/clk/ingenic/Kconfig:20:	default MACH_JZ4755
> drivers/pinctrl/pinctrl-
> ingenic.c:158:	IS_ENABLED(CONFIG_MACH_JZ4755) << ID_JZ4755 |
> drivers/pinctrl/pinctrl-ingenic.c:4616:		.data =3D
> IF_ENABLED(CONFIG_MACH_JZ4755, &jz4755_chip_info)
>=20
> MACH_JZ4760 ---
> drivers/clk/ingenic/Kconfig:40:	default MACH_JZ4760
> drivers/pinctrl/pinctrl-
> ingenic.c:159:	IS_ENABLED(CONFIG_MACH_JZ4760) << ID_JZ4760 |
> drivers/pinctrl/pinctrl-ingenic.c:4620:		.data =3D
> IF_ENABLED(CONFIG_MACH_JZ4760, &jz4760_chip_info)
> drivers/pinctrl/pinctrl-ingenic.c:4624:		.data =3D
> IF_ENABLED(CONFIG_MACH_JZ4760, &jz4760_chip_info)

Those were added when upstreaming support for the JZ4755/JZ4760, but
the DTS files and actual support in arch/mips/ was never sent.

Instead of dropping those, I'll try to upstream the basic support for
those SoCs in the coming days.

Cheers,
-Paul

>=20
> MACH_STM32MP25 ---
> drivers/pinctrl/stm32/Kconfig:58:	default MACH_STM32MP25 ||
> (ARCH_STM32 && ARM64)
>=20
> MFD_AIROHA_AN8855 ---
> drivers/nvmem/Kconfig:33:	depends on MFD_AIROHA_AN8855 ||
> COMPILE_TEST
>=20
> MFD_TN48M_CPLD ---
> drivers/gpio/Kconfig:1624:	depends on MFD_TN48M_CPLD ||
> COMPILE_TEST
> drivers/reset/Kconfig:365:	depends on MFD_TN48M_CPLD ||
> COMPILE_TEST
> drivers/reset/Kconfig:366:	default MFD_TN48M_CPLD
>=20
> MIPS_BAIKAL_T1 ---
> drivers/ata/Kconfig:197:	select MFD_SYSCON if (MIPS_BAIKAL_T1
> || COMPILE_TEST)
> drivers/bus/Kconfig:43:	depends on MIPS_BAIKAL_T1 || COMPILE_TEST
> drivers/bus/Kconfig:58:	depends on MIPS_BAIKAL_T1 || COMPILE_TEST
> drivers/clk/baikal-t1/Kconfig:4:	depends on (MIPS_BAIKAL_T1
> && OF) || COMPILE_TEST
> drivers/clk/baikal-t1/Kconfig:5:	default MIPS_BAIKAL_T1
> drivers/clk/baikal-t1/Kconfig:20:	default MIPS_BAIKAL_T1
> drivers/clk/baikal-t1/Kconfig:33:	default MIPS_BAIKAL_T1
> drivers/clk/baikal-t1/Kconfig:45:	default MIPS_BAIKAL_T1
> drivers/hwmon/Kconfig:462:	depends on MIPS_BAIKAL_T1 ||
> COMPILE_TEST
> drivers/i2c/busses/Kconfig:589:	select MFD_SYSCON if MIPS_BAIKAL_T1
> drivers/memory/Kconfig:69:	depends on MIPS_BAIKAL_T1 ||
> COMPILE_TEST
> drivers/mtd/maps/Kconfig:81:	depends on MIPS_BAIKAL_T1 ||
> COMPILE_TEST
> drivers/pci/controller/dwc/Kconfig:89:	depends on MIPS_BAIKAL_T1 ||
> COMPILE_TEST
> drivers/spi/Kconfig:370:	depends on MIPS_BAIKAL_T1 ||
> COMPILE_TEST
>=20
> PINCTRL_MILBEAUT ---
> arch/arm/mach-milbeaut/Kconfig:16:	select PINCTRL_MILBEAUT
>=20
> SND_SOC_AC97_BUS_NEW ---
> sound/soc/pxa/Kconfig:21:	select SND_SOC_AC97_BUS_NEW
>=20
> SND_SOC_CS35L56_CAL_SYSFS_COMMON ---
> sound/soc/codecs/Kconfig:920:	select
> SND_SOC_CS35L56_CAL_SYSFS_COMMON
>=20
> TEST_KUNIT_DEVICE_HELPERS ---
> drivers/iio/test/Kconfig:11:	select TEST_KUNIT_DEVICE_HELPERS
>=20
> USB_HSIC_USB3613 ---
> drivers/staging/greybus/Kconfig:209:	depends on USB_HSIC_USB3613
> || COMPILE_TEST
> drivers/staging/greybus/arche-platform.c:26:#if
> IS_ENABLED(CONFIG_USB_HSIC_USB3613)
>=20
> USB_OHCI_SH ---
> arch/sh/Kconfig:334:	select USB_OHCI_SH if USB_OHCI_HCD
> arch/sh/Kconfig:344:	select USB_OHCI_SH if USB_OHCI_HCD
> arch/sh/Kconfig:429:	select USB_OHCI_SH if USB_OHCI_HCD
> arch/sh/Kconfig:455:	select USB_OHCI_SH if USB_OHCI_HCD
> arch/sh/configs/sh7757lcr_defconfig:61:CONFIG_USB_OHCI_SH=3Dy
>=20
> X86_P6_NOP ---
> arch/x86/Kconfig.cpufeatures:41:	depends on X86_64 ||
> X86_P6_NOP
> arch/x86/Makefile_32.cpu:48:ifneq ($(CONFIG_X86_P6_NOP),y)
>=20
> XTENSA_PLATFORM_ESP32 ---
> drivers/tty/serial/Kconfig:1598:	depends on
> XTENSA_PLATFORM_ESP32 || (COMPILE_TEST && OF)
> drivers/tty/serial/Kconfig:1611:	depends on
> XTENSA_PLATFORM_ESP32 || (COMPILE_TEST && OF)
>=20
