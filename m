Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D495B0E0C
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 22:22:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66DB210E876;
	Wed,  7 Sep 2022 20:22:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2347610E873;
 Wed,  7 Sep 2022 20:21:57 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id
 q39-20020a056830442700b0063889adc0ddso11036748otv.1; 
 Wed, 07 Sep 2022 13:21:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=2U6d2Qid73yh3Rdnn6a6LubqffyglKVJNPUisWHqSUc=;
 b=gM/r0eHPNILxqVqgadAJ/mwJcI2fKN3fjEWuGhG3xrF3Yx2RPn89jRx70aBdE+8OwK
 Hzu34l9Vk9jM/6Q3I74FXYVpVrB+mGxAISnTZGLYJTNMupPedGshVmSZJVRGymbsvztB
 tXXBeK3PodVvGB+6TTnfHqHFa55mGRz9jnt/7MFZ7oNPbhhaSSdjhKI6W1DiJKYH7uhR
 +VyHCewiI4WTROd56Ab7yFvvyZKwmL3EH4noVo3zSeO+1AJjV57sc4YB8KVtSC0N7RU1
 ov5Az7ks3eYfrSHYG8dojdzYr95acIa2huBk27I4aijK803DhOKCjAqTMNFk7d/av34P
 GuaA==
X-Gm-Message-State: ACgBeo1lv8ife2moArdVAJFpwRW2RMFxF6Ll8wkdPxuAX+FQODllGmEy
 hyeChMggRNl7eqwal7lu4A==
X-Google-Smtp-Source: AA6agR5danNmNgoWoDE2ASwhAZyME3DY1WK0lLob6U5qZhvPEvqxt2Ob3ARjJ9IoOyfH0JkCqjMEBg==
X-Received: by 2002:a05:6830:2095:b0:638:f0eb:f44d with SMTP id
 y21-20020a056830209500b00638f0ebf44dmr2170081otq.288.1662582116245; 
 Wed, 07 Sep 2022 13:21:56 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 d132-20020aca368a000000b00342fc99c5cbsm6842958oia.54.2022.09.07.13.21.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Sep 2022 13:21:55 -0700 (PDT)
Received: (nullmailer pid 229841 invoked by uid 1000);
 Wed, 07 Sep 2022 20:21:55 -0000
Date: Wed, 7 Sep 2022 15:21:55 -0500
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v6 12/12] dt-bindings: display/msm: add support for the
 display on SM8250
Message-ID: <20220907202155.GA216714-robh@kernel.org>
References: <20220901102312.2005553-1-dmitry.baryshkov@linaro.org>
 <20220901102312.2005553-13-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220901102312.2005553-13-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, Loic Poulain <loic.poulain@linaro.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 01, 2022 at 01:23:12PM +0300, Dmitry Baryshkov wrote:
> Add DPU and MDSS schemas to describe MDSS and DPU blocks on the Qualcomm
> SM8250 platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/dpu-sm8250.yaml      |  96 ++++++++++++++++
>  .../bindings/display/msm/mdss-common.yaml     |   4 +-
>  .../bindings/display/msm/mdss-sm8250.yaml     | 106 ++++++++++++++++++
>  3 files changed, 204 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-sm8250.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/mdss-sm8250.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sm8250.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sm8250.yaml
> new file mode 100644
> index 000000000000..9bc2ee4a6589
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dpu-sm8250.yaml
> @@ -0,0 +1,96 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/dpu-sm8250.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Display DPU dt properties for SM8250

Qualcomm SM8250 Display DPU

> +
> +maintainers:
> +  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> +
> +description: |
> +  Device tree bindings for the DPU display controller for SM8250 target.

If you don't have more to say than the title, then just drop.

> +
> +allOf:
> +  - $ref: /schemas/display/msm/dpu-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: qcom,sm8250-dpu
> +
> +  reg:
> +    items:
> +      - description: Address offset and size for mdp register set
> +      - description: Address offset and size for vbif register set
> +
> +  reg-names:
> +    items:
> +      - const: mdp
> +      - const: vbif
> +
> +  clocks:
> +    items:
> +      - description: Display ahb clock
> +      - description: Display hf axi clock
> +      - description: Display core clock
> +      - description: Display vsync clock
> +
> +  clock-names:
> +    items:
> +      - const: iface
> +      - const: bus
> +      - const: core
> +      - const: vsync
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,dispcc-sm8250.h>
> +    #include <dt-bindings/clock/qcom,gcc-sm8250.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interconnect/qcom,sm8250.h>
> +    #include <dt-bindings/power/qcom-rpmpd.h>
> +
> +    display-controller@ae01000 {
> +      compatible = "qcom,sm8250-dpu";
> +      reg = <0x0ae01000 0x8f000>,
> +            <0x0aeb0000 0x2008>;
> +      reg-names = "mdp", "vbif";
> +
> +      clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +               <&gcc GCC_DISP_HF_AXI_CLK>,
> +               <&dispcc DISP_CC_MDSS_MDP_CLK>,
> +               <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> +      clock-names = "iface", "bus", "core", "vsync";
> +
> +      assigned-clocks = <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> +      assigned-clock-rates = <19200000>;
> +
> +      operating-points-v2 = <&mdp_opp_table>;
> +      power-domains = <&rpmhpd SM8250_MMCX>;
> +
> +      interrupt-parent = <&mdss>;
> +      interrupts = <0>;
> +
> +      ports {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        port@0 {
> +          reg = <0>;
> +          endpoint {
> +            remote-endpoint = <&dsi0_in>;
> +          };
> +        };
> +
> +        port@1 {
> +          reg = <1>;
> +          endpoint {
> +            remote-endpoint = <&dsi1_in>;
> +          };
> +        };
> +      };
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
> index 053c1e889552..a0a54cd63100 100644
> --- a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
> @@ -27,11 +27,11 @@ properties:
>  
>    clocks:
>      minItems: 2
> -    maxItems: 3
> +    maxItems: 4
>  
>    clock-names:
>      minItems: 2
> -    maxItems: 3
> +    maxItems: 4
>  
>    interrupts:
>      maxItems: 1
> diff --git a/Documentation/devicetree/bindings/display/msm/mdss-sm8250.yaml b/Documentation/devicetree/bindings/display/msm/mdss-sm8250.yaml
> new file mode 100644
> index 000000000000..d581d10fea2d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/mdss-sm8250.yaml
> @@ -0,0 +1,106 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/mdss-sm8250.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Display MDSS dt properties for SM8250 target

Same comment here.

> +
> +maintainers:
> +  - Krishna Manikandan <quic_mkrishn@quicinc.com>
> +
> +description: |
> +  Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
> +  sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
> +  bindings of MDSS are mentioned for SM8250 target.
> +
> +allOf:
> +  - $ref: /schemas/display/msm/mdss-common.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: qcom,sm8250-mdss
> +
> +  clocks:
> +    items:
> +      - description: Display AHB clock from gcc
> +      - description: Display hf axi clock
> +      - description: Display sf axi clock
> +      - description: Display core clock
> +
> +  clock-names:
> +    items:
> +      - const: iface
> +      - const: bus
> +      - const: nrt_bus
> +      - const: core
> +
> +  iommus:
> +    maxItems: 1
> +
> +  interconnects:
> +    maxItems: 2
> +
> +  interconnect-names:
> +    maxItems: 2
> +
> +patternProperties:
> +  "^display-controller@[0-9a-f]+$":
> +    type: object
> +    properties:
> +      compatible:
> +        const: qcom,sm8250-dpu
> +
> +  "^dsi@[0-9a-f]+$":
> +    type: object
> +    properties:
> +      compatible:
> +        const: qcom,mdss-dsi-ctrl
> +
> +  "^dsi-phy@[0-9a-f]+$":
> +    type: object
> +    properties:
> +      compatible:
> +        const: qcom,dsi-phy-7nm
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,dispcc-sm8250.h>
> +    #include <dt-bindings/clock/qcom,gcc-sm8250.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interconnect/qcom,sm8250.h>
> +    #include <dt-bindings/power/qcom-rpmpd.h>
> +
> +    display-subsystem@ae00000 {
> +      compatible = "qcom,sm8250-mdss";
> +      reg = <0x0ae00000 0x1000>;
> +      reg-names = "mdss";
> +
> +      interconnects = <&mmss_noc MASTER_MDP_PORT0 &mc_virt SLAVE_EBI_CH0>,
> +                      <&mmss_noc MASTER_MDP_PORT1 &mc_virt SLAVE_EBI_CH0>;
> +      interconnect-names = "mdp0-mem", "mdp1-mem";
> +
> +      power-domains = <&dispcc MDSS_GDSC>;
> +
> +      clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +               <&gcc GCC_DISP_HF_AXI_CLK>,
> +               <&gcc GCC_DISP_SF_AXI_CLK>,
> +               <&dispcc DISP_CC_MDSS_MDP_CLK>;
> +      clock-names = "iface", "bus", "nrt_bus", "core";
> +
> +      interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> +      interrupt-controller;
> +      #interrupt-cells = <1>;
> +
> +      iommus = <&apps_smmu 0x820 0x402>;
> +
> +      status = "disabled";

Drop

> +
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +      ranges;
> +    };
> +...
> -- 
> 2.35.1
> 
> 
