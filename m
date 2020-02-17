Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEB91621C7
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2020 08:56:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF0B96E170;
	Tue, 18 Feb 2020 07:55:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 135EC89DBD
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2020 17:43:00 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 1AB224876;
 Mon, 17 Feb 2020 12:42:58 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 17 Feb 2020 12:42:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=LSh1lPCDqxLO7Bib4LTPMBWDfsX
 YnGwYBlDhYAcksF8=; b=b0JTk3fpnH2iEvcdnGSPGCzgWS4ca+cN7nDmuXFsV0S
 OWEG8L1FS5bSt1/CHbIkkdxHibHJxYdUO7LrBCLKNKlHy4it36RSWB949z4snssM
 v53A4n2KRwrX9EfFHyvAC5gcBqLJQ/B+nYuC71HgWY3dHQrr6QCbNg2RnX3kS+PP
 ONrQjLxRmBcJAeXzuQOtn8tK3rCvxi/t57k6oNBsgSTQvIiKgdfVexO8eMq5lPx+
 m3tHPtkSbxlU+WmLc2CrnF893fgsHBLCfA5CeHNNuB/HmC+oD8y0SlxLmuLSAPpW
 qpoGETK0LWPyIBPUyK0CCT4fklQqdLXrBS0ziJPX7Sg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=LSh1lP
 CDqxLO7Bib4LTPMBWDfsXYnGwYBlDhYAcksF8=; b=1i5/8d8UeLz8dClE3oGsmn
 lFQr0W0jozQM1AAid1YGPD1CEsNlvn0Qn0e469lXKMFAUbiCznsko4L4EByFfmMG
 79v3hlIoF13qUGbNSbaAN/Ii/Feiw67Esxb8tAtZB5XfEu+ODbde4dtwafketsmD
 ztJhHaOohxXo98uiFwDvjaqff1o6KOhYGRuJlcsBsVSa5kCl6kc6ieytjx3ZEofj
 SNvgh7HGN2jt/pMwx9IE0l+Ce2mAFfMfSmXvZKzi0N7sQgOaJeZAzTNolnZaz6RP
 NNJcUUSdsEG/j6BUqLYp/cK+hmnteBqlaiR6ZfAyeC5ET5rFgQlSGwXd10juoJ1w
 ==
X-ME-Sender: <xms:n9BKXuepCW-mHLb-2p1TtTR_BbrxpyeL9Wbdhz8Ibs2mTYEaeaOAsw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrjeeigddutdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltd
 drkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
 lhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:n9BKXsfW24k8ACvYT0625gyL6vS_efXRG1Ydu0NJblaqQvFzXcV1JA>
 <xmx:n9BKXqgpsIhvLY4lwotvOAfbTv0xW-AoM2yfxmJ5TTyOh5FJqfNDSQ>
 <xmx:n9BKXgS2TZ5HbQ0pIDUbkQaJGiH1rTWmuQhRyfrqQEb3V5bhSj94Tg>
 <xmx:otBKXkNji56iaFxQ7Oqv68jgbmGGBiS-InCCgRuUIpNNBwkhCyH-mw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id B8A8B328005D;
 Mon, 17 Feb 2020 12:42:54 -0500 (EST)
Date: Mon, 17 Feb 2020 18:42:53 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: sun4i-tcon: Add LVDS Dual Link
 property
Message-ID: <20200217174253.mj53us4bb7h2lyca@gilmour.lan>
References: <20200214123244.109300-1-maxime@cerno.tech>
 <20200214131025.GI4831@pendragon.ideasonboard.com>
 <20200214154405.f5zuicm6uhhiczfs@gilmour.lan>
 <20200214154953.GJ4831@pendragon.ideasonboard.com>
MIME-Version: 1.0
In-Reply-To: <20200214154953.GJ4831@pendragon.ideasonboard.com>
X-Mailman-Approved-At: Tue, 18 Feb 2020 07:55:25 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 Sean Paul <seanpaul@chromium.org>, Daniel Vetter <daniel.vetter@intel.com>,
 Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0679575681=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0679575681==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qacjjsbo4tknjumh"
Content-Disposition: inline


--qacjjsbo4tknjumh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 14, 2020 at 05:49:53PM +0200, Laurent Pinchart wrote:
> On Fri, Feb 14, 2020 at 04:44:05PM +0100, Maxime Ripard wrote:
> > On Fri, Feb 14, 2020 at 03:10:25PM +0200, Laurent Pinchart wrote:
> > > On Fri, Feb 14, 2020 at 01:32:43PM +0100, Maxime Ripard wrote:
> > > > SoCs that have multiple TCONs can use the two set of pins on the first TCON
> > > > to drive a dual-link display. Add a property to enable the dual link.
> > > >
> > > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > > > ---
> > > >  .../bindings/display/allwinner,sun4i-a10-tcon.yaml         | 7 +++++++
> > > >  1 file changed, 7 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
> > > > index 86ad617d2327..aa6dd8409dbc 100644
> > > > --- a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
> > > > +++ b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
> > > > @@ -105,6 +105,13 @@ properties:
> > > >          - const: edp
> > > >          - const: lvds
> > > >
> > > > +  allwinner,lvds-dual-link:
> > > > +    type: boolean
> > > > +    description: |
> > > > +      On a SoC with two TCON with LVDS support, the first TCON can
> > > > +      operate over both pins sets to output in a dual-link setup. This
> > > > +      will be triggered by setting this property.
> > >
> > > Could you maybe provide an example of how this property is supposed to
> > > be used ? I'm especially wondering what ports are used in that case and
> > > how they're connected.
> >
> > It's pretty trivial to support, it's only a property to set on the
> > encoder node itself.
> >
> > I'm not really sure what you meant by your question with the ports
> > though :/
>
> I assume that, in the single-link case, you have two TCON instances that
> operate independently, each of them with one port that models an LVDS
> connection to a panel.

Indeed,

> In the dual-link mode, how does that look like ? Does the TCON
> instance that operate in dual-link mode have two ports in DT ? There
> are two physical ports, so I think it makes sense to always have two
> ports in DT. That's what we're doing for the LVDS encoders on R-Car
> Gen3, in order to specify in DT which LVDS input of the dual-link
> panel is connected to which LVDS output of the SoC. That allows
> configuring the LVDS encoder to send the even and odd pixels on the
> right port.

As far as I can tell, you can't control that in our TCON. It just on
more lanes, that's it. Also, we currently have multiple ports, to map
another feature of the TCON, which is that it can drive directly a
panel, or will send its output to the HDMI / TV encoders. Adding
another port in that will break the current binding we have.

Maxime

--qacjjsbo4tknjumh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXkrQnQAKCRDj7w1vZxhR
xYyzAP9aURz+zTYWHC5IhPxfSni9jc9Q1CStAZuL2lmltDlckwD/ev90hA7s+dfA
ovuGwNHceNKd9m5Ieuk4gimi8XgkbgA=
=33cs
-----END PGP SIGNATURE-----

--qacjjsbo4tknjumh--

--===============0679575681==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0679575681==--
