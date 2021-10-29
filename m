Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BD843F43E
	for <lists+dri-devel@lfdr.de>; Fri, 29 Oct 2021 03:04:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34CD96E0F0;
	Fri, 29 Oct 2021 01:04:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
 [209.85.167.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D66A6E0F0
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Oct 2021 01:04:51 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id z126so10936480oiz.12
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 18:04:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MBThxz376ZwKQ2CgIvx7+SMMvDix0ZYUqM2XlMvadr4=;
 b=MZnvVV5zr2SP5Fdu3VlZW4FVoo669s3HVnYnRqNStx297vEYWuejeaf2j5h5m/Gx1R
 epsv3z2Pw1raR4QqHDl8k4bfmUvL7gD2WGgqetZ6OaK45tB7dcULOqNwFUuH1Cc6QQ0F
 T3NWeyBvzUOEHhvCNMaVAqbka0YBvOQEEz65yyNSX+pQO9rwBAsc257e4XypNKntr+Rd
 78YKnGT+rfN6W0P2j6tfN4eW/oB7KRubEhYui7phKhB3pTI4p7lrS1U+vA378ePizpah
 hRyqIr+8OCh24viK8oli4HUC91u3LlebhynO9kfjz8CsFhcQHcM0m6K0mnqCkRLHl5hM
 5Spw==
X-Gm-Message-State: AOAM530XEjLZrN3wWEwprNqlUIucFse/rP1qxzA6eDQm7Ns2W3gQeh/1
 s+kj9UAxEoy1ofBB0O60gw==
X-Google-Smtp-Source: ABdhPJzeaNxZQbYoKleC+9X4I4grVU2VleGQ5z3Y2B0SgItQOsHtBytVFlMJYjvHXWFwZquRHenZ2g==
X-Received: by 2002:a05:6808:1789:: with SMTP id
 bg9mr5825185oib.171.1635469490331; 
 Thu, 28 Oct 2021 18:04:50 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id s5sm1679987ois.55.2021.10.28.18.04.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 18:04:49 -0700 (PDT)
Received: (nullmailer pid 923293 invoked by uid 1000);
 Fri, 29 Oct 2021 01:04:48 -0000
Date: Thu, 28 Oct 2021 20:04:48 -0500
From: Rob Herring <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Russell King <linux@armlinux.org.uk>,
 =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
 Tony Lindgren <tony@atomide.com>, Magnus Damm <magnus.damm@gmail.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/3] [RFC] dt-bindings: display: bridge: nxp,tda998x:
 Convert to json-schema
Message-ID: <YXtIsCnJ+L5zqCVk@robh.at.kernel.org>
References: <cover.1634822085.git.geert+renesas@glider.be>
 <1f6bf58d76efc2e869b800534b818d1451ef98a2.1634822085.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1f6bf58d76efc2e869b800534b818d1451ef98a2.1634822085.git.geert+renesas@glider.be>
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

On Thu, Oct 21, 2021 at 03:18:53PM +0200, Geert Uytterhoeven wrote:
> Convert the NXP TDA998x HDMI transmitter Device Tree binding
> documentation to json-schema.
> 
> Add missing "#sound-dai-cells" property.
> Add ports hierarchy, as an alternative to port.
> Drop pinctrl properties, as they do not belong here.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> RFC as I do not know:
>   1. The correct value(s) for '#sound-dai-cells' (the example used 2,
>      which was IMHO wrong, while all actual users use 0),
>   2. The meaning of the various ports subnodes.
> ---
>  .../bindings/display/bridge/nxp,tda998x.yaml  | 108 ++++++++++++++++++
>  .../bindings/display/bridge/tda998x.txt       |  54 ---------
>  2 files changed, 108 insertions(+), 54 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/nxp,tda998x.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/bridge/tda998x.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/nxp,tda998x.yaml b/Documentation/devicetree/bindings/display/bridge/nxp,tda998x.yaml
> new file mode 100644
> index 0000000000000000..87c64edcf5d5617d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/nxp,tda998x.yaml
> @@ -0,0 +1,108 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/nxp,tda998x.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP TDA998x HDMI transmitter
> +
> +maintainers:
> +  - Russell King <linux@armlinux.org.uk>
> +
> +properties:
> +  compatible:
> +    const: nxp,tda998x
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  video-ports:
> +    default: 0x230145
> +    description:
> +      24 bits value which defines how the video controller output is wired to
> +      the TDA998x input.

maximum: 0xffffff

(at least...)

> +
> +  audio-ports:
> +    description:
> +      Array of 8-bit values, 2 values per DAI (Documentation/sound/soc/dai.rst).
> +      The implementation allows one or two DAIs.
> +      If two DAIs are defined, they must be of different type.
> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> +    items:
> +      minItems: 1
> +      maxItems: 2
> +      items:
> +        - description: |
> +            The first value defines the DAI type: TDA998x_SPDIF or TDA998x_I2S
> +            (see include/dt-bindings/display/tda998x.h).
> +        - description:
> +            The second value defines the tda998x AP_ENA reg content when the
> +            DAI in question is used.
> +
> +  '#sound-dai-cells':
> +    enum: [ 0, 1 ]
> +
> +  nxp,calib-gpios:
> +    maxItems: 1
> +    description:
> +      Calibration GPIO, which must correspond with the gpio used for the
> +      TDA998x interrupt pin.
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        type: object
> +        description: FIXME

Looks like the input from the example

> +
> +      port@1:
> +        type: object
> +        description: FIXME

Presumably the output to connector or another bridge.

> +
> +required:
> +  - compatible
> +  - reg
> +
> +oneOf:
> +  - required:
> +      - port
> +  - required:
> +      - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/display/tda998x.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        tda998x: hdmi-encoder@70 {
> +            compatible = "nxp,tda998x";
> +            reg = <0x70>;
> +            interrupt-parent = <&gpio0>;
> +            interrupts = <27 IRQ_TYPE_EDGE_FALLING>;
> +            video-ports = <0x230145>;
> +
> +            #sound-dai-cells = <1>;
> +                         /* DAI-format / AP_ENA reg value */
> +            audio-ports = <TDA998x_SPDIF 0x04>,
> +                          <TDA998x_I2S 0x03>;
> +
> +            port {
> +                tda998x_in: endpoint {
> +                    remote-endpoint = <&lcdc_0>;
> +                };
> +            };
> +        };
> +    };
