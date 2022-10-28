Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E30546113B5
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 15:56:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E76A10E83F;
	Fri, 28 Oct 2022 13:56:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60AC510E83F
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Oct 2022 13:56:12 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id x21so7073354ljg.10
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Oct 2022 06:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jJGT7WlScoeQURQJnWt7V1SVLrHJyWm0catuXmu1IAU=;
 b=vZkNHpo3MZyn6XBWF+ZDYOyJs01wgCYwG0eykVjomi5aNerO9btUOksyUHaGqGYwvF
 n9I+e1gsnnuOzBMhdtT+Zg2Z+yFFSCxH+v7PjcL29Uc9ZgDmIg9xP63AwHe8RwkgObGz
 dkj5oeuQUzZWDSNEjUnnpRqttZiNnkzvYEkOC+jehTbV7YoN4/HYSL3nBauYbs+QReLF
 VbgMWNdo+cwD/hGO7Lj/ZpH/o7JIA6ZiXoiW2OCGV9/A0WqXli4DEneIRHGFvC2g/k0b
 ZTbYk8xpIiOE7jC8C/sbx+3vWX3xAkkvDFAH6C7Js1jNM4J+6y5sg2wUwns+0zlpBPns
 pruQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jJGT7WlScoeQURQJnWt7V1SVLrHJyWm0catuXmu1IAU=;
 b=DfIIxAEkm1aZ/AZE8oSxX/rjsGmHuyfS/bayOybrxffLEyZ2gcbbkDozkPHpl5U+/R
 6atxQOsiwmDpMFv3+Hn4OWy4OKCz9oPlz4hEyGMesqan2htZdpT7qinMJhYNauf5U8SM
 myPsgC5Dh5kYLVx9XPn5XHFty5IqaetWp8My/ilNmF8PsfbZXfzoV0sc79DALpZB/cKy
 CnySxAbA+j3AVt0kshhmCcvyL214OzyWPwJ5qAg4pPofmNsMswYWizCRz6U/9qiPbXHN
 XFOV3nI5cOFlLD9+zD3nKh+s5m+XeHmKuC0ufsG4TIUNB1tZR/jFDyD3PYfum7HaR4Fk
 Hosg==
X-Gm-Message-State: ACrzQf3+xiQvN0hjm0zSOQkXdXEtgBYOY4hOOy0/LyniEp8dlUxEzxZ9
 leMcC3kXoVE6tkaYxgGQ9oE6bw==
X-Google-Smtp-Source: AMsMyM4MRiBGsDbh4TjTK22TFE0SwxG4aFpxDpydL8aLyJPgOPpgb+biH06NeO6uGCEKTHtjbG8yhg==
X-Received: by 2002:a2e:7812:0:b0:277:2463:c1e2 with SMTP id
 t18-20020a2e7812000000b002772463c1e2mr4676095ljc.184.1666965370606; 
 Fri, 28 Oct 2022 06:56:10 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 e10-20020a05651c038a00b0026fc5a4d1b4sm625487ljp.60.2022.10.28.06.56.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Oct 2022 06:56:10 -0700 (PDT)
Message-ID: <bbce3d37-019b-a652-4f1d-18fb9493f7de@linaro.org>
Date: Fri, 28 Oct 2022 16:56:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v1 9/9] arm64: dts: qcom: sm8350-hdk: Enable lt9611uxc
 dsi-hdmi bridge
Content-Language: en-GB
To: Robert Foss <robert.foss@linaro.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, konrad.dybcio@somainline.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, sean@poorly.run, airlied@linux.ie,
 daniel@ffwll.ch, quic_kalyant@quicinc.com, swboyd@chromium.org,
 angelogioacchino.delregno@somainline.org, loic.poulain@linaro.org,
 quic_vpolimer@quicinc.com, vkoul@kernel.org, dianders@chromium.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 vinod.koul@linaro.org, quic_jesszhan@quicinc.com
References: <20221028120812.339100-1-robert.foss@linaro.org>
 <20221028120812.339100-10-robert.foss@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221028120812.339100-10-robert.foss@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 28/10/2022 15:08, Robert Foss wrote:
> The sm8350-hdk ships with the LT9611 UXC DSI/HDMI bridge chip.
> 
> In order to toggle the board to enable the HDMI output,
> switch #7 & #8 on the rightmost multi-switch package have
> to be toggled to On.

Since this doesn't look like a default setup, it would probably make 
sense to move this to new sm8350-hdk-hdmi.dts with the comment regarding 
necessary switch changes at the top of the file.

> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 106 ++++++++++++++++++++++++
>   1 file changed, 106 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> index 6e07feb4b3b2..6666b38b58f8 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> @@ -20,6 +20,17 @@ chosen {
>   		stdout-path = "serial0:115200n8";
>   	};
>   
> +	hdmi-out {
> +		compatible = "hdmi-connector";
> +		type = "a";
> +
> +		port {
> +			hdmi_con: endpoint {
> +				remote-endpoint = <&lt9611_out>;
> +			};
> +		};
> +	};
> +
>   	vph_pwr: vph-pwr-regulator {
>   		compatible = "regulator-fixed";
>   		regulator-name = "vph_pwr";
> @@ -29,6 +40,32 @@ vph_pwr: vph-pwr-regulator {
>   		regulator-always-on;
>   		regulator-boot-on;
>   	};
> +
> +	lt9611_1v2: lt9611-1v2 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "LT9611_1V2";
> +
> +		vin-supply = <&vph_pwr>;
> +		regulator-min-microvolt = <1200000>;
> +		regulator-max-microvolt = <1200000>;
> +		gpio = <&tlmm 49 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
> +
> +	lt9611_3v3: lt9611-3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "LT9611_3V3";
> +
> +		vin-supply = <&vreg_bob>;
> +		gpio = <&tlmm 47 GPIO_ACTIVE_HIGH>;
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		enable-active-high;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
>   };
>   
>   &adsp {
> @@ -220,6 +257,15 @@ &dispcc {
>   &dsi0 {
>   	status = "okay";
>   	vdda-supply = <&vreg_l6b_1p2>;
> +
> +	ports {
> +		port@1 {
> +			endpoint {
> +				remote-endpoint = <&lt9611_a>;
> +				data-lanes = <0 1 2 3>;
> +			};
> +		};
> +	};
>   };
>   
>   &dsi0_phy  {
> @@ -231,6 +277,48 @@ &gpi_dma1 {
>   	status = "okay";
>   };
>   
> +&i2c15 {
> +	status = "okay";
> +	clock-frequency = <400000>;
> +
> +	lt9611_codec: hdmi-bridge@2b {
> +		compatible = "lontium,lt9611uxc";
> +		reg = <0x2b>;
> +		status = "okay";
> +
> +		interrupts-extended = <&tlmm 50 IRQ_TYPE_EDGE_FALLING>;
> +		reset-gpios = <&tlmm 48 GPIO_ACTIVE_HIGH>;
> +
> +		vdd-supply = <&lt9611_1v2>;
> +		vcc-supply = <&lt9611_3v3>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&lt9611_irq_pin &lt9611_rst_pin>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				lt9611_a: endpoint {
> +					remote-endpoint = <&dsi0_out>;
> +				};
> +			};
> +
> +			port@2 {
> +				reg = <2>;
> +
> +				lt9611_out: endpoint {
> +					remote-endpoint = <&hdmi_con>;
> +				};
> +			};
> +
> +		};
> +	};
> +};
> +
>   &mdss {
>   	status = "okay";
>   };
> @@ -248,6 +336,10 @@ &qupv3_id_0 {
>   	status = "okay";
>   };
>   
> +&qupv3_id_2 {
> +	status = "okay";
> +};
> +
>   &slpi {
>   	status = "okay";
>   	firmware-name = "qcom/sm8350/slpi.mbn";
> @@ -544,4 +636,18 @@ usb_hub_enabled_state: usb-hub-enabled-state {
>   		drive-strength = <2>;
>   		output-low;
>   	};
> +
> +	lt9611_rst_pin: lt9611-rst-state {
> +		pins = "gpio48";
> +		function = "normal";
> +
> +		output-high;
> +		input-disable;
> +	};
> +
> +	lt9611_irq_pin: lt9611-irq {
> +		pins = "gpio50";
> +		function = "gpio";
> +		bias-disable;
> +	};
>   };

-- 
With best wishes
Dmitry

