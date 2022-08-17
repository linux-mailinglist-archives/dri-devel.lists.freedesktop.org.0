Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6266A596F4B
	for <lists+dri-devel@lfdr.de>; Wed, 17 Aug 2022 15:15:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B20AE10FB2D;
	Wed, 17 Aug 2022 13:15:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C4B6926D1
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 13:15:02 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id A9A3A2B059AF;
 Wed, 17 Aug 2022 09:14:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 17 Aug 2022 09:15:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1660742099; x=1660749299; bh=dUKlPZvVEL
 3xTGjKVzoEN6kF32lJAtnC40Q+pnqgRfw=; b=IEDcwGBYZLkANXTNyAYKOwp4p1
 mgSuY+T9Ifhc4qWp7gh7XNF3Nwcc/E7l/MKv+if7WM1WotsUeuwRsetP5/OMSwuB
 PH8BanvT7zdMzmlSLSfsSuaUSrDeXiw89jeZ6lRE3oA7UIYAc5fEqx2TaEQGTZzg
 WLC95bXP/c9sNRqP/m7D1ws0NBzlE5GZaRF3DNGVQB078cbWSwrds8ulA4rRWo/c
 R766pDMsHsnoS/ZWZHkw+VF/E7Z1seCJRTx7fW8G4+jxyS1glP6l+lxlfcfMXFgI
 GfYvDrhpo+pkMvKdFfMkpktqITeAkEbKvoFy7R6eG4H70PV+26T276NDgfCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1660742099; x=1660749299; bh=dUKlPZvVEL3xTGjKVzoEN6kF32lJ
 AtnC40Q+pnqgRfw=; b=II19VbXx9+ZDrnShqimgJELk3HiJSUS/OzpEvmLv7zEC
 xj4Lzp/6olZ6ZnPiq+LS6ScCbzzhmd0V6Afoz/4J0BCsCaGMsV77GMQhnCENsFVR
 ZWk08BTTT/3eculwIl1GcYdcdVBcq05W9mLXcNbLwjrE6Uz25qcDWArenaJsJKah
 6KByP9J/duC8dwJn7uCp0VmOUpNVkEO7dxiQQoYvPQ2tUlBPCnUzVtsqu1S749Cn
 D8jEb1S6Dti5QFi2Jb4TMNQS3CQeX3c6nqQTRTOb6bRKnL/RGK0fv0RKHIkjF4X+
 FMr1CZlUtM+A1ZYRYlujzJPN+9+x14Ynnpkjul6iIw==
X-ME-Sender: <xms:0en8YsM4yoi3AhkBFlLu0vCRqyPRBBqDleky6YeMlrwg_D7THEavaA>
 <xme:0en8Yi9506KPIsYiQvFdLyrGglRMU2AWMsSxwAj5cc_UXBaTvNzYw9G8ql1qYZx8U
 zXPTyyrx7BL5TKqHIU>
X-ME-Received: <xmr:0en8YjQrn8MrQj3HLuob_i1B4TYomH81Vh9f408syfDYoI3Q-g4pTeaWYg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehiedgiedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeevffdvudeivdffffefueejieekvdekvdelieeftedvtdegtdffieetuedt
 ueejgeenucffohhmrghinhepfihikhhiphgvughirgdrohhrghenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdr
 thgvtghh
X-ME-Proxy: <xmx:0en8YkuJaXz5lBHugJQtNCpwagkcLdFi_r7whquET1jvJRmyw4vAEg>
 <xmx:0en8YkebsKHy2-I2Rd-JIGKyBNwnHt7D5GBfbnaoP6-5YyWBjxpigA>
 <xmx:0en8Yo2DDryMrTvdiW9lHJdv27mKZBWSWNYY13dcCzTphBbCbgvq3A>
 <xmx:0-n8YoPw0bAB-KGFfPzk-k00fnU5PCKphSUCi23nv2Ut978E6NfbJ_wcOjU>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 17 Aug 2022 09:14:57 -0400 (EDT)
Date: Wed, 17 Aug 2022 15:14:54 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v1 04/35] drm/modes: Introduce 480i and 576i modes
Message-ID: <20220817131454.qcuywcuc4ts4hswm@houat>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-4-3d53ae722097@cerno.tech>
 <CAMuHMdUrwzPYjA0wdR7ADj5Ov6+m03JbnY8fBYzRYyWDuNm5=g@mail.gmail.com>
 <20220816132636.3tmwqmrox64pu3lt@houat>
 <CAMuHMdUNLPbjs=usYQBim5FxsrC1oJLuF+3JB7auzHHRoOqavQ@mail.gmail.com>
 <20220817075351.4xpsqdngjgtiqvob@houat>
 <CAMuHMdUusnhYodWGCxJBu-1Hd2KW-xdT8jxE_iVdQjDo8b3Y5Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3k2wy2tkfns6fd4i"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUusnhYodWGCxJBu-1Hd2KW-xdT8jxE_iVdQjDo8b3Y5Q@mail.gmail.com>
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


--3k2wy2tkfns6fd4i
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 17, 2022 at 10:51:55AM +0200, Geert Uytterhoeven wrote:
> On Wed, Aug 17, 2022 at 9:54 AM Maxime Ripard <maxime@cerno.tech> wrote:
> > On Tue, Aug 16, 2022 at 05:00:38PM +0200, Geert Uytterhoeven wrote:
> > > On Tue, Aug 16, 2022 at 3:26 PM Maxime Ripard <maxime@cerno.tech> wro=
te:
> > > > On Fri, Aug 12, 2022 at 03:18:58PM +0200, Geert Uytterhoeven wrote:
> > > > > On Fri, Jul 29, 2022 at 6:35 PM Maxime Ripard <maxime@cerno.tech>=
 wrote:
> > > > > > Multiple drivers (meson, vc4) define the analog TV 525-lines an=
d 625-lines
> > > > > > modes in the drivers.
> > > > >
> > > > > Nit: strictly speaking these are not analog modes, but the digital
> > > > > variants (ITU-R BT.656 and DVD-Video D1) of NTSC and PAL, using a
> > > > > 13.5 MHz sampling frequency for pixels.
> > > > >
> > > > > In analog modes, the only discrete values are the number of lines=
, and
> > > > > the frame/field rate (fixing the horizontal sync rate when combin=
ed).
> > > > >
> > > > > The number of (in)visible pixels per line depends on the available
> > > > > bandwidth.  In a digital variant (which is anything generated by a
> > > > > digital computer system), the latter depends on the pixel clock, =
which
> > > > > can wildly differ from the 13.5 MHz used in the BT.656 standard. =
(e.g.
> > > > > Amiga uses 7.09/14.19/28.38 MHz (PAL) or 7.16/14.32/28.64 MHz (NT=
SC)).
> > > > >
> > > > > So I think we probably need some way to generate a PAL/NTSC-compa=
tible
> > > > > mode based not only on resolution, but also on pixel clock.
> > > >
> > > > This would also fix the comments made by Jani and Thomas, so I quite
> > > > like the idea of it.
> > > >
> > > > I'm struggling a bit to find how would could implement this though.
> > > >
> > > > From what you were saying, I guess the prototype would be something=
 like
> > > >
> > > > struct drm_display_mode *drm_create_analog_mode(unsigned int pixel_=
clock,
> > > >                                                 unsigned int lines,
> > > >                                                 unsigned int frame_=
rate)
> > > >
> > > > But I have zero idea on what the implementation would be. Do you ha=
ve
> > > > some resources for this you could point me to?
> > >
> > > Horizontally, I think you should calculate left/right margins and
> > > hsync length to yield timings that match those for the BT.656 PAL/NTSC
> > > modes.  I.e. when a 640x512 mode with a pixel clock of 14 MHz is
> > > requested, you want to calculate left', right', and hslen' for
> > >
> > > | <---- left' ---> | <- 640 pixels -> | <---- right' ---> | <--- hsle=
n' --> |
> > >                         @ 14 MHz
> > >
> > > so they match the timings for left, right, and hslen for
> > >
> > > | <--- left ---> | <--- 720 pixels ---> | <--- right ---> | <--- hsle=
n ---> |
> > >                         @ 13.5 MHz
> > >
> > > As 640 pixels @ 14 MHz are less wide than 720 pixels @ 13.5 MHz,
> > > you want to make sure to align the center of the visible part.
> >
> > So I guess in that example if we want to center it, left =3D=3D right a=
nd
> > left' =3D=3D right'? What about the sync length?
>=20
> No, left and right are asymmetrical, cfr. front and back porch in
> https://en.wikipedia.org/wiki/PAL#PAL_signal_details
> I.e. if the pixel part is reduced, both the left and right margins
> should be increased by the same amount.
>=20
> From the table linked above, hslen should be ca. 4.7=B5s (fixed).

each pixel taking 1 / pixel_clock seconds (assuming pixel_clock is in
Hz), and thus hslen (in pixels) =3D 4.7 * 10 ^ -6 * pixel_clk, right?

> > > Vertically, it's simpler, as the number of lines is discrete.
> > > You do have to take into account interlace and doublescan, and
> > > progressive modes with 262/312 lines.
> >
> > So we only have to deal with 525 and 625 lines total (without taking
> > interlace and doublescan into account), right?
>=20
> Yes.
>=20
> > I guess we still have the same question, we probably want to center it,
> > so top =3D=3D bottom, but what about the vsync length?
>=20
> Unfortunately that table does not mention top and bottom margins.
> But according to drivers/video/fbdev/amifb.c (see the "Broadcast
> video timings" comment block and the definitions of the "ntsc-lace"
> and "pal-lace" video modes), they are asymmetrical, too.
>=20
> Vsync length is 0.576ms, so that's 9 scan lines (I guess I didn't
> have that info when I wrote amifb, as I used 4 lines there).

Thanks, that's some great info already.

It's mentioned though that the settings for NTSC are "straightforward",
but it's definitely not for me :)

I've looked around and it looks like the entire blanking area is
supposed to be 40 pixels in interlaced, but I couldn't find anywhere how
it's supposed to be split between the upper and lower margins and the
sync period.

Thanks!
Maxime

--3k2wy2tkfns6fd4i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYvzpzgAKCRDj7w1vZxhR
xaliAQCDHSUbOXnRJW+WaaBPo51qOcik941/wbzLlMyQZE7BWAD9EBh9ubEvqwGp
65TtZrmiJ6qFtpANfbFDnug7CTw2nAQ=
=yOdY
-----END PGP SIGNATURE-----

--3k2wy2tkfns6fd4i--
