Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A59607B8A
	for <lists+dri-devel@lfdr.de>; Fri, 21 Oct 2022 17:53:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BB5110E2C2;
	Fri, 21 Oct 2022 15:53:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D13710E2C2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Oct 2022 15:53:37 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AE4C461B5D;
 Fri, 21 Oct 2022 15:53:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E49D9C433D6;
 Fri, 21 Oct 2022 15:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666367616;
 bh=gnF0ZiaglCURAv6t2p4bfvTKHmtuivlwbY/edKAN5aU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=B/TXsCe1tXwdmrOtznf1S+UP/dwxNilTwQo+TOMB0QYZx1DEo3cTz+YW0a5Y1AJVO
 bYSc16XOOUxALZkMr7YTrBGxSzHOfCZUO5IYwmgSd/baGWigX3u7D5mRVxZoAUar3w
 yCtPfYE7rym794k3PVb4HU8sjGx7rf1i+P+YT5j95J9R80xJ1P/4RILz/CFBhBk7pp
 7ADBq6Yt3cBivcZRY2Pma4bNwkaA/2KWy+7En7AZPh+VTOPF7NXknnKIvCSvQoL8B9
 Q1p8hH+b3AdANqU0vKigrl0/8FhC2PSYavsh+mjtvDJtMVeJhurh6HFFRLwmPun+q7
 SDhUqrzuz6Y0g==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-arm-kernel@lists.infradead.org, Russell King <linux@armlinux.org.uk>,
 Linus Walleij <linus.walleij@linaro.org>, Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH 02/11] ARM: sa1100: remove unused board files
Date: Fri, 21 Oct 2022 17:49:32 +0200
Message-Id: <20221021155000.4108406-3-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20221021155000.4108406-1-arnd@kernel.org>
References: <20221021155000.4108406-1-arnd@kernel.org>
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
Cc: Stefan Eletzhofer <stefan.eletzhofer@eletztrick.de>,
 linux-fbdev@vger.kernel.org, linux-usb@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Helge Deller <deller@gmx.de>,
 Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Peter Chubb <peter.chubb@unsw.edu.au>, Alan Stern <stern@rowland.harvard.edu>,
 dri-devel@lists.freedesktop.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-pm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

The Cerf, H3100, Badge4, Hackkit, LART, NanoEngine, PLEB, Shannon and
Simpad machines were all marked as unused as there are no known users
left. Remove all of these, along with references to them in defconfig
files and drivers.

Four machines remain now: Assabet, Collie (Zaurus SL5500), iPAQ H3600
and Jornada 720, each of which had one person still using them, with
Collie also being supported in Qemu.

Cc: Peter Chubb <peter.chubb@unsw.edu.au>
Cc: Stefan Eletzhofer <stefan.eletzhofer@eletztrick.de>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 MAINTAINERS                                   |  11 -
 arch/arm/Kconfig                              |   6 -
 arch/arm/boot/compressed/head-sa1100.S        |   4 -
 arch/arm/configs/badge4_defconfig             | 105 -----
 arch/arm/configs/cerfcube_defconfig           |  73 ---
 arch/arm/configs/hackkit_defconfig            |  48 --
 arch/arm/configs/lart_defconfig               |  64 ---
 arch/arm/configs/pleb_defconfig               |  53 ---
 arch/arm/configs/shannon_defconfig            |  45 --
 arch/arm/configs/simpad_defconfig             | 100 -----
 arch/arm/mach-sa1100/Kconfig                  | 111 -----
 arch/arm/mach-sa1100/Makefile                 |  21 -
 arch/arm/mach-sa1100/badge4.c                 | 338 --------------
 arch/arm/mach-sa1100/cerf.c                   | 181 --------
 arch/arm/mach-sa1100/h3100.c                  | 140 ------
 arch/arm/mach-sa1100/hackkit.c                | 184 --------
 arch/arm/mach-sa1100/include/mach/badge4.h    |  71 ---
 arch/arm/mach-sa1100/include/mach/cerf.h      |  20 -
 .../arm/mach-sa1100/include/mach/nanoengine.h |  48 --
 arch/arm/mach-sa1100/include/mach/shannon.h   |  40 --
 arch/arm/mach-sa1100/include/mach/simpad.h    | 159 -------
 arch/arm/mach-sa1100/lart.c                   | 177 --------
 arch/arm/mach-sa1100/nanoengine.c             | 136 ------
 arch/arm/mach-sa1100/pci-nanoengine.c         | 191 --------
 arch/arm/mach-sa1100/pleb.c                   | 148 ------
 arch/arm/mach-sa1100/shannon.c                | 157 -------
 arch/arm/mach-sa1100/simpad.c                 | 423 ------------------
 drivers/cpufreq/sa1110-cpufreq.c              |   6 -
 drivers/mfd/Kconfig                           |   2 +-
 drivers/pcmcia/sa1100_generic.c               |   5 +-
 drivers/pcmcia/sa1100_h3600.c                 |   2 +-
 drivers/pcmcia/sa1111_generic.c               |   4 -
 drivers/usb/host/ohci-sa1111.c                |   5 +-
 drivers/video/fbdev/sa1100fb.c                |   1 -
 34 files changed, 4 insertions(+), 3075 deletions(-)
 delete mode 100644 arch/arm/configs/badge4_defconfig
 delete mode 100644 arch/arm/configs/cerfcube_defconfig
 delete mode 100644 arch/arm/configs/hackkit_defconfig
 delete mode 100644 arch/arm/configs/lart_defconfig
 delete mode 100644 arch/arm/configs/pleb_defconfig
 delete mode 100644 arch/arm/configs/shannon_defconfig
 delete mode 100644 arch/arm/configs/simpad_defconfig
 delete mode 100644 arch/arm/mach-sa1100/badge4.c
 delete mode 100644 arch/arm/mach-sa1100/cerf.c
 delete mode 100644 arch/arm/mach-sa1100/h3100.c
 delete mode 100644 arch/arm/mach-sa1100/hackkit.c
 delete mode 100644 arch/arm/mach-sa1100/include/mach/badge4.h
 delete mode 100644 arch/arm/mach-sa1100/include/mach/cerf.h
 delete mode 100644 arch/arm/mach-sa1100/include/mach/nanoengine.h
 delete mode 100644 arch/arm/mach-sa1100/include/mach/shannon.h
 delete mode 100644 arch/arm/mach-sa1100/include/mach/simpad.h
 delete mode 100644 arch/arm/mach-sa1100/lart.c
 delete mode 100644 arch/arm/mach-sa1100/nanoengine.c
 delete mode 100644 arch/arm/mach-sa1100/pci-nanoengine.c
 delete mode 100644 arch/arm/mach-sa1100/pleb.c
 delete mode 100644 arch/arm/mach-sa1100/shannon.c
 delete mode 100644 arch/arm/mach-sa1100/simpad.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 77f913567c7e..ec3d53b5e1d1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2486,17 +2486,6 @@ F:	arch/arm/mach-oxnas/
 F:	drivers/power/reset/oxnas-restart.c
 N:	oxnas
 
-ARM/PLEB SUPPORT
-M:	Peter Chubb <pleb@gelato.unsw.edu.au>
-S:	Maintained
-W:	http://www.disy.cse.unsw.edu.au/Hardware/PLEB
-
-ARM/PT DIGITAL BOARD PORT
-M:	Stefan Eletzhofer <stefan.eletzhofer@eletztrick.de>
-L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-S:	Maintained
-W:	http://www.armlinux.org.uk/
-
 ARM/QUALCOMM SUPPORT
 M:	Andy Gross <agross@kernel.org>
 M:	Bjorn Andersson <andersson@kernel.org>
diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index ac4c58d9497f..c1614f91e04c 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -922,12 +922,6 @@ config ISA
 config ISA_DMA_API
 	bool
 
-config PCI_NANOENGINE
-	bool "BSE nanoEngine PCI support"
-	depends on SA1100_NANOENGINE
-	help
-	  Enable PCI on the BSE nanoEngine board.
-
 config ARM_ERRATA_814220
 	bool "ARM errata: Cache maintenance by set/way operations can execute out of order"
 	depends on CPU_V7
diff --git a/arch/arm/boot/compressed/head-sa1100.S b/arch/arm/boot/compressed/head-sa1100.S
index 95abdd850fe3..23eae1a65064 100644
--- a/arch/arm/boot/compressed/head-sa1100.S
+++ b/arch/arm/boot/compressed/head-sa1100.S
@@ -19,10 +19,6 @@ __SA1100_start:
 		@ Preserve r8/r7 i.e. kernel entry values
 #ifdef CONFIG_SA1100_COLLIE
 		mov	r7, #MACH_TYPE_COLLIE
-#endif
-#ifdef CONFIG_SA1100_SIMPAD
-		@ UNTIL we've something like an open bootldr
-		mov	r7, #MACH_TYPE_SIMPAD	@should be 87
 #endif
 		mrc	p15, 0, r0, c1, c0, 0	@ read control reg
 		ands	r0, r0, #0x0d
diff --git a/arch/arm/configs/badge4_defconfig b/arch/arm/configs/badge4_defconfig
deleted file mode 100644
index 337e5c9718ae..000000000000
--- a/arch/arm/configs/badge4_defconfig
+++ /dev/null
@@ -1,105 +0,0 @@
-CONFIG_LOG_BUF_SHIFT=14
-CONFIG_EXPERT=y
-CONFIG_ARCH_MULTI_V4=y
-# CONFIG_ARCH_MULTI_V7 is not set
-CONFIG_ARCH_SA1100=y
-CONFIG_SA1100_BADGE4=y
-CONFIG_UNUSED_BOARD_FILES=y
-CONFIG_CMDLINE="init=/linuxrc root=/dev/mtdblock3"
-CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
-CONFIG_FPE_NWFPE=y
-CONFIG_MODULES=y
-CONFIG_MODVERSIONS=y
-CONFIG_PARTITION_ADVANCED=y
-CONFIG_BINFMT_MISC=m
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_INET=y
-# CONFIG_IPV6 is not set
-CONFIG_BT=m
-CONFIG_BT_HCIUART=m
-CONFIG_BT_HCIVHCI=m
-# CONFIG_FW_LOADER is not set
-CONFIG_MTD=y
-CONFIG_MTD_DEBUG=y
-CONFIG_MTD_BLOCK=y
-CONFIG_MTD_CFI=y
-CONFIG_MTD_CFI_ADV_OPTIONS=y
-CONFIG_MTD_CFI_GEOMETRY=y
-# CONFIG_MTD_CFI_I2 is not set
-CONFIG_MTD_CFI_INTELEXT=y
-CONFIG_MTD_RAM=y
-CONFIG_MTD_SA1100=y
-CONFIG_PARPORT=m
-CONFIG_BLK_DEV_LOOP=y
-CONFIG_BLK_DEV_NBD=m
-CONFIG_SCSI=y
-CONFIG_BLK_DEV_SD=y
-CONFIG_CHR_DEV_ST=m
-CONFIG_BLK_DEV_SR=m
-CONFIG_CHR_DEV_SG=y
-CONFIG_NETDEVICES=y
-CONFIG_USB_CATC=m
-CONFIG_USB_KAWETH=m
-CONFIG_USB_PEGASUS=m
-CONFIG_USB_USBNET=m
-CONFIG_USB_ALI_M5632=y
-CONFIG_USB_AN2720=y
-CONFIG_USB_EPSON2888=y
-CONFIG_USB_KC2190=y
-# CONFIG_INPUT is not set
-# CONFIG_SERIO is not set
-# CONFIG_VT is not set
-CONFIG_SERIAL_SA1100=y
-CONFIG_SERIAL_SA1100_CONSOLE=y
-CONFIG_I2C=m
-CONFIG_I2C_CHARDEV=m
-CONFIG_I2C_ELEKTOR=m
-CONFIG_WATCHDOG=y
-CONFIG_SOFT_WATCHDOG=m
-CONFIG_SA1100_WATCHDOG=m
-CONFIG_SOUND=y
-CONFIG_SOUND_PRIME=y
-CONFIG_USB=y
-CONFIG_USB_MON=y
-CONFIG_USB_ACM=m
-CONFIG_USB_PRINTER=m
-CONFIG_USB_STORAGE=y
-CONFIG_USB_STORAGE_DEBUG=y
-CONFIG_USB_MDC800=m
-CONFIG_USB_MICROTEK=m
-CONFIG_USB_USS720=m
-CONFIG_USB_SERIAL=m
-CONFIG_USB_SERIAL_GENERIC=y
-CONFIG_USB_SERIAL_BELKIN=m
-CONFIG_USB_SERIAL_WHITEHEAT=m
-CONFIG_USB_SERIAL_DIGI_ACCELEPORT=m
-CONFIG_USB_SERIAL_EMPEG=m
-CONFIG_USB_SERIAL_FTDI_SIO=m
-CONFIG_USB_SERIAL_VISOR=m
-CONFIG_USB_SERIAL_IR=m
-CONFIG_USB_SERIAL_EDGEPORT=m
-CONFIG_USB_SERIAL_KEYSPAN_PDA=m
-CONFIG_USB_SERIAL_KEYSPAN=m
-CONFIG_USB_SERIAL_MCT_U232=m
-CONFIG_USB_SERIAL_PL2303=m
-CONFIG_USB_SERIAL_CYBERJACK=m
-CONFIG_USB_SERIAL_OMNINET=m
-CONFIG_EXT2_FS=m
-CONFIG_EXT3_FS=m
-CONFIG_MSDOS_FS=y
-CONFIG_VFAT_FS=m
-CONFIG_TMPFS=y
-CONFIG_JFFS2_FS=y
-CONFIG_CRAMFS=m
-CONFIG_MINIX_FS=m
-CONFIG_NFS_FS=m
-CONFIG_NFS_V3=y
-CONFIG_SMB_FS=m
-CONFIG_DEBUG_KERNEL=y
-# CONFIG_DEBUG_BUGVERBOSE is not set
-CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
-CONFIG_MAGIC_SYSRQ=y
-CONFIG_DEBUG_USER=y
-CONFIG_DEBUG_LL=y
diff --git a/arch/arm/configs/cerfcube_defconfig b/arch/arm/configs/cerfcube_defconfig
deleted file mode 100644
index 9ada868e2648..000000000000
--- a/arch/arm/configs/cerfcube_defconfig
+++ /dev/null
@@ -1,73 +0,0 @@
-CONFIG_SYSVIPC=y
-CONFIG_BSD_PROCESS_ACCT=y
-CONFIG_LOG_BUF_SHIFT=14
-CONFIG_ARCH_MULTI_V4=y
-# CONFIG_ARCH_MULTI_V7 is not set
-CONFIG_ARCH_SA1100=y
-CONFIG_SA1100_CERF=y
-CONFIG_SA1100_CERF_FLASH_16MB=y
-CONFIG_UNUSED_BOARD_FILES=y
-CONFIG_CMDLINE="console=ttySA0,38400 root=/dev/mtdblock3 rootfstype=jffs2 rw mem=32M init=/linuxrc"
-CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE=y
-CONFIG_CPU_FREQ_GOV_USERSPACE=m
-CONFIG_FPE_FASTFPE=y
-CONFIG_PM=y
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
-CONFIG_MODULE_FORCE_UNLOAD=y
-CONFIG_PARTITION_ADVANCED=y
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_INET=y
-CONFIG_IP_PNP=y
-CONFIG_IP_PNP_DHCP=y
-CONFIG_IP_PNP_BOOTP=y
-CONFIG_IP_PNP_RARP=y
-# CONFIG_IPV6 is not set
-CONFIG_PCCARD=m
-CONFIG_PCMCIA_SA1100=m
-CONFIG_MTD=y
-CONFIG_MTD_CMDLINE_PARTS=y
-CONFIG_MTD_REDBOOT_PARTS=y
-CONFIG_MTD_BLOCK=y
-CONFIG_MTD_CFI=y
-CONFIG_MTD_CFI_INTELEXT=y
-CONFIG_MTD_SA1100=y
-CONFIG_BLK_DEV_LOOP=m
-CONFIG_BLK_DEV_RAM=m
-CONFIG_NETDEVICES=y
-CONFIG_NET_ETHERNET=y
-CONFIG_NET_PCI=y
-# CONFIG_INPUT_KEYBOARD is not set
-# CONFIG_INPUT_MOUSE is not set
-# CONFIG_SERIO is not set
-CONFIG_SERIAL_SA1100=y
-CONFIG_SERIAL_SA1100_CONSOLE=y
-CONFIG_WATCHDOG=y
-CONFIG_SA1100_WATCHDOG=m
-# CONFIG_VGA_CONSOLE is not set
-CONFIG_NEW_LEDS=y
-CONFIG_LEDS_CLASS=y
-CONFIG_LEDS_TRIGGERS=y
-CONFIG_LEDS_TRIGGER_CPU=y
-CONFIG_EXT2_FS=m
-CONFIG_EXT3_FS=m
-CONFIG_MSDOS_FS=m
-CONFIG_VFAT_FS=m
-CONFIG_TMPFS=y
-CONFIG_JFFS2_FS=y
-CONFIG_ROMFS_FS=y
-CONFIG_NFS_FS=m
-CONFIG_NFS_V3=y
-CONFIG_NFS_V4=y
-CONFIG_NFSD=m
-CONFIG_NFSD_V4=y
-CONFIG_SMB_FS=m
-CONFIG_NLS=y
-CONFIG_NLS_CODEPAGE_437=m
-CONFIG_NLS_ISO8859_1=m
-CONFIG_DEBUG_KERNEL=y
-CONFIG_MAGIC_SYSRQ=y
-CONFIG_DEBUG_USER=y
-CONFIG_DEBUG_LL=y
diff --git a/arch/arm/configs/hackkit_defconfig b/arch/arm/configs/hackkit_defconfig
deleted file mode 100644
index 3c91a851fd08..000000000000
--- a/arch/arm/configs/hackkit_defconfig
+++ /dev/null
@@ -1,48 +0,0 @@
-CONFIG_SYSVIPC=y
-CONFIG_LOG_BUF_SHIFT=14
-CONFIG_BLK_DEV_INITRD=y
-CONFIG_ARCH_MULTI_V4=y
-# CONFIG_ARCH_MULTI_V7 is not set
-CONFIG_ARCH_SA1100=y
-CONFIG_SA1100_HACKKIT=y
-CONFIG_UNUSED_BOARD_FILES=y
-CONFIG_CMDLINE="console=ttySA0,115200 root=/dev/ram0 initrd=0xc0400000,8M init=/rootshell"
-CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
-CONFIG_FPE_NWFPE=y
-CONFIG_MODULES=y
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_INET=y
-CONFIG_SYN_COOKIES=y
-# CONFIG_IPV6 is not set
-CONFIG_MTD=y
-CONFIG_MTD_DEBUG=y
-CONFIG_MTD_DEBUG_VERBOSE=3
-CONFIG_MTD_BLOCK=y
-CONFIG_MTD_CFI=y
-CONFIG_MTD_CFI_INTELEXT=y
-CONFIG_BLK_DEV_RAM=y
-CONFIG_BLK_DEV_RAM_SIZE=8192
-CONFIG_NETDEVICES=y
-CONFIG_DUMMY=y
-# CONFIG_INPUT_KEYBOARD is not set
-# CONFIG_INPUT_MOUSE is not set
-CONFIG_SERIAL_SA1100=y
-CONFIG_SERIAL_SA1100_CONSOLE=y
-# CONFIG_VGA_CONSOLE is not set
-CONFIG_NEW_LEDS=y
-CONFIG_LEDS_CLASS=y
-CONFIG_LEDS_TRIGGERS=y
-CONFIG_LEDS_TRIGGER_CPU=y
-CONFIG_EXT2_FS=y
-CONFIG_MSDOS_FS=y
-CONFIG_VFAT_FS=y
-CONFIG_TMPFS=y
-CONFIG_CRAMFS=y
-CONFIG_DEBUG_KERNEL=y
-CONFIG_MAGIC_SYSRQ=y
-CONFIG_DEBUG_SPINLOCK=y
-CONFIG_DEBUG_USER=y
-CONFIG_DEBUG_LL=y
-# CONFIG_CRC32 is not set
diff --git a/arch/arm/configs/lart_defconfig b/arch/arm/configs/lart_defconfig
deleted file mode 100644
index 916177d07a39..000000000000
--- a/arch/arm/configs/lart_defconfig
+++ /dev/null
@@ -1,64 +0,0 @@
-CONFIG_SYSVIPC=y
-CONFIG_LOG_BUF_SHIFT=14
-CONFIG_BLK_DEV_INITRD=y
-CONFIG_ARCH_MULTI_V4=y
-# CONFIG_ARCH_MULTI_V7 is not set
-CONFIG_ARCH_SA1100=y
-CONFIG_SA1100_LART=y
-CONFIG_UNUSED_BOARD_FILES=y
-CONFIG_CMDLINE="console=ttySA0,9600 root=/dev/ram"
-CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE=y
-CONFIG_CPU_FREQ_GOV_USERSPACE=y
-CONFIG_FPE_NWFPE=y
-CONFIG_PM=y
-CONFIG_MODULES=y
-CONFIG_NET=y
-CONFIG_PACKET=m
-CONFIG_UNIX=y
-CONFIG_INET=y
-CONFIG_SYN_COOKIES=y
-# CONFIG_IPV6 is not set
-CONFIG_MTD=y
-CONFIG_MTD_DEBUG=y
-CONFIG_MTD_DEBUG_VERBOSE=1
-CONFIG_MTD_BLOCK=y
-CONFIG_MTD_LART=y
-CONFIG_BLK_DEV_RAM=y
-CONFIG_NETDEVICES=y
-CONFIG_DUMMY=m
-CONFIG_NET_ETHERNET=y
-CONFIG_PPP=m
-CONFIG_PPP_BSDCOMP=m
-CONFIG_PPP_DEFLATE=m
-CONFIG_PPP_ASYNC=m
-CONFIG_SLIP=m
-CONFIG_SLIP_COMPRESSED=y
-CONFIG_SERIAL_SA1100=y
-CONFIG_SERIAL_SA1100_CONSOLE=y
-# CONFIG_VGA_CONSOLE is not set
-CONFIG_SOUND=m
-CONFIG_NEW_LEDS=y
-CONFIG_LEDS_CLASS=y
-CONFIG_LEDS_TRIGGERS=y
-CONFIG_LEDS_TRIGGER_CPU=y
-CONFIG_EXT2_FS=y
-CONFIG_EXT3_FS=m
-CONFIG_REISERFS_FS=m
-CONFIG_ISO9660_FS=m
-CONFIG_JOLIET=y
-CONFIG_UDF_FS=m
-CONFIG_TMPFS=y
-CONFIG_JFFS2_FS=m
-CONFIG_JFFS2_FS_DEBUG=1
-CONFIG_CRAMFS=m
-CONFIG_NFS_FS=m
-CONFIG_NFS_V3=y
-CONFIG_NFSD=m
-CONFIG_NLS=y
-CONFIG_NLS_CODEPAGE_437=m
-CONFIG_NLS_CODEPAGE_850=m
-CONFIG_NLS_ISO8859_1=m
-CONFIG_NLS_ISO8859_15=m
-CONFIG_NLS_UTF8=m
-CONFIG_DEBUG_USER=y
-CONFIG_CRC32=m
diff --git a/arch/arm/configs/pleb_defconfig b/arch/arm/configs/pleb_defconfig
deleted file mode 100644
index fd2667873273..000000000000
--- a/arch/arm/configs/pleb_defconfig
+++ /dev/null
@@ -1,53 +0,0 @@
-CONFIG_SYSVIPC=y
-CONFIG_LOG_BUF_SHIFT=14
-CONFIG_BLK_DEV_INITRD=y
-CONFIG_EXPERT=y
-# CONFIG_HOTPLUG is not set
-# CONFIG_SHMEM is not set
-CONFIG_ARCH_MULTI_V4=y
-# CONFIG_ARCH_MULTI_V7 is not set
-CONFIG_ARCH_SA1100=y
-CONFIG_SA1100_PLEB=y
-CONFIG_UNUSED_BOARD_FILES=y
-CONFIG_CMDLINE="console=ttySA0,9600 mem=16M@0xc0000000 mem=16M@0xc8000000 root=/dev/ram initrd=0xc0400000,4M"
-CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE=y
-CONFIG_CPU_FREQ_GOV_ONDEMAND=y
-CONFIG_FPE_NWFPE=y
-CONFIG_MODULES=y
-# CONFIG_SWAP is not set
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_INET=y
-CONFIG_SYN_COOKIES=y
-# CONFIG_IPV6 is not set
-CONFIG_MTD=y
-CONFIG_MTD_CMDLINE_PARTS=y
-CONFIG_MTD_REDBOOT_PARTS=y
-CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED=y
-CONFIG_MTD_BLOCK=y
-CONFIG_MTD_CFI=y
-CONFIG_MTD_CFI_INTELEXT=y
-CONFIG_MTD_SA1100=y
-CONFIG_BLK_DEV_LOOP=y
-CONFIG_BLK_DEV_RAM=y
-CONFIG_BLK_DEV_RAM_SIZE=8192
-CONFIG_NETDEVICES=y
-CONFIG_NET_ETHERNET=y
-CONFIG_SMC91X=y
-# CONFIG_INPUT is not set
-# CONFIG_SERIO is not set
-# CONFIG_VT is not set
-CONFIG_SERIAL_SA1100=y
-CONFIG_SERIAL_SA1100_CONSOLE=y
-CONFIG_EXT2_FS=y
-CONFIG_EXT3_FS=y
-# CONFIG_EXT3_FS_XATTR is not set
-# CONFIG_DNOTIFY is not set
-CONFIG_MSDOS_FS=m
-CONFIG_VFAT_FS=m
-CONFIG_NFS_FS=m
-CONFIG_NFS_V3=y
-CONFIG_NLS=y
-CONFIG_MAGIC_SYSRQ=y
-CONFIG_DEBUG_KERNEL=y
diff --git a/arch/arm/configs/shannon_defconfig b/arch/arm/configs/shannon_defconfig
deleted file mode 100644
index dfcea70b8034..000000000000
--- a/arch/arm/configs/shannon_defconfig
+++ /dev/null
@@ -1,45 +0,0 @@
-CONFIG_SYSVIPC=y
-CONFIG_LOG_BUF_SHIFT=14
-CONFIG_BLK_DEV_INITRD=y
-CONFIG_ARCH_MULTI_V4=y
-# CONFIG_ARCH_MULTI_V7 is not set
-CONFIG_ARCH_SA1100=y
-CONFIG_SA1100_SHANNON=y
-CONFIG_UNUSED_BOARD_FILES=y
-CONFIG_CMDLINE="console=ttySA0,9600 console=tty1 root=/dev/mtdblock2 init=/linuxrc"
-CONFIG_FPE_NWFPE=y
-CONFIG_MODULES=y
-CONFIG_PARTITION_ADVANCED=y
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_INET=y
-# CONFIG_IPV6 is not set
-CONFIG_PCCARD=y
-CONFIG_PCMCIA_SA1100=y
-CONFIG_MTD=y
-CONFIG_MTD_BLOCK=y
-CONFIG_MTD_CFI=y
-CONFIG_MTD_CFI_AMDSTD=y
-CONFIG_MTD_SA1100=y
-CONFIG_BLK_DEV_RAM=y
-CONFIG_BLK_DEV_RAM_SIZE=8192
-CONFIG_NETDEVICES=y
-CONFIG_NET_ETHERNET=y
-CONFIG_NET_PCMCIA=y
-CONFIG_PCMCIA_PCNET=y
-CONFIG_PCMCIA_SMC91C92=y
-CONFIG_SERIAL_SA1100=y
-CONFIG_SERIAL_SA1100_CONSOLE=y
-CONFIG_WATCHDOG=y
-CONFIG_SA1100_WATCHDOG=y
-CONFIG_FB=y
-CONFIG_FB_SA1100=y
-# CONFIG_VGA_CONSOLE is not set
-CONFIG_SOUND=y
-CONFIG_MSDOS_FS=y
-CONFIG_VFAT_FS=y
-CONFIG_JFFS2_FS=y
-CONFIG_MINIX_FS=y
-CONFIG_NFS_FS=y
-CONFIG_DEBUG_USER=y
diff --git a/arch/arm/configs/simpad_defconfig b/arch/arm/configs/simpad_defconfig
deleted file mode 100644
index 4e00a4c2c287..000000000000
--- a/arch/arm/configs/simpad_defconfig
+++ /dev/null
@@ -1,100 +0,0 @@
-CONFIG_LOCALVERSION="oe1"
-CONFIG_SYSVIPC=y
-CONFIG_PREEMPT=y
-CONFIG_LOG_BUF_SHIFT=14
-CONFIG_EXPERT=y
-CONFIG_KALLSYMS_ALL=y
-CONFIG_KALLSYMS_EXTRA_PASS=y
-CONFIG_ARCH_MULTI_V4=y
-# CONFIG_ARCH_MULTI_V7 is not set
-CONFIG_ARCH_SA1100=y
-CONFIG_SA1100_SIMPAD=y
-CONFIG_UNUSED_BOARD_FILES=y
-CONFIG_CMDLINE="mtdparts=sa1100:512k(boot),1m(kernel),-(root) console=ttySA0 root=1f02 noinitrd mem=64M jffs2_orphaned_inodes=delete rootfstype=jffs2"
-CONFIG_FPE_NWFPE=y
-CONFIG_MODULES=y
-CONFIG_BINFMT_MISC=m
-CONFIG_PM=y
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_INET=y
-CONFIG_IP_PNP=y
-CONFIG_IP_PNP_DHCP=y
-CONFIG_IP_PNP_BOOTP=y
-# CONFIG_IPV6 is not set
-CONFIG_BT=m
-CONFIG_BT_RFCOMM=m
-CONFIG_BT_RFCOMM_TTY=y
-CONFIG_BT_BNEP=m
-CONFIG_BT_BNEP_MC_FILTER=y
-CONFIG_BT_BNEP_PROTO_FILTER=y
-CONFIG_PCCARD=y
-CONFIG_PCMCIA_SA1100=y
-CONFIG_MTD=y
-CONFIG_MTD_CMDLINE_PARTS=y
-CONFIG_MTD_BLOCK=y
-CONFIG_MTD_CFI=y
-CONFIG_MTD_JEDECPROBE=y
-CONFIG_MTD_CFI_ADV_OPTIONS=y
-CONFIG_MTD_CFI_GEOMETRY=y
-# CONFIG_MTD_CFI_I2 is not set
-CONFIG_MTD_CFI_INTELEXT=y
-CONFIG_MTD_RAM=y
-CONFIG_MTD_SA1100=y
-CONFIG_BLK_DEV_LOOP=m
-CONFIG_BLK_DEV_RAM=m
-CONFIG_BLK_DEV_RAM_SIZE=8192
-CONFIG_NETDEVICES=y
-CONFIG_DUMMY=y
-CONFIG_NET_ETHERNET=y
-CONFIG_NET_PCI=y
-CONFIG_NET_PCMCIA=y
-CONFIG_PCMCIA_3C574=m
-CONFIG_PCMCIA_3C589=m
-CONFIG_PCMCIA_PCNET=m
-CONFIG_PCMCIA_SMC91C92=m
-CONFIG_PCMCIA_XIRC2PS=m
-CONFIG_PPP=m
-CONFIG_PPP_BSDCOMP=m
-CONFIG_PPP_DEFLATE=m
-CONFIG_PPP_FILTER=y
-CONFIG_PPP_MULTILINK=y
-CONFIG_PPPOE=m
-CONFIG_PPP_ASYNC=m
-CONFIG_PPP_SYNC_TTY=m
-CONFIG_INPUT_MOUSEDEV_SCREEN_X=800
-CONFIG_INPUT_MOUSEDEV_SCREEN_Y=600
-CONFIG_INPUT_EVDEV=m
-CONFIG_INPUT_EVBUG=y
-# CONFIG_INPUT_KEYBOARD is not set
-# CONFIG_INPUT_MOUSE is not set
-CONFIG_SERIO=m
-CONFIG_SERIAL_SA1100=y
-CONFIG_SERIAL_SA1100_CONSOLE=y
-CONFIG_FB=y
-# CONFIG_VGA_CONSOLE is not set
-CONFIG_FRAMEBUFFER_CONSOLE=y
-CONFIG_LOGO=y
-CONFIG_SOUND=y
-CONFIG_NEW_LEDS=y
-CONFIG_LEDS_CLASS=y
-CONFIG_EXT2_FS=m
-CONFIG_EXT3_FS=m
-CONFIG_REISERFS_FS=m
-CONFIG_REISERFS_PROC_INFO=y
-CONFIG_MSDOS_FS=m
-CONFIG_VFAT_FS=m
-CONFIG_JFFS2_FS=y
-CONFIG_CRAMFS=m
-CONFIG_NFS_FS=y
-CONFIG_NFS_V3=y
-CONFIG_SMB_FS=m
-CONFIG_NLS=y
-CONFIG_NLS_CODEPAGE_437=y
-CONFIG_NLS_CODEPAGE_850=y
-CONFIG_NLS_ISO8859_1=y
-CONFIG_NLS_ISO8859_15=y
-CONFIG_DEBUG_KERNEL=y
-CONFIG_DEBUG_USER=y
-CONFIG_DEBUG_LL=y
diff --git a/arch/arm/mach-sa1100/Kconfig b/arch/arm/mach-sa1100/Kconfig
index 8b6360e363d1..0fb4c24cfad5 100644
--- a/arch/arm/mach-sa1100/Kconfig
+++ b/arch/arm/mach-sa1100/Kconfig
@@ -41,35 +41,6 @@ config ASSABET_NEPONSET
 	  Microprocessor Development Board (Assabet)  with the SA-1111
 	  Development Board (Nepon).
 
-config SA1100_CERF
-	bool "CerfBoard"
-	depends on UNUSED_BOARD_FILES
-	select ARM_SA1110_CPUFREQ
-	select LEDS_GPIO_REGISTER
-	help
-	  The Intrinsyc CerfBoard is based on the StrongARM 1110 (Discontinued).
-	  More information is available at:
-	  <http://www.intrinsyc.com/products/cerfboard/>.
-
-	  Say Y if configuring for an Intrinsyc CerfBoard.
-	  Say N otherwise.
-
-choice
-	prompt "Cerf Flash available"
-	depends on SA1100_CERF
-	default SA1100_CERF_FLASH_8MB
-
-config SA1100_CERF_FLASH_8MB
-	bool "8MB"
-
-config SA1100_CERF_FLASH_16MB
-	bool "16MB"
-
-config SA1100_CERF_FLASH_32MB
-	bool "32MB"
-
-endchoice
-
 config SA1100_COLLIE
 	bool "Sharp Zaurus SL5500"
 	# FIXME: select ARM_SA11x0_CPUFREQ
@@ -79,16 +50,6 @@ config SA1100_COLLIE
 	help
 	  Say Y here to support the Sharp Zaurus SL5500 PDAs.
 
-config SA1100_H3100
-	bool "Compaq iPAQ H3100"
-	depends on UNUSED_BOARD_FILES
-	select ARM_SA1110_CPUFREQ
-	select HTC_EGPIO
-	select MFD_IPAQ_MICRO
-	help
-	  Say Y here if you intend to run this kernel on the Compaq iPAQ
-	  H3100 handheld computer.
-
 config SA1100_H3600
 	bool "Compaq iPAQ H3600/H3700"
 	select ARM_SA1110_CPUFREQ
@@ -98,15 +59,6 @@ config SA1100_H3600
 	  Say Y here if you intend to run this kernel on the Compaq iPAQ
 	  H3600 and H3700 handheld computers.
 
-config SA1100_BADGE4
-	bool "HP Labs BadgePAD 4"
-	depends on UNUSED_BOARD_FILES
-	select ARM_SA1100_CPUFREQ
-	select SA1111
-	help
-	  Say Y here if you want to build a kernel for the HP Laboratories
-	  BadgePAD 4.
-
 config SA1100_JORNADA720
 	bool "HP Jornada 720"
 	# FIXME: select ARM_SA11x0_CPUFREQ
@@ -126,71 +78,8 @@ config SA1100_JORNADA720_SSP
 	  keyboard, touchscreen, backlight and battery. This driver also activates
 	  the generic SSP which it extends.
 
-config SA1100_HACKKIT
-	bool "HackKit Core CPU Board"
-	depends on UNUSED_BOARD_FILES
-	select ARM_SA1100_CPUFREQ
-	help
-	  Say Y here to support the HackKit Core CPU Board
-	  <http://hackkit.eletztrick.de>;
-
-config SA1100_LART
-	bool "LART"
-	depends on UNUSED_BOARD_FILES
-	select ARM_SA1100_CPUFREQ
-	help
-	  Say Y here if you are using the Linux Advanced Radio Terminal
-	  (also known as the LART).  See <http://www.lartmaker.nl/> for
-	  information on the LART.
-
-config SA1100_NANOENGINE
-	bool "nanoEngine"
-	depends on UNUSED_BOARD_FILES
-	select ARM_SA1110_CPUFREQ
-	select FORCE_PCI
-	select PCI_NANOENGINE
-	help
-	  Say Y here if you are using the Bright Star Engineering nanoEngine.
-	  See <http://www.brightstareng.com/arm/nanoeng.htm> for information
-	  on the BSE nanoEngine.
-
-config SA1100_PLEB
-	bool "PLEB"
-	depends on UNUSED_BOARD_FILES
-	select ARM_SA1100_CPUFREQ
-	help
-	  Say Y here if you are using version 1 of the Portable Linux
-	  Embedded Board (also known as PLEB).
-	  See <http://www.disy.cse.unsw.edu.au/Hardware/PLEB/>
-	  for more information.
-
-config SA1100_SHANNON
-	bool "Shannon"
-	depends on UNUSED_BOARD_FILES
-	select ARM_SA1100_CPUFREQ
-	select REGULATOR
-	select REGULATOR_FIXED_VOLTAGE
-	help
-	  The Shannon (also known as a Tuxscreen, and also as a IS2630) was a
-	  limited edition webphone produced by Philips. The Shannon is a SA1100
-	  platform with a 640x480 LCD, touchscreen, CIR keyboard, PCMCIA slots,
-	  and a telco interface.
-
-config SA1100_SIMPAD
-	bool "Simpad"
-	depends on UNUSED_BOARD_FILES
-	select ARM_SA1110_CPUFREQ
-	help
-	  The SIEMENS webpad SIMpad is based on the StrongARM 1110. There
-	  are two different versions CL4 and SL4. CL4 has 32MB RAM and 16MB
-	  FLASH. The SL4 version got 64 MB RAM and 32 MB FLASH and a
-	  PCMCIA-Slot. The version for the Germany Telecom (DTAG) is the same
-	  like CL4 in additional it has a PCMCIA-Slot. For more information
-	  visit <http://www.usa.siemens.com/> or <http://www.siemens.ch/>.
-
 config SA1100_SSP
 	tristate "Generic PIO SSP"
-	depends on UNUSED_BOARD_FILES
 	help
 	  Say Y here to enable support for the generic PIO SSP driver.
 	  This isn't for audio support, but for attached sensors and
diff --git a/arch/arm/mach-sa1100/Makefile b/arch/arm/mach-sa1100/Makefile
index 28c1cae0053f..b5816d675152 100644
--- a/arch/arm/mach-sa1100/Makefile
+++ b/arch/arm/mach-sa1100/Makefile
@@ -9,32 +9,11 @@ obj-y := clock.o generic.o #nmi-oopser.o
 # Specific board support
 obj-$(CONFIG_SA1100_ASSABET)		+= assabet.o
 obj-$(CONFIG_ASSABET_NEPONSET)		+= neponset.o
-
-obj-$(CONFIG_SA1100_BADGE4)		+= badge4.o
-
-obj-$(CONFIG_SA1100_CERF)		+= cerf.o
-
 obj-$(CONFIG_SA1100_COLLIE)		+= collie.o
-
-obj-$(CONFIG_SA1100_H3100)		+= h3100.o h3xxx.o
 obj-$(CONFIG_SA1100_H3600)		+= h3600.o h3xxx.o
-
-obj-$(CONFIG_SA1100_HACKKIT)		+= hackkit.o
-
 obj-$(CONFIG_SA1100_JORNADA720)		+= jornada720.o
 obj-$(CONFIG_SA1100_JORNADA720_SSP)	+= jornada720_ssp.o
 
-obj-$(CONFIG_SA1100_LART)		+= lart.o
-
-obj-$(CONFIG_SA1100_NANOENGINE)		+= nanoengine.o
-obj-$(CONFIG_PCI_NANOENGINE)		+= pci-nanoengine.o
-
-obj-$(CONFIG_SA1100_PLEB)		+= pleb.o
-
-obj-$(CONFIG_SA1100_SHANNON)		+= shannon.o
-
-obj-$(CONFIG_SA1100_SIMPAD)		+= simpad.o
-
 # Miscellaneous functions
 obj-$(CONFIG_PM)			+= pm.o sleep.o
 obj-$(CONFIG_SA1100_SSP)		+= ssp.o
diff --git a/arch/arm/mach-sa1100/badge4.c b/arch/arm/mach-sa1100/badge4.c
deleted file mode 100644
index de79f3502045..000000000000
--- a/arch/arm/mach-sa1100/badge4.c
+++ /dev/null
@@ -1,338 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * linux/arch/arm/mach-sa1100/badge4.c
- *
- * BadgePAD 4 specific initialization
- *
- *   Tim Connors <connors@hpl.hp.com>
- *   Christopher Hoover <ch@hpl.hp.com>
- *
- * Copyright (C) 2002 Hewlett-Packard Company
- */
-#include <linux/module.h>
-#include <linux/init.h>
-#include <linux/kernel.h>
-#include <linux/platform_data/sa11x0-serial.h>
-#include <linux/platform_device.h>
-#include <linux/delay.h>
-#include <linux/tty.h>
-#include <linux/mtd/mtd.h>
-#include <linux/mtd/partitions.h>
-#include <linux/errno.h>
-#include <linux/gpio.h>
-#include <linux/leds.h>
-
-#include <mach/hardware.h>
-#include <asm/mach-types.h>
-#include <asm/setup.h>
-#include <mach/irqs.h>
-
-#include <asm/mach/arch.h>
-#include <asm/mach/flash.h>
-#include <asm/mach/map.h>
-#include <asm/hardware/sa1111.h>
-
-#include <mach/badge4.h>
-
-#include "generic.h"
-
-static struct resource sa1111_resources[] = {
-	[0] = DEFINE_RES_MEM(BADGE4_SA1111_BASE, 0x2000),
-	[1] = DEFINE_RES_IRQ(BADGE4_IRQ_GPIO_SA1111),
-};
-
-static int badge4_sa1111_enable(void *data, unsigned devid)
-{
-	if (devid == SA1111_DEVID_USB)
-		badge4_set_5V(BADGE4_5V_USB, 1);
-	return 0;
-}
-
-static void badge4_sa1111_disable(void *data, unsigned devid)
-{
-	if (devid == SA1111_DEVID_USB)
-		badge4_set_5V(BADGE4_5V_USB, 0);
-}
-
-static struct sa1111_platform_data sa1111_info = {
-	.disable_devs	= SA1111_DEVID_PS2_MSE,
-	.enable		= badge4_sa1111_enable,
-	.disable	= badge4_sa1111_disable,
-};
-
-static u64 sa1111_dmamask = 0xffffffffUL;
-
-static struct platform_device sa1111_device = {
-	.name		= "sa1111",
-	.id		= 0,
-	.dev		= {
-		.dma_mask = &sa1111_dmamask,
-		.coherent_dma_mask = 0xffffffff,
-		.platform_data = &sa1111_info,
-	},
-	.num_resources	= ARRAY_SIZE(sa1111_resources),
-	.resource	= sa1111_resources,
-};
-
-/* LEDs */
-struct gpio_led badge4_gpio_leds[] = {
-	{
-		.name			= "badge4:red",
-		.default_trigger	= "heartbeat",
-		.gpio			= 7,
-	},
-	{
-		.name			= "badge4:green",
-		.default_trigger	= "cpu0",
-		.gpio			= 9,
-	},
-};
-
-static struct gpio_led_platform_data badge4_gpio_led_info = {
-	.leds		= badge4_gpio_leds,
-	.num_leds	= ARRAY_SIZE(badge4_gpio_leds),
-};
-
-static struct platform_device badge4_leds = {
-	.name	= "leds-gpio",
-	.id	= -1,
-	.dev	= {
-		.platform_data	= &badge4_gpio_led_info,
-	}
-};
-
-static struct platform_device *devices[] __initdata = {
-	&sa1111_device,
-	&badge4_leds,
-};
-
-static int __init badge4_sa1111_init(void)
-{
-	/*
-	 * Ensure that the memory bus request/grant signals are setup,
-	 * and the grant is held in its inactive state
-	 */
-	sa1110_mb_disable();
-
-	/*
-	 * Probe for SA1111.
-	 */
-	return platform_add_devices(devices, ARRAY_SIZE(devices));
-}
-
-
-/*
- * 1 x Intel 28F320C3 Advanced+ Boot Block Flash (32 Mi bit)
- *   Eight 4 KiW Parameter Bottom Blocks (64 KiB)
- *   Sixty-three 32 KiW Main Blocks (4032 Ki b)
- *
- * <or>
- *
- * 1 x Intel 28F640C3 Advanced+ Boot Block Flash (64 Mi bit)
- *   Eight 4 KiW Parameter Bottom Blocks (64 KiB)
- *   One-hundred-twenty-seven 32 KiW Main Blocks (8128 Ki b)
- */
-static struct mtd_partition badge4_partitions[] = {
-	{
-		.name	= "BLOB boot loader",
-		.offset	= 0,
-		.size	= 0x0000A000
-	}, {
-		.name	= "params",
-		.offset	= MTDPART_OFS_APPEND,
-		.size	= 0x00006000
-	}, {
-		.name	= "root",
-		.offset	= MTDPART_OFS_APPEND,
-		.size	= MTDPART_SIZ_FULL
-	}
-};
-
-static struct flash_platform_data badge4_flash_data = {
-	.map_name	= "cfi_probe",
-	.parts		= badge4_partitions,
-	.nr_parts	= ARRAY_SIZE(badge4_partitions),
-};
-
-static struct resource badge4_flash_resource =
-	DEFINE_RES_MEM(SA1100_CS0_PHYS, SZ_64M);
-
-static int five_v_on __initdata = 0;
-
-static int __init five_v_on_setup(char *ignore)
-{
-	five_v_on = 1;
-	return 1;
-}
-__setup("five_v_on", five_v_on_setup);
-
-
-static int __init badge4_init(void)
-{
-	int ret;
-
-	if (!machine_is_badge4())
-		return -ENODEV;
-
-	/* LCD */
-	GPCR  = (BADGE4_GPIO_LGP2 | BADGE4_GPIO_LGP3 |
-		 BADGE4_GPIO_LGP4 | BADGE4_GPIO_LGP5 |
-		 BADGE4_GPIO_LGP6 | BADGE4_GPIO_LGP7 |
-		 BADGE4_GPIO_LGP8 | BADGE4_GPIO_LGP9 |
-		 BADGE4_GPIO_GPA_VID | BADGE4_GPIO_GPB_VID |
-		 BADGE4_GPIO_GPC_VID);
-	GPDR &= ~BADGE4_GPIO_INT_VID;
-	GPDR |= (BADGE4_GPIO_LGP2 | BADGE4_GPIO_LGP3 |
-		 BADGE4_GPIO_LGP4 | BADGE4_GPIO_LGP5 |
-		 BADGE4_GPIO_LGP6 | BADGE4_GPIO_LGP7 |
-		 BADGE4_GPIO_LGP8 | BADGE4_GPIO_LGP9 |
-		 BADGE4_GPIO_GPA_VID | BADGE4_GPIO_GPB_VID |
-		 BADGE4_GPIO_GPC_VID);
-
-	/* SDRAM SPD i2c */
-	GPCR  = (BADGE4_GPIO_SDSDA | BADGE4_GPIO_SDSCL);
-	GPDR |= (BADGE4_GPIO_SDSDA | BADGE4_GPIO_SDSCL);
-
-	/* uart */
-	GPCR  = (BADGE4_GPIO_UART_HS1 | BADGE4_GPIO_UART_HS2);
-	GPDR |= (BADGE4_GPIO_UART_HS1 | BADGE4_GPIO_UART_HS2);
-
-	/* CPLD muxsel0 input for mux/adc chip select */
-	GPCR  = BADGE4_GPIO_MUXSEL0;
-	GPDR |= BADGE4_GPIO_MUXSEL0;
-
-	/* test points: J5, J6 as inputs, J7 outputs */
-	GPDR &= ~(BADGE4_GPIO_TESTPT_J5 | BADGE4_GPIO_TESTPT_J6);
-	GPCR  = BADGE4_GPIO_TESTPT_J7;
-	GPDR |= BADGE4_GPIO_TESTPT_J7;
-
-	/* 5V supply rail. */
-	GPCR  = BADGE4_GPIO_PCMEN5V;		/* initially off */
-	GPDR |= BADGE4_GPIO_PCMEN5V;
-
-	/* CPLD sdram type inputs; set up by blob */
-	//GPDR |= (BADGE4_GPIO_SDTYP1 | BADGE4_GPIO_SDTYP0);
-	printk(KERN_DEBUG __FILE__ ": SDRAM CPLD typ1=%d typ0=%d\n",
-		!!(GPLR & BADGE4_GPIO_SDTYP1),
-		!!(GPLR & BADGE4_GPIO_SDTYP0));
-
-	/* SA1111 reset pin; set up by blob */
-	//GPSR  = BADGE4_GPIO_SA1111_NRST;
-	//GPDR |= BADGE4_GPIO_SA1111_NRST;
-
-
-	/* power management cruft */
-	PGSR = 0;
-	PWER = 0;
-	PCFR = 0;
-	PSDR = 0;
-
-	PWER |= PWER_GPIO26;	/* wake up on an edge from TESTPT_J5 */
-	PWER |= PWER_RTC;	/* wake up if rtc fires */
-
-	/* drive sa1111_nrst during sleep */
-	PGSR |= BADGE4_GPIO_SA1111_NRST;
-	/* drive CPLD as is during sleep */
-	PGSR |= (GPLR & (BADGE4_GPIO_SDTYP0|BADGE4_GPIO_SDTYP1));
-
-
-	/* Now bring up the SA-1111. */
-	ret = badge4_sa1111_init();
-	if (ret < 0)
-		printk(KERN_ERR
-			"%s: SA-1111 initialization failed (%d)\n",
-			__func__, ret);
-
-
-	/* maybe turn on 5v0 from the start */
-	badge4_set_5V(BADGE4_5V_INITIALLY, five_v_on);
-
-	sa11x0_register_mtd(&badge4_flash_data, &badge4_flash_resource, 1);
-
-	return 0;
-}
-
-arch_initcall(badge4_init);
-
-
-static unsigned badge4_5V_bitmap = 0;
-
-void badge4_set_5V(unsigned subsystem, int on)
-{
-	unsigned long flags;
-	unsigned old_5V_bitmap;
-
-	local_irq_save(flags);
-
-	old_5V_bitmap = badge4_5V_bitmap;
-
-	if (on) {
-		badge4_5V_bitmap |= subsystem;
-	} else {
-		badge4_5V_bitmap &= ~subsystem;
-	}
-
-	/* detect on->off and off->on transitions */
-	if ((!old_5V_bitmap) && (badge4_5V_bitmap)) {
-		/* was off, now on */
-		printk(KERN_INFO "%s: enabling 5V supply rail\n", __func__);
-		GPSR = BADGE4_GPIO_PCMEN5V;
-	} else if ((old_5V_bitmap) && (!badge4_5V_bitmap)) {
-		/* was on, now off */
-		printk(KERN_INFO "%s: disabling 5V supply rail\n", __func__);
-		GPCR = BADGE4_GPIO_PCMEN5V;
-	}
-
-	local_irq_restore(flags);
-}
-EXPORT_SYMBOL(badge4_set_5V);
-
-
-static struct map_desc badge4_io_desc[] __initdata = {
-	{	/* SRAM  bank 1 */
-		.virtual	= 0xf1000000,
-		.pfn		= __phys_to_pfn(0x08000000),
-		.length		= 0x00100000,
-		.type		= MT_DEVICE
-	}, {	/* SRAM  bank 2 */
-		.virtual	= 0xf2000000,
-		.pfn		= __phys_to_pfn(0x10000000),
-		.length		= 0x00100000,
-		.type		= MT_DEVICE
-	}
-};
-
-static void
-badge4_uart_pm(struct uart_port *port, u_int state, u_int oldstate)
-{
-	if (!state) {
-		Ser1SDCR0 |= SDCR0_UART;
-	}
-}
-
-static struct sa1100_port_fns badge4_port_fns __initdata = {
-	.pm		= badge4_uart_pm,
-};
-
-static void __init badge4_map_io(void)
-{
-	sa1100_map_io();
-	iotable_init(badge4_io_desc, ARRAY_SIZE(badge4_io_desc));
-
-	sa1100_register_uart_fns(&badge4_port_fns);
-	sa1100_register_uart(0, 3);
-	sa1100_register_uart(1, 1);
-}
-
-MACHINE_START(BADGE4, "Hewlett-Packard Laboratories BadgePAD 4")
-	.atag_offset	= 0x100,
-	.map_io		= badge4_map_io,
-	.nr_irqs	= SA1100_NR_IRQS,
-	.init_irq	= sa1100_init_irq,
-	.init_late	= sa11x0_init_late,
-	.init_time	= sa1100_timer_init,
-#ifdef CONFIG_SA1111
-	.dma_zone_size	= SZ_1M,
-#endif
-	.restart	= sa11x0_restart,
-MACHINE_END
diff --git a/arch/arm/mach-sa1100/cerf.c b/arch/arm/mach-sa1100/cerf.c
deleted file mode 100644
index f9243a3fd69c..000000000000
--- a/arch/arm/mach-sa1100/cerf.c
+++ /dev/null
@@ -1,181 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * linux/arch/arm/mach-sa1100/cerf.c
- *
- * Apr-2003 : Removed some old PDA crud [FB]
- * Oct-2003 : Added uart2 resource [FB]
- * Jan-2004 : Removed io map for flash [FB]
- */
-
-#include <linux/init.h>
-#include <linux/gpio/machine.h>
-#include <linux/kernel.h>
-#include <linux/tty.h>
-#include <linux/platform_data/sa11x0-serial.h>
-#include <linux/platform_device.h>
-#include <linux/irq.h>
-#include <linux/mtd/mtd.h>
-#include <linux/mtd/partitions.h>
-#include <linux/gpio.h>
-#include <linux/leds.h>
-
-#include <mach/hardware.h>
-#include <asm/setup.h>
-
-#include <asm/mach-types.h>
-#include <asm/mach/arch.h>
-#include <asm/mach/flash.h>
-#include <asm/mach/map.h>
-
-#include <mach/cerf.h>
-#include <linux/platform_data/mfd-mcp-sa11x0.h>
-#include <mach/irqs.h>
-#include "generic.h"
-
-static struct resource cerfuart2_resources[] = {
-	[0] = DEFINE_RES_MEM(0x80030000, SZ_64K),
-};
-
-static struct platform_device cerfuart2_device = {
-	.name		= "sa11x0-uart",
-	.id		= 2,
-	.num_resources	= ARRAY_SIZE(cerfuart2_resources),
-	.resource	= cerfuart2_resources,
-};
-
-/* Compact Flash */
-static struct gpiod_lookup_table cerf_cf_gpio_table = {
-	.dev_id = "sa11x0-pcmcia.1",
-	.table = {
-		GPIO_LOOKUP("gpio", 19, "bvd2", GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP("gpio", 20, "bvd1", GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP("gpio", 21, "reset", GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP("gpio", 22, "ready", GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP("gpio", 23, "detect", GPIO_ACTIVE_LOW),
-		{ },
-	},
-};
-
-/* LEDs */
-struct gpio_led cerf_gpio_leds[] = {
-	{
-		.name			= "cerf:d0",
-		.default_trigger	= "heartbeat",
-		.gpio			= 0,
-	},
-	{
-		.name			= "cerf:d1",
-		.default_trigger	= "cpu0",
-		.gpio			= 1,
-	},
-	{
-		.name			= "cerf:d2",
-		.default_trigger	= "default-on",
-		.gpio			= 2,
-	},
-	{
-		.name			= "cerf:d3",
-		.default_trigger	= "default-on",
-		.gpio			= 3,
-	},
-
-};
-
-static struct gpio_led_platform_data cerf_gpio_led_info = {
-	.leds		= cerf_gpio_leds,
-	.num_leds	= ARRAY_SIZE(cerf_gpio_leds),
-};
-
-static struct platform_device *cerf_devices[] __initdata = {
-	&cerfuart2_device,
-};
-
-#ifdef CONFIG_SA1100_CERF_FLASH_32MB
-#  define CERF_FLASH_SIZE	0x02000000
-#elif defined CONFIG_SA1100_CERF_FLASH_16MB
-#  define CERF_FLASH_SIZE	0x01000000
-#elif defined CONFIG_SA1100_CERF_FLASH_8MB
-#  define CERF_FLASH_SIZE	0x00800000
-#else
-#  error "Undefined flash size for CERF"
-#endif
-
-static struct mtd_partition cerf_partitions[] = {
-	{
-		.name		= "Bootloader",
-		.size		= 0x00020000,
-		.offset		= 0x00000000,
-	}, {
-		.name		= "Params",
-		.size		= 0x00040000,
-		.offset		= 0x00020000,
-	}, {
-		.name		= "Kernel",
-		.size		= 0x00100000,
-		.offset		= 0x00060000,
-	}, {
-		.name		= "Filesystem",
-		.size		= CERF_FLASH_SIZE-0x00160000,
-		.offset		= 0x00160000,
-	}
-};
-
-static struct flash_platform_data cerf_flash_data = {
-	.map_name	= "cfi_probe",
-	.parts		= cerf_partitions,
-	.nr_parts	= ARRAY_SIZE(cerf_partitions),
-};
-
-static struct resource cerf_flash_resource =
-	DEFINE_RES_MEM(SA1100_CS0_PHYS, SZ_32M);
-
-static void __init cerf_init_irq(void)
-{
-	sa1100_init_irq();
-	irq_set_irq_type(CERF_ETH_IRQ, IRQ_TYPE_EDGE_RISING);
-}
-
-static struct map_desc cerf_io_desc[] __initdata = {
-  	{	/* Crystal Ethernet Chip */
-		.virtual	=  0xf0000000,
-		.pfn		= __phys_to_pfn(0x08000000),
-		.length		= 0x00100000,
-		.type		= MT_DEVICE
-	}
-};
-
-static void __init cerf_map_io(void)
-{
-	sa1100_map_io();
-	iotable_init(cerf_io_desc, ARRAY_SIZE(cerf_io_desc));
-
-	sa1100_register_uart(0, 3);
-	sa1100_register_uart(1, 2); /* disable this and the uart2 device for sa1100_fir */
-	sa1100_register_uart(2, 1);
-}
-
-static struct mcp_plat_data cerf_mcp_data = {
-	.mccr0		= MCCR0_ADM,
-	.sclk_rate	= 11981000,
-};
-
-static void __init cerf_init(void)
-{
-	sa11x0_ppc_configure_mcp();
-	platform_add_devices(cerf_devices, ARRAY_SIZE(cerf_devices));
-	gpio_led_register_device(-1, &cerf_gpio_led_info);
-	sa11x0_register_mtd(&cerf_flash_data, &cerf_flash_resource, 1);
-	sa11x0_register_mcp(&cerf_mcp_data);
-	sa11x0_register_pcmcia(1, &cerf_cf_gpio_table);
-}
-
-MACHINE_START(CERF, "Intrinsyc CerfBoard/CerfCube")
-	/* Maintainer: support@intrinsyc.com */
-	.map_io		= cerf_map_io,
-	.nr_irqs	= SA1100_NR_IRQS,
-	.init_irq	= cerf_init_irq,
-	.init_time	= sa1100_timer_init,
-	.init_machine	= cerf_init,
-	.init_late	= sa11x0_init_late,
-	.restart	= sa11x0_restart,
-MACHINE_END
diff --git a/arch/arm/mach-sa1100/h3100.c b/arch/arm/mach-sa1100/h3100.c
deleted file mode 100644
index 51eaeeaf3f10..000000000000
--- a/arch/arm/mach-sa1100/h3100.c
+++ /dev/null
@@ -1,140 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Support for Compaq iPAQ H3100 handheld computer
- *
- * Copyright (c) 2000,1 Compaq Computer Corporation. (Author: Jamey Hicks)
- * Copyright (c) 2009 Dmitry Artamonow <mad_soft@inbox.ru>
- */
-
-#include <linux/init.h>
-#include <linux/kernel.h>
-#include <linux/gpio.h>
-
-#include <video/sa1100fb.h>
-
-#include <asm/mach-types.h>
-#include <asm/mach/arch.h>
-#include <linux/platform_data/irda-sa11x0.h>
-
-#include <mach/h3xxx.h>
-#include <mach/irqs.h>
-
-#include "generic.h"
-
-/*
- * helper for sa1100fb
- */
-static struct gpio h3100_lcd_gpio[] = {
-	{ H3100_GPIO_LCD_3V_ON, GPIOF_OUT_INIT_LOW, "LCD 3V" },
-	{ H3XXX_EGPIO_LCD_ON, GPIOF_OUT_INIT_LOW, "LCD ON" },
-};
-
-static bool h3100_lcd_request(void)
-{
-	static bool h3100_lcd_ok;
-	int rc;
-
-	if (h3100_lcd_ok)
-		return true;
-
-	rc = gpio_request_array(h3100_lcd_gpio, ARRAY_SIZE(h3100_lcd_gpio));
-	if (rc)
-		pr_err("%s: can't request GPIOs\n", __func__);
-	else
-		h3100_lcd_ok = true;
-
-	return h3100_lcd_ok;
-}
-
-static void h3100_lcd_power(int enable)
-{
-	if (!h3100_lcd_request())
-		return;
-
-	gpio_set_value(H3100_GPIO_LCD_3V_ON, enable);
-	gpio_set_value(H3XXX_EGPIO_LCD_ON, enable);
-}
-
-static struct sa1100fb_mach_info h3100_lcd_info = {
-	.pixclock	= 406977, 	.bpp		= 4,
-	.xres		= 320,		.yres		= 240,
-
-	.hsync_len	= 26,		.vsync_len	= 41,
-	.left_margin	= 4,		.upper_margin	= 0,
-	.right_margin	= 4,		.lower_margin	= 0,
-
-	.sync		= FB_SYNC_HOR_HIGH_ACT | FB_SYNC_VERT_HIGH_ACT,
-	.cmap_greyscale	= 1,
-	.cmap_inverse	= 1,
-
-	.lccr0		= LCCR0_Mono | LCCR0_4PixMono | LCCR0_Sngl | LCCR0_Pas,
-	.lccr3		= LCCR3_OutEnH | LCCR3_PixRsEdg | LCCR3_ACBsDiv(2),
-
-	.lcd_power = h3100_lcd_power,
-};
-
-static void __init h3100_map_io(void)
-{
-	h3xxx_map_io();
-
-	/* Older bootldrs put GPIO2-9 in alternate mode on the
-	   assumption that they are used for video */
-	GAFR &= ~0x000001fb;
-}
-
-/*
- * This turns the IRDA power on or off on the Compaq H3100
- */
-static struct gpio h3100_irda_gpio[] = {
-	{ H3100_GPIO_IR_ON,	GPIOF_OUT_INIT_LOW, "IrDA power" },
-	{ H3100_GPIO_IR_FSEL,	GPIOF_OUT_INIT_LOW, "IrDA fsel" },
-};
-
-static int h3100_irda_set_power(struct device *dev, unsigned int state)
-{
-	gpio_set_value(H3100_GPIO_IR_ON, state);
-	return 0;
-}
-
-static void h3100_irda_set_speed(struct device *dev, unsigned int speed)
-{
-	gpio_set_value(H3100_GPIO_IR_FSEL, !(speed < 4000000));
-}
-
-static int h3100_irda_startup(struct device *dev)
-{
-	return gpio_request_array(h3100_irda_gpio, sizeof(h3100_irda_gpio));
-}
-
-static void h3100_irda_shutdown(struct device *dev)
-{
-	return gpio_free_array(h3100_irda_gpio, sizeof(h3100_irda_gpio));
-}
-
-static struct irda_platform_data h3100_irda_data = {
-	.set_power	= h3100_irda_set_power,
-	.set_speed	= h3100_irda_set_speed,
-	.startup	= h3100_irda_startup,
-	.shutdown	= h3100_irda_shutdown,
-};
-
-static void __init h3100_mach_init(void)
-{
-	h3xxx_mach_init();
-
-	sa11x0_register_pcmcia(-1, NULL);
-	sa11x0_register_lcd(&h3100_lcd_info);
-	sa11x0_register_irda(&h3100_irda_data);
-}
-
-MACHINE_START(H3100, "Compaq iPAQ H3100")
-	.atag_offset	= 0x100,
-	.map_io		= h3100_map_io,
-	.nr_irqs	= SA1100_NR_IRQS,
-	.init_irq	= sa1100_init_irq,
-	.init_time	= sa1100_timer_init,
-	.init_machine	= h3100_mach_init,
-	.init_late	= sa11x0_init_late,
-	.restart	= sa11x0_restart,
-MACHINE_END
-
diff --git a/arch/arm/mach-sa1100/hackkit.c b/arch/arm/mach-sa1100/hackkit.c
deleted file mode 100644
index 3085f1c2e586..000000000000
--- a/arch/arm/mach-sa1100/hackkit.c
+++ /dev/null
@@ -1,184 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * linux/arch/arm/mach-sa1100/hackkit.c
- *
- * Copyright (C) 2002 Stefan Eletzhofer <stefan.eletzhofer@eletztrick.de>
- *
- * This file contains all HackKit tweaks. Based on original work from
- * Nicolas Pitre's assabet fixes
- */
-#include <linux/init.h>
-#include <linux/kernel.h>
-#include <linux/sched.h>
-#include <linux/tty.h>
-#include <linux/module.h>
-#include <linux/errno.h>
-#include <linux/cpufreq.h>
-#include <linux/platform_data/sa11x0-serial.h>
-#include <linux/serial_core.h>
-#include <linux/mtd/mtd.h>
-#include <linux/mtd/partitions.h>
-#include <linux/tty.h>
-#include <linux/gpio.h>
-#include <linux/leds.h>
-#include <linux/platform_device.h>
-#include <linux/pgtable.h>
-
-#include <asm/mach-types.h>
-#include <asm/setup.h>
-#include <asm/page.h>
-
-#include <asm/mach/arch.h>
-#include <asm/mach/flash.h>
-#include <asm/mach/map.h>
-#include <asm/mach/irq.h>
-
-#include <mach/hardware.h>
-#include <mach/irqs.h>
-
-#include "generic.h"
-
-/**********************************************************************
- *  prototypes
- */
-
-/* init funcs */
-static void __init hackkit_map_io(void);
-
-static void hackkit_uart_pm(struct uart_port *port, u_int state, u_int oldstate);
-
-/**********************************************************************
- *  global data
- */
-
-/**********************************************************************
- *  static data
- */
-
-static struct map_desc hackkit_io_desc[] __initdata = {
-	{	/* Flash bank 0 */
-		.virtual	=  0xe8000000,
-		.pfn		= __phys_to_pfn(0x00000000),
-		.length		= 0x01000000,
-		.type		= MT_DEVICE
-	},
-};
-
-static struct sa1100_port_fns hackkit_port_fns __initdata = {
-	.pm		= hackkit_uart_pm,
-};
-
-/**********************************************************************
- *  Static functions
- */
-
-static void __init hackkit_map_io(void)
-{
-	sa1100_map_io();
-	iotable_init(hackkit_io_desc, ARRAY_SIZE(hackkit_io_desc));
-
-	sa1100_register_uart_fns(&hackkit_port_fns);
-	sa1100_register_uart(0, 1);	/* com port */
-	sa1100_register_uart(1, 2);
-	sa1100_register_uart(2, 3);	/* radio module */
-
-	Ser1SDCR0 |= SDCR0_SUS;
-}
-
-/**
- *	hackkit_uart_pm - powermgmt callback function for system 3 UART
- *	@port: uart port structure
- *	@state: pm state
- *	@oldstate: old pm state
- *
- */
-static void hackkit_uart_pm(struct uart_port *port, u_int state, u_int oldstate)
-{
-	/* TODO: switch on/off uart in powersave mode */
-}
-
-static struct mtd_partition hackkit_partitions[] = {
-	{
-		.name		= "BLOB",
-		.size		= 0x00040000,
-		.offset		= 0x00000000,
-		.mask_flags	= MTD_WRITEABLE,  /* force read-only */
-	}, {
-		.name		= "config",
-		.size		= 0x00040000,
-		.offset		= MTDPART_OFS_APPEND,
-	}, {
-		.name		= "kernel",
-		.size		= 0x00100000,
-		.offset		= MTDPART_OFS_APPEND,
-	}, {
-		.name		= "initrd",
-		.size		= 0x00180000,
-		.offset		= MTDPART_OFS_APPEND,
-	}, {
-		.name		= "rootfs",
-		.size		= 0x700000,
-		.offset		= MTDPART_OFS_APPEND,
-	}, {
-		.name		= "data",
-		.size		= MTDPART_SIZ_FULL,
-		.offset		= MTDPART_OFS_APPEND,
-	}
-};
-
-static struct flash_platform_data hackkit_flash_data = {
-	.map_name	= "cfi_probe",
-	.parts		= hackkit_partitions,
-	.nr_parts	= ARRAY_SIZE(hackkit_partitions),
-};
-
-static struct resource hackkit_flash_resource =
-	DEFINE_RES_MEM(SA1100_CS0_PHYS, SZ_32M);
-
-/* LEDs */
-struct gpio_led hackkit_gpio_leds[] = {
-	{
-		.name			= "hackkit:red",
-		.default_trigger	= "cpu0",
-		.gpio			= 22,
-	},
-	{
-		.name			= "hackkit:green",
-		.default_trigger	= "heartbeat",
-		.gpio			= 23,
-	},
-};
-
-static struct gpio_led_platform_data hackkit_gpio_led_info = {
-	.leds		= hackkit_gpio_leds,
-	.num_leds	= ARRAY_SIZE(hackkit_gpio_leds),
-};
-
-static struct platform_device hackkit_leds = {
-	.name	= "leds-gpio",
-	.id	= -1,
-	.dev	= {
-		.platform_data	= &hackkit_gpio_led_info,
-	}
-};
-
-static void __init hackkit_init(void)
-{
-	sa11x0_register_mtd(&hackkit_flash_data, &hackkit_flash_resource, 1);
-	platform_device_register(&hackkit_leds);
-}
-
-/**********************************************************************
- *  Exported Functions
- */
-
-MACHINE_START(HACKKIT, "HackKit Cpu Board")
-	.atag_offset	= 0x100,
-	.map_io		= hackkit_map_io,
-	.nr_irqs	= SA1100_NR_IRQS,
-	.init_irq	= sa1100_init_irq,
-	.init_time	= sa1100_timer_init,
-	.init_machine	= hackkit_init,
-	.init_late	= sa11x0_init_late,
-	.restart	= sa11x0_restart,
-MACHINE_END
diff --git a/arch/arm/mach-sa1100/include/mach/badge4.h b/arch/arm/mach-sa1100/include/mach/badge4.h
deleted file mode 100644
index 90e744a54ed5..000000000000
--- a/arch/arm/mach-sa1100/include/mach/badge4.h
+++ /dev/null
@@ -1,71 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * arch/arm/mach-sa1100/include/mach/badge4.h
- *
- *   Tim Connors <connors@hpl.hp.com>
- *   Christopher Hoover <ch@hpl.hp.com>
- *
- * Copyright (C) 2002 Hewlett-Packard Company
- */
-
-#ifndef __ASM_ARCH_HARDWARE_H
-#error "include <mach/hardware.h> instead"
-#endif
-
-#define BADGE4_SA1111_BASE		(0x48000000)
-
-/* GPIOs on the BadgePAD 4 */
-#define BADGE4_GPIO_INT_1111		GPIO_GPIO0   /* SA-1111 IRQ */
-
-#define BADGE4_GPIO_INT_VID		GPIO_GPIO1   /* Video expansion */
-#define BADGE4_GPIO_LGP2		GPIO_GPIO2   /* GPIO_LDD8 */
-#define BADGE4_GPIO_LGP3		GPIO_GPIO3   /* GPIO_LDD9 */
-#define BADGE4_GPIO_LGP4		GPIO_GPIO4   /* GPIO_LDD10 */
-#define BADGE4_GPIO_LGP5		GPIO_GPIO5   /* GPIO_LDD11 */
-#define BADGE4_GPIO_LGP6		GPIO_GPIO6   /* GPIO_LDD12 */
-#define BADGE4_GPIO_LGP7		GPIO_GPIO7   /* GPIO_LDD13 */
-#define BADGE4_GPIO_LGP8		GPIO_GPIO8   /* GPIO_LDD14 */
-#define BADGE4_GPIO_LGP9		GPIO_GPIO9   /* GPIO_LDD15 */
-#define BADGE4_GPIO_GPA_VID		GPIO_GPIO10  /* Video expansion */
-#define BADGE4_GPIO_GPB_VID		GPIO_GPIO11  /* Video expansion */
-#define BADGE4_GPIO_GPC_VID		GPIO_GPIO12  /* Video expansion */
-
-#define BADGE4_GPIO_UART_HS1		GPIO_GPIO13
-#define BADGE4_GPIO_UART_HS2		GPIO_GPIO14
-
-#define BADGE4_GPIO_MUXSEL0		GPIO_GPIO15
-#define BADGE4_GPIO_TESTPT_J7		GPIO_GPIO16
-
-#define BADGE4_GPIO_SDSDA		GPIO_GPIO17  /* SDRAM SPD Data */
-#define BADGE4_GPIO_SDSCL		GPIO_GPIO18  /* SDRAM SPD Clock */
-#define BADGE4_GPIO_SDTYP0		GPIO_GPIO19  /* SDRAM Type Control */
-#define BADGE4_GPIO_SDTYP1		GPIO_GPIO20  /* SDRAM Type Control */
-
-#define BADGE4_GPIO_BGNT_1111		GPIO_GPIO21  /* GPIO_MBGNT */
-#define BADGE4_GPIO_BREQ_1111		GPIO_GPIO22  /* GPIO_TREQA */
-
-#define BADGE4_GPIO_TESTPT_J6		GPIO_GPIO23
-
-#define BADGE4_GPIO_PCMEN5V		GPIO_GPIO24  /* 5V power */
-
-#define BADGE4_GPIO_SA1111_NRST		GPIO_GPIO25  /* SA-1111 nRESET */
-
-#define BADGE4_GPIO_TESTPT_J5		GPIO_GPIO26
-
-#define BADGE4_GPIO_CLK_1111		GPIO_GPIO27  /* GPIO_32_768kHz */
-
-/* Interrupts on the BadgePAD 4 */
-#define BADGE4_IRQ_GPIO_SA1111		IRQ_GPIO0    /* SA-1111 interrupt */
-
-
-/* PCM5ENV Usage tracking */
-
-#define BADGE4_5V_PCMCIA_SOCK0		(1<<0)
-#define BADGE4_5V_PCMCIA_SOCK1		(1<<1)
-#define BADGE4_5V_PCMCIA_SOCK(n)	(1<<(n))
-#define BADGE4_5V_USB			(1<<2)
-#define BADGE4_5V_INITIALLY		(1<<3)
-
-#ifndef __ASSEMBLY__
-extern void badge4_set_5V(unsigned subsystem, int on);
-#endif
diff --git a/arch/arm/mach-sa1100/include/mach/cerf.h b/arch/arm/mach-sa1100/include/mach/cerf.h
deleted file mode 100644
index 59c185ebd494..000000000000
--- a/arch/arm/mach-sa1100/include/mach/cerf.h
+++ /dev/null
@@ -1,20 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * arch/arm/mach-sa1100/include/mach/cerf.h
- *
- * Apr-2003 : Removed some old PDA crud [FB]
- */
-#ifndef _INCLUDE_CERF_H_
-#define _INCLUDE_CERF_H_
-
-
-#define CERF_ETH_IO			0xf0000000
-#define CERF_ETH_IRQ IRQ_GPIO26
-
-#define CERF_GPIO_CF_BVD2		19
-#define CERF_GPIO_CF_BVD1		20
-#define CERF_GPIO_CF_RESET		21
-#define CERF_GPIO_CF_IRQ		22
-#define CERF_GPIO_CF_CD			23
-
-#endif // _INCLUDE_CERF_H_
diff --git a/arch/arm/mach-sa1100/include/mach/nanoengine.h b/arch/arm/mach-sa1100/include/mach/nanoengine.h
deleted file mode 100644
index 8d5ee1438956..000000000000
--- a/arch/arm/mach-sa1100/include/mach/nanoengine.h
+++ /dev/null
@@ -1,48 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * arch/arm/mach-sa1100/include/mach/nanoengine.h
- *
- * This file contains the hardware specific definitions for nanoEngine.
- * Only include this file from SA1100-specific files.
- *
- * Copyright (C) 2010 Marcelo Roberto Jimenez <mroberto@cpti.cetuc.puc-rio.br>
- */
-#ifndef __ASM_ARCH_NANOENGINE_H
-#define __ASM_ARCH_NANOENGINE_H
-
-#include <mach/irqs.h>
-
-#define GPIO_PC_READY0	11 /* ready for socket 0 (active high)*/
-#define GPIO_PC_READY1	12 /* ready for socket 1 (active high) */
-#define GPIO_PC_CD0	13 /* detect for socket 0 (active low) */
-#define GPIO_PC_CD1	14 /* detect for socket 1 (active low) */
-#define GPIO_PC_RESET0	15 /* reset socket 0 */
-#define GPIO_PC_RESET1	16 /* reset socket 1 */
-
-#define NANOENGINE_IRQ_GPIO_PCI		IRQ_GPIO0
-#define NANOENGINE_IRQ_GPIO_PC_READY0	IRQ_GPIO11
-#define NANOENGINE_IRQ_GPIO_PC_READY1	IRQ_GPIO12
-#define NANOENGINE_IRQ_GPIO_PC_CD0	IRQ_GPIO13
-#define NANOENGINE_IRQ_GPIO_PC_CD1	IRQ_GPIO14
-
-/*
- * nanoEngine Memory Map:
- *
- * 0000.0000 - 003F.0000 -   4 MB Flash
- * C000.0000 - C1FF.FFFF -  32 MB SDRAM
- * 1860.0000 - 186F.FFFF -   1 MB Internal PCI Memory Read/Write
- * 18A1.0000 - 18A1.FFFF -  64 KB Internal PCI Config Space
- * 4000.0000 - 47FF.FFFF - 128 MB External Bus I/O - Multiplexed Mode
- * 4800.0000 - 4FFF.FFFF - 128 MB External Bus I/O - Non-Multiplexed Mode
- *
- */
-
-#define NANO_PCI_MEM_RW_PHYS		0x18600000
-#define NANO_PCI_MEM_RW_VIRT		0xf1000000
-#define NANO_PCI_MEM_RW_SIZE		SZ_1M
-#define NANO_PCI_CONFIG_SPACE_PHYS	0x18A10000
-#define NANO_PCI_CONFIG_SPACE_VIRT	0xf2000000
-#define NANO_PCI_CONFIG_SPACE_SIZE	SZ_64K
-
-#endif
-
diff --git a/arch/arm/mach-sa1100/include/mach/shannon.h b/arch/arm/mach-sa1100/include/mach/shannon.h
deleted file mode 100644
index d830375f329c..000000000000
--- a/arch/arm/mach-sa1100/include/mach/shannon.h
+++ /dev/null
@@ -1,40 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _INCLUDE_SHANNON_H
-#define _INCLUDE_SHANNON_H
-
-/* taken from comp.os.inferno Tue, 12 Sep 2000 09:21:50 GMT,
- * written by <forsyth@vitanuova.com> */
-
-#define SHANNON_GPIO_SPI_FLASH		GPIO_GPIO (0)	/* Output - Driven low, enables SPI to flash */
-#define SHANNON_GPIO_SPI_DSP		GPIO_GPIO (1)	/* Output - Driven low, enables SPI to DSP */
-/* lcd lower = GPIO 2-9 */
-#define SHANNON_GPIO_SPI_OUTPUT		GPIO_GPIO (10)	/* Output - SPI output to DSP */
-#define SHANNON_GPIO_SPI_INPUT		GPIO_GPIO (11)	/* Input  - SPI input from DSP */
-#define SHANNON_GPIO_SPI_CLOCK		GPIO_GPIO (12)	/* Output - Clock for SPI */
-#define SHANNON_GPIO_SPI_FRAME		GPIO_GPIO (13)	/* Output - Frame marker - not used */
-#define SHANNON_GPIO_SPI_RTS		GPIO_GPIO (14)	/* Input  - SPI Ready to Send */
-#define SHANNON_IRQ_GPIO_SPI_RTS	IRQ_GPIO14
-#define SHANNON_GPIO_SPI_CTS		GPIO_GPIO (15)	/* Output - SPI Clear to Send */
-#define SHANNON_GPIO_IRQ_CODEC		GPIO_GPIO (16)	/* in, irq from ucb1200 */
-#define SHANNON_IRQ_GPIO_IRQ_CODEC	IRQ_GPIO16
-#define SHANNON_GPIO_DSP_RESET		GPIO_GPIO (17)	/* Output - Drive low to reset the DSP */
-#define SHANNON_GPIO_CODEC_RESET	GPIO_GPIO (18)	/* Output - Drive low to reset the UCB1x00 */
-#define SHANNON_GPIO_U3_RTS		GPIO_GPIO (19)	/* ?? */
-#define SHANNON_GPIO_U3_CTS		GPIO_GPIO (20)	/* ?? */
-#define SHANNON_GPIO_SENSE_12V		GPIO_GPIO (21)	/* Input, 12v flash unprotect detected */
-#define SHANNON_GPIO_DISP_EN		22		/* out */
-/* XXX GPIO 23 unaccounted for */
-#define SHANNON_GPIO_EJECT_0		24		/* in */
-#define SHANNON_GPIO_EJECT_1		25		/* in */
-#define SHANNON_GPIO_RDY_0		26		/* in */
-#define SHANNON_GPIO_RDY_1		27		/* in */
-
-/* MCP UCB codec GPIO pins... */
-
-#define SHANNON_UCB_GPIO_BACKLIGHT	9
-#define SHANNON_UCB_GPIO_BRIGHT_MASK  	7
-#define SHANNON_UCB_GPIO_BRIGHT		6
-#define SHANNON_UCB_GPIO_CONTRAST_MASK	0x3f
-#define SHANNON_UCB_GPIO_CONTRAST	0
-
-#endif
diff --git a/arch/arm/mach-sa1100/include/mach/simpad.h b/arch/arm/mach-sa1100/include/mach/simpad.h
deleted file mode 100644
index d53d680de3d9..000000000000
--- a/arch/arm/mach-sa1100/include/mach/simpad.h
+++ /dev/null
@@ -1,159 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * arch/arm/mach-sa1100/include/mach/simpad.h
- *
- * based of assabet.h same as HUW_Webpanel
- *
- * This file contains the hardware specific definitions for SIMpad
- *
- * 2001/05/14 Juergen Messerer <juergen.messerer@freesurf.ch>
- */
-
-#ifndef __ASM_ARCH_SIMPAD_H
-#define __ASM_ARCH_SIMPAD_H
-
-
-#define GPIO_UART1_RTS	GPIO_GPIO14
-#define GPIO_UART1_DTR	GPIO_GPIO7
-#define GPIO_UART1_CTS	GPIO_GPIO8
-#define GPIO_UART1_DCD	GPIO_GPIO23
-#define GPIO_UART1_DSR	GPIO_GPIO6
-
-#define GPIO_UART3_RTS	GPIO_GPIO12
-#define GPIO_UART3_DTR	GPIO_GPIO16
-#define GPIO_UART3_CTS	GPIO_GPIO13
-#define GPIO_UART3_DCD	GPIO_GPIO18
-#define GPIO_UART3_DSR	GPIO_GPIO17
-
-#define GPIO_POWER_BUTTON	GPIO_GPIO0
-#define GPIO_UCB1300_IRQ	GPIO_GPIO22	/* UCB GPIO and touchscreen */
-
-#define IRQ_UART1_CTS	IRQ_GPIO15
-#define IRQ_UART1_DCD	GPIO_GPIO23
-#define IRQ_UART1_DSR	GPIO_GPIO6
-#define IRQ_UART3_CTS	GPIO_GPIO13
-#define IRQ_UART3_DCD	GPIO_GPIO18
-#define IRQ_UART3_DSR	GPIO_GPIO17
-
-#define IRQ_GPIO_UCB1300_IRQ IRQ_GPIO22
-#define IRQ_GPIO_POWER_BUTTON IRQ_GPIO0
-
-
-/*---  PCMCIA  ---*/
-#define GPIO_CF_CD              24
-#define GPIO_CF_IRQ             1
-
-/*--- SmartCard ---*/
-#define GPIO_SMART_CARD		GPIO_GPIO10
-#define IRQ_GPIO_SMARD_CARD	IRQ_GPIO10
-
-/*--- ucb1x00 GPIO ---*/
-#define SIMPAD_UCB1X00_GPIO_BASE	(GPIO_MAX + 1)
-#define SIMPAD_UCB1X00_GPIO_PROG1	(SIMPAD_UCB1X00_GPIO_BASE)
-#define SIMPAD_UCB1X00_GPIO_PROG2	(SIMPAD_UCB1X00_GPIO_BASE + 1)
-#define SIMPAD_UCB1X00_GPIO_UP		(SIMPAD_UCB1X00_GPIO_BASE + 2)
-#define SIMPAD_UCB1X00_GPIO_DOWN	(SIMPAD_UCB1X00_GPIO_BASE + 3)
-#define SIMPAD_UCB1X00_GPIO_LEFT	(SIMPAD_UCB1X00_GPIO_BASE + 4)
-#define SIMPAD_UCB1X00_GPIO_RIGHT	(SIMPAD_UCB1X00_GPIO_BASE + 5)
-#define SIMPAD_UCB1X00_GPIO_6		(SIMPAD_UCB1X00_GPIO_BASE + 6)
-#define SIMPAD_UCB1X00_GPIO_7		(SIMPAD_UCB1X00_GPIO_BASE + 7)
-#define SIMPAD_UCB1X00_GPIO_HEADSET	(SIMPAD_UCB1X00_GPIO_BASE + 8)
-#define SIMPAD_UCB1X00_GPIO_SPEAKER	(SIMPAD_UCB1X00_GPIO_BASE + 9)
-
-/*--- CS3 Latch ---*/
-#define SIMPAD_CS3_GPIO_BASE		(GPIO_MAX + 11)
-#define SIMPAD_CS3_VCC_5V_EN		(SIMPAD_CS3_GPIO_BASE)
-#define SIMPAD_CS3_VCC_3V_EN		(SIMPAD_CS3_GPIO_BASE + 1)
-#define SIMPAD_CS3_EN1			(SIMPAD_CS3_GPIO_BASE + 2)
-#define SIMPAD_CS3_EN0			(SIMPAD_CS3_GPIO_BASE + 3)
-#define SIMPAD_CS3_DISPLAY_ON		(SIMPAD_CS3_GPIO_BASE + 4)
-#define SIMPAD_CS3_PCMCIA_BUFF_DIS	(SIMPAD_CS3_GPIO_BASE + 5)
-#define SIMPAD_CS3_MQ_RESET		(SIMPAD_CS3_GPIO_BASE + 6)
-#define SIMPAD_CS3_PCMCIA_RESET		(SIMPAD_CS3_GPIO_BASE + 7)
-#define SIMPAD_CS3_DECT_POWER_ON	(SIMPAD_CS3_GPIO_BASE + 8)
-#define SIMPAD_CS3_IRDA_SD		(SIMPAD_CS3_GPIO_BASE + 9)
-#define SIMPAD_CS3_RS232_ON		(SIMPAD_CS3_GPIO_BASE + 10)
-#define SIMPAD_CS3_SD_MEDIAQ		(SIMPAD_CS3_GPIO_BASE + 11)
-#define SIMPAD_CS3_LED2_ON		(SIMPAD_CS3_GPIO_BASE + 12)
-#define SIMPAD_CS3_IRDA_MODE		(SIMPAD_CS3_GPIO_BASE + 13)
-#define SIMPAD_CS3_ENABLE_5V		(SIMPAD_CS3_GPIO_BASE + 14)
-#define SIMPAD_CS3_RESET_SIMCARD	(SIMPAD_CS3_GPIO_BASE + 15)
-
-#define SIMPAD_CS3_PCMCIA_BVD1		(SIMPAD_CS3_GPIO_BASE + 16)
-#define SIMPAD_CS3_PCMCIA_BVD2		(SIMPAD_CS3_GPIO_BASE + 17)
-#define SIMPAD_CS3_PCMCIA_VS1		(SIMPAD_CS3_GPIO_BASE + 18)
-#define SIMPAD_CS3_PCMCIA_VS2		(SIMPAD_CS3_GPIO_BASE + 19)
-#define SIMPAD_CS3_LOCK_IND		(SIMPAD_CS3_GPIO_BASE + 20)
-#define SIMPAD_CS3_CHARGING_STATE	(SIMPAD_CS3_GPIO_BASE + 21)
-#define SIMPAD_CS3_PCMCIA_SHORT		(SIMPAD_CS3_GPIO_BASE + 22)
-#define SIMPAD_CS3_GPIO_23		(SIMPAD_CS3_GPIO_BASE + 23)
-
-#define CS3_BASE        IOMEM(0xf1000000)
-
-long simpad_get_cs3_ro(void);
-long simpad_get_cs3_shadow(void);
-void simpad_set_cs3_bit(int value);
-void simpad_clear_cs3_bit(int value);
-
-#define VCC_5V_EN	0x0001 /* For 5V PCMCIA */
-#define VCC_3V_EN	0x0002 /* FOR 3.3V PCMCIA */
-#define EN1		0x0004 /* This is only for EPROM's */
-#define EN0		0x0008 /* Both should be enable for 3.3V or 5V */
-#define DISPLAY_ON	0x0010
-#define PCMCIA_BUFF_DIS	0x0020
-#define MQ_RESET	0x0040
-#define PCMCIA_RESET	0x0080
-#define DECT_POWER_ON	0x0100
-#define IRDA_SD		0x0200 /* Shutdown for powersave */
-#define RS232_ON	0x0400
-#define SD_MEDIAQ	0x0800 /* Shutdown for powersave */
-#define LED2_ON		0x1000
-#define IRDA_MODE	0x2000 /* Fast/Slow IrDA mode */
-#define ENABLE_5V	0x4000 /* Enable 5V circuit */
-#define RESET_SIMCARD	0x8000
-
-#define PCMCIA_BVD1	0x01
-#define PCMCIA_BVD2	0x02
-#define PCMCIA_VS1	0x04
-#define PCMCIA_VS2	0x08
-#define LOCK_IND	0x10
-#define CHARGING_STATE	0x20
-#define PCMCIA_SHORT	0x40
-
-/*--- Battery ---*/
-struct simpad_battery {
-	unsigned char ac_status;	/* line connected yes/no */
-	unsigned char status;		/* battery loading yes/no */
-	unsigned char percentage;	/* percentage loaded */
-	unsigned short life;		/* life till empty */
-};
-
-/* These should match the apm_bios.h definitions */
-#define SIMPAD_AC_STATUS_AC_OFFLINE      0x00
-#define SIMPAD_AC_STATUS_AC_ONLINE       0x01
-#define SIMPAD_AC_STATUS_AC_BACKUP       0x02   /* What does this mean? */
-#define SIMPAD_AC_STATUS_AC_UNKNOWN      0xff
-
-/* These bitfields are rarely "or'd" together */
-#define SIMPAD_BATT_STATUS_HIGH          0x01
-#define SIMPAD_BATT_STATUS_LOW           0x02
-#define SIMPAD_BATT_STATUS_CRITICAL      0x04
-#define SIMPAD_BATT_STATUS_CHARGING      0x08
-#define SIMPAD_BATT_STATUS_CHARGE_MAIN   0x10
-#define SIMPAD_BATT_STATUS_DEAD          0x20   /* Battery will not charge */
-#define SIMPAD_BATT_NOT_INSTALLED        0x20   /* For expansion pack batteries */
-#define SIMPAD_BATT_STATUS_FULL          0x40   /* Battery fully charged (and connected to AC) */
-#define SIMPAD_BATT_STATUS_NOBATT        0x80
-#define SIMPAD_BATT_STATUS_UNKNOWN       0xff
-
-extern int simpad_get_battery(struct simpad_battery* );
-
-#endif // __ASM_ARCH_SIMPAD_H
-
-
-
-
-
-
-
-
diff --git a/arch/arm/mach-sa1100/lart.c b/arch/arm/mach-sa1100/lart.c
deleted file mode 100644
index e3a0279750e3..000000000000
--- a/arch/arm/mach-sa1100/lart.c
+++ /dev/null
@@ -1,177 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * linux/arch/arm/mach-sa1100/lart.c
- */
-
-#include <linux/init.h>
-#include <linux/kernel.h>
-#include <linux/platform_data/sa11x0-serial.h>
-#include <linux/tty.h>
-#include <linux/gpio.h>
-#include <linux/leds.h>
-#include <linux/platform_device.h>
-
-#include <video/sa1100fb.h>
-
-#include <mach/hardware.h>
-#include <asm/setup.h>
-#include <asm/mach-types.h>
-#include <asm/page.h>
-
-#include <asm/mach/arch.h>
-#include <asm/mach/map.h>
-#include <linux/platform_data/mfd-mcp-sa11x0.h>
-#include <mach/irqs.h>
-
-#include "generic.h"
-
-static struct mcp_plat_data lart_mcp_data = {
-	.mccr0		= MCCR0_ADM,
-	.sclk_rate	= 11981000,
-};
-
-#ifdef LART_GREY_LCD
-static struct sa1100fb_mach_info lart_grey_info = {
-	.pixclock	= 150000,	.bpp		= 4,
-	.xres		= 320,		.yres		= 240,
-
-	.hsync_len	= 1,		.vsync_len	= 1,
-	.left_margin	= 4,		.upper_margin	= 0,
-	.right_margin	= 2,		.lower_margin	= 0,
-
-	.cmap_greyscale	= 1,
-	.sync		= FB_SYNC_HOR_HIGH_ACT | FB_SYNC_VERT_HIGH_ACT,
-
-	.lccr0		= LCCR0_Mono | LCCR0_Sngl | LCCR0_Pas | LCCR0_4PixMono,
-	.lccr3		= LCCR3_OutEnH | LCCR3_PixRsEdg | LCCR3_ACBsDiv(512),
-};
-#endif
-#ifdef LART_COLOR_LCD
-static struct sa1100fb_mach_info lart_color_info = {
-	.pixclock	= 150000,	.bpp		= 16,
-	.xres		= 320,		.yres		= 240,
-
-	.hsync_len	= 2,		.vsync_len	= 3,
-	.left_margin	= 69,		.upper_margin	= 14,
-	.right_margin	= 8,		.lower_margin	= 4,
-
-	.lccr0		= LCCR0_Color | LCCR0_Sngl | LCCR0_Act,
-	.lccr3		= LCCR3_OutEnH | LCCR3_PixFlEdg | LCCR3_ACBsDiv(512),
-};
-#endif
-#ifdef LART_VIDEO_OUT
-static struct sa1100fb_mach_info lart_video_info = {
-	.pixclock	= 39721,	.bpp		= 16,
-	.xres		= 640,		.yres		= 480,
-
-	.hsync_len	= 95,		.vsync_len	= 2,
-	.left_margin	= 40,		.upper_margin	= 32,
-	.right_margin	= 24,		.lower_margin	= 11,
-
-	.sync		= FB_SYNC_HOR_HIGH_ACT | FB_SYNC_VERT_HIGH_ACT,
-
-	.lccr0		= LCCR0_Color | LCCR0_Sngl | LCCR0_Act,
-	.lccr3		= LCCR3_OutEnL | LCCR3_PixFlEdg | LCCR3_ACBsDiv(512),
-};
-#endif
-
-#ifdef LART_KIT01_LCD
-static struct sa1100fb_mach_info lart_kit01_info = {
-	.pixclock	= 63291,	.bpp		= 16,
-	.xres		= 640,		.yres		= 480,
-
-	.hsync_len	= 64,		.vsync_len	= 3,
-	.left_margin	= 122,		.upper_margin	= 45,
-	.right_margin	= 10,		.lower_margin	= 10,
-
-	.lccr0		= LCCR0_Color | LCCR0_Sngl | LCCR0_Act,
-	.lccr3		= LCCR3_OutEnH | LCCR3_PixFlEdg
-};
-#endif
-
-static void __init lart_init(void)
-{
-	struct sa1100fb_mach_info *inf = NULL;
-
-#ifdef LART_GREY_LCD
-	inf = &lart_grey_info;
-#endif
-#ifdef LART_COLOR_LCD
-	inf = &lart_color_info;
-#endif
-#ifdef LART_VIDEO_OUT
-	inf = &lart_video_info;
-#endif
-#ifdef LART_KIT01_LCD
-	inf = &lart_kit01_info;
-#endif
-
-	if (inf)
-		sa11x0_register_lcd(inf);
-
-	sa11x0_ppc_configure_mcp();
-	sa11x0_register_mcp(&lart_mcp_data);
-}
-
-static struct map_desc lart_io_desc[] __initdata = {
-	{	/* main flash memory */
-		.virtual	=  0xe8000000,
-		.pfn		= __phys_to_pfn(0x00000000),
-		.length		= 0x00400000,
-		.type		= MT_DEVICE
-	}, {	/* main flash, alternative location */
-		.virtual	=  0xec000000,
-		.pfn		= __phys_to_pfn(0x08000000),
-		.length		= 0x00400000,
-		.type		= MT_DEVICE
-	}
-};
-
-/* LEDs */
-struct gpio_led lart_gpio_leds[] = {
-	{
-		.name			= "lart:red",
-		.default_trigger	= "cpu0",
-		.gpio			= 23,
-	},
-};
-
-static struct gpio_led_platform_data lart_gpio_led_info = {
-	.leds		= lart_gpio_leds,
-	.num_leds	= ARRAY_SIZE(lart_gpio_leds),
-};
-
-static struct platform_device lart_leds = {
-	.name	= "leds-gpio",
-	.id	= -1,
-	.dev	= {
-		.platform_data	= &lart_gpio_led_info,
-	}
-};
-static void __init lart_map_io(void)
-{
-	sa1100_map_io();
-	iotable_init(lart_io_desc, ARRAY_SIZE(lart_io_desc));
-
-	sa1100_register_uart(0, 3);
-	sa1100_register_uart(1, 1);
-	sa1100_register_uart(2, 2);
-
-	GAFR |= (GPIO_UART_TXD | GPIO_UART_RXD);
-	GPDR |= GPIO_UART_TXD;
-	GPDR &= ~GPIO_UART_RXD;
-	PPAR |= PPAR_UPR;
-
-	platform_device_register(&lart_leds);
-}
-
-MACHINE_START(LART, "LART")
-	.atag_offset	= 0x100,
-	.map_io		= lart_map_io,
-	.nr_irqs	= SA1100_NR_IRQS,
-	.init_irq	= sa1100_init_irq,
-	.init_machine	= lart_init,
-	.init_late	= sa11x0_init_late,
-	.init_time	= sa1100_timer_init,
-	.restart	= sa11x0_restart,
-MACHINE_END
diff --git a/arch/arm/mach-sa1100/nanoengine.c b/arch/arm/mach-sa1100/nanoengine.c
deleted file mode 100644
index f6c9c19c39fb..000000000000
--- a/arch/arm/mach-sa1100/nanoengine.c
+++ /dev/null
@@ -1,136 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * linux/arch/arm/mach-sa1100/nanoengine.c
- *
- * Bright Star Engineering's nanoEngine board init code.
- *
- * Copyright (C) 2010 Marcelo Roberto Jimenez <mroberto@cpti.cetuc.puc-rio.br>
- */
-
-#include <linux/init.h>
-#include <linux/gpio/machine.h>
-#include <linux/kernel.h>
-#include <linux/platform_data/sa11x0-serial.h>
-#include <linux/mtd/mtd.h>
-#include <linux/mtd/partitions.h>
-#include <linux/root_dev.h>
-
-#include <asm/mach-types.h>
-#include <asm/setup.h>
-#include <asm/page.h>
-
-#include <asm/mach/arch.h>
-#include <asm/mach/flash.h>
-#include <asm/mach/map.h>
-
-#include <mach/hardware.h>
-#include <mach/nanoengine.h>
-#include <mach/irqs.h>
-
-#include "generic.h"
-
-/* Flash bank 0 */
-static struct mtd_partition nanoengine_partitions[] = {
-	{
-		.name	= "nanoEngine boot firmware and parameter table",
-		.size		= 0x00010000,  /* 32K */
-		.offset		= 0,
-		.mask_flags	= MTD_WRITEABLE,
-	}, {
-		.name		= "kernel/initrd reserved",
-		.size		= 0x002f0000,
-		.offset		= 0x00010000,
-		.mask_flags	= MTD_WRITEABLE,
-	}, {
-		.name		= "experimental filesystem allocation",
-		.size		= 0x00100000,
-		.offset		= 0x00300000,
-		.mask_flags	= MTD_WRITEABLE,
-	}
-};
-
-static struct flash_platform_data nanoengine_flash_data = {
-	.map_name	= "jedec_probe",
-	.parts		= nanoengine_partitions,
-	.nr_parts	= ARRAY_SIZE(nanoengine_partitions),
-};
-
-static struct resource nanoengine_flash_resources[] = {
-	DEFINE_RES_MEM(SA1100_CS0_PHYS, SZ_32M),
-	DEFINE_RES_MEM(SA1100_CS1_PHYS, SZ_32M),
-};
-
-static struct map_desc nanoengine_io_desc[] __initdata = {
-	{
-		/* System Registers */
-		.virtual	= 0xf0000000,
-		.pfn		= __phys_to_pfn(0x10000000),
-		.length		= 0x00100000,
-		.type		= MT_DEVICE
-	}, {
-		/* Internal PCI Memory Read/Write */
-		.virtual	= NANO_PCI_MEM_RW_VIRT,
-		.pfn		= __phys_to_pfn(NANO_PCI_MEM_RW_PHYS),
-		.length		= NANO_PCI_MEM_RW_SIZE,
-		.type		= MT_DEVICE
-	}, {
-		/* Internal PCI Config Space */
-		.virtual	= NANO_PCI_CONFIG_SPACE_VIRT,
-		.pfn		= __phys_to_pfn(NANO_PCI_CONFIG_SPACE_PHYS),
-		.length		= NANO_PCI_CONFIG_SPACE_SIZE,
-		.type		= MT_DEVICE
-	}
-};
-
-static void __init nanoengine_map_io(void)
-{
-	sa1100_map_io();
-	iotable_init(nanoengine_io_desc, ARRAY_SIZE(nanoengine_io_desc));
-
-	sa1100_register_uart(0, 1);
-	sa1100_register_uart(1, 2);
-	sa1100_register_uart(2, 3);
-	Ser1SDCR0 |= SDCR0_UART;
-	/* disable IRDA -- UART2 is used as a normal serial port */
-	Ser2UTCR4 = 0;
-	Ser2HSCR0 = 0;
-}
-
-static struct gpiod_lookup_table nanoengine_pcmcia0_gpio_table = {
-	.dev_id = "sa11x0-pcmcia.0",
-	.table = {
-		GPIO_LOOKUP("gpio", 11, "ready", GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP("gpio", 13, "detect", GPIO_ACTIVE_LOW),
-		GPIO_LOOKUP("gpio", 15, "reset", GPIO_ACTIVE_HIGH),
-		{ },
-	},
-};
-
-static struct gpiod_lookup_table nanoengine_pcmcia1_gpio_table = {
-	.dev_id = "sa11x0-pcmcia.1",
-	.table = {
-		GPIO_LOOKUP("gpio", 12, "ready", GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP("gpio", 14, "detect", GPIO_ACTIVE_LOW),
-		GPIO_LOOKUP("gpio", 16, "reset", GPIO_ACTIVE_HIGH),
-		{ },
-	},
-};
-
-static void __init nanoengine_init(void)
-{
-	sa11x0_register_pcmcia(0, &nanoengine_pcmcia0_gpio_table);
-	sa11x0_register_pcmcia(1, &nanoengine_pcmcia1_gpio_table);
-	sa11x0_register_mtd(&nanoengine_flash_data, nanoengine_flash_resources,
-		ARRAY_SIZE(nanoengine_flash_resources));
-}
-
-MACHINE_START(NANOENGINE, "BSE nanoEngine")
-	.atag_offset	= 0x100,
-	.map_io		= nanoengine_map_io,
-	.nr_irqs	= SA1100_NR_IRQS,
-	.init_irq	= sa1100_init_irq,
-	.init_time	= sa1100_timer_init,
-	.init_machine	= nanoengine_init,
-	.init_late	= sa11x0_init_late,
-	.restart	= sa11x0_restart,
-MACHINE_END
diff --git a/arch/arm/mach-sa1100/pci-nanoengine.c b/arch/arm/mach-sa1100/pci-nanoengine.c
deleted file mode 100644
index 0791d11ff4d4..000000000000
--- a/arch/arm/mach-sa1100/pci-nanoengine.c
+++ /dev/null
@@ -1,191 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * linux/arch/arm/mach-sa1100/pci-nanoengine.c
- *
- * PCI functions for BSE nanoEngine PCI
- *
- * Copyright (C) 2010 Marcelo Roberto Jimenez <mroberto@cpti.cetuc.puc-rio.br>
- */
-#include <linux/kernel.h>
-#include <linux/irq.h>
-#include <linux/pci.h>
-
-#include <asm/mach/pci.h>
-#include <asm/mach-types.h>
-
-#include <mach/nanoengine.h>
-#include <mach/hardware.h>
-
-static void __iomem *nanoengine_pci_map_bus(struct pci_bus *bus,
-					    unsigned int devfn, int where)
-{
-	if (bus->number != 0 || (devfn >> 3) != 0)
-		return NULL;
-
-	return (void __iomem *)NANO_PCI_CONFIG_SPACE_VIRT +
-		((bus->number << 16) | (devfn << 8) | (where & ~3));
-}
-
-static struct pci_ops pci_nano_ops = {
-	.map_bus = nanoengine_pci_map_bus,
-	.read	= pci_generic_config_read32,
-	.write	= pci_generic_config_write32,
-};
-
-static int __init pci_nanoengine_map_irq(const struct pci_dev *dev, u8 slot,
-	u8 pin)
-{
-	return NANOENGINE_IRQ_GPIO_PCI;
-}
-
-static struct resource pci_io_ports =
-	DEFINE_RES_IO_NAMED(0x400, 0x400, "PCI IO");
-
-static struct resource pci_non_prefetchable_memory = {
-	.name	= "PCI non-prefetchable",
-	.start	= NANO_PCI_MEM_RW_PHYS,
-	/* nanoEngine documentation says there is a 1 Megabyte window here,
-	 * but PCI reports just 128 + 8 kbytes. */
-	.end	= NANO_PCI_MEM_RW_PHYS + NANO_PCI_MEM_RW_SIZE - 1,
-/*	.end	= NANO_PCI_MEM_RW_PHYS + SZ_128K + SZ_8K - 1,*/
-	.flags	= IORESOURCE_MEM,
-};
-
-/*
- * nanoEngine PCI reports 1 Megabyte of prefetchable memory, but it
- * overlaps with previously defined memory.
- *
- * Here is what happens:
- *
-# dmesg
-...
-pci 0000:00:00.0: [8086:1209] type 0 class 0x000200
-pci 0000:00:00.0: reg 10: [mem 0x00021000-0x00021fff]
-pci 0000:00:00.0: reg 14: [io  0x0000-0x003f]
-pci 0000:00:00.0: reg 18: [mem 0x00000000-0x0001ffff]
-pci 0000:00:00.0: reg 30: [mem 0x00000000-0x000fffff pref]
-pci 0000:00:00.0: supports D1 D2
-pci 0000:00:00.0: PME# supported from D0 D1 D2 D3hot
-pci 0000:00:00.0: PME# disabled
-PCI: bus0: Fast back to back transfers enabled
-pci 0000:00:00.0: BAR 6: can't assign mem pref (size 0x100000)
-pci 0000:00:00.0: BAR 2: assigned [mem 0x18600000-0x1861ffff]
-pci 0000:00:00.0: BAR 2: set to [mem 0x18600000-0x1861ffff] (PCI address [0x0-0x1ffff])
-pci 0000:00:00.0: BAR 0: assigned [mem 0x18620000-0x18620fff]
-pci 0000:00:00.0: BAR 0: set to [mem 0x18620000-0x18620fff] (PCI address [0x20000-0x20fff])
-pci 0000:00:00.0: BAR 1: assigned [io  0x0400-0x043f]
-pci 0000:00:00.0: BAR 1: set to [io  0x0400-0x043f] (PCI address [0x0-0x3f])
- *
- * On the other hand, if we do not request the prefetchable memory resource,
- * linux will alloc it first and the two non-prefetchable memory areas that
- * are our real interest will not be mapped. So we choose to map it to an
- * unused area. It gets recognized as expansion ROM, but becomes disabled.
- *
- * Here is what happens then:
- *
-# dmesg
-...
-pci 0000:00:00.0: [8086:1209] type 0 class 0x000200
-pci 0000:00:00.0: reg 10: [mem 0x00021000-0x00021fff]
-pci 0000:00:00.0: reg 14: [io  0x0000-0x003f]
-pci 0000:00:00.0: reg 18: [mem 0x00000000-0x0001ffff]
-pci 0000:00:00.0: reg 30: [mem 0x00000000-0x000fffff pref]
-pci 0000:00:00.0: supports D1 D2
-pci 0000:00:00.0: PME# supported from D0 D1 D2 D3hot
-pci 0000:00:00.0: PME# disabled
-PCI: bus0: Fast back to back transfers enabled
-pci 0000:00:00.0: BAR 6: assigned [mem 0x78000000-0x780fffff pref]
-pci 0000:00:00.0: BAR 2: assigned [mem 0x18600000-0x1861ffff]
-pci 0000:00:00.0: BAR 2: set to [mem 0x18600000-0x1861ffff] (PCI address [0x0-0x1ffff])
-pci 0000:00:00.0: BAR 0: assigned [mem 0x18620000-0x18620fff]
-pci 0000:00:00.0: BAR 0: set to [mem 0x18620000-0x18620fff] (PCI address [0x20000-0x20fff])
-pci 0000:00:00.0: BAR 1: assigned [io  0x0400-0x043f]
-pci 0000:00:00.0: BAR 1: set to [io  0x0400-0x043f] (PCI address [0x0-0x3f])
-
-# lspci -vv -s 0000:00:00.0
-00:00.0 Class 0200: Device 8086:1209 (rev 09)
-        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr+ Stepping- SERR+ FastB2B- DisINTx-
-        Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR+ <PERR+ INTx-
-        Latency: 0 (2000ns min, 14000ns max), Cache Line Size: 32 bytes
-        Interrupt: pin A routed to IRQ 0
-        Region 0: Memory at 18620000 (32-bit, non-prefetchable) [size=4K]
-        Region 1: I/O ports at 0400 [size=64]
-        Region 2: [virtual] Memory at 18600000 (32-bit, non-prefetchable) [size=128K]
-        [virtual] Expansion ROM at 78000000 [disabled] [size=1M]
-        Capabilities: [dc] Power Management version 2
-                Flags: PMEClk- DSI+ D1+ D2+ AuxCurrent=0mA PME(D0+,D1+,D2+,D3hot+,D3cold-)
-                Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=2 PME-
-        Kernel driver in use: e100
-        Kernel modules: e100
- *
- */
-static struct resource pci_prefetchable_memory = {
-	.name	= "PCI prefetchable",
-	.start	= 0x78000000,
-	.end	= 0x78000000 + NANO_PCI_MEM_RW_SIZE - 1,
-	.flags	= IORESOURCE_MEM  | IORESOURCE_PREFETCH,
-};
-
-static int __init pci_nanoengine_setup_resources(struct pci_sys_data *sys)
-{
-	if (request_resource(&ioport_resource, &pci_io_ports)) {
-		printk(KERN_ERR "PCI: unable to allocate io port region\n");
-		return -EBUSY;
-	}
-	if (request_resource(&iomem_resource, &pci_non_prefetchable_memory)) {
-		release_resource(&pci_io_ports);
-		printk(KERN_ERR "PCI: unable to allocate non prefetchable\n");
-		return -EBUSY;
-	}
-	if (request_resource(&iomem_resource, &pci_prefetchable_memory)) {
-		release_resource(&pci_io_ports);
-		release_resource(&pci_non_prefetchable_memory);
-		printk(KERN_ERR "PCI: unable to allocate prefetchable\n");
-		return -EBUSY;
-	}
-	pci_add_resource_offset(&sys->resources, &pci_io_ports, sys->io_offset);
-	pci_add_resource_offset(&sys->resources,
-				&pci_non_prefetchable_memory, sys->mem_offset);
-	pci_add_resource_offset(&sys->resources,
-				&pci_prefetchable_memory, sys->mem_offset);
-
-	return 1;
-}
-
-int __init pci_nanoengine_setup(int nr, struct pci_sys_data *sys)
-{
-	int ret = 0;
-
-	pcibios_min_io = 0;
-	pcibios_min_mem = 0;
-
-	if (nr == 0) {
-		sys->mem_offset = NANO_PCI_MEM_RW_PHYS;
-		sys->io_offset = 0x400;
-		ret = pci_nanoengine_setup_resources(sys);
-		/* Enable alternate memory bus master mode, see
-		 * "Intel StrongARM SA1110 Developer's Manual",
-		 * section 10.8, "Alternate Memory Bus Master Mode". */
-		GPDR = (GPDR & ~GPIO_MBREQ) | GPIO_MBGNT;
-		GAFR |= GPIO_MBGNT | GPIO_MBREQ;
-		TUCR |= TUCR_MBGPIO;
-	}
-
-	return ret;
-}
-
-static struct hw_pci nanoengine_pci __initdata = {
-	.map_irq		= pci_nanoengine_map_irq,
-	.nr_controllers		= 1,
-	.ops			= &pci_nano_ops,
-	.setup			= pci_nanoengine_setup,
-};
-
-static int __init nanoengine_pci_init(void)
-{
-	if (machine_is_nanoengine())
-		pci_common_init(&nanoengine_pci);
-	return 0;
-}
-
-subsys_initcall(nanoengine_pci_init);
diff --git a/arch/arm/mach-sa1100/pleb.c b/arch/arm/mach-sa1100/pleb.c
deleted file mode 100644
index b2b0c9fc18f7..000000000000
--- a/arch/arm/mach-sa1100/pleb.c
+++ /dev/null
@@ -1,148 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * linux/arch/arm/mach-sa1100/pleb.c
- */
-
-#include <linux/init.h>
-#include <linux/kernel.h>
-#include <linux/tty.h>
-#include <linux/ioport.h>
-#include <linux/platform_data/sa11x0-serial.h>
-#include <linux/platform_device.h>
-#include <linux/irq.h>
-#include <linux/io.h>
-#include <linux/mtd/partitions.h>
-#include <linux/smc91x.h>
-
-#include <mach/hardware.h>
-#include <asm/setup.h>
-#include <asm/mach-types.h>
-
-#include <asm/mach/arch.h>
-#include <asm/mach/map.h>
-#include <asm/mach/flash.h>
-#include <mach/irqs.h>
-
-#include "generic.h"
-
-
-/*
- * Ethernet IRQ mappings
- */
-
-#define PLEB_ETH0_P		(0x20000300)	/* Ethernet 0 in PCMCIA0 IO */
-#define PLEB_ETH0_V		(0xf6000300)
-
-#define GPIO_ETH0_IRQ		GPIO_GPIO(21)
-#define GPIO_ETH0_EN		GPIO_GPIO(26)
-
-#define IRQ_GPIO_ETH0_IRQ	IRQ_GPIO21
-
-static struct resource smc91x_resources[] = {
-	[0] = DEFINE_RES_MEM(PLEB_ETH0_P, 0x04000000),
-#if 0 /* Autoprobe instead, to get rising/falling edge characteristic right */
-	[1] = DEFINE_RES_IRQ(IRQ_GPIO_ETH0_IRQ),
-#endif
-};
-
-static struct smc91x_platdata smc91x_platdata = {
-	.flags = SMC91X_USE_16BIT | SMC91X_USE_8BIT | SMC91X_NOWAIT,
-};
-
-static struct platform_device smc91x_device = {
-	.name		= "smc91x",
-	.id		= 0,
-	.num_resources	= ARRAY_SIZE(smc91x_resources),
-	.resource	= smc91x_resources,
-	.dev = {
-		.platform_data  = &smc91x_platdata,
-	},
-};
-
-static struct platform_device *devices[] __initdata = {
-	&smc91x_device,
-};
-
-
-/*
- * Pleb's memory map
- * has flash memory (typically 4 or 8 meg) selected by
- * the two SA1100 lowest chip select outputs.
- */
-static struct resource pleb_flash_resources[] = {
-	[0] = DEFINE_RES_MEM(SA1100_CS0_PHYS, SZ_8M),
-	[1] = DEFINE_RES_MEM(SA1100_CS1_PHYS, SZ_8M),
-};
-
-
-static struct mtd_partition pleb_partitions[] = {
-	{
-		.name		= "blob",
-		.offset		= 0,
-		.size		= 0x00020000,
-	}, {
-		.name		= "kernel",
-		.offset		= MTDPART_OFS_APPEND,
-		.size		= 0x000e0000,
-	}, {
-		.name		= "rootfs",
-		.offset		= MTDPART_OFS_APPEND,
-		.size		= 0x00300000,
-	}
-};
-
-
-static struct flash_platform_data pleb_flash_data = {
-	.map_name = "cfi_probe",
-	.parts = pleb_partitions,
-	.nr_parts = ARRAY_SIZE(pleb_partitions),
-};
-
-
-static void __init pleb_init(void)
-{
-	sa11x0_register_mtd(&pleb_flash_data, pleb_flash_resources,
-			      ARRAY_SIZE(pleb_flash_resources));
-
-
-	platform_add_devices(devices, ARRAY_SIZE(devices));
-}
-
-
-static void __init pleb_map_io(void)
-{
-	sa1100_map_io();
-
-	sa1100_register_uart(0, 3);
-	sa1100_register_uart(1, 1);
-
-	GAFR |= (GPIO_UART_TXD | GPIO_UART_RXD);
-	GPDR |= GPIO_UART_TXD;
-	GPDR &= ~GPIO_UART_RXD;
-	PPAR |= PPAR_UPR;
-
-	/*
-	 * Fix expansion memory timing for network card
-	 */
-	MECR = ((2<<10) | (2<<5) | (2<<0));
-
-	/*
-	 * Enable the SMC ethernet controller
-	 */
-	GPDR |= GPIO_ETH0_EN;	/* set to output */
-	GPCR  = GPIO_ETH0_EN;	/* clear MCLK (enable smc) */
-
-	GPDR &= ~GPIO_ETH0_IRQ;
-
-	irq_set_irq_type(GPIO_ETH0_IRQ, IRQ_TYPE_EDGE_FALLING);
-}
-
-MACHINE_START(PLEB, "PLEB")
-	.map_io		= pleb_map_io,
-	.nr_irqs	= SA1100_NR_IRQS,
-	.init_irq	= sa1100_init_irq,
-	.init_time	= sa1100_timer_init,
-	.init_machine   = pleb_init,
-	.init_late	= sa11x0_init_late,
-	.restart	= sa11x0_restart,
-MACHINE_END
diff --git a/arch/arm/mach-sa1100/shannon.c b/arch/arm/mach-sa1100/shannon.c
deleted file mode 100644
index 351f891b4842..000000000000
--- a/arch/arm/mach-sa1100/shannon.c
+++ /dev/null
@@ -1,157 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * linux/arch/arm/mach-sa1100/shannon.c
- */
-
-#include <linux/init.h>
-#include <linux/device.h>
-#include <linux/gpio/machine.h>
-#include <linux/kernel.h>
-#include <linux/platform_data/sa11x0-serial.h>
-#include <linux/tty.h>
-#include <linux/mtd/mtd.h>
-#include <linux/mtd/partitions.h>
-#include <linux/regulator/fixed.h>
-#include <linux/regulator/machine.h>
-
-#include <video/sa1100fb.h>
-
-#include <mach/hardware.h>
-#include <asm/mach-types.h>
-#include <asm/setup.h>
-
-#include <asm/mach/arch.h>
-#include <asm/mach/flash.h>
-#include <asm/mach/map.h>
-#include <linux/platform_data/mfd-mcp-sa11x0.h>
-#include <mach/shannon.h>
-#include <mach/irqs.h>
-
-#include "generic.h"
-
-static struct mtd_partition shannon_partitions[] = {
-	{
-		.name		= "BLOB boot loader",
-		.offset		= 0,
-		.size		= 0x20000
-	},
-	{
-		.name		= "kernel",
-		.offset		= MTDPART_OFS_APPEND,
-		.size		= 0xe0000
-	},
-	{
-		.name		= "initrd",
-		.offset		= MTDPART_OFS_APPEND,	
-		.size		= MTDPART_SIZ_FULL
-	}
-};
-
-static struct flash_platform_data shannon_flash_data = {
-	.map_name	= "cfi_probe",
-	.parts		= shannon_partitions,
-	.nr_parts	= ARRAY_SIZE(shannon_partitions),
-};
-
-static struct resource shannon_flash_resource =
-	DEFINE_RES_MEM(SA1100_CS0_PHYS, SZ_4M);
-
-static struct mcp_plat_data shannon_mcp_data = {
-	.mccr0		= MCCR0_ADM,
-	.sclk_rate	= 11981000,
-};
-
-static struct sa1100fb_mach_info shannon_lcd_info = {
-	.pixclock	= 152500,	.bpp		= 8,
-	.xres		= 640,		.yres		= 480,
-
-	.hsync_len	= 4,		.vsync_len	= 3,
-	.left_margin	= 2,		.upper_margin	= 0,
-	.right_margin	= 1,		.lower_margin	= 0,
-
-	.sync		= FB_SYNC_HOR_HIGH_ACT | FB_SYNC_VERT_HIGH_ACT,
-
-	.lccr0		= LCCR0_Color | LCCR0_Dual | LCCR0_Pas,
-	.lccr3		= LCCR3_ACBsDiv(512),
-};
-
-static struct gpiod_lookup_table shannon_pcmcia0_gpio_table = {
-	.dev_id = "sa11x0-pcmcia.0",
-	.table = {
-		GPIO_LOOKUP("gpio", 24, "detect", GPIO_ACTIVE_LOW),
-		GPIO_LOOKUP("gpio", 26, "ready", GPIO_ACTIVE_HIGH),
-		{ },
-	},
-};
-
-static struct gpiod_lookup_table shannon_pcmcia1_gpio_table = {
-	.dev_id = "sa11x0-pcmcia.1",
-	.table = {
-		GPIO_LOOKUP("gpio", 25, "detect", GPIO_ACTIVE_LOW),
-		GPIO_LOOKUP("gpio", 27, "ready", GPIO_ACTIVE_HIGH),
-		{ },
-	},
-};
-
-static struct regulator_consumer_supply shannon_cf_vcc_consumers[] = {
-	REGULATOR_SUPPLY("vcc", "sa11x0-pcmcia.0"),
-	REGULATOR_SUPPLY("vcc", "sa11x0-pcmcia.1"),
-};
-
-static struct fixed_voltage_config shannon_cf_vcc_pdata __initdata = {
-	.supply_name = "cf-power",
-	.microvolts = 3300000,
-	.enabled_at_boot = 1,
-};
-
-static struct gpiod_lookup_table shannon_display_gpio_table = {
-	.dev_id = "sa11x0-fb",
-	.table = {
-		GPIO_LOOKUP("gpio", 22, "shannon-lcden", GPIO_ACTIVE_HIGH),
-		{ },
-	},
-};
-
-static void __init shannon_init(void)
-{
-	sa11x0_register_fixed_regulator(0, &shannon_cf_vcc_pdata,
-					shannon_cf_vcc_consumers,
-					ARRAY_SIZE(shannon_cf_vcc_consumers),
-					false);
-	sa11x0_register_pcmcia(0, &shannon_pcmcia0_gpio_table);
-	sa11x0_register_pcmcia(1, &shannon_pcmcia1_gpio_table);
-	sa11x0_ppc_configure_mcp();
-	gpiod_add_lookup_table(&shannon_display_gpio_table);
-	sa11x0_register_lcd(&shannon_lcd_info);
-	sa11x0_register_mtd(&shannon_flash_data, &shannon_flash_resource, 1);
-	sa11x0_register_mcp(&shannon_mcp_data);
-}
-
-static void __init shannon_map_io(void)
-{
-	sa1100_map_io();
-
-	sa1100_register_uart(0, 3);
-	sa1100_register_uart(1, 1);
-
-	Ser1SDCR0 |= SDCR0_SUS;
-	GAFR |= (GPIO_UART_TXD | GPIO_UART_RXD);
-	GPDR |= GPIO_UART_TXD | SHANNON_GPIO_CODEC_RESET;
-	GPDR &= ~GPIO_UART_RXD;
-	PPAR |= PPAR_UPR;
-
-	/* reset the codec */
-	GPCR = SHANNON_GPIO_CODEC_RESET;
-	GPSR = SHANNON_GPIO_CODEC_RESET;
-}
-
-MACHINE_START(SHANNON, "Shannon (AKA: Tuxscreen)")
-	.atag_offset	= 0x100,
-	.map_io		= shannon_map_io,
-	.nr_irqs	= SA1100_NR_IRQS,
-	.init_irq	= sa1100_init_irq,
-	.init_time	= sa1100_timer_init,
-	.init_machine	= shannon_init,
-	.init_late	= sa11x0_init_late,
-	.restart	= sa11x0_restart,
-MACHINE_END
diff --git a/arch/arm/mach-sa1100/simpad.c b/arch/arm/mach-sa1100/simpad.c
deleted file mode 100644
index c7fb9a73e4c5..000000000000
--- a/arch/arm/mach-sa1100/simpad.c
+++ /dev/null
@@ -1,423 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * linux/arch/arm/mach-sa1100/simpad.c
- */
-
-#include <linux/module.h>
-#include <linux/gpio/machine.h>
-#include <linux/init.h>
-#include <linux/kernel.h>
-#include <linux/tty.h>
-#include <linux/proc_fs.h>
-#include <linux/string.h>
-#include <linux/pm.h>
-#include <linux/platform_data/sa11x0-serial.h>
-#include <linux/platform_device.h>
-#include <linux/mfd/ucb1x00.h>
-#include <linux/mtd/mtd.h>
-#include <linux/mtd/partitions.h>
-#include <linux/io.h>
-#include <linux/gpio/driver.h>
-
-#include <mach/hardware.h>
-#include <asm/setup.h>
-#include <asm/irq.h>
-
-#include <asm/mach-types.h>
-#include <asm/mach/arch.h>
-#include <asm/mach/flash.h>
-#include <asm/mach/map.h>
-#include <linux/platform_data/mfd-mcp-sa11x0.h>
-#include <mach/simpad.h>
-#include <mach/irqs.h>
-
-#include <linux/serial_core.h>
-#include <linux/ioport.h>
-#include <linux/input.h>
-#include <linux/gpio_keys.h>
-#include <linux/leds.h>
-#include <linux/platform_data/i2c-gpio.h>
-
-#include "generic.h"
-
-/*
- * CS3 support
- */
-
-static long cs3_shadow;
-static spinlock_t cs3_lock;
-static struct gpio_chip cs3_gpio;
-
-long simpad_get_cs3_ro(void)
-{
-	return readl(CS3_BASE);
-}
-EXPORT_SYMBOL(simpad_get_cs3_ro);
-
-long simpad_get_cs3_shadow(void)
-{
-	return cs3_shadow;
-}
-EXPORT_SYMBOL(simpad_get_cs3_shadow);
-
-static void __simpad_write_cs3(void)
-{
-	writel(cs3_shadow, CS3_BASE);
-}
-
-void simpad_set_cs3_bit(int value)
-{
-	unsigned long flags;
-
-	spin_lock_irqsave(&cs3_lock, flags);
-	cs3_shadow |= value;
-	__simpad_write_cs3();
-	spin_unlock_irqrestore(&cs3_lock, flags);
-}
-EXPORT_SYMBOL(simpad_set_cs3_bit);
-
-void simpad_clear_cs3_bit(int value)
-{
-	unsigned long flags;
-
-	spin_lock_irqsave(&cs3_lock, flags);
-	cs3_shadow &= ~value;
-	__simpad_write_cs3();
-	spin_unlock_irqrestore(&cs3_lock, flags);
-}
-EXPORT_SYMBOL(simpad_clear_cs3_bit);
-
-static void cs3_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
-{
-	if (offset > 15)
-		return;
-	if (value)
-		simpad_set_cs3_bit(1 << offset);
-	else
-		simpad_clear_cs3_bit(1 << offset);
-};
-
-static int cs3_gpio_get(struct gpio_chip *chip, unsigned offset)
-{
-	if (offset > 15)
-		return !!(simpad_get_cs3_ro() & (1 << (offset - 16)));
-	return !!(simpad_get_cs3_shadow() & (1 << offset));
-};
-
-static int cs3_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
-{
-	if (offset > 15)
-		return 0;
-	return -EINVAL;
-};
-
-static int cs3_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
-	int value)
-{
-	if (offset > 15)
-		return -EINVAL;
-	cs3_gpio_set(chip, offset, value);
-	return 0;
-};
-
-static struct map_desc simpad_io_desc[] __initdata = {
-	{	/* MQ200 */
-		.virtual	=  0xf2800000,
-		.pfn		= __phys_to_pfn(0x4b800000),
-		.length		= 0x00800000,
-		.type		= MT_DEVICE
-	}, {	/* Simpad CS3 */
-		.virtual	= (unsigned long)CS3_BASE,
-		.pfn		= __phys_to_pfn(SA1100_CS3_PHYS),
-		.length		= 0x00100000,
-		.type		= MT_DEVICE
-	},
-};
-
-
-static void simpad_uart_pm(struct uart_port *port, u_int state, u_int oldstate)
-{
-	if (port->mapbase == (u_int)&Ser1UTCR0) {
-		if (state)
-		{
-			simpad_clear_cs3_bit(RS232_ON);
-			simpad_clear_cs3_bit(DECT_POWER_ON);
-		}else
-		{
-			simpad_set_cs3_bit(RS232_ON);
-			simpad_set_cs3_bit(DECT_POWER_ON);
-		}
-	}
-}
-
-static struct sa1100_port_fns simpad_port_fns __initdata = {
-	.pm	   = simpad_uart_pm,
-};
-
-
-static struct mtd_partition simpad_partitions[] = {
-	{
-		.name       = "SIMpad boot firmware",
-		.size       = 0x00080000,
-		.offset     = 0,
-		.mask_flags = MTD_WRITEABLE,
-	}, {
-		.name       = "SIMpad kernel",
-		.size       = 0x0010000,
-		.offset     = MTDPART_OFS_APPEND,
-	}, {
-		.name       = "SIMpad root jffs2",
-		.size       = MTDPART_SIZ_FULL,
-		.offset     = MTDPART_OFS_APPEND,
-	}
-};
-
-static struct flash_platform_data simpad_flash_data = {
-	.map_name    = "cfi_probe",
-	.parts       = simpad_partitions,
-	.nr_parts    = ARRAY_SIZE(simpad_partitions),
-};
-
-
-static struct resource simpad_flash_resources [] = {
-	DEFINE_RES_MEM(SA1100_CS0_PHYS, SZ_16M),
-	DEFINE_RES_MEM(SA1100_CS1_PHYS, SZ_16M),
-};
-
-static struct ucb1x00_plat_data simpad_ucb1x00_data = {
-	.gpio_base	= SIMPAD_UCB1X00_GPIO_BASE,
-};
-
-static struct mcp_plat_data simpad_mcp_data = {
-	.mccr0		= MCCR0_ADM,
-	.sclk_rate	= 11981000,
-	.codec_pdata	= &simpad_ucb1x00_data,
-};
-
-
-
-static void __init simpad_map_io(void)
-{
-	sa1100_map_io();
-
-	iotable_init(simpad_io_desc, ARRAY_SIZE(simpad_io_desc));
-
-	/* Initialize CS3 */
-	cs3_shadow = (EN1 | EN0 | LED2_ON | DISPLAY_ON |
-		RS232_ON | ENABLE_5V | RESET_SIMCARD | DECT_POWER_ON);
-	__simpad_write_cs3(); /* Spinlocks not yet initialized */
-
-        sa1100_register_uart_fns(&simpad_port_fns);
-	sa1100_register_uart(0, 3);  /* serial interface */
-	sa1100_register_uart(1, 1);  /* DECT             */
-
-	// Reassign UART 1 pins
-	GAFR |= GPIO_UART_TXD | GPIO_UART_RXD;
-	GPDR |= GPIO_UART_TXD | GPIO_LDD13 | GPIO_LDD15;
-	GPDR &= ~GPIO_UART_RXD;
-	PPAR |= PPAR_UPR;
-
-	/*
-	 * Set up registers for sleep mode.
-	 */
-
-
-	PWER = PWER_GPIO0| PWER_RTC;
-	PGSR = 0x818;
-	PCFR = 0;
-	PSDR = 0;
-
-}
-
-static void simpad_power_off(void)
-{
-	local_irq_disable();
-	cs3_shadow = SD_MEDIAQ;
-	__simpad_write_cs3(); /* Bypass spinlock here */
-
-	/* disable internal oscillator, float CS lines */
-	PCFR = (PCFR_OPDE | PCFR_FP | PCFR_FS);
-	/* enable wake-up on GPIO0 */
-	PWER = GFER = GRER = PWER_GPIO0;
-	/*
-	 * set scratchpad to zero, just in case it is used as a
-	 * restart address by the bootloader.
-	 */
-	PSPR = 0;
-	PGSR = 0;
-	/* enter sleep mode */
-	PMCR = PMCR_SF;
-	while(1);
-
-	local_irq_enable(); /* we won't ever call it */
-
-
-}
-
-/*
- * gpio_keys
-*/
-
-static struct gpio_keys_button simpad_button_table[] = {
-	{ KEY_POWER, IRQ_GPIO_POWER_BUTTON, 1, "power button" },
-};
-
-static struct gpio_keys_platform_data simpad_keys_data = {
-	.buttons = simpad_button_table,
-	.nbuttons = ARRAY_SIZE(simpad_button_table),
-};
-
-static struct platform_device simpad_keys = {
-	.name = "gpio-keys",
-	.dev = {
-		.platform_data = &simpad_keys_data,
-	},
-};
-
-static struct gpio_keys_button simpad_polled_button_table[] = {
-	{ KEY_PROG1, SIMPAD_UCB1X00_GPIO_PROG1, 1, "prog1 button" },
-	{ KEY_PROG2, SIMPAD_UCB1X00_GPIO_PROG2, 1, "prog2 button" },
-	{ KEY_UP,    SIMPAD_UCB1X00_GPIO_UP,    1, "up button" },
-	{ KEY_DOWN,  SIMPAD_UCB1X00_GPIO_DOWN,  1, "down button" },
-	{ KEY_LEFT,  SIMPAD_UCB1X00_GPIO_LEFT,  1, "left button" },
-	{ KEY_RIGHT, SIMPAD_UCB1X00_GPIO_RIGHT, 1, "right button" },
-};
-
-static struct gpio_keys_platform_data simpad_polled_keys_data = {
-	.buttons = simpad_polled_button_table,
-	.nbuttons = ARRAY_SIZE(simpad_polled_button_table),
-	.poll_interval = 50,
-};
-
-static struct platform_device simpad_polled_keys = {
-	.name = "gpio-keys-polled",
-	.dev = {
-		.platform_data = &simpad_polled_keys_data,
-	},
-};
-
-/*
- * GPIO LEDs
- */
-
-static struct gpio_led simpad_leds[] = {
-	{
-		.name = "simpad:power",
-		.gpio = SIMPAD_CS3_LED2_ON,
-		.active_low = 0,
-		.default_trigger = "default-on",
-	},
-};
-
-static struct gpio_led_platform_data simpad_led_data = {
-	.num_leds = ARRAY_SIZE(simpad_leds),
-	.leds = simpad_leds,
-};
-
-static struct platform_device simpad_gpio_leds = {
-	.name = "leds-gpio",
-	.id = 0,
-	.dev = {
-		.platform_data = &simpad_led_data,
-	},
-};
-
-/*
- * i2c
- */
-static struct gpiod_lookup_table simpad_i2c_gpiod_table = {
-	.dev_id = "i2c-gpio.0",
-	.table = {
-		GPIO_LOOKUP_IDX("gpio", 21, NULL, 0,
-				GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN),
-		GPIO_LOOKUP_IDX("gpio", 25, NULL, 1,
-				GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN),
-	},
-};
-
-static struct i2c_gpio_platform_data simpad_i2c_data = {
-	.udelay = 10,
-	.timeout = HZ,
-};
-
-static struct platform_device simpad_i2c = {
-	.name = "i2c-gpio",
-	.id = 0,
-	.dev = {
-		.platform_data = &simpad_i2c_data,
-	},
-};
-
-/*
- * MediaQ Video Device
- */
-static struct platform_device simpad_mq200fb = {
-	.name = "simpad-mq200",
-	.id   = 0,
-};
-
-static struct platform_device *devices[] __initdata = {
-	&simpad_keys,
-	&simpad_polled_keys,
-	&simpad_mq200fb,
-	&simpad_gpio_leds,
-	&simpad_i2c,
-};
-
-/* Compact Flash */
-static struct gpiod_lookup_table simpad_cf_gpio_table = {
-	.dev_id = "sa11x0-pcmcia",
-	.table = {
-		GPIO_LOOKUP("gpio", GPIO_CF_IRQ, "cf-ready", GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP("gpio", GPIO_CF_CD, "cf-detect", GPIO_ACTIVE_HIGH),
-		{ },
-	},
-};
-
-
-static int __init simpad_init(void)
-{
-	int ret;
-
-	spin_lock_init(&cs3_lock);
-
-	cs3_gpio.label = "simpad_cs3";
-	cs3_gpio.base = SIMPAD_CS3_GPIO_BASE;
-	cs3_gpio.ngpio = 24;
-	cs3_gpio.set = cs3_gpio_set;
-	cs3_gpio.get = cs3_gpio_get;
-	cs3_gpio.direction_input = cs3_gpio_direction_input;
-	cs3_gpio.direction_output = cs3_gpio_direction_output;
-	ret = gpiochip_add_data(&cs3_gpio, NULL);
-	if (ret)
-		printk(KERN_WARNING "simpad: Unable to register cs3 GPIO device");
-
-	pm_power_off = simpad_power_off;
-
-	sa11x0_register_pcmcia(-1, &simpad_cf_gpio_table);
-	sa11x0_ppc_configure_mcp();
-	sa11x0_register_mtd(&simpad_flash_data, simpad_flash_resources,
-			      ARRAY_SIZE(simpad_flash_resources));
-	sa11x0_register_mcp(&simpad_mcp_data);
-
-	gpiod_add_lookup_table(&simpad_i2c_gpiod_table);
-	ret = platform_add_devices(devices, ARRAY_SIZE(devices));
-	if(ret)
-		printk(KERN_WARNING "simpad: Unable to register mq200 framebuffer device");
-
-	return 0;
-}
-
-arch_initcall(simpad_init);
-
-
-MACHINE_START(SIMPAD, "Simpad")
-	/* Maintainer: Holger Freyther */
-	.atag_offset	= 0x100,
-	.map_io		= simpad_map_io,
-	.nr_irqs	= SA1100_NR_IRQS,
-	.init_irq	= sa1100_init_irq,
-	.init_late	= sa11x0_init_late,
-	.init_time	= sa1100_timer_init,
-	.restart	= sa11x0_restart,
-MACHINE_END
diff --git a/drivers/cpufreq/sa1110-cpufreq.c b/drivers/cpufreq/sa1110-cpufreq.c
index 1a83c8678a63..bb7f591a8b05 100644
--- a/drivers/cpufreq/sa1110-cpufreq.c
+++ b/drivers/cpufreq/sa1110-cpufreq.c
@@ -344,14 +344,8 @@ static int __init sa1110_clk_init(void)
 	if (!name[0]) {
 		if (machine_is_assabet())
 			name = "TC59SM716-CL3";
-		if (machine_is_pt_system3())
-			name = "K4S641632D";
-		if (machine_is_h3100())
-			name = "KM416S4030CT";
 		if (machine_is_jornada720() || machine_is_h3600())
 			name = "K4S281632B-1H";
-		if (machine_is_nanoengine())
-			name = "MT48LC8M16A2TG-75";
 	}
 
 	sdram = sa1110_find_sdram(name);
diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index d655a135a886..ad469b8985bd 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -672,7 +672,7 @@ config MFD_INTEL_PMC_BXT
 
 config MFD_IPAQ_MICRO
 	bool "Atmel Micro ASIC (iPAQ h3100/h3600/h3700) Support"
-	depends on SA1100_H3100 || SA1100_H3600
+	depends on SA1100_H3600
 	select MFD_CORE
 	help
 	  Select this to get support for the Microcontroller found in
diff --git a/drivers/pcmcia/sa1100_generic.c b/drivers/pcmcia/sa1100_generic.c
index c2b6e828c2c6..89d4ba58c891 100644
--- a/drivers/pcmcia/sa1100_generic.c
+++ b/drivers/pcmcia/sa1100_generic.c
@@ -98,12 +98,9 @@ static struct pcmcia_low_level sa11x0_cf_ops = {
 int __init pcmcia_collie_init(struct device *dev);
 
 static int (*sa11x0_pcmcia_legacy_hw_init[])(struct device *dev) = {
-#if defined(CONFIG_SA1100_H3100) || defined(CONFIG_SA1100_H3600)
+#ifdef CONFIG_SA1100_H3600
 	pcmcia_h3600_init,
 #endif
-#ifdef CONFIG_SA1100_SIMPAD
-	pcmcia_simpad_init,
-#endif
 #ifdef CONFIG_SA1100_COLLIE
        pcmcia_collie_init,
 #endif
diff --git a/drivers/pcmcia/sa1100_h3600.c b/drivers/pcmcia/sa1100_h3600.c
index a91222bc3824..10cb99c20a7f 100644
--- a/drivers/pcmcia/sa1100_h3600.c
+++ b/drivers/pcmcia/sa1100_h3600.c
@@ -156,7 +156,7 @@ int pcmcia_h3600_init(struct device *dev)
 {
 	int ret = -ENODEV;
 
-	if (machine_is_h3600() || machine_is_h3100())
+	if (machine_is_h3600())
 		ret = sa11xx_drv_pcmcia_probe(dev, &h3600_pcmcia_ops, 0, 2);
 
 	return ret;
diff --git a/drivers/pcmcia/sa1111_generic.c b/drivers/pcmcia/sa1111_generic.c
index 71bf1b279a5a..2a67e33fb5f0 100644
--- a/drivers/pcmcia/sa1111_generic.c
+++ b/drivers/pcmcia/sa1111_generic.c
@@ -212,10 +212,6 @@ static int pcmcia_probe(struct sa1111_dev *dev)
 	writel_relaxed(PCCR_S0_FLT | PCCR_S1_FLT, base + PCCR);
 
 	ret = -ENODEV;
-#ifdef CONFIG_SA1100_BADGE4
-	if (machine_is_badge4())
-		ret = pcmcia_badge4_init(dev);
-#endif
 #ifdef CONFIG_SA1100_JORNADA720
 	if (machine_is_jornada720())
 		ret = pcmcia_jornada720_init(dev);
diff --git a/drivers/usb/host/ohci-sa1111.c b/drivers/usb/host/ohci-sa1111.c
index 75c2b28b3379..aca0338a2983 100644
--- a/drivers/usb/host/ohci-sa1111.c
+++ b/drivers/usb/host/ohci-sa1111.c
@@ -125,10 +125,7 @@ static int sa1111_start_hc(struct sa1111_dev *dev)
 
 	dev_dbg(&dev->dev, "starting SA-1111 OHCI USB Controller\n");
 
-	if (machine_is_xp860() ||
-	    machine_is_assabet() ||
-	    machine_is_pfs168() ||
-	    machine_is_badge4())
+	if (machine_is_assabet())
 		usb_rst = USB_RESET_PWRSENSELOW | USB_RESET_PWRCTRLLOW;
 
 	/*
diff --git a/drivers/video/fbdev/sa1100fb.c b/drivers/video/fbdev/sa1100fb.c
index 017c8efe8267..b1b8ccdbac4a 100644
--- a/drivers/video/fbdev/sa1100fb.c
+++ b/drivers/video/fbdev/sa1100fb.c
@@ -184,7 +184,6 @@
 
 #include <mach/hardware.h>
 #include <asm/mach-types.h>
-#include <mach/shannon.h>
 
 /*
  * Complain if VAR is out of range.
-- 
2.29.2

