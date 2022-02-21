Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DF04BDACC
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 17:18:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3914D10E413;
	Mon, 21 Feb 2022 16:18:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1231210E413
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 16:18:26 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 488925C023B;
 Mon, 21 Feb 2022 11:18:24 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 21 Feb 2022 11:18:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=5q0FhEVXn0snjYY9k75GKqt/XCLzjvbf9XBiZX
 2tBdg=; b=d78NNd9+MwWCluB6G7hM83wUwUNWJ+PIY5WZrHJjq/Qx28lZ3w8osK
 lrjGj9zLZuk5te8eszhkJX5BJqzmcaQ1L+aiQfs8vvQmtLRK2FIM65nZgskuSXGt
 vmdF0DF7PCbzo+nW0kxa8REAFeD85KAy1NSJAUp5zXWWgTwbJAPhwqzrjMaUOJpV
 unPDyNN+Bhx1Af/xau7DahUrVLpGNarhRTe263Dkw4+IyTaaC3pImyJ3x11SIdGd
 im7wlucJdfxVmD3gPM6YGzaZ0ZoRffEP8xCciKaGsu7h4vmqT/a239p1vg+BfnQ8
 +Yv5/bdPIoKLZs3xC7+l/34J+eYRCDcA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=5q0FhEVXn0snjYY9k
 75GKqt/XCLzjvbf9XBiZX2tBdg=; b=iSZHCGpz1mEHuwFnJHmshu0nxS+flokLZ
 yGUG4mWlpRrKLCrOOKOsl9sBlS+xr8gMK9Z/1MN2jZ2FzTVM8BmwB7v2+G1aK8ex
 3PM1eMPm0Brxr/p0J57Z4Z/0j1PGfOdGSadjPg6sxK5/NcSnp7jFWkVLfG7KUATc
 qX1NosBIUs7DSUwbS6XcDktUTW7KNpM+XLBXQAFTF2h/O/syfeRbUbEuvyMHfHlP
 mYqLvB5EPhGvhpHYNKi5Pl3GdeA3nRpQ3xWPU9yBagwGrzZrmZuJ3YuCUtLODekG
 dh5qoSVcjWt3dSW6r8qbauSHpWDxncV5xX6Bql/pNkHFRe1j4yrPA==
X-ME-Sender: <xms:T7sTYu4U9TJYREXe0LuSnCmrG-9gk_1akIr_izKgf6LZOOn8BS0-3Q>
 <xme:T7sTYn7ZhdpBXANjsRQwKI1WHTqeKC-J0YZh5SH50oEz-0iBQv9mEQk2ou9eRTide
 4msfgVMPl0G-peJSRo>
X-ME-Received: <xmr:T7sTYtcm7QcH2ebPJeJImQtR22cASax2DMQpl1R1c7uhFE6bh3mG1RZXKK_5NkbZH2Sj93BpJFIwpABd77b1nZKAK2uvFqwc_heRTAk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrkeeigdekhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:T7sTYrIf9vWWJyaHu_XqS0DIB0I5rBlLlEI7Kj27viBzoH4q_83rcQ>
 <xmx:T7sTYiIvoapcbJQKvXaofjt7IiHAquE2KF5EsPPEE5ZHl0D6EIpp3g>
 <xmx:T7sTYsw5OOc0YM_91o3BXpw5px4RAN5teX4GLbxyCVrVhlRn0_KSGw>
 <xmx:ULsTYq-RqUFDbgEQl1zGInmGme5oU2o0-JlqTJMCdRgT3mmB6yWq3g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Feb 2022 11:18:23 -0500 (EST)
Date: Mon, 21 Feb 2022 17:18:21 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v4 02/10] clk: Always clamp the rounded rate
Message-ID: <20220221161821.jbktbgx2t6aaxds3@houat>
References: <20220125141549.747889-1-maxime@cerno.tech>
 <20220125141549.747889-3-maxime@cerno.tech>
 <20220218231508.7B5FCC340E9@smtp.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="hrhga4ab23qncznd"
Content-Disposition: inline
In-Reply-To: <20220218231508.7B5FCC340E9@smtp.kernel.org>
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


--hrhga4ab23qncznd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Feb 18, 2022 at 03:15:06PM -0800, Stephen Boyd wrote:
> Quoting Maxime Ripard (2022-01-25 06:15:41)
> > The current core while setting the min and max rate properly in the
> > clk_request structure will not make sure that the requested rate is
> > within these boundaries, leaving it to each and every driver to make
> > sure it is.
>=20
> It would be good to describe why. Or decide that it was an oversight and
> write that down here.
>=20
> > Add a clamp call to make sure it's always done, and add a few unit tests
> > to make sure we don't have any regression there.
>=20
> I looked through the per-user constraint patch history on the list but I
> couldn't really figure out why it was done this way. I guess we didn't
> clamp the rate in the core because we wanted to give the clk providers
> all the information, i.e. the rate that was requested and the boundaries
> that the consumers have placed on the rate.

I'm not really sure we should really leave it to the users, something like:

clk_set_range_rate(clk, 1000, 2000);
clk_set_rate(clk, 500);
clk_get_rate(clk) # =3D=3D 500

Is definitely weird, and would break the least surprise :)

We shouldn't leave that to drivers, especially since close to none of
them handle this properly.

> With the round_rate() clk_op the providers don't know the min/max
> because the rate request structure isn't passed. I think my concern a
> long time ago was that a consumer could call clk_round_rate() and get
> one frequency and then call clk_set_rate() and get another frequency.

I'm not sure I follow you there.

The function affected is clk_core_determine_round_nolock(), which is
called by clk_core_round_rate_nolock() and clk_calc_new_rates(). In
turn, they will be part of clk(_hw_)_round_clock for the former, and
clk_core_set_rate_nolock() (and thus clk_set_rate()) for the latter.

I don't see how you can get a discrepancy between clk_round_rate() and
clk_set_rate().

And yeah, it's true that the round_rate op won't have the min and max
passed to them, but i'd consider this an argument for doing this check
here, since you don't have that option at all for those clocks.

> We need to make sure that round_rate and set_rate agree with each
> other. If we don't do that then we don't uphold the contract that
> clk_round_rate() tells the consumer what rate they'll get if they call
> clk_set_rate() with the same frequency.
>=20
> >=20
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
> >  drivers/clk/clk-test.c | 46 ++++++++++++++++++++++++++++++++++++++++++
> >  drivers/clk/clk.c      |  2 ++
> >  2 files changed, 48 insertions(+)
> >=20
> > diff --git a/drivers/clk/clk-test.c b/drivers/clk/clk-test.c
> > index 47a600d590c1..28c718ab82e1 100644
> > --- a/drivers/clk/clk-test.c
> > +++ b/drivers/clk/clk-test.c
> > @@ -203,6 +203,50 @@ static void clk_range_test_set_range_invalid(struc=
t kunit *test)
> >                         0);
> >  }
> > =20
> > +/*
> > + * Test that if our clock has some boundaries and we try to round a ra=
te
> > + * lower than the minimum, the returned rate will be within range.
> > + */
> > +static void clk_range_test_set_range_round_rate_lower(struct kunit *te=
st)
> > +{
> > +       struct clk_dummy_context *ctx =3D test->priv;
> > +       struct clk_hw *hw =3D &ctx->hw;
> > +       struct clk *clk =3D hw->clk;
> > +       long rate;
> > +
> > +       KUNIT_ASSERT_EQ(test,
> > +                       clk_set_rate_range(clk,
> > +                                          DUMMY_CLOCK_RATE_1,
> > +                                          DUMMY_CLOCK_RATE_2),
> > +                       0);
> > +
> > +       rate =3D clk_round_rate(clk, DUMMY_CLOCK_RATE_1 - 1000);
> > +       KUNIT_ASSERT_GT(test, rate, 0);
> > +       KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_RATE_1);
>=20
> The comment says within range but this test says exactly the minimum
> rate. Please change it to test that the rate is within rate 1 and rate
> 2. Also, we should call clk_get_rate() here to make sure the rate is
> within the boundaries and matches what clk_round_rate() returned.

Ok

--hrhga4ab23qncznd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYhO7TQAKCRDj7w1vZxhR
xdDeAPoDyj5uGoplJHMvWi/RM1aNvlBRPBia0DzyZckVW0nVSwEA8o7rGkoIFB6z
/m4OGazOPs+JLFk/YEvhZD/DvlhonwU=
=9m2X
-----END PGP SIGNATURE-----

--hrhga4ab23qncznd--
