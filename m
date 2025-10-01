Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6DEBB02BE
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 13:32:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10725897FF;
	Wed,  1 Oct 2025 11:32:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kYOX1oSr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92C41897FF
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 11:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759318362; x=1790854362;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ZRW4asbXGJGkWNaVfAdMu4+EfkZAsQZfAc2wuIwurls=;
 b=kYOX1oSry4BQ11QBrQplnqxIx/i1UpA4Eo0WYJyV6+XI1GaFPNIOxgpl
 u5ugkjEq1sHMniAHDW7aFN0i+Ac4jA3oEhGARGrT+piPu3eI/gZx5pUaT
 wis7LLYrkdtMBT+pVCgmLpmq0FGCX8umcoTgOGyRYzPMoL+ijUt2WVxTh
 BojEOxdyLmqXEl5rjy8wtTOBxemXzUGynK4dlnbKFIk86PPaycDQHndWy
 p7PzkJ4oq8wJnYB+s7WrrQ2eMacMNAi5DcNOK+y6x8wm4ztOTyu0+wHX6
 jRpUUpPAqsVSXsgdf+m3GPn9L/L5t8eSR34+vHFR1V4sd58lCGHMVjinR g==;
X-CSE-ConnectionGUID: 2QIkKOT8Th6MWIh/a3WtWg==
X-CSE-MsgGUID: Qh51ZgUETNGWhsP/V0cYmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="65442530"
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="65442530"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 04:32:42 -0700
X-CSE-ConnectionGUID: X0+MBnSyT6+PqtKWctA93w==
X-CSE-MsgGUID: l8rZbbo/TFasTJPyOvmDqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="215889362"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 04:32:39 -0700
Date: Wed, 1 Oct 2025 14:32:36 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: dri-devel@lists.freedesktop.org, saurabhg.gupta@intel.com,
 alex.zuo@intel.com, matthew.auld@intel.com,
 himal.prasad.ghimiray@intel.com, matthew.brost@intel.com
Subject: Re: [PATCH] drm: Add drm_mode_display_size helper function
Message-ID: <aN0RVKczi2Q7XdXF@intel.com>
References: <20250930212654.146694-2-jonathan.cavitt@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250930212654.146694-2-jonathan.cavitt@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Tue, Sep 30, 2025 at 09:26:55PM +0000, Jonathan Cavitt wrote:
> Add a helper function that computes the product of hdisplay and
> vdisplay.
> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/drm_gem_vram_helper.c | 2 +-
>  drivers/gpu/drm/drm_mipi_dbi.c        | 2 +-
>  include/drm/drm_modes.h               | 5 +++++
>  3 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
> index 90760d0ca071..4ac71c34f4c6 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -967,7 +967,7 @@ drm_vram_helper_mode_valid_internal(struct drm_device *dev,
>  
>  	max_fbpages = (vmm->vram_size / 2) >> PAGE_SHIFT;
>  
> -	fbsize = mode->hdisplay * mode->vdisplay * max_bpp;

This calculation is quite inaccurate since it doesn't
consider any stride alignment requirements. Maybe it works
for a few cases, but certainly not usable on most hardware.

> +	fbsize = drm_mode_display_size(mode) * max_bpp;
>  	fbpages = DIV_ROUND_UP(fbsize, PAGE_SIZE);
>  
>  	if (fbpages > max_fbpages)
> diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
> index e33c78fc8fbd..54212bf85160 100644
> --- a/drivers/gpu/drm/drm_mipi_dbi.c
> +++ b/drivers/gpu/drm/drm_mipi_dbi.c
> @@ -691,7 +691,7 @@ int mipi_dbi_dev_init(struct mipi_dbi_dev *dbidev,
>  		      const struct drm_simple_display_pipe_funcs *funcs,
>  		      const struct drm_display_mode *mode, unsigned int rotation)
>  {
> -	size_t bufsize = mode->vdisplay * mode->hdisplay * sizeof(u16);
> +	size_t bufsize = drm_mode_display_size(mode) * sizeof(u16);
>  
>  	dbidev->drm.mode_config.preferred_depth = 16;
>  
> diff --git a/include/drm/drm_modes.h b/include/drm/drm_modes.h
> index b9bb92e4b029..775c94c55cda 100644
> --- a/include/drm/drm_modes.h
> +++ b/include/drm/drm_modes.h
> @@ -572,4 +572,9 @@ struct drm_display_mode *
>  drm_mode_create_from_cmdline_mode(struct drm_device *dev,
>  				  struct drm_cmdline_mode *cmd);
>  
> +static inline u32 drm_mode_display_size(const struct drm_display_mode *mode)

"display size" isn't really a term that gives me any kind of idea
what this does, so the name is rather poor. drm_mode_num_active_pixels()
or something might make more sense. But I'm not sure there's much
point in this helper since that value is very rarely useful for
anything.

> +{
> +	return mode->hdisplay * mode->vdisplay;
> +}
> +
>  #endif /* __DRM_MODES_H__ */
> -- 
> 2.43.0

-- 
Ville Syrjälä
Intel
