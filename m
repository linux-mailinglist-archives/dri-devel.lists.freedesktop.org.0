Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF333F4E65
	for <lists+dri-devel@lfdr.de>; Mon, 23 Aug 2021 18:31:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 712508961E;
	Mon, 23 Aug 2021 16:31:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA8DF89548
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Aug 2021 16:31:22 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 41F1658039B;
 Mon, 23 Aug 2021 12:31:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 23 Aug 2021 12:31:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=T0T2IQIdQxYTEIzrXLU/J/hA1hB
 QCXbH3bEfulkB1MM=; b=O1OvYF3DwxwKsvgI3LFqEfPZoyYhk/UUm1GcsPNvoE0
 Y5wQTlW+BbfwnRjlpGXVoaUcstFKDdhlsB6PWomJn5gDI2XBl1W+cl7LCxg7hZLt
 N6e7KkqRnG+W7AzgwZ0+56lWBGZcEseMNlqOif7ZuQ/DWE7jUC6o9MW6DpySidUJ
 J0sZbxSklW5+l3bk7GaP2zuJU0jRBla+z+NZZb87Q5hur/A49BdUred2e3uT/ai4
 VxW8QfZB74G64G30wQTa9fS+SawV0iXCBUfhn9LvVkEgQ02vLs7wFEETlpba0Jo5
 aHDQuH9WG73aKtKdE/gEB2DY56oWjMGLypvW/lxEGyw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=T0T2IQ
 IdQxYTEIzrXLU/J/hA1hBQCXbH3bEfulkB1MM=; b=f9OksScv9+UuVenQdj20su
 FH3n3SWzXatLhC92VcRl5ZFpQdiT3ZymtJMrVKbig8PJJXc5klNhP/r70P8Iwwvn
 3Hxl4RwHFr0+17IYzSFDVgZT8nUIAfA+/m2+XYzQzdAbebJtkeV0tIoBn891AiwK
 qAEjusouyIWNapPt8sZ2cJiZXuctru/cn+D7HFiZki8tqlkW2geQGNuc9OIxFni4
 oBhyfiqUfShinpcg7rreKmgauRCsbu/J87PcEUjD7xNL0mZvvxyqnNCAWilRT7rI
 1dxfxKqW2HEN/sFZyuCEbNdC1ZXX3qv5HVRb3k1XMCAJtdxWVv2zErwlrSov6pYw
 ==
X-ME-Sender: <xms:Vc0jYZNiA8sIsk0g1MbXHuqX69JR2cUB7vuZ3I8u1kTreV7qKk02OA>
 <xme:Vc0jYb8mexwVk4Dl8rdhhhyHCl9gk8BxoATUr3ZNaZMDuTd_PRdMlEbvSy2esDOR-
 6A9FsL2EslKN0IkyXI>
X-ME-Received: <xmr:Vc0jYYRxsxYvwkhItf5eo09HwLoiAqQgiMowhA1mDhEcBDfO9KjAJkF6xl0IhodXu0llNYxXt4T0srOSii5nBzZJNc1pMlMopS7v>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddthedguddtvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheei
 heegudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Vc0jYVtZ90SISuDHUpXVoLUPz2NF7gKjG9J9IGZc6OQvbGDOT7ZFWQ>
 <xmx:Vc0jYReSwB0c3v0XDGt1iCHX24PrN93ztJJICIKkrw4rhNqkrWM2iA>
 <xmx:Vc0jYR16Wc5_6uTsPIrzzGIGuxL4Vmdw6b6s1vDPs2o9k3vNpEGDAA>
 <xmx:WM0jYd6G0StUl4iTH8_FvwRsudQUPigZcjgzW8sR2ZqveNOntqe5Kg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 23 Aug 2021 12:31:16 -0400 (EDT)
Date: Mon, 23 Aug 2021 18:31:14 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Rob Herring <robh@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 devicetree@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-sunxi@googlegroups.com, dri-devel <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 10/54] dt-bindings: display: panel-lvds: Document panel
 compatibles
Message-ID: <20210823163114.ohmdpc7pn22p5ycd@gilmour>
References: <20210721140424.725744-1-maxime@cerno.tech>
 <20210721140424.725744-11-maxime@cerno.tech>
 <20210722022947.GA3168293@robh.at.kernel.org>
 <20210818124304.2jxsf44bcbprcvbk@gilmour>
 <CAL_JsqJjnGhXpfvPWU0HM8YHk5PyDup7ors3ewa17vc0bnVCmQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="gc4zibryza3dkjdm"
Content-Disposition: inline
In-Reply-To: <CAL_JsqJjnGhXpfvPWU0HM8YHk5PyDup7ors3ewa17vc0bnVCmQ@mail.gmail.com>
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


--gc4zibryza3dkjdm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Aug 18, 2021 at 08:48:46AM -0500, Rob Herring wrote:
> On Wed, Aug 18, 2021 at 7:43 AM Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > Hi Rob, Sam,
> >
> > On Wed, Jul 21, 2021 at 08:29:47PM -0600, Rob Herring wrote:
> > > On Wed, Jul 21, 2021 at 04:03:40PM +0200, Maxime Ripard wrote:
> > > > The binding mentions that all the drivers using that driver must us=
e a
> > > > vendor-specific compatible but never enforces it, nor documents the
> > > > vendor-specific compatibles.
> > > >
> > > > Let's make we document all of them, and that the binding will creat=
e an
> > > > error if we add one that isn't.
> > > >
> > > > Cc: dri-devel@lists.freedesktop.org
> > > > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > Cc: Sam Ravnborg <sam@ravnborg.org>
> > > > Cc: Thierry Reding <thierry.reding@gmail.com>
> > > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > > > ---
> > > >  .../bindings/display/panel/lvds.yaml           | 18 ++++++++++++--=
----
> > > >  1 file changed, 12 insertions(+), 6 deletions(-)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/display/panel/lvds.y=
aml b/Documentation/devicetree/bindings/display/panel/lvds.yaml
> > > > index 49460c9dceea..d1513111eb48 100644
> > > > --- a/Documentation/devicetree/bindings/display/panel/lvds.yaml
> > > > +++ b/Documentation/devicetree/bindings/display/panel/lvds.yaml
> > > > @@ -31,12 +31,18 @@ allOf:
> > > >
> > > >  properties:
> > > >    compatible:
> > > > -    contains:
> > > > -      const: panel-lvds
> > > > -    description:
> > > > -      Shall contain "panel-lvds" in addition to a mandatory panel-=
specific
> > > > -      compatible string defined in individual panel bindings. The =
"panel-lvds"
> > > > -      value shall never be used on its own.
> > > > +    items:
> > > > +      - enum:
> > > > +          - advantech,idk-1110wr
> > >
> > > At least this one is documented elsewhere.
> >
> > Indeed, I missed it.
> >
> > > You can add 'minItems: 2' if you want to just enforce having 2 compat=
ibles. Or do:
> > >
> > > items:
> > >   - {}
> > >   - const: panel-lvds
> > >
> > > Which also enforces the order.
> >
> > It's not just about the order since a missing compatible will also raise
> > a warning.
> >
> > Some of those panels have a binding of their own, but some probably
> > won't (and I can't find anything specific about the one I'm most
> > interested in: tbs,a711-panel)
> >
> > Can we have something like:
> >
> > compatible:
> >   oneOf:
> >     - items:
> >       - enum:
> >         - tbs,a711-panel
> >       - const: panel-lvds
> >
> >     - items:
> >       - {}
> >       - const: panel-lvds
> >
> > That would work for both cases I guess?
>=20
> No, both conditions will be true. If you use 'anyOf', then we're never
> really checking the specific compatible.
>=20
> I think the problem here is trying to mix a common binding (aka an
> incomplete collection of properties) and a specific binding.

I'm not entirely sure why we have specific bindings for this in the
first place.

We currently have 6 specific bindings, and for 5 of them the only
specific thing in there are the data-mapping value to force and their
dimension.

I'd argue that the dimension shouldn't even be set in stone: you could
very well imagine a screen with exactly the same timings but a different
size. We would consider it compatible.

And the data-mapping can be dealt with with an if clause fairly easily.

And for the last one, the specific thing about it is that it's using a
dual-link output, which is a generic binding and could thus be described
in panel-lvds too.

Maxime

--gc4zibryza3dkjdm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYSPNUgAKCRDj7w1vZxhR
xTI2AP9NomBLo9Y5OqIN8rhni9FhgNloWJ7wVZ4JXn72s2OPEgEAweFc/UriqVXv
5geR/VICigGlB1UIS1Q8Oo/reVrKCgg=
=xQy8
-----END PGP SIGNATURE-----

--gc4zibryza3dkjdm--
