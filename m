Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 356616722C0
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 17:14:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8114610E783;
	Wed, 18 Jan 2023 16:14:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1E6310E783;
 Wed, 18 Jan 2023 16:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674058445; x=1705594445;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=c1OHlYRyqptiaXx/47gi824BVXE+UicpvTox63/eXK4=;
 b=diSt7DUpKvb8tDlF0/OoZYNX8y5Da95wa0pENgrxE8dlRQe63mqBGKB/
 z3msOXK0pu7lKQTa1qOVgC0b7TbHZ6DJxD4XkCqw6rCJkXdgiCXGrw8pv
 5eHLkclpypwpEPmvLs8T9ozdHv26G/i8IHMtPnNdofFBQFGYhHam+MgNE
 2wWfYiYscX99+32j7fTiSKlhLJHU9w6QQ2V/54Mrsu2+H1toNBHBviUUO
 hShIAcuNtrgMhv+qqT8LzIs/skDasUoeBU4epwuJmbVVyYqk1Oiwr2Vsc
 4bKWGPKh6cu4r53AcS15y3KLNQzklEsE3y3bqaQDXQSQ5zOpu4A+f/azj A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="326284951"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="326284951"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 08:14:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="692056058"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="692056058"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.55])
 by orsmga001.jf.intel.com with SMTP; 18 Jan 2023 08:14:02 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 18 Jan 2023 18:14:01 +0200
Date: Wed, 18 Jan 2023 18:14:01 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v7 14/22] drm/edid: merge ELD handling to
 update_display_info()
Message-ID: <Y8gayYKqDaJwLyiR@intel.com>
References: <cover.1672826282.git.jani.nikula@intel.com>
 <1f2e7424b998fbcdd9cea488e7d6d7cbb26c460f.1672826282.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1f2e7424b998fbcdd9cea488e7d6d7cbb26c460f.1672826282.git.jani.nikula@intel.com>
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

On Wed, Jan 04, 2023 at 12:05:29PM +0200, Jani Nikula wrote:
> Simplify display info update by merging ELD handling as well as clearing
> of the data in update_display_info().
> 
> The connector->eld really should be moved under display_info altogether,
> but that's for another time.
> 
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/drm_edid.c | 28 +++++++++++++---------------
>  1 file changed, 13 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 6bc0432046c8..810a5fca398a 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -5489,8 +5489,6 @@ static void drm_edid_to_eld(struct drm_connector *connector,
>  	int total_sad_count = 0;
>  	int mnl;
>  
> -	clear_eld(connector);
> -
>  	if (!drm_edid)
>  		return;
>  
> @@ -6465,9 +6463,15 @@ static void update_display_info(struct drm_connector *connector,
>  				const struct drm_edid *drm_edid)
>  {
>  	struct drm_display_info *info = &connector->display_info;
> -	const struct edid *edid = drm_edid->edid;
> +	const struct edid *edid;
>  
>  	drm_reset_display_info(connector);
> +	clear_eld(connector);
> +
> +	if (!drm_edid)
> +		return;
> +
> +	edid = drm_edid->edid;
>  
>  	info->quirks = edid_get_quirks(drm_edid);
>  
> @@ -6550,6 +6554,9 @@ static void update_display_info(struct drm_connector *connector,
>  
>  	if (info->quirks & EDID_QUIRK_CAP_DSC_15BPP)
>  		info->max_dsc_bpp = 15;
> +
> +	/* Depends on info->cea_rev set by drm_parse_cea_ext() above */
> +	drm_edid_to_eld(connector, drm_edid);
>  }
>  
>  static struct drm_display_mode *drm_mode_displayid_detailed(struct drm_device *dev,
> @@ -6650,12 +6657,6 @@ static int _drm_edid_connector_update(struct drm_connector *connector,
>  	struct drm_display_info *info = &connector->display_info;
>  	int num_modes = 0;
>  
> -	if (!drm_edid) {
> -		drm_reset_display_info(connector);
> -		clear_eld(connector);
> -		return 0;
> -	}
> -
>  	/*
>  	 * CEA-861-F adds ycbcr capability map block, for HDMI 2.0 sinks.
>  	 * To avoid multiple parsing of same block, lets parse that map
> @@ -6663,8 +6664,8 @@ static int _drm_edid_connector_update(struct drm_connector *connector,
>  	 */
>  	update_display_info(connector, drm_edid);
>  
> -	/* Depends on info->cea_rev set by update_display_info() above */
> -	drm_edid_to_eld(connector, drm_edid);
> +	if (!drm_edid)
> +		return 0;
>  
>  	/*
>  	 * EDID spec says modes should be preferred in this order:
> @@ -6801,10 +6802,7 @@ static int _drm_connector_update_edid_property(struct drm_connector *connector,
>  	 * that it seems better to duplicate it rather than attempt to ensure
>  	 * some arbitrary ordering of calls.
>  	 */
> -	if (drm_edid)
> -		update_display_info(connector, drm_edid);
> -	else
> -		drm_reset_display_info(connector);
> +	update_display_info(connector, drm_edid);
>  
>  	_drm_update_tile_info(connector, drm_edid);
>  
> -- 
> 2.34.1

-- 
Ville Syrjälä
Intel
