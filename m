Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A4A82807C
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 09:24:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72E5A10E397;
	Tue,  9 Jan 2024 08:23:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sakura.ysato.name (ik1-413-38519.vs.sakura.ne.jp
 [153.127.30.23])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1CF8910E387
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 08:23:45 +0000 (UTC)
Received: from SIOS1075.ysato.name (ZM005235.ppp.dion.ne.jp [222.8.5.235])
 by sakura.ysato.name (Postfix) with ESMTPSA id DF4CA1C0268;
 Tue,  9 Jan 2024 17:23:42 +0900 (JST)
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: linux-sh@vger.kernel.org
Subject: [DO NOT MERGE v6 02/37] sh: Kconfig unified OF supported targets.
Date: Tue,  9 Jan 2024 17:22:59 +0900
Message-Id: <e5d965a1ba1447466c4a70c95b1e3aa8c1aebe4b.1704788539.git.ysato@users.sourceforge.jp>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1704788539.git.ysato@users.sourceforge.jp>
References: <cover.1704788539.git.ysato@users.sourceforge.jp>
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
Cc: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 linux-fbdev@vger.kernel.org, Rich Felker <dalias@libc.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Bin Meng <bmeng@tinylab.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-pci@vger.kernel.org,
 Jacky Huang <ychuang3@nuvoton.com>, Palmer Dabbelt <palmer@rivosinc.com>,
 linux-kernel@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>,
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
 Vlastimil Babka <vbabka@suse.cz>, Yang Xiwen <forbidden405@foxmail.com>,
 Sergey Shtylyov <s.shtylyov@omp.ru>, Baoquan He <bhe@redhat.com>,
 linux-ide@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Sebastian Reichel <sre@kernel.org>, Azeem Shaikh <azeemshaikh38@gmail.com>,
 linux-renesas-soc@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Targets that support OF should be treated as one board.

Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
---
 arch/sh/Kconfig        |  1 +
 arch/sh/boards/Kconfig | 24 ++++++++++++++----------
 2 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
index 7500521b2b98..ecca128c15fa 100644
--- a/arch/sh/Kconfig
+++ b/arch/sh/Kconfig
@@ -710,6 +710,7 @@ choice
 	prompt "Kernel command line"
 	optional
 	default CMDLINE_OVERWRITE
+	depends on !OF || USE_BUILTIN_DTB
 	help
 	  Setting this option allows the kernel command line arguments
 	  to be set.
diff --git a/arch/sh/boards/Kconfig b/arch/sh/boards/Kconfig
index 109bec4dad94..e7e52779ef62 100644
--- a/arch/sh/boards/Kconfig
+++ b/arch/sh/boards/Kconfig
@@ -19,16 +19,9 @@ config SH_DEVICE_TREE
 	select TIMER_OF
 	select COMMON_CLK
 	select GENERIC_CALIBRATE_DELAY
-
-config SH_JCORE_SOC
-	bool "J-Core SoC"
-	select SH_DEVICE_TREE
-	select CLKSRC_JCORE_PIT
-	select JCORE_AIC
-	depends on CPU_J2
-	help
-	  Select this option to include drivers core components of the
-	  J-Core SoC, including interrupt controllers and timers.
+	select GENERIC_IRQ_CHIP
+	select SYS_SUPPORTS_PCI
+	select GENERIC_PCI_IOMAP if PCI
 
 config SH_SOLUTION_ENGINE
 	bool "SolutionEngine"
@@ -293,6 +286,7 @@ config SH_LANDISK
 	bool "LANDISK"
 	depends on CPU_SUBTYPE_SH7751R
 	select HAVE_PCI
+	select SYS_SUPPORTS_PCI
 	help
 	  I-O DATA DEVICE, INC. "LANDISK Series" support.
 
@@ -369,6 +363,16 @@ config SH_APSH4AD0A
 	help
 	  Select AP-SH4AD-0A if configuring for an ALPHAPROJECT AP-SH4AD-0A.
 
+config SH_OF_BOARD
+	bool "General Open Firmware boards"
+	select SH_DEVICE_TREE
+	select CLKSRC_JCORE_PIT if CPU_J2
+	select JCORE_AIC if CPU_J2
+	select HAVE_PCI if CPU_SUBTYPE_SH7751R
+	help
+	  This board means general OF supported targets.
+
+
 source "arch/sh/boards/mach-r2d/Kconfig"
 source "arch/sh/boards/mach-highlander/Kconfig"
 source "arch/sh/boards/mach-sdk7780/Kconfig"
-- 
2.39.2

