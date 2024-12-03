Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC819E14F5
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 09:03:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BFAD10E93B;
	Tue,  3 Dec 2024 08:02:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uZ52XROu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC26810E93B
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 08:02:57 +0000 (UTC)
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 634CD1624;
 Tue,  3 Dec 2024 09:02:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1733212949;
 bh=Mc3akC/5Bf4EvpUpWHmUdecQDz7QPKV1NnLKxJl83cw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=uZ52XROu3OO9WWfYNPWlNzcPuUZJSaSaPMK4uoAqw8yMia5EZCHPYAdkTPfiSlhB+
 GQiM8mYUbnGMl44+abXPR2RM3vmr5Du9eZkxz9oeO6D8NxK5x0/vDgLnpBd+wyBcoY
 3VSvsCEL9IWOEXo/fBgKSbQI5vdWD+u/2Xyt0W1o=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 03 Dec 2024 10:01:43 +0200
Subject: [PATCH 9/9] arm64: dts: renesas: gray-hawk-single: Add DisplayPort
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241203-rcar-gh-dsi-v1-9-738ae1a95d2a@ideasonboard.com>
References: <20241203-rcar-gh-dsi-v1-0-738ae1a95d2a@ideasonboard.com>
In-Reply-To: <20241203-rcar-gh-dsi-v1-0-738ae1a95d2a@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, LUU HOAI <hoai.luu.ub@renesas.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Biju Das <biju.das.jz@bp.renesas.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 linux-clk@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2975;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=zqkFHIbOVDDcC1NRxKnJ6UxWmD0e5V/71JMpsEHP56Q=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnTrsfD+7K/0Xel1r9eBekv76IuS1YQuyCnEW2E
 hUYb8m1pBKJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ067HwAKCRD6PaqMvJYe
 9WyLD/9y3oW9hXKUDP8jTvEV+yP2+S18vbQ9f930ZsKEN3wxkMa18VRisgjVfw7ylFq3gwZx3F9
 pPGjb0wLqbG7HSnNL+gaIVVzweC5srmU8XNpANL3iXsmJ7mi9JVGPJl4r3DeO8V0MW2A3tMW30O
 GxTVGpZ3S4jLqbpUaRHsTHbFEXOgIBWMSGP6gXDYMYGGQZCgE209X2gZnn66+WZPFk/BIQvkmox
 tvzkQQz3nYiAFWjPh+S4HXdd2sAlkBjYkWSg5uA5aGy9wmQ83vwLk3P24kidXnC74Ys5crdniRQ
 UH3Kz5G88aVjSS9oHQgDDaHocIMUXinHASjrob1VSKJkBRk61IM8iPi6l7eZrymZsl5bEi/PC72
 6gcD7tgnEGkVojK+SP6CMCd1XOrPc8pitp1obqstg25tADZXHK21gKdIXrreQ4BTjRhhBWQiDxS
 KbvoBUPr8UUS+RWtgG71Jvii+NyhSrBWFCUFifL2VI1UuF/lA2rh3o7oI/5+MJIRzCyBzPaY/e5
 CheAQBWW4OYzTLFgJFXE6+vVIwywL9HL3hMIuKjKJbMp8wILyrYVivCoQeL10tuSxt/dDkzpZOK
 7EVJVpzfCkBU1MkCsh90z9MAw2m+HLkEE3KSBwdIkkO4eS682BTtdNVdksKIIuFB9O0mQYeBI3s
 a6b5KmGhMbsJeGA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
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

From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Add support for the mini DP output on the Gray Hawk board.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 .../boot/dts/renesas/r8a779h0-gray-hawk-single.dts | 95 ++++++++++++++++++++++
 1 file changed, 95 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
index 057f959d67b3..7cdf07b6dde6 100644
--- a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
@@ -59,6 +59,12 @@ chosen {
 		stdout-path = "serial0:921600n8";
 	};
 
+	sn65dsi86_refclk: clk-x6 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <38400000>;
+	};
+
 	keys {
 		compatible = "gpio-keys";
 
@@ -126,6 +132,27 @@ memory@480000000 {
 		reg = <0x4 0x80000000 0x1 0x80000000>;
 	};
 
+	mini-dp-con {
+		compatible = "dp-connector";
+		label = "CN5";
+		type = "mini";
+
+		port {
+			mini_dp_con_in: endpoint {
+				remote-endpoint = <&sn65dsi86_out0>;
+			};
+		};
+	};
+
+	reg_1p2v: regulator-1p2v {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-1.2V";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
 	reg_1p8v: regulator-1p8v {
 		compatible = "regulator-fixed";
 		regulator-name = "fixed-1.8V";
@@ -200,6 +227,24 @@ channel1 {
 	};
 };
 
+&dsi0 {
+	status = "okay";
+
+	ports {
+		port@1 {
+			reg = <1>;
+			dsi0_out: endpoint {
+				remote-endpoint = <&sn65dsi86_in0>;
+				data-lanes = <1 2 3 4>;
+			};
+		};
+	};
+};
+
+&du {
+	status = "okay";
+};
+
 &extal_clk {
 	clock-frequency = <16666666>;
 };
@@ -269,6 +314,51 @@ eeprom@53 {
 	};
 };
 
+&i2c1 {
+	pinctrl-0 = <&i2c1_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+	clock-frequency = <400000>;
+
+	bridge@2c {
+		compatible = "ti,sn65dsi86";
+		reg = <0x2c>;
+
+		clocks = <&sn65dsi86_refclk>;
+		clock-names = "refclk";
+
+		interrupt-parent = <&intc_ex>;
+		interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
+
+		enable-gpios = <&gpio1 26 GPIO_ACTIVE_HIGH>;
+
+		vccio-supply = <&reg_1p8v>;
+		vpll-supply = <&reg_1p8v>;
+		vcca-supply = <&reg_1p2v>;
+		vcc-supply = <&reg_1p2v>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				sn65dsi86_in0: endpoint {
+					remote-endpoint = <&dsi0_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				sn65dsi86_out0: endpoint {
+					remote-endpoint = <&mini_dp_con_in>;
+				};
+			};
+		};
+	};
+};
+
 &i2c3 {
 	pinctrl-0 = <&i2c3_pins>;
 	pinctrl-names = "default";
@@ -361,6 +451,11 @@ i2c0_pins: i2c0 {
 		function = "i2c0";
 	};
 
+	i2c1_pins: i2c1 {
+		groups = "i2c1";
+		function = "i2c1";
+	};
+
 	i2c3_pins: i2c3 {
 		groups = "i2c3";
 		function = "i2c3";

-- 
2.43.0

