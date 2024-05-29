Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 206CD8D2F56
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 10:03:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 727B510E5ED;
	Wed, 29 May 2024 08:03:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sakura.ysato.name (ik1-413-38519.vs.sakura.ne.jp
 [153.127.30.23])
 by gabe.freedesktop.org (Postfix) with ESMTP id ADDE211343D
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 08:02:33 +0000 (UTC)
Received: from SIOS1075.ysato.name (al128006.dynamic.ppp.asahi-net.or.jp
 [111.234.128.6])
 by sakura.ysato.name (Postfix) with ESMTPSA id 62ED41C1072;
 Wed, 29 May 2024 17:02:31 +0900 (JST)
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: linux-sh@vger.kernel.org
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>,
 Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Thomas Gleixner <tglx@linutronix.de>, Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Lee Jones <lee@kernel.org>, Helge Deller <deller@gmx.de>,
 Heiko Stuebner <heiko.stuebner@cherry.de>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>, Sebastian Reichel <sre@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Masahiro Yamada <masahiroy@kernel.org>, Baoquan He <bhe@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Azeem Shaikh <azeemshaikh38@gmail.com>, Guo Ren <guoren@kernel.org>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Herve Codina <herve.codina@bootlin.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Anup Patel <apatel@ventanamicro.com>, Jacky Huang <ychuang3@nuvoton.com>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Sam Ravnborg <sam@ravnborg.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Sergey Shtylyov <s.shtylyov@omp.ru>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-ide@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-pci@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-fbdev@vger.kernel.org
Subject: [DO NOT MERGE v8 35/36] sh: LANDISK OF defconfig
Date: Wed, 29 May 2024 17:01:21 +0900
Message-Id: <30e2315f695880b07192fa6ec5a09f1645d4520f.1716965617.git.ysato@users.sourceforge.jp>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1716965617.git.ysato@users.sourceforge.jp>
References: <cover.1716965617.git.ysato@users.sourceforge.jp>
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

Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
---
 arch/sh/configs/landisk-of_defconfig | 102 +++++++++++++++++++++++++++
 1 file changed, 102 insertions(+)
 create mode 100644 arch/sh/configs/landisk-of_defconfig

diff --git a/arch/sh/configs/landisk-of_defconfig b/arch/sh/configs/landisk-of_defconfig
new file mode 100644
index 000000000000..580fbaabc557
--- /dev/null
+++ b/arch/sh/configs/landisk-of_defconfig
@@ -0,0 +1,102 @@
+CONFIG_SYSVIPC=y
+CONFIG_LOG_BUF_SHIFT=14
+CONFIG_KEXEC=y
+CONFIG_CPU_SUBTYPE_SH7751R=y
+CONFIG_MEMORY_START=0x0c000000
+CONFIG_SH_OF_BOARD=y
+CONFIG_HEARTBEAT=y
+CONFIG_CMDLINE_BOOTLOADER=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_MODULE_FORCE_UNLOAD=y
+CONFIG_FLATMEM_MANUAL=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_IP_ADVANCED_ROUTER=y
+CONFIG_IP_PNP=y
+# CONFIG_IPV6 is not set
+CONFIG_NETFILTER=y
+CONFIG_ATALK=m
+CONFIG_PCI=y
+CONFIG_PCI_SH7751=y
+CONFIG_PCCARD=y
+CONFIG_YENTA=y
+CONFIG_UEVENT_HELPER=y
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_BLK_DEV_RAM=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_BLK_DEV_SR=y
+# CONFIG_BLK_DEV_BSG is not set
+CONFIG_ATA=y
+CONFIG_PATA_ARTOP=y
+CONFIG_PATA_OF_PLATFORM=y
+CONFIG_ATA_GENERIC=y
+CONFIG_MD=y
+CONFIG_BLK_DEV_MD=m
+CONFIG_MD_RAID0=m
+CONFIG_MD_RAID1=m
+CONFIG_NETDEVICES=y
+CONFIG_TUN=m
+CONFIG_8139CP=y
+CONFIG_USB_PEGASUS=m
+CONFIG_USB_RTL8150=m
+# CONFIG_INPUT_KEYBOARD is not set
+# CONFIG_INPUT_MOUSE is not set
+# CONFIG_SERIO is not set
+CONFIG_SERIAL_SH_SCI=y
+CONFIG_HW_RANDOM=y
+CONFIG_SOUND=m
+CONFIG_HID_A4TECH=m
+CONFIG_HID_BELKIN=m
+CONFIG_HID_CHERRY=m
+CONFIG_HID_CYPRESS=m
+CONFIG_HID_EZKEY=m
+CONFIG_HID_GYRATION=m
+CONFIG_HID_MICROSOFT=m
+CONFIG_HID_MONTEREY=m
+CONFIG_HID_PANTHERLORD=m
+CONFIG_HID_PETALYNX=m
+CONFIG_HID_SAMSUNG=m
+CONFIG_HID_SUNPLUS=m
+CONFIG_USB_HID=m
+CONFIG_USB=y
+CONFIG_USB_MON=y
+CONFIG_USB_EHCI_HCD=y
+# CONFIG_USB_EHCI_TT_NEWSCHED is not set
+CONFIG_USB_OHCI_HCD=y
+CONFIG_USB_PRINTER=m
+CONFIG_USB_STORAGE=m
+CONFIG_USB_STORAGE_DATAFAB=m
+CONFIG_USB_STORAGE_FREECOM=m
+CONFIG_USB_STORAGE_ISD200=m
+CONFIG_USB_STORAGE_SDDR09=m
+CONFIG_USB_STORAGE_SDDR55=m
+CONFIG_USB_STORAGE_JUMPSHOT=m
+CONFIG_USB_SERIAL=m
+CONFIG_USB_SERIAL_FTDI_SIO=m
+CONFIG_USB_SERIAL_PL2303=m
+CONFIG_USB_EMI62=m
+CONFIG_USB_EMI26=m
+CONFIG_USB_SISUSBVGA=m
+CONFIG_RENESAS_SH7751_INTC=y
+CONFIG_RENESAS_SH7751IRL_INTC=y
+CONFIG_EXT2_FS=y
+CONFIG_EXT3_FS=y
+CONFIG_REISERFS_FS=y
+CONFIG_ISO9660_FS=m
+CONFIG_MSDOS_FS=y
+CONFIG_VFAT_FS=y
+CONFIG_TMPFS=y
+CONFIG_ROMFS_FS=y
+CONFIG_UFS_FS=m
+CONFIG_NFS_FS=m
+CONFIG_NFSD=m
+CONFIG_NLS_CODEPAGE_437=y
+CONFIG_NLS_CODEPAGE_932=y
+CONFIG_INIT_STACK_NONE=y
+CONFIG_CRC_T10DIF=y
+CONFIG_DEBUG_KERNEL=y
+# CONFIG_FTRACE is not set
+CONFIG_SH_STANDARD_BIOS=y
-- 
2.39.2

