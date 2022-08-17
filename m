Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2EC596F5D
	for <lists+dri-devel@lfdr.de>; Wed, 17 Aug 2022 15:19:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 498B69291F;
	Wed, 17 Aug 2022 13:19:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8646118A8C6
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 13:19:01 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id EB4E02B059AF;
 Wed, 17 Aug 2022 09:18:58 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 17 Aug 2022 09:19:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1660742338; x=1660749538; bh=l9nnSULWeK
 Q3XggL/zqDG46qTFmpp//Ck12PCcxE0C4=; b=pF/7j9Cm7g40yrOScl4skNreL2
 ccqXhCjvRZznSRSF8iv3BsajgJqsSxeejMYry/aJir12Cq0cDvoWOHMKSqK+hrHV
 /a27Uah7wwi9OZ7JdFLS7io3iwHSZhBkcRbqLKcFYW0VKdkH3qp7RyiNwZl94f1E
 zUKVdX0Co++619zrN85L7jZYtou5/rFWIReG9TxjiSrtRfHMVALZK0a2dIAiNPey
 k5xnYjBQ3midyovFl94hMcQQQnartAKyINKT1f2u5iiYyJQebKsLIWShk3lNd5zG
 iekKZZiB/p9w/dHaCx4QUo+QmNkBoWYG2huX0B7rx5qHpjlU+GQZnHln1NxQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1660742338; x=1660749538; bh=l9nnSULWeKQ3XggL/zqDG46qTFmp
 p//Ck12PCcxE0C4=; b=0yq+TQb2k0Ge8C7gWLSDZxUbaft3Y7NQ2c9RLH0PWcT2
 PiTwPZj2vykG414dYWHWPehc5NXyFhrx3qTMKgDlx50h/Eu1NPTeQS4J/i0EBC9H
 766vhkSIScDQvoKRkaqRMENnynoZCLR3D9h5DdZD+n40FTRjKuWenUtAJbtZe4fU
 oO89K0GrZnhFZ107Ch6BFcgp8mVf5U43254oG8WVsCnSXzedtRo8f5LGWaViy1dW
 F7W+bIb0hNWZMipRiW9UaIRKzNU5ffBRgnHRZj9R6Nd5RGbwMPcStxkuQrKAv5uS
 IJOmBt7TDmIRVxsyjLN2TIPOE1t6rTNFwJyi5emdkg==
X-ME-Sender: <xms:wer8YnbbrLd39px3c8-wsLjK179EcEwMQQhEiu6HjxxNJUOarWEPPw>
 <xme:wer8YmaRg24-lqp6fTE9m-uwMwtqC10YlWNZ_39X2C8Rxsh6v-fh1gjShzfpwmXUC
 rP5d0z91KpP4jWVpJI>
X-ME-Received: <xmr:wer8Yp_kDrgVTos-fv8w0E9iNoNwBk0yHcrZ5lzCWpl0RajwJAbrkO7Vsw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehiedgieefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedtleekjeeiudefvdfhieffteelhfeivdeliefgieeugffhvdelieffjeei
 geetjeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggt
 hh
X-ME-Proxy: <xmx:wer8YtqdNamwIkeQpl6RDY9VlFq4ChZh4cTgFhI5ay_1mkURX8oJtA>
 <xmx:wer8YirW4QTJSrqhg96beQy_yHD2Y5kSTvJAHmIGBx83zAVCiSNOhA>
 <xmx:wer8YjSIMFaX9hU7t1obQrk2WAo2e5DTtnuHUfoKqMTTB6u5v6s1sA>
 <xmx:wur8YrbocuObCBuPv2KR9L1HKdRIijNGO56ppPQRu5g4IlXgKq4Qh52Cgts>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 17 Aug 2022 09:18:56 -0400 (EDT)
Date: Wed, 17 Aug 2022 15:18:54 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v1 05/35] drm/connector: Add TV standard property
Message-ID: <20220817131854.jwmhqvhfhp77bbr3@houat>
References: <20220816132040.uwirtjm5yr6rdd3q@houat>
 <CAMuHMdWevP=3af=NneAJEDfOR+sz1thrQEhAQPNGrgitBtLjGA@mail.gmail.com>
 <20220816141116.5nuszmilqv2exdb3@houat>
 <CAMuHMdXq_xGPx46bdnUFGDiG4kcgdxtXaRGTucFd3TRq8353dg@mail.gmail.com>
 <20220816154956.pkdpxmmw27mia5ix@houat>
 <CAMuHMdX0L6cO_jYXKZTv0sm9V39Eiy_STiknSkdRQG4k-9GJeg@mail.gmail.com>
 <20220817074710.w4c4xwj7edly2b5p@houat>
 <CAMuHMdXeBakWr6geOWGxnjQYaU9Pi4tRvVFFtubyMJZTT2nPnw@mail.gmail.com>
 <20220817111454.pn2iltvyo2drebq7@houat>
 <CAMuHMdU57g1rNoLo65jhLK8mk4YkNEbMz1E7XKWk2dnCxTr=gg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="pwhi6bupdwzq7ldy"
Content-Disposition: inline
In-Reply-To: <CAMuHMdU57g1rNoLo65jhLK8mk4YkNEbMz1E7XKWk2dnCxTr=gg@mail.gmail.com>
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
 David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Phil Elwell <phil@raspberrypi.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 linux-sunxi@lists.linux.dev,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--pwhi6bupdwzq7ldy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 17, 2022 at 03:05:52PM +0200, Geert Uytterhoeven wrote:
> Hi Maxime,
>=20
> On Wed, Aug 17, 2022 at 1:15 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > On Wed, Aug 17, 2022 at 10:35:07AM +0200, Geert Uytterhoeven wrote:
> > > On Wed, Aug 17, 2022 at 9:47 AM Maxime Ripard <maxime@cerno.tech> wro=
te:
> > > > On Wed, Aug 17, 2022 at 09:31:18AM +0200, Geert Uytterhoeven wrote:
> > > > > On Tue, Aug 16, 2022 at 5:50 PM Maxime Ripard <maxime@cerno.tech>=
 wrote:
> > > > > > On Tue, Aug 16, 2022 at 04:43:44PM +0200, Geert Uytterhoeven wr=
ote:
> > > > > > > > > > > Either you have to add them here (e.g. "hd720p50" and=
 "hd720p60"), or
> > > > > > > > > > > handle them through "@<refresh>".  The latter would i=
mpact "[PATCH v1
> > > > > > > > > > > 09/35] drm/modes: Move named modes parsing to a separ=
ate function", as
> > > > > > > > > > > currently a named mode and a refresh rate can't be sp=
ecified both.
> > > > > > > > > >
> > > > > > > > > > I think the former would make more sense. It simplifies=
 a bit the
> > > > > > > > > > parser, and we're going to use a named mode anyway.
> > > > > > > > > >
> > > > > > > > > > > As "[PATCH v1 34/35] drm/modes: Introduce the tv_mode=
 property as a
> > > > > > > > > > > command-line option" uses a separate "tv_mode" option=
, and not the main
> > > > > > > > > > > mode name, I think you want to add them here.
> > > > > > > > > >
> > > > > > > > > > It's a separate story I think, we could have a named mo=
de hd720p50,
> > > > > > > > > > which would be equivalent to 1280x720,tv_mode=3Dhd720p
> > > > > > > > >
> > > > > > > > > So where's the field rate in "1280x720,tv_mode=3Dhd720p"?
> > > > > > > >
> > > > > > > > Yeah, sorry I meant 1280x720@50,tv_mode=3Dhd720p
> > > > > > >
> > > > > > > Above you said "I think the former would make more sense", so=
 that
> > > > > > > should be "1280x720,tv_mode=3Dhd720p50"?
> > > > > >
> > > > > > No, 720p at 50Hz would be either hd720p50 or 1280x720@50,tv_mod=
e=3Dhd720p
> > > > > > and 60Hz would be hd720p60 or 1280x720@60,tv_mode=3Dhd720p
> > > > >
> > > > > I disagree: hd720p50 and hd720p60 are different TV modes.
> > > >
> > > > I agree, and I don't see how that command-line doesn't express that?
> > >
> > > Oh, I see what you mean: yes, it expresses that.
> > > But it is inconsistent with the NTSC/PAL/SECAM/hd{480,576}[ip] modes,
> > > where the TV mode specifies both number of lines and frame rate.
> >
> > Only if we're using a named mode, and naming is hard :)
>=20
> That's not true: "640x480,tv_mode=3DPAL-N" would give me a mode with
> 625 lines and 25 frames/s, "640x480,tv_mode=3DPAL-M" would give me a
> mode with 525 lines and 30 frames/s.

In that series, "640x480,tv_mode=3DPAL-N" would be rejected as invalid:

https://lore.kernel.org/dri-devel/20220728-rpi-analog-tv-properties-v1-14-3=
d53ae722097@cerno.tech/

Maxime

--pwhi6bupdwzq7ldy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYvzqvgAKCRDj7w1vZxhR
xevAAQDN39buWD69Y1UeITS4YCga5URhBHuCskbyb0E4+dbIUQD7BdiRmRfU6P3f
TcmNW67KPvbwkbPIv57K49HlmhcZ6AQ=
=egIl
-----END PGP SIGNATURE-----

--pwhi6bupdwzq7ldy--
