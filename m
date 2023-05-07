Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 290826F9783
	for <lists+dri-devel@lfdr.de>; Sun,  7 May 2023 10:14:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A03110E143;
	Sun,  7 May 2023 08:14:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70C7110E143
 for <dri-devel@lists.freedesktop.org>; Sun,  7 May 2023 08:14:41 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-50bc3a2d333so5173922a12.0
 for <dri-devel@lists.freedesktop.org>; Sun, 07 May 2023 01:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683447279; x=1686039279;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BxVB0qLFtd7CR9jihrYp0GNvnYgnGOXU77sZFAD78Ko=;
 b=lQ8wbMLMxVi1VNeZmvEyGYzKpbgaxtJnY28HvxU+BEBpZ8FeBnSDRICXtW3enFRIZA
 pr/+2Dbc42LGRxoVvPzwJ5MB2NCNxi6pnP6yDOw5nkjObjBpevlnW9dKBoPn/K1SXCNT
 pkhW5N+8wz+VhFeGfFiIIRLNp+7qS/lEHO9IdaIr/LJt5W3vVc/ac9xyDy6bHIbnAhwP
 LPOExGfZozKbRdkDhUGQScJcMXCnWvVSJKZIfus1RCMuOw9jTFa5bLdAwgZ0XGBmXNHJ
 7Po5KPeAc60TPxTfQhevXE2pqJwaxwip5zQNhfxwMTO9LZDKT9D1zxUgiob69Al82Kcc
 JqLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683447279; x=1686039279;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BxVB0qLFtd7CR9jihrYp0GNvnYgnGOXU77sZFAD78Ko=;
 b=h/8rjPUYXiR2uOJjW2XcfWCvm+OEZVr+m96YgDG2r8dHrO1rmLJ86BNRXd+3k/aZ8B
 j5YAz9zL89vs+WC0GWMK0Qh5N4s2Pg15X0xjXaLzKCxesAPP62jb9uiWUWzrBuPwKjEe
 HLMszN2xNj/1KK8wqMWuLFx1aUTGX6NAfMnZ87zlE73j2QPjpj1l6Im36D+iKc5ZOhRc
 6bkrEDLd+Z/43kTxTMbCpG5jGR+qc34z03ib61y4BeVRZFi56H9JBt8xFUswmceT4iAM
 AkajgI/lSH75VdlMZs5NlCpVTdZrr1c9JGxqBuMNYrvhsb5VczLuolLJPikEkPrL2Kpd
 BF7g==
X-Gm-Message-State: AC+VfDzSIW2m4Idm89R5LxFxAUhyfVFTELtY9Rw1O3F5pNq90AmLDEAu
 YGAnaQe3Ag4PTEo5ctRN2UPbxw==
X-Google-Smtp-Source: ACHHUZ6ylY1jyYRHzSyEND1iTejr0FcmzoLeOjgWmgkYfOXU4kIRdEKQmFEebU76i+rY1fPhrd2i9Q==
X-Received: by 2002:a17:907:9444:b0:966:5730:c3fe with SMTP id
 dl4-20020a170907944400b009665730c3femr377381ejc.52.1683447279207; 
 Sun, 07 May 2023 01:14:39 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:183b:950f:b4d5:135a?
 ([2a02:810d:15c0:828:183b:950f:b4d5:135a])
 by smtp.gmail.com with ESMTPSA id
 h13-20020a1709070b0d00b0094efdfe60dcsm3287860ejl.206.2023.05.07.01.14.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 May 2023 01:14:38 -0700 (PDT)
Message-ID: <31147c6d-e77a-8abd-0b55-73ead2385bb9@linaro.org>
Date: Sun, 7 May 2023 10:14:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v3 03/12] dt-bindings: display/msm: sc7180-dpu: Describe
 SM6350 and SM6375
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Will Deacon
 <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>
References: <20230411-topic-straitlagoon_mdss-v3-0-9837d6b3516d@linaro.org>
 <20230411-topic-straitlagoon_mdss-v3-3-9837d6b3516d@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230411-topic-straitlagoon_mdss-v3-3-9837d6b3516d@linaro.org>
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
 iommu@lists.linux.dev, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05/05/2023 23:40, Konrad Dybcio wrote:
> SC7180, SM6350 and SM6375 use a rather similar hw setup for DPU, with
> the main exception being that the last one requires an additional
> throttle clock.
> 
> It is not well understood yet, but failing to toggle it on makes the
> display hardware stall and not output any frames.
> 
> Document SM6350 and SM6375 DPU.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  .../bindings/display/msm/qcom,sc7180-dpu.yaml      | 23 +++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml
> index 1fb8321d9ee8..630b11480496 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml
> @@ -13,7 +13,10 @@ $ref: /schemas/display/msm/dpu-common.yaml#
>  
>  properties:
>    compatible:
> -    const: qcom,sc7180-dpu
> +    enum:
> +      - qcom,sc7180-dpu
> +      - qcom,sm6350-dpu
> +      - qcom,sm6375-dpu
>  
>    reg:
>      items:
> @@ -26,6 +29,7 @@ properties:
>        - const: vbif
>  
>    clocks:
> +    minItems: 6
>      items:
>        - description: Display hf axi clock
>        - description: Display ahb clock
> @@ -33,8 +37,10 @@ properties:
>        - description: Display lut clock
>        - description: Display core clock
>        - description: Display vsync clock
> +      - description: Display core throttle clock
>  
>    clock-names:
> +    minItems: 6
>      items:
>        - const: bus
>        - const: iface
> @@ -42,6 +48,7 @@ properties:
>        - const: lut
>        - const: core
>        - const: vsync
> +      - const: throttle
>  
>  required:
>    - compatible
> @@ -52,6 +59,20 @@ required:
>  
>  unevaluatedProperties: false
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          const: qcom,sm6375-dpu

And the two other variants? Is the clock valid there or not? If not
really, then you should have else: with maxItems: 6.

> +
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 7
> +
> +        clock-names:
> +          minItems: 7

If there is going new version - put allOf: before
unevaluatedProperties:. Otherwise it is fine.

> +
>  examples:
>    - |
>      #include <dt-bindings/clock/qcom,dispcc-sc7180.h>
> 

Best regards,
Krzysztof

