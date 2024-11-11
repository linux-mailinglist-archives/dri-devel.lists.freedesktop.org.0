Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CAD9C3AA7
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2024 10:14:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE8A410E45A;
	Mon, 11 Nov 2024 09:14:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q3/cVIdJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27FC010E029;
 Mon, 11 Nov 2024 09:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731316490; x=1762852490;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=UIRuw292SIU6LLJ3wf1T4iCQODzsjgltpqwhHuMown0=;
 b=Q3/cVIdJrB9eU6U8C8Xhdwd3UeEZnv+dEG50ySS/T55MWWUarKudd5uV
 GzjVYLKjPVRHy4a+hrE8lFdyM+nsRGrhA6OGrbD4kdMuvhp6iTBoCQFyR
 uF0W5P9AAWMlUvmek/eIobtjAsxo//w2dxsWxoYgpcQmU3ON99xSF5nrU
 vGTvvIsbiQ6LPhrzREYLBbp71/YUejkDeOG3JtvwH+cSmAQvApTcbWaOk
 2s/fAM/oOxRTY8JVtHtKInBuPW7zdseiiYj2rGee31XoEBUL0THAyRXMS
 3fZQN/ZbLjcBlE1Qc9E2QbwMrTX4kRxNGCLUdr2rt5zxoJTthW55l/1KA w==;
X-CSE-ConnectionGUID: BqJtLQzOQ8WTvPx0QZOGjw==
X-CSE-MsgGUID: W086CzfpQvySzIdl4IOuHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11252"; a="42514776"
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; d="scan'208";a="42514776"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2024 01:14:50 -0800
X-CSE-ConnectionGUID: FKWUEuCuTV6Omn7V6ovriw==
X-CSE-MsgGUID: T68ltrwsTV2KvaedwUQDCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; d="scan'208";a="91576277"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.75])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2024 01:14:47 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Yunxiang Li <Yunxiang.Li@amd.com>, amd-gfx@lists.freedesktop.org,
 christian.koenig@amd.com, tvrtko.ursulin@igalia.com
Cc: Alexander.Deucher@amd.com, Yunxiang Li <Yunxiang.Li@amd.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v7 2/4] drm: make drm-active- stats optional
In-Reply-To: <20241110154152.592-3-Yunxiang.Li@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241110154152.592-1-Yunxiang.Li@amd.com>
 <20241110154152.592-3-Yunxiang.Li@amd.com>
Date: Mon, 11 Nov 2024 11:14:43 +0200
Message-ID: <87ttcecet8.fsf@intel.com>
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

On Sun, 10 Nov 2024, Yunxiang Li <Yunxiang.Li@amd.com> wrote:
> Make drm-active- optional just like drm-resident- and drm-purgeable-.

Why? What does it mean?

This is what the commit message should answer.

>
> Signed-off-by: Yunxiang Li <Yunxiang.Li@amd.com>
> CC: dri-devel@lists.freedesktop.org
> CC: intel-gfx@lists.freedesktop.org
> CC: amd-gfx@lists.freedesktop.org
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c |  1 +
>  drivers/gpu/drm/drm_file.c                 | 13 +++++++------
>  drivers/gpu/drm/i915/i915_drm_client.c     |  1 +
>  drivers/gpu/drm/xe/xe_drm_client.c         |  1 +
>  include/drm/drm_gem.h                      | 14 ++++++++------
>  5 files changed, 18 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
> index df2cf5c339255..7717e3e4f05b5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
> @@ -97,6 +97,7 @@ void amdgpu_show_fdinfo(struct drm_printer *p, struct drm_file *file)
>  
>  		drm_print_memory_stats(p,
>  				       &stats[i].drm,
> +				       DRM_GEM_OBJECT_ACTIVE |
>  				       DRM_GEM_OBJECT_RESIDENT |
>  				       DRM_GEM_OBJECT_PURGEABLE,
>  				       pl_name[i]);
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index e285fcc28c59c..fd06671054723 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -884,7 +884,9 @@ void drm_print_memory_stats(struct drm_printer *p,
>  {
>  	print_size(p, "total", region, stats->private + stats->shared);
>  	print_size(p, "shared", region, stats->shared);
> -	print_size(p, "active", region, stats->active);
> +
> +	if (supported_status & DRM_GEM_OBJECT_ACTIVE)
> +		print_size(p, "active", region, stats->active);
>  
>  	if (supported_status & DRM_GEM_OBJECT_RESIDENT)
>  		print_size(p, "resident", region, stats->resident);
> @@ -917,15 +919,13 @@ void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file)
>  
>  		if (obj->funcs && obj->funcs->status) {
>  			s = obj->funcs->status(obj);
> -			supported_status = DRM_GEM_OBJECT_RESIDENT |
> -					DRM_GEM_OBJECT_PURGEABLE;
> +			supported_status |= s;
>  		}
>  
> -		if (drm_gem_object_is_shared_for_memory_stats(obj)) {
> +		if (drm_gem_object_is_shared_for_memory_stats(obj))
>  			status.shared += obj->size;
> -		} else {
> +		else
>  			status.private += obj->size;
> -		}
>  
>  		if (s & DRM_GEM_OBJECT_RESIDENT) {
>  			status.resident += add_size;
> @@ -938,6 +938,7 @@ void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file)
>  
>  		if (!dma_resv_test_signaled(obj->resv, dma_resv_usage_rw(true))) {
>  			status.active += add_size;
> +			supported_status |= DRM_GEM_OBJECT_ACTIVE;
>  
>  			/* If still active, don't count as purgeable: */
>  			s &= ~DRM_GEM_OBJECT_PURGEABLE;
> diff --git a/drivers/gpu/drm/i915/i915_drm_client.c b/drivers/gpu/drm/i915/i915_drm_client.c
> index f586825054918..168d7375304bc 100644
> --- a/drivers/gpu/drm/i915/i915_drm_client.c
> +++ b/drivers/gpu/drm/i915/i915_drm_client.c
> @@ -102,6 +102,7 @@ static void show_meminfo(struct drm_printer *p, struct drm_file *file)
>  	for_each_memory_region(mr, i915, id)
>  		drm_print_memory_stats(p,
>  				       &stats[id],
> +				       DRM_GEM_OBJECT_ACTIVE |
>  				       DRM_GEM_OBJECT_RESIDENT |
>  				       DRM_GEM_OBJECT_PURGEABLE,
>  				       mr->uabi_name);
> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
> index 6a26923fa10e0..54941b4e850c4 100644
> --- a/drivers/gpu/drm/xe/xe_drm_client.c
> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
> @@ -229,6 +229,7 @@ static void show_meminfo(struct drm_printer *p, struct drm_file *file)
>  		if (man) {
>  			drm_print_memory_stats(p,
>  					       &stats[mem_type],
> +					       DRM_GEM_OBJECT_ACTIVE |
>  					       DRM_GEM_OBJECT_RESIDENT |
>  					       (mem_type != XE_PL_SYSTEM ? 0 :
>  					       DRM_GEM_OBJECT_PURGEABLE),
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index bae4865b2101a..584ffdf5c2542 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -48,19 +48,21 @@ struct drm_gem_object;
>   * enum drm_gem_object_status - bitmask of object state for fdinfo reporting
>   * @DRM_GEM_OBJECT_RESIDENT: object is resident in memory (ie. not unpinned)
>   * @DRM_GEM_OBJECT_PURGEABLE: object marked as purgeable by userspace
> + * @DRM_GEM_OBJECT_ACTIVE: object is currently used by an active submission
>   *
>   * Bitmask of status used for fdinfo memory stats, see &drm_gem_object_funcs.status
> - * and drm_show_fdinfo().  Note that an object can DRM_GEM_OBJECT_PURGEABLE if
> - * it still active or not resident, in which case drm_show_fdinfo() will not
> + * and drm_show_fdinfo().  Note that an object can report DRM_GEM_OBJECT_PURGEABLE
> + * and be active or not resident, in which case drm_show_fdinfo() will not
>   * account for it as purgeable.  So drivers do not need to check if the buffer
> - * is idle and resident to return this bit.  (Ie. userspace can mark a buffer
> - * as purgeable even while it is still busy on the GPU.. it does not _actually_
> - * become puregeable until it becomes idle.  The status gem object func does
> - * not need to consider this.)
> + * is idle and resident to return this bit, i.e. userspace can mark a buffer as
> + * purgeable even while it is still busy on the GPU. It whill not get reported
> + * in the puregeable stats until it becomes idle.  The status gem object func
> + * does not need to consider this.
>   */
>  enum drm_gem_object_status {
>  	DRM_GEM_OBJECT_RESIDENT  = BIT(0),
>  	DRM_GEM_OBJECT_PURGEABLE = BIT(1),
> +	DRM_GEM_OBJECT_ACTIVE = BIT(2),
>  };
>  
>  /**

-- 
Jani Nikula, Intel
