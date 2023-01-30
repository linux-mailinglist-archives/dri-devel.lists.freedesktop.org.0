Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D699468172E
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jan 2023 18:04:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DCBB10E013;
	Mon, 30 Jan 2023 17:04:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A33610E013
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jan 2023 17:04:44 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id
 e12-20020a0568301e4c00b0068bc93e7e34so1646184otj.4
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jan 2023 09:04:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7Ejf7vqAQxFeMcRz+b+ludPXWyayqJapmdG5pn46nsk=;
 b=DGoLIpIKnnCShcdHcyeiMrYEuWYfG6HyMBVHU5cej/zMrtZnxoY2B8/E/eLi+cwPS4
 CYULGB5EBJAh128B5cAnoSgaEyRV9huhOwGldg8oN/kr5sM5TJPzBtfOi1k3C82EXhJo
 ep1mht7G2gwYCJQkgW+woxNwEfmZkfJV7jt46JISh7G/ChKw4C3V7mct0aLYFeXtc2/B
 PIZS1oLA3p0Z3SFygqndnWyrC6TJEzf36Bw1A8+5M8iMvZGWlUPoieugCQled0wL1eyR
 yP65EZ7xTwf2ovV5aw6YUATeYh9i1HaijwBk5hxGDZsTdswNtfBu2xHogr8g8b+2bBMq
 xZug==
X-Gm-Message-State: AO0yUKVtoXQ88yyHmbV5yCLeY6T/JxVYJ+LF2GAns25HFM+1rOGe5Xzt
 NnmXDXaXTlxwNZ0j5fQAKA==
X-Google-Smtp-Source: AK7set8w8/Wu9DKjsKGEnq+lsfo72FtdhgNl/pG9CyvPUTTpOD8gzinQeTtCr6QRjCiwKv9eYztbDQ==
X-Received: by 2002:a9d:6847:0:b0:68b:bca5:8dfa with SMTP id
 c7-20020a9d6847000000b0068bbca58dfamr4730987oto.28.1675098283123; 
 Mon, 30 Jan 2023 09:04:43 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 df17-20020a056830479100b006884c42a38asm4066933otb.41.2023.01.30.09.04.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 09:04:42 -0800 (PST)
Received: (nullmailer pid 2814224 invoked by uid 1000);
 Mon, 30 Jan 2023 17:04:41 -0000
Date: Mon, 30 Jan 2023 11:04:41 -0600
From: Rob Herring <robh@kernel.org>
To: Aradhya Bhatia <a-bhatia1@ti.com>
Subject: Re: [PATCH v2 3/4] dt-bindings: panel: Introduce dual-link LVDS panel
Message-ID: <20230130170441.GA2796575-robh@kernel.org>
References: <20230124101238.4542-1-a-bhatia1@ti.com>
 <20230124101238.4542-4-a-bhatia1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230124101238.4542-4-a-bhatia1@ti.com>
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
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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
 Liam Girdwood <lgirdwood@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Jyri Sarha <jyri.sarha@iki.fi>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 24, 2023 at 03:42:37PM +0530, Aradhya Bhatia wrote:
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
>  .../display/panel/panel-dual-lvds.yaml        | 149 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  2 files changed, 150 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/panel-dual-lvds.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-dual-lvds.yaml b/Documentation/devicetree/bindings/display/panel/panel-dual-lvds.yaml
> new file mode 100644
> index 000000000000..e2ce1768e9a3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/panel-dual-lvds.yaml
> @@ -0,0 +1,149 @@
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
> +  - $ref: /schemas/display/lvds.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - lincolntech,lcd185-101ct
> +          - microtips,mf-101hiebcaf0
> +      - const: panel-dual-lvds

Why do we need a new compatible? You have ports and properties to see if 
the panel is dual link.

We already have dual link LVDS supported in advantech,idk-2121wr.yaml 
which says is compatible with 'panel-lvds', so that decision has already 
been made. The hint was you added the compatible match to the driver 
with 0 other changes needed.

That schema is missing type definitions and constraints for 
dual-lvds-odd-pixels/dual-lvds-even-pixels so there does need to be some 
changes to add those.

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
> +              required:
> +                - dual-lvds-odd-pixels
> +        then:
> +          properties:
> +            port@1:
> +              properties:
> +                dual-lvds-odd-pixels: false
> +
> +      - if:
> +          properties:
> +            port@0:
> +              required:
> +                - dual-lvds-even-pixels
> +        then:
> +          properties:
> +            port@1:
> +              properties:
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
> +  - |
> +    panel {
> +      compatible = "microtips,mf-101hiebcaf0", "panel-dual-lvds";
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
> index 5e18388b4579..6025bb024586 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6461,6 +6461,7 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
>  S:	Maintained
>  F:	drivers/gpu/drm/panel/panel-lvds.c
>  F:	Documentation/devicetree/bindings/display/lvds.yaml
> +F:	Documentation/devicetree/bindings/display/panel/panel-dual-lvds.yaml
>  F:	Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
>  
>  DRM DRIVER FOR MANTIX MLAF057WE51 PANELS
> -- 
> 2.39.0
> 
