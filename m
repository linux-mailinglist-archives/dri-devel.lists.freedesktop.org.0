Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8D76BC68F
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 08:10:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 692FB10E09D;
	Thu, 16 Mar 2023 07:09:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D018F10EA5C
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 07:09:54 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id x13so3784148edd.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 00:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678950593;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7DskVPGyg4XTBFcAu4u2wBMvd2V9vUe35DTxUMiqKo0=;
 b=Oii4tgqhM1+uytgl/uCtxEcAltbCiuY08aN8SwZk4cCYRC1mtyU92yp6QGwJaMR+69
 r2LeC8f3Pnt7+BBfqEX0Y2mR0KYes6/bpYwuaVes44qLaD3Yoidm5RLYgytOqFqnS54E
 bbxVDZhcftxAPs9cr3DplBamx/puAjOIABbLZR2V4/pPwyR/ws8N73HBXb0YDIo9mne6
 twQQ15hw8kjf+UkJZZK4x30B+ItMvq+3k2a31brrxDdHF6Nznf1V++OM0ARYBboE03Nb
 7whTxyvSJnd9wCfPtHRV2Pp2tv+7/3l7SMhlI9SkFiSclryfcOuK3xxpB9l4zNyg17zw
 Wvcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678950593;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7DskVPGyg4XTBFcAu4u2wBMvd2V9vUe35DTxUMiqKo0=;
 b=3fSr+gUye5l9DCy69Y+f7COpw7pb/pK25UE4hfosT5Pqug7mqxC50GN08364JleaKD
 4qpIC1K1bl0JyOB8a4a8WmALCCWTVdkBDmmroMkSycNpQJlocddHQB21hPJRAw+KQeSN
 zdd8thVanROa1gMOlUfBP16mPDJ628BqBPp47/d4XY2uSxJVRHxPbQ0bWlwDomTgxbXR
 /+rb0LTIsKET1AZw4NS1MnZyaemtYuANclsxtgLczlNYeA73NJ6iqGp68WrZvh2ImDVX
 cMmPTLh5/s9yisVjKgcOMlJmzuPQbMv92P2/Mm6Y263Q9HzX1SQsHuTT31uveh8SdUHt
 GgUQ==
X-Gm-Message-State: AO0yUKUvKWxWyOU0h4yjN+c041lT3LHIeSjBlgbfyx1TFsU0Qn3CZA8t
 jbkEOsmOOtAbr8hoB5OsLB0bEw==
X-Google-Smtp-Source: AK7set8+NBsRtQMHynOv/FiocIqAaxXx01Y0YdEP/h944/7U8HpnrYGeH2MUJuKARg20j4XUNIwrZQ==
X-Received: by 2002:aa7:de82:0:b0:4fd:2b04:6e8b with SMTP id
 j2-20020aa7de82000000b004fd2b046e8bmr5524719edv.29.1678950593268; 
 Thu, 16 Mar 2023 00:09:53 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:9827:5f65:8269:a95f?
 ([2a02:810d:15c0:828:9827:5f65:8269:a95f])
 by smtp.gmail.com with ESMTPSA id
 e20-20020a50d4d4000000b004fbf6b35a56sm3363840edj.76.2023.03.16.00.09.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Mar 2023 00:09:52 -0700 (PDT)
Message-ID: <04f9336b-2a49-ca3f-fd28-1f04db78d2bd@linaro.org>
Date: Thu, 16 Mar 2023 08:09:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 02/14] dt-bindings: display/msm/gmu: Add GMU wrapper
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>
References: <20230223-topic-gmuwrapper-v4-0-e987eb79d03f@linaro.org>
 <20230223-topic-gmuwrapper-v4-2-e987eb79d03f@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v4-2-e987eb79d03f@linaro.org>
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
Cc: Rob Clark <robdclark@chromium.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/03/2023 16:28, Konrad Dybcio wrote:
> The "GMU Wrapper" is Qualcomm's name for "let's treat the GPU blocks
> we'd normally assign to the GMU as if they were a part of the GMU, even
> though they are not". It's a (good) software representation of the GMU_CX
> and GMU_GX register spaces within the GPUSS that helps us programatically
> treat these de-facto GMU-less parts in a way that's very similar to their
> GMU-equipped cousins, massively saving up on code duplication.
> 
> The "wrapper" register space was specifically designed to mimic the layout
> of a real GMU, though it rather obviously does not have the M3 core et al.
> 
> To sum it all up, the GMU wrapper is essentially a register space within
> the GPU, which Linux sees as a dumbed-down regular GMU: there's no clocks,
> interrupts, multiple reg spaces, iommus and OPP. Document it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/gmu.yaml       | 49 ++++++++++++++++------
>  1 file changed, 37 insertions(+), 12 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
> index ab14e81cb050..021373e686e1 100644
> --- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
> @@ -19,16 +19,18 @@ description: |
>  
>  properties:
>    compatible:
> -    items:
> -      - pattern: '^qcom,adreno-gmu-6[0-9][0-9]\.[0-9]$'
> -      - const: qcom,adreno-gmu
> +    oneOf:
> +      - items:
> +          - pattern: '^qcom,adreno-gmu-6[0-9][0-9]\.[0-9]$'
> +          - const: qcom,adreno-gmu
> +      - const: qcom,adreno-gmu-wrapper
>  
>    reg:
> -    minItems: 3
> +    minItems: 1
>      maxItems: 4
>  
>    reg-names:
> -    minItems: 3
> +    minItems: 1
>      maxItems: 4
>  
>    clocks:
> @@ -44,7 +46,6 @@ properties:
>        - description: GMU HFI interrupt
>        - description: GMU interrupt
>  
> -
>    interrupt-names:
>      items:
>        - const: hfi
> @@ -72,14 +73,8 @@ required:
>    - compatible
>    - reg
>    - reg-names
> -  - clocks
> -  - clock-names
> -  - interrupts
> -  - interrupt-names
>    - power-domains
>    - power-domain-names
> -  - iommus
> -  - operating-points-v2
>  
>  additionalProperties: false
>  
> @@ -216,6 +211,27 @@ allOf:
>              - const: cxo
>              - const: axi
>              - const: memnoc

Blank line (you added such between ifs in previous patch)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

