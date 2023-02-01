Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 469C7686CCE
	for <lists+dri-devel@lfdr.de>; Wed,  1 Feb 2023 18:24:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E8B310E437;
	Wed,  1 Feb 2023 17:24:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AFCF10E434;
 Wed,  1 Feb 2023 17:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675272242; x=1706808242;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=lrjxC02yB9BRXANlIo+VkCybbHXocGrMt600gyxmZIo=;
 b=U8oOlQj17x5GAgvMmD2GvVpBDHiDkNrYMEm+qAR+8TcBW9fIbbuYl8me
 JwBo+yHvEoE8Mtc6lewMmE3xxKbu2qjMNS5nGEXMTI7cjjYVXlqOtYXg+
 ZQrcJmtgLkZMJqmUILqP6rB6DIeXfP01PysSuQoIYcnvi7PbYWUYmAYxs
 +pisnripJgozQuGfOuWk+1K+hf7itEWqjE9xmljwoqrznJ74yMAnRqHYV
 S7EoR2KOHF7gZgdSFSgjzsQ1W5dV/srVtml1rLI1mZwpr9gd7J882GTCR
 nI5GgLWufM2QTvSOuc0WNdb52pRsDtb8ZzQCfKFmCC94cCjLaOiKuf+0J g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="392788933"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; d="scan'208";a="392788933"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2023 09:23:49 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="807646523"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; d="scan'208";a="807646523"
Received: from grimpe-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.34.30])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2023 09:23:45 -0800
Date: Wed, 1 Feb 2023 18:23:42 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH v10 03/23] drm/i915/vm_bind: Expose
 i915_gem_object_max_page_size()
Message-ID: <Y9qgHtFG2bWjtN7B@ashyti-mobl2.lan>
References: <20230118071609.17572-1-niranjana.vishwanathapura@intel.com>
 <20230118071609.17572-4-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230118071609.17572-4-niranjana.vishwanathapura@intel.com>
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
Cc: matthew.brost@intel.com, paulo.r.zanoni@intel.com,
 lionel.g.landwerlin@intel.com, tvrtko.ursulin@intel.com, jani.nikula@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 thomas.hellstrom@intel.com, matthew.auld@intel.com, jason@jlekstrand.net,
 andi.shyti@linux.intel.com, daniel.vetter@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Niranjana,

On Tue, Jan 17, 2023 at 11:15:49PM -0800, Niranjana Vishwanathapura wrote:
> Expose i915_gem_object_max_page_size() function non-static
> which will be used by the vm_bind feature.
> 
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_create.c | 18 +++++++++++++-----
>  drivers/gpu/drm/i915/gem/i915_gem_object.h |  2 ++
>  2 files changed, 15 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c b/drivers/gpu/drm/i915/gem/i915_gem_create.c
> index 005a7f842784..86469710bd59 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
> @@ -15,10 +15,18 @@
>  #include "i915_trace.h"
>  #include "i915_user_extensions.h"
>  
> -static u32 object_max_page_size(struct intel_memory_region **placements,
> -				unsigned int n_placements)
> +/**
> + * i915_gem_object_max_page_size() - max of min_page_size of the regions
> + * @placements:  list of regions
> + * @n_placements: number of the placements
> + *
> + * Returns the largest of min_page_size of the @placements,
> + * or I915_GTT_PAGE_SIZE_4K if @n_placements is 0.
> + */
> +u32 i915_gem_object_max_page_size(struct intel_memory_region **placements,
> +				  unsigned int n_placements)
>  {
> -	u32 max_page_size = 0;
> +	u32 max_page_size = I915_GTT_PAGE_SIZE_4K;
>  	int i;
>  
>  	for (i = 0; i < n_placements; i++) {
> @@ -28,7 +36,6 @@ static u32 object_max_page_size(struct intel_memory_region **placements,
>  		max_page_size = max_t(u32, max_page_size, mr->min_page_size);
>  	}
>  
> -	GEM_BUG_ON(!max_page_size);

this change, though, is not described in the commit log. Can you
please add two lines?

Thanks,
Andi

>  	return max_page_size;
>  }
>  
> @@ -99,7 +106,8 @@ __i915_gem_object_create_user_ext(struct drm_i915_private *i915, u64 size,
>  
>  	i915_gem_flush_free_objects(i915);
>  
> -	size = round_up(size, object_max_page_size(placements, n_placements));
> +	size = round_up(size, i915_gem_object_max_page_size(placements,
> +							    n_placements));
>  	if (size == 0)
>  		return ERR_PTR(-EINVAL);
>  
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> index 3db53769864c..5455ca0eabe9 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> @@ -47,6 +47,8 @@ static inline bool i915_gem_object_size_2big(u64 size)
>  }
>  
>  void i915_gem_init__objects(struct drm_i915_private *i915);
> +u32 i915_gem_object_max_page_size(struct intel_memory_region **placements,
> +				  unsigned int n_placements);
>  
>  void i915_objects_module_exit(void);
>  int i915_objects_module_init(void);
> -- 
> 2.21.0.rc0.32.g243a4c7e27
