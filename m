Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1AB75A4E1E
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 15:30:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE50510F2C7;
	Mon, 29 Aug 2022 13:30:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A163910F2C3
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 13:29:59 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 0A85D2B05A51;
 Mon, 29 Aug 2022 09:29:56 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 29 Aug 2022 09:29:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1661779796; x=1661786996; bh=HUh8yIUAsJ
 GdTvRqlTT3mYm7ABKsVcHBclO4qiURlnE=; b=B2iFD3eUvNPKHvzGFzDi2XNx/d
 iBq6zww4I3HAy5Yk7A4zNpxqnmPAM7SJLO3fto8JXC0xjdishAgV4DMcgCzN5uDJ
 7JIDto9/UJ8ZtlWUHhFCfglEptY02VGypomMGSdTANM06LjChgxhS+TZ9xzDfZed
 Dld1S0bakjM7kP42u6A314iAzssZ9U65mHPqLTOAQgTJwarzSdhuOSgHxi087sn0
 cLL+WLh+hZ54p0iWwwsaDrzw2b/tvjx9jii+r4ZWGEELeunY3sZT3VwehA90C91D
 YA/ub3i/1b0CAdL9/T1lR/jCEFj1TeIxknVWvYcTjm0TDPLkTNlIe2Xji2eQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1661779796; x=1661786996; bh=HUh8yIUAsJGdTvRqlTT3mYm7ABKs
 VcHBclO4qiURlnE=; b=IMqdGteFlSIG7qJYnrXnVkAFvGtsbUq6Vgoad8XQSDZT
 ekAeFS1XfOApy9f/QkYOUFoT0jnJ0NdaFdPfKuT0KAM3xkCweH7w24rIgos/JAoS
 GvZEkGF2c75vlgQqM65jKOMDgdF5cJV0somoteUwLsUKxX+4WXiAQE/lCdh6m/+d
 L6kbR2f0rxDy9gWeETuqbUwHnjvBjlEXlwDIlaMTH3ErJXI6LLu2CwZEO0HNhfCu
 zx9GbWoZSQNNHcjnm0ugTBe0dbyfYNkRbxX3WvTung8GdbsER6DtXKWlmAAclHAr
 q6qwvLV7ujrQcrr0sbCBVHyd5Fv7UudwKNz8uZZ+hg==
X-ME-Sender: <xms:VL8MY_wV9dU7wVnbyqaN9u7TfRdOJqya8CEzxAe2bCFGABU0uNnX8w>
 <xme:VL8MY3TgYF_D5BTNLXRKTWuf9Vet8dT9l4KulB3g5scnaPDSH6OR4_ZQyRudUD_lH
 6qtcQFJozCwoN8vaq4>
X-ME-Received: <xmr:VL8MY5UhOCBaLo42vO9TiirhCa9IUbAmXlusfZKZjf0Xa3cVptscz103utHI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdekuddgieejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvgfeivdeiueevuedtfeduleetveejjeeiffdukeduieevgedutdegtdfg
 teekgfenucffohhmrghinhepihhtuhdrihhnthdprghrtghhihhvvgdrohhrghdpfhhrvg
 gvshgvrhhvvgdrtghordhukhdpghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihii
 vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvg
 gthh
X-ME-Proxy: <xmx:VL8MY5iWUZb4A828x81TB4ZUmiWfYaBxNG7JBgOVwNJtNIcofFxveQ>
 <xmx:VL8MYxBzbS4MbtBxEmsatXAEDFwyv4TjmRTPF5i3dsL2GJYeMYMcDQ>
 <xmx:VL8MYyL6oI1RfJ6_e21gfI_es-4Cuel4qqcyFwySCixCPMKYZvcWWw>
 <xmx:VL8MYzzeeLQWUraaCt0CJQz-9HiUQoOduUn4gbDi41kYMWa2IF8sPkLnD54>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Aug 2022 09:29:55 -0400 (EDT)
Date: Mon, 29 Aug 2022 15:29:53 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Mateusz Kwiatkowski <kfyatek@gmail.com>
Subject: Re: [PATCH v1 04/35] drm/modes: Introduce 480i and 576i modes
Message-ID: <20220829132953.sfv5yex2dhv76vrq@houat>
References: <CAMuHMdUusnhYodWGCxJBu-1Hd2KW-xdT8jxE_iVdQjDo8b3Y5Q@mail.gmail.com>
 <20220817131454.qcuywcuc4ts4hswm@houat>
 <CAMuHMdVPEgnnsY-4uuf=FDJ0YxWpch-0kZWFT_TZfcDvXLtwWQ@mail.gmail.com>
 <20220818123934.eim2bfrgbxsmviqx@houat>
 <CAMuHMdWXbHkrBZgsmUnU=q52+q7UZZNO3tgQW7Men+msQ1JDwQ@mail.gmail.com>
 <20220818134200.cr22bftmjn226ehn@houat>
 <CAMuHMdX6dyQaB34oeXwiCa2rDkxks0qNh=ekqh7Wd2kSNED9TA@mail.gmail.com>
 <20220818154641.ouvrar5s74qu74zn@houat>
 <CAMuHMdUjE0mwu8z5AksW4h1OwzDCQ5h1ZoCWDi+rC4p2Pu5O4g@mail.gmail.com>
 <6d1dfaad-7310-a596-34dd-4a6d9aa95f65@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="nz5dkcjwrefuclw4"
Content-Disposition: inline
In-Reply-To: <6d1dfaad-7310-a596-34dd-4a6d9aa95f65@gmail.com>
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
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-sunxi@lists.linux.dev,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--nz5dkcjwrefuclw4
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mateusz

On Wed, Aug 24, 2022 at 06:42:18PM +0200, Mateusz Kwiatkowski wrote:
> Hi Maxime,
>=20
> W dniu 18.08.2022 o 17:56, Geert Uytterhoeven pisze:
> > Hi Maxime,
> >
> > On Thu, Aug 18, 2022 at 5:46 PM Maxime Ripard <maxime@cerno.tech> wrote:
> >> On Thu, Aug 18, 2022 at 05:34:30PM +0200, Geert Uytterhoeven wrote:
> >>> On Thu, Aug 18, 2022 at 3:42 PM Maxime Ripard <maxime@cerno.tech> wro=
te:
> >>>> I started adding more sanity checks to my code, and I just realised I
> >>>> don't seem to be able to reach 720 pixels over a single line though.=
 If
> >>>> I understood it properly, and according to [1] the active part of a =
line
> >>>> is supposed to be 51.95us, and the blanking period taking 12.05us. [=
2]
> >>>> in the timing section has pretty much the same numbers, so it looks
> >>>> sane.
> >>>>
> >>>> At 13.5Mhz, a pixel is going to take roughly 74ns, and 51950 / 74 =
=3D 702
> >>>> pixels
> >>>>
> >>>> It seems we can go push it to 52350 ns, but that still gives us only=
 706
> >>>> pixels.
> >>>>
> >>>> Similarly, if I just choose to ignore that limit and just take the
> >>>> active time I need, 720 * 74 =3D 53280ns
> >>>>
> >>>> That leaves us 10720ns for the blanking period, and that's not enoug=
h to
> >>>> fit even the minimum of the front porch, hsync and back porch (1.55 +
> >>>> 4.5 + 5.5 =3D 11.55us).
> >>>>
> >>>> Are those constraints merely recommendations, or am I missing someth=
ing?
> >>>
> >>> You are missing that the parts near the borders of the full image are
> >>> part of the overscan range, and may or may not be visible, depending
> >>> on your actual display.
> >>> The full 768x576 image size from BT.656 is not visible on a typical P=
AL display,
> >>> and is more of an "absolute maximum rating", guaranteed to cover more
> >>> than analog PAL.
> >>
> >> So the overscan range is not part of the active area, unlike what HDMI
> >> is doing for example?
> >
> > Indeed. DVI-D and HDMI etc. are pure digital (let's ignore they are a
> > digitized variant of old analog VGA ;-), hence there is a one-to-one
> > match between pixels in the image and pixels on the screen (ignoring
> > scaling).=A0 But even when using an analog VGA input on a modern
> > digital display, you have controls to e.g. move the image.
> >
> >> Is there some minimal timings available somewhere to fit those absolute
> >> maximum ratings?
> >
> > I guess they can be found on the Internet...
>=20
> Here are some references that I personally found useful:
>=20
> - ITU-R BT.601 <https://www.itu.int/rec/R-REC-BT.601/en>
> =A0 This is *the* standard that pretty much every modern device that deal=
s with
> =A0 analog-style TV signal follows then converting to and from the digita=
l domain.
> =A0 For example in the figures on page 10 (12 in the PDF numbering) you c=
an see
> =A0 that the "time datum", i.e. start of horizontal sync pulse is canonic=
ally
> =A0 supposed to happen on sample 732 for 50 Hz or sample 736 for 59.94 Hz=
 modes.
>=20
> =A0 BT.601 assumes 13.5 MHz sample rate / pixel clock, but you can propor=
tionally
> =A0 scale those for other pixel clocks.
>=20
> - ITU-R BT.1700 <https://www.itu.int/rec/R-REC-BT.1700/en>
> =A0 This is *the* standard in force for actual analog composite video sig=
nals.
> =A0 The vertical sync specs are discrete, so they don't really change bet=
ween
> =A0 analog and digital domains. For horizontal sync, the values in those =
specs
> =A0 are given in microseconds/nanoseconds, but you can multiply those by =
the
> =A0 sampling rate for equivalent pixel counts.
>=20
> - Pembers' Ponderings
> =A0 <https://web.archive.org/web/20160423225838/http://www.pembers.freese=
rve.co.uk/>
> =A0 An old archived website with a ton of resources about analog TV.
> =A0 The "Line Standards" article will probably be most interesting to you.

Thanks so much for all those resources, it's been super helpful :)

> By the way, please note a couple of things:
>=20
> - The analog standards are very imprecise for modern digital norms, giving
> =A0 considerable leeway for just about every timing. The allowed leeways =
are
> =A0 usually equivalent to a couple of pixels at the standard 13.5 MHz sam=
pling
> =A0 rate - and those are meant for the transmitting end. Receivers are us=
ually
> =A0 much more forgiving to maximize compatibility.

Ok

> - The 720-pixel standard of BT.601 is considerably wider than the active =
width
> =A0 specified in the analog standards. AFAIK this is intentional, to ensu=
re that
> =A0 no part of the actual image is missed during digitization, and to kee=
p the
> =A0 number a nice multiply of 16. The picture width given in the analog s=
tandards
> =A0 is equivalent to somewhere between 702 and 714 pixels (at 13.5 MHz cl=
ock),
> =A0 depending on the specific standard. And that includes overscan.

Ok. I think it still makes sense to allow it, if only we were using it so f=
ar :)

I've done a first implementation in the v2 I just sent that seems to
work ok, please let me know if I did anything stupid :)

In particular, I chose, if we were between 702 and 720 pixels to disable
all duration checks, and take the missing time from the front and back
porch, in equal proportions.

> - Same goes for the vertical active area. Original analog standards varied
> =A0 wildly from country to country, before finally settling on 575 lines =
for the
> =A0 50 Hz standard and 485 lines for the 59.94 Hz standard. Or 576/486, d=
epending
> =A0 on how you count. The topmost line of those 576/486 starts at half th=
e screen,
> =A0 and the bottommost line ends at half the screen - so they are often c=
ombined
> =A0 when counting and given as 575/485. The digital 576i50 standard inclu=
des
> =A0 those half-lines. In the 59.94 Hz regions, 480 active digial lines en=
ded up
> =A0 the norm, because 486 does not have nice dividers, and also some of t=
he
> =A0 outermost lines which were always overscanned anyway, ended up used f=
or things
> =A0 like closed captioning over the years.

Ok

> - Speaking of closed captioning... a lot of different stuff were put in t=
he
> =A0 blanking interval over the years. Like teletext in Europe. There are =
projects
> =A0 like VBIT2 <https://github.com/peterkvt80/vbit2> which intentionally
> =A0 reconfigure the Raspberry Pi composite output to include the blanking=
 interval
> =A0 in the framebuffer so that teletext can be output by drawing on the e=
dge of
> =A0 the "screen" (from the computer point of view).

I'm not sure how we would support this in KMS to be honest. Asking for a
wider mode and the userspace putting whatever it wants in the margins
seems like a good choice.

> - A lot of equipment outside the broadcast industry willingly violated th=
ose
> =A0 standards, and there are real world use cases for that. Film studios =
used very
> =A0 slightly modified TVs to make them sync with 24fps cameras - in that =
variant,
> =A0 "NTSC" could have e.g. 655 lines so that the TV would refresh at 48 H=
z with
> =A0 the same line frequency. Home computers and video game consoles output
> =A0 progressive 262/312-line modes instead of interlaced 525/625 lines. A=
nd often
> =A0 changed the line frequency slightly as well, for various reasons. Tho=
se
> =A0 progressive modes are still favored by retro gaming and emulation ent=
husiasts,
> =A0 because they incur a specific look on CRT displays. Even playing back=
 video
> =A0 from a tape (especially home-grade, like VHS) could cause timings to =
go wildly
> =A0 out of spec, because of mechanical imprecisions.

Ok

> - There were multitude of standards predating the ubiquitous 525/60 and 6=
25/50
> =A0 modes. The British 405-line and French 819-line standards are the most
> =A0 notorious, having lasted well into the 1980s, but there were also a l=
ot of
> =A0 wildly varying pre-WW2 television systems. And there are enthusiasts =
dedicated
> =A0 to preserving those.
>=20
> My point is that the norms for analog TV are rather loose, and I think we
> shouldn't limit the drivers to only accepting the "proper" modes as defin=
ed in
> the spec. Those should of course be the default, but if non-standard mode=
lines
> can be generated - there are legitimate use cases why people might want t=
hose.

Yep, that part has been dropped. I'm still wondering if we'd need to
still have a bunch of restrictions (like a total number of lines of 625
with NTSC would be obviously invalid), but that can always be added
later on if such a need comes up

Maxime

--nz5dkcjwrefuclw4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYwy/UQAKCRDj7w1vZxhR
xY42APwOsvncSxAfPJDjMsYPdJrF6RjZoxgtzLbD0q6LGfXtagEAtIeUVWPV593f
GH0C7Vn3rH5UvYiKN3hr1vPeZ6SUIQQ=
=Te78
-----END PGP SIGNATURE-----

--nz5dkcjwrefuclw4--
