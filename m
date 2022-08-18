Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8219A598793
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 17:35:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41570BAE45;
	Thu, 18 Aug 2022 15:35:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 958DE18A2BE
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 15:34:48 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id E71C52B05E12;
 Thu, 18 Aug 2022 11:34:45 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 18 Aug 2022 11:34:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1660836885; x=1660844085; bh=GAUFg7YBUW
 3KZkhSrcZm39FqAMhooeWFavdqBj/boSc=; b=S2d51Isqq1Zfi+AxajatuXg8ye
 15pL9Ze1gddbSMyun1wfS4cpEKeWIg4QYxg+xB0iFEfetn6vHYqxlf9WzmGGlN+s
 TZeMN7EQp1GkuStXBnZG2qlTccm/X0PyJGud3p7yM4we7DLrGm8Jc+3ApxtbKo/+
 oRilxp1otV1Cs0FMSDy/TtSuG0zWrrwGG+cE//gT5H8nuKD6eLXrW1yuFpKXzhzh
 FW+C+gqSSGisQR79QdKt3IGOX74xDqhW+Dg6FS98tGt/7FEXDb+TC497+mHp3Wvu
 jjBF2cpTN/VZh7sjofWUHdRAkdxgOo5ZG0aHPNctYFZ+VNxh6RXq+H6FhtOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1660836885; x=1660844085; bh=GAUFg7YBUW3KZkhSrcZm39FqAMho
 oeWFavdqBj/boSc=; b=Kxp5Lqvz6W8BPZZDJaChn+WcunwvHAs4cXxk2ZFCRpvL
 aT3+o9AcUrC8ErQZQV+kv2UUd/cXjqJB2OsnxNHU+hrtzDhOAJMp4nL/nkTVn+cn
 8Fbockon/GbHKurPtThGGaGw3Q2D8K93WX1jv+OPq0HgUJgCIfVKuDNWRZU8qdBp
 T8dD5c1L6YpEiKRFd410q6fiT9N//vW6a7kweZBnAVv2xLMB2u5bvmcmqkrElLuL
 zw8YK4aMx1w2/Kpe/fJ498Xv7NcbRt9K6S7u2eod5uPv3tcJ2o4D3co6M0dAE9AM
 ORR5ViHu7KGwjv7gjBzjr1QZTFQo9PKkxeYU3HuAgA==
X-ME-Sender: <xms:FVz-Yug9FW1woL7geWS8qqmoJDRnUp2aHH8FWOvGDW9X1lXHCPKRIA>
 <xme:FVz-YvDnfxGsKJFIlVW5CFZUSRqHguTsiMW5PcPFcZpHPkKBr43UIuUSY_i0LUdUR
 -UPlqpeAAdNhcDiAgQ>
X-ME-Received: <xmr:FVz-YmG5d0ZOMXF9BX3k7krzrQewCtIz5ufXWSmnn5wtrZ5TVJpwJBHKZQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehledgieehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedtleekjeeiudefvdfhieffteelhfeivdeliefgieeugffhvdelieffjeei
 geetjeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggt
 hh
X-ME-Proxy: <xmx:FVz-YnSA1tnju4aJHmcDxqgaCg3kxgbqJmQmatK29GNwFAYvcrOnbQ>
 <xmx:FVz-Yryt8Lby_Lowy0-0hF0VUexMokyzkCzIMKWWqHs-NuY9_dz17w>
 <xmx:FVz-Yl59x9JsMTie6vtN2IWfBwScA_VRZXPWWvzDgiavVT6Gj1TLIA>
 <xmx:FVz-YihsR4wuttjVpHMeeXUZHnq2FrLkRyXyJv6xL_QIAttgzO9q2sMHQR0>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 18 Aug 2022 11:34:44 -0400 (EDT)
Date: Thu, 18 Aug 2022 17:34:42 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v1 05/35] drm/connector: Add TV standard property
Message-ID: <20220818153442.u4knumkfbe7j6zj3@houat>
References: <20220816154956.pkdpxmmw27mia5ix@houat>
 <CAMuHMdX0L6cO_jYXKZTv0sm9V39Eiy_STiknSkdRQG4k-9GJeg@mail.gmail.com>
 <20220817074710.w4c4xwj7edly2b5p@houat>
 <CAMuHMdXeBakWr6geOWGxnjQYaU9Pi4tRvVFFtubyMJZTT2nPnw@mail.gmail.com>
 <20220817111454.pn2iltvyo2drebq7@houat>
 <CAMuHMdU57g1rNoLo65jhLK8mk4YkNEbMz1E7XKWk2dnCxTr=gg@mail.gmail.com>
 <20220817131854.jwmhqvhfhp77bbr3@houat>
 <CAMuHMdXrfH9MArXesfNCvqayiq17u7XaqtSvXTNt4V10=obSHQ@mail.gmail.com>
 <20220818145436.vqojnhmvhjxdzooe@houat>
 <CAMuHMdW5kTUeg59fym7QxfN5oisTZHWbiAPeSYKJVShZWduJcA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="zlk7q2pcgbstxof7"
Content-Disposition: inline
In-Reply-To: <CAMuHMdW5kTUeg59fym7QxfN5oisTZHWbiAPeSYKJVShZWduJcA@mail.gmail.com>
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


--zlk7q2pcgbstxof7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 18, 2022 at 05:20:42PM +0200, Geert Uytterhoeven wrote:
> Hi Maxime,
>=20
> On Thu, Aug 18, 2022 at 4:54 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > On Wed, Aug 17, 2022 at 04:04:24PM +0200, Geert Uytterhoeven wrote:
> > > On Wed, Aug 17, 2022 at 3:19 PM Maxime Ripard <maxime@cerno.tech> wro=
te:
> > > > On Wed, Aug 17, 2022 at 03:05:52PM +0200, Geert Uytterhoeven wrote:
> > > > > On Wed, Aug 17, 2022 at 1:15 PM Maxime Ripard <maxime@cerno.tech>=
 wrote:
> > > > > > On Wed, Aug 17, 2022 at 10:35:07AM +0200, Geert Uytterhoeven wr=
ote:
> > > > > > > On Wed, Aug 17, 2022 at 9:47 AM Maxime Ripard <maxime@cerno.t=
ech> wrote:
> > > > > > > > On Wed, Aug 17, 2022 at 09:31:18AM +0200, Geert Uytterhoeve=
n wrote:
> > > > > > > > > On Tue, Aug 16, 2022 at 5:50 PM Maxime Ripard <maxime@cer=
no.tech> wrote:
> > > > > > > > > > On Tue, Aug 16, 2022 at 04:43:44PM +0200, Geert Uytterh=
oeven wrote:
> > > > > > > > > > > > > > > Either you have to add them here (e.g. "hd720=
p50" and "hd720p60"), or
> > > > > > > > > > > > > > > handle them through "@<refresh>".  The latter=
 would impact "[PATCH v1
> > > > > > > > > > > > > > > 09/35] drm/modes: Move named modes parsing to=
 a separate function", as
> > > > > > > > > > > > > > > currently a named mode and a refresh rate can=
't be specified both.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > I think the former would make more sense. It si=
mplifies a bit the
> > > > > > > > > > > > > > parser, and we're going to use a named mode any=
way.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > > As "[PATCH v1 34/35] drm/modes: Introduce the=
 tv_mode property as a
> > > > > > > > > > > > > > > command-line option" uses a separate "tv_mode=
" option, and not the main
> > > > > > > > > > > > > > > mode name, I think you want to add them here.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > It's a separate story I think, we could have a =
named mode hd720p50,
> > > > > > > > > > > > > > which would be equivalent to 1280x720,tv_mode=
=3Dhd720p
> > > > > > > > > > > > >
> > > > > > > > > > > > > So where's the field rate in "1280x720,tv_mode=3D=
hd720p"?
> > > > > > > > > > > >
> > > > > > > > > > > > Yeah, sorry I meant 1280x720@50,tv_mode=3Dhd720p
> > > > > > > > > > >
> > > > > > > > > > > Above you said "I think the former would make more se=
nse", so that
> > > > > > > > > > > should be "1280x720,tv_mode=3Dhd720p50"?
> > > > > > > > > >
> > > > > > > > > > No, 720p at 50Hz would be either hd720p50 or 1280x720@5=
0,tv_mode=3Dhd720p
> > > > > > > > > > and 60Hz would be hd720p60 or 1280x720@60,tv_mode=3Dhd7=
20p
> > > > > > > > >
> > > > > > > > > I disagree: hd720p50 and hd720p60 are different TV modes.
> > > > > > > >
> > > > > > > > I agree, and I don't see how that command-line doesn't expr=
ess that?
> > > > > > >
> > > > > > > Oh, I see what you mean: yes, it expresses that.
> > > > > > > But it is inconsistent with the NTSC/PAL/SECAM/hd{480,576}[ip=
] modes,
> > > > > > > where the TV mode specifies both number of lines and frame ra=
te.
> > > > > >
> > > > > > Only if we're using a named mode, and naming is hard :)
> > > > >
> > > > > That's not true: "640x480,tv_mode=3DPAL-N" would give me a mode w=
ith
> > > > > 625 lines and 25 frames/s, "640x480,tv_mode=3DPAL-M" would give m=
e a
> > > > > mode with 525 lines and 30 frames/s.
> > > >
> > > > In that series, "640x480,tv_mode=3DPAL-N" would be rejected as inva=
lid:
> > > >
> > > > https://lore.kernel.org/dri-devel/20220728-rpi-analog-tv-properties=
-v1-14-3d53ae722097@cerno.tech/
> > >
> > > It would become supported once the ideas from thread "[PATCH v1 04/35]
> > > drm/modes: Introduce 480i and 576i modes" are implemented...
> >
> > Indeed, but I'm still not sure what your concern is here.
> > "640x480,tv_mode=3DPAL-N" and "640x480,tv_mode=3DPAL-M" are both fairly
> > obvious.
> >
> > You were initially saying that you had concern over the inconsistency of
> > NTSC/PAL/SECAM where the TV mode would specify a number of lines and
> > frame rate, but hd720p50 also specifies a number of line and frame rate?
>=20
> My concern is that you want to call the TV mode "hd720p", which
> does not dictate the frame rate.
> I would like to have both "720p50" and "720p60", as they do dictate
> the frame rate, like all the non-hd modes.

But they don't?

The refresh rate is part of the drm_display_mode, whereas that property
is metadata and entirely separate from the display mode.

You can even change it without changing the mode at all

Maxime

--zlk7q2pcgbstxof7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYv5cEgAKCRDj7w1vZxhR
xY/lAP4ouRoHdY9bHKZSp+wtASk8iZSUl11mDM3E2bLvkDHbXwEAlugNW44dB/5n
SVBu8xcbWOl4IqoJVVeIxrn04MiX3ww=
=N3ll
-----END PGP SIGNATURE-----

--zlk7q2pcgbstxof7--
