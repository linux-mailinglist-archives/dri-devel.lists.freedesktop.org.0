Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B94EF4C34E1
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 19:41:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B727A10E790;
	Thu, 24 Feb 2022 18:41:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD9A710E790
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 18:41:11 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id 12so4090781oix.12
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 10:41:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Nxq3BMyTsUkFwMZdrzuD1Tb3ZNjNUmA4Poy2IHN21Kc=;
 b=5VGNb7hCdirFafLynzvFZnY/XVOsCPm5FRfnFMKYacbRHieIqEkIRSG9N01FftVUMx
 03jxK5Fm1TGGNjBNB7XqK+wJIWDhTXN5QNVrhZLNTwv3d8j3y/IAIE99ScQY4IlhWNwA
 kc7pesW0touajm6x4osJfnH8paR90VNH8PG0qgqWu3aEbvKv/ejak/vkNmdi/eAqXdkF
 nnYsCwFdeqXeF5xxXQiLhe+e9G2D8qUkNrEhf32q3dwcgkb0O8XxfJlL4EK6MxXzT2e2
 hoa9KJy7bTravxOEr3DHXpolvkfdT0glY0FHk1MA0PrLdv+0n6DqK7ktvi+4U4f3zuk7
 vKZA==
X-Gm-Message-State: AOAM533Ic0THIlIJlI7kQhOsgvoshCvGIrueTAPYGm2PMDVL/Nmib0cj
 2eFRlccM6SHj0hlACNhQWA==
X-Google-Smtp-Source: ABdhPJyJgAnznS45eOMMUV+egytjCox470wo12U5/RxeoSiV1WJ67kQRm5X+OymUOX/yrLnTmixdFw==
X-Received: by 2002:aca:32c1:0:b0:2ce:6ee7:2c9f with SMTP id
 y184-20020aca32c1000000b002ce6ee72c9fmr7963059oiy.205.1645728071097; 
 Thu, 24 Feb 2022 10:41:11 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213]) by smtp.gmail.com with ESMTPSA id
 ay6-20020a056808300600b002d45f1a02d7sm153421oib.6.2022.02.24.10.41.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 10:41:10 -0800 (PST)
Received: (nullmailer pid 3375280 invoked by uid 1000);
 Thu, 24 Feb 2022 18:41:09 -0000
Date: Thu, 24 Feb 2022 12:41:09 -0600
From: Rob Herring <robh@kernel.org>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH v5 1/5] dt-bindings: display: add bindings for MIPI DBI
 compatible SPI panels
Message-ID: <YhfRRa+BJs7H/gkU@robh.at.kernel.org>
References: <20220224152708.14459-1-noralf@tronnes.org>
 <20220224152708.14459-2-noralf@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220224152708.14459-2-noralf@tronnes.org>
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
Cc: devicetree@vger.kernel.org, david@lechnology.com,
 dave.stevenson@raspberrypi.com, dri-devel@lists.freedesktop.org,
 thierry.reding@gmail.com, maxime@cerno.tech, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 24, 2022 at 04:27:04PM +0100, Noralf Trønnes wrote:
> Add binding for MIPI DBI compatible SPI panels.
> 
> v5:
> - Add sainsmart18 to compatible items (Rob)
> - Expand write-only description (Sam)
> 
> v4:
> - There should only be two compatible (Maxime)
> - s/panel-dbi-spi/panel-mipi-dbi-spi/in compatible
> 
> v3:
> - Move properties to Device Tree (Maxime)
> - Use contains for compatible (Maxime)
> - Add backlight property to example
> - Flesh out description
> 
> v2:
> - Fix path for panel-common.yaml
> - Use unevaluatedProperties
> - Drop properties which are in the allOf section
> - Drop model property (Rob)
> 
> Acked-by: Maxime Ripard <maxime@cerno.tech>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
> ---
>  .../display/panel/panel-mipi-dbi-spi.yaml     | 127 ++++++++++++++++++
>  1 file changed, 127 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml b/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
> new file mode 100644
> index 000000000000..a054f65435ce
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
> @@ -0,0 +1,127 @@
> +# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/panel-mipi-dbi-spi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MIPI DBI SPI Panel
> +
> +maintainers:
> +  - Noralf Trønnes <noralf@tronnes.org>
> +
> +description: |
> +  This binding is for display panels using a MIPI DBI compatible controller
> +  in SPI mode.
> +
> +  The MIPI Alliance Standard for Display Bus Interface defines the electrical
> +  and logical interfaces for display controllers historically used in mobile
> +  phones. The standard defines 4 display architecture types and this binding is
> +  for type 1 which has full frame memory. There are 3 interface types in the
> +  standard and type C is the serial interface.
> +
> +  The standard defines the following interface signals for type C:
> +  - Power:
> +    - Vdd: Power supply for display module
> +    - Vddi: Logic level supply for interface signals
> +    Combined into one in this binding called: power-supply
> +  - Interface:
> +    - CSx: Chip select
> +    - SCL: Serial clock
> +    - Dout: Serial out
> +    - Din: Serial in
> +    - SDA: Bidrectional in/out
> +    - D/CX: Data/command selection, high=data, low=command
> +      Called dc-gpios in this binding.
> +    - RESX: Reset when low
> +      Called reset-gpios in this binding.
> +
> +  The type C interface has 3 options:
> +
> +    - Option 1: 9-bit mode and D/CX as the 9th bit
> +      |              Command              |  the next command or following data  |
> +      |<0><D7><D6><D5><D4><D3><D2><D1><D0>|<D/CX><D7><D6><D5><D4><D3><D2><D1><D0>|
> +
> +    - Option 2: 16-bit mode and D/CX as a 9th bit
> +      |              Command or data                              |
> +      |<X><X><X><X><X><X><X><D/CX><D7><D6><D5><D4><D3><D2><D1><D0>|
> +
> +    - Option 3: 8-bit mode and D/CX as a separate interface line
> +      |        Command or data         |
> +      |<D7><D6><D5><D4><D3><D2><D1><D0>|
> +
> +  The panel resolution is specified using the panel-timing node properties
> +  hactive (width) and vactive (height). The other mandatory panel-timing
> +  properties should be set to zero except clock-frequency which can be
> +  optionally set to inform about the actual pixel clock frequency.
> +
> +  If the panel is wired to the controller at an offset specify this using
> +  hback-porch (x-offset) and vback-porch (y-offset).
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +        - sainsmart18
> +      - const: panel-mipi-dbi-spi
> +
> +  write-only:
> +    type: boolean
> +    description:
> +      Controller is not readable (ie. Din (MISO on the SPI interface) is not
> +      wired up).
> +
> +  dc-gpios:
> +    maxItems: 1
> +    description: |
> +      Controller data/command selection (D/CX) in 4-line SPI mode.
> +      If not set, the controller is in 3-line SPI mode.
> +
> +required:
> +  - compatible
> +  - reg
> +  - panel-timing
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    spi {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            display@0{
> +                    compatible = "sainsmart18", "panel-mipi-dbi-spi";
> +                    reg = <0>;
> +                    spi-max-frequency = <40000000>;
> +
> +                    dc-gpios = <&gpio 24 GPIO_ACTIVE_HIGH>;
> +                    reset-gpios = <&gpio 25 GPIO_ACTIVE_HIGH>;
> +                    write-only;
> +
> +                    backlight = <&backlight>;
> +
> +                    width-mm = <35>;
> +                    height-mm = <28>;
> +
> +                    panel-timing {
> +                        hactive = <160>;

The indentation is inconsistent here. I'd suggest using 4 spaces for 
each level.

With that and yamllint fix,

Reviewed-by: Rob Herring <robh@kernel.org>


> +                        vactive = <128>;
> +                        hback-porch = <0>;
> +                        vback-porch = <0>;
> +
> +                        clock-frequency = <0>;
> +                        hfront-porch = <0>;
> +                        hsync-len = <0>;
> +                        vfront-porch = <0>;
> +                        vsync-len = <0>;

0 doesn't make much sense here. 

If most of this is n/a and just populated to satisfy the schema, we 
should probably make all these optional. Anyway, that's a separate 
issue to address.

Rob
