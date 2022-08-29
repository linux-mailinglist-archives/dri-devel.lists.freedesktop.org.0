Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B84E5A4508
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 10:30:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 610B610F0F5;
	Mon, 29 Aug 2022 08:30:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB72710F0F1;
 Mon, 29 Aug 2022 08:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661761800; x=1693297800;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=emlOdZQ1xWxpu+s6v72wQRjgcX1NowuQ+0xsDEBq6us=;
 b=F2khfpLZi6JBFmp8RpjA4AzzgImkkCYb7Nvb52Xmsh9yE24CDKl16jMT
 V680SA78o5uRUa0/c066X98lIzTS+s6KuKeoHQ55NxEN1qamofdyuTYGk
 M7zDoF1/kdEiviGAXMYEoVBr/hr8I8AUIhoHyJdvCxBVZA7ABYuI2KaPA
 8Q1cz0/AwPIyuw7nh6OwsCPWLSeVxWrK+FflM0zWrQXEI3kjdmzoz6o5N
 67Pf4roILWxDRuUR66fqW9nxpsLfD7kXKoK3MrYPLmQB96jjvsn99eJNg
 siNoA7VR0DgFA8OcTzwZQJSoH5BERqaTOK8JfnAoLdcIxoRrTFh8/A+bd Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10453"; a="358806790"
X-IronPort-AV: E=Sophos;i="5.93,272,1654585200"; d="scan'208";a="358806790"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2022 01:29:58 -0700
X-IronPort-AV: E=Sophos;i="5.93,272,1654585200"; d="scan'208";a="672294707"
Received: from idecesar-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.53.198])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2022 01:29:56 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 03/11] drm/edid: s/monitor_rage/vrr_range/
In-Reply-To: <20220826213501.31490-4-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220826213501.31490-1-ville.syrjala@linux.intel.com>
 <20220826213501.31490-4-ville.syrjala@linux.intel.com>
Date: Mon, 29 Aug 2022 11:29:49 +0300
Message-ID: <87bks3h2pu.fsf@intel.com>
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
Cc: Leo Li <sunpeng.li@amd.com>, intel-gfx@lists.freedesktop.org,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 27 Aug 2022, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Rename info->monitor_range to info->vrr_range to actually
> reflect its usage.
>
> Cc: Manasi Navare <manasi.d.navare@intel.com>
> Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 12 ++++-----
>  drivers/gpu/drm/drm_debugfs.c                 |  4 +--
>  drivers/gpu/drm/drm_edid.c                    | 26 +++++++++----------
>  drivers/gpu/drm/i915/display/intel_vrr.c      |  6 ++---
>  include/drm/drm_connector.h                   |  4 +--
>  5 files changed, 26 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/=
gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index e702f0d72d53..928b5b6541db 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -9921,8 +9921,8 @@ void amdgpu_dm_update_freesync_caps(struct drm_conn=
ector *connector,
>  		amdgpu_dm_connector->min_vfreq =3D 0;
>  		amdgpu_dm_connector->max_vfreq =3D 0;
>  		amdgpu_dm_connector->pixel_clock_mhz =3D 0;
> -		connector->display_info.monitor_range.min_vfreq =3D 0;
> -		connector->display_info.monitor_range.max_vfreq =3D 0;
> +		connector->display_info.vrr_range.min_vfreq =3D 0;
> +		connector->display_info.vrr_range.max_vfreq =3D 0;
>  		freesync_capable =3D false;
>=20=20
>  		goto update;
> @@ -9970,8 +9970,8 @@ void amdgpu_dm_update_freesync_caps(struct drm_conn=
ector *connector,
>  				amdgpu_dm_connector->pixel_clock_mhz =3D
>  					range->pixel_clock_mhz * 10;
>=20=20
> -				connector->display_info.monitor_range.min_vfreq =3D range->min_vfreq;
> -				connector->display_info.monitor_range.max_vfreq =3D range->max_vfreq;
> +				connector->display_info.vrr_range.min_vfreq =3D range->min_vfreq;
> +				connector->display_info.vrr_range.max_vfreq =3D range->max_vfreq;
>=20=20
>  				break;
>  			}
> @@ -9993,8 +9993,8 @@ void amdgpu_dm_update_freesync_caps(struct drm_conn=
ector *connector,
>  			if (amdgpu_dm_connector->max_vfreq - amdgpu_dm_connector->min_vfreq >=
 10)
>  				freesync_capable =3D true;
>=20=20
> -			connector->display_info.monitor_range.min_vfreq =3D vsdb_info.min_ref=
resh_rate_hz;
> -			connector->display_info.monitor_range.max_vfreq =3D vsdb_info.max_ref=
resh_rate_hz;
> +			connector->display_info.vrr_range.min_vfreq =3D vsdb_info.min_refresh=
_rate_hz;
> +			connector->display_info.vrr_range.max_vfreq =3D vsdb_info.max_refresh=
_rate_hz;
>  		}
>  	}

The amdgpu changes really beg the question why they're filling up
display_info themselves instead of relying on drm_edid.c to do that for
them.

Other than that,

Acked-by: Jani Nikula <jani.nikula@intel.com>


>=20=20
> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
> index 01ee3febb813..1437c798b122 100644
> --- a/drivers/gpu/drm/drm_debugfs.c
> +++ b/drivers/gpu/drm/drm_debugfs.c
> @@ -377,8 +377,8 @@ static int vrr_range_show(struct seq_file *m, void *d=
ata)
>  	if (connector->status !=3D connector_status_connected)
>  		return -ENODEV;
>=20=20
> -	seq_printf(m, "Min: %u\n", connector->display_info.monitor_range.min_vf=
req);
> -	seq_printf(m, "Max: %u\n", connector->display_info.monitor_range.max_vf=
req);
> +	seq_printf(m, "Min: %u\n", connector->display_info.vrr_range.min_vfreq);
> +	seq_printf(m, "Max: %u\n", connector->display_info.vrr_range.max_vfreq);
>=20=20
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index ac662495635c..4355d73632c3 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -6020,11 +6020,11 @@ static void drm_parse_cea_ext(struct drm_connecto=
r *connector,
>  }
>=20=20
>  static
> -void get_monitor_range(const struct detailed_timing *timing, void *c)
> +void get_vrr_range(const struct detailed_timing *timing, void *c)
>  {
>  	struct detailed_mode_closure *closure =3D c;
>  	struct drm_display_info *info =3D &closure->connector->display_info;
> -	struct drm_monitor_range_info *monitor_range =3D &info->monitor_range;
> +	struct drm_monitor_range_info *vrr_range =3D &info->vrr_range;
>  	const struct detailed_non_pixel *data =3D &timing->data.other_data;
>  	const struct detailed_data_monitor_range *range =3D &data->data.range;
>  	const struct edid *edid =3D closure->drm_edid->edid;
> @@ -6044,19 +6044,19 @@ void get_monitor_range(const struct detailed_timi=
ng *timing, void *c)
>  	if (range->flags !=3D DRM_EDID_RANGE_LIMITS_ONLY_FLAG)
>  		return;
>=20=20
> -	monitor_range->min_vfreq =3D range->min_vfreq;
> -	monitor_range->max_vfreq =3D range->max_vfreq;
> +	vrr_range->min_vfreq =3D range->min_vfreq;
> +	vrr_range->max_vfreq =3D range->max_vfreq;
>=20=20
>  	if (edid->revision >=3D 4) {
>  		if (data->pad2 & DRM_EDID_RANGE_OFFSET_MIN_VFREQ)
> -			monitor_range->min_vfreq +=3D 255;
> +			vrr_range->min_vfreq +=3D 255;
>  		if (data->pad2 & DRM_EDID_RANGE_OFFSET_MAX_VFREQ)
> -			monitor_range->max_vfreq +=3D 255;
> +			vrr_range->max_vfreq +=3D 255;
>  	}
>  }
>=20=20
> -static void drm_get_monitor_range(struct drm_connector *connector,
> -				  const struct drm_edid *drm_edid)
> +static void drm_get_vrr_range(struct drm_connector *connector,
> +			      const struct drm_edid *drm_edid)
>  {
>  	const struct drm_display_info *info =3D &connector->display_info;
>  	struct detailed_mode_closure closure =3D {
> @@ -6067,11 +6067,11 @@ static void drm_get_monitor_range(struct drm_conn=
ector *connector,
>  	if (!version_greater(drm_edid, 1, 1))
>  		return;
>=20=20
> -	drm_for_each_detailed_block(drm_edid, get_monitor_range, &closure);
> +	drm_for_each_detailed_block(drm_edid, get_vrr_range, &closure);
>=20=20
>  	DRM_DEBUG_KMS("Supported Monitor Refresh rate range is %d Hz - %d Hz\n",
> -		      info->monitor_range.min_vfreq,
> -		      info->monitor_range.max_vfreq);
> +		      info->vrr_range.min_vfreq,
> +		      info->vrr_range.max_vfreq);
>  }
>=20=20
>  static void drm_parse_vesa_mso_data(struct drm_connector *connector,
> @@ -6164,7 +6164,7 @@ static void drm_reset_display_info(struct drm_conne=
ctor *connector)
>  	info->edid_hdmi_ycbcr444_dc_modes =3D 0;
>=20=20
>  	info->non_desktop =3D 0;
> -	memset(&info->monitor_range, 0, sizeof(info->monitor_range));
> +	memset(&info->vrr_range, 0, sizeof(info->vrr_range));
>  	memset(&info->luminance_range, 0, sizeof(info->luminance_range));
>=20=20
>  	info->mso_stream_count =3D 0;
> @@ -6184,7 +6184,7 @@ static u32 update_display_info(struct drm_connector=
 *connector,
>  	info->width_mm =3D edid->width_cm * 10;
>  	info->height_mm =3D edid->height_cm * 10;
>=20=20
> -	drm_get_monitor_range(connector, drm_edid);
> +	drm_get_vrr_range(connector, drm_edid);
>=20=20
>  	if (edid->revision < 3)
>  		goto out;
> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i=
915/display/intel_vrr.c
> index 04250a0fec3c..15bc9b9f2b27 100644
> --- a/drivers/gpu/drm/i915/display/intel_vrr.c
> +++ b/drivers/gpu/drm/i915/display/intel_vrr.c
> @@ -38,7 +38,7 @@ bool intel_vrr_is_capable(struct intel_connector *conne=
ctor)
>  	}
>=20=20
>  	return HAS_VRR(i915) &&
> -		info->monitor_range.max_vfreq - info->monitor_range.min_vfreq > 10;
> +		info->vrr_range.max_vfreq - info->vrr_range.min_vfreq > 10;
>  }
>=20=20
>  void
> @@ -117,9 +117,9 @@ intel_vrr_compute_config(struct intel_crtc_state *crt=
c_state,
>  		return;
>=20=20
>  	vmin =3D DIV_ROUND_UP(adjusted_mode->crtc_clock * 1000,
> -			    adjusted_mode->crtc_htotal * info->monitor_range.max_vfreq);
> +			    adjusted_mode->crtc_htotal * info->vrr_range.max_vfreq);
>  	vmax =3D adjusted_mode->crtc_clock * 1000 /
> -		(adjusted_mode->crtc_htotal * info->monitor_range.min_vfreq);
> +		(adjusted_mode->crtc_htotal * info->vrr_range.min_vfreq);
>=20=20
>  	vmin =3D max_t(int, vmin, adjusted_mode->crtc_vtotal);
>  	vmax =3D max_t(int, vmax, adjusted_mode->crtc_vtotal);
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 56aee949c6fa..7ae23d691cd6 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -636,9 +636,9 @@ struct drm_display_info {
>  	bool non_desktop;
>=20=20
>  	/**
> -	 * @monitor_range: Frequency range supported by monitor range descriptor
> +	 * @vrr_range: Refresh rate range supported by monitor for VRR
>  	 */
> -	struct drm_monitor_range_info monitor_range;
> +	struct drm_monitor_range_info vrr_range;
>=20=20
>  	/**
>  	 * @luminance_range: Luminance range supported by panel

--=20
Jani Nikula, Intel Open Source Graphics Center
