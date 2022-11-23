Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F29E6353E1
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 10:02:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93C6A10E523;
	Wed, 23 Nov 2022 09:01:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54F1510E522
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 09:01:54 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id r12so27261074lfp.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 01:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WA7wcqap9FFSojyAIedMI2HkYd/yBUkUMbNf1qYRGDQ=;
 b=oiepXkfX2ozhXYoitSiMJdedTucyjr0vbG8Y331jpwhNAtO377avpdEIUokHvGP+z8
 2R5Mono0FGVQ8SvDeDRuABrB86bgCw9ZUBFRzkyRn4uWVdOb+VVFH/d0IuRel+dlkIIo
 A9j5MNM6BaIMvYxWOu//+UBLalE0ailN4OANyohJOKboO2GRbFxNxjbJIrWTGiosbOQR
 KHCLnp2akVpoftWmwiDgDgon7I+JLxcNKbL64wp+8rAHpFGm5g4rIWgEJkN0cjgr4mY7
 lFQNaMWatYJcUXTkKFKSwmXTbNEc6d7VeRdx1DbbfAThVk3T6CQTDvSc/yxDQyEM2jGZ
 jRAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WA7wcqap9FFSojyAIedMI2HkYd/yBUkUMbNf1qYRGDQ=;
 b=6xgPh3N2uW45Jj3Y4Iy+tgwxAUA4TWcuyVwJsMtqqhgooPqgLYsaVpCWz9/2JEq/AI
 MvtRaG/FaQGC+G8VDE04+yLZVtrXbGBSYMQTMPn1jDlcGWDssNv/Kz76/PQZdck89HrM
 oaon/RhZoZdKwGBTyBL63mY7hNZtuxVpCqY3ooatDb0oSgK8D13Hq41l5Kfi9qTFi3x3
 jJReuokJvsb/OfSiHTY6PC4u5ieFec4Yq7gggYyeWJMpibJGLU3ThNVdBbwriVyGS+xy
 ryEqqW+DDUEbIXhlQzfAxVy1Rqqft5ixt4V2OB9CoEsApXtg7toqyDZZCUnhuG1Rj96Y
 mlqg==
X-Gm-Message-State: ANoB5pnKzvU+5jJfJheKhna9MaQoHmVmKymOg9AWbMTcVmDYUm2RZ0nU
 TFCII2MJbX/y+iEyGiyoTdxnIA==
X-Google-Smtp-Source: AA0mqf6Jf0/+ltsRerqajN32SESPAarDvzpQCu/W4nX4wn56+27rFasS+QC5XNK+JMyEiI6Uf9n6/w==
X-Received: by 2002:a05:6512:128d:b0:4b4:b645:6303 with SMTP id
 u13-20020a056512128d00b004b4b6456303mr3117475lfs.475.1669194112270; 
 Wed, 23 Nov 2022 01:01:52 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 b17-20020a196451000000b00498f23c249dsm2779102lfj.74.2022.11.23.01.01.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Nov 2022 01:01:51 -0800 (PST)
Message-ID: <ac216c05-d939-0045-9a32-c874b584ee2d@linaro.org>
Date: Wed, 23 Nov 2022 10:01:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 4/5] arm64: dts: qcom: sm8450-hdk: Add LT9611uxc HDMI
 bridge
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20221122233659.3308175-1-dmitry.baryshkov@linaro.org>
 <20221122233659.3308175-5-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221122233659.3308175-5-dmitry.baryshkov@linaro.org>
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

On 23/11/2022 00:36, Dmitry Baryshkov wrote:
> From: Vinod Koul <vkoul@kernel.org>
> 
> Add the LT9611uxc DSI-HDMI bridge and supplies
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

> +
>  &sdhc_2 {
>  	cd-gpios = <&tlmm 92 GPIO_ACTIVE_HIGH>;
>  	pinctrl-names = "default", "sleep";
> @@ -431,6 +478,20 @@ &sdhc_2 {
>  &tlmm {
>  	gpio-reserved-ranges = <28 4>, <36 4>;
>  
> +	lt9611_irq_pin: lt9611-irq {

-state suffix

And test DTS against bindings (`make dtbs_check`).

> +		pins = "gpio44";
> +		function = "gpio";
> +		bias-disable;
> +	};
> +
> +	lt9611_rst_pin: lt9611-rst-state {
> +		pins = "gpio107";
> +		function = "normal";
> +
> +		output-high;
> +		input-disable;
> +	};
> +
>  	sdc2_card_det_n: sd-card-det-n-state {
>  		pins = "gpio92";
>  		function = "gpio";

Best regards,
Krzysztof

