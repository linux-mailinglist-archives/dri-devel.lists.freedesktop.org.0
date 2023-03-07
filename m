Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 399926ADFAA
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 14:03:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E728C10E12B;
	Tue,  7 Mar 2023 13:03:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F069710E12B
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 13:03:33 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id n2so16918593lfb.12
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Mar 2023 05:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678194212;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cZoZqRwQw2mPc3FT0ESm5bliT9vqJS0eN0NPwlM2O8A=;
 b=pTy9zV+nSfUYfqM/1zfsNA0t4CUHRMxxHsKkxfQoYwxLAxrOH9YfPIm4Lsmwt5ss+X
 2cCgFSRChcRn/U685tiwcuHgct9/xjCGBJpXU4WkBCpNSllPMKtTkyuQsLt5NgDWHyCP
 Rqa6H828uYujPntAZqbg4nzRrLALhJEgrNktCyZHZ7/krKFBvS21bpPvjIFEUq/byghs
 Q4xpopy42X5jNXImmQjAwdGRv0AQi+eFWuUpygwstDdWR7FDQqhfkbwhl/NnwTRhYbd8
 PT9IFbhQyobWv/55dWbDQn8sSs9ud3u6sXUfI5XXUKXEHIib1gDlPuv7dFjF8HxqJB8X
 hTow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678194212;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cZoZqRwQw2mPc3FT0ESm5bliT9vqJS0eN0NPwlM2O8A=;
 b=lRdJBlPQJzRXUpA5CfMt2lK1E9xbo88iFWq0a6N9Mpe4rffTlJwKr9OE/HNgvU52XW
 MSK2nfuH53ORYv587a/VTWffk0oZVZvszAx4K2rQdc7Kqqx9Q+5SXOnXnB0n/GpNw9rS
 ZDomNyvbtwvQ4gG+NJ5kdMvaEKcfBc9K7oNaa/qWXcdotyBLyLO+NysjTlptk50TAKYu
 sE88bapP4jTpCe/hVF1AVoF+2VEtcggRnVVbHYZKdoGiO+LyVryNKnBzZq0RzHt7o1M4
 tNyNu7XK5Am3d+z/+FdVQjIVboHAVJ8mchQbhqGtQyZj3Fm5xk+loDl4DhZId8wj+ML6
 W7bA==
X-Gm-Message-State: AO0yUKXI77q+pkQlaSYse39wdeSiRxMJVy4hdQSA4y90IhQRvX7hDum+
 NNyxlK78BEgOJ5wzMOy2Z43i8A==
X-Google-Smtp-Source: AK7set9LdPVb1yvSjzZeatltLdpsSQ7CrahJHOhydl1P+RgMZzjzCdbBsNItb+4kmU2s/pfgkArhvg==
X-Received: by 2002:ac2:5103:0:b0:4db:3848:86af with SMTP id
 q3-20020ac25103000000b004db384886afmr3652367lfb.12.1678194212169; 
 Tue, 07 Mar 2023 05:03:32 -0800 (PST)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
 by smtp.gmail.com with ESMTPSA id
 t5-20020ac25485000000b004dc4b0a0543sm2021981lfk.58.2023.03.07.05.03.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 05:03:31 -0800 (PST)
Message-ID: <3dabf511-9d3a-0c9f-999e-35aeb3b48cf8@linaro.org>
Date: Tue, 7 Mar 2023 14:03:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 08/10] dt-bindings: display/msm: dsi-controller-main:
 Fix deprecated compatible
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Andy Gross
 <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>
References: <20230307-topic-dsi_qcm-v3-0-58c5c5e392ee@linaro.org>
 <20230307-topic-dsi_qcm-v3-8-58c5c5e392ee@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230307-topic-dsi_qcm-v3-8-58c5c5e392ee@linaro.org>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7.03.2023 14:01, Konrad Dybcio wrote:
> The point of the previous cleanup was to disallow "qcom,mdss-dsi-ctrl"
> alone. This however didn't quite work out and the property became
> undocumented instead of deprecated. Fix that.
> 
> Fixes: 0c0f65c6dd44 ("dt-bindings: msm: dsi-controller-main: Add compatible strings for every current SoC")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
This actually also got:

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> 
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

in https://lore.kernel.org/linux-arm-msm/20230304-topic-dsi_fixup-v3-0-b8565944d0e6@linaro.org/

but I only picked up trailers from the v2 of this series.. sorry about that..

Konrad
>  Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> index 2494817c1bd6..94f4cdf88c95 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> @@ -34,7 +34,7 @@ properties:
>        - items:
>            - enum:
>                - qcom,dsi-ctrl-6g-qcm2290
> -          - const: qcom,mdss-dsi-ctrl
> +              - qcom,mdss-dsi-ctrl # This should always come with an SoC-specific compatible
>          deprecated: true
>  
>    reg:
> 
