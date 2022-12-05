Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 451D3642C19
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 16:42:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0917E10E243;
	Mon,  5 Dec 2022 15:42:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E777810E245
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Dec 2022 15:42:10 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id bn5so13993818ljb.2
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Dec 2022 07:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/TZQ/0zpx/j06MJim410qkeF/d2Q1Gh1lZXRpTFgdTE=;
 b=h8toFZhjhBtsFxjfPPLQdJCQIu6a04PHORQN+ppqGbZ8cLbolNzMINANXlw0VPLw0m
 Cv/JbQ3WGGgY2yUpbi9Q/VNL6OCN0Pqw05zNDe+HHn66F4gOooJQUishWya2KuC+7n2X
 +a05LYzYnr5eMeyxzDCSrWV+FY73QTFlkcbyet7K+tH9fR/PdAnmBajTgrK7dohp8ztP
 FZpcphS3n4castnrRiLEfdt/OfzQNoNJkLCVWtr1ga4P67Jef4RNXcBJ27H+tpvGFC7p
 QnGO3Oxmr7vUjv14VR7SKiZVzZokITOguUHIqsbJHLci1FQAUsHS2DPePAck2OEGUnXH
 55Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/TZQ/0zpx/j06MJim410qkeF/d2Q1Gh1lZXRpTFgdTE=;
 b=xoszxHU4nIarAjFovEyFjrZqhs3C6slCcGcDRas3hET5tnRyfsMGS8hX0Cdz4GB508
 I8WXxVfQXkRSkgFMWLFmkGcC8ppZ5gV4KrlO7oU0loIv/R2M7HeA9CvCvrQxbgfKvWAH
 Wvg6qG56muayQjzzhYCiS7xaMt7vrhnNJpLHXFirMnmCH+LYKJ5V4YoMqlKZxTfvwKYN
 6Amu1EaClg171vd1XwkmC0xLInRiLkmnZc6RGOYj37OtHaQA+EgTK0xx7FdqyjMc1kTL
 nQNGrKIfCj7D9Aodg+Qi+bBj1HIMte+XXLNZT1jJhqjX+fgj9QM46jgDR3L19cw7agTs
 b5Cw==
X-Gm-Message-State: ANoB5plE+MC8g4/QDTMF6ASq7GuWbKZp7PbTn7f6nLZr47C0w52hPK9S
 8oBTW/0O9J29Q4oBBEaCZWhlnA==
X-Google-Smtp-Source: AA0mqf6KcVNSOMb6YgXi8fU/AWTRWz5x/ZjvdsN8KIsX3BgfrtfY9oSBDJEJcHyD7B/1FUhKOMWLzg==
X-Received: by 2002:a2e:a58b:0:b0:277:278:de24 with SMTP id
 m11-20020a2ea58b000000b002770278de24mr18956576ljp.388.1670254929275; 
 Mon, 05 Dec 2022 07:42:09 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 d23-20020ac244d7000000b004b5748fa3afsm476899lfm.107.2022.12.05.07.42.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Dec 2022 07:42:08 -0800 (PST)
Message-ID: <c9ea96f9-a212-b693-12f2-b28a545b93e8@linaro.org>
Date: Mon, 5 Dec 2022 16:42:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3 4/5] arm64: dts: qcom: sm8450-hdk: Add LT9611uxc HDMI
 bridge
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20221123210720.3593671-1-dmitry.baryshkov@linaro.org>
 <20221123210720.3593671-5-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221123210720.3593671-5-dmitry.baryshkov@linaro.org>
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

On 23/11/2022 22:07, Dmitry Baryshkov wrote:
> From: Vinod Koul <vkoul@kernel.org>
> 
> Add the LT9611uxc DSI-HDMI bridge and supplies
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 59 +++++++++++++++++++++++++
>  1 file changed, 59 insertions(+)
> 

(...)

>  	vph_pwr: vph-pwr-regulator {
>  		compatible = "regulator-fixed";
>  		regulator-name = "vph_pwr";
> @@ -353,6 +375,27 @@ &dispcc {
>  	status = "okay";
>  };
>  
> +&i2c9 {
> +	clock-frequency = <400000>;
> +	status = "okay";
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

Drop blank line.

> +	};
> +};
Best regards,
Krzysztof

