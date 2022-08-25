Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1248D5A127D
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 15:39:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45A0710E0E7;
	Thu, 25 Aug 2022 13:39:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35EC010E0E7
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 13:39:45 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id F18DC5802D2;
 Thu, 25 Aug 2022 09:39:41 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 25 Aug 2022 09:39:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1661434781; x=1661441981; bh=xufXNQfWsW
 5YMPwr77PxDXziEf7hBPLQzvXQIo3+2+Y=; b=KRY3ZJmLUrz8S7afTCwjV+6oVP
 hTtlebvUk7hjY/8s8PwqdJ3R9Z0EwogT5IbBAVEgOBSZdEtrSbrxTFN7gEX61ztq
 cidK+o2bTLG8i+LOdAXUqS1tE4UryHbuz7CY1fbrzvsuPUUomb5r1A6txmAcTMpW
 dWs/kEzOME+WWG3iOdu/czo1E7VQBI0qFo5hTRu9UBxucz43OTruG8RdlfPshahK
 fsPYnLq/KywCkzc9uQgpaQxoFy5bDDDUOeTEipfnBiFLR4EXkGr2YTU4v/7UBKXG
 U6S9ryjKeoVFgO2SKJbMuuVo7c3bXNgvxwVvGAw5Ly9kTCz1DWnyeEycm7ag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1661434781; x=1661441981; bh=xufXNQfWsW5YMPwr77PxDXziEf7h
 BPLQzvXQIo3+2+Y=; b=RZH4Z4XZhMW0HQ0yV+K9lv2Xk6n+odMvjRg4xiem1unP
 y44V2lmeJSbc3J3Yf/Z58mYGcwKGkz/x4S0mRomdYq+JMe0Klp6+OpSo0D5oWp2g
 yQBPMbNY+RMZRW1tyrMPJp4zn+JFk4xCfVCdZVQMLnj0zMjU881wkyt0XZbxtxoM
 Sord2tDZWNYw4fXxTms0I7824hrZwosPGAWDWMDy+CU6/PRuutKgEcAMD5yU+pwR
 gq41cv3QRCbf+fp64eaTAAk32G7yPKeAyTtApBqz5HJWboB/D/pnpALfx4V6lIz2
 zItw1gBXht3MnRipo0H1OztZu77gosZPc9GL6fkmIA==
X-ME-Sender: <xms:nHsHY5s2vftPC2fJhSn4gpJtwz4fOESWnfOfu07gKIx-GB--5tQHqA>
 <xme:nHsHYyeeeTdDs9LacFBL_0S0SJboXaCpM-VBAeeXrSBiih5JMqSA-JsmCM3J1mag1
 6rd_v4k66_nMEfdVoA>
X-ME-Received: <xmr:nHsHY8y4M3jNYujUgbrqOFMIk7kslWNaitxFL2XvYpnemhsJeoz8sG8zazo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdejfedgieehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedtleekjeeiudefvdfhieffteelhfeivdeliefgieeugffhvdelieffjeei
 geetjeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggt
 hh
X-ME-Proxy: <xmx:nHsHYwNjAC9XUpKy3wxGujpnkTEOCb1wnSjXt5yLrjifYdyxOwQ0ew>
 <xmx:nHsHY5-eJnmHvThPIanhcforvzimJwOeDcU_e3GqzdNq3AhAHYe5pQ>
 <xmx:nHsHYwUAb-WC1XeDLe00NVdGozPbgF-GEgHoL__q6yTSs6zm03lKGg>
 <xmx:nXsHY1u6EAo8Vb9fzDWEOXCOGN4Su2VXt3qFk_It84MuFO_R8OQELw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 25 Aug 2022 09:39:39 -0400 (EDT)
Date: Thu, 25 Aug 2022 15:39:36 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v1 05/35] drm/connector: Add TV standard property
Message-ID: <20220825133936.gnpgdtx4jedei5a6@houat>
References: <20220817074710.w4c4xwj7edly2b5p@houat>
 <CAMuHMdXeBakWr6geOWGxnjQYaU9Pi4tRvVFFtubyMJZTT2nPnw@mail.gmail.com>
 <20220817111454.pn2iltvyo2drebq7@houat>
 <CAMuHMdU57g1rNoLo65jhLK8mk4YkNEbMz1E7XKWk2dnCxTr=gg@mail.gmail.com>
 <20220817131854.jwmhqvhfhp77bbr3@houat>
 <CAMuHMdXrfH9MArXesfNCvqayiq17u7XaqtSvXTNt4V10=obSHQ@mail.gmail.com>
 <20220818145436.vqojnhmvhjxdzooe@houat>
 <CAMuHMdW5kTUeg59fym7QxfN5oisTZHWbiAPeSYKJVShZWduJcA@mail.gmail.com>
 <20220818153442.u4knumkfbe7j6zj3@houat>
 <CAMuHMdUNYErf4PJLbSFFdB1EhvzbscqxHE74FnsjYQXLy8DLZA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="abetw7tfzbu2b4iz"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUNYErf4PJLbSFFdB1EhvzbscqxHE74FnsjYQXLy8DLZA@mail.gmail.com>
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


--abetw7tfzbu2b4iz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Aug 19, 2022 at 11:35:42AM +0200, Geert Uytterhoeven wrote:
> On Thu, Aug 18, 2022 at 5:34 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > On Thu, Aug 18, 2022 at 05:20:42PM +0200, Geert Uytterhoeven wrote:
> > > On Thu, Aug 18, 2022 at 4:54 PM Maxime Ripard <maxime@cerno.tech> wro=
te:
> > > > On Wed, Aug 17, 2022 at 04:04:24PM +0200, Geert Uytterhoeven wrote:
> > > > > On Wed, Aug 17, 2022 at 3:19 PM Maxime Ripard <maxime@cerno.tech>=
 wrote:
> > > > > > On Wed, Aug 17, 2022 at 03:05:52PM +0200, Geert Uytterhoeven wr=
ote:
> > > > > > > On Wed, Aug 17, 2022 at 1:15 PM Maxime Ripard <maxime@cerno.t=
ech> wrote:
> > > > > > > > On Wed, Aug 17, 2022 at 10:35:07AM +0200, Geert Uytterhoeve=
n wrote:
> > > > > > > > > On Wed, Aug 17, 2022 at 9:47 AM Maxime Ripard <maxime@cer=
no.tech> wrote:
> > > > > > > > > > On Wed, Aug 17, 2022 at 09:31:18AM +0200, Geert Uytterh=
oeven wrote:
> > > > > > > > > > > On Tue, Aug 16, 2022 at 5:50 PM Maxime Ripard <maxime=
@cerno.tech> wrote:
> > > > > > > > > > > > On Tue, Aug 16, 2022 at 04:43:44PM +0200, Geert Uyt=
terhoeven wrote:
> > > > > > > > > > > > > > > > > Either you have to add them here (e.g. "h=
d720p50" and "hd720p60"), or
> > > > > > > > > > > > > > > > > handle them through "@<refresh>".  The la=
tter would impact "[PATCH v1
> > > > > > > > > > > > > > > > > 09/35] drm/modes: Move named modes parsin=
g to a separate function", as
> > > > > > > > > > > > > > > > > currently a named mode and a refresh rate=
 can't be specified both.
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > I think the former would make more sense. I=
t simplifies a bit the
> > > > > > > > > > > > > > > > parser, and we're going to use a named mode=
 anyway.
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > As "[PATCH v1 34/35] drm/modes: Introduce=
 the tv_mode property as a
> > > > > > > > > > > > > > > > > command-line option" uses a separate "tv_=
mode" option, and not the main
> > > > > > > > > > > > > > > > > mode name, I think you want to add them h=
ere.
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > It's a separate story I think, we could hav=
e a named mode hd720p50,
> > > > > > > > > > > > > > > > which would be equivalent to 1280x720,tv_mo=
de=3Dhd720p
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > So where's the field rate in "1280x720,tv_mod=
e=3Dhd720p"?
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > Yeah, sorry I meant 1280x720@50,tv_mode=3Dhd720p
> > > > > > > > > > > > >
> > > > > > > > > > > > > Above you said "I think the former would make mor=
e sense", so that
> > > > > > > > > > > > > should be "1280x720,tv_mode=3Dhd720p50"?
> > > > > > > > > > > >
> > > > > > > > > > > > No, 720p at 50Hz would be either hd720p50 or 1280x7=
20@50,tv_mode=3Dhd720p
> > > > > > > > > > > > and 60Hz would be hd720p60 or 1280x720@60,tv_mode=
=3Dhd720p
> > > > > > > > > > >
> > > > > > > > > > > I disagree: hd720p50 and hd720p60 are different TV mo=
des.
> > > > > > > > > >
> > > > > > > > > > I agree, and I don't see how that command-line doesn't =
express that?
> > > > > > > > >
> > > > > > > > > Oh, I see what you mean: yes, it expresses that.
> > > > > > > > > But it is inconsistent with the NTSC/PAL/SECAM/hd{480,576=
}[ip] modes,
> > > > > > > > > where the TV mode specifies both number of lines and fram=
e rate.
> > > > > > > >
> > > > > > > > Only if we're using a named mode, and naming is hard :)
> > > > > > >
> > > > > > > That's not true: "640x480,tv_mode=3DPAL-N" would give me a mo=
de with
> > > > > > > 625 lines and 25 frames/s, "640x480,tv_mode=3DPAL-M" would gi=
ve me a
> > > > > > > mode with 525 lines and 30 frames/s.
> > > > > >
> > > > > > In that series, "640x480,tv_mode=3DPAL-N" would be rejected as =
invalid:
> > > > > >
> > > > > > https://lore.kernel.org/dri-devel/20220728-rpi-analog-tv-proper=
ties-v1-14-3d53ae722097@cerno.tech/
> > > > >
> > > > > It would become supported once the ideas from thread "[PATCH v1 0=
4/35]
> > > > > drm/modes: Introduce 480i and 576i modes" are implemented...
> > > >
> > > > Indeed, but I'm still not sure what your concern is here.
> > > > "640x480,tv_mode=3DPAL-N" and "640x480,tv_mode=3DPAL-M" are both fa=
irly
> > > > obvious.
> > > >
> > > > You were initially saying that you had concern over the inconsisten=
cy of
> > > > NTSC/PAL/SECAM where the TV mode would specify a number of lines and
> > > > frame rate, but hd720p50 also specifies a number of line and frame =
rate?
> > >
> > > My concern is that you want to call the TV mode "hd720p", which
> > > does not dictate the frame rate.
> > > I would like to have both "720p50" and "720p60", as they do dictate
> > > the frame rate, like all the non-hd modes.
> >
> > But they don't?
> >
> > The refresh rate is part of the drm_display_mode, whereas that property
> > is metadata and entirely separate from the display mode.
> >
> > You can even change it without changing the mode at all
>=20
> Yes, the refresh rate is part of drm_display_mode.  Vdisplay also
> is, but that doesn't mean you can set it to e.g. 700 when using
> "tv_mode=3DPAL-B". Some (combination of) parameters in drm_display_mode
> are dictated by the tv_mode.

But the opposite is also true: PAL-B and SECAM-B would be two different
TV mode, but (could) have the same display mode.

There's no equivalence or implication in that relationship, except for a
smaller set of those parameters. But it's the entire display mode that
we should compare.

> Perhaps the meaning of "tv_mode" should be clarified? What does it
> really mean, and what parameters does it (not) constrain?

As far as I'm concerned, it's only about the encoding. We can check
after the fact that, say, you don't try to use a mode line with than 525
lines and some NTSC variant, but the mode has precedence over the
property.

> For e.g. "PAL-B", I know it's a mode with 625 lines and 30 frames/s
> (60 fields/s).
> For "hd720p" I know it is an analog mode with 750 lines, but it's still
> ambiguous, as I don't know if it is the variant with 60 or 50 frames/s.

As far as the TV mode property is concerned, it doesn't encode neither
whether it has 750 lines, nor the refresh rate.

If you're talking about a named mode, then yeah, it's basically an alias
for a mode + a property, so it does, but we can choose names that aren't
ambiguous.

Maxime

--abetw7tfzbu2b4iz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYwd7mAAKCRDj7w1vZxhR
xZkBAQDrEXnDTiQIDw7WVDdGrymHTzA68O6aoUE0nXlp+5E0EAEAzwBa5cUcNh9j
iMwk3ETvnvqMbV5kyg5f+gPHMuMLswM=
=NZmB
-----END PGP SIGNATURE-----

--abetw7tfzbu2b4iz--
