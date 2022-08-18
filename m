Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8504598788
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 17:33:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC473BB536;
	Thu, 18 Aug 2022 15:31:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A4D0AD095
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 15:31:08 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 9B5D92B05ADE;
 Thu, 18 Aug 2022 11:31:05 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 18 Aug 2022 11:31:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1660836665; x=1660843865; bh=zsZN0+/dvw
 oQ1eBJsmGkPBClTq6+A6mbZvTtkF8HBEY=; b=BMiP2oaAOwbNtZZLLkDUVMmYY0
 RONK7KgiEuxuKSpy29xDAffJAjJ//MxoOfyJ7z1PgFPhtU5yaFfSLExBbFZiRSkT
 mFwEIaB1C70toP9zCEJxKi7iIa6CeTw4nAkxOArZHavQLc1XsxBPgkX3+UvUbc6z
 pZcYemBlWY12iE/uGW2O1DGwdPviDTDgDOTWMSCRpiLxI9g8s8LtUaGARWberwba
 ZyOzY3rpaPkIC6ToN01G4p/005OMe0YIjBsGQ+/Fsq9Re5oygKLYA9y0E8tyuyOD
 CNjL2nBgcT2neTJNUsh+g6VZK2mjTxPvcCI9Lukvqvxr+xJxM9q1gtu9BZGQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1660836665; x=1660843865; bh=zsZN0+/dvwoQ1eBJsmGkPBClTq6+
 A6mbZvTtkF8HBEY=; b=wxtGJPeahDRmQybRntrvlGpL29icAnQ2KJUUR/750Dbj
 RTpbASl5qveK0yvvFsPZ6PUdrQT9NVmCBI1Ez1yAHJXi/rjEDHiuCj+xcCNVg9On
 arMZo1tw0FEhao2iyb2gWvlBB0QTtVYIaL69vHSsgEZ5ZNF/y8roJHvhAu09PBlP
 lmAhz8WdhPVN9pjbb18dsGLY1UDq6O4nPa29UNltwcRXaTHEM8FAYy/1KsQmt4c7
 NuLFwnfHAB7OoPm/W+r12dqzYe/UhergwWfAvZktZ/9KrJ2OfqLvMkLvhdeyij+w
 Ts1fbl49nMfed+UFlxccB7JIToXT+R49JTtl28PaRg==
X-ME-Sender: <xms:OFv-Yu62dxrUPmg8XCcF5vkBdZLfkKWRTWRMceuh4Vl3jYCNG5H6Pw>
 <xme:OFv-Yn7TsCJLt_qf9gSXzBLKVG64_WoSf7DCT2ulkn9PQaxuUCdwXHYznUN4Jbcjf
 o-IKO199x9giG7346k>
X-ME-Received: <xmr:OFv-YteY1dY6O4ATQ96hfBGrkJ2o8UBdWlnoxhHjzH7PUUPiBgRkGDSQvA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehledgieegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeevuddthffgfeeiffejgfeghfeludegkedtgefgffejtdegtddvleduvdfh
 teehveenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggt
 hh
X-ME-Proxy: <xmx:OFv-YrKpWv2QM74J0-xWujbdUgcE3V56GmPDsPu8q3osVUebdxqsPw>
 <xmx:OFv-YiLxa1wCF6AU95HNuaOQYlymPhHHcDpNseqE1P8hRDE5kqKS_g>
 <xmx:OFv-YszT2JwRE0EKsOdHk8fGMEyVZQ1Ox2NB1FXHDNfzzewjIGhnFA>
 <xmx:OVv-Yi7g6GJ7u7ml1Q6EnLVRN5lnPYqOwokiIL5aN8jHgi551F2z4v7DD8o>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 18 Aug 2022 11:31:03 -0400 (EDT)
Date: Thu, 18 Aug 2022 17:31:01 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH v1 05/35] drm/connector: Add TV standard property
Message-ID: <20220818153101.c25x33vkl6qboswe@houat>
References: <20220728-rpi-analog-tv-properties-v1-5-3d53ae722097@cerno.tech>
 <9fdecae2-80ad-6212-0522-7dccf9fb57be@tronnes.org>
 <20220816082612.grebxql5ynnfnvfd@houat>
 <ea6ebdda-f779-78af-1ffd-bd86d715077f@tronnes.org>
 <20220816094922.oqhrhefv327zo2ou@houat>
 <be9b6b71-fa2a-3290-2bce-901342e01981@tronnes.org>
 <20220817114605.jpb3tlnoseyvf65d@houat>
 <30f3005d-0acc-e5af-10ca-cf46f18b3478@tronnes.org>
 <133c2a1d-0b4c-cef9-11fe-9ce9985253d6@tronnes.org>
 <9daca9bf-838e-c3eb-51de-1cf5188a9341@tronnes.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="neorrh2qu6ghuw3r"
Content-Disposition: inline
In-Reply-To: <9daca9bf-838e-c3eb-51de-1cf5188a9341@tronnes.org>
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


--neorrh2qu6ghuw3r
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 18, 2022 at 05:01:38PM +0200, Noralf Tr=F8nnes wrote:
>=20
>=20
> Den 18.08.2022 01.23, skrev Noralf Tr=F8nnes:
> >=20
> >=20
> > Den 17.08.2022 15.11, skrev Noralf Tr=F8nnes:
> >>
> >>
> >> Den 17.08.2022 13.46, skrev Maxime Ripard:
> >>> On Tue, Aug 16, 2022 at 09:35:24PM +0200, Noralf Tr=F8nnes wrote:
> >>>> Den 16.08.2022 11.49, skrev Maxime Ripard:
> >>>>> On Tue, Aug 16, 2022 at 11:42:20AM +0200, Noralf Tr=F8nnes wrote:
> >>>>>> Den 16.08.2022 10.26, skrev Maxime Ripard:
> >>>>>>> Hi,
> >>>>>>>
> >>>>>>> On Mon, Aug 08, 2022 at 02:44:56PM +0200, Noralf Tr=F8nnes wrote:
> >>>>>>>> Den 29.07.2022 18.34, skrev Maxime Ripard:
> >>>>>>>>> The TV mode property has been around for a while now to select =
and get the
> >>>>>>>>> current TV mode output on an analog TV connector.
> >>>>>>>>>
> >>>>>>>>> Despite that property name being generic, its content isn't and=
 has been
> >>>>>>>>> driver-specific which makes it hard to build any generic behavi=
our on top
> >>>>>>>>> of it, both in kernel and user-space.
> >>>>>>>>>
> >>>>>>>>> Let's create a new bitmask tv norm property, that can contain a=
ny of the
> >>>>>>>>> analog TV standards currently supported by kernel drivers. Each=
 driver can
> >>>>>>>>> then pass in a bitmask of the modes it supports.
> >>>>>>>>>
> >>>>>>>>> We'll then be able to phase out the older tv mode property.
> >>>>>>>>>
> >>>>>>>>> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> >>>>>>>>>
> >=20
> >>>> How do you test the property? I've used modetest but I can only chan=
ge
> >>>> to a tv.mode that matches the current display mode. I can't switch f=
rom
> >>>> ntsc to pal for instance.
> >>>
> >>> Yep, if you want to change from PAL to NTSC, it will require a new mo=
de.
> >>>
> >>
> >> So userspace has to check tv.mode first and then create a display mode
> >> the driver will accept if switching to a different display mode is
> >> necessary? In other words, userspace can't discover from the kernel
> >> which display modes a certain tv.mode/norm provides before it is
> >> selected? If so, maybe libdrm should have some function(s) to deal with
> >> switching between modes that require a different display mode since
> >> knowledge about which display modes a tv.mode supports is needed before
> >> hand.
> >>
> >=20
> > I haven't used vc4 on Pi4 in mainline before and have finally gotten it
> > to work.
> >=20
> > I see that the connector reports 2 modes that together fit all tv.norms
> > so userspace doesn't have to contruct a display mode, but it does need
> > to know which display mode belongs to a certain tv.norm.
> >=20
> > When I try to use modetest I'm unable to set a mode:
> >=20
> > pi@pi4t:~ $ modetest -M vc4 -s 45:720x480i
> > setting mode 720x480i-29.97Hz on connectors 45, crtc 68
> > failed to set mode: Function not implemented
> >=20
> > The errno is misleading, modetest does a drmModeDirtyFB before checking
> > the error returned by drmModeSetCrtc.
> >=20
> > Setting the property succeeds, but the modeset still fails:
> >=20
> > pi@pi4t:~ $ modetest -M vc4 -s 45:720x480i -w 45:"tv norm":2
> > setting mode 720x480i-29.97Hz on connectors 45, crtc 68
> > failed to set mode: Function not implemented
> >=20
> > pi@pi4t:~ $ modetest -M vc4 -c
> >         37 tv norm:
> >                 flags: bitmask
> >                 values: NTSC-443=3D0x1 NTSC-J=3D0x2 NTSC-M=3D0x4 PAL-B=
=3D0x10
> > PAL-M=3D0x200 PAL-N=3D0x400 SECAM-B=3D0x2000
> >                 value: 2
> >=20
> > Here's the log, can you see if there's anything obvious in there:
> > https://gist.github.com/notro/a079498bf6b64327105752b2bafa8858
> >=20
>=20
> I'm one step closer as I now have fbcon working, I had forgotten to add
> enable_tvout=3D1 and I had disable_fw_kms_setup=3D1 which disables the
> video=3D mode on the kernel commandline.
>=20
> modetest still fails though, after alot of printk sprinkling, I've
> tracked it down to the drm_mode_equal test in
> drm_atomic_helper_connector_tv_check(). The aspect ratios differ:
>=20
> [   61.336295] drm_atomic_helper_connector_tv_check:
> mode->picture_aspect_ratio=3D1
> [   61.336301] drm_atomic_helper_connector_tv_check:
> &crtc_state->mode->picture_aspect_ratio=3D0

I haven't seen this when testing, but I'll have a look, thanks!
Maxime

--neorrh2qu6ghuw3r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYv5bNQAKCRDj7w1vZxhR
xdaLAQDfZ8rnYBDZfyN3qNMxZCR7YqMUNw8GId3H6w/a4n0wnwD9GeUKIJz3PUw0
hmv+huFdsLIyqvj6T79wwzxtYJk+3gY=
=PX5K
-----END PGP SIGNATURE-----

--neorrh2qu6ghuw3r--
