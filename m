Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC13714AAC
	for <lists+dri-devel@lfdr.de>; Mon, 29 May 2023 15:50:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 779C610E075;
	Mon, 29 May 2023 13:50:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEAE810E075
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 13:50:13 +0000 (UTC)
Received: from pendragon.ideasonboard.com (om126255106133.24.openmobile.ne.jp
 [126.255.106.133])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 614A0836;
 Mon, 29 May 2023 15:49:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1685368191;
 bh=Z5YaI4FQ4nsu1kJlSC+REgzPugOlcWreD0VGwhXFugU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DfUOhJEn3jJ8hZGyuHKR6cZM1Pk9DNtw6KtaAouAzEjQpD9TFVN0U31Dr9+zXGG2S
 2ppxSsf70NTxWVukFTs0J/EEN1hME65gkv0tSZx+pO8qTT9BSrz3guMMWhhNBjGh6x
 0ZMQsLmYUdWs0rBrw5sOuYx0+QuLJhVCoCDyewfk=
Date: Mon, 29 May 2023 16:49:59 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v9 RESEND 2/5] dt-bindings: display: Document Renesas
 RZ/G2L DU bindings
Message-ID: <20230529134959.GA27467@pendragon.ideasonboard.com>
References: <20230502100912.143114-1-biju.das.jz@bp.renesas.com>
 <20230502100912.143114-3-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230502100912.143114-3-biju.das.jz@bp.renesas.com>
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
Cc: devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Biju,

Thank you for the patch.

On Tue, May 02, 2023 at 11:09:09AM +0100, Biju Das wrote:
> The RZ/G2L LCD controller is composed of Frame Compression Processor
> (FCPVD), Video Signal Processor (VSPD), and Display Unit (DU).
> 
> The DU module supports the following hardware features
> − Display Parallel Interface (DPI) and MIPI LINK Video Interface
> − Display timing master
> − Generates video timings
> − Selecting the polarity of output DCLK, HSYNC, VSYNC, and DE
> − Supports Progressive
> − Input data format (from VSPD): RGB888, RGB666
> − Output data format: same as Input data format
> − Supporting Full HD (1920 pixels x 1080 lines) for MIPI-DSI Output
> − Supporting WXGA (1280 pixels x 800 lines) for Parallel Output
> 
> This patch document DU module found on RZ/G2L LCDC.

s/document/documents the/

> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> v8->v9:
>  * No change
> v7->v8:
>  * No change
> v6->v7:
>  * No change
> v5->v6:
>  * No change.
> v4->v5:
>  * Added Rb tag from Rob.
> v3->v4:
>  * Changed compatible name from renesas,du-r9a07g044->renesas,r9a07g044-du
>  * started using same compatible for RZ/G2{L,LC}
> v3: New patch
> ---
>  .../bindings/display/renesas,rzg2l-du.yaml    | 124 ++++++++++++++++++
>  1 file changed, 124 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> new file mode 100644
> index 000000000000..ab99e7d57a7d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> @@ -0,0 +1,124 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/renesas,rzg2l-du.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas RZ/G2L Display Unit (DU)
> +
> +maintainers:
> +  - Biju Das <biju.das.jz@bp.renesas.com>
> +  - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> +
> +description: |
> +  These DT bindings describe the Display Unit embedded in the Renesas RZ/G2L
> +  and RZ/V2L SoCs.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - renesas,r9a07g044-du # RZ/G2{L,LC}
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Main clock
> +      - description: Register access clock
> +      - description: Video clock
> +
> +  clock-names:
> +    items:
> +      - const: aclk
> +      - const: pclk
> +      - const: vclk
> +
> +  resets:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    description: |
> +      The connections to the DU output video ports are modeled using the OF
> +      graph bindings specified in Documentation/devicetree/bindings/graph.txt.

The file has moved to graph.yaml in the dt-schema repo. I'll drop the
last part of the sentence, starting with "specified by".

> +      The number of ports and their assignment are model-dependent. Each port
> +      shall have a single endpoint.
> +
> +    patternProperties:
> +      "^port@[0-1]$":
> +        $ref: /schemas/graph.yaml#/properties/port
> +        unevaluatedProperties: false
> +
> +    required:
> +      - port@0
> +
> +    unevaluatedProperties: false
> +
> +  renesas,vsps:
> +    $ref: "/schemas/types.yaml#/definitions/phandle-array"
> +    items:
> +      items:
> +        - description: phandle to VSP instance that serves the DU channel
> +        - description: Channel index identifying the LIF instance in that VSP
> +    description:
> +      A list of phandle and channel index tuples to the VSPs that handle the
> +      memory interfaces for the DU channels.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - resets
> +  - power-domains
> +  - ports
> +  - renesas,vsps
> +
> +additionalProperties: false
> +
> +examples:
> +  # RZ/G2L DU
> +  - |
> +    #include <dt-bindings/clock/r9a07g044-cpg.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    display@10890000 {
> +        compatible = "renesas,r9a07g044-du";
> +        reg = <0x10890000 0x10000>;
> +        interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&cpg CPG_MOD R9A07G044_LCDC_CLK_A>,
> +                 <&cpg CPG_MOD R9A07G044_LCDC_CLK_P>,
> +                 <&cpg CPG_MOD R9A07G044_LCDC_CLK_D>;
> +        clock-names = "aclk", "pclk", "vclk";
> +        resets = <&cpg R9A07G044_LCDC_RESET_N>;
> +        power-domains = <&cpg>;
> +
> +        renesas,vsps = <&vspd0 0>;
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                reg = <0>;
> +                endpoint {
> +                    remote-endpoint = <&dsi0_in>;
> +                };
> +            };
> +            port@1 {
> +                reg = <1>;
> +                endpoint {
> +                };

Endpoints shouldn't be empty, you can just drop the endpoint here.

I'll fix all this locally.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> +            };
> +        };
> +    };
> +
> +...

-- 
Regards,

Laurent Pinchart
