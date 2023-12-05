Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D064A8059BE
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 17:17:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C681A10E5BE;
	Tue,  5 Dec 2023 16:16:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sakura.ysato.name (ik1-413-38519.vs.sakura.ne.jp
 [153.127.30.23])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1387010E4D7
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 09:55:33 +0000 (UTC)
Received: from SIOS1075.ysato.name (ZM005235.ppp.dion.ne.jp [222.8.5.235])
 by sakura.ysato.name (Postfix) with ESMTPSA id 8A2C81C0868;
 Tue,  5 Dec 2023 18:47:02 +0900 (JST)
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: linux-sh@vger.kernel.org
Subject: [DO NOT MERGE v5 30/37] sh: add RTS7751R2D Plus DTS
Date: Tue,  5 Dec 2023 18:45:49 +0900
Message-Id: <9a32654249d357d3147e824a8c56321b7a486326.1701768028.git.ysato@users.sourceforge.jp>
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

Renesas RTS7751R2D Plus devicetree.

Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
---
 arch/sh/boot/dts/rts7751r2dplus.dts | 157 ++++++++++++++++++++++++++++
 1 file changed, 157 insertions(+)
 create mode 100644 arch/sh/boot/dts/rts7751r2dplus.dts

diff --git a/arch/sh/boot/dts/rts7751r2dplus.dts b/arch/sh/boot/dts/rts7751r2dplus.dts
new file mode 100644
index 000000000000..4fb75e814615
--- /dev/null
+++ b/arch/sh/boot/dts/rts7751r2dplus.dts
@@ -0,0 +1,157 @@
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
+	r2dintc: interrupt_controller@a4000000 {
+		compatible = "renesas,sh7751-irl-ext";
+		reg = <0xa4000000 0x02>;
+		interrupt-controller;
+		#address-cells = <0>;
+		#size-cells = <0>;
+		#interrupt-cells = <1>;
+		renesas,width = <16>;
+		renesas,enable-bit = <0 11>,		/* PCI INTD */
+				     <1 9>,		/* CF IDE */
+				     <2 8>,		/* CF CD */
+				     <3 12>,		/* PCI INTC */
+				     <4 10>,		/* SM501 */
+				     <5 6>,		/* KEY */
+				     <6 5>,		/* RTC ALARM */
+				     <7 4>,		/* RTC T */
+				     <8 7>,		/* SDCARD */
+				     <9 14>,		/* PCI INTA */
+				     <10 13>,		/* PCI INTB */
+				     <11 0>,		/* EXT */
+				     <12 15>;		/* TP */
+	};
+
+	display@0 {
+		compatible = "smi,sm501";
+		reg = <0x10000000 0x03e00000
+		       0x13e00000 0x00200000>;
+		interrupt-parent = <&r2dintc>;
+		interrupts = <4>;
+		mode = "640x480-16@60";
+		little-endian;
+		smi,devices = <(SM501_USE_USB_HOST | SM501_USE_UART0)>;
+		interrupt-name = "sm501";
+		swap-fb-endian;
+
+		crt {
+			smi,flags = <(SM501FB_FLAG_USE_INIT_MODE |
+				      SM501FB_FLAG_DISABLE_AT_EXIT |
+				      SM501FB_FLAG_USE_HWCURSOR |
+				      SM501FB_FLAG_USE_HWACCEL)>;
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
+			smi,flags = <(SM501FB_FLAG_USE_INIT_MODE |
+				      SM501FB_FLAG_DISABLE_AT_EXIT |
+				      SM501FB_FLAG_USE_HWCURSOR |
+				      SM501FB_FLAG_USE_HWACCEL)>;
+		};
+	};
+
+	compact-flash@b4001000 {
+		compatible = "renesas,rts7751r2d-ata", "ata-generic";
+		reg = <0xb4001000 0x0e>, <0xb400080c 2>;
+		reg-shift = <1>;
+		interrupt-parent = <&r2dintc>;
+		interrupts = <1>;
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
+&xtal {
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
+	renesas,bcr1 = <0x40080000>;
+	renesas,intm = <0x0000c3ff>;
+	renesas,aintm = <0x0000380f>;
+	renesas,config = <1 0xfb900047>, <4 0xab000001>;
+	renesas,mcrmask = <0x40000004>;
+
+	interrupt-map = <0x0000 0 0 1 &r2dintc 9>,
+			<0x0000 0 0 2 &r2dintc 10>,
+			<0x0000 0 0 3 &r2dintc 3>,
+			<0x0000 0 0 4 &r2dintc 0>,
+			<0x0800 0 0 1 &r2dintc 10>,
+			<0x0800 0 0 2 &r2dintc 3>,
+			<0x0800 0 0 3 &r2dintc 0>,
+			<0x0800 0 0 4 &r2dintc 9>,
+			<0x1000 0 0 1 &r2dintc 3>,
+			<0x1000 0 0 2 &r2dintc 0>,
+			<0x1000 0 0 3 &r2dintc 9>,
+			<0x1000 0 0 4 &r2dintc 10>;
+			interrupt-map-mask = <0x1800 0 0 7>;
+	status = "okay";
+};
-- 
2.39.2

