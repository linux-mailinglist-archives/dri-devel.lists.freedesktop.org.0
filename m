Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4E04C41B1
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 10:45:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C74E10E7CD;
	Fri, 25 Feb 2022 09:45:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09EB110E7D7
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 09:45:07 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 520835C00CA;
 Fri, 25 Feb 2022 04:45:05 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 25 Feb 2022 04:45:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=y1sYU+AQWsGP4SBCkB8RBf2+7nw9Nj/IaQCJez
 1IpHI=; b=JvY2fTEhuuYphhERL3AZcVdljkT6Oia2a66PUUpDzCFFp6u382HFAs
 5QAnySR0W7SB8+Rs12QHt1J9bgdWdLHDv3wAwSlCA/dP1dv+e/qXFEzDl2Yq6BCa
 PcWI2JAj90Z8DlpyeBTFVXkyFpZB6EtWzKDHN2bu4cX/bA0u+TTrOfPJwRIk62wj
 LNkGSIuUB7km+a75FT/zrvNST4U7Ju6uvxlhoZ/dl6Jq25ueGT0ooIY5Sb0xsF7D
 YOemFQaV05wJD6j4p7zhnq5Hsqio8Fm9cM7l9Pe1tBb/9Uz1JDruLNzvZKX8qXlu
 03ii6GhTrdLuICvO4YPZApRhttFJPLcg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=y1sYU+AQWsGP4SBCk
 B8RBf2+7nw9Nj/IaQCJez1IpHI=; b=ObGj64oW1gyAueOF8f5GakjEiLAEDHTh/
 DJOzqy4rMtxfQqZx8QpI7WStUWOOizNQUB2Ct8G15tzLUIku5HWLv/vd83mrd6Ny
 sjwBvvXR4OmFG8h6O67FLdE1CDeHKx3kFTessMpZOdW37170laHD2JuChsidhez3
 4KHkFizpmQoo/Ic0gPlUqZs2mY01sbKu+qAFz6KlXUj5X/+qosDDlmi6tU5s1dBr
 4Ewj4BcrP/obEVubZHY5tRo7fZIX6aqmrguWsksXm/epO5wSyjYjoaXHOVVljter
 8OY1MZhbwNoh6PVxh5r+58piHcnz3sbgPfaF5ZNC817yJdYOZQPOQ==
X-ME-Sender: <xms:IaUYYqqTg8bf1_aC0qBf-BE42641VY0QI1wqA95qNXFcyJY9j2jJDA>
 <xme:IaUYYoq3XpEFgXE1zvvuhCDZhrSnJerxUGY3yec0zqK9i0mesvIOncrWuiKORO2d8
 Qsv1LHw-PQO15LiLLA>
X-ME-Received: <xmr:IaUYYvN50tS89FHV30-U3XZ_f6SEFGmYYRdt2lebvLNNAZeWxWkta4zYvsb6e9S7MRkj4TesYZSib_gb32zPRSz1Z9FZjL-DUCOJsGY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrleeggddtjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeffieejteehtefhveegkedvjeetgefhieeukeehgfetffdukeetieekffdtjeei
 hfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:IaUYYp6qFSIhUkPHAe7S8BJyq_YvxEo06m0wBZXLBvwUA-698tgDWg>
 <xmx:IaUYYp5db4Q1IrofGaiuyVw7tDIL4B_8RNtpsqEdVdHl-D8ArhFytg>
 <xmx:IaUYYphsFUTVXhb-GqYVbaVb7y4-59rohEs-GUCVBLD4qeS7Qc_ydw>
 <xmx:IaUYYms3BcMR_7RtqeYTEyVMi3ZQKJSlucnuQDnffZXoGGiAD04jIQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Feb 2022 04:45:04 -0500 (EST)
Date: Fri, 25 Feb 2022 10:45:03 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v4 02/10] clk: Always clamp the rounded rate
Message-ID: <20220225094503.uvlvyxezaxiwkrtt@houat>
References: <20220125141549.747889-1-maxime@cerno.tech>
 <20220125141549.747889-3-maxime@cerno.tech>
 <20220218231508.7B5FCC340E9@smtp.kernel.org>
 <20220221161821.jbktbgx2t6aaxds3@houat>
 <20220224223239.0B0B8C340E9@smtp.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="jaamng7jjo3suu2f"
Content-Disposition: inline
In-Reply-To: <20220224223239.0B0B8C340E9@smtp.kernel.org>
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


--jaamng7jjo3suu2f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Feb 24, 2022 at 02:32:37PM -0800, Stephen Boyd wrote:
> Quoting Maxime Ripard (2022-02-21 08:18:21)
> > Hi,
> >=20
> > On Fri, Feb 18, 2022 at 03:15:06PM -0800, Stephen Boyd wrote:
> > > Quoting Maxime Ripard (2022-01-25 06:15:41)
> > > > The current core while setting the min and max rate properly in the
> > > > clk_request structure will not make sure that the requested rate is
> > > > within these boundaries, leaving it to each and every driver to make
> > > > sure it is.
> > >=20
> > > It would be good to describe why. Or decide that it was an oversight =
and
> > > write that down here.
> > >=20
> > > > Add a clamp call to make sure it's always done, and add a few unit =
tests
> > > > to make sure we don't have any regression there.
> > >=20
> > > I looked through the per-user constraint patch history on the list bu=
t I
> > > couldn't really figure out why it was done this way. I guess we didn't
> > > clamp the rate in the core because we wanted to give the clk providers
> > > all the information, i.e. the rate that was requested and the boundar=
ies
> > > that the consumers have placed on the rate.
> >=20
> > I'm not really sure we should really leave it to the users, something l=
ike:
> >=20
> > clk_set_range_rate(clk, 1000, 2000);
> > clk_set_rate(clk, 500);
> > clk_get_rate(clk) # =3D=3D 500
> >=20
> > Is definitely weird, and would break the least surprise :)
> >=20
> > We shouldn't leave that to drivers, especially since close to none of
> > them handle this properly.
>=20
> Ok.
>=20
> > > With the round_rate() clk_op the providers don't know the min/max
> > > because the rate request structure isn't passed. I think my concern a
> > > long time ago was that a consumer could call clk_round_rate() and get
> > > one frequency and then call clk_set_rate() and get another frequency.
> >=20
> > I'm not sure I follow you there.
> >=20
> > The function affected is clk_core_determine_round_nolock(), which is
> > called by clk_core_round_rate_nolock() and clk_calc_new_rates(). In
> > turn, they will be part of clk(_hw_)_round_clock for the former, and
> > clk_core_set_rate_nolock() (and thus clk_set_rate()) for the latter.
> >=20
> > I don't see how you can get a discrepancy between clk_round_rate() and
> > clk_set_rate().
> >=20
> > And yeah, it's true that the round_rate op won't have the min and max
> > passed to them, but i'd consider this an argument for doing this check
> > here, since you don't have that option at all for those clocks.
>=20
> When the range setting API was introduced the rounding logic and the
> rate setting logic didn't use the same code paths. It looks like that
> code got consolidated now though so we should be fine.

Actually, there was a discrepancy. If you are doing, before this patch
series:

clk_set_range_rate(clk, 1000, 2000)
clk_round_rate(500);

Unless the driver was involved, the returned rate would be 500.

Now, if you call clk_set_rate(500), it will return -EINVAL, hitting the
check here:
https://elixir.bootlin.com/linux/latest/source/drivers/clk/clk.c#L1973

If the driver was looking at the min and max and clamping the rate, you
would get clk_round_rate() =3D=3D 1000 and clk_set_rate() would succeed,
with the rate set to 1000.

This seems like an abstraction leakage to me.

This patch fixes that discrepancy, but in the last version I sent, I
added a test that would check that once you have a range in place, then
clk_round_rate and clk_set_rate/clk_get_rate would return the same
value.

Maxime

--jaamng7jjo3suu2f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYhilHwAKCRDj7w1vZxhR
xTiiAQDbOF7DkdlTkin0aizX/qR/YJiU5RuKsOO81IMsvoVYnwD+K+670ZTxpJbI
nFjJYC8y/zWeTZcihbr3qLxNs796IAI=
=x47S
-----END PGP SIGNATURE-----

--jaamng7jjo3suu2f--
