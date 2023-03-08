Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5DD6B00D3
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 09:22:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BCDD10E0C7;
	Wed,  8 Mar 2023 08:21:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 955CB10E07C;
 Wed,  8 Mar 2023 08:21:51 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id b10so15810144ljr.0;
 Wed, 08 Mar 2023 00:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678263710;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=mj9Y0t+zzOmEeCodEn2+PYLjGbVNUJE2Y9Cga3Ja96M=;
 b=IZ/0tAS3eQbcYrlkS1Hv4IKIryRKxZ7mAhvq3+W2XhTh+tTUPl+9qK7Ut/Qq2wkdfF
 aaL+DuYoyB7LdrYmzwLwLXtGcMMFyaPzy2AiDH06/zp8ZYvtZ0gmIBtLzRUyunvEJwYa
 5AgyUMCxgSldPacrCZWtI6YUF1WFJEqoTee7JpCMMxO7tGQFRyzQCZ+nINv62KFD+0d1
 zxLIV7EUQs1bzqoyPZ+yIQVJWdVLomvQt+jUyrBb+gAtPcm3Euy75art1kJhplhUhpZL
 2z0AV68TPPLXgvA7fTC66+vg07iuc1tFgo06EIOYK2021BXotbwWRIEva7UEkIqVIhel
 NHTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678263710;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mj9Y0t+zzOmEeCodEn2+PYLjGbVNUJE2Y9Cga3Ja96M=;
 b=LJJKfHCDvYgmLFGiWW//vSqfbjv57PjcDK6eIM8JBx2ClMe6bAOeVOuGzvd9vYbgw1
 jIkjtzTF+EfIyYy15Qt1rJp8DoC6JJol0OqtYz75xh1uz0lsYJXpcoocplhzit9srzdj
 0ZcGJzchYUS5Y6adE0/Gni/RUScZYYvNhdkrlu5b8usfJVF2d9SUQECY5c8MYxQgARQC
 xLFlAk+dkQpv7PcT2sUHEIhVrMZADCSVmlBob7ENs/T6Kkkk/iRXUGwzk26aMCjQD23H
 sJlj2OmhCjebNd9MN/+M81iSNW8yKe2w3LfAfW351awKoYgPuCH/1ZJiPE4Av4GExFMZ
 +QwA==
X-Gm-Message-State: AO0yUKV8KbB86twH77dwAq1EuNpt0/GkR48rGFjKcnPPF2kjqxmd3a97
 5Lm/oTDfpSNky9cwlLttBGw=
X-Google-Smtp-Source: AK7set8Qx7MBnNXrKEfR+sh/hv0G3Iz7uM3Zu6Sbpdfx79OKURmGdzH+YLBFrFiqSlfKuZ5Sdwnqjg==
X-Received: by 2002:a2e:b55c:0:b0:290:4e1c:96c9 with SMTP id
 a28-20020a2eb55c000000b002904e1c96c9mr5062715ljn.32.1678263709562; 
 Wed, 08 Mar 2023 00:21:49 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 22-20020ac24836000000b0049c29389b98sm2260667lft.151.2023.03.08.00.21.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 00:21:49 -0800 (PST)
Date: Wed, 8 Mar 2023 10:21:37 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [PATCH v4 01/17] drm/connector: Convert DRM_MODE_COLORIMETRY to
 enum
Message-ID: <20230308102137.23b649dc@eldfell>
In-Reply-To: <20230307152934.53372-1-harry.wentland@amd.com>
References: <vT46Q_J1ih6YRi8a30VhwbuI43l7uCbTnS9ReApjeTZFD79HaDTZ-9FiNu_sS4iDn-XHhOsQYVQT-Bc699_qGmqMSSyc6XG7YYHVq-EJ-2s=@emersion.fr>
 <20230307152934.53372-1-harry.wentland@amd.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YLPktixQIp8dgk58zlf6WFR";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, dri-devel@lists.freedesktop.org,
 Uma Shankar <uma.shankar@intel.com>, amd-gfx@lists.freedesktop.org,
 Joshua Ashton <joshua@froggi.es>, Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/YLPktixQIp8dgk58zlf6WFR
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 7 Mar 2023 10:29:34 -0500
Harry Wentland <harry.wentland@amd.com> wrote:

> This allows us to use strongly typed arguments.
>=20
> v2:
>  - Bring NO_DATA back
>  - Provide explicit enum values
>=20
> v4: Drop unnecessary '&' from kerneldoc (emersion)
>=20
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> Reviewed-by: Simon Ser <contact@emersion.fr>
>=20
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> Cc: Sebastian Wick <sebastian.wick@redhat.com>
> Cc: Vitaly.Prosyak@amd.com
> Cc: Uma Shankar <uma.shankar@intel.com>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Cc: Joshua Ashton <joshua@froggi.es>
> Cc: dri-devel@lists.freedesktop.org
> Cc: amd-gfx@lists.freedesktop.org
> ---
>  include/drm/display/drm_dp.h |  2 +-
>  include/drm/drm_connector.h  | 49 ++++++++++++++++++------------------
>  2 files changed, 26 insertions(+), 25 deletions(-)
>=20
> diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
> index ed10e6b6f99d..dae5e9c201e4 100644
> --- a/include/drm/display/drm_dp.h
> +++ b/include/drm/display/drm_dp.h
> @@ -1623,7 +1623,7 @@ enum dp_pixelformat {
>   *
>   * This enum is used to indicate DP VSC SDP Colorimetry formats.
>   * It is based on DP 1.4 spec [Table 2-117: VSC SDP Payload for DB16 thr=
ough
> - * DB18] and a name of enum member follows DRM_MODE_COLORIMETRY definiti=
on.
> + * DB18] and a name of enum member follows enum drm_colorimetry definiti=
on.
>   *
>   * @DP_COLORIMETRY_DEFAULT: sRGB (IEC 61966-2-1) or
>   *                          ITU-R BT.601 colorimetry format
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 4d830fc55a3d..6d6a53a6b010 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -371,29 +371,30 @@ enum drm_privacy_screen_status {
>   * a colorspace property which will be created and exposed to
>   * userspace.
>   */
> -
> -/* For Default case, driver will set the colorspace */
> -#define DRM_MODE_COLORIMETRY_DEFAULT			0
> -/* CEA 861 Normal Colorimetry options */
> -#define DRM_MODE_COLORIMETRY_NO_DATA			0
> -#define DRM_MODE_COLORIMETRY_SMPTE_170M_YCC		1
> -#define DRM_MODE_COLORIMETRY_BT709_YCC			2
> -/* CEA 861 Extended Colorimetry Options */
> -#define DRM_MODE_COLORIMETRY_XVYCC_601			3
> -#define DRM_MODE_COLORIMETRY_XVYCC_709			4
> -#define DRM_MODE_COLORIMETRY_SYCC_601			5
> -#define DRM_MODE_COLORIMETRY_OPYCC_601			6
> -#define DRM_MODE_COLORIMETRY_OPRGB			7
> -#define DRM_MODE_COLORIMETRY_BT2020_CYCC		8
> -#define DRM_MODE_COLORIMETRY_BT2020_RGB			9
> -#define DRM_MODE_COLORIMETRY_BT2020_YCC			10
> -/* Additional Colorimetry extension added as part of CTA 861.G */
> -#define DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65		11
> -#define DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER		12
> -/* Additional Colorimetry Options added for DP 1.4a VSC Colorimetry Form=
at */
> -#define DRM_MODE_COLORIMETRY_RGB_WIDE_FIXED		13
> -#define DRM_MODE_COLORIMETRY_RGB_WIDE_FLOAT		14
> -#define DRM_MODE_COLORIMETRY_BT601_YCC			15
> +enum drm_colorspace {
> +	/* For Default case, driver will set the colorspace */
> +	DRM_MODE_COLORIMETRY_DEFAULT 		=3D 0,
> +	DRM_MODE_COLORIMETRY_NO_DATA		=3D 0,
> +	/* CEA 861 Normal Colorimetry options */

This comment seems to be in the wrong place, NO_DATA should be under
this comment.

With that fixed:
Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks,
pq

> +	DRM_MODE_COLORIMETRY_SMPTE_170M_YCC	=3D 1,
> +	DRM_MODE_COLORIMETRY_BT709_YCC		=3D 2,
> +	/* CEA 861 Extended Colorimetry Options */
> +	DRM_MODE_COLORIMETRY_XVYCC_601		=3D 3,
> +	DRM_MODE_COLORIMETRY_XVYCC_709		=3D 4,
> +	DRM_MODE_COLORIMETRY_SYCC_601		=3D 5,
> +	DRM_MODE_COLORIMETRY_OPYCC_601		=3D 6,
> +	DRM_MODE_COLORIMETRY_OPRGB		=3D 7,
> +	DRM_MODE_COLORIMETRY_BT2020_CYCC	=3D 8,
> +	DRM_MODE_COLORIMETRY_BT2020_RGB		=3D 9,
> +	DRM_MODE_COLORIMETRY_BT2020_YCC		=3D 10,
> +	/* Additional Colorimetry extension added as part of CTA 861.G */
> +	DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65	=3D 11,
> +	DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER	=3D 12,
> +	/* Additional Colorimetry Options added for DP 1.4a VSC Colorimetry For=
mat */
> +	DRM_MODE_COLORIMETRY_RGB_WIDE_FIXED	=3D 13,
> +	DRM_MODE_COLORIMETRY_RGB_WIDE_FLOAT	=3D 14,
> +	DRM_MODE_COLORIMETRY_BT601_YCC		=3D 15,
> +};
> =20
>  /**
>   * enum drm_bus_flags - bus_flags info for &drm_display_info
> @@ -826,7 +827,7 @@ struct drm_connector_state {
>  	 * colorspace change on Sink. This is most commonly used to switch
>  	 * to wider color gamuts like BT2020.
>  	 */
> -	u32 colorspace;
> +	enum drm_colorspace colorspace;
> =20
>  	/**
>  	 * @writeback_job: Writeback job for writeback connectors


--Sig_/YLPktixQIp8dgk58zlf6WFR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmQIRZEACgkQI1/ltBGq
qqcX6g/+OnYayOWGrgJf1foOGo3xBwqnrv19SjTXbYONlfQ6WdZdqvqy7InFFX41
MSaIk1MNcgcK5m58A70v2WVAWAuF+zmZDshnLamCpYC8jh55Ft91KcSNITDc8EP8
wHDrSoJ23duljb/wKY129l7TOmgN5viI1oM3uaZrHlsTayCt2IXmCf2mkuHhae39
Bj20YNviWJVXNgf95E0/00s6oZV8BOMk8sFU59zao72F4Fw0ZW6c8unKQDWofj+b
c1Qh8LARBnK2heQurKqROFovzP41EKhR5dZAPePwNS3ds7jbwJtdfajygEK46kr7
ViRkOvSBmpyVIzgG/mEMcHlSQPTMsLO6ANO2gweYkWo3fnJwWSG2+3v41AyrLEUB
jP3N0yecVDaiMzQ2pV458pzUvN/C5hE5MeYbQpsOqlC5wONnnH2R/lniiO9T1DsE
Y1ej/nMB1Z6KjWr1xNg4zQymzUH1pOEfRX0Tm7+zZgNEURQJfIa4Qwu/BHU0fVIO
i1awdurjfTI2zz93HEPmbtYV95gFwna4bnyiae4pyKsbWw/oFq+FpuGmKt14gQlb
dvMx7TSHGyr1gdzKShlUDkcdrVpoqcynyUA87aScCSjOid33Lkk/M9PQuyiOu8Za
YHbdwuAL35CnOAJJu/Q4TnvkHsAFifcKOq887xkCTnXB+/fzZdk=
=2Umf
-----END PGP SIGNATURE-----

--Sig_/YLPktixQIp8dgk58zlf6WFR--
