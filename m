Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCBF2EAA2F
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jan 2021 12:50:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20FD389B45;
	Tue,  5 Jan 2021 11:50:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71BFA89B45
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jan 2021 11:50:43 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3B7BC3D7;
 Tue,  5 Jan 2021 12:50:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1609847441;
 bh=ph+ntUQslgZgfCQn7KLpCZ9tMXibgkmX/XQNPt8IkdQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fibL4FKo/BgTObsMoqNaDZ0dNeNhfHcLATRU2HiwtuiHHS9pmIG1k2wy8u7Gkla5J
 A7oWwxcyWm27II1bZm1o7q7E01pNTGxgnxAO+Xqa6Xd056JsxCRZrEw/lObwzndWhu
 2XkrBfdm53u2hBDePpctpSTrHolMVyrAoiVw5OYg=
Date: Tue, 5 Jan 2021 13:50:29 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v2 3/6] dt-bindings: display: imx: hdmi: Convert binding
 to YAML
Message-ID: <X/RShZkMICSW7Jnn@pendragon.ideasonboard.com>
References: <20201220195005.26438-1-laurent.pinchart+renesas@ideasonboard.com>
 <20201220195005.26438-4-laurent.pinchart+renesas@ideasonboard.com>
 <810947ea1a18e06db1f36a4a8013fbca17e0ea89.camel@pengutronix.de>
 <X/P94CIrNtGkoZ4k@pendragon.ideasonboard.com>
 <dc0a8b0568c2b3f550a3069e4a34dd5e90079c8f.camel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dc0a8b0568c2b3f550a3069e4a34dd5e90079c8f.camel@pengutronix.de>
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
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 Mark Yao <mark.yao@rock-chips.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Philipp,

On Tue, Jan 05, 2021 at 10:32:01AM +0100, Philipp Zabel wrote:
> On Tue, 2021-01-05 at 07:49 +0200, Laurent Pinchart wrote:
> > On Mon, Jan 04, 2021 at 04:30:36PM +0100, Philipp Zabel wrote:
> > > On Sun, 2020-12-20 at 21:50 +0200, Laurent Pinchart wrote:
> > > > Convert the i.MX6 HDMI TX text binding to YAML.
> > > > 
> > > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > > ---
> > > > Changes since v1:
> > > > 
> > > > - Only specify maxItems for clocks
> > > > - Drop reg and interrupts as they're checked in the base schema
> > > > - Rebase on top of OF graph schema, dropped redundant properties
> > > > - Fix identation for enum entries
> > > > - Drop clock-names items, use maxItems only
> > > > ---
> > > >  .../bindings/display/imx/fsl,imx6-hdmi.yaml   | 130 ++++++++++++++++++
> > > >  .../devicetree/bindings/display/imx/hdmi.txt  |  65 ---------
> > > >  2 files changed, 130 insertions(+), 65 deletions(-)
> > > >  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml
> > > >  delete mode 100644 Documentation/devicetree/bindings/display/imx/hdmi.txt
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml
> > > > new file mode 100644
> > > > index 000000000000..f9b131bb3339
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml
> > > > @@ -0,0 +1,130 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/display/imx/fsl,imx6-hdmi.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Freescale i.MX6 DWC HDMI TX Encoder
> > > > +
> > > > +maintainers:
> > > > +  - Philipp Zabel <p.zabel@pengutronix.de>
> > > > +
> > > > +description: |
> > > > +  The HDMI transmitter is a Synopsys DesignWare HDMI 1.4 TX controller IP
> > > > +  with a companion PHY IP.
> > > > +
> > > > +allOf:
> > > > +  - $ref: ../bridge/synopsys,dw-hdmi.yaml#
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    enum:
> > > > +      - fsl,imx6dl-hdmi
> > > > +      - fsl,imx6q-hdmi
> > > > +
> > > > +  reg-io-width:
> > > > +    const: 1
> > > > +
> > > > +  clocks:
> > > > +    maxItems: 2
> > > > +
> > > > +  clock-names:
> > > > +    maxItems: 2
> > > > +
> > > > +  ddc-i2c-bus:
> > > > +    $ref: /schemas/types.yaml#/definitions/phandle
> > > > +    description:
> > > > +      The HDMI DDC bus can be connected to either a system I2C master or the
> > > > +      functionally-reduced I2C master contained in the DWC HDMI. When connected
> > > > +      to a system I2C master this property contains a phandle to that I2C
> > > > +      master controller.
> > > > +
> > > > +  gpr:
> > > > +    $ref: /schemas/types.yaml#/definitions/phandle
> > > > +    description:
> > > > +      phandle to the iomuxc-gpr region containing the HDMI multiplexer control
> > > > +      register.
> > > > +
> > > > +  ports:
> > > > +    $ref: /schemas/graph.yaml#/properties/ports
> > > > +    description: |
> > > > +      This device has four video ports, corresponding to the four inputs of the
> > > > +      HDMI multiplexer. Each port shall have a single endpoint.
> > > > +
> > > > +    properties:
> > > > +      port@0:
> > > > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > > > +        unevaluatedProperties: false
> > > > +        description: First input of the HDMI multiplexer
> > > > +
> > > > +      port@1:
> > > > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > > > +        unevaluatedProperties: false
> > > > +        description: Second input of the HDMI multiplexer
> > > > +
> > > > +      port@2:
> > > > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > > > +        unevaluatedProperties: false
> > > > +        description: Third input of the HDMI multiplexer
> > > > +
> > > > +      port@3:
> > > > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > > > +        unevaluatedProperties: false
> > > > +        description: Fourth input of the HDMI multiplexer
> > > > +
> > > > +    anyOf:
> > > > +      - required:
> > > > +          - port@0
> > > > +      - required:
> > > > +          - port@1
> > > > +      - required:
> > > > +          - port@2
> > > > +      - required:
> > > > +          - port@3
> > > > +
> > > > +required:
> > > > +  - compatible
> > > > +  - reg
> > > > +  - clocks
> > > > +  - clock-names
> > > > +  - gpr
> > > > +  - interrupts
> > > > +  - ports
> 
> The binding marks the "ports" container node as required.
> 
> > > Won't this break validation of current i.MX6 DTs, which don't use the
> > > ports node (in imx6q(dl).dtsi)?
> > 
> > I may be missing something, but in imx6qdl.dtsi, we have
>
> [...]
>
> > and in imx6q.dtsi,
> > 
> > &hdmi {
> > 	compatible = "fsl,imx6q-hdmi";
> > 
> > 	port@2 {
> > 		reg = <2>;
> > 
> > 		hdmi_mux_2: endpoint {
> > 			remote-endpoint = <&ipu2_di0_hdmi>;
> > 		};
> > 	};
> > 
> > 	port@3 {
> > 		reg = <3>;
> > 
> > 		hdmi_mux_3: endpoint {
> > 			remote-endpoint = <&ipu2_di1_hdmi>;
> > 		};
> > 	};
> > };
> > 
> > There are no other occurrences of "fsl,imx6q-hdmi" than in imx6q.dtsi
> > (and no occurrences of "fsl,imx6qdl-hdmi" at all).
> 
> The port@[0-3] nodes are currently direct children of the &hdmi node,
> without the "ports" container node.

Of course. Sorry, I've missed that that was the point.

I can include a patch to update imx6q(dl).dtsi in the series. Would that
work for you ?

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
