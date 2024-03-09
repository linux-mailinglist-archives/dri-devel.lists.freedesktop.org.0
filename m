Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83EC48772C6
	for <lists+dri-devel@lfdr.de>; Sat,  9 Mar 2024 19:16:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DC511122C4;
	Sat,  9 Mar 2024 18:16:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Whi9m4oH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58C151122AA
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Mar 2024 18:15:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 08A4ACE09AD;
 Sat,  9 Mar 2024 18:15:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3C782C4AF4F;
 Sat,  9 Mar 2024 18:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710008150;
 bh=oteOorL3FqzdofvOQQ1VXiLXazZ8X7yRtPyx+uh5rEU=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=Whi9m4oHq9aoMjaQ2vkvVB7pn6w8IyzvFIFmFc6+iGNxgFrPM6i0AHMkJWDU2QMj9
 fpjn8g5Elb7NC1VTqSYkvdyWVXSjUF53nX0R8x/x6okTi1s1F7ysDbaoL+wN1/bRmZ
 lsCBGuNRz6VedTKSbAOF67M3OLn9nm+06mNXB9NIPAMeVp5FnmB7isYB9jnp4pJDLU
 Znwet0NDo/cMVmwDKqm1VeSOpQ4WWbXMaJJ1N3PVXURx3YzvWQQwzr5yIyFVI9TlRb
 XVgTI4WyIhsk+ztGerjNFLtaVcdUEiQ5iz23TH/oj8VEtHFOCe4lti0mXy3PIyjQ50
 Wzo+6xJYYrcEQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 2B482C54E67;
 Sat,  9 Mar 2024 18:15:50 +0000 (UTC)
From: Sam Ravnborg via B4 Relay <devnull+sam.ravnborg.org@kernel.org>
Date: Sat, 09 Mar 2024 19:15:46 +0100
Subject: [PATCH v2 25/28] sparc32: Drop config SPARC_LEON
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240309-sunset-v2-25-f09912574d2c@ravnborg.org>
References: <20240309-sunset-v2-0-f09912574d2c@ravnborg.org>
In-Reply-To: <20240309-sunset-v2-0-f09912574d2c@ravnborg.org>
To: "David S. Miller" <davem@davemloft.net>, 
 Arnd Bergmann <arnd@kernel.org>, Andreas Larsson <andreas@gaisler.com>
Cc: Helge Deller <deller@gmx.de>, Randy Dunlap <rdunlap@infradead.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 Kjetil Oftedal <oftedal@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alan Stern <stern@rowland.harvard.edu>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, sparclinux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-sound@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1710008145; l=4537;
 i=sam@ravnborg.org; s=20230107; h=from:subject:message-id;
 bh=x6fXD2u/meCzQH4Fww92bNdCJhGF0eHHgImzcjy0qVw=; =?utf-8?q?b=3D4WBva/PWjmdJ?=
 =?utf-8?q?st11SBptKR3dL87dHQCXr0uhIFn93aC/c/9NlqVcAA9f+FQYRUNpDOqO68S8h/uq?=
 npyYFl9UDrfM2at7pFHFk0WL6vGFOsZyIwzjfMahgGKRmYKyh4PM
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sam Ravnborg <sam@ravnborg.org>

The only supported sparc32 CPU is LEON, so there is no need for a
config option to select it.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Acked-by: Arnd Bergmann <arnd@kernel.org>
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org> #For the USB stuff
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: Andreas Larsson <andreas@gaisler.com>
---
 arch/sparc/Kconfig                   | 27 +++++++++------------------
 arch/sparc/configs/sparc32_defconfig |  1 -
 drivers/usb/host/Kconfig             |  2 +-
 drivers/usb/host/ehci-hcd.c          |  4 ++--
 drivers/usb/host/uhci-hcd.c          |  2 +-
 5 files changed, 13 insertions(+), 23 deletions(-)

diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
index 19ee7bc0b2ea..e4e2548c1f1f 100644
--- a/arch/sparc/Kconfig
+++ b/arch/sparc/Kconfig
@@ -9,6 +9,10 @@ config 64BIT
 
 	  Say yes to build a 64-bit kernel - formerly known as sparc64
 	  Say no to build a 32-bit kernel - formerly known as sparc
+	  The 32-bit kernel target the synthesizable LEON SPARC processor.
+	  LEON is a part of the GRLIB collection of IP cores that are
+	  distributed under GPL. GRLIB can be downloaded from www.gaisler.com.
+	  You can download a sparc-linux cross-compilation toolchain at www.gaisler.com.
 
 config SPARC
 	bool
@@ -62,6 +66,10 @@ config SPARC32
 	select HAVE_UID16
 	select LOCK_MM_AND_FIND_VMA
 	select OLD_SIGACTION
+	select USB_EHCI_BIG_ENDIAN_MMIO
+	select USB_EHCI_BIG_ENDIAN_DESC
+	select USB_UHCI_BIG_ENDIAN_MMIO
+	select USB_UHCI_BIG_ENDIAN_DESC
 	select ZONE_DMA
 
 config SPARC64
@@ -344,22 +352,6 @@ config SERIAL_CONSOLE
 
 	  If unsure, say N.
 
-config SPARC_LEON
-	bool "Sparc Leon processor family"
-	depends on SPARC32
-	select USB_EHCI_BIG_ENDIAN_MMIO
-	select USB_EHCI_BIG_ENDIAN_DESC
-	select USB_UHCI_BIG_ENDIAN_MMIO
-	select USB_UHCI_BIG_ENDIAN_DESC
-	help
-	  If you say Y here if you are running on a SPARC-LEON processor.
-	  The LEON processor is a synthesizable VHDL model of the
-	  SPARC-v8 standard. LEON is  part of the GRLIB collection of
-	  IP cores that are distributed under GPL. GRLIB can be downloaded
-	  from www.gaisler.com. You can download a sparc-linux cross-compilation
-	  toolchain at www.gaisler.com.
-
-if SPARC_LEON
 menu "U-Boot options"
 
 config UBOOT_LOAD_ADDR
@@ -390,7 +382,6 @@ config UBOOT_ENTRY_ADDR
 	 Kernel.
 
 endmenu
-endif
 
 endmenu
 
@@ -412,7 +403,7 @@ config SUN_LDOMS
 
 config LEON_PCI
 	bool
-	depends on PCI && SPARC_LEON
+	depends on PCI && SPARC32
 	default y
 
 config SPARC_GRPCI1
diff --git a/arch/sparc/configs/sparc32_defconfig b/arch/sparc/configs/sparc32_defconfig
index 71273fc578bf..dfd326f20876 100644
--- a/arch/sparc/configs/sparc32_defconfig
+++ b/arch/sparc/configs/sparc32_defconfig
@@ -10,7 +10,6 @@ CONFIG_BLK_DEV_INITRD=y
 # CONFIG_RD_ZSTD is not set
 CONFIG_SMP=y
 CONFIG_HZ_100=y
-CONFIG_SPARC_LEON=y
 CONFIG_SUN_OPENPROMFS=y
 CONFIG_SUN_OPENPROMIO=y
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index 4448d0ab06f0..c5f94c70482f 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -595,7 +595,7 @@ config USB_UHCI_HCD
 
 config USB_UHCI_SUPPORT_NON_PCI_HC
 	bool
-	default y if (SPARC_LEON || USB_UHCI_PLATFORM)
+	default y if (SPARC32 || USB_UHCI_PLATFORM)
 
 config USB_UHCI_PLATFORM
 	bool
diff --git a/drivers/usb/host/ehci-hcd.c b/drivers/usb/host/ehci-hcd.c
index 802bfafb1012..5011bc8348bb 100644
--- a/drivers/usb/host/ehci-hcd.c
+++ b/drivers/usb/host/ehci-hcd.c
@@ -1329,7 +1329,7 @@ MODULE_LICENSE ("GPL");
 #include "ehci-xilinx-of.c"
 #endif
 
-#ifdef CONFIG_SPARC_LEON
+#ifdef CONFIG_SPARC32
 #include "ehci-grlib.c"
 #endif
 
@@ -1343,7 +1343,7 @@ static struct platform_driver * const platform_drivers[] = {
 #ifdef CONFIG_XPS_USB_HCD_XILINX
 	&ehci_hcd_xilinx_of_driver,
 #endif
-#ifdef CONFIG_SPARC_LEON
+#ifdef CONFIG_SPARC32
 	&ehci_grlib_driver,
 #endif
 };
diff --git a/drivers/usb/host/uhci-hcd.c b/drivers/usb/host/uhci-hcd.c
index fd2408b553cf..7cb820963988 100644
--- a/drivers/usb/host/uhci-hcd.c
+++ b/drivers/usb/host/uhci-hcd.c
@@ -846,7 +846,7 @@ static const char hcd_name[] = "uhci_hcd";
 #define	PCI_DRIVER		uhci_pci_driver
 #endif
 
-#ifdef CONFIG_SPARC_LEON
+#ifdef CONFIG_SPARC32
 #include "uhci-grlib.c"
 #define PLATFORM_DRIVER		uhci_grlib_driver
 #endif

-- 
2.34.1

