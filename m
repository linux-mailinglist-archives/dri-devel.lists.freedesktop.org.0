Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E934A7168
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 14:21:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC94E10E3D5;
	Wed,  2 Feb 2022 13:21:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09B1C10E3D5
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 13:21:30 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 606D32F3;
 Wed,  2 Feb 2022 14:21:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1643808088;
 bh=FqKenBjNbq4zSMVmLeUp/7sVaZ1CqbTSvpM5ifvH/To=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZKBLGmUUgFG0fMUN2yAshHA0C4pIIN+mSlGUC5zaGZE/jgAjyxN5TLNAIH/gjTtwb
 VxWnKDAuOYv8MUetZ+Q4jpesbLxNjg4mMGbTTaP8s1kVraupBZbQvItmoQHTAVgx6X
 FEfP5mskaGc4vsr46LBnwLmjZETOQtE7f/rxBsY4=
Date: Wed, 2 Feb 2022 15:21:05 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v3 2/2] dt-bindings: panel: Introduce a panel-lvds binding
Message-ID: <YfqFQRaeRwAlyyHV@pendragon.ideasonboard.com>
References: <20220111110635.804371-1-maxime@cerno.tech>
 <20220111110635.804371-2-maxime@cerno.tech>
 <Yd2Ahn3+FVv/Aks7@pendragon.ideasonboard.com>
 <20220127142215.fesipdslabur43sx@houat>
 <20220202094845.r7td65zxfo5uqg5x@houat>
 <Yfp9UhwWZbHpDjpL@pendragon.ideasonboard.com>
 <20220202131623.3vfbtuyeemzcxe4k@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220202131623.3vfbtuyeemzcxe4k@houat>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Frank Rowand <frowand.list@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 02, 2022 at 02:16:23PM +0100, Maxime Ripard wrote:
> On Wed, Feb 02, 2022 at 02:47:14PM +0200, Laurent Pinchart wrote:
> > On Wed, Feb 02, 2022 at 10:48:45AM +0100, Maxime Ripard wrote:
> > > On Thu, Jan 27, 2022 at 03:22:15PM +0100, Maxime Ripard wrote:
> > > > On Tue, Jan 11, 2022 at 03:05:10PM +0200, Laurent Pinchart wrote:
> > > > > On Tue, Jan 11, 2022 at 12:06:35PM +0100, Maxime Ripard wrote:
> > > > > > Following the previous patch, let's introduce a generic panel-lvds
> > > > > > binding that documents the panels that don't have any particular
> > > > > > constraint documented.
> > > > > > 
> > > > > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > > > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > > > > > 
> > > > > > ---
> > > > > > 
> > > > > > Changes from v2:
> > > > > >   - Added a MAINTAINERS entry
> > > > > > 
> > > > > > Changes from v1:
> > > > > >   - Added missing compatible
> > > > > >   - Fixed lint
> > > > > > ---
> > > > > >  .../bindings/display/panel/panel-lvds.yaml    | 57 +++++++++++++++++++
> > > > > >  MAINTAINERS                                   |  1 +
> > > > > >  2 files changed, 58 insertions(+)
> > > > > >  create mode 100644 Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
> > > > > > 
> > > > > > diff --git a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
> > > > > > new file mode 100644
> > > > > > index 000000000000..fcc50db6a812
> > > > > > --- /dev/null
> > > > > > +++ b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
> > > > > > @@ -0,0 +1,57 @@
> > > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > > +%YAML 1.2
> > > > > > +---
> > > > > > +$id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
> > > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > > +
> > > > > > +title: Generic LVDS Display Panel Device Tree Bindings
> > > > > > +
> > > > > > +maintainers:
> > > > > > +  - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > > +  - Thierry Reding <thierry.reding@gmail.com>
> > > > > > +
> > > > > > +allOf:
> > > > > > +  - $ref: panel-common.yaml#
> > > > > > +  - $ref: /schemas/display/lvds.yaml/#
> > > > > > +
> > > > > > +select:
> > > > > > +  properties:
> > > > > > +    compatible:
> > > > > > +      contains:
> > > > > > +        const: panel-lvds
> > > > > > +
> > > > > > +  not:
> > > > > > +    properties:
> > > > > > +      compatible:
> > > > > > +        contains:
> > > > > > +          enum:
> > > > > > +            - advantech,idk-1110wr
> > > > > > +            - advantech,idk-2121wr
> > > > > > +            - innolux,ee101ia-01d
> > > > > > +            - mitsubishi,aa104xd12
> > > > > > +            - mitsubishi,aa121td01
> > > > > > +            - sgd,gktw70sdae4se
> > > > > 
> > > > > I still don't like this :-( Couldn't we instead do
> > > > > 
> > > > > select:
> > > > >   properties:
> > > > >     compatible:
> > > > >       contains:
> > > > >         enum:
> > > > >           - auo,b101ew05
> > > > >           - tbs,a711-panel
> > > > > 
> > > > > ?
> > > > 
> > > > That works too, I'll send another version.
> > > 
> > > Actually, no, it doesn't work.
> > > 
> > > If we do this, if we were to have a panel that has panel-lvds but none
> > > of the other compatible (because of a typo, or downright invalid
> > > binding) we won't validate it and report any error.
> > > 
> > > I'll merge this version (together with the v4 version of patch 1)
> > 
> > I'm sorry but I *really* *really* dislike this. Having to list all other
> > compatible values in this file is a sign that something is wrong in the
> > validation infrastructure. People will forget to update it when adding
> > new bindings, and will get confused by the result. If I were a
> > maintainer for DT bindings I'd nack this.
> 
> The validation infrastructure is what it is, and we can't change that.
> Rewriting one from scratch isn't reasonable either. That being said, the
> *only* case where this has been a problem are the panels because there's
> so many pointless schemas which should really be a single schema.
> 
> That's the root cause.
> 
> I tried to merge all of them, but once again panels seem to be special,
> and it was shot down. So be it. But at the end of the day, there's not a
> lot of solutions to do what we are doing for every other case out there.
> 
> > If a DT has panel-lvds and no other compatible string, or invalid ones,
> > won't the validation report that the compatible isn't understood ? I
> > think that would be enough.
> 
> That's just worse. How would you not get confused if there's an error
> that the compatible isn't documented, you search for it, and it's
> actually documented there?

Is that any different than a binding that would have

properties:
  compatible:
    items:
      enum:
        - foo,bar
        - foo,baz
      const: foo,base

and a device tree that would set compatible = "foo,base"; ? This type of
binding is very common, and I haven't heard anyone complaining that the
resulting validation error is an issue.

> We really have two solutions:
> 
>   - Either we merge all the panel-lvds schemas in one,
> 
>   - Or we have this.
> 
> The first was shot down, only the latter remains.

-- 
Regards,

Laurent Pinchart
