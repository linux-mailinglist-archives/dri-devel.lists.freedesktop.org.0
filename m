Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF2138CA85
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 18:00:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 488E86ED18;
	Fri, 21 May 2021 16:00:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE6F16EC9F
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 16:00:32 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 u25-20020a0568302319b02902ac3d54c25eso18487773ote.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 09:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=H63HtpaE+6Xg3N3fCciau2vnWnPyL31t9ItUFtyRdok=;
 b=QZuIb1L8Cww3FE7u/iFMOZm50aekfIs+zrZYX9X0xwy6iRDtY5kWNsIHTBbPIHCpuU
 BWnGfW7MXZqPAq4JDbctBsR919m7XzMICQJBogrnv+NRhl03wE6A5sK+1rU6PdmGmqHm
 Yqn0Euw+zfU373uQrd5n60RWRTWFZwViL2CQC6ovDdnXSGOnd3nlYN8UDMWrL1n6MYQR
 muFXMesZUnCCXt0GtvwRGTZjxKr2GmUKYSRyHuhyHLCEyfGKcn8KupXoQNjKaBsqvEJC
 FhFzIbsLlQ4o4z4HOlQqUV4JRuFU5r/+ge3eKVYLRCpqaeMERhMmzV12CS8p3tgku6aa
 K8mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=H63HtpaE+6Xg3N3fCciau2vnWnPyL31t9ItUFtyRdok=;
 b=M5CAqQVAuhBENLkn6+7oPxbUhW4EY8K+hjAukjuCheMQfiCQFlXK5okqtpDTMzEYOY
 7hNUs1gaMyznqU8QWAdgWjXwmlWisOtj7ckCzO5FUlrVTNaV1pghEDoS84Jm/1itGpTx
 CusdOrFsvic8VlwDixiGcyY+AoD9kTUMQZxclHPwcuh0ZxMYmEXu3VYVcopMujjqAndY
 XM6/LZtKnNliR10JEmNFgA95U4P2pPJxxt6hyHdPBlbLTLdLrfX2ipoiSOJZGAhhJais
 fJL5CL4W30d0wXpVC5C1paw3dI3aaXiUh23aQIVIzXlKCcOYUFlwOLIm37bTnjvE15+F
 eX0Q==
X-Gm-Message-State: AOAM533cMISNXiFwcPdVAH8zzWnFkxQvBBi6+9G4suTNQQaMy1DQVAxs
 VVLHLVSp669jQpT8MjiJbvI7OQ==
X-Google-Smtp-Source: ABdhPJxVYsBy/bGxAKrQ+85jYaJthqjgGvNjNriEMYLFbGFw4brOKshTM3SBpMd4+avuCFoQSzGFzw==
X-Received: by 2002:a05:6830:109a:: with SMTP id
 y26mr8900044oto.164.1621612832077; 
 Fri, 21 May 2021 09:00:32 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id i9sm1275832oog.17.2021.05.21.09.00.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 May 2021 09:00:31 -0700 (PDT)
Date: Fri, 21 May 2021 11:00:29 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Krishna Manikandan <mkrishn@codeaurora.org>
Subject: Re: [PATCH v17 1/4] dt-bindings: msm: disp: add yaml schemas for DPU
 bindings
Message-ID: <20210521160029.GA2484@yoga>
References: <1621592844-6414-1-git-send-email-mkrishn@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1621592844-6414-1-git-send-email-mkrishn@codeaurora.org>
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
 swboyd@chromium.org, khsieh@codeaurora.org, robh+dt@kernel.org,
 tanmay@codeaurora.org, kalyan_t@codeaurora.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri 21 May 05:27 CDT 2021, Krishna Manikandan wrote:
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
[..]
> +      ports:
> +        $ref: /schemas/graph.yaml#/properties/ports
> +        description: |
> +          Contains the list of output ports from DPU device. These ports
> +          connect to interfaces that are external to the DPU hardware,
> +          such as DSI, DP etc. Each output port contains an endpoint that
> +          describes how it is connected to an external interface.
> +
> +        properties:
> +          port@0:
> +            $ref: /schemas/graph.yaml#/properties/port
> +            description: DPU_INTF1 (DSI1)
> +
> +          port@2:
> +            $ref: /schemas/graph.yaml#/properties/port
> +            description: DPU_INTF0 (DP)

Why is port@0 INTF1 and why is port@2 INTF0? In the binding you're
translating the two ports that are described are 0 and 1, representing
INTF1 and INTF2, or DSI1 and DSI2, respectively.

Further more, I have a need for somehow describing the pairing of 4 DP
INTFs (INTF 0, 3, 4 and 5) and how they are connected to the 3+1 DP+eDP
controllers.

Downstream this seems to be handled by adding cell-index to the DP
controllers and then matching that against the numbering in the driver's
INTF array. But rather than adding cell-index to map this, can't we
define that the port index is the INTF-number here?


This would obviously break compatibility with existing DTBs, but we
could start by doing it selectively for the new compatibles, fix up the
existing dts files and then drop the selective application after 1 or 2
LTS releases.

> +
> +        required:
> +          - port@0

Does this imply that I am not allowed to build a product on sc7180 that
only has DP output?

> +
> +    required:
> +      - compatible
> +      - reg
> +      - reg-names
> +      - clocks
> +      - interrupts
> +      - power-domains
> +      - operating-points-v2
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
> +additionalProperties: false
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
> +                   power-domains = <&rpmhpd SC7180_CX>;
> +                   operating-points-v2 = <&mdp_opp_table>;
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

The indentation is inconsistent among the ports.

> +                   };
> +         };
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
> new file mode 100644
> index 0000000..b4ea7c9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
> @@ -0,0 +1,212 @@
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
> +  Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
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
> +  "#address-cells": true
> +
> +  "#size-cells": true
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
> +      power-domains:
> +        maxItems: 1
> +
> +      operating-points-v2: true

You have a blank line between all other properties, but not here.

> +      ports:
> +        $ref: /schemas/graph.yaml#/properties/ports
> +        description: |
> +          Contains the list of output ports from DPU device. These ports
> +          connect to interfaces that are external to the DPU hardware,
> +          such as DSI, DP etc. Each output port contains an endpoint that
> +          describes how it is connected to an external interface.
> +
> +        properties:
> +          port@0:
> +            $ref: /schemas/graph.yaml#/properties/port
> +            description: DPU_INTF1 (DSI1)
> +
> +          port@1:
> +            $ref: /schemas/graph.yaml#/properties/port
> +            description: DPU_INTF2 (DSI2)
> +
> +        required:
> +          - port@0
> +          - port@1

In what sense are both these required?

> +

Regards,
Bjorn
