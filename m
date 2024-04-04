Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29966897F9C
	for <lists+dri-devel@lfdr.de>; Thu,  4 Apr 2024 07:16:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 273D21131F1;
	Thu,  4 Apr 2024 05:16:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sakura.ysato.name (ik1-413-38519.vs.sakura.ne.jp
 [153.127.30.23])
 by gabe.freedesktop.org (Postfix) with ESMTP id D01D61131DF
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Apr 2024 05:15:52 +0000 (UTC)
Received: from SIOS1075.ysato.name (al128006.dynamic.ppp.asahi-net.or.jp
 [111.234.128.6])
 by sakura.ysato.name (Postfix) with ESMTPSA id C5BF61C1045;
 Thu,  4 Apr 2024 14:15:49 +0900 (JST)
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: linux-sh@vger.kernel.org
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>,
 Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
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
 Heiko Stuebner <heiko.stuebner@cherry.de>, Shawn Guo <shawnguo@kernel.org>,
 Sebastian Reichel <sre@kernel.org>, Chris Morgan <macromorgan@hotmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 David Rientjes <rientjes@google.com>, Hyeonggon Yoo <42.hyeyoo@gmail.com>,
 Vlastimil Babka <vbabka@suse.cz>, Baoquan He <bhe@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Javier Martinez Canillas <javierm@redhat.com>, Guo Ren <guoren@kernel.org>,
 Azeem Shaikh <azeemshaikh38@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, Jacky Huang <ychuang3@nuvoton.com>,
 Herve Codina <herve.codina@bootlin.com>,
 Manikanta Guntupalli <manikanta.guntupalli@amd.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>, Sergey Shtylyov <s.shtylyov@omp.ru>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-ide@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-pci@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-fbdev@vger.kernel.org
Subject: [RESEND v7 30/37] sh: add RTS7751R2D Plus DTS
Date: Thu,  4 Apr 2024 14:14:41 +0900
Message-Id: <fee2dd20a6e8903560682ee1b4f57abe89f2c3ad.1712207606.git.ysato@users.sourceforge.jp>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1712207606.git.ysato@users.sourceforge.jp>
References: <cover.1712207606.git.ysato@users.sourceforge.jp>
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

Renesas RTS7751R2D Plus devicetree.

Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
---
 arch/sh/boot/dts/rts7751r2dplus.dts | 169 ++++++++++++++++++++++++++++
 1 file changed, 169 insertions(+)
 create mode 100644 arch/sh/boot/dts/rts7751r2dplus.dts

diff --git a/arch/sh/boot/dts/rts7751r2dplus.dts b/arch/sh/boot/dts/rts7751r2dplus.dts
new file mode 100644
index 000000000000..c3aca9316c76
--- /dev/null
+++ b/arch/sh/boot/dts/rts7751r2dplus.dts
@@ -0,0 +1,169 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Source for the Renesas RTS7751R2D Plus
+ */
+
+/dts-v1/;
+
+#include "sh7751r.dtsi"
+#include <dt-bindings/display/sm501.h>
+
+/ {
+	model = "Renesas RTS7715R2D Plus";
+	compatible = "renesas,rts7751r2d", "renesas,sh7751r";
+
+	aliases {
+		serial0 = &scif1;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@c000000 {
+		device_type = "memory";
+		reg = <0x0c000000 0x4000000>;
+	};
+
+	r2dintc: interrupt-controller@a4000000 {
+		compatible = "renesas,sh7751-irl-ext";
+		reg = <0xa4000000 0x02>;
+		interrupt-controller;
+		#address-cells = <0>;
+		#interrupt-cells = <2>;
+		/*
+		 * b15: 12 - TP
+		 * b14:  9 - PCI INTA
+		 * b13: 10 - PCI INTB
+		 * b12:  3 - PCI INTC
+		 * b11:  0 - PCI INTD
+		 * b10:  4 - SM501
+		 * b9:   1 - CF IDE
+		 * b8:   2 - CF CD
+		 * b7:   8 - SDCARD
+		 * b6:   5 - KEY
+		 * b5:   6 - RTC ALARM
+		 * b4:   7 - RTC T
+		 * b3: unassigned
+		 * b2: unassigned
+		 * b1: unassigned
+		 * b0:  11  -EXT
+		 */
+		renesas,enable-reg = <12 9 10 3 0 4 1 2 8 5 6 7 15 15 15 11>;
+	};
+
+	display@0 {
+		compatible = "smi,sm501";
+		reg = <0x10000000 0x03e00000
+		       0x13e00000 0x00200000>;
+		interrupt-parent = <&r2dintc>;
+		interrupts = <4 IRQ_TYPE_LEVEL_LOW>;
+		mode = "640x480-16@60";
+		little-endian;
+		smi,devices = "usb-host", "uart0";
+		swap-fb-endian;
+
+		crt {
+			smi,flags = "use-init-done",
+				    "disable-at-exit",
+				    "use-hwcursor",
+				    "use-hwaccel";
+		};
+
+		panel {
+			bpp = <16>;
+			edid = [00 ff ff ff ff ff ff 00 00 00 00 00 00 00 00 00
+				00 00 01 04 00 00 00 00 00 00 00 00 00 00 00 00
+				00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+				00 00 00 00 00 00 f0 0a 80 fb 20 e0 25 10 32 60
+				02 00 00 00 00 00 00 06 00 00 00 00 00 00 00 00
+				00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+				00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+				00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 bd];
+			smi,flags = "use-init-done",
+				    "disable-at-exit",
+				    "use-hwcursor",
+				    "use-hwaccel";
+		};
+		misc-timing {
+			ex = <SM501_MISC_TIMING_EX_HOLD_16>;
+			xc = <SM501_MISC_TIMING_XC_INTERNAL>;
+			usb-over-current-detect-disable;
+		};
+		misc-control {
+			pad = <SM501_MISC_CONTROL_PAD_24>;
+			usbclk = <SM501_MISC_CONTROL_USBCLK_XTAL>;
+			sh-ready-low;
+		};
+	};
+
+	compact-flash@b4001000 {
+		compatible = "renesas,rts7751r2d-ata", "ata-generic";
+		reg = <0xb4001000 0x0e>, <0xb400080c 2>;
+		reg-shift = <1>;
+		interrupt-parent = <&r2dintc>;
+		interrupts = <1 IRQ_TYPE_LEVEL_LOW>;
+	};
+
+	flash@0 {
+		compatible = "cfi-flash";
+		reg = <0x00000000 0x02000000>;
+		device-width = <2>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		partition@0 {
+			label = "U-Boot";
+			reg = <0x00000000 0x00040000>;
+		};
+
+		partition@1 {
+			label = "Environemt";
+			reg = <0x00040000 0x00040000>;
+		};
+
+		partition@2 {
+			label = "Kernel";
+			reg = <0x00080000 0x001c0000>;
+		};
+
+		partition@3 {
+			label = "Flash_FS";
+			reg = <0x00240000 0x00dc0000>;
+		};
+	};
+};
+
+&extal {
+	clock-frequency = <22222222>;
+};
+
+&cpg {
+	renesas,mode = <5>;
+};
+
+&scif1 {
+	status = "okay";
+};
+
+&pcic {
+	ranges = <0x02000000 0 0xfd000000 0xfd000000 0 0x01000000>,
+		 <0x01000000 0 0x00000000 0xfe240000 0 0x00040000>;
+	dma-ranges = <0x01000000 0 0xab000000 0xab000000 0 0x00000001>,
+		     <0x02000000 0 0x0c000000 0x0c000000 0 0x04000000>,
+		     <0x02000000 0 0xd0000000 0xd0000000 0 0x00000001>;
+	interrupt-map = <0x0000 0 0 1 &r2dintc 9  IRQ_TYPE_LEVEL_LOW>,
+			<0x0000 0 0 2 &r2dintc 10 IRQ_TYPE_LEVEL_LOW>,
+			<0x0000 0 0 3 &r2dintc 3  IRQ_TYPE_LEVEL_LOW>,
+			<0x0000 0 0 4 &r2dintc 0  IRQ_TYPE_LEVEL_LOW>,
+			<0x0800 0 0 1 &r2dintc 10 IRQ_TYPE_LEVEL_LOW>,
+			<0x0800 0 0 2 &r2dintc 3  IRQ_TYPE_LEVEL_LOW>,
+			<0x0800 0 0 3 &r2dintc 0  IRQ_TYPE_LEVEL_LOW>,
+			<0x0800 0 0 4 &r2dintc 9  IRQ_TYPE_LEVEL_LOW>,
+			<0x1000 0 0 1 &r2dintc 3  IRQ_TYPE_LEVEL_LOW>,
+			<0x1000 0 0 2 &r2dintc 0  IRQ_TYPE_LEVEL_LOW>,
+			<0x1000 0 0 3 &r2dintc 9  IRQ_TYPE_LEVEL_LOW>,
+			<0x1000 0 0 4 &r2dintc 10 IRQ_TYPE_LEVEL_LOW>;
+	interrupt-map-mask = <0x1800 0 0 7>;
+	status = "okay";
+};
-- 
2.39.2

