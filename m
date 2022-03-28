Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 375EF4E91A9
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 11:45:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E7F010E613;
	Mon, 28 Mar 2022 09:45:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04A5E10E161;
 Mon, 28 Mar 2022 09:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648460701; x=1679996701;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=zyYJu1VSsMEPPSNPsvpGdaUvX2UfOqlNWjej0mt3+yU=;
 b=Sd6v4pclMo0bRPv+5CnSZYpSB00fsOe+e7s5mOVzbqo/CSnuY2+8XFfZ
 CjH2aQpeEaysO/c7TKIncq2ejnfTzDoct99CcUbBGTHUFQl1f+bPb7UW9
 OlY+MT/f9+jt29mhADZey6Bq0gpRltbkc2Ezrx027jZgi5I1wAX2Vq66x
 EHzWLV1eePb49dRda+TGPepLvbjKnMxb3f79g+lPXQ39B1X90dMdIwHPO
 ZYgjRN1+UjoavXzErM0VtQ6h8YSIPLuASN/iUgnidRyvxs7H3B5n5n3as
 UKhXi9ujaA5Z9KPvAB5oEahBHLZZnYqiYGgMGTaeexyWfiaUlUfpcM6mi Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10299"; a="258674173"
X-IronPort-AV: E=Sophos;i="5.90,217,1643702400"; d="scan'208";a="258674173"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 02:44:56 -0700
X-IronPort-AV: E=Sophos;i="5.90,217,1643702400"; d="scan'208";a="563494106"
Received: from aysivtso-mobl.ccr.corp.intel.com (HELO localhost)
 ([10.252.62.56])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 02:44:53 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 03/11] drm/edid: slightly restructure timing and
 non-timing descriptor structs
In-Reply-To: <04c8140a780dc02155a16d8acc64dbce756739bb.1648458971.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1648458971.git.jani.nikula@intel.com>
 <04c8140a780dc02155a16d8acc64dbce756739bb.1648458971.git.jani.nikula@intel.com>
Date: Mon, 28 Mar 2022 12:44:45 +0300
Message-ID: <874k3ih0mq.fsf@intel.com>
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
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 28 Mar 2022, Jani Nikula <jani.nikula@intel.com> wrote:
> The pixel clock is conceptually part of the detailed timings, while it's
> just zero padding for display descriptors. Modify the structures to
> reflect this. Rename struct detailed_non_pixel to
> edid_display_descriptor to better reflect spec while at it. (Further
> struct renames are left for follow-up work.)
>
> Suggested-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

This one's missing:

Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: amd-gfx@lists.freedesktop.org

> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  6 +++---
>  drivers/gpu/drm/drm_edid.c                        | 12 ++++++------
>  include/drm/drm_edid.h                            |  9 +++++----
>  3 files changed, 14 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/=
gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index b30656959fd8..e477f4b42b6b 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -11537,7 +11537,7 @@ void amdgpu_dm_update_freesync_caps(struct drm_co=
nnector *connector,
>  {
>  	int i =3D 0;
>  	struct detailed_timing *timing;
> -	struct detailed_non_pixel *data;
> +	struct edid_display_descriptor *data;
>  	struct detailed_data_monitor_range *range;
>  	struct amdgpu_dm_connector *amdgpu_dm_connector =3D
>  			to_amdgpu_dm_connector(connector);
> @@ -11592,7 +11592,7 @@ void amdgpu_dm_update_freesync_caps(struct drm_co=
nnector *connector,
>  			for (i =3D 0; i < 4; i++) {
>=20=20
>  				timing	=3D &edid->detailed_timings[i];
> -				data	=3D &timing->data.other_data;
> +				data	=3D &timing->data.descriptor;
>  				range	=3D &data->data.range;
>  				/*
>  				 * Check if monitor has continuous frequency mode
> @@ -11629,7 +11629,7 @@ void amdgpu_dm_update_freesync_caps(struct drm_co=
nnector *connector,
>  		i =3D parse_hdmi_amd_vsdb(amdgpu_dm_connector, edid, &vsdb_info);
>  		if (i >=3D 0 && vsdb_info.freesync_supported) {
>  			timing  =3D &edid->detailed_timings[i];
> -			data    =3D &timing->data.other_data;
> +			data    =3D &timing->data.descriptor;
>=20=20
>  			amdgpu_dm_connector->min_vfreq =3D vsdb_info.min_refresh_rate_hz;
>  			amdgpu_dm_connector->max_vfreq =3D vsdb_info.max_refresh_rate_hz;
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 13d05062d68c..ac80681d64f6 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -2742,7 +2742,7 @@ static struct drm_display_mode *drm_mode_detailed(s=
truct drm_device *dev,
>  	if (quirks & EDID_QUIRK_135_CLOCK_TOO_HIGH)
>  		mode->clock =3D 1088 * 10;
>  	else
> -		mode->clock =3D le16_to_cpu(timing->pixel_clock) * 10;
> +		mode->clock =3D le16_to_cpu(pt->pixel_clock) * 10;
>=20=20
>  	mode->hdisplay =3D hactive;
>  	mode->hsync_start =3D mode->hdisplay + hsync_offset;
> @@ -2984,7 +2984,7 @@ static void
>  do_inferred_modes(struct detailed_timing *timing, void *c)
>  {
>  	struct detailed_mode_closure *closure =3D c;
> -	struct detailed_non_pixel *data =3D &timing->data.other_data;
> +	struct edid_display_descriptor *data =3D &timing->data.descriptor;
>  	struct detailed_data_monitor_range *range =3D &data->data.range;
>=20=20
>  	if (!is_display_descriptor((const u8 *)timing, EDID_DETAIL_MONITOR_RANG=
E))
> @@ -3117,7 +3117,7 @@ static void
>  do_standard_modes(struct detailed_timing *timing, void *c)
>  {
>  	struct detailed_mode_closure *closure =3D c;
> -	struct detailed_non_pixel *data =3D &timing->data.other_data;
> +	struct edid_display_descriptor *data =3D &timing->data.descriptor;
>  	struct drm_connector *connector =3D closure->connector;
>  	struct edid *edid =3D closure->edid;
>  	int i;
> @@ -3187,7 +3187,7 @@ static int drm_cvt_modes(struct drm_connector *conn=
ector,
>  	for (i =3D 0; i < 4; i++) {
>  		int width, height;
>=20=20
> -		cvt =3D &(timing->data.other_data.data.cvt[i]);
> +		cvt =3D &(timing->data.descriptor.data.cvt[i]);
>=20=20
>  		if (!memcmp(cvt->code, empty, 3))
>  			continue;
> @@ -4494,7 +4494,7 @@ monitor_name(struct detailed_timing *t, void *data)
>  	if (!is_display_descriptor((const u8 *)t, EDID_DETAIL_MONITOR_NAME))
>  		return;
>=20=20
> -	*(u8 **)data =3D t->data.other_data.data.str.str;
> +	*(u8 **)data =3D t->data.descriptor.data.str.str;
>  }
>=20=20
>  static int get_monitor_name(struct edid *edid, char name[13])
> @@ -5223,7 +5223,7 @@ void get_monitor_range(struct detailed_timing *timi=
ng,
>  		       void *info_monitor_range)
>  {
>  	struct drm_monitor_range_info *monitor_range =3D info_monitor_range;
> -	const struct detailed_non_pixel *data =3D &timing->data.other_data;
> +	const struct edid_display_descriptor *data =3D &timing->data.descriptor;
>  	const struct detailed_data_monitor_range *range =3D &data->data.range;
>=20=20
>  	if (!is_display_descriptor((const u8 *)timing, EDID_DETAIL_MONITOR_RANG=
E))
> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> index 144c495b99c4..8e322ef173a8 100644
> --- a/include/drm/drm_edid.h
> +++ b/include/drm/drm_edid.h
> @@ -68,6 +68,7 @@ struct std_timing {
>=20=20
>  /* If detailed data is pixel timing */
>  struct detailed_pixel_timing {
> +	__le16 pixel_clock; /* non-zero, need to multiply by 10 KHz */
>  	u8 hactive_lo;
>  	u8 hblank_lo;
>  	u8 hactive_hblank_hi;
> @@ -142,8 +143,9 @@ struct cvt_timing {
>  	u8 code[3];
>  } __attribute__((packed));
>=20=20
> -struct detailed_non_pixel {
> -	u8 pad1;
> +struct edid_display_descriptor {
> +	u16 pad0; /* 0 for Display Descriptor */
> +	u8 pad1; /* 0 for Display Descriptor */
>  	u8 type; /* ff=3Dserial, fe=3Dstring, fd=3Dmonitor range, fc=3Dmonitor =
name
>  		    fb=3Dcolor point data, fa=3Dstandard timing data,
>  		    f9=3Dundefined, f8=3Dmfg. reserved */
> @@ -168,10 +170,9 @@ struct detailed_non_pixel {
>  #define EDID_DETAIL_MONITOR_SERIAL 0xff
>=20=20
>  struct detailed_timing {
> -	__le16 pixel_clock; /* need to multiply by 10 KHz */
>  	union {
>  		struct detailed_pixel_timing pixel_data;
> -		struct detailed_non_pixel other_data;
> +		struct edid_display_descriptor descriptor;
>  	} data;
>  } __attribute__((packed));

--=20
Jani Nikula, Intel Open Source Graphics Center
