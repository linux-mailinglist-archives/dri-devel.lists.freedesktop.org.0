Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A17B4C42389
	for <lists+dri-devel@lfdr.de>; Sat, 08 Nov 2025 02:10:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E34F510E1DD;
	Sat,  8 Nov 2025 01:10:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="g/3URcl8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F27B10E13C
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Nov 2025 01:10:37 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20251108010513euoutp01cd998bebd4aaa0ed75d96f0fc47a244b~14oqK5B6w2093120931euoutp01c;
 Sat,  8 Nov 2025 01:05:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20251108010513euoutp01cd998bebd4aaa0ed75d96f0fc47a244b~14oqK5B6w2093120931euoutp01c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1762563913;
 bh=YU8wIooXjxk6UtzN7Anm6mq6ulm4i8hVNl5onJ1Mzz8=;
 h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
 b=g/3URcl86dOd/25J8GuIREK1ar322CV6yudM8qSho08qEO9taL2YwiH08sft/SA+t
 f07cnBtMHZdtjJ6pJrtksjB8NGwY3cmFMAkbQysu/WmM/G0OkiXNbPGALZf2572u2d
 s79QZG11HAl/naijAjxSBqz0Uyl33LfhqcuHIzvw=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20251108010512eucas1p11f3e192a7b174f8585c98cb2efe68689~14opF744q2253622536eucas1p1t;
 Sat,  8 Nov 2025 01:05:12 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
 [106.210.136.40]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20251108010511eusmtip2d36e66e4a369e219a8a6ccf78998468a~14onsA8PS2515425154eusmtip2h;
 Sat,  8 Nov 2025 01:05:11 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Sat, 08 Nov 2025 02:04:47 +0100
Subject: [PATCH RFC 13/13] riscv: dts: starfive: jh7110: Update DT for
 display subsystem
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20251108-jh7110-clean-send-v1-13-06bf43bb76b1@samsung.com>
In-Reply-To: <20251108-jh7110-clean-send-v1-0-06bf43bb76b1@samsung.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>,  Conor Dooley
 <conor@kernel.org>, Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Emil Renner Berthing <kernel@esmil.dk>,  Hal Feng
 <hal.feng@starfivetech.com>,  Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>,  Xingyu
 Wu <xingyu.wu@starfivetech.com>, Vinod Koul <vkoul@kernel.org>,  Kishon
 Vijay Abraham I <kishon@kernel.org>,  Andrzej Hajda
 <andrzej.hajda@intel.com>,  Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>,  Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>,  Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,  David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,  Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,  Lee Jones <lee@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,  Paul Walmsley
 <paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>,  Alexandre Ghiti <alex@ghiti.fr>,  Marek Szyprowski
 <m.szyprowski@samsung.com>, Icenowy Zheng <uwu@icenowy.me>,  Maud Spierings
 <maudspierings@gocontroll.com>, Andy Yan <andyshrk@163.com>,  Heiko Stuebner
 <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-phy@lists.infradead.org, 
 dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20251108010512eucas1p11f3e192a7b174f8585c98cb2efe68689
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251108010512eucas1p11f3e192a7b174f8585c98cb2efe68689
X-EPHeader: CA
X-CMS-RootMailID: 20251108010512eucas1p11f3e192a7b174f8585c98cb2efe68689
References: <20251108-jh7110-clean-send-v1-0-06bf43bb76b1@samsung.com>
 <CGME20251108010512eucas1p11f3e192a7b174f8585c98cb2efe68689@eucas1p1.samsung.com>
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

Activate the display subsystem drivers by refactoring the device tree.

This change wraps the dc8200, hdmi, and voutcrg nodes within the new
vout_subsystem node. This ensures the PD_VOUT power domain is enabled
before the child drivers are probed.

The monolithic hdmi node is replaced with the hdmi_mfd (MFD parent)
node, containing the hdmi_phy and hdmi_controller children.

The voutcrg node is updated to consume the pixel clock from the
&hdmi_phy node instead of the old fixed-clock. The dc8200 node is also
updated to get its pixel clocks from voutcrg's MUXes.

Finally, the old, incorrect hdmitx0-pixel-clock fixed-clock node is
removed.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 119 +++++++++++++++++++++++-
 arch/riscv/boot/dts/starfive/jh7110.dtsi        | 111 +++++++++++++++++-----
 2 files changed, 207 insertions(+), 23 deletions(-)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
index 2eaf01775ef57d884b4d662af3caa83da2d2ad48..ce459e297261393a352061707041db453819885c 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
@@ -33,6 +33,25 @@ memory@40000000 {
 		bootph-pre-ram;
 	};
 
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		/* vout applies for space from this CMA
+		 * Without this CMA reservation,
+		 * vout may not work properly.
+		 */
+		linux,cma {
+			compatible = "shared-dma-pool";
+			reusable;
+			size = <0x0 0x20000000>;
+			alignment = <0x0 0x1000>;
+			alloc-ranges = <0x0 0x70000000 0x0 0x20000000>;
+			linux,cma-default;
+		};
+	};
+
 	gpio-restart {
 		compatible = "gpio-restart";
 		gpios = <&sysgpio 35 GPIO_ACTIVE_HIGH>;
@@ -73,12 +92,47 @@ codec {
 			};
 		};
 	};
+
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con_in: endpoint {
+				remote-endpoint = <&hdmi_out_con>;
+			};
+		};
+	};
 };
 
 &cpus {
 	timebase-frequency = <4000000>;
 };
 
+&dc8200 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		dpu_port0: port@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			dpu_out_dpi0: endpoint@0 {
+				reg = <0>;
+				remote-endpoint = <&hdmi_in>;
+			};
+		};
+
+		dpu_port1: port@1 {
+			reg = <1>;
+		};
+	};
+};
+
 &dvp_clk {
 	clock-frequency = <74250000>;
 };
@@ -99,8 +153,31 @@ &gmac1_rmii_refin {
 	clock-frequency = <50000000>;
 };
 
-&hdmitx0_pixelclk {
-	clock-frequency = <297000000>;
+&hdmi_controller {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&hdmi_pins>;
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			hdmi_in: endpoint {
+				remote-endpoint = <&dpu_out_dpi0>;
+			};
+		};
+
+		hdmi_out_port: port@1 {
+			reg = <1>;
+			hdmi_out_con: endpoint {
+				remote-endpoint = <&hdmi_con_in>;
+			};
+
+		};
+	};
 };
 
 &i2srx_bclk_ext {
@@ -388,6 +465,40 @@ &syscrg {
 };
 
 &sysgpio {
+	hdmi_pins: hdmi-0 {
+		hdmi-cec-pins {
+			pinmux = <GPIOMUX(14, GPOUT_SYS_HDMI_CEC_SDA,
+					      GPOEN_SYS_HDMI_CEC_SDA,
+					      GPI_SYS_HDMI_CEC_SDA)>;
+			input-enable;
+			bias-pull-up;
+		};
+
+		hdmi-hpd-pins {
+			pinmux = <GPIOMUX(15, GPOUT_HIGH,
+					      GPOEN_ENABLE,
+					      GPI_SYS_HDMI_HPD)>;
+			input-enable;
+			bias-disable; /* external pull-up */
+		};
+
+		hdmi-scl-pins {
+			pinmux = <GPIOMUX(0, GPOUT_SYS_HDMI_DDC_SCL,
+					     GPOEN_SYS_HDMI_DDC_SCL,
+					     GPI_SYS_HDMI_DDC_SCL)>;
+			input-enable;
+			bias-pull-up;
+		};
+
+		hdmi-sda-pins {
+			pinmux = <GPIOMUX(1, GPOUT_SYS_HDMI_DDC_SDA,
+					     GPOEN_SYS_HDMI_DDC_SDA,
+					     GPI_SYS_HDMI_DDC_SDA)>;
+			input-enable;
+			bias-pull-up;
+		};
+	};
+
 	i2c0_pins: i2c0-0 {
 		i2c-pins {
 			pinmux = <GPIOMUX(57, GPOUT_LOW,
@@ -677,3 +788,7 @@ &U74_3 {
 &U74_4 {
 	cpu-supply = <&vdd_cpu>;
 };
+
+&voutcrg {
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
index 0ba74ef046792fd63ed6cf971fa1438609b06fb1..da670a44dcec0f3dae65a2612c24b79f3cdd7d6c 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -283,12 +283,6 @@ gmac1_rmii_refin: gmac1-rmii-refin-clock {
 		#clock-cells = <0>;
 	};
 
-	hdmitx0_pixelclk: hdmitx0-pixel-clock {
-		compatible = "fixed-clock";
-		clock-output-names = "hdmitx0_pixelclk";
-		#clock-cells = <0>;
-	};
-
 	i2srx_bclk_ext: i2srx-bclk-ext-clock {
 		compatible = "fixed-clock";
 		clock-output-names = "i2srx_bclk_ext";
@@ -344,6 +338,14 @@ tdm_ext: tdm-ext-clock {
 		#clock-cells = <0>;
 	};
 
+	xin24m: xin24m {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+		clock-output-names = "xin24m";
+	};
+
+
 	soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&plic>;
@@ -1203,22 +1205,89 @@ camss: isp@19840000 {
 			status = "disabled";
 		};
 
-		voutcrg: clock-controller@295c0000 {
-			compatible = "starfive,jh7110-voutcrg";
-			reg = <0x0 0x295c0000 0x0 0x10000>;
-			clocks = <&syscrg JH7110_SYSCLK_VOUT_SRC>,
-				 <&syscrg JH7110_SYSCLK_VOUT_TOP_AHB>,
-				 <&syscrg JH7110_SYSCLK_VOUT_TOP_AXI>,
-				 <&syscrg JH7110_SYSCLK_VOUT_TOP_HDMITX0_MCLK>,
-				 <&syscrg JH7110_SYSCLK_I2STX0_BCLK>,
-				 <&hdmitx0_pixelclk>;
-			clock-names = "vout_src", "vout_top_ahb",
-				      "vout_top_axi", "vout_top_hdmitx0_mclk",
-				      "i2stx0_bclk", "hdmitx0_pixelclk";
-			resets = <&syscrg JH7110_SYSRST_VOUT_TOP_SRC>;
-			#clock-cells = <1>;
-			#reset-cells = <1>;
+		vout_subsystem: display-subsystem@29400000 {
+			compatible = "starfive,jh7110-vout-subsystem";
+			reg = <0x0 0x29400000 0x0 0x200000>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
 			power-domains = <&pwrc JH7110_PD_VOUT>;
+			clocks = <&syscrg JH7110_SYSCLK_NOC_BUS_DISP_AXI>;
+			resets = <&syscrg JH7110_SYSRST_NOC_BUS_DISP_AXI>;
+
+			dc8200: display@29400000 {
+				compatible = "verisilicon,dc";
+				reg = <0x0 0x29400000 0x0 0x2800>;
+				interrupts = <95>;
+
+				clocks = <&voutcrg JH7110_VOUTCLK_DC8200_CORE>,
+					<&voutcrg JH7110_VOUTCLK_DC8200_AXI>,
+					<&voutcrg JH7110_VOUTCLK_DC8200_AHB>,
+					<&voutcrg JH7110_VOUTCLK_DC8200_PIX0>,
+					<&voutcrg JH7110_VOUTCLK_DC8200_PIX1>;
+				clock-names = "core", "axi", "ahb", "pix0", "pix1";
+
+				resets = <&voutcrg JH7110_VOUTRST_DC8200_CORE>,
+					 <&voutcrg JH7110_VOUTRST_DC8200_AXI>,
+					 <&voutcrg JH7110_VOUTRST_DC8200_AHB>;
+				reset-names = "core", "axi", "ahb";
+			};
+
+			hdmi_mfd: hdmi@29590000 {
+				compatible = "starfive,jh7110-hdmi-mfd";
+				reg = <0x0 0x29590000 0x0 0x4000>;
+
+				hdmi_phy: phy {
+					compatible = "starfive,jh7110-inno-hdmi-phy";
+
+					clocks = <&xin24m>;
+					clock-names = "refoclk";
+
+					/* Output clock: The variable pixel clock */
+					#clock-cells = <0>;
+					clock-output-names = "hdmi_pclk";
+
+					/* PHY provider for the controller */
+					#phy-cells = <0>;
+				};
+
+				hdmi_controller: controller {
+					compatible = "starfive,jh7110-inno-hdmi-controller";
+					interrupts = <99>;
+
+					clocks = <&voutcrg JH7110_VOUTCLK_HDMI_TX_SYS>,
+						 <&voutcrg JH7110_VOUTCLK_HDMI_TX_MCLK>,
+						 <&voutcrg JH7110_VOUTCLK_HDMI_TX_BCLK>,
+						 <&hdmi_phy>;
+					clock-names = "sys", "mclk", "bclk", "pclk";
+
+					resets = <&voutcrg JH7110_VOUTRST_HDMI_TX_HDMI>;
+					reset-names = "hdmi_tx";
+
+					phys = <&hdmi_phy>;
+					phy-names = "hdmi-phy";
+				};
+			};
+
+			voutcrg: clock-controller@295c0000 {
+				compatible = "starfive,jh7110-voutcrg";
+				reg = <0x0 0x295c0000 0x0 0x10000>;
+
+				clocks = <&syscrg JH7110_SYSCLK_VOUT_SRC>,
+					 <&syscrg JH7110_SYSCLK_VOUT_TOP_AHB>,
+					 <&syscrg JH7110_SYSCLK_VOUT_TOP_AXI>,
+					 <&syscrg JH7110_SYSCLK_VOUT_TOP_HDMITX0_MCLK>,
+					 <&syscrg JH7110_SYSCLK_I2STX0_BCLK>,
+					 <&hdmi_phy>;
+				clock-names = "vout_src", "vout_top_ahb",
+					      "vout_top_axi", "vout_top_hdmitx0_mclk",
+					      "i2stx0_bclk", "hdmitx0_pixelclk";
+
+				resets = <&syscrg JH7110_SYSRST_VOUT_TOP_SRC>;
+				#clock-cells = <1>;
+				#reset-cells = <1>;
+			};
 		};
 
 		pcie0: pcie@940000000 {

-- 
2.34.1

