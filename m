Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 506F164B357
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 11:39:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 564A410E2ED;
	Tue, 13 Dec 2022 10:39:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBC9210E2ED;
 Tue, 13 Dec 2022 10:39:38 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id a19so2917153ljk.0;
 Tue, 13 Dec 2022 02:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=5ZnIfDqeuJAoltebRrriv0fzPNKDJ1uZM7SmoLwlM90=;
 b=hDcCBSFsU8zdwJErbtWFz+ILGV8TuB7En+wKAHOnuNO2DWH0ylWkYeFwQG+ytHGhXQ
 jUEBoqZZlYlsVyKMoyI6Hf4gvfaBR++UtVzoyJrRCFR8kG3RYXYC9tG1zEW5wnlT62qR
 YTCi3VonH8AjZXI1595riJfFl3mVjMXsq4smdTYato4Ffx4Mhxtt9wczbLL7j4Z1kYgk
 AVm44Vo9dIvY4Q8IDXC5+ZLe6j7ERhspQ1eFc353H9WoeIAQNPRe/If6u9a46zCUDF22
 LGh5PRrTOQJpFKt61qoQ2JPbJpJ2VFj+CcZJ/fsLIygouJO3yuwsmPzZ/9Wko12nvIZ6
 XdTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5ZnIfDqeuJAoltebRrriv0fzPNKDJ1uZM7SmoLwlM90=;
 b=1Ic3MW0bB0VIvYObHMHudDTJIXyOsznzB5PBU1aBOiXhMBgzTS7g8+YzF6+Z9/kQ+s
 rBQlpV4esmYy/xUqOGMHOATVVWAucSsS6+cUil0eBe+s5mHbSiarmsDf9381wdl7QjfF
 AfhE8XBKmMFHqzKdUgUUfDU4HscJTm+YN/OwPsFyQJHGFlqfMjsCV2tT+z2/+zwU+wko
 deXTjP1Sn1szpsyHHU6S50qttk94Z4MCMWI6dAF3OywSolDQmU4XDypcM+3jMJAZCoHa
 0s0TfmlbvRi0f+aEUaw5bE+zHWXkXKkcDUCWFr88yB04UepfjWB1fuZE015cB/DFB9Tv
 srLA==
X-Gm-Message-State: ANoB5pmK/rh18C2yTGTUP/dDvMYepoaHBC1og7+y4QCpAljVeIoqGTso
 Eyx5jJYCDLs8WC02c6Av7oQ=
X-Google-Smtp-Source: AA0mqf6XR9whQf5X4Y50tWK7RpMnijJx9ldfIi+AgJJdfKBqycds0g8jL/Wuslf/GnslFQCILf6jUQ==
X-Received: by 2002:a05:651c:504:b0:277:25a:2ff0 with SMTP id
 o4-20020a05651c050400b00277025a2ff0mr6130642ljp.19.1670927976911; 
 Tue, 13 Dec 2022 02:39:36 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 k4-20020a2ea264000000b00279e0b8bae7sm208731ljm.65.2022.12.13.02.39.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Dec 2022 02:39:36 -0800 (PST)
Date: Tue, 13 Dec 2022 12:39:32 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [PATCH 04/16] drm/connector: Convert DRM_MODE_COLORIMETRY to enum
Message-ID: <20221213123932.67edc8dc@eldfell>
In-Reply-To: <20221212182137.374625-5-harry.wentland@amd.com>
References: <20221212182137.374625-1-harry.wentland@amd.com>
 <20221212182137.374625-5-harry.wentland@amd.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gbTELSdSbdVWbrnHWsmVUFl";
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

--Sig_/gbTELSdSbdVWbrnHWsmVUFl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 12 Dec 2022 13:21:25 -0500
Harry Wentland <harry.wentland@amd.com> wrote:

> This allows us to use strongly typed arguments.
>=20
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
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
>  include/drm/drm_connector.h  | 47 ++++++++++++++++++------------------
>  2 files changed, 25 insertions(+), 24 deletions(-)
>=20
> diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
> index 4d0abe4c7ea9..b98697459f9c 100644
> --- a/include/drm/display/drm_dp.h
> +++ b/include/drm/display/drm_dp.h
> @@ -1615,7 +1615,7 @@ enum dp_pixelformat {
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
> index 62c814241828..edef65388c29 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -371,28 +371,29 @@ enum drm_privacy_screen_status {
>   * a colorspace property which will be created and exposed to
>   * userspace.
>   */
> -
> -/* For Default case, driver will set the colorspace */
> -#define DRM_MODE_COLORIMETRY_DEFAULT			0
> -/* CEA 861 Normal Colorimetry options */
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

Hi,

what's the entry for "the traditional sRGB"?

It cannot be DRM_MODE_COLORIMETRY_DEFAULT, because the doc here says
that it maps to some driver-defined entry which may be something else.


Thanks,
pq

> =20
>  /**
>   * enum drm_bus_flags - bus_flags info for &drm_display_info
> @@ -825,7 +826,7 @@ struct drm_connector_state {
>  	 * colorspace change on Sink. This is most commonly used to switch
>  	 * to wider color gamuts like BT2020.
>  	 */
> -	u32 colorspace;
> +	enum drm_colorspace colorspace;
> =20
>  	/**
>  	 * @writeback_job: Writeback job for writeback connectors


--Sig_/gbTELSdSbdVWbrnHWsmVUFl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmOYVmQACgkQI1/ltBGq
qqe4bg/+J7czvadbLYVkM1DR2MrwIrLZpBXsfsN8RNtgbGGVO3nP7UMgPGvgBIu4
oQH4VL2MdWqbqM+hzj6uJ44iGVwiRsdP5X7P05AQ/7O/cx1NrZsafh2z/XN+6srr
MtB0Z+lEWDHOLQUQD4VUbBpAv/uFaq7Jei+uXuFj5eYX+HPW12CdZOmHjXQFt/Bj
fHEVEeG5oxf05tVVdWhQohX4NWnZB+YiKmEREscT54MEKmJCfzx3qoisvCCNZC8W
zRWmxgXR3m5n6URBZS7SSZBn8Y/XkdqK0XKjKEfEM7NLrI2NYJIL3fwMN3Ot8SO9
cdi1RskLxRlskNFLTCxXZ5rth7wEsS/S/PEYhIfVwW7Mt6ivrxL4XR32oeObb4AS
KQDaawhi+6+mJ5/okhH55F4KBPdOZVJvCYKaCYNCIRhQ/4w1zIsdLTXlU5IJwuwb
FjAGcX9uXC/I5pWPu768cZeudfc4JRW2/U+lbzc9pRJ5hVUi33T4tBSYWi5ZQvSd
IDnTSoTsOIjWo8501+ulNAqOr+0a6tmhxC9rZ/t8+XI5qbzVBDdiTnKbgHMXt4pf
xfUzzXi7TpPyq0lTultn9mrKh3tNRlD3yF+iFwBjzuadIGolPgn4qKVbLZs/X24l
Oz+cEknOvOBuYfwYA3LqT+W1LD3MTsaCOT+GUwOh1StSucWvo2A=
=IXfr
-----END PGP SIGNATURE-----

--Sig_/gbTELSdSbdVWbrnHWsmVUFl--
