Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B4A455836
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 10:45:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FB8D6E935;
	Thu, 18 Nov 2021 09:45:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D66B6E934;
 Thu, 18 Nov 2021 09:45:16 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id z34so23107845lfu.8;
 Thu, 18 Nov 2021 01:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=6BjdaG1D40JxD2B+uUaQIdoCBmuLB0tD15VOQtbkKq0=;
 b=V4KUvb8WhOatBVawlqMY8Vp9tUOW4nZ+1TbF7Ncc7HWMEXA6dKEalwNPj4PUr2LXOU
 tgpPAnLvyuccO9jLzcsWmB71rT52xeFQK9BjsSFSYjwbTRFSyRNMpTHy/cGYedO7ynz5
 Kmd7x8Mp0fcdHUDNAiYIVA5ssDAYYHmGtaDxkG9l4u3EcU+Zuu8+GelS+f115TMySPl8
 /LcXCHjnuviFO7mrz7qWulsU/Te/Td/Zu44zwvO1BY8HPkIhOdjm8fTnPi4/EC1CtmAt
 e14fgopZOY3tsRAxsoWEKHFFJyR2Al4PrijlLn8lB31QoZS/3V5ANXniSfsf1DtYgO+p
 M5Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=6BjdaG1D40JxD2B+uUaQIdoCBmuLB0tD15VOQtbkKq0=;
 b=j7i7qj1qBeQ8s3EVlsqmBUJXZXyY2R2pwXV1Df5DenJoeIT1onMR9sPGCSKjXGmzmL
 QkfPJWde4fW67GOI5CMEntCSIQzzVUu3/2QuBHSAZhYduPyXrnyHN6GpM8adDeZZEw2u
 rH/idC0aJ5FrozfTxZ2NAs/wZQhTU4fVGjP5cfBZy2W/2KXvb8a+6HlmqqvwI/jhQ043
 Eb21B9n/XYu77uUgq7CUW7gKUBFDS0gXbTf/5RlyPr0DVWfCOO3cPazrFZIHUjQAdrY5
 oUPWlceWczt+qKKeohRrkf7x3yuLzU1yWAOxIU9j8YdEtcZcGvSiSN54ZVqtdrXw9vUu
 YoHw==
X-Gm-Message-State: AOAM5325IJkOVS94zUl9oNQm31mSgcAv+de9dfZpXjGo+rHkpQLC58hO
 vLURrdU1HirixRyJ/BA27cM=
X-Google-Smtp-Source: ABdhPJyUib0nyhN52b9JxfhROUP6Tz9GaMsbqeOdwFfBbcasXzE4K7hVi0AkmZCb6qvjYd3ju1872A==
X-Received: by 2002:ac2:489a:: with SMTP id x26mr22795697lfc.419.1637228714490; 
 Thu, 18 Nov 2021 01:45:14 -0800 (PST)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id d19sm251695lfv.74.2021.11.18.01.45.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 01:45:14 -0800 (PST)
Date: Thu, 18 Nov 2021 11:45:11 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: Re: [i-g-t 12/14] kms_color_helper: Add helper functions to support
 logarithmic gamma mode
Message-ID: <20211118114511.6488cb38@eldfell>
In-Reply-To: <20211115094759.520955-13-bhanuprakash.modem@intel.com>
References: <20211115094759.520955-1-bhanuprakash.modem@intel.com>
 <20211115094759.520955-13-bhanuprakash.modem@intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TNzRTZx_wb=2i/GWOPPMYIQ";
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
Cc: igt-dev@lists.freedesktop.org, Uma Shankar <uma.shankar@intel.com>,
 Mukunda Pramodh Kumar <mukunda.pramodh.kumar@intel.com>,
 dri-devel@lists.freedesktop.org,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/TNzRTZx_wb=2i/GWOPPMYIQ
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 15 Nov 2021 15:17:57 +0530
Bhanuprakash Modem <bhanuprakash.modem@intel.com> wrote:

> From: Mukunda Pramodh Kumar <mukunda.pramodh.kumar@intel.com>
>=20
> Add helper functions to support logarithmic gamma mode
>=20
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Cc: Uma Shankar <uma.shankar@intel.com>
> Signed-off-by: Mukunda Pramodh Kumar <mukunda.pramodh.kumar@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/kms_color_helper.c | 127 +++++++++++++++++++++++++++++++++++++++
>  tests/kms_color_helper.h |  16 +++++
>  2 files changed, 143 insertions(+)
>=20
> diff --git a/tests/kms_color_helper.c b/tests/kms_color_helper.c
> index c65b7a0f50..7ea8282df3 100644
> --- a/tests/kms_color_helper.c
> +++ b/tests/kms_color_helper.c
> @@ -190,6 +190,33 @@ struct drm_color_lut *coeffs_to_lut(data_t *data,
>  	return lut;
>  }
> =20
> +struct drm_color_lut *coeffs_to_logarithmic_lut(data_t *data,
> +						const gamma_lut_t *gamma,
> +						uint32_t color_depth,
> +						int off)
> +{
> +	struct drm_color_lut *lut;
> +	int i, lut_size =3D gamma->size;
> +	/* This is the maximum value due to 16 bit precision in hardware. */

In whose hardware?

Are igt tests not supposed to be generic for everything that exposes
the particular KMS properties?

This also hints that the UAPI design is lacking, because userspace
needs to know hardware specific things out of thin air. Display servers
are not going to have hardware-specific code. They specialise based on
the existence of KMS properties instead.

> +	uint32_t max_hw_value =3D (1 << 16) - 1;
> +	unsigned int max_segment_value =3D 1 << 24;
> +
> +	lut =3D malloc(sizeof(struct drm_color_lut) * lut_size);
> +
> +	for (i =3D 0; i < lut_size; i++) {
> +		double scaling_factor =3D (double)max_hw_value / (double)max_segment_v=
alue;
> +		uint32_t r =3D MIN((gamma->coeffs[i].r * scaling_factor), max_hw_value=
);
> +		uint32_t g =3D MIN((gamma->coeffs[i].g * scaling_factor), max_hw_value=
);
> +		uint32_t b =3D MIN((gamma->coeffs[i].b * scaling_factor), max_hw_value=
);
> +
> +		lut[i].red =3D r;
> +		lut[i].green =3D g;
> +		lut[i].blue =3D b;
> +	}
> +
> +	return lut;
> +}
> +
>  void set_degamma(data_t *data,
>  		 igt_pipe_t *pipe,
>  		 const gamma_lut_t *gamma)
> @@ -203,6 +230,15 @@ void set_degamma(data_t *data,
>  	free(lut);
>  }
> =20
> +void set_pipe_gamma(igt_pipe_t *pipe,
> +		    uint64_t value,
> +		    struct drm_color_lut *lut,
> +		    uint32_t size)
> +{
> +	igt_pipe_obj_set_prop_value(pipe, IGT_CRTC_GAMMA_MODE, value);
> +	igt_pipe_obj_replace_prop_blob(pipe, IGT_CRTC_GAMMA_LUT, lut, size);
> +}
> +
>  void set_gamma(data_t *data,
>  	       igt_pipe_t *pipe, const gamma_lut_t *gamma)
>  {
> @@ -241,6 +277,51 @@ void disable_prop(igt_pipe_t *pipe, enum igt_atomic_=
crtc_properties prop)
>  		igt_pipe_obj_replace_prop_blob(pipe, prop, NULL, 0);
>  }
> =20
> +drmModePropertyPtr get_pipe_gamma_degamma_mode(igt_pipe_t *pipe,
> +					       enum igt_atomic_crtc_properties prop)
> +{
> +	igt_display_t *display =3D pipe->display;
> +	uint32_t prop_id =3D pipe->props[prop];
> +	drmModePropertyPtr drmProp;
> +
> +	igt_assert(prop_id);
> +
> +	drmProp =3D drmModeGetProperty(display->drm_fd, prop_id);
> +
> +	igt_assert(drmProp);
> +	igt_assert(drmProp->count_enums);
> +
> +	return drmProp;
> +}
> +
> +gamma_lut_t *pipe_create_linear_lut(segment_data_t *info)

Identity transformation?

> +{
> +	uint32_t segment, entry, index =3D 0;
> +	double val;
> +	int i =3D 0;
> +	gamma_lut_t *gamma =3D alloc_lut(info->entries_count);
> +
> +	igt_assert(gamma);
> +
> +	gamma->size =3D info->entries_count;
> +	for (segment =3D 0; segment < info->segment_count; segment++) {
> +		uint32_t entry_count =3D info->segment_data[segment].count;
> +		uint32_t start =3D (segment =3D=3D 0) ? 0 : (1 << (segment - 1));
> +		uint32_t end =3D 1 << segment;
> +
> +		for (entry =3D 0; entry < entry_count; entry++) {
> +			val =3D (index =3D=3D 0) ? /* First entry is Zero. */
> +				0 : start + entry *
> +				((end - start) * 1.0 / entry_count);
> +
> +			set_rgb(&gamma->coeffs[i++], val);
> +			index++;
> +		}
> +	}
> +
> +	return gamma;
> +}
> +
>  drmModePropertyPtr get_plane_gamma_degamma_mode(igt_plane_t *plane,
>  				enum igt_atomic_plane_properties prop)
>  {
> @@ -331,6 +412,7 @@ segment_data_t *get_segment_data(data_t *data,
>  	info->segment_data =3D malloc(sizeof(struct drm_color_lut_range) * info=
->segment_count);
>  	igt_assert(info->segment_data);
> =20
> +	info->entries_count =3D 0;

What's this?

>  	for (i =3D 0; i < info->segment_count; i++) {
>  		info->entries_count +=3D lut_range[i].count;
>  		info->segment_data[i] =3D lut_range[i];
> @@ -341,6 +423,51 @@ segment_data_t *get_segment_data(data_t *data,
>  	return info;
>  }
> =20
> +void set_advance_gamma(data_t *data, igt_pipe_t *pipe, enum gamma_type t=
ype)
> +{
> +	igt_display_t *display =3D &data->display;
> +	gamma_lut_t *gamma_log;
> +	drmModePropertyPtr gamma_mode =3D NULL;
> +	segment_data_t *segment_info =3D NULL;
> +	struct drm_color_lut *lut =3D NULL;
> +	int lut_size =3D 0;
> +
> +	drmSetClientCap(data->drm_fd, DRM_CLIENT_CAP_ADVANCE_GAMMA_MODES, 1);

Is this how we are going to do cross-software DRM-master hand-over or
switching compatibility in general?

Add a new client cap for every new KMS property, and if the KMS client
does not set the property, the kernel will magically reset it to ensure
the client's expectations are met? Is that how it works?

Or why does this exist?

> +	gamma_mode =3D get_pipe_gamma_degamma_mode(pipe, IGT_CRTC_GAMMA_MODE);
> +
> +	for (int i =3D 0; i < gamma_mode->count_enums; i++) {
> +		if (!strcmp(gamma_mode->enums[i].name, "logarithmic gamma")) {
> +			segment_info =3D get_segment_data(data,
> +							gamma_mode->enums[i].value,
> +							gamma_mode->enums[i].name);
> +			lut_size =3D sizeof(struct drm_color_lut) *
> +					  segment_info->entries_count;
> +			if (type =3D=3D LINEAR_GAMMA) {
> +				gamma_log =3D pipe_create_linear_lut(segment_info);
> +				lut =3D coeffs_to_logarithmic_lut(data,
> +								gamma_log,
> +								data->color_depth,
> +								0);
> +			} else if (type =3D=3D MAX_GAMMA) {
> +				gamma_log =3D generate_table_max(segment_info->entries_count);
> +				gamma_log->size =3D segment_info->entries_count;
> +				lut =3D coeffs_to_lut(data, gamma_log,
> +						    data->color_depth, 0);
> +			}
> +			set_pipe_gamma(pipe, gamma_mode->enums[i].value,
> +				       lut, lut_size);
> +			igt_display_commit2(display, display->is_atomic
> +					    ? COMMIT_ATOMIC : COMMIT_LEGACY);
> +			break;
> +		}
> +	}
> +	drmSetClientCap(data->drm_fd, DRM_CLIENT_CAP_ADVANCE_GAMMA_MODES, 0);

I've never seen this done before. I did not know client caps could be
reset.

> +	free(gamma_log);
> +	free(lut);
> +	clear_segment_data(segment_info);
> +	drmModeFreeProperty(gamma_mode);
> +}


Thanks,
pq

> +
>  void set_plane_gamma(igt_plane_t *plane,
>  		char *mode,
>  		struct drm_color_lut_ext *lut,
> diff --git a/tests/kms_color_helper.h b/tests/kms_color_helper.h
> index 5a35dcaac1..c863874f0c 100644
> --- a/tests/kms_color_helper.h
> +++ b/tests/kms_color_helper.h
> @@ -70,6 +70,11 @@ typedef struct {
>  	uint32_t entries_count;
>  } segment_data_t;
> =20
> +enum gamma_type {
> +	LINEAR_GAMMA,
> +	MAX_GAMMA
> +};
> +
>  #define MIN(a, b) ((a) < (b) ? (a) : (b))
> =20
>  void paint_gradient_rectangles(data_t *data,
> @@ -89,6 +94,10 @@ struct drm_color_lut *coeffs_to_lut(data_t *data,
>  				    const gamma_lut_t *gamma,
>  				    uint32_t color_depth,
>  				    int off);
> +struct drm_color_lut *coeffs_to_logarithmic_lut(data_t *data,
> +						const gamma_lut_t *gamma,
> +						uint32_t color_depth,
> +						int off);
>  void set_degamma(data_t *data,
>  		 igt_pipe_t *pipe,
>  		 const gamma_lut_t *gamma);
> @@ -98,12 +107,19 @@ void set_gamma(data_t *data,
>  void set_ctm(igt_pipe_t *pipe, const double *coefficients);
>  void disable_prop(igt_pipe_t *pipe, enum igt_atomic_crtc_properties prop=
);
> =20
> +drmModePropertyPtr get_pipe_gamma_degamma_mode(igt_pipe_t *pipe,
> +					       enum igt_atomic_crtc_properties
> +					       prop);
>  drmModePropertyPtr get_plane_gamma_degamma_mode(igt_plane_t *plane,
>  	enum igt_atomic_plane_properties prop);
>  void clear_segment_data(segment_data_t *info);
> +gamma_lut_t *pipe_create_linear_lut(segment_data_t *info);
>  struct drm_color_lut_ext *create_linear_lut(segment_data_t *info);
>  struct drm_color_lut_ext *create_max_lut(segment_data_t *info);
>  segment_data_t *get_segment_data(data_t *data, uint64_t blob_id, char *m=
ode);
> +void set_pipe_gamma(igt_pipe_t *pipe, uint64_t value,
> +		    struct drm_color_lut *lut, uint32_t size);
> +void set_advance_gamma(data_t *data, igt_pipe_t *pipe, enum gamma_type t=
ype);
>  void set_plane_gamma(igt_plane_t *plane,
>  	char *mode, struct drm_color_lut_ext *lut, uint32_t size);
>  void set_plane_degamma(igt_plane_t *plane,


--Sig_/TNzRTZx_wb=2i/GWOPPMYIQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmGWIKcACgkQI1/ltBGq
qqdOuQ//XTWvO5wBbujP6bP5uCowcI+qMFifuYbNSb4osAa5+r6GNtELT7wrC4if
N5nhwicgHm2UNHJHU+eIshsiD1Fdnphr7pJlZVbg59bfwiT0ZTpgPxCjwmpJ6aIO
etG1L0RVAraOHAgl0X6IG3BO6p2++SdvY8v/gYVIIf+9fiuc+uKEzCJ2aqW0GAsY
qfGNO7sxW+Ch+8N4J5eQJ+U9Y3SL1Li1DeTH+Cn7KbiaUQ9HyZ/OuGketj1bhg3t
n6jziPnRGv/nEFAJPqTppFItimYtn1gLAmayOgXSmvY3uhY+n2/nwn1zMfysjJnx
x/Y+//iXybodsM0bH2XQ9QaG580ekZZf+kzt+5S6mWqNAL0UNAQWMnEeSvOIB9Jk
CAFDR4om+5U3+W3+pErks3qZ+ReCNC7VrgxE051WHoHWRuUeoOg49oYDE84WDCbN
6hu2Y7jXPsvyHcu21fRjr4HdSmKKRQnq85i72Xi03wfc2/vamJonKvPCPGtVgKL6
upn64R4BopCgpu6SJmydPuFC0+8Mw5toZ2OxY/eSc7P49itQmW1xqVAWaPIJX+ys
R68lWHj/yYN1/+bkh5oV5ZLb4mT34rSuFfYJmuGwFVdsAWWatHs7uQA6YP9DR+Vs
1/kpWlpZ8fyRahLW6aqvVaz1b5n430Iar6nYQe+K5McUoYCklek=
=4hFL
-----END PGP SIGNATURE-----

--Sig_/TNzRTZx_wb=2i/GWOPPMYIQ--
