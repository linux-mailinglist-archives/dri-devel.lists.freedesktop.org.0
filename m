Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70DB238CD92
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 20:37:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A5FF6F8D9;
	Fri, 21 May 2021 18:37:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
 [209.85.210.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 248E46F8D8;
 Fri, 21 May 2021 18:37:06 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id
 d25-20020a0568300459b02902f886f7dd43so18885433otc.6; 
 Fri, 21 May 2021 11:37:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pH1GElQaiatGz/2tDineQ9TDTKVmWxAWgI0svaPmNKw=;
 b=oiU6T5AkW7pZkqblHYM91nN3NreSTGp5AJ269voGUMSWqcL/hFmUe3/Yx4R9S8XwpK
 5IHO+uQM9E32UvbY/5AGEzrnQIBSjQqD7puuT2xjlUDiTfqbTL57mCGO1UWfWsY0fSU8
 Lq4D3Q7q29oJ/XoA9+9hxcKCMTt1e++6qanmzFVEZP5Gt4mfyhURi2K9I6L9u/g6C1zU
 1hQn9KmPKgN64h3BdGk1UbbrsuOXJM0d9OGXwfKzqlT7oIfbtb8hB3n/sNpa6buvmkcM
 dK1tI+f+kVugJvafKQgmL7DknQng49XAg1qBW3IYplQGBfIRv8flzmnQzWgSAS2cviET
 If0A==
X-Gm-Message-State: AOAM532uj92wHwJ17QApiibb6dtBnduNdVvNHcgSzw8vJJoh8laATIj8
 vbZDXdjeUD7IlKRDqEvzlg==
X-Google-Smtp-Source: ABdhPJySTjgqRRd9Tx3ipFslRU0T5rJULGHTrTVa3ea0WAhdyshIb9u/jZLer23RCUNp83zn+YTWGA==
X-Received: by 2002:a9d:ea2:: with SMTP id 31mr9977176otj.200.1621622225477;
 Fri, 21 May 2021 11:37:05 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id d185sm1281475oib.25.2021.05.21.11.37.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 May 2021 11:37:04 -0700 (PDT)
Received: (nullmailer pid 177067 invoked by uid 1000);
 Fri, 21 May 2021 18:37:03 -0000
Date: Fri, 21 May 2021 13:37:03 -0500
From: Rob Herring <robh@kernel.org>
To: Krishna Manikandan <mkrishn@codeaurora.org>
Subject: Re: [PATCH v17 2/4] dt-bindings: msm: dsi: add yaml schemas for DSI
 bindings
Message-ID: <20210521183703.GA164594@robh.at.kernel.org>
References: <1621592844-6414-1-git-send-email-mkrishn@codeaurora.org>
 <1621592844-6414-2-git-send-email-mkrishn@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1621592844-6414-2-git-send-email-mkrishn@codeaurora.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 21, 2021 at 03:57:22PM +0530, Krishna Manikandan wrote:
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
> 
> Changes in v7:
>     - Add reference for ports and data-lanes (Rob Herring)
>     - Add maxItems and minItems for data-lanes (Rob Herring)
> 
> Changes in v8:
>     - Drop common properties and description from ports (Rob Herring)
>     - Add reference for endpoint (Rob Herring)
>     - Add correct reference for data-lanes (Rob Herring)
>     - Drop common properties from required list for ports (Rob Herring)

I think I said it before, but move the changelogs in this series after 
the '---' so they are dropped when committed. That's not the usual DRM 
way, but this case has particularly useless revision history to capture.

> ---
>  .../bindings/display/msm/dsi-controller-main.yaml  | 185 +++++++++++++++
>  .../devicetree/bindings/display/msm/dsi.txt        | 249 ---------------------
>  2 files changed, 185 insertions(+), 249 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/msm/dsi.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> new file mode 100644
> index 0000000..df6a750
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> @@ -0,0 +1,185 @@
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
> +  power-domains:
> +    maxItems: 1
> +
> +  operating-points-v2: true
> +
> +  ports:
> +    $ref: "/schemas/graph.yaml#/properties/ports"
> +    description: |
> +      Contains DSI controller input and output ports as children, each
> +      containing one endpoint subnode.
> +
> +    properties:
> +      port@0:
> +        $ref: "/schemas/graph.yaml#/properties/port"
> +        description: |
> +          Input endpoints of the controller.
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#

               unevaluatedProperties: false

> +            properties:
> +              data-lanes:
> +                $ref: /schemas/types.yaml#/definitions/uint32-array

This already has a type in video-interfaces.yaml, so drop.

> +                maxItems: 4
> +                minItems: 4
> +                items:
> +                  enum: [ 0, 1, 2, 3 ]
> +
> +      port@1:
> +        $ref: "/schemas/graph.yaml#/properties/port"
> +        description: |
> +          Output endpoints of the controller.
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#

               unevaluatedProperties: false

> +            properties:
> +              data-lanes:
> +                $ref: /schemas/types.yaml#/definitions/uint32-array

And here.

> +                maxItems: 4
> +                minItems: 4
> +                items:
> +                  enum: [ 0, 1, 2, 3 ]
> +
> +    required:
> +      - port@0
> +      - port@1
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
> +  - power-domains
> +  - operating-points-v2
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +     #include <dt-bindings/interrupt-controller/arm-gic.h>
> +     #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
> +     #include <dt-bindings/clock/qcom,gcc-sdm845.h>
> +     #include <dt-bindings/power/qcom-rpmpd.h>
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
> +           power-domains = <&rpmhpd SC7180_CX>;
> +           operating-points-v2 = <&dsi_opp_table>;
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
> -
> -DSI PHY:
> -Required properties:
> -- compatible: Could be the following
> -  * "qcom,dsi-phy-28nm-hpm"
> -  * "qcom,dsi-phy-28nm-lp"
> -  * "qcom,dsi-phy-20nm"
> -  * "qcom,dsi-phy-28nm-8960"
> -  * "qcom,dsi-phy-14nm"
> -  * "qcom,dsi-phy-14nm-660"
> -  * "qcom,dsi-phy-10nm"
> -  * "qcom,dsi-phy-10nm-8998"
> -  * "qcom,dsi-phy-7nm"
> -  * "qcom,dsi-phy-7nm-8150"
> -- reg: Physical base address and length of the registers of PLL, PHY. Some
> -  revisions require the PHY regulator base address, whereas others require the
> -  PHY lane base address. See below for each PHY revision.
> -- reg-names: The names of register regions. The following regions are required:
> -  For DSI 28nm HPM/LP/8960 PHYs and 20nm PHY:
> -  * "dsi_pll"
> -  * "dsi_phy"
> -  * "dsi_phy_regulator"
> -  For DSI 14nm, 10nm and 7nm PHYs:
> -  * "dsi_pll"
> -  * "dsi_phy"
> -  * "dsi_phy_lane"
> -- clock-cells: Must be 1. The DSI PHY block acts as a clock provider, creating
> -  2 clocks: A byte clock (index 0), and a pixel clock (index 1).
> -- power-domains: Should be <&mmcc MDSS_GDSC>.
> -- clocks: Phandles to device clocks. See [1] for details on clock bindings.
> -- clock-names: the following clocks are required:
> -  * "iface"
> -  * "ref" (only required for new DTS files/entries)
> -  For 28nm HPM/LP, 28nm 8960 PHYs:
> -- vddio-supply: phandle to vdd-io regulator device node
> -  For 20nm PHY:
> -- vddio-supply: phandle to vdd-io regulator device node
> -- vcca-supply: phandle to vcca regulator device node
> -  For 14nm PHY:
> -- vcca-supply: phandle to vcca regulator device node
> -  For 10nm and 7nm PHY:
> -- vdds-supply: phandle to vdds regulator device node
> -
> -Optional properties:
> -- qcom,dsi-phy-regulator-ldo-mode: Boolean value indicating if the LDO mode PHY
> -  regulator is wanted.
> -- qcom,mdss-mdp-transfer-time-us:	Specifies the dsi transfer time for command mode
> -					panels in microseconds. Driver uses this number to adjust
> -					the clock rate according to the expected transfer time.
> -					Increasing this value would slow down the mdp processing
> -					and can result in slower performance.
> -					Decreasing this value can speed up the mdp processing,
> -					but this can also impact power consumption.
> -					As a rule this time should not be higher than the time
> -					that would be expected with the processing at the
> -					dsi link rate since anyways this would be the maximum
> -					transfer time that could be achieved.
> -					If ping pong split is enabled, this time should not be higher
> -					than two times the dsi link rate time.
> -					If the property is not specified, then the default value is 14000 us.
> -
> -[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
> -[2] Documentation/devicetree/bindings/graph.txt
> -[3] Documentation/devicetree/bindings/media/video-interfaces.txt
> -[4] Documentation/devicetree/bindings/display/panel/
> -
> -Example:
> -	dsi0: dsi@fd922800 {
> -		compatible = "qcom,mdss-dsi-ctrl";
> -		qcom,dsi-host-index = <0>;
> -		interrupt-parent = <&mdp>;
> -		interrupts = <4 0>;
> -		reg-names = "dsi_ctrl";
> -		reg = <0xfd922800 0x200>;
> -		power-domains = <&mmcc MDSS_GDSC>;
> -		clock-names =
> -			"bus",
> -			"byte",
> -			"core",
> -			"core_mmss",
> -			"iface",
> -			"mdp_core",
> -			"pixel";
> -		clocks =
> -			<&mmcc MDSS_AXI_CLK>,
> -			<&mmcc MDSS_BYTE0_CLK>,
> -			<&mmcc MDSS_ESC0_CLK>,
> -			<&mmcc MMSS_MISC_AHB_CLK>,
> -			<&mmcc MDSS_AHB_CLK>,
> -			<&mmcc MDSS_MDP_CLK>,
> -			<&mmcc MDSS_PCLK0_CLK>;
> -
> -		assigned-clocks =
> -				 <&mmcc BYTE0_CLK_SRC>,
> -				 <&mmcc PCLK0_CLK_SRC>;
> -		assigned-clock-parents =
> -				 <&dsi_phy0 0>,
> -				 <&dsi_phy0 1>;
> -
> -		vdda-supply = <&pma8084_l2>;
> -		vdd-supply = <&pma8084_l22>;
> -		vddio-supply = <&pma8084_l12>;
> -
> -		phys = <&dsi_phy0>;
> -		phy-names ="dsi-phy";
> -
> -		qcom,dual-dsi-mode;
> -		qcom,master-dsi;
> -		qcom,sync-dual-dsi;
> -
> -		qcom,mdss-mdp-transfer-time-us = <12000>;
> -
> -		pinctrl-names = "default", "sleep";
> -		pinctrl-0 = <&dsi_active>;
> -		pinctrl-1 = <&dsi_suspend>;
> -
> -		ports {
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -
> -			port@0 {
> -				reg = <0>;
> -				dsi0_in: endpoint {
> -					remote-endpoint = <&mdp_intf1_out>;
> -				};
> -			};
> -
> -			port@1 {
> -				reg = <1>;
> -				dsi0_out: endpoint {
> -					remote-endpoint = <&panel_in>;
> -					data-lanes = <0 1 2 3>;
> -				};
> -			};
> -		};
> -
> -		panel: panel@0 {
> -			compatible = "sharp,lq101r1sx01";
> -			reg = <0>;
> -			link2 = <&secondary>;
> -
> -			power-supply = <...>;
> -			backlight = <...>;
> -
> -			port {
> -				panel_in: endpoint {
> -					remote-endpoint = <&dsi0_out>;
> -				};
> -			};
> -		};
> -	};
> -
> -	dsi_phy0: dsi-phy@fd922a00 {
> -		compatible = "qcom,dsi-phy-28nm-hpm";
> -		qcom,dsi-phy-index = <0>;
> -		reg-names =
> -			"dsi_pll",
> -			"dsi_phy",
> -			"dsi_phy_regulator";
> -		reg =   <0xfd922a00 0xd4>,
> -			<0xfd922b00 0x2b0>,
> -			<0xfd922d80 0x7b>;
> -		clock-names = "iface";
> -		clocks = <&mmcc MDSS_AHB_CLK>;
> -		#clock-cells = <1>;
> -		vddio-supply = <&pma8084_l12>;
> -
> -		qcom,dsi-phy-regulator-ldo-mode;
> -	};
> -- 
> 2.7.4
> 
