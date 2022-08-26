Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8985A22DC
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 10:22:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 069BC10E4D4;
	Fri, 26 Aug 2022 08:22:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C60D10E4D4
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 08:21:59 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id DD67F580133;
 Fri, 26 Aug 2022 04:21:55 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 26 Aug 2022 04:21:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1661502115; x=1661509315; bh=xNms8xjTA9
 VJiT6V9Qae1WG7aPcDm2v7iLmvsefpGGA=; b=XJFa20goJDb/o/tychB9iiMIVZ
 SmwaxnTpMpNiJfIkgpl0/i+ZtpP4GNmyYbKGffEBVm3YcdIYsCKKgOorO/i4K9xF
 Iw3tEvzTG41a2vk4iPc9Qg8HnT8jJM/n9hZsw9gAuP5JjIRX9E/BFnylGlrRYJIV
 r68eP0vd2A2xzfueil1mmmYIvAOCzy4ZW+NlwoCVtj+kTBENPLwrIo0y1q1anQmR
 JwPhiBXnotfa8I3XFO5BsZDO7+BZ5OZe2ZhYyZGhVP1xOQlQg2w7WwNeJud2PpBz
 n7qm+Lupd8Z8p7rt9ShUbWzin1aOwnAmaekZzHi3OKYGEW9wxaKNL3A3pP4A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1661502115; x=1661509315; bh=xNms8xjTA9VJiT6V9Qae1WG7aPcD
 m2v7iLmvsefpGGA=; b=EX+IRm9FYmfknj8kJzcAD19jE0xMEZd8O/pa3XLpJ2HX
 wXZEilyoY9nsYJMQEVMMTA1+d3CBBcZyHqhbOrUZx7rtA7QppsS077406A/vfnkj
 7RHvMJQ3/TUubWPqfJvYjl6xpgikTsEhumoLh9lcrpzL0Q4LA9lQURzcyfjjR4cF
 PwOM1NpePP7NY4/9l+9GDxgkOHtkA1rAjLLPh6ahwWa14caHqMnXZ7wS5vNPtwja
 TDNR9n+E2fKgny4qLbAHXO5V6iuK4QyyC4mvsqoJ+GdTNekhijpErfVb0g/OK9OO
 u9GrOZCAY3SsElMOoqHkccnZh6pl/jhXwRD+rvgg6A==
X-ME-Sender: <xms:ooIIY2g-x7J2x2D5kje7wICVMaumk7Uj60g-hLx7iv8Im1A6S2ojCw>
 <xme:ooIIY3AevSAdkVgIn8dpi7L-sinReY9nYMN6tmAPiP8wcV1AlB7i_0URpEWSv3oAq
 ipSB9_Ud7N71cbMcCk>
X-ME-Received: <xmr:ooIIY-HtfgCqyQ8Dc904NYN63WhsYQ3lMa4HG_VP7I0-aRujDH4RhDV3mcg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdejhedgtdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeevuddthffgfeeiffejgfeghfeludegkedtgefgffejtdegtddvleduvdfh
 teehveenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggt
 hh
X-ME-Proxy: <xmx:ooIIY_TaEu7rXz23kpyCxbIVu5zI8kpntNg_QZwDxR5YQBrUx-w8QQ>
 <xmx:ooIIYzw28vuTMnNNFIxpjpp6klkXuKkCGIdEpDhxhoaMgoay78GPCw>
 <xmx:ooIIY96bEWtDtW1tcHxN0bICr8OavHzfy9dBeQUGPRRV9s2BNJUq7A>
 <xmx:o4IIY6isgwnWO8n4v8xBxivmaZ61dMUcY0MRjsxWsjgGfNpwg8RNlw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 26 Aug 2022 04:21:54 -0400 (EDT)
Date: Fri, 26 Aug 2022 10:21:51 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH v1 05/35] drm/connector: Add TV standard property
Message-ID: <20220826082151.h2kt3wca7s3ahl6x@houat>
References: <20220816082612.grebxql5ynnfnvfd@houat>
 <ea6ebdda-f779-78af-1ffd-bd86d715077f@tronnes.org>
 <20220816094922.oqhrhefv327zo2ou@houat>
 <be9b6b71-fa2a-3290-2bce-901342e01981@tronnes.org>
 <20220817114605.jpb3tlnoseyvf65d@houat>
 <30f3005d-0acc-e5af-10ca-cf46f18b3478@tronnes.org>
 <133c2a1d-0b4c-cef9-11fe-9ce9985253d6@tronnes.org>
 <9daca9bf-838e-c3eb-51de-1cf5188a9341@tronnes.org>
 <20220818153101.c25x33vkl6qboswe@houat>
 <9e0256bd-b37a-0b94-45d5-59e06cd1547c@tronnes.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="4sbs3xfkyrzbmun4"
Content-Disposition: inline
In-Reply-To: <9e0256bd-b37a-0b94-45d5-59e06cd1547c@tronnes.org>
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
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-sunxi@lists.linux.dev,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--4sbs3xfkyrzbmun4
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 21, 2022 at 01:43:40PM +0200, Noralf Tr=F8nnes wrote:
>=20
>=20
> Den 18.08.2022 17.31, skrev Maxime Ripard:
> > On Thu, Aug 18, 2022 at 05:01:38PM +0200, Noralf Tr=F8nnes wrote:
> >>
> >>
> >> Den 18.08.2022 01.23, skrev Noralf Tr=F8nnes:
> >>>
> >>>
> >>> Den 17.08.2022 15.11, skrev Noralf Tr=F8nnes:
> >>>>
> >>>>
> >>>> Den 17.08.2022 13.46, skrev Maxime Ripard:
> >>>>> On Tue, Aug 16, 2022 at 09:35:24PM +0200, Noralf Tr=F8nnes wrote:
> >>>>>> Den 16.08.2022 11.49, skrev Maxime Ripard:
> >>>>>>> On Tue, Aug 16, 2022 at 11:42:20AM +0200, Noralf Tr=F8nnes wrote:
> >>>>>>>> Den 16.08.2022 10.26, skrev Maxime Ripard:
> >>>>>>>>> Hi,
> >>>>>>>>>
> >>>>>>>>> On Mon, Aug 08, 2022 at 02:44:56PM +0200, Noralf Tr=F8nnes wrot=
e:
> >>>>>>>>>> Den 29.07.2022 18.34, skrev Maxime Ripard:
> >>>>>>>>>>> The TV mode property has been around for a while now to selec=
t and get the
> >>>>>>>>>>> current TV mode output on an analog TV connector.
> >>>>>>>>>>>
> >>>>>>>>>>> Despite that property name being generic, its content isn't a=
nd has been
> >>>>>>>>>>> driver-specific which makes it hard to build any generic beha=
viour on top
> >>>>>>>>>>> of it, both in kernel and user-space.
> >>>>>>>>>>>
> >>>>>>>>>>> Let's create a new bitmask tv norm property, that can contain=
 any of the
> >>>>>>>>>>> analog TV standards currently supported by kernel drivers. Ea=
ch driver can
> >>>>>>>>>>> then pass in a bitmask of the modes it supports.
> >>>>>>>>>>>
> >>>>>>>>>>> We'll then be able to phase out the older tv mode property.
> >>>>>>>>>>>
> >>>>>>>>>>> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> >>>>>>>>>>>
> >>>
> >>>>>> How do you test the property? I've used modetest but I can only ch=
ange
> >>>>>> to a tv.mode that matches the current display mode. I can't switch=
 from
> >>>>>> ntsc to pal for instance.
> >>>>>
> >>>>> Yep, if you want to change from PAL to NTSC, it will require a new =
mode.
> >>>>>
> >>>>
> >>>> So userspace has to check tv.mode first and then create a display mo=
de
> >>>> the driver will accept if switching to a different display mode is
> >>>> necessary? In other words, userspace can't discover from the kernel
> >>>> which display modes a certain tv.mode/norm provides before it is
> >>>> selected? If so, maybe libdrm should have some function(s) to deal w=
ith
> >>>> switching between modes that require a different display mode since
> >>>> knowledge about which display modes a tv.mode supports is needed bef=
ore
> >>>> hand.
> >>>>
> >>>
> >>> I haven't used vc4 on Pi4 in mainline before and have finally gotten =
it
> >>> to work.
> >>>
> >>> I see that the connector reports 2 modes that together fit all tv.nor=
ms
> >>> so userspace doesn't have to contruct a display mode, but it does need
> >>> to know which display mode belongs to a certain tv.norm.
> >>>
> >>> When I try to use modetest I'm unable to set a mode:
> >>>
> >>> pi@pi4t:~ $ modetest -M vc4 -s 45:720x480i
> >>> setting mode 720x480i-29.97Hz on connectors 45, crtc 68
> >>> failed to set mode: Function not implemented
> >>>
> >>> The errno is misleading, modetest does a drmModeDirtyFB before checki=
ng
> >>> the error returned by drmModeSetCrtc.
> >>>
> >>> Setting the property succeeds, but the modeset still fails:
> >>>
> >>> pi@pi4t:~ $ modetest -M vc4 -s 45:720x480i -w 45:"tv norm":2
> >>> setting mode 720x480i-29.97Hz on connectors 45, crtc 68
> >>> failed to set mode: Function not implemented
> >>>
> >>> pi@pi4t:~ $ modetest -M vc4 -c
> >>>         37 tv norm:
> >>>                 flags: bitmask
> >>>                 values: NTSC-443=3D0x1 NTSC-J=3D0x2 NTSC-M=3D0x4 PAL-=
B=3D0x10
> >>> PAL-M=3D0x200 PAL-N=3D0x400 SECAM-B=3D0x2000
> >>>                 value: 2
> >>>
> >>> Here's the log, can you see if there's anything obvious in there:
> >>> https://gist.github.com/notro/a079498bf6b64327105752b2bafa8858
> >>>
> >>
> >> I'm one step closer as I now have fbcon working, I had forgotten to add
> >> enable_tvout=3D1 and I had disable_fw_kms_setup=3D1 which disables the
> >> video=3D mode on the kernel commandline.
> >>
> >> modetest still fails though, after alot of printk sprinkling, I've
> >> tracked it down to the drm_mode_equal test in
> >> drm_atomic_helper_connector_tv_check(). The aspect ratios differ:
> >>
> >> [   61.336295] drm_atomic_helper_connector_tv_check:
> >> mode->picture_aspect_ratio=3D1
> >> [   61.336301] drm_atomic_helper_connector_tv_check:
> >> &crtc_state->mode->picture_aspect_ratio=3D0
> >=20
> > I haven't seen this when testing, but I'll have a look, thanks!
>=20
> I have found the cause, the kernel strips off the aspect ratio in
> drm_mode_getconnector() if drm_file->aspect_ratio_allowed is false. So I
> think the drm_mode_equal() test needs to be relaxed for
> legacy/non-atomic userspace to work.

Geert suggested I removed it too, so this check is gone now.

> If I use modetest with atomic commit (-a) it works as is, having the
> drm_mode_equal() test:
>=20
> $ modetest -M vc4 -a -P 61@68:720x480 -s 45:720x480i
>=20
> I have a problem because the board hangs, either right away or after I
> press <enter> to quit modetest.
>=20
> I often get this, sometimes after 10s of seconds:
>=20
> [  136.822963] Unhandled fault: asynchronous external abort (0x1211) at
> 0x00000000
> ...
> [  137.248496]  bcm2711_get_temp [bcm2711_thermal] from
> thermal_zone_get_temp+0x54/0x74
>=20
> Unloading bcm2711_thermal didn't help, in that case I got nothing, so
> the problem lies elsewhere.
> I have even tried with a fresh SD image and a fresh kernel, but it
> didn't help.

I got this too when working from current next (next-20220825) but it
doesn't seem to happen on drm-misc-next-2022-08-20-1, so it's probably
something unrelated?

> I can switch from NTSC to PAL like this (but it still crashes):
>=20
> $ modetest -M vc4 -a -w 45:"tv norm":16 -P 61@68:720x576 -s 45:720x576i

I've tested with my current branch, and it work fine with modetest, I'll
put my commands in my next iteration so that you can compare?

Maxime

--4sbs3xfkyrzbmun4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYwiCnwAKCRDj7w1vZxhR
xbzKAQDqxiMk+IO8pfk9HqQ1PrVbxiK0YR5t7FKIewrW+mkuygD/f18RRG2JbWSS
N1D43YlytKgkhdifDY8m2GQjF4f6ngA=
=5kCn
-----END PGP SIGNATURE-----

--4sbs3xfkyrzbmun4--
