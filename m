Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 337E65C00B1
	for <lists+dri-devel@lfdr.de>; Wed, 21 Sep 2022 17:05:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3622F10E4F8;
	Wed, 21 Sep 2022 15:05:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2460010E29E;
 Wed, 21 Sep 2022 15:05:27 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id C21DF5817DE;
 Wed, 21 Sep 2022 11:05:24 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 21 Sep 2022 11:05:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1663772724; x=1663779924; bh=zeS7eGWYYn
 Wb55o8vuEX3/JmL16HTSaXpqzOa1s1OmM=; b=0M0YkAeojZnssmyhGXTFWP/RJZ
 4B8i4ouZeY4Z0QBWU2jdU/tzOhqGkJ1aqGFIB2I04jyXAxjSy0ci//9zfroeC7wM
 LMhxWYautGXCGopjGBLTDH1FfyC+SfUGoOibhhRwdC+Ce/YdLlG9kTXffTYdu7SR
 Hc0N2svmjWpTyfyUzmbi79YgSkM9dkHe907rAXMjcNhnIg88r1LrpeyMcdsqe1KZ
 Qpg4SRjzHeUYWzrbQDI40b2zvETLltU4hWGPw/h6K2UaiJpS2W8tghWMoRUAVmge
 tjzvPmZvnewYbJK1A1qNqwF0DMbHD9+Ozt//ouyH3ZfmFq/OtaSlHd/m/rXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1663772724; x=1663779924; bh=zeS7eGWYYnWb55o8vuEX3/JmL16H
 TSaXpqzOa1s1OmM=; b=Q4FoZUSX4afJiLdXFgUX6H3zrL89vNlEFmSRSXS6LrJ6
 Ef8fRPiTCNuyN3jetlga5TL/UJtnNEdkRiHKaNqeTkfmJUm/QLvlhaQ/+uKMTBFe
 Fb+3rOhcLc/FkboGJOJdAZqcLFHNreA+HtC03cpW58fk9MdfEkFeGmMqWrbnEquy
 fDbRb6aGvmY6bwafdLYJ2wbiKo+8gNZetyJjimUY3wso5RbK4Sk/FUVCjPu5gMq3
 ESVdiPCTFfqTcrc0SBn3ikXEzTmvx1XX5tOximQ1/6HhE2ElwMP7mKT1K0u0fAu7
 sGAzubusb+SRToiLf63KGpTVCM9W/c4bC5cX/8gqBQ==
X-ME-Sender: <xms:MSgrY-G_PEpPNWtp560qTOommMGyn_lvYh-L40-DoB_gukOyFQGN7w>
 <xme:MSgrY_X0o3nseHlFj2vqJkhlbZZEboNKfIPc_XARZ6J_Cb07Jl0W52snqCvhp5DeC
 Bj6pI2gP_jwhcWXvek>
X-ME-Received: <xmr:MSgrY4LCH1jS7ypIzTVdEztXDwdSWwob65j5lysqYD5Vfi0tZZy0PIYlOck>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeefuddgkeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeejveefheefkeeiffegveelveetgffffeektdefuefhtedtgeejhefggedu
 ffffudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:MigrY4EJAl-jotY3IGkRPhoXT0kp79JD_LmDPDSLYdwZDIgMKphrig>
 <xmx:MigrY0W2lyWqHBTMC74oLOnUbExtmb_Fqy8L8bpi_uL6I7qDOIaNXg>
 <xmx:MigrY7M13a3l5SVv7Sdl9LGvAfdBiKexsZQFIf5gfnVFl_yq4As86w>
 <xmx:NCgrYzPgN6L8k4xVAuYjZlFnCc6phS1DYSqtqC40QZTz7DYuI4Os_w>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 Sep 2022 11:05:21 -0400 (EDT)
Date: Wed, 21 Sep 2022 17:05:19 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Mateusz Kwiatkowski <kfyatek@gmail.com>
Subject: Re: [PATCH v2 10/41] drm/modes: Add a function to generate analog
 display modes
Message-ID: <20220921150519.hijgemsk7o2tdrb3@houat>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-10-459522d653a7@cerno.tech>
 <242d272b-5b79-986c-9aaf-64e62f6b37ff@gmail.com>
 <20220905133755.gcmmntg3wnecyqjq@houat>
 <10ce686a-d7c8-9ce4-3979-735ad8eab3b5@gmail.com>
 <20220907143421.4iopqwhp3yfircsh@houat>
 <dc1d9499-d4d5-1032-f39f-d4ac4cbb8412@gmail.com>
 <20220909135444.5oi6oh6nqwuke3jl@houat>
 <79ab3fef-fdaa-e191-d839-4af88191e672@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="f6nvjv3uvyvilujx"
Content-Disposition: inline
In-Reply-To: <79ab3fef-fdaa-e191-d839-4af88191e672@gmail.com>
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


--f6nvjv3uvyvilujx
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Sep 11, 2022 at 06:48:50AM +0200, Mateusz Kwiatkowski wrote:
> >> Those extra vbp lines will be treated as a black bar at the top of the=
 frame,
> >> and extra vfp lines will be at the bottom of the frame.
> >>
> >> However if someone specifies e.g. 720x604, there's nothing more you co=
uld
> >> remove from vfp, so your only option is to reduce vbp compared to the =
standard
> >> mode, so you'll end up with (vfp=3D=3D4, vsync=3D=3D6, vbp=3D=3D11). T=
he image will not be
> >> centered, the topmost lines will get cropped out, but that's the best =
we can do
> >> and if someone is requesting such resolution, they most likely want to=
 actually
> >> access the VBI to e.g. emit teletext.
> >>
> >> Your current code always starts at (vfp=3D=3D5 or 6, vsync=3D6, vbp=3D=
=3D6) and then
> >> increases both vfp and vbp proportionately. This puts vsync dead cente=
r in the
> >> VBI, which is not how it's supposed to be - and that in turn causes th=
e image
> >> to be significantly shifted upwards.
> >>
> >> I hope this makes more sense to you now.
> >
> > I'm really struggling with this, so thanks for explaining this further
> > (and patiently ;))
> >
> > If I get this right, what you'd like to change is this part of the
> > calculus (simplified a bit, and using PAL, 576i):
> >
> >=A0=A0 vfp_min =3D params->vfp_lines.even + params->vfp_lines.odd; // 5
> >=A0=A0 vbp_min =3D params->vbp_lines.even + params->vbp_lines.odd; // 6
> >=A0=A0 vslen =3D params->vslen_lines.even + params->vslen_lines.odd; // 6
> >
> >=A0=A0 porches =3D params->num_lines - vactive - vslen; // 43
> >=A0=A0 porches_rem =3D porches - vfp_min - vbp_min; // 32
> >
> >=A0=A0 vfp =3D vfp_min + (porches_rem / 2); // 21
> >=A0=A0 vbp =3D porches - vfp; // 22
> >
> > Which is indeed having sync centered.
> >
> > I initially changed it to:
> >
> >=A0=A0 vfp =3D vfp_min; // 6
> >=A0=A0 vbp =3D num_lines - vactive - vslen - vfp; // 38
> >
> > Which is close enough for 576i, but at 480i/50Hz would end up with 134,
> > so still fairly far off.
> >
> > I guess your suggestion would be along the line of:
> >
> >=A0=A0 vfp_min =3D params->vfp_lines.even + params->vfp_lines.odd; // 5
> >=A0=A0 vbp_min =3D params->vbp_lines.even + params->vbp_lines.odd; // 38
> >=A0=A0 vslen =3D params->vslen_lines.even + params->vslen_lines.odd; // 6
> >
> >=A0=A0 porches =3D params->num_lines - vactive - vslen; // 0
> >=A0=A0 porches_rem =3D porches - vfp_min - vbp_min; // 0
> >
> >=A0=A0 vfp =3D vfp_min + (porches_rem / 2); // 5
> >=A0=A0 vbp =3D porches - vfp; // 38
> >
> > Which is still close enough for 576i, but for 480i would end up with:
> >
> >=A0=A0 porches =3D params->num_lines - vactive - vslen; // 139
> >=A0=A0 porches_rem =3D porches - vfp_min - vbp_min; // 96
> >
> >=A0=A0 vfp =3D vfp_min + (porches_rem / 2); // 53
> >=A0=A0 vbp =3D porches - vfp; // 86
> >
> > Right?
>=20
> Yes. And if that's supposed to mean 480i in 50 Hz "PAL" mode, that's also
> "close enough" to the values I suggested above.
>=20
> If you substitute values for true 60 Hz "NTSC" 480i, you should also get =
values
> that are "close enough" to the official spec.
>=20
> The only thing I'd conceptually change is that the 38 lines is not really
> "vbp_min". It's more like "vbp_typ". As I mentioned above, we may want to=
 lower
> this value if someone wants more active lines than the official 486/576.

porches_rem is an int, so if vactive > (num_lines + vslen + vfp_min +
vbp_min), porches_rem is going to be negative and we'll remove equally
between vfp and vbp to match what's been asked

So I believe this should work fine?

Maxime

--f6nvjv3uvyvilujx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYysoLwAKCRDj7w1vZxhR
xURjAQCbncH6Fc/QtaLetEslcTLx/26P2Sm8OvJplugFXHTJ7QD/dTht2uJh+cg/
SgzXrpjHpRt/MIrMNo1Y+QG6L3LLpgY=
=4e/k
-----END PGP SIGNATURE-----

--f6nvjv3uvyvilujx--
