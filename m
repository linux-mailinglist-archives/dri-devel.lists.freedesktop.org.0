Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7B7659A22
	for <lists+dri-devel@lfdr.de>; Fri, 30 Dec 2022 16:45:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 076E510E452;
	Fri, 30 Dec 2022 15:45:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 673DD10E452
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Dec 2022 15:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
 t=1672414666; bh=4K+H1Twpy1ukKx/TDvXBwwQinHSIB0GXM7v670fi4GI=;
 h=Date:From:To:Cc:Subject:X-My-GPG-KeyId:References:From;
 b=gKUWtCeVzQ5JAARUI2Vec6vpym+9hBAgyhSMn3DPrwTAO3bnYsDZ8ptNOy3M2oblR
 0V3CoeKx5u4+8+3rDwbd2wmk1/BDVnUcm7GPP4tg5r9HwO3zmOc101FmaUkHtDjAkd
 Zv6j7efal9lbFOGkSvjEZQ9VUgIsgUnGtZ+7qFtE=
Date: Fri, 30 Dec 2022 16:37:45 +0100
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v4 4/4] arm64: dts: rk3399-pinephone-pro: Add internal
 display support
Message-ID: <20221230153745.tfs6n4zy4xfwugbw@core>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>,
 Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org,
 Kamil =?utf-8?Q?Trzci=C5=84ski?= <ayufan@ayufan.eu>,
 Martijn Braam <martijn@brixit.nl>, Sam Ravnborg <sam@ravnborg.org>,
 Robert Mader <robert.mader@posteo.de>,
 Tom Fitzhenry <tom@tom-fitzhenry.me.uk>,
 Peter Robinson <pbrobinson@gmail.com>,
 Onuralp Sezer <thunderbirdtr@fedoraproject.org>,
 dri-devel@lists.freedesktop.org,
 Maya Matuszczyk <maccraft123mc@gmail.com>,
 Neal Gompa <ngompa13@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Caleb Connolly <kc@postmarketos.org>,
 Heiko Stuebner <heiko@sntech.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-rockchip@lists.infradead.org
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
References: <20221230113155.3430142-1-javierm@redhat.com>
 <20221230113155.3430142-5-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221230113155.3430142-5-javierm@redhat.com>
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
Cc: Jagan Teki <jagan@amarulasolutions.com>,
 Robert Mader <robert.mader@posteo.de>, devicetree@vger.kernel.org,
 Onuralp Sezer <thunderbirdtr@fedoraproject.org>,
 Neal Gompa <ngompa13@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tom Fitzhenry <tom@tom-fitzhenry.me.uk>,
 Martijn Braam <martijn@brixit.nl>, Caleb Connolly <kc@postmarketos.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Peter Robinson <pbrobinson@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kamil =?utf-8?Q?Trzci=C5=84ski?= <ayufan@ayufan.eu>,
 linux-rockchip@lists.infradead.org, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org,
 Maya Matuszczyk <maccraft123mc@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier,

On Fri, Dec 30, 2022 at 12:31:54PM +0100, Javier Martinez Canillas wrote:
> From: Ondrej Jirman <megi@xff.cz>
> 
> The phone's display is using Hannstar LCD panel, and Goodix based
> touchscreen. Support it.
> 
> Signed-off-by: Ondrej Jirman <megi@xff.cz>
> Co-developed-by: Martijn Braam <martijn@brixit.nl>
> Signed-off-by: Martijn Braam <martijn@brixit.nl>
> Co-developed-by: Kamil Trzciński <ayufan@ayufan.eu>
> Signed-off-by: Kamil Trzciński <ayufan@ayufan.eu>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> Tested-by: Tom Fitzhenry <tom@tom-fitzhenry.me.uk>
> ---
> 
> Changes in v4:
> - Add Tom Fitzhenry's Tested-by tag.
> - Keep the DTS nodes sorted alphabetically (Tom Fitzhenry).
> 
> Changes in v2:
> - Fix regulator node names (Maya Matuszczyk).
> - Drop non-existent "poweroff-in-suspend" property (Maya Matuszczyk).
> - Remove unnecessary comments in panel node (Maya Matuszczyk).
> 
>  .../dts/rockchip/rk3399-pinephone-pro.dts     | 123 ++++++++++++++++++
>  1 file changed, 123 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
> index 04403a76238b..0d48fbc5dbe4 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
> @@ -25,6 +25,12 @@ aliases {
>  		mmc2 = &sdhci;
>  	};
>  
> +	backlight: backlight {
> +		compatible = "pwm-backlight";
> +		pwms = <&pwm0 0 1000000 0>;
> +		pwm-delay-us = <10000>;
> +	};
> +
>  	chosen {
>  		stdout-path = "serial2:115200n8";
>  	};
> @@ -82,6 +88,32 @@ vcc1v8_codec: vcc1v8-codec-regulator {
>  		vin-supply = <&vcc3v3_sys>;
>  	};
>  
> +	/* MIPI DSI panel 1.8v supply */
> +	vcc1v8_lcd: vcc1v8-lcd-regulator {
> +		compatible = "regulator-fixed";
> +		enable-active-high;
> +		regulator-name = "vcc1v8_lcd";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		vin-supply = <&vcc3v3_sys>;
> +		gpio = <&gpio3 RK_PA5 GPIO_ACTIVE_HIGH>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&display_pwren1>;
> +	};
> +
> +	/* MIPI DSI panel 2.8v supply */
> +	vcc2v8_lcd: vcc2v8-lcd-regulator {
> +		compatible = "regulator-fixed";
> +		enable-active-high;
> +		regulator-name = "vcc2v8_lcd";
> +		regulator-min-microvolt = <2800000>;
> +		regulator-max-microvolt = <2800000>;
> +		vin-supply = <&vcc3v3_sys>;
> +		gpio = <&gpio3 RK_PA1 GPIO_ACTIVE_HIGH>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&display_pwren>;
> +	};
> +
>  	wifi_pwrseq: sdio-wifi-pwrseq {
>  		compatible = "mmc-pwrseq-simple";
>  		clocks = <&rk818 1>;
> @@ -132,6 +164,11 @@ &emmc_phy {
>  	status = "okay";
>  };
>  
> +&gpu {
> +	mali-supply = <&vdd_gpu>;
> +	status = "okay";
> +};
> +
>  &i2c0 {
>  	clock-frequency = <400000>;
>  	i2c-scl-rising-time-ns = <168>;
> @@ -214,6 +251,9 @@ vcc3v0_touch: LDO_REG2 {
>  				regulator-name = "vcc3v0_touch";
>  				regulator-min-microvolt = <3000000>;
>  				regulator-max-microvolt = <3000000>;
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};

You're instructing RK818 to shut down the regulator for touch controller during
suspend, but I think Goodix driver expects touch controller to be kept powered on
during suspend. Am I missing something?

https://elixir.bootlin.com/linux/latest/source/drivers/input/touchscreen/goodix.c#L1405

>  			};
>  
>  			vcca1v8_codec: LDO_REG3 {
> @@ -347,6 +387,25 @@ opp07 {
>  	};
>  };
>  
> +&i2c3 {
> +	i2c-scl-rising-time-ns = <450>;
> +	i2c-scl-falling-time-ns = <15>;
> +	status = "okay";
> +
> +	touchscreen@14 {
> +		compatible = "goodix,gt917s";

This is not the correct compatible. Pinephone Pro uses Goodix GT1158:

Goodix-TS 3-0014: ID 1158, version: 0100
Goodix-TS 3-0014: Direct firmware load for goodix_1158_cfg.bin failed with error -2


> +		reg = <0x14>;
> +		interrupt-parent = <&gpio3>;
> +		interrupts = <RK_PB5 IRQ_TYPE_EDGE_RISING>;
> +		irq-gpios = <&gpio3 RK_PB5 GPIO_ACTIVE_HIGH>;
> +		reset-gpios = <&gpio3 RK_PB4 GPIO_ACTIVE_HIGH>;
> +		AVDD28-supply = <&vcc3v0_touch>;
> +		VDDIO-supply = <&vcc3v0_touch>;
> +		touchscreen-size-x = <720>;
> +		touchscreen-size-y = <1440>;
> +	};
> +};
> +
>  &io_domains {
>  	bt656-supply = <&vcc1v8_dvp>;
>  	audio-supply = <&vcca1v8_codec>;
> @@ -355,6 +414,40 @@ &io_domains {
>  	status = "okay";
>  };
>  
> +&mipi_dsi {
> +	status = "okay";
> +	clock-master;
> +
> +	ports {
> +		mipi_out: port@1 {
> +			#address-cells = <0>;
> +			#size-cells = <0>;
> +			reg = <1>;
> +
> +			mipi_out_panel: endpoint {
> +				remote-endpoint = <&mipi_in_panel>;
> +			};
> +		};
> +	};
> +
> +	panel@0 {
> +		compatible = "hannstar,hsd060bhw4", "himax,hx8394";
> +		reg = <0>;
> +		backlight = <&backlight>;
> +		reset-gpios = <&gpio4 RK_PD1 GPIO_ACTIVE_LOW>;
> +		vcc-supply = <&vcc2v8_lcd>;
> +		iovcc-supply = <&vcc1v8_lcd>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&display_rst_l>;
> +
> +		port {
> +			mipi_in_panel: endpoint {
> +				remote-endpoint = <&mipi_out_panel>;
> +			};
> +		};
> +	};
> +};
> +
>  &pmu_io_domains {
>  	pmu1830-supply = <&vcc_1v8>;
>  	status = "okay";
> @@ -367,6 +460,20 @@ pwrbtn_pin: pwrbtn-pin {
>  		};
>  	};
>  
> +	dsi {
> +		display_rst_l: display-rst-l {
> +			rockchip,pins = <4 RK_PD1 RK_FUNC_GPIO &pcfg_pull_down>;
> +		};
> +
> +		display_pwren: display-pwren {
> +			rockchip,pins = <3 RK_PA1 RK_FUNC_GPIO &pcfg_pull_down>;
> +		};
> +
> +		display_pwren1: display-pwren1 {
> +			rockchip,pins = <3 RK_PA5 RK_FUNC_GPIO &pcfg_pull_down>;
> +		};
> +	};
> +
>  	pmic {
>  		pmic_int_l: pmic-int-l {
>  			rockchip,pins = <1 RK_PC5 RK_FUNC_GPIO &pcfg_pull_up>;
> @@ -408,6 +515,10 @@ bt_reset_pin: bt-reset-pin {
>  	};
>  };
>  
> +&pwm0 {
> +	status = "okay";
> +};
> +
>  &sdio0 {
>  	bus-width = <4>;
>  	cap-sd-highspeed;
> @@ -472,3 +583,15 @@ bluetooth {
>  &uart2 {
>  	status = "okay";
>  };
> +
> +&vopb {
> +	status = "okay";
> +	assigned-clocks = <&cru DCLK_VOP0_DIV>, <&cru DCLK_VOP0>,
> +			  <&cru ACLK_VOP0>, <&cru HCLK_VOP0>;
> +	assigned-clock-rates = <0>, <0>, <400000000>, <100000000>;
> +	assigned-clock-parents = <&cru PLL_CPLL>, <&cru DCLK_VOP0_FRAC>;
> +};

So here you're putting a fractional clock into path between CPLL -> VOP0_DIV
-> DCLK_VOP0_FRAC -> DCLK_VOP0.

Fractional clocks require 20x difference between input and output rates, and
CPLL is 800Mhz IIRC, while you require 74.25MHz DCLK, so this will not work
correctly.

Even if this somehow works by fractional clock being bypassed, I did not design
the panel mode to be used with CPLL's 800 MHz, but with GPLL frequecy of 594 MHz.

GPLL 594/74.25 = 8  (integral divider without the need for fractional clock)
CPLL 800/74.25 = ~10.77441077441077441077

If you really want to use fractional clock, you'd need to parent it to VPLL
and set VPLL really high, like close to 2GHz.

kind regards,
	o.

> +&vopb_mmu {
> +	status = "okay";
> +};
> -- 
> 2.38.1
> 
