Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFD47FA5D7
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 17:13:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05B8E10E2EC;
	Mon, 27 Nov 2023 16:13:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A05810E2EC
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 16:13:12 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <auto@pengutronix.de>)
 id 1r7eEI-0001PM-89; Mon, 27 Nov 2023 17:13:02 +0100
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <auto@pengutronix.de>)
 id 1r7eEF-00Bz1F-Jx; Mon, 27 Nov 2023 17:12:59 +0100
Received: from rhi by dude04.red.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <auto@pengutronix.de>) id 1r7eEF-00D7aL-1j;
 Mon, 27 Nov 2023 17:12:59 +0100
From: Roland Hieber <rhi@pengutronix.de>
Date: Mon, 27 Nov 2023 17:12:29 +0100
Subject: [PATCH 2/2] ARM: dts: imx7: add MIPI-DSI support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231127-b4-imx7-mipi-dsi-v1-2-7d22eee70c67@pengutronix.de>
References: <20231127-b4-imx7-mipi-dsi-v1-0-7d22eee70c67@pengutronix.de>
In-Reply-To: <20231127-b4-imx7-mipi-dsi-v1-0-7d22eee70c67@pengutronix.de>
To: Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>
X-Mailer: b4 0.12.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: auto@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: devicetree@vger.kernel.org, Marco Felsch <m.felsch@pengutronix.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Roland Hieber <rhi@pengutronix.de>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Marco Felsch <m.felsch@pengutronix.de>

This adds the device tree support for the MIPI-DSI block. The block can
be used as encoder for the parallel signals coming from the lcdif block.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
Signed-off-by: Roland Hieber <rhi@pengutronix.de>
---
 arch/arm/boot/dts/nxp/imx/imx7s.dtsi | 46 ++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7s.dtsi b/arch/arm/boot/dts/nxp/imx/imx7s.dtsi
index 29b8fd03567a..7adadf9c3694 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7s.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7s.dtsi
@@ -818,6 +818,16 @@ lcdif: lcdif@30730000 {
 					<&clks IMX7D_LCDIF_PIXEL_ROOT_CLK>;
 				clock-names = "pix", "axi";
 				status = "disabled";
+
+				port {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					lcdif_out_mipi_dsi: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&mipi_dsi_in_lcdif>;
+					};
+				};
 			};
 
 			mipi_csi: mipi-csi@30750000 {
@@ -850,6 +860,42 @@ mipi_vc0_to_csi_mux: endpoint {
 					};
 				};
 			};
+
+			mipi_dsi: dsi@30760000 {
+				compatible = "fsl,imx7d-mipi-dsim", "fsl,imx8mm-mipi-dsim";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x30760000 0x400>;
+				clocks = <&clks IMX7D_MIPI_DSI_ROOT_CLK>,
+					 <&clks IMX7D_MIPI_DPHY_ROOT_CLK>;
+				clock-names = "bus_clk", "sclk_mipi";
+				assigned-clocks = <&clks IMX7D_MIPI_DSI_ROOT_SRC>,
+						  <&clks IMX7D_PLL_SYS_PFD5_CLK>;
+				assigned-clock-parents = <&clks IMX7D_PLL_SYS_PFD5_CLK>;
+				assigned-clock-rates = <0>, <333000000>;
+				power-domains = <&pgc_mipi_phy>;
+				interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
+				samsung,burst-clock-frequency = <891000000>;
+				samsung,esc-clock-frequency = <20000000>;
+				samsung,pll-clock-frequency = <24000000>;
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						mipi_dsi_in_lcdif: endpoint@0 {
+							reg = <0>;
+							remote-endpoint = <&lcdif_out_mipi_dsi>;
+						};
+					};
+				};
+			};
 		};
 
 		aips3: bus@30800000 {

-- 
2.39.2

