Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB9D19F4A0
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 13:33:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41DF16E338;
	Mon,  6 Apr 2020 11:33:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 328BC6E338
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Apr 2020 11:32:59 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 16A2680E;
 Mon,  6 Apr 2020 13:32:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1586172777;
 bh=6fhIA5nfV7r2zVpwvnNnjFKY7TSbzhwCVVuZ+u7eMX4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vEkYowfwWdiryLeQqKjd1hSkOc9je4zQKN4SvwnYW3IT+bt0Cmdeh2U/HfqPzMLmm
 ChA/dX08EhvgTCVwOunGJvzgzaQTCLoYqt25eseW6NwjI46WWPFbPmWIQhsnBcov6w
 WyfaZ7AToGfaTxiKjRynotwQKDCO+ibBj0LK/Z1g=
Date: Mon, 6 Apr 2020 14:32:47 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH/RFC 2/6] dt-bindings: display: bridge: renesas,dw-hdmi:
 Convert binding to YAML
Message-ID: <20200406113247.GF4757@pendragon.ideasonboard.com>
References: <20200405233935.27599-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200405233935.27599-3-laurent.pinchart+renesas@ideasonboard.com>
 <20200406075705.a67tjx7jamdvqpl3@gilmour.lan>
 <20200406112856.GE4757@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200406112856.GE4757@pendragon.ideasonboard.com>
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
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Yao <mark.yao@rock-chips.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hallo again,

On Mon, Apr 06, 2020 at 02:28:57PM +0300, Laurent Pinchart wrote:
> On Mon, Apr 06, 2020 at 09:57:05AM +0200, Maxime Ripard wrote:
> > On Mon, Apr 06, 2020 at 02:39:31AM +0300, Laurent Pinchart wrote:
> > > diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.yaml
> > > new file mode 100644
> > > index 000000000000..9a543740c81d
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.yaml
> > > @@ -0,0 +1,142 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/display/bridge/renesas,dw-hdmi.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Renesas R-Car DWC HDMI TX Encoder
> > > +
> > > +maintainers:
> > > +  - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > +
> > > +description: |
> > > +  The HDMI transmitter is a Synopsys DesignWare HDMI 1.4 TX controller IP
> > > +  with a companion PHY IP.
> > > +
> > > +allOf:
> > > +  - $ref: synopsys,dw-hdmi.yaml#
> > > +
> > > +properties:
> > > +  compatible:
> > > +    items:
> > > +      - enum:
> > > +        - renesas,r8a774a1-hdmi # for R8A774A1 (RZ/G2M) compatible HDMI TX
> > > +        - renesas,r8a774b1-hdmi # for R8A774B1 (RZ/G2N) compatible HDMI TX
> > > +        - renesas,r8a7795-hdmi # for R8A7795 (R-Car H3) compatible HDMI TX
> > > +        - renesas,r8a7796-hdmi # for R8A7796 (R-Car M3-W) compatible HDMI TX
> > > +        - renesas,r8a77965-hdmi # for R8A77965 (R-Car M3-N) compatible HDMI TX
> > > +      - const: renesas,rcar-gen3-hdmi
> > > +
> > > +  reg: true
> > > +
> > > +  reg-io-width:
> > > +    const: 1
> > > +
> > > +  clocks:
> > > +    minItems: 2
> > > +    maxItems: 2
> > 
> > You don't need both, if one is missing the other will be filled by the
> > dt-schema tools. In this particular case, I guess maxItems would make
> > more sense.
> 
> Fixed.
> 
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: iahb
> > > +      - const: isfr
> > > +
> > > +  interrupts: true
> > > +
> > > +  ports:
> > > +    type: object
> > > +    description: |
> > > +      This device has three video ports. Their connections are modelled using the
> > > +      OF graph bindings specified in Documentation/devicetree/bindings/graph.txt.
> > > +      Each port shall have a single endpoint.
> > > +
> > > +    properties:
> > > +      '#address-cells':
> > > +        const: 1
> > > +
> > > +      '#size-cells':
> > > +        const: 0
> > > +
> > > +      port@0:
> > > +        type: object
> > > +        description: Parallel RGB input port
> > > +
> > > +      port@1:
> > > +        type: object
> > > +        description: HDMI output port
> > > +
> > > +      port@2:
> > > +        type: object
> > > +        description: Sound input port
> > > +
> > > +    required:
> > > +      - port@0
> > > +      - port@1
> > > +      - port@2
> > > +
> > > +    additionalProperties: false

Would it also make sense to use unevaluatedProperties here, and drop
#address-cells and #size-cells above as they're already evaluated in
synopsys,dw-hdmi.yaml ?

> > > +
> > > +  power-domains:
> > > +    maxItems: 1
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - clocks
> > > +  - clock-names
> > > +  - interrupts
> > > +  - ports
> > > +
> > > +additionalProperties: false
> > 
> > In the case where you have some kind of generic schema and then a more
> > specific one like you have here, unevaluatedProperties make more sense
> > that additionalProperties.
> > 
> > additionalProperties checks that there are no extra properties on the
> > current schema, which is a problem here since you have to duplicate
> > the entire list of properties found in the generic schema, while
> > unevaluatedProperties checks that there are no extra properties in the
> > entire set of all schemas that apply to this node.
> > 
> > This way, you can just put what is different from the generic schema,
> > and you don't have to keep it in sync.
> > 
> > It's a feature that has been added in the spec of the schemas that
> > went on right after the one we support in the tools, so for now the
> > kernel meta-schemas only allows that property to be there (just like
> > deprecated) but won't do anything.
> > 
> > This should be fixed quite soon however, the library we depend on
> > has started to work on that spec apparently.
> 
> Should I postpone this series until support for unevaluatedProperties is
> available, to be able to test this ?

Also, to make sure I understand this correctly, does it mean I can drop
"reg: true" and "interrupts: true" ?

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
