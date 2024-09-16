Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 879FD979E2E
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2024 11:17:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CEF210E31A;
	Mon, 16 Sep 2024 09:17:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pbdrOnJZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EDCF10E31A
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2024 09:17:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id BB6E3A41B3A;
 Mon, 16 Sep 2024 09:17:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25C4EC4CEC4;
 Mon, 16 Sep 2024 09:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726478236;
 bh=Hf78NC2O19esKVAGkRW6er0cOjPx5E32KUQUQLtJM/0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pbdrOnJZrQPWZZ0hXGwLCKBjLzdhzCpUaCrN9zaRgsLA4SgW9Glr9NStq9C3LhS5G
 ChSDKXbeSA+2FB45JP+Wv/6EwA1sqp6u+5gzdxi8m1yDx5H9ACjCjX1x39cIidOyuF
 o+w5RJRx/ZlroJyeWEk/cjPZv3FFmL/8Zpp7vrBqC8WtnMETlYs2ynpIlXmbB6NHq1
 +fl01P5aYzoc9xajvW4+NQWXU8dZHIIKmunXI6ME5eTUrrTLvpBIivNcUtiyWFDmA8
 dEW8todI+dRvTLB6Q8tmUEi2bZmiM4LTrP3mlt68NlUDEMedt3skHomeN2F72Q68FQ
 rLtaN6Nmtjz2w==
Date: Mon, 16 Sep 2024 11:17:12 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dzmitry Sankouski <dsankouski@gmail.com>
Cc: Sebastian Reichel <sre@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Lee Jones <lee@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Simona Vetter <simona@ffwll.ch>, 
 cros-qcom-dts-watchers@chromium.org, Konrad Dybcio <konradybcio@kernel.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-input@vger.kernel.org,
 linux-leds@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v4 22/27] arm64: dts: qcom: starqltechn: add max77705 PMIC
Message-ID: <2zdatzzxd4jjev7uwdfacyrv4fmukqwbtabewfsxhgonxuhkjh@ty7v33g57q6h>
References: <20240913-starqltechn_integration_upstream-v4-0-2d2efd5c5877@gmail.com>
 <20240913-starqltechn_integration_upstream-v4-22-2d2efd5c5877@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240913-starqltechn_integration_upstream-v4-22-2d2efd5c5877@gmail.com>
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

On Fri, Sep 13, 2024 at 06:08:05PM +0300, Dzmitry Sankouski wrote:
> Add support for max77705 MFD device. Supported sub-devices:
>  charger, fuelgauge, haptic, led
> 
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> ---
>  .../boot/dts/qcom/sdm845-samsung-starqltechn.dts   | 103 +++++++++++++++++++++
>  1 file changed, 103 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
> index a3bd5231569d..865253d8f0c7 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
> @@ -18,6 +18,16 @@ / {
>  	model = "Samsung Galaxy S9 SM-G9600";
>  	compatible = "samsung,starqltechn", "qcom,sdm845";
>  
> +	battery: battery {
> +		compatible = "simple-battery";
> +		constant-charge-current-max-microamp = <2150000>;
> +		charge-full-design-microamp-hours = <3000000>;
> +
> +		over-voltage-threshold-microvolt = <4500000>;
> +		voltage-min-design-microvolt = <3400000>;
> +		voltage-max-design-microvolt = <4350000>;
> +	};
> +
>  	chosen {
>  		#address-cells = <2>;
>  		#size-cells = <2>;
> @@ -90,6 +100,27 @@ key-wink {
>  			debounce-interval = <15>;
>  		};
>  	};
> +
> +	vib_regulator: gpio-regulator {

Please use name for all fixed regulators which matches current format
recommendation: 'regulator-[0-9]v[0-9]'
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/regulator/fixed-regulator.yaml?h=v6.11-rc1#n46

> +		compatible = "regulator-fixed";
> +		regulator-name = "haptic";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		regulator-boot-on;
> +		enable-active-high;
> +		gpio = <&pm8998_gpios 18 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	vib_pwm: pwm {
> +		#pwm-cells = <2>;
> +		compatible = "clk-pwm";

compatible is always the first property. See DTS coding style.

> +		clocks = <&gcc GCC_GP1_CLK>;
> +		assigned-clock-parents = <&rpmhcc RPMH_CXO_CLK>;
> +		assigned-clocks = <&gcc GCC_GP1_CLK_SRC>;
> +		pinctrl-0 = <&motor_pwm_default_state>;
> +		pinctrl-1 = <&motor_pwm_suspend_state>;
> +		pinctrl-names = "default", "suspend";
> +	};
>  };
>  
>  
> @@ -385,10 +416,66 @@ &qupv3_id_1 {
>  	status = "okay";
>  };
>  
> +&gpi_dma1 {
> +	status = "okay";
> +};
> +
>  &uart9 {
>  	status = "okay";
>  };
>  
> +&i2c14 {
> +	status = "okay";
> +
> +	pmic@66 {
> +		compatible = "maxim,max77705";
> +		reg = <0x66>;
> +		interrupt-parent = <&pm8998_gpios>;
> +		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
> +		pinctrl-0 = <&chg_int_default>;
> +		pinctrl-names = "default";
> +
> +		leds {
> +			compatible = "maxim,max77705-led";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			led@1 {
> +				reg = <1>;
> +				label = "red:usr1";
> +			};
> +
> +			led@2 {
> +				reg = <2>;
> +				label = "green:usr2";
> +			};
> +
> +			led@3 {
> +				reg = <3>;
> +				label = "blue:usr3";
> +			};
> +		};
> +
> +		max77705_charger: charger {
> +			compatible = "maxim,max77705-charger";
> +			monitored-battery = <&battery>;
> +		};
> +
> +		fuel_gauge {

No underscores in node names. See DTS coding style.

Best regards,
Krzysztof

