Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A706185D30E
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 10:08:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B34110E30D;
	Wed, 21 Feb 2024 09:08:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=haloniitty.fi header.i=@haloniitty.fi header.b="LegTiOjr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from whm50.louhi.net (whm50.louhi.net [77.240.19.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7F1B10E30D
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 09:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=haloniitty.fi; s=default; h=Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=J35toRgZHBH8A75gWbEdhUP+u30JFQEDXVhzPFe54jw=; b=LegTiOjryEBkqI7ZQid3BbFaNd
 ISBxXJgAdbTD6yOVo89x7qD7K52QUMny6bpewnLttT9QAlD/rne5RSyeq/7RomqkP20/0ZrkxUdbi
 0cCcLQgktXI5mmplrPMg2hbTPkxgaFYoN5mdeNeOkqzvpZuBHjQWxNuXVy0Pqj0U7tEXzIYhMRTdg
 kBc44OFuwOQNtfTq3TmTmpHWSbudqLpt9T2PzeEpUeD3Eq9A/8vqlO/5iTGCV6p0HukZZ947khVKE
 wg2p/sBNL+lCHqcSRKVZWTuw8C5r6YSenee2eXYzFRfZsMg4ifoYfHgk+t9Tr3pliWj+S7TlzP+5I
 1wb80FBg==;
Received: from [194.136.85.206] (port=57100 helo=eldfell)
 by whm50.louhi.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96.2)
 (envelope-from <pekka.paalanen@haloniitty.fi>) id 1rcia8-0006V1-1m;
 Wed, 21 Feb 2024 11:08:01 +0200
Date: Wed, 21 Feb 2024 11:07:51 +0200
From: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Nick Hollinghurst
 <nick.hollinghurst@raspberrypi.com>
Subject: UAPI Re: [PATCH 1/3] drm: Add DRM_MODE_TV_MODE_MONOCHROME
Message-ID: <20240221110751.48da8190@eldfell>
In-Reply-To: <20240216184857.245372-2-dave.stevenson@raspberrypi.com>
References: <20240216184857.245372-1-dave.stevenson@raspberrypi.com>
 <20240216184857.245372-2-dave.stevenson@raspberrypi.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jHLD2EGbifudz0zXyDMI+Mi";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - whm50.louhi.net
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - haloniitty.fi
X-Get-Message-Sender-Via: whm50.louhi.net: authenticated_id:
 pekka.paalanen@haloniitty.fi
X-Authenticated-Sender: whm50.louhi.net: pekka.paalanen@haloniitty.fi
X-Source: 
X-Source-Args: 
X-Source-Dir: 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/jHLD2EGbifudz0zXyDMI+Mi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 16 Feb 2024 18:48:55 +0000
Dave Stevenson <dave.stevenson@raspberrypi.com> wrote:

> From: Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>
>=20
> Add this as a value for enum_drm_connector_tv_mode, represented
> by the string "Mono", to generate video with no colour encoding
> or bursts. Define it to have no pedestal (since only NTSC-M calls
> for a pedestal).
>=20
> Change default mode creation to acommodate the new tv_mode value
> which comprises both 525-line and 625-line formats.
>=20
> Signed-off-by: Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Hi Dave and Nick,

since no-one else commented yet, I'd like to remind of the new UAPI
requirements:
https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#open-source-userspac=
e-requirements

AFAIU, adding a new value to an existing enum still counts as new UAPI.

Maybe there is no need for the full treatment here, or maybe there is,
I'm not sure. I think you should make some statement about how the new
UAPI requirements have been addressed.

Btw. no-one has submitted a record with "TV mode" to
https://drmdb.emersion.fr/
It only lists the radeon-specific "tv standard" property. I first
thought you had mistaken the property name in the cover letter.


Thanks,
pq

> ---
>  drivers/gpu/drm/drm_connector.c    | 7 +++++++
>  drivers/gpu/drm/drm_modes.c        | 5 ++++-
>  drivers/gpu/drm/drm_probe_helper.c | 5 +++--
>  include/drm/drm_connector.h        | 7 +++++++
>  4 files changed, 21 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connec=
tor.c
> index b0516505f7ae..fe05d27f3404 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -1005,6 +1005,7 @@ static const struct drm_prop_enum_list drm_tv_mode_=
enum_list[] =3D {
>  	{ DRM_MODE_TV_MODE_PAL_M, "PAL-M" },
>  	{ DRM_MODE_TV_MODE_PAL_N, "PAL-N" },
>  	{ DRM_MODE_TV_MODE_SECAM, "SECAM" },
> +	{ DRM_MODE_TV_MODE_MONOCHROME, "Mono" },
>  };
>  DRM_ENUM_NAME_FN(drm_get_tv_mode_name, drm_tv_mode_enum_list)
> =20
> @@ -1697,6 +1698,12 @@ EXPORT_SYMBOL(drm_connector_attach_dp_subconnector=
_property);
>   *		TV Mode is CCIR System B (aka 625-lines) together with
>   *		the SECAM Color Encoding.
>   *
> + *	Mono:
> + *
> + *		Use timings appropriate to the DRM mode, including
> + *		equalizing pulses for a 525-line or 625-line mode,
> + *		with no pedestal or color encoding.
> + *
>   *	Drivers can set up this property by calling
>   *	drm_mode_create_tv_properties().
>   */
> diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
> index c4f88c3a93b7..d274e7b00b79 100644
> --- a/drivers/gpu/drm/drm_modes.c
> +++ b/drivers/gpu/drm/drm_modes.c
> @@ -530,7 +530,8 @@ static int fill_analog_mode(struct drm_device *dev,
>   * @interlace: whether to compute an interlaced mode
>   *
>   * This function creates a struct drm_display_mode instance suited for
> - * an analog TV output, for one of the usual analog TV mode.
> + * an analog TV output, for one of the usual analog TV modes. Where
> + * this is DRM_MODE_TV_MODE_MONOCHROME, a 625-line mode will be created.
>   *
>   * Note that @hdisplay is larger than the usual constraints for the PAL
>   * and NTSC timings, and we'll choose to ignore most timings constraints
> @@ -568,6 +569,8 @@ struct drm_display_mode *drm_analog_tv_mode(struct dr=
m_device *dev,
>  	case DRM_MODE_TV_MODE_PAL_N:
>  		fallthrough;
>  	case DRM_MODE_TV_MODE_SECAM:
> +		fallthrough;
> +	case DRM_MODE_TV_MODE_MONOCHROME:
>  		analog =3D DRM_MODE_ANALOG_PAL;
>  		break;
> =20
> diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_pro=
be_helper.c
> index d1e1ade66f81..9254dc2af873 100644
> --- a/drivers/gpu/drm/drm_probe_helper.c
> +++ b/drivers/gpu/drm/drm_probe_helper.c
> @@ -1211,8 +1211,9 @@ int drm_connector_helper_tv_get_modes(struct drm_co=
nnector *connector)
>  	for (i =3D 0; i < tv_mode_property->num_values; i++)
>  		supported_tv_modes |=3D BIT(tv_mode_property->values[i]);
> =20
> -	if ((supported_tv_modes & ntsc_modes) &&
> -	    (supported_tv_modes & pal_modes)) {
> +	if (((supported_tv_modes & ntsc_modes) &&
> +	     (supported_tv_modes & pal_modes)) ||
> +	    (supported_tv_modes & BIT(DRM_MODE_TV_MODE_MONOCHROME))) {
>  		uint64_t default_mode;
> =20
>  		if (drm_object_property_get_default_value(&connector->base,
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index fe88d7fc6b8f..90fd0ea0ca09 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -200,6 +200,13 @@ enum drm_connector_tv_mode {
>  	 */
>  	DRM_MODE_TV_MODE_SECAM,
> =20
> +	/**
> +	 * @DRM_MODE_TV_MODE_MONOCHROME: Use timings appropriate to
> +	 * the DRM mode, including equalizing pulses for a 525-line
> +	 * or 625-line mode, with no pedestal or color encoding.
> +	 */
> +	DRM_MODE_TV_MODE_MONOCHROME,
> +
>  	/**
>  	 * @DRM_MODE_TV_MODE_MAX: Number of analog TV output modes.
>  	 *


--Sig_/jHLD2EGbifudz0zXyDMI+Mi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmXVvWcACgkQI1/ltBGq
qqcIbRAAo7A5AGW3zVofZfRn3ea7K1SjJLPRqG92q1ytyS9EjxrICEhcGX0ByabW
Px6phIX6Vy1TMt+Vh5jy4XE4NvdS1IwyfxqjTYXhykzEaGiLGFv3ZsBsxIWuXsVs
8Icr/124SvshTNT5T9K5QVegj/TVIKvBW82/atORvpaoroYY9D6H9WapYwzLan4C
7EfxEMSOWdze7myEb1Bt5d5CheTA+GXP7MwRtizv79FrqobhZs1q1iblURvgwrOz
3s1+EUsMpHj9BZdeWO84TQ3TPwOV643/IjxMwa/N9MZIKIgjiTI5gHGXW3rReT2H
7817vmylF9+uQbdNOgPUN9ipbiYXegNPqRWA1btk/Gh5Z0eycrmw2pBEyfePlySW
s6e9kwRN3KuxMpQZ3WmA2jm1vrZZx2CDkvjF98DCVbdqgPSJ7OBQ015A1fIGkWDQ
7m7TLhe9Lv/3v7XKbwzztH73SfgvyI1dEc7trJ61ZnjZqypMT95CZ3Y9/pcCKgH4
QIDutUhRoyK/EupEprp0y15Jch5f3AUZdPR1hHLOcyyaUOYJBlOTAzKwkrnLYOZL
69GHdokNhPg8laDe9GEbqY/5uUJmuuIe6DIVx0ZU4knfbLgI1pBUGhJELS07ugg0
Srn2sxpJKdSuZ34/gHFiHSOGbdQfTH6Qeo8stfwkR2PqALUWzLQ=
=BpxU
-----END PGP SIGNATURE-----

--Sig_/jHLD2EGbifudz0zXyDMI+Mi--
