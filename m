Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 951133587BC
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 17:03:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9B756E091;
	Thu,  8 Apr 2021 15:03:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B7B16E091;
 Thu,  8 Apr 2021 15:03:05 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id
 t23-20020a0568301e37b02901b65ab30024so2580475otr.4; 
 Thu, 08 Apr 2021 08:03:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SV4hZa0zs5AcZMdGt9bkimLzwivqIkC6ZyBgCYFp1Lw=;
 b=SQhN9pKvttR6nDuhw/dWuZK22PZdustBj4q8OfYOnM5S7ECtzZtSSXN5SqaleYYoei
 Uu8NwltwevLPutW6qYFlKAukSe8sjUjdEhWCQOU0fPp4Q9feNhqOjvF1JRtcL2r7WZ2E
 tkO11+zeT317QhO5P0m+ghwztFNQOziDa99ljmEf2rbmWLmdmrmFHsWLxLpWe8nB7DnO
 lNJPTFCFskMIXc06BjSlXsuCZ5IYOJZXD+PYF/ty7QETIG2ZiJjemGUmM6b4IP7sR4yQ
 UZ1DpAE1av1nUAAo6C/6MjVZNV48FR+9rbLQMPzul2Duxok9RbNTxAOHTTtS0iKWB4Bi
 JSZQ==
X-Gm-Message-State: AOAM531M4iat7bqjjFYejhbwtlKaJT7VcRyh+Xn2IKsIV5XoHEEwX5Ip
 S5SMY7mdtw9v7CimPaSIGA==
X-Google-Smtp-Source: ABdhPJzi6rpj33prGGkcMj0NLncG6SamZf74JNn9Nbhlhro+ChXWCe6wI9iHQJyNvsgc8eiCKzffqQ==
X-Received: by 2002:a9d:6d87:: with SMTP id x7mr8032104otp.250.1617894182938; 
 Thu, 08 Apr 2021 08:03:02 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id c25sm6378200otk.35.2021.04.08.08.03.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 08:03:02 -0700 (PDT)
Received: (nullmailer pid 1482769 invoked by uid 1000);
 Thu, 08 Apr 2021 15:03:00 -0000
Date: Thu, 8 Apr 2021 10:03:00 -0500
From: Rob Herring <robh@kernel.org>
To: Krishna Manikandan <mkrishn@codeaurora.org>
Subject: Re: [PATCH v15 2/4] dt-bindings: msm: dsi: add yaml schemas for DSI
 bindings
Message-ID: <20210408150300.GA1476562@robh.at.kernel.org>
References: <1617620770-26202-1-git-send-email-mkrishn@codeaurora.org>
 <1617620770-26202-2-git-send-email-mkrishn@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1617620770-26202-2-git-send-email-mkrishn@codeaurora.org>
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

On Mon, Apr 05, 2021 at 04:36:08PM +0530, Krishna Manikandan wrote:
> Add YAML schema for the device tree bindings for DSI
> 
> Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
> 
> Changes in v1:
>     - Separate dsi controller bindings to a separate patch (Stephen Boyd)
>     - Merge dsi-common-controller.yaml and dsi-controller-main.yaml to
>       a single file (Stephen Boyd)
>     - Drop supply entries and definitions from properties (Stephen Boyd)
>     - Modify phy-names property for dsi controller (Stephen Boyd)
>     - Remove boolean from description (Stephen Boyd)
>     - Drop pinctrl properties as they are standard entries (Stephen Boyd)
>     - Modify the description for ports property and keep the reference
>       to the generic binding where this is defined (Stephen Boyd)
>     - Add description to clock names (Stephen Boyd)
>     - Correct the indendation (Stephen Boyd)
>     - Drop the label for display dt nodes and correct the node
>       name (Stephen Boyd)
> 
> Changes in v2:
>     - Drop maxItems for clock (Stephen Boyd)
>     - Drop qcom,mdss-mdp-transfer-time-us as it is not used in upstream
>       dt file (Stephen Boyd)
>     - Keep child node directly under soc node (Stephen Boyd)
>     - Drop qcom,sync-dual-dsi as it is not used in upstream dt
> 
> Changes in v3:
>     - Add description for register property (Stephen Boyd)
> 
> Changes in v4:
>     - Add maxItems for phys property (Stephen Boyd)
>     - Add maxItems for reg property (Stephen Boyd)
>     - Add reference for data-lanes property (Stephen Boyd)
>     - Remove soc from example (Stephen Boyd)
> 
> Changes in v5:
>     - Modify title and description (Stephen Boyd)
>     - Add required properties for ports node (Stephen Boyd)
>     - Add data-lanes in the example (Stephen Boyd)
>     - Drop qcom,master-dsi property (Stephen Boyd)
> 
> Changes in v6:
>     - Add required properties for port@0, port@1 and corresponding
>       endpoints (Stephen Boyd)
>     - Add address-cells and size-cells for ports (Stephen Boyd)
>     - Use additionalProperties instead of unevaluatedProperties (Stephen Boyd)
> ---
>  .../bindings/display/msm/dsi-controller-main.yaml  | 213 ++++++++++++++++++
>  .../devicetree/bindings/display/msm/dsi.txt        | 249 ---------------------
>  2 files changed, 213 insertions(+), 249 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/msm/dsi.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> new file mode 100644
> index 0000000..7858524
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> @@ -0,0 +1,213 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Display DSI controller
> +
> +maintainers:
> +  - Krishna Manikandan <mkrishn@codeaurora.org>
> +
> +allOf:
> +  - $ref: "../dsi-controller.yaml#"
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: qcom,mdss-dsi-ctrl
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
> +    items:
> +      - description: Display byte clock
> +      - description: Display byte interface clock
> +      - description: Display pixel clock
> +      - description: Display escape clock
> +      - description: Display AHB clock
> +      - description: Display AXI clock
> +
> +  clock-names:
> +    items:
> +      - const: byte
> +      - const: byte_intf
> +      - const: pixel
> +      - const: core
> +      - const: iface
> +      - const: bus
> +
> +  phys:
> +    maxItems: 1
> +
> +  phy-names:
> +    const: dsi
> +
> +  "#address-cells": true
> +
> +  "#size-cells": true
> +
> +  syscon-sfpb:
> +    description: A phandle to mmss_sfpb syscon node (only for DSIv2).
> +    $ref: "/schemas/types.yaml#/definitions/phandle"
> +
> +  qcom,dual-dsi-mode:
> +    type: boolean
> +    description: |
> +      Indicates if the DSI controller is driving a panel which needs
> +      2 DSI links.
> +
> +  ports:

Same issues in this one.

> +    $ref: "/schemas/graph.yaml#/properties/port"
> +    type: object
> +    description: |
> +      Contains DSI controller input and output ports as children, each
> +      containing one endpoint subnode.
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

Don't need to describe this, the common schema does.

> +                description: |
> +                  For port@1, set to phandle of the connected panel/bridge's
> +                  input endpoint. For port@0, set to the MDP interface output.
> +
> +              data-lanes:
> +                $ref: "/schemas/media/video-interfaces.yaml#"

Not how this reference works. Look at other examples.

> +                description: |
> +                  This describes how the physical DSI data lanes are mapped
> +                  to the logical lanes on the given platform. The value contained in
> +                  index n describes what physical lane is mapped to the logical lane n
> +                  (DATAn, where n lies between 0 and 3). The clock lane position is fixed
> +                  and can't be changed. Hence, they aren't a part of the DT bindings.
> +
> +                items:
> +                  - const: 0
> +                  - const: 1
> +                  - const: 2
> +                  - const: 3

If this is the only possible value, why does it need to be in DT?

> +
> +            required:
> +              - remote-endpoint
> +
> +        required:
> +          - reg
> +          - endpoint
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
> +                items:
> +                  - const: 0
> +                  - const: 1
> +                  - const: 2
> +                  - const: 3
> +
> +            required:
> +              - remote-endpoint
> +              - data-lanes
> +
> +        required:
> +          - reg
> +          - endpoint
> +
> +    required:
> +      - port@0
> +      - port@1
> +      - "#address-cells"
> +      - "#size-cells"
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
> +additionalProperties: false
> +
> +examples:
> +  - |
> +     #include <dt-bindings/interrupt-controller/arm-gic.h>
> +     #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
> +     #include <dt-bindings/clock/qcom,gcc-sdm845.h>
> +
> +     dsi@ae94000 {
> +           compatible = "qcom,mdss-dsi-ctrl";
> +           reg = <0x0ae94000 0x400>;
> +           reg-names = "dsi_ctrl";
> +
> +           #address-cells = <1>;
> +           #size-cells = <0>;
> +
> +           interrupt-parent = <&mdss>;
> +           interrupts = <4>;
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
> +                                   remote-endpoint = <&sn65dsi86_in>;
> +                                   data-lanes = <0 1 2 3>;
> +                          };
> +                  };
> +           };
> +     };
> +...
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi.txt b/Documentation/devicetree/bindings/display/msm/dsi.txt
> deleted file mode 100644
> index b9a64d3..0000000
> --- a/Documentation/devicetree/bindings/display/msm/dsi.txt
> +++ /dev/null
> @@ -1,249 +0,0 @@
> -Qualcomm Technologies Inc. adreno/snapdragon DSI output
> -
> -DSI Controller:
> -Required properties:
> -- compatible:
> -  * "qcom,mdss-dsi-ctrl"
> -- reg: Physical base address and length of the registers of controller
> -- reg-names: The names of register regions. The following regions are required:
> -  * "dsi_ctrl"
> -- interrupts: The interrupt signal from the DSI block.
> -- power-domains: Should be <&mmcc MDSS_GDSC>.
> -- clocks: Phandles to device clocks.
> -- clock-names: the following clocks are required:
> -  * "mdp_core"
> -  * "iface"
> -  * "bus"
> -  * "core_mmss"
> -  * "byte"
> -  * "pixel"
> -  * "core"
> -  For DSIv2, we need an additional clock:
> -   * "src"
> -  For DSI6G v2.0 onwards, we need also need the clock:
> -   * "byte_intf"
> -- assigned-clocks: Parents of "byte" and "pixel" for the given platform.
> -- assigned-clock-parents: The Byte clock and Pixel clock PLL outputs provided
> -  by a DSI PHY block. See [1] for details on clock bindings.
> -- vdd-supply: phandle to vdd regulator device node
> -- vddio-supply: phandle to vdd-io regulator device node
> -- vdda-supply: phandle to vdda regulator device node
> -- phys: phandle to DSI PHY device node
> -- phy-names: the name of the corresponding PHY device
> -- syscon-sfpb: A phandle to mmss_sfpb syscon node (only for DSIv2)
> -- ports: Contains 2 DSI controller ports as child nodes. Each port contains
> -  an endpoint subnode as defined in [2] and [3].
> -
> -Optional properties:
> -- panel@0: Node of panel connected to this DSI controller.
> -  See files in [4] for each supported panel.
> -- qcom,dual-dsi-mode: Boolean value indicating if the DSI controller is
> -  driving a panel which needs 2 DSI links.
> -- qcom,master-dsi: Boolean value indicating if the DSI controller is driving
> -  the master link of the 2-DSI panel.
> -- qcom,sync-dual-dsi: Boolean value indicating if the DSI controller is
> -  driving a 2-DSI panel whose 2 links need receive command simultaneously.
> -- pinctrl-names: the pin control state names; should contain "default"
> -- pinctrl-0: the default pinctrl state (active)
> -- pinctrl-n: the "sleep" pinctrl state
> -- ports: contains DSI controller input and output ports as children, each
> -  containing one endpoint subnode.
> -
> -  DSI Endpoint properties:
> -  - remote-endpoint: For port@0, set to phandle of the connected panel/bridge's
> -    input endpoint. For port@1, set to the MDP interface output. See [2] for
> -    device graph info.
> -
> -  - data-lanes: this describes how the physical DSI data lanes are mapped
> -    to the logical lanes on the given platform. The value contained in
> -    index n describes what physical lane is mapped to the logical lane n
> -    (DATAn, where n lies between 0 and 3). The clock lane position is fixed
> -    and can't be changed. Hence, they aren't a part of the DT bindings. See
> -    [3] for more info on the data-lanes property.
> -
> -    For example:
> -
> -    data-lanes = <3 0 1 2>;
> -
> -    The above mapping describes that the logical data lane DATA0 is mapped to
> -    the physical data lane DATA3, logical DATA1 to physical DATA0, logic DATA2
> -    to phys DATA1 and logic DATA3 to phys DATA2.
> -
> -    There are only a limited number of physical to logical mappings possible:
> -    <0 1 2 3>
> -    <1 2 3 0>
> -    <2 3 0 1>
> -    <3 0 1 2>
> -    <0 3 2 1>
> -    <1 0 3 2>
> -    <2 1 0 3>
> -    <3 2 1 0>

You've dropped all these?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
