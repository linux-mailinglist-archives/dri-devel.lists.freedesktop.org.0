Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B2EBCF9F4
	for <lists+dri-devel@lfdr.de>; Sat, 11 Oct 2025 19:04:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44D3A10E347;
	Sat, 11 Oct 2025 17:04:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="exWqMVik";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="lz5GUTVl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD3CF10E349
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Oct 2025 17:04:45 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4ckVMw3gCZz9srT;
 Sat, 11 Oct 2025 19:04:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760202284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xfcFwjoG6BlDGRf7oUu6mSTne7e5YxtYHuPn0+MvuVs=;
 b=exWqMVikCY9XlQIux8PkH3ZBXRzlfDQE/qPsNpZnxWpwo0mp+Q9MbjTZ518L0BvpLbzPh7
 lEPzE9QnkbtbAcUyizOyyT0AY2Yg8AjUnt6uYKPgpMYK71Rsi2ub3T7ObesuB9f9zNUViN
 UbZTvNSgYmEiOUsggDsv3+T1sdLWT5PNhV81bDqIO7hdfvjeQ0GCNd7IbP6CTBheaCH26u
 JY8IA3QMj9p8Wf2qDeG3xElUHykvQStrpuboEb9RCYKqjXczl4sPG40oDiWTeFuW1+VqqM
 xZPXBqhXtRw3CjBFhf9dM5/FqSEHdUTGz8zjfvrSoA2I74++ZHG+j+WspB8Xag==
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760202282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xfcFwjoG6BlDGRf7oUu6mSTne7e5YxtYHuPn0+MvuVs=;
 b=lz5GUTVlTZbQrih4d5BDMjgct+mEMDZxb3DDkv+BZAw4QwiW220OISi83tffQ9uhZArUQM
 r8N+raYnY0ZX5m3LtPGsI+VhZ6aBrb28EJUDGN9CHztB3VuQT2NbRf5jEt6ajQr60QyhoO
 evFg5uit0SGogRlfBW4fGivCAPqN01zPyPkcuO26Whm8ZPiMupscopLEwHU1H5H0cTxe+a
 c7qx+nWrGn/jCR8aEroYhBsjQI25cC1Rh8uY5dXYs5mPyjmNq2KV1N8vQVGJzojMBpHrj2
 yLsUYaPTLXCPrKQXElYkj0UYMlWenGC/m1PNw15QjvsjupMx7g7vpJ05Dkpxkg==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut@mailbox.org>, Abel Vesa <abelvesa@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Liu Ying <victor.liu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
 Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
Subject: [PATCH 39/39] arm64: dts: imx95: Describe display pipeline
Date: Sat, 11 Oct 2025 18:51:54 +0200
Message-ID: <20251011170213.128907-40-marek.vasut@mailbox.org>
In-Reply-To: <20251011170213.128907-1-marek.vasut@mailbox.org>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: tng4uiytdk18z5x9jco34aff7x5omh3a
X-MBO-RS-ID: 07fd043ce955215318a
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

Describe the entire i.MX95 display pipeline, which includes the DPU or DC
display controller, MIPI DSI serializer, LVDS serializer and the bridges
between those components.

Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Abel Vesa <abelvesa@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Liu Ying <victor.liu@nxp.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-clk@vger.kernel.org
---
 arch/arm64/boot/dts/freescale/imx95.dtsi | 710 +++++++++++++++++++++++
 1 file changed, 710 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index ad47b7f0d173a..e26942ab0b28b 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -19,6 +19,87 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	ldb_pll_pixel: ldb_pll_div7 {
+		#clock-cells = <0>;
+		compatible = "fixed-factor-clock";
+		clocks = <&scmi_clk IMX95_CLK_LDBPLL>;
+		clock-div = <7>;
+		clock-mult = <1>;
+		clock-output-names = "ldb_pll_div7";
+	};
+
+	display_pixel_link_0: pixel-link-0 {
+		compatible = "fsl,imx95-dc-pixel-link";
+		fsl,dc-stream-id = /bits/ 8 <0>;
+		fsl,syscon = <&dispmix_csr>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				display_pixel_link0_to_pixel_interleaver_disp0: endpoint {
+					remote-endpoint = <&pixel_interleaver_disp0_to_display_pixel_link0>;
+				};
+			};
+
+			port@1 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <1>;
+
+				display_pixel_link0_to_mipi_dsi: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&mipi_dsi_to_display_pixel_link0>;
+				};
+
+				display_pixel_link0_to_lvds_ch0: endpoint@1 {
+					reg = <1>;
+					remote-endpoint = <&lvds_ch0_to_display_pixel_link0>;
+				};
+			};
+		};
+	};
+
+	display_pixel_link_1: pixel-link-1 {
+		compatible = "fsl,imx95-dc-pixel-link";
+		fsl,dc-stream-id = /bits/ 8 <1>;
+		fsl,syscon = <&dispmix_csr>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				display_pixel_link1_to_pixel_interleaver_disp1: endpoint {
+					remote-endpoint = <&pixel_interleaver_disp1_to_display_pixel_link1>;
+				};
+			};
+
+			port@1 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <1>;
+
+				display_pixel_link1_to_mipi_dsi: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&mipi_dsi_to_display_pixel_link1>;
+				};
+
+				display_pixel_link1_to_lvds_ch1: endpoint@1 {
+					reg = <1>;
+					remote-endpoint = <&lvds_ch1_to_display_pixel_link1>;
+				};
+			};
+		};
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -1772,6 +1853,635 @@ smmu: iommu@490d0000 {
 			};
 		};
 
+		mipi_dsi: dsi@4acf0000 {
+			compatible = "fsl,imx95-mipi-dsi";
+			reg = <0x0 0x4acf0000 0x0 0x10000>;
+			interrupt-parent = <&displaymix_irqsteer>;
+			interrupts = <48>;
+			clocks = <&scmi_clk IMX95_CLK_CAMAPB>,
+				 <&scmi_clk IMX95_CLK_DISP1PIX>,
+				 <&scmi_clk IMX95_CLK_MIPIPHYCFG>,
+				 <&scmi_clk IMX95_CLK_MIPIPHYPLLREF>;
+			clock-names = "pclk", "pix", "phy_cfg", "phy_ref";
+			assigned-clocks = <&scmi_clk IMX95_CLK_MIPIPHYCFG>,
+					  <&scmi_clk IMX95_CLK_MIPIPHYPLLBYPASS>,
+					  <&scmi_clk IMX95_CLK_MIPIPHYPLLREF>;
+			assigned-clock-parents = <&scmi_clk IMX95_CLK_24M>,
+						 <&scmi_clk IMX95_CLK_VIDEOPLL1>,
+						 <&scmi_clk IMX95_CLK_24M>;
+			power-domains = <&scmi_devpd IMX95_PD_CAMERA>;
+			fsl,disp-master-csr = <&display_master_csr>;
+			fsl,disp-stream-csr = <&display_stream_csr>;
+			fsl,mipi-combo-phy-csr = <&mipi_tx_phy_csr>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+
+					mipi_dsi_to_display_pixel_link0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&display_pixel_link0_to_mipi_dsi>;
+					};
+
+					mipi_dsi_to_display_pixel_link1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&display_pixel_link1_to_mipi_dsi>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
+		display_stream_csr: syscon@4ad00000 {
+			compatible = "nxp,imx95-display-stream-csr", "syscon";
+			reg = <0x0 0x4ad00000 0x0 0x10000>;
+			clocks = <&scmi_clk IMX95_CLK_CAMAPB>;
+		};
+
+		display_master_csr: syscon@4ad10000 {
+			compatible = "nxp,imx95-master-stream-csr", "syscon";
+			reg = <0x0 0x4ad10000 0x0 0x10000>;
+			clocks = <&scmi_clk IMX95_CLK_CAMAPB>;
+		};
+
+		mipi_tx_phy_csr: syscon@4ad20100 {
+			compatible = "nxp,imx95-mipi-tx-phy-csr", "syscon";
+			reg = <0x0 0x4ad20100 0x0 0x14>;
+			clocks = <&scmi_clk IMX95_CLK_CAMAPB>;
+		};
+
+		dispmix_csr: syscon@4b010000 {
+			compatible = "nxp,imx95-display-csr", "syscon";
+			reg = <0x0 0x4b010000 0x0 0x10000>;
+			#clock-cells = <1>;
+			clocks = <&scmi_clk IMX95_CLK_DISPAPB>;
+			power-domains = <&scmi_devpd IMX95_PD_DISPLAY>;
+		};
+
+		displaymix_irqsteer: interrupt-controller@4b0b0000 {
+			compatible = "fsl,imx95-irqsteer", "fsl,imx-irqsteer";
+			reg = <0x0 0x4b0b0000 0x0 0x1000>;
+			interrupts = <GIC_SPI 214 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 216 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 217 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 218 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH>,	/* reserved */
+				     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH>,	/* reserved */
+				     <GIC_SPI 219 IRQ_TYPE_LEVEL_HIGH>;
+			power-domains = <&scmi_devpd IMX95_PD_DISPLAY>;
+			clocks = <&scmi_clk IMX95_CLK_DISPAPB>;
+			clock-names = "ipg";
+			fsl,channel = <0>;
+			fsl,num-irqs = <512>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+			status = "disabled";
+		};
+
+		lvds_csr: syscon@4b0c0000 {
+			compatible = "nxp,imx95-lvds-csr", "syscon";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			reg = <0x0 0x4b0c0000 0x0 0x10000>;
+			#clock-cells = <1>;
+			clocks = <&scmi_clk IMX95_CLK_DISPAPB>;
+			power-domains = <&scmi_devpd IMX95_PD_DISPLAY>;
+
+			lvds: lvds@4 {
+				compatible = "fsl,imx95-lvds";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x4 0x4>;
+				clocks = <&lvds_csr IMX95_CLK_DISPMIX_PIX_DI0_GATE>,
+					 <&lvds_csr IMX95_CLK_DISPMIX_PIX_DI1_GATE>,
+					 <&lvds_csr IMX95_CLK_DISPMIX_LVDS_CH0_GATE>,
+					 <&lvds_csr IMX95_CLK_DISPMIX_LVDS_CH1_GATE>;
+				clock-names = "ldb_di0", "ldb_di1", "ldb_ch0", "ldb_ch1";
+				status = "disabled";
+
+				lvds_ch0: channel@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+					status = "disabled";
+
+					port@0 {
+						reg = <0>;
+
+						lvds_ch0_to_display_pixel_link0: endpoint {
+							remote-endpoint = <&display_pixel_link0_to_lvds_ch0>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						lvds_ch0_to_ldb0: endpoint {
+							remote-endpoint = <&ldb0_to_lvds_ch0>;
+						};
+					};
+				};
+
+				lvds_ch1: channel@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+					status = "disabled";
+
+					port@0 {
+						reg = <0>;
+
+						lvds_ch1_to_display_pixel_link1: endpoint {
+							remote-endpoint = <&display_pixel_link1_to_lvds_ch1>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						lvds_ch1_to_ldb1: endpoint {
+							remote-endpoint = <&ldb1_to_lvds_ch1>;
+						};
+					};
+				};
+			};
+
+			ldb0: phy@8 {
+				compatible = "fsl,imx95-ldb";
+				reg = <0x8 0x4>, <0x8 0x4>;
+				reg-names = "ldb", "lvds";
+				clocks = <&scmi_clk IMX95_CLK_DISPAPB>;
+				clock-names = "ldb";
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						ldb0_to_lvds_ch0: endpoint {
+							remote-endpoint = <&lvds_ch0_to_ldb0>;
+						};
+					};
+
+					ldb0_port1: port@1 {
+						reg = <1>;
+					};
+				};
+			};
+
+			ldb1: phy@c {
+				compatible = "fsl,imx95-ldb";
+				reg = <0xc 0x4>, <0xc 0x4>;
+				reg-names = "ldb", "lvds";
+				clocks = <&scmi_clk IMX95_CLK_DISPAPB>;
+				clock-names = "ldb";
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						ldb1_to_lvds_ch1: endpoint {
+							remote-endpoint = <&lvds_ch1_to_ldb1>;
+						};
+					};
+
+					ldb1_port1: port@1 {
+						reg = <1>;
+					};
+				};
+			};
+		};
+
+		pixel_interleaver_0: bridge@4b0d0000 {
+			compatible = "fsl,imx95-pixel-interleaver";
+			reg = <0x0 0x4b0d0000 0x0 0x50>;
+			clocks = <&scmi_clk IMX95_CLK_DISPAPB>;
+			fsl,syscon = <&dispmix_csr>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pixel_interleaver_disp0_to_dpu_disp0: endpoint {
+						remote-endpoint = <&dpu_disp0_to_pixel_interleaver_disp0>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pixel_interleaver_disp0_to_display_pixel_link0: endpoint {
+						remote-endpoint = <&display_pixel_link0_to_pixel_interleaver_disp0>;
+					};
+				};
+			};
+		};
+
+		pixel_interleaver_1: bridge@4b0e0000 {
+			compatible = "fsl,imx95-pixel-interleaver";
+			reg = <0x0 0x4b0e0000 0x0 0x50>;
+			clocks = <&scmi_clk IMX95_CLK_DISPAPB>;
+			fsl,syscon = <&dispmix_csr>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pixel_interleaver_disp1_to_dpu_disp1: endpoint {
+						remote-endpoint = <&dpu_disp1_to_pixel_interleaver_disp1>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pixel_interleaver_disp1_to_display_pixel_link1: endpoint {
+						remote-endpoint = <&display_pixel_link1_to_pixel_interleaver_disp1>;
+					};
+				};
+			};
+		};
+
+		dpu: display-controller@4b400000 {
+			compatible = "fsl,imx95-dc";
+			reg = <0 0x4b400000 0 0x400000>;
+			clocks = <&scmi_clk IMX95_CLK_DISP1PIX>,
+				 <&scmi_clk IMX95_CLK_DISPAPB>,
+				 <&scmi_clk IMX95_CLK_DISPAXI>,
+				 <&scmi_clk IMX95_CLK_DISPOCRAM>,
+				 <&ldb_pll_pixel>,
+				 <&scmi_clk IMX95_CLK_LDBPLL_VCO>;
+			clock-names = "pix", "apb", "axi", "ocram", "ldb", "ldb_vco";
+			fsl,syscon = <&dispmix_csr>;
+			power-domains = <&scmi_devpd IMX95_PD_DISPLAY>;
+			assigned-clocks = <&scmi_clk IMX95_CLK_DISPAXI>,
+					  <&scmi_clk IMX95_CLK_DISPOCRAM>,
+					  <&scmi_clk IMX95_CLK_DISPAPB>;
+			assigned-clock-parents = <&scmi_clk IMX95_CLK_SYSPLL1_PFD1>,
+						 <&scmi_clk IMX95_CLK_SYSPLL1_PFD1>,
+						 <&scmi_clk IMX95_CLK_SYSPLL1_PFD1_DIV2>;
+			assigned-clock-rates = <400000000>, <400000000>, <133333333>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			dc1_intc: interrupt-controller@4b781000 {
+				compatible = "fsl,imx95-dc-intc";
+				reg = <0 0x4b781000 0 0x60>;
+				clocks = <&scmi_clk IMX95_CLK_DISPAPB>,
+					 <&scmi_clk IMX95_CLK_DISPAXI>;
+				clock-names = "apb", "axi";
+				power-domains = <&scmi_devpd IMX95_PD_DISPLAY>;
+				interrupt-controller;
+				#interrupt-cells = <1>;
+				interrupt-parent = <&displaymix_irqsteer>;
+				interrupts = <448>, <449>, <450>,  <64>,
+					      <65>,  <66>,  <67>,  <68>,
+					      <69>, <192>, <193>, <194>,
+					     <195>, <196>, <197>,  <70>,
+					      <71>,  <72>,  <73>,  <74>,
+					      <75>,  <76>,  <77>,  <78>,
+					      <79>,  <80>,  <81>,  <82>,
+					      <83>,  <84>,  <85>,  <86>,
+					      <87>,  <88>,  <89>,  <90>,
+					      <91>,  <92>, <198>, <199>,
+					     <200>, <201>, <202>, <203>,
+					     <204>, <205>, <206>, <207>,
+					     <208>, <209>, <210>, <211>,
+					     <212>, <451>,   <1>,   <2>,
+					       <3>,   <4>,  <93>,  <94>,
+					      <95>,  <96>,  <97>,  <98>,
+					      <99>, <100>, <101>, <102>,
+					     <103>, <104>, <105>, <106>,
+					     <213>, <214>, <215>, <216>,
+					     <217>, <218>, <219>, <220>,
+					     <221>, <222>, <223>, <224>,
+					     <225>, <226>;
+				interrupt-names = "store9_shdload",
+						  "store9_framecomplete",
+						  "store9_seqcomplete",
+						  "extdst0_shdload",
+						  "extdst0_framecomplete",
+						  "extdst0_seqcomplete",
+						  "extdst4_shdload",
+						  "extdst4_framecomplete",
+						  "extdst4_seqcomplete",
+						  "extdst1_shdload",
+						  "extdst1_framecomplete",
+						  "extdst1_seqcomplete",
+						  "extdst5_shdload",
+						  "extdst5_framecomplete",
+						  "extdst5_seqcomplete",
+						  "domainblend0_shdload",
+						  "domainblend0_framecomplete",
+						  "domainblend0_seqcomplete",
+						  "disengcfg_shdload0",
+						  "disengcfg_framecomplete0",
+						  "disengcfg_seqcomplete0",
+						  "framegen0_int0",
+						  "framegen0_int1",
+						  "framegen0_int2",
+						  "framegen0_int3",
+						  "sig0_shdload",
+						  "sig0_valid",
+						  "sig0_error",
+						  "sig0_cluster_error",
+						  "sig0_cluster_match",
+						  "sig2_shdload",
+						  "sig2_valid",
+						  "sig2_error",
+						  "sig2_cluster_error",
+						  "sig2_cluster_match",
+						  "idhash0_shdload",
+						  "idhash0_valid",
+						  "idhash0_window_error",
+						  "domainblend1_shdload",
+						  "domainblend1_framecomplete",
+						  "domainblend1_seqcomplete",
+						  "disengcfg_shdload1",
+						  "disengcfg_framecomplete1",
+						  "disengcfg_seqcomplete1",
+						  "framegen1_int0",
+						  "framegen1_int1",
+						  "framegen1_int2",
+						  "framegen1_int3",
+						  "sig1_shdload",
+						  "sig1_valid",
+						  "sig1_error",
+						  "sig1_cluster_error",
+						  "sig1_cluster_match",
+						  "cmdseq_error",
+						  "comctrl_sw0",
+						  "comctrl_sw1",
+						  "comctrl_sw2",
+						  "comctrl_sw3",
+						  "framegen0_primsync_on",
+						  "framegen0_primsync_off",
+						  "framegen0_overflow0_on",
+						  "framegen0_overflow0_off",
+						  "framegen0_underrun0_on",
+						  "framegen0_underrun0_off",
+						  "framegen0_threshold0_rise",
+						  "framegen0_threshold0_fail",
+						  "framegen0_overflow1_on",
+						  "framegen0_overflow1_off",
+						  "framegen0_underrun1_on",
+						  "framegen0_underrun1_off",
+						  "framegen0_threshold1_rise",
+						  "framegen0_threshold1_fail",
+						  "framegen1_primsync_on",
+						  "framegen1_primsync_off",
+						  "framegen1_overflow0_on",
+						  "framegen1_overflow0_off",
+						  "framegen1_underrun0_on",
+						  "framegen1_underrun0_off",
+						  "framegen1_threshold0_rise",
+						  "framegen1_threshold0_fail",
+						  "framegen1_overflow1_on",
+						  "framegen1_overflow1_off",
+						  "framegen1_underrun1_on",
+						  "framegen1_underrun1_off",
+						  "framegen1_threshold1_rise",
+						  "framegen1_threshold1_fail";
+			};
+
+			pixel-engine@4b4f0000 {
+				compatible = "fsl,imx95-dc-pixel-engine", "fsl,imx8qxp-dc-pixel-engine";
+				reg = <0 0x4b4f0000 0 0x1d0000>;
+				clocks = <&scmi_clk IMX95_CLK_DISPAPB>,
+					 <&scmi_clk IMX95_CLK_DISPAXI>;
+				clock-names = "apb", "axi";
+				#address-cells = <2>;
+				#size-cells = <2>;
+				ranges;
+
+				constframe@4b4f0000 {
+					compatible = "fsl,imx95-dc-constframe";
+					reg = <0 0x4b4f1000 0 0xc>, <0 0x4b4f0000 0 0x20>;
+					reg-names = "pec", "cfg";
+				};
+
+				extdst@4b510000 {
+					compatible = "fsl,imx95-dc-extdst";
+					reg = <0 0x4b511000 0 0x1c>, <0 0x4b510000 0 0x28>;
+					reg-names = "pec", "cfg";
+					interrupt-parent = <&dc1_intc>;
+					interrupts = <3>, <4>, <5>;
+					interrupt-names = "shdload", "framecomplete", "seqcomplete";
+				};
+
+				constframe@4b500000 {
+					compatible = "fsl,imx95-dc-constframe";
+					reg = <0 0x4b501000 0 0xc>, <0 0x4b500000 0 0x20>;
+					reg-names = "pec", "cfg";
+				};
+
+				extdst@4b520000 {
+					compatible = "fsl,imx95-dc-extdst";
+					reg = <0 0x4b521000 0 0x1c>, <0 0x4b520000 0 0x28>;
+					reg-names = "pec", "cfg";
+					interrupt-parent = <&dc1_intc>;
+					interrupts = <9>, <10>, <11>;
+					interrupt-names = "shdload", "framecomplete", "seqcomplete";
+				};
+
+				constframe@4b530000 {
+					compatible = "fsl,imx95-dc-constframe";
+					reg = <0 0x4b531000 0 0xc>, <0 0x4b530000 0 0x20>;
+					reg-names = "pec", "cfg";
+				};
+
+				extdst@4b550000 {
+					compatible = "fsl,imx95-dc-extdst";
+					reg = <0 0x4b551000 0 0x1c>, <0 0x4b550000 0 0x28>;
+					reg-names = "pec", "cfg";
+					interrupt-parent = <&dc1_intc>;
+					interrupts = <6>, <7>, <8>;
+					interrupt-names = "shdload", "framecomplete", "seqcomplete";
+				};
+
+				constframe@4b540000 {
+					compatible = "fsl,imx95-dc-constframe";
+					reg = <0 0x4b541000 0 0xc>, <0 0x4b540000 0 0x20>;
+					reg-names = "pec", "cfg";
+				};
+
+				extdst@4b560000 {
+					compatible = "fsl,imx95-dc-extdst";
+					reg = <0 0x4b561000 0 0x1c>, <0 0x4b560000 0 0x28>;
+					reg-names = "pec", "cfg";
+					interrupt-parent = <&dc1_intc>;
+					interrupts = <12>, <13>, <14>;
+					interrupt-names = "shdload", "framecomplete", "seqcomplete";
+				};
+
+				fetchlayer@4b5d0000 {
+					compatible = "fsl,imx95-dc-fetchlayer";
+					reg = <0 0x4b5d1000 0 0xc>, <0 0x4b5d0000 0 0x404>;
+					reg-names = "pec", "cfg";
+				};
+
+				fetchlayer@4b5e0000 {
+					compatible = "fsl,imx95-dc-fetchlayer";
+					reg = <0 0x4b5e1000 0 0xc>, <0 0x4b5e0000 0 0x404>;
+					reg-names = "pec", "cfg";
+				};
+
+				layerblend@4b570000 {
+					compatible = "fsl,imx95-dc-layerblend";
+					reg = <0 0x4b571000 0 0x10>, <0 0x4b570000 0 0x20>;
+					reg-names = "pec", "cfg";
+				};
+
+				layerblend@4b580000 {
+					compatible = "fsl,imx95-dc-layerblend";
+					reg = <0 0x4b581000 0 0x10>, <0 0x4b580000 0 0x20>;
+					reg-names = "pec", "cfg";
+				};
+
+				layerblend@4b590000 {
+					compatible = "fsl,imx95-dc-layerblend";
+					reg = <0 0x4b591000 0 0x10>, <0 0x4b590000 0 0x20>;
+					reg-names = "pec", "cfg";
+				};
+
+				layerblend@4b5a0000 {
+					compatible = "fsl,imx95-dc-layerblend";
+					reg = <0 0x4b5a1000 0 0x10>, <0 0x4b5a0000 0 0x20>;
+					reg-names = "pec", "cfg";
+				};
+
+				layerblend@4b5b0000 {
+					compatible = "fsl,imx95-dc-layerblend";
+					reg = <0 0x4b5b1000 0 0x10>, <0 0x4b5b0000 0 0x20>;
+					reg-names = "pec", "cfg";
+				};
+
+				layerblend@4b5c0000 {
+					compatible = "fsl,imx95-dc-layerblend";
+					reg = <0 0x4b5c1000 0 0x10>, <0 0x4b5c0000 0 0x20>;
+					reg-names = "pec", "cfg";
+				};
+			};
+
+			display-engine@4b600000 {
+				compatible = "fsl,imx95-dc-display-engine";
+				reg = <0 0x4b711000 0 0x14>, <0 0x4b710000 0 0x1c00>;
+				reg-names = "top", "cfg";
+				interrupt-parent = <&dc1_intc>;
+				interrupts = <18>, <19>, <20>;
+				interrupt-names = "shdload", "framecomplete", "seqcomplete";
+				power-domains = <&scmi_devpd IMX95_PD_DISPLAY>;
+				#address-cells = <2>;
+				#size-cells = <2>;
+				ranges;
+
+				domainblend@4b6a0000 {
+					compatible = "fsl,imx95-dc-domainblend";
+					reg = <0 0x4b6a0000 0 0x20>;
+				};
+
+				framegen@4b6b0000 {
+					compatible = "fsl,imx95-dc-framegen";
+					reg = <0 0x4b6b0000 0 0x98>;
+
+					clocks = <&scmi_clk IMX95_CLK_DISP1PIX>,
+						 <&scmi_clk IMX95_CLK_DISPAPB>,
+						 <&scmi_clk IMX95_CLK_DISPAXI>,
+						 <&scmi_clk IMX95_CLK_DISPOCRAM>,
+						 <&ldb_pll_pixel>,
+						 <&scmi_clk IMX95_CLK_LDBPLL_VCO>;
+					clock-names = "pix", "apb", "axi", "ocram", "ldb", "ldb_vco";
+
+					interrupt-parent = <&dc1_intc>;
+					interrupts = <21>, <22>, <23>, <24>, <58>, <59>;
+					interrupt-names = "int0", "int1", "int2", "int3",
+							   "primsync_on", "primsync_off";
+				};
+
+				tcon {
+					compatible = "fsl,imx95-dc-tcon";
+
+					port {
+						dpu_disp0_to_pixel_interleaver_disp0: endpoint {
+							remote-endpoint = <&pixel_interleaver_disp0_to_dpu_disp0>;
+						};
+					};
+				};
+			};
+
+			display-engine@4b700000 {
+				compatible = "fsl,imx95-dc-display-engine";
+				reg = <0 0x4b771000 0 0x14>, <0 0x4b770000 0 0x1c00>;
+				reg-names = "top", "cfg";
+				interrupt-parent = <&dc1_intc>;
+				interrupts = <41>, <42>, <43>;
+				interrupt-names = "shdload", "framecomplete", "seqcomplete";
+				power-domains = <&scmi_devpd IMX95_PD_DISPLAY>;
+				#address-cells = <2>;
+				#size-cells = <2>;
+				ranges;
+
+				domainblend@4b720000 {
+					compatible = "fsl,imx95-dc-domainblend";
+					reg = <0 0x4b720000 0 0x20>;
+				};
+
+				framegen@4b730000 {
+					compatible = "fsl,imx95-dc-framegen";
+					reg = <0 0x4b730000 0 0x98>;
+
+					clocks = <&scmi_clk IMX95_CLK_DISP1PIX>,
+						 <&scmi_clk IMX95_CLK_DISPAPB>,
+						 <&scmi_clk IMX95_CLK_DISPAXI>,
+						 <&scmi_clk IMX95_CLK_DISPOCRAM>,
+						 <&ldb_pll_pixel>,
+						 <&scmi_clk IMX95_CLK_LDBPLL_VCO>;
+					clock-names = "pix", "apb", "axi", "ocram", "ldb", "ldb_vco";
+
+					interrupt-parent = <&dc1_intc>;
+					interrupts = <34>, <35>, <36>, <37>, <72>, <73>;
+					interrupt-names = "int0", "int1", "int2", "int3",
+							  "primsync_on", "primsync_off";
+				};
+
+				tcon {
+					compatible = "fsl,imx95-dc-tcon";
+
+					port {
+						dpu_disp1_to_pixel_interleaver_disp1: endpoint {
+							remote-endpoint = <&pixel_interleaver_disp1_to_dpu_disp1>;
+						};
+					};
+				};
+			};
+		};
+
 		usb3: usb@4c010010 {
 			compatible = "fsl,imx95-dwc3", "fsl,imx8mp-dwc3";
 			reg = <0x0 0x4c010010 0x0 0x04>,
-- 
2.51.0

