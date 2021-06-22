Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 583903AFDCF
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 09:25:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA0B589CBA;
	Tue, 22 Jun 2021 07:25:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB2F789CBA;
 Tue, 22 Jun 2021 07:25:34 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id d2so28760472ljj.11;
 Tue, 22 Jun 2021 00:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=63bF/PxPUMQAJxYsW6VV+AAwW5y+kjTl/htMV9IqlYc=;
 b=LFPPKf+49gyf+5tUB0gVmpcs8B7pXSEMfIFpkORFKOFeC70PGRAIOlPyGFMwqF03hA
 pHteJDS6cdAZDc7p0OpcwBmX6yQQBQWZJj+V4b/jgHTGCpYRgB3PdpI+DWidu+H4Q8Np
 KcU4QqEJEWNqb4SFd67QSqyWuu6MiDDlOJo8wNVXdouLtQ1MUnnZddPQCIt0tgdlEPM8
 wn88UmE4SkAszGsSArYBFBrooIxp+MrtruZ8+taGAg8x7JNbwhW56XwPmUnz6oUvSfAE
 zznrkkXwXQmnRh428hoTioyb+SHuJjf1xjPgUuDtVOpEE4/qm5rQfrIm5qYbBClh+VmZ
 gDOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=63bF/PxPUMQAJxYsW6VV+AAwW5y+kjTl/htMV9IqlYc=;
 b=ILp46i1fEQUHKZTGH3byBoPoTQ08gF3YKfzvySBsB+24euFgRw23jYlyX7ekH/2MFy
 tqhE0qp4dlMb6/aUYrt6UWAcqQDOi//pLKI86Z3Z2OLd69ORbxxLqP91TOzN3cGC9TDu
 7qqzeNZcNB39cbt4ahWocO/EFg0JAHCuxqfnC8l328mnD7vWZIpEbvVd/y+gTuZu6QTw
 tXYP4J2rMBEpqKcovbDcXLSLA5NY8/56/3wWnxRBEER9ZE23aeHgHXaPYMZa2Qerd2Ri
 bj67HjyhLaU/t6w6f0a88VCAcU86QDO1hzQoEboKxTF6X6DeXBhaFddACFjEnPJDKdU1
 piyA==
X-Gm-Message-State: AOAM533t2YGWQX4qtC+pOaobxmyxy1xsakYcsrMPRpIk8FzoK3IujT20
 d1IeO9VUH4FEXRROd1B+fkk=
X-Google-Smtp-Source: ABdhPJyM7PU5rI4nSjof8Xx25JMZEz3CzCBTRFugj/+GZqSUz0XDhNcL0WkSh8xavM+R7ev4FK6JyQ==
X-Received: by 2002:a05:651c:178f:: with SMTP id
 bn15mr2035262ljb.448.1624346733271; 
 Tue, 22 Jun 2021 00:25:33 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id h20sm822951lfu.212.2021.06.22.00.25.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 00:25:32 -0700 (PDT)
Date: Tue, 22 Jun 2021 10:25:29 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Werner Sembach <wse@tuxedocomputers.com>
Subject: Re: [PATCH v4 15/17] drm/uAPI: Move "Broadcast RGB" property from
 driver specific to general context
Message-ID: <20210622102529.5266e87b@eldfell>
In-Reply-To: <20210618091116.14428-16-wse@tuxedocomputers.com>
References: <20210618091116.14428-1-wse@tuxedocomputers.com>
 <20210618091116.14428-16-wse@tuxedocomputers.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/PYz0otYZfE681ThjIDKZPnQ"; protocol="application/pgp-signature"
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

--Sig_/PYz0otYZfE681ThjIDKZPnQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 18 Jun 2021 11:11:14 +0200
Werner Sembach <wse@tuxedocomputers.com> wrote:

> Add "Broadcast RGB" to general drm context so that more drivers besides
> i915 and gma500 can implement it without duplicating code.
>=20
> Userspace can use this property to tell the graphic driver to use full or
> limited color range for a given connector, overwriting the default
> behaviour/automatic detection.
>=20
> Possible options are:
>     - Automatic (default/current behaviour)
>     - Full
>     - Limited 16:235
>=20
> In theory the driver should be able to automatically detect the monitors
> capabilities, but because of flawed standard implementations in Monitors,
> this might fail. In this case a manual overwrite is required to not have
> washed out colors or lose details in very dark or bright scenes.
>=20
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c |  4 +++
>  drivers/gpu/drm/drm_atomic_uapi.c   |  4 +++
>  drivers/gpu/drm/drm_connector.c     | 43 +++++++++++++++++++++++++++++
>  include/drm/drm_connector.h         | 16 +++++++++++
>  4 files changed, 67 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_at=
omic_helper.c
> index 90d62f305257..0c89d32efbd0 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -691,6 +691,10 @@ drm_atomic_helper_check_modeset(struct drm_device *d=
ev,
>  			if (old_connector_state->preferred_color_format !=3D
>  			    new_connector_state->preferred_color_format)
>  				new_crtc_state->connectors_changed =3D true;
> +
> +			if (old_connector_state->preferred_color_range !=3D
> +			    new_connector_state->preferred_color_range)
> +				new_crtc_state->connectors_changed =3D true;
>  		}
> =20
>  		if (funcs->atomic_check)
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atom=
ic_uapi.c
> index c536f5e22016..c589bb1a8163 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -798,6 +798,8 @@ static int drm_atomic_connector_set_property(struct d=
rm_connector *connector,
>  		state->max_requested_bpc =3D val;
>  	} else if (property =3D=3D connector->preferred_color_format_property) {
>  		state->preferred_color_format =3D val;
> +	} else if (property =3D=3D connector->preferred_color_range_property) {
> +		state->preferred_color_range =3D val;
>  	} else if (connector->funcs->atomic_set_property) {
>  		return connector->funcs->atomic_set_property(connector,
>  				state, property, val);
> @@ -877,6 +879,8 @@ drm_atomic_connector_get_property(struct drm_connecto=
r *connector,
>  		*val =3D state->max_requested_bpc;
>  	} else if (property =3D=3D connector->preferred_color_format_property) {
>  		*val =3D state->preferred_color_format;
> +	} else if (property =3D=3D connector->preferred_color_range_property) {
> +		*val =3D state->preferred_color_range;
>  	} else if (connector->funcs->atomic_get_property) {
>  		return connector->funcs->atomic_get_property(connector,
>  				state, property, val);
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connec=
tor.c
> index aea03dd02e33..9bc596638613 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -905,6 +905,12 @@ static const struct drm_prop_enum_list drm_active_co=
lor_format_enum_list[] =3D {
>  	{ DRM_COLOR_FORMAT_YCRCB420, "ycbcr420" },
>  };
> =20
> +static const struct drm_prop_enum_list drm_preferred_color_range_enum_li=
st[] =3D {
> +	{ DRM_MODE_COLOR_RANGE_UNSET, "Automatic" },
> +	{ DRM_MODE_COLOR_RANGE_FULL, "Full" },
> +	{ DRM_MODE_COLOR_RANGE_LIMITED_16_235, "Limited 16:235" },

Hi,

the same question here about these numbers as I asked on the "active
color range" property.

> +};
> +
>  static const struct drm_prop_enum_list drm_active_color_range_enum_list[=
] =3D {
>  	{ DRM_MODE_COLOR_RANGE_UNSET, "Unknown" },
>  	{ DRM_MODE_COLOR_RANGE_FULL, "Full" },
> @@ -1243,6 +1249,13 @@ static const struct drm_prop_enum_list dp_colorspa=
ces[] =3D {
>   *	drm_connector_attach_active_color_format_property() to install this
>   *	property.
>   *
> + * Broadcast RGB:
> + *	This property is used by userspace to change the used color range. Wh=
en
> + *	used the driver will use the selected range if valid for the current
> + *	color format. Drivers to use the function
> + *	drm_connector_attach_preferred_color_format_property() to create and
> + *	attach the property to the connector during initialization.

An important detail to document here is: does userspace need to
take care that pixel data at the connector will already match the set
range, or will the driver program the hardware to produce the set range?

If the former, then I'm afraid the preference/active property pair
design does not work. Userspace needs to make sure the content is in
the right range, so the driver cannot second-guess that afterwards.

If the latter, then what does the driver assume about color range just
before the automatic conversion to the final color range, and does the
range conversion happen as the final step in the color pipeline?

If I remember the discussion about Intel right, then the driver does
the latter and assume that userspace programs KMS to always produce
full range pixels. There is no provision for userspace to produce
limited range pixels, IIRC.


Thanks,
pq

> + *
>   * active color range:
>   *	This read-only property tells userspace the color range actually used=
 by
>   *	the hardware display engine on "the cable" on a connector. The chosen
> @@ -2324,6 +2337,36 @@ void drm_connector_set_active_color_format_propert=
y(struct drm_connector *connec
>  }
>  EXPORT_SYMBOL(drm_connector_set_active_color_format_property);
> =20
> +/**
> + * drm_connector_attach_preferred_color_range_property - attach "Broadca=
st RGB" property
> + * @connector: connector to attach preferred color range property on.
> + *
> + * This is used to add support for selecting a color range on a connecto=
r.
> + *
> + * Returns:
> + * Zero on success, negative errno on failure.
> + */
> +int drm_connector_attach_preferred_color_range_property(struct drm_conne=
ctor *connector)
> +{
> +	struct drm_device *dev =3D connector->dev;
> +	struct drm_property *prop;
> +
> +	if (!connector->preferred_color_range_property) {
> +		prop =3D drm_property_create_enum(dev, 0, "Broadcast RGB",
> +						drm_preferred_color_range_enum_list,
> +						ARRAY_SIZE(drm_preferred_color_range_enum_list));
> +		if (!prop)
> +			return -ENOMEM;
> +
> +		connector->preferred_color_range_property =3D prop;
> +		drm_object_attach_property(&connector->base, prop, DRM_MODE_COLOR_RANG=
E_UNSET);
> +		connector->state->preferred_color_range =3D DRM_MODE_COLOR_RANGE_UNSET;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_connector_attach_preferred_color_range_property);
> +
>  /**
>   * drm_connector_attach_active_color_range_property - attach "active col=
or range" property
>   * @connector: connector to attach active color range property on.
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 7b85407ba45c..b319760d4a8c 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -809,6 +809,15 @@ struct drm_connector_state {
>  	 */
>  	u32 preferred_color_format;
> =20
> +	/**
> +	 * preferred_color_range: Property set by userspace via "Broadcast RGB"
> +	 * property to tell the GPU driver which color range to use. It
> +	 * overwrites existing automatic detection mechanisms, if set and valid
> +	 * for the current color format. Userspace can check for (un-)successful
> +	 * application via the "active color range" property.
> +	 */
> +	enum drm_mode_color_range preferred_color_range;
> +
>  	/**
>  	 * @hdr_output_metadata:
>  	 * DRM blob property for HDR output metadata
> @@ -1426,6 +1435,12 @@ struct drm_connector {
>  	 */
>  	struct drm_property *active_color_format_property;
> =20
> +	/**
> +	 * @preferred_color_range_property: Default connector property for the
> +	 * preferred color range to be driven out of the connector.
> +	 */
> +	struct drm_property *preferred_color_range_property;
> +
>  	/**
>  	 * @active_color_range_property: Default connector property for the
>  	 * active color range to be driven out of the connector.
> @@ -1760,6 +1775,7 @@ int drm_connector_attach_preferred_color_format_pro=
perty(struct drm_connector *c
>  int drm_connector_attach_active_color_format_property(struct drm_connect=
or *connector);
>  void drm_connector_set_active_color_format_property(struct drm_connector=
 *connector,
>  						    u32 active_color_format);
> +int drm_connector_attach_preferred_color_range_property(struct drm_conne=
ctor *connector);
>  int drm_connector_attach_active_color_range_property(struct drm_connecto=
r *connector);
>  void drm_connector_set_active_color_range_property(struct drm_connector =
*connector,
>  						   enum drm_mode_color_range active_color_range);


--Sig_/PYz0otYZfE681ThjIDKZPnQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmDRkGkACgkQI1/ltBGq
qqdrGA/+OW5JkxSdfG+0esZjis3Zzwco0LK1RFOGhugq7uqzLCm4P8xmQj9SDWF/
I4N6GYn8CuM4OMYO7NX4DwrVT8mCCPdTQjyuaNskqncFDYP0iSOhYV2q4ubGhspy
0sCr/hygJIgwR9mWCQyBMPS1uPUjX4sYkyp4H9ryh/0RZyqx2iJWmja2KUq5ZpX6
biKKCweojolfM7ftbroWj8Tk9KW2gtHTrxHUGUzUF2J6pF/0tgGy0TXk+MD4Y37z
ALgKuz7fFeiGLXFqYGPWBLed+TIRMgzvYlFavNsHpl+YFgBJLmzNfbRNFEj+hIPR
Hrpt+ymGdLURb6xx9Dp4BX3wzVBbozH3Z9vUVo11LT2C1wkmVqaJJ/HEPJywoy/W
dGkAi4TiVzM1+RhndUlPrXsLZWAXH3jFldeKnPflyTx7Bo1z4cGnaxrZsQLMvhNr
3fY5R7HLPDxrJQVc08cGSSmiyXWmgg6nXPXPNnwywDWQw1AQrvBoMwTNtx+ll+8u
mm5KdVz7vMEAFZ8LPnojN9zfEhNyDD7MOQM7yizSef4XZltmtl2C3gqF8CmhkjKO
sRuybE2c1COkQih/9Jr2RZwMQM+knMYnKdDlJ3R6g+GjeEoN9ULZUqJhwVj92Uyx
N0dwbw5VFsUKgD3K8zZyVl16KCUDdrNmkS1JEccMwn8enj+uyIg=
=BftU
-----END PGP SIGNATURE-----

--Sig_/PYz0otYZfE681ThjIDKZPnQ--
