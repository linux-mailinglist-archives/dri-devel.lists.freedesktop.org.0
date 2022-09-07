Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A3B5B0DEC
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 22:17:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98AA510E86A;
	Wed,  7 Sep 2022 20:16:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F38B510E869;
 Wed,  7 Sep 2022 20:16:48 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id
 br15-20020a056830390f00b0061c9d73b8bdso11007876otb.6; 
 Wed, 07 Sep 2022 13:16:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=enY4tvnb4NWmG+6LhXqvkCPl75t+GMfAhei7Lrc9BIA=;
 b=NE5FUamRb/z92JdPZCFwCUJaKBFFIcMK0eCLq0c1ebHz4e6+IIzGwKS2nCQJNBNCmP
 5MNeeQgwpiU94wJL6e/ROPiH/hL4zsb2k9IBgmhRm5OjQw0/XejuURQR34FVwVedftSG
 +7prPH5El08zRPt+t5UTjuu0BGr4nclyD8mvG8BV8USR8wPnqgRoO6G5vRSQtqxNtt5W
 FG8ip4RTctmRnuSq4DZpsvLynmGPsan1IXUKGY7bumEXO+1Zf+F1Tg20PfnAqpl7vlOm
 uXOcTmdclUtucevyaLVQnaqJ47RI8ndUe9ejimf5jGm5sWcvRXf6/iwia0fTE+i3t3mT
 V8CQ==
X-Gm-Message-State: ACgBeo0x22FaOO3IG0TG9kgBIF8zEI71F6ap4vgV9IezhktI2zxv2Hov
 1X0GCIkB6gq+5TGbPNyUQA==
X-Google-Smtp-Source: AA6agR6U7ArPByNqZmFMVwzNxkHK6UYi7zEi0MXlhoTyPURoRWU6GzZpa7Cz6NJrzd1b/VQJlnQeLg==
X-Received: by 2002:a9d:4814:0:b0:639:2e6c:d86e with SMTP id
 c20-20020a9d4814000000b006392e6cd86emr2220717otf.320.1662581807914; 
 Wed, 07 Sep 2022 13:16:47 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 w9-20020a056830280900b00638a1c49383sm7397726otu.78.2022.09.07.13.16.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Sep 2022 13:16:47 -0700 (PDT)
Received: (nullmailer pid 198119 invoked by uid 1000);
 Wed, 07 Sep 2022 20:16:46 -0000
Date: Wed, 7 Sep 2022 15:16:46 -0500
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v6 06/12] dt-bindings: display/msm: split dpu-sc7180 into
 DPU and MDSS parts
Message-ID: <20220907201646.GA119130-robh@kernel.org>
References: <20220901102312.2005553-1-dmitry.baryshkov@linaro.org>
 <20220901102312.2005553-7-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220901102312.2005553-7-dmitry.baryshkov@linaro.org>
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

On Thu, Sep 01, 2022 at 01:23:06PM +0300, Dmitry Baryshkov wrote:
> In order to make the schema more readable, split dpu-sc7180 into the DPU
> and MDSS parts, each one describing just a single device binding.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/dpu-sc7180.yaml      | 185 ++++++------------
>  .../bindings/display/msm/mdss-sc7180.yaml     |  85 ++++++++
>  2 files changed, 146 insertions(+), 124 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/mdss-sc7180.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
> index 47e74f78e939..0ed64fe065c2 100644
> --- a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
> @@ -9,81 +9,43 @@ title: Qualcomm Display DPU dt properties for SC7180 target
>  maintainers:
>    - Krishna Manikandan <quic_mkrishn@quicinc.com>
>  
> -description: |
> -  Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
> -  sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
> -  bindings of MDSS and DPU are mentioned for SC7180 target.
> +description: Device tree bindings for the SC7180 DPU display controller.

I assume this doesn't say anything more than the title, so just drop it.

>  
>  allOf:
> -  - $ref: /schemas/display/msm/mdss-common.yaml#
> +  - $ref: /schemas/display/msm/dpu-common.yaml#
>  
>  properties:
>    compatible:
>      items:
> -      - const: qcom,sc7180-mdss
> +      - const: qcom,sc7180-dpu
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
> -
> -  iommus:
> -    maxItems: 1
> -
> -  interconnects:
> -    maxItems: 1
> -
> -  interconnect-names:
> -    maxItems: 1
> -
> -patternProperties:
> -  "^display-controller@[0-9a-f]+$":
> -    type: object
> -    description: Node containing the properties of DPU.
> -    unevaluatedProperties: false
> -
> -    allOf:
> -      - $ref: /schemas/display/msm/dpu-common.yaml#
> -
> -    properties:
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
> +      - const: vsync
>  
>  unevaluatedProperties: false
>  
> @@ -91,71 +53,46 @@ examples:
>    - |
>      #include <dt-bindings/clock/qcom,dispcc-sc7180.h>
>      #include <dt-bindings/clock/qcom,gcc-sc7180.h>
> -    #include <dt-bindings/interrupt-controller/arm-gic.h>
> -    #include <dt-bindings/interconnect/qcom,sdm845.h>
>      #include <dt-bindings/power/qcom-rpmpd.h>
>  
> -    display-subsystem@ae00000 {
> -         #address-cells = <1>;
> -         #size-cells = <1>;
> -         compatible = "qcom,sc7180-mdss";
> -         reg = <0xae00000 0x1000>;
> -         reg-names = "mdss";
> -         power-domains = <&dispcc MDSS_GDSC>;
> -         clocks = <&gcc GCC_DISP_AHB_CLK>,
> -                  <&dispcc DISP_CC_MDSS_AHB_CLK>,
> -                  <&dispcc DISP_CC_MDSS_MDP_CLK>;
> -         clock-names = "iface", "ahb", "core";
> -
> -         interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> -         interrupt-controller;
> -         #interrupt-cells = <1>;
> -
> -         interconnects = <&mmss_noc MASTER_MDP0 &mc_virt SLAVE_EBI1>;
> -         interconnect-names = "mdp0-mem";
> -
> -         iommus = <&apps_smmu 0x800 0x2>;
> -         ranges;
> -
> -         display-controller@ae01000 {
> -                   compatible = "qcom,sc7180-dpu";
> -                   reg = <0x0ae01000 0x8f000>,
> -                         <0x0aeb0000 0x2008>;
> -
> -                   reg-names = "mdp", "vbif";
> -
> -                   clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
> -                            <&dispcc DISP_CC_MDSS_AHB_CLK>,
> -                            <&dispcc DISP_CC_MDSS_ROT_CLK>,
> -                            <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
> -                            <&dispcc DISP_CC_MDSS_MDP_CLK>,
> -                            <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> -                   clock-names = "bus", "iface", "rot", "lut", "core",
> -                                 "vsync";
> -
> -                   interrupt-parent = <&mdss>;
> -                   interrupts = <0>;
> -                   power-domains = <&rpmhpd SC7180_CX>;
> -                   operating-points-v2 = <&mdp_opp_table>;
> -
> -                   ports {
> -                           #address-cells = <1>;
> -                           #size-cells = <0>;
> -
> -                           port@0 {
> -                                   reg = <0>;
> -                                   dpu_intf1_out: endpoint {
> -                                                  remote-endpoint = <&dsi0_in>;
> -                                   };
> -                           };
> -
> -                            port@2 {
> -                                    reg = <2>;
> -                                    dpu_intf0_out: endpoint {
> -                                                   remote-endpoint = <&dp_in>;
> -                                    };
> -                            };
> -                   };
> -         };
> +    display-controller@ae01000 {
> +               compatible = "qcom,sc7180-dpu";
> +               reg = <0x0ae01000 0x8f000>,
> +                     <0x0aeb0000 0x2008>;
> +
> +               reg-names = "mdp", "vbif";
> +
> +               clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
> +                        <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                        <&dispcc DISP_CC_MDSS_ROT_CLK>,
> +                        <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
> +                        <&dispcc DISP_CC_MDSS_MDP_CLK>,
> +                        <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> +               clock-names = "bus", "iface", "rot", "lut", "core",
> +                             "vsync";
> +
> +               interrupt-parent = <&mdss>;
> +               interrupts = <0>;
> +               power-domains = <&rpmhpd SC7180_CX>;
> +               operating-points-v2 = <&mdp_opp_table>;
> +
> +               ports {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +
> +                       port@0 {
> +                               reg = <0>;
> +                               dpu_intf1_out: endpoint {
> +                                              remote-endpoint = <&dsi0_in>;
> +                               };
> +                       };
> +
> +                        port@2 {
> +                                reg = <2>;
> +                                dpu_intf0_out: endpoint {
> +                                               remote-endpoint = <&dp_in>;
> +                                };
> +                        };
> +               };
>      };
>  ...
> diff --git a/Documentation/devicetree/bindings/display/msm/mdss-sc7180.yaml b/Documentation/devicetree/bindings/display/msm/mdss-sc7180.yaml
> new file mode 100644
> index 000000000000..27d944f0e471
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/mdss-sc7180.yaml

The preferred naming is using the compatible: qcom,sc7180-mdss.yaml

> @@ -0,0 +1,85 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/mdss-sc7180.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Display MDSS dt properties for SC7180 target

Qualcomm SC7180 Display MDSS

> +
> +maintainers:
> +  - Krishna Manikandan <quic_mkrishn@quicinc.com>
> +
> +description: |
> +  Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
> +  sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
> +  bindings of MDSS are mentioned for SC7180 target.
> +
> +allOf:
> +  - $ref: /schemas/display/msm/mdss-common.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: qcom,sc7180-mdss
> +
> +  clocks:
> +    items:
> +      - description: Display AHB clock from gcc
> +      - description: Display AHB clock from dispcc
> +      - description: Display core clock
> +
> +  clock-names:
> +    items:
> +      - const: iface
> +      - const: ahb
> +      - const: core
> +
> +  iommus:
> +    maxItems: 1
> +
> +  interconnects:
> +    maxItems: 1
> +
> +  interconnect-names:
> +    maxItems: 1
> +
> +patternProperties:
> +  "^display-controller@[0-9a-f]+$":
> +    type: object
> +    properties:
> +      compatible:
> +        const: qcom,sc7180-dpu
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,dispcc-sc7180.h>
> +    #include <dt-bindings/clock/qcom,gcc-sc7180.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interconnect/qcom,sdm845.h>
> +    #include <dt-bindings/power/qcom-rpmpd.h>
> +
> +    display-subsystem@ae00000 {
> +         #address-cells = <1>;
> +         #size-cells = <1>;
> +         compatible = "qcom,sc7180-mdss";
> +         reg = <0xae00000 0x1000>;
> +         reg-names = "mdss";
> +         power-domains = <&dispcc MDSS_GDSC>;
> +         clocks = <&gcc GCC_DISP_AHB_CLK>,
> +                  <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                  <&dispcc DISP_CC_MDSS_MDP_CLK>;
> +         clock-names = "iface", "ahb", "core";
> +
> +         interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> +         interrupt-controller;
> +         #interrupt-cells = <1>;
> +
> +         interconnects = <&mmss_noc MASTER_MDP0 &mc_virt SLAVE_EBI1>;
> +         interconnect-names = "mdp0-mem";
> +
> +         iommus = <&apps_smmu 0x800 0x2>;
> +         ranges;
> +    };
> +...
> -- 
> 2.35.1
> 
> 
