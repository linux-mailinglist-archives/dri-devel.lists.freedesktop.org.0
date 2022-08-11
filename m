Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2359A58F8FD
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 10:26:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9005A68DF;
	Thu, 11 Aug 2022 08:25:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E0559A651
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 08:25:37 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id w15so18607786ljw.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 01:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=E3DYBIoLfeLOkyJKxGqB277XbVTVlylmEyqrX+2n1PU=;
 b=kwIQPe6uwez+/w4ii7wDZKXLQSjekYFbFtoTXSGUrYbdg/in3iovurlPSELHPhqzfe
 t+F39hF4MkAMwmuhThw48f61F2snOf94rk2zly5OUzqWyVWz2/973mkOep2l8WPUbLr3
 pBjPkH9OFhnNgsH8Y34oQmddRlGPQHPCI9D2RJOJXM/lW380mRX1xwfVvlV/sFVZXD/8
 t9dfSCz2LsQUBvAet9jzZRl6wKxXFwBU/VArhLtiyPazj07wtLMZmEt+NHWammqcZ4x1
 UG67e0P71pIKPbdaLeQ9nrwhVzICOKCkCb4hZCuddxNST+dUebZM7jgIFuYzqpR8IjPQ
 fIsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=E3DYBIoLfeLOkyJKxGqB277XbVTVlylmEyqrX+2n1PU=;
 b=teYTooLVNA7LcfA7nVOctOIvyo3LdT6zqYPIjpHe6BD9TTtYmYDoehiFA7wtJLPigi
 qmb/vrNDBaETCLgmRZwleadsuHijjTTor+38uIMmR4Sus02UlxJcMME+Zu/nImDBs1sc
 w4E9h3asUyFUcNr8YI9rchwyskwTBVfxlnDi0NPloNa6Uk9lNY4PJfzmBuS+SutzWU2q
 Yx00JSwZscbUmBPT8ceHCw8JJkp/lmgzJAPJxmZ27mYmTtogKTVa0b4eFXlaP7vhZasP
 GLI03T6wr8iMRWDkkA2KMyTaJG9sQ/Z6whyobg/O/ic8zIum4+mOaCPCr23pvoTQ6aiS
 8xVw==
X-Gm-Message-State: ACgBeo0+NeBRaiGDytK5uOcPgleFuLV9qurJEkhy9zUXBsEZHodK4zQC
 tAUVttZGyRXwRW47oXyv6mbE5Q==
X-Google-Smtp-Source: AA6agR6pkNti9KxFRCrbdIYp/ANGyoY5fau7rgtkri+44sjR4dNy/Ucivd5YuXaYoiPwmtCauswR6A==
X-Received: by 2002:a05:651c:2120:b0:25e:5145:38b0 with SMTP id
 a32-20020a05651c212000b0025e514538b0mr10429398ljq.191.1660206335625; 
 Thu, 11 Aug 2022 01:25:35 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
 by smtp.gmail.com with ESMTPSA id
 v23-20020ac258f7000000b00489f0c8bddesm621501lfo.207.2022.08.11.01.25.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Aug 2022 01:25:35 -0700 (PDT)
Message-ID: <37bf0f7f-e555-7ae9-7d2b-e05a9e8db6a4@linaro.org>
Date: Thu, 11 Aug 2022 11:25:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 06/11] dt-bindings: display/msm: move qcom, sc7180-mdss
 schema to mdss.yaml
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220710090040.35193-1-dmitry.baryshkov@linaro.org>
 <20220710090040.35193-7-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220710090040.35193-7-dmitry.baryshkov@linaro.org>
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

On 10/07/2022 12:00, Dmitry Baryshkov wrote:
> Move schema for qcom,sc7180-mdss from dpu-sc7180.yaml to mdss.yaml so
> that the dpu file describes only the DPU schema.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/dpu-sc7180.yaml      | 149 +++++-------------
>  .../devicetree/bindings/display/msm/mdss.yaml |  45 +++++-
>  2 files changed, 80 insertions(+), 114 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
> index d3c3e4b07897..9d4ec0b60c25 100644
> --- a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
> @@ -10,151 +10,78 @@ maintainers:
>    - Krishna Manikandan <quic_mkrishn@quicinc.com>
>  
>  description: |
> -  Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
> -  sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
> -  bindings of MDSS and DPU are mentioned for SC7180 target.
> +  Device tree bindings for the DPU display controller for SC7180 target.
>  
>  properties:
>    compatible:
>      items:
> -      - const: qcom,sc7180-mdss
> +      - const: qcom,sc7180-dpu
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
> -      - description: Display AHB clock from dispcc
> +      - description: Display hf axi clock
> +      - description: Display ahb clock
> +      - description: Display rotator clock
> +      - description: Display lut clock
>        - description: Display core clock
> +      - description: Display vsync clock
>  
>    clock-names:
>      items:
> +      - const: bus
>        - const: iface
> -      - const: ahb
> +      - const: rot
> +      - const: lut
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
> -
> -  ranges: true
> -
> -  interconnects:
> -    items:
> -      - description: Interconnect path specifying the port ids for data bus
> -
> -  interconnect-names:
> -    const: mdp0-mem
> +  power-domains:
> +    maxItems: 1
>  
> -  resets:
> -    items:
> -      - description: MDSS_CORE reset
> +  operating-points-v2: true
>  
> -patternProperties:
> -  "^display-controller@[0-9a-f]+$":
> -    type: object
> -    description: Node containing the properties of DPU.
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
> -          - const: qcom,sc7180-dpu
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
> -          - description: Display hf axi clock
> -          - description: Display ahb clock
> -          - description: Display rotator clock
> -          - description: Display lut clock
> -          - description: Display core clock
> -          - description: Display vsync clock
> -
> -      clock-names:
> -        items:
> -          - const: bus
> -          - const: iface
> -          - const: rot
> -          - const: lut
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
> -
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
> -          port@2:
> -            $ref: /schemas/graph.yaml#/properties/port
> -            description: DPU_INTF0 (DP)
> -
> -        required:
> -          - port@0
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: DPU_INTF1 (DSI1)
> +
> +      port@2:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: DPU_INTF0 (DP)
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
> index 7d4ab3d71d2d..98f1f2501291 100644
> --- a/Documentation/devicetree/bindings/display/msm/mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/mdss.yaml
> @@ -17,6 +17,7 @@ description:
>  properties:
>    compatible:
>      enum:
> +      - qcom,sc7180-mdss
>        - qcom,sdm845-mdss
>        - qcom,mdss
>  
> @@ -64,20 +65,21 @@ properties:
>        - description: MDSS_CORE reset
>  
>    interconnects:
> -    minItems: 2
> +    minItems: 1
>      items:
>        - description: MDP port 0
>        - description: MDP port 1
>        - description: Rotator
>  
>    interconnect-names:
> -    minItems: 2
> +    minItems: 1
>      items:
>        - const: mdp0-mem
>        - const: mdp1-mem
>        - const: rotator-mem
>  
>    iommus:
> +    minItems: 1
>      items:
>        - description: Phandle to apps_smmu node with SID mask for Hard-Fail port0
>        - description: Phandle to apps_smmu node with SID mask for Hard-Fail port1
> @@ -129,9 +131,11 @@ allOf:
>              - const: mdss
>  
>          interconnects:
> +          minItems: 1
>            maxItems: 2
>  
>          interconnect-names:
> +          minItems: 1
>            maxItems: 2
>  
>        required:
> @@ -157,6 +161,29 @@ allOf:
>          iommus:
>            minItems: 2
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sc7180-mdss
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: Display AHB clock from gcc
> +            - description: Display AHB clock from dispcc
> +            - description: Display core clock
> +
> +        clock-names:
> +          items:
> +            - const: iface
> +            - const: ahb
> +            - const: core
> +
> +        iommus:
> +          maxItems: 1
> +
>  required:
>    - compatible
>    - reg
> @@ -177,7 +204,19 @@ patternProperties:
>      # TODO: add reference once the mdp5 is converted
>  
>    "^display-controller@(0|[1-9a-f][0-9a-f]*)$":
> -    $ref: dpu-sdm845.yaml
> +    oneOf:
> +      - $ref: dpu-sc7180.yaml
> +      - $ref: dpu-sdm845.yaml

I don't think this is good approach. These are strictly tied, so you
should have rather per SoC MDSS schema pulling in:
1. common MDSS
2. specific children schemas

This makes it quite obvious and specific. Your setup now allows putting
sc7180-dpu under sdm845-dpu.

Best regards,
Krzysztof
