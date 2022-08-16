Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30546595568
	for <lists+dri-devel@lfdr.de>; Tue, 16 Aug 2022 10:36:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FD8111357D;
	Tue, 16 Aug 2022 08:36:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 568 seconds by postgrey-1.36 at gabe;
 Tue, 16 Aug 2022 08:35:50 UTC
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33FD911388E
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 08:35:50 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id A6B992B059FC;
 Tue, 16 Aug 2022 04:26:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 16 Aug 2022 04:26:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1660638376; x=1660645576; bh=xTCEULyzlO
 wE/UY9fk17qyZAhuhH6B/PGBqSBiSepwQ=; b=rbwsGfchGHfn7nqA489Zik6UDL
 7XNwiAvlu1sOBim9tyjtigNpwTCuUJDZBO0SPVG1qIKarjSzpE+ekMl8i3b8MZpS
 JfVeAScG0BcSqSdCpLYjLGkCCXasZj0QNw5yjDxwTjtV9/LDwnZGUemEiIMXp6GD
 rSQ8Ht0GD63o6uQBGIo2R3y7Kj6jUwC2zp9uFkiJA0SbBiBlFhC8rAnATSFjdz4G
 k1dETmyQAubjJWrl6vgLNcX0KRVhmEY0QfffbtM5gD7oCnpD/R8Nt6cmgORdyZHw
 GMWmFL7020pjPLlR9NVevrsbfYr0NX0sNvWzIt0qTCUnKRC/zFA89Of4eHBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1660638376; x=1660645576; bh=xTCEULyzlOwE/UY9fk17qyZAhuhH
 6B/PGBqSBiSepwQ=; b=osAXLH/Tri7LA6lBH8aa3aw8L8fxoOxibcLtQTkGg6uk
 WbOkxnSfhKfZ9OoNLe7B3Eu0BB1n8F3EsvP88YzyK3XVW1aC0S/ShkqzIOr8EYUs
 O5nMfICZD9HooaDPpC1i2l6ZFOz0ekPV66yyii+oRMy9PQnSqPPX5QCygHe6pUyJ
 d3STzuVumZB7Hpz0QuV775ji7vDreR2KWLpWaKiXu4y3QodwccAQnjWDiUf5I5S1
 +zWyKvI2W9/HeVuEjH+nk5KlN158b+V38GXaw99ctYHc91MOWbuFguWKnmR7sTwA
 BvlDqYxfIGwWci48CYytMQnShso4/nbteMYCicwfJQ==
X-ME-Sender: <xms:plT7YnVjVuZknf2kcyMAJN20f7GBzyjdOPlUZOQDtwfbDq7XDUfxPw>
 <xme:plT7YvmS9R3CJClAGoemEPbvnNVuVkwcjhL_qjz3m3aiTCyFliQnS5QRdQqUNaTwl
 Pz7JNQsMZ4-1LAsGtY>
X-ME-Received: <xmr:plT7Yjaih8YTdQ26ggw3GOU0Vjx0rbPiGZOcEPO_WwfuQw6hdeQKCtbhqZs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehgedgtdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeejveefheefkeeiffegveelveetgffffeektdefuefhtedtgeejhefggedu
 ffffudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:plT7YiUBKAZ9Z3FSVAVOFqhHxHWriY2vRa7L6cyWOsPg7tzkq8zK1A>
 <xmx:plT7Yhl_b_C-XQsmq6wI9iZhjjDw5G-jUyjMZf4fflb3ZNaBAap4IA>
 <xmx:plT7YvcvnOXo3v2b0bOAQJavstFCR5oeIdXzO7U77d8dMA29zHXhLA>
 <xmx:qFT7YjVck8Ijurlme8u4oZU-wZ64Vk4qtklFMCg7SdGtv4nI05WtDzscqjM>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Aug 2022 04:26:14 -0400 (EDT)
Date: Tue, 16 Aug 2022 10:26:12 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH v1 05/35] drm/connector: Add TV standard property
Message-ID: <20220816082612.grebxql5ynnfnvfd@houat>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-5-3d53ae722097@cerno.tech>
 <9fdecae2-80ad-6212-0522-7dccf9fb57be@tronnes.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3hhom4iyskwekp7q"
Content-Disposition: inline
In-Reply-To: <9fdecae2-80ad-6212-0522-7dccf9fb57be@tronnes.org>
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


--3hhom4iyskwekp7q
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Aug 08, 2022 at 02:44:56PM +0200, Noralf Tr=F8nnes wrote:
> Den 29.07.2022 18.34, skrev Maxime Ripard:
> > The TV mode property has been around for a while now to select and get =
the
> > current TV mode output on an analog TV connector.
> >=20
> > Despite that property name being generic, its content isn't and has been
> > driver-specific which makes it hard to build any generic behaviour on t=
op
> > of it, both in kernel and user-space.
> >=20
> > Let's create a new bitmask tv norm property, that can contain any of the
> > analog TV standards currently supported by kernel drivers. Each driver =
can
> > then pass in a bitmask of the modes it supports.
> >=20
> > We'll then be able to phase out the older tv mode property.
> >=20
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> >=20
>=20
> Please also update Documentation/gpu/kms-properties.csv
>=20
> Requirements for adding a new property is found in
> Documentation/gpu/drm-kms.rst

I knew this was going to be raised at some point, so I'm glad it's that
early :)

I really don't know what to do there. If we stick by our usual rules,
then we can't have any of that work merged.

However, I think the status quo is not really satisfactory either.
Indeed, we have a property, that doesn't follow those requirements
either, with a driver-specific content, and that stands in the way of
fixes and further improvements at both the core framework and driver
levels.

So having that new property still seems like a net improvement at the
driver, framework and uAPI levels, even if it's not entirely following
the requirements we have in place.

Even more so since, realistically, those kind of interfaces will never
get any new development on the user-space side of things, it's
considered by everyone as legacy.

This also is something we need to support at some point if we want to
completely deprecate the fbdev drivers and provide decent alternatives
in KMS.

So yeah, strictly speaking, we would not qualify for our requirements
there. I still think we have a strong case for an exception though.

> > diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_at=
omic_uapi.c
> > index c06d0639d552..d7ff6c644c2f 100644
> > --- a/drivers/gpu/drm/drm_atomic_uapi.c
> > +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> > @@ -700,6 +700,8 @@ static int drm_atomic_connector_set_property(struct=
 drm_connector *connector,
> >  		state->tv.margins.bottom =3D val;
> >  	} else if (property =3D=3D config->tv_mode_property) {
> >  		state->tv.mode =3D val;
> > +	} else if (property =3D=3D config->tv_norm_property) {
> > +		state->tv.norm =3D val;
> >  	} else if (property =3D=3D config->tv_brightness_property) {
> >  		state->tv.brightness =3D val;
> >  	} else if (property =3D=3D config->tv_contrast_property) {
> > @@ -810,6 +812,8 @@ drm_atomic_connector_get_property(struct drm_connec=
tor *connector,
> >  		*val =3D state->tv.margins.bottom;
> >  	} else if (property =3D=3D config->tv_mode_property) {
> >  		*val =3D state->tv.mode;
> > +	} else if (property =3D=3D config->tv_norm_property) {
> > +		*val =3D state->tv.norm;
> >  	} else if (property =3D=3D config->tv_brightness_property) {
> >  		*val =3D state->tv.brightness;
> >  	} else if (property =3D=3D config->tv_contrast_property) {
> > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_conn=
ector.c
> > index e3142c8142b3..68a4e47f85a9 100644
> > --- a/drivers/gpu/drm/drm_connector.c
> > +++ b/drivers/gpu/drm/drm_connector.c
> > @@ -1637,6 +1637,7 @@ EXPORT_SYMBOL(drm_mode_create_tv_margin_propertie=
s);
> >  /**
> >   * drm_mode_create_tv_properties - create TV specific connector proper=
ties
> >   * @dev: DRM device
> > + * @supported_tv_norms: Bitmask of TV norms supported (See DRM_MODE_TV=
_NORM_*)
> >   * @num_modes: number of different TV formats (modes) supported
> >   * @modes: array of pointers to strings containing name of each format
> >   *
> > @@ -1649,11 +1650,40 @@ EXPORT_SYMBOL(drm_mode_create_tv_margin_propert=
ies);
> >   * 0 on success or a negative error code on failure.
> >   */
> >  int drm_mode_create_tv_properties(struct drm_device *dev,
> > +				  unsigned int supported_tv_norms,
> >  				  unsigned int num_modes,
> >  				  const char * const modes[])
> >  {
> > +	static const struct drm_prop_enum_list tv_norm_values[] =3D {
> > +		{ __builtin_ffs(DRM_MODE_TV_NORM_NTSC_443) - 1, "NTSC-443" },
> > +		{ __builtin_ffs(DRM_MODE_TV_NORM_NTSC_J) - 1, "NTSC-J" },
> > +		{ __builtin_ffs(DRM_MODE_TV_NORM_NTSC_M) - 1, "NTSC-M" },
> > +		{ __builtin_ffs(DRM_MODE_TV_NORM_PAL_60) - 1, "PAL-60" },
> > +		{ __builtin_ffs(DRM_MODE_TV_NORM_PAL_B) - 1, "PAL-B" },
> > +		{ __builtin_ffs(DRM_MODE_TV_NORM_PAL_D) - 1, "PAL-D" },
> > +		{ __builtin_ffs(DRM_MODE_TV_NORM_PAL_G) - 1, "PAL-G" },
> > +		{ __builtin_ffs(DRM_MODE_TV_NORM_PAL_H) - 1, "PAL-H" },
> > +		{ __builtin_ffs(DRM_MODE_TV_NORM_PAL_I) - 1, "PAL-I" },
> > +		{ __builtin_ffs(DRM_MODE_TV_NORM_PAL_M) - 1, "PAL-M" },
> > +		{ __builtin_ffs(DRM_MODE_TV_NORM_PAL_N) - 1, "PAL-N" },
> > +		{ __builtin_ffs(DRM_MODE_TV_NORM_PAL_NC) - 1, "PAL-Nc" },
> > +		{ __builtin_ffs(DRM_MODE_TV_NORM_SECAM_60) - 1, "SECAM-60" },
> > +		{ __builtin_ffs(DRM_MODE_TV_NORM_SECAM_B) - 1, "SECAM-B" },
> > +		{ __builtin_ffs(DRM_MODE_TV_NORM_SECAM_D) - 1, "SECAM-D" },
> > +		{ __builtin_ffs(DRM_MODE_TV_NORM_SECAM_G) - 1, "SECAM-G" },
> > +		{ __builtin_ffs(DRM_MODE_TV_NORM_SECAM_K) - 1, "SECAM-K" },
> > +		{ __builtin_ffs(DRM_MODE_TV_NORM_SECAM_K1) - 1, "SECAM-K1" },
> > +		{ __builtin_ffs(DRM_MODE_TV_NORM_SECAM_L) - 1, "SECAM-L" },
> > +		{ __builtin_ffs(DRM_MODE_TV_NORM_HD480I) - 1, "hd480i" },
> > +		{ __builtin_ffs(DRM_MODE_TV_NORM_HD480P) - 1, "hd480p" },
> > +		{ __builtin_ffs(DRM_MODE_TV_NORM_HD576I) - 1, "hd576i" },
> > +		{ __builtin_ffs(DRM_MODE_TV_NORM_HD576P) - 1, "hd576p" },
> > +		{ __builtin_ffs(DRM_MODE_TV_NORM_HD720P) - 1, "hd720p" },
> > +		{ __builtin_ffs(DRM_MODE_TV_NORM_HD1080I) - 1, "hd1080i" },
> > +	};
> >  	struct drm_property *tv_selector;
> >  	struct drm_property *tv_subconnector;
> > +	struct drm_property *tv_norm;
> >  	unsigned int i;
> > =20
> >  	if (dev->mode_config.tv_select_subconnector_property)
> > @@ -1686,6 +1716,13 @@ int drm_mode_create_tv_properties(struct drm_dev=
ice *dev,
> >  	if (drm_mode_create_tv_margin_properties(dev))
> >  		goto nomem;
> > =20
> > +	tv_norm =3D drm_property_create_bitmask(dev, 0, "tv norm",
> > +					   tv_norm_values, ARRAY_SIZE(tv_norm_values),
> > +					   supported_tv_norms);
>=20
> I expected this to be an enum, why a bitmask? Userspace can set multiple
> bits in a bitmask.

I went for a bitmask since it allowed to report the capabilities of a
driver, but I just realised that you can do that with an enum too, like
we do for color encodings.

I'll switch for an enum, thanks!
Maxime

--3hhom4iyskwekp7q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYvtUpAAKCRDj7w1vZxhR
xZfoAQC88sDanQdYkKbOW7CFB7CVfnGcKpWIJXqulm0ThhwhLAD+Ow27epX78Lu3
zhK/iVL50Tvq00zxu4GIvhL7L791JQA=
=cQh2
-----END PGP SIGNATURE-----

--3hhom4iyskwekp7q--
