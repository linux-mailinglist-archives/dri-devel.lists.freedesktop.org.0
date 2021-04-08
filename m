Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBBB358701
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 16:20:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5883E6EB09;
	Thu,  8 Apr 2021 14:20:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
 [209.85.210.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E90506EB08;
 Thu,  8 Apr 2021 14:20:06 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id
 h6-20020a0568300346b02901b71a850ab4so2427592ote.6; 
 Thu, 08 Apr 2021 07:20:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dO3c7HcvFdxwQhTgm/kx2RcQUrU9sSiuEhd35tzB1sE=;
 b=BO+EAUYuOygHqa0BtG5KokaQG+Rr66wR6hDk02JOzayxtC1RYk6Aqi3NcTJkodCQ9j
 4Qqgw66FGfX3SIZKtDEqE+ijY6dVFk4Sdf9hdfPs9fzDUDDXBQSB2EBszM+S2xlwCveX
 RbhOUlI0cOTnaVcKMplmtIkwrOZ+o7IZ6ITkzhfmYRE4DgHLNefIpLpLz0ovtLOyxXxs
 dTdOtRpFJz28Pj62pPwTm2PWS46EJMfqK1O7vuErSsqKX5dyCJq4/G64cJVLtGOUB9Cm
 591jWz2lokeOc0ksX4Q9U+ysQEyzE4ZJcFmGDOseUUsj9Qv+V8Vv2Q2n0/EnB8JIb9ZX
 V4Tw==
X-Gm-Message-State: AOAM533FhW1+/oKoGHmxrI1NZnt8E4KqerMbyCrb8Npw7QIhMA72O6Gi
 laDWAk5IA6482crDHjsq8A==
X-Google-Smtp-Source: ABdhPJxvwlxGNrvO5XwpWGDUvhHISvzJ/ALR0ZEF1Vso8Wvmn2iCZBKz/RybVgUg3m1CyDOFZnhjwQ==
X-Received: by 2002:a9d:6c52:: with SMTP id g18mr7555035otq.29.1617891604682; 
 Thu, 08 Apr 2021 07:20:04 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 24sm4815782oiq.11.2021.04.08.07.20.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 07:20:03 -0700 (PDT)
Received: (nullmailer pid 1428662 invoked by uid 1000);
 Thu, 08 Apr 2021 14:20:02 -0000
Date: Thu, 8 Apr 2021 09:20:02 -0500
From: Rob Herring <robh@kernel.org>
To: Krishna Manikandan <mkrishn@codeaurora.org>
Subject: Re: [PATCH v15 1/4] dt-bindings: msm: disp: add yaml schemas for DPU
 bindings
Message-ID: <20210408142002.GA1409100@robh.at.kernel.org>
References: <1617620770-26202-1-git-send-email-mkrishn@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1617620770-26202-1-git-send-email-mkrishn@codeaurora.org>
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
Cc: sean@poorly.run, devicetree@vger.kernel.org, dianders@chromium.org,
 vinod.koul@linaro.org, linux-arm-msm@vger.kernel.org, abhinavk@codeaurora.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, khsieh@codeaurora.org, tanmay@codeaurora.org,
 kalyan_t@codeaurora.org, bjorn.andersson@linaro.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 05, 2021 at 04:36:07PM +0530, Krishna Manikandan wrote:
> MSM Mobile Display Subsytem (MDSS) encapsulates sub-blocks
> like DPU display controller, DSI etc. Add YAML schema
> for DPU device tree bindings.
> 
> Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
> 
> Changes in v2:
>     - Changed dpu to DPU (Sam Ravnborg)
>     - Fixed indentation issues (Sam Ravnborg)
>     - Added empty line between different properties (Sam Ravnborg)
>     - Replaced reference txt files with  their corresponding
>       yaml files (Sam Ravnborg)
>     - Modified the file to use "|" only when it is
>       necessary (Sam Ravnborg)
> 
> Changes in v3:
>     - Corrected the license used (Rob Herring)
>     - Added maxItems for properties (Rob Herring)
>     - Dropped generic descriptions (Rob Herring)
>     - Added ranges property (Rob Herring)
>     - Corrected the indendation (Rob Herring)
>     - Added additionalProperties (Rob Herring)
>     - Split dsi file into two, one for dsi controller
>       and another one for dsi phy per target (Rob Herring)
>     - Corrected description for pinctrl-names (Rob Herring)
>     - Corrected the examples used in yaml file (Rob Herring)
>     - Delete dsi.txt and dpu.txt (Rob Herring)
> 
> Changes in v4:
>     - Move schema up by one level (Rob Herring)
>     - Add patternProperties for mdp node (Rob Herring)
>     - Corrected description of some properties (Rob Herring)
> 
> Changes in v5:
>     - Correct the indentation (Rob Herring)
>     - Remove unnecessary description from properties (Rob Herring)
>     - Correct the number of interconnect entries (Rob Herring)
>     - Add interconnect names for sc7180 (Rob Herring)
>     - Add description for ports (Rob Herring)
>     - Remove common properties (Rob Herring)
>     - Add unevalutatedProperties (Rob Herring)
>     - Reference existing dsi controller yaml in the common
>       dsi controller file (Rob Herring)
>     - Correct the description of clock names to include only the
>       clocks that are required (Rob Herring)
>     - Remove properties which are already covered under the common
>       binding (Rob Herring)
>     - Add dsi phy supply nodes which are required for sc7180 and
>       sdm845 targets (Rob Herring)
>     - Add type ref for syscon-sfpb (Rob Herring)
> 
> Changes in v6:
>     - Fixed errors during dt_binding_check (Rob Herring)
>     - Add maxItems for phys and phys-names (Rob Herring)
>     - Use unevaluatedProperties wherever required (Rob Herring)
>     - Removed interrupt controller from required properties for
>       dsi controller (Rob Herring)
>     - Add constraints for dsi-phy reg-names based on the compatible
>       phy version (Rob Herring)
>     - Add constraints for dsi-phy supply nodes based on the
>       compatible phy version (Rob Herring)
> 
> Changes in v7:
>     - Add default value for qcom,mdss-mdp-transfer-time-us (Rob Herring)
>     - Modify the schema for data-lanes (Rob Herring)
>     - Split the phy schema into separate schemas based on
>       the phy version (Rob Herring)
> 
> Changes in v8:
>     - Resolve merge conflicts with latest dsi.txt file
>     - Include dp yaml change also in the same series
> 
> Changes in v9:
>     - Combine target specific dsi controller yaml files
>       to a single yaml file (Rob Herring)
>     - Combine target specific dsi phy yaml files into a
>       single yaml file (Rob Herring)
>     - Use unevaluatedProperties and additionalProperties
>       wherever required
>     - Remove duplicate properties from common yaml files
> 
> Changes in v10:
>     - Split the patch into separate patches for DPU, DSI and
>       PHY (Stephen Boyd)
>     - Drop unnecessary fullstop (Stephen Boyd)
>     - Add newline whereever required (Stephen Boyd)
>     - Add description for clock used (Stephen Boyd)
>     - Modify the description for interconnect entries  (Stephen Boyd)
>     - Drop assigned clock entries as it a generic property (Stephen Boyd)
>     - Correct the definition for interrupts (Stephen Boyd)
>     - Drop clock names from required properties (Stephen Boyd)
>     - Drop labels for display nodes from example (Stephen Boyd)
>     - Drop flags from interrupts entries (Stephen Boyd)
> 
> Changes in v11:
>     - Drop maxItems for clocks (Stephen Boyd)
> 
> Changes in v12:
>     - Add description for register property (Stephen Boyd)
>     - Add maxItems for interrupts (Stephen Boyd)
>     - Add description for iommus property (Stephen Boyd)
>     - Add description for interconnects (Stephen Boyd)
>     - Change display node name to display_controller (Stephen Boyd)
> 
> Changes in v13:
>     - Add maxItems for reg property (Stephen Boyd)
>     - Add ranges property in example (Stephen Boyd)
>     - Modify description for iommus property (Stephen Boyd)
>     - Add Dp bindings for ports in the same patch (Stephen Boyd)
>     - Remove soc from examples and change address and size cells
>       accordingly (Stephen Boyd)
>     - Add reference for ports
> 
> Changes in v14:
>     - Modify title for SC7180 and SDM845 yaml files (Stephen Boyd)
>     - Add required list for display-controller node (Stephen Boyd)
>     - Rename mdss node name to display-subsytem (Stephen Boyd)

I know the DRM maintainers like revision history in the commit, but I 
think it's pretty pointless in this case. It's *just* a conversion. 

> ---
>  .../bindings/display/msm/dpu-sc7180.yaml           | 215 +++++++++++++++++++++
>  .../bindings/display/msm/dpu-sdm845.yaml           | 196 +++++++++++++++++++
>  .../devicetree/bindings/display/msm/dpu.txt        | 141 --------------
>  3 files changed, 411 insertions(+), 141 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/msm/dpu.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
> new file mode 100644
> index 0000000..36531a5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
> @@ -0,0 +1,215 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Display DPU dt properties for SC7180 target
> +
> +maintainers:
> +  - Krishna Manikandan <mkrishn@codeaurora.org>
> +
> +description: |
> +  Device tree bindings for MSM Mobile Display Subsytem(MDSS) that encapsulates
> +  sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
> +  bindings of MDSS and DPU are mentioned for SC7180 target.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: qcom,sc7180-mdss
> +
> +  reg:
> +    maxItems: 1
> +
> +  reg-names:
> +    const: mdss
> +
> +  power-domains:
> +    maxItems: 1
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
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 1
> +
> +  iommus:
> +    items:
> +      - description: Phandle to apps_smmu node with SID mask for Hard-Fail port0
> +
> +  ranges: true
> +
> +  interconnects:
> +    items:
> +      - description: Interconnect path specifying the port ids for data bus
> +
> +  interconnect-names:
> +    const: mdp0-mem
> +
> +patternProperties:
> +  "^display-controller@[0-9a-f]+$":
> +    type: object
> +    description: Node containing the properties of DPU.
> +
> +    properties:
> +      compatible:
> +        items:
> +          - const: qcom,sc7180-dpu
> +
> +      reg:
> +        items:
> +          - description: Address offset and size for mdp register set
> +          - description: Address offset and size for vbif register set
> +
> +      reg-names:
> +        items:
> +          - const: mdp
> +          - const: vbif
> +
> +      clocks:
> +        items:
> +          - description: Display hf axi clock
> +          - description: Display ahb clock
> +          - description: Display rotator clock
> +          - description: Display lut clock
> +          - description: Display core clock
> +          - description: Display vsync clock
> +
> +      clock-names:
> +        items:
> +          - const: bus
> +          - const: iface
> +          - const: rot
> +          - const: lut
> +          - const: core
> +          - const: vsync
> +
> +      interrupts:
> +        maxItems: 1
> +
> +      ports:
> +        $ref: /schemas/graph.yaml#/properties/port

s/port/ports/

> +        type: object

Don't need this.

> +        description: |
> +          Contains the list of output ports from DPU device. These ports
> +          connect to interfaces that are external to the DPU hardware,
> +          such as DSI, DP etc. Each output port contains an endpoint that
> +          describes how it is connected to an external interface.
> +
> +        properties:
> +          port@0:
> +            type: object

Drop 'type' and add:

$ref: /schemas/graph.yaml#/properties/port

> +            description: DPU_INTF1 (DSI1)
> +
> +          port@1:
> +            type: object

And here.

> +            description: DPU_INTF2 (DSI2)

blank line

> +          port@2:
> +            type: object

And here.

> +            description: DPU_INTF0 (DP)
> +

All the port nodes are optional?

> +    required:
> +      - compatible
> +      - reg
> +      - reg-names
> +      - clocks
> +      - interrupts
> +      - ports
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - power-domains
> +  - clocks
> +  - interrupts
> +  - interrupt-controller
> +  - iommus
> +  - ranges
> +
> +additionalProperties: true

This should be false.

> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,dispcc-sc7180.h>
> +    #include <dt-bindings/clock/qcom,gcc-sc7180.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interconnect/qcom,sdm845.h>
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
> +
> +         display-controller@ae01000 {
> +                   compatible = "qcom,sc7180-dpu";
> +                   reg = <0x0ae01000 0x8f000>,
> +                         <0x0aeb0000 0x2008>;
> +
> +                   reg-names = "mdp", "vbif";
> +
> +                   clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
> +                            <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                            <&dispcc DISP_CC_MDSS_ROT_CLK>,
> +                            <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
> +                            <&dispcc DISP_CC_MDSS_MDP_CLK>,
> +                            <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> +                   clock-names = "bus", "iface", "rot", "lut", "core",
> +                                 "vsync";
> +
> +                   interrupt-parent = <&mdss>;
> +                   interrupts = <0>;
> +
> +                   ports {
> +                           #address-cells = <1>;
> +                           #size-cells = <0>;
> +
> +                           port@0 {
> +                                   reg = <0>;
> +                                   dpu_intf1_out: endpoint {
> +                                                  remote-endpoint = <&dsi0_in>;
> +                                   };
> +                           };
> +
> +                            port@2 {
> +                                    reg = <2>;
> +                                    dpu_intf0_out: endpoint {
> +                                                   remote-endpoint = <&dp_in>;
> +                                    };
> +                            };
> +                   };
> +         };
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
> new file mode 100644
> index 0000000..c744559
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
> @@ -0,0 +1,196 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/dpu-sdm845.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Display DPU dt properties for SDM845 target
> +
> +maintainers:
> +  - Krishna Manikandan <mkrishn@codeaurora.org>
> +
> +description: |
> +  Device tree bindings for MSM Mobile Display Subsytem(MDSS) that encapsulates
> +  sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
> +  bindings of MDSS and DPU are mentioned for SDM845 target.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: qcom,sdm845-mdss
> +
> +  reg:
> +    maxItems: 1
> +
> +  reg-names:
> +    const: mdss
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Display AHB clock from gcc
> +      - description: Display AXI clock
> +      - description: Display core clock
> +
> +  clock-names:
> +    items:
> +      - const: iface
> +      - const: bus
> +      - const: core
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 1
> +
> +  iommus:
> +    items:
> +      - description: Phandle to apps_smmu node with SID mask for Hard-Fail port0
> +      - description: Phandle to apps_smmu node with SID mask for Hard-Fail port1
> +
> +  ranges: true
> +
> +patternProperties:
> +  "^display-controller@[0-9a-f]+$":
> +    type: object
> +    description: Node containing the properties of DPU.
> +
> +    properties:
> +      compatible:
> +        items:
> +          - const: qcom,sdm845-dpu
> +
> +      reg:
> +        items:
> +          - description: Address offset and size for mdp register set
> +          - description: Address offset and size for vbif register set
> +
> +      reg-names:
> +        items:
> +          - const: mdp
> +          - const: vbif
> +
> +      clocks:
> +        items:
> +          - description: Display ahb clock
> +          - description: Display axi clock
> +          - description: Display core clock
> +          - description: Display vsync clock
> +
> +      clock-names:
> +        items:
> +          - const: iface
> +          - const: bus
> +          - const: core
> +          - const: vsync
> +
> +      interrupts:
> +        maxItems: 1
> +
> +      ports:

Same issues in this one...

> +        $ref: /schemas/graph.yaml#/properties/port
> +        type: object
> +        description: |
> +          Contains the list of output ports from DPU device. These ports
> +          connect to interfaces that are external to the DPU hardware,
> +          such as DSI, DP etc. Each output port contains an endpoint that
> +          describes how it is connected to an external interface.
> +
> +        properties:
> +          port@0:
> +            type: object
> +            description: DPU_INTF1 (DSI1)
> +
> +          port@1:
> +            type: object
> +            description: DPU_INTF2 (DSI2)
> +
> +    required:
> +      - compatible
> +      - reg
> +      - reg-names
> +      - clocks
> +      - interrupts
> +      - ports
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - power-domains
> +  - clocks
> +  - interrupts
> +  - interrupt-controller
> +  - iommus
> +  - ranges
> +
> +additionalProperties: true

false

> +
> +examples:
> +- |
> +    #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
> +    #include <dt-bindings/clock/qcom,gcc-sdm845.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    display-subsystem@ae00000 {
> +          #address-cells = <1>;
> +          #size-cells = <1>;
> +          compatible = "qcom,sdm845-mdss";
> +          reg = <0x0ae00000 0x1000>;
> +          reg-names = "mdss";
> +          power-domains = <&dispcc MDSS_GDSC>;
> +
> +          clocks = <&gcc GCC_DISP_AHB_CLK>,
> +                   <&gcc GCC_DISP_AXI_CLK>,
> +                   <&dispcc DISP_CC_MDSS_MDP_CLK>;
> +          clock-names = "iface", "bus", "core";
> +
> +          interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> +          interrupt-controller;
> +          #interrupt-cells = <1>;
> +
> +          iommus = <&apps_smmu 0x880 0x8>,
> +                   <&apps_smmu 0xc80 0x8>;
> +          ranges;
> +
> +          display-controller@ae01000 {
> +                    compatible = "qcom,sdm845-dpu";
> +                    reg = <0x0ae01000 0x8f000>,
> +                          <0x0aeb0000 0x2008>;
> +                    reg-names = "mdp", "vbif";
> +
> +                    clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                             <&dispcc DISP_CC_MDSS_AXI_CLK>,
> +                             <&dispcc DISP_CC_MDSS_MDP_CLK>,
> +                             <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> +                    clock-names = "iface", "bus", "core", "vsync";
> +
> +                    interrupt-parent = <&mdss>;
> +                    interrupts = <0>;
> +
> +                    ports {
> +                           #address-cells = <1>;
> +                           #size-cells = <0>;
> +
> +                           port@0 {
> +                                   reg = <0>;
> +                                   dpu_intf1_out: endpoint {
> +                                                  remote-endpoint = <&dsi0_in>;
> +                                   };
> +                           };
> +
> +                           port@1 {
> +                                   reg = <1>;
> +                                   dpu_intf2_out: endpoint {
> +                                                  remote-endpoint = <&dsi1_in>;
> +                                   };
> +                           };
> +                    };
> +          };
> +    };
> +...
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
