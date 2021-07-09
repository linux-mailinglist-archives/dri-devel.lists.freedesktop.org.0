Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B80363C206F
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 10:05:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B37326E9DE;
	Fri,  9 Jul 2021 08:05:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 580E46E9DE
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jul 2021 08:05:05 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id p1so21564819lfr.12
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jul 2021 01:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=ed/3O8g0+Ot1CJhKMRmIgpm9gd4W9UljL3YKk9Gytxo=;
 b=c/Wt58mpjJy4CxaOSInPx2cku61JinT3CjJSmHa4wngheo8AAhhpFlkDPEPcSN1oKT
 azUjFzOk86S8EzNYpWIDe2SLtN5SiVlZdpdc+po+lvLl6flOTq7XdCsk8JL/8ZLl8TOr
 D+m12jKpWSNyF8S141G1u5vSQWYJCrU1oC+042xN2KDbnNpV3jbFrZO2RSElFF6LFTP4
 BSc9SzptYdO7AmoN2QV2Zu5/oyiR5yUi7J+8ffQ3DAnjt/1H5EwLtCeWUoHC4VYNh9uZ
 0QY+aZIESi/FrVOyNry9hk0CtlZpH3P1aHsoFfefw500FXQJxIG65Qln7V3Fjv9rlnzm
 8ikQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=ed/3O8g0+Ot1CJhKMRmIgpm9gd4W9UljL3YKk9Gytxo=;
 b=sGpf9kODs3JZk5XBclHdfzk21RWjiXgZfRK86GWM3kWFbN1OQGz0nsRsIdXXSRFf/5
 ZBrCFo8eu3k2Rjem+INzZ0sjp3lGFUu3fjQWeidxTBuqGhIsetjKhyErhoM0/vVZFqj9
 Qa4v+PjZrkRSiiNJgLjr69S5hcdrEspmfwytRraNpdwzvCXg7t6PVi5/t4z6LzhKUeKG
 nTMpjC89lTmhtH7IITuzA20hX7/OHJXVdr3H7xgVJZdR3BO3jVPHgoj7O3m5Mv99qL6M
 zouBplKydVKk3Kxxr3NR8EGHMx9G5jYV3D3hYbZksmMWvROrCV34C/2VWOIczFgygEQ8
 WXwQ==
X-Gm-Message-State: AOAM533FRY2xd0LB6YUgynaHDAal8I2URcI2RS0cdzPoK7aaCI8Roh7H
 RJvRlWk9T1Ql6xjBNpS94M0=
X-Google-Smtp-Source: ABdhPJwRDlinchAW9QOv1u3LwLKno0+jiOKl/ZCFKrMwTKXF6Z+c7xLHm/ft8qqV2aCvMhbkaesSww==
X-Received: by 2002:a05:6512:694:: with SMTP id
 t20mr28884541lfe.344.1625817903687; 
 Fri, 09 Jul 2021 01:05:03 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id q20sm178241lfu.168.2021.07.09.01.05.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 01:05:03 -0700 (PDT)
Date: Fri, 9 Jul 2021 11:04:59 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Raphael GALLAIS-POU - foss <raphael.gallais-pou@foss.st.com>
Subject: Re: [PATCH 1/2] drm: add crtc background color property
Message-ID: <20210709110459.79ca406a@eldfell>
In-Reply-To: <20210707084557.22443-2-raphael.gallais-pou@foss.st.com>
References: <20210707084557.22443-1-raphael.gallais-pou@foss.st.com>
 <20210707084557.22443-2-raphael.gallais-pou@foss.st.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/temeJsUEYx7B2cDJr9pGX1B";
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Raphael GALLAIS-POU <raphael.gallais-pou@st.com>,
 David Airlie <airlied@linux.ie>,
 Yannick FERTRE - foss <yannick.fertre@foss.st.com>,
 Alexandre TORGUE - foss <alexandre.torgue@foss.st.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Yannick FERTRE <yannick.fertre@st.com>,
 Philippe CORNU - foss <philippe.cornu@foss.st.com>,
 Philippe CORNU <philippe.cornu@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/temeJsUEYx7B2cDJr9pGX1B
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 7 Jul 2021 08:48:47 +0000
Raphael GALLAIS-POU - foss <raphael.gallais-pou@foss.st.com> wrote:

> Some display controllers can be programmed to present non-black colors
> for pixels not covered by any plane (or pixels covered by the
> transparent regions of higher planes).  Compositors that want a UI with
> a solid color background can potentially save memory bandwidth by
> setting the CRTC background property and using smaller planes to display
> the rest of the content.
>=20
> To avoid confusion between different ways of encoding RGB data, we
> define a standard 64-bit format that should be used for this property's
> value.  Helper functions and macros are provided to generate and dissect
> values in this standard format with varying component precision values.
>=20
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/drm_atomic_state_helper.c |  1 +
>  drivers/gpu/drm/drm_atomic_uapi.c         |  4 +++
>  drivers/gpu/drm/drm_blend.c               | 34 +++++++++++++++++++++--
>  drivers/gpu/drm/drm_mode_config.c         |  6 ++++
>  include/drm/drm_blend.h                   |  1 +
>  include/drm/drm_crtc.h                    | 12 ++++++++
>  include/drm/drm_mode_config.h             |  5 ++++
>  include/uapi/drm/drm_mode.h               | 28 +++++++++++++++++++
>  8 files changed, 89 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/=
drm_atomic_state_helper.c
> index ddcf5c2c8e6a..1b95a4ecdb2b 100644
> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> @@ -72,6 +72,7 @@ __drm_atomic_helper_crtc_state_reset(struct drm_crtc_st=
ate *crtc_state,
>  				     struct drm_crtc *crtc)
>  {
>  	crtc_state->crtc =3D crtc;
> +	crtc_state->bgcolor =3D drm_argb(16, 0xffff, 0, 0, 0);
>  }
>  EXPORT_SYMBOL(__drm_atomic_helper_crtc_state_reset);
> =20
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atom=
ic_uapi.c
> index 438e9585b225..fea68f8f17f8 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -483,6 +483,8 @@ static int drm_atomic_crtc_set_property(struct drm_cr=
tc *crtc,
>  		set_out_fence_for_crtc(state->state, crtc, fence_ptr);
>  	} else if (property =3D=3D crtc->scaling_filter_property) {
>  		state->scaling_filter =3D val;
> +	} else if (property =3D=3D config->bgcolor_property) {
> +		state->bgcolor =3D val;
>  	} else if (crtc->funcs->atomic_set_property) {
>  		return crtc->funcs->atomic_set_property(crtc, state, property, val);
>  	} else {
> @@ -520,6 +522,8 @@ drm_atomic_crtc_get_property(struct drm_crtc *crtc,
>  		*val =3D 0;
>  	else if (property =3D=3D crtc->scaling_filter_property)
>  		*val =3D state->scaling_filter;
> +	else if (property =3D=3D config->bgcolor_property)
> +		*val =3D state->bgcolor;
>  	else if (crtc->funcs->atomic_get_property)
>  		return crtc->funcs->atomic_get_property(crtc, state, property, val);
>  	else
> diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
> index ec37cbfabb50..6692d6a6db22 100644
> --- a/drivers/gpu/drm/drm_blend.c
> +++ b/drivers/gpu/drm/drm_blend.c
> @@ -186,8 +186,7 @@
>   *		 assumed to be 1.0
>   *
>   * Note that all the property extensions described here apply either to =
the
> - * plane or the CRTC (e.g. for the background color, which currently is =
not
> - * exposed and assumed to be black).
> + * plane or the CRTC.
>   *
>   * SCALING_FILTER:
>   *     Indicates scaling filter to be used for plane scaler
> @@ -201,6 +200,21 @@
>   *
>   * Drivers can set up this property for a plane by calling
>   * drm_plane_create_scaling_filter_property
> + *

Hi,

I assume the below block is the UAPI documentation of this new property
and that it would appear with the other UAPI docs.

> + * BACKGROUND_COLOR:
> + *	Defines the ARGB color of a full-screen layer that exists below all
> + *	planes.  This color will be used for pixels not covered by any plane
> + *	and may also be blended with plane contents as allowed by a plane's
> + *	alpha values.  The background color defaults to black, and is assumed
> + *	to be black for drivers that do not expose this property.

All good up to here.

>  Although
> + *	background color isn't a plane, it is assumed that the color provided
> + *	here undergoes the same pipe-level degamma/CSC/gamma transformations
> + *	that planes undergo.

This sounds to me like it refers to the per-plane degamma/csc/gamma
which are new properties in development. I believe you do not mean
that, but you mean the CRTC degamma/csc/gamma and everything else which
apply *after* the blending of planes. So the wording here would need
clarification.

>  Note that the color value provided here includes
> + *	an alpha channel...non-opaque background color values are allowed,
> + *	but are generally only honored in special cases (e.g., when a memory
> + *	writeback connector is in use).

This could be read as: if you use a non-opaque color value, it will
usually be completely ignored (and the background will be e.g. black
instead). Is that your intention?

I think a more useful definition would be that the alpha is used in
blending as always, but because we do not yet have physically
transparent monitors, the final alpha value may not reach the video
sink or the video sink may ignore it.

> + *
> + *	This property is setup with drm_crtc_add_bgcolor_property().

You forgot to document the value format of this property. The ARGB color
format needs to be defined at least to the same detail as all pixel
formats in drm_fourcc.h are. If there is a suitable DRM_FORMAT_*
definition already, simply saying the color is in that format would be
enough.

Another thing to document is whether this color value is alpha
pre-multiplied or not. Planes can have the property "pixel blend mode",
but because the background color is not on a plane, that property
cannot apply here.

The difference it makes is that if background color is both non-opaque
and pre-multiplied, then the question arises what pixel values will
actually be transmitted to video sink for the background. Will the
alpha pre-multiplication be undone?

Btw. note that "pixel blend mode" property does not document the use of
background alpha at all. So if the background color can have non-opaque
alpha, then you need to document the behavior in "pixel blend mode". It
also does not document what alpha value will result from blending, for
blending the next plane.

The question about full vs. limited range seems unnecessary to me, as
the background color will be used as-is in the blending stage, so
userspace can just program the correct value that fits the pipeline it
is setting up.

One more question is, as HDR exists, could we need background colors
with component values greater than 1.0?

Scanout of FP16 formats exists.

>   */


Thanks,
pq

--Sig_/temeJsUEYx7B2cDJr9pGX1B
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmDoAysACgkQI1/ltBGq
qqfXOg//RiqyBObUf1qEhCgXuV7w9oliR57jTiXuC1OkyokM1HrdoVx6EKN3ci6+
S6+a4EH0E1Tus/0l3eqRtlxJeDPjIED3iMUz/q94sBQaYjPCPQGDd8FCPzMkw1ds
gCrZXN7igOyYIn65HcCDzSsGH14QVkBHu/mAWx6ouT8iIdyU48/E64WeOYlXKaE4
Ipk+VU9LopdonE7TXWO5ZGOiZi104sRbO3JowTFgW/prI6PMWxm4r+9cyJwCp0+F
ow7hTh7T6g15THuM5aLq5HppM2Rc1K5IV3cV3xx0nNY04aUjD6UAAXW3dahd6GRF
74ts/ArfvPvnxArZujqA/yDfvUuCYu8CQt3jxCImVm2VNnHbiFvs80JqbYwAg6Jx
sjpISMdOllAyCrXMVPCv+LFaW6hP8N0TP62uOp9a3AU2ojmMcdaBRLPYjt5Qp/76
Uezq0nnhdvdQCLAPkhJJ8RqtcTmqQmK3OOUvJB9ng+Sr99fXXf695Z6xH4owXF9d
3OjFvOdhdrJSbr1fSXdaJeHHkSi92uMOae9VQV0BIRLjWknSYfq3NYapYWof7MN9
rDDHuQT1lWp+ifFFOy9hAuJV2bFn0HT6DlaeSluSCMQRHpVHYmkXUcYgY1/fNEqP
n2MJR3io7wg0sCoAqEXgUYpWe7Lfo1w58Gl8Ylbn14g1E4nHNRc=
=94EW
-----END PGP SIGNATURE-----

--Sig_/temeJsUEYx7B2cDJr9pGX1B--
