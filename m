Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B5A8CA8EC
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 09:30:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99D8F10E22B;
	Tue, 21 May 2024 07:30:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RXwU1WUR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5553410E22B
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 07:30:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8108B62022;
 Tue, 21 May 2024 07:30:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40743C2BD11;
 Tue, 21 May 2024 07:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716276632;
 bh=2qmHpXwLWibIrPyOcn+S+r963k18i1mHmvdPzTnlcS0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=RXwU1WURy3nz0+Nw+UC2THf6WhIqgoRW6lr7XXq0MogTkwOu1PmNrg9KIiAOdQwqd
 cvhQp2WKU/D6oCcR95RVfQxhYKMxKkvODU3LW22gTr2LYlpa3f5dHnzCDhBIL4tyaQ
 R5o9sc8V1SNehvU0cGfY4xWE4gOQdXOcEdCHHmkhqj+ywDqTH7DuUfjLKOpIAmTHRj
 VCVRdslPPuXLomOP4PfS9rA+Y2K9r7P4ZM1OyDbkdeitmDwzbt0mlPy4SB7sV26CLw
 t0eInnw/TpucmJBEuXdYZ1Fad1ivlrlWrfWMzBx2CA+bmQb+7EwG0ppTkkJAsxzxNK
 gWhWfS6KthH3A==
Message-ID: <be622341-c849-4a6f-99f5-0de350693270@kernel.org>
Date: Tue, 21 May 2024 09:30:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/10] dt-bindings: display: Add YAML schema for JH7110
 display pipeline
To: keith <keith.zhao@starfivetech.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 xingyu.wu@starfivetech.com, p.zabel@pengutronix.de,
 jack.zhu@starfivetech.com, shengyang.chen@starfivetech.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20240521105817.3301-1-keith.zhao@starfivetech.com>
 <20240521105817.3301-2-keith.zhao@starfivetech.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240521105817.3301-2-keith.zhao@starfivetech.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/05/2024 12:58, keith wrote:
> JH7110 SoC display pipeline includes a display controller and hdmi.
> Dc controller IP : Vivante DC8200 Dual Display
> HDMI IP : INNOSILICON HDMI2.0
> 
> As the INNO hdmi ip is also used by rockchip SoC in the driver code,
> the innosilicon,inno-hdmi.yaml schema containing the common properties
> for the INNO DesignWare HDMI TX controller isn't a full device
> tree binding specification, but is meant to be referenced by
> platform-specific bindings for the IP core.
> 
> Signed-off-by: keith <keith.zhao@starfivetech.com>
> ---
>  .../display/bridge/innosilicon,inno-hdmi.yaml |  49 +++++
>  .../display/rockchip/rockchip,inno-hdmi.yaml  |  27 +--
>  .../starfive/starfive,dsi-encoder.yaml        |  92 ++++++++++
>  .../starfive/starfive,jh7110-dc8200.yaml      | 169 ++++++++++++++++++
>  .../starfive/starfive,jh7110-inno-hdmi.yaml   |  75 ++++++++
>  .../soc/starfive/starfive,jh7110-syscon.yaml  |   1 +
>  MAINTAINERS                                   |   8 +
>  7 files changed, 396 insertions(+), 25 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/innosilicon,inno-hdmi.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/starfive/starfive,dsi-encoder.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/starfive/starfive,jh7110-dc8200.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/starfive/starfive,jh7110-inno-hdmi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/innosilicon,inno-hdmi.yaml b/Documentation/devicetree/bindings/display/bridge/innosilicon,inno-hdmi.yaml
> new file mode 100644
> index 000000000000..8540174dcaeb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/innosilicon,inno-hdmi.yaml
> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/innosilicon,inno-hdmi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Common Properties for Innosilicon HDMI TX IP

Your patch is difficult to review. Split changing existing bindings (and
defining common part) to a separate patch.

> +
> +maintainers:
> +  - Keith Zhao <keith.zhao@starfivetech.com>
> +
> +description: |
> +  This document defines device tree properties for the Innosilicon HDMI TX

Nothing improved here. Don't say obvious that this documents says
something. It cannot do anything else.

"Innosilicon HDMI TX is a foo bar device present on zap SoC ...."


> +  controller (INNO HDMI) IP core. It doesn't constitute a full device tree
> +  binding specification by itself but is meant to be referenced by device tree
> +  bindings for the platform-specific integrations of the INNO HDMI.

I don't understand this at all. I don't know what is "full device tree
binding specification".

> +
> +  When referenced from platform device tree bindings the properties defined in
> +  this document are defined as follows. The platform device tree bindings are
> +  responsible for defining whether each property is required or optional.

Nothing improved - drop paragraph.

> +
> +properties:
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          Port node with one endpoint connected to a display controller node.
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          Port node with one endpoint connected to a hdmi-connector node.
> +
> +    required:
> +      - port@0
> +      - port@1

...

> diff --git a/Documentation/devicetree/bindings/display/starfive/starfive,dsi-encoder.yaml b/Documentation/devicetree/bindings/display/starfive/starfive,dsi-encoder.yaml
> new file mode 100644
> index 000000000000..07aa147a9db1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/starfive/starfive,dsi-encoder.yaml
> @@ -0,0 +1,92 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/starfive/starfive,dsi-encoder.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: starfive jh7110 SoC Encoder
> +
> +maintainers:
> +  - Keith Zhao <keith.zhao@starfivetech.com>
> +
> +description:
> +  Device-Tree bindings for simple encoder.

Again you ignored the comments.

When you receive a comment, apply it everywhere, not in only one part of
patch while keeping wrong code everywhere else.

> +  Simple encoder driver only has basic functionality.

Not related to bindings, drop. This is about hardware, not your driver.

> +  the hardware of dc8200 has 2 output interface, and uses
> +  syscon to select which one to be used.

Nothing improved.

Read my previous comments:

1. Please make it a proper sentences, with proper wrapping.

> +
> +properties:
> +  compatible:
> +    const: starfive,dsi-encoder
> +
> +  starfive,syscon:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      - items:
> +          - description: phandle to syscon that select crtc output.
> +          - description: Offset of crtc selection
> +          - description: Shift of crtc selection
> +    description:
> +      A phandle to syscon with two arguments that configure select output.
> +      The argument one is the offset of crtc selection, the
> +      argument two is the shift of crtc selection.

Don't repeat constraints in free form text. Say something useful
instead, like what is its purpose.

No reg? Then why this is not just part of syscon? That's not a separate
device, no.

You received a feedback already about this: do not create fake bindings
just to instantiate your drivers.

> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          The first port should be the input coming from the associated dc channel.
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          The second port should be the output coming from the associated bridge.
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +        dssctrl: dssctrl@295b0000 {

Drop node, not erlated.

> +            compatible = "starfive,jh7110-vout-syscon", "syscon";
> +            reg = <0x295b0000 0x90>;
> +        };
> +
> +        dsi_encoder: dsi_encoder {

Totally messed indentation. Use 4 spaces for example indentation.

Also, drop label.

Also, underscores are not allowed in node names.

Also, Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

This is terrible code.

> +            compatible = "starfive,dsi-encoder";
> +            starfive,syscon = <&dssctrl 0x8 0x12>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                /* input */
> +                port@0 {
> +                    #address-cells = <1>;
> +                    #size-cells = <0>;
> +                    reg = <0>;
> +                    dsi_input0:endpoint@0 {
> +                        reg = <0>;
> +                        remote-endpoint = <&dc_out_dpi1>;
> +                    };
> +                };
> +                /* output */
> +                port@1 {
> +                    reg = <1>;
> +                    #address-cells = <1>;
> +                    #size-cells = <0>;
> +                    dsi_out:endpoint {
> +                        remote-endpoint = <&mipi_in>;
> +                    };
> +                };
> +            };
> +        };
> diff --git a/Documentation/devicetree/bindings/display/starfive/starfive,jh7110-dc8200.yaml b/Documentation/devicetree/bindings/display/starfive/starfive,jh7110-dc8200.yaml
> new file mode 100644
> index 000000000000..a28dfdd471b6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/starfive/starfive,jh7110-dc8200.yaml
> @@ -0,0 +1,169 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/starfive/starfive,jh7110-dc8200.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STARFIVE JH7110 SoC display controller
> +
> +description:
> +  The STARFIVE JH7110 SoC uses the display controller based on Verisilicon IP(DC8200)
> +  to transfer the image data from a video memory buffer to an external LCD interface.
> +
> +  pipe0 binds HDMI for primary display,
> +  pipe1 binds DSI for external display.
> +
> +          +------------------------------+
> +          |                              |
> +          |                              |
> +  +----+  |   +-------------------+      |   +-------+   +------+   +------+
> +  |    +----->+  dc controller 0  +--->----->+HDMICtl| ->+ PHY  +-->+PANEL0+
> +  |AXI |  |   +-------------------+      |   +-------+   +------+   +------+
> +  |    |  |                              |
> +  |    |  |                              |
> +  |    |  |                              |
> +  |    |  |                              |
> +  |APB |  |   +-------------------+         +---------+    +------+  +-------+
> +  |    +----->+  dc controller 1  +--->---->+ dsiTx   +--->+DPHY  +->+ PANEL1+
> +  |    |  |   +-------------------+         +---------+    +------+  +-------+
> +  +----+  |                              |
> +          +------------------------------+
> +
> +maintainers:
> +  - Keith Zhao <keith.zhao@starfivetech.com>
> +
> +properties:
> +  compatible:
> +    const: starfive,jh7110-dc8200
> +
> +  reg:
> +    items:
> +      - description: host interface address and length
> +      - description: display physical base address and length
> +
> +  reg-names:
> +    items:
> +      - const: host
> +      - const: base
> +
> +  clocks:
> +    items:
> +      - description: Clock for display system noc bus.
> +      - description: Core clock for display controller.
> +      - description: Clock for axi bus to access ddr.
> +      - description: Clock for ahb bus to R/W the phy regs.
> +      - description: Pixel clock for display channel 0.
> +      - description: Pixel clock for display channel 1.
> +      - description: Pixel clock from hdmi.
> +      - description: Pixel clock for soc .
> +
> +  clock-names:
> +    items:
> +      - const: noc_bus
> +      - const: dc_core
> +      - const: axi_core
> +      - const: ahb
> +      - const: channel0
> +      - const: channel1
> +      - const: hdmi_tx
> +      - const: dc_parent
> +
> +  resets:
> +    items:
> +      - description: Reset for axi bus.
> +      - description: Reset for ahb bus.
> +      - description: Core reset of display controller.
> +
> +  reset-names:
> +    items:
> +      - const: axi
> +      - const: ahb
> +      - const: core
> +
> +  interrupts:
> +    items:
> +      - description: The interrupt will be generated when DC finish one frame
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          channel 0 output
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          channel 1 output
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/starfive,jh7110-crg.h>
> +    #include <dt-bindings/reset/starfive,jh7110-crg.h>
> +    dc8200: lcd-controller@29400000 {
> +      compatible = "starfive,jh7110-dc8200";
> +        reg = <0x29400000 0x100>,
> +              <0x29400800 0x2000>;
> +        reg-names = "host", "base";
> +
> +        interrupts = <95>;
> +        clocks = <&syscrg JH7110_SYSCLK_NOC_BUS_DISP_AXI>,
> +            <&voutcrg JH7110_VOUTCLK_DC8200_CORE>,

Align the lines. In other places as well.

> +            <&voutcrg JH7110_VOUTCLK_DC8200_AXI>,
> +            <&voutcrg JH7110_VOUTCLK_DC8200_AHB>,
> +            <&voutcrg JH7110_VOUTCLK_DC8200_PIX0>,
> +            <&voutcrg JH7110_VOUTCLK_DC8200_PIX1>,
> +            <&hdmitx0_pixelclk>,
> +            <&voutcrg JH7110_VOUTCLK_DC8200_PIX>;
> +        clock-names = "noc_bus", "dc_core", "axi_core", "ahb",
> +                  "channel0", "channel1", "hdmi_tx", "dc_parent";
> +        resets = <&voutcrg JH7110_VOUTRST_DC8200_AXI>,
> +             <&voutcrg JH7110_VOUTRST_DC8200_AHB>,
> +             <&voutcrg JH7110_VOUTRST_DC8200_CORE>;
> +        reset-names = "axi","ahb", "core";
> +
> +      crtc_out: ports {

Totally messed indentation.


> diff --git a/Documentation/devicetree/bindings/display/starfive/starfive,jh7110-inno-hdmi.yaml b/Documentation/devicetree/bindings/display/starfive/starfive,jh7110-inno-hdmi.yaml
> new file mode 100644
> index 000000000000..bfd7dc41fc14
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/starfive/starfive,jh7110-inno-hdmi.yaml
> @@ -0,0 +1,75 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/starfive/starfive,jh7110-inno-hdmi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Starfive JH7110 Innosilicon HDMI controller
> +
> +maintainers:
> +  - Keith Zhao <keith.zhao@starfivetech.com>
> +
> +allOf:
> +  - $ref: ../bridge/innosilicon,inno-hdmi.yaml#
> +
> +properties:
> +  compatible:
> +    const: "starfive,jh7110-inno-hdmi"

You did not test it. Drop quotes.

Untested bindings, so I will skip review for now.




Best regards,
Krzysztof

