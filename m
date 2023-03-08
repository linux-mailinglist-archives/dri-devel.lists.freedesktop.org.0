Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4EA6B026B
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 10:09:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1164810E5B3;
	Wed,  8 Mar 2023 09:09:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7BFB10E5B3;
 Wed,  8 Mar 2023 09:09:48 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id h9so15866170ljq.2;
 Wed, 08 Mar 2023 01:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678266587;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=8AUKoaNx6Egyok+fr4CwiahgCs5LjMAvEbc/IxWiDp8=;
 b=ffsYu9PfuPDRupL4Ica8LRRJXlua6V/2iHRWb81p1Xw9xtV5yoXPxLdaGGrrLZ2s8F
 CvGNODBgXpw26Curud3T882dlT58jZrq1HYJDLoECPsEBi3fUSWY4szWzdaSDfQgZgVd
 j/t1snZvfziENP3xaJF325k/rmVJkI3TvuGoN+wlJEF0wIfOOn1zZyE+spAs+buSUIl1
 WCERGPFCiYs8MpN+MCd8RU5ntX6L7WfdVyUs29jllPzLXipXd+kfQ90gBrtYlwa/Ibx0
 DCWxqsm3e50v1lzk6Z6rH2bz18D61bhQpFkJWyaIAUQDy7ZfQOQy/Nq4H/Hh7bR8NJMz
 o5Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678266587;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8AUKoaNx6Egyok+fr4CwiahgCs5LjMAvEbc/IxWiDp8=;
 b=2LIOiG4fqxGG6wCP3vNyBev3YOuZ335zGdsr3055UrhcWCwItNKnQ+ZmJAT3CEXBwO
 y13uXLRtH4f5btHVH4osXycvn3kj+OLNBWEGUbzDm07ZHO1m03NCtxwFP3JKNDdrHY1k
 ORq68eAgctC8jMphIu94L78FbZKjc5LwQzE1m1l2m5mMrd1GjgGUAgsqJtCK2lDmkIMh
 eDCcgC/f1uWnMlxnEWRZzCnK0enmA/rCZr/Xup+H00rGNUmiL86vXRJrUbWJCe4aEijF
 EZ8Ij5mv2Cqs6mC9YiiH3Z8wCvZuk2a6NBmT9vzxPCxIxYFvLdfnxoGIIbPF2PCwaeRU
 UOEQ==
X-Gm-Message-State: AO0yUKV/9g8Yel9OTZ1Tq3V32sduvc4ld6jmIDS6AAtXXX4k33LtJR3o
 DfCy0RmIcoDMqrEbO09fhVI=
X-Google-Smtp-Source: AK7set8CEj42i97wuKNoHE3Stn4dim6GNyIxYZNTl0oAkFYgUaqZUiayyVdOAJ3FNFcyxhbxtzyK2g==
X-Received: by 2002:a2e:be13:0:b0:298:69aa:6710 with SMTP id
 z19-20020a2ebe13000000b0029869aa6710mr776073ljq.41.1678266586953; 
 Wed, 08 Mar 2023 01:09:46 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 x19-20020a2e7c13000000b002946fb5b50asm2485691ljc.139.2023.03.08.01.09.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 01:09:46 -0800 (PST)
Date: Wed, 8 Mar 2023 11:09:43 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [PATCH v3 03/17] drm/connector: Deprecate split for BT.2020 in
 drm_colorspace enum
Message-ID: <20230308110943.4dbb6afc@eldfell>
In-Reply-To: <20230307151107.49649-4-harry.wentland@amd.com>
References: <20230307151107.49649-1-harry.wentland@amd.com>
 <20230307151107.49649-4-harry.wentland@amd.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2Nnn22u_Trdd80MLUFUgMee";
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

--Sig_/2Nnn22u_Trdd80MLUFUgMee
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 7 Mar 2023 10:10:53 -0500
Harry Wentland <harry.wentland@amd.com> wrote:

> From: Joshua Ashton <joshua@froggi.es>
>=20
> Userspace has no way of controlling or knowing the pixel encoding
> currently, so there is no way for it to ever get the right values here.
>=20
> When we do add pixel_encoding control from userspace,we can pick the
> right value for the colorimetry packet based on the
> pixel_encoding + the colorspace.
>=20
> Let's deprecate these values, and have one BT.2020 colorspace entry
> that userspace can use.
>=20
> v2:
>  - leave CYCC alone for now; it serves a purpose
>  - leave BT2020_RGB the new default BT2020
>=20
> Signed-off-by: Joshua Ashton <joshua@froggi.es>
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
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
>  drivers/gpu/drm/display/drm_hdmi_helper.c |  7 +++----
>  drivers/gpu/drm/drm_connector.c           |  8 ++++----
>  drivers/gpu/drm/i915/display/intel_dp.c   | 14 +++++++-------
>  include/drm/drm_connector.h               | 15 +++++++++------
>  4 files changed, 23 insertions(+), 21 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/display/drm_hdmi_helper.c b/drivers/gpu/drm/=
display/drm_hdmi_helper.c
> index faf5e9efa7d3..05a0d03ffcda 100644
> --- a/drivers/gpu/drm/display/drm_hdmi_helper.c
> +++ b/drivers/gpu/drm/display/drm_hdmi_helper.c
> @@ -97,8 +97,7 @@ EXPORT_SYMBOL(drm_hdmi_infoframe_set_hdr_metadata);
>  #define HDMI_COLORIMETRY_OPYCC_601		(C(3) | EC(3) | ACE(0))
>  #define HDMI_COLORIMETRY_OPRGB			(C(3) | EC(4) | ACE(0))
>  #define HDMI_COLORIMETRY_BT2020_CYCC		(C(3) | EC(5) | ACE(0))
> -#define HDMI_COLORIMETRY_BT2020_RGB		(C(3) | EC(6) | ACE(0))
> -#define HDMI_COLORIMETRY_BT2020_YCC		(C(3) | EC(6) | ACE(0))
> +#define HDMI_COLORIMETRY_BT2020			(C(3) | EC(6) | ACE(0))
>  #define HDMI_COLORIMETRY_DCI_P3_RGB_D65		(C(3) | EC(7) | ACE(0))
>  #define HDMI_COLORIMETRY_DCI_P3_RGB_THEATER	(C(3) | EC(7) | ACE(1))
> =20
> @@ -112,8 +111,8 @@ static const u32 hdmi_colorimetry_val[] =3D {
>  	[DRM_MODE_COLORIMETRY_OPYCC_601] =3D HDMI_COLORIMETRY_OPYCC_601,
>  	[DRM_MODE_COLORIMETRY_OPRGB] =3D HDMI_COLORIMETRY_OPRGB,
>  	[DRM_MODE_COLORIMETRY_BT2020_CYCC] =3D HDMI_COLORIMETRY_BT2020_CYCC,
> -	[DRM_MODE_COLORIMETRY_BT2020_RGB] =3D HDMI_COLORIMETRY_BT2020_RGB,
> -	[DRM_MODE_COLORIMETRY_BT2020_YCC] =3D HDMI_COLORIMETRY_BT2020_YCC,
> +	[DRM_MODE_COLORIMETRY_BT2020_DEPRECATED] =3D HDMI_COLORIMETRY_BT2020,
> +	[DRM_MODE_COLORIMETRY_BT2020] =3D HDMI_COLORIMETRY_BT2020,
>  };
> =20
>  #undef C
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connec=
tor.c
> index 61c29ce74b03..fe7eab15f727 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -1031,9 +1031,9 @@ static const struct drm_prop_enum_list hdmi_colorsp=
aces[] =3D {
>  	/* Colorimetry based on ITU-R BT.2020 */
>  	{ DRM_MODE_COLORIMETRY_BT2020_CYCC, "BT2020_CYCC" },
>  	/* Colorimetry based on ITU-R BT.2020 */
> -	{ DRM_MODE_COLORIMETRY_BT2020_RGB, "BT2020_RGB" },
> +	{ DRM_MODE_COLORIMETRY_BT2020, "BT2020" },
>  	/* Colorimetry based on ITU-R BT.2020 */
> -	{ DRM_MODE_COLORIMETRY_BT2020_YCC, "BT2020_YCC" },
> +	{ DRM_MODE_COLORIMETRY_BT2020_DEPRECATED, "BT2020_DEPRECATED" },
>  	/* Added as part of Additional Colorimetry Extension in 861.G */
>  	{ DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65, "DCI-P3_RGB_D65" },
>  	{ DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER, "DCI-P3_RGB_Theater" },
> @@ -1054,7 +1054,7 @@ static const struct drm_prop_enum_list dp_colorspac=
es[] =3D {
>  	/* Colorimetry based on SMPTE RP 431-2 */
>  	{ DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65, "DCI-P3_RGB_D65" },
>  	/* Colorimetry based on ITU-R BT.2020 */
> -	{ DRM_MODE_COLORIMETRY_BT2020_RGB, "BT2020_RGB" },
> +	{ DRM_MODE_COLORIMETRY_BT2020, "BT2020" },
>  	{ DRM_MODE_COLORIMETRY_BT601_YCC, "BT601_YCC" },
>  	{ DRM_MODE_COLORIMETRY_BT709_YCC, "BT709_YCC" },
>  	/* Standard Definition Colorimetry based on IEC 61966-2-4 */
> @@ -1068,7 +1068,7 @@ static const struct drm_prop_enum_list dp_colorspac=
es[] =3D {
>  	/* Colorimetry based on ITU-R BT.2020 */
>  	{ DRM_MODE_COLORIMETRY_BT2020_CYCC, "BT2020_CYCC" },
>  	/* Colorimetry based on ITU-R BT.2020 */
> -	{ DRM_MODE_COLORIMETRY_BT2020_YCC, "BT2020_YCC" },
> +	{ DRM_MODE_COLORIMETRY_BT2020_DEPRECATED, "BT2020_DEPRECATED" },

Let's hope no-one complains about missing the old string names in UABI. :-)

Actually, you should write in the commit message why removing old names
is fine.

>  };
> =20
>  /**
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index c9be61d2348e..be100a193bf5 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -1766,11 +1766,11 @@ static void intel_dp_compute_vsc_colorimetry(cons=
t struct intel_crtc_state *crtc
>  	case DRM_MODE_COLORIMETRY_BT2020_CYCC:
>  		vsc->colorimetry =3D DP_COLORIMETRY_BT2020_CYCC;
>  		break;
> -	case DRM_MODE_COLORIMETRY_BT2020_RGB:
> -		vsc->colorimetry =3D DP_COLORIMETRY_BT2020_RGB;
> -		break;
> -	case DRM_MODE_COLORIMETRY_BT2020_YCC:
> -		vsc->colorimetry =3D DP_COLORIMETRY_BT2020_YCC;
> +	case DRM_MODE_COLORIMETRY_BT2020_DEPRECATED:
> +	case DRM_MODE_COLORIMETRY_BT2020:
> +		vsc->colorimetry =3D vsc->pixelformat =3D=3D DP_PIXELFORMAT_RGB
> +			? DP_COLORIMETRY_BT2020_RGB
> +			: DP_COLORIMETRY_BT2020_YCC;
>  		break;
>  	case DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65:
>  	case DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER:
> @@ -3043,9 +3043,9 @@ intel_dp_needs_vsc_sdp(const struct intel_crtc_stat=
e *crtc_state,
>  	switch (conn_state->colorspace) {
>  	case DRM_MODE_COLORIMETRY_SYCC_601:
>  	case DRM_MODE_COLORIMETRY_OPYCC_601:
> -	case DRM_MODE_COLORIMETRY_BT2020_YCC:
> -	case DRM_MODE_COLORIMETRY_BT2020_RGB:
>  	case DRM_MODE_COLORIMETRY_BT2020_CYCC:
> +	case DRM_MODE_COLORIMETRY_BT2020_DEPRECATED:
> +	case DRM_MODE_COLORIMETRY_BT2020:
>  		return true;
>  	default:
>  		break;
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index bb078666dc34..3e2e1bc7aa04 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -409,12 +409,15 @@ enum drm_privacy_screen_status {
>   * @DRM_MODE_COLORIMETRY_BT2020_CYCC:
>   *   (HDMI, DP)
>   *   ITU-R BT.2020 Y'c C'bc C'rc (constant luminance) colorimetry format
> - * @DRM_MODE_COLORIMETRY_BT2020_RGB:
> + * @DRM_MODE_COLORIMETRY_BT2020:
>   *   (HDMI, DP)
> - *   ITU-R BT.2020 R' G' B' colorimetry format
> - * @DRM_MODE_COLORIMETRY_BT2020_YCC:
> + *   ITU-R BT.2020 [R' G' B'] or
> + * 	 ITU-R BT.2020 [Y' C'b C'r] or
> + *   ITU-R BT.2020 [Y'c C'bc C'rc] (linear)

Drop the constant luminance variant from this value's doc.

> + *   colorimetry format
> + * @DRM_MODE_COLORIMETRY_BT2020_DEPRECATED:
>   *   (HDMI, DP)
> - *   ITU-R BT.2020 Y' C'b C'r colorimetry format
> + *   deprecated; same as DRM_MODE_COLORIMETRY_BT2020
>   * @DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65:
>   *   (HDMI)
>   *   SMPTE ST 2113 P3D65 colorimetry format
> @@ -448,8 +451,8 @@ enum drm_colorspace {
>  	DRM_MODE_COLORIMETRY_OPYCC_601		=3D 6,
>  	DRM_MODE_COLORIMETRY_OPRGB		=3D 7,
>  	DRM_MODE_COLORIMETRY_BT2020_CYCC	=3D 8,
> -	DRM_MODE_COLORIMETRY_BT2020_RGB		=3D 9,
> -	DRM_MODE_COLORIMETRY_BT2020_YCC		=3D 10,
> +	DRM_MODE_COLORIMETRY_BT2020		=3D 9,
> +	DRM_MODE_COLORIMETRY_BT2020_DEPRECATED	=3D 10,
>  	/* Additional Colorimetry extension added as part of CTA 861.G */
>  	DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65	=3D 11,
>  	DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER	=3D 12,

With the caveat noted and nitpick fixed:
Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks,
pq

--Sig_/2Nnn22u_Trdd80MLUFUgMee
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmQIUNcACgkQI1/ltBGq
qqeESw//YofGlTgH5DWJ5CIcXfEe6xAdkdIG4ghNsJ2L5B7gIAMRj5lAZwbh1NLT
uMAoQlia9Lpkg/PuEiiWz74DM48cJwBgHrE2yCoChvmj5UtuARSrl/4tZkE4LWV5
aEB3C5Nu6VSv4+28XDd0eUkI9FA5x4s9/xaxBcdA9N+/RmfzdzZN6D+dmHGoiai6
dL1sTwSyHcAirVhWrQqJLBLP3RfEAv0fXQqyazHkY00EYwkv7BWBG5VrKVUJ4y02
otibtcs1cTpGVmBKmEl++89fxlZzgm5Fo90Hhq15E/GoJr6f6Vl0yhgdWfbwMUL/
LJA6nWLhF6HXGErdlp/T6owhgjveqJpmLHfmIeVojf5sto9mMzhXc8Qu0Dxd4r1C
uPmKDFFHECTi7cIxFmfJ6ZvxWX+J0FctCxXXWxtgmcv0tVtHLcjrpG5kbfx5RNzT
CUGS1cmkWAP6wbTiKkWGsJ3z7UUUCtwa9z26il2sthFZWvuNOpL6qZ0znbXICYfd
QTShqXuVFqy60g1OFMr9/ssxsOzJluQmdooyPa+x0ls/ENk2iMEB1YgIHS5zVQu5
o5kwmQM7xx4qN85hsrIhBSK3hFmVh+BKeL1eSS+ZG1np0fzLPW9bU6eaoQnKO4II
RdtU2LdFZ1lRvloMbfHDO7U/F3fXp8mcb7cq8tccrlma/ff1Wzw=
=dxv+
-----END PGP SIGNATURE-----

--Sig_/2Nnn22u_Trdd80MLUFUgMee--
