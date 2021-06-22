Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC0F3AFD39
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 08:46:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38D8D898ED;
	Tue, 22 Jun 2021 06:46:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85A5189216;
 Tue, 22 Jun 2021 06:46:52 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id q23so18142878ljh.0;
 Mon, 21 Jun 2021 23:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=5qnWo/SzLWfySyvC7Oz1YEdmg8IJi0qS1OM10gavIVM=;
 b=qGOTF9ANdk9jqKq5x7XngP9yQf1BKuIkfVRzBYSYS5hJiOFL5O92U9pRYalQKJuJgu
 kpM8d53zaRFQ59zEF5mJIbuDAcnRilSR0o23nMwA9e+qCMYFQU3Ta+L+lzN5I1mzc9Wt
 UZ5madbcX7Avcr3Yk2+VWAw66Yzvb1Xy2FD7ad6A1zZamYs5qp0Km2uhFxZaYEwemkv7
 in46kB4yCHhILncBQzG1lAWNlsrmQjA8913muxB9+Sa/842sFDcYKbeOJOGXmBNfNGkg
 E81gX0B3lIjZwqBY/91/QxaTMDixTHaEGg0HQ8CF0oEzuAN68Hq9n31l5KStk/n6ZNp6
 fK7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=5qnWo/SzLWfySyvC7Oz1YEdmg8IJi0qS1OM10gavIVM=;
 b=nEMthWPYMMgv6QwHClwISyAhulq3BSNcvwW3mOj3B8dHAdTltR/gSJju5YiLfnKcWL
 BSdxH1GCIeHEJaxQfjYG5OOWn9sk0VK7igC6LJAs2iHedNiURzKKuob6fy0+aCzEIWOW
 iPM5ikxCOL+HJxzxShYLvdAn76QRSJVtboYoqtsatc9xpKaDwVDEQwmsm8Yv32zwxBEA
 0mQuwYNLvtAB3naxkwsKbtmQ01JdDota9KkuoMWUJ3xttTcYxnYpYk+MH3BrzHzOGdmt
 Bltibm9XcRUh0f/nALBTyiXO3T7ZaWv+VuLfBaVdB6Ui5NW1Bm5oIo4F7p5JutPjjT3q
 BXVg==
X-Gm-Message-State: AOAM531h6A1muxrtzAnJWsUYfL4lh+OnfGmWBwXpslwOUPEI/L+0sXqq
 SGaZiw5q4ETL+A73/grRJyw=
X-Google-Smtp-Source: ABdhPJxt+x9fRCrxtpDUQmq8RAr+FIHUZ04aUI4+siOs7ZLczFPO/DuJWRh0z501SLJ1DSLjFL+zgA==
X-Received: by 2002:a2e:9f45:: with SMTP id v5mr1826207ljk.171.1624344410861; 
 Mon, 21 Jun 2021 23:46:50 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id t7sm2101366lfe.172.2021.06.21.23.46.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 23:46:50 -0700 (PDT)
Date: Tue, 22 Jun 2021 09:46:39 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Werner Sembach <wse@tuxedocomputers.com>
Subject: Re: [PATCH v4 03/17] drm/uAPI: Add "active bpc" as feedback channel
 for "max bpc" drm property
Message-ID: <20210622094639.4f41003b@eldfell>
In-Reply-To: <20210618091116.14428-4-wse@tuxedocomputers.com>
References: <20210618091116.14428-1-wse@tuxedocomputers.com>
 <20210618091116.14428-4-wse@tuxedocomputers.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/9B79vWVpJMlAP_qOfW3sima"; protocol="application/pgp-signature"
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

--Sig_/9B79vWVpJMlAP_qOfW3sima
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 18 Jun 2021 11:11:02 +0200
Werner Sembach <wse@tuxedocomputers.com> wrote:

> Add a new general drm property "active bpc" which can be used by graphic
> drivers to report the applied bit depth per pixel back to userspace.
>=20
> While "max bpc" can be used to change the color depth, there was no way to
> check which one actually got used. While in theory the driver chooses the
> best/highest color depth within the max bpc setting a user might not be
> fully aware what his hardware is or isn't capable off. This is meant as a
> quick way to double check the setup.
>=20
> In the future, automatic color calibration for screens might also depend =
on
> this information being available.
>=20
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> ---
>  drivers/gpu/drm/drm_connector.c | 51 +++++++++++++++++++++++++++++++++
>  include/drm/drm_connector.h     |  8 ++++++
>  2 files changed, 59 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connec=
tor.c
> index da39e7ff6965..943f6b61053b 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -1197,6 +1197,14 @@ static const struct drm_prop_enum_list dp_colorspa=
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
>   * Connectors also have one standardized atomic property:
>   *
>   * CRTC_ID:
> @@ -2152,6 +2160,49 @@ int drm_connector_attach_max_bpc_property(struct d=
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
ctor, int min, int max)
> +{
> +	struct drm_device *dev =3D connector->dev;
> +	struct drm_property *prop;
> +
> +	if (!connector->active_bpc_property) {
> +		prop =3D drm_property_create_range(dev, DRM_MODE_PROP_IMMUTABLE, "acti=
ve bpc",
> +						 min, max);
> +		if (!prop)
> +			return -ENOMEM;
> +
> +		connector->active_bpc_property =3D prop;
> +		drm_object_attach_property(&connector->base, prop, 0);
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_connector_attach_active_bpc_property);
> +
> +/**
> + * drm_connector_set_active_bpc_property - sets the active bits per colo=
r property for a connector
> + * @connector: drm connector
> + * @active_bpc: bits per color for the connector currently active on "th=
e cable"
> + *
> + * Should be used by atomic drivers to update the active bits per color =
over a connector.
> + */
> +void drm_connector_set_active_bpc_property(struct drm_connector *connect=
or, int active_bpc)
> +{
> +	drm_object_property_set_value(&connector->base, connector->active_bpc_p=
roperty, active_bpc);
> +}
> +EXPORT_SYMBOL(drm_connector_set_active_bpc_property);
> +
>  /**
>   * drm_connector_attach_hdr_output_metadata_property - attach "HDR_OUTPU=
T_METADA" property
>   * @connector: connector to attach the property on.
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 714d1a01c065..eee86de62a5f 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -1380,6 +1380,12 @@ struct drm_connector {
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
> @@ -1702,6 +1708,8 @@ int drm_connector_set_panel_orientation_with_quirk(
>  	int width, int height);
>  int drm_connector_attach_max_bpc_property(struct drm_connector *connecto=
r,
>  					  int min, int max);
> +int drm_connector_attach_active_bpc_property(struct drm_connector *conne=
ctor, int min, int max);
> +void drm_connector_set_active_bpc_property(struct drm_connector *connect=
or, int active_bpc);
> =20
>  /**
>   * struct drm_tile_group - Tile group metadata

Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks,
pq

--Sig_/9B79vWVpJMlAP_qOfW3sima
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmDRh08ACgkQI1/ltBGq
qqefDxAAnTLRWiJXKt324iuUjpCGVbdJKhpZM0IKnG4RtItTZyLGLQgUzh95qRiN
g3YnCGoMa3pxgSgMtq3j+PidIdjquAEfJs351qFJtIxuPjNrfWM0GBRmUQFQdauq
2xyUju8k8LaqBiasR8ulgGGZYbOWfqgcZh6GamzsSU/39wec6Pmlx7Ehoa2cYjBp
sL9fc7aemSh2igjWhIOdB53hB1r5DUAaDWqLxVuSQrKZnDlheDlbydbcVxfy6hG/
J71k/4sPopKcVzi0/o3wRs8jRIulvQC9f3+PVm84XeVuOWwsgR7euepL/ZImBmiw
1UwvLB4Q50ZAbKa4bi3VxC6E9taIjnc3LTvyM1wlMFyb3mWBgd549rMImyVdQfHf
/Sol9zzE3BY81fo61KJ+4QIU/6S2uE2KIIpYBDKQm0k7CRscwRUXvnSOgGlY1uSZ
uAkOck8vbxbUfZl5AGRKIA5ybHrtC6TqQJQ9fLS2naCo4s2zN8U30od21Gt0s7tC
5uLTqGoKMUSb/8UigJyIZGz3enuTegtUf+LcANyzZstCjGj1IIbN/HbvgWFIC3cz
L+EcnH9b9unBCpndvaMt0CzSGkEZmIXVCpCQYmr4OIV3xpngl5liayo6+BvhWUWt
ok+4G8SrDoVM59h9MrEiTpOcFScFQB1dB+zThRWUd1r27nxZGnM=
=nxUW
-----END PGP SIGNATURE-----

--Sig_/9B79vWVpJMlAP_qOfW3sima--
