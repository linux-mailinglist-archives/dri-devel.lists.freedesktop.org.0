Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B48B3AFD41
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 08:49:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E58A89B3B;
	Tue, 22 Jun 2021 06:49:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B84D89B3B;
 Tue, 22 Jun 2021 06:49:00 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id k8so28420536lja.4;
 Mon, 21 Jun 2021 23:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=AjSYCi901NK2XUQ4T1T6ypPHjvuphOZQdh9jmhJVLlo=;
 b=P0mNu+w7hZimQwRTECbw8esifmyq4yqjyWPiZ2X2deSCkX866AUn1wxi4zk8HrcNHr
 HO9TmZ7b3OSTPUd9N+dv5fcow4dv0MDkAJloJqAs1icrSgtpe7q5muPrprZO4m40x3+c
 AYDZcC57umhEXcrgg2H7B6pn9Tmpl9ftPfEsiS6T+SCtHNxLAbztzMkq/NyfwooMD2Nc
 ZI3ab005iPEdiIWNDXYVe0N/GIym6W+2tLdfpixAd4ZrkUXRDQwwTfA+WJdIBy6jnfIw
 rI6jkrmmmBGAPJBUsRDru0amCO4Xf4/f7S3RRhaufdAgABaTx6lcCHy2sUWKppgZujL/
 GC7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=AjSYCi901NK2XUQ4T1T6ypPHjvuphOZQdh9jmhJVLlo=;
 b=TLmaPQeg8IKDQDRFjbBkdKoP+WUL6r90MxBIL/qjodlTD4riU/Xl+6pF8quGJ0dY6u
 e4Ii7bPXxz+NAmqJEiPZ1A37gjHPS7jnK0fqmyn9DCEjAkNaSl0azhidbmArXXo49Sby
 rkOdItPaul/+j0irj1bJsp7OH0pLmqbqTF2nKCat+050xpUpuzBayeYagdhRNZUsVoet
 xBDTeJkwuRzBnvOsoKaVODQO3opPL1MAC109HU1veP74wTSq5xd6bRKhv3cJQb2bQ30D
 +mWD97hKGGsZvM3hjdo6Ht47VE2MdJjTuBnqFG7FTGs7FzHZS0I0hV/B9SY8p4ckMTdj
 UIgw==
X-Gm-Message-State: AOAM531FCSVwiU0Hn4J0MYhZXFhTkqcRZUU3lM1KL94FwfA+fVSoXn7f
 5v8H7Hswe6HjPGKKCf1K9Ks=
X-Google-Smtp-Source: ABdhPJw8461dcmLUcxcl4t836vLxjmY/zjtutDFBj2liw0WTiHMRgOCa3/GL0nBmoYdXFLfJBL5lFg==
X-Received: by 2002:a05:651c:516:: with SMTP id
 o22mr1947884ljp.29.1624344538448; 
 Mon, 21 Jun 2021 23:48:58 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id m19sm2111634lfl.75.2021.06.21.23.48.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 23:48:58 -0700 (PDT)
Date: Tue, 22 Jun 2021 09:48:54 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Werner Sembach <wse@tuxedocomputers.com>
Subject: Re: [PATCH v4 06/17] drm/uAPI: Add "active color format" drm
 property as feedback for userspace
Message-ID: <20210622094854.06a967db@eldfell>
In-Reply-To: <20210618091116.14428-7-wse@tuxedocomputers.com>
References: <20210618091116.14428-1-wse@tuxedocomputers.com>
 <20210618091116.14428-7-wse@tuxedocomputers.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/6W0+52WH5/FBENODx7AtHfw"; protocol="application/pgp-signature"
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

--Sig_/6W0+52WH5/FBENODx7AtHfw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 18 Jun 2021 11:11:05 +0200
Werner Sembach <wse@tuxedocomputers.com> wrote:

> Add a new general drm property "active color format" which can be used by
> graphic drivers to report the used color format back to userspace.
>=20
> There was no way to check which color format got actually used on a given
> monitor. To surely predict this, one must know the exact capabilities of
> the monitor, the GPU, and the connection used and what the default
> behaviour of the used driver is (e.g. amdgpu prefers YCbCr 4:4:4 while i9=
15
> prefers RGB). This property helps eliminating the guessing on this point.
>=20
> In the future, automatic color calibration for screens might also depend =
on
> this information being available.
>=20
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> ---
>  drivers/gpu/drm/drm_connector.c | 61 +++++++++++++++++++++++++++++++++
>  include/drm/drm_connector.h     |  9 +++++
>  2 files changed, 70 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connec=
tor.c
> index 943f6b61053b..684d7abdf0eb 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -889,6 +889,14 @@ static const struct drm_prop_enum_list drm_dp_subcon=
nector_enum_list[] =3D {
>  	{ DRM_MODE_SUBCONNECTOR_Native,	     "Native"    }, /* DP */
>  };
> =20
> +static const struct drm_prop_enum_list drm_active_color_format_enum_list=
[] =3D {
> +	{ 0, "unknown" },
> +	{ DRM_COLOR_FORMAT_RGB444, "rgb" },
> +	{ DRM_COLOR_FORMAT_YCRCB444, "ycbcr444" },
> +	{ DRM_COLOR_FORMAT_YCRCB422, "ycbcr422" },
> +	{ DRM_COLOR_FORMAT_YCRCB420, "ycbcr420" },
> +};
> +
>  DRM_ENUM_NAME_FN(drm_get_dp_subconnector_name,
>  		 drm_dp_subconnector_enum_list)
> =20
> @@ -1205,6 +1213,14 @@ static const struct drm_prop_enum_list dp_colorspa=
ces[] =3D {
>   *	Drivers shall use drm_connector_attach_active_bpc_property() to insta=
ll
>   *	this property.
>   *
> + * active color format:
> + *	This read-only property tells userspace the color format actually used
> + *	by the hardware display engine on "the cable" on a connector. The cho=
sen
> + *	value depends on hardware capabilities, both display engine and
> + *	connected monitor. Drivers shall use
> + *	drm_connector_attach_active_color_format_property() to install this
> + *	property.
> + *
>   * Connectors also have one standardized atomic property:
>   *
>   * CRTC_ID:
> @@ -2203,6 +2219,51 @@ void drm_connector_set_active_bpc_property(struct =
drm_connector *connector, int
>  }
>  EXPORT_SYMBOL(drm_connector_set_active_bpc_property);
> =20
> +/**
> + * drm_connector_attach_active_color_format_property - attach "active co=
lor format" property
> + * @connector: connector to attach active color format property on.
> + *
> + * This is used to check the applied color format on a connector.
> + *
> + * Returns:
> + * Zero on success, negative errno on failure.
> + */
> +int drm_connector_attach_active_color_format_property(struct drm_connect=
or *connector)
> +{
> +	struct drm_device *dev =3D connector->dev;
> +	struct drm_property *prop;
> +
> +	if (!connector->active_color_format_property) {
> +		prop =3D drm_property_create_enum(dev, DRM_MODE_PROP_IMMUTABLE, "activ=
e color format",
> +						drm_active_color_format_enum_list,
> +						ARRAY_SIZE(drm_active_color_format_enum_list));
> +		if (!prop)
> +			return -ENOMEM;
> +
> +		connector->active_color_format_property =3D prop;
> +		drm_object_attach_property(&connector->base, prop, 0);
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_connector_attach_active_color_format_property);
> +
> +/**
> + * drm_connector_set_active_color_format_property - sets the active colo=
r format property for a
> + * connector
> + * @connector: drm connector
> + * @active_color_format: color format for the connector currently active=
 on "the cable"
> + *
> + * Should be used by atomic drivers to update the active color format ov=
er a connector.
> + */
> +void drm_connector_set_active_color_format_property(struct drm_connector=
 *connector,
> +						    u32 active_color_format)
> +{
> +	drm_object_property_set_value(&connector->base, connector->active_color=
_format_property,
> +				      active_color_format);
> +}
> +EXPORT_SYMBOL(drm_connector_set_active_color_format_property);
> +
>  /**
>   * drm_connector_attach_hdr_output_metadata_property - attach "HDR_OUTPU=
T_METADA" property
>   * @connector: connector to attach the property on.
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index eee86de62a5f..8a5197f14e87 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -1386,6 +1386,12 @@ struct drm_connector {
>  	 */
>  	struct drm_property *active_bpc_property;
> =20
> +	/**
> +	 * @active_color_format_property: Default connector property for the
> +	 * active color format to be driven out of the connector.
> +	 */
> +	struct drm_property *active_color_format_property;
> +
>  #define DRM_CONNECTOR_POLL_HPD (1 << 0)
>  #define DRM_CONNECTOR_POLL_CONNECT (1 << 1)
>  #define DRM_CONNECTOR_POLL_DISCONNECT (1 << 2)
> @@ -1710,6 +1716,9 @@ int drm_connector_attach_max_bpc_property(struct dr=
m_connector *connector,
>  					  int min, int max);
>  int drm_connector_attach_active_bpc_property(struct drm_connector *conne=
ctor, int min, int max);
>  void drm_connector_set_active_bpc_property(struct drm_connector *connect=
or, int active_bpc);
> +int drm_connector_attach_active_color_format_property(struct drm_connect=
or *connector);
> +void drm_connector_set_active_color_format_property(struct drm_connector=
 *connector,
> +						    u32 active_color_format);
> =20
>  /**
>   * struct drm_tile_group - Tile group metadata

Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks,
pq

--Sig_/6W0+52WH5/FBENODx7AtHfw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmDRh9cACgkQI1/ltBGq
qqcWoA//dSSguGoiW9hFOa6yI3ULCPT9hDsCa0NFM2sgwJ9EmSSURnvVu8lAKkMZ
Xw411ajkzv/+OcMl5WmAlhkcGRoAeCqlrffHBG9HCluWAMdTAJerfPtqVkoBQDZT
IWbIJVJzAUXnGdq934McztX3FooLdRc3lAoM8p+/v0+mmDQtOHUtwE+vI/fBkL3I
zeLEFGSCsPeFrQULQAQK61zkEaKZ+JV4cuTNxp8fbO7SYJjlnLGAYtAaWRrUnVQt
rbxz7hpBSXIwG6IsW3U7BGsC6Idic8+ojn5Oudk6ljc34iXpeqEDlawbP5gsuv3k
sOdZZXjpFH1O8EEiJfNatp0Z6B+VoIeVjLm0GxjC9RdHbsSrsixZZcBNpUSVj0Uh
oemD6tnkKS6dEJiZqS9FY09ySD3UxG2M2tXR3UA6DJZIu5nbvtZb0+tf3vnWZeSd
6K3DQqSLGJKoMvU3pmoOwKNZ09mroZ6L+hX5QPnx90npVTmzYJXZSUSvHozQ5aDf
O97+6y12JGzdpjv3Tmk/KoGe/y3YZD7E8308rM1FmxObzmDnHUCRoK6sP2OL6XH6
fN5af+1bT9HYZMoLplKqB1wEehBuLDUkLM3Ld/+QyIiBkcsciRe81V1Liuxr3pGC
Id+CToFLL/oysa8LD9j4mMoqdMprOt+zgSmMnrD1fE6rhWPpvOE=
=/Ofh
-----END PGP SIGNATURE-----

--Sig_/6W0+52WH5/FBENODx7AtHfw--
