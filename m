Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5845611D23
	for <lists+dri-devel@lfdr.de>; Sat, 29 Oct 2022 00:06:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B209010E8EB;
	Fri, 28 Oct 2022 22:06:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53F9410E8EC
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Oct 2022 22:06:00 +0000 (UTC)
Received: by mail-qk1-x730.google.com with SMTP id 8so4379242qka.1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Oct 2022 15:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Oe9YWMLOYbkHnGM5Ih1wEVQ8dEjEkrZVtdAltI46+v4=;
 b=ZBRvD+MDACsUIyIxrcrpKl7fS0lCVLwbEcXBNJ54M1bmTkZ8aukcIcVjUzFcxgGQKn
 Vg0VAdVvwXsh6edKd2XanDxQor/9m7eq4UvNiSk3VbLVeDg8xX1lZuODUlVHDgk5PWpc
 evlWLZ5cyZ0sEbjG1sPlYV7smBcSW/ELW2r335IqMBAk/CqDHG5opLLsTCFuefRVtOnA
 TItz0WXLBUcevzMUF35AaKuBKJGdNkjS/SiimgKYyd718R6bCNq7P7HqcfC08mWfAhAW
 HOEurebBkUkT+RhYDvylYcw677raCx5pfiEP7Z8EwQN3mak+YW4qBaGCxKvAZXHU5di6
 2vTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Oe9YWMLOYbkHnGM5Ih1wEVQ8dEjEkrZVtdAltI46+v4=;
 b=fSIVN7AeaaQZUzXgUDLq4GAWO78XSM2vM+fuBu92nYYY4fLTn/S1XdZ3lMMa7xPos3
 IE8gkKBev3KW5Nu5EL6rL9VNvoge93jBQSspaglJZgMo9muFm5D5/OR1If+CvnXYb3dI
 kxmUi0p4P5B7iQfdqxoaJrGgyUd9C2/n8riULU07c2C7L8vnr29Grtl6iJzKQtgKSi5+
 Sb0Hgn425w1993aMoCwJbnu6uL2pMBkrcGicOiV5jo6sdAukCbguTCpJwxmGUoKGSDj/
 jWk5xWAnzsuI0cryfPZ0YwObVVREh1o8vkaoH28RmERxY8KIf8R4gAAkQzOyBANqojoK
 rYJQ==
X-Gm-Message-State: ACrzQf2fclrcE83Rr5UhXqJg3l1ywIqUfB39sLJ8HuH6eS0yF0q1wggF
 CAdMkKdyZsKoZL6Tnf1Uz8RCjQ==
X-Google-Smtp-Source: AMsMyM4YrU1iBJT16PSlUcyx2agQqx/l8uxg+PwKzjNI22EFwmj+Nt9RZ9CXjFpopTjLH+jsaFNawA==
X-Received: by 2002:a05:620a:845:b0:6f9:df58:1ef5 with SMTP id
 u5-20020a05620a084500b006f9df581ef5mr1186792qku.238.1666994759245; 
 Fri, 28 Oct 2022 15:05:59 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
 by smtp.gmail.com with ESMTPSA id
 x4-20020a05620a258400b006bc192d277csm3830094qko.10.2022.10.28.15.05.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Oct 2022 15:05:57 -0700 (PDT)
Message-ID: <408b7b0c-ce30-134e-9b1f-f77c1f03f5c9@linaro.org>
Date: Fri, 28 Oct 2022 18:05:55 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v1 9/9] arm64: dts: qcom: sm8350-hdk: Enable lt9611uxc
 dsi-hdmi bridge
Content-Language: en-US
To: Robert Foss <robert.foss@linaro.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, konrad.dybcio@somainline.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, quic_kalyant@quicinc.com,
 swboyd@chromium.org, angelogioacchino.delregno@somainline.org,
 loic.poulain@linaro.org, quic_vpolimer@quicinc.com, vkoul@kernel.org,
 dianders@chromium.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Jonathan Marek <jonathan@marek.ca>, vinod.koul@linaro.org,
 quic_jesszhan@quicinc.com
References: <20221028120812.339100-1-robert.foss@linaro.org>
 <20221028120812.339100-10-robert.foss@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221028120812.339100-10-robert.foss@linaro.org>
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

On 28/10/2022 08:08, Robert Foss wrote:
> The sm8350-hdk ships with the LT9611 UXC DSI/HDMI bridge chip.
> 
> In order to toggle the board to enable the HDMI output,
> switch #7 & #8 on the rightmost multi-switch package have
> to be toggled to On.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 106 ++++++++++++++++++++++++
>  1 file changed, 106 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> index 6e07feb4b3b2..6666b38b58f8 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> @@ -20,6 +20,17 @@ chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
>  
> +	hdmi-out {

Generic node names, so hdmi-connector or just connector.

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
>  	vph_pwr: vph-pwr-regulator {
>  		compatible = "regulator-fixed";
>  		regulator-name = "vph_pwr";
> @@ -29,6 +40,32 @@ vph_pwr: vph-pwr-regulator {
>  		regulator-always-on;
>  		regulator-boot-on;
>  	};
> +
> +	lt9611_1v2: lt9611-1v2 {

Node names should be generic.
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

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

Ditto


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
>  };
>  
>  &adsp {
> @@ -220,6 +257,15 @@ &dispcc {
>  &dsi0 {
>  	status = "okay";
>  	vdda-supply = <&vreg_l6b_1p2>;
> +
> +	ports {
> +		port@1 {
> +			endpoint {
> +				remote-endpoint = <&lt9611_a>;
> +				data-lanes = <0 1 2 3>;
> +			};
> +		};
> +	};
>  };
>  
>  &dsi0_phy  {
> @@ -231,6 +277,48 @@ &gpi_dma1 {
>  	status = "okay";
>  };
>  
> +&i2c15 {
> +	status = "okay";

status is the last property

> +	clock-frequency = <400000>;
> +
> +	lt9611_codec: hdmi-bridge@2b {
> +		compatible = "lontium,lt9611uxc";
> +		reg = <0x2b>;
> +		status = "okay";

Why status?

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

No need for blank line

> +		};
> +	};
> +};
> +
>  &mdss {
>  	status = "okay";
>  };
> @@ -248,6 +336,10 @@ &qupv3_id_0 {
>  	status = "okay";
>  };
>  
> +&qupv3_id_2 {
> +	status = "okay";
> +};
> +
>  &slpi {
>  	status = "okay";
>  	firmware-name = "qcom/sm8350/slpi.mbn";
> @@ -544,4 +636,18 @@ usb_hub_enabled_state: usb-hub-enabled-state {
>  		drive-strength = <2>;
>  		output-low;
>  	};
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

Missing suffix 'state'.

Does not look like you tested the DTS against bindings. Please run `make
dtbs_check` (see Documentation/devicetree/bindings/writing-schema.rst
for instructions).

Rebase your changes on last linux-next.

Best regards,
Krzysztof

