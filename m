Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1A778CAAB
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 19:19:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E89DE10E463;
	Tue, 29 Aug 2023 17:18:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43AAE10E450
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 17:17:57 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-99bcfe28909so599862266b.3
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 10:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693329476; x=1693934276;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9dgLUHwMy8Op6Q955RlBIJYZNEpbxIwHtFF9Axp5TBc=;
 b=rVocglGgRvpy+hgqv358C8NtQBIl+vNJ9cAF/wVlRixvPboXyjdw4vtXaI1sOyXcek
 Jsyq/4NNhXpliV2UmTHOR95bZzPPaOdsrz6beMnEaO7NC9pmJygJfdEgXIblbEUDYoVQ
 w1Aow4ihAO0S263Z3BxXFi+Za75AfB9GWduekvLTlLfAn0JCEnBRf2oTZ/tFPSFC4BPJ
 o21DKAiEh0uKjHHd/H2tX2hu2QACHNMsooBUvbIJ9N9kS2ZPR6gnm2VGSrcbT/OCeRwy
 cByHzv+q/ysAd8dyiNLiQppVdsrjyT4XsRpp7eia1Nb7Tq1mTfAKidgwcooLEulq4Z9Z
 YBVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693329476; x=1693934276;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9dgLUHwMy8Op6Q955RlBIJYZNEpbxIwHtFF9Axp5TBc=;
 b=dcM2VIsy6WMEvlhJOvq+7b1bImDxthpG9E5BO/N6QLdniJdkXv8uVNAH8g6Arp9u76
 P+gWpi3UovX6HbnkK06+Sl3ljMtXysYsS8TdgssilHUy5yv7z51VpHXlBomNln/viJgW
 PkYebRNjf9yDw6TUxzdaO1jvhzi0JsN648MbJjAibYc1vax1R4qd0Yq9a+VDzzYJd7UF
 yFm6y6/FdZRPrt99nRbxxDrmdZAkA/JaEfUUwZmyKIJcWxJL0t26ZJrRLBQ5fneoMO4k
 gpIIfreB4Qxr5Oa5BxFy6JD7vsuG2QB0AWhNjsKEtduX5rFAwPp0YHt6zyvpa0+AATlR
 wuvg==
X-Gm-Message-State: AOJu0Yxd68NeuXD8wzMbQWq6i/67Z1S5KDsIlb/YvS9FcxTA1tvc/SHP
 yyU+BJr06+3JTdokuK8dSIcP2qaWvQ==
X-Google-Smtp-Source: AGHT+IEAHEpea0my2awNoKKTjwFIoo2aOA5dRzNaAYj8ArUp4igUchYtsYpX/tLmQOBb/TDR6xtBKA==
X-Received: by 2002:a17:906:5a45:b0:9a1:cdf1:ba6 with SMTP id
 my5-20020a1709065a4500b009a1cdf10ba6mr14633357ejc.12.1693329475384; 
 Tue, 29 Aug 2023 10:17:55 -0700 (PDT)
Received: from U4.lan ([2001:9e8:b958:3410:8e0c:ed68:cd6c:7cb8])
 by smtp.gmail.com with ESMTPSA id
 a21-20020a1709062b1500b00993cc1242d4sm6115834ejg.151.2023.08.29.10.17.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Aug 2023 10:17:55 -0700 (PDT)
From: Alex Bee <knaerzche@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Lee Jones <lee@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>
Subject: [PATCH 31/31] ARM: dts: Add Geniatech XPI-3128 RK3128 board
Date: Tue, 29 Aug 2023 19:16:47 +0200
Message-ID: <20230829171647.187787-32-knaerzche@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230829171647.187787-1-knaerzche@gmail.com>
References: <20230829171647.187787-1-knaerzche@gmail.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Elaine Zhang <zhangqing@rock-chips.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Alex Bee <knaerzche@gmail.com>,
 linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org,
 Johan Jonker <jbx6244@gmail.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

XPI-3128 is RK3128 based SBC form Geniatec in RPi form factor

Specs:
- Rockchip RK3128
- 1 GB DDR3 DRAM
- 8/16 GB eMMC
- TF card slot
- 100 MBit ethernet / RJ45
- optional Marvell 88W8897 (USB version)
- 3 x USB host (onboard GL852G hub connected to SoC ehci host)
- 1 x USB otg
- 1 x Type-C (solely for powering the board)
- HDMI 1.4 out
- 1 ADC button
- IR receiver
- Artasie AM1805 RTC
- 40 pin header

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 arch/arm/boot/dts/rockchip/Makefile           |   1 +
 .../arm/boot/dts/rockchip/rk3128-xpi-3128.dts | 431 ++++++++++++++++++
 2 files changed, 432 insertions(+)
 create mode 100644 arch/arm/boot/dts/rockchip/rk3128-xpi-3128.dts

diff --git a/arch/arm/boot/dts/rockchip/Makefile b/arch/arm/boot/dts/rockchip/Makefile
index 0f46e18fe275..58868cf0510b 100644
--- a/arch/arm/boot/dts/rockchip/Makefile
+++ b/arch/arm/boot/dts/rockchip/Makefile
@@ -10,6 +10,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += \
 	rk3066a-mk808.dtb \
 	rk3066a-rayeager.dtb \
 	rk3128-evb.dtb \
+	rk3128-xpi-3128.dtb \
 	rk3188-bqedison2qc.dtb \
 	rk3188-px3-evb.dtb \
 	rk3188-radxarock.dtb \
diff --git a/arch/arm/boot/dts/rockchip/rk3128-xpi-3128.dts b/arch/arm/boot/dts/rockchip/rk3128-xpi-3128.dts
new file mode 100644
index 000000000000..842b5f20d98a
--- /dev/null
+++ b/arch/arm/boot/dts/rockchip/rk3128-xpi-3128.dts
@@ -0,0 +1,431 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+/dts-v1/;
+
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+#include "rk3128.dtsi"
+
+/ {
+	model = "Geniatech XPI-3128";
+	compatible = "geniatech,xpi-3128", "rockchip,rk3128";
+
+	aliases {
+		ethernet0 = &gmac;
+		gpio0 = &gpio0;
+		gpio1 = &gpio1;
+		gpio2 = &gpio2;
+		gpio3 = &gpio3;
+		mmc0 = &emmc;
+		mmc1 = &sdmmc;
+		serial0 = &uart1;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	adc-keys {
+		compatible = "adc-keys";
+		io-channels = <&saradc 1>;
+		io-channel-names = "buttons";
+		keyup-threshold-microvolt = <3300000>;
+
+		button-recovery {
+			label = "Recovery";
+			linux,code = <KEY_VENDOR>;
+			press-threshold-microvolt = <0>;
+		};
+	};
+
+	dc_5v: dc-5v-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "DC_5V";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	/*
+	 * This is a vbus-supply, which also supplies the GL852G usb hub,
+	 * thus has to be always-on
+	 */
+	host_pwr_5v: host-pwr-5v-regulator {
+		compatible = "regulator-fixed";
+		gpio = <&gpio3 RK_PC4 GPIO_ACTIVE_HIGH>;
+		startup-delay-us = <1500>;
+		regulator-name = "HOST_PWR_5V";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&dc_5v>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&host_drv>;
+		enable-active-high;
+		regulator-always-on;
+	};
+
+	ir-receiver {
+		compatible = "gpio-ir-receiver";
+		gpios = <&gpio3 RK_PD2 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&ir_int>;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-power {
+			gpios = <&gpio0 RK_PD2 GPIO_ACTIVE_HIGH>;
+			function = LED_FUNCTION_POWER;
+			color = <LED_COLOR_ID_BLUE>;
+			default-state = "on";
+			pinctrl-names = "default";
+			pinctrl-0 = <&power_led>;
+		};
+
+		led-spd {
+			gpios = <&gpio3 RK_PB3 GPIO_ACTIVE_LOW>;
+			function = LED_FUNCTION_LAN;
+			color = <LED_COLOR_ID_GREEN>;
+			/*
+			 * currently not allowed to be set as per
+			 * https://www.kernel.org/doc/Documentation/devicetree/bindings/leds/common.yaml
+			 * and has to set in userspace
+			 *
+			 * linux,default-trigger = "netdev";
+			 */
+			pinctrl-names = "default";
+			pinctrl-0 = <&spd_led>;
+		};
+	};
+
+	mcu3v3: mcu3v3-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "MCU3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc_io>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vcc_ddr: vcc-ddr-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC_DDR";
+		regulator-min-microvolt = <1500000>;
+		regulator-max-microvolt = <1500000>;
+		vin-supply = <&vcc_sys>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vcc_io: vcc-io-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC_IO";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc_sys>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vcc_lan: vcc-lan-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC_LAN";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc_io>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vcc_sd: vcc-sd-regulator {
+		compatible = "regulator-fixed";
+		gpio = <&gpio1 RK_PB6 GPIO_ACTIVE_LOW>;
+		startup-delay-us = <500>;
+		regulator-name = "VCC_SD";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc_io>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&sdmmc_pwren>;
+	};
+
+	vcc_sys: vcc-sys-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC_SYS";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&dc_5v>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vcc33_hdmi: vcc33-hdmi-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC33_HDMI";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcca_33>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vcca_33: vcca-33-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "VCCA_33";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc_sys>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vdd_11: vdd-11-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_11";
+		regulator-min-microvolt = <1100000>;
+		regulator-max-microvolt = <1100000>;
+		vin-supply = <&vcc_sys>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vdd11_hdmi: vdd11-hdmi-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD11_HDMI";
+		regulator-min-microvolt = <1100000>;
+		regulator-max-microvolt = <1100000>;
+		vin-supply = <&vdd_11>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vdd_arm: vdd-arm-regulator {
+		compatible = "pwm-regulator";
+		regulator-name = "VDD_ARM";
+		pwms = <&pwm1 0 25000 1>;
+		pwm-supply = <&vcc_sys>;
+		regulator-min-microvolt = <900000>;
+		regulator-max-microvolt = <1400000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	/*
+	 * As per schematics vdd_log is minimum 900 mV, maximum 1400 mV.
+	 * Since there are HW blocks in PD_LOGIC which are all driven by
+	 * this supply, which either do not have a driver at all or the
+	 * driver does not have regulator support, but are required for
+	 * the board to run we have to make sure here, that the voltage
+	 * never drops below 1050 mV.
+	 */
+	vdd_log: vdd-log-regulator {
+		compatible = "pwm-regulator";
+		regulator-name = "VDD_LOG";
+		pwms = <&pwm2 0 25000 1>;
+		pwm-dutycycle-range = <30 100>;
+		pwm-supply = <&vcc_sys>;
+		regulator-min-microvolt = <1050000>;
+		regulator-max-microvolt = <1400000>;
+		regulator-ramp-delay = <4000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	memory@60000000 {
+		device_type = "memory";
+		reg = <0x60000000 0x40000000>;
+	};
+
+};
+
+&cpu0 {
+	cpu-supply = <&vdd_arm>;
+};
+
+&emmc {
+	bus-width = <8>;
+	vmmc-supply = <&vcc_io>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&emmc_clk &emmc_cmd &emmc_bus8>;
+	cap-mmc-highspeed;
+	no-sd;
+	no-sdio;
+	status = "okay";
+};
+
+&gmac {
+	clock_in_out = "output";
+	phy-supply = <&vcc_lan>;
+	phy-mode = "rmii";
+	phy-handle = <&phy0>;
+	assigned-clocks = <&cru SCLK_MAC_SRC>;
+	assigned-clock-rates= <50000000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&rmii_pins>;
+	status = "okay";
+};
+
+/*
+ * Add labels for each pin which is exposed at the 40-pin header
+ */
+&gpio0 {
+	gpio-line-names = /* GPIO0 A0-A7 */
+			  "", "", "HEADER_5", "HEADER_3",
+			  "", "", "", "",
+			  /* GPIO0 B0-B7 */
+			  "HEADER_22", "HEADER_23", "", "HEADER_19",
+			  "HEADER_26", "HEADER_21", "HEADER_24", "",
+			  /* GPIO0 C0-C7 */
+			  "", "HEADER_18", "", "",
+			  "", "", "", "",
+			  /* GPIO0 D0-D7 */
+			  "HEADER_36", "", "", "",
+			  "", "", "HEADER_13", "";
+};
+
+&gpio1 {
+	gpio-line-names = /* GPIO1 A0-A7 */
+			  "HEADER_7", "HEADER_35", "HEADER_33", "HEADER_37",
+			  "HEADER_40", "HEADER_38", "", "",
+			  /* GPIO1 B0-B7 */
+			  "HEADER_11", "", "", "HEADER_29",
+			  "HEADER_31", "", "", "",
+			  /* GPIO1 C0-C7 */
+			  "", "", "", "",
+			  "", "", "", "",
+			  /* GPIO1 D0-D7 */
+			  "", "", "", "",
+			  "", "", "", "";
+};
+
+&gpio2 {
+	gpio-line-names = /* GPIO2 A0-A7 */
+			  "", "", "", "",
+			  "", "", "", "",
+			  /* GPIO2 B0-B7 */
+			  "", "", "", "",
+			  "", "", "", "",
+			  /* GPIO2 C0-C7 */
+			  "", "", "", "",
+			  "HEADER_27", "", "", "",
+			  /* GPIO2 D0-D7 */
+			  "", "", "HEADER_8", "HEADER_10",
+			  "", "", "", "";
+};
+
+&gpio3 {
+	gpio-line-names = /* GPIO3 A0-A7 */
+			  "", "", "", "",
+			  "", "", "", "",
+			  /* GPIO3 B0-B7 */
+			  "", "", "", "",
+			  "", "", "", "",
+			  /* GPIO3 C0-C7 */
+			  "", "HEADER_32", "", "",
+			  "", "", "", "HEADER_12",
+			  /* GPIO3 D0-D7 */
+			  "", "", "", "HEADER_15",
+			  "", "", "", "";
+};
+
+&gpu {
+	mali-supply = <&vdd_log>;
+	status = "okay";
+};
+
+&mdio {
+	phy0: ethernet-phy@1 {
+		/* DP83848C interrupt is not connected */
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <1>;
+		max-speed = <100>;
+		reset-assert-us = <15000>;
+		reset-deassert-us = <80000>;
+		reset-gpios = <&gpio2 RK_PD0 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&dp83848c_rst>;
+	};
+};
+
+&pinctrl {
+	dp83848c {
+		dp83848c_rst: dp83848c-rst {
+			rockchip,pins = <2 RK_PD0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	ir-receiver {
+		ir_int: ir-int {
+			rockchip,pins = <3 RK_PD2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	leds {
+		power_led: power-led {
+			rockchip,pins = <0 RK_PD2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		spd_led: spd-led {
+			rockchip,pins = <3 RK_PB3 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	usb2 {
+		host_drv: host-drv {
+			rockchip,pins = <3 RK_PC4 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+};
+
+&pwm1 {
+	status = "okay";
+};
+
+&pwm2 {
+	status = "okay";
+};
+
+&saradc {
+	vref-supply = <&vcc_io>;
+	status = "okay";
+};
+
+&sdmmc {
+	bus-width = <4>;
+	vmmc-supply = <&vcc_sd>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdmmc_bus4 &sdmmc_clk &sdmmc_cmd &sdmmc_det>;
+	cap-sd-highspeed;
+	no-mmc;
+	no-sdio;
+	status = "okay";
+};
+
+&uart1 {
+	status = "okay";
+};
+
+&usb_host_ehci {
+	status = "okay";
+};
+
+&usb_otg {
+	vusb_a-supply = <&vcc_io>;
+	vusb_d-supply = <&vdd_11>;
+	status = "okay";
+};
+
+&usb2phy {
+	status = "okay";
+};
+
+&usb2phy_host {
+	status = "okay";
+};
+
+&usb2phy_otg {
+	status = "okay";
+};
-- 
2.42.0

