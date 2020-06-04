Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7681EDE2A
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jun 2020 09:30:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15A326E291;
	Thu,  4 Jun 2020 07:30:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5002B6E291
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jun 2020 07:30:12 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E216029B;
 Thu,  4 Jun 2020 09:30:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1591255810;
 bh=OeVLMiEC4J9VxlZT612hjSJQ4NpMPCcv03PP57PjMfI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aRJSMZ49P0ne+GgnWEY3QHWJgBfU1y1yTUIO2SjJykuAP4myXsxuT6xnJWkbNZh93
 ziFph/TUVTEPz4TzPcxE408geh6tky+oIMjtFr631nzHMl02TO9HxADyvLeEW+cEK0
 SqPz6kQSsGheat7L7K2U45pV3L7+3+NbRsnpe94o=
Date: Thu, 4 Jun 2020 10:29:52 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH 2/3] dt-bindings: display: bridge: Add documentation for
 LT9611
Message-ID: <20200604072952.GA5828@pendragon.ideasonboard.com>
References: <20200513100533.42996-1-vkoul@kernel.org>
 <20200513100533.42996-3-vkoul@kernel.org>
 <20200528014837.GD4670@pendragon.ideasonboard.com>
 <20200604071859.GD3521@vkoul-mobl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200604071859.GD3521@vkoul-mobl>
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Vinod,

On Thu, Jun 04, 2020 at 12:48:59PM +0530, Vinod Koul wrote:
> Hi Laurent,
> 
> Sorry for late reply, I was out last week.

No worries.

> On 28-05-20, 04:48, Laurent Pinchart wrote:
> > > +
> > > +  interrupts:
> > > +    maxItems: 1
> > > +    description: interrupt line for the chip
> > 
> > I think you could drop the descriptions for the reg and interrupt
> > properties, they don't add much.
> 
> Sure, will do
> 
> > > +  reset-gpios:
> > > +    maxItems: 1
> > > +    description: GPIO connected to active high RESET pin.
> > > +
> > > +  vdd-supply:
> > > +    description: Regulator for 1.8V MIPI phy power.
> > > +
> > > +  vcc-supply:
> > > +    description: Regulator for 3.3V IO power.
> > > +
> > > +  ports:
> > > +    type: object
> > > +
> > > +    properties:
> > > +      "#address-cells":
> > > +        const: 1
> > > +
> > > +      "#size-cells":
> > > +        const: 0
> > > +
> > > +      port@0:
> > > +        type: object
> > > +        additionalProperties: false
> > > +
> > > +        description: |
> > > +          HDMI port for HDMI output
> > 
> > The usual practice is to have the input ports first, followed by the
> > output ports. Is there a reason not to follow that rule ?
> 
> I was not aware of this rule, is it documented somewhere?
> Nevertheless will update..

I don't think it's documented, no. It's just a common practice.

> > > +
> > > +        properties:
> > > +          reg:
> > > +            const: 0
> > > +
> > > +        patternProperties:
> > > +          endpoint:
> > 
> > If you want to use patternProperties, this should be
> > 
> >           "^endpoint@[0-9]+$":
> > 
> > (including the quotes). Same below.
> 
> Ok
> 
> > > +            type: object
> > > +            additionalProperties: false
> > > +
> > > +            properties:
> > > +              remote-endpoint: true
> > 
> > How about
> > 
> >               remote-endpoint:
> >                 $ref: /schemas/types.yaml#/definitions/phandle
> > 
> > and the same below ?
> 
> Ok
> 
> > You also need a reg property if multiple endpoints are present.
> 
> Will update
>
> > > +
> > > +        required:
> > > +          - reg
> > > +
> > > +      port@1:
> > > +        type: object
> > > +        additionalProperties: false
> > > +
> > > +        description: |
> > > +          MIPI port-1 for MIPI input
> > > +
> > > +        properties:
> > > +          reg:
> > > +            const: 1
> > > +
> > > +        patternProperties:
> > > +          endpoint:
> > > +            type: object
> > > +            additionalProperties: false
> > > +
> > > +            properties:
> > > +              remote-endpoint: true
> > > +
> > > +        required:
> > > +          - reg
> > > +
> > > +      port@2:
> > > +        type: object
> > > +        additionalProperties: false
> > > +
> > > +        description: |
> > > +          MIPI port-2 for MIPI input
> > 
> > A description of how the two MIPI inputs differ would be useful. In
> > particular, are both mandatory, or is it valid to connect only one of
> > the two ? If using a single input is supported, can it be either, or
> > does it have to be the first one ? When using both inputs, what should
> > be connected to them ?
> 
> Sure I will add details. port-1 is mandatory and port-2 optional. port-2
> is used in combination with port-1 to drive displays for higher
> resolution like 4k
> 
> > > +
> > > +        properties:
> > > +          reg:
> > > +            const: 2
> > > +
> > > +        patternProperties:
> > > +          endpoint:
> > > +            type: object
> > > +            additionalProperties: false
> > > +
> > > +            properties:
> > > +              remote-endpoint: true
> > > +
> > > +        required:
> > > +          - reg
> > > +
> > > +    required:
> > > +      - "#address-cells"
> > > +      - "#size-cells"
> > > +      - port@0
> > > +      - port@1
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - interrupts
> > > +  - vdd-supply
> > > +  - vcc-supply
> > > +  - ports
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/gpio/gpio.h>
> > > +    #include <dt-bindings/interrupt-controller/irq.h>
> > > +
> > > +    i2c10 {
> > > +      #address-cells = <1>;
> > > +      #size-cells = <0>;
> > > +
> > > +      lt9611_codec: hdmi-bridge@3b {
> > 
> > Please drop unused labels.
> 
> ok
> 
> > > +        compatible = "lontium,lt9611";
> > > +        reg = <0x3b>;
> > > +
> > > +        reset-gpios = <&tlmm 128 GPIO_ACTIVE_HIGH>;
> > > +        interrupts-extended = <&tlmm 84 IRQ_TYPE_EDGE_FALLING>;
> > > +
> > > +        vdd-supply = <&lt9611_1v8>;
> > > +        vcc-supply = <&lt9611_3v3>;
> > > +
> > > +        ports {
> > > +          #address-cells = <1>;
> > > +          #size-cells = <0>;
> > > +
> > > +          port@0 {
> > > +            reg = <0>;
> > > +            lt9611_out: endpoint {
> > > +              remote-endpoint = <&hdmi_con>;
> > > +            };
> > > +          };
> > > +
> > > +          port@1 {
> > > +            reg = <1>;
> > > +            lt9611_a: endpoint {
> > > +              remote-endpoint = <&dsi0_out>;
> > > +            };
> > > +          };
> > > +
> > > +          port@2 {
> > > +            reg = <2>;
> > > +            lt9611_b: endpoint {
> > > +              remote-endpoint = <&dsi1_out>;
> > > +            };
> > > +          };
> > > +        };
> > > +      };
> > > +    };
> > 
> > It's customary to end YAML schema files with ... on a separate line.
> 
> Will update
> 
> Thanks for the review

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
