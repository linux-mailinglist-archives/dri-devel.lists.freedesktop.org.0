Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B81A598783
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 17:32:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1347114AFF4;
	Thu, 18 Aug 2022 15:28:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6766C14A4F0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 15:28:07 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 4FB842B05FCF;
 Thu, 18 Aug 2022 11:28:04 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 18 Aug 2022 11:28:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1660836483; x=1660843683; bh=6FsHnpNj1X
 NQs1LkYJCx5q4rNXikQWdbYINV1/aUmLY=; b=teh/hGnEGl/O9Ux1hSaQrY5XYD
 RLxjNNO0ibtQfJiyJME/aslzZC+NHAJuT9quEayUXnPr7Jznb/tFoojn1AEJlKol
 vVVkL+9ZshpmkIAxarjDnW1trHUgWaBrckM2x6/dNqf1wUa1aHkQ2JBMxv03mg7o
 cm0pLuSDpMuIO0re3rLiU5TEo/L48NmDZBKNQEGILfuiQC9K463/uV3Cs6t9eRsC
 Vcmz7/bhyyQfPbteXgzCzjdkJMUN0QsRaNivjJjz4Oya3Fkbwv9BmB+bZO5bboS+
 qNHnNh5xLgfY5rro0PvTy++JOT5RPdRp7qHgAfhnFzHNyZLYcL7pS5u5kOPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1660836483; x=1660843683; bh=6FsHnpNj1XNQs1LkYJCx5q4rNXik
 QWdbYINV1/aUmLY=; b=brg1NAx9g1kR7w1SveWnb1vZrTF56k+eCed14soKTT4F
 n/S8cpoOuNh2oMjb8LH1exCpr7lsWFf8uj4nm6L3XHHqXDMAmsSIdpJWFOYwxlQF
 Jed/1yacS/KE2hfb04+0pci+QHFoLMqV/D+y47ALqiVGot7s/d86HsaYEy8PGdVi
 jHV4w348sNGCR6b1+2h4W9GiAq0OIUfbeXGZ8pENwa2J0QfSh/rBzHIHXKtbdQm9
 XyS5fX49mtQMiM8w/O2Sf58E8XB1jNCt0nYnRA2WvPyaXvZlDDndjs1v0FCeXlK3
 u5MKhIJc08ro0skWj0VRbq+4ZlcFw+JP6DWLGMIvog==
X-ME-Sender: <xms:glr-YsmlISVGs-4xd5eOSVvsJUjg1v7lBEULjHv_jcDQLT20JQ1JjA>
 <xme:glr-Yr1IiHXr1qJqc6JB1kJagV0nZnI9OKCrPaHlHasU466s8_czs7idU_gGtZQwO
 bvwn9LXot5gdRQSIHs>
X-ME-Received: <xmr:glr-Yqoe_Wd6Q6uuNgpZ01fY_n3V_Kj4LkmnZODYpxIc0t0EVb32CqFI_w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehledgieegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedukeevvdehheeuhefhhfefteeiffefgeffuefgkeetffevgeevgeejteei
 gffghfenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghenucevlhhushhtvg
 hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhn
 ohdrthgvtghh
X-ME-Proxy: <xmx:g1r-Yok27qWAiWQ9c0Yh_x4o4smBHW3HFNXrCNbWovn6MoWGAHpy1A>
 <xmx:g1r-Yq0S_PsWMpOhQCZtHjeJvzM-BAubJ-b1A7fKWQchPMp6SaflrQ>
 <xmx:g1r-Yvv9fYFHKPAnPKACRVUEzj64s9YrJNkMo1nCERpRJfNIXRdT0w>
 <xmx:g1r-YolY8veEi1pY0esB-TPcxS2Z8cqaYW7IR2oz2HCPOoCdAWaK3F4_u-g>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 18 Aug 2022 11:28:02 -0400 (EDT)
Date: Thu, 18 Aug 2022 17:27:59 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH v1 05/35] drm/connector: Add TV standard property
Message-ID: <20220818152759.yyi3myfdlkbzuior@houat>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-5-3d53ae722097@cerno.tech>
 <9fdecae2-80ad-6212-0522-7dccf9fb57be@tronnes.org>
 <20220816082612.grebxql5ynnfnvfd@houat>
 <ea6ebdda-f779-78af-1ffd-bd86d715077f@tronnes.org>
 <20220816094922.oqhrhefv327zo2ou@houat>
 <be9b6b71-fa2a-3290-2bce-901342e01981@tronnes.org>
 <20220817114605.jpb3tlnoseyvf65d@houat>
 <30f3005d-0acc-e5af-10ca-cf46f18b3478@tronnes.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="yeug4snx335h3u7q"
Content-Disposition: inline
In-Reply-To: <30f3005d-0acc-e5af-10ca-cf46f18b3478@tronnes.org>
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


--yeug4snx335h3u7q
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 17, 2022 at 03:11:56PM +0200, Noralf Tr=F8nnes wrote:
> Den 17.08.2022 13.46, skrev Maxime Ripard:
> > On Tue, Aug 16, 2022 at 09:35:24PM +0200, Noralf Tr=F8nnes wrote:
> >> Den 16.08.2022 11.49, skrev Maxime Ripard:
> >>> On Tue, Aug 16, 2022 at 11:42:20AM +0200, Noralf Tr=F8nnes wrote:
> >>>> Den 16.08.2022 10.26, skrev Maxime Ripard:
> >>>>> Hi,
> >>>>>
> >>>>> On Mon, Aug 08, 2022 at 02:44:56PM +0200, Noralf Tr=F8nnes wrote:
> >>>>>> Den 29.07.2022 18.34, skrev Maxime Ripard:
> >>>>>>> The TV mode property has been around for a while now to select an=
d get the
> >>>>>>> current TV mode output on an analog TV connector.
> >>>>>>>
> >>>>>>> Despite that property name being generic, its content isn't and h=
as been
> >>>>>>> driver-specific which makes it hard to build any generic behaviou=
r on top
> >>>>>>> of it, both in kernel and user-space.
> >>>>>>>
> >>>>>>> Let's create a new bitmask tv norm property, that can contain any=
 of the
> >>>>>>> analog TV standards currently supported by kernel drivers. Each d=
river can
> >>>>>>> then pass in a bitmask of the modes it supports.
> >>>>>>>
> >>>>>>> We'll then be able to phase out the older tv mode property.
> >>>>>>>
> >>>>>>> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> >>>>>>>
> >>>>>>
> >>>>>> Please also update Documentation/gpu/kms-properties.csv
> >>>>>>
> >>>>>> Requirements for adding a new property is found in
> >>>>>> Documentation/gpu/drm-kms.rst
> >>>>>
> >>>>> I knew this was going to be raised at some point, so I'm glad it's =
that
> >>>>> early :)
> >>>>>
> >>>>> I really don't know what to do there. If we stick by our usual rule=
s,
> >>>>> then we can't have any of that work merged.
> >>>>>
> >>>>> However, I think the status quo is not really satisfactory either.
> >>>>> Indeed, we have a property, that doesn't follow those requirements
> >>>>> either, with a driver-specific content, and that stands in the way =
of
> >>>>> fixes and further improvements at both the core framework and driver
> >>>>> levels.
> >>>>>
> >>>>> So having that new property still seems like a net improvement at t=
he
> >>>>> driver, framework and uAPI levels, even if it's not entirely follow=
ing
> >>>>> the requirements we have in place.
> >>>>>
> >>>>> Even more so since, realistically, those kind of interfaces will ne=
ver
> >>>>> get any new development on the user-space side of things, it's
> >>>>> considered by everyone as legacy.
> >>>>>
> >>>>> This also is something we need to support at some point if we want =
to
> >>>>> completely deprecate the fbdev drivers and provide decent alternati=
ves
> >>>>> in KMS.
> >>>>>
> >>>>> So yeah, strictly speaking, we would not qualify for our requiremen=
ts
> >>>>> there. I still think we have a strong case for an exception though.
> >>>>
> >>>> Which requirements would that be? The only one I can see is the
> >>>> documentation and maybe an IGT test.
> >>>
> >>> This is the one I had in mind
> >>> https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#open-source-us=
erspace-requirements
> >>>
> >>
> >> Oh right, I had forgotten about that one.
> >>
> >> One benefit of having a userspace implementation is that it increases
> >> the chance of widespread adoption having a working implementation to
> >> look at. I don't think the reason tv.mode is not used anywhere (that I
> >> know of) is because the driver picks the enum values resulting in no
> >> standard names.
> >=20
> > It probably doesn't help, but it's not what I was implying.
> >=20
> >> It's a niche thing and way down on the todo list. nouveau and ch7006
> >> has a tv_norm module parameter which certainly doesn't help in moving
> >> people/projects over to the DRM property (downstream rpi also has it
> >> now).
> >=20
> > Yeah, the RPi version is part of the reason I started working on this.
> > We should also consider the named modes used by vc4 and sun4i. All these
> > ad-hoc solutions are limited and (I think) come from the fact that we
> > don't have a solution easy enough to use for drivers (and to discover).
> >=20
> > nouveau, ch7006, i915 and vc4 are using the tv.mode property for
> > example, but sun4i and meson don't.
> >=20
> > sun4i relies on named modes to reimplement TV modes, but meson doesn't
> > at all.
> >=20
> > And then nouveau has that extra command line parameter to set it up at
> > boot time.
> >=20
> > It doesn't really make much sense to me, when all drivers have very
> > similar needs, that none of them behave in the same way. And I think the
> > non-standard property is partly to blame for this, since without some
> > generic content we can't share code.
> >=20
> > This is what this series is about: every driver having similar
> > capabilities and as trivially as possible.
> >=20
> >> mpv[1] is a commandline media player that after a quick look might be a
> >> candidate for implementing the property without too much effort.
> >=20
> > Kodi might be another one. I can try to hack something around, but I'm
> > really skeptical about whether a PR would be merged or not.
> >=20
>=20
> You can ask first before wasting time ofc.

Yep, will do.

> But this baffles me, if you don't think projects like Kodi which is TV
> centered want this, what kind of projects do you think want to use this
> property?

I mean, at this point it's really a consolidation of stuff we have
scattered around the kernel tree, in order to clean up that mess, and
not add more hacks.

And it allows the current effort to move the remaining fbdev drivers
into KMS.

As far as userspace is concerned, I don't know who is still using it
or cares today.

I still believe that refactoring is beneficial though, if only to make
one more nail in fbdev's coffin.

> >> How do you test the property? I've used modetest but I can only change
> >> to a tv.mode that matches the current display mode. I can't switch from
> >> ntsc to pal for instance.
> >=20
> > Yep, if you want to change from PAL to NTSC, it will require a new mode.
>
> So userspace has to check tv.mode first and then create a display mode
> the driver will accept if switching to a different display mode is
> necessary?

I'd expect drivers to expose both 576i and 480i (that's what vc4 and
sun4i are doing), so the userspace can pick them up.

> In other words, userspace can't discover from the kernel which display
> modes a certain tv.mode/norm provides before it is selected?

It's kind of the other way around in my mind, but the userspace would
have to figure out what display mode can use what tv mode, yes.

Even more so since Geert and I are discussing to allow continuous modes,
so we would allow to have modes with the same (active) resolution but a
different tv mode.

> If so, maybe libdrm should have some function(s) to deal with
> switching between modes that require a different display mode since
> knowledge about which display modes a tv.mode supports is needed
> before hand.

I'm not sure what you mean here, sorry. It's fairly easy to update a
property and the mode with atomic?

Maxime

--yeug4snx335h3u7q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYv5afwAKCRDj7w1vZxhR
xfRuAQDN++D+9b1a3nolmTxB1Bd4MnC3JLhRlcGAL1g8twwg8gD/YvzSUYyic04P
8R3j1Ao9EK0juKoA/cGb8nOc1XajUAU=
=cmxn
-----END PGP SIGNATURE-----

--yeug4snx335h3u7q--
