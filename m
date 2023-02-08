Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 813D268EB65
	for <lists+dri-devel@lfdr.de>; Wed,  8 Feb 2023 10:30:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFD6310E722;
	Wed,  8 Feb 2023 09:30:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 528BB10E722;
 Wed,  8 Feb 2023 09:30:47 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id dr8so49601513ejc.12;
 Wed, 08 Feb 2023 01:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=0Q56cl7nbi6SYOA0h021d5Rnp5QFQpdom+ye/L9v3MQ=;
 b=Wom6MA9IjWDSm5qWG04yHxve1kBebOuo0Vy7eI3DlhnjUQwagP/TEIH8OFYzFmJSG2
 w/jlqq77wgud9Z4KdVgUcya2ydIAPVIfSdLgEFUPnDIXUsharH2evS14x2HXuhZnVi4J
 rxs7vm4CXLLNgpLAE11C4pW6CWGTxMwkrTbVgWaV/cpleVQlgWsE2rwYgs44reyHQpbs
 LYUOx5glSE/DQBT5103gHXG75a1i1ayIXbaurUHVvPJVrLTgegrr/PJe42UxcuJl6lNI
 ocvolBINXN+Mljz8p97oiqjTYO6pkO4Vv0aDOS03Gn26u7GRINMEQVuZz0jdLbyxZR1w
 6Pfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0Q56cl7nbi6SYOA0h021d5Rnp5QFQpdom+ye/L9v3MQ=;
 b=bGqAteoLvzNCCN29uO6RUOsvqHbgRrLIVtoVcqlNLbTfzJyQGCmBtTuTRCLMb3kcB3
 XCbcGFRc3Fl/RTgSScHang4v3xuxLqtK28+lvCUxyLbV+tMKBfWIY7W8RpMv91wNVSIP
 FoScWxokXsCXSxQ+CAf1M1PD+BG0FH8USPZn9J2lTO+YjZwRYqJzWdEKsBowA7iwvKQ+
 vOed89o2tCHE6S/xUVxOjK/eWh83jdtZQNVKWS5VzMpRhkgKE5VL5cV4d9MZRKz7lxFG
 QIQup3gHoREEzS8FCkCG0Gwmxs70uaIbFssHX1ysrul+qZGp+huyUc9EWKgu9Qc4/yRP
 JLhw==
X-Gm-Message-State: AO0yUKW1Y4mFD7HU3VLaFJywwNMy0iEd9lqxoakg1EbN8n1ssCK4NMDH
 dbqlTA6s2Qhix5tgksWayQc=
X-Google-Smtp-Source: AK7set+FjmKalXK/aZP8ePtU3z6uRKQdnZILpGx1CEEcYg2oBu4la4Llt2f5o5WEmesDzwWP1TI7Tw==
X-Received: by 2002:a17:906:3950:b0:887:3c7e:5df with SMTP id
 g16-20020a170906395000b008873c7e05dfmr7690471eje.73.1675848645689; 
 Wed, 08 Feb 2023 01:30:45 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 c12-20020a170906154c00b0088c224bf5b5sm8137920ejd.148.2023.02.08.01.30.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 01:30:45 -0800 (PST)
Date: Wed, 8 Feb 2023 11:30:41 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Joshua Ashton <joshua@froggi.es>
Subject: Re: [PATCH 3/3] drm/connector: Deprecate split for BT.2020 in
 drm_colorspace enum
Message-ID: <20230208113041.70691449@eldfell>
In-Reply-To: <20230203020744.30745-3-joshua@froggi.es>
References: <20230203020744.30745-1-joshua@froggi.es>
 <20230203020744.30745-3-joshua@froggi.es>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/p1VnlJ5eibTtKqCOo=3USvg";
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
 amd-gfx@lists.freedesktop.org, Uma Shankar <uma.shankar@intel.com>,
 Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/p1VnlJ5eibTtKqCOo=3USvg
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri,  3 Feb 2023 02:07:44 +0000
Joshua Ashton <joshua@froggi.es> wrote:

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
> Note: _CYCC was effectively 'removed' by this change, but that was not
> possible to be taken advantage of anyway, as there is currently no
> pixel_encoding control so it would not be possible to output
> linear YCbCr.
>=20
> Signed-off-by: Joshua Ashton <joshua@froggi.es>
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
>  drivers/gpu/drm/display/drm_hdmi_helper.c |  9 ++++-----
>  drivers/gpu/drm/drm_connector.c           | 12 ++++++------
>  drivers/gpu/drm/i915/display/intel_dp.c   | 20 +++++++++-----------
>  include/drm/drm_connector.h               | 19 ++++++++++---------
>  4 files changed, 29 insertions(+), 31 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/display/drm_hdmi_helper.c b/drivers/gpu/drm/=
display/drm_hdmi_helper.c
> index 0264abe55278..c85860600395 100644
> --- a/drivers/gpu/drm/display/drm_hdmi_helper.c
> +++ b/drivers/gpu/drm/display/drm_hdmi_helper.c
> @@ -99,8 +99,7 @@ EXPORT_SYMBOL(drm_hdmi_infoframe_set_hdr_metadata);
>  #define HDMI_COLORIMETRY_OPYCC_601		(C(3) | EC(3) | ACE(0))
>  #define HDMI_COLORIMETRY_OPRGB			(C(3) | EC(4) | ACE(0))
>  #define HDMI_COLORIMETRY_BT2020_CYCC		(C(3) | EC(5) | ACE(0))
> -#define HDMI_COLORIMETRY_BT2020_RGB		(C(3) | EC(6) | ACE(0))
> -#define HDMI_COLORIMETRY_BT2020_YCC		(C(3) | EC(6) | ACE(0))
> +#define HDMI_COLORIMETRY_BT2020			(C(3) | EC(6) | ACE(0))
>  #define HDMI_COLORIMETRY_DCI_P3_RGB_D65		(C(3) | EC(7) | ACE(0))
>  #define HDMI_COLORIMETRY_DCI_P3_RGB_THEATER	(C(3) | EC(7) | ACE(1))
> =20
> @@ -113,9 +112,9 @@ static const u32 hdmi_colorimetry_val[] =3D {
>  	[DRM_MODE_COLORIMETRY_SYCC_601] =3D HDMI_COLORIMETRY_SYCC_601,
>  	[DRM_MODE_COLORIMETRY_OPYCC_601] =3D HDMI_COLORIMETRY_OPYCC_601,
>  	[DRM_MODE_COLORIMETRY_OPRGB] =3D HDMI_COLORIMETRY_OPRGB,
> -	[DRM_MODE_COLORIMETRY_BT2020_CYCC] =3D HDMI_COLORIMETRY_BT2020_CYCC,
> -	[DRM_MODE_COLORIMETRY_BT2020_RGB] =3D HDMI_COLORIMETRY_BT2020_RGB,
> -	[DRM_MODE_COLORIMETRY_BT2020_YCC] =3D HDMI_COLORIMETRY_BT2020_YCC,
> +	[DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_1] =3D HDMI_COLORIMETRY_BT2020,
> +	[DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_2] =3D HDMI_COLORIMETRY_BT2020,
> +	[DRM_MODE_COLORIMETRY_BT2020] =3D HDMI_COLORIMETRY_BT2020,
>  };
> =20
>  #undef C
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connec=
tor.c
> index 61c29ce74b03..58699ab15a6a 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -1029,11 +1029,11 @@ static const struct drm_prop_enum_list hdmi_color=
spaces[] =3D {
>  	/* Colorimetry based on IEC 61966-2-5 */
>  	{ DRM_MODE_COLORIMETRY_OPRGB, "opRGB" },
>  	/* Colorimetry based on ITU-R BT.2020 */
> -	{ DRM_MODE_COLORIMETRY_BT2020_CYCC, "BT2020_CYCC" },
> +	{ DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_1, "BT2020_DEPRECATED_1" },
>  	/* Colorimetry based on ITU-R BT.2020 */
> -	{ DRM_MODE_COLORIMETRY_BT2020_RGB, "BT2020_RGB" },
> +	{ DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_2, "BT2020_DEPRECATED_2" },
>  	/* Colorimetry based on ITU-R BT.2020 */
> -	{ DRM_MODE_COLORIMETRY_BT2020_YCC, "BT2020_YCC" },
> +	{ DRM_MODE_COLORIMETRY_BT2020, "BT2020" },
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
> @@ -1066,9 +1066,9 @@ static const struct drm_prop_enum_list dp_colorspac=
es[] =3D {
>  	/* Colorimetry based on IEC 61966-2-5 [33] */
>  	{ DRM_MODE_COLORIMETRY_OPYCC_601, "opYCC_601" },
>  	/* Colorimetry based on ITU-R BT.2020 */
> -	{ DRM_MODE_COLORIMETRY_BT2020_CYCC, "BT2020_CYCC" },
> +	{ DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_1, "BT2020_DEPRECATED_1" },
>  	/* Colorimetry based on ITU-R BT.2020 */
> -	{ DRM_MODE_COLORIMETRY_BT2020_YCC, "BT2020_YCC" },
> +	{ DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_2, "BT2020_DEPRECATED_2" },
>  };

Hi,

do these not rename the old uAPI strings?

Shouldn't the old strings be kept? It's much easier to scream "kernel
regression" when the expected string is no longer found than a subtle
change in behaviour that might not even be a change. ;-)

If there is not going to be a difference in behaviour, the enum could
expose e.g. all of "BT2020_RGB", "BT2020_CYCC" and "BT2020_YCC" as the
same integer value. If old userspace exists, it would not notice any
difference.

I mean, the *strings* are the uAPI, not the integers, right?


Thanks,
pq

> =20
>  /**
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index c9be61d2348e..1aa5dedeec7b 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -1763,14 +1763,12 @@ static void intel_dp_compute_vsc_colorimetry(cons=
t struct intel_crtc_state *crtc
>  	case DRM_MODE_COLORIMETRY_OPYCC_601:
>  		vsc->colorimetry =3D DP_COLORIMETRY_OPYCC_601;
>  		break;
> -	case DRM_MODE_COLORIMETRY_BT2020_CYCC:
> -		vsc->colorimetry =3D DP_COLORIMETRY_BT2020_CYCC;
> -		break;
> -	case DRM_MODE_COLORIMETRY_BT2020_RGB:
> -		vsc->colorimetry =3D DP_COLORIMETRY_BT2020_RGB;
> -		break;
> -	case DRM_MODE_COLORIMETRY_BT2020_YCC:
> -		vsc->colorimetry =3D DP_COLORIMETRY_BT2020_YCC;
> +	case DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_1:
> +	case DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_2:
> +	case DRM_MODE_COLORIMETRY_BT2020:
> +		vsc->colorimetry =3D vsc->pixelformat =3D=3D DP_PIXELFORMAT_RGB
> +			? DP_COLORIMETRY_BT2020_RGB
> +			: DP_COLORIMETRY_BT2020_YCC;
>  		break;
>  	case DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65:
>  	case DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER:
> @@ -3043,9 +3041,9 @@ intel_dp_needs_vsc_sdp(const struct intel_crtc_stat=
e *crtc_state,
>  	switch (conn_state->colorspace) {
>  	case DRM_MODE_COLORIMETRY_SYCC_601:
>  	case DRM_MODE_COLORIMETRY_OPYCC_601:
> -	case DRM_MODE_COLORIMETRY_BT2020_YCC:
> -	case DRM_MODE_COLORIMETRY_BT2020_RGB:
> -	case DRM_MODE_COLORIMETRY_BT2020_CYCC:
> +	case DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_1:
> +	case DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_2:
> +	case DRM_MODE_COLORIMETRY_BT2020:
>  		return true;
>  	default:
>  		break;
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index eb4cc9076e16..42a3cf43168c 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -390,12 +390,13 @@ enum drm_privacy_screen_status {
>   *   opYCC601 colorimetry format
>   * @DRM_MODE_COLORIMETRY_OPRGB:
>   *   opRGB colorimetry format
> - * @DRM_MODE_COLORIMETRY_BT2020_CYCC:
> - *   ITU-R BT.2020 Y'c C'bc C'rc (linear) colorimetry format
> - * @DRM_MODE_COLORIMETRY_BT2020_RGB:
> - *   ITU-R BT.2020 R' G' B' colorimetry format
> - * @DRM_MODE_COLORIMETRY_BT2020_YCC:
> - *   ITU-R BT.2020 Y' C'b C'r colorimetry format
> + * @DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_1:
> + * @DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_2:
> + * @DRM_MODE_COLORIMETRY_BT2020:
> + *   ITU-R BT.2020 [R' G' B'] or
> + * 	 ITU-R BT.2020 [Y' C'b C'r] or
> + *   ITU-R BT.2020 [Y'c C'bc C'rc] (linear)
> + *   colorimetry format
>   * @DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65:
>   *   DCI-P3 (SMPTE RP 431-2) colorimetry format
>   * @DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER:
> @@ -420,9 +421,9 @@ enum drm_colorspace {
>  	DRM_MODE_COLORIMETRY_SYCC_601,
>  	DRM_MODE_COLORIMETRY_OPYCC_601,
>  	DRM_MODE_COLORIMETRY_OPRGB,
> -	DRM_MODE_COLORIMETRY_BT2020_CYCC,
> -	DRM_MODE_COLORIMETRY_BT2020_RGB,
> -	DRM_MODE_COLORIMETRY_BT2020_YCC,
> +	DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_1,
> +	DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_2,
> +	DRM_MODE_COLORIMETRY_BT2020,
>  	/* Additional Colorimetry extension added as part of CTA 861.G */
>  	DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65,
>  	DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER,


--Sig_/p1VnlJ5eibTtKqCOo=3USvg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmPja8EACgkQI1/ltBGq
qqdOGQ//ZMiFOjj55v10Nb469J2VghA9I+cfqC/yKhYtdmM+8ECbmQJw6YtiZ0QJ
0FxbJvaROGZb3ekanltvKP7OPRxeI/3+GuZLdA0vhHeX2CkVu9scAs7VoKtBWbLD
N6QFNgcFhCmBoaACcbqcP/CGwVtw0X5L3QT1jxzkYVyFXbn8VTAj3wskq1leWIXC
7sC6CShAtsw0Qom1yZw0rllUxvO7yLNJ1nsaGQLcneNvy+rwu2IQoB4nYq0Z5zbz
YBsZPAhMs18oURYHj+w1ofaQDrdSx2Koe9om7mSsYYk0e+5STa7sWsNRC7MWtTxh
XtlKL+o5QI8A7NRbfJzRwUFzfE/n+ZWHSSbYcc9c6e8Qlz/fiaFrRY5JA5lRQeAV
t18meA1tDJa8Clg1dyfCrwgy1On7liPtyGenXLi89O9eXEd68oxLWiC5M1SXGOEY
iAIBP/p93Lks9ut1qBhvBZZ8uSg1Ys2c6bSHExwEZbfmzBMHPIGVPAGhze8QsS2D
faYZWR7aY/qFGyx4Q+BWQO/S7n5j4DfIpaMLmA2kC/0QypyeoAw10TGhK/x3X8Cs
1Hny+ml/2UzxILZ2CLutD0xSYuedD/l2B9WPuc4XAqebjgaE6NjgZU2tj0rzP5AV
E3pEJuPVDY/jqJLDnjqI32b7Rv4GvIOMvszbNiAkhD+jy+VOum8=
=6boW
-----END PGP SIGNATURE-----

--Sig_/p1VnlJ5eibTtKqCOo=3USvg--
