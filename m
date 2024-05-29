Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CB08D2F70
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 10:04:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1492D8902A;
	Wed, 29 May 2024 08:04:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sakura.ysato.name (ik1-413-38519.vs.sakura.ne.jp
 [153.127.30.23])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1652B11344A
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 08:01:33 +0000 (UTC)
Received: from SIOS1075.ysato.name (al128006.dynamic.ppp.asahi-net.or.jp
 [111.234.128.6])
 by sakura.ysato.name (Postfix) with ESMTPSA id 85A111C032B;
 Wed, 29 May 2024 17:01:31 +0900 (JST)
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
Subject: [DO NOT MERGE v8 02/36] sh: Kconfig unified OF supported targets.
Date: Wed, 29 May 2024 17:00:48 +0900
Message-Id: <5226282870c6ea790cc4af2c723bae46658d4611.1716965617.git.ysato@users.sourceforge.jp>
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

Targets that support OF should be treated as one board.

Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
---
 arch/sh/Kconfig        |  1 +
 arch/sh/boards/Kconfig | 23 +++++++++++++----------
 2 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
index 5e6a3ead51fb..d6704c57f9dc 100644
--- a/arch/sh/Kconfig
+++ b/arch/sh/Kconfig
@@ -711,6 +711,7 @@ config ROMIMAGE_MMCIF
 choice
 	prompt "Kernel command line"
 	default CMDLINE_OVERWRITE
+	depends on !OF || USE_BUILTIN_DTB
 	help
 	  Setting this option allows the kernel command line arguments
 	  to be set.
diff --git a/arch/sh/boards/Kconfig b/arch/sh/boards/Kconfig
index 109bec4dad94..46387fd040ad 100644
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
 
@@ -369,6 +363,15 @@ config SH_APSH4AD0A
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
 source "arch/sh/boards/mach-r2d/Kconfig"
 source "arch/sh/boards/mach-highlander/Kconfig"
 source "arch/sh/boards/mach-sdk7780/Kconfig"
-- 
2.39.2

