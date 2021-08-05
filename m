Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F27333E1C50
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 21:18:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5306E6EB27;
	Thu,  5 Aug 2021 19:18:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFDEC6EB27
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Aug 2021 19:18:38 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id f2eda000-f621-11eb-9082-0050568c148b;
 Thu, 05 Aug 2021 19:18:43 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 3301C194B05;
 Thu,  5 Aug 2021 21:19:02 +0200 (CEST)
Date: Thu, 5 Aug 2021 21:18:33 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Markuss Broks <markuss.broks@gmail.com>
Cc: linux-kernel@vger.kernel.org, linus.walleij@linaro.org,
 phone-devel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/panel: Add DT bindings for Samsung S6D27A1
 display panel
Message-ID: <YQw5iS5qHf+sZTK+@ravnborg.org>
References: <YQmG6EbBherV+8px@ravnborg.org>
 <20210805133343.27032-1-markuss.broks@gmail.com>
 <20210805133343.27032-2-markuss.broks@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210805133343.27032-2-markuss.broks@gmail.com>
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

Hi Markuss,

On Thu, Aug 05, 2021 at 04:33:41PM +0300, Markuss Broks wrote:
> This adds device-tree bindings for the Samsung S6D27A1 RGB
> DPI display panel.
> 
> Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
> ---
>  .../display/panel/samsung,s6d27a1.yaml        | 97 +++++++++++++++++++
>  1 file changed, 97 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6d27a1.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6d27a1.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6d27a1.yaml
> new file mode 100644
> index 0000000000..c6c534aa87
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/samsung,s6d27a1.yaml
> @@ -0,0 +1,97 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/samsung,s6d27a1.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung S6D27A1 display panel
> +
> +description: The S6D27A1 is a 480x800 DPI display panel from Samsung Mobile
> +  Displays (SMD). The panel must obey the rules for a SPI slave device
> +  as specified in spi/spi-controller.yaml
> +
> +maintainers:
> +  - Markuss Broks <markuss.broks@gmail.com>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: samsung,s6d27a1
> +
> +  reg: true
> +
> +  interrupts:
> +    description: provides an optional ESD (electrostatic discharge)
> +      interrupt that signals abnormalities in the display hardware.
> +      This can also be raised for other reasons like erroneous
> +      configuration.
> +    maxItems: 1
> +
> +  reset-gpios: true
> +
> +  vci-supply:
> +    description: regulator that supplies the VCI analog voltage
> +      usually around 3.0 V
> +
> +  vccio-supply:
> +    description: regulator that supplies the VCCIO voltage usually
> +      around 1.8 V
> +
> +  backlight: true
> +
> +  spi-cpha: true
> +
> +  spi-cpol: true
> +
> +  spi-max-frequency:
> +    maximum: 1200000
> +
> +  port: true
> +
> +required:
> +  - compatible
> +  - reg

> +  - spi-cpha
> +  - spi-cpol
> +  - port
Do the HW really require the above three properties?

Can the HW work without a supply (hint: I think vci-supply and
vccio-supply are required)

> +
> +additionalProperties: false

As this device sits on the SPI bus you need to use:
unevaluatedProterties: false
(Check spelling from other bindings)

This allows DT files to add more spi related properties, but do not
allow DT files to add unknown properties.

With the current scheme you restrict the DT file to only the three
mentioned SPI properties that may be OK for your HW but maybe not OK for
the next HW using the same panel.

	Sam



> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    spi {
> +        compatible = "spi-gpio";
> +        sck-gpios = <&gpio 0 GPIO_ACTIVE_HIGH>;
> +        miso-gpios = <&gpio 1 GPIO_ACTIVE_HIGH>;
> +        mosi-gpios = <&gpio 2 GPIO_ACTIVE_HIGH>;
> +        cs-gpios = <&gpio 3 GPIO_ACTIVE_HIGH>;
> +        num-chipselects = <1>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        panel@0 {
> +            compatible = "samsung,s6d27a1";
> +            spi-max-frequency = <1200000>;
> +            spi-cpha;
> +            spi-cpol;
> +            reg = <0>;
> +            vci-supply = <&lcd_3v0_reg>;
> +            vccio-supply = <&lcd_1v8_reg>;
> +            reset-gpios = <&gpio 4 GPIO_ACTIVE_LOW>;
> +            interrupt-parent = <&gpio>;
> +            interrupts = <5 IRQ_TYPE_EDGE_RISING>;
> +
> +            port {
> +                panel_in: endpoint {
> +                    remote-endpoint = <&display_out>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> -- 
> 2.32.0
