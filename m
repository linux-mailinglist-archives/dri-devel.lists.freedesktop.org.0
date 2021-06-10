Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 356163A25EC
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 09:55:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF7BA6E8B5;
	Thu, 10 Jun 2021 07:55:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 063666EB8E;
 Thu, 10 Jun 2021 07:55:40 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id r16so3640034ljc.0;
 Thu, 10 Jun 2021 00:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=SA5Ivb0CCE59h380OTMfIw4pEztiT4MRBNH8ti8EjRg=;
 b=UsnB/8xogJHe8G+HURPvdy9xSpG3q17OyaxwZos6B9OkmHr3UPdrILT14c6jXIojl+
 k5fcp7oj/ZZ4j8DZKt7NTp+68VQAGcq0bmTDzQkGiLUhW1EFMYyqQq7N3CE/WtRuE3+N
 KySdDSuuW9EhDIiadb2Cda85fZ0GYtk7gGNqinLYGI6q5xKPVMNkf4/K27+ljIX9Kklt
 1UP11UZos81azcTn+0kTCJIZ5/jqxpc2h0qgfmWeoDJVWxAYQ0Q3SmLGnvN91VSLi4T3
 7ABgyeXmcLUdBik/48NVhn3oixQ7Qrmhr0TRdaWTyCPzEFA/eFbg1qmsReEJ+lgBg4Ca
 Z+MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=SA5Ivb0CCE59h380OTMfIw4pEztiT4MRBNH8ti8EjRg=;
 b=tMNS1gOaQIxWAIs1Fe6BxbIfIZJIcI2rC6V91yTkD0RE99Fxruh4p+Cwbk2LvSFVlg
 iPZTDZGqNmyTbxOwRTnRC2A+1M79/dvBaVwCdA+kr2mpbr3o3nONGCCDgPjDBK+vJHRL
 76lqd4mxyL78/McqLPAr4ujWLUmjOPETSNk/44lrnkUHakjDjXPBpbTXKKr7FOGIuGqq
 KvV5xSFE4Wf1JtdMeubVtBC755HbTtT7+HQTgl+f3y7GpMlfxk4xXH25W/oh+EGvFlAP
 al1uXdiZ1smo4THdOAucdMArwvRR4S2wUexlcZdx9+wV+8fmmikOFlv0cRU9/+etIanh
 akuA==
X-Gm-Message-State: AOAM530tXMhG5f9EBE3Juo7Jqyzj/0w7x4Rnpdsxjd3+Z0jqgBPO2RVs
 /bNDJecOp9cibxKVMW9TAos=
X-Google-Smtp-Source: ABdhPJx3RpDRGm7QQl5Suj8t19KY4oI1aFylsWb1rF9ssiZz1Ey/gILxkTKcx5cMo6mviJKQNFnryg==
X-Received: by 2002:a05:651c:514:: with SMTP id
 o20mr1227077ljp.201.1623311738293; 
 Thu, 10 Jun 2021 00:55:38 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id r8sm240527lfc.90.2021.06.10.00.55.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 00:55:37 -0700 (PDT)
Date: Thu, 10 Jun 2021 10:55:24 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Werner Sembach <wse@tuxedocomputers.com>
Subject: Re: [PATCH v2 2/7] drm/uAPI: Add "active bpc" as feedback channel
 for "max bpc" drm property
Message-ID: <20210610105524.4dd2a40f@eldfell>
In-Reply-To: <20210608174320.37429-3-wse@tuxedocomputers.com>
References: <20210608174320.37429-1-wse@tuxedocomputers.com>
 <20210608174320.37429-3-wse@tuxedocomputers.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/G9gjPWkKmqwLWKB6JjVFNYP"; protocol="application/pgp-signature"
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
Cc: amd-gfx@lists.freedesktop.org, tzimmermann@suse.de,
 intel-gfx@lists.freedesktop.org, sunpeng.li@amd.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 airlied@linux.ie, rodrigo.vivi@intel.com, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/G9gjPWkKmqwLWKB6JjVFNYP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue,  8 Jun 2021 19:43:15 +0200
Werner Sembach <wse@tuxedocomputers.com> wrote:

> Add a new general drm property "active bpc" which can be used by graphic =
drivers
> to report the applied bit depth per pixel back to userspace.
>=20
> While "max bpc" can be used to change the color depth, there was no way t=
o check
> which one actually got used. While in theory the driver chooses the best/=
highest
> color depth within the max bpc setting a user might not be fully aware wh=
at his
> hardware is or isn't capable off. This is meant as a quick way to double =
check
> the setup.
>=20
> In the future, automatic color calibration for screens might also depend =
on this
> information being available.
>=20
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> ---
>  drivers/gpu/drm/drm_atomic_uapi.c |  2 ++
>  drivers/gpu/drm/drm_connector.c   | 41 +++++++++++++++++++++++++++++++
>  include/drm/drm_connector.h       | 15 +++++++++++
>  3 files changed, 58 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atom=
ic_uapi.c
> index 268bb69c2e2f..7ae4e40936b5 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -873,6 +873,8 @@ drm_atomic_connector_get_property(struct drm_connecto=
r *connector,
>  		*val =3D 0;
>  	} else if (property =3D=3D connector->max_bpc_property) {
>  		*val =3D state->max_requested_bpc;
> +	} else if (property =3D=3D connector->active_bpc_property) {
> +		*val =3D state->active_bpc;
>  	} else if (connector->funcs->atomic_get_property) {
>  		return connector->funcs->atomic_get_property(connector,
>  				state, property, val);
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connec=
tor.c
> index 7631f76e7f34..c0c3c09bfed0 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -1195,6 +1195,14 @@ static const struct drm_prop_enum_list dp_colorspa=
ces[] =3D {
>   *	drm_connector_attach_max_bpc_property() to create and attach the
>   *	property to the connector during initialization.
>   *
> + * active bpc:
> + *	This read-only range property tells userspace the pixel color bit dep=
th
> + *	actually used by the hardware display engine on "the cable" on a
> + *	connector. The chosen value depends on hardware capabilities, both
> + *	display engine and connected monitor, and the "max bpc" property.
> + *	Drivers shall use drm_connector_attach_active_bpc_property() to insta=
ll
> + *	this property.
> + *

This description is now clear to me, but I wonder, is it also how
others understand it wrt. dithering?

Dithering done on monitor is irrelevant, because we are talking about
"on the cable" pixels. But since we are talking about "on the cable"
pixels, also dithering done by the display engine must not factor in.
Should the dithering done by display engine result in higher "active
bpc" number than what is actually transmitted on the cable?

I cannot guess what userspace would want exactly. I think the
strict "on the cable" interpretation is a safe bet, because it then
gives a lower limit on observed bpc. Dithering settings should be
exposed with other KMS properties, so userspace can factor those in.
But to be absolutely sure, we'd have to ask some color management
experts.

Cc'ing Mario in case he has an opinion.

Since "active bpc" is related to "max bpc", the both should follow the
same definition. Do they do that now?

Maybe a clarifying note about interaction with dithering would still be
good to have here.


I recall reading some comments from you about having problems with
making this immutable. Is it properly immutable now?

That is, drm_info reports the property as "(immutable)".
https://github.com/ascent12/drm_info

If we are not sure if DSC could result in lower observed bpc than
"active bpc", then DSC state would need to be exposed as a KMS property
too, with a note that it invalidates what "active bpc" shows. Or maybe
"active bpc" should be "unknown" in that case?


Thanks,
pq

>   * Connectors also have one standardized atomic property:
>   *
>   * CRTC_ID:
> @@ -2150,6 +2158,39 @@ int drm_connector_attach_max_bpc_property(struct d=
rm_connector *connector,
>  }
>  EXPORT_SYMBOL(drm_connector_attach_max_bpc_property);
> =20
> +/**
> + * drm_connector_attach_active_bpc_property - attach "active bpc" proper=
ty
> + * @connector: connector to attach active bpc property on.
> + * @min: The minimum bit depth supported by the connector.
> + * @max: The maximum bit depth supported by the connector.
> + *
> + * This is used to check the applied bit depth on a connector.
> + *
> + * Returns:
> + * Zero on success, negative errno on failure.
> + */
> +int drm_connector_attach_active_bpc_property(struct drm_connector *conne=
ctor,
> +					  int min, int max)
> +{
> +	struct drm_device *dev =3D connector->dev;
> +	struct drm_property *prop;
> +
> +	prop =3D connector->active_bpc_property;
> +	if (!prop) {
> +		prop =3D drm_property_create_range(dev, 0, "active bpc", min, max);
> +		if (!prop)
> +			return -ENOMEM;
> +
> +		connector->active_bpc_property =3D prop;
> +	}
> +
> +	drm_object_attach_property(&connector->base, prop, 0);
> +	connector->state->active_bpc =3D 0;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_connector_attach_active_bpc_property);
> +
>  /**
>   * drm_connector_set_vrr_capable_property - sets the variable refresh ra=
te
>   * capable property for a connector
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 1922b278ffad..c58cba2b6afe 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -781,6 +781,13 @@ struct drm_connector_state {
>  	 */
>  	u8 max_bpc;
> =20
> +	/**
> +	 * @active_bpc: Read only property set by the GPU driver to the actually
> +	 * applied bit depth of the pixels after evaluating all hardware
> +	 * limitations.
> +	 */
> +	u8 active_bpc;
> +
>  	/**
>  	 * @hdr_output_metadata:
>  	 * DRM blob property for HDR output metadata
> @@ -1380,6 +1387,12 @@ struct drm_connector {
>  	 */
>  	struct drm_property *max_bpc_property;
> =20
> +	/**
> +	 * @active_bpc_property: Default connector property for the active bpc
> +	 * to be driven out of the connector.
> +	 */
> +	struct drm_property *active_bpc_property;
> +
>  #define DRM_CONNECTOR_POLL_HPD (1 << 0)
>  #define DRM_CONNECTOR_POLL_CONNECT (1 << 1)
>  #define DRM_CONNECTOR_POLL_DISCONNECT (1 << 2)
> @@ -1698,6 +1711,8 @@ int drm_connector_set_panel_orientation_with_quirk(
>  	int width, int height);
>  int drm_connector_attach_max_bpc_property(struct drm_connector *connecto=
r,
>  					  int min, int max);
> +int drm_connector_attach_active_bpc_property(struct drm_connector *conne=
ctor,
> +					  int min, int max);
> =20
>  /**
>   * struct drm_tile_group - Tile group metadata


--Sig_/G9gjPWkKmqwLWKB6JjVFNYP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIyBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmDBxWwACgkQI1/ltBGq
qqdx6Q/2Jx5o//7FCgMeDEoDPr3pod+Wxo2MlOMa8WmeEgg/7A4nmr0Of/btoEof
IwDEbBZvN9gJIz0vA4GaLKNOjRFHek9l2ur6TsQ292J6CoC/MJclpee511ImuaCl
a0GGw9vwcmUJLUInvM6fwcEzi9Vb+dj1H2VNqRq56QcpgX/+WjW5AkMc0LtsD+qi
hs2DAnvHkTuaocgY7gCjLMlE9sBwmNUByzpvsl2Nwnn994hdUP2SylTXBJ5cm06j
BKqEbFelKajhQzscjre7vU4d7EKalm7bKT83BubXg6Q3GAqYMMJhQU7IrH7YQPf4
Ns+Yjw93SxM8V/Gesyu7ZTh6Nclz51oDpcWZZB5GIDXpQWr58+Fa8H+ZgXxSVP59
A49M1SAjdmttofu0H1YCijuboKSlHOlq85zHJmIl/TRhMEqbKiej5Z4z/4FtjIHl
HfiXcJIa2iWYcNYGeSktgFf0tu55+X06usqAippPXr8jiU0dYHeuHGrQjenKPWLg
ooSpWddnrQgFpNhGOdtpiKHpYwWaob9P5tcgaEjt+lvGzJR2mDBi8IBAfBIWE7VZ
qDRnSfZb0/0tWMftwxnTlbyv2Zyp9/aIaLShx3SmVmRVUzFK+oVwgXINju8Io+h/
fiOW3tUyC43DGNqVoBYglrGDGeyrjv8z9s2HQ3JfJlWapvLRaw==
=ap5H
-----END PGP SIGNATURE-----

--Sig_/G9gjPWkKmqwLWKB6JjVFNYP--
