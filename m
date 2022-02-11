Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 159504B2965
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 16:49:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 846EA10EA71;
	Fri, 11 Feb 2022 15:49:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com
 [209.85.167.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 909F310EA71
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 15:49:32 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id v67so9947804oie.9
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 07:49:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gWKYE2d0LpVfiDQEqlRd5JWJe4nWkpS2f1rG0JFNYfg=;
 b=OAz2k0BWi2jngH0EZi7CT1D01Nh32tjLKPHdHYfIi+PoJ8riq5vL/Pn8Z5pI2PE8ok
 K9gTut6pI9MB/Mt9F1DRF/gSOVBH/LO6whRGHaqYJLxKuH3jbd/o291+AfT+UE1o4Mn8
 GhZLNgDbzOz61eDu+jgZ76YCLmbBItbSbFT76KewPMZ0HEI3CAqq52wTBMvIMt2E5WFA
 kknU1/U53JsjRuqu7OnkewvcSmeOsIDa1zmH+wrVgT07W4SfoeDx1ZeEBBGlC5zek14R
 +ogNhbOVtmTw2XpZ8QtY+HH8aab2pMY0TiBexnr1zNw8KjfszM1eDyG/DsKq3kOYj/ZA
 mcGQ==
X-Gm-Message-State: AOAM5303jFv1lV/eEPKEEFLxBi/OBt1CQXSkmgEpHwryXEJh1nRooWp9
 5q7NtEzsaY7h2hGKJh8lZg==
X-Google-Smtp-Source: ABdhPJxoP4zIIRj7it+mF16gB50xGdR/J7wpMEl6fEvCZKZC+lc5Es0k1OoC2wRfJCacn5nRg4UQ1w==
X-Received: by 2002:a05:6808:11c6:: with SMTP id
 p6mr460883oiv.50.1644594571778; 
 Fri, 11 Feb 2022 07:49:31 -0800 (PST)
Received: from robh.at.kernel.org ([2607:fb90:5fee:dfce:b6df:c3e1:b1e5:d6d8])
 by smtp.gmail.com with ESMTPSA id
 bh7sm6124885oib.6.2022.02.11.07.49.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 07:49:30 -0800 (PST)
Received: (nullmailer pid 409607 invoked by uid 1000);
 Fri, 11 Feb 2022 15:46:27 -0000
Date: Fri, 11 Feb 2022 09:46:27 -0600
From: Rob Herring <robh@kernel.org>
To: Andreas Kemnade <andreas@kemnade.info>
Subject: Re: [RFC PATCH 1/6] dt-bindings: display: imx: Add EPDC
Message-ID: <YgaE06Ktabpf2dJC@robh.at.kernel.org>
References: <20220206080016.796556-1-andreas@kemnade.info>
 <20220206080016.796556-2-andreas@kemnade.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220206080016.796556-2-andreas@kemnade.info>
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
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 letux-kernel@openphoenux.org, tzimmermann@suse.de, samuel@sholland.org,
 airlied@linux.ie, s.hauer@pengutronix.de, alistair@alistair23.me,
 linux-kernel@vger.kernel.org, linux-imx@nxp.com, kernel@pengutronix.de,
 josua.mayer@jm0.eu, shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Feb 06, 2022 at 09:00:11AM +0100, Andreas Kemnade wrote:
> Add a binding for the Electrophoretic Display Controller found at least
> in the i.MX6.

The first version was in i.MX50 (I helped design the register 
interface). Is that version compatible?

> The timing subnode is directly here to avoid having display parameters
> spread all over the plate.
> 
> Supplies are organized the same way as in the fbdev driver in the
> NXP/Freescale kernel forks. The regulators used for that purpose,
> like the TPS65185, the SY7636A and MAX17135 have typically a single bit to
> start a bunch of regulators of higher or negative voltage with a
> well-defined timing. VCOM can be handled separately, but can also be
> incorporated into that single bit.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  .../bindings/display/imx/fsl,mxc-epdc.yaml    | 159 ++++++++++++++++++
>  1 file changed, 159 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,mxc-epdc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/imx/fsl,mxc-epdc.yaml b/Documentation/devicetree/bindings/display/imx/fsl,mxc-epdc.yaml
> new file mode 100644
> index 000000000000..7e0795cc3f70
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/imx/fsl,mxc-epdc.yaml
> @@ -0,0 +1,159 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/imx/fsl,mxc-epdc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale i.MX6 EPDC
> +
> +maintainers:
> +  - Andreas Kemnade <andreas@kemnade.info>
> +
> +description: |
> +  The EPDC is a controller for handling electronic paper displays found in
> +  i.MX6 SoCs.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,imx6sl-epdc
> +      - fsl,imx6sll-epdc

Not compatible with each other?

> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Bus clock
> +      - description: Pixel clock
> +
> +  clock-names:
> +    items:
> +      - const: axi
> +      - const: pix
> +
> +  interrupts:
> +    maxItems: 1
> +

> +  vscan-holdoff:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    maxItems: 1
> +
> +  sdoed-width:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    maxItems: 1
> +
> +  sdoed-delay:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    maxItems: 1
> +
> +  sdoez-width:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    maxItems: 1
> +
> +  sdoez-delay:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    maxItems: 1
> +
> +  gdclk-hp-offs:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    maxItems: 1
> +
> +  gdsp-offs:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    maxItems: 1
> +
> +  gdoe-offs:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    maxItems: 1
> +
> +  gdclk-offs:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    maxItems: 1
> +
> +  num-ce:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    maxItems: 1

All these need a vendor prefix and descriptions.

> +
> +  timing:
> +    $ref: /display/panel/panel-timing.yaml#
> +
> +  DISPLAY-supply:
> +    description:
> +      A couple of +/- voltages automatically powered on in a defintive order
> +
> +  VCOM-supply:
> +    description: compensation voltage
> +
> +  V3P3-supply:
> +    description: V3P3 supply
> +
> +  epd-thermal-zone:
> +    description:
> +      Zone to get temperature of the EPD from, practically ambient temperature.
> +
> +
> +

1 blank line.

> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - vscan-holdoff
> +  - sdoed-width
> +  - sdoed-delay
> +  - sdoez-width
> +  - sdoez-delay
> +  - gdclk-hp-offs
> +  - gdsp-offs
> +  - gdoe-offs
> +  - gdclk-offs
> +  - num-ce
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/imx6sl-clock.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    epdc: epdc@20f4000 {
> +        compatible = "fsl,imx6sl-epdc";
> +        reg = <0x020f4000 0x4000>;
> +        interrupts = <0 97 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&clks IMX6SL_CLK_EPDC_AXI>, <&clks IMX6SL_CLK_EPDC_PIX>;
> +        clock-names = "axi", "pix";
> +
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&pinctrl_epdc0>;
> +        V3P3-supply = <&V3P3_reg>;
> +        VCOM-supply = <&VCOM_reg>;
> +        DISPLAY-supply = <&DISPLAY_reg>;
> +        epd-thermal-zone = "epd-thermal";
> +
> +        vscan-holdoff = <4>;
> +        sdoed-width = <10>;
> +        sdoed-delay = <20>;
> +        sdoez-width = <10>;
> +        sdoez-delay = <20>;
> +        gdclk-hp-offs = <562>;
> +        gdsp-offs = <662>;
> +        gdoe-offs = <0>;
> +        gdclk-offs = <225>;
> +        num-ce = <3>;
> +        status = "okay";

Don't need status in examples.

> +
> +        timing {
> +                clock-frequency = <80000000>;
> +                hactive = <1448>;
> +                hback-porch = <16>;
> +                hfront-porch = <102>;
> +                hsync-len = <28>;
> +                vactive = <1072>;
> +                vback-porch = <4>;
> +                vfront-porch = <4>;
> +                vsync-len = <2>;
> +        };
> +    };
> +...
> -- 
> 2.30.2
> 
> 
