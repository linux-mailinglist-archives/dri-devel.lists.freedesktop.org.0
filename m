Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8776D950D41
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 21:39:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2DEE10E3E8;
	Tue, 13 Aug 2024 19:39:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Zs15MILW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E66910E3E8
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 19:39:40 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4772B4AB;
 Tue, 13 Aug 2024 21:38:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1723577921;
 bh=BqRNvzQDOJ/GHo5ioyhI06Ug3jShS1tIwzfi+ejCMUY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Zs15MILWOckLiTdukNf5bPHTz7M6Z8DErobZMaX49SzEItbCdfQvHOgZwFqrSfMNS
 +0dczsYq2YzVWVhXUSHMx/t53KsIRjP9HvB1XOFlWI473JbLXh0femNl5ECkXKQTQc
 DbYZ8nI/SjM8Gql4k+VSWLmm2E394n6j98zj8RX0=
Date: Tue, 13 Aug 2024 22:39:13 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rob Herring <robh@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: display: renesas,rzg2l-du: Document
 RZ/G2UL DU bindings
Message-ID: <20240813193913.GH24634@pendragon.ideasonboard.com>
References: <20240805155242.151661-1-biju.das.jz@bp.renesas.com>
 <20240805155242.151661-2-biju.das.jz@bp.renesas.com>
 <20240813163220.GA1164014-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240813163220.GA1164014-robh@kernel.org>
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

Hi Rob,

On Tue, Aug 13, 2024 at 10:32:20AM -0600, Rob Herring wrote:
> On Mon, Aug 05, 2024 at 04:52:35PM +0100, Biju Das wrote:
> > Document DU found in RZ/G2UL SoC. The DU block is identical to RZ/G2L
> > SoC, but has only DPI interface.
> > 
> > While at it, add missing required property port@1 for RZ/G2L and RZ/V2L
> > SoCs. Currently there is no user for the DPI interface and hence there
> > won't be any ABI breakage for adding port@1 as required property for
> > RZ/G2L and RZ/V2L SoCs.
> > 
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > v2->v3:
> >  * Replaced ports->port property for RZ/G2UL as it supports only DPI.
> >    and retained ports property for RZ/{G2L,V2L} as it supports both DSI
> >    and DPI output interface.
> 
> Why? Having port and ports is just a needless complication.

I agree that making the ports node mandatory, even when the device has a
single port, will simplify the bindings. In hindsight we should never
have made ports optional, but that can't be changed.

> >  * Added missing blank line before example.
> >  * Dropped tags from Conor and Geert as there are new changes.
> > v1->v2:
> >  * Updated commit description related to non ABI breakage.
> >  * Added Ack from Conor.
> > ---
> >  .../bindings/display/renesas,rzg2l-du.yaml    | 35 +++++++++++++++++--
> >  1 file changed, 32 insertions(+), 3 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> > index 08e5b9478051..ca01bf26c4c0 100644
> > --- a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> > +++ b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> > @@ -18,6 +18,7 @@ properties:
> >    compatible:
> >      oneOf:
> >        - enum:
> > +          - renesas,r9a07g043u-du # RZ/G2UL
> >            - renesas,r9a07g044-du # RZ/G2{L,LC}
> >        - items:
> >            - enum:
> > @@ -60,8 +61,9 @@ properties:
> >          $ref: /schemas/graph.yaml#/properties/port
> >          unevaluatedProperties: false
> >  
> > -    required:
> > -      - port@0
> > +  port:
> > +    $ref: /schemas/graph.yaml#/properties/port
> > +    description: Connection to the DU output video port.
> >  
> >      unevaluatedProperties: false
> >  
> > @@ -83,11 +85,38 @@ required:
> >    - clock-names
> >    - resets
> >    - power-domains
> > -  - ports
> >    - renesas,vsps
> >  
> >  additionalProperties: false
> >  
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: renesas,r9a07g043u-du
> > +    then:
> > +      properties:
> > +        port:
> > +          description: DPI
> 
> This is equivalent to 'port@0'. IMO, this case should have a 'port@1' 
> node so that DPI interface is *always* the same port.

That's what Biju did in the previous version, and I recommended to
number the ports based on hardware indices, not types. Mapping port
numbers to the hardware documentation makes it more consistent for DT
writers, makes the logic simpler to understand (in my opinion, based on
my experience with the R-Car DU) on the driver side, but most
importantly, type-based numbering wouldn't scale as SoCs could have
multiple ports of the same type (we've seen that happening with R-Car).

> > +
> > +      required:
> > +        - port
> > +    else:
> > +      properties:
> > +        ports:
> > +          properties:
> > +            port@0:
> > +              description: DSI
> > +            port@1:
> > +              description: DPI
> > +
> > +          required:
> > +            - port@0
> > +            - port@1
> > +      required:
> > +        - ports
> > +
> >  examples:
> >    # RZ/G2L DU
> >    - |

-- 
Regards,

Laurent Pinchart
