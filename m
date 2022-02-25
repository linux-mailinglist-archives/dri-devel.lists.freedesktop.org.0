Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A69F4C4763
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 15:26:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0415310E11D;
	Fri, 25 Feb 2022 14:26:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FF2010E11D
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 14:26:12 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 8B0895C01D6;
 Fri, 25 Feb 2022 09:26:10 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 25 Feb 2022 09:26:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=do2M7VU/s9ocy5iq8t0OxHx1XBphZ2uLPgcver
 C5VW4=; b=b82ra0YcisNFB8ROl8Sj9PCYMoVYRaMJ7tXIVAi98BSTNfZ8Wl+5UX
 JqR0IeD9dpRoZSmRTMCdShB39c5J/uXSg/NLfzQmX7eJLYU5JAhiOsGsouNu53v4
 /Wrqw/q/s2I/hLruI6rtTDCcoOyJ/U6/ZOINdiEBdIv5QtXK6INjbINsuVshjzTW
 5WNTHTn0K83rwizw5B1SuQ2/kCtvtzRLua9CKu2BDS1EHowRhdiq5X0zCM0HWw7y
 xgI5bXjBpxtJ1LfrIAONKkT+/o69dP/mhfw5eIb52PbhC1JRLJbXv9uuQgjyPZJV
 CVnwgdSoMkr/Mgo/ub2doefDTx5nOYrA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=do2M7VU/s9ocy5iq8
 t0OxHx1XBphZ2uLPgcverC5VW4=; b=YWKp1z0pH26ay2MPObm6zqY0f3ii7MNts
 JW7vxEspqHBdEzIXRzmi3eflo0ApfzEqsI032clA4lJJEDfa2OygwAGNccHOb5MN
 nWC0QNtwZw7PVxAnUaVlyXLHMqWPUfSAen39pOK55jlq4kjnsLjD5ss1Kc68ergi
 7mmEhCeNE7u7coegogSXx8FS4W7Yi65xD5tmPMSRnHupLMS+5JPf59xnWUIEhyvB
 0hIunIi9PPrZzRZp63056pbSSxi1c3fU3r3JWu3B8tGAxkrwmVIwEkhh6eQ8ujJW
 uSSS97+NtgE4biquJoCja6c/A/HQtt3IDnkEg844ykOL26B+AwdFg==
X-ME-Sender: <xms:AecYYoYZ89qTX0czd_uqsHPClojIlKjlnjPCfdCCiFEsHXWaDTZ15Q>
 <xme:AecYYjZe7qWijDNRO_CF8TqqFcLnw6pTSNVxgO47NyNKIga-DdYH8pjhXMn35vyua
 yVYUsg9D_dFP3PElnw>
X-ME-Received: <xmr:AecYYi_5SnRseP-nqh410aldcdDMwO6Q8VNJaPg6pxmLISlmNkTflbUQkt_gxl0Ue4bxIC4uhQZjED3jYCVvZAEFyg1Z7FlqLIOWlsU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrleeggdeihecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeffieejteehtefhveegkedvjeetgefhieeukeehgfetffdukeetieekffdtjeei
 hfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:AecYYiq_A54SKZthp8ztgGZGyhPb1BTvt_z0WNSomU2cGMdoBw5vwg>
 <xmx:AecYYjrlU4hrGQlGmWTZgFn_1UjvRUJDhEHCsCm98liQ4A7F-6w5mQ>
 <xmx:AecYYgRSCYpuzsp1LySgtRc9_76YqZUhVPP0gEuDV_kf2s6rC4QIRw>
 <xmx:AucYYneL9t30IEf4z28p3I6EYt_ynU3jQZjGSoKxsAQ3RvBgU2DS-g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Feb 2022 09:26:09 -0500 (EST)
Date: Fri, 25 Feb 2022 15:26:06 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v6 02/12] clk: Introduce Kunit Tests for the framework
Message-ID: <20220225142606.6xpq4nzh7ldtkekk@houat>
References: <20220223105600.1132593-1-maxime@cerno.tech>
 <20220223105600.1132593-3-maxime@cerno.tech>
 <CAGS_qxqNU+rGFuALEpmqqmtD+LsTQ4R3_WWL3M70Ar-_af6OnA@mail.gmail.com>
 <20220224225422.98298C340E9@smtp.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="xh65zlubb327ceuu"
Content-Disposition: inline
In-Reply-To: <20220224225422.98298C340E9@smtp.kernel.org>
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


--xh65zlubb327ceuu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Thu, Feb 24, 2022 at 02:54:20PM -0800, Stephen Boyd wrote:
> Quoting Daniel Latypov (2022-02-23 14:50:59)
> > On Wed, Feb 23, 2022 at 2:56 AM Maxime Ripard <maxime@cerno.tech> wrote:
> > Incremental coverage for 3/9 files in --diff_file
> > Total incremental: 99.29% coverage (281/283 lines)
> >   drivers/clk/clk.c: 84.62% coverage (11/13 lines)
> >   drivers/clk/clk_test.c: 100.00% coverage (269/269 lines)
> >   include/linux/clk.h: 100.00% coverage (1/1 lines)
> >=20
> > Missing lines are drivers/clk/clk.c:2397-8, i.e. this part of the diff:
> > +       if (ret) {
> > +               /* rollback the changes */
> > +               clk->min_rate =3D old_min; <- 2397
> > +               clk->max_rate =3D old_max; <- 2398
> >=20
> > These are from before and were just moved around.
>=20
> We could trigger a failure in the provider when the rate is set, and
> then we could call round_rate() again and make sure the boundaries from
> before are maintained.

I tried to do that, and it turns out we can't, since we ignore the
set_rate return code:

https://elixir.bootlin.com/linux/latest/source/drivers/clk/clk.c#L2107

We could make determine_rate fail, but then clk_round_rate would fail as
well and wouldn't allow us to test whether the boundaries are still in
place.

Maxime

--xh65zlubb327ceuu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYhjm/gAKCRDj7w1vZxhR
xd8RAQDunXKf3UQT7sojv5u/6n79Z2XU0wG+Iiw1O5z+fjgsfgD8DlHs0oKrN/9X
t4pB+g1lDDTduGX6uTOkvPkbwsJ6yAQ=
=nlhC
-----END PGP SIGNATURE-----

--xh65zlubb327ceuu--
