Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 956CC8059C6
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 17:17:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 590C610E5C2;
	Tue,  5 Dec 2023 16:16:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sakura.ysato.name (ik1-413-38519.vs.sakura.ne.jp
 [153.127.30.23])
 by gabe.freedesktop.org (Postfix) with ESMTP id EBBAF10E4D3
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 09:55:32 +0000 (UTC)
Received: from SIOS1075.ysato.name (ZM005235.ppp.dion.ne.jp [222.8.5.235])
 by sakura.ysato.name (Postfix) with ESMTPSA id 8AD121C0781;
 Tue,  5 Dec 2023 18:47:00 +0900 (JST)
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: linux-sh@vger.kernel.org
Subject: [DO NOT MERGE v5 29/37] sh: SH7751R SoC Internal peripheral
 definition dtsi.
Date: Tue,  5 Dec 2023 18:45:48 +0900
Message-Id: <635f3b8c4a9063346bf40332c53d3e134f67fb1c.1701768028.git.ysato@users.sourceforge.jp>
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

SH7751R internal peripherals device tree.

Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
---
 arch/sh/boot/dts/sh7751r.dtsi | 150 ++++++++++++++++++++++++++++++++++
 1 file changed, 150 insertions(+)
 create mode 100644 arch/sh/boot/dts/sh7751r.dtsi

diff --git a/arch/sh/boot/dts/sh7751r.dtsi b/arch/sh/boot/dts/sh7751r.dtsi
new file mode 100644
index 000000000000..0db5a7005a2d
--- /dev/null
+++ b/arch/sh/boot/dts/sh7751r.dtsi
@@ -0,0 +1,150 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Source for the SH7751R SoC
+ */
+
+#include <dt-bindings/interrupt-controller/sh7751-intc.h>
+#include <dt-bindings/clock/sh7750-cpg.h>
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu@0 {
+			compatible = "renesas,sh4", "renesas,sh2";
+			device_type = "cpu";
+			reg = <0>;
+			clocks = <&cpg SH7750_CPG_ICK>;
+			clock-names = "ick";
+			icache-size = <16384>;
+			icache-line-size = <32>;
+			dcache-size = <32768>;
+			dcache-line-size = <32>;
+		};
+	};
+
+	xtal: oscillator {
+		#clock-cells = <0>;
+		compatible = "fixed-clock";
+		clock-frequency = <0>;
+		clock-output-names = "xtal";
+	};
+
+	soc {
+		compatible = "simple-bus";
+		interrupt-parent = <&shintc>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		cpg: clock-controller@ffc00000 {
+			#clock-cells = <1>;
+			#power-domain-cells = <0>;
+			compatible = "renesas,sh7751r-cpg";
+			clocks = <&xtal>;
+			clock-names = "xtal";
+			reg = <0xffc00000 20>, <0xfe0a0000 16>;
+			reg-names = "FRQCR", "CLKSTP00";
+			renesas,mode = <0>;
+		};
+
+		shintc: interrupt-controller@ffd00000 {
+			compatible = "renesas,sh7751-intc";
+			#interrupt-cells = <1>;
+			interrupt-controller;
+			reg = <0xffd00000 20>, <0xfe080000 128>;
+			reg-names = "ICR", "INTPRI00";
+			renesas,ipr-map = <0x240 IPRD IPR_B12>,	/* IRL0 */
+					  <0x2a0 IPRD IPR_B8>,	/* IRL1 */
+					  <0x300 IPRD IPR_B4>,	/* IRL2 */
+					  <0x360 IPRD IPR_B0>,	/* IRL3 */
+					  <0x400 IPRA IPR_B12>,	/* TMU0 */
+					  <0x420 IPRA IPR_B8>,	/* TMU1 */
+					  <0x440 IPRA IPR_B4>,	/* TMU2 TNUI */
+					  <0x460 IPRA IPR_B4>,	/* TMU2 TICPI */
+					  <0x480 IPRA IPR_B0>,	/* RTC ATI */
+					  <0x4a0 IPRA IPR_B0>,	/* RTC PRI */
+					  <0x4c0 IPRA IPR_B0>,	/* RTC CUI */
+					  <0x4e0 IPRB IPR_B4>,	/* SCI ERI */
+					  <0x500 IPRB IPR_B4>,	/* SCI RXI */
+					  <0x520 IPRB IPR_B4>,	/* SCI TXI */
+					  <0x540 IPRB IPR_B4>,	/* SCI TEI */
+					  <0x560 IPRB IPR_B12>,	/* WDT */
+					  <0x580 IPRB IPR_B8>,	/* REF RCMI */
+					  <0x5a0 IPRB IPR_B4>,	/* REF ROVI */
+					  <0x600 IPRC IPR_B0>,	/* H-UDI */
+					  <0x620 IPRC IPR_B12>,	/* GPIO */
+					  <0x640 IPRC IPR_B8>,	/* DMAC DMTE0 */
+					  <0x660 IPRC IPR_B8>,	/* DMAC DMTE1 */
+					  <0x680 IPRC IPR_B8>,	/* DMAC DMTE2 */
+					  <0x6a0 IPRC IPR_B8>,	/* DMAC DMTE3 */
+					  <0x6c0 IPRC IPR_B8>,	/* DMAC DMAE */
+					  <0x700 IPRC IPR_B4>,	/* SCIF ERI */
+					  <0x720 IPRC IPR_B4>,	/* SCIF RXI */
+					  <0x740 IPRC IPR_B4>,	/* SCIF BRI */
+					  <0x760 IPRC IPR_B4>,	/* SCIF TXI */
+					  <0x780 IPRC IPR_B8>,	/* DMAC DMTE4 */
+					  <0x7a0 IPRC IPR_B8>,	/* DMAC DMTE5 */
+					  <0x7c0 IPRC IPR_B8>,	/* DMAC DMTE6 */
+					  <0x7e0 IPRC IPR_B8>,	/* DMAC DMTE7 */
+					  <0xa00 INTPRI00 IPR_B0>,	/* PCIC PCISERR */
+					  <0xa20 INTPRI00 IPR_B4>,	/* PCIC PCIDMA3 */
+					  <0xa40 INTPRI00 IPR_B4>,	/* PCIC PCIDMA2 */
+					  <0xa60 INTPRI00 IPR_B4>,	/* PCIC PCIDMA1 */
+					  <0xa80 INTPRI00 IPR_B4>,	/* PCIC PCIDMA0 */
+					  <0xaa0 INTPRI00 IPR_B4>,	/* PCIC PCIPWON */
+					  <0xac0 INTPRI00 IPR_B4>,	/* PCIC PCIPWDWN */
+					  <0xae0 INTPRI00 IPR_B4>,	/* PCIC PCIERR */
+					  <0xb00 INTPRI00 IPR_B8>,	/* TMU3 */
+					  <0xb80 INTPRI00 IPR_B12>;	/* TMU4 */
+		};
+
+		/* sci0 is rarely used, so it is not defined here. */
+		scif1: serial@ffe80000 {
+			compatible = "renesas,scif-sh7751", "renesas,scif";
+			reg = <0xffe80000 0x100>;
+			interrupts = <evt2irq(0x700)>,
+				     <evt2irq(0x720)>,
+				     <evt2irq(0x760)>,
+				     <evt2irq(0x740)>;
+			interrupt-names = "eri", "rxi", "txi", "bri";
+			clocks = <&cpg SH7750_MSTP_SCIF>;
+			clock-names = "fck";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		/* Normally ch0 and ch1 are used, so we will define ch0 to ch2 here. */
+		tmu0: timer@ffd80000 {
+			compatible = "renesas,tmu-sh7750", "renesas,tmu";
+			reg = <0xffd80000 12>;
+			interrupts = <evt2irq(0x400)>,
+				     <evt2irq(0x420)>,
+				     <evt2irq(0x440)>,
+				     <evt2irq(0x460)>;
+			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
+			clocks = <&cpg SH7750_MSTP_TMU012>;
+			clock-names = "fck";
+			power-domains = <&cpg>;
+			#renesas,channels = <3>;
+		};
+
+		pcic: pci@fe200000 {
+			compatible = "renesas,sh7751-pci";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			#interrupt-cells = <1>;
+			device_type = "pci";
+			bus-range = <0 0>;
+			ranges = <0x02000000 0 0xfd000000 0xfd000000 0 0x01000000>,
+				 <0x01000000 0 0x00000000 0xfe240000 0 0x00040000>;
+			reg = <0xfe200000 0x0400>,
+			      <0xff800000 0x0100>;
+			status = "disabled";
+		};
+	};
+};
-- 
2.39.2

