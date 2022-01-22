Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F74149690E
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jan 2022 02:05:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A08910E79D;
	Sat, 22 Jan 2022 01:05:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
 [209.85.167.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A2B610E79D
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jan 2022 01:05:03 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id bf5so16036161oib.4
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 17:05:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7q+571qAmFg/5U815QvLHkl+PqoSH5bHFXvp/KLgACQ=;
 b=w/uE/7cYUUjmy2tX6NNTjkI97CgbHYJjcIcTofRa0eV0DJA0QS1en2FxTfaCpXHhH4
 DniKy3Y1yO7NwniDWNYU0r5juBXNjfxTasiuR7w58LgXPTPWHVVJ3HPl8tv4mgogsZ0j
 hekBLy/UpnkQ3wbxSuaUe3l6XiKU+sj/QuwGR6qfid4Btc150Tkg0PWkITCXq4NSF1lw
 fkOFLTdmMkSoyZrKCfe+HeQxfUYVR1epBlzw0dtg3RGNMjltpLHKNOgbll/N9lKQbRVX
 7jLvn2bXsBvSQ3s489Gcd+rOFIwzbwyGClK2y9pmEcqNwItwv/U7lJ27APqyxI8wB84u
 nZQA==
X-Gm-Message-State: AOAM532+lNgJiq0lR1pgNwSJe9tHYCX1gEmtVeomBTmpYMbaLOarQwyD
 VuLCgb7cfLuVPO6BuybfYQ==
X-Google-Smtp-Source: ABdhPJwejoEzMeEvfOkZ7F3tncbAj35X0/2+Inq1VTR5xYH1uFhJsTrARUrgA7dElvPkeNol2emn9w==
X-Received: by 2002:aca:1311:: with SMTP id e17mr2600994oii.119.1642813502340; 
 Fri, 21 Jan 2022 17:05:02 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id d1sm1790288otk.70.2022.01.21.17.05.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 17:05:01 -0800 (PST)
Received: (nullmailer pid 1969318 invoked by uid 1000);
 Sat, 22 Jan 2022 01:05:00 -0000
Date: Fri, 21 Jan 2022 19:05:00 -0600
From: Rob Herring <robh@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [RFC 21/28] dt-bindings: display: bridge: Document RZ/G2L MIPI
 DSI TX bindings
Message-ID: <YetYPCwJeVMAO+6F@robh.at.kernel.org>
References: <20220112174612.10773-1-biju.das.jz@bp.renesas.com>
 <20220112174612.10773-22-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220112174612.10773-22-biju.das.jz@bp.renesas.com>
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
Cc: devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 dri-devel@lists.freedesktop.org, Biju Das <biju.das@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 12, 2022 at 05:46:05PM +0000, Biju Das wrote:
> The RZ/G2L MIPI DSI TX is embedded in the Renesas RZ/G2L family SoC's. It
> can operate in DSI mode, with up to four data lanes.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  .../bindings/display/bridge/renesas,dsi.yaml  | 143 ++++++++++++++++++
>  1 file changed, 143 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> new file mode 100644
> index 000000000000..8e56a9c53cc5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> @@ -0,0 +1,143 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/renesas,dsi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas R-Car MIPI DSI Encoder
> +
> +maintainers:
> +  - Biju Das <biju.das.jz@bp.renesas.com>
> +
> +description: |
> +  This binding describes the MIPI DSI encoder embedded in the Renesas
> +  RZ/G2L family of SoC's. The encoder can operate in DSI mode with up
> +  to four data lanes.

Need a ref to dsi-controller.yaml.

> +
> +properties:
> +  compatible:
> +    enum:
> +      - renesas,r9a07g044-mipi-dsi    # for RZ/G2L
> +
> +  reg:
> +    items:
> +      - description: Link register
> +      - description: D-PHY register

D-PHY isn't a separate block?

> +
> +  clocks:
> +    items:
> +      - description: DSI D-PHY PLL multiplied clock
> +      - description: DSI D-PHY system clock
> +      - description: DSI AXI bus clock
> +      - description: DSI Register access clock
> +      - description: DSI Video clock
> +      - description: DSI D_PHY Escape mode Receive clock
> +
> +  clock-names:
> +    items:
> +      - const: pllclk
> +      - const: sysclk
> +      - const: aclk
> +      - const: pclk
> +      - const: vclk
> +      - const: lpclk
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  resets:
> +    items:
> +      - description: MIPI_DSI_CMN_RSTB
> +      - description: MIPI_DSI_ARESET_N
> +      - description: MIPI_DSI_PRESET_N
> +
> +  reset-names:
> +    items:
> +      - const: rst
> +      - const: arst
> +      - const: prst
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Parallel input port
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: DSI output port
> +
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +
> +            required:
> +              - data-lanes
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - power-domains
> +  - resets
> +  - reset-names
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/r9a07g044-cpg.h>
> +
> +    dsi0: dsi@10860000 {
> +        compatible = "renesas,r9a07g044-mipi-dsi";
> +        reg = <0x10860000 0x10000>,
> +              <0x10850000 0x10000>;
> +        power-domains = <&cpg>;
> +        clocks = <&cpg CPG_MOD R9A07G044_MIPI_DSI_PLLCLK>,
> +                 <&cpg CPG_MOD R9A07G044_MIPI_DSI_SYSCLK>,
> +                 <&cpg CPG_MOD R9A07G044_MIPI_DSI_ACLK>,
> +                 <&cpg CPG_MOD R9A07G044_MIPI_DSI_PCLK>,
> +                 <&cpg CPG_MOD R9A07G044_MIPI_DSI_VCLK>,
> +                 <&cpg CPG_MOD R9A07G044_MIPI_DSI_LPCLK>;
> +        clock-names = "pllclk", "sysclk", "aclk", "pclk", "vclk", "lpclk";
> +        resets = <&cpg R9A07G044_MIPI_DSI_CMN_RSTB>,
> +                 <&cpg R9A07G044_MIPI_DSI_ARESET_N>,
> +                 <&cpg R9A07G044_MIPI_DSI_PRESET_N>;
> +        reset-names = "rst", "arst", "prst";
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                reg = <0>;
> +                dsi0_in: endpoint {
> +                    remote-endpoint = <&du_out_dsi0>;
> +                };
> +            };
> +
> +            port@1 {
> +                reg = <1>;
> +                dsi0_out: endpoint {
> +                    data-lanes = <1 2 3 4>;
> +                    remote-endpoint = <&adv7535_in>;
> +                };
> +            };
> +        };
> +    };
> +...
> -- 
> 2.17.1
> 
> 
