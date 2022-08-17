Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E37AB5A0130
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 20:14:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A7E7BEBD7;
	Wed, 24 Aug 2022 18:14:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CEAE8DB6C
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 11:46:12 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 4F1152B06406;
 Wed, 17 Aug 2022 07:46:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 17 Aug 2022 07:46:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1660736768; x=1660743968; bh=lUH/6UgCMW
 ECcvdrSrFSpz1gNDkIIpOrqzpmSxHmlQo=; b=k5bJNLyLM5pDagUtc7MW21WdhX
 4KEluTlxo34sQoPto6jW4E6lNQBoZ0yX8HtDywj3Y+jjciX3OccGOsX7XklakhZ3
 E2BVN0GZUjcu1zpfvPoazXdLOLZvnPWpUglfEbULcn/QdIm0sKQwCp+yi9t5bxqh
 xBm+BQuqUxKN76PQJgUeuDZr0mg8bTAkp8c4gxohrpleyRMgswENdh3VxsANWsYg
 sPTb5immdvMuzrPFhiHX2WoP+9dHoAR8GBfPXI7Z25hHrac0NE9yTwRTu2H4a26d
 SWGx6eGihA7T6UboSJf9bJ1SsCA/SuVUYWlnl4dtKxGoGI4GeSsRhEHegz7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1660736768; x=1660743968; bh=lUH/6UgCMWECcvdrSrFSpz1gNDkI
 IpOrqzpmSxHmlQo=; b=TtYOmTWfik5H82ZvdUxTfDwW+oad2YxPVtBamul4Akri
 4ZT8EnQAONWpWgTIDBGkANXYyv4YJmmkbHOnTOO03JEPBAezwkDzlJlGHnk5jFrS
 ++Mwn3fr98+rpdPxPdbo9abs1GVvwlfNfoIUjv2WDGNXF/aIim02m3xp4D2+6GMV
 P/lkT/dGb9CTKHrM2CKWYoNxK9KC6cby5d3Q9vFbXilAdBnePauBMaCwYiLEqyc+
 6EPl8/IluLiNq7dZCiXvk8qzKzF40S0U5VwGPEhR5HppmQ4Om8eNcPN6MqIJ34S6
 iQgWkKanH7ieDQVfXAlgTx9RbuV3IrWeRJf9meVcXw==
X-ME-Sender: <xms:ANX8YqZ6GCsp05N_ZOQV8TbelC46VbTPDRPRFgTUCaNEe_sH3T1P7A>
 <xme:ANX8YtZ4m6Qe98LxIWD9kWOX84iFwapUQTnv6Xp23u89HAw59nq2G6c8DQdf_fjbE
 0Wd1yfLoG4kozL5HxE>
X-ME-Received: <xmr:ANX8Yk8Pa7VMvsVhma5BRAQffhdG-eEffvVh6MXKIJa7mFWDU9nheWtOpg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehiedggeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedukeevvdehheeuhefhhfefteeiffefgeffuefgkeetffevgeevgeejteei
 gffghfenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghenucevlhhushhtvg
 hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhn
 ohdrthgvtghh
X-ME-Proxy: <xmx:ANX8YsrqDVLKwjBT9wMSx86sZmqgMbulwVaMD6MccZggHG_aWRoHzw>
 <xmx:ANX8Ylo4Wkvi_p49TeLnj7TZda07cy2MaPONaaY8oLcyi0zmIOFizg>
 <xmx:ANX8YqR26aOF3wmmwnhNwo1XcnVGuYO5zF1kwybHjXXsMqNbESvayw>
 <xmx:ANX8YubfjbQvH87Kp37hyOJ-C5O2pUu9HwQzMfrXg0oCONzbZLXVZa85pGk>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 17 Aug 2022 07:46:07 -0400 (EDT)
Date: Wed, 17 Aug 2022 13:46:05 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH v1 05/35] drm/connector: Add TV standard property
Message-ID: <20220817114605.jpb3tlnoseyvf65d@houat>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-5-3d53ae722097@cerno.tech>
 <9fdecae2-80ad-6212-0522-7dccf9fb57be@tronnes.org>
 <20220816082612.grebxql5ynnfnvfd@houat>
 <ea6ebdda-f779-78af-1ffd-bd86d715077f@tronnes.org>
 <20220816094922.oqhrhefv327zo2ou@houat>
 <be9b6b71-fa2a-3290-2bce-901342e01981@tronnes.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="czkluqawi3ha2o5u"
Content-Disposition: inline
In-Reply-To: <be9b6b71-fa2a-3290-2bce-901342e01981@tronnes.org>
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


--czkluqawi3ha2o5u
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 16, 2022 at 09:35:24PM +0200, Noralf Tr=F8nnes wrote:
> Den 16.08.2022 11.49, skrev Maxime Ripard:
> > On Tue, Aug 16, 2022 at 11:42:20AM +0200, Noralf Tr=F8nnes wrote:
> >> Den 16.08.2022 10.26, skrev Maxime Ripard:
> >>> Hi,
> >>>
> >>> On Mon, Aug 08, 2022 at 02:44:56PM +0200, Noralf Tr=F8nnes wrote:
> >>>> Den 29.07.2022 18.34, skrev Maxime Ripard:
> >>>>> The TV mode property has been around for a while now to select and =
get the
> >>>>> current TV mode output on an analog TV connector.
> >>>>>
> >>>>> Despite that property name being generic, its content isn't and has=
 been
> >>>>> driver-specific which makes it hard to build any generic behaviour =
on top
> >>>>> of it, both in kernel and user-space.
> >>>>>
> >>>>> Let's create a new bitmask tv norm property, that can contain any o=
f the
> >>>>> analog TV standards currently supported by kernel drivers. Each dri=
ver can
> >>>>> then pass in a bitmask of the modes it supports.
> >>>>>
> >>>>> We'll then be able to phase out the older tv mode property.
> >>>>>
> >>>>> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> >>>>>
> >>>>
> >>>> Please also update Documentation/gpu/kms-properties.csv
> >>>>
> >>>> Requirements for adding a new property is found in
> >>>> Documentation/gpu/drm-kms.rst
> >>>
> >>> I knew this was going to be raised at some point, so I'm glad it's th=
at
> >>> early :)
> >>>
> >>> I really don't know what to do there. If we stick by our usual rules,
> >>> then we can't have any of that work merged.
> >>>
> >>> However, I think the status quo is not really satisfactory either.
> >>> Indeed, we have a property, that doesn't follow those requirements
> >>> either, with a driver-specific content, and that stands in the way of
> >>> fixes and further improvements at both the core framework and driver
> >>> levels.
> >>>
> >>> So having that new property still seems like a net improvement at the
> >>> driver, framework and uAPI levels, even if it's not entirely following
> >>> the requirements we have in place.
> >>>
> >>> Even more so since, realistically, those kind of interfaces will never
> >>> get any new development on the user-space side of things, it's
> >>> considered by everyone as legacy.
> >>>
> >>> This also is something we need to support at some point if we want to
> >>> completely deprecate the fbdev drivers and provide decent alternatives
> >>> in KMS.
> >>>
> >>> So yeah, strictly speaking, we would not qualify for our requirements
> >>> there. I still think we have a strong case for an exception though.
> >>
> >> Which requirements would that be? The only one I can see is the
> >> documentation and maybe an IGT test.
> >=20
> > This is the one I had in mind
> > https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#open-source-user=
space-requirements
> >=20
>=20
> Oh right, I had forgotten about that one.
>=20
> One benefit of having a userspace implementation is that it increases
> the chance of widespread adoption having a working implementation to
> look at. I don't think the reason tv.mode is not used anywhere (that I
> know of) is because the driver picks the enum values resulting in no
> standard names.

It probably doesn't help, but it's not what I was implying.

> It's a niche thing and way down on the todo list. nouveau and ch7006
> has a tv_norm module parameter which certainly doesn't help in moving
> people/projects over to the DRM property (downstream rpi also has it
> now).

Yeah, the RPi version is part of the reason I started working on this.
We should also consider the named modes used by vc4 and sun4i. All these
ad-hoc solutions are limited and (I think) come from the fact that we
don't have a solution easy enough to use for drivers (and to discover).

nouveau, ch7006, i915 and vc4 are using the tv.mode property for
example, but sun4i and meson don't.

sun4i relies on named modes to reimplement TV modes, but meson doesn't
at all.

And then nouveau has that extra command line parameter to set it up at
boot time.

It doesn't really make much sense to me, when all drivers have very
similar needs, that none of them behave in the same way. And I think the
non-standard property is partly to blame for this, since without some
generic content we can't share code.

This is what this series is about: every driver having similar
capabilities and as trivially as possible.

> mpv[1] is a commandline media player that after a quick look might be a
> candidate for implementing the property without too much effort.

Kodi might be another one. I can try to hack something around, but I'm
really skeptical about whether a PR would be merged or not.

> How do you test the property? I've used modetest but I can only change
> to a tv.mode that matches the current display mode. I can't switch from
> ntsc to pal for instance.

Yep, if you want to change from PAL to NTSC, it will require a new mode.

> I have tried changing mode on rpi-5.15 (which I will switch to for the
> gud gadget), but I always end up with flip timeouts when changing the val=
ue:
>=20
> $ cat /proc/cpuinfo | grep Model
> Model           : Raspberry Pi 4 Model B Rev 1.1
> $ uname -a
> Linux pi4t 5.15.56-v7l+ #1575 SMP Fri Jul 22 20:29:46 BST 2022 armv7l
> GNU/Linux
> $ sudo dmesg -C
> $ modetest -M vc4 -s 45:720x480i -w 45:mode:1
> setting mode 720x480i-29.97Hz on connectors 45, crtc 73
> failed to set gamma: Function not implemented
>=20
> $ dmesg
> $ modetest -M vc4 -s 45:720x480i -w 45:mode:0
> setting mode 720x480i-29.97Hz on connectors 45, crtc 73
> failed to set gamma: Function not implemented
>=20
> $ dmesg
> [   95.193059] [drm:drm_atomic_helper_wait_for_flip_done
> [drm_kms_helper]] *ERROR* [CRTC:73:crtc-1] flip_done timed out
> [  105.433112] [drm:drm_crtc_commit_wait [drm]] *ERROR* flip_done timed o=
ut
> [  105.433519] [drm:drm_atomic_helper_wait_for_dependencies
> [drm_kms_helper]] *ERROR* [CRTC:73:crtc-1] commit wait timed out
> [  115.673095] [drm:drm_crtc_commit_wait [drm]] *ERROR* flip_done timed o=
ut
> [  115.673498] [drm:drm_atomic_helper_wait_for_dependencies
> [drm_kms_helper]] *ERROR* [PLANE:63:plane-1] commit wait timed out
> [  125.913106] [drm:drm_crtc_commit_wait [drm]] *ERROR* flip_done timed o=
ut
> [  125.913510] vc4-drm gpu: [drm] *ERROR* Timed out waiting for commit
> [  136.153411] [drm:drm_atomic_helper_wait_for_flip_done
> [drm_kms_helper]] *ERROR* [CRTC:73:crtc-1] flip_done timed out

So I haven't tested with 5.15, but I tested it with this series and it
was working well, both with the compat layer and the new property.

Maxime

--czkluqawi3ha2o5u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYvzU/QAKCRDj7w1vZxhR
xS08AP9NeNCOAupd5XSF/H7nXearx83tEnIfYGr1rThuL9TcCAD/QTdia92C4K8J
7zspmuJTy2qJsfCJ88kCd5IetNDNOwU=
=cF9j
-----END PGP SIGNATURE-----

--czkluqawi3ha2o5u--
