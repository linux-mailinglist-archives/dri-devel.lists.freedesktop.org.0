Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8CC3AFDB0
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 09:15:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0753E6E077;
	Tue, 22 Jun 2021 07:15:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42C0F6E03E;
 Tue, 22 Jun 2021 07:15:22 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id k10so1207662lfv.13;
 Tue, 22 Jun 2021 00:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=AMV40G0WQa5rwDidNF4QOHohhlYu3g3xNBvCqr6xBv8=;
 b=E6/t0xdALJK9dIvK4kmzxlmOWJyuGnCuZ4D/84T0z35Zxv76HBjGW3pfaDpm1iBgfC
 o6tNIk7w9cTD3d/PdHlXv3HBjjaNTBiqsDB3f+x/snE6MEMshMNeeudTioO9LUxPLd6k
 tgv/TtEX0qTYYhwE0AwZ251DtuE7fPdg2N9lni37XwLbiP8XzXjZgM8czgD9Gr+PHUby
 2mR98U7ihOTUpC3JeL9NLyizR1d9v5/7vh+pCTrf5mpZnf2z8KbwArxDNwZcxvSH6mmN
 XCYg2ib8biu/EGeyaprfgh94roWkEt2GqxN19DG4Z0mJdLeyxaz7wDF7hCrVwCFyOTZH
 9PIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=AMV40G0WQa5rwDidNF4QOHohhlYu3g3xNBvCqr6xBv8=;
 b=S9lE6A8jfBQ4V7nSOxfvlyRH9d5MUTUSqLCFZISX25RqnshtLuMmZKewvJGKUjxBxG
 DdnlG2TiIZZoKJq8tNScftTyOIRw5DQlZy+LQTDYPZhuUbCj/vfsgVS5x7hApUYPQ2zA
 pJPB0qvRCiJ2atIkK8OgoFTykYa65bJAjCISn1cqjI5CzFG58XpzEsepiS3zfixWpT9m
 FPD8isKMLUs2HIX8cHqn0ebXXE73b2i/UC/TR/g6OL6VjeQ6A7teFDIyCGmAxXU6eb6W
 XFYM90fylxZ4O3YyXcOXXyiNEOA3+QQ+z2Gn8CpgLp3oLSjpFp7NHm/ujmh+zTv8YYSL
 9XpA==
X-Gm-Message-State: AOAM531upG/VZcVgBVpCVAJa+KOJ1EPmaTa7c+BdHSxmhIvdxNAClIzo
 Le5i177A1kNePOEh2hn8TRc=
X-Google-Smtp-Source: ABdhPJzLfb1Rd3xykruv5WU9C0lgkMrLGGzzsAjV4xlo6WpWcaAmawp7H+WicXTM5o6ujr6gBbxSSw==
X-Received: by 2002:ac2:5233:: with SMTP id i19mr1708498lfl.575.1624346120610; 
 Tue, 22 Jun 2021 00:15:20 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id x14sm389743ljp.11.2021.06.22.00.15.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 00:15:20 -0700 (PDT)
Date: Tue, 22 Jun 2021 10:15:16 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Werner Sembach <wse@tuxedocomputers.com>
Subject: Re: [PATCH v4 12/17] drm/uAPI: Add "preferred color format" drm
 property as setting for userspace
Message-ID: <20210622101516.6a53831c@eldfell>
In-Reply-To: <20210618091116.14428-13-wse@tuxedocomputers.com>
References: <20210618091116.14428-1-wse@tuxedocomputers.com>
 <20210618091116.14428-13-wse@tuxedocomputers.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/L.D.0v0v3EndnJnEeMysKiT"; protocol="application/pgp-signature"
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

--Sig_/L.D.0v0v3EndnJnEeMysKiT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 18 Jun 2021 11:11:11 +0200
Werner Sembach <wse@tuxedocomputers.com> wrote:

> Add a new general drm property "preferred color format" which can be used
> by userspace to tell the graphic drivers to which color format to use.
>=20
> Possible options are:
>     - auto (default/current behaviour)
>     - rgb
>     - ycbcr444
>     - ycbcr422 (not supported by both amdgpu and i915)
>     - ycbcr420
>=20
> In theory the auto option should choose the best available option for the
> current setup, but because of bad internal conversion some monitors look
> better with rgb and some with ycbcr444.
>=20
> Also, because of bad shielded connectors and/or cables, it might be
> preferable to use the less bandwidth heavy ycbcr422 and ycbcr420 formats
> for a signal that is less deceptible to interference.
>=20
> In the future, automatic color calibration for screens might also depend =
on
> this option being available.
>=20
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c |  4 +++
>  drivers/gpu/drm/drm_atomic_uapi.c   |  4 +++
>  drivers/gpu/drm/drm_connector.c     | 48 ++++++++++++++++++++++++++++-
>  include/drm/drm_connector.h         | 17 ++++++++++
>  4 files changed, 72 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_at=
omic_helper.c
> index bc3487964fb5..90d62f305257 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -687,6 +687,10 @@ drm_atomic_helper_check_modeset(struct drm_device *d=
ev,
>  			if (old_connector_state->max_requested_bpc !=3D
>  			    new_connector_state->max_requested_bpc)
>  				new_crtc_state->connectors_changed =3D true;
> +
> +			if (old_connector_state->preferred_color_format !=3D
> +			    new_connector_state->preferred_color_format)
> +				new_crtc_state->connectors_changed =3D true;
>  		}
> =20
>  		if (funcs->atomic_check)
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atom=
ic_uapi.c
> index 438e9585b225..c536f5e22016 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -796,6 +796,8 @@ static int drm_atomic_connector_set_property(struct d=
rm_connector *connector,
>  						   fence_ptr);
>  	} else if (property =3D=3D connector->max_bpc_property) {
>  		state->max_requested_bpc =3D val;
> +	} else if (property =3D=3D connector->preferred_color_format_property) {
> +		state->preferred_color_format =3D val;
>  	} else if (connector->funcs->atomic_set_property) {
>  		return connector->funcs->atomic_set_property(connector,
>  				state, property, val);
> @@ -873,6 +875,8 @@ drm_atomic_connector_get_property(struct drm_connecto=
r *connector,
>  		*val =3D 0;
>  	} else if (property =3D=3D connector->max_bpc_property) {
>  		*val =3D state->max_requested_bpc;
> +	} else if (property =3D=3D connector->preferred_color_format_property) {
> +		*val =3D state->preferred_color_format;
>  	} else if (connector->funcs->atomic_get_property) {
>  		return connector->funcs->atomic_get_property(connector,
>  				state, property, val);
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connec=
tor.c
> index 818de58d972f..aea03dd02e33 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -889,6 +889,14 @@ static const struct drm_prop_enum_list drm_dp_subcon=
nector_enum_list[] =3D {
>  	{ DRM_MODE_SUBCONNECTOR_Native,	     "Native"    }, /* DP */
>  };
> =20
> +static const struct drm_prop_enum_list drm_preferred_color_format_enum_l=
ist[] =3D {
> +	{ 0, "auto" },
> +	{ DRM_COLOR_FORMAT_RGB444, "rgb" },
> +	{ DRM_COLOR_FORMAT_YCRCB444, "ycbcr444" },
> +	{ DRM_COLOR_FORMAT_YCRCB422, "ycbcr422" },
> +	{ DRM_COLOR_FORMAT_YCRCB420, "ycbcr420" },
> +};
> +
>  static const struct drm_prop_enum_list drm_active_color_format_enum_list=
[] =3D {
>  	{ 0, "unknown" },
>  	{ DRM_COLOR_FORMAT_RGB444, "rgb" },
> @@ -1219,11 +1227,19 @@ static const struct drm_prop_enum_list dp_colorsp=
aces[] =3D {
>   *	Drivers shall use drm_connector_attach_active_bpc_property() to insta=
ll
>   *	this property.
>   *
> + * preferred color format:
> + *	This property is used by userspace to change the used color format. W=
hen
> + *	used the driver will use the selected format if valid for the hardwar=
e,
> + *	sink, and current resolution and refresh rate combination. Drivers to
> + *	use the function drm_connector_attach_preferred_color_format_property=
()
> + *	to create and attach the property to the connector during
> + *	initialization.
> + *
>   * active color format:
>   *	This read-only property tells userspace the color format actually used
>   *	by the hardware display engine on "the cable" on a connector. The cho=
sen
>   *	value depends on hardware capabilities, both display engine and
> - *	connected monitor. Drivers shall use
> + *	connected monitor, and the "preferred color format". Drivers shall use
>   *	drm_connector_attach_active_color_format_property() to install this
>   *	property.
>   *
> @@ -2233,6 +2249,36 @@ void drm_connector_set_active_bpc_property(struct =
drm_connector *connector, int
>  }
>  EXPORT_SYMBOL(drm_connector_set_active_bpc_property);
> =20
> +/**
> + * drm_connector_attach_preferred_color_format_property - attach "prefer=
red color format" property
> + * @connector: connector to attach active color format property on.
> + *
> + * This is used to add support for selecting a color format on a connect=
or.
> + *
> + * Returns:
> + * Zero on success, negative errno on failure.
> + */
> +int drm_connector_attach_preferred_color_format_property(struct drm_conn=
ector *connector)
> +{
> +	struct drm_device *dev =3D connector->dev;
> +	struct drm_property *prop;
> +
> +	if (!connector->preferred_color_format_property) {
> +		prop =3D drm_property_create_enum(dev, 0, "preferred color format",
> +						drm_preferred_color_format_enum_list,
> +						ARRAY_SIZE(drm_preferred_color_format_enum_list));
> +		if (!prop)
> +			return -ENOMEM;
> +
> +		connector->preferred_color_format_property =3D prop;
> +		drm_object_attach_property(&connector->base, prop, 0);
> +		connector->state->preferred_color_format =3D 0;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_connector_attach_preferred_color_format_property);
> +
>  /**
>   * drm_connector_attach_active_color_format_property - attach "active co=
lor format" property
>   * @connector: connector to attach active color format property on.
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 9fb7119b7a02..7b85407ba45c 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -799,6 +799,16 @@ struct drm_connector_state {
>  	 */
>  	u8 max_bpc;
> =20
> +	/**
> +	 * preferred_color_format: Property set by userspace to tell the GPU
> +	 * driver which color format to use. It only gets applied if hardware,
> +	 * meaning both the computer and the monitor, and the driver support the
> +	 * given format at the current resolution and refresh rate. Userspace
> +	 * can check for (un-)successful application via the active_color_format
> +	 * property.
> +	 */
> +	u32 preferred_color_format;

Hi,

yes, I think this makes sense, even if it is a property that one can't
tell for sure what it does before hand.

Using a pair of properties, preference and active, to ask for something
and then check what actually worked is good for reducing the
combinatorial explosion caused by needing to "atomic TEST_ONLY commit"
test different KMS configurations. Userspace has a better chance of
finding a configuration that is possible.

OTOH, this has the problem than in UI one cannot tell the user in
advance which options are truly possible. Given that KMS properties are
rarely completely independent, and in this case known to depend on
several other KMS properties, I think it is good enough to know after
the fact.

If a driver does not use what userspace prefers, there is no way to
understand why, or what else to change to make it happen. That problem
exists anyway, because TEST_ONLY commits do not give useful feedback
but only a yes/no.

Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks,
pq


> +
>  	/**
>  	 * @hdr_output_metadata:
>  	 * DRM blob property for HDR output metadata
> @@ -1404,6 +1414,12 @@ struct drm_connector {
>  	 */
>  	struct drm_property *active_bpc_property;
> =20
> +	/**
> +	 * @preferred_color_format_property: Default connector property for the
> +	 * preferred color format to be driven out of the connector.
> +	 */
> +	struct drm_property *preferred_color_format_property;
> +
>  	/**
>  	 * @active_color_format_property: Default connector property for the
>  	 * active color format to be driven out of the connector.
> @@ -1740,6 +1756,7 @@ int drm_connector_attach_max_bpc_property(struct dr=
m_connector *connector,
>  					  int min, int max);
>  int drm_connector_attach_active_bpc_property(struct drm_connector *conne=
ctor, int min, int max);
>  void drm_connector_set_active_bpc_property(struct drm_connector *connect=
or, int active_bpc);
> +int drm_connector_attach_preferred_color_format_property(struct drm_conn=
ector *connector);
>  int drm_connector_attach_active_color_format_property(struct drm_connect=
or *connector);
>  void drm_connector_set_active_color_format_property(struct drm_connector=
 *connector,
>  						    u32 active_color_format);


--Sig_/L.D.0v0v3EndnJnEeMysKiT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmDRjgQACgkQI1/ltBGq
qqdhwhAAhoDfObqfEZQNeibtIpwNqkHY055dii6/SWOwJBDNzZg36s84Xzgjbhds
8Bt35uYgr7WCvI82yqfzKDu9gd7pJiiLKQ42A6tgpu+tpjD1/pRUDpn/Ufzbuaj9
VF1Rq+qKGJs7X5MY4X2JLT6aLnykS0KUUKJcTw8X74j7OaMjZqEtMaiPGW04UQcE
2WWxRaVi1R8yaRspb9HTDBcEhLZgWWVg9S92rysVFsBoEUHnbWrC02R/wyEz+CZx
PPgW+X5Skzrk1TFgCgqL40Wc9QZnSyEbmBy5J1riNlGvcfQP74qhcNYyPyT+ORaw
UtEDcBfUFigGX3JaiXYvDT1aGAHefncPc1TFt+u7uBxl6Efza6ClZDw3FKWBRVnk
jjJG7arN/6MNXrTODz+ZW5H+FFU3NgPJYAanBTGtqKB44/eF+AgAUBrMVDRlhSM9
b3oO0ft2wnf2HDfVVP0OQDvWpZ/I0MIwqctQJli8Do7bAJv2n5WgAPW5AxqBXsPN
iOcoWJ9XUbHWOgCSVLfeN5kPLCMMBdBt+5GpJWqycofVvf5tWZObC+a7Zm0qujxI
gneewTb1OfzvKMbWfZen4MFa6A1eYRxKgm8FMqUWRVU4dylUmS9uaxtbF4JARF6W
OW+RzKlkePz/L1nqRCgpRlK3qXDSE+XVhVOPWUxGvJ2UZC1tky4=
=k/cp
-----END PGP SIGNATURE-----

--Sig_/L.D.0v0v3EndnJnEeMysKiT--
