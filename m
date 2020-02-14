Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C17315D4A0
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 10:22:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9829A6F8E8;
	Fri, 14 Feb 2020 09:22:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 256106F8E8
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 09:22:49 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01E9Mg3w113503;
 Fri, 14 Feb 2020 03:22:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1581672162;
 bh=pIyaS5ys8ohp+Z+ExkY5QFJRkuhfYRBSJTMw3mE1fgs=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=IrSmm8TVtrW84YYCRBXCTPEbgbQOSYNyE3oZNGJ2WfIvu4VgAZiobdbCoXXJlSyIN
 ExB3loQb5rDxuSLHdEgWMMHw3xVZr4Fi0liwlEJeLPTb9pLwT85lnX2cqKXl4uHa41
 pucLrFhGSTBG3DPwpUByzUcQeRbi0tyvBCclv4oc=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01E9MgcK026731
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 14 Feb 2020 03:22:42 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 14
 Feb 2020 03:22:41 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 14 Feb 2020 03:22:41 -0600
Received: from jadmar.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01E9MJj8086345;
 Fri, 14 Feb 2020 03:22:30 -0600
From: Jyri Sarha <jsarha@ti.com>
To: <dri-devel@lists.freedesktop.org>, <ssantosh@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>
Subject: [PATCH resend 2/2] ARM: dts: keystone-k2g-evm: add HDMI video support
Date: Fri, 14 Feb 2020 11:22:15 +0200
Message-ID: <f6f51177e44a36db2ba9f3411ee26db387c38e2f.1581671951.git.jsarha@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1581671951.git.jsarha@ti.com>
References: <cover.1581671951.git.jsarha@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: mark.rutland@arm.com, praneeth@ti.com, robh+dt@kernel.org,
 peter.ujfalusi@ti.com, tomi.valkeinen@ti.com,
 laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add DT nodes for HDMI video support for K2G EVM. The HDMI uses SiI9022
DPI as HDMI encoder. The DSS DPI is connected to SiI9022 HDMI
encoder's video input and encoder's output goes to HDMI connector.

Signed-off-by: Jyri Sarha <jsarha@ti.com>
---
 arch/arm/boot/dts/keystone-k2g-evm.dts | 101 +++++++++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/arch/arm/boot/dts/keystone-k2g-evm.dts b/arch/arm/boot/dts/keystone-k2g-evm.dts
index b7f10bf94576..db640bab8c1d 100644
--- a/arch/arm/boot/dts/keystone-k2g-evm.dts
+++ b/arch/arm/boot/dts/keystone-k2g-evm.dts
@@ -45,6 +45,19 @@
 		regulator-max-microvolt = <1800000>;
 		regulator-always-on;
 	};
+
+	hdmi: connector {
+		compatible = "hdmi-connector";
+		label = "hdmi";
+
+		type = "a";
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&sii9022_out>;
+			};
+		};
+	};
 };
 
 &k2g_pinctrl {
@@ -89,6 +102,13 @@
 		>;
 	};
 
+	i2c1_pins: pinmux_i2c1_pins {
+		pinctrl-single,pins = <
+			K2G_CORE_IOPAD(0x1384) (BUFFER_CLASS_B | PIN_PULLUP | MUX_MODE0)	/* i2c1_scl.i2c1_scl */
+			K2G_CORE_IOPAD(0x1388) (BUFFER_CLASS_B | PIN_PULLUP | MUX_MODE0)	/* i2c1_sda.i2c1_sda */
+		>;
+	};
+
 	ecap0_pins: ecap0_pins {
 		pinctrl-single,pins = <
 			K2G_CORE_IOPAD(0x1374) (BUFFER_CLASS_B | MUX_MODE4)	/* pr1_mdio_data.ecap0_in_apwm0_out */
@@ -160,6 +180,40 @@
 			K2G_CORE_IOPAD(0x1188) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0)	/* MDIO_DATA.MDIO_DATA */
 		>;
 	};
+
+	vout_pins: pinmux_vout_pins {
+		pinctrl-single,pins = <
+			K2G_CORE_IOPAD(0x1078) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0) /* dssdata23.dssdata23 */
+			K2G_CORE_IOPAD(0x107c) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0) /* dssdata22.dssdata22 */
+			K2G_CORE_IOPAD(0x1080) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0) /* dssdata21.dssdata21 */
+			K2G_CORE_IOPAD(0x1084) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0) /* dssdata20.dssdata20 */
+			K2G_CORE_IOPAD(0x1088) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0) /* dssdata19.dssdata19 */
+			K2G_CORE_IOPAD(0x108c) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0) /* dssdata18.dssdata18 */
+			K2G_CORE_IOPAD(0x1090) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0) /* dssdata17.dssdata17 */
+			K2G_CORE_IOPAD(0x1094) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0) /* dssdata16.dssdata16 */
+			K2G_CORE_IOPAD(0x1098) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0) /* dssdata15.dssdata15 */
+			K2G_CORE_IOPAD(0x109c) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0) /* dssdata14.dssdata14 */
+			K2G_CORE_IOPAD(0x10a0) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0) /* dssdata13.dssdata13 */
+			K2G_CORE_IOPAD(0x10a4) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0) /* dssdata12.dssdata12 */
+			K2G_CORE_IOPAD(0x10a8) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0) /* dssdata11.dssdata11 */
+			K2G_CORE_IOPAD(0x10ac) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0) /* dssdata10.dssdata10 */
+			K2G_CORE_IOPAD(0x10b0) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0) /* dssdata9.dssdata9 */
+			K2G_CORE_IOPAD(0x10b4) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0) /* dssdata8.dssdata8 */
+			K2G_CORE_IOPAD(0x10b8) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0) /* dssdata7.dssdata7 */
+			K2G_CORE_IOPAD(0x10bc) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0) /* dssdata6.dssdata6 */
+			K2G_CORE_IOPAD(0x10c0) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0) /* dssdata5.dssdata5 */
+			K2G_CORE_IOPAD(0x10c4) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0) /* dssdata4.dssdata4 */
+			K2G_CORE_IOPAD(0x10c8) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0) /* dssdata3.dssdata3 */
+			K2G_CORE_IOPAD(0x10cc) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0) /* dssdata2.dssdata2 */
+			K2G_CORE_IOPAD(0x10d0) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0) /* dssdata1.dssdata1 */
+			K2G_CORE_IOPAD(0x10d4) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0) /* dssdata0.dssdata0 */
+			K2G_CORE_IOPAD(0x10d8) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0) /* dssvsync.dssvsync */
+			K2G_CORE_IOPAD(0x10dc) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0) /* dsshsync.dsshsync */
+			K2G_CORE_IOPAD(0x10e0) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0) /* dsspclk.dsspclk */
+			K2G_CORE_IOPAD(0x10e4) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0) /* dssde.dssde */
+			K2G_CORE_IOPAD(0x10e8) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0) /* dssfid.dssfid */
+		>;
+	};
 };
 
 &uart0 {
@@ -357,3 +411,50 @@
 	pinctrl-0 = <&emac_pins>;
 	status = "okay";
 };
+
+&i2c1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c1_pins>;
+	status = "okay";
+	clock-frequency = <400000>;
+
+	sii9022: sii9022@3b {
+		#sound-dai-cells = <0>;
+		compatible = "sil,sii9022";
+		reg = <0x3b>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				sii9022_in: endpoint {
+					remote-endpoint = <&dpi_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				sii9022_out: endpoint {
+					remote-endpoint = <&hdmi_connector_in>;
+				};
+			};
+		};
+	};
+};
+
+&dss {
+	pinctrl-names = "default";
+	pinctrl-0 = <&vout_pins>;
+	status = "ok";
+
+	port {
+		dpi_out: endpoint {
+			remote-endpoint = <&sii9022_in>;
+			data-lines = <24>;
+		};
+	};
+};
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
