Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD8694313E
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 15:47:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A608410E1EC;
	Wed, 31 Jul 2024 13:47:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ejJIiJJe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BD1010E1EC
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2024 13:47:27 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 23DD2F85;
 Wed, 31 Jul 2024 15:46:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1722433598;
 bh=bWjUxuw/bFpPMmL/Vpdv20Re4oaTJut4VK2k8K8u2l0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ejJIiJJe54gJ8IfG8PT0fVVh91m8puR/joJoDEeDKuI9DlpvI4lc85KVHMLyyn2f9
 90wfBNX6EKhB2JCjhNDaVtm5mEK+29RWLujoC3lPqBKX7QEmmGkcjvoGFDLmr1N2Aj
 zbLjo6YXpzujDjwzgs3nPkj6UeNPTFlfSVXHibNM=
Date: Wed, 31 Jul 2024 16:47:05 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "biju.das.au" <biju.das.au@gmail.com>,
 Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 3/9] dt-bindings: display: renesas,rzg2l-du: Document
 RZ/G2UL DU bindings
Message-ID: <20240731134705.GD12477@pendragon.ideasonboard.com>
References: <20240709135152.185042-1-biju.das.jz@bp.renesas.com>
 <20240709135152.185042-4-biju.das.jz@bp.renesas.com>
 <20240727004958.GF300@pendragon.ideasonboard.com>
 <TY3PR01MB11346C37466562CBB2751F3CD86B72@TY3PR01MB11346.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <TY3PR01MB11346C37466562CBB2751F3CD86B72@TY3PR01MB11346.jpnprd01.prod.outlook.com>
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

Hi Biju,

On Mon, Jul 29, 2024 at 09:05:59AM +0000, Biju Das wrote:
> On Saturday, July 27, 2024 1:50 AM, Laurent Pinchart wrote:
> > On Tue, Jul 09, 2024 at 02:51:41PM +0100, Biju Das wrote:
> > > Document DU found in RZ/G2UL SoC. The DU block is identical to RZ/G2L
> > > SoC, but has only DPI interface.
> > >
> > > While at it, add missing required property port@1 for RZ/G2L and
> > > RZ/V2L SoCs. Currently there is no user for the DPI interface and
> > > hence there won't be any ABI breakage for adding port@1 as required
> > > property for RZ/G2L and RZ/V2L SoCs.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > > ---
> > > v1->v2:
> > >  * Updated commit description related to non ABI breakage.
> > >  * Added Ack from Conor.
> > > ---
> > >  .../bindings/display/renesas,rzg2l-du.yaml    | 32 +++++++++++++++++--
> > >  1 file changed, 29 insertions(+), 3 deletions(-)
> > >
> > > diff --git
> > > a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> > > b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> > > index 08e5b9478051..c0fec282fa45 100644
> > > --- a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> > > +++ b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> > > @@ -18,6 +18,7 @@ properties:
> > >    compatible:
> > >      oneOf:
> > >        - enum:
> > > +          - renesas,r9a07g043u-du # RZ/G2UL
> > >            - renesas,r9a07g044-du # RZ/G2{L,LC}
> > >        - items:
> > >            - enum:
> > > @@ -60,9 +61,6 @@ properties:
> > >          $ref: /schemas/graph.yaml#/properties/port
> > >          unevaluatedProperties: false
> > >
> > > -    required:
> > > -      - port@0
> > > -
> > >      unevaluatedProperties: false
> > >
> > >    renesas,vsps:
> > > @@ -88,6 +86,34 @@ required:
> > >
> > >  additionalProperties: false
> > >
> > > +allOf:
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            const: renesas,r9a07g043u-du
> > > +    then:
> > > +      properties:
> > > +        ports:
> > > +          properties:
> > > +            port@0: false
> > > +            port@1:
> > > +              description: DPI
> > > +
> > > +          required:
> > > +            - port@1
> > 
> > Why do you use port@1 for the DPI output here, and not port@0 ?
> 
> Currently the output is based on port number and port = 1 corresponds to DPI. See [1].
> 
> For consistency, I documented bindings for RZ/G2L family DU's similar to RZ/G2{H,M,N,E} DU [2].
> 
> So please let me know, are you ok with this?

I won't insist strongly, but I don't think that using the port number to
indicate the output type is the best idea. In the R-Car DU driver at
least, that wouldn't have scaled. We have multiple outputs of the same
type on some SoCs. Furthemore, the same DU hardware channel number (i.e.
the offset of the registers specific to that channel in the DU register
space) is not the same across SoCs for the same output type. I recommend
numbering the ports based on the hardware number of the output (the
exact meaning of this is specific to your device, I haven't checked what
it means for RZ/G2L), not on the output type.

> [1] https://elixir.bootlin.com/linux/v6.10.2/source/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c#L187
> 
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/display/renesas,du.yaml?h=next-20240729#n546
> 
> > > +    else:
> > > +      properties:
> > > +        ports:
> > > +          properties:
> > > +            port@0:
> > > +              description: DSI
> > > +            port@1:
> > > +              description: DPI
> > > +
> > > +          required:
> > > +            - port@0
> > > +            - port@1
> > 
> > You're missing a blank line here.
> 
> OK, will fix this'

-- 
Regards,

Laurent Pinchart
