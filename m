Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9995987BA
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 17:47:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81A88B6091;
	Thu, 18 Aug 2022 15:47:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB60BBBBBC
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 15:46:47 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 43BD22B05E43;
 Thu, 18 Aug 2022 11:46:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 18 Aug 2022 11:46:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1660837604; x=1660844804; bh=b+/4XKYZvC
 QW1iIK8ho6QWAG+uMl9W6+CRBA3Lg1ULk=; b=GPte4KZl6gvUcVzP4rOaqokssj
 N62gm4Y81chhoe1qqWXYqlQPuEp24xTqIfFHeEnT9LYtqHD0prLS0j+JUy4tqT9Q
 ghDmFlMgpNK10YYofgLnuqKxveTifY30oWdevHy61vDNatV4739RJffrqbzviitH
 IjlRTXD9Ezk7jPYizMdBAO4kvC8KeNjte1W88Ib3mCDp3VvJtAwYJlWWoZs04lDK
 FmV92lzTBbER7qejG2BiODlxwNiUHoUCl5WJNMtCTpvtRMLswCgejS/W9HfPIm68
 Zmz4+erOHT0fG69niqxqi+o2PQK4p/6txhwqtqo8ylL2Ons+jThAp79ocuuw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1660837604; x=1660844804; bh=b+/4XKYZvCQW1iIK8ho6QWAG+uMl
 9W6+CRBA3Lg1ULk=; b=jy1wv7CjN8hvToyslWcw4PYz/wak4/e3Jcl7hzgs34wn
 HBp+2wBNpeQeNaBg74HdLfJ3MkaMM1w1ejwv16Ljau6swbXywFaSx8KCxNGTrz6z
 8tAvqFWIirGcQgN0kxfReORpacj0rTmB8N5ny4e3bPBz5uokLPczb1EyrQONtYHX
 gg/3ntVdEWM++5S5eG8DuNwBczlv471cI0lrnb8o3FvwT3PSw9Cd9Dn++UeSatcM
 dnXl9bvgl0YCB2ledBn2csbFisqZxFjWrnXngKw4nicwRUJimQkWp/vSQfDdbLYZ
 lYgaJo5ukPNOlvhyo89k1ErTLh3v+cUuXLFx89F1MQ==
X-ME-Sender: <xms:5F7-YsdKfLf1Hnfne8G0HpMIUO9QFzxk6n-BWQd1xCkCKAHj6yui9g>
 <xme:5F7-YuO8hJQMJC1OOW9zHEJ-bWbTEHU3jL4qJq8zwLMafHUVOySDnnt8ehLNSx9yV
 qSFb_h08tOJ0moE7VM>
X-ME-Received: <xmr:5F7-Yti23HBei2YZv5zGw0QSOE5uSHrTYIfCRNMrXXzeiNWUoRdnAje3-g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehledgieejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvfeevudfgvefhtdefjedtfeelheeigfeghfeijedvgfegffevkefggfff
 ueejtdenucffohhmrghinhephhhinhhnvghrrdhinhhfohenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgv
 tghh
X-ME-Proxy: <xmx:5F7-Yh9WQ349UQyeMzksSjhtH4CNCjK_7dYZTwJX4SxtgLdsqHQiLw>
 <xmx:5F7-YotJ48Sukch-wll9jtdSYExrM6WZxPguR5FFfaVMvftScRX7MA>
 <xmx:5F7-YoHO49-59NmWiw-yH6yl3jKodG5uH5exiwiX8gp9azB45nqcEw>
 <xmx:5F7-YodUqffBbzJBsUaZ3VFbS5pOzguMKw_CIidNnLoWhne9ydim6wg7UR4>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 18 Aug 2022 11:46:43 -0400 (EDT)
Date: Thu, 18 Aug 2022 17:46:41 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v1 04/35] drm/modes: Introduce 480i and 576i modes
Message-ID: <20220818154641.ouvrar5s74qu74zn@houat>
References: <20220816132636.3tmwqmrox64pu3lt@houat>
 <CAMuHMdUNLPbjs=usYQBim5FxsrC1oJLuF+3JB7auzHHRoOqavQ@mail.gmail.com>
 <20220817075351.4xpsqdngjgtiqvob@houat>
 <CAMuHMdUusnhYodWGCxJBu-1Hd2KW-xdT8jxE_iVdQjDo8b3Y5Q@mail.gmail.com>
 <20220817131454.qcuywcuc4ts4hswm@houat>
 <CAMuHMdVPEgnnsY-4uuf=FDJ0YxWpch-0kZWFT_TZfcDvXLtwWQ@mail.gmail.com>
 <20220818123934.eim2bfrgbxsmviqx@houat>
 <CAMuHMdWXbHkrBZgsmUnU=q52+q7UZZNO3tgQW7Men+msQ1JDwQ@mail.gmail.com>
 <20220818134200.cr22bftmjn226ehn@houat>
 <CAMuHMdX6dyQaB34oeXwiCa2rDkxks0qNh=ekqh7Wd2kSNED9TA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="asnvi4arox2gwpwk"
Content-Disposition: inline
In-Reply-To: <CAMuHMdX6dyQaB34oeXwiCa2rDkxks0qNh=ekqh7Wd2kSNED9TA@mail.gmail.com>
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


--asnvi4arox2gwpwk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 18, 2022 at 05:34:30PM +0200, Geert Uytterhoeven wrote:
> On Thu, Aug 18, 2022 at 3:42 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > On Thu, Aug 18, 2022 at 02:57:55PM +0200, Geert Uytterhoeven wrote:
> > > On Thu, Aug 18, 2022 at 2:39 PM Maxime Ripard <maxime@cerno.tech> wro=
te:
> > > > On Wed, Aug 17, 2022 at 04:01:48PM +0200, Geert Uytterhoeven wrote:
> > > > > > I've looked around and it looks like the entire blanking area is
> > > > > > supposed to be 40 pixels in interlaced, but I couldn't find any=
where how
> > > > >
> > > > > 625 lines - 575[*] visible lines =3D 50 lines.
> > > > >
> > > > > [*] BT.656 uses 576 visible lines as that's a multiple of 2, for =
splitting
> > > > >      a frame in two fields of equal size.
> > > > >
> > > > > "visible" is relative, as it includes the overscan region.
> > > > > Some PAL monitors used with computers had knobs to control width/=
height
> > > > > and position of the screen, so you could make use of most or all =
of
> > > > > the overscan region
> > > >
> > > > It brings back some memories :)
> > > >
> > > > > but on a real TV you're limited to ca. 640x512 (on PAL) which is =
what
> > > > > an Amiga used by default (with a 14 MHz pixclock).
> > > >
> > > > > > it's supposed to be split between the upper and lower margins a=
nd the
> > > > > > sync period.
> > > > >
> > > > > "Field Synchronization of PAL System" on
> > > > > http://martin.hinner.info/vga/pal.html shows the split.
> > > >
> > > > Thanks, that's excellent as well.
> > > >
> > > > I'm mostly done with a function that creates a PAL mode, but I still
> > > > have one question.
> > > >
> > > > If I understand well, the blanking period is made up (interlace) of=
 16
> > > > pulses for the first field, 14 for the second, each pulse taking ha=
lf a
> > > > line. That amount to 30 pulses, so 15 lines.
> > > >
> > > > I first assumed that the pre-equalizing pulses would be the back po=
rch,
> > > > the long sync pulses the vsync, and the post-equalizing pulses the =
front
> > > > porch. But... we're still missing 35 lines to amount to 625 lines, =
that
> > > > seems to be counted in the field itself (305 lines =3D=3D (575 + 35=
) / 2)
> > > >
> > > > So I guess my assumption was wrong to begin with.
> > >
> > > The back porch is the number of lines between the last "visible" line
> > > and the start of the synchronization pulse, i.e. "l" in the "Field
> > > Synchronization of PAL System" drawing.
> > > Virtual sync length is "m".
> > > The front porch is the number of lines between the end of
> > > the synchronization pulse, and the first "visible" line, i.e.
> > > "j - l - m" (I think you used "n", thus missing lines 6-23 and 319-33=
5).
> >
> > Ah, yes, that makes sense
> >
> > > > You seem to have used a fixed vsync in amifb to 4 lines, and I don't
> > >
> > > Actually "m" is 2.5 lines in the first field, and 3 lines in the seco=
nd field,
> > > so "4" is not that much off of 2.5 + 3.
> >
> > Is it? If I'm reading that drawing well, l before the first field starts
> > on the second half of line 623 and stops at the end of line 625, so 2.5
> > line, and on the second field starts at the beginning of line 311, and
> > stops half-way through 313 so 2.5 line again.
> >
> > Then, for the first field, m starts at the beginning of line 1, stops
> > half-way through line 3, so 2.5 line indeed, and then on the second
> > field starts on the second half of 313 and stops at the end of line 315.
> > So 2.5 again?
> >
> > Thus, both should be 5?
>=20
> Possibly. Note that this for the official broadcast PAL.
>=20
> I never looked at these signals with a scope, but I wouldn't be
> surprised if some
> device on't bother implementing the "half-line-sync", and synchronize
> the start and stop of the vertical
> sync signal with the start of a horizontal.

Yeah... official PAL looks like a good enough target to me :)

We'll always be able to tweak it if needed later on.

> > > > understand how you come up with the upper and lower margins (or rat=
her,
> > > > how they are linked to what's described in that page)
> > >
> > > These margins probably came from the Amiga hardware reference manual,
> > > for the default 640x512 (PAL) and 640x400 (NTSC) modes.
> >
> > Ok.
> >
> > I started adding more sanity checks to my code, and I just realised I
> > don't seem to be able to reach 720 pixels over a single line though. If
> > I understood it properly, and according to [1] the active part of a line
> > is supposed to be 51.95us, and the blanking period taking 12.05us. [2]
> > in the timing section has pretty much the same numbers, so it looks
> > sane.
> >
> > At 13.5Mhz, a pixel is going to take roughly 74ns, and 51950 / 74 =3D 7=
02
> > pixels
> >
> > It seems we can go push it to 52350 ns, but that still gives us only 706
> > pixels.
> >
> > Similarly, if I just choose to ignore that limit and just take the
> > active time I need, 720 * 74 =3D 53280ns
> >
> > That leaves us 10720ns for the blanking period, and that's not enough to
> > fit even the minimum of the front porch, hsync and back porch (1.55 +
> > 4.5 + 5.5 =3D 11.55us).
> >
> > Are those constraints merely recommendations, or am I missing something?
>=20
> You are missing that the parts near the borders of the full image are
> part of the overscan range, and may or may not be visible, depending
> on your actual display.
> The full 768x576 image size from BT.656 is not visible on a typical PAL d=
isplay,
> and is more of an "absolute maximum rating", guaranteed to cover more
> than analog PAL.

So the overscan range is not part of the active area, unlike what HDMI
is doing for example?

Is there some minimal timings available somewhere to fit those absolute
maximum ratings?

Maxime

--asnvi4arox2gwpwk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYv5e4QAKCRDj7w1vZxhR
xdoZAQCbqkPywoyDbtajYaiOHUV0j7a0MU8PppJpqkU6bEekJwD+LOGb9NiLuLPY
A19L6AEdMVCgURJ3CwdOZElsdjus2gw=
=rYCU
-----END PGP SIGNATURE-----

--asnvi4arox2gwpwk--
