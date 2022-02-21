Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B06064BDAD3
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 17:30:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CE1710E355;
	Mon, 21 Feb 2022 16:30:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96C8510E355
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 16:30:04 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id C1CB75C0292;
 Mon, 21 Feb 2022 11:30:03 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 21 Feb 2022 11:30:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=VQ18XQVk9IzSPBm0N4aNJnOzzx5QuoDKxo0tjL
 ZAUV8=; b=AEdWm2c/V7Nbl9Nv50YTvfCXj+7FTGZXcYdVTgXYzTztcDr44d2SU1
 jniDjIzf/PE6tZ+W9gaaN9EXBZEUcUcV4VkmcPpmpsPrugOwvkhNrbTzkeM78p9o
 zpWtYPI9UkN39/JMEW07BPuQQW8wzi59Wg5WXd0o6Qw0jTlCg5YHOKGS4quM/sno
 1N9zi8IxjeUGaUgW2q34kmRa9tPbrTFQAB8d0n0eXxWwHPghCQL1QHzZ7cnD1EK/
 0QiXSCvWn0QRXvlD+HplZAw8cGbQP/eJpH/WnTr5KS76l8hGAr1mydooiN2lBrUo
 J9Hdgk1UsKGV3Str9E6+9m7pBSK+oFpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=VQ18XQVk9IzSPBm0N
 4aNJnOzzx5QuoDKxo0tjLZAUV8=; b=HyYHRsX/GaGTbf0CmhgPTcenqAZQ/HghH
 2qdboX8Xn1A5UP1QeKZNWTISMTpu49jOE4Zn4DTQUAOrtwJMinZ629jPbUgmSN+t
 TJ192Hppm/CMmhw9QHjoKQ5k/31mx1thojv4JLDRMPH+l12YvJgObB394JNfjipn
 pNC1Uf+TYo4hTLk+CMeotcorjcl/9V6qmVrVSFBCd9ONVVYsw6/9iPSl/lMcc/vc
 BDU67+7CPIQf74hCojRPIjlVvDm2Rni8nxxtntxAlNRz0862d9SktnM8n+WOGXTh
 hPO3OTB7U3LCZimP2+6gKRU+uP9jLXkXFzrpceW0tkdXhcEqnqDMw==
X-ME-Sender: <xms:C74TYmDdcoNatGfuPO5_fZCFkGy82hqhULEMlDJ7d1MlsgxvsxqUIw>
 <xme:C74TYgieQsfbwCIA8Yc3awX5g2UHuB1gEM4bV8UYxc_WzAc10rsTKaCNIpfTMW12A
 SXIPhP2a-0np9hOSm8>
X-ME-Received: <xmr:C74TYpnRGEjXjA-GWk2hEe8Psa5aAp35hwCy2AbTwgTYFyTDkItvEVqBdT1R2yCnSuc6lLQD3VLWbDm5APKFyyuKCczbck0KLNsQij8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrkeeigdekjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:C74TYkwg0Cp-4CCJ9IWqrwPXpPguALASQMZfSRs8nA_iYVKedq4IaA>
 <xmx:C74TYrTM9SGQG0V8Tf8DAPOm81jPfdqQi-rRYdxismFVFvgaBHVoyQ>
 <xmx:C74TYvZ8aJoKzJQsoDGAZZLvG9RhUh6UChykvDzUNH1KHu0U1Ib24w>
 <xmx:C74TYqFa0kB0rZzAUmkrUiA7FaTxypxOqSO-m4_M-FKjEcPn0QHUHQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Feb 2022 11:30:03 -0500 (EST)
Date: Mon, 21 Feb 2022 17:30:01 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v4 03/10] clk: Use clamp instead of open-coding our own
Message-ID: <20220221163001.k4nstaxtbmlxgz3j@houat>
References: <20220125141549.747889-1-maxime@cerno.tech>
 <20220125141549.747889-4-maxime@cerno.tech>
 <20220218223422.4FA9DC340E9@smtp.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3ae4nvu5w3r53lvo"
Content-Disposition: inline
In-Reply-To: <20220218223422.4FA9DC340E9@smtp.kernel.org>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Mike Turquette <mturquette@baylibre.com>, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--3ae4nvu5w3r53lvo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 18, 2022 at 02:34:20PM -0800, Stephen Boyd wrote:
> Quoting Maxime Ripard (2022-01-25 06:15:42)
> > The code in clk_set_rate_range() will, if the current rate is outside of
> > the new range, will force it to the minimum or maximum. This is
> > equivalent to using clamp, while being less readable. Let's switch to
> > using clamp instead.
> >=20
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
> >  drivers/clk/clk.c | 6 +-----
> >  1 file changed, 1 insertion(+), 5 deletions(-)
> >=20
> > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > index 7bb5ae0fb688..150d1bc0985b 100644
> > --- a/drivers/clk/clk.c
> > +++ b/drivers/clk/clk.c
> > @@ -2365,11 +2365,7 @@ int clk_set_rate_range(struct clk *clk, unsigned=
 long min, unsigned long max)
> >                  *   this corner case when determining the rate
> >                  */
> > =20
> > -               if (rate < min)
> > -                       rate =3D min;
> > -               else
> > -                       rate =3D max;
> > -
> > +               rate =3D clamp(clk->core->req_rate, min, max);
>=20
> This isn't equivalent. The else arm is taken if rate >=3D min and rate is
> set to max, whereas clamp() will leave the rate unchanged if rate >=3D min
> && rate < max.

This can't happen, since we're in an if block that is (rate < min ||
rate > max), so at this point if rate is not less than min, it is
greater than rate. Thus, it's equivalent to clamp.

Still, the commit message could be better, I'll rephrase it.

Maxime

--3ae4nvu5w3r53lvo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYhO+CQAKCRDj7w1vZxhR
xW+JAQD1e5RhceCFxBdY13Gbfb6flQZaIfHnmgTrCSy6p9A4yAEAsnx7qb/QlSfF
E+eHriTwCohlx5TB/dT4Zkq8kPHgkw0=
=jdRz
-----END PGP SIGNATURE-----

--3ae4nvu5w3r53lvo--
