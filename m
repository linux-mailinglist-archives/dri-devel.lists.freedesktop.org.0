Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A929F374E42
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 06:11:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78E0F6EC97;
	Thu,  6 May 2021 04:10:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 126A66EAAE
 for <dri-devel@lists.freedesktop.org>; Thu,  6 May 2021 04:10:51 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1620274254; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=l43av0MNdasuSlRaWS4HbE7aHdm8Jr27+otQGPeLkDA=;
 b=XrPorc9REep0UaNNIuuID6Eb8DKs1bTNm894z2unRkoBK1sCdmV2Tu2KRLK0oSvUdoIvns8V
 TEFXCa5bKMHa4e5rLZnnNhrWoD8lEExXBgq9TpgI5zsMI8uNF0sB5tR7K7ff/Z/OeofTPZ3F
 PRiAM5jtzcJLgc4lqV0AS8YDqgM=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 60936c3e03cfff345221c64b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 06 May 2021 04:10:38
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id D3A1EC43460; Thu,  6 May 2021 04:10:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: mkrishn)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 0D354C433D3;
 Thu,  6 May 2021 04:10:35 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 06 May 2021 09:40:35 +0530
From: mkrishn@codeaurora.org
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v15 2/4] dt-bindings: msm: dsi: add yaml schemas for DSI
 bindings
In-Reply-To: <20210408150300.GA1476562@robh.at.kernel.org>
References: <1617620770-26202-1-git-send-email-mkrishn@codeaurora.org>
 <1617620770-26202-2-git-send-email-mkrishn@codeaurora.org>
 <20210408150300.GA1476562@robh.at.kernel.org>
Message-ID: <827048554933585f4cc42c94aa911e55@codeaurora.org>
X-Sender: mkrishn@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
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

On 2021-04-08 20:33, Rob Herring wrote:
> On Mon, Apr 05, 2021 at 04:36:08PM +0530, Krishna Manikandan wrote:
>> Add YAML schema for the device tree bindings for DSI
>> 
>> Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
>> 
>> Changes in v1:
>>     - Separate dsi controller bindings to a separate patch (Stephen 
>> Boyd)
>>     - Merge dsi-common-controller.yaml and dsi-controller-main.yaml to
>>       a single file (Stephen Boyd)
>>     - Drop supply entries and definitions from properties (Stephen 
>> Boyd)
>>     - Modify phy-names property for dsi controller (Stephen Boyd)
>>     - Remove boolean from description (Stephen Boyd)
>>     - Drop pinctrl properties as they are standard entries (Stephen 
>> Boyd)
>>     - Modify the description for ports property and keep the reference
>>       to the generic binding where this is defined (Stephen Boyd)
>>     - Add description to clock names (Stephen Boyd)
>>     - Correct the indendation (Stephen Boyd)
>>     - Drop the label for display dt nodes and correct the node
>>       name (Stephen Boyd)
>> 
>> Changes in v2:
>>     - Drop maxItems for clock (Stephen Boyd)
>>     - Drop qcom,mdss-mdp-transfer-time-us as it is not used in 
>> upstream
>>       dt file (Stephen Boyd)
>>     - Keep child node directly under soc node (Stephen Boyd)
>>     - Drop qcom,sync-dual-dsi as it is not used in upstream dt
>> 
>> Changes in v3:
>>     - Add description for register property (Stephen Boyd)
>> 
>> Changes in v4:
>>     - Add maxItems for phys property (Stephen Boyd)
>>     - Add maxItems for reg property (Stephen Boyd)
>>     - Add reference for data-lanes property (Stephen Boyd)
>>     - Remove soc from example (Stephen Boyd)
>> 
>> Changes in v5:
>>     - Modify title and description (Stephen Boyd)
>>     - Add required properties for ports node (Stephen Boyd)
>>     - Add data-lanes in the example (Stephen Boyd)
>>     - Drop qcom,master-dsi property (Stephen Boyd)
>> 
>> Changes in v6:
>>     - Add required properties for port@0, port@1 and corresponding
>>       endpoints (Stephen Boyd)
>>     - Add address-cells and size-cells for ports (Stephen Boyd)
>>     - Use additionalProperties instead of unevaluatedProperties 
>> (Stephen Boyd)
>> ---
>>  .../bindings/display/msm/dsi-controller-main.yaml  | 213 
>> ++++++++++++++++++
>>  .../devicetree/bindings/display/msm/dsi.txt        | 249 
>> ---------------------
>>  2 files changed, 213 insertions(+), 249 deletions(-)
>>  create mode 100644 
>> Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
>>  delete mode 100644 
>> Documentation/devicetree/bindings/display/msm/dsi.txt
>> 
>> diff --git 
>> a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml 
>> b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
>> new file mode 100644
>> index 0000000..7858524
>> --- /dev/null
>> +++ 
>> b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
>> @@ -0,0 +1,213 @@
>> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: 
>> http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Display DSI controller
>> +
>> +maintainers:
>> +  - Krishna Manikandan <mkrishn@codeaurora.org>
>> +
>> +allOf:
>> +  - $ref: "../dsi-controller.yaml#"
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - const: qcom,mdss-dsi-ctrl
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  reg-names:
>> +    const: dsi_ctrl
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    items:
>> +      - description: Display byte clock
>> +      - description: Display byte interface clock
>> +      - description: Display pixel clock
>> +      - description: Display escape clock
>> +      - description: Display AHB clock
>> +      - description: Display AXI clock
>> +
>> +  clock-names:
>> +    items:
>> +      - const: byte
>> +      - const: byte_intf
>> +      - const: pixel
>> +      - const: core
>> +      - const: iface
>> +      - const: bus
>> +
>> +  phys:
>> +    maxItems: 1
>> +
>> +  phy-names:
>> +    const: dsi
>> +
>> +  "#address-cells": true
>> +
>> +  "#size-cells": true
>> +
>> +  syscon-sfpb:
>> +    description: A phandle to mmss_sfpb syscon node (only for DSIv2).
>> +    $ref: "/schemas/types.yaml#/definitions/phandle"
>> +
>> +  qcom,dual-dsi-mode:
>> +    type: boolean
>> +    description: |
>> +      Indicates if the DSI controller is driving a panel which needs
>> +      2 DSI links.
>> +
>> +  ports:
> 
> Same issues in this one.
> 
>> +    $ref: "/schemas/graph.yaml#/properties/port"
>> +    type: object
>> +    description: |
>> +      Contains DSI controller input and output ports as children, 
>> each
>> +      containing one endpoint subnode.
>> +
>> +    properties:
>> +      port@0:
>> +        type: object
>> +        description: |
>> +          Input endpoints of the controller.
>> +
>> +        properties:
>> +          reg:
>> +            const: 0
>> +
>> +          endpoint:
>> +            type: object
>> +            properties:
>> +              remote-endpoint:
> 
> Don't need to describe this, the common schema does.
> 
>> +                description: |
>> +                  For port@1, set to phandle of the connected 
>> panel/bridge's
>> +                  input endpoint. For port@0, set to the MDP 
>> interface output.
>> +
>> +              data-lanes:
>> +                $ref: "/schemas/media/video-interfaces.yaml#"
> 
> Not how this reference works. Look at other examples.
> 
>> +                description: |
>> +                  This describes how the physical DSI data lanes are 
>> mapped
>> +                  to the logical lanes on the given platform. The 
>> value contained in
>> +                  index n describes what physical lane is mapped to 
>> the logical lane n
>> +                  (DATAn, where n lies between 0 and 3). The clock 
>> lane position is fixed
>> +                  and can't be changed. Hence, they aren't a part of 
>> the DT bindings.
>> +
>> +                items:
>> +                  - const: 0
>> +                  - const: 1
>> +                  - const: 2
>> +                  - const: 3
> 
> If this is the only possible value, why does it need to be in DT?
Hi Rob,
These are the possible values:
-    <0 1 2 3>
-    <1 2 3 0>
-    <2 3 0 1>
-    <3 0 1 2>
-    <0 3 2 1>
-    <1 0 3 2>
-    <2 1 0 3>
-    <3 2 1 0>

Shall I follow the below mentioned approach for defining these values ?
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
   - items:
     - const: 2
     - const: 3
     - const: 0
     - const: 1
   - items:
     - const: 3
     - const: 0
     - const: 1
     - const: 2
   - items:
     - const: 0
     - const: 3
     - const: 2
     - const: 1
   - items:
     - const: 1
     - const: 0
     - const: 3
     - const: 2
   - items:
     - const: 2
     - const: 1
     - const: 0
     - const: 3
   - items:
     - const: 3
     - const: 2
     - const: 1
     - const: 0

Thanks,
Krishna
> 
>> +
>> +            required:
>> +              - remote-endpoint
>> +
>> +        required:
>> +          - reg
>> +          - endpoint
>> +
>> +      port@1:
>> +        type: object
>> +        description: |
>> +          Output endpoints of the controller.
>> +        properties:
>> +          reg:
>> +            const: 1
>> +
>> +          endpoint:
>> +            type: object
>> +            properties:
>> +              remote-endpoint: true
>> +              data-lanes:
>> +                items:
>> +                  - const: 0
>> +                  - const: 1
>> +                  - const: 2
>> +                  - const: 3
>> +
>> +            required:
>> +              - remote-endpoint
>> +              - data-lanes
>> +
>> +        required:
>> +          - reg
>> +          - endpoint
>> +
>> +    required:
>> +      - port@0
>> +      - port@1
>> +      - "#address-cells"
>> +      - "#size-cells"
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reg-names
>> +  - interrupts
>> +  - clocks
>> +  - clock-names
>> +  - phys
>> +  - phy-names
>> +  - ports
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +     #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +     #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
>> +     #include <dt-bindings/clock/qcom,gcc-sdm845.h>
>> +
>> +     dsi@ae94000 {
>> +           compatible = "qcom,mdss-dsi-ctrl";
>> +           reg = <0x0ae94000 0x400>;
>> +           reg-names = "dsi_ctrl";
>> +
>> +           #address-cells = <1>;
>> +           #size-cells = <0>;
>> +
>> +           interrupt-parent = <&mdss>;
>> +           interrupts = <4>;
>> +
>> +           clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
>> +                    <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
>> +                    <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
>> +                    <&dispcc DISP_CC_MDSS_ESC0_CLK>,
>> +                    <&dispcc DISP_CC_MDSS_AHB_CLK>,
>> +                    <&dispcc DISP_CC_MDSS_AXI_CLK>;
>> +           clock-names = "byte",
>> +                         "byte_intf",
>> +                         "pixel",
>> +                         "core",
>> +                         "iface",
>> +                         "bus";
>> +
>> +           phys = <&dsi0_phy>;
>> +           phy-names = "dsi";
>> +
>> +           ports {
>> +                  #address-cells = <1>;
>> +                  #size-cells = <0>;
>> +
>> +                  port@0 {
>> +                          reg = <0>;
>> +                          dsi0_in: endpoint {
>> +                                   remote-endpoint = 
>> <&dpu_intf1_out>;
>> +                          };
>> +                  };
>> +
>> +                  port@1 {
>> +                          reg = <1>;
>> +                          dsi0_out: endpoint {
>> +                                   remote-endpoint = <&sn65dsi86_in>;
>> +                                   data-lanes = <0 1 2 3>;
>> +                          };
>> +                  };
>> +           };
>> +     };
>> +...
>> diff --git a/Documentation/devicetree/bindings/display/msm/dsi.txt 
>> b/Documentation/devicetree/bindings/display/msm/dsi.txt
>> deleted file mode 100644
>> index b9a64d3..0000000
>> --- a/Documentation/devicetree/bindings/display/msm/dsi.txt
>> +++ /dev/null
>> @@ -1,249 +0,0 @@
>> -Qualcomm Technologies Inc. adreno/snapdragon DSI output
>> -
>> -DSI Controller:
>> -Required properties:
>> -- compatible:
>> -  * "qcom,mdss-dsi-ctrl"
>> -- reg: Physical base address and length of the registers of 
>> controller
>> -- reg-names: The names of register regions. The following regions are 
>> required:
>> -  * "dsi_ctrl"
>> -- interrupts: The interrupt signal from the DSI block.
>> -- power-domains: Should be <&mmcc MDSS_GDSC>.
>> -- clocks: Phandles to device clocks.
>> -- clock-names: the following clocks are required:
>> -  * "mdp_core"
>> -  * "iface"
>> -  * "bus"
>> -  * "core_mmss"
>> -  * "byte"
>> -  * "pixel"
>> -  * "core"
>> -  For DSIv2, we need an additional clock:
>> -   * "src"
>> -  For DSI6G v2.0 onwards, we need also need the clock:
>> -   * "byte_intf"
>> -- assigned-clocks: Parents of "byte" and "pixel" for the given 
>> platform.
>> -- assigned-clock-parents: The Byte clock and Pixel clock PLL outputs 
>> provided
>> -  by a DSI PHY block. See [1] for details on clock bindings.
>> -- vdd-supply: phandle to vdd regulator device node
>> -- vddio-supply: phandle to vdd-io regulator device node
>> -- vdda-supply: phandle to vdda regulator device node
>> -- phys: phandle to DSI PHY device node
>> -- phy-names: the name of the corresponding PHY device
>> -- syscon-sfpb: A phandle to mmss_sfpb syscon node (only for DSIv2)
>> -- ports: Contains 2 DSI controller ports as child nodes. Each port 
>> contains
>> -  an endpoint subnode as defined in [2] and [3].
>> -
>> -Optional properties:
>> -- panel@0: Node of panel connected to this DSI controller.
>> -  See files in [4] for each supported panel.
>> -- qcom,dual-dsi-mode: Boolean value indicating if the DSI controller 
>> is
>> -  driving a panel which needs 2 DSI links.
>> -- qcom,master-dsi: Boolean value indicating if the DSI controller is 
>> driving
>> -  the master link of the 2-DSI panel.
>> -- qcom,sync-dual-dsi: Boolean value indicating if the DSI controller 
>> is
>> -  driving a 2-DSI panel whose 2 links need receive command 
>> simultaneously.
>> -- pinctrl-names: the pin control state names; should contain 
>> "default"
>> -- pinctrl-0: the default pinctrl state (active)
>> -- pinctrl-n: the "sleep" pinctrl state
>> -- ports: contains DSI controller input and output ports as children, 
>> each
>> -  containing one endpoint subnode.
>> -
>> -  DSI Endpoint properties:
>> -  - remote-endpoint: For port@0, set to phandle of the connected 
>> panel/bridge's
>> -    input endpoint. For port@1, set to the MDP interface output. See 
>> [2] for
>> -    device graph info.
>> -
>> -  - data-lanes: this describes how the physical DSI data lanes are 
>> mapped
>> -    to the logical lanes on the given platform. The value contained 
>> in
>> -    index n describes what physical lane is mapped to the logical 
>> lane n
>> -    (DATAn, where n lies between 0 and 3). The clock lane position is 
>> fixed
>> -    and can't be changed. Hence, they aren't a part of the DT 
>> bindings. See
>> -    [3] for more info on the data-lanes property.
>> -
>> -    For example:
>> -
>> -    data-lanes = <3 0 1 2>;
>> -
>> -    The above mapping describes that the logical data lane DATA0 is 
>> mapped to
>> -    the physical data lane DATA3, logical DATA1 to physical DATA0, 
>> logic DATA2
>> -    to phys DATA1 and logic DATA3 to phys DATA2.
>> -
>> -    There are only a limited number of physical to logical mappings 
>> possible:
>> -    <0 1 2 3>
>> -    <1 2 3 0>
>> -    <2 3 0 1>
>> -    <3 0 1 2>
>> -    <0 3 2 1>
>> -    <1 0 3 2>
>> -    <2 1 0 3>
>> -    <3 2 1 0>
> 
> You've dropped all these?
