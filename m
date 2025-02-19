Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4B3A3C844
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 20:09:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5107410E05B;
	Wed, 19 Feb 2025 19:09:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d75VmJtC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E89B410E05B;
 Wed, 19 Feb 2025 19:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739992150; x=1771528150;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=kNqcSh7BzpqpUal3hMylCom0ekgFe32NLAJkgkBadn0=;
 b=d75VmJtCDo9k+Up/UNwIVNGn14oH5G6BdtYvyDjaQPRr0lZNQqcOWU8u
 hLq3f7JjlDsAm6TUW1qvjdVIrhB7JfEoQziaBFsQseYwVOxW6j0hBjOsy
 i+taE23USxk3BaTGrWT92eu0WdMsQ7qmGYFgOYKSNAMmWb9ZR/OL1OklN
 O5OFEQFIKVTjAsy4j6RxpZ+gAtNa92PpMMdKTAJs3HIw0j87aWjOBcmZK
 X5LhlainCDhl1/IkIVfhfemzZla8vG0lp7bBFAr8dhsuMMhf932fYcq4p
 S0dooWddQtYhj3R3FymaVMUVzI9lNB67CV/Betue/a4s18N+RHYY+wt8w g==;
X-CSE-ConnectionGUID: Yl2cAGhOQaO2iNleYvEcTg==
X-CSE-MsgGUID: v6Rrvc7TRbSnS2VDTH1rpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="52154308"
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; d="scan'208";a="52154308"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 11:09:08 -0800
X-CSE-ConnectionGUID: XGjvoGL0QU+wuF2i7K+86Q==
X-CSE-MsgGUID: /Ft0+EDFQ4SaYlKZ9i30fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="120014613"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orviesa005.jf.intel.com with SMTP; 19 Feb 2025 11:08:47 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 19 Feb 2025 21:08:40 +0200
Date: Wed, 19 Feb 2025 21:08:40 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Arun R Murthy <arun.r.murthy@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, chaitanya.kumar.borah@intel.com,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Naveen Kumar <naveen1.kumar@intel.com>
Subject: Re: [PATCH v6 3/3] drm/i915/display: Add i915 hook for
 format_mod_supported_async
Message-ID: <Z7YrTqoW2gWaguut@intel.com>
References: <20250219-asyn-v6-0-b959e6becb3c@intel.com>
 <20250219-asyn-v6-3-b959e6becb3c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250219-asyn-v6-3-b959e6becb3c@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 19, 2025 at 02:47:25PM +0530, Arun R Murthy wrote:
> Hook up the newly added plane function pointer
> format_mod_supported_async to populate the modifiers/formats supported
> by asynchronous flips.
> 
> v5: Correct the if condition for modifier support check (Chaitanya)
> v6: Replace uint32_t/uint64_t with u32/u64 (Jani)
> 
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> Reviewed-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> Tested-by: Naveen Kumar <naveen1.kumar@intel.com>
> ---
>  drivers/gpu/drm/i915/display/skl_universal_plane.c | 56 ++++++++++++++++------
>  1 file changed, 41 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> index cd9762947f1de227a3abbcd61b7c7b0c9848e439..f8baeb012f5e2423204f3f5ad7ce466666e04def 100644
> --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> @@ -509,6 +509,33 @@ skl_plane_max_stride(struct intel_plane *plane,
>  				modifier, rotation,
>  				max_pixels, max_bytes);
>  }
> +static bool intel_plane_async_formats(struct intel_plane *plane, u32 format)
> +{
> +	switch (format) {
> +	case DRM_FORMAT_RGB565:
> +	case DRM_FORMAT_XRGB8888:
> +	case DRM_FORMAT_XBGR8888:
> +	case DRM_FORMAT_ARGB8888:
> +	case DRM_FORMAT_ABGR8888:
> +	case DRM_FORMAT_XRGB2101010:
> +	case DRM_FORMAT_XBGR2101010:
> +	case DRM_FORMAT_XRGB16161616F:
> +	case DRM_FORMAT_XBGR16161616F:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}

Why? And anyway, this sort of stuff belongs in a separate patch.

> +
> +static bool intel_plane_format_mod_supported_async(struct drm_plane *plane,
> +						   u32 format,
> +						   u64 modifier)
> +{
> +	if (!intel_plane_can_async_flip(to_intel_plane(plane), modifier))
> +		return false;
> +
> +	return intel_plane_async_formats(to_intel_plane(plane), format);

To preserve the current behavior we want something like:

1. move the planar format check from
   intel_async_flip_check_hw() into
   intel_plane_can_async_flip().

2. implemnt intel_plane_format_mod_supported_async()
   as
{
	if (!plane->format_mod_supported())
		return false;
	
	return intel_plane_can_async_flip();
}

Also all this generic should be put into intel_atomic_plane.c.

>  
>  static bool tgl_plane_can_async_flip(u64 modifier)
>  {
> @@ -2616,30 +2643,29 @@ static bool tgl_plane_format_mod_supported(struct drm_plane *_plane,
>  	}
>  }
>  
> +#define INTEL_PLANE_FUNCS \
> +	.update_plane = drm_atomic_helper_update_plane, \
> +	.disable_plane = drm_atomic_helper_disable_plane, \
> +	.destroy = intel_plane_destroy, \
> +	.atomic_duplicate_state = intel_plane_duplicate_state, \
> +	.atomic_destroy_state = intel_plane_destroy_state, \
> +	.format_mod_supported_async = intel_plane_format_mod_supported_async

This looks unrelated and just adds extra noise to the patch.
Also you are failing to hook this up for pre-skl planes.

> +
>  static const struct drm_plane_funcs skl_plane_funcs = {
> -	.update_plane = drm_atomic_helper_update_plane,
> -	.disable_plane = drm_atomic_helper_disable_plane,
> -	.destroy = intel_plane_destroy,
> -	.atomic_duplicate_state = intel_plane_duplicate_state,
> -	.atomic_destroy_state = intel_plane_destroy_state,
> +	INTEL_PLANE_FUNCS,
> +
>  	.format_mod_supported = skl_plane_format_mod_supported,
>  };
>  
>  static const struct drm_plane_funcs icl_plane_funcs = {
> -	.update_plane = drm_atomic_helper_update_plane,
> -	.disable_plane = drm_atomic_helper_disable_plane,
> -	.destroy = intel_plane_destroy,
> -	.atomic_duplicate_state = intel_plane_duplicate_state,
> -	.atomic_destroy_state = intel_plane_destroy_state,
> +	INTEL_PLANE_FUNCS,
> +
>  	.format_mod_supported = icl_plane_format_mod_supported,
>  };
>  
>  static const struct drm_plane_funcs tgl_plane_funcs = {
> -	.update_plane = drm_atomic_helper_update_plane,
> -	.disable_plane = drm_atomic_helper_disable_plane,
> -	.destroy = intel_plane_destroy,
> -	.atomic_duplicate_state = intel_plane_duplicate_state,
> -	.atomic_destroy_state = intel_plane_destroy_state,
> +	INTEL_PLANE_FUNCS,
> +
>  	.format_mod_supported = tgl_plane_format_mod_supported,
>  };
>  
> 
> -- 
> 2.25.1

-- 
Ville Syrjälä
Intel
