Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2F75A0FB9
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 13:59:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2FFD113F55;
	Thu, 25 Aug 2022 11:59:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32514113A90
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 11:59:15 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id s6so16677539lfo.11
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 04:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=ft8kfdyaZSgF2yf1wj8tP6MEdPlZf5eOiQM/efyjVCg=;
 b=I3QavyDrYlsmL8vLvkGNHNXlRhkQH+JvIDYAEoC2GMCJ5MgPBlEpHxz6WczBPZh5rP
 MvR5dTotpy68o1L5S4w+wHiJhC+q1xCWblCLnlKWMFOxS+T1AnsUjCcSch/ip4xUkF6M
 gdhCfY+S96J/JgL2e4RhFKogNe6A59IRqwZ7wlBBdqp4MMGqmP7kHMr+6fIKr+Mz13Yb
 IzV1+RrnQi3pcPB6Lezi4blSaMb4t3F2M5UKuEVxVPWPHG3lY/4ncHsfOQRxU0kV7ec7
 v6XcZhEjHCcqRA9sduXJHPk6Nsmzm2SL1qOEVtNM2FvRb3Qt5fUljoLzw1zFXgTBSb/u
 Tfxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=ft8kfdyaZSgF2yf1wj8tP6MEdPlZf5eOiQM/efyjVCg=;
 b=rqCf0dDGV9S47iib2pXc1d8VonpfU1rnbQTAlo967Zsm07EhjtaMfirAuJrcVSjbKa
 wj647Ba8srtaPsDpjryHz8SpRDwivZPGUNg6FGhF05h4U9fzEV40nAquVGBTTExdXGyZ
 0KSegeYkrC5moI+8/WoyfjnFtAg3eBOH7t84xWkPdfBLQZOklnSwmT1PK1HSmKfsjT9Q
 olQnv54qR7KcqSFgZ8ROR96+/1z4I3zLaUdajrOLd/qVYY8PXXTw+FGdm1rAkKSGQy0V
 jL2kWM8h56hNNwnjo/8Itw9WoaxYoGR8q0mxiROxIkAdvYV3ZKcj+OGEj3U9EnG5FyVf
 BD+w==
X-Gm-Message-State: ACgBeo2tL8On1nexv87d8IgdCaK/zaPt76nGZ7HgxR73TvSVw3cFSwmL
 Cc5q+aKgW1i4tbYLk3iR2Lux1yPxnW9KcuRF3Kc=
X-Google-Smtp-Source: AA6agR43t4OeE5Os5aRTttwbEHGlwc/GvwBPDRzzJJznYatTfMzrdBSXIKdfoPo6CXkZIn/xg0ZnxA==
X-Received: by 2002:a05:6512:1156:b0:48a:fdea:520a with SMTP id
 m22-20020a056512115600b0048afdea520amr1141259lfg.138.1661428753541; 
 Thu, 25 Aug 2022 04:59:13 -0700 (PDT)
Received: from [192.168.0.71] (82.131.98.15.cable.starman.ee. [82.131.98.15])
 by smtp.gmail.com with ESMTPSA id
 i20-20020a196d14000000b00492d8a2de7dsm460733lfc.129.2022.08.25.04.59.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Aug 2022 04:59:12 -0700 (PDT)
Message-ID: <89c0f29c-abd1-0919-266e-f21c8e04434a@linaro.org>
Date: Thu, 25 Aug 2022 14:59:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v4 02/10] dt-bindings: display/msm: move qcom, sdm845-mdss
 schema to mdss.yaml
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220825095103.624891-1-dmitry.baryshkov@linaro.org>
 <20220825095103.624891-3-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220825095103.624891-3-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/08/2022 12:50, Dmitry Baryshkov wrote:
> Move schema for qcom,sdm845-mdss from dpu-sdm845.yaml to mdss.yaml so
> that the dpu file describes only the DPU schema.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/dpu-sdm845.yaml      | 135 +++------
>  .../devicetree/bindings/display/msm/mdss.yaml | 265 ++++++++++++++----

I still don't think this is better approach than what I proposed - to
have common MDSS schema used by several device-specific schemas (e.g.
sdm845-mdss.yaml or existing dpu-sdm845.yaml).

It's not only difficulty to review the patch but also to understand the
binding which grows huge.


>  2 files changed, 239 insertions(+), 161 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
> index 2bb8896beffc..2074e954372f 100644
> --- a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
> @@ -10,139 +10,74 @@ maintainers:
>    - Krishna Manikandan <quic_mkrishn@quicinc.com>
>  
>  description: |
> -  Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
> -  sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
> -  bindings of MDSS and DPU are mentioned for SDM845 target.
> +  Device tree bindings for the DPU display controller for SDM845 target.
>  
>  properties:
>    compatible:
>      items:
> -      - const: qcom,sdm845-mdss
> +      - const: qcom,sdm845-dpu
>  
>    reg:
> -    maxItems: 1
> +    items:
> +      - description: Address offset and size for mdp register set
> +      - description: Address offset and size for vbif register set
>  
>    reg-names:
> -    const: mdss
> -
> -  power-domains:
> -    maxItems: 1
> +    items:
> +      - const: mdp
> +      - const: vbif
>  
>    clocks:
>      items:
> -      - description: Display AHB clock from gcc
> +      - description: Display ahb clock
> +      - description: Display axi clock
>        - description: Display core clock
> +      - description: Display vsync clock
>  
>    clock-names:
>      items:
>        - const: iface
> +      - const: bus
>        - const: core
> +      - const: vsync
>  
>    interrupts:
>      maxItems: 1
>  
> -  interrupt-controller: true
> -
> -  "#address-cells": true
> -
> -  "#size-cells": true
> -
> -  "#interrupt-cells":
> -    const: 1
> -
> -  iommus:
> -    items:
> -      - description: Phandle to apps_smmu node with SID mask for Hard-Fail port0
> -      - description: Phandle to apps_smmu node with SID mask for Hard-Fail port1
> -
> -  ranges: true
> -
> -  resets:
> -    items:
> -      - description: MDSS_CORE reset
> +  power-domains:
> +    maxItems: 1
>  
> -patternProperties:
> -  "^display-controller@[0-9a-f]+$":
> -    type: object
> -    description: Node containing the properties of DPU.
> +  operating-points-v2: true
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    description: |
> +      Contains the list of output ports from DPU device. These ports
> +      connect to interfaces that are external to the DPU hardware,
> +      such as DSI, DP etc. Each output port contains an endpoint that
> +      describes how it is connected to an external interface.
>  
>      properties:
> -      compatible:
> -        items:
> -          - const: qcom,sdm845-dpu
> -
> -      reg:
> -        items:
> -          - description: Address offset and size for mdp register set
> -          - description: Address offset and size for vbif register set
> -
> -      reg-names:
> -        items:
> -          - const: mdp
> -          - const: vbif
> -
> -      clocks:
> -        items:
> -          - description: Display ahb clock
> -          - description: Display axi clock
> -          - description: Display core clock
> -          - description: Display vsync clock
> -
> -      clock-names:
> -        items:
> -          - const: iface
> -          - const: bus
> -          - const: core
> -          - const: vsync
> -
> -      interrupts:
> -        maxItems: 1
> -
> -      power-domains:
> -        maxItems: 1
> -
> -      operating-points-v2: true
> -      ports:
> -        $ref: /schemas/graph.yaml#/properties/ports
> -        description: |
> -          Contains the list of output ports from DPU device. These ports
> -          connect to interfaces that are external to the DPU hardware,
> -          such as DSI, DP etc. Each output port contains an endpoint that
> -          describes how it is connected to an external interface.
> -
> -        properties:
> -          port@0:
> -            $ref: /schemas/graph.yaml#/properties/port
> -            description: DPU_INTF1 (DSI1)
> -
> -          port@1:
> -            $ref: /schemas/graph.yaml#/properties/port
> -            description: DPU_INTF2 (DSI2)
> -
> -        required:
> -          - port@0
> -          - port@1
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: DPU_INTF1 (DSI1)
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: DPU_INTF2 (DSI2)
>  
>      required:
> -      - compatible
> -      - reg
> -      - reg-names
> -      - clocks
> -      - interrupts
> -      - power-domains
> -      - operating-points-v2
> -      - ports
> +      - port@0
> +      - port@1
>  
>  required:
>    - compatible
>    - reg
>    - reg-names
> -  - power-domains
>    - clocks
>    - interrupts
> -  - interrupt-controller
> -  - iommus
> -  - ranges
> +  - power-domains
> +  - operating-points-v2
> +  - ports
>  
>  additionalProperties: false
>  
> diff --git a/Documentation/devicetree/bindings/display/msm/mdss.yaml b/Documentation/devicetree/bindings/display/msm/mdss.yaml
> index afc48d2b02f1..ef4709d87004 100644
> --- a/Documentation/devicetree/bindings/display/msm/mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/mdss.yaml
> @@ -18,17 +18,15 @@ properties:
>    compatible:
>      enum:
>        - qcom,mdss
> +      - qcom,sdm845-mdss
>  
>    reg:
> -    minItems: 2
> +    minItems: 1
>      maxItems: 3
>  
>    reg-names:
> -    minItems: 2
> -    items:
> -      - const: mdss_phys
> -      - const: vbif_phys
> -      - const: vbif_nrt_phys
> +    minItems: 1
> +    maxItems: 3
>  
>    interrupts:
>      maxItems: 1
> @@ -53,10 +51,10 @@ properties:
>      maxItems: 4
>  
>    "#address-cells":
> -    const: 1
> +    enum: [1, 2]
>  
>    "#size-cells":
> -    const: 1
> +    enum: [1, 2]
>  
>    ranges:
>      true
> @@ -65,29 +63,178 @@ properties:
>      items:
>        - description: MDSS_CORE reset
>  
> -oneOf:
> -  - properties:
> -      clocks:
> -        minItems: 3
> -        maxItems: 4
> -
> -      clock-names:
> -        minItems: 3
> -        items:
> -          - const: iface
> -          - const: bus
> -          - const: vsync
> -          - const: core
> -  - properties:
> -      clocks:
> -        minItems: 1
> -        maxItems: 2
> -
> -      clock-names:
> -        minItems: 1
> -        items:
> -          - const: iface
> -          - const: core
> +  interconnects:
> +    minItems: 2
> +    items:
> +      - description: MDP port 0
> +      - description: MDP port 1
> +      - description: Rotator
> +
> +  interconnect-names:
> +    minItems: 2
> +    items:
> +      - const: mdp0-mem
> +      - const: mdp1-mem
> +      - const: rotator-mem

This was not allowed for qcom,mdss. Same with iommus.

Best regards,
Krzysztof
