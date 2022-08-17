Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3495F596A8C
	for <lists+dri-devel@lfdr.de>; Wed, 17 Aug 2022 09:47:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA9A5112289;
	Wed, 17 Aug 2022 07:47:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 368001122AD
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 07:47:17 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 5BF862B0645B;
 Wed, 17 Aug 2022 03:47:14 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 17 Aug 2022 03:47:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1660722433; x=1660729633; bh=c10x6DPPH/
 zyhRLNi3d5jZ8ntKycPsFvNbbCBkCZ6Wg=; b=ZTdpXVPLY+Eom76PVAvHzJ9qgy
 wdAtZOnJHHp/TWy2k7Ss/kPsJwaq3mPMIp6LgJ6qk/hK+igzaiYy3CnfkbP37Td1
 SBGA0Hx3i+bo1jkW979K77o2HD6PGJRzo8fWxlNYTAgm7jflKHILXVkdAtFubj3V
 UQY8jOqPgP4oVAcL9ocxkagUbMtw4Thzc6OdvRW/d2IOe9XladHFPu+FB3a9elZW
 Q3A1TsclMmsVzWngkiTiwi05a4S/P26neuZg5ThqOTLepL4fh60tPRHNI6NzvIFX
 sMMZVjY0zQQn5UEpfb0wbUtjfkl5CZotikTLvslaPKxWT09qjDFl7ztk5h+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1660722433; x=1660729633; bh=c10x6DPPH/zyhRLNi3d5jZ8ntKyc
 PsFvNbbCBkCZ6Wg=; b=h6EBQs+anDCv314V5tPWR40hOWF/0dR5pskwb4J0Q4Ry
 FOlXHuSuBPAsFJu+Hiu1Jh4OHWDvJO2MsmoOikLYzJDtPsABIDAfQgvAwbe5l+5F
 CRwFv6NbKKviE5A/AsVyXr2rcINCTQlAA0TBcWQ+Xrpx0U+9lzopC2cFFDSTD9VJ
 07hYP907H0CO78oPa/p7nunsH5KsGKUSt0U9Fx+zzyjPnjXqnYhA3Wl6DkYYL4kF
 HmH+PfX1DMT45ZfQ0F/TJtOYAX/8eFzz/OTc9nzOOmJWV0gizOgcnMcF9gBx0mdt
 z1x8Jj0da9F6x+ymAUp4f5G2IXlCCJHV400yJVKHog==
X-ME-Sender: <xms:AJ38YiblzUP1RWksJLh4aZLuT0u2fEpF06LoPEGy4evFNwNRYRsFAg>
 <xme:AJ38YlbRiFWHfKPgmzIDi-4ahTYrlOOKBj7xSixixrgXIgSxzqQGxqRJwxGw5tMXe
 NupYaY7cfWJdh2ahlM>
X-ME-Received: <xmr:AJ38Ys-9_N0PDd1te12W0rhoZwWWRoZrT6DYZd6VlIyMLsEZSwiW6cH_cA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehhedguddvhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepteefffefgfektdefgfeludfgtdejfeejvddttdekteeiffejvdfgheeh
 fffhvedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:AJ38Yko33FgNJg2jsSaEZPwMB-XBjwWSRZnwZWGryB0dm-SA5qnpgg>
 <xmx:AJ38YtrK6w-U1n8XcoqyT_gn3BYeAwO6UOINBRQRK-j9rDT7vkA2Fg>
 <xmx:AJ38YiTXgy2fUErJVSR2T4zL-AOszZ_5-GfStWhXkDLH9d4ywIUKEA>
 <xmx:AZ38YmaKyuzgAxnIT_vbv7qFyOAwgX10VclP6NGlisLXOje2OeSiSjcNenM>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 17 Aug 2022 03:47:12 -0400 (EDT)
Date: Wed, 17 Aug 2022 09:47:10 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v1 05/35] drm/connector: Add TV standard property
Message-ID: <20220817074710.w4c4xwj7edly2b5p@houat>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-5-3d53ae722097@cerno.tech>
 <CAMuHMdWYo7M44uLNhTmJenGDreGALBZ9E48oyBDEeAuL=0h=dw@mail.gmail.com>
 <20220816132040.uwirtjm5yr6rdd3q@houat>
 <CAMuHMdWevP=3af=NneAJEDfOR+sz1thrQEhAQPNGrgitBtLjGA@mail.gmail.com>
 <20220816141116.5nuszmilqv2exdb3@houat>
 <CAMuHMdXq_xGPx46bdnUFGDiG4kcgdxtXaRGTucFd3TRq8353dg@mail.gmail.com>
 <20220816154956.pkdpxmmw27mia5ix@houat>
 <CAMuHMdX0L6cO_jYXKZTv0sm9V39Eiy_STiknSkdRQG4k-9GJeg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="j4epzi7aeysknnpu"
Content-Disposition: inline
In-Reply-To: <CAMuHMdX0L6cO_jYXKZTv0sm9V39Eiy_STiknSkdRQG4k-9GJeg@mail.gmail.com>
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


--j4epzi7aeysknnpu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 17, 2022 at 09:31:18AM +0200, Geert Uytterhoeven wrote:
> Hi Maxime,
>=20
> On Tue, Aug 16, 2022 at 5:50 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > On Tue, Aug 16, 2022 at 04:43:44PM +0200, Geert Uytterhoeven wrote:
> > > > > > > Either you have to add them here (e.g. "hd720p50" and "hd720p=
60"), or
> > > > > > > handle them through "@<refresh>".  The latter would impact "[=
PATCH v1
> > > > > > > 09/35] drm/modes: Move named modes parsing to a separate func=
tion", as
> > > > > > > currently a named mode and a refresh rate can't be specified =
both.
> > > > > >
> > > > > > I think the former would make more sense. It simplifies a bit t=
he
> > > > > > parser, and we're going to use a named mode anyway.
> > > > > >
> > > > > > > As "[PATCH v1 34/35] drm/modes: Introduce the tv_mode propert=
y as a
> > > > > > > command-line option" uses a separate "tv_mode" option, and no=
t the main
> > > > > > > mode name, I think you want to add them here.
> > > > > >
> > > > > > It's a separate story I think, we could have a named mode hd720=
p50,
> > > > > > which would be equivalent to 1280x720,tv_mode=3Dhd720p
> > > > >
> > > > > So where's the field rate in "1280x720,tv_mode=3Dhd720p"?
> > > >
> > > > Yeah, sorry I meant 1280x720@50,tv_mode=3Dhd720p
> > >
> > > Above you said "I think the former would make more sense", so that
> > > should be "1280x720,tv_mode=3Dhd720p50"?
> >
> > No, 720p at 50Hz would be either hd720p50 or 1280x720@50,tv_mode=3Dhd72=
0p
> > and 60Hz would be hd720p60 or 1280x720@60,tv_mode=3Dhd720p
>=20
> I disagree: hd720p50 and hd720p60 are different TV modes.

I agree, and I don't see how that command-line doesn't express that?

Maxime

--j4epzi7aeysknnpu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYvyc/gAKCRDj7w1vZxhR
xbYJAP4lo6uMsFFPTrsZHvEPpQ07NeUAWTRQuIXy05w+861pgAD/caEkBK1BcdYO
Ivf5+QCpwXLo3HITMUo8nRREVgKEiwc=
=haso
-----END PGP SIGNATURE-----

--j4epzi7aeysknnpu--
