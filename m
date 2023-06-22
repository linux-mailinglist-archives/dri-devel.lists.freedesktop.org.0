Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 150B973A3A1
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 16:52:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9992710E574;
	Thu, 22 Jun 2023 14:52:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
 [209.85.166.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C247110E574
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 14:52:16 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id
 ca18e2360f4ac-780c8df59caso45785439f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 07:52:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687445536; x=1690037536;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W4H+n+jEYNR1xv2zwH8+yE3Do/Uus/NRBa8ilWuur2s=;
 b=LQBE14ETf5d/3JMpWTLfNvqs6jfmIy41R2F4Ct5hItL1j8THcKWgNkS07Zrh80u+4u
 J9SnHxoGvx2WNCuTinBwaojc+S71rRhjlYNTRt989eqdUuoQh3Se3ya3a6cEbhYfh2pA
 DW/HwFjTiHuAZWIAIvN6dcUiU+xn5eB4l+0pUUoLaHvaFeIEgenNPOfUKKQ52Zf0Tp4R
 QLMVwBvT+GyLJqLxiEfnRY+jpYdE+ypUiKCY2ciODtvu9wR7tH2nRfT31X8OipD4UZrY
 2sT2RnAq+h6v1IW8r/fZgcWrsAy+EpC6o3i8AYR0BJqaL1Es4mF2wOxjFXZWH6go8sMd
 BG7Q==
X-Gm-Message-State: AC+VfDzhfVITTmsTZ6RQMxcwYSiCN09FF+fpjM+VqKaCp1ImEoG0DXDA
 M1E0TkTBW40qzMaHF9zmjg==
X-Google-Smtp-Source: ACHHUZ402wyT05TbPYfR7mnUBbzxPk8JnRuHR3F+rS+wx888gtzg/FhZBRW9i9FMkLI7yOu16YnjFA==
X-Received: by 2002:a5e:c012:0:b0:77a:c741:b73d with SMTP id
 u18-20020a5ec012000000b0077ac741b73dmr19569132iol.3.1687445535953; 
 Thu, 22 Jun 2023 07:52:15 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id
 eq1-20020a0566384e2100b00420ce233bfesm2049529jab.22.2023.06.22.07.52.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jun 2023 07:52:15 -0700 (PDT)
Received: (nullmailer pid 1685842 invoked by uid 1000);
 Thu, 22 Jun 2023 14:52:13 -0000
Date: Thu, 22 Jun 2023 08:52:13 -0600
From: Rob Herring <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 01/39] dt-bindings: display: Add Renesas SH-Mobile LCDC
 bindings
Message-ID: <20230622145213.GA1678457-robh@kernel.org>
References: <cover.1687423204.git.geert+renesas@glider.be>
 <2259ff548f007afcb5a315a4c95c83a0ee4b7e03.1687423204.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2259ff548f007afcb5a315a4c95c83a0ee4b7e03.1687423204.git.geert+renesas@glider.be>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 22, 2023 at 11:21:13AM +0200, Geert Uytterhoeven wrote:
> Add device tree bindings for the LCD Controller (LCDC) found in Renesas
> SuperH SH-Mobile and ARM SH/R-Mobile SOCs.
> 
> Based on a plain text prototype by Laurent Pinchart.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> ---
> Changes compared to Laurent's original:
>   - Convert to json-schema,
>   - Rename compatible values from "renesas,lcdc-<SoC>" to
>     "renesas,<SoC>-lcdc",
>   - Add power-domains property,
>   - Add MIPI-DSI port on SH-Mobile AG5,
>   - Update example to reflect reality,
>   - Add to MAINTAINERS.
> ---
>  .../display/renesas,shmobile-lcdc.yaml        | 108 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  2 files changed, 109 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/renesas,shmobile-lcdc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/renesas,shmobile-lcdc.yaml b/Documentation/devicetree/bindings/display/renesas,shmobile-lcdc.yaml
> new file mode 100644
> index 0000000000000000..72a39fce7294d56d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/renesas,shmobile-lcdc.yaml
> @@ -0,0 +1,108 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/renesas,shmobile-lcdc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas SH-Mobile LCD Controller (LCDC)
> +
> +maintainers:
> +  - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - renesas,r8a7740-lcdc # R-Mobile A1
> +      - renesas,sh73a0-lcdc  # SH-Mobile AG5
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 5
> +    description:
> +      Only the functional clock is mandatory.
> +      Some of the optional clocks are model-dependent (e.g. "video" (a.k.a.
> +      "vou" or "dv_clk") is available on R-Mobile A1 only).
> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 5
> +    items:
> +      enum: [ fck, media, lclk, hdmi, video ]
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    description: |
> +      The connections to the output video ports are modeled using the OF graph
> +      bindings specified in Documentation/devicetree/bindings/graph.txt.

Please read this file.

> +      The number of ports and their assignment are model-dependent.
> +      Each port shall have a single endpoint.

I'd just drop the whole description.

> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: LCD port (R-Mobile A1 and SH-Mobile AG5)
> +        unevaluatedProperties: false

Don't need this.

> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: HDMI port (R-Mobile A1 LCDC1 and SH-Mobile AG5)
> +        unevaluatedProperties: false
> +
> +      port@2:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: MIPI-DSI port (SH-Mobile AG5)
> +        unevaluatedProperties: false
> +
> +    required:
> +      - port@0
> +
> +    unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - power-domains
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/r8a7740-clock.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    lcdc0: lcd-controller@fe940000 {

Drop label.

> +        compatible = "renesas,r8a7740-lcdc";
> +        reg = <0xfe940000 0x4000>;
> +        interrupts = <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&mstp1_clks R8A7740_CLK_LCDC0>,
> +                 <&cpg_clocks R8A7740_CLK_M3>, <&lcdlclk0_clk>,
> +                 <&vou_clk>;
> +        clock-names = "fck", "media", "lclk", "video";
> +        power-domains = <&pd_a4lc>;
> +        status = "disabled";

Drop.

> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                reg = <0>;
> +
> +                lcdc0_rgb: endpoint {
> +                };
> +            };
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 83e9f4ac6bedaa9f..dc1935c196cb0e0b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7023,6 +7023,7 @@ F:	Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
>  F:	Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.yaml
>  F:	Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
>  F:	Documentation/devicetree/bindings/display/renesas,du.yaml
> +F:	Documentation/devicetree/bindings/display/renesas,shmobile-lcdc.yaml
>  F:	drivers/gpu/drm/renesas/
>  F:	include/linux/platform_data/shmob_drm.h
>  
> -- 
> 2.34.1
> 
