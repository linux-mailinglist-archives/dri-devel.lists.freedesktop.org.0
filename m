Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E26641DC2A
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 16:21:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D35196E419;
	Thu, 30 Sep 2021 14:21:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C5366E418
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 14:21:43 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id k7so10268566wrd.13
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 07:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=adcjA7dIMST17WJJeH2/GVf0Hrs9qQolQ+sMQlwR8OY=;
 b=DbhbRxi24bSnwHaukwKGdLi8DlMuM2AXCx+3metmDdgeFYkDq6smeYzmdW1IZs27nW
 7VwKPUToQ+jJiaZdlIwePPmoJl0SXWOrExBrWTNl3YKotZudshCBr19hrvqRPnzuIW5o
 ZwE7kO8YWmktGEhava+2X/IgdxL4vJiXOrjYo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=adcjA7dIMST17WJJeH2/GVf0Hrs9qQolQ+sMQlwR8OY=;
 b=kK5NadFNckrBym1QyfCk8lRLNpTi+8Wep8qFtqqjxPx9T9+sLYmr0FJCQqhdg5iT2O
 tXdx3gXSM7QX7GQwyLREcu0PMLq+DNAUU1Ppa3N4XSNI6aXejhmybeIyvUapj1lvbxEI
 MckdZxgpWdeUxq9vdRWjY0EldRyiE+D8uFembxuEbzkVzmXmhLsMUxIbEhMLPcygbVOY
 KLCJowIlpD6iOArL7NAMf5y0qMuAk+56i0ohbe/23iWcWldTnQdvB46UEyEbfh1nqhj3
 dSAFOhyaqFpHKHQsTnJhbhD3Xu0ewtLuxJHZxMncY/F6dda4A0yPRw/LPzdyRJRqyXPI
 liSA==
X-Gm-Message-State: AOAM533h0mkQYmDhlaC+WMLNV1XEsNYjXZct2jo9rUvr315JXo3rKFlJ
 jS11AWHsf40YQ81+MMvT0iT8ig==
X-Google-Smtp-Source: ABdhPJwIIZlGTXMMsEbKr2FekoPWSDi0u1of9ctmIy2tZ7mde7+Q8qgaFf1dNijIZkUcA7BO2jccKQ==
X-Received: by 2002:a5d:4522:: with SMTP id j2mr6310035wra.212.1633011701799; 
 Thu, 30 Sep 2021 07:21:41 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z8sm3625361wrm.63.2021.09.30.07.21.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 07:21:41 -0700 (PDT)
Date: Thu, 30 Sep 2021 16:21:39 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Cai Huoqing <caihuoqing@baidu.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Zhenyu Wang <zhenyuw@linux.intel.com>,
 Zhi Wang <zhi.a.wang@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gvt-dev@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915: Use direction definition DMA_BIDIRECTIONAL
 instead of PCI_DMA_BIDIRECTIONAL
Message-ID: <YVXH87Uw3urD6q5x@phenom.ffwll.local>
Mail-Followup-To: Cai Huoqing <caihuoqing@baidu.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@linux.ie>,
 Zhenyu Wang <zhenyuw@linux.intel.com>,
 Zhi Wang <zhi.a.wang@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gvt-dev@lists.freedesktop.org
References: <20210925124613.144-1-caihuoqing@baidu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210925124613.144-1-caihuoqing@baidu.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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

On Sat, Sep 25, 2021 at 08:46:12PM +0800, Cai Huoqing wrote:
> Replace direction definition PCI_DMA_BIDIRECTIONAL
> with DMA_BIDIRECTIONAL, because it helps to enhance readability
> and avoid possible inconsistency.
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>

Applied to drm-intel-gt-next, thanks for the patch.
-Daniel

> ---
>  drivers/gpu/drm/i915/gt/intel_region_lmem.c |  4 ++--
>  drivers/gpu/drm/i915/gvt/gtt.c              | 17 ++++++++---------
>  drivers/gpu/drm/i915/gvt/kvmgt.c            |  4 ++--
>  drivers/gpu/drm/i915/i915_gem_gtt.c         |  4 ++--
>  4 files changed, 14 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_region_lmem.c b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
> index a74b72f50cc9..afb35d2e5c73 100644
> --- a/drivers/gpu/drm/i915/gt/intel_region_lmem.c
> +++ b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
> @@ -32,7 +32,7 @@ static int init_fake_lmem_bar(struct intel_memory_region *mem)
>  	mem->remap_addr = dma_map_resource(i915->drm.dev,
>  					   mem->region.start,
>  					   mem->fake_mappable.size,
> -					   PCI_DMA_BIDIRECTIONAL,
> +					   DMA_BIDIRECTIONAL,
>  					   DMA_ATTR_FORCE_CONTIGUOUS);
>  	if (dma_mapping_error(i915->drm.dev, mem->remap_addr)) {
>  		drm_mm_remove_node(&mem->fake_mappable);
> @@ -62,7 +62,7 @@ static void release_fake_lmem_bar(struct intel_memory_region *mem)
>  	dma_unmap_resource(mem->i915->drm.dev,
>  			   mem->remap_addr,
>  			   mem->fake_mappable.size,
> -			   PCI_DMA_BIDIRECTIONAL,
> +			   DMA_BIDIRECTIONAL,
>  			   DMA_ATTR_FORCE_CONTIGUOUS);
>  }
>  
> diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gtt.c
> index e5c2fdfc20e3..53d0cb327539 100644
> --- a/drivers/gpu/drm/i915/gvt/gtt.c
> +++ b/drivers/gpu/drm/i915/gvt/gtt.c
> @@ -745,7 +745,7 @@ static void ppgtt_free_spt(struct intel_vgpu_ppgtt_spt *spt)
>  	trace_spt_free(spt->vgpu->id, spt, spt->guest_page.type);
>  
>  	dma_unmap_page(kdev, spt->shadow_page.mfn << I915_GTT_PAGE_SHIFT, 4096,
> -		       PCI_DMA_BIDIRECTIONAL);
> +		       DMA_BIDIRECTIONAL);
>  
>  	radix_tree_delete(&spt->vgpu->gtt.spt_tree, spt->shadow_page.mfn);
>  
> @@ -849,7 +849,7 @@ static struct intel_vgpu_ppgtt_spt *ppgtt_alloc_spt(
>  	 */
>  	spt->shadow_page.type = type;
>  	daddr = dma_map_page(kdev, spt->shadow_page.page,
> -			     0, 4096, PCI_DMA_BIDIRECTIONAL);
> +			     0, 4096, DMA_BIDIRECTIONAL);
>  	if (dma_mapping_error(kdev, daddr)) {
>  		gvt_vgpu_err("fail to map dma addr\n");
>  		ret = -EINVAL;
> @@ -865,7 +865,7 @@ static struct intel_vgpu_ppgtt_spt *ppgtt_alloc_spt(
>  	return spt;
>  
>  err_unmap_dma:
> -	dma_unmap_page(kdev, daddr, PAGE_SIZE, PCI_DMA_BIDIRECTIONAL);
> +	dma_unmap_page(kdev, daddr, PAGE_SIZE, DMA_BIDIRECTIONAL);
>  err_free_spt:
>  	free_spt(spt);
>  	return ERR_PTR(ret);
> @@ -2409,8 +2409,7 @@ static int alloc_scratch_pages(struct intel_vgpu *vgpu,
>  		return -ENOMEM;
>  	}
>  
> -	daddr = dma_map_page(dev, virt_to_page(scratch_pt), 0,
> -			4096, PCI_DMA_BIDIRECTIONAL);
> +	daddr = dma_map_page(dev, virt_to_page(scratch_pt), 0, 4096, DMA_BIDIRECTIONAL);
>  	if (dma_mapping_error(dev, daddr)) {
>  		gvt_vgpu_err("fail to dmamap scratch_pt\n");
>  		__free_page(virt_to_page(scratch_pt));
> @@ -2461,7 +2460,7 @@ static int release_scratch_page_tree(struct intel_vgpu *vgpu)
>  		if (vgpu->gtt.scratch_pt[i].page != NULL) {
>  			daddr = (dma_addr_t)(vgpu->gtt.scratch_pt[i].page_mfn <<
>  					I915_GTT_PAGE_SHIFT);
> -			dma_unmap_page(dev, daddr, 4096, PCI_DMA_BIDIRECTIONAL);
> +			dma_unmap_page(dev, daddr, 4096, DMA_BIDIRECTIONAL);
>  			__free_page(vgpu->gtt.scratch_pt[i].page);
>  			vgpu->gtt.scratch_pt[i].page = NULL;
>  			vgpu->gtt.scratch_pt[i].page_mfn = 0;
> @@ -2741,7 +2740,7 @@ int intel_gvt_init_gtt(struct intel_gvt *gvt)
>  	}
>  
>  	daddr = dma_map_page(dev, virt_to_page(page), 0,
> -			4096, PCI_DMA_BIDIRECTIONAL);
> +			4096, DMA_BIDIRECTIONAL);
>  	if (dma_mapping_error(dev, daddr)) {
>  		gvt_err("fail to dmamap scratch ggtt page\n");
>  		__free_page(virt_to_page(page));
> @@ -2755,7 +2754,7 @@ int intel_gvt_init_gtt(struct intel_gvt *gvt)
>  		ret = setup_spt_oos(gvt);
>  		if (ret) {
>  			gvt_err("fail to initialize SPT oos\n");
> -			dma_unmap_page(dev, daddr, 4096, PCI_DMA_BIDIRECTIONAL);
> +			dma_unmap_page(dev, daddr, 4096, DMA_BIDIRECTIONAL);
>  			__free_page(gvt->gtt.scratch_page);
>  			return ret;
>  		}
> @@ -2779,7 +2778,7 @@ void intel_gvt_clean_gtt(struct intel_gvt *gvt)
>  	dma_addr_t daddr = (dma_addr_t)(gvt->gtt.scratch_mfn <<
>  					I915_GTT_PAGE_SHIFT);
>  
> -	dma_unmap_page(dev, daddr, 4096, PCI_DMA_BIDIRECTIONAL);
> +	dma_unmap_page(dev, daddr, 4096, DMA_BIDIRECTIONAL);
>  
>  	__free_page(gvt->gtt.scratch_page);
>  
> diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
> index 7efa386449d1..20b82fb036f8 100644
> --- a/drivers/gpu/drm/i915/gvt/kvmgt.c
> +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
> @@ -328,7 +328,7 @@ static int gvt_dma_map_page(struct intel_vgpu *vgpu, unsigned long gfn,
>  		return ret;
>  
>  	/* Setup DMA mapping. */
> -	*dma_addr = dma_map_page(dev, page, 0, size, PCI_DMA_BIDIRECTIONAL);
> +	*dma_addr = dma_map_page(dev, page, 0, size, DMA_BIDIRECTIONAL);
>  	if (dma_mapping_error(dev, *dma_addr)) {
>  		gvt_vgpu_err("DMA mapping failed for pfn 0x%lx, ret %d\n",
>  			     page_to_pfn(page), ret);
> @@ -344,7 +344,7 @@ static void gvt_dma_unmap_page(struct intel_vgpu *vgpu, unsigned long gfn,
>  {
>  	struct device *dev = vgpu->gvt->gt->i915->drm.dev;
>  
> -	dma_unmap_page(dev, dma_addr, size, PCI_DMA_BIDIRECTIONAL);
> +	dma_unmap_page(dev, dma_addr, size, DMA_BIDIRECTIONAL);
>  	gvt_unpin_guest_page(vgpu, gfn, size);
>  }
>  
> diff --git a/drivers/gpu/drm/i915/i915_gem_gtt.c b/drivers/gpu/drm/i915/i915_gem_gtt.c
> index 36489be4896b..cd5f2348a187 100644
> --- a/drivers/gpu/drm/i915/i915_gem_gtt.c
> +++ b/drivers/gpu/drm/i915/i915_gem_gtt.c
> @@ -30,7 +30,7 @@ int i915_gem_gtt_prepare_pages(struct drm_i915_gem_object *obj,
>  	do {
>  		if (dma_map_sg_attrs(obj->base.dev->dev,
>  				     pages->sgl, pages->nents,
> -				     PCI_DMA_BIDIRECTIONAL,
> +				     DMA_BIDIRECTIONAL,
>  				     DMA_ATTR_SKIP_CPU_SYNC |
>  				     DMA_ATTR_NO_KERNEL_MAPPING |
>  				     DMA_ATTR_NO_WARN))
> @@ -64,7 +64,7 @@ void i915_gem_gtt_finish_pages(struct drm_i915_gem_object *obj,
>  		usleep_range(100, 250);
>  
>  	dma_unmap_sg(i915->drm.dev, pages->sgl, pages->nents,
> -		     PCI_DMA_BIDIRECTIONAL);
> +		     DMA_BIDIRECTIONAL);
>  }
>  
>  /**
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
