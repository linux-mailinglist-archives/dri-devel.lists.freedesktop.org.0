Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5788059BC
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 17:17:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B542410E5B6;
	Tue,  5 Dec 2023 16:16:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sakura.ysato.name (ik1-413-38519.vs.sakura.ne.jp
 [153.127.30.23])
 by gabe.freedesktop.org (Postfix) with ESMTP id E16A410E4D2
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 09:55:32 +0000 (UTC)
Received: from SIOS1075.ysato.name (ZM005235.ppp.dion.ne.jp [222.8.5.235])
 by sakura.ysato.name (Postfix) with ESMTPSA id E9BD81C0952;
 Tue,  5 Dec 2023 18:47:14 +0900 (JST)
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: linux-sh@vger.kernel.org
Subject: [DO NOT MERGE v5 36/37] sh: LANDISK OF defconfig
Date: Tue,  5 Dec 2023 18:45:55 +0900
Message-Id: <a90801f6cb679a0b3aaf874557dd175e69419b91.1701768028.git.ysato@users.sourceforge.jp>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1701768028.git.ysato@users.sourceforge.jp>
References: <cover.1701768028.git.ysato@users.sourceforge.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 05 Dec 2023 16:16:42 +0000
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
Cc: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 linux-fbdev@vger.kernel.org, Rich Felker <dalias@libc.org>,
 Herve Codina <herve.codina@bootlin.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Bin Meng <bmeng@tinylab.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-pci@vger.kernel.org,
 Jacky Huang <ychuang3@nuvoton.com>, Palmer Dabbelt <palmer@rivosinc.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
 Lee Jones <lee@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Hyeonggon Yoo <42.hyeyoo@gmail.com>, Jiri Slaby <jirislaby@kernel.org>,
 linux-clk@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Jonathan Corbet <corbet@lwn.net>,
 Helge Deller <deller@gmx.de>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-serial@vger.kernel.org,
 David Rientjes <rientjes@google.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Maxime Ripard <mripard@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Chris Morgan <macromorgan@hotmail.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, Sergey Shtylyov <s.shtylyov@omp.ru>,
 Baoquan He <bhe@redhat.com>, linux-ide@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 linux-kernel@vger.kernel.org, Azeem Shaikh <azeemshaikh38@gmail.com>,
 linux-renesas-soc@vger.kernel.org, Tom Rix <trix@redhat.com>,
 Damien Le Moal <dlemoal@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
---
 arch/sh/configs/landisk-of_defconfig | 111 +++++++++++++++++++++++++++
 1 file changed, 111 insertions(+)
 create mode 100644 arch/sh/configs/landisk-of_defconfig

diff --git a/arch/sh/configs/landisk-of_defconfig b/arch/sh/configs/landisk-of_defconfig
new file mode 100644
index 000000000000..406de7d7b8a2
--- /dev/null
+++ b/arch/sh/configs/landisk-of_defconfig
@@ -0,0 +1,111 @@
+CONFIG_SYSVIPC=y
+CONFIG_LOG_BUF_SHIFT=14
+CONFIG_NAMESPACES=y
+CONFIG_EXPERT=y
+CONFIG_KEXEC=y
+CONFIG_CPU_SUBTYPE_SH7751R=y
+CONFIG_MEMORY_START=0x0c000000
+CONFIG_SH_OF_BOARD=y
+CONFIG_HEARTBEAT=y
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
+CONFIG_MD_LINEAR=m
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
+CONFIG_SERIAL_SH_SCI_EARLYCON=y
+CONFIG_HW_RANDOM=y
+CONFIG_SOUND=m
+CONFIG_HID_A4TECH=m
+CONFIG_HID_BELKIN=m
+CONFIG_HID_CHERRY=m
+CONFIG_HID_CHICONY=m
+CONFIG_HID_CYPRESS=m
+CONFIG_HID_EZKEY=m
+CONFIG_HID_GYRATION=m
+CONFIG_HID_ITE=y
+CONFIG_HID_KENSINGTON=y
+CONFIG_HID_REDRAGON=y
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
+CONFIG_NTFS_FS=m
+CONFIG_NTFS_RW=y
+CONFIG_TMPFS=y
+CONFIG_ROMFS_FS=y
+CONFIG_UFS_FS=m
+CONFIG_NFS_FS=m
+CONFIG_NFSD=m
+CONFIG_NLS_CODEPAGE_437=y
+CONFIG_NLS_CODEPAGE_932=y
+CONFIG_INIT_STACK_NONE=y
+CONFIG_CRC_T10DIF=y
+CONFIG_DEBUG_MEMORY_INIT=y
+# CONFIG_FTRACE is not set
+CONFIG_SH_STANDARD_BIOS=y
-- 
2.39.2

