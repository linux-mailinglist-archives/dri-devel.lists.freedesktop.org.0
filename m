Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBB651D576
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 12:16:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1FA710FC93;
	Fri,  6 May 2022 10:16:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7A3410FC91;
 Fri,  6 May 2022 10:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651832190; x=1683368190;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=PBeapHGuyvUKL2y8t63Owzq067pHShGdRavhbs0+Mes=;
 b=X/uPhi18KuUgH5KZirqHCWhHZPAC6z+KTiBOUo5r/51mNg8zHJcarlBV
 rjm4vz+v6gavCMEqvwnaIo5F5F/VRWwYAUsJkVQxmtnRCuClfc32BNLOO
 Jgjabs5OkhmUlH7yOsFx+o2BAUuiobuYHfx1Cjf0BkzJRKpLskr+C8nOR
 AwaOTqRlJ6/yyZ4pH2WxUzLNkjx3EfQygyq/H0m/H8USsWPuIjhgkma5X
 ByhAcPASYLA9xrozk2Br7hJuJdq+8O34DjN8ko5zlx01yu7Epd973DUyT
 qy0ThOrFAxa9/ZW5M0XUwJosuoKAyoK+waI95Hgbm9UCBQ0SoqBs9nqcu g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="268323747"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="268323747"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 03:16:30 -0700
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="585908036"
Received: from psikora-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.157.88])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 03:16:28 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 05/25] drm/edid: keep propagating drm_edid to display info
In-Reply-To: <0997057511416dd83482468c6da9708f3ae157c8.1651830938.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1651830938.git.jani.nikula@intel.com>
 <0997057511416dd83482468c6da9708f3ae157c8.1651830938.git.jani.nikula@intel.com>
Date: Fri, 06 May 2022 13:16:25 +0300
Message-ID: <87ee17klty.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Fri, 06 May 2022, Jani Nikula <jani.nikula@intel.com> wrote:
> We'll need to propagate	drm_edid everywhere.

I seem to have copy-pasted a TAB in some of the commit messages, in a
way that does not show up in git log.

>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/drm_edid.c | 50 +++++++++++++++++++++++---------------
>  1 file changed, 31 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 946296632b2e..c9d48fbd0a76 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -2419,13 +2419,13 @@ EXPORT_SYMBOL(drm_edid_duplicate);
>  
>  /**
>   * edid_get_quirks - return quirk flags for a given EDID
> - * @edid: EDID to process
> + * @drm_edid: EDID to process
>   *
>   * This tells subsequent routines what fixes they need to apply.
>   */
> -static u32 edid_get_quirks(const struct edid *edid)
> +static u32 edid_get_quirks(const struct drm_edid *drm_edid)
>  {
> -	u32 panel_id = edid_extract_panel_id(edid);
> +	u32 panel_id = edid_extract_panel_id(drm_edid->edid);
>  	const struct edid_quirk *quirk;
>  	int i;
>  
> @@ -5448,7 +5448,7 @@ static void drm_parse_microsoft_vsdb(struct drm_connector *connector,
>  }
>  
>  static void drm_parse_cea_ext(struct drm_connector *connector,
> -			      const struct edid *edid)
> +			      const struct drm_edid *drm_edid)
>  {
>  	struct drm_display_info *info = &connector->display_info;
>  	struct drm_edid_iter edid_iter;
> @@ -5456,7 +5456,7 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
>  	struct cea_db_iter iter;
>  	const u8 *edid_ext;
>  
> -	drm_edid_iter_begin(edid, &edid_iter);
> +	drm_edid_iter_begin(drm_edid->edid, &edid_iter);
>  	drm_edid_iter_for_each(edid_ext, &edid_iter) {
>  		if (edid_ext[0] != CEA_EXT)
>  			continue;
> @@ -5477,7 +5477,7 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
>  	}
>  	drm_edid_iter_end(&edid_iter);
>  
> -	cea_db_iter_edid_begin(edid, &iter);
> +	cea_db_iter_edid_begin(drm_edid->edid, &iter);
>  	cea_db_iter_for_each(db, &iter) {
>  		/* FIXME: convert parsers to use struct cea_db */
>  		const u8 *data = (const u8 *)db;
> @@ -5523,16 +5523,15 @@ void get_monitor_range(const struct detailed_timing *timing,
>  	monitor_range->max_vfreq = range->max_vfreq;
>  }
>  
> -static
> -void drm_get_monitor_range(struct drm_connector *connector,
> -			   const struct edid *edid)
> +static void drm_get_monitor_range(struct drm_connector *connector,
> +				  const struct drm_edid *drm_edid)
>  {
>  	struct drm_display_info *info = &connector->display_info;
>  
> -	if (!version_greater(edid, 1, 1))
> +	if (!version_greater(drm_edid->edid, 1, 1))
>  		return;
>  
> -	drm_for_each_detailed_block(edid, get_monitor_range,
> +	drm_for_each_detailed_block(drm_edid->edid, get_monitor_range,
>  				    &info->monitor_range);
>  
>  	DRM_DEBUG_KMS("Supported Monitor Refresh rate range is %d Hz - %d Hz\n",
> @@ -5592,12 +5591,13 @@ static void drm_parse_vesa_mso_data(struct drm_connector *connector,
>  		    info->mso_stream_count, info->mso_pixel_overlap);
>  }
>  
> -static void drm_update_mso(struct drm_connector *connector, const struct edid *edid)
> +static void drm_update_mso(struct drm_connector *connector,
> +			   const struct drm_edid *drm_edid)
>  {
>  	const struct displayid_block *block;
>  	struct displayid_iter iter;
>  
> -	displayid_iter_edid_begin(edid, &iter);
> +	displayid_iter_edid_begin(drm_edid->edid, &iter);
>  	displayid_iter_for_each(block, &iter) {
>  		if (block->tag == DATA_BLOCK_2_VENDOR_SPECIFIC)
>  			drm_parse_vesa_mso_data(connector, block);
> @@ -5636,18 +5636,20 @@ drm_reset_display_info(struct drm_connector *connector)
>  	info->mso_pixel_overlap = 0;
>  }
>  
> -u32 drm_add_display_info(struct drm_connector *connector, const struct edid *edid)
> +static u32 update_display_info(struct drm_connector *connector,
> +			       const struct drm_edid *drm_edid)
>  {
>  	struct drm_display_info *info = &connector->display_info;
> +	const struct edid *edid = drm_edid->edid;
>  
> -	u32 quirks = edid_get_quirks(edid);
> +	u32 quirks = edid_get_quirks(drm_edid);
>  
>  	drm_reset_display_info(connector);
>  
>  	info->width_mm = edid->width_cm * 10;
>  	info->height_mm = edid->height_cm * 10;
>  
> -	drm_get_monitor_range(connector, edid);
> +	drm_get_monitor_range(connector, drm_edid);
>  
>  	if (edid->revision < 3)
>  		goto out;
> @@ -5656,7 +5658,7 @@ u32 drm_add_display_info(struct drm_connector *connector, const struct edid *edi
>  		goto out;
>  
>  	info->color_formats |= DRM_COLOR_FORMAT_RGB444;
> -	drm_parse_cea_ext(connector, edid);
> +	drm_parse_cea_ext(connector, drm_edid);
>  
>  	/*
>  	 * Digital sink with "DFP 1.x compliant TMDS" according to EDID 1.3?
> @@ -5709,7 +5711,7 @@ u32 drm_add_display_info(struct drm_connector *connector, const struct edid *edi
>  	if (edid->features & DRM_EDID_FEATURE_RGB_YCRCB422)
>  		info->color_formats |= DRM_COLOR_FORMAT_YCBCR422;
>  
> -	drm_update_mso(connector, edid);
> +	drm_update_mso(connector, drm_edid);
>  
>  out:
>  	if (quirks & EDID_QUIRK_NON_DESKTOP) {
> @@ -5721,6 +5723,16 @@ u32 drm_add_display_info(struct drm_connector *connector, const struct edid *edi
>  	return quirks;
>  }
>  
> +u32 drm_add_display_info(struct drm_connector *connector, const struct edid *edid)
> +{
> +	struct drm_edid drm_edid = {
> +		.edid = edid,
> +		.size = edid_size(edid),
> +	};
> +
> +	return update_display_info(connector, &drm_edid);
> +}
> +
>  static struct drm_display_mode *drm_mode_displayid_detailed(struct drm_device *dev,
>  							    struct displayid_detailed_timings_1 *timings,
>  							    bool type_7)
> @@ -5833,7 +5845,7 @@ static int drm_edid_connector_update(struct drm_connector *connector,
>  	 * To avoid multiple parsing of same block, lets parse that map
>  	 * from sink info, before parsing CEA modes.
>  	 */
> -	quirks = drm_add_display_info(connector, edid);
> +	quirks = update_display_info(connector, drm_edid);
>  
>  	/* Depends on info->cea_rev set by drm_add_display_info() above */
>  	drm_edid_to_eld(connector, edid);

-- 
Jani Nikula, Intel Open Source Graphics Center
