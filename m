Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C53514FBCD3
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 15:11:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3AF510E5DA;
	Mon, 11 Apr 2022 13:11:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A54010E1A5
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 13:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1649682674; x=1681218674;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gkzYs04WI7cM9Rzze08QMS7di0acJurK5Szd69H/Kyw=;
 b=ZGywdQWnn95NxYNfcRUmiub7Vt6ybFQsrWhHvgakp1M4dwdYV4cfmTSz
 XWDUf3vNeXsvpyxC2E4Butmqbk+cH9anSPvldosbrDQf+6Km2wIFkBt8G
 4qEe0jY2+8YXlya/tpo/4gRK/u7hAnHjvpVp35ZFf+Js51tZ2Hm3+zuip
 I0+hUfYb97+ET5/D3FyWxM+nu2EdwpFLUYECwmxwPv1RQ3Ln1BL+YUzJh
 ar9g2yOTbWgSfa1REgpxTH4lIh0bDThgnIKU1BavgU6cx4WBzNdy9Ocuy
 1YQWYT93lUCenPJcdL2Fiq6ees4mTXTgXxZ0xGty6/I4HnFZAJJ6cYWqR g==;
X-IronPort-AV: E=Sophos;i="5.90,251,1643670000"; d="scan'208";a="23223918"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 11 Apr 2022 15:11:11 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Mon, 11 Apr 2022 15:11:11 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Mon, 11 Apr 2022 15:11:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1649682671; x=1681218671;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gkzYs04WI7cM9Rzze08QMS7di0acJurK5Szd69H/Kyw=;
 b=g6VWTwV8nc8Ff9k1UsEB6DmSmTc+eCcNQt+rK+3KjVnvLo4k6d6D16hU
 A3WkZ1eXvfOxay0jrideW7WOr3n5vFtiFOKxf4UzRnfPtAiiFe+V7I7dd
 YHZWHffZosVMAtdt6hvSTErjrXV4n8Y7L/kNB6t3uJ1TFw/d1fp+DyjlJ
 HEDRRcyvLx9bt/I7TnzfbXKRYEFI9NV3kspVDnjiVEYYx5XJmXGdQLuQ+
 NDGY5fl26jntrkZ84JxSFf6dj3fC0/Nzv0UM8XQNCyEKmJ5EynPwGKDlc
 CrKxjVvg235Kjyw/TUsucN8h5IqprUljLF9rd+dFkvjOCEDTz2LC22jI8 w==;
X-IronPort-AV: E=Sophos;i="5.90,251,1643670000"; d="scan'208";a="23223917"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 11 Apr 2022 15:11:11 +0200
Received: from steina-w.localnet (unknown [10.123.49.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 3067A280070;
 Mon, 11 Apr 2022 15:11:11 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: (EXT) [PATCH 00/11] drm: bridge: Add Samsung MIPI DSIM bridge
Date: Mon, 11 Apr 2022 15:11:10 +0200
Message-ID: <7368756.EvYhyI6sBW@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20220408162108.184583-1-jagan@amarulasolutions.com>
References: <20220408162108.184583-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Fancy Fang <chen.fang@nxp.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 NXP Linux Team <linux-imx@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Jagan Teki <jagan@amarulasolutions.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Adam Ford <aford173@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Robert Foss <robert.foss@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jagan,

thanks for picking this up again and sending a new version.

Am Freitag, 8. April 2022, 18:20:57 CEST schrieb Jagan Teki:
> This series supports common bridge support for Samsung MIPI DSIM
> which is used in Exynos and i.MX8MM SoC's.
> 
> Previous RFC can be available here [1].
> 
> The final bridge supports both the Exynos and i.MX8MM DSI devices.
> 
> On, summary this patch-set break the entire DSIM driver into
> - platform specific glue code for platform ops, component_ops.
> - common bridge driver which handle platform glue init and invoke.
> 
> Patch 0000: 	Samsung DSIM bridge
> 
> Patch 0001: 	platform init flag via driver_data
> 
> Patch 0002/9:   bridge fixes, atomic API's
> 
> Patch 0010:	document fsl,imx8mm-mipi-dsim
> 
> Patch 0011:	add i.MX8MM DSIM support
> 
> Tested in Engicam i.Core MX8M Mini SoM.
> 
> Anyone interested, please have a look on this repo [2]
> 
> [2] https://github.com/openedev/kernel/tree/imx8mm-dsi-v1
> [1]
> https://lore.kernel.org/linux-arm-kernel/YP2j9k5SrZ2%2Fo2%2F5@ravnborg.org/
> T/
> 
> Any inputs?

With the following patch I can use LVDS, connected via an LVDS bridge on my 
TQMa8MxML + MBa8Mx. Unless I enable 4 MIPI-DSI lanes.
Using "data-lanes = <1 2 3 4>;" instead show a flickering image, but the 
"content" seems ok. On the downstream kernel MIPI-DSI is working, apparently 
using 4-lanes. On the first glance a bigger difference to the downstream 
kernel from NXP is that AFAICS they change the clocks depending on the 
currently selected mode [1]. I tried playing with the clocks but I don't fully 
grasp which clock has which effect, so I eventually had no results.
Any ideas what might be wrong here?

On a side note, might be completely unrelated to this series, I get the 
following warning as well:
> sn65dsi83 2-002d: Unsupported LVDS bus format 0x100a, please check output 
bridge driver. Falling back to SPWG24.

0x100a is MEDIA_BUS_FMT_RGB888_1X24 from 
samsung_dsim_atomic_get_input_bus_fmts(). For some reason this is propagates 
to the output_bus_cfg used in sn65dsi83_atomic_enable(). I would have expected 
this is MEDIA_BUS_FMT_RGB888_1X7X4_SPWG from "tianma,tm070jvhg33" display.

Best regards,
Alexander

[1] https://source.codeaurora.org/external/imx/linux-imx/tree/drivers/gpu/drm/
bridge/sec-dsim.c?h=lf-5.10.72-2.2.0#n1255

Here is my patch for the DT
--->8---
diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/
freescale/Makefile
index 52ce0f798657..7dd280b45681 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -58,6 +58,11 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-icore-mx8mm-edimm2.2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-kontron-n801x-s.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-nitrogen-r2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-tqma8mqml-mba8mx.dtb
+
+tqma8mqml-mba8mx-imx327-dtbs += imx8mm-tqma8mqml-mba8mx.dtb imx8mm-tqma8mqml-
mba8mx-imx327.dtbo
+tqma8mqml-mba8mx-lvds-dtbs += imx8mm-tqma8mqml-mba8mx.dtb imx8mm-tqma8mqml-
mba8mx-lvds.dtbo
+dtb-$(CONFIG_ARCH_MXC) += tqma8mqml-mba8mx-imx327.dtb tqma8mqml-mba8mx-
lvds.dtb
+
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-var-som-symphony.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw71xx-0x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw72xx-0x.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx-lvds.dts b/
arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx-lvds.dts
new file mode 100644
index 000000000000..8c743d291459
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx-lvds.dts
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright 2021-2022 TQ-Systems GmbH
+ */
+
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	compatible = "tq,imx8mm-tqma8mqml-mba8mx", "tq,imx8mm-tqma8mqml", 
"fsl,imx8mm";
+};
+
+&backlight_lvds0 {
+	status = "okay";
+};
+
+&dsi {
+	status = "okay";
+
+	ports {
+		port@1 {
+			mipi_dsi_out: endpoint {
+				remote-endpoint = 
<&lvds_bridge_in>;
+			};
+		};
+	};
+};
+
+&dsi_lvds_bridge {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			lvds_bridge_in: endpoint {
+				data-lanes = <1 2 3>;
+				remote-endpoint = <&mipi_dsi_out>;
+			};
+		};
+	};
+};
+
+&expander0 {
+	dsi-mux-oe-hog {
+		gpio-hog;
+		gpios = <10 0>;
+		output-low;
+		line-name = "DSI_MUX_OE#";
+	};
+};
+
+&lcdif {
+	status = "okay";
+};
+
+&panel0 {
+	compatible = "tianma,tm070jvhg33";
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/mba8mx.dtsi b/arch/arm64/boot/dts/
freescale/mba8mx.dtsi
index c2f0f1a1566c..4b2cca3268eb 100644
--- a/arch/arm64/boot/dts/freescale/mba8mx.dtsi
+++ b/arch/arm64/boot/dts/freescale/mba8mx.dtsi
@@ -8,6 +8,16 @@
 /* TQ-Systems GmbH MBa8Mx baseboard */
 
 / {
+	backlight_lvds0: backlight0 {
+		compatible = "pwm-backlight";
+		pwms = <&pwm3 0 5000000>;
+		brightness-levels = <0 4 8 16 32 64 128 255>;
+		default-brightness-level = <7>;
+		power-supply = <&reg_12v>;
+		enable-gpios = <&expander2 2 GPIO_ACTIVE_HIGH>;
+		status = "disabled";
+	};
+
 	beeper {
 		compatible = "pwm-beeper";
 		pwms = <&pwm4 0 250000 0>;
@@ -66,12 +76,31 @@ led2: led2 {
 		};
 	};
 
+	panel0: panel_lvds0 {
+		backlight = <&backlight_lvds0>;
+		status = "disabled";
+
+		port {
+			panel_in_lvds0: endpoint {
+				remote-endpoint = 
<&lvds_bridge_out>;
+			};
+		};
+	};
+
 	pcie0_refclk: pcie0-refclk {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <100000000>;
 	};
 
+	reg_12v: regulator-12v {
+		compatible = "regulator-fixed";
+		regulator-name = "MBA8MX_12V";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		regulator-always-on;
+	};
+
 	reg_hub_vbus: regulator-hub-vbus {
 		compatible = "regulator-fixed";
 		regulator-name = "MBA8MX_HUB_VBUS";
@@ -227,6 +256,27 @@ &i2c3 {
 	scl-gpios = <&gpio5 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	sda-gpios = <&gpio5 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	status = "okay";
+
+	dsi_lvds_bridge: dsi-lvds-bridge@2d {
+		compatible = "ti,sn65dsi83";
+		reg = <0x2d>;
+		enable-gpios = <&expander0 6 GPIO_ACTIVE_HIGH>;
+		vcc-supply = <&reg_sn65dsi83_1v8>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@2 {
+				reg = <2>;
+
+				lvds_bridge_out: endpoint {
+					remote-endpoint = 
<&panel_in_lvds0>;
+				};
+			};
+		};
+	};
 };
 
 &pwm3 {
--->8---





