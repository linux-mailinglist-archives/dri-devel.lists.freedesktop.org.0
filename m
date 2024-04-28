Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F388B4A9F
	for <lists+dri-devel@lfdr.de>; Sun, 28 Apr 2024 10:07:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20C1C10FA7E;
	Sun, 28 Apr 2024 08:07:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mUmhI5NT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com
 [209.85.160.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71F0510E3C4
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Apr 2024 03:54:15 +0000 (UTC)
Received: by mail-oa1-f47.google.com with SMTP id
 586e51a60fabf-233e41de0caso1862487fac.0
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Apr 2024 20:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714276454; x=1714881254; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CLpY/XhI5HbcFTKFtWlC5rSdt0Q9kJF4aY4r/ezxW9w=;
 b=mUmhI5NTFWY+E5IX2SVSH+NCK5uoI/ulKsx3pZiHJXGuxrzR6NQuW6JufY6fh9HBLf
 d/AVkRYVH8FLaDaTGUxOWy/tJEpMbJCwYt/bij9XjAhUOqSMemwdOHMIm32fym2ls7Xh
 NNt+Bkx+03wu8GIYRRZFQHt0om+H6z3fCEXwlgIM97cC73psX5b0EbGpjOPomaD4zi6W
 1R2kQ99waLPsTNSNruFfG1809sz5FmWCCi8mDuueEGJKSy3yEKDmvrUet151r7fY3K8u
 zUEyTWtbNEMN8M+V1X7P7s6SbTfFh1Zd5cOm7JbPAT81QSgEgU5JWN5hZWSXTqV8NsF7
 EM+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714276454; x=1714881254;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CLpY/XhI5HbcFTKFtWlC5rSdt0Q9kJF4aY4r/ezxW9w=;
 b=UA+56VzJUPAdaaEuOzM5qPZRvWdDUUnrq/ZoUlOHPAZTGdnOBs+GhdeFgoIeMkKX5j
 ognuR7kxQiaV77FUKNKXi0WsOmUagFqRdOyVx9/aKw3eW4m5WHMxB5KfWTzz6Oy79PzF
 W2AaJgOzOqO763BsfNawUgYa/4drYVByXVLJVXz2pY3YTqVqcdh07NM3o7cIoZDWdu+7
 EoAUJqVsbk10J2rw4piMAnNd80XMXtd09OwY7pctRMChFKyBSZPNz7h74xrsg9XQoV5O
 Mn6fzyP44sYSJ58qmXygQpGd5ssaqf/FnsntMCXFYR5BPbmvt8pnDhyXbtPfTKr6yDVy
 bFqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyu/17ebVyT09Fk5q226nqblppuh/U/zOVLq4AQDRV1q4cSF8qTOLrZ4AsYifW5fwwh05jVtNo38uTSb+YsGa3h9CL7i5Fl25tJ60ivx88
X-Gm-Message-State: AOJu0Yxa28e1ofWdVRiOaP8F1Mqzgedq/dBnbBirK5xf/3EyMQ+bRVY5
 ISm44qOj20LQ2ru5VGIvquTUjjLZDrrndFChE/xxt2dRGO/Y6DhH
X-Google-Smtp-Source: AGHT+IECFoxzkYPE9JmOaGsxWZcrK5Todisg8/d+PBvt5Xw6UOu42wHTOHTWW5/gCiRYyLITGDlz4w==
X-Received: by 2002:a05:6870:f22a:b0:22e:c787:5fa2 with SMTP id
 t42-20020a056870f22a00b0022ec7875fa2mr7294645oao.58.1714276454353; 
 Sat, 27 Apr 2024 20:54:14 -0700 (PDT)
Received: from [0.0.0.0] (42-3-109-144.ptr.netvigator.com. [42.3.109.144])
 by smtp.gmail.com with ESMTPSA id
 fb12-20020a056a002d8c00b006f3ec69bc09sm1968853pfb.75.2024.04.27.20.54.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 27 Apr 2024 20:54:13 -0700 (PDT)
Message-ID: <f80384eb-d7eb-4a68-952d-529230ec51a6@gmail.com>
Date: Sun, 28 Apr 2024 11:54:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/10] arm64: dts: qcom: Add AYN Odin 2
To: Krzysztof Kozlowski <krzk@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Junhao Xie <bigfoot@classfun.cn>,
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
 <0d1c6ed9-0c20-4b0e-876d-4b0adf5aa75d@kernel.org>
Content-Language: en-US
From: Xilin Wu <wuxilin123@gmail.com>
In-Reply-To: <0d1c6ed9-0c20-4b0e-876d-4b0adf5aa75d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sun, 28 Apr 2024 08:07:30 +0000
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

On 2024/4/25 14:28, Krzysztof Kozlowski wrote:
> On 24/04/2024 17:29, Xilin Wu via B4 Relay wrote:
>> From: Xilin Wu <wuxilin123@gmail.com>
>>
>> AYN Odin 2 is a gaming handheld based on QCS8550, which is derived
>> from SM8550 but without modem RF system.
>>
> 
> 
> 
>> +
>> +/ {
>> +	model = "AYN Odin 2";
>> +	compatible = "ayn,odin2", "qcom,qcs8550", "qcom,sm8550";
>> +	chassis-type = "handset";
>> +
>> +	qcom,msm-id = <QCOM_ID_QCS8550 0x20000>;
>> +	qcom,board-id = <0x1001f 0>;
> 
> No, these are not allowed. You did not test your dts.
> 
> It does not look like you tested the DTS against bindings. Please run
> `make dtbs_check W=1` (see
> Documentation/devicetree/bindings/writing-schema.rst or
> https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
> for instructions).
> 
>> +
>> +	aliases {
>> +		serial0 = &uart7;
>> +		serial1 = &uart14;
>> +		serial2 = &uart15;
>> +	};
>> +
>> +	backlight: backlight {
>> +		compatible = "pwm-backlight";
>> +		pwms = <&pmk8550_pwm 0 860000>;
>> +		brightness-levels = <1023 0>;
>> +		num-interpolated-steps = <1023>;
>> +		default-brightness-level = <600>;
>> +		power-supply = <&vph_pwr>;
>> +		enable-gpios = <&pmk8550_gpios 5 GPIO_ACTIVE_HIGH>;
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&pwm_backlight_default>;
>> +		status = "okay";
> 
> Drop, why do you need it? Do you see it anywhere else in the backlight
> nodes in DTS?
> 
> 
>> +	};
>> +
>> +	fan_pwr: fan-pwr-regulator {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "fan_pwr";
>> +
>> +		regulator-min-microvolt = <5000000>;
>> +		regulator-max-microvolt = <5000000>;
>> +
>> +		gpio = <&tlmm 109 GPIO_ACTIVE_HIGH>;
>> +		enable-active-high;
>> +
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&fan_pwr_en>;
>> +
>> +		regulator-state-mem {
>> +			regulator-off-in-suspend;
>> +		};
>> +	};
>> +
>> +	gpio-keys {
>> +		compatible = "gpio-keys";
>> +
>> +		pinctrl-0 = <&volume_up_n>, <&m1_m2_keys_default>;
>> +		pinctrl-names = "default";
>> +
>> +		key-volume-up {
>> +			label = "Volume Up";
>> +			linux,code = <KEY_VOLUMEUP>;
>> +			gpios = <&pm8550_gpios 6 GPIO_ACTIVE_LOW>;
>> +			debounce-interval = <15>;
>> +			linux,can-disable;
>> +			wakeup-source;
>> +		};
>> +
>> +		m1-button {
>> +			label = "M1";
>> +			linux,code = <BTN_TRIGGER_HAPPY1>;
>> +			gpios = <&tlmm 57 GPIO_ACTIVE_LOW>;
>> +		};
>> +
>> +		m2-button {
>> +			label = "M2";
>> +			linux,code = <BTN_TRIGGER_HAPPY2>;
>> +			gpios = <&tlmm 58 GPIO_ACTIVE_LOW>;
>> +		};
>> +	};
>> +
>> +	hdmi-out {
>> +		compatible = "hdmi-connector";
>> +		type = "d";
>> +		hpd-gpios = <&tlmm 9 GPIO_ACTIVE_HIGH>;
>> +
>> +		port {
>> +			hdmi_con: endpoint {
>> +				remote-endpoint = <&lt8912_out>;
>> +			};
>> +		};
>> +	};
>> +
>> +	hdmi_pwr: hdmi-pwr-regulator {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "hdmi_pwr";
>> +
>> +		regulator-min-microvolt = <1800000>;
>> +		regulator-max-microvolt = <1800000>;
>> +
>> +		gpio = <&tlmm 10 GPIO_ACTIVE_HIGH>;
>> +		enable-active-high;
>> +	};
>> +
>> +	vdd_lcm_2p8: vdd-lcm-2p8-regulator {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "vdd_lcm_2p8";
>> +
>> +		regulator-min-microvolt = <2800000>;
>> +		regulator-max-microvolt = <2800000>;
>> +
>> +		gpio = <&tlmm 142 GPIO_ACTIVE_HIGH>;
>> +		enable-active-high;
>> +	};
>> +
>> +	led_left_side: led-controller-1 {
>> +		compatible = "pwm-leds-multicolor";
>> +
>> +		multi-led {
>> +			label = "left-side";
>> +			color = <LED_COLOR_ID_RGB>;
>> +			max-brightness = <255>;
>> +
>> +			led-red {
>> +				color = <LED_COLOR_ID_RED>;
>> +				pwms = <&pwm_rgb_left 0>;
>> +			};
>> +
>> +			led-green {
>> +				color = <LED_COLOR_ID_GREEN>;
>> +				pwms = <&pwm_rgb_left 1>;
>> +			};
>> +
>> +			led-blue {
>> +				color = <LED_COLOR_ID_BLUE>;
>> +				pwms = <&pwm_rgb_left 2>;
>> +			};
>> +		};
>> +	};
>> +
>> +	led_left_joystick: led-controller-2 {
>> +		compatible = "pwm-leds-multicolor";
>> +
>> +		multi-led {
>> +			label = "left-joystick";
>> +			color = <LED_COLOR_ID_RGB>;
>> +			max-brightness = <255>;
>> +
>> +			led-red {
>> +				color = <LED_COLOR_ID_RED>;
>> +				pwms = <&pwm_rgb_left 6>;
>> +			};
>> +
>> +			led-green {
>> +				color = <LED_COLOR_ID_GREEN>;
>> +				pwms = <&pwm_rgb_left 7>;
>> +			};
>> +
>> +			led-blue {
>> +				color = <LED_COLOR_ID_BLUE>;
>> +				pwms = <&pwm_rgb_left 8>;
>> +			};
>> +		};
>> +	};
>> +
>> +	led_right_side: led-controller-3 {
>> +		compatible = "pwm-leds-multicolor";
>> +
>> +		multi-led {
>> +			label = "right-side";
>> +			color = <LED_COLOR_ID_RGB>;
>> +			max-brightness = <255>;
>> +
>> +			led-red {
>> +				color = <LED_COLOR_ID_RED>;
>> +				pwms = <&pwm_rgb_right 0>;
>> +			};
>> +
>> +			led-green {
>> +				color = <LED_COLOR_ID_GREEN>;
>> +				pwms = <&pwm_rgb_right 1>;
>> +			};
>> +
>> +			led-blue {
>> +				color = <LED_COLOR_ID_BLUE>;
>> +				pwms = <&pwm_rgb_right 2>;
>> +			};
>> +		};
>> +	};
>> +
>> +	led_right_joystick: led-controller-4 {
>> +		compatible = "pwm-leds-multicolor";
>> +
>> +		multi-led {
>> +			label = "right-joystick";
>> +			color = <LED_COLOR_ID_RGB>;
>> +			max-brightness = <255>;
>> +
>> +			led-red {
>> +				color = <LED_COLOR_ID_RED>;
>> +				pwms = <&pwm_rgb_right 6>;
>> +			};
>> +
>> +			led-green {
>> +				color = <LED_COLOR_ID_GREEN>;
>> +				pwms = <&pwm_rgb_right 7>;
>> +			};
>> +
>> +			led-blue {
>> +				color = <LED_COLOR_ID_BLUE>;
>> +				pwms = <&pwm_rgb_right 8>;
>> +			};
>> +		};
>> +	};
>> +
>> +	mcu_3v3: mcu-3v3-regulator {
> 
> Name all regulators regulator-n, where n is decimal number. Then order
> the nodes by name.
> 
> 
> ...
> 
>> +
>> +&i2c4 {
>> +	clock-frequency = <400000>;
>> +	status = "okay";
>> +
>> +	touchscreen@20 {
>> +		compatible = "syna,rmi4-i2c";
>> +		reg = <0x20>;
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +		interrupts-extended = <&tlmm 25 0x2008>;
>> +
>> +		pinctrl-names = "default", "sleep";
>> +		pinctrl-0 = <&ts_int_default>;
>> +		pinctrl-1 = <&ts_int_sleep>;
>> +
>> +		vio-supply = <&vreg_l12b_1p8>;
>> +
>> +		syna,startup-delay-ms = <200>;
>> +		syna,reset-delay-ms = <200>;
>> +
>> +		rmi4-f01@1 {
>> +			syna,nosleep-mode = <0x1>;
>> +			reg = <0x1>;
>> +		};
>> +
>> +		rmi4-f12@12 {
>> +			reg = <0x12>;
>> +			syna,rezero-wait-ms = <20>;
>> +			syna,clip-x-low = <0>;
>> +			syna,clip-y-low = <0>;
>> +			syna,clip-x-high = <1080>;
>> +			syna,clip-y-high = <1920>;
>> +			syna,sensor-type = <1>;
>> +			touchscreen-inverted-x;
>> +		};
>> +	};
> 
> Please confirm the status of dtbs_check for your board. I am pretty sure
> it fails.
> 
> Best regards,
> Krzysztof
> 

I will correct all the mistakes in v2. Thanks for catching them!

-- 
Thanks,
Xilin Wu

