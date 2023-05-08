Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9244A6FA25C
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 10:34:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AEFA10E180;
	Mon,  8 May 2023 08:34:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85F2A10E180
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 08:34:50 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4f14ec4efb0so2639998e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 08 May 2023 01:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683534888; x=1686126888;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qCNtPr0JwlvjsNFu67DIeJ3GgI3iGTtI8/7LXS2wZYk=;
 b=V5vXNQ5GWe8KUpKdHN0fnMvcPOUhlsyB5PxpWSVkiOpt16uzeZWmHsLIN12yFm+5Yj
 9MIm4tjLtxmpIa4vJZCHhpYU1SAw5ILnU4tw6oxBcNLR2XsPXy0uXgo9NSn7wfJkk2Ow
 X5vCImpRhKUZIcCqGjd0x5b9YsU95zpjhUwMx4HBXc8a5Ok1EZ0H3PHD607cWVy/5nCs
 kJtCl665w2PDl0ZdqYszREFCTMlhJGrbowvUwU96KHkQxrlUh28MfaGvILi34MqpiXV1
 uEDDPugmFJknA7tZY1GLfcPBRYlxKbDA0uPrUt6kVEEjADNaL2gOs1gz54mM4Zu1s2Zl
 KvNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683534888; x=1686126888;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qCNtPr0JwlvjsNFu67DIeJ3GgI3iGTtI8/7LXS2wZYk=;
 b=XAdzYjdR5Uv14MopJyhtAy1cepEe7er554d2My7kCn/aAuav5aeEZIA0cOM85va4eg
 p4R9e2b1e1W+gKnSbYKLFSiwWOEd4UBw6hm5ju5LCRXeHkN5mVG8y8caCcY3zTLiFGli
 Q2Ik+wAObSDw1RwfG81jbv2baY8W7Pg61Q4PLyqr0IrNn2JePDIvaLnwD/syCzdzxI3H
 +GRu2XUp7WRxvZ2nTr4ZjCltEGx6PaNJ2/pNblWQdquYZ3zPUHbgVFnJ/sZ6HpChSCm1
 QxaVqVWZMK1uC1D90RhxPWprHc79gWTUWR+odY+KBO/FBlfIu7DJgTymbQ8e0NKX2wIY
 Jjng==
X-Gm-Message-State: AC+VfDwLK6G7nSnzIxv0jNhax6GfiR9IQbu2QsWEgD4+AhRSrFBPnQx9
 J4pS4eZHILw7mQV3PChjHArk4g==
X-Google-Smtp-Source: ACHHUZ6PIEja33Tsnyi1eGOgotXjqEbCn17WNyUoqoCXNnTL2k/aocmrdgrbsEBA9RKenXcbUU4CAA==
X-Received: by 2002:ac2:4d1a:0:b0:4ec:363a:5f24 with SMTP id
 r26-20020ac24d1a000000b004ec363a5f24mr2443926lfi.23.1683534888453; 
 Mon, 08 May 2023 01:34:48 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
 by smtp.gmail.com with ESMTPSA id
 d2-20020a05651221c200b004eff66716a6sm1206330lft.113.2023.05.08.01.34.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 01:34:48 -0700 (PDT)
Message-ID: <ca09ce7d-b0c4-1544-0c9e-fab823aa79e6@linaro.org>
Date: Mon, 8 May 2023 10:34:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 4/4] ARM: dts: qcom: apq8074-dragonboard: enable DSI panel
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230507190735.2333145-1-dmitry.baryshkov@linaro.org>
 <20230507190735.2333145-5-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230507190735.2333145-5-dmitry.baryshkov@linaro.org>
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
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7.05.2023 21:07, Dmitry Baryshkov wrote:
> Enable MDSS, GPU and DSI panel output on the APQ8074 dragonboard.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../arm/boot/dts/qcom-apq8074-dragonboard.dts | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts b/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
> index c893afc00eb4..72f7e09a5bbf 100644
> --- a/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
> +++ b/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
> @@ -48,6 +48,57 @@ eeprom: eeprom@52 {
>  	};
>  };
>  
> +&dsi0 {
old junk could use some mdss_ prefixing to keep the nodes together

Could you please take care of that?

> +	vdda-supply = <&pm8941_l2>;
> +	vdd-supply = <&pm8941_l22>;
> +	vddio-supply = <&pm8941_l12>;
> +
> +	status = "okay";
> +
> +	panel: panel@0 {
> +		compatible = "sharp,ls043t1le01-qhd";
> +		reg = <0>;
> +
> +		avdd-supply = <&pm8941_l22>;
> +		backlight = <&pm8941_wled>;
> +		reset-gpios = <&pm8941_gpios 19 GPIO_ACTIVE_HIGH>;
> +
> +		port {
> +			panel_in: endpoint {
> +				remote-endpoint = <&dsi0_out>;
> +			};
> +		};
> +	};
> +};
> +
> +&dsi0_out {
> +	remote-endpoint = <&panel_in>;
> +	data-lanes = <0 1 2 3>;
> +};
> +
> +&dsi0_phy {
> +	status = "okay";
> +
> +	vddio-supply = <&pm8941_l12>;
status last

Konrad
> +};
> +
> +&gpu {
> +	status = "okay";
> +};
> +
> +&mdss {
> +	status = "okay";
> +};
> +
> +&pm8941_wled {
> +	qcom,cs-out;
> +	qcom,switching-freq = <3200>;
> +	qcom,ovp = <32>;
> +	qcom,num-strings = <1>;
> +
> +	status = "okay";
> +};
> +
>  &remoteproc_adsp {
>  	cx-supply = <&pm8841_s2>;
>  
