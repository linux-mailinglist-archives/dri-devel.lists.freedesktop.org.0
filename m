Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A393852DF0
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 11:32:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F017310E31A;
	Tue, 13 Feb 2024 10:32:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=haloniitty.fi header.i=@haloniitty.fi header.b="02Bz8N4U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from whm50.louhi.net (whm50.louhi.net [77.240.19.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7901310E343;
 Tue, 13 Feb 2024 10:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=haloniitty.fi; s=default; h=Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=E5JrAIpbnYaWglgEM6fTqJL0DcVqvMScwS4tXv+HrBk=; b=02Bz8N4UO2PtlH4w/fjiDCkrKa
 svENhLtsJi5e/fQ9dx/62Zox0hex1Egff170zlANYG8AyV+IJZQQQsvraj3ordM+BvIT5qlgoeKqE
 40RO1VHG+QP+LHyv3ds/eGE2GJHFnk3gh+1Gy9iUs95TuCvxm/sLoH1cMn4S+m+S5TcIu0+vxs3RP
 hsStHMuccW/66mUbPCwCzNRYHLPITsgg6Af1w0g68kbJbnhvzp6Z+o09Mw1McE14YPiI4xSFwTyph
 mfO4JYLgen9DNk/mhCYs0GPekySE00XcVBNySxkIdJCEE5dK0EknTDv34AnTL29NXBhgKzbHeTmID
 O7bwD8bw==;
Received: from [194.136.85.206] (port=39056 helo=eldfell)
 by whm50.louhi.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96.2)
 (envelope-from <pekka.paalanen@haloniitty.fi>) id 1rZpEK-0004Je-1R;
 Tue, 13 Feb 2024 11:37:32 +0200
Date: Tue, 13 Feb 2024 11:37:27 +0200
From: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
To: Uma Shankar <uma.shankar@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 ville.syrjala@linux.intel.com, contact@emersion.fr, harry.wentland@amd.com,
 mwen@igalia.com, jadahl@redhat.com, sebastian.wick@redhat.com,
 shashank.sharma@amd.com, agoins@nvidia.com, joshua@froggi.es,
 mdaenzer@redhat.com, aleixpol@kde.org, xaver.hugl@gmail.com,
 victoria@system76.com, daniel@ffwll.ch, quic_naseer@quicinc.com,
 quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com,
 arthurgrillo@riseup.net, marcan@marcan.st, Liviu.Dudau@arm.com,
 sashamcintosh@google.com, sean@poorly.run
Subject: Re: [PATCH 17/28] drm/i915: Define segmented Lut and add
 capabilities to colorop
Message-ID: <20240213113727.22f9c8e5@eldfell>
In-Reply-To: <20240213064835.139464-18-uma.shankar@intel.com>
References: <20240213064835.139464-1-uma.shankar@intel.com>
 <20240213064835.139464-18-uma.shankar@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/GumYXEvH0+hIJLMx5TY1sLo";
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

--Sig_/GumYXEvH0+hIJLMx5TY1sLo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 13 Feb 2024 12:18:24 +0530
Uma Shankar <uma.shankar@intel.com> wrote:

> This defines the lut segments and create the color pipeline
>=20
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_color.c | 109 +++++++++++++++++++++
>  1 file changed, 109 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm=
/i915/display/intel_color.c
> index e223edbe4c13..223cd1ff7291 100644
> --- a/drivers/gpu/drm/i915/display/intel_color.c
> +++ b/drivers/gpu/drm/i915/display/intel_color.c
> @@ -3811,6 +3811,105 @@ static const struct intel_color_funcs ilk_color_f=
uncs =3D {
>  	.get_config =3D ilk_get_config,
>  };
> =20
> +static const struct drm_color_lut_range xelpd_degamma_hdr[] =3D {
> +	/* segment 1 */
> +	{
> +		.flags =3D (DRM_MODE_LUT_REFLECT_NEGATIVE |
> +				DRM_MODE_LUT_INTERPOLATE |
> +				DRM_MODE_LUT_NON_DECREASING),

Hi Uma,

is it a good idea to have these flags per-segment?

I would find it very strange, unusable really, if REFLECT_NEGATIVE
applied on some but not all segments, for example. Is such flexibility
really necessary in the hardware description?

> +		.count =3D 128,
> +		.input_bpc =3D 24, .output_bpc =3D 16,

The same question about input_bpc and output_bpc.

> +		.start =3D 0, .end =3D (1 << 24) - 1,
> +		.min =3D 0, .max =3D (1 << 24) - 1,
> +	},
> +	/* segment 2 */
> +	{
> +		.flags =3D (DRM_MODE_LUT_REFLECT_NEGATIVE |
> +				DRM_MODE_LUT_INTERPOLATE |
> +				DRM_MODE_LUT_REUSE_LAST |
> +				DRM_MODE_LUT_NON_DECREASING),
> +		.count =3D 1,
> +		.input_bpc =3D 24, .output_bpc =3D 16,
> +		.start =3D (1 << 24) - 1, .end =3D 1 << 24,

What if there is a gap or overlap between the previous segment .end and
the next segment .start? Is it forbidden? Will the kernel common code
verify that drivers don't make mistakes? Or IGT?


Thanks,
pq

> +		.min =3D 0, .max =3D (1 << 27) - 1,
> +	},
> +	/* Segment 3 */
> +	{
> +		.flags =3D (DRM_MODE_LUT_REFLECT_NEGATIVE |
> +				DRM_MODE_LUT_INTERPOLATE |
> +				DRM_MODE_LUT_REUSE_LAST |
> +				DRM_MODE_LUT_NON_DECREASING),
> +		.count =3D 1,
> +		.input_bpc =3D 24, .output_bpc =3D 16,
> +		.start =3D 1 << 24, .end =3D 3 << 24,
> +		.min =3D 0, .max =3D (1 << 27) - 1,
> +	},
> +	/* Segment 4 */
> +	{
> +		.flags =3D (DRM_MODE_LUT_REFLECT_NEGATIVE |
> +				DRM_MODE_LUT_INTERPOLATE |
> +				DRM_MODE_LUT_REUSE_LAST |
> +				DRM_MODE_LUT_NON_DECREASING),
> +		.count =3D 1,
> +		.input_bpc =3D 24, .output_bpc =3D 16,
> +		.start =3D 3 << 24, .end =3D 7 << 24,
> +		.min =3D 0, .max =3D (1 << 27) - 1,
> +	}
> +};
> +
> +/* FIXME input bpc? */
> +static const struct drm_color_lut_range xelpd_gamma_hdr[] =3D {
> +	/*
> +	 * ToDo: Add Segment 1
> +	 * There is an optional fine segment added with 9 lut values
> +	 * Will be added later
> +	 */
> +
> +	/* segment 2 */
> +	{
> +		.flags =3D (DRM_MODE_LUT_REFLECT_NEGATIVE |
> +				DRM_MODE_LUT_INTERPOLATE |
> +				DRM_MODE_LUT_NON_DECREASING),
> +		.count =3D 32,
> +		.input_bpc =3D 24, .output_bpc =3D 16,
> +		.start =3D 0, .end =3D (1 << 24) - 1,
> +		.min =3D 0, .max =3D (1 << 24) - 1,
> +	},
> +	/* segment 3 */
> +	{
> +		.flags =3D (DRM_MODE_LUT_REFLECT_NEGATIVE |
> +				DRM_MODE_LUT_INTERPOLATE |
> +				DRM_MODE_LUT_REUSE_LAST |
> +				DRM_MODE_LUT_NON_DECREASING),
> +		.count =3D 1,
> +		.input_bpc =3D 24, .output_bpc =3D 16,
> +		.start =3D (1 << 24) - 1, .end =3D 1 << 24,
> +		.min =3D 0, .max =3D 1 << 24,
> +	},
> +	/* Segment 4 */
> +	{
> +		.flags =3D (DRM_MODE_LUT_REFLECT_NEGATIVE |
> +				DRM_MODE_LUT_INTERPOLATE |
> +				DRM_MODE_LUT_REUSE_LAST |
> +				DRM_MODE_LUT_NON_DECREASING),
> +		.count =3D 1,
> +		.input_bpc =3D 24, .output_bpc =3D 16,
> +		.start =3D 1 << 24, .end =3D 3 << 24,
> +		.min =3D 0, .max =3D (3 << 24),
> +	},
> +	/* Segment 5 */
> +	{
> +		.flags =3D (DRM_MODE_LUT_REFLECT_NEGATIVE |
> +				DRM_MODE_LUT_INTERPOLATE |
> +				DRM_MODE_LUT_REUSE_LAST |
> +				DRM_MODE_LUT_NON_DECREASING),
> +		.count =3D 1,
> +		.input_bpc =3D 24, .output_bpc =3D 16,
> +		.start =3D 3 << 24, .end =3D 7 << 24,
> +		.min =3D 0, .max =3D (7 << 24),
> +	},
> +};
> +
>  /* TODO: Move to another file */
>  struct intel_plane_colorop *intel_colorop_alloc(void)
>  {
> @@ -3865,6 +3964,11 @@ int intel_plane_tf_pipeline_init(struct drm_plane =
*plane, struct drm_prop_enum_l
>  	if (ret)
>  		return ret;
> =20
> +	if (icl_is_hdr_plane(i915, to_intel_plane(plane)->id)) {
> +		drm_colorop_lutcaps_init(&colorop->base, plane, xelpd_degamma_hdr,
> +					 sizeof(xelpd_degamma_hdr));
> +	}
> +
>  	list->type =3D colorop->base.base.id;
>  	list->name =3D kasprintf(GFP_KERNEL, "Color Pipeline %d", colorop->base=
.base.id);
> =20
> @@ -3886,6 +3990,11 @@ int intel_plane_tf_pipeline_init(struct drm_plane =
*plane, struct drm_prop_enum_l
>  	if (ret)
>  		return ret;
> =20
> +	if (icl_is_hdr_plane(i915, to_intel_plane(plane)->id)) {
> +		drm_colorop_lutcaps_init(&colorop->base, plane, xelpd_gamma_hdr,
> +					 sizeof(xelpd_gamma_hdr));
> +	}
> +
>  	drm_colorop_set_next_property(prev_op, &colorop->base);
> =20
>  	return 0;


--Sig_/GumYXEvH0+hIJLMx5TY1sLo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmXLOFgACgkQI1/ltBGq
qqcYUxAAih8TeDOo0nAk+aQ/+bgON6KNYeHfj820ykbaPToUpU7XGsMgiRZEkkDA
4A9dgKu2Sm27les9YBF3KjxCSDK6GwnrDjnRhGXWIP2GvULhBgRlV9imy6lCMuPL
+HyqrfJUenGuNNIoAsU71cQn45woIqM/grMMtoYoX5IQ2ByTiihrImAtz3/YYCca
ze9if1NmjP62cfxUlYfh0pkwfrt/aLqDGRV61N4oOY/d8dajHZrXirLgsipCKAWi
5RxKyu/niX64mix+S1qwEXbTCzh3qKag8DsOch0FMlUGmK48/ZWJ8e102tRXneYD
m4iPZ5dsI0CzusFDYy+1n1gDobcnBlkX/CfL4p+iuab/yH929x2t7vgR07abyL7f
UYoDAXhJP0I1KEQuKqka1P/fAsujx1bzOxtK6YweCZULXSEgHNpX5dvJszMTkIs0
7q2p/wxV8Z6FBq8atrCysDBhzQHYDKbIbc2GLv7PEvOtC/Sc4zJTbiX8MX9GFmXG
BDZ44gHohNtBFMuM5GhlQpuuum8tTOS4lK/NGpAWScDEUWv/WomLiAAPTwSwyzqG
TIgCGp/z2JrQ1WMI5V8B6wmpzMR+sQ5WOWOy3zB7P3RqR6FgOFqJ7hcetKXVCWTg
HSHmKMp7BB3qrkTfSakHCVdxOAi9HWgr5CtbT3pFN9JLXThGBlo=
=ZCVa
-----END PGP SIGNATURE-----

--Sig_/GumYXEvH0+hIJLMx5TY1sLo--
