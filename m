Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 268075EFC59
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 19:53:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA5D110EB98;
	Thu, 29 Sep 2022 17:53:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 406 seconds by postgrey-1.36 at gabe;
 Thu, 29 Sep 2022 17:11:49 UTC
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt
 [193.136.128.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFB1D10EB58
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 17:11:49 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id CAF846005C4E;
 Thu, 29 Sep 2022 18:05:01 +0100 (WEST)
X-Virus-Scanned: by amavisd-new-2.11.0 (20160426) (Debian) at
 tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavisd-new, port 10025)
 with LMTP id LPKtDgoflgO8; Thu, 29 Sep 2022 18:04:59 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 45A9E6008829;
 Thu, 29 Sep 2022 18:04:59 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tecnico.ulisboa.pt;
 s=mail; t=1664471099;
 bh=1z5MIZzeYwJ1JfUX/ZDyqqjAalAcTmvA+Fvskl+RPyE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=upLzc1W3DivBzqT7/bQ00oBfLwDe+wZCRLIdCteLYPDMdvPLYnwA+CQHItLRBlTkX
 vb0C/ux09KP1AECBJCg0qknXXzUx9eooIRSF0E+CqfpP7cq5DQIVj+8KGQIsy+VVtB
 ZoHKP81tiEuzWQxmsZDjeuGYvW1YnehXg0ItvsjY=
Received: from wslaptop.lan (unknown
 [IPv6:2001:818:dcb5:dc00:7a88:7f12:8ed8:518d])
 (Authenticated sender: ist187313)
 by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 1C7E536009F;
 Thu, 29 Sep 2022 18:04:58 +0100 (WEST)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To: 
Subject: [PATCH 4/4] arm64: dts: smaug: Add display panel node
Date: Thu, 29 Sep 2022 18:05:02 +0100
Message-Id: <20220929170502.1034040-5-diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220929170502.1034040-1-diogo.ivo@tecnico.ulisboa.pt>
References: <20220929170502.1034040-1-diogo.ivo@tecnico.ulisboa.pt>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 29 Sep 2022 17:52:24 +0000
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
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 arnd@arndb.de, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 jonathanh@nvidia.com, Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
 robh+dt@kernel.org, thierry.reding@gmail.com, linux-tegra@vger.kernel.org,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Google Pixel C has a JDI LPM102A188A display panel. Add a
DT node for it. Tested on Pixel C.

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
index 20d092812984..271ef70747f1 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
@@ -31,6 +31,39 @@ memory {
 	};
 
 	host1x@50000000 {
+		dc@54200000 {
+			status = "okay";
+		};
+
+		dsia: dsi@54300000 {
+			avdd-dsi-csi-supply = <&vdd_dsi_csi>;
+			nvidia,boot-on;
+			status = "okay";
+
+			link2: panel@0 {
+				compatible = "jdi,lpm102a188a";
+				reg = <0>;
+			};
+		};
+
+		dsib: dsi@54400000 {
+			avdd-dsi-csi-supply = <&vdd_dsi_csi>;
+			nvidia,ganged-mode = <&dsia>;
+			nvidia,boot-on;
+			status = "okay";
+
+			link1: panel@0 {
+				compatible = "jdi,lpm102a188a";
+				reg = <0>;
+				power-supply = <&pplcd_vdd>;
+				ddi-supply = <&pp1800_lcdio>;
+				enable-gpios = <&gpio TEGRA_GPIO(V, 1) GPIO_ACTIVE_HIGH>;
+				reset-gpios = <&gpio TEGRA_GPIO(V, 2) GPIO_ACTIVE_LOW>;
+				link2 = <&link2>;
+				backlight = <&backlight>;
+			};
+		};
+
 		dpaux: dpaux@545c0000 {
 			status = "okay";
 		};
@@ -1627,6 +1660,37 @@ nau8825@1a {
 			status = "okay";
 		};
 
+		backlight: lp8557-backlight@2c {
+			compatible = "ti,lp8557";
+			reg = <0x2c>;
+			power-supply = <&pplcd_vdd>;
+			enable-supply = <&pp1800_lcdio>;
+			bl-name = "lp8557-backlight";
+			dev-ctrl = /bits/ 8 <0x01>;
+			init-brt = /bits/ 8 <0x80>;
+
+			/* Full scale current, 20mA */
+			rom_11h {
+				rom-addr = /bits/ 8 <0x11>;
+				rom-val = /bits/ 8 <0x05>;
+			};
+			/* Frequency = 4.9kHz, magic undocumented val */
+			rom_12h {
+				rom-addr = /bits/ 8 <0x12>;
+				rom-val = /bits/ 8 <0x29>;
+			};
+			/* Boost freq = 1MHz, BComp option = 1 */
+			rom_13h {
+				rom-addr = /bits/ 8 <0x13>;
+				rom-val = /bits/ 8 <0x03>;
+			};
+			/* 4V OV, 6 output LED string enabled */
+			rom_14h {
+				rom-addr = /bits/ 8 <0x14>;
+				rom-val = /bits/ 8 <0xbf>;
+			};
+		};
+
 		audio-codec@2d {
 			compatible = "realtek,rt5677";
 			reg = <0x2d>;
@@ -1908,4 +1972,12 @@ usbc_vbus: regulator-usbc-vbus {
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 	};
+
+	vdd_dsi_csi: regulator-vdd-dsi-csi {
+		compatible = "regulator-fixed";
+		regulator-name = "AVDD_DSI_CSI_1V2";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		vin-supply = <&pp1200_avdd>;
+	};
 };
-- 
2.37.3

