Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A92CC4C419C
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 10:39:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39CC010E7AF;
	Fri, 25 Feb 2022 09:39:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A066710E7AF
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 09:39:05 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 09F2B5C01C8;
 Fri, 25 Feb 2022 04:39:05 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 25 Feb 2022 04:39:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=i4n+zE7pRzESH5umc37OtG7AGBNOlIKcR5HhtO
 XLXV8=; b=hzTQImi7ZbN1LHunxy71ovtcqvaDNwquBC/iDQx9Tx/uSGSW7FuU2d
 JBYK0bMM3Vcib/AaxFcKD8sLDPGFqISEAB6kPXPtFdOGXa+LKgCAZKzSOV7s8JFe
 /NKBPXtv2d6hrsqMpB52rV+lgb9Y1sB/bs31Gh0n7NaD0Wy1JTkKatth2hycKjmZ
 GhlCefBJc5ZCJfzKS7iD5eeq5EunWxGVadlhDlTxCdxI5rGdbW4NJNBFY3HdoqGI
 BI7aWf30ieYLeFd8QDzF7dBB3pjJCxQXq1bjyfa2nHkIjxcXdF1w2TovkZe6QG1Q
 FbnplkrVriZjXvtNA8sM3jY/KhmU2KDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=i4n+zE7pRzESH5umc
 37OtG7AGBNOlIKcR5HhtOXLXV8=; b=AiiQShjH0/aI8zs+M7XrPDOkeIjLsG82j
 N0vjc2Rica16YBHFbM3bIbwB/Jl9pOJ1uNSZuBfWsQTlwEyg6ObaultoO6Sy6OTR
 7ABOHtnUDFpiI27LWTVOmrDHXx0PymiQwO5irrqc1earrSp3b6i21Ra02YCagIRV
 fkcMS5mJRJQPxUeTZc8U1Rvoxnr5qV9w2xSl0KqEn+oRJO1iFBEm4J4NZBmUeICr
 f66Jq4eLpGLGbk6anNWn+8uWUviUSzRIpKq2BRgvidqQVBbK31dkXvvOuj4FpZnT
 gsyEBtvQ/r32MzKb+zD+rcIEloMhJeRT1U2HXtBQTV2QxlXePrUPA==
X-ME-Sender: <xms:uKMYYpxHhW08SrNJb6kB_NR3uzGvEh4YDqLkft0RDhAR7GoM7h2ckQ>
 <xme:uKMYYpTB2_NBfCmqFCxmWd-CIqnEpKHb-f6-fYgqpM5VIDHF2bjvJ5V7wh6EtSI9_
 BdC3BXrFLTRmW3v_dY>
X-ME-Received: <xmr:uKMYYjW8TAgDyNdPnvwvxP67xox4SxR4lnPpo9gxPf1Fi5qgoGWTMyDPKlzCtXkueqtvninONjYUm73p-fqZ25bYDQ1SOY2wGlOhLZA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrleeggddtjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:uKMYYrgsgzUtRCcCtMkytL6vqpZxAQiVpjVpETtEyVg-0RNP-HnoqA>
 <xmx:uKMYYrAe66i6cEZ4G9e5Cin6y-0Nw_KUleOMAnpvwWXH_pp9zQ2W3Q>
 <xmx:uKMYYkLN1JQmpou5oPsvQo_yh9uv6NJbYTGZ1i9YbGYoj5b46Svdng>
 <xmx:uaMYYt3Lg3fZqt1U6TSO3oZ1ju8oTwbuuHtp_IiGIQ0rHSFyyNLkcQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Feb 2022 04:39:04 -0500 (EST)
Date: Fri, 25 Feb 2022 10:39:02 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v4 03/10] clk: Use clamp instead of open-coding our own
Message-ID: <20220225093902.ucmqt5ayusz75djz@houat>
References: <20220125141549.747889-1-maxime@cerno.tech>
 <20220125141549.747889-4-maxime@cerno.tech>
 <20220218223422.4FA9DC340E9@smtp.kernel.org>
 <20220221163001.k4nstaxtbmlxgz3j@houat>
 <20220224224422.DA9F5C340E9@smtp.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="6ohmxjilufbxrvoa"
Content-Disposition: inline
In-Reply-To: <20220224224422.DA9F5C340E9@smtp.kernel.org>
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


--6ohmxjilufbxrvoa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 24, 2022 at 02:44:20PM -0800, Stephen Boyd wrote:
> Quoting Maxime Ripard (2022-02-21 08:30:01)
> > On Fri, Feb 18, 2022 at 02:34:20PM -0800, Stephen Boyd wrote:
> > > Quoting Maxime Ripard (2022-01-25 06:15:42)
> > > > The code in clk_set_rate_range() will, if the current rate is outsi=
de of
> > > > the new range, will force it to the minimum or maximum. This is
> > > > equivalent to using clamp, while being less readable. Let's switch =
to
> > > > using clamp instead.
> > > >=20
> > > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > > > ---
> > > >  drivers/clk/clk.c | 6 +-----
> > > >  1 file changed, 1 insertion(+), 5 deletions(-)
> > > >=20
> > > > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > > > index 7bb5ae0fb688..150d1bc0985b 100644
> > > > --- a/drivers/clk/clk.c
> > > > +++ b/drivers/clk/clk.c
> > > > @@ -2365,11 +2365,7 @@ int clk_set_rate_range(struct clk *clk, unsi=
gned long min, unsigned long max)
> > > >                  *   this corner case when determining the rate
> > > >                  */
> > > > =20
> > > > -               if (rate < min)
> > > > -                       rate =3D min;
> > > > -               else
> > > > -                       rate =3D max;
> > > > -
> > > > +               rate =3D clamp(clk->core->req_rate, min, max);
> > >=20
> > > This isn't equivalent. The else arm is taken if rate >=3D min and rat=
e is
> > > set to max, whereas clamp() will leave the rate unchanged if rate >=
=3D min
> > > && rate < max.
> >=20
> > This can't happen, since we're in an if block that is (rate < min ||
> > rate > max), so at this point if rate is not less than min, it is
> > greater than rate. Thus, it's equivalent to clamp.
> >=20
> > Still, the commit message could be better, I'll rephrase it.
>=20
> Perfect! Should probably add a comment above the clamp as well just in
> case someone decides to move it out of that if block.

The last version has a better commit message. We're actually moving that
out of the if in the next patch.

I'm not sure we really need a comment for this though:

The existing code does:

if (rate < min || rate > max)
    if (rate < min)
        rate =3D min;
    else
        rate =3D max;

So if the rate is below min, it's set to min, if it's between min and
max, it's unaffected, and if it's above max, it's set to max.

With this patch, the code does:

if (rate < min || rate > max)
    rate =3D clamp(rate, min, max)

So if the rate is below min, it's set to min, if it's between min and
max, it's unaffected, and if it's above max, it's set to max. It's
equivalent.

After the next patch, the code will do:
rate =3D clamp(rate, min, max)

So if the rate is below min, it's set to min, if it's between min and
max, it's unaffected, and if it's above max, it's set to max. They are
all equivalent.

Maxime

--6ohmxjilufbxrvoa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYhijtgAKCRDj7w1vZxhR
xW14AQDB/clyt++c40pPzPMna17gid+8qy/hwNed59lgCmIRewEAvDi8I71HhApl
EhKiYfSqLvSQr+x8+FHGmtUcRKXNUA4=
=NQCQ
-----END PGP SIGNATURE-----

--6ohmxjilufbxrvoa--
