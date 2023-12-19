Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE2D8192E0
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 23:03:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5569610E523;
	Tue, 19 Dec 2023 22:03:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D1F010E267
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 22:03:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 2F799B81ADA;
 Tue, 19 Dec 2023 22:03:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 80296C433C7;
 Tue, 19 Dec 2023 22:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703023395;
 bh=YFya8cjl2YMIZ2BGNXSyO7VFh6vdNDD29XFJtjD3Qgs=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=mlI+2wMhej0GqAm3pIx6nJwRQaXL0Ljc6Qqy33Dv1a79jja2BJkbLICVksM4Midah
 xIVIhjMCLKUooQl+tQiQ65fWInRLOoKwD44xHxCncGB3GXOYmGRxZg+S1IdcovXgpa
 VE718Flncfbv5UEU6gTAHzFXzoLAaVUV8t+ZyufhtIvvoE1FpE3/py5rm1aVeWuewu
 ONpAPgh2vB9kuoIRRsYcaYxxQPD2JgUYW1CLIf24dgSgxDHA3OAvFbkH8Ds9LEQSxe
 CdDqismitNHTrzCR+td52u6XdFtkpGkdBku+pEEJGG9uV5v5O4hEa03fo69Y+X8vUz
 TqzbTuBx1aZqg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 68938C46CD2;
 Tue, 19 Dec 2023 22:03:15 +0000 (UTC)
From: Sam Ravnborg via B4 Relay <devnull+sam.ravnborg.org@kernel.org>
Date: Tue, 19 Dec 2023 23:03:06 +0100
Subject: [PATCH 01/27] sparc32: Update defconfig to LEON SMP
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231219-sam-sparc32-sunset-v3-v1-1-64bb44b598c5@ravnborg.org>
References: <20231219-sam-sparc32-sunset-v3-v1-0-64bb44b598c5@ravnborg.org>
In-Reply-To: <20231219-sam-sparc32-sunset-v3-v1-0-64bb44b598c5@ravnborg.org>
To: "David S. Miller" <davem@davemloft.net>, 
 Arnd Bergmann <arnd@kernel.org>, Andreas Larsson <andreas@gaisler.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1703023392; l=5892;
 i=sam@ravnborg.org; s=20230107; h=from:subject:message-id;
 bh=4xRMgdzxVUR69RuJPbYdmx8fpxa4KGV3jSh8dHTx33M=; =?utf-8?q?b=3DUt+SgWiuqIJ1?=
 =?utf-8?q?fcBO5uM2ZyyLaIVPVtNKbLLeU5qWiEXJIGyUHCGi//nT7YLbhGwE+4rIVG8RJW8P?=
 QuDhe6DTDywG73/E+3rudhmc4LolHLjrJFMs9Uc7BHNCRelDBQ1J
X-Developer-Key: i=sam@ravnborg.org; a=ed25519;
 pk=R0+pqV7BRYOAeOIGkyOrSNke7arx5y3LkEuNi37YEyU=
X-Endpoint-Received: by B4 Relay for sam@ravnborg.org/20230107 with auth_id=22
X-Original-From: Sam Ravnborg <sam@ravnborg.org>
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
Reply-To: sam@ravnborg.org
Cc: linux-fbdev@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 linux-usb@vger.kernel.org, linux-sound@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, dri-devel@lists.freedesktop.org,
 Jaroslav Kysela <perex@perex.cz>, Alan Stern <stern@rowland.harvard.edu>,
 Alexander Viro <viro@zeniv.linux.org.uk>, sparclinux@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sam Ravnborg <sam@ravnborg.org>

This is a copy of the leon_smp defconfig found in
gaisler-buildroot-2023.02-1.0.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: Andreas Larsson <andreas@gaisler.com>
---
 arch/sparc/configs/sparc32_defconfig | 171 +++++++++++++++++++----------------
 1 file changed, 91 insertions(+), 80 deletions(-)

diff --git a/arch/sparc/configs/sparc32_defconfig b/arch/sparc/configs/sparc32_defconfig
index 5010164de3e4..71273fc578bf 100644
--- a/arch/sparc/configs/sparc32_defconfig
+++ b/arch/sparc/configs/sparc32_defconfig
@@ -1,97 +1,108 @@
+CONFIG_DEFAULT_HOSTNAME="leon"
 CONFIG_SYSVIPC=y
-CONFIG_POSIX_MQUEUE=y
 CONFIG_LOG_BUF_SHIFT=14
-CONFIG_SYSFS_DEPRECATED_V2=y
 CONFIG_BLK_DEV_INITRD=y
-# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
-# CONFIG_BLK_DEV_BSG is not set
-CONFIG_PCI=y
-CONFIG_SUN_OPENPROMFS=m
-CONFIG_BINFMT_MISC=m
+# CONFIG_RD_BZIP2 is not set
+# CONFIG_RD_LZMA is not set
+# CONFIG_RD_XZ is not set
+# CONFIG_RD_LZO is not set
+# CONFIG_RD_LZ4 is not set
+# CONFIG_RD_ZSTD is not set
+CONFIG_SMP=y
+CONFIG_HZ_100=y
+CONFIG_SPARC_LEON=y
+CONFIG_SUN_OPENPROMFS=y
+CONFIG_SUN_OPENPROMIO=y
+# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
+CONFIG_BINFMT_MISC=y
+# CONFIG_COMPACTION is not set
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
-CONFIG_XFRM_USER=m
-CONFIG_NET_KEY=m
 CONFIG_INET=y
 CONFIG_IP_PNP=y
-CONFIG_IP_PNP_DHCP=y
-CONFIG_INET_AH=y
-CONFIG_INET_ESP=y
-CONFIG_INET_IPCOMP=y
-CONFIG_INET6_AH=m
-CONFIG_INET6_ESP=m
-CONFIG_INET6_IPCOMP=m
-CONFIG_IPV6_TUNNEL=m
-CONFIG_NET_PKTGEN=m
-CONFIG_BLK_DEV_LOOP=m
-CONFIG_BLK_DEV_CRYPTOLOOP=m
-CONFIG_BLK_DEV_RAM=y
-CONFIG_SCSI=y
-CONFIG_BLK_DEV_SD=y
-CONFIG_BLK_DEV_SR=m
-CONFIG_CHR_DEV_SG=m
-CONFIG_SCSI_QLOGICPTI=m
-CONFIG_SCSI_SUNESP=y
+# CONFIG_WIRELESS is not set
+CONFIG_UEVENT_HELPER=y
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_NETDEVICES=y
-CONFIG_DUMMY=m
-CONFIG_NET_ETHERNET=y
-CONFIG_MII=m
-CONFIG_SUNLANCE=y
-CONFIG_HAPPYMEAL=m
-CONFIG_SUNBMAC=m
-CONFIG_SUNQE=m
+CONFIG_GRETH=y
+# CONFIG_NET_VENDOR_ALACRITECH is not set
+# CONFIG_NET_VENDOR_AMAZON is not set
+# CONFIG_NET_VENDOR_AMD is not set
+# CONFIG_NET_VENDOR_AQUANTIA is not set
+# CONFIG_NET_VENDOR_ARC is not set
+# CONFIG_NET_VENDOR_BROADCOM is not set
+# CONFIG_NET_VENDOR_CADENCE is not set
+# CONFIG_NET_VENDOR_CAVIUM is not set
+# CONFIG_NET_VENDOR_CORTINA is not set
+# CONFIG_NET_VENDOR_EZCHIP is not set
+# CONFIG_NET_VENDOR_GOOGLE is not set
+# CONFIG_NET_VENDOR_HUAWEI is not set
+# CONFIG_NET_VENDOR_INTEL is not set
+# CONFIG_NET_VENDOR_MARVELL is not set
+# CONFIG_NET_VENDOR_MICREL is not set
+# CONFIG_NET_VENDOR_MICROCHIP is not set
+# CONFIG_NET_VENDOR_MICROSEMI is not set
+# CONFIG_NET_VENDOR_NI is not set
+# CONFIG_NET_VENDOR_NATSEMI is not set
+# CONFIG_NET_VENDOR_NETRONOME is not set
+# CONFIG_NET_VENDOR_PENSANDO is not set
+# CONFIG_NET_VENDOR_QUALCOMM is not set
+# CONFIG_NET_VENDOR_RENESAS is not set
+# CONFIG_NET_VENDOR_ROCKER is not set
+# CONFIG_NET_VENDOR_SAMSUNG is not set
+# CONFIG_NET_VENDOR_SEEQ is not set
+# CONFIG_NET_VENDOR_SOLARFLARE is not set
+# CONFIG_NET_VENDOR_SOCIONEXT is not set
+# CONFIG_NET_VENDOR_STMICRO is not set
+# CONFIG_NET_VENDOR_SUN is not set
+# CONFIG_NET_VENDOR_SYNOPSYS is not set
+# CONFIG_NET_VENDOR_VIA is not set
+# CONFIG_NET_VENDOR_WIZNET is not set
+# CONFIG_NET_VENDOR_XILINX is not set
+CONFIG_BROADCOM_PHY=y
+CONFIG_CICADA_PHY=y
+CONFIG_DAVICOM_PHY=y
+CONFIG_ICPLUS_PHY=y
+CONFIG_LXT_PHY=y
+CONFIG_LSI_ET1011C_PHY=y
+CONFIG_MARVELL_PHY=y
+CONFIG_MICREL_PHY=y
+CONFIG_NATIONAL_PHY=y
+CONFIG_QSEMI_PHY=y
+CONFIG_REALTEK_PHY=y
+CONFIG_SMSC_PHY=y
+CONFIG_STE10XP=y
+CONFIG_VITESSE_PHY=y
 # CONFIG_WLAN is not set
-CONFIG_INPUT_JOYDEV=m
-CONFIG_INPUT_EVDEV=m
-CONFIG_INPUT_EVBUG=m
-CONFIG_KEYBOARD_ATKBD=m
-CONFIG_KEYBOARD_SUNKBD=m
-CONFIG_MOUSE_PS2=m
-CONFIG_MOUSE_SERIAL=m
-CONFIG_SERIO=m
+# CONFIG_INPUT_KEYBOARD is not set
+# CONFIG_INPUT_MOUSE is not set
 # CONFIG_SERIO_I8042 is not set
 CONFIG_SERIAL_SUNZILOG=y
 CONFIG_SERIAL_SUNZILOG_CONSOLE=y
-CONFIG_SERIAL_SUNSU=y
-CONFIG_SERIAL_SUNSU_CONSOLE=y
-CONFIG_SPI=y
-CONFIG_SPI_XILINX=m
-CONFIG_SPI_XILINX_PLTFM=m
-CONFIG_SUN_OPENPROMIO=m
-CONFIG_EXT2_FS=y
-CONFIG_EXT2_FS_XATTR=y
-CONFIG_EXT2_FS_POSIX_ACL=y
-CONFIG_EXT2_FS_SECURITY=y
-CONFIG_AUTOFS_FS=m
-CONFIG_ISO9660_FS=m
+CONFIG_SERIAL_GRLIB_GAISLER_APBUART=y
+CONFIG_SERIAL_GRLIB_GAISLER_APBUART_CONSOLE=y
+# CONFIG_HW_RANDOM is not set
+# CONFIG_HWMON is not set
+# CONFIG_HID_GENERIC is not set
+# CONFIG_USB_SUPPORT is not set
+# CONFIG_RTC_HCTOSYS is not set
+# CONFIG_RTC_INTF_SYSFS is not set
+# CONFIG_RTC_INTF_PROC is not set
+# CONFIG_RTC_INTF_DEV is not set
+# CONFIG_VIRTIO_MENU is not set
+# CONFIG_VHOST_MENU is not set
+# CONFIG_IOMMU_SUPPORT is not set
+CONFIG_FSCACHE=y
 CONFIG_PROC_KCORE=y
-CONFIG_ROMFS_FS=m
+CONFIG_TMPFS=y
+# CONFIG_MISC_FILESYSTEMS is not set
 CONFIG_NFS_FS=y
+CONFIG_NFS_V4=y
 CONFIG_ROOT_NFS=y
-CONFIG_RPCSEC_GSS_KRB5=m
+CONFIG_NFS_FSCACHE=y
 CONFIG_NLS=y
-CONFIG_DEBUG_KERNEL=y
-CONFIG_DETECT_HUNG_TASK=y
-# CONFIG_SCHED_DEBUG is not set
-CONFIG_KGDB=y
-CONFIG_KGDB_TESTS=y
-CONFIG_CRYPTO_NULL=m
-CONFIG_CRYPTO_ECB=m
-CONFIG_CRYPTO_PCBC=m
-CONFIG_CRYPTO_MD4=y
-CONFIG_CRYPTO_MICHAEL_MIC=m
-CONFIG_CRYPTO_SHA256=m
-CONFIG_CRYPTO_SHA512=m
-CONFIG_CRYPTO_AES=m
-CONFIG_CRYPTO_ARC4=m
-CONFIG_CRYPTO_BLOWFISH=m
-CONFIG_CRYPTO_CAST5=m
-CONFIG_CRYPTO_CAST6=m
-CONFIG_CRYPTO_SERPENT=m
-CONFIG_CRYPTO_TWOFISH=m
-# CONFIG_CRYPTO_ANSI_CPRNG is not set
-# CONFIG_CRYPTO_HW is not set
-CONFIG_LIBCRC32C=m
+CONFIG_MAGIC_SYSRQ=y
+CONFIG_DEBUG_FS=y
+# CONFIG_RUNTIME_TESTING_MENU is not set

-- 
2.34.1

