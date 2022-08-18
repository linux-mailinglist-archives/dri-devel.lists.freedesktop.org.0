Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A6B59868C
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 16:56:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8546A6B20;
	Thu, 18 Aug 2022 14:56:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3DB5A4ED0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 14:54:46 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 01D4F2B05FC5;
 Thu, 18 Aug 2022 10:54:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 18 Aug 2022 10:54:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1660834481; x=1660841681; bh=dPX9hXeCy6
 yKTnRmZoO6RMIl8noeu+daJnSyaEODPnQ=; b=ICKzLeV9qiOuOqiD3gZpMPLDAm
 VopW9x7Yud0hY2YkD1D1wPjg6LOPc+ccq6gPG0quHxhjhpsLPeF1o2Y9DhtgYaFh
 46BU7z1WbxqfeTsqgqHPq+GOxrupa0qDWX/Y2Syz4ZSiV6pSOHq358XmYyCIw2u/
 SmLzoGbsPKfUuh5lf80MIZkmUijMep9qslXjhZGwl1laHWrTdmBsTf6/1JYEMIVh
 aeUUYqFNm2zb8CzRmb3I4uh8c3rtrl3u1ieoM8t2Q10RwC0NlPPrcLXZPEyqqykB
 5KOwLeIZDnafnfciCbYT9WiVDncaHHoTmtWwbAGlTWt6j5dD5QIPyc/TycPA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1660834481; x=1660841681; bh=dPX9hXeCy6yKTnRmZoO6RMIl8noe
 u+daJnSyaEODPnQ=; b=VRnogI9eKVOUowQt1qjzRFHTEVI5kpt8dDDdSzKRC/X5
 bRgGe32rHxmxPVEAZvEEjVLuu6eV/s+xsvilUK4n/7KPF59XBiAnv8LNVLn9yRlH
 RRDvj94NOCXcycKGTJ48i3oaxWM63vqrPlUsP58PNd6tBYleZOQ0vyAMexcp+jud
 F/zLcankqKpacLDKmFn4iqLktv0pWE+Y1j+VC5KtOtOIBB17tSVXLKTMFevfL2ta
 s7yot5w4u0Q7dEs3sI8VWle5sFF2sOn7g7A7Bi6EHzOcBVU5hO7S0R4IOBM6j8qN
 4y8ZWX7ve1Kn3sTR7n0xf3lk6bHltGCDjfcS8WqiJw==
X-ME-Sender: <xms:sFL-YhD1iR7pj0Yea3FsE-PZysP7MkfhaiYuiAIJxWYeyqnwaPUuzA>
 <xme:sFL-YvjTnwUk4xVM3tgqFaDnB8s-Jmxeme0x6PPnQznCxQBw5S3bnhqQQ95vpJ6tv
 xpZvR35bwzGcVspkug>
X-ME-Received: <xmr:sFL-Yslofm3_AhDWt9NoeIe09vyXDlMi7thgA--2ltAGWDjj1FpNAPTf4w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehledgheeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedtleekjeeiudefvdfhieffteelhfeivdeliefgieeugffhvdelieffjeei
 geetjeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggt
 hh
X-ME-Proxy: <xmx:sFL-YryfJl1H-i55cxpYlVDJo45W3V68mSsAJFDUJIieouwnYwOhxg>
 <xmx:sFL-YmSviOJXIErg6esKHEGxNLf6O6TfDRKr42cuHW-M_WzeGPEm2A>
 <xmx:sFL-YuYh3SrgPZwP0YzRb13Wr36aefYYf6Ci8UjcN50At--92KdraA>
 <xmx:sVL-YlDXbjbFVR1olH2o2EIxq3hulc3Z6nPpQLXWxpzu7wpUBR5esrxYnjM>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 18 Aug 2022 10:54:39 -0400 (EDT)
Date: Thu, 18 Aug 2022 16:54:36 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v1 05/35] drm/connector: Add TV standard property
Message-ID: <20220818145436.vqojnhmvhjxdzooe@houat>
References: <20220816141116.5nuszmilqv2exdb3@houat>
 <CAMuHMdXq_xGPx46bdnUFGDiG4kcgdxtXaRGTucFd3TRq8353dg@mail.gmail.com>
 <20220816154956.pkdpxmmw27mia5ix@houat>
 <CAMuHMdX0L6cO_jYXKZTv0sm9V39Eiy_STiknSkdRQG4k-9GJeg@mail.gmail.com>
 <20220817074710.w4c4xwj7edly2b5p@houat>
 <CAMuHMdXeBakWr6geOWGxnjQYaU9Pi4tRvVFFtubyMJZTT2nPnw@mail.gmail.com>
 <20220817111454.pn2iltvyo2drebq7@houat>
 <CAMuHMdU57g1rNoLo65jhLK8mk4YkNEbMz1E7XKWk2dnCxTr=gg@mail.gmail.com>
 <20220817131854.jwmhqvhfhp77bbr3@houat>
 <CAMuHMdXrfH9MArXesfNCvqayiq17u7XaqtSvXTNt4V10=obSHQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="rgjjcrwq24n3fk6k"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXrfH9MArXesfNCvqayiq17u7XaqtSvXTNt4V10=obSHQ@mail.gmail.com>
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


--rgjjcrwq24n3fk6k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 17, 2022 at 04:04:24PM +0200, Geert Uytterhoeven wrote:
> Hi Maxime,
>=20
> On Wed, Aug 17, 2022 at 3:19 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > On Wed, Aug 17, 2022 at 03:05:52PM +0200, Geert Uytterhoeven wrote:
> > > On Wed, Aug 17, 2022 at 1:15 PM Maxime Ripard <maxime@cerno.tech> wro=
te:
> > > > On Wed, Aug 17, 2022 at 10:35:07AM +0200, Geert Uytterhoeven wrote:
> > > > > On Wed, Aug 17, 2022 at 9:47 AM Maxime Ripard <maxime@cerno.tech>=
 wrote:
> > > > > > On Wed, Aug 17, 2022 at 09:31:18AM +0200, Geert Uytterhoeven wr=
ote:
> > > > > > > On Tue, Aug 16, 2022 at 5:50 PM Maxime Ripard <maxime@cerno.t=
ech> wrote:
> > > > > > > > On Tue, Aug 16, 2022 at 04:43:44PM +0200, Geert Uytterhoeve=
n wrote:
> > > > > > > > > > > > > Either you have to add them here (e.g. "hd720p50"=
 and "hd720p60"), or
> > > > > > > > > > > > > handle them through "@<refresh>".  The latter wou=
ld impact "[PATCH v1
> > > > > > > > > > > > > 09/35] drm/modes: Move named modes parsing to a s=
eparate function", as
> > > > > > > > > > > > > currently a named mode and a refresh rate can't b=
e specified both.
> > > > > > > > > > > >
> > > > > > > > > > > > I think the former would make more sense. It simpli=
fies a bit the
> > > > > > > > > > > > parser, and we're going to use a named mode anyway.
> > > > > > > > > > > >
> > > > > > > > > > > > > As "[PATCH v1 34/35] drm/modes: Introduce the tv_=
mode property as a
> > > > > > > > > > > > > command-line option" uses a separate "tv_mode" op=
tion, and not the main
> > > > > > > > > > > > > mode name, I think you want to add them here.
> > > > > > > > > > > >
> > > > > > > > > > > > It's a separate story I think, we could have a name=
d mode hd720p50,
> > > > > > > > > > > > which would be equivalent to 1280x720,tv_mode=3Dhd7=
20p
> > > > > > > > > > >
> > > > > > > > > > > So where's the field rate in "1280x720,tv_mode=3Dhd72=
0p"?
> > > > > > > > > >
> > > > > > > > > > Yeah, sorry I meant 1280x720@50,tv_mode=3Dhd720p
> > > > > > > > >
> > > > > > > > > Above you said "I think the former would make more sense"=
, so that
> > > > > > > > > should be "1280x720,tv_mode=3Dhd720p50"?
> > > > > > > >
> > > > > > > > No, 720p at 50Hz would be either hd720p50 or 1280x720@50,tv=
_mode=3Dhd720p
> > > > > > > > and 60Hz would be hd720p60 or 1280x720@60,tv_mode=3Dhd720p
> > > > > > >
> > > > > > > I disagree: hd720p50 and hd720p60 are different TV modes.
> > > > > >
> > > > > > I agree, and I don't see how that command-line doesn't express =
that?
> > > > >
> > > > > Oh, I see what you mean: yes, it expresses that.
> > > > > But it is inconsistent with the NTSC/PAL/SECAM/hd{480,576}[ip] mo=
des,
> > > > > where the TV mode specifies both number of lines and frame rate.
> > > >
> > > > Only if we're using a named mode, and naming is hard :)
> > >
> > > That's not true: "640x480,tv_mode=3DPAL-N" would give me a mode with
> > > 625 lines and 25 frames/s, "640x480,tv_mode=3DPAL-M" would give me a
> > > mode with 525 lines and 30 frames/s.
> >
> > In that series, "640x480,tv_mode=3DPAL-N" would be rejected as invalid:
> >
> > https://lore.kernel.org/dri-devel/20220728-rpi-analog-tv-properties-v1-=
14-3d53ae722097@cerno.tech/
>=20
> It would become supported once the ideas from thread "[PATCH v1 04/35]
> drm/modes: Introduce 480i and 576i modes" are implemented...

Indeed, but I'm still not sure what your concern is here.
"640x480,tv_mode=3DPAL-N" and "640x480,tv_mode=3DPAL-M" are both fairly
obvious.

You were initially saying that you had concern over the inconsistency of
NTSC/PAL/SECAM where the TV mode would specify a number of lines and
frame rate, but hd720p50 also specifies a number of line and frame rate?

Maxime

--rgjjcrwq24n3fk6k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYv5SrAAKCRDj7w1vZxhR
xXOeAP4xRmnMVN7/AVY7/uaHcHK2PeXpYI7/wh8vab/NDtQGWAD+LBoFZbUfz3kt
HC6p3zpvWUaMbbbcZkWajF4mKGTE3QE=
=VOq1
-----END PGP SIGNATURE-----

--rgjjcrwq24n3fk6k--
