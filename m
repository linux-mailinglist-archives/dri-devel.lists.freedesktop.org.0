Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B9E53E3E4
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 11:22:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01CB210E5D2;
	Mon,  6 Jun 2022 09:22:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4927C10E348
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jun 2022 09:22:30 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 93D2132002FB;
 Mon,  6 Jun 2022 05:22:28 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 06 Jun 2022 05:22:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1654507348; x=1654593748; bh=Xw4lnTY/et
 JsJAGDFGc3jcxrakgTZHGFztPy9C0RzDM=; b=qxiiLfWULeAPQo8wYKlgqESjFG
 6TGaZfecQYvAdffjoLWu9YG0TrJovLyO7ylqUihe6F61QahAqc0BAVqRy4Ucxxy4
 DrxmKAJLMzMOgbfXVoP+AHuvh6QztQtYmBw4ibyH0LST0wlJmazaMMxuzMvSoMta
 s3YBZb5JA644H4gnTon7TvG0pEfMZV9xrjpkm9Fh5FlMYGpn3gpkemo5Yyq+KG2a
 LlhxrUovfCmLEph0pA7McLE9e/u+JYiDvoyXB723FRFYjBvXw6hEHQpzrDaGkgeo
 kittXLPBx1KAA5i5K9YN2Y0eVrcEGROCfDa21n8f+jMnK1plVMDohSYuZlDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1654507348; x=1654593748; bh=Xw4lnTY/etJsJAGDFGc3jcxrakgT
 ZHGFztPy9C0RzDM=; b=PEwqST23OMlAUNHFqMxHnAJfKU40BvEfscyGrQViseSX
 px/VVlVaH+85i1wn8bN9DA7pxQX5/Rxm5Zmo/ntfQmPFTukTpi+NRnAX23o72TF7
 V5KBmBp5lnVpSAoYMAIQP4CCa0XL9IhN2Sg5yPHxMzUheZ50BpYNaZwKXLw3TRaY
 TatwtKg9n/tMw8K4WTrtjSx4mQPhRPBSpekrPd+o9PdJ31SSjUsTWQQAn34Wq4Fg
 3ph9Q0957ns9Xr+D4pChkbEj8qG/pzqR8cC4c4tuZpOy9lGyxyjLnLIQKjlfA86L
 xz32lzWRe/283rcsK4w7GAZCkCsNYQ1UvgN0yUkovA==
X-ME-Sender: <xms:U8edYg2cRD82UHQxi1oxy42mFBVxzggZweD4Nwu3WAAIGVxZDDk4dQ>
 <xme:U8edYrE7XP7dBoaKUXxX-NGMjWuj3IvRvSuBjLHp7VkS6IB6S_Jx1TqjU0a0A6t8x
 PfYVE0mSmsk6TPrQCk>
X-ME-Received: <xmr:U8edYo7IcqcQ_YmKavdRNLFx3FiGjQf09ogJ_6Q8UX9yCopdZPW4avJhuyJQuJy7Bcjqz-_p53wK5pjg2dshDTVfA7tk8pRTitZScAE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddtvddgudegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeejgeeiveevvdfgffeftdevuefhheduveejieefgeejveeuhfetkeelgfev
 teefffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:U8edYp1k2rdN6LO_i3E36JF8vVN-xX-clV_1IrYu677gipX0WUG4dA>
 <xmx:U8edYjGpYaHBOxOiONoCqdCg9oObmTyUyKXtkVsge35Si535KTsYBA>
 <xmx:U8edYi-sqWw1vD9L4j8_KtpIJF59CU6yj1bz7VspQPAy4co9HE1VKA>
 <xmx:VMedYr_puFd5iP3itjaz9la2pq6V6Vbt4L3B8XB-XInrG1Gjccl17g>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 Jun 2022 05:22:26 -0400 (EDT)
Date: Mon, 6 Jun 2022 11:22:25 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Roman Stratiienko <r.stratiienko@gmail.com>
Subject: Re: [PATCH] drm/sun4i: sun8i: Add support for pixel blend mode
 property
Message-ID: <20220606092225.yxyw77mtuqpbmd35@houat>
References: <20220605154731.17362-1-roman.o.stratiienko@globallogic.com>
 <4714286.GXAFRqVoOG@jernej-laptop>
 <CAGphcdniPFdqgLcpUc88ak9GzNaCvmj_TDVYTOe2bXto-Y12FQ@mail.gmail.com>
 <20220606092006.4bgxibmayv44juox@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ycmmdvpgrnhgi2cu"
Content-Disposition: inline
In-Reply-To: <20220606092006.4bgxibmayv44juox@houat>
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
Cc: Samuel Holland <samuel@sholland.org>, airlied@linux.ie,
 Roman Stratiienko <roman.o.stratiienko@globallogic.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, wens@csie.org,
 megi@xff.cz, Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ycmmdvpgrnhgi2cu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 06, 2022 at 11:20:06AM +0200, Maxime Ripard wrote:
> On Mon, Jun 06, 2022 at 11:17:20AM +0300, Roman Stratiienko wrote:
> > Hello Jernej,
> >=20
> > Thank you for having a look.
> >=20
> > =D0=B2=D1=81, 5 =D0=B8=D1=8E=D0=BD. 2022 =D0=B3. =D0=B2 23:37, Jernej =
=C5=A0krabec <jernej.skrabec@gmail.com>:
> > >
> > > Dne nedelja, 05. junij 2022 ob 17:47:31 CEST je Roman Stratiienko nap=
isal(a):
> > > > Allwinner DE2 and DE3 hardware support 3 pixel blend modes:
> > > > "None", "Pre-multiplied", "Coverage"
> > > >
> > > > Add the blend mode property and route it to the appropriate registe=
rs.
> > > >
> > > > Note:
> > > > "force_premulti" parameter was added to handle multi-overlay channel
> > > > cases in future changes. It must be set to true for cases when more
> > > > than 1 overlay layer is used within a channel and at least one of t=
he
> > > > overlay layers within a group uses premultiplied blending mode.
> > >
> > > Please remove this parameter. It's nothing special, so it can be easi=
ly added
> > > once it's actually needed. For now, it only complicates code.
> >=20
> > I would prefer keeping it if you do not have any strong opinion against=
 it.
> >=20
> > I am working now on exposing all overlays, so it will be needed soon an=
yway.
>=20
> KMS assumes pre-multiplied alpha anyway, so we shouldn't need a
> parameter to force it: we're always going to force it.

My bad, I got confused with your other patch.

Still, I agree with Jernej, if it's not needed it only complicates the
code for no particular reason. If you need it at some point in the
future, add it then. Otherwise, it's hard to reason about, since we
don't know what are the expectations that those future patches will
bring.

Maxime

--ycmmdvpgrnhgi2cu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYp3HUQAKCRDj7w1vZxhR
xQ7JAPwOH2WywNctfCg4rbYtCxC02Owlfgb33BXYypx4Py8rtQEAp7OVVf9HelNl
uO4X3n7onqZVEW/knsWlXLnynOLuLgo=
=oSp3
-----END PGP SIGNATURE-----

--ycmmdvpgrnhgi2cu--
