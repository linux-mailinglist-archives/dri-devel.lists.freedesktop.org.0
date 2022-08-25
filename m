Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE21D5A1699
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 18:21:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2F7E10E50E;
	Thu, 25 Aug 2022 16:21:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC0AA10E50E
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 16:21:45 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 0C98B580A57;
 Thu, 25 Aug 2022 12:21:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 25 Aug 2022 12:21:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1661444505; x=1661451705; bh=ffryBeiLER
 xZ18rSzWKBxa26JmdAATr3HR4uoN7gmX8=; b=smJ6Y6HVbGKwPVLIKiIutBVZge
 aHYNCVrrgiZoecqDp/rfZqo2zD8c4N3OIWytAfyd1Yt82quXes2MtLXd6AVxVDbZ
 kAVuoEr78uczCSNHymFODfNXf9Ava/Bos8kpsm6d6TMITDg9myez3iQihobliGyy
 NHNj3K9Ni3Mb3MbooWPXix2iwLSiLBNS8rc3ImZfoi/u+FmkL2olo+Yq0p4IJmgE
 HMZH4tYWsRKJ7dzRcGAJ8L/lVdl2QU5/FBFWghMMy6ek8Fxg+V7xEuGvcxDAsWDH
 X9BePxKmCopDKL0ekC1XELu0HmMR1y3760HBSnwq4xR6j51WnKFornQ6iGbg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1661444505; x=1661451705; bh=ffryBeiLERxZ18rSzWKBxa26JmdA
 ATr3HR4uoN7gmX8=; b=b+S2wmlaUtFdqMfQdX2ybkJ+oxwShQpCikUH1Ifva6Ig
 ZIBGPZBGRMS8Jvf8lktHhLq97kORTShZHTnd58s+rvalSmAlIAPrEO3I3ZL1DJad
 fDgqYDeZyYeEFWI5nniypYa+xomwgBRiM3ajrx2evM2e/JB8DxuydAMWGjKAXIFK
 GEiGpSPPa8qqdnVbCItA38EWBnBENg3aGX/dbMNqe3d26SVQpEuLnRpDJ9o38E4G
 fYzwHZexWit6XUrXP2pxxRNaNsxRB+/uxzU+9cWQPAyLG+70ajJUMRXbewmNX6LR
 XtAmWHxCp2sjn47ntfbFAFY7M0Chg9ZC2vu2SBV35w==
X-ME-Sender: <xms:l6EHYz2oPtBQNsOizdpT6d-aYWsjI24R8TdEQDUpA9kmEpBdVfw7sA>
 <xme:l6EHYyGMBjwl6AF-JAlubWWp-4YV677ERJL0OiRrHyN0aQyU_a2Ix5izRL1uosNL8
 MU2uUy5S8BHgnqHRXo>
X-ME-Received: <xmr:l6EHYz6oezSr9fWG8U_bDahH2E3tiXFmHZChBLRI3TLg0pNrIhottbVmuOw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdejfedgleejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeejveefheefkeeiffegveelveetgffffeektdefuefhtedtgeejhefggedu
 ffffudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:l6EHY43C2ZNlARAD1PV3Qok-aSsKN4yZIojIIZASIBqJww7rfkqQMw>
 <xmx:l6EHY2FIwnQ4hKQa6KTCSFaB_I_ICyYkR06-g9T30-Uw_B5sKlbxjg>
 <xmx:l6EHY5-TEpxc619HRc9pnbp1GFe5kF2AAKJfM7YhSJ-icrUa2JTX6g>
 <xmx:maEHY_2kJUPdQjQNairkaPfVG4PWZTJprXnt14gCf8CJWNMQ77097Q>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 25 Aug 2022 12:21:43 -0400 (EDT)
Date: Thu, 25 Aug 2022 18:21:40 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH v1 00/35] drm: Analog TV Improvements
Message-ID: <20220825162140.oaob4szbssf6cuvq@houat>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <987d6114-5fcb-d668-3b0d-ad6d8723dfdb@tronnes.org>
 <20220822074800.qzyctchqn5usr55g@houat>
 <2f279dd9-9a6b-8bd2-9d54-b7bd39852ba9@tronnes.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="enc54xhe4czqcd66"
Content-Disposition: inline
In-Reply-To: <2f279dd9-9a6b-8bd2-9d54-b7bd39852ba9@tronnes.org>
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


--enc54xhe4czqcd66
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 22, 2022 at 03:21:29PM +0200, Noralf Tr=F8nnes wrote:
>=20
>=20
> Den 22.08.2022 09.48, skrev Maxime Ripard:
> > Hi,
> >=20
> > On Sun, Aug 21, 2022 at 06:33:12PM +0200, Noralf Tr=F8nnes wrote:
> >> Den 29.07.2022 18.34, skrev Maxime Ripard:
> >>> Hi,
> >>>
> >>> Here's a series aiming at improving the command line named modes supp=
ort,
> >>> and more importantly how we deal with all the analog TV variants.
> >>>
> >>> The named modes support were initially introduced to allow to specify=
 the
> >>> analog TV mode to be used.
> >>>
> >>> However, this was causing multiple issues:
> >>>
> >>>   * The mode name parsed on the command line was passed directly to t=
he
> >>>     driver, which had to figure out which mode it was suppose to matc=
h;
> >>>
> >>>   * Figuring that out wasn't really easy, since the video=3D argument=
 or what
> >>>     the userspace might not even have a name in the first place, but
> >>>     instead could have passed a mode with the same timings;
> >>>
> >>>   * The fallback to matching on the timings was mostly working as lon=
g as
> >>>     we were supporting one 525 lines (most likely NSTC) and one 625 l=
ines
> >>>     (PAL), but couldn't differentiate between two modes with the same
> >>>     timings (NTSC vs PAL-M vs NSTC-J for example);=20
> >>>
> >>>   * There was also some overlap with the tv mode property registered =
by=20
> >>>     drm_mode_create_tv_properties(), but named modes weren't interact=
ing
> >>>     with that property at all.
> >>>
> >>>   * Even though that property was generic, its possible values were
> >>>     specific to each drivers, which made some generic support difficu=
lt.
> >>>
> >>> Thus, I chose to tackle in multiple steps:
> >>>
> >>>   * A new TV norm property was introduced, with generic values, each =
driver
> >>>     reporting through a bitmask what standard it supports to the user=
space;
> >>>
> >>>   * This option was added to the command line parsing code to be able=
 to
> >>>     specify it on the kernel command line, and new atomic_check and r=
eset
> >>>     helpers were created to integrate properly into atomic KMS;
> >>>
> >>>   * The named mode parsing code is now creating a proper display mode=
 for
> >>>     the given named mode, and the TV standard will thus be part of the
> >>>     connector state;
> >>>
> >>>   * Two drivers were converted and tested for now (vc4 and sun4i), wi=
th
> >>>     some backward compatibility code to translate the old TV mode to =
the
> >>>     new TV mode;
> >>>
> >>> Unit tests were created along the way. Nouveau, ch7006 and gud are
> >>> currently broken for now since I expect that work to be reworked fair=
ly
> >>> significantly. I'm also not entirely sure about how to migrate GUD to=
 the
> >>> new property.
> >>>
> >>> Let me know what you think,
> >>> Maxime
> >>>
> >>
> >> I don't know if it's related to this patchset or not, but I do get thi=
s:
> >>
> >> pi@pi4t:~ $ sudo dmesg -C && sudo modprobe -r vc4 && sudo modprobe vc4
> >> && dmesg
> >> [  430.066211] Console: switching to colour dummy device 80x30
> >> [  431.294788] vc4-drm gpu: bound fe400000.hvs (ops vc4_hvs_ops [vc4])
> >> [  431.295115] vc4-drm gpu: bound fec13000.vec (ops vc4_vec_ops [vc4])
> >> [  431.295467] vc4-drm gpu: bound fe004000.txp (ops vc4_txp_ops [vc4])
> >> [  431.295804] vc4-drm gpu: bound fec12000.pixelvalve (ops vc4_crtc_ops
> >> [vc4])
> >> [  431.298895] [drm] Initialized vc4 0.0.0 20140616 for gpu on minor 0
> >> [  441.444250] vc4-drm gpu: [drm] *ERROR* [CRTC:68:crtc-1] flip_done
> >> timed out
> >> [  441.446529] Console: switching to colour frame buffer device 90x30
> >> [  451.684321] vc4-drm gpu: [drm] *ERROR* flip_done timed out
> >> [  451.684347] vc4-drm gpu: [drm] *ERROR* [CRTC:68:crtc-1] commit wait
> >> timed out
> >> [  461.924255] vc4-drm gpu: [drm] *ERROR* flip_done timed out
> >> [  461.924281] vc4-drm gpu: [drm] *ERROR* [CONNECTOR:45:Composite-1]
> >> commit wait timed out
> >> [  472.164006] vc4-drm gpu: [drm] *ERROR* flip_done timed out
> >> [  472.164031] vc4-drm gpu: [drm] *ERROR* [PLANE:61:plane-1] commit wa=
it
> >> timed out
> >> [  482.403877] vc4-drm gpu: [drm] *ERROR* flip_done timed out
> >> [  482.403903] vc4-drm gpu: [drm] *ERROR* Timed out waiting for commit
> >> [  492.643799] vc4-drm gpu: [drm] *ERROR* [CRTC:68:crtc-1] flip_done
> >> timed out
> >> [  492.647073] vc4-drm gpu: [drm] fb0: vc4drmfb frame buffer device
> >=20
> > Module unloading/reloading has been janky for a while.
> >=20
> > I've fixed it up recently but it doesn't surprise me that there's still
> > some situation that won't work. Is it on a Pi3?
> >=20
>=20
> It's a Pi4.

With which kernel? I just tested it on last next and it seems to work ok
there. I've fixed it recently though, so it's only in drm-misc-next and
linux-next at the moment.

Maxime

--enc54xhe4czqcd66
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYwehlAAKCRDj7w1vZxhR
xct8AP9/rTOSwfdGIC9F0MU7L6156bcNmS4ECMS26UPtAyaQewD/XKT1ltAPV40P
IadRg1U9Dg8zdgreBKwkVCoRDZCUpg0=
=4K9Z
-----END PGP SIGNATURE-----

--enc54xhe4czqcd66--
