Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF43A25E4B9
	for <lists+dri-devel@lfdr.de>; Sat,  5 Sep 2020 02:36:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3C196ED16;
	Sat,  5 Sep 2020 00:35:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mxwww.masterlogin.de (mxwww.masterlogin.de
 [IPv6:2a03:2900:1:1::a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 328776EB36
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 11:10:07 +0000 (UTC)
Received: from mxout4.routing.net (unknown [192.168.10.112])
 by backup.mxwww.masterlogin.de (Postfix) with ESMTPS id C92D72C478
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 11:00:34 +0000 (UTC)
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
 by mxout4.routing.net (Postfix) with ESMTP id 4A9FF101526;
 Fri,  4 Sep 2020 11:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
 s=20200217; t=1599217231;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ppDWfJAd/jA3m9aGO327KiGAx1XEkMrfYwNEBQ5LlLQ=;
 b=bdpplkmoaJrB2iBcY4g2VVbN+v7z7TsKrRe8efp38zWpN5d0xEH6uNBiWqOR9D+ASlmRRg
 inw2RKlIStx113x8H+O+CdIhUklqcbxs0QYWwPBXs2Wjb27SXtb53egi4p390yvTSmcdB/
 hRMsqN7DxoVH+YdIx5iJPRkEj6nu/zA=
Received: from localhost.localdomain (fttx-pool-217.61.147.193.bambit.de
 [217.61.147.193])
 by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 753FA36026E;
 Fri,  4 Sep 2020 11:00:30 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v6 3/4] arm: dts: mt7623: add display subsystem related device
 nodes
Date: Fri,  4 Sep 2020 13:00:01 +0200
Message-Id: <20200904110002.88966-4-linux@fw-web.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200904110002.88966-1-linux@fw-web.de>
References: <20200904110002.88966-1-linux@fw-web.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 05 Sep 2020 00:35:27 +0000
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
Cc: devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 chunhui dai <chunhui.dai@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ryder Lee <ryder.lee@mediatek.com>

Add display subsystem related device nodes for MT7623.

Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Signed-off-by: chunhui dai <chunhui.dai@mediatek.com>
Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
Tested-by: Frank Wunderlich <frank-w@public-files.de>
---
changed
v5->v6:
  change compatible of hdmi-node because of changes in hdmi-phy
v4->v5:
  add nodes to new mt7623n.dtsi to avoid conflict with mt7623a
v3->v4:
  drop display_components which is duplicate of existing mmsys
v2->v3:
  drop bls to dpi routing

arm: dts: mt7623: use mt2701 compatible for hdmi node
---
 arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts |  72 ++++++++
 arch/arm/boot/dts/mt7623n-rfb-emmc.dts        |  72 ++++++++
 arch/arm/boot/dts/mt7623n.dtsi                | 172 ++++++++++++++++++
 3 files changed, 316 insertions(+)

diff --git a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
index 344f8c65c4aa..f41f221e56ca 100644
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
index f8efcc364bc3..1b9b9a8145a7 100644
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
diff --git a/arch/arm/boot/dts/mt7623n.dtsi b/arch/arm/boot/dts/mt7623n.dtsi
index a47e82468895..1880ac9e32cf 100644
--- a/arch/arm/boot/dts/mt7623n.dtsi
+++ b/arch/arm/boot/dts/mt7623n.dtsi
@@ -10,6 +10,11 @@
 #include <dt-bindings/memory/mt2701-larb-port.h>
 
 / {
+	aliases {
+		rdma0 = &rdma0;
+		rdma1 = &rdma1;
+	};
+
 	g3dsys: syscon@13000000 {
 		compatible = "mediatek,mt7623-g3dsys",
 			     "mediatek,mt2701-g3dsys",
@@ -131,4 +136,171 @@ smi_common: smi@1000c000 {
 		clock-names = "apb", "smi", "async";
 		power-domains = <&scpsys MT2701_POWER_DOMAIN_DISP>;
 	};
+
+	ovl: ovl@14007000 {
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
+	color: color@1400b000 {
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
+			     "mediatek,mt2701-hdmi";
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
+	hdmiddc0: i2c@11013000 {
+		compatible = "mediatek,mt7623-hdmi-ddc",
+			     "mediatek,mt8173-hdmi-ddc";
+		interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_LOW>;
+		reg = <0 0x11013000 0 0x1C>;
+		clocks = <&pericfg CLK_PERI_I2C3>;
+		clock-names = "ddc-i2c";
+		status = "disabled";
+	};
+};
+
+&pio {
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
 };
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
