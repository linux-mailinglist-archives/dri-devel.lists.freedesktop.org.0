Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2737ED875
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 01:18:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16FCA10E2C2;
	Thu, 16 Nov 2023 00:18:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C11710E2B5
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 00:17:52 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-1e9c42fc0c9so108692fac.1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 16:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700093871; x=1700698671; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cRTfwiI/QcqI7VUsormIFBvshQSidCwqxWI3V1oDIsM=;
 b=Qpgd32TamIhezh2D3YK83KG4kcQyUbr06Njv53Qn/pPxkRNfBo+efPajQ3YjWz9F9+
 tK2sfJ/oHHLPkytdFvz/k2NtuBgIGdc5xoDVfqtLU9W3B1fZK25O8s0BVIr1dhent4wg
 QuBOs7/1Wmt6a/cCajAY+T2GOsYdWzHK2Gw7W7gC0MBeZHGnMbdjvYjxm5wpA8IOvSN7
 Jft0E1oCLz9a+N/TQWea2wySU+xQeb75xvujhpFEnmwwocrTDvzTeAEbTINxlu4UXpzR
 g2fMd6Ub/LDDH6NB8/n+w+yditBNRjSDFD7BFImzzBRQUu6ZF6ELpGA1NUC/cMPhhi6M
 7LjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700093871; x=1700698671;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cRTfwiI/QcqI7VUsormIFBvshQSidCwqxWI3V1oDIsM=;
 b=WBkcDbgaEmOv9oPoEdT1xQjgK7ytlqHQrKSGaPN89NYIDSt1ETcvSHndA6yEhYcdCR
 0JWaXnKA+Dxibq82O2S7BmXskjBS8QTCnTWTRw17V3ZMmNg+UrwyQIHzCER69Tdrr1Xb
 Ljm43BmpBWsa62OrD6MY2MdHSjes6lnv3NrNdoBJ1WqoB6grKKXdSFnUvpWKCCvQwXFM
 QZQW3LNZWRqZDDJVS+b7m9LXwmY6xpzGVglQIcjNEE11jXoOwV/Sfsj0zyDtM4vCjf/O
 zvglahOgu5HLUCoRgqT8mV4RZmpfRYSUkdA+Q/uqmLNpBEjfn7EN9LtCxkGfnmD02KD8
 ZKOQ==
X-Gm-Message-State: AOJu0YwAgyZOrBeC9hFvFIeYeLLPX3nTzwoMgSDejwPGLg4d5aCWmhcC
 2cR/SHBfnO8dV1d0xk0FpRc=
X-Google-Smtp-Source: AGHT+IFjniJmWcrCtd7yBBY+EqwD3xHKsfrsyW+VxNgb3nx/o61E1v1dMRETXyq4APaG5H2UgOCItg==
X-Received: by 2002:a05:6870:a119:b0:1ef:b356:c387 with SMTP id
 m25-20020a056870a11900b001efb356c387mr15374356oae.38.1700093871240; 
 Wed, 15 Nov 2023 16:17:51 -0800 (PST)
Received: from localhost.localdomain ([75.28.21.198])
 by smtp.gmail.com with ESMTPSA id
 j18-20020a9d7d92000000b006c619f17669sm727117otn.74.2023.11.15.16.17.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Nov 2023 16:17:50 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Subject: [PATCH V3 5/6] arm64: dts: rockchip: Update powkiddy,
 rgb30 include to rk2023 DTSI
Date: Wed, 15 Nov 2023 18:17:41 -0600
Message-Id: <20231116001742.2340646-6-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231116001742.2340646-1-macroalpha82@gmail.com>
References: <20231116001742.2340646-1-macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, neil.armstrong@linaro.org, sam@ravnborg.org,
 Chris Morgan <macromorgan@hotmail.com>, sebastian.reichel@collabora.com,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

The Powkiddy RGB30 device is similar to the Anbernic RGxx3 series,
however there are several differences which require deleting nodes in
order to properly define the hardware. This was deemed unacceptable
for the RK2023, so instead create a common include file for the
Powkiddy RGB30 and the Powkiddy RK2023. The only notable difference
between these Powkiddy devices are the panel in use, the device
name, and the PLL_VPLL frequency necessary to support the different
panels.

Since the RK2023 was released on the market first, name the common
include file after it.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../dts/rockchip/rk3566-powkiddy-rgb30.dts    | 154 +--
 .../dts/rockchip/rk3566-powkiddy-rk2023.dtsi  | 875 ++++++++++++++++++
 2 files changed, 891 insertions(+), 138 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rk2023.dtsi

diff --git a/arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb30.dts b/arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb30.dts
index 1ead3c5c24b3..0ac64f043b80 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb30.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb30.dts
@@ -5,67 +5,11 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/linux-event-codes.h>
 #include <dt-bindings/pinctrl/rockchip.h>
-#include "rk3566-anbernic-rg353x.dtsi"
+#include "rk3566-powkiddy-rk2023.dtsi"
 
 / {
 	model = "RGB30";
 	compatible = "powkiddy,rgb30", "rockchip,rk3566";
-
-	aliases {
-		mmc1 = &sdmmc0;
-		mmc2 = &sdmmc1;
-		mmc3 = &sdmmc2;
-	};
-
-	battery: battery {
-		compatible = "simple-battery";
-		charge-full-design-microamp-hours = <3151000>;
-		charge-term-current-microamp = <300000>;
-		constant-charge-current-max-microamp = <2000000>;
-		constant-charge-voltage-max-microvolt = <4250000>;
-		factory-internal-resistance-micro-ohms = <117000>;
-		voltage-max-design-microvolt = <4172000>;
-		voltage-min-design-microvolt = <3400000>;
-
-		ocv-capacity-celsius = <20>;
-		ocv-capacity-table-0 =  <4172000 100>, <4092000 95>, <4035000 90>, <3990000 85>,
-					<3939000 80>, <3895000 75>, <3852000 70>, <3807000 65>,
-					<3762000 60>, <3713000 55>, <3672000 50>, <3647000 45>,
-					<3629000 40>, <3613000 35>, <3598000 30>, <3578000 25>,
-					<3550000 20>, <3519000 15>, <3479000 10>, <3438000 5>,
-					<3400000 0>;
-	};
-
-	/*
-	 * Channels reversed for speakers. Headphones automatically switch via hardware when
-	 * detected with no ability to control output in software. Headphones appear to be mono
-	 * (each output channel receives all audio). No microphone support on 3.5mm jack.
-	 */
-	sound {
-		compatible = "simple-audio-card";
-		simple-audio-card,name = "rk817_ext";
-		simple-audio-card,format = "i2s";
-		simple-audio-card,mclk-fs = <256>;
-		simple-audio-card,widgets =
-			"Headphone", "Headphones";
-		simple-audio-card,routing =
-			"Headphones", "HPOL",
-			"Headphones", "HPOR";
-
-		simple-audio-card,codec {
-			sound-dai = <&rk817>;
-		};
-
-		simple-audio-card,cpu {
-			sound-dai = <&i2s1_8ch>;
-		};
-	};
-};
-
-/delete-node/ &adc_keys;
-
-&chosen {
-	/delete-property/ stdout-path;
 };
 
 &cru {
@@ -75,87 +19,21 @@ &cru {
 			       <200000000>, <292500000>;
 };
 
-&gpio_keys_control {
-	button-r1 {
-		gpios = <&gpio3 RK_PB3 GPIO_ACTIVE_LOW>;
-		label = "TR";
-		linux,code = <BTN_TR>;
-	};
-
-	button-r2 {
-		gpios = <&gpio3 RK_PB4 GPIO_ACTIVE_LOW>;
-		label = "TR2";
-		linux,code = <BTN_TR2>;
-	};
-};
-
-/delete-node/ &{/i2c@fdd40000/regulator@40};
-
-&i2c0 {
-	vdd_cpu: regulator@1c {
-		compatible = "tcs,tcs4525";
-		reg = <0x1c>;
-		fcs,suspend-voltage-selector = <1>;
-		regulator-always-on;
-		regulator-boot-on;
-		regulator-min-microvolt = <712500>;
-		regulator-max-microvolt = <1390000>;
-		regulator-name = "vdd_cpu";
-		regulator-ramp-delay = <2300>;
-		vin-supply = <&vcc_sys>;
-		regulator-state-mem {
-			regulator-off-in-suspend;
+&dsi0 {
+	panel: panel@0 {
+		compatible = "powkiddy,rgb30-panel";
+		reg = <0>;
+		backlight = <&backlight>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&lcd_rst>;
+		reset-gpios = <&gpio4 RK_PA0 GPIO_ACTIVE_LOW>;
+		vcc-supply = <&vcc3v3_lcd0_n>;
+		iovcc-supply = <&vcc3v3_lcd0_n>;
+
+		port {
+			mipi_in_panel: endpoint {
+				remote-endpoint = <&mipi_out_panel>;
+			};
 		};
 	};
 };
-
-/*
- * Device has 2 red LEDs instead of an amber and a red. Relabel LEDs as
- * red_led0 and red_led1.
- */
-/delete-node/ &{/pwm-leds/led-1};
-/delete-node/ &{/pwm-leds/led-2};
-
-&leds {
-	red_led0: led-1 {
-		color = <LED_COLOR_ID_RED>;
-		function = LED_FUNCTION_CHARGING;
-		max-brightness = <255>;
-		pwms = <&pwm7 0 25000 0>;
-	};
-
-	red_led1: led-2 {
-		color = <LED_COLOR_ID_RED>;
-		default-state = "off";
-		function = LED_FUNCTION_STATUS;
-		max-brightness = <255>;
-		pwms = <&pwm0 0 25000 0>;
-	};
-};
-
-&panel {
-	compatible = "powkiddy,rgb30-panel";
-	vcc-supply = <&vcc3v3_lcd0_n>;
-	iovcc-supply = <&vcc3v3_lcd0_n>;
-	/delete-property/ vdd-supply;
-};
-
-&pwm5 {
-	status = "disabled";
-};
-
-&rk817 {
-	rk817_charger: charger {
-		monitored-battery = <&battery>;
-		rockchip,resistor-sense-micro-ohms = <10000>;
-		rockchip,sleep-enter-current-microamp = <300000>;
-		rockchip,sleep-filter-current-microamp = <100000>;
-	};
-};
-
-/* There is no UART header visible on the board for this device. */
-&uart2 {
-	status = "disabled";
-};
-
-/delete-node/ &vibrator;
diff --git a/arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rk2023.dtsi b/arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rk2023.dtsi
new file mode 100644
index 000000000000..0fa8f06f94cd
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rk2023.dtsi
@@ -0,0 +1,875 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/linux-event-codes.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/pinctrl/rockchip.h>
+#include <dt-bindings/soc/rockchip,vop2.h>
+#include "rk3566.dtsi"
+
+/ {
+	aliases {
+		mmc1 = &sdmmc0;
+		mmc2 = &sdmmc1;
+		mmc3 = &sdmmc2;
+	};
+
+	adc-joystick {
+		compatible = "adc-joystick";
+		io-channels = <&adc_mux 0>,
+			      <&adc_mux 1>,
+			      <&adc_mux 2>,
+			      <&adc_mux 3>;
+		pinctrl-0 = <&joy_mux_en>;
+		pinctrl-names = "default";
+		poll-interval = <60>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		axis@0 {
+			reg = <0>;
+			abs-flat = <32>;
+			abs-fuzz = <32>;
+			abs-range = <1023 15>;
+			linux,code = <ABS_X>;
+		};
+
+		axis@1 {
+			reg = <1>;
+			abs-flat = <32>;
+			abs-fuzz = <32>;
+			abs-range = <15 1023>;
+			linux,code = <ABS_RX>;
+		};
+
+		axis@2 {
+			reg = <2>;
+			abs-flat = <32>;
+			abs-fuzz = <32>;
+			abs-range = <15 1023>;
+			linux,code = <ABS_Y>;
+		};
+
+		axis@3 {
+			reg = <3>;
+			abs-flat = <32>;
+			abs-fuzz = <32>;
+			abs-range = <1023 15>;
+			linux,code = <ABS_RY>;
+		};
+	};
+
+	adc_mux: adc-mux {
+		compatible = "io-channel-mux";
+		channels = "left_x", "right_x", "left_y", "right_y";
+		#io-channel-cells = <1>;
+		io-channels = <&saradc 3>;
+		io-channel-names = "parent";
+		mux-controls = <&gpio_mux>;
+		settle-time-us = <100>;
+	};
+
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		power-supply = <&vcc_sys>;
+		pwms = <&pwm4 0 25000 0>;
+	};
+
+	battery: battery {
+		compatible = "simple-battery";
+		charge-full-design-microamp-hours = <3151000>;
+		charge-term-current-microamp = <300000>;
+		constant-charge-current-max-microamp = <2000000>;
+		constant-charge-voltage-max-microvolt = <4250000>;
+		factory-internal-resistance-micro-ohms = <117000>;
+		voltage-max-design-microvolt = <4172000>;
+		voltage-min-design-microvolt = <3400000>;
+
+		ocv-capacity-celsius = <20>;
+		ocv-capacity-table-0 =  <4172000 100>, <4092000 95>, <4035000 90>, <3990000 85>,
+					<3939000 80>, <3895000 75>, <3852000 70>, <3807000 65>,
+					<3762000 60>, <3713000 55>, <3672000 50>, <3647000 45>,
+					<3629000 40>, <3613000 35>, <3598000 30>, <3578000 25>,
+					<3550000 20>, <3519000 15>, <3479000 10>, <3438000 5>,
+					<3400000 0>;
+	};
+
+	gpio_keys_control: gpio-keys-control {
+		compatible = "gpio-keys";
+		pinctrl-0 = <&btn_pins_ctrl>;
+		pinctrl-names = "default";
+
+		button-a {
+			gpios = <&gpio3 RK_PC2 GPIO_ACTIVE_LOW>;
+			label = "EAST";
+			linux,code = <BTN_EAST>;
+		};
+
+		button-b {
+			gpios = <&gpio3 RK_PC3 GPIO_ACTIVE_LOW>;
+			label = "SOUTH";
+			linux,code = <BTN_SOUTH>;
+		};
+
+		button-down {
+			gpios = <&gpio3 RK_PA4 GPIO_ACTIVE_LOW>;
+			label = "DPAD-DOWN";
+			linux,code = <BTN_DPAD_DOWN>;
+		};
+
+		button-l1 {
+			gpios = <&gpio3 RK_PB1 GPIO_ACTIVE_LOW>;
+			label = "TL";
+			linux,code = <BTN_TL>;
+		};
+
+		button-l2 {
+			gpios = <&gpio3 RK_PB2 GPIO_ACTIVE_LOW>;
+			label = "TL2";
+			linux,code = <BTN_TL2>;
+		};
+
+		button-left {
+			gpios = <&gpio3 RK_PA6 GPIO_ACTIVE_LOW>;
+			label = "DPAD-LEFT";
+			linux,code = <BTN_DPAD_LEFT>;
+		};
+
+		button-r1 {
+			gpios = <&gpio3 RK_PB3 GPIO_ACTIVE_LOW>;
+			label = "TR";
+			linux,code = <BTN_TR>;
+		};
+
+		button-r2 {
+			gpios = <&gpio3 RK_PB4 GPIO_ACTIVE_LOW>;
+			label = "TR2";
+			linux,code = <BTN_TR2>;
+		};
+
+		button-right {
+			gpios = <&gpio3 RK_PA5 GPIO_ACTIVE_LOW>;
+			label = "DPAD-RIGHT";
+			linux,code = <BTN_DPAD_RIGHT>;
+		};
+
+		button-select {
+			gpios = <&gpio3 RK_PB6 GPIO_ACTIVE_LOW>;
+			label = "SELECT";
+			linux,code = <BTN_SELECT>;
+		};
+
+		button-start {
+			gpios = <&gpio3 RK_PB5 GPIO_ACTIVE_LOW>;
+			label = "START";
+			linux,code = <BTN_START>;
+		};
+
+		button-thumbl {
+			gpios = <&gpio3 RK_PA1 GPIO_ACTIVE_LOW>;
+			label = "THUMBL";
+			linux,code = <BTN_THUMBL>;
+		};
+
+		button-thumbr {
+			gpios = <&gpio3 RK_PA2 GPIO_ACTIVE_LOW>;
+			label = "THUMBR";
+			linux,code = <BTN_THUMBR>;
+		};
+
+		button-up {
+			gpios = <&gpio3 RK_PA3 GPIO_ACTIVE_LOW>;
+			label = "DPAD-UP";
+			linux,code = <BTN_DPAD_UP>;
+		};
+
+		button-x {
+			gpios = <&gpio3 RK_PC0 GPIO_ACTIVE_LOW>;
+			label = "NORTH";
+			linux,code = <BTN_NORTH>;
+		};
+
+		button-y {
+			gpios = <&gpio3 RK_PC1 GPIO_ACTIVE_LOW>;
+			label = "WEST";
+			linux,code = <BTN_WEST>;
+		};
+	};
+
+	gpio_keys_vol: gpio-keys-vol {
+		compatible = "gpio-keys";
+		autorepeat;
+		pinctrl-0 = <&btn_pins_vol>;
+		pinctrl-names = "default";
+
+		button-vol-down {
+			gpios = <&gpio3 RK_PB0 GPIO_ACTIVE_LOW>;
+			label = "VOLUMEDOWN";
+			linux,code = <KEY_VOLUMEDOWN>;
+		};
+
+		button-vol-up {
+			gpios = <&gpio3 RK_PA7 GPIO_ACTIVE_LOW>;
+			label = "VOLUMEUP";
+			linux,code = <KEY_VOLUMEUP>;
+		};
+	};
+
+	gpio_mux: mux-controller {
+		compatible = "gpio-mux";
+		mux-gpios = <&gpio0 RK_PB6 GPIO_ACTIVE_LOW>,
+			    <&gpio0 RK_PB7 GPIO_ACTIVE_LOW>;
+		#mux-control-cells = <0>;
+	};
+
+	hdmi-con {
+		compatible = "hdmi-connector";
+		ddc-i2c-bus = <&i2c5>;
+		type = "c";
+
+		port {
+			hdmi_con_in: endpoint {
+				remote-endpoint = <&hdmi_out_con>;
+			};
+		};
+	};
+
+	/*
+	 * Device also includes an always on LED that is wired to the 5V input
+	 * voltage and is on when the device is plugged in.
+	 */
+	leds: pwm-leds {
+		compatible = "pwm-leds";
+
+		green_led: led-0 {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_STATUS;
+			max-brightness = <255>;
+			pwms = <&pwm6 0 25000 0>;
+		};
+
+		red_led: led-1 {
+			color = <LED_COLOR_ID_RED>;
+			function = LED_FUNCTION_CHARGING;
+			max-brightness = <255>;
+			pwms = <&pwm7 0 25000 0>;
+		};
+	};
+
+	sdio_pwrseq: sdio-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		clocks = <&rk817 1>;
+		clock-names = "ext_clock";
+		pinctrl-0 = <&wifi_enable_h>;
+		pinctrl-names = "default";
+		post-power-on-delay-ms = <200>;
+		reset-gpios = <&gpio4 RK_PA2 GPIO_ACTIVE_LOW>;
+	};
+
+	/*
+	 * Channels reversed for speakers. Headphones automatically switch via hardware when
+	 * detected with no ability to control output in software. Headphones appear to be mono
+	 * (each output channel receives all audio). No microphone support on 3.5mm jack.
+	 */
+	sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "rk817_ext";
+		simple-audio-card,format = "i2s";
+		simple-audio-card,mclk-fs = <256>;
+		simple-audio-card,widgets =
+			"Headphone", "Headphones";
+		simple-audio-card,routing =
+			"Headphones", "HPOL",
+			"Headphones", "HPOR";
+
+		simple-audio-card,codec {
+			sound-dai = <&rk817>;
+		};
+
+		simple-audio-card,cpu {
+			sound-dai = <&i2s1_8ch>;
+		};
+	};
+
+	vcc3v3_lcd0_n: regulator-vcc3v3-lcd0 {
+		compatible = "regulator-fixed";
+		gpio = <&gpio0 RK_PC2 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-0 = <&vcc_lcd_h>;
+		pinctrl-names = "default";
+		regulator-boot-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-name = "vcc3v3_lcd0_n";
+		vin-supply = <&vcc_3v3>;
+		regulator-state-mem {
+			regulator-off-in-suspend;
+		};
+	};
+
+	vcc_sys: regulator-vcc-sys {
+		compatible = "regulator-fixed";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <3800000>;
+		regulator-max-microvolt = <3800000>;
+		regulator-name = "vcc_sys";
+	};
+
+	vcc_wifi: regulator-vcc-wifi {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpio0 RK_PA0 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&vcc_wifi_h>;
+		pinctrl-names = "default";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-name = "vcc_wifi";
+	};
+};
+
+&combphy1 {
+	status = "okay";
+};
+
+&cpu0 {
+	cpu-supply = <&vdd_cpu>;
+};
+
+&cpu1 {
+	cpu-supply = <&vdd_cpu>;
+};
+
+&cpu2 {
+	cpu-supply = <&vdd_cpu>;
+};
+
+&cpu3 {
+	cpu-supply = <&vdd_cpu>;
+};
+
+&dsi0 {
+	status = "okay";
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	ports {
+		dsi0_in: port@0 {
+			reg = <0>;
+			dsi0_in_vp1: endpoint {
+				remote-endpoint = <&vp1_out_dsi0>;
+			};
+		};
+
+		dsi0_out: port@1 {
+			reg = <1>;
+			mipi_out_panel: endpoint {
+				remote-endpoint = <&mipi_in_panel>;
+			};
+		};
+	};
+};
+
+&dsi_dphy0 {
+	status = "okay";
+};
+
+&gpu {
+	mali-supply = <&vdd_gpu>;
+	status = "okay";
+};
+
+&hdmi {
+	ddc-i2c-bus = <&i2c5>;
+	pinctrl-0 = <&hdmitxm0_cec>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&hdmi_in {
+	hdmi_in_vp0: endpoint {
+		remote-endpoint = <&vp0_out_hdmi>;
+	};
+};
+
+&hdmi_out {
+	hdmi_out_con: endpoint {
+		remote-endpoint = <&hdmi_con_in>;
+	};
+};
+
+&hdmi_sound {
+	status = "okay";
+};
+
+&i2c0 {
+	status = "okay";
+
+	rk817: pmic@20 {
+		compatible = "rockchip,rk817";
+		reg = <0x20>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PA3 IRQ_TYPE_LEVEL_LOW>;
+		clock-output-names = "rk808-clkout1", "rk808-clkout2";
+		clock-names = "mclk";
+		clocks = <&cru I2S1_MCLKOUT_TX>;
+		assigned-clocks = <&cru I2S1_MCLKOUT_TX>;
+		assigned-clock-parents = <&cru CLK_I2S1_8CH_TX>;
+		#clock-cells = <1>;
+		#sound-dai-cells = <0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&i2s1m0_mclk>, <&pmic_int_l>;
+		wakeup-source;
+
+		vcc1-supply = <&vcc_sys>;
+		vcc2-supply = <&vcc_sys>;
+		vcc3-supply = <&vcc_sys>;
+		vcc4-supply = <&vcc_sys>;
+		vcc5-supply = <&vcc_sys>;
+		vcc6-supply = <&vcc_sys>;
+		vcc7-supply = <&vcc_sys>;
+		vcc8-supply = <&vcc_sys>;
+		vcc9-supply = <&dcdc_boost>;
+
+		regulators {
+			vdd_logic: DCDC_REG1 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <1350000>;
+				regulator-ramp-delay = <6001>;
+				regulator-initial-mode = <0x2>;
+				regulator-name = "vdd_logic";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+					regulator-suspend-microvolt = <900000>;
+				};
+			};
+
+			vdd_gpu: DCDC_REG2 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <1350000>;
+				regulator-ramp-delay = <6001>;
+				regulator-initial-mode = <0x2>;
+				regulator-name = "vdd_gpu";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcc_ddr: DCDC_REG3 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-initial-mode = <0x2>;
+				regulator-name = "vcc_ddr";
+				regulator-state-mem {
+					regulator-on-in-suspend;
+				};
+			};
+
+			vcc_3v3: DCDC_REG4 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-initial-mode = <0x2>;
+				regulator-name = "vcc_3v3";
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <3300000>;
+				};
+			};
+
+			vcca1v8_pmu: LDO_REG1 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-name = "vcca1v8_pmu";
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <1800000>;
+				};
+			};
+
+			vdda_0v9: LDO_REG2 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <900000>;
+				regulator-name = "vdda_0v9";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdda0v9_pmu: LDO_REG3 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <900000>;
+				regulator-name = "vdda0v9_pmu";
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <900000>;
+				};
+			};
+
+			vccio_acodec: LDO_REG4 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-name = "vccio_acodec";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vccio_sd: LDO_REG5 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-name = "vccio_sd";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcc3v3_pmu: LDO_REG6 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-name = "vcc3v3_pmu";
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <3300000>;
+				};
+			};
+
+			vcc_1v8: LDO_REG7 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-name = "vcc_1v8";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcc1v8_dvp: LDO_REG8 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-name = "vcc1v8_dvp";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcc2v8_dvp: LDO_REG9 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+				regulator-name = "vcc2v8_dvp";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			dcdc_boost: BOOST {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <4700000>;
+				regulator-max-microvolt = <5400000>;
+				regulator-name = "boost";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			otg_switch: OTG_SWITCH {
+				regulator-name = "otg_switch";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+		};
+
+		rk817_charger: charger {
+			monitored-battery = <&battery>;
+			rockchip,resistor-sense-micro-ohms = <10000>;
+			rockchip,sleep-enter-current-microamp = <300000>;
+			rockchip,sleep-filter-current-microamp = <100000>;
+		};
+	};
+
+	vdd_cpu: regulator@1c {
+		compatible = "tcs,tcs4525";
+		reg = <0x1c>;
+		fcs,suspend-voltage-selector = <1>;
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <712500>;
+		regulator-max-microvolt = <1390000>;
+		regulator-name = "vdd_cpu";
+		regulator-ramp-delay = <2300>;
+		vin-supply = <&vcc_sys>;
+		regulator-state-mem {
+			regulator-off-in-suspend;
+		};
+	};
+};
+
+&i2c5 {
+	pinctrl-0 = <&i2c5m1_xfer>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&i2s0_8ch {
+	status = "okay";
+};
+
+&i2s1_8ch {
+	pinctrl-0 = <&i2s1m0_sclktx
+		     &i2s1m0_lrcktx
+		     &i2s1m0_sdi0
+		     &i2s1m0_sdo0>;
+	pinctrl-names = "default";
+	rockchip,trcm-sync-tx-only;
+	status = "okay";
+};
+
+&pinctrl {
+	gpio-btns {
+		btn_pins_ctrl: btn-pins-ctrl {
+			rockchip,pins =
+				<3 RK_PA1 RK_FUNC_GPIO &pcfg_pull_up>,
+				<3 RK_PA2 RK_FUNC_GPIO &pcfg_pull_up>,
+				<3 RK_PA3 RK_FUNC_GPIO &pcfg_pull_up>,
+				<3 RK_PA4 RK_FUNC_GPIO &pcfg_pull_up>,
+				<3 RK_PA5 RK_FUNC_GPIO &pcfg_pull_up>,
+				<3 RK_PA6 RK_FUNC_GPIO &pcfg_pull_up>,
+				<3 RK_PB1 RK_FUNC_GPIO &pcfg_pull_up>,
+				<3 RK_PB2 RK_FUNC_GPIO &pcfg_pull_up>,
+				<3 RK_PB3 RK_FUNC_GPIO &pcfg_pull_up>,
+				<3 RK_PB4 RK_FUNC_GPIO &pcfg_pull_up>,
+				<3 RK_PB5 RK_FUNC_GPIO &pcfg_pull_up>,
+				<3 RK_PB6 RK_FUNC_GPIO &pcfg_pull_up>,
+				<3 RK_PC0 RK_FUNC_GPIO &pcfg_pull_up>,
+				<3 RK_PC1 RK_FUNC_GPIO &pcfg_pull_up>,
+				<3 RK_PC2 RK_FUNC_GPIO &pcfg_pull_up>,
+				<3 RK_PC3 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+
+		btn_pins_vol: btn-pins-vol {
+			rockchip,pins =
+				<3 RK_PA7 RK_FUNC_GPIO &pcfg_pull_up>,
+				<3 RK_PB0 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+
+	joy-mux {
+		joy_mux_en: joy-mux-en {
+			rockchip,pins =
+				<0 RK_PB5 RK_FUNC_GPIO &pcfg_output_low>;
+		};
+	};
+
+	gpio-lcd {
+		lcd_rst: lcd-rst {
+			rockchip,pins =
+				<4 RK_PA0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	pmic {
+		pmic_int_l: pmic-int-l {
+			rockchip,pins =
+				<0 RK_PA3 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+
+	sdio-pwrseq {
+		wifi_enable_h: wifi-enable-h {
+			rockchip,pins =
+				<4 RK_PA2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	vcc3v3-lcd {
+		vcc_lcd_h: vcc-lcd-h {
+			rockchip,pins =
+				<0 RK_PC2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	vcc-wifi {
+		vcc_wifi_h: vcc-wifi-h {
+			rockchip,pins =
+				<0 RK_PA0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+};
+
+&pmu_io_domains {
+	status = "okay";
+	pmuio1-supply = <&vcc3v3_pmu>;
+	pmuio2-supply = <&vcc3v3_pmu>;
+	vccio1-supply = <&vccio_acodec>;
+	vccio3-supply = <&vccio_sd>;
+	vccio4-supply = <&vcc_1v8>;
+	vccio5-supply = <&vcc_3v3>;
+	vccio6-supply = <&vcc1v8_dvp>;
+	vccio7-supply = <&vcc_3v3>;
+};
+
+&pwm4 {
+	status = "okay";
+};
+
+&pwm6 {
+	status = "okay";
+};
+
+&pwm7 {
+	status = "okay";
+};
+
+&saradc {
+	vref-supply = <&vcc_1v8>;
+	status = "okay";
+};
+
+&sdmmc0 {
+	bus-width = <4>;
+	cap-sd-highspeed;
+	cd-gpios = <&gpio0 RK_PA4 GPIO_ACTIVE_LOW>;
+	disable-wp;
+	pinctrl-0 = <&sdmmc0_bus4 &sdmmc0_clk &sdmmc0_cmd &sdmmc0_det>;
+	pinctrl-names = "default";
+	sd-uhs-sdr104;
+	vmmc-supply = <&vcc_3v3>;
+	vqmmc-supply = <&vccio_sd>;
+	status = "okay";
+};
+
+&sdmmc1 {
+	bus-width = <4>;
+	cap-sd-highspeed;
+	cd-gpios = <&gpio2 RK_PB2 GPIO_ACTIVE_LOW>;
+	disable-wp;
+	pinctrl-0 = <&sdmmc1_bus4 &sdmmc1_cmd &sdmmc1_clk &sdmmc1_det>;
+	pinctrl-names = "default";
+	sd-uhs-sdr104;
+	vmmc-supply = <&vcc_3v3>;
+	vqmmc-supply = <&vcc1v8_dvp>;
+	status = "okay";
+};
+
+&sdmmc2 {
+	bus-width = <4>;
+	cap-sd-highspeed;
+	cap-sdio-irq;
+	keep-power-in-suspend;
+	mmc-pwrseq = <&sdio_pwrseq>;
+	non-removable;
+	pinctrl-0 = <&sdmmc2m0_bus4 &sdmmc2m0_cmd &sdmmc2m0_clk>;
+	pinctrl-names = "default";
+	vmmc-supply = <&vcc_wifi>;
+	vqmmc-supply = <&vcca1v8_pmu>;
+	status = "okay";
+};
+
+&tsadc {
+	rockchip,hw-tshut-mode = <1>;
+	rockchip,hw-tshut-polarity = <0>;
+	status = "okay";
+};
+
+&uart1 {
+	pinctrl-0 = <&uart1m1_xfer &uart1m1_ctsn &uart1m1_rtsn>;
+	pinctrl-names = "default";
+	uart-has-rtscts;
+	status = "okay";
+
+	bluetooth {
+		compatible = "realtek,rtl8821cs-bt", "realtek,rtl8723bs-bt";
+		device-wake-gpios = <&gpio4 4 GPIO_ACTIVE_HIGH>;
+		enable-gpios = <&gpio4 3 GPIO_ACTIVE_HIGH>;
+		host-wake-gpios = <&gpio4 5 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&usb_host0_xhci {
+	dr_mode = "peripheral";
+	phys = <&usb2phy0_otg>;
+	phy-names = "usb2-phy";
+	status = "okay";
+};
+
+&usb_host1_ehci {
+	status = "okay";
+};
+
+&usb_host1_ohci {
+	status = "okay";
+};
+
+&usb_host1_xhci {
+	phy-names = "usb2-phy", "usb3-phy";
+	phys = <&usb2phy1_host>, <&combphy1 PHY_TYPE_USB3>;
+	status = "okay";
+};
+
+&usb2phy0 {
+	status = "okay";
+};
+
+&usb2phy0_otg {
+	status = "okay";
+};
+
+&usb2phy1 {
+	status = "okay";
+};
+
+&usb2phy1_host {
+	status = "okay";
+};
+
+&vop {
+	assigned-clocks = <&cru DCLK_VOP0>, <&cru DCLK_VOP1>;
+	assigned-clock-parents = <&pmucru PLL_HPLL>, <&cru PLL_VPLL>;
+	status = "okay";
+};
+
+&vop_mmu {
+	status = "okay";
+};
+
+&vp0 {
+	vp0_out_hdmi: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
+		reg = <ROCKCHIP_VOP2_EP_HDMI0>;
+		remote-endpoint = <&hdmi_in_vp0>;
+	};
+};
+
+&vp1 {
+	vp1_out_dsi0: endpoint@ROCKCHIP_VOP2_EP_MIPI0 {
+		reg = <ROCKCHIP_VOP2_EP_MIPI0>;
+		remote-endpoint = <&dsi0_in_vp1>;
+	};
+};
-- 
2.34.1

