Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED90598471
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 15:42:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 154FA97C20;
	Thu, 18 Aug 2022 13:42:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E772A5322
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 13:42:10 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 2FD8A2B05FEE;
 Thu, 18 Aug 2022 09:42:05 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 18 Aug 2022 09:42:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1660830124; x=1660837324; bh=HQC2uQh9jT
 R5zuhwO9XMFeqtwLctTZY2rM1W/lF/1i0=; b=ltryRsjYqi1O97i1fEor/8CUH0
 eV9s5UGSADqzroBSY3eVnDaNvBwGKasz2b6MSimH5N8JxjAHhclmoLCVeG2qq0wp
 HLHzV9DhvCJ3jRXKcz7GHj8jeKKYEV6oNRFk8Cy90HbGMlwn55on0oDpCq2I7gSq
 H5ZCs5qUCFGQWPfB2FqkmYBH14oorz13RRNzkzanntYz4hgr7Cn6EJlU6h3UofJp
 Bzca/XJh+tTvIXS3S3kJS2pEKzzr8B6O8DU617LOsJHMVAKK1gyxHUsuiijkPOnt
 TbNraVdN+DcqZmbKHyiv9XvUngyfSM5UdQ1LMdIC1N8BwekRI/zOEzazf5Tw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1660830124; x=1660837324; bh=HQC2uQh9jTR5zuhwO9XMFeqtwLct
 TZY2rM1W/lF/1i0=; b=CQPiA58vVLxmJMqggX/oIptmnHPvW6R1i8JljDcmqS+a
 j/YU5Gm8+tGP++JlUpAb4CoSmBlBn8iFVO4FRt1G/7hHFapMqA4gPQgIvy7iL5h6
 h/DKzE36elER5UwM6HrASreqJ8DP/2WplprYmAIg9Mtu5NPrtJ/qnvigT3Au5vBc
 s2iqHi9JVXZy2dCgKq6obmD84xwwT0nESJyDGuzcgyleFf0q9Bz/p+GAKUoatobb
 UEU7qhhxr5tFlcIFLerlP2ywHlX2c/bkhCL7lFyFjj9kyq74Ncy/q9zisxk6q/WJ
 G98p0o/JRuuPXUZywqFAjoHexcDQw/yWPs+bB5NfbA==
X-ME-Sender: <xms:q0H-YqFScjGApQHr1t9NPfOW6jXu0Ht7RJ7pYAKNqcp792Tfl5CrSQ>
 <xme:q0H-YrXwS9bjjtG2rVpl6H0MFXLkZb_DGpsJraUkz0Oa5h7cL1CKIykNFjGjPmXnv
 AWJKhbsRKiUHMidAZE>
X-ME-Received: <xmr:q0H-YkJz1Ew2cwLeqlmQieun19musfq4H_o7hUWkKIuX-MQNVZM05h7elg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehledggedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeevkefhveeffeeiuedtiedttdfhjeeiteefffegieeijeeigfelhfeltdei
 leejfeenucffohhmrghinhephhhinhhnvghrrdhinhhfohdpfihikhhiphgvughirgdroh
 hrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehm
 rgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:q0H-YkHLvVd0vNeO52JIGs1NtlThexGXIEADSZoOPDL575edFWcYMg>
 <xmx:q0H-YgW1m9qStfkuJ2P2HlYCYL4Z-7LCXxhcxUpcQqpuvNfKXF_QxQ>
 <xmx:q0H-YnMtcbBDfpQIyoNiIFYLprA9hkiGq6kgzn7ppeMOkqycmyZu1w>
 <xmx:rEH-YmFREu56WOFKWCjODGXdld8BLa5ngFziZUcpI5arGyioP7vI7yYksEE>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 18 Aug 2022 09:42:03 -0400 (EDT)
Date: Thu, 18 Aug 2022 15:42:00 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v1 04/35] drm/modes: Introduce 480i and 576i modes
Message-ID: <20220818134200.cr22bftmjn226ehn@houat>
References: <20220728-rpi-analog-tv-properties-v1-4-3d53ae722097@cerno.tech>
 <CAMuHMdUrwzPYjA0wdR7ADj5Ov6+m03JbnY8fBYzRYyWDuNm5=g@mail.gmail.com>
 <20220816132636.3tmwqmrox64pu3lt@houat>
 <CAMuHMdUNLPbjs=usYQBim5FxsrC1oJLuF+3JB7auzHHRoOqavQ@mail.gmail.com>
 <20220817075351.4xpsqdngjgtiqvob@houat>
 <CAMuHMdUusnhYodWGCxJBu-1Hd2KW-xdT8jxE_iVdQjDo8b3Y5Q@mail.gmail.com>
 <20220817131454.qcuywcuc4ts4hswm@houat>
 <CAMuHMdVPEgnnsY-4uuf=FDJ0YxWpch-0kZWFT_TZfcDvXLtwWQ@mail.gmail.com>
 <20220818123934.eim2bfrgbxsmviqx@houat>
 <CAMuHMdWXbHkrBZgsmUnU=q52+q7UZZNO3tgQW7Men+msQ1JDwQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="bjiayi7n6oays3ln"
Content-Disposition: inline
In-Reply-To: <CAMuHMdWXbHkrBZgsmUnU=q52+q7UZZNO3tgQW7Men+msQ1JDwQ@mail.gmail.com>
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


--bjiayi7n6oays3ln
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 18, 2022 at 02:57:55PM +0200, Geert Uytterhoeven wrote:
> Hi Maxime,
>=20
> On Thu, Aug 18, 2022 at 2:39 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > On Wed, Aug 17, 2022 at 04:01:48PM +0200, Geert Uytterhoeven wrote:
> > > > I've looked around and it looks like the entire blanking area is
> > > > supposed to be 40 pixels in interlaced, but I couldn't find anywher=
e how
> > >
> > > 625 lines - 575[*] visible lines =3D 50 lines.
> > >
> > > [*] BT.656 uses 576 visible lines as that's a multiple of 2, for spli=
tting
> > >      a frame in two fields of equal size.
> > >
> > > "visible" is relative, as it includes the overscan region.
> > > Some PAL monitors used with computers had knobs to control width/heig=
ht
> > > and position of the screen, so you could make use of most or all of
> > > the overscan region
> >
> > It brings back some memories :)
> >
> > > but on a real TV you're limited to ca. 640x512 (on PAL) which is what
> > > an Amiga used by default (with a 14 MHz pixclock).
> >
> > > > it's supposed to be split between the upper and lower margins and t=
he
> > > > sync period.
> > >
> > > "Field Synchronization of PAL System" on
> > > http://martin.hinner.info/vga/pal.html shows the split.
> >
> > Thanks, that's excellent as well.
> >
> > I'm mostly done with a function that creates a PAL mode, but I still
> > have one question.
> >
> > If I understand well, the blanking period is made up (interlace) of 16
> > pulses for the first field, 14 for the second, each pulse taking half a
> > line. That amount to 30 pulses, so 15 lines.
> >
> > I first assumed that the pre-equalizing pulses would be the back porch,
> > the long sync pulses the vsync, and the post-equalizing pulses the front
> > porch. But... we're still missing 35 lines to amount to 625 lines, that
> > seems to be counted in the field itself (305 lines =3D=3D (575 + 35) / =
2)
> >
> > So I guess my assumption was wrong to begin with.
>=20
> The back porch is the number of lines between the last "visible" line
> and the start of the synchronization pulse, i.e. "l" in the "Field
> Synchronization of PAL System" drawing.
> Virtual sync length is "m".
> The front porch is the number of lines between the end of
> the synchronization pulse, and the first "visible" line, i.e.
> "j - l - m" (I think you used "n", thus missing lines 6-23 and 319-335).

Ah, yes, that makes sense

> > You seem to have used a fixed vsync in amifb to 4 lines, and I don't
>=20
> Actually "m" is 2.5 lines in the first field, and 3 lines in the second f=
ield,
> so "4" is not that much off of 2.5 + 3.

Is it? If I'm reading that drawing well, l before the first field starts
on the second half of line 623 and stops at the end of line 625, so 2.5
line, and on the second field starts at the beginning of line 311, and
stops half-way through 313 so 2.5 line again.

Then, for the first field, m starts at the beginning of line 1, stops
half-way through line 3, so 2.5 line indeed, and then on the second
field starts on the second half of 313 and stops at the end of line 315.
So 2.5 again?

Thus, both should be 5?

> > understand how you come up with the upper and lower margins (or rather,
> > how they are linked to what's described in that page)
>=20
> These margins probably came from the Amiga hardware reference manual,
> for the default 640x512 (PAL) and 640x400 (NTSC) modes.

Ok.

I started adding more sanity checks to my code, and I just realised I
don't seem to be able to reach 720 pixels over a single line though. If
I understood it properly, and according to [1] the active part of a line
is supposed to be 51.95us, and the blanking period taking 12.05us. [2]
in the timing section has pretty much the same numbers, so it looks
sane.

At 13.5Mhz, a pixel is going to take roughly 74ns, and 51950 / 74 =3D 702
pixels

It seems we can go push it to 52350 ns, but that still gives us only 706
pixels.

Similarly, if I just choose to ignore that limit and just take the
active time I need, 720 * 74 =3D 53280ns

That leaves us 10720ns for the blanking period, and that's not enough to
fit even the minimum of the front porch, hsync and back porch (1.55 +
4.5 + 5.5 =3D 11.55us).

Are those constraints merely recommendations, or am I missing something?

Thanks!
Maxime

1: https://en.wikipedia.org/wiki/PAL#PAL_signal_details
2: http://martin.hinner.info/vga/pal.html

--bjiayi7n6oays3ln
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYv5BqAAKCRDj7w1vZxhR
xWtBAQDibwVaic8Y/y58QuWnOuhXnUvfjLJQpEPWFoP8AcS2PAEApAMrj2LZQrsW
1JWlpoRTdj2V5czk8fjcIqqDqWHqrQE=
=Vc6t
-----END PGP SIGNATURE-----

--bjiayi7n6oays3ln--
