Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8E9E2EF9
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 12:31:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3562D6E20A;
	Thu, 24 Oct 2019 10:31:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85BEF6E217;
 Thu, 24 Oct 2019 10:31:10 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id 3so2054041wmi.3;
 Thu, 24 Oct 2019 03:31:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Hbw3cbmPHft9M4/z0pM0z5wkEC5JRHB60zXJ6S8NqqI=;
 b=Ujy9iI13M9NW6H0KSz3n/U1bPoIyWu7Is7LiQ/NtTZlOO63n9c6xeIlf/NZY1b/sf/
 o/HN4jU1B28evfuGqDRTDvwFTCxk04/faJmyQxAWyOyYtZET336sMcLayugOmRgLXKjB
 lO0YDjQZeQ5fq+uRAf70YpQik+KSsTNhiG8LKl1gvtsATkeQ5Rz/fq8Q81aJ8YkNBnLx
 KRwPOORlMRwwKTTx1El4OJXvFpBFWqS0t0skkUpw9aJedIngleD0FBK82I00naVBxR4f
 LSfsAKXaFTnu51zmVG10ZOP8qaagjZIcj9uL5/XjvP2UGvCsvFfTKXCinluW1d0LkFKD
 Xaww==
X-Gm-Message-State: APjAAAXBxAYwycRADjSTauhidU8P7uzqQddPRKp/feyQp7mRDT7UnjjQ
 2VND4JJVbJBBxkUOu3u3LSQ=
X-Google-Smtp-Source: APXvYqwCMAKn8hGRpDdlqdkzTvoC6OOP60NXgI3yrpMNFbBQjwtpZOycCSQjFQThro2Q+wPCi8TG4A==
X-Received: by 2002:a05:600c:21d7:: with SMTP id
 x23mr4191908wmj.6.1571913068847; 
 Thu, 24 Oct 2019 03:31:08 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id d202sm1905294wmd.47.2019.10.24.03.31.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2019 03:31:07 -0700 (PDT)
Date: Thu, 24 Oct 2019 12:31:06 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Manasi Navare <manasi.d.navare@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/dp: Add function to parse EDID
 descriptors for adaptive sync limits
Message-ID: <20191024103106.GA2825247@ulmo>
References: <20191024000041.7391-1-manasi.d.navare@intel.com>
MIME-Version: 1.0
In-Reply-To: <20191024000041.7391-1-manasi.d.navare@intel.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Hbw3cbmPHft9M4/z0pM0z5wkEC5JRHB60zXJ6S8NqqI=;
 b=k20kMNw7SZnou2xd5SrlvDcewsBz7wdtu4h8ySQbyWSHuh2KJd7+loa2aVUuTS00jN
 EXL8a0EheX9sQ2QzWod2jYDdhtEuQcpDlJAqQa08Tlxahtuy9spuP1S5x9iNFjb91HYX
 lT2C7Au88joccEKi7ihqM2ggO1IjdlZ7XXt6J2FOOhSZRAuhv8IcaPHiQV/apJZLw9BN
 zE/oMQ4NmE8JHCy9Njhq1Vlw5luIPCZl4+4yi9tkiH1JTEH7rA1Q4bQc9C+Po31U8Fyf
 tBf7aR3E4clgUXejiOkTVxv/snqSbUokyFuF95NVUHyiuBFuGtxaSCng3TS8+NxtKIjy
 kyYg==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0704125961=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0704125961==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bp/iNruPH9dso1Pn"
Content-Disposition: inline


--bp/iNruPH9dso1Pn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2019 at 05:00:41PM -0700, Manasi Navare wrote:
> Adaptive Sync is a VESA feature so add a DRM core helper to parse
> the EDID's detailed descritors to obtain the adaptive sync monitor range.
> Store this info as part fo drm_display_info so it can be used
> across all drivers.
> This part of the code is stripped out of amdgpu's function
> amdgpu_dm_update_freesync_caps() to make it generic and be used
> across all DRM drivers
>=20
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Clinton A Taylor <clinton.a.taylor@intel.com>
> Signed-off-by: Manasi Navare <manasi.d.navare@intel.com>
> ---
>  drivers/gpu/drm/drm_edid.c  | 49 +++++++++++++++++++++++++++++++++++++
>  include/drm/drm_connector.h | 25 +++++++++++++++++++
>  include/drm/drm_edid.h      |  2 ++
>  3 files changed, 76 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 474ac04d5600..97dd1200773e 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -4707,6 +4707,52 @@ static void drm_parse_cea_ext(struct drm_connector=
 *connector,
>  	}
>  }
> =20
> +void drm_get_adaptive_sync_limits(struct drm_connector *connector,
> +				  const struct edid *edid)
> +{
> +	struct drm_display_info *info =3D &connector->display_info;
> +	const struct detailed_timing *timing;
> +	const struct detailed_non_pixel *data;
> +	const struct detailed_data_monitor_range *range;
> +	int i;

This can be unsigned int.

> +
> +	/*
> +	 * Restrict Adaptive Sync only for dp and edp
> +	 */
> +	if (connector->connector_type !=3D DRM_MODE_CONNECTOR_DisplayPort &&
> +	    connector->connector_type !=3D DRM_MODE_CONNECTOR_eDP)
> +		return;
> +
> +	if (edid->version <=3D 1 && !(edid->version =3D=3D 1 && edid->revision =
> 1))
> +		return;
> +
> +	for (i =3D 0; i < 4; i++) {
> +		timing  =3D &edid->detailed_timings[i];
> +		data    =3D &timing->data.other_data;
> +		range   =3D &data->data.range;
> +		/*
> +		 * Check if monitor has continuous frequency mode
> +		 */
> +		if (data->type !=3D EDID_DETAIL_MONITOR_RANGE)
> +			continue;
> +		/*
> +		 * Check for flag range limits only. If flag =3D=3D 1 then
> +		 * no additional timing information provided.
> +		 * Default GTF, GTF Secondary curve and CVT are not
> +		 * supported
> +		 */
> +		if (range->flags !=3D 1)
> +			continue;
> +
> +		info->adaptive_sync.min_vfreq =3D range->min_vfreq;
> +		info->adaptive_sync.max_vfreq =3D range->max_vfreq;
> +		info->adaptive_sync.pixel_clock_mhz =3D
> +			range->pixel_clock_mhz * 10;
> +		break;
> +	}
> +}
> +EXPORT_SYMBOL(drm_get_adaptive_sync_limits);
> +
>  /* A connector has no EDID information, so we've got no EDID to compute =
quirks from. Reset
>   * all of the values which would have been set from EDID
>   */
> @@ -4728,6 +4774,7 @@ drm_reset_display_info(struct drm_connector *connec=
tor)
>  	memset(&info->hdmi, 0, sizeof(info->hdmi));
> =20
>  	info->non_desktop =3D 0;
> +	memset(&info->adaptive_sync, 0, sizeof(info->adaptive_sync));
>  }
> =20
>  u32 drm_add_display_info(struct drm_connector *connector, const struct e=
did *edid)
> @@ -4743,6 +4790,8 @@ u32 drm_add_display_info(struct drm_connector *conn=
ector, const struct edid *edi
> =20
>  	info->non_desktop =3D !!(quirks & EDID_QUIRK_NON_DESKTOP);
> =20
> +	drm_get_adaptive_sync_limits(connector, edid);
> +
>  	DRM_DEBUG_KMS("non_desktop set to %d\n", info->non_desktop);
> =20
>  	if (edid->revision < 3)
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 5f8c3389d46f..a27a84270d8d 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -254,6 +254,26 @@ enum drm_panel_orientation {
>  	DRM_MODE_PANEL_ORIENTATION_RIGHT_UP,
>  };
> =20
> +/**
> + * struct drm_adaptive_sync_info - Panel's Adaptive Sync capabilities for
> + * &drm_display_info
> + *
> + * This struct is used to store a Panel's Adaptive Sync capabilities
> + * as parsed from EDID's detailed monitor range descriptor block.
> + *
> + * @min_vfreq: This is the min supported refresh rate in Hz from
> + *             EDID's detailed monitor range.
> + * @max_vfreq: This is the max supported refresh rate in Hz from
> + *             EDID's detailed monitor range
> + * @pixel_clock_mhz: This is the dotclock in MHz from
> + *                   EDID's detailed monitor range
> + */
> +struct drm_adaptive_sync_info {
> +	int min_vfreq;
> +	int max_vfreq;
> +	int pixel_clock_mhz;

Any reason why these can't be unsigned? Also, does it perhaps make sense
to store the pixel clock as kHz like we do everywhere else?

Thierry

--bp/iNruPH9dso1Pn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2xfWcACgkQ3SOs138+
s6HGAg//VaK/k3qDXQMHOCJyGMvmON88uGOfshe3Szh57trGQNz1Ffz+flajZuT3
MfZpwfyV8tPXipNGPf1xjQNu+BsjsNdgqTT1U5V2IrRHoOikkOec71N0+gdr/DW1
Es72O3sBuvSqdeR7RFn1ngoXdVPpWxgyJPQvjLF8KgAZhwUUNtkCmSxyOxDXP9xd
LRmoK5GQcnl0ZuRtyqpNpjK/pHkaLrlkzwXufU26GACejMZhvVH8Ec+RlSrPDMsL
MPw11LMfYx1+rKdcvhPLTawjZXyETY8JZHnGaZBrdA/UEQ1sSz2wiUKQtCBz+B3V
gLvh3izi48yhgb9/dC5cTIlOBR6W3YXjg9H4TZ01yDxcI8XU7jFAU4OcAxdunyjP
jtWxf8T8c65pdAuK8+K5HyRtedv3CF4u1MChi0/8cciRJw8s6yUu0L0z2iTUPG7L
EBS1Z5k/vA3W/QdrDhzT4C4Fae60dbubOZFYuyOlC1RungzfBaVYWH9bMT3/YxqG
0oGZEx2qfSMSFmZwdN/5bfX9EGQDMLAb9dhY16ubKdUkyGRlst4eR0Xczfpg9BIZ
yLTr46LG+8d4ZL0nePAGsqG9HDn/ow5bvQPYMS0SLtObkExA6bDR5jtdWJyYyo9C
+bL/1hFJu8zhXDXTQwlf/BBfYdEuWhLN3X8OMWszjUssexoqRgk=
=ALYV
-----END PGP SIGNATURE-----

--bp/iNruPH9dso1Pn--

--===============0704125961==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0704125961==--
