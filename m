Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 069C6278259
	for <lists+dri-devel@lfdr.de>; Fri, 25 Sep 2020 10:13:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99AE46EC4A;
	Fri, 25 Sep 2020 08:13:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1358E6EC4C
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Sep 2020 08:13:23 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id 77so1850256lfj.0
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Sep 2020 01:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=Rb6zRHjConOwa0z6VAVrvKy0+Z9Y9MyZJdZuLU6RlLI=;
 b=eB+N1tLT2GBUhE4y5qjCzzcLfFRRbRHWPCdMh1g5sBiScf6DLlb6EOLMeIrsdPb+Mb
 8ZkwkGGuA/37inQBsW8Z6+tKTmLmh4Q3ShuqOOwYOf9H8ycieuqtk+aH0YDv/SMrKstO
 LGEyeofo1BtcSAt03BReSY70rVlCnX57FceFlDsBi3bUrKfMQGz5r+LEMmirG4iqKpNd
 UMTVl0Zv6xQydARlOCP6574LWAviHhgURuOCYi8z39Can+z6FRm3zkye4gQQ7kePsuCk
 3egvhS+orwX3K8sv5PYznfABXvwb/4sClMi1OsBaRDPyRucXRYrJrszP+g3awtzDc4I5
 B5KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=Rb6zRHjConOwa0z6VAVrvKy0+Z9Y9MyZJdZuLU6RlLI=;
 b=a2mm3ezfiIPjKwNpfC24EBo8sxj9pdSTY9+PFhhvDYMwZc2MIys5/V4XjEpXZkz0NT
 APZwLWjxGyCPuQDXpHsBTWncoZMXJbGVUE4Y0mbjcEGZKF+PB3lmdZVg4nF5CBZPLcLp
 FhrXSSdnXk6ukwBMYQkW7X60IdfdLuYG1iX7sg/yISWHBEZyqnVotWIG6aUAe6dcnM9j
 HlLA//h6eBKF21tg1EOBJCCQy5x+6TK0TZ0sYMV8Atyw+MmanPoS/PPJhOW1vGsnb7oS
 RHCVxUadzbyXZ+rn8ysv44s08kEiI38x+a27pHzWkOj9DfJP+qTA8dsCNTNY659ZnK93
 7utw==
X-Gm-Message-State: AOAM5302D01PPOFE6bxYnVA5sHCCBneLjrJaR+uvBjPa5yKBGkdWKQke
 JHmBYouU8wgFgWmdoWMtaDc=
X-Google-Smtp-Source: ABdhPJwn0tf4lRBqiWh18puWUjfhZKjPs6g9tUjX7qISxZPSL+PWqfMc8MJGrFUz74nECuIGyKb/Pw==
X-Received: by 2002:a19:7f47:: with SMTP id a68mr912453lfd.264.1601021601329; 
 Fri, 25 Sep 2020 01:13:21 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id l11sm1647433lfk.113.2020.09.25.01.13.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2020 01:13:20 -0700 (PDT)
Date: Fri, 25 Sep 2020 11:13:11 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH 1/5] drm: add legacy support for using degamma for gamma
Message-ID: <20200925111311.67d9e3df@eldfell>
In-Reply-To: <20200923115727.248705-2-tomi.valkeinen@ti.com>
References: <20200923115727.248705-1-tomi.valkeinen@ti.com>
 <20200923115727.248705-2-tomi.valkeinen@ti.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Jyri Sarha <jsarha@ti.com>, Nikhil Devshatwar <nikhil.nd@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: multipart/mixed; boundary="===============0557248530=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0557248530==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/mG/wjCAqWw0QgB4am6spTHz"; protocol="application/pgp-signature"

--Sig_/mG/wjCAqWw0QgB4am6spTHz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 23 Sep 2020 14:57:23 +0300
Tomi Valkeinen <tomi.valkeinen@ti.com> wrote:

> We currently have drm_atomic_helper_legacy_gamma_set() helper which can
> be used to handle legacy gamma-set ioctl.
> drm_atomic_helper_legacy_gamma_set() sets GAMMA_LUT, and clears
> CTM and DEGAMMA_LUT. This works fine on HW where we have either:
>=20
> degamma -> ctm -> gamma -> out
>=20
> or
>=20
> ctm -> gamma -> out
>=20
> However, if the HW has gamma table before ctm, the atomic property
> should be DEGAMMA_LUT, and thus we have:
>=20
> degamma -> ctm -> out
>=20
> This is fine for userspace which sets gamma table using the properties,
> as the userspace can check for the existence of gamma & degamma, but the
> legacy gamma-set ioctl does not work.
>=20
> This patch adds a new helper, drm_atomic_helper_legacy_degamma_set(),
> which can be used instead of drm_atomic_helper_legacy_gamma_set() when
> the DEGAMMA_LUT is the underlying property that needs to be set.
>=20

This sounds and looks right to me fwiw, so

Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks,
pq

> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 81 ++++++++++++++++++++++-------
>  include/drm/drm_atomic_helper.h     |  4 ++
>  2 files changed, 65 insertions(+), 20 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_at=
omic_helper.c
> index 9e1ad493e689..5ba359114df6 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -3469,24 +3469,11 @@ int drm_atomic_helper_page_flip_target(struct drm=
_crtc *crtc,
>  }
>  EXPORT_SYMBOL(drm_atomic_helper_page_flip_target);
> =20
> -/**
> - * drm_atomic_helper_legacy_gamma_set - set the legacy gamma correction =
table
> - * @crtc: CRTC object
> - * @red: red correction table
> - * @green: green correction table
> - * @blue: green correction table
> - * @size: size of the tables
> - * @ctx: lock acquire context
> - *
> - * Implements support for legacy gamma correction table for drivers
> - * that support color management through the DEGAMMA_LUT/GAMMA_LUT
> - * properties. See drm_crtc_enable_color_mgmt() and the containing chapt=
er for
> - * how the atomic color management and gamma tables work.
> - */
> -int drm_atomic_helper_legacy_gamma_set(struct drm_crtc *crtc,
> -				       u16 *red, u16 *green, u16 *blue,
> -				       uint32_t size,
> -				       struct drm_modeset_acquire_ctx *ctx)
> +static int legacy_gamma_degamma_set(struct drm_crtc *crtc,
> +				    u16 *red, u16 *green, u16 *blue,
> +				    uint32_t size,
> +				    struct drm_modeset_acquire_ctx *ctx,
> +				    bool use_degamma)
>  {
>  	struct drm_device *dev =3D crtc->dev;
>  	struct drm_atomic_state *state;
> @@ -3525,9 +3512,11 @@ int drm_atomic_helper_legacy_gamma_set(struct drm_=
crtc *crtc,
>  	}
> =20
>  	/* Reset DEGAMMA_LUT and CTM properties. */
> -	replaced  =3D drm_property_replace_blob(&crtc_state->degamma_lut, NULL);
> +	replaced  =3D drm_property_replace_blob(&crtc_state->degamma_lut,
> +					      use_degamma ? blob : NULL);
>  	replaced |=3D drm_property_replace_blob(&crtc_state->ctm, NULL);
> -	replaced |=3D drm_property_replace_blob(&crtc_state->gamma_lut, blob);
> +	replaced |=3D drm_property_replace_blob(&crtc_state->gamma_lut,
> +					      use_degamma ? NULL : blob);
>  	crtc_state->color_mgmt_changed |=3D replaced;
> =20
>  	ret =3D drm_atomic_commit(state);
> @@ -3537,8 +3526,60 @@ int drm_atomic_helper_legacy_gamma_set(struct drm_=
crtc *crtc,
>  	drm_property_blob_put(blob);
>  	return ret;
>  }
> +
> +/**
> + * drm_atomic_helper_legacy_gamma_set - set the legacy gamma correction =
table using gamma_lut
> + * @crtc: CRTC object
> + * @red: red correction table
> + * @green: green correction table
> + * @blue: green correction table
> + * @size: size of the tables
> + * @ctx: lock acquire context
> + *
> + * Implements support for legacy gamma correction table for drivers
> + * that support color management through the DEGAMMA_LUT/GAMMA_LUT
> + * properties. See drm_crtc_enable_color_mgmt() and the containing chapt=
er for
> + * how the atomic color management and gamma tables work.
> + *
> + * This function uses GAMMA_LUT property for the gamma table. This funct=
ion
> + * can be used when the driver exposes either only GAMMA_LUT or both GAM=
MA_LUT
> + * and DEGAMMA_LUT.
> + */
> +int drm_atomic_helper_legacy_gamma_set(struct drm_crtc *crtc,
> +				       u16 *red, u16 *green, u16 *blue,
> +				       uint32_t size,
> +				       struct drm_modeset_acquire_ctx *ctx)
> +{
> +	return legacy_gamma_degamma_set(crtc, red, green, blue, size, ctx, fals=
e);
> +}
>  EXPORT_SYMBOL(drm_atomic_helper_legacy_gamma_set);
> =20
> +/**
> + * drm_atomic_helper_legacy_degamma_set - set the legacy gamma correctio=
n table using degamma_lut
> + * @crtc: CRTC object
> + * @red: red correction table
> + * @green: green correction table
> + * @blue: green correction table
> + * @size: size of the tables
> + * @ctx: lock acquire context
> + *
> + * Implements support for legacy gamma correction table for drivers
> + * that support color management through the DEGAMMA_LUT/GAMMA_LUT
> + * properties. See drm_crtc_enable_color_mgmt() and the containing chapt=
er for
> + * how the atomic color management and gamma tables work.
> + *
> + * This function uses DEGAMMA_LUT property for the gamma table. This fun=
ction
> + * can be used when the driver exposes only DEGAMNMA_LUT.
> + */
> +int drm_atomic_helper_legacy_degamma_set(struct drm_crtc *crtc,
> +					 u16 *red, u16 *green, u16 *blue,
> +					 uint32_t size,
> +					 struct drm_modeset_acquire_ctx *ctx)
> +{
> +	return legacy_gamma_degamma_set(crtc, red, green, blue, size, ctx, true=
);
> +}
> +EXPORT_SYMBOL(drm_atomic_helper_legacy_degamma_set);
> +
>  /**
>   * drm_atomic_helper_bridge_propagate_bus_fmt() - Propagate output forma=
t to
>   *						  the input end of a bridge
> diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_hel=
per.h
> index b268180c97eb..e60f5a600195 100644
> --- a/include/drm/drm_atomic_helper.h
> +++ b/include/drm/drm_atomic_helper.h
> @@ -148,6 +148,10 @@ int drm_atomic_helper_legacy_gamma_set(struct drm_cr=
tc *crtc,
>  				       u16 *red, u16 *green, u16 *blue,
>  				       uint32_t size,
>  				       struct drm_modeset_acquire_ctx *ctx);
> +int drm_atomic_helper_legacy_degamma_set(struct drm_crtc *crtc,
> +					 u16 *red, u16 *green, u16 *blue,
> +					 uint32_t size,
> +					 struct drm_modeset_acquire_ctx *ctx);
> =20
>  /**
>   * drm_atomic_crtc_for_each_plane - iterate over planes currently attach=
ed to CRTC


--Sig_/mG/wjCAqWw0QgB4am6spTHz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl9tppcACgkQI1/ltBGq
qqdu6RAAqXOUZlaPVvOPk56SBtOM6avfQ7w8hQi05e0emx6FKqwwtv+FpiLloiyg
rKrHFRr3toxlOHw7kct+nhGQ7vtpJfoXSkealH/EvjlhUYdFZ9khFfewUmTz1aOU
Xu35LIsvAiOTaqPuBII+qM8fgv3oBYznCYiiXhKkWbysPg45IIWot4Ps8f8jcB8/
Wam83T70DBnIJ1auZAyYeY4viNCLvWwNnDjWv69KZB/+sAEe22rzHv89W4fAqw0U
QfP0eIAd+5lNBk93HCuwFutuPfT3TAixtfRA5C2eRx7MUo85WdgZT6H1KDi20XBj
d1A9rjUu69h6bZcQLYfYNLCGK540ZnrzA4k6dzaarR/pc8emCyOlOO8Y93p4zkxh
7NbXmxI0UvNHPfsuGlncA8rH1AcK3B1jLrEfRRyjnc9Ryg/gL+tL10GJjiEZ2HPI
koQ63v+DmkkcmJjg+2iwvLuHEJlnMWFvN1GCq3VnyY2QTkBZmCBDupzeI0qAV7Qo
1U+sLtNf6e6TKjkkY7BTtO25JeNPn7t25ivZ+6efhi6s9uraPjVylTZaz15NvbIs
GHZouOG2yj5N14Jbondl/hvWZqH+r8VoNIY9EG3uDl97nldfAEE2TO/ym0Rk0Q8Y
S4yhSx5F7SQLXm6s6puVBnmYvEzgh+SheNEW3VmoSdBHlSce2B8=
=XV9I
-----END PGP SIGNATURE-----

--Sig_/mG/wjCAqWw0QgB4am6spTHz--

--===============0557248530==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0557248530==--
