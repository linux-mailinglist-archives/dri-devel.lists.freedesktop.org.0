Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9951B4A71BE
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 14:43:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7416B10E5CC;
	Wed,  2 Feb 2022 13:43:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0515410E5CC
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 13:43:17 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id CEB3D32021E5;
 Wed,  2 Feb 2022 08:43:15 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 02 Feb 2022 08:43:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; bh=JNaoPoCAcxDIWc
 ZTGh76E8g+5TOW3FWSBhQ5paH56zs=; b=fdGiB+tulxP9dQL3MqSLSJn7clY3eK
 WlmNdYwGkpL0+s+kSndVfe5Y5oqe77SR3ZfqUFg2mZlL7loDPJ90mJ4abzMkpUkj
 x3pjsIILluus0F9jvYDpgfNnWPmGd1B847O9KRbESjk4qcL3ktzhF8hCtq5uSCMY
 ajnvrelbyUKkm+mKpDxwqyC7sC7aHciO6Q9KYvSdlOIt74RmJTASZ5gY7T1qhcaX
 EZQgFND1z3eBrQLBczzsrs32iwa5Iwe7u95LBdWoPzIkgVO/xGhFJ0oYrBU9alfN
 9TRHo4oK6kjJTluDW2NHu5FYyTNXmhiEHChQ8sx3wwH39lCCa09xLDxg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=JNaoPoCAcxDIWcZTGh76E8g+5TOW3FWSBhQ5paH56
 zs=; b=AhKd6/2uJ4n5/UZJ5d8tQsVjUXbpFvAvCC/W8YRxs2p2jXlUk5mVCxZ3m
 RQOxRdGrjbMBqlfbtJPWxjF2nTrYjwl4Q8JFh7Q/FcTniOuiDRZhJ82yaN16T+d+
 So0Xo+J2Y4n6BWvUP/6zs5L+tyYa0W0lULQkAEKi9JYOR2GHdM9Yos1r3LClETvG
 wAUe5xWt4arb872ok3w9H1dK/WmEFLL8tKsoORbrcwo45xjo6VzfrcE8s+vTAHk+
 EeMgazMDLbN4MYNbVXm4xXe4FcbopbhmHSxlsZAJQJPLzbk4jAq8ey8Bbsd/PnA0
 K9knVIbXrHkQwriVe7kfxXSmYkKQA==
X-ME-Sender: <xms:cor6YeomZxjWXzOQiNiz5R4nwjfojpm3ZNOOfwihFpmK3mTmFo6aTA>
 <xme:cor6YcrpjyQoJNzCYlQXNHcQzqAMrO5JshbM6fpoFpVpdNzfNeoOY25YpRrOGyTb0
 0nS02gWpvMB1Hr0mho>
X-ME-Received: <xmr:cor6YTNf6obSlrIt79pdiUuk4aOpVHSVJU_NOeiNqyXiKLN8aHzKa2m2O2C0ZIqgeJQEm83rPx0h386VUKLqPW12D0EX6udD5ZFoaM4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrgeehgdehhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggugfgjsehtqhertddttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepgfegvdelgfeuveevueekvedtjefguddvveffhedukeejjeejgfejfedtvdei
 tdegnecuffhomhgrihhnpeguvghvihgtvghtrhgvvgdrohhrghenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdr
 thgvtghh
X-ME-Proxy: <xmx:cor6Yd7GOUWX5teSOXp3VKxkOnuDnW8uYUyGmBmC_seXQpEzPCRXfQ>
 <xmx:cor6Yd7kMHc88ohi_6-4y048tzh9-rAIn3SVsDeB2fUBYGiXrpOLeQ>
 <xmx:cor6YdiC_67DA0gztINp2Dcjj7FnliKvn4XbZG6q-vhPdufD_MdEoQ>
 <xmx:c4r6YXt6C5EUfl9DYY1HShLxHAMMwelUuTYTh8_CnKZK_UNF7FuE9g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Feb 2022 08:43:14 -0500 (EST)
Date: Wed, 2 Feb 2022 14:43:12 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3 2/2] dt-bindings: panel: Introduce a panel-lvds binding
Message-ID: <20220202134312.fmz2tkyqd3bzc67f@houat>
References: <20220111110635.804371-1-maxime@cerno.tech>
 <20220111110635.804371-2-maxime@cerno.tech>
 <Yd2Ahn3+FVv/Aks7@pendragon.ideasonboard.com>
 <20220127142215.fesipdslabur43sx@houat>
 <20220202094845.r7td65zxfo5uqg5x@houat>
 <Yfp9UhwWZbHpDjpL@pendragon.ideasonboard.com>
 <20220202131623.3vfbtuyeemzcxe4k@houat>
 <YfqFQRaeRwAlyyHV@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <YfqFQRaeRwAlyyHV@pendragon.ideasonboard.com>
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

On Wed, Feb 02, 2022 at 03:21:05PM +0200, Laurent Pinchart wrote:
> On Wed, Feb 02, 2022 at 02:16:23PM +0100, Maxime Ripard wrote:
> > On Wed, Feb 02, 2022 at 02:47:14PM +0200, Laurent Pinchart wrote:
> > > On Wed, Feb 02, 2022 at 10:48:45AM +0100, Maxime Ripard wrote:
> > > > On Thu, Jan 27, 2022 at 03:22:15PM +0100, Maxime Ripard wrote:
> > > > > On Tue, Jan 11, 2022 at 03:05:10PM +0200, Laurent Pinchart wrote:
> > > > > > On Tue, Jan 11, 2022 at 12:06:35PM +0100, Maxime Ripard wrote:
> > > > > > > Following the previous patch, let's introduce a generic panel=
-lvds
> > > > > > > binding that documents the panels that don't have any particu=
lar
> > > > > > > constraint documented.
> > > > > > >=20
> > > > > > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > > > > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > > > > > >=20
> > > > > > > ---
> > > > > > >=20
> > > > > > > Changes from v2:
> > > > > > >   - Added a MAINTAINERS entry
> > > > > > >=20
> > > > > > > Changes from v1:
> > > > > > >   - Added missing compatible
> > > > > > >   - Fixed lint
> > > > > > > ---
> > > > > > >  .../bindings/display/panel/panel-lvds.yaml    | 57 +++++++++=
++++++++++
> > > > > > >  MAINTAINERS                                   |  1 +
> > > > > > >  2 files changed, 58 insertions(+)
> > > > > > >  create mode 100644 Documentation/devicetree/bindings/display=
/panel/panel-lvds.yaml
> > > > > > >=20
> > > > > > > diff --git a/Documentation/devicetree/bindings/display/panel/=
panel-lvds.yaml b/Documentation/devicetree/bindings/display/panel/panel-lvd=
s.yaml
> > > > > > > new file mode 100644
> > > > > > > index 000000000000..fcc50db6a812
> > > > > > > --- /dev/null
> > > > > > > +++ b/Documentation/devicetree/bindings/display/panel/panel-l=
vds.yaml
> > > > > > > @@ -0,0 +1,57 @@
> > > > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > > > +%YAML 1.2
> > > > > > > +---
> > > > > > > +$id: http://devicetree.org/schemas/display/panel/panel-lvds.=
yaml#
> > > > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > > > +
> > > > > > > +title: Generic LVDS Display Panel Device Tree Bindings
> > > > > > > +
> > > > > > > +maintainers:
> > > > > > > +  - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > > > +  - Thierry Reding <thierry.reding@gmail.com>
> > > > > > > +
> > > > > > > +allOf:
> > > > > > > +  - $ref: panel-common.yaml#
> > > > > > > +  - $ref: /schemas/display/lvds.yaml/#
> > > > > > > +
> > > > > > > +select:
> > > > > > > +  properties:
> > > > > > > +    compatible:
> > > > > > > +      contains:
> > > > > > > +        const: panel-lvds
> > > > > > > +
> > > > > > > +  not:
> > > > > > > +    properties:
> > > > > > > +      compatible:
> > > > > > > +        contains:
> > > > > > > +          enum:
> > > > > > > +            - advantech,idk-1110wr
> > > > > > > +            - advantech,idk-2121wr
> > > > > > > +            - innolux,ee101ia-01d
> > > > > > > +            - mitsubishi,aa104xd12
> > > > > > > +            - mitsubishi,aa121td01
> > > > > > > +            - sgd,gktw70sdae4se
> > > > > >=20
> > > > > > I still don't like this :-( Couldn't we instead do
> > > > > >=20
> > > > > > select:
> > > > > >   properties:
> > > > > >     compatible:
> > > > > >       contains:
> > > > > >         enum:
> > > > > >           - auo,b101ew05
> > > > > >           - tbs,a711-panel
> > > > > >=20
> > > > > > ?
> > > > >=20
> > > > > That works too, I'll send another version.
> > > >=20
> > > > Actually, no, it doesn't work.
> > > >=20
> > > > If we do this, if we were to have a panel that has panel-lvds but n=
one
> > > > of the other compatible (because of a typo, or downright invalid
> > > > binding) we won't validate it and report any error.
> > > >=20
> > > > I'll merge this version (together with the v4 version of patch 1)
> > >=20
> > > I'm sorry but I *really* *really* dislike this. Having to list all ot=
her
> > > compatible values in this file is a sign that something is wrong in t=
he
> > > validation infrastructure. People will forget to update it when adding
> > > new bindings, and will get confused by the result. If I were a
> > > maintainer for DT bindings I'd nack this.
> >=20
> > The validation infrastructure is what it is, and we can't change that.
> > Rewriting one from scratch isn't reasonable either. That being said, the
> > *only* case where this has been a problem are the panels because there's
> > so many pointless schemas which should really be a single schema.
> >=20
> > That's the root cause.
> >=20
> > I tried to merge all of them, but once again panels seem to be special,
> > and it was shot down. So be it. But at the end of the day, there's not a
> > lot of solutions to do what we are doing for every other case out there.
> >=20
> > > If a DT has panel-lvds and no other compatible string, or invalid one=
s,
> > > won't the validation report that the compatible isn't understood ? I
> > > think that would be enough.
> >=20
> > That's just worse. How would you not get confused if there's an error
> > that the compatible isn't documented, you search for it, and it's
> > actually documented there?
>=20
> Is that any different than a binding that would have
>=20
> properties:
>   compatible:
>     items:
>       enum:
>         - foo,bar
>         - foo,baz
>       const: foo,base
>=20
> and a device tree that would set compatible =3D "foo,base"; ? This type of
> binding is very common, and I haven't heard anyone complaining that the
> resulting validation error is an issue.

That works indeed, but it's not what panel-lvds is doing. For some
reason, instead of that enum, we need multiple schemas, one for each
combination. And this is why we need that select clause, to work around
that decision.

Maxime
