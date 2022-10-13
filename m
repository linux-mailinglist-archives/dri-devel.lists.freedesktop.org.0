Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3892A5FE10B
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 20:24:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED8F110E303;
	Thu, 13 Oct 2022 18:23:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80E4C10E303;
 Thu, 13 Oct 2022 18:23:55 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id a67so3749972edf.12;
 Thu, 13 Oct 2022 11:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=80yVJmDj5IDbUK+aqS6l/dUBm+Bwn69DEdWiolHKVEQ=;
 b=FSJPenagde4qSchQNLIGuKH7m39FqdZYDX4cXscDrSd4DQs0L1KMc4rzYAQdelzOnj
 UF6Ak0NK52yT8/8DfdNJEj9A6gPHnDn66V7+1VWIUqHsECMy3uBtxD1ZuMqhx07ZGxmH
 JrBntFO5CY3UNA85w3OBtKxuhgF5e76Lt7ylZMABNDblsdysCHcDVS8mPFZv9H1JdZ/I
 AKJH0uhU+XEyG10Nd+LEc8vJ0DUGh/1JFMAtnOsnuQLT22u523AH4mmuX/7Zqs6DzjRA
 bG2+Qr5Isa0Tcz+PCt82cXW69Q2hRvI0SGZdd/KO1uPpP7a67dpLrTUV1TBOjvgtGohS
 UKkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=80yVJmDj5IDbUK+aqS6l/dUBm+Bwn69DEdWiolHKVEQ=;
 b=JAMfg5Bvy3V5S23i3bvj5+daieW9U/8SUe7TWU1FUGarNC4NcH2hVrP7uqrSNRguPG
 OFGt0e/5ScZjRSPfkv/vdvUWD/y9inbnbhdwKOSWQhmm1Ys0fyTqGTlfyuhbE57flE16
 3NU4sF2DpLRU+TVO1UivLhSLheUHMExD46iKJJAmOlx64zUb6c82pGCbvzVnhcw0Fy7K
 jqiMo9uInPEAOCoLbr4DIZsWqwxp10mMDsqxPPNk3irmz9iDkovxLT55H9VZPzwk3QxW
 BDG5Fe8L7AknFNHBmVyZ0TrtMWi32oDpV/xcC3MkyinWLt2wCAy2u0DQuj7/2t5osJl6
 jRYA==
X-Gm-Message-State: ACrzQf0/4kMhK9vMcc2UGww+Cn6FfqJog3q5QovqKr9Io38VWriXHLS5
 9VWe7vJWbXGcTEJqxGECaPI=
X-Google-Smtp-Source: AMsMyM7ssKdTrHDlPNauUb77WDG9zWLblYWKO18kRWRI7jkR1dhN23ZFAp3iq6h3HOsgFFKHyT7dhQ==
X-Received: by 2002:a05:6402:b3c:b0:458:f680:6ab8 with SMTP id
 bo28-20020a0564020b3c00b00458f6806ab8mr923431edb.267.1665685433991; 
 Thu, 13 Oct 2022 11:23:53 -0700 (PDT)
Received: from kista.localnet (82-149-19-102.dynamic.telemach.net.
 [82.149.19.102]) by smtp.gmail.com with ESMTPSA id
 e2-20020a170906314200b00730df07629fsm196329eje.174.2022.10.13.11.23.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 11:23:53 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Karol Herbst <kherbst@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@linux.ie>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>, Maxime Ripard <mripard@kernel.org>,
 Emma Anholt <emma@anholt.net>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Ben Skeggs <bskeggs@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v5 22/22] drm/sun4i: tv: Convert to the new TV mode
 property
Date: Thu, 13 Oct 2022 20:23:51 +0200
Message-ID: <6482539.4vTCxPXJkl@kista>
In-Reply-To: <20220728-rpi-analog-tv-properties-v5-22-d841cc64fe4b@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v5-0-d841cc64fe4b@cerno.tech>
 <20220728-rpi-analog-tv-properties-v5-22-d841cc64fe4b@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
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
Cc: Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Noralf =?ISO-8859-1?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

Dne =C4=8Detrtek, 13. oktober 2022 ob 15:19:06 CEST je Maxime Ripard napisa=
l(a):
> Now that the core can deal fine with analog TV modes, let's convert the
> sun4i TV driver to leverage those new features.
>=20
> Acked-by: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>=20
> ---
> Changes in v5:
> - Removed the count variable in get_modes
> - Removed spurious vc4 change
> ---
>  drivers/gpu/drm/sun4i/sun4i_tv.c | 145
> +++++++++++++-------------------------- 1 file changed, 48 insertions(+),
> 97 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/sun4i/sun4i_tv.c
> b/drivers/gpu/drm/sun4i/sun4i_tv.c index c65f0a89b6b0..4f07aff11551 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_tv.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_tv.c
> @@ -141,23 +141,14 @@ struct resync_parameters {
>  struct tv_mode {
>  	char		*name;
>=20
> +	unsigned int	tv_mode;
> +
>  	u32		mode;
>  	u32		chroma_freq;
>  	u16		back_porch;
>  	u16		front_porch;
> -	u16		line_number;
>  	u16		vblank_level;

isn't there a way to get or calculate back_porch, front_porch and vblank_le=
vel=20
from mode? From quick glance over removed values below, I would say that at=
=20
least back_porch can be removed too?

Otherwise this patch looks ok.

Best regards,
Jernej

>=20
> -	u32		hdisplay;
> -	u16		hfront_porch;
> -	u16		hsync_len;
> -	u16		hback_porch;
> -
> -	u32		vdisplay;
> -	u16		vfront_porch;
> -	u16		vsync_len;
> -	u16		vback_porch;
> -
>  	bool		yc_en;
>  	bool		dac3_en;
>  	bool		dac_bit25_en;
> @@ -213,7 +204,7 @@ static const struct resync_parameters
> pal_resync_parameters =3D {
>=20
>  static const struct tv_mode tv_modes[] =3D {
>  	{
> -		.name		=3D "NTSC",
> +		.tv_mode	=3D DRM_MODE_TV_MODE_NTSC,
>  		.mode		=3D SUN4I_TVE_CFG0_RES_480i,
>  		.chroma_freq	=3D 0x21f07c1f,
>  		.yc_en		=3D true,
> @@ -222,17 +213,6 @@ static const struct tv_mode tv_modes[] =3D {
>=20
>  		.back_porch	=3D 118,
>  		.front_porch	=3D 32,
> -		.line_number	=3D 525,
> -
> -		.hdisplay	=3D 720,
> -		.hfront_porch	=3D 18,
> -		.hsync_len	=3D 2,
> -		.hback_porch	=3D 118,
> -
> -		.vdisplay	=3D 480,
> -		.vfront_porch	=3D 26,
> -		.vsync_len	=3D 2,
> -		.vback_porch	=3D 17,
>=20
>  		.vblank_level	=3D 240,
>=20
> @@ -242,23 +222,12 @@ static const struct tv_mode tv_modes[] =3D {
>  		.resync_params	=3D &ntsc_resync_parameters,
>  	},
>  	{
> -		.name		=3D "PAL",
> +		.tv_mode	=3D DRM_MODE_TV_MODE_PAL,
>  		.mode		=3D SUN4I_TVE_CFG0_RES_576i,
>  		.chroma_freq	=3D 0x2a098acb,
>=20
>  		.back_porch	=3D 138,
>  		.front_porch	=3D 24,
> -		.line_number	=3D 625,
> -
> -		.hdisplay	=3D 720,
> -		.hfront_porch	=3D 3,
> -		.hsync_len	=3D 2,
> -		.hback_porch	=3D 139,
> -
> -		.vdisplay	=3D 576,
> -		.vfront_porch	=3D 28,
> -		.vsync_len	=3D 2,
> -		.vback_porch	=3D 19,
>=20
>  		.vblank_level	=3D 252,
>=20
> @@ -276,63 +245,21 @@ drm_encoder_to_sun4i_tv(struct drm_encoder *encoder)
>  			    encoder);
>  }
>=20
> -/*
> - * FIXME: If only the drm_display_mode private field was usable, this
> - * could go away...
> - *
> - * So far, it doesn't seem to be preserved when the mode is passed by
> - * to mode_set for some reason.
> - */
> -static const struct tv_mode *sun4i_tv_find_tv_by_mode(const struct
> drm_display_mode *mode) +static const struct tv_mode *
> +sun4i_tv_find_tv_by_mode(unsigned int mode)
>  {
>  	int i;
>=20
> -	/* First try to identify the mode by name */
>  	for (i =3D 0; i < ARRAY_SIZE(tv_modes); i++) {
>  		const struct tv_mode *tv_mode =3D &tv_modes[i];
>=20
> -		DRM_DEBUG_DRIVER("Comparing mode %s vs %s",
> -				 mode->name, tv_mode->name);
> -
> -		if (!strcmp(mode->name, tv_mode->name))
> -			return tv_mode;
> -	}
> -
> -	/* Then by number of lines */
> -	for (i =3D 0; i < ARRAY_SIZE(tv_modes); i++) {
> -		const struct tv_mode *tv_mode =3D &tv_modes[i];
> -
> -		DRM_DEBUG_DRIVER("Comparing mode %s vs %s (X: %d vs=20
%d)",
> -				 mode->name, tv_mode->name,
> -				 mode->vdisplay, tv_mode-
>vdisplay);
> -
> -		if (mode->vdisplay =3D=3D tv_mode->vdisplay)
> +		if (tv_mode->tv_mode =3D=3D mode)
>  			return tv_mode;
>  	}
>=20
>  	return NULL;
>  }
>=20
> -static void sun4i_tv_mode_to_drm_mode(const struct tv_mode *tv_mode,
> -				      struct drm_display_mode=20
*mode)
> -{
> -	DRM_DEBUG_DRIVER("Creating mode %s\n", mode->name);
> -
> -	mode->type =3D DRM_MODE_TYPE_DRIVER;
> -	mode->clock =3D 13500;
> -	mode->flags =3D DRM_MODE_FLAG_INTERLACE;
> -
> -	mode->hdisplay =3D tv_mode->hdisplay;
> -	mode->hsync_start =3D mode->hdisplay + tv_mode->hfront_porch;
> -	mode->hsync_end =3D mode->hsync_start + tv_mode->hsync_len;
> -	mode->htotal =3D mode->hsync_end  + tv_mode->hback_porch;
> -
> -	mode->vdisplay =3D tv_mode->vdisplay;
> -	mode->vsync_start =3D mode->vdisplay + tv_mode->vfront_porch;
> -	mode->vsync_end =3D mode->vsync_start + tv_mode->vsync_len;
> -	mode->vtotal =3D mode->vsync_end  + tv_mode->vback_porch;
> -}
> -
>  static void sun4i_tv_disable(struct drm_encoder *encoder,
>  			    struct drm_atomic_state *state)
>  {
> @@ -356,7 +283,11 @@ static void sun4i_tv_enable(struct drm_encoder
> *encoder, struct drm_crtc_state *crtc_state =3D
>  		drm_atomic_get_new_crtc_state(state, encoder->crtc);
>  	struct drm_display_mode *mode =3D &crtc_state->mode;
> -	const struct tv_mode *tv_mode =3D sun4i_tv_find_tv_by_mode(mode);
> +	struct drm_connector *connector =3D &tv->connector;
> +	struct drm_connector_state *conn_state =3D
> +		drm_atomic_get_new_connector_state(state, connector);
> +	const struct tv_mode *tv_mode =3D
> +		sun4i_tv_find_tv_by_mode(conn_state->tv.mode);
>=20
>  	DRM_DEBUG_DRIVER("Enabling the TV Output\n");
>=20
> @@ -404,7 +335,7 @@ static void sun4i_tv_enable(struct drm_encoder *encod=
er,
> /* Set the lines setup */
>  	regmap_write(tv->regs, SUN4I_TVE_LINE_REG,
>  		     SUN4I_TVE_LINE_FIRST(22) |
> -		     SUN4I_TVE_LINE_NUMBER(tv_mode->line_number));
> +		     SUN4I_TVE_LINE_NUMBER(mode->vtotal));
>=20
>  	regmap_write(tv->regs, SUN4I_TVE_LEVEL_REG,
>  		     SUN4I_TVE_LEVEL_BLANK(tv_mode->video_levels-
>blank) |
> @@ -467,35 +398,43 @@ static const struct drm_encoder_helper_funcs
> sun4i_tv_helper_funcs =3D {
>=20
>  static int sun4i_tv_comp_get_modes(struct drm_connector *connector)
>  {
> -	int i;
> +	struct drm_display_mode *mode;
>=20
> -	for (i =3D 0; i < ARRAY_SIZE(tv_modes); i++) {
> -		struct drm_display_mode *mode;
> -		const struct tv_mode *tv_mode =3D &tv_modes[i];
> -
> -		mode =3D drm_mode_create(connector->dev);
> -		if (!mode) {
> -			DRM_ERROR("Failed to create a new display=20
mode\n");
> -			return 0;
> -		}
> +	mode =3D drm_mode_analog_ntsc_480i(connector->dev);
> +	if (!mode) {
> +		DRM_ERROR("Failed to create a new display mode\n");
> +		return -ENOMEM;
> +	}
>=20
> -		strcpy(mode->name, tv_mode->name);
> +	mode->type |=3D DRM_MODE_TYPE_PREFERRED;
> +	drm_mode_probed_add(connector, mode);
>=20
> -		sun4i_tv_mode_to_drm_mode(tv_mode, mode);
> -		drm_mode_probed_add(connector, mode);
> +	mode =3D drm_mode_analog_pal_576i(connector->dev);
> +	if (!mode) {
> +		DRM_ERROR("Failed to create a new display mode\n");
> +		return -ENOMEM;
>  	}
>=20
> -	return i;
> +	drm_mode_probed_add(connector, mode);
> +
> +	return 2;
>  }
>=20
>  static const struct drm_connector_helper_funcs
> sun4i_tv_comp_connector_helper_funcs =3D { +	.atomic_check	=3D
> drm_atomic_helper_connector_tv_check,
>  	.get_modes	=3D sun4i_tv_comp_get_modes,
>  };
>=20
> +static void sun4i_tv_connector_reset(struct drm_connector *connector)
> +{
> +	drm_atomic_helper_connector_reset(connector);
> +	drm_atomic_helper_connector_tv_reset(connector);
> +}
> +
>  static const struct drm_connector_funcs sun4i_tv_comp_connector_funcs =
=3D {
>  	.fill_modes		=3D drm_helper_probe_single_connector_modes,
>  	.destroy		=3D drm_connector_cleanup,
> -	.reset			=3D=20
drm_atomic_helper_connector_reset,
> +	.reset			=3D sun4i_tv_connector_reset,
>  	.atomic_duplicate_state	=3D=20
drm_atomic_helper_connector_duplicate_state,
>  	.atomic_destroy_state	=3D=20
drm_atomic_helper_connector_destroy_state,
>  };
> @@ -587,8 +526,20 @@ static int sun4i_tv_bind(struct device *dev, struct
> device *master,
>=20
>  	drm_connector_attach_encoder(&tv->connector, &tv->encoder);
>=20
> +	ret =3D drm_mode_create_tv_properties(drm,
> +					   =20
BIT(DRM_MODE_TV_MODE_NTSC) |
> +					   =20
BIT(DRM_MODE_TV_MODE_PAL));
> +	if (ret)
> +		goto err_cleanup_connector;
> +
> +	drm_object_attach_property(&tv->connector.base,
> +				   drm-
>mode_config.tv_mode_property,
> +				   DRM_MODE_TV_MODE_NTSC);
> +
>  	return 0;
>=20
> +err_cleanup_connector:
> +	drm_connector_cleanup(&tv->connector);
>  err_cleanup_encoder:
>  	drm_encoder_cleanup(&tv->encoder);
>  err_disable_clk:
>=20
> --
> b4 0.11.0-dev-7da52


