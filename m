Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBA346FFAB
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 12:17:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98C3710E39D;
	Fri, 10 Dec 2021 11:17:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 307E810E3AF
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Dec 2021 11:17:49 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 gx15-20020a17090b124f00b001a695f3734aso7295863pjb.0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Dec 2021 03:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4LeTyuQUOX40vOSJ+axYvrUW6lyOFj2kxIyIdKNHdkA=;
 b=cZjFf3cN7NOfae4xxky5BtCKTowofQ3hHy2B+3z1jB2MxPKJ36FFH7qod97uUt20RQ
 nP0t9uIPy1RFKGNiNoqTGc7k0Lt7EyJqP7Zo6kR0+AqRCmCe1LlnReSr8RQlHiHisO9p
 3coiseYvbIY0Bf3Bnu1oAGOA0Ld6Ehfaevl00=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4LeTyuQUOX40vOSJ+axYvrUW6lyOFj2kxIyIdKNHdkA=;
 b=FsJplHjTPjbhQitLUv1tS7cBkFmFYNoMwdY5UtrgWCGks8Yi+Sq0LkPausF1U4LX4u
 wY51MOxqcDsHNTLExQCnoP2WEq6Yc2WZCtWs3Jv3FRq5d4yo2dkBP2Z5xGvcZI4Xp1el
 wun2Drps/yiHI+sBeeDk45igvnE5VwhjEc2idqgkNH47SWLVVPXVwhHVlx6zuxIkcQOU
 80lLTI9QeviUdLBLvQZYD16G/KDhOFms54Z2FeXbja/ZpbhFKdTXsUDLvB0/y05exViZ
 OJZX07dPoKgf511Wqd43pt47w3zqEYKUwHRsftsWiLQPmZFQ2UJw95JFcKayeVPrgNYR
 Qb0g==
X-Gm-Message-State: AOAM532m0e/l7834umHPYzp3xwWAoopPvJUN9SCeDW1hrhVCha7rNhr/
 97MMJYWlhBF6jQk6YWPgAXINtg==
X-Google-Smtp-Source: ABdhPJyeY9RTXOJ9FIWAmfqqM2uCC4z2LP/XFVNSnSy+Sp9Hp5PcwZA/MTW9lYtLjKqgOsI22qGRww==
X-Received: by 2002:a17:902:ab0c:b0:142:343d:4548 with SMTP id
 ik12-20020a170902ab0c00b00142343d4548mr73742135plb.14.1639135068822; 
 Fri, 10 Dec 2021 03:17:48 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:c40f:36d4:b45d:731])
 by smtp.gmail.com with ESMTPSA id
 qe12sm13125607pjb.29.2021.12.10.03.17.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 03:17:48 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
Subject: [DO NOT MERGE] [PATCH v6 5/6] ARM: dts: sun8i: bananapi-m2m: Enable
 ICN6211 DSI Bridge
Date: Fri, 10 Dec 2021 16:47:10 +0530
Message-Id: <20211210111711.2072660-6-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211210111711.2072660-1-jagan@amarulasolutions.com>
References: <20211210111711.2072660-1-jagan@amarulasolutions.com>
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
Cc: linux-sunxi@googlegroups.com, linux-amarula@amarulasolutions.com,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Bananapi S070WV20-CT16 is a pure RGB output panel with ICN6211
DSI/RGB convertor bridge.

Enable bridge along with associated panel.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 arch/arm/boot/dts/sun8i-r16-bananapi-m2m.dts | 64 ++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-r16-bananapi-m2m.dts b/arch/arm/boot/dts/sun8i-r16-bananapi-m2m.dts
index bf5b5e2f6168..501666dfb5ee 100644
--- a/arch/arm/boot/dts/sun8i-r16-bananapi-m2m.dts
+++ b/arch/arm/boot/dts/sun8i-r16-bananapi-m2m.dts
@@ -44,6 +44,7 @@
 #include "sun8i-a33.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pwm/pwm.h>
 
 / {
 	model = "BananaPi M2 Magic";
@@ -55,12 +56,21 @@ aliases {
 		i2c2 = &i2c2;
 		serial0 = &uart0;
 		serial1 = &uart1;
+		mmc0 = &mmc0;
 	};
 
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pwm 0 50000 PWM_POLARITY_INVERTED>;
+		brightness-levels = <1 2 4 8 16 32 64 128 255>;
+		default-brightness-level = <8>;
+		enable-gpios = <&r_pio 0 4 GPIO_ACTIVE_HIGH>; /* LCD-BL-EN: PL4 */
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
@@ -81,6 +91,18 @@ led-2 {
 		};
 	};
 
+	panel {
+		compatible = "bananapi,s070wv20-ct16";
+		enable-gpios = <&pio 1 7 GPIO_ACTIVE_HIGH>; /* LCD-PWR-EN: PB7 */
+		backlight = <&backlight>;
+
+		port {
+			panel_out_bridge: endpoint {
+				remote-endpoint = <&bridge_out_panel>;
+			};
+		};
+	};
+
 	reg_vcc5v0: vcc5v0 {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc5v0";
@@ -122,6 +144,38 @@ &dai {
 	status = "okay";
 };
 
+&de {
+	status = "okay";
+};
+
+&dphy {
+	status = "okay";
+};
+
+&dsi {
+	vcc-dsi-supply = <&reg_dcdc1>;		/* VCC-DSI */
+	status = "okay";
+
+	bridge@0 {
+		compatible = "chipone,icn6211";
+		reg = <0>;
+		enable-gpios = <&r_pio 0 5 GPIO_ACTIVE_HIGH>; /* LCD-RST: PL5 */
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			bridge_out: port@1 {
+				reg = <1>;
+
+				bridge_out_panel: endpoint {
+					remote-endpoint = <&panel_out_bridge>;
+				};
+			};
+		};
+	};
+};
+
 &ehci0 {
 	status = "okay";
 };
@@ -157,6 +211,12 @@ &ohci0 {
 	status = "okay";
 };
 
+&pwm {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pwm0_pin>;
+	status = "okay";
+};
+
 &r_rsb {
 	status = "okay";
 
@@ -269,6 +329,10 @@ &sound {
 	status = "okay";
 };
 
+&tcon0 {
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pb_pins>;
-- 
2.25.1

