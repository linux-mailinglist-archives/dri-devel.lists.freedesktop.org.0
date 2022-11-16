Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE3A62C640
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 18:21:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CD9B10E4E5;
	Wed, 16 Nov 2022 17:21:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36EE110E4EA
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 17:21:31 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id c129so19308955oia.0
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 09:21:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=u0aHWwdqWKvjf68O7GGCNZFTg5GEvXPm/cg6lj7q+VA=;
 b=Oovxv6890n/0VPBmz52+96CkEGRkpjERAnaTlC5MT5b9TjtJqh5HERoI5homzHN6du
 ORSYFRVN0EiDpc64qwD6VMHZP17Myc1C0lnvhFvTHtKUjeiVJoj1rSHrQv+kLzWgZmrX
 wt/6GHkUjKjlH82tEF6oYep9ZtyCr8Sns1OudUEN+n/vrBlRXV6LhBEV17BFMPTlj847
 1gIEbl8KK4eUr9h9lxgmhvh4rvqleJiPX92L3nPJ9Pq7K9fvRuGNOcjluVk/YurY7k8x
 a1mE+DCjB9bST3fuJSv/Nre605K2Sq0TLS0lNRZUzPpRSsTqP5z3gJrujeS4ETyU9m2U
 DWHQ==
X-Gm-Message-State: ANoB5pnmxuJi6Vdx0Sw3RYSWe3fknSYjja8mMk5CmqcSOfdIKSapKxnO
 v4XKfQNVw/EPiC4fNUu0xg==
X-Google-Smtp-Source: AA0mqf6nGzisXh0hM36zvzwkmmNGXArbBmyM7V1+NM74TWMT5T+z1nIwTHkJbspJ92SV80qQ51+zAQ==
X-Received: by 2002:aca:913:0:b0:359:568c:176 with SMTP id
 19-20020aca0913000000b00359568c0176mr2084710oij.110.1668619290175; 
 Wed, 16 Nov 2022 09:21:30 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 f14-20020a9d5f0e000000b0066cc88749f8sm6798419oti.68.2022.11.16.09.21.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Nov 2022 09:21:29 -0800 (PST)
Received: (nullmailer pid 460260 invoked by uid 1000);
 Wed, 16 Nov 2022 17:21:31 -0000
Date: Wed, 16 Nov 2022 11:21:31 -0600
From: Rob Herring <robh@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v1] dt-bindings: display: Convert fsl,imx-fb.txt to
 dt-schema
Message-ID: <20221116172131.GA233356-robh@kernel.org>
References: <20221110094945.191100-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221110094945.191100-1-u.kleine-koenig@pengutronix.de>
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 10, 2022 at 10:49:45AM +0100, Uwe Kleine-König wrote:
> This is a straight forward conversion. Note that fsl,imx-lcdc was picked
> as the new name as this is the compatible that should supersede the
> legacy fb binding.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
> Hello,
> 
> the eventual goal is to add drm support for this hardware. That one will
> use a different (and more sensible) binding. However fsl,imx*-fb won't
> go away directly, and Rob requested to describe both bindings in the
> same file given that it describes a single hardware type.
> 
> As a first step I convert the old binding to yaml. I tried to put the
> new binding on top of that but I'm not sure about a few things in this
> patch and so post only this first patch and once it's accepted add the
> new binding which I guess is less overall work.
> 
> What I'm unsure about is the description of the display node (Is there a
> better description? I didn't find a schema for that.)

That's going to be a challenge to describe because every panel binding 
will need a reference to those custom properties. It's a similar problem 
that spi-peripheral-props.yaml solved. But here, there may not be enough 
instances to do such a general solution. Do the panels used even have 
schemas yet?

It's kind of a separate problem. You could start with just creating a 
schema just listing the custom properties.


> Further I didn't find documentation about additionalProperties and
> unevaluatedProperties. Did I pick the right one here?

example-schema.yaml talks about it some. In general, if there's a 
$ref to other properties for a node not defined locally, then you need 
unevaluatedProperties. Otherwise, additionalProperties is fine.


> Best regards
> Uwe
> 
>  .../bindings/display/imx/fsl,imx-fb.txt       |  57 ---------
>  .../bindings/display/imx/fsl,imx-lcdc.yaml    | 110 ++++++++++++++++++
>  2 files changed, 110 insertions(+), 57 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx-fb.txt
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx-lcdc.yaml

[...]

> diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx-lcdc.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx-lcdc.yaml
> new file mode 100644
> index 000000000000..c3cf6f92a766
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx-lcdc.yaml
> @@ -0,0 +1,110 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/imx/fsl,imx-lcdc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale i.MX LCD Controller, found on i.MX1, i.MX21, i.MX25 and i.MX27
> +
> +maintainers:
> +  - Sascha Hauer <s.hauer@pengutronix.de>
> +  - Pengutronix Kernel Team <kernel@pengutronix.de>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - fsl,imx1-fb
> +              - fsl,imx21-fb
> +      - items:
> +          - enum:
> +              - fsl,imx25-fb
> +              - fsl,imx27-fb
> +          - const: fsl,imx21-fb
> +
> +  clocks:
> +    maxItems: 3
> +
> +  clock-names:
> +    items:
> +      - const: ipg
> +      - const: ahb
> +      - const: per
> +
> +  display:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: |
> +      Display hardware node
> +      It needs to define the following properties:
> +        - bits-per-pixel
> +        - fsl,pcr: LCDC PCR value
> +      And optionally:
> +        - fsl,aus-mode: boolean to enable AUS mode (only for imx21)
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +  lcd-supply:
> +    description:
> +      Regulator for LCD supply voltage.
> +
> +  fsl,dmacr:
> +    $ref: '/schemas/types.yaml#/definitions/uint32'

Drop quotes.

> +    description:
> +      Override value for DMA Control Register
> +
> +  fsl,lpccr:
> +    $ref: '/schemas/types.yaml#/definitions/uint32'

Drop quotes.

> +    description:
> +      Contrast Control Register value.
> +
> +  fsl,lscr1:
> +    $ref: '/schemas/types.yaml#/definitions/uint32'

Drop quotes.

> +    description:
> +      LCDC Sharp Configuration Register value.
> +
> +required:
> +  - compatible
> +  - clocks
> +  - clock-names
> +  - display
> +  - interrupts
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    imxfb: fb@10021000 {

lcd-controller@...

> +        compatible = "fsl,imx21-fb";
> +        interrupts = <61>;
> +        reg = <0x10021000 0x1000>;
> +        display = <&display0>;
> +        clocks = <&clks 103>, <&clks 49>, <&clks 66>;
> +        clock-names = "ipg", "ahb", "per";
> +    };
> +
> +    display0: display0 {
> +        model = "Primeview-PD050VL1";
> +        bits-per-pixel = <16>;
> +        fsl,pcr = <0xf0c88080>; /* non-standard but required */
> +
> +        display-timings {
> +            native-mode = <&timing_disp0>;
> +            timing_disp0: timing0 {
> +                hactive = <640>;
> +                vactive = <480>;
> +                hback-porch = <112>;
> +                hfront-porch = <36>;
> +                hsync-len = <32>;
> +                vback-porch = <33>;
> +                vfront-porch = <33>;
> +                vsync-len = <2>;
> +                clock-frequency = <25000000>;
> +            };
> +        };
> +    };
> -- 
> 2.38.1
> 
> 
