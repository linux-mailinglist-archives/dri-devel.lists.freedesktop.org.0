Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06495621129
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 13:43:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E109710E27C;
	Tue,  8 Nov 2022 12:43:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C74010E425
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 12:43:37 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id t10so20985554ljj.0
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Nov 2022 04:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=L7CgUpuOhO0bb1QuM22uaBQfdN8D1V8Stm51wZ3T8Gg=;
 b=LIsNsGwiOurmNx0OiaNbMbgKLGxxPZrE5Ef9wutqCgn7FlkzxjxESBTv3v5MOPksqR
 +bn6BF7a8oe/Z+zDgdYcAe4OYq7KpJBO3vw2hQS1Jg6YpZK1J2wu4sAoGAyJw6QiArTT
 87uHy2JAD/DMD0745o4HuGf024W0kcucak9yYExf7+v8aMEXIW5G1KZhI24FlN4lISC+
 f3dNPUor52xNTcG4+8WGROATKhFASFjr6G6F9q7MheigHNQ6HnovXw4Q1+3KB1OZEWjz
 cZsaxh/f/tZPNUavangu+lnQoyisMrN/paYt1HmbeyX5gM7EGH5GR0WuzCqGSQ75spx9
 0IBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=L7CgUpuOhO0bb1QuM22uaBQfdN8D1V8Stm51wZ3T8Gg=;
 b=p7CjqWTyVSafzFjPVVT9dLLgOlbz7xvUB4OHby9eG9bZ+7iuS9/2uHRt5hB7bEVmQA
 BZZ1bRlqZLXUe90PVATemP/2Neftd4dhOUwyEVdQpGqnfifn7hfsGDJE7ZLW7LdvLpIN
 1fq48AuW0/N9q3YjfFuNpqXlCMD9ITvDlG92ZmccrbvMgm7I9r9IRm7a5SdnF0Hb3uu9
 AmH8UYAJoSEcMLTbpS7GWRBJ8sl9IuqMnY5xA5A15zlUC+oG5z1O7szpTO72Cw1R4Zve
 fum7vzjtC56j0i7e7bZI5dj1fm6xGp7bk/BSoOnL507vfE4xLyVu5GtocqBy5yAPrXZ+
 3tmg==
X-Gm-Message-State: ACrzQf3zLjnn2YKIQzWFkipNMH/llOKM973jkP9GYakMs8rCLD4jPRgq
 9I7LeXZ1XXZBO/VkI//jnwXvcg==
X-Google-Smtp-Source: AMsMyM4plXmGbRfyztNmF+l3FkFcv6jZ3fAguBNi/YGBes4B3ZKtrI2nDy+X8O0NPJiI8DvlCweMoQ==
X-Received: by 2002:a2e:bcc5:0:b0:277:978:dae0 with SMTP id
 z5-20020a2ebcc5000000b002770978dae0mr7218782ljp.475.1667911415455; 
 Tue, 08 Nov 2022 04:43:35 -0800 (PST)
Received: from [10.27.10.248] ([195.165.23.90])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a056512114400b004b0a1e77cb6sm1765227lfg.139.2022.11.08.04.43.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Nov 2022 04:43:35 -0800 (PST)
Message-ID: <d10bf67c-c21c-5096-d774-ff924bf1dd41@linaro.org>
Date: Tue, 8 Nov 2022 15:43:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v2 08/18] dt-bindings: msm: dsi-controller-main: Document
 clocks on a per compatible basis
Content-Language: en-GB
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, krzysztof.kozlowski+dt@linaro.org,
 robh+dt@kernel.org, quic_mkrishn@quicinc.com, linux-arm-msm@vger.kernel.org
References: <20221107235654.1769462-1-bryan.odonoghue@linaro.org>
 <20221107235654.1769462-9-bryan.odonoghue@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221107235654.1769462-9-bryan.odonoghue@linaro.org>
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
Cc: Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/11/2022 02:56, Bryan O'Donoghue wrote:
> Each compatible has a different set of clocks which are associated with it.
> Add in the list of clocks for each compatible.
> 
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Sean Paul <sean@poorly.run>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   .../display/msm/dsi-controller-main.yaml      | 177 +++++++++++++++---
>   1 file changed, 150 insertions(+), 27 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> index 9db3e63acda3d..c975df0ca22fc 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> @@ -9,24 +9,22 @@ title: Qualcomm Display DSI controller
>   maintainers:
>     - Krishna Manikandan <quic_mkrishn@quicinc.com>
>   
> -allOf:
> -  - $ref: "../dsi-controller.yaml#"
> -
>   properties:
>     compatible:
> -    enum:
> -      - qcom,dsi-ctrl-6g-qcm2290
> -      - qcom,mdss-dsi-ctrl
> -      - qcom,mdss-dsi-ctrl-apq8064
> -      - qcom,mdss-dsi-ctrl-msm8916
> -      - qcom,mdss-dsi-ctrl-msm8974
> -      - qcom,mdss-dsi-ctrl-msm8996
> -      - qcom,mdss-dsi-ctrl-sc7180
> -      - qcom,mdss-dsi-ctrl-sc7280
> -      - qcom,mdss-dsi-ctrl-sdm630
> -      - qcom,mdss-dsi-ctrl-sdm660
> -      - qcom,mdss-dsi-ctrl-sdm845
> -      - qcom,mdss-dsi-ctrl-sm8250
> +    items:
> +      - enum:
> +          - qcom,dsi-ctrl-6g-qcm2290
> +          - qcom,mdss-dsi-ctrl-apq8064
> +          - qcom,mdss-dsi-ctrl-msm8916
> +          - qcom,mdss-dsi-ctrl-msm8974
> +          - qcom,mdss-dsi-ctrl-msm8996
> +          - qcom,mdss-dsi-ctrl-sc7180
> +          - qcom,mdss-dsi-ctrl-sc7280
> +          - qcom,mdss-dsi-ctrl-sdm630
> +          - qcom,mdss-dsi-ctrl-sdm660
> +          - qcom,mdss-dsi-ctrl-sdm845
> +          - qcom,mdss-dsi-ctrl-sm8250
> +      - const: qcom,mdss-dsi-ctrl

I'd prefer to have this part squashed into the previous patch.

>   
>     reg:
>       maxItems: 1
> @@ -51,17 +49,8 @@ properties:
>       minItems: 6
>   
>     clock-names:
> -    items:
> -      - const: byte
> -      - const: byte_intf
> -      - const: pixel
> -      - const: core
> -      - const: iface
> -      - const: bus
> -      - const: core_mmss
> -      - const: mdp_core
> -      - const: mnoc
>       minItems: 6
> +    maxItems: 9
>   
>     phys:
>       maxItems: 1
> @@ -169,6 +158,140 @@ required:
>     - vddio-supply
>     - vdda-supply
>   
> +allOf:
> +  - $ref: "../dsi-controller.yaml#"
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,mdss-dsi-ctrl-apq8064
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

Empty lines between clauses please.

> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,mdss-dsi-ctrl-msm8916
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
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,mdss-dsi-ctrl-msm8974
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 3
> +        clock-names:
> +          items:
> +            - const: iface
> +            - const: bus
> +            - const: vsync
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,mdss-dsi-ctrl-msm8996
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
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,mdss-dsi-ctrl-sc7180
> +              - qcom,mdss-dsi-ctrl-sc7280
> +              - qcom,mdss-dsi-ctrl-sm8250
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
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,mdss-dsi-ctrl-sdm630
> +              - qcom,mdss-dsi-ctrl-sdm660
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
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,mdss-dsi-ctrl-sdm845
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
>   additionalProperties: false
>   
>   examples:
> @@ -179,7 +302,7 @@ examples:
>        #include <dt-bindings/power/qcom-rpmpd.h>
>   
>        dsi@ae94000 {
> -           compatible = "qcom,mdss-dsi-ctrl";
> +           compatible = "qcom,mdss-dsi-ctrl-sc7180", "qcom,mdss-dsi-ctrl";
>              reg = <0x0ae94000 0x400>;
>              reg-names = "dsi_ctrl";
>   

-- 
With best wishes
Dmitry

