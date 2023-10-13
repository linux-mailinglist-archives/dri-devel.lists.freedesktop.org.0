Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E3A7C8D29
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 20:39:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C334510E631;
	Fri, 13 Oct 2023 18:39:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B11E10E62E
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 18:39:29 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id
 5614622812f47-3b2b1af09c5so497305b6e.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 11:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697222368; x=1697827168; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=taQ7vAEpEsyYFLFUuiwGBIsz4PkgF1SnWSyqumrI0Hg=;
 b=Ro+QQeW5NWJrV09ARb0dsr9G1WLELNHKAUqbo2e0rv9VaDKu6ZRhliLrBMmUeJNYE3
 GyOyIe4DHf4RWw4hyapV6u6s2OH6uiMtGxlxwTYWWpZ2jQ6ce3Fr9XiHouMX9s2ziX7H
 vFrY72314/E3r7Pkr+GRWf4XaauT1NlyLSjfLOtD7aKYxkkqBe29wP0cupjRtPPDeZGF
 SI0vm+uZUXDW4KT8tIcfIOL1+2UFdV1RscgFG/1AC/JRgvnbvEkTprEEaSOOhrplQwVc
 ApHbXfCt/RZtJmIklA2Fc4ybWqmCynjLW3d0no07hd631ixYZEDEPPZMGit7+flDWjgt
 MbcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697222368; x=1697827168;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=taQ7vAEpEsyYFLFUuiwGBIsz4PkgF1SnWSyqumrI0Hg=;
 b=sgDXvRj7fhEtxLD8IFwPwycrzi7wiVypMlMe9f69yV3U4evKvJBtCRGAO6lsGtzhfL
 x5WJR1tpAH+nsHI4MGiMhk0cp6FamX8XszWNhMh8BZF28fNF+ukfjkxZh/PFNIkSubBM
 e7b4kew60K3doz8g0mvP6us8wWGr6c7Nz2x4agDVKGxU8SJPxKDTBZTtfZQfcQ1VOJ85
 cpAv1XcxaiMGwiSkSYFqIoWpMsGpKpvfoAy5eUBmJLAtXLKytiAyr2lSRUSpo1k4r1YV
 wyUo67kAcmAO99l/G6JfCV4PXTzpYl9gJ8etThsjg44e6/wS17w2wb/m3SngxweK1EI2
 nldQ==
X-Gm-Message-State: AOJu0YzEgK4AXGlNUSJEapZVy9GoZIpw8y9/PJTR72PP8eGm9HgnJTX8
 1wAi2FTIOD0i+e4nuKhhHXA=
X-Google-Smtp-Source: AGHT+IEOHRMzzwdVAGQ57P+LsaY7TAEk+aijWm2eVqpD+nW1THPcnfl7PoK9r88Yvpx6L8xVpVn8yg==
X-Received: by 2002:aca:220e:0:b0:3af:26e3:92e with SMTP id
 b14-20020aca220e000000b003af26e3092emr23790520oic.28.1697222368552; 
 Fri, 13 Oct 2023 11:39:28 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
 by smtp.gmail.com with ESMTPSA id
 bx19-20020a0568081b1300b003afe584ed4fsm842159oib.42.2023.10.13.11.39.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 11:39:28 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Subject: [PATCH 5/5] arm64: dts: rockchip: add support for Powkiddy RGB30
Date: Fri, 13 Oct 2023 13:39:18 -0500
Message-Id: <20231013183918.225666-6-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231013183918.225666-1-macroalpha82@gmail.com>
References: <20231013183918.225666-1-macroalpha82@gmail.com>
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
Cc: megous@megous.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, kernel@puri.sm, sam@ravnborg.org,
 neil.armstrong@linaro.org, agx@sigxcpu.org,
 Chris Morgan <macromorgan@hotmail.com>, sebastian.reichel@collabora.com,
 dri-devel@lists.freedesktop.org, jagan@edgeble.ai, robh+dt@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

The Powkiddy RGB30 is a portable game device based on the Rockchip
RK3566 SoC. It has GPIO buttons on the face and sides for input, stereo
speakers, a 720x720 4 inch DSI display, a USB-C host port and a USB-C
peripheral port, dual SD card slots, WiFi, Bluetooth, and 1GB of RAM.

Working/Tested:
- SDMMC
- UART (for debugging)
- Buttons
- Charging/battery/PMIC
- Speaker/Headphones
- USB
- WiFi
- Bluetooth
- Display (at 59.04hz)

Not Working/TODO:
- Display does not resume from suspend properly. I'm working with the
  manufacturer to resolve this.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3566-powkiddy-rgb30.dts    | 152 ++++++++++++++++++
 2 files changed, 153 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb30.dts

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index e7728007fd1b..3f01b429a3aa 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -77,6 +77,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-anbernic-rg353vs.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-anbernic-rg503.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-pinenote-v1.1.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-pinenote-v1.2.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-powkiddy-rgb30.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-quartz64-a.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-quartz64-b.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-radxa-cm3-io.dtb
diff --git a/arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb30.dts b/arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb30.dts
new file mode 100644
index 000000000000..c7828c99a1bb
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb30.dts
@@ -0,0 +1,152 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/linux-event-codes.h>
+#include <dt-bindings/pinctrl/rockchip.h>
+#include "rk3566-anbernic-rg353x.dtsi"
+
+/ {
+	model = "RGB30";
+	compatible = "powkiddy,rgb30", "rockchip,rk3566";
+
+	aliases {
+		mmc1 = &sdmmc0;
+		mmc2 = &sdmmc1;
+		mmc3 = &sdmmc2;
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
+};
+
+/delete-node/ &adc_keys;
+
+&cru {
+	assigned-clocks = <&pmucru CLK_RTC_32K>, <&cru PLL_GPLL>,
+			  <&pmucru PLL_PPLL>, <&cru PLL_VPLL>;
+	assigned-clock-rates = <32768>, <1200000000>,
+			       <200000000>, <108000000>;
+};
+
+&gpio_keys_control {
+	button-r1 {
+		gpios = <&gpio3 RK_PB3 GPIO_ACTIVE_LOW>;
+		label = "TR";
+		linux,code = <BTN_TR>;
+	};
+
+	button-r2 {
+		gpios = <&gpio3 RK_PB4 GPIO_ACTIVE_LOW>;
+		label = "TR2";
+		linux,code = <BTN_TR2>;
+	};
+};
+
+/delete-node/ &{/i2c@fdd40000/regulator@40};
+
+&i2c0 {
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
+/*
+ * Device has 2 red LEDs instead of an amber and a red. Relabel LEDs as
+ * red_led0 and red_led1.
+ */
+/delete-node/ &{/pwm-leds/led-1};
+/delete-node/ &{/pwm-leds/led-2};
+
+&leds {
+	red_led0: led-1 {
+		color = <LED_COLOR_ID_RED>;
+		function = LED_FUNCTION_CHARGING;
+		max-brightness = <255>;
+		pwms = <&pwm7 0 25000 0>;
+	};
+
+	red_led1: led-2 {
+		color = <LED_COLOR_ID_RED>;
+		default-state = "off";
+		function = LED_FUNCTION_STATUS;
+		max-brightness = <255>;
+		pwms = <&pwm0 0 25000 0>;
+	};
+};
+
+&panel {
+	compatible = "powkiddy,rgb30-panel";
+	vcc-supply = <&vcc3v3_lcd0_n>;
+	iovcc-supply = <&vcc3v3_lcd0_n>;
+	/delete-property/ vdd-supply;
+};
+
+&pwm5 {
+	status = "disabled";
+};
+
+&rk817 {
+	rk817_charger: charger {
+		monitored-battery = <&battery>;
+		rockchip,resistor-sense-micro-ohms = <10000>;
+		rockchip,sleep-enter-current-microamp = <300000>;
+		rockchip,sleep-filter-current-microamp = <100000>;
+	};
+};
+
+/delete-node/ &vibrator;
-- 
2.34.1

