Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C06C76613CB
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jan 2023 07:57:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1F8C10E0CB;
	Sun,  8 Jan 2023 06:57:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10AED10E0CB
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jan 2023 06:57:04 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id EAF8E6CF;
 Sun,  8 Jan 2023 07:57:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1673161023;
 bh=bt40o19/YEKXIIGOmDN9pFrfQRCF+UbVIZKIlIuqMq4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S93UmhWNIOX8OvzH6D94A0tVnB1K66wFo2R398CVhoDr470LXNaeACkoeIYSCNhlP
 +U2U9p48BPV42uNRcWmQgK+7ycmaApKesNBSt0BTr4GyucR+QRJ9NRrq2kVD6oMFiN
 irtCSEpkD+5j5V7xUWZv1fKUYBXNk8KTKzTOaYpY=
Date: Sun, 8 Jan 2023 08:56:59 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Aradhya Bhatia <a-bhatia1@ti.com>
Subject: Re: [RFC PATCH 3/4] dt-bindings: panel: Introduce dual-link LVDS panel
Message-ID: <Y7ppO8nZFw7ZKdOi@pendragon.ideasonboard.com>
References: <20230103064615.5311-1-a-bhatia1@ti.com>
 <20230103064615.5311-4-a-bhatia1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230103064615.5311-4-a-bhatia1@ti.com>
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
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Devarsh Thakkar <devarsht@ti.com>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Guo Ren <guoren@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Linux RISC-V List <linux-riscv@lists.infradead.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Linux C-SKY Arch List <linux-csky@vger.kernel.org>,
 Devicetree List <devicetree@vger.kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Jai Luthra <j-luthra@ti.com>,
 Rahul T R <r-ravikumar@ti.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Mark Brown <broonie@kernel.org>,
 Linux Mediatek List <linux-mediatek@lists.infradead.org>,
 Maxime Ripard <maxime@cerno.tech>, Paul Walmsley <paul.walmsley@sifive.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM Kernel List <linux-arm-kernel@lists.infradead.org>,
 Jayesh Choudhary <j-choudhary@ti.com>, Tomi Valkeinen <tomba@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Jyri Sarha <jyri.sarha@iki.fi>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Aradhya,

Thank you for the patch.

On Tue, Jan 03, 2023 at 12:16:14PM +0530, Aradhya Bhatia wrote:
> Dual-link LVDS interfaces have 2 links, with even pixels traveling on
> one link, and odd pixels on the other. These panels are also generic in
> nature, with no documented constraints, much like their single-link
> counterparts, "panel-lvds".
> 
> Add a new compatible, "panel-dual-lvds", and a dt-binding document for
> these panels.
> 
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> ---
>  .../display/panel/panel-dual-lvds.yaml        | 157 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  2 files changed, 158 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/panel-dual-lvds.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-dual-lvds.yaml b/Documentation/devicetree/bindings/display/panel/panel-dual-lvds.yaml
> new file mode 100644
> index 000000000000..88a7aa2410be
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/panel-dual-lvds.yaml
> @@ -0,0 +1,157 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/panel-dual-lvds.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Generic Dual-Link LVDS Display Panel
> +
> +maintainers:
> +  - Aradhya Bhatia <a-bhatia1@ti.com>
> +  - Thierry Reding <thierry.reding@gmail.com>
> +
> +description: |
> +  A dual-LVDS interface is a dual-link connection with the even pixels
> +  traveling on one link, and the odd pixels traveling on the other.
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +  - $ref: /schemas/display/lvds.yaml/#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - lincolntech,lcd185-101ct
> +              - microtips,13-101hieb0hf0-s
> +          - const: panel-dual-lvds
> +      - const: panel-dual-lvds

A device-specific compatible string should be required,
"panel-dual-lvds" alone shouldn't be allowed. Otherwise it won't be
possible to tell different models apart later should this be required.

> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: The sink for first set of LVDS pixels.
> +
> +        properties:
> +          dual-lvds-odd-pixels:
> +            type: boolean
> +
> +          dual-lvds-even-pixels:
> +            type: boolean
> +
> +        oneOf:
> +          - required: [dual-lvds-odd-pixels]
> +          - required: [dual-lvds-even-pixels]
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: The sink for second set of LVDS pixels.
> +
> +        properties:
> +          dual-lvds-even-pixels:
> +            type: boolean
> +
> +          dual-lvds-odd-pixels:
> +            type: boolean
> +
> +        oneOf:
> +          - required: [dual-lvds-even-pixels]
> +          - required: [dual-lvds-odd-pixels]
> +
> +    allOf:
> +      - if:
> +          properties:
> +            port@0:
> +              properties:
> +                dual-lvds-odd-pixels: true
> +              required:
> +                - dual-lvds-odd-pixels
> +        then:
> +          properties:
> +            port@1:
> +              properties:
> +                dual-lvds-even-pixels: true
> +                dual-lvds-odd-pixels: false
> +
> +      - if:
> +          properties:
> +            port@0:
> +              properties:
> +                dual-lvds-even-pixels: true
> +              required:
> +                - dual-lvds-even-pixels
> +        then:
> +          properties:
> +            port@1:
> +              properties:
> +                dual-lvds-odd-pixels: true
> +                dual-lvds-even-pixels: false
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +  port: false
> +
> +unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - width-mm
> +  - height-mm
> +  - data-mapping
> +  - panel-timing
> +  - ports
> +
> +examples:
> +  - |+
> +    panel-dual-lvds {
> +      compatible = "microtips,13-101hieb0hf0-s", "panel-dual-lvds";
> +
> +      width-mm = <217>;
> +      height-mm = <136>;
> +
> +      data-mapping = "vesa-24";
> +
> +      panel-timing {
> +        clock-frequency = <150275000>;
> +        hactive = <1920>;
> +        vactive = <1200>;
> +        hfront-porch = <32>;
> +        hsync-len = <52>;
> +        hback-porch = <24>;
> +        vfront-porch = <24>;
> +        vsync-len = <8>;
> +        vback-porch = <3>;
> +        de-active = <1>;
> +      };
> +
> +      ports {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        port@0 {
> +          reg = <0>;
> +          dual-lvds-odd-pixels;
> +          lcd_in0: endpoint {
> +            remote-endpoint = <&oldi_out0>;
> +          };
> +        };
> +
> +        port@1 {
> +          reg = <1>;
> +          dual-lvds-even-pixels;
> +          lcd_in1: endpoint {
> +            remote-endpoint = <&oldi_out1>;
> +          };
> +        };
> +      };
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7f86d02cb427..c13f24293ab1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6595,6 +6595,7 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
>  S:	Maintained
>  F:	drivers/gpu/drm/panel/panel-lvds.c
>  F:	Documentation/devicetree/bindings/display/lvds.yaml
> +F:	Documentation/devicetree/bindings/display/panel/panel-dual-lvds.yaml
>  F:	Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
>  
>  DRM DRIVER FOR MANTIX MLAF057WE51 PANELS

-- 
Regards,

Laurent Pinchart
