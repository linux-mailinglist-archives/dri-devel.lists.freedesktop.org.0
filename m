Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5358F63ADB5
	for <lists+dri-devel@lfdr.de>; Mon, 28 Nov 2022 17:29:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6CEC10E2F2;
	Mon, 28 Nov 2022 16:29:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt
 [IPv6:2001:690:2100:1::15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B84110E2F2
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Nov 2022 16:29:35 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 72D66600C804;
 Mon, 28 Nov 2022 16:29:33 +0000 (WET)
X-Virus-Scanned: by amavisd-new-2.11.0 (20160426) (Debian) at
 tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavisd-new, port 10025)
 with LMTP id vRpmiXuB3wm5; Mon, 28 Nov 2022 16:29:30 +0000 (WET)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id C5ABF600C805;
 Mon, 28 Nov 2022 16:29:30 +0000 (WET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tecnico.ulisboa.pt;
 s=mail; t=1669652970;
 bh=TdKh3E/XenanfAlC8eRJ4MFy4v4lhEiS+bjmvYDecWA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=OG3OYfAO5rLU/XAE7Usb7QP4OyhTrGvPA+SfCaWqWPKIIqlhf9l5hr4uBCrJsNYoS
 rkEA5HvbINP+QECnLr4eODpGX/PJMIRg17a2v3G8TQWtKuDGkEO1EjcswP0+PBKhGR
 xU8w758ID0H6SNzC1nB/OGkLDFnRybUDwQBa+4Ag=
Received: from wslaptop.lan (unknown
 [IPv6:2001:818:dcb5:dc00:d990:b664:f16:4cb2])
 (Authenticated sender: ist187313)
 by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 9D363360077;
 Mon, 28 Nov 2022 16:29:30 +0000 (WET)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To: 
Subject: [PATCH v2 RESEND 4/4] arm64: dts: smaug: Add display panel node
Date: Mon, 28 Nov 2022 16:28:51 +0000
Message-Id: <20221128162851.110611-4-diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221128162851.110611-1-diogo.ivo@tecnico.ulisboa.pt>
References: <20221128162851.110611-1-diogo.ivo@tecnico.ulisboa.pt>
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
Changes in v2:
 - renamed backlight node to a generic name
 - removed underscores

 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
index 84ec4d8b7f10..5db0b25c8d58 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
@@ -31,6 +31,37 @@ memory {
 	};
 
 	host1x@50000000 {
+		dc@54200000 {
+			status = "okay";
+		};
+
+		dsia: dsi@54300000 {
+			avdd-dsi-csi-supply = <&vdd_dsi_csi>;
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
@@ -1627,6 +1658,37 @@ nau8825@1a {
 			status = "okay";
 		};
 
+		backlight: backlight@2c {
+			compatible = "ti,lp8557";
+			reg = <0x2c>;
+			power-supply = <&pplcd_vdd>;
+			enable-supply = <&pp1800_lcdio>;
+			bl-name = "lp8557-backlight";
+			dev-ctrl = /bits/ 8 <0x01>;
+			init-brt = /bits/ 8 <0x80>;
+
+			/* Full scale current, 20mA */
+			rom-11h {
+				rom-addr = /bits/ 8 <0x11>;
+				rom-val = /bits/ 8 <0x05>;
+			};
+			/* Frequency = 4.9kHz, magic undocumented val */
+			rom-12h {
+				rom-addr = /bits/ 8 <0x12>;
+				rom-val = /bits/ 8 <0x29>;
+			};
+			/* Boost freq = 1MHz, BComp option = 1 */
+			rom-13h {
+				rom-addr = /bits/ 8 <0x13>;
+				rom-val = /bits/ 8 <0x03>;
+			};
+			/* 4V OV, 6 output LED string enabled */
+			rom-14h {
+				rom-addr = /bits/ 8 <0x14>;
+				rom-val = /bits/ 8 <0xbf>;
+			};
+		};
+
 		audio-codec@2d {
 			compatible = "realtek,rt5677";
 			reg = <0x2d>;
@@ -1908,4 +1970,12 @@ usbc_vbus: regulator-usbc-vbus {
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
2.38.1

