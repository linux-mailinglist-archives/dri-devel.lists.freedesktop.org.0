Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F4768E9E5
	for <lists+dri-devel@lfdr.de>; Wed,  8 Feb 2023 09:29:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A672410E053;
	Wed,  8 Feb 2023 08:29:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0579310E045;
 Wed,  8 Feb 2023 08:29:36 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id v13so19312138eda.11;
 Wed, 08 Feb 2023 00:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=h+04ABnlNpC3bHW15AazW9EfJJlIZrr/WtCNp0hj+Zw=;
 b=hbfswE4tIUDvtJ9IDp50qEnd5X6LDmAnr7iEU53dIyz9Ri78uEJSTAUYnKikRoXvzd
 fCfRmep2+BiaiPHk4XY+sd5jTRWvTM41V7VgvoKamboTkn4CvCfxPuFcxHL2D10AclyD
 wS/RJ0YAv0XGDBIbsulncFIPfW2VSu8Yi67w77av/P8bZ2TfLmny+HEF9q28gHVFTg3N
 FUIxVP8X9rrgTPKFx9GfRqXGEoSfnCivt4Sy5ZvsMRbPvgtivVe/UhD/BSBPHKMyYzlY
 6h1gvpdSNEZ4CRk04HU7ePW/VGe3wiqSmXhHu2bxrylX7OVTY3XI4ES+gmm5eEL6XVyu
 YV7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=h+04ABnlNpC3bHW15AazW9EfJJlIZrr/WtCNp0hj+Zw=;
 b=snG7aVRuRFproleXkKjQUgj7f3PQ6rZtIAgowmf6IeIEBFi6ANQMKLzXH7e73wGNX/
 L8kB+h/zdKD6qjUhkE1K32EHqYY2n0VLJv72PGqdK9daWoB19ySGUehNYKQ/DKfgVDik
 2cj6nRv4KKWmXaK+gwHcPBfYcybmrMZuTJNqYLOWFRvnKB0giZSGc/bGJCxS483JuoZT
 y3K4B87r0Fd1UdaQn91Uc2h03ILtNwgqK9i7XShW0v6zMvLLDImFSIJ/3BrnPlgejFEF
 4xOZounjm6XLniW3TFPAhThYoxJ8Sw6C4vP1Zbp5GmGJwzLwxD76UW3Rxf4EXRFZ/QsE
 zvYA==
X-Gm-Message-State: AO0yUKWjZbJLQBdKQl+nqPp7iHrvqblshxKhi6SOoXKlryXVB/tugI7x
 meb0RdlAXQuVwZ1EPiuVJU8=
X-Google-Smtp-Source: AK7set/aWsimcpuVUbevXJW7F1oIY7vMrQUtR8JMkHhZDygJaAACJkY4/E5nZOORmdFyN7MPXRieXw==
X-Received: by 2002:a50:8a8f:0:b0:4aa:da7c:4c5c with SMTP id
 j15-20020a508a8f000000b004aada7c4c5cmr3636426edj.34.1675844975251; 
 Wed, 08 Feb 2023 00:29:35 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 k3-20020a056402048300b00499b6b50419sm7478460edv.11.2023.02.08.00.29.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 00:29:34 -0800 (PST)
Date: Wed, 8 Feb 2023 10:29:23 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Joshua Ashton <joshua@froggi.es>
Subject: Re: [PATCH 1/3] drm/connector: Convert DRM_MODE_COLORIMETRY to enum
Message-ID: <20230208102923.7a3000b6@eldfell>
In-Reply-To: <20230203020744.30745-1-joshua@froggi.es>
References: <20230203020744.30745-1-joshua@froggi.es>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/h._UZWDmd9PSveMVK1MCNFY";
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Uma Shankar <uma.shankar@intel.com>,
 Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/h._UZWDmd9PSveMVK1MCNFY
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri,  3 Feb 2023 02:07:42 +0000
Joshua Ashton <joshua@froggi.es> wrote:

> From: Harry Wentland <harry.wentland@amd.com>
>=20
> This allows us to use strongly typed arguments.
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
>  include/drm/drm_connector.h  | 48 ++++++++++++++++++------------------
>  2 files changed, 25 insertions(+), 25 deletions(-)
>=20

Hi,

the code changes I can actually see here look good, but the test bot
found something else to fix. I feel the disappearance of
DRM_MODE_COLORIMETRY_NO_DATA could use an explanation in the commit
message.

I can only guess that NO_DATA comes from HDMI or DP spec or some such
to indicate undefined or something. However, the API here repurposes
that code point for "driver picks whatever".

I suppose it's kernel style to not write out the enum values when the C
standard rules produce the right values, but personally I think that is
hard to review and prone to accidental breakage if someone goes to add
a new value in the middle. Assuming these values are supposed to match
with a spec. I have no idea if they are.


Thanks,
pq

> diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
> index ed10e6b6f99d..28899a03245c 100644
> --- a/include/drm/display/drm_dp.h
> +++ b/include/drm/display/drm_dp.h
> @@ -1623,7 +1623,7 @@ enum dp_pixelformat {
>   *
>   * This enum is used to indicate DP VSC SDP Colorimetry formats.
>   * It is based on DP 1.4 spec [Table 2-117: VSC SDP Payload for DB16 thr=
ough
> - * DB18] and a name of enum member follows DRM_MODE_COLORIMETRY definiti=
on.
> + * DB18] and a name of enum member follows &enum drm_colorimetry definit=
ion.
>   *
>   * @DP_COLORIMETRY_DEFAULT: sRGB (IEC 61966-2-1) or
>   *                          ITU-R BT.601 colorimetry format
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 4d830fc55a3d..edef65388c29 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -371,29 +371,29 @@ enum drm_privacy_screen_status {
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
> +	DRM_MODE_COLORIMETRY_DEFAULT,
> +	/* CEA 861 Normal Colorimetry options */
> +	DRM_MODE_COLORIMETRY_SMPTE_170M_YCC,
> +	DRM_MODE_COLORIMETRY_BT709_YCC,
> +	/* CEA 861 Extended Colorimetry Options */
> +	DRM_MODE_COLORIMETRY_XVYCC_601,
> +	DRM_MODE_COLORIMETRY_XVYCC_709,
> +	DRM_MODE_COLORIMETRY_SYCC_601,
> +	DRM_MODE_COLORIMETRY_OPYCC_601,
> +	DRM_MODE_COLORIMETRY_OPRGB,
> +	DRM_MODE_COLORIMETRY_BT2020_CYCC,
> +	DRM_MODE_COLORIMETRY_BT2020_RGB,
> +	DRM_MODE_COLORIMETRY_BT2020_YCC,
> +	/* Additional Colorimetry extension added as part of CTA 861.G */
> +	DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65,
> +	DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER,
> +	/* Additional Colorimetry Options added for DP 1.4a VSC Colorimetry For=
mat */
> +	DRM_MODE_COLORIMETRY_RGB_WIDE_FIXED,
> +	DRM_MODE_COLORIMETRY_RGB_WIDE_FLOAT,
> +	DRM_MODE_COLORIMETRY_BT601_YCC,
> +};
> =20
>  /**
>   * enum drm_bus_flags - bus_flags info for &drm_display_info
> @@ -826,7 +826,7 @@ struct drm_connector_state {
>  	 * colorspace change on Sink. This is most commonly used to switch
>  	 * to wider color gamuts like BT2020.
>  	 */
> -	u32 colorspace;
> +	enum drm_colorspace colorspace;
> =20
>  	/**
>  	 * @writeback_job: Writeback job for writeback connectors


--Sig_/h._UZWDmd9PSveMVK1MCNFY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmPjXWMACgkQI1/ltBGq
qqe1kRAAnvcWEx/6TdVz2dQ7iP5g7S+CMad4fGSWnuEaIoeVuNL5cquWZQ2rf4UX
JDCjTWps6xVr0erME+02+sEpubFjmlkSqACu5vugXjha7Z0wBhHlYqHz0AYBBLfe
g37lKT1ECKO1lKn2jpA5tjwVPRWrNQlnc38LHq8k3ouLY0yVb6TUxOSN6F8TiqHI
cQMmcG8P9sNx7fltHmlKwQDd2DJw7pvFFfOV3nFy8/dVwjXHoVDWCKAjB113Ckpw
v3E4Sa2UM0Js+WR/rojLUNv8R+2WtR5ZeNCBEoiRxT2v6gYsUiQvu6h63FDzTg8Y
XVwXL0NhVp1T1Obc9CDl4+prcBGpgGBvRdGcfCHyFiDGBwWiFfTNjITNI8UmUGtp
/R+t0m8mn2va3tp0Ks1XiPqsfPmOFX2wT4BPkZQuE+mXS/bJGBeD8zPLDIzIypF8
YYgSYNCMVKK1pxMHIkPovMvLjZuVaq+4Bt5A4gn42EXSmFGqiUMcDh6bRmPaV28z
evNR9LBw4gSJSwWgn/vfleNdtCdStoaqRdKfL/UObPsIH5HuxX4cteGshchZgPnw
PWAr9jDRf+t+G8qxGgj+wI5n4dmoGgyh8i6CBx+HcUBwykecykyIHgEp3+GnJO3p
zv/0IzdzW6l5TURLMz4hhX2UNVgUVOVw7J8Lsixc78aRSSL0RSI=
=g+m7
-----END PGP SIGNATURE-----

--Sig_/h._UZWDmd9PSveMVK1MCNFY--
