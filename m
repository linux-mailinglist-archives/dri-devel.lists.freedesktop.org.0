Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5B467228F
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 17:09:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5179E10E784;
	Wed, 18 Jan 2023 16:09:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ABDA10E775;
 Wed, 18 Jan 2023 16:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674058175; x=1705594175;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=DCnruQM6yNxK7tEtP85SnbPHlJ8SKSv60Myf10xDgvo=;
 b=V8RESWkxJuLFkAd0f+4NAg0dHEQ9KnQD2Tshx4gYGBw96EHbOW+6B/aN
 f6mU3VHnti9IlmoASI1tAFgOnuOxIg6fZO7WCSiZPhVYLzYcQ9pDvJrGz
 zMx3DjD6Jsy2+nT8+gV04uVyBbu7PtjF9EJD+L+mZDhnrUOjjU1si5l46
 23sME3Mp8V/2sbZtZwXAZPqVFWfBJNVj5uFOVmphK5mvHcIctIaNtvs3g
 l+JFazfUvSfycOHIjiM+VgIBDIi2FQ0XqwUDmg7s1gWm1CxwCAh7/yTBe
 urlqvjvuvRUPZALpX5gGph7IAFuUMLFBdGE+NpR6fCH9tdE7TeYP/hHU9 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="326283410"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="326283410"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 08:09:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="692053868"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="692053868"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.55])
 by orsmga001.jf.intel.com with SMTP; 18 Jan 2023 08:09:30 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 18 Jan 2023 18:09:29 +0200
Date: Wed, 18 Jan 2023 18:09:29 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v7 12/22] drm/edid: store quirks in display info
Message-ID: <Y8gZuW7MX1xlXlpm@intel.com>
References: <cover.1672826282.git.jani.nikula@intel.com>
 <819b908f64ad2d158245917f436f24d33a65b95d.1672826282.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <819b908f64ad2d158245917f436f24d33a65b95d.1672826282.git.jani.nikula@intel.com>
X-Patchwork-Hint: comment
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 04, 2023 at 12:05:27PM +0200, Jani Nikula wrote:
> Although the quirks are internal to EDID parsing, it'll be helpful to
> store them in display info to avoid having to pass them around.
> 
> This will also help separate adding probed modes (which needs the
> quirks) from updating display info.
> 
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/drm_edid.c  | 42 ++++++++++++++++++-------------------
>  include/drm/drm_connector.h |  5 +++++
>  2 files changed, 26 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 5cb1d36ce48a..fd8d056e38c1 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -6461,18 +6461,20 @@ static void drm_reset_display_info(struct drm_connector *connector)
>  	kfree(info->vics);
>  	info->vics = NULL;
>  	info->vics_len = 0;
> +
> +	info->quirks = 0;
>  }
>  
> -static u32 update_display_info(struct drm_connector *connector,
> -			       const struct drm_edid *drm_edid)
> +static void update_display_info(struct drm_connector *connector,
> +				const struct drm_edid *drm_edid)
>  {
>  	struct drm_display_info *info = &connector->display_info;
>  	const struct edid *edid = drm_edid->edid;
>  
> -	u32 quirks = edid_get_quirks(drm_edid);
> -
>  	drm_reset_display_info(connector);
>  
> +	info->quirks = edid_get_quirks(drm_edid);
> +
>  	info->width_mm = edid->width_cm * 10;
>  	info->height_mm = edid->height_cm * 10;
>  
> @@ -6543,17 +6545,15 @@ static u32 update_display_info(struct drm_connector *connector,
>  	drm_update_mso(connector, drm_edid);
>  
>  out:
> -	if (quirks & EDID_QUIRK_NON_DESKTOP) {
> +	if (info->quirks & EDID_QUIRK_NON_DESKTOP) {
>  		drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] Non-desktop display%s\n",
>  			    connector->base.id, connector->name,
>  			    info->non_desktop ? " (redundant quirk)" : "");
>  		info->non_desktop = true;
>  	}
>  
> -	if (quirks & EDID_QUIRK_CAP_DSC_15BPP)
> +	if (info->quirks & EDID_QUIRK_CAP_DSC_15BPP)
>  		info->max_dsc_bpp = 15;
> -
> -	return quirks;
>  }
>  
>  static struct drm_display_mode *drm_mode_displayid_detailed(struct drm_device *dev,
> @@ -6651,8 +6651,8 @@ static int add_displayid_detailed_modes(struct drm_connector *connector,
>  static int _drm_edid_connector_update(struct drm_connector *connector,
>  				      const struct drm_edid *drm_edid)
>  {
> +	struct drm_display_info *info = &connector->display_info;
>  	int num_modes = 0;
> -	u32 quirks;
>  
>  	if (!drm_edid) {
>  		drm_reset_display_info(connector);
> @@ -6665,7 +6665,7 @@ static int _drm_edid_connector_update(struct drm_connector *connector,
>  	 * To avoid multiple parsing of same block, lets parse that map
>  	 * from sink info, before parsing CEA modes.
>  	 */
> -	quirks = update_display_info(connector, drm_edid);
> +	update_display_info(connector, drm_edid);
>  
>  	/* Depends on info->cea_rev set by update_display_info() above */
>  	drm_edid_to_eld(connector, drm_edid);
> @@ -6684,7 +6684,7 @@ static int _drm_edid_connector_update(struct drm_connector *connector,
>  	 *
>  	 * XXX order for additional mode types in extension blocks?
>  	 */
> -	num_modes += add_detailed_modes(connector, drm_edid, quirks);
> +	num_modes += add_detailed_modes(connector, drm_edid, info->quirks);
>  	num_modes += add_cvt_modes(connector, drm_edid);
>  	num_modes += add_standard_modes(connector, drm_edid);
>  	num_modes += add_established_modes(connector, drm_edid);
> @@ -6694,20 +6694,20 @@ static int _drm_edid_connector_update(struct drm_connector *connector,
>  	if (drm_edid->edid->features & DRM_EDID_FEATURE_CONTINUOUS_FREQ)
>  		num_modes += add_inferred_modes(connector, drm_edid);
>  
> -	if (quirks & (EDID_QUIRK_PREFER_LARGE_60 | EDID_QUIRK_PREFER_LARGE_75))
> -		edid_fixup_preferred(connector, quirks);
> +	if (info->quirks & (EDID_QUIRK_PREFER_LARGE_60 | EDID_QUIRK_PREFER_LARGE_75))
> +		edid_fixup_preferred(connector, info->quirks);
>  
> -	if (quirks & EDID_QUIRK_FORCE_6BPC)
> -		connector->display_info.bpc = 6;
> +	if (info->quirks & EDID_QUIRK_FORCE_6BPC)
> +		info->bpc = 6;
>  
> -	if (quirks & EDID_QUIRK_FORCE_8BPC)
> -		connector->display_info.bpc = 8;
> +	if (info->quirks & EDID_QUIRK_FORCE_8BPC)
> +		info->bpc = 8;
>  
> -	if (quirks & EDID_QUIRK_FORCE_10BPC)
> -		connector->display_info.bpc = 10;
> +	if (info->quirks & EDID_QUIRK_FORCE_10BPC)
> +		info->bpc = 10;
>  
> -	if (quirks & EDID_QUIRK_FORCE_12BPC)
> -		connector->display_info.bpc = 12;
> +	if (info->quirks & EDID_QUIRK_FORCE_12BPC)
> +		info->bpc = 12;
>  
>  	return num_modes;
>  }
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 1c26c4e72c62..7b5048516185 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -728,6 +728,11 @@ struct drm_display_info {
>  	 * @vics_len: Number of elements in vics. Internal to EDID parsing.
>  	 */
>  	int vics_len;
> +
> +	/**
> +	 * @quirks: EDID based quirks. Internal to EDID parsing.
> +	 */
> +	u32 quirks;
>  };
>  
>  int drm_display_info_set_bus_formats(struct drm_display_info *info,
> -- 
> 2.34.1

-- 
Ville Syrjälä
Intel
