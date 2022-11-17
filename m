Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B057762DEAE
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 15:53:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4889410E616;
	Thu, 17 Nov 2022 14:53:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D417010E616;
 Thu, 17 Nov 2022 14:53:22 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 1D9672B06A0F;
 Thu, 17 Nov 2022 09:53:18 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 17 Nov 2022 09:53:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1668696797; x=1668703997; bh=P+Mr1SL559
 jIilm9PEYPnBvDF7YF573nzLUdcJpasyg=; b=U+VbZC5zUyzYvx1yj3a1C54+lx
 jz4fjzVkJUhXoDT82EijIh8V/jDk63l5W/BG90AegA8jJqyYsC0LNHeNIsPat5RR
 /2g3LSkJHgXmfxByw1lWhWN2xl1PqS4l3FlWqrt4UvY93NlGqJhmwLk496YHp8eI
 ABHAALlp7tV7Ij0cbjkNaJrM2iVqTwR0dTwOwaMbr8P67NhyOlb/+wO0mC0QWBRt
 AT4awFlRCBs2LypcLc1tNlI130XWImblKyGkFcubOGzI89S01DIAyaF804xOnas0
 WtDKFv8QJt7rzWHzezwxX5iIqQCfSIN4zA3IMZhHQUKwKEtMIbJ9BVztkP8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1668696797; x=1668703997; bh=P+Mr1SL559jIilm9PEYPnBvDF7YF
 573nzLUdcJpasyg=; b=xC7sUXofv0fkoCCNv5hAvrZ4E9fMPBoYYK4010kZTguL
 71FuU3oKPCoEGJl8fmNrPuBRTB9Q+XZTaHSNIHWMP23p7ij/YxyJQSangKNX1BM8
 hSsh0lpG1ytgu4wKRDUzyniJcUPDr5NNamcslrkshtGuj1XFGJi0F1HA4FOA5V29
 I/cGTS/cYUREqoKF0LeRy/30kz6/Yah4l3+ccpiPoul4WTiMWfryoHYusIx4TFf6
 oukzBrD/9v63Pj4SWiAoeTEgg8r9/Ch9GiwhVZrvwK5hwanw34aRHtWurtq44XrT
 sWTmCIY+nrfGqSoYFe8TVd4Ffblx/vIT3O3d2roAYA==
X-ME-Sender: <xms:3Ep2Y4yGAaPbWy7VQYS-4rEpAlarsPcQhW8iANLjeiBA-NLdRPYTBw>
 <xme:3Ep2Y8Qtjn-EJ-YQJVA5j6gIRQb-5qSdw5WGfjPnGPPf_EhNtfELlPLC67Fi3eRNt
 j9k8oIVeNJQ_2GUWOo>
X-ME-Received: <xmr:3Ep2Y6Xstyxc9mlXQOBLsiZGSwdo1XI7lXqdxDyhPi_0mCR-1fL7-IRXjOdLq9_Om2qKJ1TTcZQwIr7pfJxGZ1LpY-psTiQJKJW77FfEEwmx6w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgeekgdeikecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepveefgfejffdvieeffeehueeguddvjeegvefghfdujeffffeiheekvdelhedv
 keefnecuffhomhgrihhnpehithhurdhinhhtpdhkvghrnhgvlhdrohhrghenucevlhhush
 htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggv
 rhhnohdrthgvtghh
X-ME-Proxy: <xmx:3Ep2Y2hs68uTtmPm487wkfEovHB0iT55P6W8qN7619f_VFwjmyLPbw>
 <xmx:3Ep2Y6BcxrKz5_NdMSV1ETH07cPXzJJlu2-5gJC8Ku0dGY60SQgEoA>
 <xmx:3Ep2Y3LME_puhtZ05fmu_7R3FjLz76xMvVX20wTspBC_ZLXU1IILIg>
 <xmx:3Up2Y1ZlUsHWZadmHPgc8xRbpG2Urq0g3FRqPqz98KRxnxaKUY750yVVCKo>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Nov 2022 09:53:16 -0500 (EST)
Date: Thu, 17 Nov 2022 15:53:14 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Subject: Re: [PATCH v10 05/19] drm/connector: Add TV standard property
Message-ID: <20221117145314.veaam3djm6fkh56f@houat>
References: <20220728-rpi-analog-tv-properties-v10-0-256dad125326@cerno.tech>
 <20220728-rpi-analog-tv-properties-v10-5-256dad125326@cerno.tech>
 <20221117153557.75c5dba1@maurocar-mobl2>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="oacbmgkrlh2j7rjz"
Content-Disposition: inline
In-Reply-To: <20221117153557.75c5dba1@maurocar-mobl2>
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
 linux-sunxi@lists.linux.dev, intel-gfx@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--oacbmgkrlh2j7rjz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 17, 2022 at 03:35:57PM +0100, Mauro Carvalho Chehab wrote:
> On Thu, 17 Nov 2022 10:28:48 +0100
> Maxime Ripard <maxime@cerno.tech> wrote:
>=20
> > The TV mode property has been around for a while now to select and get =
the
> > current TV mode output on an analog TV connector.
> >=20
> > Despite that property name being generic, its content isn't and has been
> > driver-specific which makes it hard to build any generic behaviour on t=
op
> > of it, both in kernel and user-space.
> >=20
> > Let's create a new enum tv norm property, that can contain any of the
> > analog TV standards currently supported by kernel drivers. Each driver =
can
> > then pass in a bitmask of the modes it supports, and the property
> > creation function will filter out the modes not supported.
> >=20
> > We'll then be able to phase out the older tv mode property.
> >=20
> > Tested-by: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> >=20
> > ---
> > Changes in v10:
> > - Fix checkpatch warning
> >=20
> > Changes in v5:
> > - Create an analog TV properties documentation section, and document TV
> >   Mode there instead of the csv file
> >=20
> > Changes in v4:
> > - Add property documentation to kms-properties.csv
> > - Fix documentation
> > ---
> >  Documentation/gpu/drm-kms.rst     |   6 ++
> >  drivers/gpu/drm/drm_atomic_uapi.c |   4 ++
> >  drivers/gpu/drm/drm_connector.c   | 122 ++++++++++++++++++++++++++++++=
+++++++-
> >  include/drm/drm_connector.h       |  64 ++++++++++++++++++++
> >  include/drm/drm_mode_config.h     |   8 +++
> >  5 files changed, 203 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.=
rst
> > index b4377a545425..321f2f582c64 100644
> > --- a/Documentation/gpu/drm-kms.rst
> > +++ b/Documentation/gpu/drm-kms.rst
> > @@ -520,6 +520,12 @@ HDMI Specific Connector Properties
> >  .. kernel-doc:: drivers/gpu/drm/drm_connector.c
> >     :doc: HDMI connector properties
> > =20
> > +Analog TV Specific Connector Properties
> > +----------------------------------
> > +
> > +.. kernel-doc:: drivers/gpu/drm/drm_connector.c
> > +   :doc: Analog TV Connector Properties
> > +
> >  Standard CRTC Properties
> >  ------------------------
> > =20
> > diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_at=
omic_uapi.c
> > index 7f2b9a07fbdf..d867e7f9f2cd 100644
> > --- a/drivers/gpu/drm/drm_atomic_uapi.c
> > +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> > @@ -700,6 +700,8 @@ static int drm_atomic_connector_set_property(struct=
 drm_connector *connector,
> >  		state->tv.margins.bottom =3D val;
> >  	} else if (property =3D=3D config->legacy_tv_mode_property) {
> >  		state->tv.legacy_mode =3D val;
> > +	} else if (property =3D=3D config->tv_mode_property) {
> > +		state->tv.mode =3D val;
> >  	} else if (property =3D=3D config->tv_brightness_property) {
> >  		state->tv.brightness =3D val;
> >  	} else if (property =3D=3D config->tv_contrast_property) {
> > @@ -810,6 +812,8 @@ drm_atomic_connector_get_property(struct drm_connec=
tor *connector,
> >  		*val =3D state->tv.margins.bottom;
> >  	} else if (property =3D=3D config->legacy_tv_mode_property) {
> >  		*val =3D state->tv.legacy_mode;
> > +	} else if (property =3D=3D config->tv_mode_property) {
> > +		*val =3D state->tv.mode;
> >  	} else if (property =3D=3D config->tv_brightness_property) {
> >  		*val =3D state->tv.brightness;
> >  	} else if (property =3D=3D config->tv_contrast_property) {
> > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_conn=
ector.c
> > index 06e737ed15f5..07d449736956 100644
> > --- a/drivers/gpu/drm/drm_connector.c
> > +++ b/drivers/gpu/drm/drm_connector.c
> > @@ -984,6 +984,17 @@ static const struct drm_prop_enum_list drm_dvi_i_s=
ubconnector_enum_list[] =3D {
> >  DRM_ENUM_NAME_FN(drm_get_dvi_i_subconnector_name,
> >  		 drm_dvi_i_subconnector_enum_list)
> > =20
> > +static const struct drm_prop_enum_list drm_tv_mode_enum_list[] =3D {
> > +	{ DRM_MODE_TV_MODE_NTSC, "NTSC" },
> > +	{ DRM_MODE_TV_MODE_NTSC_443, "NTSC-443" },
> > +	{ DRM_MODE_TV_MODE_NTSC_J, "NTSC-J" },
> > +	{ DRM_MODE_TV_MODE_PAL, "PAL" },
> > +	{ DRM_MODE_TV_MODE_PAL_M, "PAL-M" },
> > +	{ DRM_MODE_TV_MODE_PAL_N, "PAL-N" },
> > +	{ DRM_MODE_TV_MODE_SECAM, "SECAM" },
> > +};
>=20
> Nack. It sounds a very bad idea to have standards as generic as=20
> NTSC, PAL, SECAM.=20
>=20
> If you take a look at the CCIR/ITU-R specs that define video standards,=
=20
> you'll see that the standard has actually two components:
>=20
> 1. the composite color TV signal: PAL, NTSC, SECAM, defined in ITU-R BT17=
00[1]
>=20
> 2. and the conventional analogue TV (the "monochromatic" part),
> as defined in ITU-R BT.1701[2], which is, basically, a letter from A to N
> (with some country-specific variants, like Nc). Two of those standards
> (M and J) are used on Countries with a power grid of 60Hz, as they have
> a frame rate of either 30fps or 29.997fps.
>=20
> [1] https://www.itu.int/rec/R-REC-BT.1700-0-200502-I/en
> [2] https://www.itu.int/rec/R-REC-BT.1701-1-200508-I/en
>=20
> The actual combination is defined within Country-specific laws, which
> selects a conventional analogue signal with a composite color one.
>=20
> So, for instance, US uses NTSC/M (because it uses a 60Hz power grid).
> There is a 50Hz variant, called NTSC/443 (not used on any Country, but
> present on some European VCR equipments capable of recording at 25fps,
> using NTSC).
>=20
> Btw, some VCR equipments in US may also have PAL/60 with has the
> same timings as NTSC, but uses PAL instead.
>=20
> What happens is that, in Europe, different PAL standards got used, but:
>=20
> - most TV sets and their chipsets were developed to auto-detect and
>   support the differences between different systems PAL/B, PAL/G, PAL/D,.=
=2E.
> - several of those standards have a difference only at the audio
>   sub-carriers. So, they look identical for the video decoding part.
> - standards may have a different inter-channel space (it can vary from
>   5 to 8 MHz) to minimize cross-signal interference.

We've had that discussion already, at v3:
https://lore.kernel.org/dri-devel/20220728-rpi-analog-tv-properties-v2-9-45=
9522d653a7@cerno.tech/

AFAICS, we can easily add the extra standards to the properties list if
and when needed.

So unless you can come up with some practical issues that can't be
addressed by the current design without a major rework, I don't intend
to change that.

Maxime

--oacbmgkrlh2j7rjz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY3ZK2gAKCRDj7w1vZxhR
xctUAPwNSfrXHSxkMcmoX9TMuhDfLNnKYS+AeFk5aGfPpAQA6wEA4sHsEUuqbsiH
5jCNRnrCKpEoOHX55nQPeJoiF3bmigQ=
=ZS7W
-----END PGP SIGNATURE-----

--oacbmgkrlh2j7rjz--
