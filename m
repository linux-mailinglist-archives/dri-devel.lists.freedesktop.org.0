Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C0F5A4550
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 10:40:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8045510F103;
	Mon, 29 Aug 2022 08:39:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2DD510F101;
 Mon, 29 Aug 2022 08:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661762385; x=1693298385;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=UiJbI4zO9EVgiTBtYLAfJ7ueMHRUW5JZ5Nj7HmLM18A=;
 b=hU54HAamAxVjFdF/Vr6g20iMHsInJ+Sq+2BBXEvrqQ17MToIjDGU8Qc/
 YA8IxqUr7aVKQjgzGF9nRXtjdI6QG6YnE4+7IAFnZLdPnvqZc3Cwj1VDr
 HtfUYzGi3PGvuE4K+AUz4kysi2k2sL17Sln3PpKzM8E3jzx+S2cLmu12/
 5Xi4SQL08akM4mZBzzVukb3EGAUMp/unIhVd1nOhav5jmUSyePChVJ0yz
 7+U5t9lFo8Al5cw49W74YPPykuKkmXOkagrb189KUIbk4G0Ca9ukladud
 imgyunMAU3cYy55Jdsv52XPAn/MNmJX7sM4kMcMP0y150ll9ZAObCACV9 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10453"; a="356559381"
X-IronPort-AV: E=Sophos;i="5.93,272,1654585200"; d="scan'208";a="356559381"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2022 01:39:45 -0700
X-IronPort-AV: E=Sophos;i="5.93,272,1654585200"; d="scan'208";a="672297545"
Received: from idecesar-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.53.198])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2022 01:39:43 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 04/11] drm/edid: Define more flags
In-Reply-To: <20220826213501.31490-5-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220826213501.31490-1-ville.syrjala@linux.intel.com>
 <20220826213501.31490-5-ville.syrjala@linux.intel.com>
Date: Mon, 29 Aug 2022 11:39:36 +0300
Message-ID: <878rn7h29j.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 27 Aug 2022, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Replace a bunch of hex constants with proper definitions.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/drm_edid.c | 18 +++++++++---------
>  include/drm/drm_edid.h     | 14 +++++++++-----
>  2 files changed, 18 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 4355d73632c3..856d304a1354 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -2984,7 +2984,7 @@ is_rb(const struct detailed_timing *descriptor, voi=
d *data)
>  	BUILD_BUG_ON(offsetof(typeof(*descriptor), data.other_data.data.range.f=
ormula.cvt.flags) !=3D 15);
>=20=20
>  	if (descriptor->data.other_data.data.range.flags =3D=3D DRM_EDID_CVT_SU=
PPORT_FLAG &&
> -	    descriptor->data.other_data.data.range.formula.cvt.flags & 0x10)
> +	    descriptor->data.other_data.data.range.formula.cvt.flags & DRM_EDID=
_CVT_FLAGS_REDUCED_BLANKING)
>  		*res =3D true;
>  }
>=20=20
> @@ -3012,7 +3012,7 @@ find_gtf2(const struct detailed_timing *descriptor,=
 void *data)
>=20=20
>  	BUILD_BUG_ON(offsetof(typeof(*descriptor), data.other_data.data.range.f=
lags) !=3D 10);
>=20=20
> -	if (descriptor->data.other_data.data.range.flags =3D=3D 0x02)
> +	if (descriptor->data.other_data.data.range.flags =3D=3D DRM_EDID_SECOND=
ARY_GTF_SUPPORT_FLAG)
>  		*res =3D descriptor;
>  }
>=20=20
> @@ -3415,7 +3415,7 @@ range_pixel_clock(const struct edid *edid, const u8=
 *t)
>  		return 0;
>=20=20
>  	/* 1.4 with CVT support gives us real precision, yay */
> -	if (edid->revision >=3D 4 && t[10] =3D=3D 0x04)
> +	if (edid->revision >=3D 4 && t[10] =3D=3D DRM_EDID_CVT_SUPPORT_FLAG)
>  		return (t[9] * 10000) - ((t[12] >> 2) * 250);
>=20=20
>  	/* 1.3 is pathetic, so fuzz up a bit */
> @@ -3441,7 +3441,7 @@ static bool mode_in_range(const struct drm_display_=
mode *mode,
>  			return false;
>=20=20
>  	/* 1.4 max horizontal check */
> -	if (edid->revision >=3D 4 && t[10] =3D=3D 0x04)
> +	if (edid->revision >=3D 4 && t[10] =3D=3D DRM_EDID_CVT_SUPPORT_FLAG)
>  		if (t[13] && mode->hdisplay > 8 * (t[13] + (256 * (t[12]&0x3))))
>  			return false;
>=20=20
> @@ -3581,13 +3581,13 @@ do_inferred_modes(const struct detailed_timing *t=
iming, void *c)
>  		return; /* GTF not defined yet */
>=20=20
>  	switch (range->flags) {
> -	case 0x02: /* secondary gtf, XXX could do more */
> -	case 0x00: /* default gtf */
> +	case DRM_EDID_SECONDARY_GTF_SUPPORT_FLAG: /* XXX could do more */
> +	case DRM_EDID_DEFAULT_GTF_SUPPORT_FLAG:
>  		closure->modes +=3D drm_gtf_modes_for_range(closure->connector,
>  							  closure->drm_edid,
>  							  timing);
>  		break;
> -	case 0x04: /* cvt, only in 1.4+ */
> +	case DRM_EDID_CVT_SUPPORT_FLAG:
>  		if (!version_greater(closure->drm_edid, 1, 3))
>  			break;
>=20=20
> @@ -3595,7 +3595,7 @@ do_inferred_modes(const struct detailed_timing *tim=
ing, void *c)
>  							  closure->drm_edid,
>  							  timing);
>  		break;
> -	case 0x01: /* just the ranges, no formula */
> +	case DRM_EDID_RANGE_LIMITS_ONLY_FLAG:
>  	default:
>  		break;
>  	}
> @@ -6393,7 +6393,7 @@ static int _drm_edid_connector_update(struct drm_co=
nnector *connector,
>  	num_modes +=3D add_cea_modes(connector, drm_edid);
>  	num_modes +=3D add_alternate_cea_modes(connector, drm_edid);
>  	num_modes +=3D add_displayid_detailed_modes(connector, drm_edid);
> -	if (drm_edid->edid->features & DRM_EDID_FEATURE_DEFAULT_GTF)
> +	if (drm_edid->edid->features & DRM_EDID_FEATURE_CONTINUOUS_FREQ)
>  		num_modes +=3D add_inferred_modes(connector, drm_edid);
>=20=20
>  	if (quirks & (EDID_QUIRK_PREFER_LARGE_60 | EDID_QUIRK_PREFER_LARGE_75))
> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> index 1ed61e2b30a4..429735b91f63 100644
> --- a/include/drm/drm_edid.h
> +++ b/include/drm/drm_edid.h
> @@ -97,10 +97,13 @@ struct detailed_data_string {
>  #define DRM_EDID_RANGE_OFFSET_MIN_HFREQ (1 << 2) /* 1.4 */
>  #define DRM_EDID_RANGE_OFFSET_MAX_HFREQ (1 << 3) /* 1.4 */
>=20=20
> -#define DRM_EDID_DEFAULT_GTF_SUPPORT_FLAG   0x00
> -#define DRM_EDID_RANGE_LIMITS_ONLY_FLAG     0x01
> -#define DRM_EDID_SECONDARY_GTF_SUPPORT_FLAG 0x02
> -#define DRM_EDID_CVT_SUPPORT_FLAG           0x04
> +#define DRM_EDID_DEFAULT_GTF_SUPPORT_FLAG   0x00 /* 1.3 */
> +#define DRM_EDID_RANGE_LIMITS_ONLY_FLAG     0x01 /* 1.4 */
> +#define DRM_EDID_SECONDARY_GTF_SUPPORT_FLAG 0x02 /* 1.3 */
> +#define DRM_EDID_CVT_SUPPORT_FLAG           0x04 /* 1.4 */
> +
> +#define DRM_EDID_CVT_FLAGS_STANDARD_BLANKING (1 << 3)
> +#define DRM_EDID_CVT_FLAGS_REDUCED_BLANKING  (1 << 4)
>=20=20
>  struct detailed_data_monitor_range {
>  	u8 min_vfreq;
> @@ -206,7 +209,8 @@ struct detailed_timing {
>  #define DRM_EDID_DIGITAL_TYPE_DP       (5 << 0) /* 1.4 */
>  #define DRM_EDID_DIGITAL_DFP_1_X       (1 << 0) /* 1.3 */
>=20=20
> -#define DRM_EDID_FEATURE_DEFAULT_GTF      (1 << 0)
> +#define DRM_EDID_FEATURE_DEFAULT_GTF      (1 << 0) /* 1.2 */
> +#define DRM_EDID_FEATURE_CONTINUOUS_FREQ  (1 << 0) /* 1.4 */
>  #define DRM_EDID_FEATURE_PREFERRED_TIMING (1 << 1)
>  #define DRM_EDID_FEATURE_STANDARD_COLOR   (1 << 2)
>  /* If analog */

--=20
Jani Nikula, Intel Open Source Graphics Center
