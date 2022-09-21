Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7013D5BFFDA
	for <lists+dri-devel@lfdr.de>; Wed, 21 Sep 2022 16:26:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2EFF10E99B;
	Wed, 21 Sep 2022 14:26:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8718810E986;
 Wed, 21 Sep 2022 14:26:36 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id DBB21580161;
 Wed, 21 Sep 2022 10:26:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 21 Sep 2022 10:26:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1663770395; x=1663777595; bh=XChTmHpAeE
 5M9c5np/GRs73V9CNgry5h5aIpGIs+YS8=; b=cjkhT//iZYy++krKE5xY9gEZsg
 dkNBF36nGCgq126inEPJ0N+tmoZyWwOJxw+KrWj3agesR/gXzNpyv8ZxejZaWuJW
 g5ElUE0ltUEv51f/HHD3+zNv5QD6GGKXkFK3vgXVxOVsGT96Msf199nS2lLEqDKk
 Zhmdnd2UmyoyXjkdxCENrjBJ2jKJS/xM9Z5KVRiWejn0MkybCLklDYUO5MrBYKfZ
 UHe6h/lDeoW5KDc0iEeUDP9u5EdgLs7Vyr+2BeYMyUM6EYDWbHDw2y/Xut0SJbUw
 JjU7Xsq/7MUMbskPrygrfWjpJPOZYAQIgWmGb0s1d+VBO7+r6wCP9BEB1AGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1663770395; x=1663777595; bh=XChTmHpAeE5M9c5np/GRs73V9CNg
 ry5h5aIpGIs+YS8=; b=vGVr0XpHhcoe0eDF2NLj1oLwQ98S5Tu62DUYBY1smZYS
 m5Gj6M2/cpxVMI94QKptQUGjmuVCsPctMuORNbPiThj2earsmcCGzmydLWpX+K1s
 aC5puJdy1uCIauJihvofHDmgQvIf+kYcBYnvQocPw2s/aDxflIDh55AymQOxtzdB
 +SHRYtfMp0JWFWL3SM3FB5x7ETh52ytToWTTfZFP2sw3YhlUlO1CAxrnNW/M7OmI
 hr5qb73094dLk39loyQHDJ63zrpGMdomgMbNtCCgRphZgAto5yQjElm3JM+YbupI
 LZ0XeJfVs3gXXm7zgmWpdI5mPOKDjl0iAKCothPbFg==
X-ME-Sender: <xms:Gx8rY5zc6S-07LyRNNl3T2dn21T4aofE4myVdSepDzCOYbKFMzNcgg>
 <xme:Gx8rY5QyjXLI6W_Np2Dp9zKBOpTUjUqLmWLqLBVBc0dd_rkS7BVdzthgTMK0s1nO7
 m9gIuLtrrNo2GH97vU>
X-ME-Received: <xmr:Gx8rYzXZX5EkUJhPwWHKxSFnt6nRZa6gwILHo3Vt9nTYBdPoRBUaNhkfq1A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeefuddgjeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
 hfevudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Gx8rY7iFtHqOIKygGJNJ5PWzDAnrkDB1y_Vo2b1mxNhupXMk72GRpA>
 <xmx:Gx8rY7AD5IAq5KwdqbwtEnUKs21RqL9gQ0-AXE4YdI2KHCk-WmRBIg>
 <xmx:Gx8rY0JOjEPxH3SWi4xIujyhLRXvKWNFnI4T3Hn9aNei9FRwuCv1hA>
 <xmx:Gx8rY-Zh4TQS-qgwfPMAPuikjeHcF7psfWZdTv8JFlZKjYevIlifQw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 Sep 2022 10:26:34 -0400 (EDT)
Date: Wed, 21 Sep 2022 16:26:32 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: kFYatek <kfyatek@gmail.com>
Subject: Re: [PATCH v2 10/41] drm/modes: Add a function to generate analog
 display modes
Message-ID: <20220921142632.4r5ua7hlb2znhwl2@houat>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-10-459522d653a7@cerno.tech>
 <242d272b-5b79-986c-9aaf-64e62f6b37ff@gmail.com>
 <20220905133755.gcmmntg3wnecyqjq@houat>
 <10ce686a-d7c8-9ce4-3979-735ad8eab3b5@gmail.com>
 <20220907143421.4iopqwhp3yfircsh@houat>
 <dc1d9499-d4d5-1032-f39f-d4ac4cbb8412@gmail.com>
 <20220909140059.g57oihcmhuym62ei@houat>
 <411ebe0f-f398-8e32-ad0e-b42732aa880f@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="w2pwivnclkct2aox"
Content-Disposition: inline
In-Reply-To: <411ebe0f-f398-8e32-ad0e-b42732aa880f@gmail.com>
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
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, Emma Anholt <emma@anholt.net>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Ben Skeggs <bskeggs@redhat.com>,
 linux-sunxi@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>,
 intel-gfx@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-arm-kernel@lists.infradead.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--w2pwivnclkct2aox
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks again for your help

On Sun, Sep 11, 2022 at 06:30:39AM +0200, kFYatek wrote:
> W dniu 9.09.2022 o 16:00, Maxime Ripard pisze:
> > On Wed, Sep 07, 2022 at 11:31:21PM +0200, Mateusz Kwiatkowski wrote:
> >> The "canonical" modelines (at least for vc4's VEC, see the notes below=
):
> >>
> >> - (vfp=3D=3D4, vsync=3D=3D6, vbp=3D=3D39) for 576i
> >> - (vfp=3D=3D7, vsync=3D=3D6, vbp=3D=3D32) for 480i
> >> - (vfp=3D=3D5, vsync=3D=3D6, vbp=3D=3D28) for 486i (full frame NTSC as=
 originally specified)
> >
> > It's not clear to me either how you come up with those timings?
>=20
> Well, experimentally ;)
>=20
> The values for 480i and 576i are the values currently used by the downstr=
eam
> kernel, and those in turn has been copied from the firmware (or more prec=
isely,
> I chose them so that the PV registers end up the same as the values set b=
y the
> firmware).
>=20
> I also checked with an oscilloscope that the waveforms look as they shoul=
d.
> VEC doesn't exactly handle the half-lines at the start and end of the odd=
 field
> right, but otherwise, the blanking and sync pulses are where they should =
be.
>=20
> The 486i values has been constructed from the 480i ones according to the
> calculations from cross-referencing SMPTE documents, see my previous e-ma=
il.
>=20
> I know this is perhaps unsatisfactory ;) I don't have access to the VC4
> documentation, so this was _almost_ reverse engineering for me.

It's not really that it's unsatisfactory, but the function here is
supposed to be generic and thus generate a mode that is supposed to be a
somewhat reasonable for a given set of parameters.

If the vc4 driver needs some adjustments, then it needs to be out of
that function and into the vc4 driver. And this is pretty much what I
struggle with: I have a hard time (on top of everything else) figuring
out what is supposed to be specific to vc4, and what isn't.

I guess your 480i example, since it follows the spec, is fine, but I'm
not sure for 576i.
Maxime

--w2pwivnclkct2aox
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYysfGAAKCRDj7w1vZxhR
xbiwAQDutVhiO12pDVyzStv7qufUZgUU/Gmhl8GpF5Q8FwaX7wD6A+IVCty0oNde
HmrV2wLQgKOhGseektDM0vSrVjJjoQE=
=GhKi
-----END PGP SIGNATURE-----

--w2pwivnclkct2aox--
