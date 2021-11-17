Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0891D455593
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 08:29:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01F616ECB0;
	Thu, 18 Nov 2021 07:29:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1583089B49
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 14:34:13 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1mnM0h-0005ti-5r; Wed, 17 Nov 2021 15:34:03 +0100
Received: from sha by dude02.hi.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1mnM0b-001P6W-54; Wed, 17 Nov 2021 15:33:57 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 09/12] arm64: dts: rockchip: rk356x: Add HDMI nodes
Date: Wed, 17 Nov 2021 15:33:44 +0100
Message-Id: <20211117143347.314294-10-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211117143347.314294-1-s.hauer@pengutronix.de>
References: <20211117143347.314294-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
X-Mailman-Approved-At: Thu, 18 Nov 2021 07:28:27 +0000
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sandy Huang <hjc@rock-chips.com>,
 linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Peter Geis <pgwipeout@gmail.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for the HDMI port found on RK3568.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 arch/arm64/boot/dts/rockchip/rk356x.dtsi | 65 ++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk356x.dtsi b/arch/arm64/boot/dts/rockchip/rk356x.dtsi
index 6ebf7c14e096a..53be61a7ce595 100644
--- a/arch/arm64/boot/dts/rockchip/rk356x.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk356x.dtsi
@@ -472,18 +472,36 @@ vp0: port@0 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				reg = <0>;
+
+				vp0_out_hdmi: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&hdmi_in_vp0>;
+					status = "disabled";
+				};
 			};
 
 			vp1: port@1 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				reg = <1>;
+
+				vp1_out_hdmi: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&hdmi_in_vp1>;
+					status = "disabled";
+				};
 			};
 
 			vp2: port@2 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				reg = <2>;
+
+				vp2_out_hdmi: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&hdmi_in_vp2>;
+					status = "disabled";
+				};
 			};
 		};
 	};
@@ -499,6 +517,53 @@ vop_mmu: iommu@fe043e00 {
 		status = "disabled";
 	};
 
+	hdmi: hdmi@fe0a0000 {
+		compatible = "rockchip,rk3568-dw-hdmi";
+		reg = <0x0 0xfe0a0000 0x0 0x20000>;
+		interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru PCLK_HDMI_HOST>,
+			 <&cru CLK_HDMI_SFR>,
+			 <&cru CLK_HDMI_CEC>,
+			 <&cru HCLK_VOP>;
+		clock-names = "iahb", "isfr", "cec", "hclk";
+		power-domains = <&power RK3568_PD_VO>;
+		reg-io-width = <4>;
+		rockchip,grf = <&grf>;
+		#sound-dai-cells = <0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&hdmitx_scl &hdmitx_sda &hdmitxm0_cec>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			hdmi_in: port@0 {
+				reg = <0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				hdmi_in_vp0: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&vp0_out_hdmi>;
+					status = "disabled";
+				};
+
+				hdmi_in_vp1: endpoint@1 {
+					reg = <1>;
+					remote-endpoint = <&vp1_out_hdmi>;
+					status = "disabled";
+				};
+
+				hdmi_in_vp2: endpoint@2 {
+					reg = <2>;
+					remote-endpoint = <&vp2_out_hdmi>;
+					status = "disabled";
+				};
+			};
+		};
+	};
+
 	qos_gpu: qos@fe128000 {
 		compatible = "rockchip,rk3568-qos", "syscon";
 		reg = <0x0 0xfe128000 0x0 0x20>;
-- 
2.30.2

