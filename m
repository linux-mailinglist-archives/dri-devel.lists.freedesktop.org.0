Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 498134C4185
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 10:35:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 626B710E77C;
	Fri, 25 Feb 2022 09:35:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B2DD10E774
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 09:35:10 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 98C2F5C01A6;
 Fri, 25 Feb 2022 04:35:09 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 25 Feb 2022 04:35:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=vhjDOaUktKciKJbZAf44ISyP03nTGYieQt5n1R
 9DNl0=; b=X5m6Z4qxnM6xHpH38tA2HPRcwWzkAyA0d2S8EpgfZp9V/rGc3pp5A4
 WuGWSr46TsH5n8mfIGdIgX9o3NbYp5onZV2HDi799ATwghMsAqtrC0BFw7SxX/m2
 ZrrcKwOR8rIBboQBomW/4jbDq2Cp/yzCSFL1KPl2jeeFe4eC+jsq1DEsWUXHc0VU
 lW6cMaBByWF2k9wQJDJmCERZ68V1AvKhzqot/eveMYqFc6+tHy3EA0D+TUWQCe8G
 fgX+/v/Wctx6u0SYyqznXdM9lRjmn1+6fyZNAHifHDg83fKEyr0qQQgliZkkAGj9
 t8ex+dp+r9+LJDExpv9Qut3vXdkMtcSw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=vhjDOaUktKciKJbZA
 f44ISyP03nTGYieQt5n1R9DNl0=; b=Qju+sgm5YpwcGoPlq7HHnszMq2l+Z6NRX
 3aITkVtu/yTxlK7usziecycpj1aThvKTSdRTHdHQ34XQKJfnjIDlrHsY2Ulb77IN
 e0EH4ACQO9IEFQQj0FhDSwFGRKW+hvG4c+0qCmGU1Hjj4RKllCEaAWF0p+KJQS4h
 NYdcvKDxCxol4gO1wQ5vlBPWtd9WlXEfDG+fne5n+H+kw46LJCutVB9us00q3HLX
 ijrUSfKZmrzSBNzpSQqw77FMloNLIaikF7pgiWIiSq6IgmAeXmFIGJy+BYgRYkhM
 wvazd0q/LnFAlGYCppKfoiIbQ6Ia7zAokmpCUT8M9wtLYHcp7WIng==
X-ME-Sender: <xms:zaIYYivAvtFrgdoCYNuJgjeXPAP0QfEBQyOZNx6iO2BQ7d0i9SbGnQ>
 <xme:zaIYYneQeGiAzNoO5hIQ12WTgcPsljwUhZiZhrbful9Qqlds9aeOHWwzgcsFyKMwT
 k5hZqR76B7HxnoZLdc>
X-ME-Received: <xmr:zaIYYtzENCRB4fc9eOmn1EfPfk1uC-pwUNCEmPCoE0ljQcxB-nbR-XwhY0CNXlcsjajEIARBiYFLcxu_LLujn_LvwByTix0_cn_7Ygs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrleeggddthecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:zaIYYtPlCFsNMIhOSW60HhLAW5-Fz1MT54bkUM849K6WMRukct_fow>
 <xmx:zaIYYi8xDdZ0EqPA-5aAIKRoLzykttIPGlKaiSCv-iymlCW56urleQ>
 <xmx:zaIYYlXHCJiviqLZcVajFj4uvginqB28xT8KkTCjo484ejzANEf17Q>
 <xmx:zaIYYiyG2J1Ig-6CbPB73uOepeUW_7Rr4SlHMd_JgGvF1c4QZXfqeg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Feb 2022 04:35:08 -0500 (EST)
Date: Fri, 25 Feb 2022 10:35:06 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v4 02/10] clk: Always clamp the rounded rate
Message-ID: <20220225093506.kkn6g6kqqn67suvi@houat>
References: <20220125141549.747889-1-maxime@cerno.tech>
 <20220125141549.747889-3-maxime@cerno.tech>
 <20220218231508.7B5FCC340E9@smtp.kernel.org>
 <20220221161821.jbktbgx2t6aaxds3@houat>
 <20220221164323.6xacozlk3usiidfy@houat>
 <20220224223922.15246C340E9@smtp.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="bzfec56ydwngvrjb"
Content-Disposition: inline
In-Reply-To: <20220224223922.15246C340E9@smtp.kernel.org>
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


--bzfec56ydwngvrjb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Feb 24, 2022 at 02:39:20PM -0800, Stephen Boyd wrote:
> Quoting Maxime Ripard (2022-02-21 08:43:23)
> > Hi again,
> >=20
> > On Mon, Feb 21, 2022 at 05:18:21PM +0100, Maxime Ripard wrote:
> > > On Fri, Feb 18, 2022 at 03:15:06PM -0800, Stephen Boyd wrote:
> > > > Quoting Maxime Ripard (2022-01-25 06:15:41)
> > > > > +/*
> > > > > + * Test that if our clock has some boundaries and we try to roun=
d a rate
> > > > > + * lower than the minimum, the returned rate will be within rang=
e.
> > > > > + */
> > > > > +static void clk_range_test_set_range_round_rate_lower(struct kun=
it *test)
> > > > > +{
> > > > > +       struct clk_dummy_context *ctx =3D test->priv;
> > > > > +       struct clk_hw *hw =3D &ctx->hw;
> > > > > +       struct clk *clk =3D hw->clk;
> > > > > +       long rate;
> > > > > +
> > > > > +       KUNIT_ASSERT_EQ(test,
> > > > > +                       clk_set_rate_range(clk,
> > > > > +                                          DUMMY_CLOCK_RATE_1,
> > > > > +                                          DUMMY_CLOCK_RATE_2),
> > > > > +                       0);
> > > > > +
> > > > > +       rate =3D clk_round_rate(clk, DUMMY_CLOCK_RATE_1 - 1000);
> > > > > +       KUNIT_ASSERT_GT(test, rate, 0);
> > > > > +       KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_RATE_1);
> > > >=20
> > > > The comment says within range but this test says exactly the minimum
> > > > rate. Please change it to test that the rate is within rate 1 and r=
ate
> > > > 2. Also, we should call clk_get_rate() here to make sure the rate is
> > > > within the boundaries and matches what clk_round_rate() returned.
> > >=20
> > > Ok
> >=20
> > Actually, that doesn't work. Calling clk_round_rate() won't affect the
> > clock rate, so the rate returned by clk_get_rate() won't match what
> > clk_round_rate() will return.
>=20
> Huh? This is asking "what rate will I get if I call clk_set_rate() with
> DUMMY_CLOCK_RATE_1 - 1000 after setting the range to be rate 1 and rate
> 2. It should round that up to some value (and we should enforce that it
> is inclusive or exclusive). I think I missed that this is
> clk_round_rate().
>=20
> Either way, the clk provider implementation could say that if you call
> clk_set_rate() with a frequency below the minimum that it lies somewhere
> between the rate 1 and rate 2. The expectation should only check that it
> is within the range and not exactly the minimum because we're not
> testing the clk provider implementation of the rounding here, just that
> the constraints are satisfied and the rate is within range. That's my
> understanding of the comment above the function and the function name.

You're right, that has been addressed in the last version I sent already

Maxime

--bzfec56ydwngvrjb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYhiiygAKCRDj7w1vZxhR
xdyUAQC4zyprmmH2ygtZk0ErwGyncEtazWHRLvlfJ2eVoMrV1gD+KgEhpvdl+3Bi
q73173fu8I/uwsR7Wh8KVvmvm2xJegw=
=W7cx
-----END PGP SIGNATURE-----

--bzfec56ydwngvrjb--
