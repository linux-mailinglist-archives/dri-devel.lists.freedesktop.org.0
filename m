Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6053541EFF6
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 16:50:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20AC66EDAE;
	Fri,  1 Oct 2021 14:50:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7229F6EDAA
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 14:50:22 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id v127so7402806wme.5
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Oct 2021 07:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=XObjtU4PyVbF/ZbbwoSfuVLsd6n+GoMhRgnIczIDqqE=;
 b=g+tE4NGMt8NgHUTGaid9q2/e6/yn54CaeuKWN84VbR9vgKLRNepXvLoLL/MiAwIEJ4
 dIxekSzimYn5iQCF1lDktkOpQrU1qCqtdxt9JQF74fWAeUzDyk2p5dt4QE5f22PgO2/o
 Wwk1wQsas67fVB6OOL4mzsqkgqtLrHFZhEiAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=XObjtU4PyVbF/ZbbwoSfuVLsd6n+GoMhRgnIczIDqqE=;
 b=G9l36+VMCLj7FRKd9IQ9GcUVq18GRHi7p1OrmygYJB1XMTmqZ9J8kG2//hzH36hI2+
 lYlvVKd3R3O5efJCPooTBAkWc0hNEe69nxH0RtmSchCDfCS3mvSRdcmsQa6aXGJS85JC
 EpYtg7kIcE6SnPaCTF6bvHCscCKCzrOEzd2kg0XewyCoUhV19ftklO92yxE7QN5jCX9v
 pBAST+D5rLCXVje6Fe9Gq4YIJRuik8v7ACNQqbvkamrfQDMRKj888dhnW4i6PXlVD9T/
 4oGMFMFYRYL87MCAM+XteLa8gEpzMfQQiGoXXU7qInarhcDQRGDLBKL282pu5Q7RwK27
 wfPg==
X-Gm-Message-State: AOAM5305dgEPCof9lY+9pvH5gfJ4F3zUfO2MF1ZpqV0mKLRj0oZzpkAc
 mxY2TgO2Gwo1uqS/y4b56Wo7Ow==
X-Google-Smtp-Source: ABdhPJw8T8GUVt7v4Ij+Ecdrg5qyP218Ix34mdcAMZ78zHjwhCBNKnCwsTQ9nfDW+q8et8Ml/yuf4Q==
X-Received: by 2002:a05:600c:4e86:: with SMTP id
 f6mr5180927wmq.52.1633099820785; 
 Fri, 01 Oct 2021 07:50:20 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id k10sm7821605wmr.32.2021.10.01.07.50.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 07:50:20 -0700 (PDT)
Date: Fri, 1 Oct 2021 16:50:18 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Cai Huoqing <caihuoqing@baidu.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Zhenyu Wang <zhenyuw@linux.intel.com>,
 Zhi Wang <zhi.a.wang@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gvt-dev@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915: Use direction definition DMA_BIDIRECTIONAL
 instead of PCI_DMA_BIDIRECTIONAL
Message-ID: <YVcgKj0UCB2WmBXF@phenom.ffwll.local>
Mail-Followup-To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Cai Huoqing <caihuoqing@baidu.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@linux.ie>,
 Zhenyu Wang <zhenyuw@linux.intel.com>,
 Zhi Wang <zhi.a.wang@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gvt-dev@lists.freedesktop.org
References: <20210925124613.144-1-caihuoqing@baidu.com>
 <YVXH87Uw3urD6q5x@phenom.ffwll.local>
 <3a2ada00-fe4f-284c-46a5-c0f6676bcfe1@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3a2ada00-fe4f-284c-46a5-c0f6676bcfe1@wanadoo.fr>
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

On Thu, Sep 30, 2021 at 08:58:15PM +0200, Christophe JAILLET wrote:
> Le 30/09/2021 à 16:21, Daniel Vetter a écrit :
> > On Sat, Sep 25, 2021 at 08:46:12PM +0800, Cai Huoqing wrote:
> > > Replace direction definition PCI_DMA_BIDIRECTIONAL
> > > with DMA_BIDIRECTIONAL, because it helps to enhance readability
> > > and avoid possible inconsistency.
> > > 
> > > Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> > 
> > Applied to drm-intel-gt-next, thanks for the patch.
> > -Daniel
> 
> Hi,
> just in case, a similar patch received some (unrelated) comments a few weeks
> ago. See [1].
> 
> Should it rings some bells to someone who know who knows what should be
> done.
> 
> Just my 2c.
> 
> [1]: https://lore.kernel.org/kernel-janitors/0cd61d5b-ac88-31e8-99ad-143af480416f@arm.com/

Hm yeah there's some fishy stuff in here, but it's cc'ed to intel-gfx so
should get picked up there.
-Daniel

> 
> CJ
> 
> 
> > 
> > > ---
> > >   drivers/gpu/drm/i915/gt/intel_region_lmem.c |  4 ++--
> > >   drivers/gpu/drm/i915/gvt/gtt.c              | 17 ++++++++---------
> > >   drivers/gpu/drm/i915/gvt/kvmgt.c            |  4 ++--
> > >   drivers/gpu/drm/i915/i915_gem_gtt.c         |  4 ++--
> > >   4 files changed, 14 insertions(+), 15 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/gt/intel_region_lmem.c b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
> > > index a74b72f50cc9..afb35d2e5c73 100644
> > > --- a/drivers/gpu/drm/i915/gt/intel_region_lmem.c
> > > +++ b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
> > > @@ -32,7 +32,7 @@ static int init_fake_lmem_bar(struct intel_memory_region *mem)
> > >   	mem->remap_addr = dma_map_resource(i915->drm.dev,
> > >   					   mem->region.start,
> > >   					   mem->fake_mappable.size,
> > > -					   PCI_DMA_BIDIRECTIONAL,
> > > +					   DMA_BIDIRECTIONAL,
> > >   					   DMA_ATTR_FORCE_CONTIGUOUS);
> > >   	if (dma_mapping_error(i915->drm.dev, mem->remap_addr)) {
> > >   		drm_mm_remove_node(&mem->fake_mappable);
> > > @@ -62,7 +62,7 @@ static void release_fake_lmem_bar(struct intel_memory_region *mem)
> > >   	dma_unmap_resource(mem->i915->drm.dev,
> > >   			   mem->remap_addr,
> > >   			   mem->fake_mappable.size,
> > > -			   PCI_DMA_BIDIRECTIONAL,
> > > +			   DMA_BIDIRECTIONAL,
> > >   			   DMA_ATTR_FORCE_CONTIGUOUS);
> > >   }
> > > diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gtt.c
> > > index e5c2fdfc20e3..53d0cb327539 100644
> > > --- a/drivers/gpu/drm/i915/gvt/gtt.c
> > > +++ b/drivers/gpu/drm/i915/gvt/gtt.c
> > > @@ -745,7 +745,7 @@ static void ppgtt_free_spt(struct intel_vgpu_ppgtt_spt *spt)
> > >   	trace_spt_free(spt->vgpu->id, spt, spt->guest_page.type);
> > >   	dma_unmap_page(kdev, spt->shadow_page.mfn << I915_GTT_PAGE_SHIFT, 4096,
> > > -		       PCI_DMA_BIDIRECTIONAL);
> > > +		       DMA_BIDIRECTIONAL);
> > >   	radix_tree_delete(&spt->vgpu->gtt.spt_tree, spt->shadow_page.mfn);
> > > @@ -849,7 +849,7 @@ static struct intel_vgpu_ppgtt_spt *ppgtt_alloc_spt(
> > >   	 */
> > >   	spt->shadow_page.type = type;
> > >   	daddr = dma_map_page(kdev, spt->shadow_page.page,
> > > -			     0, 4096, PCI_DMA_BIDIRECTIONAL);
> > > +			     0, 4096, DMA_BIDIRECTIONAL);
> > >   	if (dma_mapping_error(kdev, daddr)) {
> > >   		gvt_vgpu_err("fail to map dma addr\n");
> > >   		ret = -EINVAL;
> > > @@ -865,7 +865,7 @@ static struct intel_vgpu_ppgtt_spt *ppgtt_alloc_spt(
> > >   	return spt;
> > >   err_unmap_dma:
> > > -	dma_unmap_page(kdev, daddr, PAGE_SIZE, PCI_DMA_BIDIRECTIONAL);
> > > +	dma_unmap_page(kdev, daddr, PAGE_SIZE, DMA_BIDIRECTIONAL);
> > >   err_free_spt:
> > >   	free_spt(spt);
> > >   	return ERR_PTR(ret);
> > > @@ -2409,8 +2409,7 @@ static int alloc_scratch_pages(struct intel_vgpu *vgpu,
> > >   		return -ENOMEM;
> > >   	}
> > > -	daddr = dma_map_page(dev, virt_to_page(scratch_pt), 0,
> > > -			4096, PCI_DMA_BIDIRECTIONAL);
> > > +	daddr = dma_map_page(dev, virt_to_page(scratch_pt), 0, 4096, DMA_BIDIRECTIONAL);
> > >   	if (dma_mapping_error(dev, daddr)) {
> > >   		gvt_vgpu_err("fail to dmamap scratch_pt\n");
> > >   		__free_page(virt_to_page(scratch_pt));
> > > @@ -2461,7 +2460,7 @@ static int release_scratch_page_tree(struct intel_vgpu *vgpu)
> > >   		if (vgpu->gtt.scratch_pt[i].page != NULL) {
> > >   			daddr = (dma_addr_t)(vgpu->gtt.scratch_pt[i].page_mfn <<
> > >   					I915_GTT_PAGE_SHIFT);
> > > -			dma_unmap_page(dev, daddr, 4096, PCI_DMA_BIDIRECTIONAL);
> > > +			dma_unmap_page(dev, daddr, 4096, DMA_BIDIRECTIONAL);
> > >   			__free_page(vgpu->gtt.scratch_pt[i].page);
> > >   			vgpu->gtt.scratch_pt[i].page = NULL;
> > >   			vgpu->gtt.scratch_pt[i].page_mfn = 0;
> > > @@ -2741,7 +2740,7 @@ int intel_gvt_init_gtt(struct intel_gvt *gvt)
> > >   	}
> > >   	daddr = dma_map_page(dev, virt_to_page(page), 0,
> > > -			4096, PCI_DMA_BIDIRECTIONAL);
> > > +			4096, DMA_BIDIRECTIONAL);
> > >   	if (dma_mapping_error(dev, daddr)) {
> > >   		gvt_err("fail to dmamap scratch ggtt page\n");
> > >   		__free_page(virt_to_page(page));
> > > @@ -2755,7 +2754,7 @@ int intel_gvt_init_gtt(struct intel_gvt *gvt)
> > >   		ret = setup_spt_oos(gvt);
> > >   		if (ret) {
> > >   			gvt_err("fail to initialize SPT oos\n");
> > > -			dma_unmap_page(dev, daddr, 4096, PCI_DMA_BIDIRECTIONAL);
> > > +			dma_unmap_page(dev, daddr, 4096, DMA_BIDIRECTIONAL);
> > >   			__free_page(gvt->gtt.scratch_page);
> > >   			return ret;
> > >   		}
> > > @@ -2779,7 +2778,7 @@ void intel_gvt_clean_gtt(struct intel_gvt *gvt)
> > >   	dma_addr_t daddr = (dma_addr_t)(gvt->gtt.scratch_mfn <<
> > >   					I915_GTT_PAGE_SHIFT);
> > > -	dma_unmap_page(dev, daddr, 4096, PCI_DMA_BIDIRECTIONAL);
> > > +	dma_unmap_page(dev, daddr, 4096, DMA_BIDIRECTIONAL);
> > >   	__free_page(gvt->gtt.scratch_page);
> > > diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
> > > index 7efa386449d1..20b82fb036f8 100644
> > > --- a/drivers/gpu/drm/i915/gvt/kvmgt.c
> > > +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
> > > @@ -328,7 +328,7 @@ static int gvt_dma_map_page(struct intel_vgpu *vgpu, unsigned long gfn,
> > >   		return ret;
> > >   	/* Setup DMA mapping. */
> > > -	*dma_addr = dma_map_page(dev, page, 0, size, PCI_DMA_BIDIRECTIONAL);
> > > +	*dma_addr = dma_map_page(dev, page, 0, size, DMA_BIDIRECTIONAL);
> > >   	if (dma_mapping_error(dev, *dma_addr)) {
> > >   		gvt_vgpu_err("DMA mapping failed for pfn 0x%lx, ret %d\n",
> > >   			     page_to_pfn(page), ret);
> > > @@ -344,7 +344,7 @@ static void gvt_dma_unmap_page(struct intel_vgpu *vgpu, unsigned long gfn,
> > >   {
> > >   	struct device *dev = vgpu->gvt->gt->i915->drm.dev;
> > > -	dma_unmap_page(dev, dma_addr, size, PCI_DMA_BIDIRECTIONAL);
> > > +	dma_unmap_page(dev, dma_addr, size, DMA_BIDIRECTIONAL);
> > >   	gvt_unpin_guest_page(vgpu, gfn, size);
> > >   }
> > > diff --git a/drivers/gpu/drm/i915/i915_gem_gtt.c b/drivers/gpu/drm/i915/i915_gem_gtt.c
> > > index 36489be4896b..cd5f2348a187 100644
> > > --- a/drivers/gpu/drm/i915/i915_gem_gtt.c
> > > +++ b/drivers/gpu/drm/i915/i915_gem_gtt.c
> > > @@ -30,7 +30,7 @@ int i915_gem_gtt_prepare_pages(struct drm_i915_gem_object *obj,
> > >   	do {
> > >   		if (dma_map_sg_attrs(obj->base.dev->dev,
> > >   				     pages->sgl, pages->nents,
> > > -				     PCI_DMA_BIDIRECTIONAL,
> > > +				     DMA_BIDIRECTIONAL,
> > >   				     DMA_ATTR_SKIP_CPU_SYNC |
> > >   				     DMA_ATTR_NO_KERNEL_MAPPING |
> > >   				     DMA_ATTR_NO_WARN))
> > > @@ -64,7 +64,7 @@ void i915_gem_gtt_finish_pages(struct drm_i915_gem_object *obj,
> > >   		usleep_range(100, 250);
> > >   	dma_unmap_sg(i915->drm.dev, pages->sgl, pages->nents,
> > > -		     PCI_DMA_BIDIRECTIONAL);
> > > +		     DMA_BIDIRECTIONAL);
> > >   }
> > >   /**
> > > -- 
> > > 2.25.1
> > > 
> > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
