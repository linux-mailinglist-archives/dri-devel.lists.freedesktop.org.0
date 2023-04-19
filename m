Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1D06E7A00
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 14:51:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94A6A10E980;
	Wed, 19 Apr 2023 12:51:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 177C910E981;
 Wed, 19 Apr 2023 12:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681908684; x=1713444684;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=4oshPjIv5ZQQYn6LidF/XwK9QdOHqo5l3TNgiGos19k=;
 b=jknaK6TV6a5/d/K/guGlwIkGT9v9yE7ZSSjnVHRYlBsQx2W+8jtXVjOo
 dQz/YpaonpgpzT8qM5U9t+agJc/9bvM4xiuw+2S4F9K/wJfZBOL8pIE6p
 C3Ox9n4Q7ru7iLyDtxKeOFG3zcTzQZsiL3VWBnb5rjT9ptSz8mDhRdUe7
 ZWP/i0IssgnMwSSiF0+PpUtJWfvcl1+Uzn+DN7XKfZkW9paQhBy1W98n2
 vXpDsEoLEAHGderD5vKoVhR9ZafvtRXP9rqAkLjXMy9ElyLlvZehxanRD
 nqe7AvMPhXlnrE4++w82H+ULbQZjLCuRghP/oPYO3S2w8PD5XHL4BHsMN w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="347291348"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="347291348"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 05:51:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="760729322"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="760729322"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.18.145])
 ([10.213.18.145])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 05:51:20 -0700
Message-ID: <5759ad19-3249-14aa-fe78-652249d7fabe@intel.com>
Date: Wed, 19 Apr 2023 14:51:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Subject: Re: [Intel-gfx] [PATCH 3/8] drm/i915/mtl: Add PTE encode function
Content-Language: en-US
To: fei.yang@intel.com, intel-gfx@lists.freedesktop.org
References: <20230417062503.1884465-1-fei.yang@intel.com>
 <20230417062503.1884465-4-fei.yang@intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20230417062503.1884465-4-fei.yang@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17.04.2023 08:24, fei.yang@intel.com wrote:
> From: Fei Yang <fei.yang@intel.com>
> 
> PTE encode functions are platform dependent. This patch implements
> PTE functions for MTL, and ensures the correct PTE encode function
> is used by calling pte_encode function pointer instead of the
> hardcoded gen8 version of PTE encode.
> 
> Signed-off-by: Fei Yang <fei.yang@intel.com>

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej
> ---
>   drivers/gpu/drm/i915/display/intel_dpt.c |  2 +-
>   drivers/gpu/drm/i915/gt/gen8_ppgtt.c     | 45 ++++++++++++++++++++----
>   drivers/gpu/drm/i915/gt/gen8_ppgtt.h     |  3 ++
>   drivers/gpu/drm/i915/gt/intel_ggtt.c     | 36 +++++++++++++++++--
>   4 files changed, 75 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dpt.c b/drivers/gpu/drm/i915/display/intel_dpt.c
> index b8027392144d..c5eacfdba1a5 100644
> --- a/drivers/gpu/drm/i915/display/intel_dpt.c
> +++ b/drivers/gpu/drm/i915/display/intel_dpt.c
> @@ -300,7 +300,7 @@ intel_dpt_create(struct intel_framebuffer *fb)
>   	vm->vma_ops.bind_vma    = dpt_bind_vma;
>   	vm->vma_ops.unbind_vma  = dpt_unbind_vma;
>   
> -	vm->pte_encode = gen8_ggtt_pte_encode;
> +	vm->pte_encode = vm->gt->ggtt->vm.pte_encode;
>   
>   	dpt->obj = dpt_obj;
>   	dpt->obj->is_dpt = true;
> diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> index 4daaa6f55668..11b91e0453c8 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> @@ -55,6 +55,34 @@ static u64 gen8_pte_encode(dma_addr_t addr,
>   	return pte;
>   }
>   
> +static u64 mtl_pte_encode(dma_addr_t addr,
> +			  enum i915_cache_level level,
> +			  u32 flags)
> +{
> +	gen8_pte_t pte = addr | GEN8_PAGE_PRESENT | GEN8_PAGE_RW;
> +
> +	if (unlikely(flags & PTE_READ_ONLY))
> +		pte &= ~GEN8_PAGE_RW;
> +
> +	if (flags & PTE_LM)
> +		pte |= GEN12_PPGTT_PTE_LM | GEN12_PPGTT_PTE_NC;
> +
> +	switch (level) {
> +	case I915_CACHE_NONE:
> +		pte |= GEN12_PPGTT_PTE_PAT1;
> +		break;
> +	case I915_CACHE_LLC:
> +	case I915_CACHE_L3_LLC:
> +		pte |= GEN12_PPGTT_PTE_PAT0 | GEN12_PPGTT_PTE_PAT1;
> +		break;
> +	case I915_CACHE_WT:
> +		pte |= GEN12_PPGTT_PTE_PAT0;
> +		break;
> +	}
> +
> +	return pte;
> +}
> +
>   static void gen8_ppgtt_notify_vgt(struct i915_ppgtt *ppgtt, bool create)
>   {
>   	struct drm_i915_private *i915 = ppgtt->vm.i915;
> @@ -427,7 +455,7 @@ gen8_ppgtt_insert_pte(struct i915_ppgtt *ppgtt,
>   		      u32 flags)
>   {
>   	struct i915_page_directory *pd;
> -	const gen8_pte_t pte_encode = gen8_pte_encode(0, cache_level, flags);
> +	const gen8_pte_t pte_encode = ppgtt->vm.pte_encode(0, cache_level, flags);
>   	gen8_pte_t *vaddr;
>   
>   	pd = i915_pd_entry(pdp, gen8_pd_index(idx, 2));
> @@ -580,7 +608,7 @@ static void gen8_ppgtt_insert_huge(struct i915_address_space *vm,
>   				   enum i915_cache_level cache_level,
>   				   u32 flags)
>   {
> -	const gen8_pte_t pte_encode = gen8_pte_encode(0, cache_level, flags);
> +	const gen8_pte_t pte_encode = vm->pte_encode(0, cache_level, flags);
>   	unsigned int rem = sg_dma_len(iter->sg);
>   	u64 start = vma_res->start;
>   
> @@ -743,7 +771,7 @@ static void gen8_ppgtt_insert_entry(struct i915_address_space *vm,
>   	GEM_BUG_ON(pt->is_compact);
>   
>   	vaddr = px_vaddr(pt);
> -	vaddr[gen8_pd_index(idx, 0)] = gen8_pte_encode(addr, level, flags);
> +	vaddr[gen8_pd_index(idx, 0)] = vm->pte_encode(addr, level, flags);
>   	drm_clflush_virt_range(&vaddr[gen8_pd_index(idx, 0)], sizeof(*vaddr));
>   }
>   
> @@ -773,7 +801,7 @@ static void __xehpsdv_ppgtt_insert_entry_lm(struct i915_address_space *vm,
>   	}
>   
>   	vaddr = px_vaddr(pt);
> -	vaddr[gen8_pd_index(idx, 0) / 16] = gen8_pte_encode(addr, level, flags);
> +	vaddr[gen8_pd_index(idx, 0) / 16] = vm->pte_encode(addr, level, flags);
>   }
>   
>   static void xehpsdv_ppgtt_insert_entry(struct i915_address_space *vm,
> @@ -820,8 +848,8 @@ static int gen8_init_scratch(struct i915_address_space *vm)
>   		pte_flags |= PTE_LM;
>   
>   	vm->scratch[0]->encode =
> -		gen8_pte_encode(px_dma(vm->scratch[0]),
> -				I915_CACHE_NONE, pte_flags);
> +		vm->pte_encode(px_dma(vm->scratch[0]),
> +			       I915_CACHE_NONE, pte_flags);
>   
>   	for (i = 1; i <= vm->top; i++) {
>   		struct drm_i915_gem_object *obj;
> @@ -963,7 +991,10 @@ struct i915_ppgtt *gen8_ppgtt_create(struct intel_gt *gt,
>   	 */
>   	ppgtt->vm.alloc_scratch_dma = alloc_pt_dma;
>   
> -	ppgtt->vm.pte_encode = gen8_pte_encode;
> +	if (GRAPHICS_VER_FULL(gt->i915) >= IP_VER(12, 70))
> +		ppgtt->vm.pte_encode = mtl_pte_encode;
> +	else
> +		ppgtt->vm.pte_encode = gen8_pte_encode;
>   
>   	ppgtt->vm.bind_async_flags = I915_VMA_LOCAL_BIND;
>   	ppgtt->vm.insert_entries = gen8_ppgtt_insert;
> diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.h b/drivers/gpu/drm/i915/gt/gen8_ppgtt.h
> index f541d19264b4..6b8ce7f4d25a 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.h
> +++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.h
> @@ -18,5 +18,8 @@ struct i915_ppgtt *gen8_ppgtt_create(struct intel_gt *gt,
>   u64 gen8_ggtt_pte_encode(dma_addr_t addr,
>   			 enum i915_cache_level level,
>   			 u32 flags);
> +u64 mtl_ggtt_pte_encode(dma_addr_t addr,
> +			unsigned int pat_index,
> +			u32 flags);
>   
>   #endif
> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> index 3c7f1ed92f5b..ba3109338aee 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> @@ -220,6 +220,33 @@ static void guc_ggtt_invalidate(struct i915_ggtt *ggtt)
>   	}
>   }
>   
> +u64 mtl_ggtt_pte_encode(dma_addr_t addr,
> +			enum i915_cache_level level,
> +			u32 flags)
> +{
> +	gen8_pte_t pte = addr | GEN8_PAGE_PRESENT;
> +
> +	GEM_BUG_ON(addr & ~GEN12_GGTT_PTE_ADDR_MASK);
> +
> +	if (flags & PTE_LM)
> +		pte |= GEN12_GGTT_PTE_LM;
> +
> +	switch (level) {
> +	case I915_CACHE_NONE:
> +		pte |= MTL_GGTT_PTE_PAT1;
> +		break;
> +	case I915_CACHE_LLC:
> +	case I915_CACHE_L3_LLC:
> +		pte |= MTL_GGTT_PTE_PAT0 | MTL_GGTT_PTE_PAT1;
> +		break;
> +	case I915_CACHE_WT:
> +		pte |= MTL_GGTT_PTE_PAT0;
> +		break;
> +	}
> +
> +	return pte;
> +}
> +
>   u64 gen8_ggtt_pte_encode(dma_addr_t addr,
>   			 enum i915_cache_level level,
>   			 u32 flags)
> @@ -247,7 +274,7 @@ static void gen8_ggtt_insert_page(struct i915_address_space *vm,
>   	gen8_pte_t __iomem *pte =
>   		(gen8_pte_t __iomem *)ggtt->gsm + offset / I915_GTT_PAGE_SIZE;
>   
> -	gen8_set_pte(pte, gen8_ggtt_pte_encode(addr, level, flags));
> +	gen8_set_pte(pte, ggtt->vm.pte_encode(addr, level, flags));
>   
>   	ggtt->invalidate(ggtt);
>   }
> @@ -257,8 +284,8 @@ static void gen8_ggtt_insert_entries(struct i915_address_space *vm,
>   				     enum i915_cache_level level,
>   				     u32 flags)
>   {
> -	const gen8_pte_t pte_encode = gen8_ggtt_pte_encode(0, level, flags);
>   	struct i915_ggtt *ggtt = i915_vm_to_ggtt(vm);
> +	const gen8_pte_t pte_encode = ggtt->vm.pte_encode(0, level, flags);
>   	gen8_pte_t __iomem *gte;
>   	gen8_pte_t __iomem *end;
>   	struct sgt_iter iter;
> @@ -981,7 +1008,10 @@ static int gen8_gmch_probe(struct i915_ggtt *ggtt)
>   	ggtt->vm.vma_ops.bind_vma    = intel_ggtt_bind_vma;
>   	ggtt->vm.vma_ops.unbind_vma  = intel_ggtt_unbind_vma;
>   
> -	ggtt->vm.pte_encode = gen8_ggtt_pte_encode;
> +	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70))
> +		ggtt->vm.pte_encode = mtl_ggtt_pte_encode;
> +	else
> +		ggtt->vm.pte_encode = gen8_ggtt_pte_encode;
>   
>   	return ggtt_probe_common(ggtt, size);
>   }

