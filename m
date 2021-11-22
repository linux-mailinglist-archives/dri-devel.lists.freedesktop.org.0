Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4766A458977
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 07:53:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2401A89DA9;
	Mon, 22 Nov 2021 06:53:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3B9E89DB5
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 06:53:46 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id f65so4854953pgc.0
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Nov 2021 22:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xqP160R8LU5V3gmz2VYiGFoGsrEbiwdGt3q8Nn130K4=;
 b=R2lQlxavAQmQqeCHV4PJL0hX4asVWGfxWjZnq2AupshABRsm4dvRmevUkxIp+XZL5i
 imdW5UnoqL/tOuhvn34LH2ud24HWcdODoyeU71Ry9XzZ/EyMwgDt8Np2/n4yWLle53rh
 Zgmb7VqwH9mDQ+Chfgt8RRMGJQE2zWKbaaGo8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xqP160R8LU5V3gmz2VYiGFoGsrEbiwdGt3q8Nn130K4=;
 b=79mKfZt38wOGbnOWPgv4A/cAJ9gIRuBPB5P5xbUSWBgYY03FC8jNUFRYOk+trVeSns
 d3MoC4rFYINVbxDsjsB8UoMwzkM0LDR8Ayk0WkN45sJJXtBOHgzYl+khjYfqI4EBneLP
 cWLbPsCyzQq9+7DCjwvoi3aE2ErsitjrIMG7R+m5rB82/HhhQcgGHRNUoQse2SdLrJ3R
 tI2ySoK8r3QcdX/yEgkB5EuVhieUKE6hi3UCp8dB31PJ25QhYWodlfT6LSPtpcRx2JrO
 X8B3nILsNXyhpmEYeZ/CWg4y8jh+1sELDnVIAqDb3k7OCAkqNWR8j1NRmQ+EzQ7OwZJQ
 vp+g==
X-Gm-Message-State: AOAM533lWdppVRrDhLJu71M4T5sZOviKSuxeICw55cmUnRNrUflfw1BB
 0u+QjdquazkiKNAGqQg4qwzAvA==
X-Google-Smtp-Source: ABdhPJz6DZ/SRX+X8uZaDs5YozctfZcRVmLr9ghAGmBfnNqco0v8ckg+hK2XYUYYJ/hCoPEz2ZBMfw==
X-Received: by 2002:a63:894a:: with SMTP id v71mr12345570pgd.337.1637564026320; 
 Sun, 21 Nov 2021 22:53:46 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:eed6:c913:819a:3850])
 by smtp.gmail.com with ESMTPSA id a8sm7935904pfv.176.2021.11.21.22.53.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Nov 2021 22:53:46 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
Subject: [DO NOT MERGE] [PATCH v5 6/7] ARM: dts: sun8i: bananapi-m2m: Enable
 ICN6211 DSI Bridge
Date: Mon, 22 Nov 2021 12:22:22 +0530
Message-Id: <20211122065223.88059-7-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211122065223.88059-1-jagan@amarulasolutions.com>
References: <20211122065223.88059-1-jagan@amarulasolutions.com>
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
 arch/arm/boot/dts/sun8i-r16-bananapi-m2m.dts | 63 ++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-r16-bananapi-m2m.dts b/arch/arm/boot/dts/sun8i-r16-bananapi-m2m.dts
index bf5b5e2f6168..da6c1f2a0c74 100644
--- a/arch/arm/boot/dts/sun8i-r16-bananapi-m2m.dts
+++ b/arch/arm/boot/dts/sun8i-r16-bananapi-m2m.dts
@@ -44,6 +44,7 @@
 #include "sun8i-a33.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pwm/pwm.h>
 
 / {
 	model = "BananaPi M2 Magic";
@@ -61,6 +62,14 @@ chosen {
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
 
@@ -81,6 +90,18 @@ led-2 {
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
@@ -122,6 +143,38 @@ &dai {
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
@@ -157,6 +210,12 @@ &ohci0 {
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
 
@@ -269,6 +328,10 @@ &sound {
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

