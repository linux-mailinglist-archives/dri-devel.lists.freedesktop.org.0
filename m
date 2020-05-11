Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B63631CE39E
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 21:13:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D38F6E536;
	Mon, 11 May 2020 19:13:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com
 [209.85.161.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D1C06E055;
 Mon, 11 May 2020 19:13:12 +0000 (UTC)
Received: by mail-oo1-f52.google.com with SMTP id r1so2184850oog.7;
 Mon, 11 May 2020 12:13:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=znYuUlBj0wh7euY5SMQd1lz8QVh4mrRrJIsVRU9jKx4=;
 b=neVP2Frdc25GpCCz8N6NWTz3oF+yDT9x6mI7dpcyfWgffUC3pMiLK885+6hbpDT/qD
 vJgS77a/WaiIgTyxJk7W7Wl+7qvLoo7VbpZT+UbnPXNBx8KSNBZn2M9UFkRwLBef8F7K
 EpW3fb+eslxIKd92Sdx0l0LJjLnDDN3o6Z3/kkcZZJODZTM9ZvDGb0ElFjusC9uUnLKe
 Mjiji7v75jlF2L333xxAzofLWdOM8TvC13QhSiioTb0a8cT1gr3Prn2pPyn3v+TUnphF
 Qz1rxOG/rSd0tt54Flstzoqopgbrs/DZ7TtUYnlGO/9x2fLMe19CuDoy1pRlBqIbcgeZ
 wtrA==
X-Gm-Message-State: AGi0Pubu7Boti3zfuJaf/BVG/CMehignvmOuaIT+7DFwZ1VvFgZVzzmM
 KRLGDejZ1PDzt/TSj7K6z8uPA0o=
X-Google-Smtp-Source: APiQypJRi8OQla2X3NtIAB4Wmw1Ev7Ng3Y9kFYjj4bqlbdD4X/K+b/aP2vl5OQslXBJb6LhPsJ5uOQ==
X-Received: by 2002:a4a:3445:: with SMTP id n5mr14684204oof.91.1589224391020; 
 Mon, 11 May 2020 12:13:11 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id l6sm2877387otq.48.2020.05.11.12.13.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 12:13:10 -0700 (PDT)
Received: (nullmailer pid 25664 invoked by uid 1000);
 Mon, 11 May 2020 19:13:08 -0000
Date: Mon, 11 May 2020 14:13:08 -0500
From: Rob Herring <robh@kernel.org>
To: Krishna Manikandan <mkrishn@codeaurora.org>
Subject: Re: [v3] dt-bindings: msm: disp: add yaml schemas for DPU and DSI
 bindings
Message-ID: <20200511191308.GA9121@bogus>
References: <1587535694-9738-1-git-send-email-mkrishn@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1587535694-9738-1-git-send-email-mkrishn@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

On Wed, Apr 22, 2020 at 11:38:14AM +0530, Krishna Manikandan wrote:
> MSM Mobile Display Subsytem (MDSS) encapsulates sub-blocks
> like DPU display controller, DSI etc. Add YAML schema
> for the device tree bindings for the same.
> 
> Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
> 
> Changes in v2:
> 	- Changed dpu to DPU (Sam Ravnborg)
> 	- Fixed indentation issues (Sam Ravnborg)
> 	- Added empty line between different properties (Sam Ravnborg)
> 	- Replaced reference txt files with  their corresponding
> 	  yaml files (Sam Ravnborg)
> 	- Modified the file to use "|" only when it is
> 	  necessary (Sam Ravnborg)
> 
> Changes in v3:
> 	- Corrected the license used (Rob Herring)
> 	- Added maxItems for properties (Rob Herring)
> 	- Dropped generic descriptions (Rob Herring)
> 	- Added ranges property (Rob Herring)
> 	- Corrected the indendation (Rob Herring)
> 	- Added additionalProperties (Rob Herring)
> 	- Split dsi file into two, one for dsi controller
> 	  and another one for dsi phy per target (Rob Herring)
> 	- Corrected description for pinctrl-names (Rob Herring)
> 	- Corrected the examples used in yaml file (Rob Herring)
> 	- Delete dsi.txt and dpu.txt (Rob Herring)
> ---
>  .../bindings/display/msm/dpu-sc7180.yaml           | 250 +++++++++++++++++++++
>  .../bindings/display/msm/dpu-sdm845.yaml           | 229 +++++++++++++++++++
>  .../devicetree/bindings/display/msm/dpu.txt        | 141 ------------
>  .../display/msm/dsi-controller-sc7180.yaml         | 123 ++++++++++
>  .../display/msm/dsi-controller-sdm845.yaml         | 120 ++++++++++
>  .../bindings/display/msm/dsi-controller.yaml       | 163 ++++++++++++++
>  .../bindings/display/msm/dsi-phy-sc7180.yaml       |  75 +++++++
>  .../bindings/display/msm/dsi-phy-sdm845.yaml       |  76 +++++++
>  .../devicetree/bindings/display/msm/dsi-phy.yaml   |  87 +++++++
>  .../devicetree/bindings/display/msm/dsi.txt        | 246 --------------------
>  10 files changed, 1123 insertions(+), 387 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/msm/dpu.txt
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-controller-sc7180.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-controller-sdm845.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-controller.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy-sc7180.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy-sdm845.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/msm/dsi.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
> new file mode 100644
> index 0000000..c230647
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
> @@ -0,0 +1,250 @@
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
> +  "mdss":
> +    type: object
> +    description: |
> +      Node containing MDSS that encapsulated sub-blocks like DPU, DSI and DP
> +      interfaces.

This schema will never be applied as there is nothing to match on. You 
need to remove 'mdss' and move the rest up a level.

The same problem exists in some of the other schemas.

> +
> +    properties:
> +     compatible:
> +       items:
> +         - const: qcom,sc7180-mdss
> +
> +     reg:
> +       maxItems: 1
> +
> +     reg-names:
> +       const: mdss
> +
> +     power-domains:
> +       maxItems: 1
> +
> +     clocks:
> +       maxItems: 3
> +
> +     clock-names:
> +       description: |
> +         Device clock names in the same order as mentioned in clocks property.
> +         The required clocks are mentioned below.
> +       items:
> +         - const: iface
> +         - const: ahb
> +         - const: core
> +
> +     interrupts:
> +       maxItems: 1
> +
> +     interrupt-controller: true
> +
> +     "#interrupt-cells":
> +       const: 1
> +
> +     iommus:
> +       maxItems: 1
> +
> +     "#address-cells":
> +       const: 2
> +
> +     "#size-cells":
> +       const: 2
> +
> +     ranges: true
> +       
> +     interconnects:
> +       description: |
> +         Interconnect path specifier for MDSS according to
> +         Documentation/devicetree/bindings/interconnect/interconnect.txt.
> +         Should be 2 paths corresponding to 2 AXI ports.

2 or

> +       maxItems: 1

1???

> +
> +     interconnect-names:
> +       description: |
> +         MDSS will have 2 port names to differentiate between the
> +         2 interconnect paths defined with interconnect specifier.
> +       maxItems: 1
> +
> +     assigned-clocks:
> +       description: |
> +         List of clock specifiers for clocks needing rate assignment (optional).

A list or...

> +       maxItems: 1

only 1?

> +
> +     assigned-clock-rates:
> +       description: |
> +         List of clock frequencies sorted in the same order as the
> +         assigned-clocks property (optional).
> +       maxItems: 1
> +
> +     "mdp":

Looks like there's a unit-address, so you need a pattern here (under 
patternProperties).

> +       type: object
> +       description: Node containing the properties of DPU.
> +
> +       properties:
> +         compatible:
> +           items:
> +             - const: qcom,sc7180-dpu
> +
> +         reg:
> +           maxItems: 2
> +
> +         reg-names:
> +           items:
> +             - const: mdp
> +             - const: vbif
> +
> +         clocks:
> +           maxItems: 6
> +
> +         clock-names:
> +           description: |
> +             Device clock names, must be in same order as clocks property.
> +             The following clocks are required. "bus" is an optional property
> +             in sc7180 due to architecture change. "rot" and "lut" are optional
> +             device clocks, needed for accessing LUT blocks.
> +           items:
> +             - const: bus
> +             - const: iface
> +             - const: core
> +             - const: vsync
> +             - const: rot
> +             - const: lut
> +
> +         interrupts:
> +           maxItems: 1
> +
> +         ports:
> +           type: object
> +           description: |
> +             Contains the list of output ports from DPU device. These ports
> +             connect to interfaces that are external to the DPU hardware,
> +             such as DSI, DP etc. Each output port contains an endpoint that
> +             describes how it is connected to an external interface. These
> +             are described by the standard properties documented in files
> +             mentioned below.
> +
> +             Documentation/devicetree/bindings/graph.txt
> +             Documentation/devicetree/bindings/media/video-interfaces.txt
> +
> +           properties:
> +             port@0:
> +               type: object
> +               description: DPU_INTF1 (DSI1)
> +             port@1:
> +               type: object
> +               description: DPU_INTF2 (DSI2)
> +
> +         assigned-clocks:
> +           description: |
> +             List of clock specifiers for clocks needing rate assignment (optional).
> +           maxItems: 4
> +
> +         assigned-clock-rates:
> +           description: |
> +             List of clock frequencies sorted in the same order as the
> +             assigned-clocks property (optional).
> +           maxItems: 4
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
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,dispcc-sc7180.h>
> +    #include <dt-bindings/clock/qcom,gcc-sc7180.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interconnect/qcom,sdm845.h>
> +    mdss: mdss@ae00000 {
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
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
> new file mode 100644
> index 0000000..e02a24b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
> @@ -0,0 +1,229 @@
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
> +  "mdss":
> +    type: object
> +    description: |
> +      Node containing MDSS that encapsulated sub-blocks like DPU, DSI and DP
> +      interfaces.
> +
> +    properties:
> +     compatible:
> +       items:
> +         - const: qcom,sdm845-mdss
> +
> +     reg:
> +       maxItems: 1
> +
> +     reg-names:
> +       const: mdss
> +
> +     power-domains:
> +       maxItems: 1
> +
> +     clocks:
> +       maxItems: 3
> +
> +     clock-names:
> +       description: |
> +         Device clock names in the same order as mentioned in clocks property.
> +         The required clocks are mentioned below.
> +       items:
> +         - const: iface
> +         - const: bus
> +         - const: core
> +
> +     interrupts:
> +       maxItems: 1
> +
> +     interrupt-controller: true
> +
> +     "#interrupt-cells":
> +       const: 1
> +
> +     iommus:
> +       maxItems: 2
> +
> +     "#address-cells":
> +       const: 2
> +
> +     "#size-cells":
> +       const: 2
> +
> +     ranges: true
> +
> +     assigned-clocks:
> +       description: |
> +         Optional list of clock specifiers for clocks needing rate assignment (optional).
> +       maxItems: 1
> +
> +     assigned-clock-rates:
> +       description: |
> +         List of clock frequencies sorted in the same order as the
> +         assigned-clocks property (optional).
> +       maxItems: 1
> +
> +     "mdss_mdp":

Why is this a different name from sc7180?

> +       type: object
> +       description: Node containing the properties of DPU.
> +
> +       properties:
> +         compatible:
> +           items:
> +             - const: qcom,sc7180-dpu

sdm845?

> +
> +         reg:
> +           maxItems: 2
> +
> +         reg-names:
> +           items:
> +             - const: mdp
> +             - const: vbif
> +
> +         clocks:
> +           maxItems: 4
> +
> +         clock-names:
> +           description: |
> +             Device clock names, must be in same order as clocks property.
> +             The following clocks are required.
> +           items:
> +             - const: bus
> +             - const: iface
> +             - const: core
> +             - const: vsync
> +
> +         interrupts:
> +           maxItems: 1
> +
> +         ports:
> +           type: object
> +           description: |
> +             Contains the list of output ports from DPU device. These ports
> +             connect to interfaces that are external to the DPU hardware,
> +             such as DSI, DP etc. Each output port contains an endpoint that
> +             describes how it is connected to an external interface. These
> +             are described by the standard properties documented in files
> +             mentioned below.
> +
> +             Documentation/devicetree/bindings/graph.txt
> +             Documentation/devicetree/bindings/media/video-interfaces.txt
> +
> +           properties:
> +             port@0:
> +               type: object
> +               description: DPU_INTF1 (DSI1)
> +             port@1:
> +               type: object
> +               description: DPU_INTF2 (DSI2)
> +
> +         assigned-clocks:
> +           description: |
> +             Optional List of clock specifiers for clocks needing rate assignment (optional).
> +           maxItems: 2
> +
> +         assigned-clock-rates:
> +           description: |
> +             List of clock frequencies sorted in the same order as the
> +             assigned-clocks property (optional).
> +           maxItems: 2
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
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +- |
> +    #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
> +    #include <dt-bindings/clock/qcom,gcc-sdm845.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    mdss: mdss@ae00000 {
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
> +    };
> +...
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
