Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4269361994E
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 15:20:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 153A110E7FF;
	Fri,  4 Nov 2022 14:20:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCD4610E801
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 14:20:10 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id z1so3110817qkl.9
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Nov 2022 07:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8Yr+w2romoen6cHR+oJnJLYpEgBXB/6iDDMSBNV5YpA=;
 b=FBMI1bFNYVN3SPaTIg2r8QQE1ZsXDeM6XpAXYUZD1yB5VwWjQtHD3MsA+qk4yigzxe
 d5tJO3LoGIBHSQ4r90d/jBXhfZD5LzUkP+3B2MVAHSv0LFAMb83w+aK/jL0QU604slfB
 /pkHABPz7fW7o21ysVs/lLnxoiPG7HXopT8wokrgw2P/VWgjINRjh7bt/fXiLq0gsAwQ
 aT0p66O5ZUwn5n3ookZ1vFFgkRsSYo9s4Jf1RI8gSho/KaJ5M0yQpajXYlSN8q3oTyQE
 AMwX+YGzbwFK8ANY0RP3mDITa4l6K87GhozSZwEJiy7k3AF9TmDeG3F+vaEPZ3OecoZT
 0nIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8Yr+w2romoen6cHR+oJnJLYpEgBXB/6iDDMSBNV5YpA=;
 b=vptJ+PaXJ66RyhfJe+XFoDDn80FIa2B354PYoHi1Q7f18CSIF5cnli0XuaeyMPRYLO
 pOYesumsveXwsghfeqre/DwSmbE61ftpif7P/jVZlzC+BNrSKr7t7HqArlWxNIYzXJf2
 dV+VyNPe7WhctjmexjRnXnxefV+SQ8O/vbdOxDTGyHRzOTl8ZwqSOMz9j585pY860d6d
 fCDTH9RrOK8dzy++hwLdiq9b0d6SD61OypTNvOfvLKtJ5vOcjdEIBxCRy90h4HC9CyR6
 qbat7HmnaRUeremAWSpUrSZ7p1EaTQVPHXBXL8XrkTTVn9cw8gTc3asRRcqqltqMTX3x
 oaUQ==
X-Gm-Message-State: ACrzQf00ykNl2OH2j6XBsYsd5gGRoQ0wQMlioREZdl4ADuGBr4fCQpbp
 xE4sv8LCmD4+wQFelufmlkw8iA==
X-Google-Smtp-Source: AMsMyM78hlDwF5KKUa+GROLx7DamFaAKhfWM7H1YQ9TRI56eiMvKyWTWsImMA/l+VBqbzZD9MaRDjg==
X-Received: by 2002:a37:c4e:0:b0:6fa:c1c:6fc0 with SMTP id
 75-20020a370c4e000000b006fa0c1c6fc0mr26469733qkm.501.1667571609360; 
 Fri, 04 Nov 2022 07:20:09 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:aad6:acd8:4ed9:299b?
 ([2601:586:5000:570:aad6:acd8:4ed9:299b])
 by smtp.gmail.com with ESMTPSA id
 y7-20020ac87087000000b0039bfe8acff6sm2482398qto.58.2022.11.04.07.20.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Nov 2022 07:20:09 -0700 (PDT)
Message-ID: <a2dfa9de-40b2-ed78-353b-9754d9e77fca@linaro.org>
Date: Fri, 4 Nov 2022 10:20:07 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v1 4/5] arm64: dts: qcom: sm8450-hdk: Add LT9611uxc HDMI
 bridge
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20221104131358.1025987-1-dmitry.baryshkov@linaro.org>
 <20221104131358.1025987-5-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221104131358.1025987-5-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Vinod Koul <vkoul@kernel.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/11/2022 09:13, Dmitry Baryshkov wrote:
> From: Vinod Koul <vkoul@kernel.org>
> 
> Add the LT9611uxc DSI-HDMI bridge and supplies
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 61 +++++++++++++++++++++++++
>  1 file changed, 61 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
> index e1a4cf1ee51d..9522dd29a38a 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
> @@ -20,6 +20,28 @@ chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
>  
> +	lt9611_1v2: lt9611-vdd12-regulator {

Node name: drop lt9611

> +		compatible = "regulator-fixed";
> +		regulator-name = "LT9611_1V2";
> +
> +		vin-supply = <&vph_pwr>;
> +		regulator-min-microvolt = <1200000>;
> +		regulator-max-microvolt = <1200000>;
> +		gpio = <&tlmm 9 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	lt9611_3v3: lt9611-3v3 {

Node name: drop lt9611 and add "regulator suffix

> +		compatible = "regulator-fixed";
> +		regulator-name = "LT9611_3V3";
> +
> +		vin-supply = <&vreg_bob>;
> +		gpio = <&tlmm 109 GPIO_ACTIVE_HIGH>;
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		enable-active-high;
> +	};
> +
>  	vph_pwr: vph-pwr-regulator {
>  		compatible = "regulator-fixed";
>  		regulator-name = "vph_pwr";
> @@ -349,6 +371,27 @@ vreg_l7e_2p8: ldo7 {
>  	};
>  };
>  
> +&i2c9 {
> +	status = "okay";
> +	clock-frequency = <400000>;
> +
> +	lt9611_codec: hdmi-bridge@2b {
> +		compatible = "lontium,lt9611uxc";
> +		reg = <0x2b>;
> +
> +		interrupts-extended = <&tlmm 44 IRQ_TYPE_EDGE_FALLING>;
> +
> +		reset-gpios = <&tlmm 107 GPIO_ACTIVE_HIGH>;
> +
> +		vdd-supply = <&lt9611_1v2>;
> +		vcc-supply = <&lt9611_3v3>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&lt9611_irq_pin &lt9611_rst_pin>;
> +
> +	};
> +};
> +
>  &pcie0 {
>  	status = "okay";
>  	max-link-speed = <2>;
> @@ -394,8 +437,26 @@ &qupv3_id_0 {
>  	status = "okay";
>  };
>  
> +&qupv3_id_1 {
> +	status = "okay";
> +};
> +
>  &tlmm {
>  	gpio-reserved-ranges = <28 4>, <36 4>;
> +
> +	lt9611_irq_pin: lt9611-irq {

-state


Best regards,
Krzysztof

