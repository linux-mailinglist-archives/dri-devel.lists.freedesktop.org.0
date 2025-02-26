Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF31EA46248
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 15:19:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E0C010E957;
	Wed, 26 Feb 2025 14:19:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Bx0SER4O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EFC310E911
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 14:19:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 914F15C554B;
 Wed, 26 Feb 2025 14:18:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AA9F0C4AF5F;
 Wed, 26 Feb 2025 14:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740579559;
 bh=FJ54yO04PKk7jacqo+ONYP3+FlHuQ9rLC64gl6G9Bxw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=Bx0SER4Oj9bgCKXX5eDGYro0by2MXI/0h1OQoxG71hJmnyv2kqLF5ubWBZoYX5U1V
 nvlaMkW2Hj54oCNUXCob9A7K+3fLax2r2Fxxvzgzwuy9hd2Hs59YyfUl27FE9TBw2/
 tJ9887jkP01azx9n+bS80ub2PkBMPIllNIzkTK1W65CtVz/4vdcAlP+ppsgvY6wIQD
 TMkw4gTiWhya7MGPaaxYO1E//2glbJtWb2Ts32MEQZPZHOL2bney7q7IUcTPLHJ1Cv
 kbi2gQzIGuA6Ek/eiVeFY2JvjlSC/yXtRqhvKd0Hr+qe8Y0SfknpnNt1LT1+flDBRJ
 5vqPllpsY9Shg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 986ABC19F2E;
 Wed, 26 Feb 2025 14:19:19 +0000 (UTC)
From: Maud Spierings via B4 Relay
 <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Wed, 26 Feb 2025 15:19:22 +0100
Subject: [PATCH v2 11/12] arm64: dts: freescale: Add the BOE av123z7m-n17
 variant of the Moduline Display
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250226-initial_display-v2-11-23fafa130817@gocontroll.com>
References: <20250226-initial_display-v2-0-23fafa130817@gocontroll.com>
In-Reply-To: <20250226-initial_display-v2-0-23fafa130817@gocontroll.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740579556; l=3566;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=oTP9B5+eckemcAq7BoHH8WLYSzQY53IU8NlYcoi8TI4=;
 b=gtKh5ZnGCMRzyf8rS5Cyu6XQpZBunDrsBYyz/LTIEp8TzUQcvNWw07RlZWPuoSDk29EIxwmAg
 zsqb0P/UmzrB9oB+hZ0cMK6CRUcRPD7sYQqAqHr1Vwu1+gs9t0J1vQf
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
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
Reply-To: maudspierings@gocontroll.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Maud Spierings <maudspierings@gocontroll.com>

Add the BOE av123z7m-n17 variant of the Moduline Display, this variant
comes with a 12.3" 1920x720 display.

Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>

---
Currently the backlight driver is not available, this will be upstreamed
in a future patch series. It is a Maxim max25014atg.
---
 ...tx8p-ml81-moduline-display-106-av123z7m-n17.dts | 133 +++++++++++++++++++++
 1 file changed, 133 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dts b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dts
new file mode 100644
index 0000000000000000000000000000000000000000..129c69598f38566460efb271628c1d1e10eb2a85
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dts
@@ -0,0 +1,133 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2025 GOcontroll B.V.
+ * Author: Maud Spierings <maudspierings@gocontroll.com>
+ */
+
+/dts-v1/;
+
+#include "imx8mp-tx8p-ml81-moduline-display-106.dtsi"
+
+/ {
+	model = "GOcontroll Moduline Display with BOE av123z7m-n17 display";
+
+	panel {
+		compatible = "boe,av123z7m-n17";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_panel>;
+		enable-gpios = <&gpio1 7 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&gpio1 9 GPIO_ACTIVE_LOW>;
+		power-supply = <&reg_3v3_per>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				dual-lvds-odd-pixels;
+
+				panel_in0: endpoint {
+					remote-endpoint = <&lvds1_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				dual-lvds-even-pixels;
+
+				panel_in1: endpoint {
+					remote-endpoint = <&lvds0_out>;
+				};
+			};
+		};
+	};
+};
+
+&i2c4 {
+	bridge@2d { /* sn65dsi85 */
+		compatible = "ti,sn65dsi84";
+		reg = <0x2d>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_lvds_bridge>;
+		enable-gpios = <&gpio4 14 GPIO_ACTIVE_HIGH>;
+		vcc-supply = <&reg_1v8_per>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				dsi_lvds_bridge_in: endpoint {
+					remote-endpoint = <&mipi_dsi_out>;
+					data-lanes = <1 2 3 4>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				lvds0_out: endpoint {
+					remote-endpoint = <&panel_in1>;
+				};
+			};
+
+			port@3 {
+				reg = <3>;
+
+				lvds1_out: endpoint {
+					remote-endpoint = <&panel_in0>;
+				};
+			};
+		};
+	};
+
+	/* max25014 @ 0x6f */
+};
+
+&lcdif1 {
+	status = "okay";
+};
+
+&mipi_dsi {
+	samsung,esc-clock-frequency = <12000000>;
+	/*
+	 * burst has to be at least 2x dsi clock that the sn65dsi85 expects
+	 * display pixelclock * bpp / lanes / 2 = dsi clock
+	 * 88.000.000 * 24 / 4 / 2 = 264.000.000
+	 * range gets rounded up to 265.000.000 - 270.000.000
+	 * 267.500.000 * 2 = 535.000.000
+	 */
+	samsung,burst-clock-frequency = <535000000>;
+	status = "okay";
+
+	ports {
+		port@1 {
+			mipi_dsi_out: endpoint {
+				remote-endpoint = < &dsi_lvds_bridge_in>;
+				data-lanes = <1 2 3 4>;
+			};
+		};
+	};
+};
+
+&iomuxc {
+	pinctrl_lvds_bridge: lvdsbridgegrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI1_TXD2__GPIO4_IO14 /* COM pin 113 */
+			MX8MP_DSE_X1
+		>;
+	};
+
+	pinctrl_panel: panelgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO07__GPIO1_IO07 /* COM pin 157 */
+			MX8MP_DSE_X1
+			MX8MP_IOMUXC_GPIO1_IO09__GPIO1_IO09 /* COM pin 159 */
+			MX8MP_DSE_X1
+		>;
+	};
+};

-- 
2.48.1


