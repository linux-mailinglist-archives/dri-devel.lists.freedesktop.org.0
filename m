Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5564D4C69EA
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 12:11:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E57A910E39C;
	Mon, 28 Feb 2022 11:10:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D87A10E39C
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 11:10:54 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 60B8B3200BD2;
 Mon, 28 Feb 2022 06:10:53 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 28 Feb 2022 06:10:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=BoXgeyVAh5F3HeGNXMqR5ovAbrWK49vT1e1JUe
 yC8MM=; b=W/55fJDLwDlemM/LeTmfXFCpSyUy7L67taJHQrnrr289zeYi1g3GJU
 02rj7XodUS3v4VBQFUnUV/nPribGrHXFY9Cq6N0+eVLQZ8X8rtYIm3pLaGUhaVnv
 XQzXgCKT1GjX50TyVMEGyKlKavVErLxvFNDmwpRhf77cyLSn6pYaRDAJHLFFY5M0
 KvSzkQs94uXrEC9RKjjy0wCEejLjp1PORxX2l1zt8bqu/sGOd7OXo8Rzt/qCYtIt
 Mc5PGm6eRwhZuT3hxQ/PKqlc8zxk29nhGNHUWg9ltsIAVwpzC+UQs76dx/Q5ro/a
 ol/O99k0yVcKVeZxNu4LmOldgLK3flHw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=BoXgeyVAh5F3HeGNX
 MqR5ovAbrWK49vT1e1JUeyC8MM=; b=P4ZD+c8W0JEc4cAFtv0BQYVHZx7jpJoD0
 v7RGTFXqXaYP85fa87jPLuuAFZwoUZJns5pns9ppsiyvpyBb2emN7MtN2jSAryaq
 k5Eaq1TNEHrEZyYWQAL7hlutpWQni+dcm3EaiiFdCcCmbHjn1AwLNK/kVIcmhB02
 LTi4U8VMOQzhRzhM/fcu6JGChFPBMO/Jj2qioNt9WrEyG/R/uhS2rDJX49OP+1GE
 yP0X6pcHUe1UH/fMJuZecnBlQB2R1AHoReIAgBmPrJwtoxNo/1jgFiI5PLy10muu
 mqDHvaHY/KMGlhJtfr5hC1MNQLn8g0hRUYdGXeEdlfH3Hwejdkg2Q==
X-ME-Sender: <xms:vK0cYjRe2-PgD4NNwkoOPTlj2FFyZ1W4PZS5RyOGhSWK-taTK9MoRg>
 <xme:vK0cYkzw71LDMZvNXUrvKGeD4sCvjnk8-bY0LWH_utQUiUW2kOZlU3qRPcyYAxWP2
 zlvrH1HaI6xN8hNoFI>
X-ME-Received: <xmr:vK0cYo3wfUdvViVFmoCgT9AzmnSXmkO5sSzaGeYDPHKOH3QxRRp1TZRWqUZsrjjGTY_9L96exRL6o6RBsDS6Wy76rfwgZ07xKrv9Y2g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddttddgvdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepffeijeetheethfevgeekvdejteeghfeiueekhefgteffudekteeikefftdej
 iefhnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggt
 hh
X-ME-Proxy: <xmx:vK0cYjCGneN3m9jNsQP7JX2_ExTj75th7ngjIr8lt04xFzND4afl1g>
 <xmx:vK0cYsgGJQGK8Qxba68e4GO33VFF7WX3EPpbWprtCb-n3RuUALdbwQ>
 <xmx:vK0cYnovIvLnz4ZofTqWWM8KStEPomoun_cxrsRq_al4zt2I-CVE8Q>
 <xmx:vK0cYlUWbjr94ZM-z1sCMhhkWW0iLV3uFsrlt1Hjc6cjjnFCBVZ2iw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Feb 2022 06:10:51 -0500 (EST)
Date: Mon, 28 Feb 2022 12:10:49 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v6 02/12] clk: Introduce Kunit Tests for the framework
Message-ID: <20220228111049.g6kw43fvr6fqeu72@houat>
References: <20220223105600.1132593-1-maxime@cerno.tech>
 <20220223105600.1132593-3-maxime@cerno.tech>
 <CAGS_qxqNU+rGFuALEpmqqmtD+LsTQ4R3_WWL3M70Ar-_af6OnA@mail.gmail.com>
 <20220224225422.98298C340E9@smtp.kernel.org>
 <20220225142606.6xpq4nzh7ldtkekk@houat>
 <20220225224406.1947FC340E7@smtp.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="x25sekw3i76vbfhj"
Content-Disposition: inline
In-Reply-To: <20220225224406.1947FC340E7@smtp.kernel.org>
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
 Daniel Latypov <dlatypov@google.com>, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, Mike Turquette <mturquette@baylibre.com>,
 Phil Elwell <phil@raspberrypi.com>, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--x25sekw3i76vbfhj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 25, 2022 at 02:44:04PM -0800, Stephen Boyd wrote:
> Quoting Maxime Ripard (2022-02-25 06:26:06)
> > Hi Stephen,
> >=20
> > On Thu, Feb 24, 2022 at 02:54:20PM -0800, Stephen Boyd wrote:
> > > Quoting Daniel Latypov (2022-02-23 14:50:59)
> > > > On Wed, Feb 23, 2022 at 2:56 AM Maxime Ripard <maxime@cerno.tech> w=
rote:
> > > > Incremental coverage for 3/9 files in --diff_file
> > > > Total incremental: 99.29% coverage (281/283 lines)
> > > >   drivers/clk/clk.c: 84.62% coverage (11/13 lines)
> > > >   drivers/clk/clk_test.c: 100.00% coverage (269/269 lines)
> > > >   include/linux/clk.h: 100.00% coverage (1/1 lines)
> > > >=20
> > > > Missing lines are drivers/clk/clk.c:2397-8, i.e. this part of the d=
iff:
> > > > +       if (ret) {
> > > > +               /* rollback the changes */
> > > > +               clk->min_rate =3D old_min; <- 2397
> > > > +               clk->max_rate =3D old_max; <- 2398
> > > >=20
> > > > These are from before and were just moved around.
> > >=20
> > > We could trigger a failure in the provider when the rate is set, and
> > > then we could call round_rate() again and make sure the boundaries fr=
om
> > > before are maintained.
> >=20
> > I tried to do that, and it turns out we can't, since we ignore the
> > set_rate return code:
> >=20
> > https://elixir.bootlin.com/linux/latest/source/drivers/clk/clk.c#L2107
> >=20
> > We could make determine_rate fail, but then clk_round_rate would fail as
> > well and wouldn't allow us to test whether the boundaries are still in
> > place.
> >=20
>=20
> The test could still do it at a high level right? And when/if we decide
> to bubble up the set_rate failure then we would be testing these lines.
> Seems like a good idea to implement it with a TODO note that clk.c is
> ignoring the set_rate clk_op returning failure.

I'm sorry, but I don't get what I need to implement here

The trivial test for this would be to have a driver with set_rate that
returns some error, and then:

KUNIT_ASSERT_LT(test, clk_get_rate(clk), DUMMY_CLOCK_RATE_1);
KUNIT_EXPECT_LT(test,
		clk_set_rate_range(clk,
				   DUMMY_CLOCK_RATE_1,
				   DUMMY_CLOCK_RATE_2),
		0);

rate =3D clk_round_rate(clk, DUMMY_CLOCK_RATE_1 - 1000);
KUNIT_ASSERT_GT(test, rate, 0);
KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_RATE_1 - 1000);

clk_set_rate_range will never return an error code though, and the
round_rate tests won't work either because the set_rate error was not
propagated, and therefore the boundaries won't be reverted either. So
not only the test will fail, but it will also not increase the coverage.

It's really not clear to me what you expect here. Or we should just
create it but skip it all the time with a FIXME? But then again, it
doesn't increase the coverage, so I'm not sure why it's holding off that
series.

Honestly, I'm getting a bit frustrated by all this. This started as a
small fix, and now we keep moving the goalposts, with more and more
expectations and fixes for things that have nothing related to the
original series. And we're now arguing about gaining a few percent of
code coverage on some code that without this series has a 0% percent
coverage.

Maxime

--x25sekw3i76vbfhj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYhytuQAKCRDj7w1vZxhR
xQWPAP9Puh/4Mha2nwzmRLcmLn76nncDcp4oRVsMdJw+tVP5FgEAsWq1XV5LpelI
05W30qbgMAVrfLohhfon0K5JTU9uoAc=
=xDmS
-----END PGP SIGNATURE-----

--x25sekw3i76vbfhj--
