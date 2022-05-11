Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 418975231D5
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 13:35:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD82210EDA4;
	Wed, 11 May 2022 11:35:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8045010EDA4
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 11:35:24 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id z126so2040414qkb.2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 04:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TASe7e8staripPUTtHYJHBu8o4s+0xu3fkgvGutfur4=;
 b=lfpwdTliBUFOuGKLeYuoJowajrhtcHVr4wNf3BxOcCnDMTdpPbKWlJSo7e9o8Rai1T
 VcO1sP33hQT8oOxhrpLl2MOcwLeEoqdhNQPurF3O7u4ummg09F2ns8Qx/N+3nFy9JAKt
 V314hh0UmgQpeRXzKI6bw2l+Ez4uatHRJFopqlAMUvVieftkxyb3OjBwFYStV1KiK53L
 2SPZfEd7UKpwbBGfCPfbDvXX5tfTsMzP84EtZcX20o+GwRzPZjFjELnCBt9d+auGUVyl
 X1xLUvxmHK3Ux9bx6eQ4M2z2V2BXkIaW7Uq/7tTmXSxkA0uw+yppuWwWMQT6eGVcLwDu
 qapA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TASe7e8staripPUTtHYJHBu8o4s+0xu3fkgvGutfur4=;
 b=epSFJBOIexE8mjiB6bZVz5uxGFUZktrlOarRqLXVh5/XNivMPTZSSsSwrUPcBycZoE
 AFPcc0zBg49YPTldOkUwGNSFQe7dlDbHJ+NHsA1rH/QSwvO2ybhOWGipdaY/ENC5I7ya
 M0nl92o3etKRcfzQ1t3ew15siaq+/eAtRAbzw4sEx9ATZSKEzP6pahGRTsCfVRk1vDin
 NPFflwEqF7jHy54WXAkasSLBoNCmP7YPSy87TJ5ZL5sB529NaBnVDde+ybhZGNvuWE8F
 lofKTxflgnws7j6GKoQKL+ICJb3TPQH6selWqQmokE1nqJZmQOs15CKoExCqHIkpFXgz
 se5g==
X-Gm-Message-State: AOAM530mTso6ZBkNaFHwtmTPrT7Azi/qmp8o7MmFgAKX9M32AJ1GnQCy
 A5gEHi7YaDdmZEEgMK9H2lU=
X-Google-Smtp-Source: ABdhPJzKRwT45sGp+GMJgGVh5netETKrJdksDPYQxG4bvZtdsZuc4PeQRazYRe767WcLk6MecTlgVA==
X-Received: by 2002:a37:ad16:0:b0:6a0:1468:4513 with SMTP id
 f22-20020a37ad16000000b006a014684513mr18321635qkm.96.1652268923469; 
 Wed, 11 May 2022 04:35:23 -0700 (PDT)
Received: from master-x64.sparksnet ([2601:153:980:85b1::10])
 by smtp.gmail.com with ESMTPSA id
 bw26-20020a05622a099a00b002f39b99f6basm953377qtb.84.2022.05.11.04.35.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 04:35:23 -0700 (PDT)
From: Peter Geis <pgwipeout@gmail.com>
To: linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v2 3/3] arm64: dts: rockchip: add pine64 touch panel display
 to rockpro64
Date: Wed, 11 May 2022 07:35:16 -0400
Message-Id: <20220511113517.4172962-4-pgwipeout@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220511113517.4172962-1-pgwipeout@gmail.com>
References: <20220511113517.4172962-1-pgwipeout@gmail.com>
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Peter Geis <pgwipeout@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Pine64 touch panel is a panel consisting of the Feiyang fy07024di26a30d
panel with a Goodix gt911 touch screen. Add the device tree nodes to the
rockpro64 to permit attaching this display to the device.

Signed-off-by: Peter Geis <pgwipeout@gmail.com>
---
 .../boot/dts/rockchip/rk3399-rockpro64.dtsi   | 80 ++++++++++++++++++-
 1 file changed, 76 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtsi
index 45e77f86d329..f0fb450ddba6 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtsi
@@ -20,6 +20,15 @@ chosen {
 		stdout-path = "serial2:1500000n8";
 	};
 
+	/* enable for panel backlight support */
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pwm0 0 1000000 0>;
+		brightness-levels = <0 4 8 16 32 64 128 255>;
+		default-brightness-level = <5>;
+		status = "disabled";
+	};
+
 	clkin_gmac: external-gmac-clock {
 		compatible = "fixed-clock";
 		clock-frequency = <125000000>;
@@ -220,6 +229,14 @@ vdd_log: vdd-log {
 		regulator-min-microvolt = <800000>;
 		regulator-max-microvolt = <1700000>;
 	};
+
+	avdd: avdd {
+		compatible = "regulator-fixed";
+		regulator-name = "avdd";
+		regulator-min-microvolt = <11000000>;
+		regulator-max-microvolt = <11000000>;
+		vin-supply = <&vcc3v3_s0>;
+	};
 };
 
 &cpu_l0 {
@@ -301,6 +318,11 @@ &hdmi {
 	status = "okay";
 };
 
+/* force hdmi to vopb */
+&hdmi_in_vopl {
+	status = "disabled";
+};
+
 &hdmi_sound {
 	status = "okay";
 };
@@ -400,8 +422,6 @@ regulator-state-mem {
 
 			vcc3v0_touch: LDO_REG2 {
 				regulator-name = "vcc3v0_touch";
-				regulator-always-on;
-				regulator-boot-on;
 				regulator-min-microvolt = <3000000>;
 				regulator-max-microvolt = <3000000>;
 				regulator-state-mem {
@@ -490,8 +510,6 @@ regulator-state-mem {
 
 			vcc3v3_s0: SWITCH_REG2 {
 				regulator-name = "vcc3v3_s0";
-				regulator-always-on;
-				regulator-boot-on;
 				regulator-state-mem {
 					regulator-off-in-suspend;
 				};
@@ -565,6 +583,19 @@ fusb0: typec-portc@22 {
 		vbus-supply = <&vcc5v0_typec>;
 		status = "okay";
 	};
+
+	/* enable for pine64 touch screen support */
+	touch: touchscreen@5d {
+		compatible = "goodix,gt911";
+		reg = <0x5d>;
+		AVDD28-supply = <&vcc3v0_touch>;
+		VDDIO-supply = <&vcc3v0_touch>;
+		interrupt-parent = <&gpio4>;
+		interrupts = <RK_PD5 IRQ_TYPE_EDGE_FALLING>;
+		irq-gpios = <&gpio4 RK_PD5 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&gpio4 RK_PD6 GPIO_ACTIVE_HIGH>;
+		status = "disabled";
+	};
 };
 
 &i2s0 {
@@ -600,6 +631,47 @@ &io_domains {
 	gpio1830-supply = <&vcc_3v0>;
 };
 
+/* enable for pine64 panel display support */
+&mipi_dsi {
+	status = "disabled";
+	clock-master;
+
+	ports {
+		mipi_out: port@1 {
+			reg = <1>;
+
+			mipi_out_panel: endpoint {
+				remote-endpoint = <&mipi_in_panel>;
+			};
+		};
+	};
+
+	mipi_panel: panel@0 {
+		compatible = "feiyang,fy07024di26a30d";
+		reg = <0>;
+		avdd-supply = <&avdd>;
+		backlight = <&backlight>;
+		dvdd-supply = <&vcc3v3_s0>;
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				mipi_in_panel: endpoint {
+					remote-endpoint = <&mipi_out_panel>;
+				};
+			};
+		};
+	};
+};
+
+/* force dsi to vopl */
+&mipi_in_vopb {
+	status="disabled";
+};
+
 &pcie0 {
 	ep-gpios = <&gpio2 RK_PD4 GPIO_ACTIVE_HIGH>;
 	num-lanes = <4>;
-- 
2.25.1

