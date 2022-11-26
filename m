Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 596A563969D
	for <lists+dri-devel@lfdr.de>; Sat, 26 Nov 2022 15:45:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40A4810E14E;
	Sat, 26 Nov 2022 14:44:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FC8A10E146
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Nov 2022 14:44:48 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id j2so5681794ljg.10
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Nov 2022 06:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=M3VFbb/urxLt4AAbODMiwaHIsutCiRetAeBhPsiZMY8=;
 b=lkK9tjAxY+rK64IySFXie0Pn7s+N3HzN3LSVyZNp1qk5LiWLHoS+D6aSmC4fzfLJMv
 e6aMj6VJLzj5YnZdIJNjGawiR1kQGYkGwtQqyaf29SnGNcLVZhEfi7GhnSI8Fxzt6FOw
 16QOCfwebHFOuOw9jkTkSQ1Lf5MkHB7Il+o8fGqyj9Mqtbn33TA3JsegGzs9Bsx5MQIi
 oyMKDPGqE1XbQkc5enMjVKMqDX5Kg1gZ8F52pETQQigqSIfB4fTQu2naTFqtV2eOTzJr
 yphXI7lfaf6Un7+dvfFj7P4cbWKKi9IQNscYMpo6dRLdtYp6XCeoc+NvLfiOfzfbA/1s
 FemQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=M3VFbb/urxLt4AAbODMiwaHIsutCiRetAeBhPsiZMY8=;
 b=UToSsbHTn0u6Dn9vpj5FE4tUeMzqkhLOXbRy6KW/2b/R3917PLUqUDRZRGvtRVKAEF
 7Alu1+txO7mhu4DvWfnGG0WKZbV8ho3xyHojLyBF2zL1+N2Sf3+4Ca0ABlNsAhaS2vvU
 V7LTD+8NPmlY6JNU0vfeAN/bgpcMmyi2a6tTQiex5P5HOmCN5LBpItR6mNlbD6qHCdrr
 DpV3YqJBA67gfO+e7xTK3et7HcbiYU15dLVmy5Eu674DU9j1/MNU3bd7VBcnljMdSEYL
 9QYnauIK+r6yrpcp4m2V5MPA3h6NWQCGZLkxoVi+VINA7C9kIvk+gr15wKyE4LvszuFd
 aehw==
X-Gm-Message-State: ANoB5pkrdcpMse6YJiVUomlqAkOIsfhvkWGx4+K1Z0+jJTb1FNPhSJb0
 qdUHX9Z/ooje1LmkeInrOtvN+A==
X-Google-Smtp-Source: AA0mqf51Yx6WqiwVxyoyJfkAFW7n7xuxrcH0IkvAg4nEpDeV4o2XHda6z9Todbe0a8B+WQn7pA7oRA==
X-Received: by 2002:a05:651c:12cb:b0:279:774e:dfe4 with SMTP id
 11-20020a05651c12cb00b00279774edfe4mr5969907lje.303.1669473886576; 
 Sat, 26 Nov 2022 06:44:46 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 b23-20020ac247f7000000b004aa95889063sm953784lfp.43.2022.11.26.06.44.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Nov 2022 06:44:46 -0800 (PST)
Message-ID: <fb3f9ad7-7b6f-fe22-8787-5bfa1d7caf05@linaro.org>
Date: Sat, 26 Nov 2022 15:44:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 05/18] dt-bindings: msm: dsi-controller-main: Document
 clocks on a per compatible basis
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <20221124004801.361232-1-bryan.odonoghue@linaro.org>
 <20221124004801.361232-6-bryan.odonoghue@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221124004801.361232-6-bryan.odonoghue@linaro.org>
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
Cc: dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 sean@poorly.run, andersson@kernel.org, konrad.dybcio@somainline.org,
 quic_abhinavk@quicinc.com, david@ixit.cz, dianders@chromium.org,
 robh+dt@kernel.org, agross@kernel.org, dmitry.baryshkov@linaro.org,
 swboyd@chromium.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/11/2022 01:47, Bryan O'Donoghue wrote:
> Each compatible has a different set of clocks which are associated with it.
> Add in the list of clocks for each compatible.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../display/msm/dsi-controller-main.yaml      | 154 ++++++++++++++++--
>  1 file changed, 143 insertions(+), 11 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> index c4da7179999d2..88aac7d33555c 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> @@ -9,9 +9,6 @@ title: Qualcomm Display DSI controller
>  maintainers:
>    - Krishna Manikandan <quic_mkrishn@quicinc.com>
>  
> -allOf:
> -  - $ref: "../dsi-controller.yaml#"
> -
>  properties:
>    compatible:
>      items:
> @@ -48,13 +45,8 @@ properties:
>        - description: Display AXI clock
>  
>    clock-names:
> -    items:
> -      - const: byte
> -      - const: byte_intf
> -      - const: pixel
> -      - const: core
> -      - const: iface
> -      - const: bus
> +    minItems: 6
> +    maxItems: 9
>  
>    phys:
>      maxItems: 1
> @@ -147,6 +139,146 @@ required:
>    - assigned-clock-parents
>    - ports
>  
> +allOf:
> +  - $ref: "../dsi-controller.yaml#"
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,apq8064-dsi-ctrl
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 7
> +        clock-names:
> +          items:
> +            - const: iface
> +            - const: bus
> +            - const: core_mmss
> +            - const: src
> +            - const: byte
> +            - const: pixel
> +            - const: core
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,msm8916-dsi-ctrl
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 6
> +        clock-names:
> +          items:
> +            - const: mdp_core
> +            - const: iface
> +            - const: bus
> +            - const: byte
> +            - const: pixel
> +            - const: core
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,msm8974-dsi-ctrl
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 3
> +        clock-names:
> +          items:
> +            - const: iface
> +            - const: bus
> +            - const: vsync

minItems are 6, so does it actually work?

> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,msm8996-dsi-ctrl
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 7
> +        clock-names:
> +          items:
> +            - const: mdp_core
> +            - const: byte
> +            - const: iface
> +            - const: bus
> +            - const: core_mmss
> +            - const: pixel
> +            - const: core
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sc7180-dsi-ctrl
> +              - qcom,sc7280-dsi-ctrl
> +              - qcom,sm8250-dsi-ctrl
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 6
> +        clock-names:
> +          items:
> +            - const: byte
> +            - const: byte_intf
> +            - const: pixel
> +            - const: core
> +            - const: iface
> +            - const: bus
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sdm630-dsi-ctrl
> +              - qcom,sdm660-dsi-ctrl
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 9
> +        clock-names:
> +          items:
> +            - const: mdp_core
> +            - const: byte
> +            - const: byte_intf
> +            - const: mnoc
> +            - const: iface
> +            - const: bus
> +            - const: core_mmss
> +            - const: pixel
> +            - const: core
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sdm845-dsi-ctrl
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 6
> +        clock-names:
> +          items:
> +            - const: byte
> +            - const: byte_intf
> +            - const: pixel
> +            - const: core
> +            - const: iface
> +            - const: bus
> +
>  additionalProperties: false
>  
>  examples:
> @@ -157,7 +289,7 @@ examples:
>       #include <dt-bindings/power/qcom-rpmpd.h>
>  
>       dsi@ae94000 {
> -           compatible = "qcom,mdss-dsi-ctrl";
> +           compatible = "qcom,sc7180-dsi-ctrl", "qcom,mdss-dsi-ctrl";

Not related to this patch.


Best regards,
Krzysztof

