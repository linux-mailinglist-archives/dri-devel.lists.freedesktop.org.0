Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 998B722F940
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jul 2020 21:41:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B2BE89C46;
	Mon, 27 Jul 2020 19:41:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
 [209.85.166.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1632C89C46;
 Mon, 27 Jul 2020 19:41:51 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id r12so14142593ilh.4;
 Mon, 27 Jul 2020 12:41:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=knxQegiIELcsU8snwERm1s9k7rupdiQXVMGg70qWtJA=;
 b=lGcNt9Snh46eTjtSiKpjBxS7SzPB7uSCz90pKD+91Phw4HYxRZ0tnWDmE9DJfArRa4
 Slg8Z8pQ7rGa+OIgZur7NOFxxQhgDp0j4StwQSO5gbih+5zCXL3bHYOr2lG5Swt09pNG
 BEfJurJuCj6+mfNpwRG4I7JTxnRNX3/CVrWgN0rg8sM8lX4b1dz/CJKihe01LfB5nvdh
 CNaVZRSYypUU3MTFmm5OSPHpi5B7p5YfxQx2T9z22J8Bd72IJ6wJwMbmun5QTD3rRs57
 7ecmukuvUkVwTE5i/MVv7Kx/R5b7pNznPMVIxe26d95wY27VelmY4O3jQNDrAp5q1x5r
 uR+Q==
X-Gm-Message-State: AOAM530PGjJaJ/R4ztlKL0dJfjPce3AjeCl5lTcvJLiElPYBmBCkxVtn
 0dhbUltHOg8BxVZu3Hr8RA==
X-Google-Smtp-Source: ABdhPJyUel9qEUSeS7M7L9mt8V3tmu9O6WujCt6VrRAiiUMyG17ObVS6Pn+sqaVkPga0Bgqp1uIcog==
X-Received: by 2002:a05:6e02:ec4:: with SMTP id
 i4mr22749354ilk.121.1595878909978; 
 Mon, 27 Jul 2020 12:41:49 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id l5sm9244095ios.3.2020.07.27.12.41.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 12:41:49 -0700 (PDT)
Received: (nullmailer pid 759159 invoked by uid 1000);
 Mon, 27 Jul 2020 19:41:47 -0000
Date: Mon, 27 Jul 2020 13:41:47 -0600
From: Rob Herring <robh@kernel.org>
To: Krishna Manikandan <mkrishn@codeaurora.org>
Subject: Re: [v6] dt-bindings: msm: disp: add yaml schemas for DPU and DSI
 bindings
Message-ID: <20200727194147.GA653569@bogus>
References: <1594910728-31684-1-git-send-email-mkrishn@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1594910728-31684-1-git-send-email-mkrishn@codeaurora.org>
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
 seanpaul@chromium.org, kalyan_t@codeaurora.org, hoegsberg@chromium.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 16, 2020 at 08:15:28PM +0530, Krishna Manikandan wrote:
> MSM Mobile Display Subsytem (MDSS) encapsulates sub-blocks
> like DPU display controller, DSI etc. Add YAML schema
> for the device tree bindings for the same.
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
> ---
>  .../bindings/display/msm/dpu-sc7180.yaml           | 236 ++++++++++++++++++++
>  .../bindings/display/msm/dpu-sdm845.yaml           | 216 ++++++++++++++++++
>  .../devicetree/bindings/display/msm/dpu.txt        | 141 ------------
>  .../display/msm/dsi-common-controller.yaml         | 180 +++++++++++++++
>  .../display/msm/dsi-controller-sc7180.yaml         | 120 ++++++++++
>  .../display/msm/dsi-controller-sdm845.yaml         | 120 ++++++++++
>  .../bindings/display/msm/dsi-phy-sc7180.yaml       |  80 +++++++
>  .../bindings/display/msm/dsi-phy-sdm845.yaml       |  82 +++++++
>  .../devicetree/bindings/display/msm/dsi-phy.yaml   | 126 +++++++++++
>  .../devicetree/bindings/display/msm/dsi.txt        | 246 ---------------------
>  10 files changed, 1160 insertions(+), 387 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/msm/dpu.txt
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-common-controller.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-controller-sc7180.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-controller-sdm845.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy-sc7180.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy-sdm845.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/msm/dsi.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
> new file mode 100644
> index 0000000..df70393
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
> @@ -0,0 +1,236 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/dpu-sc7180.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Description of Qualcomm Display DPU dt properties.
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
> +    maxItems: 3
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
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 2
> +
> +  "#size-cells":
> +    const: 2
> +
> +  ranges: true
> +
> +  interconnects:
> +    description: |
> +      Interconnect path specifier for MDSS according to
> +      Documentation/devicetree/bindings/interconnect/interconnect.txt.
> +      An entry should contain 2 paths corresponding to 2 AXI ports representing
> +      source and destination ports.
> +    minItems: 1
> +
> +  interconnect-names:
> +    description: |
> +      MDSS will have 2 port names to differentiate between the
> +      2 interconnect paths defined with interconnect specifier.
> +    items:
> +      - const: mdp0-mem
> +
> +  assigned-clocks:
> +    maxItems: 1
> +
> +  assigned-clock-rates:
> +    maxItems: 1
> +
> +patternProperties:
> +  "^mdp@[0-9a-f]+$":
> +    type: object
> +    description: Node containing the properties of DPU.
> +
> +    properties:
> +      compatible:
> +        items:
> +          - const: qcom,sc7180-dpu
> +
> +      reg:
> +        maxItems: 2
> +
> +      reg-names:
> +        items:
> +          - const: mdp
> +          - const: vbif
> +
> +      clocks:
> +        maxItems: 6
> +
> +      clock-names:
> +        description: |
> +          Device clock names, must be in same order as clocks property.
> +          The following clocks are required.
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
> +        type: object
> +        description: |
> +          Contains the list of output ports from DPU device. These ports
> +          connect to interfaces that are external to the DPU hardware,
> +          such as DSI, DP etc. Each output port contains an endpoint that
> +          describes how it is connected to an external interface. These
> +          are described by the standard properties documented in files
> +          mentioned below.
> +
> +          Documentation/devicetree/bindings/graph.txt
> +          Documentation/devicetree/bindings/media/video-interfaces.txt
> +
> +        properties:
> +          port@0:
> +            type: object
> +            description: DPU_INTF1 (DSI1)
> +          port@1:
> +            type: object
> +            description: DPU_INTF2 (DSI2)
> +
> +      assigned-clocks:
> +        maxItems: 4
> +
> +      assigned-clock-rates:
> +        maxItems: 4
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - power-domains
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - interrupt-controller
> +  - iommus
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,dispcc-sc7180.h>
> +    #include <dt-bindings/clock/qcom,gcc-sc7180.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interconnect/qcom,sdm845.h>
> +
> +    soc: soc {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +
> +      mdss: mdss@ae00000 {
> +         compatible = "qcom,sc7180-mdss";
> +         reg = <0 0xae00000 0 0x1000>;
> +         reg-names = "mdss";
> +         power-domains = <&dispcc MDSS_GDSC>;
> +
> +         clocks = <&gcc GCC_DISP_AHB_CLK>,
> +                  <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                  <&dispcc DISP_CC_MDSS_MDP_CLK>;
> +
> +         clock-names = "iface", "ahb", "core";
> +
> +         assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>;
> +         assigned-clock-rates = <300000000>;
> +
> +         interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> +         interrupt-controller;
> +         #interrupt-cells = <1>;
> +
> +         interconnects = <&mmss_noc MASTER_MDP0 &mc_virt SLAVE_EBI1>;
> +
> +         interconnect-names = "mdp0-mem";
> +
> +         iommus = <&apps_smmu 0x800 0x2>;
> +
> +         #address-cells = <2>;
> +         #size-cells = <2>;
> +
> +         mdp: mdp@ae01000 {
> +                   compatible = "qcom,sc7180-dpu";
> +                   reg = <0 0x0ae01000 0 0x8f000>,
> +                         <0 0x0aeb0000 0 0x2008>;
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
> +                   assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>,
> +                                     <&dispcc DISP_CC_MDSS_VSYNC_CLK>,
> +                                     <&dispcc DISP_CC_MDSS_ROT_CLK>,
> +                                     <&dispcc DISP_CC_MDSS_ROT_CLK>;
> +                   assigned-clock-rates = <300000000>,
> +                                          <19200000>,
> +                                          <19200000>,
> +                                          <19200000>;
> +
> +                   interrupt-parent = <&mdss>;
> +                   interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
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
> +                   };
> +         };
> +      };
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
> new file mode 100644
> index 0000000..17395f6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
> @@ -0,0 +1,216 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/dpu-sdm845.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Description of Qualcomm Display DPU dt properties.
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
> +    maxItems: 3
> +
> +  clock-names:
> +    description: |
> +      Device clock names in the same order as mentioned in clocks property.
> +      The required clocks are mentioned below.
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
> +    maxItems: 2
> +
> +  "#address-cells":
> +    const: 2
> +
> +  "#size-cells":
> +    const: 2
> +
> +  ranges: true
> +
> +  assigned-clocks:
> +    maxItems: 1
> +
> +  assigned-clock-rates:
> +    maxItems: 1
> +
> +patternProperties:
> +  "^mdp@[0-9a-f]+$":
> +    type: object
> +    description: Node containing the properties of DPU.
> +
> +    properties:
> +      compatible:
> +        items:
> +          - const: qcom,sdm845-dpu
> +      reg:
> +        maxItems: 2
> +
> +      reg-names:
> +        items:
> +          - const: mdp
> +          - const: vbif
> +
> +      clocks:
> +        maxItems: 4
> +
> +      clock-names:
> +        description: |
> +          Device clock names, must be in same order as clocks property.
> +          The following clocks are required.
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
> +        type: object
> +        description: |
> +          Contains the list of output ports from DPU device. These ports
> +          connect to interfaces that are external to the DPU hardware,
> +          such as DSI, DP etc. Each output port contains an endpoint that
> +          describes how it is connected to an external interface. These
> +          are described by the standard properties documented in files
> +          mentioned below.
> +
> +          Documentation/devicetree/bindings/graph.txt
> +          Documentation/devicetree/bindings/media/video-interfaces.txt
> +
> +        properties:
> +          port@0:
> +            type: object
> +            description: DPU_INTF1 (DSI1)
> +          port@1:
> +            type: object
> +            description: DPU_INTF2 (DSI2)
> +
> +      assigned-clocks:
> +        maxItems: 2
> +
> +      assigned-clock-rates:
> +        maxItems: 2
> +
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - power-domains
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - interrupt-controller
> +  - iommus
> +
> +additionalProperties: false
> +
> +examples:
> +- |
> +    #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
> +    #include <dt-bindings/clock/qcom,gcc-sdm845.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    soc: soc {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +
> +      mdss: mdss@ae00000 {
> +          compatible = "qcom,sdm845-mdss";
> +          reg = <0 0x0ae00000 0 0x1000>;
> +          reg-names = "mdss";
> +          power-domains = <&dispcc MDSS_GDSC>;
> +
> +          clocks = <&gcc GCC_DISP_AHB_CLK>,
> +                   <&gcc GCC_DISP_AXI_CLK>,
> +                   <&dispcc DISP_CC_MDSS_MDP_CLK>;
> +          clock-names = "iface", "bus", "core";
> +
> +          assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>;
> +          assigned-clock-rates = <300000000>;
> +
> +          interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> +          interrupt-controller;
> +          #interrupt-cells = <1>;
> +
> +          iommus = <&apps_smmu 0x880 0x8>,
> +                   <&apps_smmu 0xc80 0x8>;
> +
> +          #address-cells = <2>;
> +          #size-cells = <2>;
> +
> +          mdss_mdp: mdp@ae01000 {
> +                    compatible = "qcom,sdm845-dpu";
> +                    reg = <0 0x0ae01000 0 0x8f000>,
> +                          <0 0x0aeb0000 0 0x2008>;
> +                    reg-names = "mdp", "vbif";
> +
> +                    clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                             <&dispcc DISP_CC_MDSS_AXI_CLK>,
> +                             <&dispcc DISP_CC_MDSS_MDP_CLK>,
> +                             <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> +                    clock-names = "iface", "bus", "core", "vsync";
> +
> +                    assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>,
> +                                      <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> +                    assigned-clock-rates = <300000000>,
> +                                           <19200000>;
> +
> +                    interrupt-parent = <&mdss>;
> +                    interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
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
> +      };
> +    };
> +...


> +++ b/Documentation/devicetree/bindings/display/msm/dsi-common-controller.yaml
> @@ -0,0 +1,180 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/dsi-common-controller.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Description of Qualcomm Display DSI controller dt properties.
> +
> +maintainers:
> +  - Krishna Manikandan <mkrishn@codeaurora.org>
> +
> +description: |
> +  Common Device tree bindings for DSI controller.
> +
> +allOf:
> +  - $ref: "../dsi-controller.yaml#"
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: qcom,mdss-dsi-ctrl
> +
> +  clocks:
> +    maxItems: 6
> +
> +  clock-names:
> +    description: |
> +      Device clock names in the same order as mentioned in clocks property.
> +
> +  assigned-clocks:
> +    description: Parents of "byte" and "pixel" for the given platform.
> +
> +  assigned-clock-parents:
> +    description: |
> +      The Byte clock and Pixel clock PLL outputs provided by a DSI PHY block.
> +      Details on clock bindings are mentioned in
> +      Documentation/devicetree/bindings/clock/clock-bindings.txt.
> +
> +  vdd-supply:
> +    description: Phandle to vdd regulator device node.
> +
> +  vddio-supply:
> +    description: Phandle to vdd-io regulator device node.
> +
> +  vdda-supply:
> +    description: Phandle to vdda regulator device node.
> +
> +  phys:
> +    description: Phandle to DSI PHY device node.
> +    maxItems: 1
> +
> +  phy-names:
> +    description: Name of the corresponding PHY device.
> +    maxItems: 1
> +
> +  syscon-sfpb:
> +    description: A phandle to mmss_sfpb syscon node (only for DSIv2).
> +    $ref: "/schemas/types.yaml#/definitions/phandle"
> +
> +      # Optional Properties for dsi controller
> +  qcom,mdss-mdp-transfer-time-us:
> +    description: |
> +      Specifies the DSI transfer time for command mode
> +      panels in microseconds. Driver uses this number to adjust
> +      the clock rate according to the expected transfer time.
> +      Increasing this value would slow down the mdp processing
> +      and can result in slower performance.
> +      Decreasing this value can speed up the mdp processing,
> +      but this can also impact power consumption.
> +      As a rule this time should not be higher than the time
> +      that would be expected with the processing at the
> +      DSI link rate since anyways this would be the maximum
> +      transfer time that could be achieved.
> +      If ping pong split is enabled, this time should not be higher
> +      than two times the DSI link rate time.
> +      If the property is not specified, then the default value is
> +      14000 us. This is an optional property.

'default: 14000' is how to describe defaults as a schema.

Is there not a range you can define less than 0 - 2^32?


> +
> +  qcom,dual-dsi-mode:
> +    type: boolean
> +    description: |
> +      Boolean value indicating if the DSI controller is
> +      driving a panel which needs 2 DSI links.
> +
> +  qcom,master-dsi:
> +    type: boolean
> +    description: |
> +      Boolean value indicating if the DSI controller is driving
> +      the master link of the 2-DSI panel.
> +
> +  qcom,sync-dual-dsi:
> +    type: boolean
> +    description: |
> +      Boolean value indicating if the DSI controller is driving a
> +      2-DSI panel whose 2 links need receive command simultaneously.
> +
> +  pinctrl-names:
> +    description: The pin control state names.
> +    items:
> +      - const: default
> +      - const: sleep
> +
> +  pinctrl-0:
> +    description: The default pinctrl state (active)
> +
> +  pinctrl-1:
> +    description: The sleep pinctrl state (suspend)
> +
> +  ports:
> +    type: object
> +    description: |
> +      Contains DSI controller input and output ports as children, each
> +      containing one endpoint subnode as defined in
> +      Documentation/devicetree/bindings/graph.txt and
> +      Documentation/devicetree/bindings/media/video-interfaces.txt.
> +
> +    properties:
> +      port@0:
> +        type: object
> +        description: |
> +          Input endpoints of the controller.
> +
> +        properties:
> +          reg:
> +            const: 0
> +
> +          endpoint:
> +            type: object
> +            properties:
> +              remote-endpoint:
> +                description: |
> +                  For port@0, set to phandle of the connected panel/bridge's
> +                  input endpoint. For port@1, set to the MDP interface output.
> +                  See Documentation/devicetree/bindings/graph.txt for
> +                  device graph info.
> +
> +              data-lanes:
> +                description: |
> +                  This describes how the physical DSI data lanes are mapped
> +                  to the logical lanes on the given platform. The value contained in
> +                  index n describes what physical lane is mapped to the logical lane n
> +                  (DATAn, where n lies between 0 and 3). The clock lane position is fixed
> +                  and can't be changed. Hence, they aren't a part of the DT bindings. See
> +                  Documentation/devicetree/bindings/media/video-interfaces.txt for
> +                  more info on the data-lanes property.
> +
> +                  For example:
> +                  data-lanes = <3 0 1 2>;
> +
> +                  The above mapping describes that the logical data lane DATA0 is mapped
> +                  to the physical data lane DATA3, logical DATA1 to physical DATA0,
> +                  logic DATA2 to phys DATA1 and logic DATA3 to phys DATA2. There are
> +                  only a limited number of physical to logical mappings possible.
> +                  oneOf:
> +                    - const: <0 1 2 3>
> +                    - const: <1 2 3 0>
> +                    - const: <2 3 0 1>
> +                    - const: <3 0 1 2>
> +                    - const: <0 3 2 1>
> +                    - const: <1 0 3 2>
> +                    - const: <2 1 0 3>
> +                    - const: <3 2 1 0>

Looks kind of like a schema, but is not... It's just part of 
'description' because of the indent. There's not really a concise way to 
enumeration array values, you have to do something like this:

oneOf:
  - items:
      - const: 0
      - const: 1
      - const: 2
      - const: 3
  - items:
      - const: 1
      - const: 2
      - const: 3
      - const: 0
...


> +                maxItems: 1
> +
> +      port@1:
> +        type: object
> +        description: |
> +          Output endpoints of the controller.
> +        properties:
> +          reg:
> +            const: 1
> +
> +          endpoint:
> +            type: object
> +            properties:
> +              remote-endpoint: true
> +              data-lanes:
> +                maxItems: 1

This is saying 'data-lanes' is a single scalar value. If so, then what 
are the possible values?

> +
> +...
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-sc7180.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-sc7180.yaml
> new file mode 100644
> index 0000000..6f3e179
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-sc7180.yaml
> @@ -0,0 +1,120 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/dsi-controller-sc7180.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Description of Qualcomm Display DSI controller dt properties.
> +
> +maintainers:
> +  - Krishna Manikandan <mkrishn@codeaurora.org>
> +
> +description: |
> +  Device tree bindings for DSI controller for SC7180 target.
> +
> +allOf:
> +  - $ref: dsi-common-controller.yaml#
> +
> +properties:
> +  compatible:
> +    const: qcom,mdss-dsi-ctrl
> +
> +  reg:
> +    maxItems: 1
> +
> +  reg-names:
> +    const: dsi_ctrl
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 6
> +
> +  clock-names:
> +    items:
> +         - const: byte
> +         - const: byte_intf
> +         - const: pixel
> +         - const: core
> +         - const: iface
> +         - const: bus
> +
> +  phys:
> +    maxItems: 1
> +
> +  phy-names:
> +    const: dsi
> +
> +  ports: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - phys
> +  - phy-names
> +  - ports
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +     #include <dt-bindings/interrupt-controller/arm-gic.h>
> +     #include <dt-bindings/clock/qcom,dispcc-sc7180.h>
> +     #include <dt-bindings/clock/qcom,gcc-sc7180.h>
> +
> +     mdss: mdss {
> +       #address-cells = <2>;
> +       #size-cells = <2>;
> +       interrupt-controller;
> +       #interrupt-cells = <1>;
> +
> +       dsi0: dsi@ae94000 {
> +           compatible = "qcom,mdss-dsi-ctrl";
> +           reg = <0 0x0ae94000 0 0x400>;
> +           reg-names = "dsi_ctrl";
> +
> +           interrupt-parent = <&mdss>;
> +           interrupts = <4 IRQ_TYPE_LEVEL_HIGH>;
> +
> +           clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
> +                    <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
> +                    <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
> +                    <&dispcc DISP_CC_MDSS_ESC0_CLK>,
> +                    <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                    <&gcc GCC_DISP_HF_AXI_CLK>;
> +
> +           clock-names = "byte",
> +                         "byte_intf",
> +                         "pixel",
> +                         "core",
> +                         "iface",
> +                         "bus";
> +
> +           phys = <&dsi_phy>;
> +           phy-names = "dsi";
> +
> +           ports {
> +                 #address-cells = <1>;
> +                 #size-cells = <0>;
> +                 port@0 {
> +                         reg = <0>;
> +                         dsi0_in: endpoint {
> +                                  remote-endpoint = <&dpu_intf1_out>;
> +                         };
> +                };
> +
> +                port@1 {
> +                        reg = <1>;
> +                        dsi0_out: endpoint {
> +                        };
> +               };
> +          };
> +       };
> +     };
> +...
> +
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-sdm845.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-sdm845.yaml
> new file mode 100644
> index 0000000..5dae89e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-sdm845.yaml
> @@ -0,0 +1,120 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/dsi-controller-sdm845.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Description of Qualcomm Display DSI controller dt properties.
> +
> +maintainers:
> +  - Krishna Manikandan <mkrishn@codeaurora.org>
> +
> +description: |
> +  Device tree bindings for DSI controller for SDM845 target.
> +
> +allOf:
> +  - $ref: dsi-common-controller.yaml#
> +
> +properties:
> +  compatible:
> +    const: qcom,mdss-dsi-ctrl

Same compatible twice?

IIRC, there were some differences in the various DSI controllers, but 
now they look identical to me? 

> +
> +  reg:
> +    maxItems: 1
> +
> +  reg-names:
> +    const: dsi_ctrl
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 6
> +
> +  clock-names:
> +    items:
> +         - const: byte
> +         - const: byte_intf
> +         - const: pixel
> +         - const: core
> +         - const: iface
> +         - const: bus
> +
> +  phys:
> +    maxItems: 1
> +
> +  phy-names:
> +    const: dsi
> +
> +  ports: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - phys
> +  - phy-names
> +  - ports
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +     #include <dt-bindings/interrupt-controller/arm-gic.h>
> +     #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
> +     #include <dt-bindings/clock/qcom,gcc-sdm845.h>
> +
> +     mdss: mdss {
> +       #address-cells = <2>;
> +       #size-cells = <2>;
> +       interrupt-controller;
> +       #interrupt-cells = <1>;
> +
> +       dsi0: dsi@ae94000 {
> +           compatible = "qcom,mdss-dsi-ctrl";
> +           reg = <0 0x0ae94000 0 0x400>;
> +           reg-names = "dsi_ctrl";
> +
> +           interrupt-parent = <&mdss>;
> +           interrupts = <4 IRQ_TYPE_LEVEL_HIGH>;
> +
> +           clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
> +                    <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
> +                    <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
> +                    <&dispcc DISP_CC_MDSS_ESC0_CLK>,
> +                    <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                    <&dispcc DISP_CC_MDSS_AXI_CLK>;
> +           clock-names = "byte",
> +                         "byte_intf",
> +                         "pixel",
> +                         "core",
> +                         "iface",
> +                         "bus";
> +
> +           phys = <&dsi0_phy>;
> +           phy-names = "dsi";
> +
> +           ports {
> +                  #address-cells = <1>;
> +                  #size-cells = <0>;
> +
> +                  port@0 {
> +                          reg = <0>;
> +                          dsi0_in: endpoint {
> +                                   remote-endpoint = <&dpu_intf1_out>;
> +                          };
> +                  };
> +
> +                  port@1 {
> +                          reg = <1>;
> +                          dsi0_out: endpoint {
> +                          };
> +                  };
> +           };
> +       };
> +     };
> +...
> +
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-sc7180.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-sc7180.yaml
> new file mode 100644
> index 0000000..039c50f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-sc7180.yaml
> @@ -0,0 +1,80 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/dsi-phy-sc7180.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Description of Qualcomm Display DSI PHY dt properties.
> +
> +maintainers:
> +  - Krishna Manikandan <mkrishn@codeaurora.org>
> +
> +description: |
> +  Device tree bindings for DSI PHY for SC7180 target.
> +
> +allOf:
> +  - $ref: dsi-phy.yaml#
> +
> +properties:
> +  compatible:
> +    const: qcom,dsi-phy-10nm
> +
> +  reg:
> +    maxItems: 3
> +
> +  reg-names:
> +    maxItems: 3
> +
> +  clocks:
> +    maxItems: 2
> +
> +  clock-names:
> +    items:
> +      - const: iface
> +      - const: ref
> +
> +  "#clock-cells":
> +    const: 1
> +
> +  "#phy-cells":
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +     #include <dt-bindings/interrupt-controller/arm-gic.h>
> +     #include <dt-bindings/clock/qcom,dispcc-sc7180.h>
> +     #include <dt-bindings/clock/qcom,gcc-sc7180.h>
> +     #include <dt-bindings/clock/qcom,rpmh.h>
> +
> +     mdss: mdss {
> +       #address-cells = <2>;
> +       #size-cells = <2>;
> +
> +       dsi_phy: dsi-phy@ae94400 {
> +              compatible = "qcom,dsi-phy-10nm";
> +              reg = <0 0x0ae94400 0 0x200>,
> +                    <0 0x0ae94600 0 0x280>,
> +                    <0 0x0ae94a00 0 0x1e0>;
> +              reg-names = "dsi_phy",
> +                          "dsi_phy_lane",
> +                          "dsi_pll";
> +
> +              vdds-supply = <&vdda_mipi_dsi0_pll>;
> +              #clock-cells = <1>;
> +              #phy-cells = <0>;
> +              clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                       <&rpmhcc RPMH_CXO_CLK>;
> +              clock-names = "iface", "ref";
> +       };
> +     };
> +...
> +
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-sdm845.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-sdm845.yaml
> new file mode 100644
> index 0000000..4abae0e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-sdm845.yaml
> @@ -0,0 +1,82 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/dsi-phy-sdm845.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Description of Qualcomm Display DSI PHY dt properties.
> +
> +maintainers:
> +  - Krishna Manikandan <mkrishn@codeaurora.org>
> +
> +description: |
> +  Device tree bindings for DSI PHY for SDM845 target.
> +
> +allOf:
> +  - $ref: dsi-phy.yaml#
> +
> +properties:
> +  compatible:
> +    const: qcom,dsi-phy-10nm
> +
> +  reg:
> +    maxItems: 3
> +
> +  reg-names:
> +    maxItems: 3
> +
> +  clocks:
> +    maxItems: 2
> +
> +  clock-names:
> +    items:
> +      - const: iface
> +      - const: ref
> +
> +  "#clock-cells":
> +    const: 1
> +
> +  "#phy-cells":
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +     #include <dt-bindings/interrupt-controller/arm-gic.h>
> +     #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
> +     #include <dt-bindings/clock/qcom,gcc-sdm845.h>
> +     #include <dt-bindings/clock/qcom,rpmh.h>
> +
> +     mdss: mdss {
> +       #address-cells = <2>;
> +       #size-cells = <2>;
> +
> +       dsi0_phy: dsi-phy@ae94400 {
> +               compatible = "qcom,dsi-phy-10nm";
> +               reg = <0 0x0ae94400 0 0x200>,
> +                     <0 0x0ae94600 0 0x280>,
> +                     <0 0x0ae94a00 0 0x1e0>;
> +               reg-names = "dsi_phy",
> +                           "dsi_phy_lane",
> +                           "dsi_pll";
> +
> +               #clock-cells = <1>;
> +               #phy-cells = <0>;
> +
> +               vdds-supply = <&vdda_mipi_dsi0_pll>;
> +               clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                        <&rpmhcc RPMH_CXO_CLK>;
> +               clock-names = "iface", "ref";
> +
> +       };
> +     };
> +...
> +
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy.yaml
> new file mode 100644
> index 0000000..ee58e58
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy.yaml
> @@ -0,0 +1,126 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/dsi-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Description of Qualcomm Display DSI PHY dt properties.
> +
> +maintainers:
> +  - Krishna Manikandan <mkrishn@codeaurora.org>
> +
> +description: |
> +  Common Device tree bindings for DSI PHY.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: qcom,dsi-phy-28nm-hpm
> +      - const: qcom,dsi-phy-28nm-lp
> +      - const: qcom,dsi-phy-20nm
> +      - const: qcom,dsi-phy-28nm-8960
> +      - const: qcom,dsi-phy-14nm
> +      - const: qcom,dsi-phy-10nm
> +      - const: qcom,dsi-phy-10nm-8998
> +
> +  reg-names:
> +    description: Name of register regions.
> +
> +  clock-cells:
> +    description: |
> +      The DSI PHY block acts as a clock provider, creating
> +      2 clocks: A byte clock (index 0), and a pixel clock (index 1).
> +    const: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 2
> +
> +  clock-names:
> +    description: |
> +      The following clocks are required.
> +    items:
> +      - const: iface
> +      - const: ref
> +
> +  qcom,dsi-phy-regulator-ldo-mode:
> +    type: boolean
> +    description: |
> +      Boolean value indicating if the LDO mode PHY regulator is wanted (optional).
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names
> +
> +
> +allOf:
> +  - if:

The point of creating a common schema or splitting the schemas into 
separate files was to reduce the number of if/then schemas. This doesn't 
seem to have done any of that.


> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,dsi-phy-28nm-hpm
> +              - qcom,dsi-phy-28nm-lp
> +              - qcom,dsi-phy-20nm
> +              - qcom,dsi-phy-28nm-8960
> +    then:
> +      required:
> +        - vddio-supply
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,dsi-phy-20nm
> +              - qcom,dsi-phy-14nm
> +    then:
> +      required:
> +        - vcca-supply
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,dsi-phy-10nm
> +    then:
> +      required:
> +        - vdds-supply

Why do you need this if/then here? You've got a schema file dedicated to 
qcom,dsi-phy-10nm.

> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,dsi-phy-28nm-hpm
> +              - qcom,dsi-phy-28nm-lp
> +              - qcom,dsi-phy-28nm-8960
> +              - qcom,dsi-phy-20nm

You already have this condition above, you don't need to repeat it here. 
Or maybe these 4 compatibles should be in their own schema file.

> +    then:
> +      properties:
> +        reg-names:
> +          items:
> +            - const: dsi_pll
> +            - const: dsi_phy
> +            - const: dsi_phy_regulator
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,dsi-phy-14nm
> +              - qcom,dsi-phy-10nm
> +    then:
> +      properties:
> +        reg-names:
> +          items:
> +            - const: dsi_phy
> +            - const: dsi_phy_lane
> +            - const: dsi_pll
> +...

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
