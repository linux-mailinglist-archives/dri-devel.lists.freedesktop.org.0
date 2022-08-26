Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 225BE5A2342
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 10:39:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D475110E74D;
	Fri, 26 Aug 2022 08:39:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E42110E7BC
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 08:39:36 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id BADFF5803A3;
 Fri, 26 Aug 2022 04:39:35 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 26 Aug 2022 04:39:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1661503175; x=1661510375; bh=9xtBw9bGVh
 /VC2EF6GzMgiE93Tg5R1QYL3cLjDRDYzc=; b=cyxbPTjcl4hcUxTxY9R3TEaBtP
 ChkWzg86WrWHSb8+ifunp/H1FZDvxH36HLAyVP6q4NBEtlCQSrihx87KO4+HjQIZ
 S+6jjIJ9aHhKlPyBEjm1Z196OjkLhy5dSL1+CrJ+mcGPC9sPf/zKipQ7dwl7BcA+
 3XxEv/SySp5yWccenDgtPsQK7clK5UaTfvBWZx+80EG9L3HSpEp+1W+hpBIiIyxH
 jsHv7RjzkIxKfNT1krrbsp7I0R9Tuf7R9ax/YLuZ4vcr9SNf0F2ZlXc/7Gyh4dFf
 DTJQ8704P5yE0RMQDOEwKNyK/VdockUbBz1FIuLiKnBmYW+qkWj4+xPuR37g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1661503175; x=1661510375; bh=9xtBw9bGVh/VC2EF6GzMgiE93Tg5
 R1QYL3cLjDRDYzc=; b=tApEFqsJzgIpkdw3IAPFB+tnDdhT/p4Z/63Z0OYt3OTc
 VdzFOn+20lhMDNIyvxC/XxNpxpIwVJ4TSpZXW+lqW+L8XV6ikpUlITX/lSTGgBlC
 qbZNwcpKCj0A93ph8YNR5gLzOMi87MBG5cWctotHXU5TA7u2b9BPHToT68urDc9V
 j7uLnWRM3nka8Pt/dc+5boJIPbNnwX0hYblSYD5r+/EjgHWhXEg1tr4fy6exNY96
 s0yxTzw1nD2Sd0lyxPOj6u817l+NAqIu5ofSqBW+9WYUPT0/bMSJcbP+JdHJjh5I
 iY6py0HZTr4oqeNyuoLaYNKCMv7kwtWuc+vEa6sVNQ==
X-ME-Sender: <xms:xoYIY-bWt0kDLwGe_MuCy3E-nXQf6GJweskoJXSSAxT0QDNXhcck2g>
 <xme:xoYIYxZAV2bURDoMbSb4oZwCK6jVpg6zu9qesNnODHH4Dx1zqgTOKxOtzZTGEuFLE
 jTxbcmn_YMzNB3euRU>
X-ME-Received: <xmr:xoYIY49lYhb1uM0-1L_ltuZCJ4-FAVszUJmu66xWZPGW7F81Gnc9byQW454>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdejhedgtdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeevuddthffgfeeiffejgfeghfeludegkedtgefgffejtdegtddvleduvdfh
 teehveenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggt
 hh
X-ME-Proxy: <xmx:xoYIYwok29UQGcnLMHb6Bz0QVvzQUwkG5u8Jjo3kNt44HmYdjYpTnA>
 <xmx:xoYIY5oYKxL0RG3Z8nBl3J3f19P2Bhcnrp8YROGaca0jh0pheWolwg>
 <xmx:xoYIY-RxUi_8QDamJh6hWOr4i3lYTtgp4tKuufNO5MXg7wx__HWbFQ>
 <xmx:x4YIYyZcUH30FUMCvxBJ4wrOJiTrOL_b0pYJw95tPAU9nCwstGOmuw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 26 Aug 2022 04:39:34 -0400 (EDT)
Date: Fri, 26 Aug 2022 10:39:31 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Mateusz Kwiatkowski <kfyatek@gmail.com>
Subject: Re: [PATCH v1 00/35] drm: Analog TV Improvements
Message-ID: <20220826083931.sd7oxpbsnxrqij52@houat>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <987d6114-5fcb-d668-3b0d-ad6d8723dfdb@tronnes.org>
 <20220822074800.qzyctchqn5usr55g@houat>
 <9a15b1cf-692c-1b0d-02a6-316cbd954525@gmail.com>
 <20220825155506.wqurh5r752qfufqs@houat>
 <18737c8a-78f4-5b9f-aea2-588bc65c13d9@gmail.com>
 <9d9ba040-99d7-25cb-ba10-1c132d7f7663@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ztr76q3jbdkzy3rp"
Content-Disposition: inline
In-Reply-To: <9d9ba040-99d7-25cb-ba10-1c132d7f7663@gmail.com>
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
Cc: Emma Anholt <emma@anholt.net>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-sunxi@lists.linux.dev,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ztr76q3jbdkzy3rp
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 26, 2022 at 06:07:47AM +0200, Mateusz Kwiatkowski wrote:
> Hi Maxime, Noralf and everyone,
>=20
> Just as a quick update. I isolated the issue to the power management subs=
ystem.
> Unfortunately I know very little about the power management subsystem so
> I don't think I can help.
>=20
> There are two alternative dirty ad-hoc hacks that get things working.
>=20
> - Commenting out the pm_runtime_put() / pm_runtime_get_sync() calls in vc=
4_vec.c
> - Reverting this PR by Dom Cobley a.k.a. popcornmix:
> =A0 https://github.com/raspberrypi/linux/pull/4639

We don't have that PR upstream, so that might be the explanation to why
you're seeing this and I don't. I'll look into this further and will
open an issue.

I can't see anything wrong with the pm_runtime use though.

> Either of these approaches makes VEC mode switching work again. Obviously
> neither is appropriate for a permanent solution.
>=20
> I tried some random code permutations that came to my mind, like using the
> vc4_encoder callbacks (e.g. post_crtc_powerdown) instead of the standard
> enable/disable encoder callbacks, but to no avail.
>=20
> Since the clocks and power management seem to be delegated to the firmwar=
e now,
> my guess is that this might be a firmware issue, but I can't really check=
 all
> the firmware versions. It certainly crashes on the version currently avai=
lable
> in Raspberry Pi OS repos, and on this one:
> https://github.com/raspberrypi/rpi-firmware/commit/4dde751. My Pi4 doesn'=
t boot
> using any newer firmware, at least not from USB - I might try some SD card
> after the weekend.

Thanks for your testing

Maxime

--ztr76q3jbdkzy3rp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYwiGwwAKCRDj7w1vZxhR
xVloAP9b+eN7Fz3nq/+s3sKOXlcj/RDnTbMCfoNAKYheAd1bJQD/SVISMs+ofJwg
ATFobKVjQ6spDBEO2dCXYu2C237MFwM=
=AUEX
-----END PGP SIGNATURE-----

--ztr76q3jbdkzy3rp--
