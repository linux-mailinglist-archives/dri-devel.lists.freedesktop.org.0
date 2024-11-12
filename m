Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02DA29C5175
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2024 10:06:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2582310E316;
	Tue, 12 Nov 2024 09:06:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kemnade.info header.i=@kemnade.info header.b="wH1B2pAh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42CCD10E599
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2024 09:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=4EU3yrln5IrpgdtZUNkkJwM3XcCpFqyVpHoF7dMRo8s=; b=wH1B2pAhD+w05pWFA7PP282ydg
 XB1uZ/0+L9jqsxOpAuvFYSRbOO/tXZ3p8ykWrtR4OnHl2FhY1KiccGMEIS4DaZ/w6j43l32gsUgrN
 djH63iaQrIZp7daT+/GcZyRgjlNED3zyG4Wu5AY0KceU4BmlCWOsDRx7W4JtK+tyZIlg8v6FglZvN
 RwxeQPBxy6i78VSuOwG3fHuDB5psIa8Iac6ehWIjZZo7U69YvPc98mfU2lj/lh5yTj+jpQWUE5ho6
 rTvkMoA5Afpn8di52I5+RATVviFHnUt0fVZtIGkmY7GS49Oh0WkPuYCJYuxGEioTBDJmhy1swYEQC
 tpb6Thlg==;
Date: Tue, 12 Nov 2024 10:06:16 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Mithil Bavishi <bavishimithil@gmail.com>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman
 <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, Tony Lindgren
 <tony@atomide.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Thierry Reding
 <thierry.reding@gmail.com>, linux-omap@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3 06/10] ARM: dts: ti: omap: espresso-common: Add
 common device tree for Samsung Galaxy Tab 2 series
Message-ID: <20241112100616.5349ad37@akair>
In-Reply-To: <20241108200440.7562-7-bavishimithil@gmail.com>
References: <20241108200440.7562-1-bavishimithil@gmail.com>
 <20241108200440.7562-7-bavishimithil@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

Am Fri,  8 Nov 2024 20:04:35 +0000
schrieb Mithil Bavishi <bavishimithil@gmail.com>:

> Create common device tree for Samsung Espresso series devices
> 
> Let's create a common tree for all the variants first. Later we can
> device specific trees based on their screen sizes.
> 
> Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
> ---
>  .../omap/omap4-samsung-espresso-common.dtsi   | 680 ++++++++++++++++++
>  1 file changed, 680 insertions(+)
>  create mode 100644 arch/arm/boot/dts/ti/omap/omap4-samsung-espresso-common.dtsi
> 
> diff --git a/arch/arm/boot/dts/ti/omap/omap4-samsung-espresso-common.dtsi b/arch/arm/boot/dts/ti/omap/omap4-samsung-espresso-common.dtsi
> new file mode 100644
> index 000000000..62ff3f36c
> --- /dev/null
> +++ b/arch/arm/boot/dts/ti/omap/omap4-samsung-espresso-common.dtsi
> @@ -0,0 +1,680 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/dts-v1/;
> +#include "dt-bindings/gpio/gpio.h"
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/input/input.h>
> +#include "omap443x.dtsi"
> +
> +/ {
> +	memory@80000000 {
> +		device_type = "memory";
> +		reg = <0x80000000 0x40000000>; /* 1 GB */
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		ramoops_region@A0000000 {

s/_/-/ in node names please.
> +			no-map;
> +			reg = <0xA0000000 0x200000>;

If used for ramoops, then there should be a compatible = "ramoops"
see Documentation/devicetree/bindings/reserved-memory/ramoops.yaml
> +		};
> +
> +		continuous_splash: framebuffer@bef00000{
> +			reg = <0xbef00000 (1024 * 600 * 4)>;
> +			no-map;
> +		};
> +	};
> +
> +	chosen { 
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;

hmm, no bus here, so no need for address/size-cells, rather specify
stdout-path, etc.

> +	};
> +
> +	i2c-gpio-5 {
> +		compatible = "i2c-gpio";
> +		sda-gpios = <&gpio4 2 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +		scl-gpios = <&gpio4 3 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +		i2c-gpio,delay-us = <10>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
hmm, no pinmux here? 
> +	};
> +
> +	i2c-gpio-6 {
> +		compatible = "i2c-gpio";
> +		sda-gpios = <&gpio3 2 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +		scl-gpios = <&gpio3 1 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +		i2c-gpio,delay-us = <10>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;

same here
> +	};
> +
> +	i2c-gpio-7 {
> +		compatible = "i2c-gpio";
> +		sda-gpios = <&gpio2 30 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +		scl-gpios = <&gpio2 29 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +		i2c-gpio,delay-us = <3>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
same here

> +		fuel-gauge@36 {
> +			compatible = "maxim,max17042";
> +			reg = <0x36>;
> +			pinctrl-0 = <&fuel_alert_irq>;
> +			pinctrl-names = "default";
> +			interrupt-parent = <&gpio2>;
> +			interrupts = <12 IRQ_TYPE_LEVEL_LOW>;
> +			maxim,rsns-microohm = <10000>;
> +			maxim,over-heat-temp = <500>;
> +			maxim,dead-volt = <2500>;
> +			maxim,over-volt = <4300>;
> +		};
> +	};
> +
> +	reg_espresso_wlan: regulator-espresso-wlan {
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&wlanen_gpio>;
> +		compatible = "regulator-fixed";
> +		regulator-name = "espresso_wlan";
> +		regulator-max-microvolt = <2000000>;
> +		regulator-min-microvolt = <2000000>;
> +		gpio = <&gpio4 8 GPIO_ACTIVE_HIGH>; /* GPIO_104 */
> +		startup-delay-us = <70000>;
> +		regulator-always-on;
> +		enable-active-high;
> +	};
> +
> +	wlan_pwrseq: wlan-pwrseq {
> +		compatible = "mmc-pwrseq-simple";
> +		clocks = <&twl 0>;
> +		clock-names = "ext_clock";
> +	};
> +
> +	reg_espresso_internal: regulator-espresso-internal {
> +		compatible = "regulator-fixed";
> +		regulator-name = "eMMC_LDO";
> +		regulator-max-microvolt = <1800000>;
> +		regulator-min-microvolt = <1800000>;
> +		gpios = <&gpio2 21 GPIO_ACTIVE_HIGH>; /* GPIO_63 */
> +		startup-delay-us = <100000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +		enable-active-high;
> +	};
> +
> +	reg_espresso_external: regulator-espresso-external {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vmmc1";
> +		regulator-max-microvolt = <2800000>;
> +		regulator-min-microvolt = <2800000>;
> +		gpios = <&gpio2 2 GPIO_ACTIVE_HIGH>; /* GPIO_34 */
> +		regulator-always-on;

hmm, we cannot turn sd card power off?

> +		enable-active-high;
> +	};
> +
> +	reg_touch_ldo_en: regulator-touch-ldo-en  {
> +		compatible = "regulator-fixed";
> +		regulator-name = "touch_ldo_en";
> +		regulator-max-microvolt = <2800000>;
> +		regulator-min-microvolt = <2800000>;
> +		gpios = <&gpio2 22 GPIO_ACTIVE_HIGH>; /* GPIO_54 */
> +		regulator-always-on;
> +		enable-active-high;
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&gpio_keys>;
> +
> +		power {

button or key-power

> +			label = "power";
> +
> +			gpios = <&gpio1 3 GPIO_ACTIVE_HIGH>; /* GPIO_wk3 */
> +			linux,code = <KEY_POWER>;
> +			wakeup-source;
> +		};
> +
> +		button-volup {
> +			linux,code = <KEY_VOLUMEUP>;
> +			label = "volume_up"; /* GPIO_wk30 */
> +			gpios = <&gpio1 30 GPIO_ACTIVE_LOW>;
> +		};
> +
> +		button-voldown {
> +			linux,code = <KEY_VOLUMEDOWN>;
> +			label = "volume_down"; /* GPIO_wk8 */
> +			gpios = <&gpio1 8 GPIO_ACTIVE_LOW>;
> +		};
> +	};
> +
> +	reg_lcd: regulator-lcd  {
> +		compatible = "regulator-fixed";
> +		regulator-name = "lcd_en";
> +		gpios = <&gpio5 7 GPIO_ACTIVE_HIGH>; /* GPIO_135 */
> +		regulator-max-microvolt = <3300000>;
> +		regulator-min-microvolt = <3300000>;
> +		enable-active-high;
> +		regulator-boot-on;
> +	};
> +
> +	pwm10: pwm-10 {
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pwm10_default>;
> +		compatible = "ti,omap-dmtimer-pwm";
> +		#pwm-cells = <3>;
> +		ti,timers = <&timer10>;
> +		ti,clock-source = <0x00>;
> +	};
> +
> +	lvds-encoder {
> +		compatible = "doestek,dtc34lm85am", "lvds-encoder";
> +		powerdown-gpios = <&gpio5 8 GPIO_ACTIVE_LOW>; /* GPIO_136 */
> +		power-supply = <&reg_lcd>;
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				bridge_in: endpoint {
> +					remote-endpoint = <&dpi_out>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +				bridge_out: endpoint {
> +					remote-endpoint = <&panel_in>;
> +				};
> +			};
> +		};
> +	};
> +
> +	vibrator {
> +		compatible = "gpio-vibrator";
> +		enable-gpios = <&gpio2 6 GPIO_ACTIVE_HIGH>; /* GPIO_38 */
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&vibrator_default>;
> +	};
> +
> +	gp2a_shunt: current-sense-shunt {
> +		compatible = "current-sense-shunt";
> +		io-channels = <&gpadc 4>;
> +		shunt-resistor-micro-ohms = <24000000>; /* 24 ohms */
> +		#io-channel-cells = <0>;
> +	};
> +
> +	led-ir {
> +		compatible = "gpio-ir-tx";
> +		gpios = <&gpio2 27 GPIO_ACTIVE_HIGH>; /* GPIO_59 */
pinmux?

> +	};
> +};
> +
> +&omap4_pmx_wkup {

order node names alphabetically

> +	twl6030_wkup_pins: pinmux-twl6030-wkup-pins {
> +		pinctrl-single,pins = <
> +			OMAP4_IOPAD(0x54, PIN_OUTPUT | MUX_MODE3)
> +			/* fref_clk0_out.sys_drm_msecure */
> +		>;
> +	};
> +
This can come from twl6030_omap4.dtsi

> +	gpio_keys: gpio-keys-pins {
> +		pinctrl-single,pins = <
> +			OMAP4_IOPAD(0x046, WAKEUP_EN | PIN_INPUT | MUX_MODE3)
> +			/* sim_cd.gpio_wk3 - EXT_WAKEUP */
> +			OMAP4_IOPAD(0x056, WAKEUP_EN | PIN_INPUT | MUX_MODE3)
> +			/* fref_clk3_req.gpio_wk30 - VOL_UP */
> +			OMAP4_IOPAD(0x05C, WAKEUP_EN | PIN_INPUT | MUX_MODE3)
> +			/* fref_clk4_out.gpio_wk8 - VOL_DN */
> +		>;
> +	};
> +
> +	prox_irq: prox-irq-pins {
> +		pinctrl-single,pins = <
> +			OMAP4_IOPAD(0x042, WAKEUP_EN | PIN_INPUT_PULLUP | MUX_MODE3)
> +			/* sim_clk.gpio_wk1 - PS_VOUT */
> +		>;
> +	};
> +};
> +
> +&omap4_pmx_core {

order node names alphabetically

> +	pwm10_default: pinmux-pwm10-pins {
> +		pinctrl-single,pins = <
> +			OMAP4_IOPAD(0X0D6, PIN_OUTPUT | PIN_OFF_OUTPUT_LOW | MUX_MODE1)
> +			/* usbb1_ulpitll_dat6.dmtimer10_pwm_evt - LED_BACKLIGHT_PWM */
> +		>;
> +	};
> +
> +	backlight_pins: pinmux-backlight-pins {
> +		pinctrl-single,pins = <
> +			OMAP4_IOPAD(0X0D8, PIN_OUTPUT | PIN_OFF_OUTPUT_LOW | MUX_MODE3)
> +			/* usbb1_ulpitll_dat7.gpio_95 - LED_BACKLIGHT_RESET */
> +		>;
> +	};
> +
> +	lvds_pins: pinmux-lvds-pins {
> +		pinctrl-single,pins = <
> +			OMAP4_IOPAD(0X136, PIN_OUTPUT | MUX_MODE3)
> +			/* mcspi1_simo.gpio_136 - LVDS_nSHDN */
> +		>;
> +	};
> +
> +	i2c1_pins: pinmux-i2c1-pins {
> +		pinctrl-single,pins = <
> +			OMAP4_IOPAD(0x122, PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c1_scl */
> +			OMAP4_IOPAD(0x124, PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c1_sda */
> +		>;
> +	};
> +
> +	i2c2_pins: pinmux-i2c2-pins {
> +		pinctrl-single,pins = <
> +			OMAP4_IOPAD(0x126, PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c2_scl */
> +			OMAP4_IOPAD(0x128, PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c2_sda */
> +		>;
> +	};
> +
> +	i2c3_pins: pinmux-i2c3-pins {
> +		pinctrl-single,pins = <
> +			OMAP4_IOPAD(0x12a, PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c3_scl */
> +			OMAP4_IOPAD(0x12c, PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c3_sda */
> +		>;
> +	};
> +
> +	i2c4_pins: pinmux-i2c4-pins {
> +		pinctrl-single,pins = <
> +			OMAP4_IOPAD(0x12e, PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c4_scl */
> +			OMAP4_IOPAD(0x130, PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c4_sda */
> +		>;
> +	};
> +
> +	mmc2_pins: pinmux-mmc2-pins {
> +		pinctrl-single,pins = <
> +			OMAP4_IOPAD(0x040, PIN_INPUT_PULLUP | MUX_MODE1)	/* sdmmc2_dat0 */
> +			OMAP4_IOPAD(0x042, PIN_INPUT_PULLUP | MUX_MODE1)	/* sdmmc2_dat1 */
> +			OMAP4_IOPAD(0x044, PIN_INPUT_PULLUP | MUX_MODE1)	/* sdmmc2_dat2 */
> +			OMAP4_IOPAD(0x046, PIN_INPUT_PULLUP | MUX_MODE1)	/* sdmmc2_dat3 */
> +			OMAP4_IOPAD(0x048, PIN_INPUT_PULLUP | MUX_MODE1)	/* sdmmc2_dat4 */
> +			OMAP4_IOPAD(0x04a, PIN_INPUT_PULLUP | MUX_MODE1)	/* sdmmc2_dat5 */
> +			OMAP4_IOPAD(0x04c, PIN_INPUT_PULLUP | MUX_MODE1)	/* sdmmc2_dat6 */
> +			OMAP4_IOPAD(0x04e, PIN_INPUT_PULLUP | MUX_MODE1)	/* sdmmc2_dat7 */
> +			OMAP4_IOPAD(0x082, PIN_INPUT_PULLUP | MUX_MODE1)	/* sdmmc2_clk */
> +			OMAP4_IOPAD(0x084, PIN_INPUT_PULLUP | MUX_MODE1)	/* sdmmc2_cmd */
> +		>;
> +	};
> +
> +	mmc1_pins: pinmux-mmc1-pins {
> +		pinctrl-single,pins = <
> +			OMAP4_IOPAD(0x0e2, PIN_INPUT_PULLDOWN | MUX_MODE0)	/* sdmmc1_clk */
> +			OMAP4_IOPAD(0x0e4, PIN_INPUT_PULLUP | MUX_MODE0)	/* sdmcc1_cmd */
> +			OMAP4_IOPAD(0x0e6, PIN_INPUT_PULLUP | MUX_MODE0)	/* sdmcc1_dat0 */
> +			OMAP4_IOPAD(0x0e8, PIN_INPUT_PULLUP | MUX_MODE0)	/* sdmmc1_dat1 */
> +			OMAP4_IOPAD(0x0ea, PIN_INPUT_PULLUP | MUX_MODE0)	/* sdmmc1_dat2 */
> +			OMAP4_IOPAD(0x0ec, PIN_INPUT_PULLUP | MUX_MODE0)	/* sdmmc1_dat3 */
> +		>;
> +	};
> +
> +	mmc5_pins: pinmux-mmc5-pins {
> +		pinctrl-single,pins = <
> +			OMAP4_IOPAD(0x148, PIN_INPUT_PULLDOWN | MUX_MODE0)
> +			/* sdmmc5_clk.sdmmc5_clk */
> +			OMAP4_IOPAD(0x14a, PIN_INPUT_PULLUP | MUX_MODE0)
> +			/* sdmmc5_cmd.sdmmc5_cmd */
> +			OMAP4_IOPAD(0x14c, PIN_INPUT_PULLUP | MUX_MODE0)
> +			/* sdmmc5_dat0.sdmmc5_dat0 */
> +			OMAP4_IOPAD(0x14e, PIN_INPUT_PULLUP | MUX_MODE0)
> +			/* sdmmc5_dat1.sdmmc5_dat1 */
> +			OMAP4_IOPAD(0x150, PIN_INPUT_PULLUP | MUX_MODE0)
> +			/* sdmmc5_dat2.sdmmc5_dat2 */
> +			OMAP4_IOPAD(0x152, PIN_INPUT_PULLUP | MUX_MODE0)
> +			/* sdmmc5_dat3.sdmmc5_dat3 */
> +		>;
> +	};
> +
> +	dss_dpi_pins: pinmux-dss-dpi-pins {
> +		pinctrl-single,pins = <
> +			OMAP4_IOPAD(0x162, PIN_OFF_OUTPUT_LOW | MUX_MODE5)	/* dispc2_data23 */
> +			OMAP4_IOPAD(0x164, PIN_OFF_OUTPUT_LOW | MUX_MODE5)	/* dispc2_data22 */
> +			OMAP4_IOPAD(0x166, PIN_OFF_OUTPUT_LOW | MUX_MODE5)	/* dispc2_data21 */
> +			OMAP4_IOPAD(0x168, PIN_OFF_OUTPUT_LOW | MUX_MODE5)	/* dispc2_data20 */
> +			OMAP4_IOPAD(0x16a, PIN_OFF_OUTPUT_LOW | MUX_MODE5)	/* dispc2_data19 */
> +			OMAP4_IOPAD(0x16c, PIN_OFF_OUTPUT_LOW | MUX_MODE5)	/* dispc2_data18 */
> +			OMAP4_IOPAD(0x16e, PIN_OFF_OUTPUT_LOW | MUX_MODE5)	/* dispc2_data15 */
> +			OMAP4_IOPAD(0x170, PIN_OFF_OUTPUT_LOW | MUX_MODE5)	/* dispc2_data14 */
> +			OMAP4_IOPAD(0x172, PIN_OFF_OUTPUT_LOW | MUX_MODE5)	/* dispc2_data13 */
> +			OMAP4_IOPAD(0x174, PIN_OFF_OUTPUT_LOW | MUX_MODE5)	/* dispc2_data12 */
> +			OMAP4_IOPAD(0x176, PIN_OFF_OUTPUT_LOW | MUX_MODE5)	/* dispc2_data11 */
> +
> +			OMAP4_IOPAD(0x1b4, PIN_OFF_OUTPUT_LOW | MUX_MODE5)	/* dispc2_data10 */
> +			OMAP4_IOPAD(0x1b6, PIN_OFF_OUTPUT_LOW | MUX_MODE5)	/* dispc2_data9 */
> +			OMAP4_IOPAD(0x1b8, PIN_OFF_OUTPUT_LOW | MUX_MODE5)	/* dispc2_data16 */
> +			OMAP4_IOPAD(0x1ba, PIN_OFF_OUTPUT_LOW | MUX_MODE5)	/* dispc2_data17 */
> +			OMAP4_IOPAD(0x1bc, PIN_OFF_OUTPUT_LOW | MUX_MODE5)	/* dispc2_hsync */
> +			OMAP4_IOPAD(0x1be, PIN_OFF_OUTPUT_LOW | MUX_MODE5)	/* dispc2_pclk */
> +			OMAP4_IOPAD(0x1c0, PIN_OFF_OUTPUT_LOW | MUX_MODE5)	/* dispc2_vsync */
> +			OMAP4_IOPAD(0x1c2, PIN_OFF_OUTPUT_LOW | MUX_MODE5)	/* dispc2_de */
> +			OMAP4_IOPAD(0x1c4, PIN_OFF_OUTPUT_LOW | MUX_MODE5)	/* dispc2_data8 */
> +			OMAP4_IOPAD(0x1c6, PIN_OFF_OUTPUT_LOW | MUX_MODE5)	/* dispc2_data7 */
> +			OMAP4_IOPAD(0x1c8, PIN_OFF_OUTPUT_LOW | MUX_MODE5)	/* dispc2_data6 */
> +			OMAP4_IOPAD(0x1ca, PIN_OFF_OUTPUT_LOW | MUX_MODE5)	/* dispc2_data5 */
> +			OMAP4_IOPAD(0x1cc, PIN_OFF_OUTPUT_LOW | MUX_MODE5)	/* dispc2_data4 */
> +			OMAP4_IOPAD(0x1ce, PIN_OFF_OUTPUT_LOW | MUX_MODE5)	/* dispc2_data3 */
> +
> +			OMAP4_IOPAD(0x1d0, PIN_OFF_OUTPUT_LOW | MUX_MODE5)	/* dispc2_data2 */
> +			OMAP4_IOPAD(0x1d2, PIN_OFF_OUTPUT_LOW | MUX_MODE5)	/* dispc2_data1 */
> +			OMAP4_IOPAD(0x1d4, PIN_OFF_OUTPUT_LOW | MUX_MODE5)	/* dispc2_data0 */
> +		>;
> +	};
> +
> +	wlanen_gpio: pinmux-wlanen-pins {
> +		pinctrl-single,pins = <
> +			OMAP4_IOPAD(0x096, PIN_OUTPUT | MUX_MODE3)	/* gpmc_ncs7.gpio_104 */
> +		>;
> +	};
> +
> +	twl6030_pins: pinmux-twl6030-pins {
> +		pinctrl-single,pins = <
> +			OMAP4_IOPAD(0x19e, WAKEUP_EN | PIN_INPUT_PULLUP | MUX_MODE0)
> +			/* sys_nirq1.sys_nirq1 */
> +		>;
> +	};

you can simply include twl6030_omap4.dtsi describing recommended
connection between omap4 SoCs and twl603X pmics.

> +
> +	fuel_alert_irq: pinmux-fuel-alert-pins {
> +		pinctrl-single,pins = <
> +			OMAP4_IOPAD(0x068, WAKEUP_EN | PIN_INPUT_PULLUP | MUX_MODE3)
> +			/* gpmc_a20.gpio_44 */
> +		>;
> +	};
> +
> +	uart3_pins: pinmux-uart3-pins {
> +		pinctrl-single,pins = <
> +			OMAP4_IOPAD(0x144, PIN_INPUT | MUX_MODE0)	/* uart3_rx_irrx */
> +			OMAP4_IOPAD(0x146, PIN_OUTPUT | MUX_MODE0)	/* uart3_tx_irtx */
> +		>;
> +	};
> +
> +	uart2_pins: pinmux-uart2-pins {
> +		pinctrl-single,pins = <
> +			OMAP4_IOPAD(0x118, PIN_INPUT_PULLUP | MUX_MODE0)
> +			/* uart2_cts.uart2_cts */
> +			OMAP4_IOPAD(0x11a, PIN_INPUT_PULLUP | MUX_MODE0)
> +			/* uart2_rts.uart2_rts */
> +			OMAP4_IOPAD(0x11c, PIN_INPUT_PULLUP | MUX_MODE0)
> +			/* uart2_rx.uart2_rx */
> +			OMAP4_IOPAD(0x11e, PIN_INPUT_PULLUP | MUX_MODE0)
> +			/* uart2_tx.uart2_tx */
> +		>;
> +	};
> +
> +	wlan_host_wake: pinmux-wlan-host-wake-pins {
> +		pinctrl-single,pins = <
> +			OMAP4_IOPAD(0x0bc, WAKEUP_EN | PIN_INPUT | MUX_MODE3)
> +			/* cam_shutter.gpio_81 - WLAN_HOST_WAKE */

It might be an idea to use a dedicated wakeup irq instead of
explicitely specifying WAKEUP_EN like you did for the uart.
That counts for other occurances of WAKEUP_EN as well.
> +		>;
> +	};
> +
> +	bluetooth_pins: pinmux-bluetooth-pins {
> +		pinctrl-single,pins = <
> +			OMAP4_IOPAD(0x094, PIN_OUTPUT | MUX_MODE3)
> +			/* gpmc_ncs6.gpio_103 - BT_EN */
> +			OMAP4_IOPAD(0x0be, PIN_OUTPUT | MUX_MODE3)
> +			/* cam_strobe.gpio_82 - BT_nRST */
> +			OMAP4_IOPAD(0x0c0, WAKEUP_EN | PIN_INPUT | MUX_MODE3)
> +			/* cam_globalreset.gpio_83 - BT_HOST_WAKE */
> +			OMAP4_IOPAD(0x0d4, PIN_OUTPUT | MUX_MODE3)
> +			/* usbb1_ulpitll_dat5.gpio_93 - BT_WAKE */
> +		>;
> +	};
> +
> +	touch_pins: pinmux-touch-pins {
> +		pinctrl-single,pins = <
> +			OMAP4_IOPAD(0x06c, PIN_INPUT | MUX_MODE3)
> +			/* gpmc_a22.gpio_46 - TSP_INT */
> +		>;
> +	};
> +
> +	vibrator_default: pinmux-vibrator-pins {
> +		pinctrl-single,pins = <
> +			OMAP4_IOPAD(0x05c, PIN_INPUT_PULLDOWN | MUX_MODE3)
> +			/* gpmc_ad14.gpio_38 - MOTOR_EN */
> +		>;
> +	};
> +
> +	gp2a_irq: pinmux-gp2a-irq-pins {
> +		pinctrl-single,pins = <
> +			OMAP4_IOPAD(0x052, WAKEUP_EN | PIN_INPUT | MUX_MODE3)
> +			/* gpmc_ad9.gpio_33 - ALS_INT_18 */
> +		>;
> +	};
> +};
> +
> +&uart3 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&uart3_pins>;
> +
> +	interrupts-extended = <&wakeupgen GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH
> +			       &omap4_pmx_core OMAP4_UART3_RX>;
> +};
> +
> +&i2c1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c1_pins>;
> +
> +	clock-frequency = <400000>;
> +
> +	twl: twl@48 {

generic node names:
pmic@48
yes, there are a lot of bad examples in the tree people (including me!)
keep copying from, but lets not create new bad examples.

> +		reg = <0x48>;
> +		#clock-cells = <1>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <
> +			&twl6030_pins
> +			&twl6030_wkup_pins
> +		>;
> +
> +		/* SPI = 0, IRQ# = 7, 4 = active high level-sensitive */
> +		interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>; /* IRQ_SYS_1N cascaded to gic */
> +		interrupt-parent = <&gic>;
> +		system-power-controller;
> +	};
> +};
> +
> +#include "twl6032.dtsi"
> +
> +&ldo1 {
> +	regulator-min-microvolt = <2800000>;
> +	regulator-max-microvolt = <2800000>;
> +	regulator-always-on;
> +	regulator-state-mem {
> +		regulator-off-in-suspend;
> +	};
> +};
> +
> +&ldo3 {
> +	regulator-min-microvolt = <3300000>;
> +	regulator-max-microvolt = <3300000>;
> +	regulator-always-on;
> +	regulator-state-mem {
> +		regulator-off-in-suspend;
> +	};
> +};
> +
> +&ldo4 {
> +	regulator-min-microvolt = <2800000>;
> +	regulator-max-microvolt = <2800000>;
> +	regulator-always-on;
> +};
> +
> +&ldo5 {
> +	regulator-min-microvolt = <1800000>;
> +	regulator-max-microvolt = <1800000>;
> +	regulator-always-on;
> +};
> +
> +&ldo6 {
> +	regulator-min-microvolt = <1800000>;
> +	regulator-max-microvolt = <1800000>;
> +	regulator-always-on;
> +	regulator-state-mem {
> +		regulator-off-in-suspend;
> +	};
> +};
> +
> +&smps4 {
> +	regulator-min-microvolt = <1800000>;
> +	regulator-max-microvolt = <1800000>;
> +	regulator-always-on;
> +};
> +
> +&ldousb {
> +	regulator-min-microvolt = <3300000>;
> +	regulator-max-microvolt = <3300000>;
> +	regulator-always-on;
> +};
> +
> +&i2c2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c2_pins>;
> +};
> +
> +&i2c3 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c3_pins>;
> +};
> +
> +&i2c4 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c4_pins>;
> +
> +	accelerometer@18 {
> +		compatible = "bosch,bma254";
> +		reg = <0x18>;
> +		vdd-supply = <&ldo4>;
> +		vddio-supply = <&ldo5>;
> +		interrupt-parent = <&gpio4>;
> +		interrupts = <25 (IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_EDGE_RISING)>,
> +			<26 (IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_EDGE_RISING)>;

this looks odd, binding says IRQ_TYPE_EDGE_RISING. Why do you think you
need both? After something is rising, it is high, so both seem not to
make sense.

> +		mount-matrix =  "-1",  "0",  "0",
> +				"0",  "1",  "0",
> +				"0",  "0", "1";

hmm, checking twice, since I mixed up something earlier. This just
inverts x values, so we are mirroring across y-z plane, that does not
look like a rotation matrix, so it does not describe how it is mounted.
Eg. the n900 has two -1 in there, that is a turn by 180 degree.

Your mount-matrix would be achieved, by cutting the chip into ultra
thin slices, sorting them upside down and glueing that together. I
doubt somebody does that.

Regards,
Andreas
