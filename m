Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BB8598339
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 14:41:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D662CA4C16;
	Thu, 18 Aug 2022 12:40:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99F91B7604
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 12:39:44 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id D00832B05E6A;
 Thu, 18 Aug 2022 08:39:39 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 18 Aug 2022 08:39:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1660826379; x=1660833579; bh=YRrkqYfUey
 d/afvSZhJ0kvziJy3S8LJDEtRjqUfFPSo=; b=IHz9beHjK6BmV92EOKI1gLLc0M
 P9t82G2uluVqd7svl2yZLWMAJoeAjLoGLogb98PqFknQRGD1gtJZ6LtiUoi1SBky
 IDyfMCqUl7rOPRZ/q0daavXQU/hdPPdM+38Le4gYw/FJg+DjGAZSmIuyBS57YrsB
 e63wCjCvBy8K+nrRoPsw5EnywFBAD8u5plPWclrho6XuiOChzZc609mjM6oqKhQI
 SWQZT4a8qwcJonb/0eZ6aTEXpRmdN6oTtLBmev2evIFDRvsr9fyiTsd0X1xdVoP2
 Aq4HbOt2ei1w/d6+L2su/JzudsXQNLB7KETrs2DkncF2s/uqNzDSXvAnYg3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1660826379; x=1660833579; bh=YRrkqYfUeyd/afvSZhJ0kvziJy3S
 8LJDEtRjqUfFPSo=; b=qAvK/y25kdOixORQ1DcGPmxPcHWSUKsl3RV+tTDS1EO5
 NOPj/sCCY7oGDwQwvyJWkJzhPy2M/OOY5ydNH2EDdTJe/u8NLQGUEffJ3ICIDg9z
 8Yk7ItX8XgPmjfb5zXPdgWKTuWIoSrYxKdCndlpJivExLPhVOq0KSKs/XGioJy+I
 HqjVn5aKmUL328f1qyZjr9lU+Ponwbefox24cnMfTYvkq8Cy0/utT+EUWgx7YCW2
 N5UHkZgC8btjVzhbarvvdtUT9roMh2sottdMTFausmjJdvPjoNC7NNqXf/JSso6c
 RDM6b/ga/jMLUuMKsEP3dxx6+PrxnKHvw62M20jSBg==
X-ME-Sender: <xms:CjP-YnGeVVLXM3mzZ2v7VHy6wrITCBDi8qvzdW9m3h4S-iQHge4HEA>
 <xme:CjP-YkUY8FAcAVAWFOjI3fi74PkJhzACWS0q2oO31_xTk-QBUY7lRUkG4yw09Tiq5
 ht1P6FoKXVh_KiOL6Q>
X-ME-Received: <xmr:CjP-YpKrBFnbVIv4SfmxGlO5dZ9yKsaoNXWsZVsdtyKSyjbfZ2VcCUx3wA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehledgvdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvfeevudfgvefhtdefjedtfeelheeigfeghfeijedvgfegffevkefggfff
 ueejtdenucffohhmrghinhephhhinhhnvghrrdhinhhfohenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgv
 tghh
X-ME-Proxy: <xmx:CjP-YlGlnSTXDodYwXRenPdTbe0fyyRAuyKpHoL9iwEKs46SIOyukA>
 <xmx:CjP-YtXtlRp3s-IM5r0fC_58DTQfQNWdBhMJjzDFUH7UhTxIFe3R-Q>
 <xmx:CjP-YgM-xnxj1Q2js1x6rE3FxXTBMgsvWAPPM37LKl4j_CxHuIJHhQ>
 <xmx:CzP-YjHFF5LGbBDa_NV776KyH5859ooLfz0LmsNpe-VwQBt3g9IFmv5w2gQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 18 Aug 2022 08:39:37 -0400 (EDT)
Date: Thu, 18 Aug 2022 14:39:34 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v1 04/35] drm/modes: Introduce 480i and 576i modes
Message-ID: <20220818123934.eim2bfrgbxsmviqx@houat>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-4-3d53ae722097@cerno.tech>
 <CAMuHMdUrwzPYjA0wdR7ADj5Ov6+m03JbnY8fBYzRYyWDuNm5=g@mail.gmail.com>
 <20220816132636.3tmwqmrox64pu3lt@houat>
 <CAMuHMdUNLPbjs=usYQBim5FxsrC1oJLuF+3JB7auzHHRoOqavQ@mail.gmail.com>
 <20220817075351.4xpsqdngjgtiqvob@houat>
 <CAMuHMdUusnhYodWGCxJBu-1Hd2KW-xdT8jxE_iVdQjDo8b3Y5Q@mail.gmail.com>
 <20220817131454.qcuywcuc4ts4hswm@houat>
 <CAMuHMdVPEgnnsY-4uuf=FDJ0YxWpch-0kZWFT_TZfcDvXLtwWQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="lcxbafgaqwff7pps"
Content-Disposition: inline
In-Reply-To: <CAMuHMdVPEgnnsY-4uuf=FDJ0YxWpch-0kZWFT_TZfcDvXLtwWQ@mail.gmail.com>
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


--lcxbafgaqwff7pps
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

On Wed, Aug 17, 2022 at 04:01:48PM +0200, Geert Uytterhoeven wrote:
> > > > > Vertically, it's simpler, as the number of lines is discrete.
> > > > > You do have to take into account interlace and doublescan, and
> > > > > progressive modes with 262/312 lines.
> > > >
> > > > So we only have to deal with 525 and 625 lines total (without taking
> > > > interlace and doublescan into account), right?
> > >
> > > Yes.
> > >
> > > > I guess we still have the same question, we probably want to center=
 it,
> > > > so top =3D=3D bottom, but what about the vsync length?
> > >
> > > Unfortunately that table does not mention top and bottom margins.
> > > But according to drivers/video/fbdev/amifb.c (see the "Broadcast
> > > video timings" comment block and the definitions of the "ntsc-lace"
> > > and "pal-lace" video modes), they are asymmetrical, too.
> > >
> > > Vsync length is 0.576ms, so that's 9 scan lines (I guess I didn't
> > > have that info when I wrote amifb, as I used 4 lines there).
> >
> > Thanks, that's some great info already.
> >
> > It's mentioned though that the settings for NTSC are "straightforward",
> > but it's definitely not for me :)
>=20
> As in NTSC just uses different pixel clock and horizontal/vertical sync
> rate values...

Oh, so the constants differ but the calculation is the same, ack.

> > I've looked around and it looks like the entire blanking area is
> > supposed to be 40 pixels in interlaced, but I couldn't find anywhere how
>=20
> 625 lines - 575[*] visible lines =3D 50 lines.
>=20
> [*] BT.656 uses 576 visible lines as that's a multiple of 2, for splitting
>      a frame in two fields of equal size.
>=20
> "visible" is relative, as it includes the overscan region.
> Some PAL monitors used with computers had knobs to control width/height
> and position of the screen, so you could make use of most or all of
> the overscan region

It brings back some memories :)

> but on a real TV you're limited to ca. 640x512 (on PAL) which is what
> an Amiga used by default (with a 14 MHz pixclock).

> > it's supposed to be split between the upper and lower margins and the
> > sync period.
>=20
> "Field Synchronization of PAL System" on
> http://martin.hinner.info/vga/pal.html shows the split.

Thanks, that's excellent as well.

I'm mostly done with a function that creates a PAL mode, but I still
have one question.

If I understand well, the blanking period is made up (interlace) of 16
pulses for the first field, 14 for the second, each pulse taking half a
line. That amount to 30 pulses, so 15 lines.

I first assumed that the pre-equalizing pulses would be the back porch,
the long sync pulses the vsync, and the post-equalizing pulses the front
porch. But... we're still missing 35 lines to amount to 625 lines, that
seems to be counted in the field itself (305 lines =3D=3D (575 + 35) / 2)

So I guess my assumption was wrong to begin with.

You seem to have used a fixed vsync in amifb to 4 lines, and I don't
understand how you come up with the upper and lower margins (or rather,
how they are linked to what's described in that page)

Maxime

--lcxbafgaqwff7pps
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYv4zBgAKCRDj7w1vZxhR
xYV3AQDMVX9EP9IeMgn/VC77iWNl8fZWLl3pV3GsUW4BHyIW6QEAnOHXzzmKBAoR
Ta1eHGvbrbL9eJf0qR3cPhqIhbYH2Q0=
=lHS5
-----END PGP SIGNATURE-----

--lcxbafgaqwff7pps--
