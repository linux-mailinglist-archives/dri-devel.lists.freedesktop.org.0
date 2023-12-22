Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2F181CD9B
	for <lists+dri-devel@lfdr.de>; Fri, 22 Dec 2023 18:32:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A55210E828;
	Fri, 22 Dec 2023 17:32:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mecka.net (unknown [IPv6:2a01:4f8:1c1c:934f::1])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1334B10E781
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 11:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mecka.net; s=2016.11;
 t=1703243145; bh=2ptJBJ+/3QFpglZcMhusJxByemOTLfkTETh4d6WW3do=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=ebFLBr6+GFONJRNm4Y2iQqAe4WkNcf2iYZJwSpJaMlZtYp9nANYe9zLSsec38Ungu
 jMtuRA7Eyj7JMKxb5BfWCrelER/D/XIg1c8f5WR4Mn1VuRmw+0paSuBW54E6nbBj1c
 QxIuTnYHJ0jBPqCwRUS1QsHcEmI/5NfFxy5UgqbCsyWGgteV2F/F3Phm+8AsTjakql
 amBCM6vmDE1fwoRODInedEZjyVZXwQFhHq+zcMPki9z+85sMPVb3F1M36OHNWf2hT5
 BfMu7gp/GY0WEvDpEt3NYfQSO4tNxdAeRRIRqjdvZADIyUKYvj90TALGiBN6nP0Jmy
 i7pEXiiZzK7Og==
Received: from arthur.fritz.box (unknown [185.147.11.134])
 by mecka.net (Postfix) with ESMTPSA id 3B60E370D3F;
 Fri, 22 Dec 2023 12:05:45 +0100 (CET)
From: Manuel Traut <manut@mecka.net>
Date: Fri, 22 Dec 2023 12:05:44 +0100
Subject: [PATCH 4/6] arm64: dts: rockchip: Add devicetree for Pine64 Pinetab2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231222-pinetab2-v1-4-e148a7f61bd1@mecka.net>
References: <20231222-pinetab2-v1-0-e148a7f61bd1@mecka.net>
In-Reply-To: <20231222-pinetab2-v1-0-e148a7f61bd1@mecka.net>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sandy Huang <hjc@rock-chips.com>, Mark Yao <markyao0591@gmail.com>, 
 Diederik de Haas <didi.debian@cknow.org>, 
 Segfault <awarnecke002@hotmail.com>, Arnaud Ferraris <aferraris@debian.org>
X-Mailer: b4 0.12.4
X-Mailman-Approved-At: Fri, 22 Dec 2023 17:32:28 +0000
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
Cc: devicetree@vger.kernel.org, Manuel Traut <manut@mecka.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Segfault <awarnecke002@hotmail.com>

This includes support for both the v0.1 units that were sent to developers and
the v2.0 units from production.

v1.0 is not included as no units are known to exist.

Working/Tested:
- SDMMC
- UART
- Buttons
- Charging/Battery/PMIC
- Audio
- USB
- Display

WiFi is not added, since the driver is not ready for mainline.

Signed-off-by: Segfault <awarnecke002@hotmail.com>
Signed-off-by: Manuel Traut <manut@mecka.net>
---
 arch/arm64/boot/dts/rockchip/Makefile              |    2 +
 .../boot/dts/rockchip/rk3566-pinetab2-v0.1.dts     |   26 +
 .../boot/dts/rockchip/rk3566-pinetab2-v2.0.dts     |   46 +
 arch/arm64/boot/dts/rockchip/rk3566-pinetab2.dtsi  | 1032 ++++++++++++++++++++
 4 files changed, 1106 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index a18f33bf0c0e..ef66c0937a9b 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -77,6 +77,8 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-anbernic-rg353vs.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-anbernic-rg503.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-pinenote-v1.1.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-pinenote-v1.2.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-pinetab2-v0.1.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-pinetab2-v2.0.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-powkiddy-rgb30.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-quartz64-a.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-quartz64-b.dtb
diff --git a/arch/arm64/boot/dts/rockchip/rk3566-pinetab2-v0.1.dts b/arch/arm64/boot/dts/rockchip/rk3566-pinetab2-v0.1.dts
new file mode 100644
index 000000000000..ba244545ba26
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3566-pinetab2-v0.1.dts
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+/dts-v1/;
+
+#include "rk3566-pinetab2.dtsi"
+
+/ {
+	model = "Pine64 PineTab2 v0.1";
+	compatible = "pine64,pinetab2-v0.1", "pine64,pinetab2", "rockchip,rk3566";
+};
+
+&lcd {
+	reset-gpios = <&gpio0 RK_PA6 GPIO_ACTIVE_LOW>;
+};
+
+&pinctrl {
+	display {
+		lcd0_rst_l: lcd0-rst-l {
+			rockchip,pins = <0 RK_PA6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+};
+
+&vcc_wl {
+	gpio = <&gpio0 RK_PA0 GPIO_ACTIVE_LOW>;
+};
diff --git a/arch/arm64/boot/dts/rockchip/rk3566-pinetab2-v2.0.dts b/arch/arm64/boot/dts/rockchip/rk3566-pinetab2-v2.0.dts
new file mode 100644
index 000000000000..f401ff802175
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3566-pinetab2-v2.0.dts
@@ -0,0 +1,46 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+/dts-v1/;
+
+#include "rk3566-pinetab2.dtsi"
+
+/ {
+	model = "Pine64 PineTab2 v2.0";
+	compatible = "pine64,pinetab2-v2.0", "pine64,pinetab2", "rockchip,rk3566";
+};
+
+&gpio_keys {
+	pinctrl-0 = <&kb_id_det>, <&hall_int_l>;
+
+	event-hall-sensor {
+		debounce-interval = <20>;
+		gpios = <&gpio0 RK_PA6 GPIO_ACTIVE_LOW>;
+		label = "Hall Sensor";
+		linux,code = <SW_LID>;
+		linux,input-type = <EV_SW>;
+		wakeup-event-action = <EV_ACT_DEASSERTED>;
+		wakeup-source;
+	};
+};
+
+&lcd {
+	reset-gpios = <&gpio0 RK_PC6 GPIO_ACTIVE_LOW>;
+};
+
+&pinctrl {
+	display {
+		lcd0_rst_l: lcd0-rst-l {
+			rockchip,pins = <0 RK_PC6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	hall {
+		hall_int_l: hall-int-l {
+			rockchip,pins = <0 RK_PA6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+};
+
+&vcc_wl {
+	gpio = <&gpio0 RK_PA0 GPIO_ACTIVE_HIGH>;
+};
diff --git a/arch/arm64/boot/dts/rockchip/rk3566-pinetab2.dtsi b/arch/arm64/boot/dts/rockchip/rk3566-pinetab2.dtsi
new file mode 100644
index 000000000000..6d320cfee338
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3566-pinetab2.dtsi
@@ -0,0 +1,1032 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/gpio-keys.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/pinctrl/rockchip.h>
+#include <dt-bindings/soc/rockchip,vop2.h>
+#include <dt-bindings/usb/pd.h>
+#include "rk3566.dtsi"
+
+/ {
+	chassis-type = "tablet";
+
+	aliases {
+		mmc0 = &sdmmc0;
+		mmc1 = &sdhci;
+	};
+
+	chosen {
+		stdout-path = "serial2:1500000n8";
+	};
+
+	adc-keys {
+		compatible = "adc-keys";
+		io-channels = <&saradc 0>;
+		io-channel-names = "buttons";
+		keyup-threshold-microvolt = <1800000>;
+		poll-interval = <25>;
+
+		button-vol-up {
+			label = "Volume Up";
+			linux,code = <KEY_VOLUMEUP>;
+			press-threshold-microvolt = <297500>;
+		};
+
+		button-vol-down {
+			label = "Volume Down";
+			linux,code = <KEY_VOLUMEDOWN>;
+			press-threshold-microvolt = <1750>;
+		};
+	};
+
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pwm4 0 25000 0>;
+		brightness-levels = <20 220>;
+		num-interpolated-steps = <200>;
+		default-brightness-level = <100>;
+		power-supply = <&vcc_sys>;
+	};
+
+	battery: battery {
+		compatible = "simple-battery";
+		charge-full-design-microamp-hours = <6000000>;
+		charge-term-current-microamp = <300000>;
+		constant-charge-current-max-microamp = <2000000>;
+		constant-charge-voltage-max-microvolt = <4300000>;
+		voltage-max-design-microvolt = <4350000>;
+		voltage-min-design-microvolt = <3400000>;
+
+		ocv-capacity-celsius = <20>;
+		ocv-capacity-table-0 = <4322000 100>, <4250000 95>, <4192000 90>, <4136000 85>,
+				       <4080000 80>, <4022000 75>, <3972000 70>, <3928000 65>,
+				       <3885000 60>, <3833000 55>, <3798000 50>, <3780000 45>,
+				       <3776000 40>, <3773000 35>, <3755000 30>, <3706000 25>,
+				       <3640000 20>, <3589000 15>, <3535000 10>, <3492000 5>,
+				       <3400000 0>;
+	};
+
+	gpio_keys: gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-names = "default";
+		pinctrl-0 = <&kb_id_det>;
+
+		tablet-mode-switch {
+			debounce-interval = <20>;
+			gpios = <&gpio4 RK_PA4 GPIO_ACTIVE_HIGH>;
+			label = "Tablet Mode";
+			linux,input-type = <EV_SW>;
+			linux,code = <SW_TABLET_MODE>;
+		};
+	};
+
+	hdmi-con {
+		compatible = "hdmi-connector";
+		type = "d";
+
+		port {
+			hdmi_con_in: endpoint {
+				remote-endpoint = <&hdmi_out_con>;
+			};
+		};
+	};
+
+	led-flash {
+		compatible = "regulator-led";
+		vled-supply = <&led_flash_reg>;
+		function = LED_FUNCTION_FLASH;
+		color = <LED_COLOR_ID_WHITE>;
+	};
+
+	led_flash_reg: led-flash-reg {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpio4 RK_PA5 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&flash_led_en_h>;
+		regulator-name = "led_flash_reg";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc5v_midu>;
+	};
+
+	rk817-sound {
+		compatible = "simple-audio-card";
+		pinctrl-names = "default";
+		pinctrl-0 = <&hp_det_l>;
+		simple-audio-card,format = "i2s";
+		simple-audio-card,name = "PineTab2";
+		simple-audio-card,mclk-fs = <256>;
+
+		simple-audio-card,widgets =
+			"Microphone", "Mic Jack",
+			"Headphone", "Headphones",
+			"Microphone", "Microphone",
+			"Speaker", "Speakers";
+
+		simple-audio-card,routing =
+			"MICL", "Microphone",
+			"MICR", "Mic Jack",
+			"Headphones", "HPOL",
+			"Headphones", "HPOR",
+			"Speaker Amplifier INL", "HPOL",
+			"Speaker Amplifier INR", "HPOR",
+			"Speakers", "Speaker Amplifier OUTL",
+			"Speakers", "Speaker Amplifier OUTR";
+
+		simple-audio-card,hp-det-gpio = <&gpio4 RK_PC6 GPIO_ACTIVE_HIGH>;
+		simple-audio-card,aux-devs = <&speaker_amp>;
+		simple-audio-card,pin-switches = "Speakers", "Microphone";
+
+		simple-audio-card,cpu {
+			sound-dai = <&i2s1_8ch>;
+		};
+
+		simple-audio-card,codec {
+			sound-dai = <&rk817>;
+		};
+	};
+
+	sdio_pwrseq: sdio-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		clocks = <&rk817 1>;
+		clock-names = "ext_clock";
+		pinctrl-names = "default";
+		pinctrl-0 = <&wifi_reset>;
+		reset-gpios = <&gpio3 RK_PD2 GPIO_ACTIVE_LOW>;
+		post-power-on-delay-ms = <200>;
+	};
+
+	speaker_amp: speaker-amplifier {
+		compatible = "simple-audio-amplifier";
+		pinctrl-names = "default";
+		pinctrl-0 = <&spk_ctl>;
+		enable-gpios = <&gpio4 RK_PC2 GPIO_ACTIVE_HIGH>;
+		sound-name-prefix = "Speaker Amplifier";
+		VCC-supply = <&vcc_bat>;
+	};
+
+	vcc_3v3: vcc_3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_3v3";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc3v3_sys>;
+
+		regulator-state-mem {
+			regulator-off-in-suspend;
+		};
+	};
+
+	vcc3v3_minipcie: vcc3v3_minipcie {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpio4 RK_PC3 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pcie_pwren_h>;
+		regulator-name = "vcc3v3_minipcie";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc_sys>;
+
+		regulator-state-mem {
+			regulator-off-in-suspend;
+		};
+	};
+
+	vcc3v3_sd: vcc3v3_sd {
+		compatible = "regulator-fixed";
+		gpio = <&gpio0 RK_PA5 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&sdmmc_pwren_l>;
+		regulator-name = "vcc3v3_sd";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc3v3_sys>;
+
+		regulator-state-mem {
+			regulator-off-in-suspend;
+		};
+	};
+
+	vcc5v0_usb_host0: vcc5v0_usb_host0 {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpio4 RK_PC4 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb_host_pwren1_h>;
+		regulator-name = "vcc5v0_usb_host0";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc5v_midu>;
+
+		regulator-state-mem {
+			regulator-off-in-suspend;
+		};
+	};
+
+	vcc5v0_usb_host2: vcc5v0_usb_host2 {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpio4 RK_PC5 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb_host_pwren2_h>;
+		regulator-name = "vcc5v0_usb_host2";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc5v_midu>;
+
+		regulator-state-mem {
+			regulator-off-in-suspend;
+		};
+	};
+
+	vcc_bat: vcc_bat {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_bat";
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vcc_sys: vcc_sys {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_sys";
+		regulator-always-on;
+		regulator-boot-on;
+		vin-supply = <&vcc_bat>;
+	};
+
+	vcc_wl: vcc_wl {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&wifi_pwren>;
+		regulator-name = "vcc_wl";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc3v3_sys>;
+
+		regulator-state-mem {
+			regulator-off-in-suspend;
+		};
+	};
+
+	vdd1v2_dvp: vdd1v2_dvp {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd1v2_dvp";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		vin-supply = <&vcc_3v3>;
+		/*enable-supply = <&vcc2v8_dvp>;*/
+	};
+};
+
+&combphy1 {
+	status = "okay";
+};
+
+&combphy2 {
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
+&cru {
+	assigned-clocks = <&cru PLL_GPLL>, <&pmucru PLL_PPLL>, <&cru PLL_VPLL>;
+	assigned-clock-rates = <1200000000>, <200000000>, <500000000>;
+};
+
+&csi_dphy {
+	status = "okay";
+};
+
+&dsi0 {
+	status = "okay";
+	clock-master;
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	lcd: panel@0 {
+		compatible = "boe,th101mb31ig002-28a";
+		reg = <0>;
+		backlight = <&backlight>;
+		enable-gpios = <&gpio0 RK_PC7 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&lcd_pwren_h &lcd0_rst_l>;
+		rotation = <90>;
+		power-supply = <&vcc_3v3>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				panel_in_dsi: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&dsi0_out_con>;
+				};
+			};
+		};
+	};
+};
+
+&dsi0_in {
+	dsi0_in_vp1: endpoint {
+		remote-endpoint = <&vp1_out_dsi0>;
+	};
+};
+
+&dsi0_out {
+	dsi0_out_con: endpoint {
+		remote-endpoint = <&panel_in_dsi>;
+	};
+};
+
+&dsi_dphy0 {
+	status = "okay";
+};
+
+&gpu {
+	mali-supply = <&vdd_gpu_npu>;
+	status = "okay";
+};
+
+&hdmi {
+	avdd-0v9-supply = <&vdda_0v9_p>;
+	avdd-1v8-supply = <&vcc_1v8>;
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
+	clock-frequency = <400000>;
+	status = "okay";
+
+	vdd_cpu: regulator@1c {
+		compatible = "tcs,tcs4525";
+		reg = <0x1c>;
+		fcs,suspend-voltage-selector = <1>;
+		regulator-name = "vdd_cpu";
+		regulator-min-microvolt = <800000>;
+		regulator-max-microvolt = <1150000>;
+		regulator-ramp-delay = <2300>;
+		regulator-always-on;
+		regulator-boot-on;
+		vin-supply = <&vcc_sys>;
+
+		regulator-state-mem {
+			regulator-off-in-suspend;
+		};
+	};
+
+	rk817: pmic@20 {
+		compatible = "rockchip,rk817";
+		reg = <0x20>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PA3 IRQ_TYPE_LEVEL_LOW>;
+		assigned-clocks = <&cru I2S1_MCLKOUT_TX>;
+		assigned-clock-parents = <&cru CLK_I2S1_8CH_TX>;
+		clock-names = "mclk";
+		clocks = <&cru I2S1_MCLKOUT_TX>;
+		clock-output-names = "rk808-clkout1", "rk808-clkout2";
+		#clock-cells = <1>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pmic_int_l>, <&i2s1m0_mclk>;
+		rockchip,system-power-controller;
+		#sound-dai-cells = <0>;
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
+		vcc9-supply = <&vcc5v_midu>;
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
+				};
+			};
+
+			vdd_gpu_npu: DCDC_REG2 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <1350000>;
+				regulator-ramp-delay = <6001>;
+				regulator-initial-mode = <0x2>;
+				regulator-name = "vdd_gpu_npu";
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
+			vcc3v3_sys: DCDC_REG4 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-initial-mode = <0x2>;
+				regulator-name = "vcc3v3_sys";
+				regulator-state-mem {
+					regulator-off-in-suspend;
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
+				};
+			};
+
+			vdda_0v9_p: LDO_REG2 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <900000>;
+				regulator-name = "vdda_0v9_p";
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
+				regulator-max-microvolt = <1800000>;
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
+			vcc5v_midu: BOOST {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <5000000>;
+				regulator-max-microvolt = <5000000>;
+				regulator-name = "boost";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vbus: OTG_SWITCH {
+				regulator-min-microvolt = <5000000>;
+				regulator-max-microvolt = <5000000>;
+				regulator-name = "otg_switch";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+		};
+
+		charger {
+			monitored-battery = <&battery>;
+			rockchip,resistor-sense-micro-ohms = <10000>;
+			rockchip,sleep-enter-current-microamp = <300000>;
+			rockchip,sleep-filter-current-microamp = <100000>;
+		};
+	};
+};
+
+&i2c1 {
+	clock-frequency = <400000>;
+	status = "okay";
+
+	touchscreen@5d {
+		compatible = "goodix,gt911";
+		reg = <0x5d>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PB0 IRQ_TYPE_EDGE_FALLING>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&tp_int_l_pmuio2>, <&tp_rst_l_pmuio2>;
+		AVDD28-supply = <&vcc3v3_pmu>;
+		VDDIO-supply = <&vcca1v8_pmu>;
+		irq-gpios = <&gpio0 RK_PB0 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&gpio0 RK_PC2 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&i2c2 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&i2c2m1_xfer>;
+	status = "okay";
+
+	vcm@c {
+		compatible = "dongwoon,dw9714";
+		reg = <0x0c>;
+		vcc-supply = <&vcc1v8_dvp>;
+	};
+
+	camera@36 {
+		compatible = "ovti,ov5648";
+		reg = <0x36>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&camerab_pdn_l &camerab_rst_l>;
+
+		clocks = <&cru CLK_CIF_OUT>;
+		assigned-clocks = <&cru CLK_CIF_OUT>;
+		assigned-clock-rates = <24000000>;
+
+		avdd-supply = <&vcc2v8_dvp>;
+		dvdd-supply = <&vdd1v2_dvp>;
+		dovdd-supply = <&vcc1v8_dvp>;
+		powerdown-gpios = <&gpio4 RK_PB3 GPIO_ACTIVE_LOW>;
+		reset-gpios = <&gpio4 RK_PB1 GPIO_ACTIVE_LOW>;
+
+		port {
+			endpoint {
+				data-lanes = <1 2>;
+				remote-endpoint = <0>;
+				link-frequencies = /bits/ 64 <210000000 168000000>;
+			};
+		};
+	};
+};
+
+&i2c5 {
+	clock-frequency = <400000>;
+	status = "okay";
+
+	accelerometer@18 {
+		compatible = "silan,sc7a20";
+		reg = <0x18>;
+		interrupt-parent = <&gpio3>;
+		interrupts = <RK_PA2 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&gsensor_int_l>;
+		st,drdy-int-pin = <1>;
+		vdd-supply = <&vcc_1v8>;
+		vddio-supply = <&vcc_1v8>;
+		mount-matrix = "1", "0", "0",
+			       "0", "0", "1",
+			       "0", "1", "0";
+	};
+};
+
+&i2s0_8ch {
+	status = "okay";
+};
+
+&i2s1_8ch {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2s1m0_sclktx
+		     &i2s1m0_lrcktx
+		     &i2s1m0_sdi0
+		     &i2s1m0_sdo0>;
+	rockchip,trcm-sync-tx-only;
+	status = "okay";
+};
+
+&pcie2x1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie_reset_h>;
+	reset-gpios = <&gpio1 RK_PB2 GPIO_ACTIVE_HIGH>;
+	vpcie3v3-supply = <&vcc3v3_minipcie>;
+	status = "okay";
+};
+
+&pinctrl {
+	accelerometer {
+		gsensor_int_l: gsensor-int-l {
+			rockchip,pins = <3 RK_PA2 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+
+	bluetooth {
+		bt_wake_host_h: bt-wake-host-h {
+			rockchip,pins = <0 RK_PB5 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+	};
+
+	camerab {
+		camerab_pdn_l: camerab-pdn-l {
+			rockchip,pins = <4 RK_PB3 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		camerab_rst_l: camerab-rst-l {
+			rockchip,pins = <4 RK_PB1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	cameraf {
+		cameraf_pdn_l: cameraf-pdn-l {
+			rockchip,pins = <4 RK_PB2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		cameraf_rst_l: cameraf-rst-l {
+			rockchip,pins = <4 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	display {
+		lcd_pwren_h: lcd-pwren-h {
+			rockchip,pins = <0 RK_PC7 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	flash {
+		flash_led_en_h: flash-led-en-h {
+			rockchip,pins = <4 RK_PA5 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	keyboard {
+		kb_id_det: kb-id-det {
+			rockchip,pins = <4 RK_PA4 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	pcie {
+		pcie_pwren_h: pcie-pwren-h {
+			rockchip,pins = <4 RK_PC3 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		pcie_reset_h: pcie-reset-h {
+			rockchip,pins = <1 RK_PB2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	pmic {
+		pmic_int_l: pmic-int-l {
+			rockchip,pins = <0 RK_PA3 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+
+	sd {
+		sdmmc_pwren_l: sdmmc-pwren-l {
+			rockchip,pins = <0 RK_PA5 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	fspi {
+		fspi_dual_io_pins: fspi-dual-io-pins {
+			rockchip,pins =
+				/* fspi_clk */
+				<1 RK_PD0 1 &pcfg_pull_none>,
+				/* fspi_cs0n */
+				<1 RK_PD3 1 &pcfg_pull_none>,
+				/* fspi_d0 */
+				<1 RK_PD1 1 &pcfg_pull_none>,
+				/* fspi_d1 */
+				<1 RK_PD2 1 &pcfg_pull_none>;
+		};
+	};
+
+	sound {
+		hp_det_l: hp-det-l {
+			rockchip,pins = <4 RK_PC6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		spk_ctl: spk-ctl {
+			rockchip,pins = <4 RK_PC2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	touchscreen {
+		tp_int_l_pmuio2: tp-int-l-pmuio2 {
+			rockchip,pins = <0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+
+		tp_rst_l_pmuio2: tp-rst-l-pmuio2 {
+			rockchip,pins = <0 RK_PC2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	usb {
+		usbcc_int_l: usbcc-int-l {
+			rockchip,pins = <0 RK_PC5 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		usb_host_pwren1_h: usb-host-pwren1-h {
+			rockchip,pins = <4 RK_PC4 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		usb_host_pwren2_h: usb-host-pwren2-h {
+			rockchip,pins = <4 RK_PC5 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	wifi {
+		host_wake_wl: host-wake-wl {
+			rockchip,pins = <0 RK_PB7 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		wifi_pwren: wifi-pwren {
+			rockchip,pins = <0 RK_PA0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		wifi_reg_on_h: wifi-reg-on-h {
+			rockchip,pins = <0 RK_PC0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		wifi_reset: wifi-reset {
+			rockchip,pins = <3 RK_PD2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		wifi_wake_host_h: wifi-wake-host-h {
+			rockchip,pins = <0 RK_PC4 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+	};
+};
+
+&pmu_io_domains {
+	pmuio1-supply = <&vcc3v3_pmu>;
+	pmuio2-supply = <&vcca1v8_pmu>;
+	vccio1-supply = <&vccio_acodec>;
+	vccio2-supply = <&vcc_1v8>;
+	vccio3-supply = <&vccio_sd>;
+	vccio4-supply = <&vcc_1v8>;
+	vccio5-supply = <&vcc_1v8>;
+	vccio6-supply = <&vcc1v8_dvp>;
+	vccio7-supply = <&vcc_3v3>;
+	status = "okay";
+};
+
+&pwm4 {
+	status = "okay";
+};
+
+&saradc {
+	vref-supply = <&vcc_1v8>;
+	status = "okay";
+};
+
+&sdhci {
+	bus-width = <8>;
+	no-sdio;
+	no-sd;
+	non-removable;
+	max-frequency = <200000000>;
+	mmc-hs200-1_8v;
+	pinctrl-names = "default";
+	pinctrl-0 = <&emmc_bus8
+		     &emmc_clk
+		     &emmc_cmd
+		     &emmc_datastrobe
+		     &emmc_rstnout>;
+	vmmc-supply = <&vcc_3v3>;
+	vqmmc-supply = <&vcc_1v8>;
+	status = "okay";
+};
+
+&sdmmc0 {
+	bus-width = <4>;
+	cap-sd-highspeed;
+	cd-gpios = <&gpio0 RK_PA4 GPIO_ACTIVE_LOW>;
+	disable-wp;
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdmmc0_bus4
+		     &sdmmc0_clk
+		     &sdmmc0_cmd
+		     &sdmmc0_det>;
+	sd-uhs-sdr104;
+	vmmc-supply = <&vcc3v3_sd>;
+	vqmmc-supply = <&vccio_sd>;
+	status = "okay";
+};
+
+&sdmmc1 {
+	bus-width = <4>;
+	cap-sd-highspeed;
+	cap-sdio-irq;
+	keep-power-in-suspend;
+	mmc-pwrseq = <&sdio_pwrseq>;
+	non-removable;
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdmmc1_bus4
+		     &sdmmc1_cmd
+		     &sdmmc1_clk>;
+	sd-uhs-sdr104;
+	vmmc-supply = <&vcc_wl>;
+	vqmmc-supply = <&vcca1v8_pmu>;
+	status = "okay";
+};
+
+&sfc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&fspi_dual_io_pins>;
+	status = "okay";
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <24000000>;
+		spi-rx-bus-width = <2>;
+		spi-tx-bus-width = <1>;
+	};
+};
+
+&tsadc {
+	rockchip,hw-tshut-mode = <1>;
+	rockchip,hw-tshut-polarity = <0>;
+	status = "okay";
+};
+
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart1m0_xfer
+		     &uart1m0_ctsn
+		     &uart1m0_rtsn>;
+	status = "okay";
+	uart-has-rtscts;
+};
+
+&uart2 {
+	status = "okay";
+};
+
+&usb_host0_ehci {
+	status = "okay";
+};
+
+&usb_host0_ohci {
+	status = "okay";
+};
+
+&usb_host0_xhci {
+	status = "okay";
+};
+
+&usb_host1_xhci {
+	status = "okay";
+};
+
+&usb2phy0 {
+	status = "okay";
+};
+
+&usb2phy0_host {
+	phy-supply = <&vcc5v0_usb_host0>;
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
+&usb2phy1_otg {
+	phy-supply = <&vcc5v0_usb_host2>;
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
2.43.0

