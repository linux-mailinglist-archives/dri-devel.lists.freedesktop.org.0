Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 474764CEC99
	for <lists+dri-devel@lfdr.de>; Sun,  6 Mar 2022 18:39:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02B2310EB8A;
	Sun,  6 Mar 2022 17:39:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CE2B10EB82
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Mar 2022 17:39:26 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D3D028EB;
 Sun,  6 Mar 2022 18:39:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1646588364;
 bh=JIMSoPxehp3nCTF+tC6Pm7fJTU+1xuAQyLg+rRqV5eo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BdGkejs3Cdtb4p2TmMNd9yEhIXFTaDidK9G4DHclU4wsrbZwjtPb4j06OCaI3E1N/
 frfAcJiJjlzrsZSB1RVhw+cj8g4ysu7aEuL9EFZrRfU+yySySbfq2DtarrTP4MrRuC
 r9al7WJuaG9hSUHbBmlo+0B4jh+O9CwYj4gi+KzM=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: devicetree@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/3] ARM: dts: Use new media bus type macros
Date: Sun,  6 Mar 2022 19:39:05 +0200
Message-Id: <20220306173905.22990-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220306173905.22990-1-laurent.pinchart@ideasonboard.com>
References: <20220306173905.22990-1-laurent.pinchart@ideasonboard.com>
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
Cc: Jacopo Mondi <jacopo@jmondi.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Rob Herring <robh+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Eugen Hristev <eugen.hristev@microchip.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that a header exists with macros for the media interface bus-type
values, replace hardcoding numerical constants with the corresponding
macros in the DT sources.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 arch/arm/boot/dts/imx6ul-14x14-evk.dtsi               |  4 +++-
 arch/arm/boot/dts/omap3-n900.dts                      |  5 +++--
 arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts       | 11 +++++++----
 .../dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi     |  4 +++-
 .../dts/r8a7742-iwg21d-q7-dbcm-ov7725-single.dtsi     |  4 +++-
 arch/arm/boot/dts/stm32429i-eval.dts                  |  3 ++-
 arch/arm/boot/dts/stm32mp157c-ev1.dts                 |  3 ++-
 7 files changed, 23 insertions(+), 11 deletions(-)

diff --git a/arch/arm/boot/dts/imx6ul-14x14-evk.dtsi b/arch/arm/boot/dts/imx6ul-14x14-evk.dtsi
index a3fde3316c73..89234bbd02f4 100644
--- a/arch/arm/boot/dts/imx6ul-14x14-evk.dtsi
+++ b/arch/arm/boot/dts/imx6ul-14x14-evk.dtsi
@@ -2,6 +2,8 @@
 //
 // Copyright (C) 2015 Freescale Semiconductor, Inc.
 
+#include <dt-bindings/media/video-interfaces.h>
+
 / {
 	chosen {
 		stdout-path = &uart1;
@@ -170,7 +172,7 @@ &csi {
 	port {
 		parallel_from_ov5640: endpoint {
 			remote-endpoint = <&ov5640_to_parallel>;
-			bus-type = <5>; /* Parallel bus */
+			bus-type = <MEDIA_BUS_TYPE_BT601>;
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/omap3-n900.dts b/arch/arm/boot/dts/omap3-n900.dts
index d40c3d2c4914..9cad9d6a83e2 100644
--- a/arch/arm/boot/dts/omap3-n900.dts
+++ b/arch/arm/boot/dts/omap3-n900.dts
@@ -9,6 +9,7 @@
 #include "omap34xx.dtsi"
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/media/video-interfaces.h>
 
 /*
  * Default secure signed bootloader (Nokia X-Loader) does not enable L3 firewall
@@ -194,7 +195,7 @@ port@1 {
 
 			csi_isp: endpoint {
 				remote-endpoint = <&csi_cam1>;
-				bus-type = <3>; /* CCP2 */
+				bus-type = <MEDIA_BUS_TYPE_CCP2>;
 				clock-lanes = <1>;
 				data-lanes = <0>;
 				lane-polarity = <0 0>;
@@ -835,7 +836,7 @@ cam1: camera@3e {
 
 		port {
 			csi_cam1: endpoint {
-				bus-type = <3>; /* CCP2 */
+				bus-type = <MEDIA_BUS_TYPE_CCP2>;
 				strobe = <1>;
 				clock-inv = <0>;
 				crc = <1>;
diff --git a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
index 3c8a7c8b1fdd..1043603fc4a5 100644
--- a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
+++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
@@ -7,6 +7,9 @@
  */
 
 /dts-v1/;
+
+#include <dt-bindings/media/video-interfaces.h>
+
 #include "r8a7742-iwg21d-q7.dts"
 
 / {
@@ -242,7 +245,7 @@ port {
 		vin0ep: endpoint {
 			remote-endpoint = <&cam0ep>;
 			bus-width = <8>;
-			bus-type = <6>;
+			bus-type = <MEDIA_BUS_TYPE_BT656>;
 		};
 	};
 };
@@ -273,7 +276,7 @@ port {
 		vin1ep: endpoint {
 			remote-endpoint = <&cam1ep>;
 			bus-width = <8>;
-			bus-type = <6>;
+			bus-type = <MEDIA_BUS_TYPE_BT656>;
 		};
 	};
 };
@@ -305,7 +308,7 @@ vin2ep: endpoint {
 			remote-endpoint = <&cam2ep>;
 			bus-width = <8>;
 			data-shift = <8>;
-			bus-type = <6>;
+			bus-type = <MEDIA_BUS_TYPE_BT656>;
 		};
 	};
 };
@@ -335,7 +338,7 @@ port {
 		vin3ep: endpoint {
 			remote-endpoint = <&cam3ep>;
 			bus-width = <8>;
-			bus-type = <6>;
+			bus-type = <MEDIA_BUS_TYPE_BT656>;
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi
index 40cef0b1d1e6..c73160df619d 100644
--- a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi
+++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi
@@ -7,6 +7,8 @@
  * Copyright (C) 2020 Renesas Electronics Corp.
  */
 
+#include <dt-bindings/media/video-interfaces.h>
+
 #define CAM_ENABLED	1
 
 &CAM_PARENT_I2C {
@@ -26,7 +28,7 @@ port {
 			CAM_EP: endpoint {
 				bus-width = <8>;
 				data-shift = <2>;
-				bus-type = <6>;
+				bus-type = <MEDIA_BUS_TYPE_BT656>;
 				pclk-sample = <1>;
 				remote-endpoint = <&VIN_EP>;
 			};
diff --git a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov7725-single.dtsi b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov7725-single.dtsi
index f5e77f024251..a7f5cfec64b8 100644
--- a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov7725-single.dtsi
+++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov7725-single.dtsi
@@ -7,6 +7,8 @@
  * Copyright (C) 2020 Renesas Electronics Corp.
  */
 
+#include <dt-bindings/media/video-interfaces.h>
+
 #define CAM_ENABLED	1
 
 &CAM_PARENT_I2C {
@@ -21,7 +23,7 @@ ov7725@21 {
 		port {
 			CAM_EP: endpoint {
 				bus-width = <8>;
-				bus-type = <6>;
+				bus-type = <MEDIA_BUS_TYPE_BT656>;
 				remote-endpoint = <&VIN_EP>;
 			};
 		};
diff --git a/arch/arm/boot/dts/stm32429i-eval.dts b/arch/arm/boot/dts/stm32429i-eval.dts
index cb46326a8c75..ecb10613d962 100644
--- a/arch/arm/boot/dts/stm32429i-eval.dts
+++ b/arch/arm/boot/dts/stm32429i-eval.dts
@@ -50,6 +50,7 @@
 #include "stm32f429-pinctrl.dtsi"
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/media/video-interfaces.h>
 
 / {
 	model = "STMicroelectronics STM32429i-EVAL board";
@@ -186,7 +187,7 @@ &dcmi {
 	port {
 		dcmi_0: endpoint {
 			remote-endpoint = <&ov2640_0>;
-			bus-type = <5>;
+			bus-type = <MEDIA_BUS_TYPE_BT601>;
 			bus-width = <8>;
 			hsync-active = <0>;
 			vsync-active = <0>;
diff --git a/arch/arm/boot/dts/stm32mp157c-ev1.dts b/arch/arm/boot/dts/stm32mp157c-ev1.dts
index e222d2d2cb44..24f59f3b15dc 100644
--- a/arch/arm/boot/dts/stm32mp157c-ev1.dts
+++ b/arch/arm/boot/dts/stm32mp157c-ev1.dts
@@ -8,6 +8,7 @@
 #include "stm32mp157c-ed1.dts"
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/media/video-interfaces.h>
 
 / {
 	model = "STMicroelectronics STM32MP157C eval daughter on eval mother";
@@ -90,7 +91,7 @@ &dcmi {
 	port {
 		dcmi_0: endpoint {
 			remote-endpoint = <&ov5640_0>;
-			bus-type = <5>;
+			bus-type = <MEDIA_BUS_TYPE_BT601>;
 			bus-width = <8>;
 			hsync-active = <0>;
 			vsync-active = <0>;
-- 
Regards,

Laurent Pinchart

