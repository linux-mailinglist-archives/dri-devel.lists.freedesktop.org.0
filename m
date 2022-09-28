Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFC55EE353
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 19:40:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53BE810E50E;
	Wed, 28 Sep 2022 17:40:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF70610E50E;
 Wed, 28 Sep 2022 17:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664386816; x=1695922816;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=k8pizIwUJSuLiP6SVhNsDLQ89Giee1B4YVCExafMdwU=;
 b=epjqAi5TtwnVSPcr2LJFnAKXVOUsBS8kUmcQMNqkCfR0o2RGHXeCpEhv
 E+pjjftkoniQJaXJZRHKZlJ8VtxuRRv+uKObgKtjlyNLkBaOKw6KfRuT9
 ag+0fXhVtixkCZUVYHr6KbwTzyGojNpc+b203Ey3gIRe7KXVMXKw33JX2
 w1BtF2B0L+/qZjMprsRwz1ngO9klCrXeazorgQkAfQtonq3ioTP53QbLH
 K+9x9mMeC9cwddaf3Am/xBT+ahlliIB0e5Q+9X/ZCngnJG82Un6vhyxM0
 gDYDEsVE9XmqDvv2ggua7Xqpumpfoh5qTO0U/bGpYiAM7nQajl6rCsldv g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="303154933"
X-IronPort-AV: E=Sophos;i="5.93,352,1654585200"; d="scan'208";a="303154933"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2022 10:40:07 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="747516518"
X-IronPort-AV: E=Sophos;i="5.93,352,1654585200"; d="scan'208";a="747516518"
Received: from ekarpovi-mobl1.ger.corp.intel.com (HELO [10.252.6.131])
 ([10.252.6.131])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2022 10:40:03 -0700
Message-ID: <fd9c1918-5ca4-1e05-9dff-7793b84cfc43@intel.com>
Date: Wed, 28 Sep 2022 18:40:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.3.0
Subject: Re: [PATCH 03/16] drm/i915/vm_bind: Expose
 i915_gem_object_max_page_size()
Content-Language: en-GB
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20220928061918.6340-1-niranjana.vishwanathapura@intel.com>
 <20220928061918.6340-4-niranjana.vishwanathapura@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20220928061918.6340-4-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: matthew.brost@intel.com, paulo.r.zanoni@intel.com, tvrtko.ursulin@intel.com,
 jani.nikula@intel.com, lionel.g.landwerlin@intel.com,
 thomas.hellstrom@intel.com, jason@jlekstrand.net, andi.shyti@linux.intel.com,
 daniel.vetter@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28/09/2022 07:19, Niranjana Vishwanathapura wrote:
> Expose i915_gem_object_max_page_size() function non-static
> which will be used by the vm_bind feature.
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_create.c | 19 ++++++++++++++-----
>   drivers/gpu/drm/i915/gem/i915_gem_object.h |  2 ++
>   2 files changed, 16 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c b/drivers/gpu/drm/i915/gem/i915_gem_create.c
> index 33673fe7ee0a..4aa7b5582b8e 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
> @@ -15,10 +15,19 @@
>   #include "i915_trace.h"
>   #include "i915_user_extensions.h"
>   
> -static u32 object_max_page_size(struct intel_memory_region **placements,
> -				unsigned int n_placements)
> +/**
> + * i915_gem_object_max_page_size() - max of min_page_size of the regions
> + * @placements:  list of regions
> + * @n_placements: number of the placements
> + *
> + * Calculates the max of the min_page_size of a list of placements passed in.
> + *
> + * Return: max of the min_page_size

"max of the min_page_size, or I915_GTT_PAGE_SIZE_4K if zero placements."

Acked-by: Matthew Auld <matthew.auld@intel.com>

> + */
> +u32 i915_gem_object_max_page_size(struct intel_memory_region **placements,
> +				  unsigned int n_placements)
>   {
> -	u32 max_page_size = 0;
> +	u32 max_page_size = I915_GTT_PAGE_SIZE_4K;
>   	int i;
>   
>   	for (i = 0; i < n_placements; i++) {
> @@ -28,7 +37,6 @@ static u32 object_max_page_size(struct intel_memory_region **placements,
>   		max_page_size = max_t(u32, max_page_size, mr->min_page_size);
>   	}
>   
> -	GEM_BUG_ON(!max_page_size);
>   	return max_page_size;
>   }
>   
> @@ -99,7 +107,8 @@ __i915_gem_object_create_user_ext(struct drm_i915_private *i915, u64 size,
>   
>   	i915_gem_flush_free_objects(i915);
>   
> -	size = round_up(size, object_max_page_size(placements, n_placements));
> +	size = round_up(size, i915_gem_object_max_page_size(placements,
> +							    n_placements));
>   	if (size == 0)
>   		return ERR_PTR(-EINVAL);
>   
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> index a3b7551a57fc..d53d01b1860a 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> @@ -47,6 +47,8 @@ static inline bool i915_gem_object_size_2big(u64 size)
>   }
>   
>   void i915_gem_init__objects(struct drm_i915_private *i915);
> +u32 i915_gem_object_max_page_size(struct intel_memory_region **placements,
> +				  unsigned int n_placements);
>   
>   void i915_objects_module_exit(void);
>   int i915_objects_module_init(void);
