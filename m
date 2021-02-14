Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 562B331B248
	for <lists+dri-devel@lfdr.de>; Sun, 14 Feb 2021 20:41:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CD476E0BE;
	Sun, 14 Feb 2021 19:41:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35A876E0BE
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Feb 2021 19:41:49 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id d2so2618830pjs.4
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Feb 2021 11:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PjDic6T8CX1s3JQ+rCi0YZO3YnZwESEKbfpyyMhv06I=;
 b=IB0GXfTI23zPCdLey3dgL1oxizKborBIIOJn6Y3bG3GnJOXQ6Jw2rapttjw94GXHax
 4Qf+zQgtIGQbcpMfsWk7r8TtZl7XQFhqZgytPTnDQshyHGaw9IKLJLap2on299oR1L5o
 MZMAxnnV87a5W1qDBu7jSmbvEcPikFtYQBiqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PjDic6T8CX1s3JQ+rCi0YZO3YnZwESEKbfpyyMhv06I=;
 b=gtoBGSrGTgV6EwDhTSQWTvzCfEb6Fk6eumOdWeQlMicp55QKsXRopnGJN7lNlxEGDn
 36Dj/q7a20lKJx1d0qosmleqyvF6DG/sJVGvTzOTjEIm9qCCSTb7F6R6BaJf91MaQlfe
 tSjNifmcrrqn4/JdvinMiAMpJhaiDSE2pFDLNXiQB1yv1ZUGFHVAy6Z1bjnC4rrFqZmg
 lj26pGVaOrH7ub2792MAzaPT+/ax/4jmRGDebBQn3DbA5Me1iknT3gZEBy99VtwMwLzu
 pjn173H87nhGjLw761YR/m4hk9wiPnFFpfv2qAV5Ced7X5GQPrbJLKH7ljRUrouMDpkw
 GKvw==
X-Gm-Message-State: AOAM532AZ7h60KGoDdux6TWSTcghjdG6nFidauwO+hLf6wgKLm3wKC9y
 7ltIdqm1mx3duLRwGxZY6DjAHg==
X-Google-Smtp-Source: ABdhPJzZ1JR/ha5Z93FWa6lTvn9Kwpxf8X7vB5LWvc9yuHeekMW0I4odGZA8uAVUEIgF4q0vwJ3Z1Q==
X-Received: by 2002:a17:90a:d590:: with SMTP id
 v16mr8459529pju.116.1613331708894; 
 Sun, 14 Feb 2021 11:41:48 -0800 (PST)
Received: from ub-XPS-13-9350.domain.name ([45.249.78.214])
 by smtp.gmail.com with ESMTPSA id 125sm15129247pfu.7.2021.02.14.11.41.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Feb 2021 11:41:48 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: [DO NOT MERGE] [PATCH v3 7/7] ARM: dts: sun8i: bananapi-m2m: Enable
 S070WV20-CT16 panel
Date: Mon, 15 Feb 2021 01:11:02 +0530
Message-Id: <20210214194102.126146-8-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210214194102.126146-1-jagan@amarulasolutions.com>
References: <20210214194102.126146-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
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
Cc: Jagan Teki <jagan@amarulasolutions.com>, linux-amarula@amarulasolutions.com,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch add support for Bananapi S070WV20-CT16 panel to
BPI-M2M board.

Bananapi S070WV20-CT16 is a pure RGB output panel with ICN6211 DSI/RGB
convertor bridge, so enable bridge along with associated panel.

DSI panel connected via board DSI port with,
- DCDC1 as VCC-DSI supply
- PL5 gpio for bridge reset gpio pin
- PB7 gpio for lcd enable gpio pin
- PL4 gpio for backlight enable pin

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v3:
- none 

 arch/arm/boot/dts/sun8i-r16-bananapi-m2m.dts | 85 ++++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-r16-bananapi-m2m.dts b/arch/arm/boot/dts/sun8i-r16-bananapi-m2m.dts
index e1c75f7fa3ca..f3f63187badc 100644
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
 
@@ -81,6 +91,18 @@ red {
 		};
 	};
 
+	panel {
+		compatible = "bananapi,s070wv20-ct16", "simple-panel";
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
@@ -122,6 +144,59 @@ &dai {
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
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		dsi_out: port@0 {
+			reg = <0>;
+
+			dsi_out_bridge: endpoint {
+				remote-endpoint = <&bridge_out_dsi>;
+			};
+		};
+	};
+
+	bridge@0 {
+		compatible = "chipone,icn6211";
+		reg = <0>;
+		reset-gpios = <&r_pio 0 5 GPIO_ACTIVE_HIGH>; /* LCD-RST: PL5 */
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			bridge_in: port@0 {
+				reg = <0>;
+
+				bridge_out_dsi: endpoint {
+					remote-endpoint = <&dsi_out_bridge>;
+				};
+			};
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
@@ -157,6 +232,12 @@ &ohci0 {
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
 
@@ -269,6 +350,10 @@ &sound {
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

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
