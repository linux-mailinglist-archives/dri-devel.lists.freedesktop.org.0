Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0BF1AAE64
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 18:40:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9B8B6E0DD;
	Wed, 15 Apr 2020 16:40:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7B1D6E0DD
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 16:40:01 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 3FBE420026;
 Wed, 15 Apr 2020 18:39:58 +0200 (CEST)
Date: Wed, 15 Apr 2020 18:39:56 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v1 1/4] dt-bindings: display: convert atmel-hlcdc to DT
 Schema
Message-ID: <20200415163956.GB7965@ravnborg.org>
References: <20200412182012.27515-1-sam@ravnborg.org>
 <20200412182012.27515-2-sam@ravnborg.org>
 <20200414082803.exblunwe7bufbiht@gilmour.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200414082803.exblunwe7bufbiht@gilmour.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=gEfo2CItAAAA:8
 a=7gkXJVJtAAAA:8 a=VwQbUJbxAAAA:8 a=cP0MBsb0hliDGbVkiysA:9
 a=7Zwj6sZBwVKJAoWSPKxL6X1jA+E=:19 a=tD3LE_9lYvMIQjli:21
 a=hU8jqPLB-Mkm8DtO:21 a=CjuIK1q_8ugA:10 a=sptkURWiP4Gy88Gu7hUp:22
 a=E9Po1WZjFZOl8hwRPBS3:22 a=AjGcO6oz07-iQ99wixmX:22
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
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, dri-devel@lists.freedesktop.org,
 Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime.

On Tue, Apr 14, 2020 at 10:28:03AM +0200, Maxime Ripard wrote:
> Hi Sam,
> 
> On Sun, Apr 12, 2020 at 08:20:09PM +0200, Sam Ravnborg wrote:
> > diff --git a/Documentation/devicetree/bindings/display/atmel/hlcdc-dc.yaml b/Documentation/devicetree/bindings/display/atmel/hlcdc-dc.yaml
> > new file mode 100644
> > index 000000000000..7eb6266a25a2
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/atmel/hlcdc-dc.yaml
> > @@ -0,0 +1,102 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/atmel/hlcdc-dc.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Atmel HLCDC (High LCD Controller) display controller
> > +
> > +maintainers:
> > +  - Sam Ravnborg <sam@ravnborg.org>
> > +  - Boris Brezillon <bbrezillon@kernel.org>
> > +
> > +description: |
> > +  The Atmel HLCDC Display Controller is subdevice of the HLCDC MFD device.
> > +  See ../../mfd/atmel-hlcdc.yaml for more details.
> > +
> > +properties:
> > +  compatible:
> > +    const: atmel,hlcdc-display-controller
> > +
> > +  "#address-cells":
> > +    const: 1
> > +  "#size-cells":
> > +    const: 0
> > +
> > +required:
> > +  - compatible
> > +  - "#address-cells"
> > +  - "#size-cells"
> > +
> > +patternProperties:
> > +  "^port@[0-9]$":
> > +    type: object
> > +    description: |
> > +      A port node with endpoint definitions as defined in
> > +      ../../media/video-interfaces.txt
> > +
> > +    properties:
> > +      "#address-cells":
> > +        const: 1
> > +
> > +      "#size-cells":
> > +        const: 0
> > +
> > +      reg:
> > +        maxItems: 1
> > +        description: The virtual number of the port
> > +
> > +    patternProperties:
> > +      "^endpoint(@[0-9])$":
> 
> I guess you meant ^endpoint(@[0-9])?$ instead?
I think "^endpoint@[0-9]$" will do the trick.
No need for endpoints with numbers higher than 9.


> 
> > +        type: object
> > +
> > +        properties:
> > +          reg:
> > +            maxItems: 1
> > +            description: The virtual number of the endpoint
> > +
> > +          bus-width:
> > +            enum: [12, 16, 18, 24]
> > +            description:
> > +              Any endpoint node may specify a desired video interface
> > +              according to ../../media/video-interfaces.txt, specifically
> > +              Recognized values are <12>, <16>, <18> and <24>, and
> > +              override any output mode selection heuristic, forcing
> > +              "rgb444", "rgb565", "rgb666" and "rgb888" respectively.
> > +
> > +          remote-endpoint:
> > +            $ref: /schemas/types.yaml#/definitions/phandle
> > +            description:
> > +              phandle to the panel node
> > +
> > +        required:
> > +          - reg
> 
> And if so, reg depends on whether the unit-address is set or not, so
> you can't really enforce that.
> 
> > diff --git a/Documentation/devicetree/bindings/mfd/atmel-hlcdc.yaml b/Documentation/devicetree/bindings/mfd/atmel-hlcdc.yaml
> > new file mode 100644
> > index 000000000000..cad14fa173a1
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mfd/atmel-hlcdc.yaml
> > @@ -0,0 +1,78 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/mfd/atmel-hlcdc.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Device-Tree bindings for Atmel's HLCDC (High LCD Controller)
> > +
> > +maintainers:
> > +  - Sam Ravnborg <sam@ravnborg.org>
> > +  - Boris Brezillon <bbrezillon@kernel.org>
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - atmel,at91sam9n12-hlcdc
> > +      - atmel,at91sam9x5-hlcdc
> > +      - atmel,sama5d2-hlcdc
> > +      - atmel,sama5d3-hlcdc
> > +      - atmel,sama5d4-hlcdc
> > +      - microchip,sam9x60-hlcdc
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 3
> 
> Having descirptions of what those clocks are would be nice.
OK, will dig them up from the data sheet

> 
> > +  clock-names:
> > +    maxItems: 3
> > +    items:
> > +      - const: periph_clk
> > +      - const: sys_clk
> > +      - const: slow_clk
> > +
> > +  interrupts:
> > +    description: The HLCDC interrupt line
> > +    maxItems: 1
> > +
> > +  hlcdc_pwm:
> > +    type: object
> > +    description: |
> > +      PWM controller - used for backlight.
> > +      See ../pwm/atmel-hlcdc-pwm.yaml for details
> > +
> > +  hlcdc-display-controller:
> > +    type: object
> > +    description: |
> > +      LCD display controller
> > +      See ../display/atmel/hlcdc-dc.yaml for details
> 
> I guess you could include those two schemas to make sure that it's
> valid? Otherwise, if you have an hlcdc-display-controller (or pwm)
> node without a compatible, it will not be checked here, and will not
> be checked by the hlcdc-dc.yaml schemas either since it matches on the
> compatible.

Good point - will fix in v2.
Thanks for the feedback.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
