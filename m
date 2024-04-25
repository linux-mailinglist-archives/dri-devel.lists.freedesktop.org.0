Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C45F88B1B02
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 08:28:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2144810E871;
	Thu, 25 Apr 2024 06:28:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Pgf1X8se";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0921D10E871
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 06:28:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C0E1460B47;
 Thu, 25 Apr 2024 06:28:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6419DC2BD10;
 Thu, 25 Apr 2024 06:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714026491;
 bh=pMGdU3FRhPiA5xxqEp2nuiQ5CIEIiPPzHAy4OyHVNWU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Pgf1X8seF8O5V9Xtfub1hocqhBPJJyoT/jz6F+IF7cCSxrHQvohrsJaRqIeIzdA00
 Ru4agpKHEuzGolT2vJJy4HeXPoW1j+Fnk3vZ9Xl7IB3wNulHiI6RuTzB0XHteT2EDt
 aq1E0KUaz0+TuLbQobXhw067tVv+HRLGlmJgVgZ1m8IlC5Z+KUyunNuFhDRAZY+P5R
 4OHwKGDc0CP/rjbeujR9jt7X3uP2nzBoh7HS0+6+wFDASrCG3NPMkCFnNIwNTFfI0L
 /ceJMSutRZ8DUQv9RdFr+qaIHCHF2SK59haKvNQGSa+PwS498rI7ltAjILs80OscEG
 RXwnKdZp92S4Q==
Message-ID: <0d1c6ed9-0c20-4b0e-876d-4b0adf5aa75d@kernel.org>
Date: Thu, 25 Apr 2024 08:28:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/10] arm64: dts: qcom: Add AYN Odin 2
To: wuxilin123@gmail.com, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Junhao Xie <bigfoot@classfun.cn>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Tengfei Fan <quic_tengfan@quicinc.com>,
 Molly Sophia <mollysophia379@gmail.com>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
References: <20240424-ayn-odin2-initial-v1-0-e0aa05c991fd@gmail.com>
 <20240424-ayn-odin2-initial-v1-10-e0aa05c991fd@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240424-ayn-odin2-initial-v1-10-e0aa05c991fd@gmail.com>
Content-Type: text/plain; charset=UTF-8
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

On 24/04/2024 17:29, Xilin Wu via B4 Relay wrote:
> From: Xilin Wu <wuxilin123@gmail.com>
> 
> AYN Odin 2 is a gaming handheld based on QCS8550, which is derived
> from SM8550 but without modem RF system.
> 



> +
> +/ {
> +	model = "AYN Odin 2";
> +	compatible = "ayn,odin2", "qcom,qcs8550", "qcom,sm8550";
> +	chassis-type = "handset";
> +
> +	qcom,msm-id = <QCOM_ID_QCS8550 0x20000>;
> +	qcom,board-id = <0x1001f 0>;

No, these are not allowed. You did not test your dts.

It does not look like you tested the DTS against bindings. Please run
`make dtbs_check W=1` (see
Documentation/devicetree/bindings/writing-schema.rst or
https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
for instructions).

> +
> +	aliases {
> +		serial0 = &uart7;
> +		serial1 = &uart14;
> +		serial2 = &uart15;
> +	};
> +
> +	backlight: backlight {
> +		compatible = "pwm-backlight";
> +		pwms = <&pmk8550_pwm 0 860000>;
> +		brightness-levels = <1023 0>;
> +		num-interpolated-steps = <1023>;
> +		default-brightness-level = <600>;
> +		power-supply = <&vph_pwr>;
> +		enable-gpios = <&pmk8550_gpios 5 GPIO_ACTIVE_HIGH>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pwm_backlight_default>;
> +		status = "okay";

Drop, why do you need it? Do you see it anywhere else in the backlight
nodes in DTS?


> +	};
> +
> +	fan_pwr: fan-pwr-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "fan_pwr";
> +
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +
> +		gpio = <&tlmm 109 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&fan_pwr_en>;
> +
> +		regulator-state-mem {
> +			regulator-off-in-suspend;
> +		};
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		pinctrl-0 = <&volume_up_n>, <&m1_m2_keys_default>;
> +		pinctrl-names = "default";
> +
> +		key-volume-up {
> +			label = "Volume Up";
> +			linux,code = <KEY_VOLUMEUP>;
> +			gpios = <&pm8550_gpios 6 GPIO_ACTIVE_LOW>;
> +			debounce-interval = <15>;
> +			linux,can-disable;
> +			wakeup-source;
> +		};
> +
> +		m1-button {
> +			label = "M1";
> +			linux,code = <BTN_TRIGGER_HAPPY1>;
> +			gpios = <&tlmm 57 GPIO_ACTIVE_LOW>;
> +		};
> +
> +		m2-button {
> +			label = "M2";
> +			linux,code = <BTN_TRIGGER_HAPPY2>;
> +			gpios = <&tlmm 58 GPIO_ACTIVE_LOW>;
> +		};
> +	};
> +
> +	hdmi-out {
> +		compatible = "hdmi-connector";
> +		type = "d";
> +		hpd-gpios = <&tlmm 9 GPIO_ACTIVE_HIGH>;
> +
> +		port {
> +			hdmi_con: endpoint {
> +				remote-endpoint = <&lt8912_out>;
> +			};
> +		};
> +	};
> +
> +	hdmi_pwr: hdmi-pwr-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "hdmi_pwr";
> +
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +
> +		gpio = <&tlmm 10 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	vdd_lcm_2p8: vdd-lcm-2p8-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vdd_lcm_2p8";
> +
> +		regulator-min-microvolt = <2800000>;
> +		regulator-max-microvolt = <2800000>;
> +
> +		gpio = <&tlmm 142 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	led_left_side: led-controller-1 {
> +		compatible = "pwm-leds-multicolor";
> +
> +		multi-led {
> +			label = "left-side";
> +			color = <LED_COLOR_ID_RGB>;
> +			max-brightness = <255>;
> +
> +			led-red {
> +				color = <LED_COLOR_ID_RED>;
> +				pwms = <&pwm_rgb_left 0>;
> +			};
> +
> +			led-green {
> +				color = <LED_COLOR_ID_GREEN>;
> +				pwms = <&pwm_rgb_left 1>;
> +			};
> +
> +			led-blue {
> +				color = <LED_COLOR_ID_BLUE>;
> +				pwms = <&pwm_rgb_left 2>;
> +			};
> +		};
> +	};
> +
> +	led_left_joystick: led-controller-2 {
> +		compatible = "pwm-leds-multicolor";
> +
> +		multi-led {
> +			label = "left-joystick";
> +			color = <LED_COLOR_ID_RGB>;
> +			max-brightness = <255>;
> +
> +			led-red {
> +				color = <LED_COLOR_ID_RED>;
> +				pwms = <&pwm_rgb_left 6>;
> +			};
> +
> +			led-green {
> +				color = <LED_COLOR_ID_GREEN>;
> +				pwms = <&pwm_rgb_left 7>;
> +			};
> +
> +			led-blue {
> +				color = <LED_COLOR_ID_BLUE>;
> +				pwms = <&pwm_rgb_left 8>;
> +			};
> +		};
> +	};
> +
> +	led_right_side: led-controller-3 {
> +		compatible = "pwm-leds-multicolor";
> +
> +		multi-led {
> +			label = "right-side";
> +			color = <LED_COLOR_ID_RGB>;
> +			max-brightness = <255>;
> +
> +			led-red {
> +				color = <LED_COLOR_ID_RED>;
> +				pwms = <&pwm_rgb_right 0>;
> +			};
> +
> +			led-green {
> +				color = <LED_COLOR_ID_GREEN>;
> +				pwms = <&pwm_rgb_right 1>;
> +			};
> +
> +			led-blue {
> +				color = <LED_COLOR_ID_BLUE>;
> +				pwms = <&pwm_rgb_right 2>;
> +			};
> +		};
> +	};
> +
> +	led_right_joystick: led-controller-4 {
> +		compatible = "pwm-leds-multicolor";
> +
> +		multi-led {
> +			label = "right-joystick";
> +			color = <LED_COLOR_ID_RGB>;
> +			max-brightness = <255>;
> +
> +			led-red {
> +				color = <LED_COLOR_ID_RED>;
> +				pwms = <&pwm_rgb_right 6>;
> +			};
> +
> +			led-green {
> +				color = <LED_COLOR_ID_GREEN>;
> +				pwms = <&pwm_rgb_right 7>;
> +			};
> +
> +			led-blue {
> +				color = <LED_COLOR_ID_BLUE>;
> +				pwms = <&pwm_rgb_right 8>;
> +			};
> +		};
> +	};
> +
> +	mcu_3v3: mcu-3v3-regulator {

Name all regulators regulator-n, where n is decimal number. Then order
the nodes by name.


...

> +
> +&i2c4 {
> +	clock-frequency = <400000>;
> +	status = "okay";
> +
> +	touchscreen@20 {
> +		compatible = "syna,rmi4-i2c";
> +		reg = <0x20>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		interrupts-extended = <&tlmm 25 0x2008>;
> +
> +		pinctrl-names = "default", "sleep";
> +		pinctrl-0 = <&ts_int_default>;
> +		pinctrl-1 = <&ts_int_sleep>;
> +
> +		vio-supply = <&vreg_l12b_1p8>;
> +
> +		syna,startup-delay-ms = <200>;
> +		syna,reset-delay-ms = <200>;
> +
> +		rmi4-f01@1 {
> +			syna,nosleep-mode = <0x1>;
> +			reg = <0x1>;
> +		};
> +
> +		rmi4-f12@12 {
> +			reg = <0x12>;
> +			syna,rezero-wait-ms = <20>;
> +			syna,clip-x-low = <0>;
> +			syna,clip-y-low = <0>;
> +			syna,clip-x-high = <1080>;
> +			syna,clip-y-high = <1920>;
> +			syna,sensor-type = <1>;
> +			touchscreen-inverted-x;
> +		};
> +	};

Please confirm the status of dtbs_check for your board. I am pretty sure
it fails.

Best regards,
Krzysztof

