Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC81DA85A3D
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 12:39:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DFB910EB5F;
	Fri, 11 Apr 2025 10:39:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mvq9tMvh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07F6510E69C;
 Fri, 11 Apr 2025 10:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744367950; x=1775903950;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=+1BiDuPAF9rN3phTNSiZWAP+I8A+deryPxssnTz3k8U=;
 b=Mvq9tMvh8iPHsrl7EvFHt9CiJAisrVfu5TYJLntETueYGEkqHs/Yfms+
 SpGhG4fRJnU8TWjudLtnxtINTVWbABawoGB3iOfqStkT/z3Sbp3dYSg7B
 f2ZkpeoksaNKXvzWSMNmxq/pJyNHrpMsXnHi2hdB1Nv2TYdOUvc2gZiSI
 BIYO+rnxMISP0KcfDy/iiZGU21I7+9haXiKGyM8v0AY89jI8JN5FBunPm
 1f68IQV27ffIJznqe1JNwY4rEwTVJG/igbJy+25Xm/WLdjgbaTDkJj4j9
 GMeWt+7KPicr02I5Ppl6Xpatlq9BvHzUsTBM+zEPmCEOwZbsSkD0UI0oG A==;
X-CSE-ConnectionGUID: Vb4TtgukQ3+oCqNPcyp7sA==
X-CSE-MsgGUID: LhHw+ELORoaVhGBELU6vVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="45820874"
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; d="scan'208";a="45820874"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2025 03:39:09 -0700
X-CSE-ConnectionGUID: xQwb2JfLSYGk+8VEsLm9mA==
X-CSE-MsgGUID: 1eSKAJzFQJyF28T9miDiJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; d="scan'208";a="166351846"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.115])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2025 03:39:06 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com, Suraj Kandpal
 <suraj.kandpal@intel.com>
Subject: Re: [PATCH 07/13] drm/dp: Change argument type for
 drm_edp_backlight_set_level
In-Reply-To: <20250411042909.2626807-8-suraj.kandpal@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250411042909.2626807-1-suraj.kandpal@intel.com>
 <20250411042909.2626807-8-suraj.kandpal@intel.com>
Date: Fri, 11 Apr 2025 13:39:03 +0300
Message-ID: <87zfgnt22g.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 11 Apr 2025, Suraj Kandpal <suraj.kandpal@intel.com> wrote:
> Use u32 for level variable as one may need to pass value for
> DP_EDP_PANEL_TARGET_LUMINANCE_VALUE.
>
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/display/drm_dp_helper.c | 6 +++---
>  include/drm/display/drm_dp_helper.h     | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> index bb1242a1bf6b..895ed4a22fc3 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -3933,7 +3933,7 @@ EXPORT_SYMBOL(drm_dp_pcon_convert_rgb_to_ycbcr);
>   * Returns: %0 on success, negative error code on failure
>   */
>  int drm_edp_backlight_set_level(struct drm_dp_aux *aux, const struct drm_edp_backlight_info *bl,
> -				u16 level)
> +				u32 level)
>  {
>  	int ret;
>  	u8 buf[2] = { 0 };
> @@ -4047,7 +4047,7 @@ int drm_edp_backlight_enable(struct drm_dp_aux *aux, const struct drm_edp_backli
>  		return ret < 0 ? ret : -EIO;
>  	}
>  
> -	ret = drm_edp_backlight_set_level(aux, bl, level);
> +	ret = drm_edp_backlight_set_level(aux, bl, (u32)level);

What difference do you think the cast makes?

>  	if (ret < 0)
>  		return ret;
>  	ret = drm_edp_backlight_set_enable(aux, bl, true);
> @@ -4327,7 +4327,7 @@ static int dp_aux_backlight_update_status(struct backlight_device *bd)
>  			bl->enabled = true;
>  			return 0;
>  		}
> -		ret = drm_edp_backlight_set_level(bl->aux, &bl->info, brightness);
> +		ret = drm_edp_backlight_set_level(bl->aux, &bl->info, (u32)brightness);

Ditto.

>  	} else {
>  		if (bl->enabled) {
>  			drm_edp_backlight_disable(bl->aux, &bl->info);
> diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
> index 62be80417ded..6bce0176efd3 100644
> --- a/include/drm/display/drm_dp_helper.h
> +++ b/include/drm/display/drm_dp_helper.h
> @@ -853,7 +853,7 @@ drm_edp_backlight_init(struct drm_dp_aux *aux, struct drm_edp_backlight_info *bl
>  		       u16 driver_pwm_freq_hz, const u8 edp_dpcd[EDP_DISPLAY_CTL_CAP_SIZE],
>  		       u32 *current_level, u8 *current_mode, bool need_luminance);
>  int drm_edp_backlight_set_level(struct drm_dp_aux *aux, const struct drm_edp_backlight_info *bl,
> -				u16 level);
> +				u32 level);
>  int drm_edp_backlight_enable(struct drm_dp_aux *aux, const struct drm_edp_backlight_info *bl,
>  			     u16 level);
>  int drm_edp_backlight_disable(struct drm_dp_aux *aux, const struct drm_edp_backlight_info *bl);

-- 
Jani Nikula, Intel
