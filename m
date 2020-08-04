Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E494523C6C7
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 09:14:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B12A26E514;
	Wed,  5 Aug 2020 07:13:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mxwww.masterlogin.de (mxwww.masterlogin.de
 [IPv6:2a03:2900:1:1::b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67A946E497
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 16:56:15 +0000 (UTC)
Received: from mxout1.routing.net (unknown [192.168.10.81])
 by forward.mxwww.masterlogin.de (Postfix) with ESMTPS id 371FC96151;
 Tue,  4 Aug 2020 16:56:14 +0000 (UTC)
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
 by mxout1.routing.net (Postfix) with ESMTP id F387C402F8;
 Tue,  4 Aug 2020 16:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
 s=20200217; t=1596560174;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AzBGcZ+vbk/R/lBHASsN4TX5ORmNe1ddeJtTwA/FqeQ=;
 b=Gq6MX+KBgiiOpWed/9+P5b9/A42SGpHYsGVvQsoGrwaPFtLH5bnRUhhLLQP+WHiCCM41bD
 XgLiJCcPFzYhRW1WCQrnBZiDDkDl1uE6a6LK12YaF2Nwtw+UVtOU4KN5/hluX4jcLU+0Td
 glhUUMByuOrh70iLyah+2oMLObkswGY=
Received: from localhost.localdomain (fttx-pool-217.61.144.119.bambit.de
 [217.61.144.119])
 by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 2DEFF3603C2;
 Tue,  4 Aug 2020 16:56:13 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v4 6/6] arm: dts: mt7623: add display subsystem related device
 nodes
Date: Tue,  4 Aug 2020 18:55:55 +0200
Message-Id: <20200804165555.75159-8-linux@fw-web.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200804165555.75159-1-linux@fw-web.de>
References: <20200804165555.75159-1-linux@fw-web.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 05 Aug 2020 07:13:16 +0000
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 Frank Wunderlich <frank-w@public-files.de>, David Airlie <airlied@linux.ie>,
 chunhui dai <chunhui.dai@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ryder Lee <ryder.lee@mediatek.com>

Add display subsystem related device nodes for MT7623.

Cc: CK Hu <ck.hu@mediatek.com>
Signed-off-by: chunhui dai <chunhui.dai@mediatek.com>
Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
Tested-by: Frank Wunderlich <frank-w@public-files.de>
---
changed
v3->v4:
  drop display_components which is duplicate of existing mmsys
v2->v3:
  drop bls to dpi routing
---
 arch/arm/boot/dts/mt7623.dtsi                 | 170 ++++++++++++++++++
 arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts |  72 ++++++++
 arch/arm/boot/dts/mt7623n-rfb-emmc.dts        |  72 ++++++++
 3 files changed, 314 insertions(+)

diff --git a/arch/arm/boot/dts/mt7623.dtsi b/arch/arm/boot/dts/mt7623.dtsi
index a106c0d90a52..f2cb44a69454 100644
--- a/arch/arm/boot/dts/mt7623.dtsi
+++ b/arch/arm/boot/dts/mt7623.dtsi
@@ -24,6 +24,11 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	aliases {
+		rdma0 = &rdma0;
+		rdma1 = &rdma1;
+	};
+
 	cpu_opp_table: opp-table {
 		compatible = "operating-points-v2";
 		opp-shared;
@@ -321,6 +326,25 @@ pwrap: pwrap@1000d000 {
 		clock-names = "spi", "wrap";
 	};
 
+	mipi_tx0: mipi-dphy@10010000 {
+		compatible = "mediatek,mt7623-mipi-tx",
+			     "mediatek,mt2701-mipi-tx";
+		reg = <0 0x10010000 0 0x90>;
+		clocks = <&clk26m>;
+		clock-output-names = "mipi_tx0_pll";
+		#clock-cells = <0>;
+		#phy-cells = <0>;
+	};
+
+	cec: cec@10012000 {
+		compatible = "mediatek,mt7623-cec",
+			     "mediatek,mt8173-cec";
+		reg = <0 0x10012000 0 0xbc>;
+		interrupts = <GIC_SPI 182 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&infracfg CLK_INFRA_CEC>;
+		status = "disabled";
+	};
+
 	cir: cir@10013000 {
 		compatible = "mediatek,mt7623-cir";
 		reg = <0 0x10013000 0 0x1000>;
@@ -369,6 +393,18 @@ apmixedsys: syscon@10209000 {
 		#clock-cells = <1>;
 	};
 
+	hdmi_phy: phy@10209100 {
+		compatible = "mediatek,mt7623-hdmi-phy",
+			     "mediatek,mt2701-hdmi-phy";
+		reg = <0 0x10209100 0 0x24>;
+		clocks = <&apmixedsys CLK_APMIXED_HDMI_REF>;
+		clock-names = "pll_ref";
+		clock-output-names = "hdmitx_dig_cts";
+		#clock-cells = <0>;
+		#phy-cells = <0>;
+		status = "disabled";
+	};
+
 	rng: rng@1020f000 {
 		compatible = "mediatek,mt7623-rng";
 		reg = <0 0x1020f000 0 0x1000>;
@@ -568,6 +604,16 @@ bch: ecc@1100e000 {
 		status = "disabled";
 	};
 
+	hdmiddc0: i2c@11013000 {
+		compatible = "mediatek,mt7623-hdmi-ddc",
+			     "mediatek,mt8173-hdmi-ddc";
+		interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_LOW>;
+		reg = <0 0x11013000 0 0x1C>;
+		clocks = <&pericfg CLK_PERI_I2C3>;
+		clock-names = "ddc-i2c";
+		status = "disabled";
+	};
+
 	nor_flash: spi@11014000 {
 		compatible = "mediatek,mt7623-nor",
 			     "mediatek,mt8173-nor";
@@ -766,6 +812,77 @@ mmsys: syscon@14000000 {
 		#clock-cells = <1>;
 	};
 
+	ovl@14007000 {
+		compatible = "mediatek,mt7623-disp-ovl",
+			     "mediatek,mt2701-disp-ovl";
+		reg = <0 0x14007000 0 0x1000>;
+		interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&mmsys CLK_MM_DISP_OVL>;
+		iommus = <&iommu MT2701_M4U_PORT_DISP_OVL_0>;
+		mediatek,larb = <&larb0>;
+	};
+
+	rdma0: rdma@14008000 {
+		compatible = "mediatek,mt7623-disp-rdma",
+			     "mediatek,mt2701-disp-rdma";
+		reg = <0 0x14008000 0 0x1000>;
+		interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&mmsys CLK_MM_DISP_RDMA>;
+		iommus = <&iommu MT2701_M4U_PORT_DISP_RDMA>;
+		mediatek,larb = <&larb0>;
+	};
+
+	wdma@14009000 {
+		compatible = "mediatek,mt7623-disp-wdma",
+			     "mediatek,mt2701-disp-wdma";
+		reg = <0 0x14009000 0 0x1000>;
+		interrupts = <GIC_SPI 154 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&mmsys CLK_MM_DISP_WDMA>;
+		iommus = <&iommu MT2701_M4U_PORT_DISP_WDMA>;
+		mediatek,larb = <&larb0>;
+	};
+
+	bls: pwm@1400a000 {
+		compatible = "mediatek,mt7623-disp-pwm",
+			     "mediatek,mt2701-disp-pwm";
+		reg = <0 0x1400a000 0 0x1000>;
+		#pwm-cells = <2>;
+		clocks = <&mmsys CLK_MM_MDP_BLS_26M>,
+			 <&mmsys CLK_MM_DISP_BLS>;
+		clock-names = "main", "mm";
+		status = "disabled";
+	};
+
+	color@1400b000 {
+		compatible = "mediatek,mt7623-disp-color",
+			     "mediatek,mt2701-disp-color";
+		reg = <0 0x1400b000 0 0x1000>;
+		interrupts = <GIC_SPI 156 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&mmsys CLK_MM_DISP_COLOR>;
+	};
+
+	dsi: dsi@1400c000 {
+		compatible = "mediatek,mt7623-dsi",
+			     "mediatek,mt2701-dsi";
+		reg = <0 0x1400c000 0 0x1000>;
+		interrupts = <GIC_SPI 157 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&mmsys CLK_MM_DSI_ENGINE>,
+			 <&mmsys CLK_MM_DSI_DIG>,
+			 <&mipi_tx0>;
+		clock-names = "engine", "digital", "hs";
+		phys = <&mipi_tx0>;
+		phy-names = "dphy";
+		status = "disabled";
+	};
+
+	mutex: mutex@1400e000 {
+		compatible = "mediatek,mt7623-disp-mutex",
+			     "mediatek,mt2701-disp-mutex";
+		reg = <0 0x1400e000 0 0x1000>;
+		interrupts = <GIC_SPI 161 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&mmsys CLK_MM_MUTEX_32K>;
+	};
+
 	larb0: larb@14010000 {
 		compatible = "mediatek,mt7623-smi-larb",
 			     "mediatek,mt2701-smi-larb";
@@ -778,6 +895,44 @@ larb0: larb@14010000 {
 		power-domains = <&scpsys MT2701_POWER_DOMAIN_DISP>;
 	};
 
+	rdma1: rdma@14012000 {
+		compatible = "mediatek,mt7623-disp-rdma",
+			     "mediatek,mt2701-disp-rdma";
+		reg = <0 0x14012000 0 0x1000>;
+		interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&mmsys CLK_MM_DISP_RDMA1>;
+		iommus = <&iommu MT2701_M4U_PORT_DISP_RDMA1>;
+		mediatek,larb = <&larb0>;
+	};
+
+	dpi0: dpi@14014000 {
+		compatible = "mediatek,mt7623-dpi",
+			     "mediatek,mt2701-dpi";
+		reg = <0 0x14014000 0 0x1000>;
+		interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&mmsys CLK_MM_DPI1_DIGL>,
+			 <&mmsys CLK_MM_DPI1_ENGINE>,
+			 <&apmixedsys CLK_APMIXED_TVDPLL>;
+		clock-names = "pixel", "engine", "pll";
+		status = "disabled";
+	};
+
+	hdmi0: hdmi@14015000 {
+		compatible = "mediatek,mt7623-hdmi",
+			     "mediatek,mt8173-hdmi";
+		reg = <0 0x14015000 0 0x400>;
+		clocks = <&mmsys CLK_MM_HDMI_PIXEL>,
+			 <&mmsys CLK_MM_HDMI_PLL>,
+			 <&mmsys CLK_MM_HDMI_AUDIO>,
+			 <&mmsys CLK_MM_HDMI_SPDIF>;
+		clock-names = "pixel", "pll", "bclk", "spdif";
+		phys = <&hdmi_phy>;
+		phy-names = "hdmi";
+		mediatek,syscon-hdmi = <&mmsys 0x900>;
+		cec = <&cec>;
+		status = "disabled";
+	};
+
 	imgsys: syscon@15000000 {
 		compatible = "mediatek,mt7623-imgsys",
 			     "mediatek,mt2701-imgsys",
@@ -1102,6 +1257,21 @@ pins-cir {
 		};
 	};
 
+	hdmi_pins_a: hdmi-default {
+		pins-hdmi {
+			pinmux = <MT7623_PIN_123_HTPLG_FUNC_HTPLG>;
+			input-enable;
+			bias-pull-down;
+		};
+	};
+
+	hdmi_ddc_pins_a: hdmi_ddc-default {
+		pins-hdmi-ddc {
+			pinmux = <MT7623_PIN_124_GPIO124_FUNC_HDMISCK>,
+				 <MT7623_PIN_125_GPIO125_FUNC_HDMISD>;
+		};
+	};
+
 	i2c0_pins_a: i2c0-default {
 		pins-i2c0 {
 			pinmux = <MT7623_PIN_75_SDA0_FUNC_SDA0>,
diff --git a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
index 2b760f90f38c..b1c83e919015 100644
--- a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
+++ b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
@@ -21,6 +21,19 @@ chosen {
 		stdout-path = "serial2:115200n8";
 	};
 
+	connector {
+		compatible = "hdmi-connector";
+		label = "hdmi";
+		type = "d";
+		ddc-i2c-bus = <&hdmiddc0>;
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&hdmi0_out>;
+			};
+		};
+	};
+
 	cpus {
 		cpu@0 {
 			proc-supply = <&mt6323_vproc_reg>;
@@ -114,10 +127,18 @@ memory@80000000 {
 	};
 };
 
+&bls {
+	status = "okay";
+};
+
 &btif {
 	status = "okay";
 };
 
+&cec {
+	status = "okay";
+};
+
 &cir {
 	pinctrl-names = "default";
 	pinctrl-0 = <&cir_pins_a>;
@@ -128,6 +149,21 @@ &crypto {
 	status = "okay";
 };
 
+&dpi0 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		port@0 {
+			reg = <0>;
+			dpi0_out: endpoint {
+				remote-endpoint = <&hdmi0_in>;
+			};
+		};
+	};
+};
+
 &eth {
 	status = "okay";
 
@@ -199,6 +235,42 @@ fixed-link {
 	};
 };
 
+&hdmi0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&hdmi_pins_a>;
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		port@0 {
+			reg = <0>;
+			hdmi0_in: endpoint {
+				remote-endpoint = <&dpi0_out>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			hdmi0_out: endpoint {
+				remote-endpoint = <&hdmi_connector_in>;
+			};
+		};
+	};
+};
+
+&hdmiddc0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&hdmi_ddc_pins_a>;
+	status = "okay";
+};
+
+&hdmi_phy {
+	mediatek,ibias = <0xa>;
+	mediatek,ibias_up = <0x1c>;
+	status = "okay";
+};
+
 &i2c0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c0_pins_a>;
diff --git a/arch/arm/boot/dts/mt7623n-rfb-emmc.dts b/arch/arm/boot/dts/mt7623n-rfb-emmc.dts
index 0447748f9fa0..7e3ded7d9e7d 100644
--- a/arch/arm/boot/dts/mt7623n-rfb-emmc.dts
+++ b/arch/arm/boot/dts/mt7623n-rfb-emmc.dts
@@ -24,6 +24,19 @@ chosen {
 		stdout-path = "serial2:115200n8";
 	};
 
+	connector {
+		compatible = "hdmi-connector";
+		label = "hdmi";
+		type = "d";
+		ddc-i2c-bus = <&hdmiddc0>;
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&hdmi0_out>;
+			};
+		};
+	};
+
 	cpus {
 		cpu@0 {
 			proc-supply = <&mt6323_vproc_reg>;
@@ -106,10 +119,18 @@ sound {
 	};
 };
 
+&bls {
+	status = "okay";
+};
+
 &btif {
 	status = "okay";
 };
 
+&cec {
+	status = "okay";
+};
+
 &cir {
 	pinctrl-names = "default";
 	pinctrl-0 = <&cir_pins_a>;
@@ -120,6 +141,21 @@ &crypto {
 	status = "okay";
 };
 
+&dpi0 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		port@0 {
+			reg = <0>;
+			dpi0_out: endpoint {
+				remote-endpoint = <&hdmi0_in>;
+			};
+		};
+	};
+};
+
 &eth {
 	status = "okay";
 
@@ -203,6 +239,42 @@ fixed-link {
 	};
 };
 
+&hdmi0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&hdmi_pins_a>;
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		port@0 {
+			reg = <0>;
+			hdmi0_in: endpoint {
+				remote-endpoint = <&dpi0_out>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			hdmi0_out: endpoint {
+				remote-endpoint = <&hdmi_connector_in>;
+			};
+		};
+	};
+};
+
+&hdmiddc0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&hdmi_ddc_pins_a>;
+	status = "okay";
+};
+
+&hdmi_phy {
+	mediatek,ibias = <0xa>;
+	mediatek,ibias_up = <0x1c>;
+	status = "okay";
+};
+
 &i2c0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c0_pins_a>;
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
