Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87FB4686CD4
	for <lists+dri-devel@lfdr.de>; Wed,  1 Feb 2023 18:25:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EBCB10E434;
	Wed,  1 Feb 2023 17:25:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A473410E434;
 Wed,  1 Feb 2023 17:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675272353; x=1706808353;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5ucVLGR2Xx+wMjFYxWoDP+mZ6PNX2qdZ2AoVcvPrL5s=;
 b=THNe1xHWb2aTy6/3cyR9gOnnQtLhKnEtko51zcJXLq5gjg9UEP5x3UYA
 uLluIu3E7bdnlWcBnIJ8J+J26Vmc5bTq6m2lA7+olkgBTCcjbAkatUGcB
 JE6YWWZ5BEJF2lwtg7nzrTsexVWSOvayCb0ato710d0TRWNHNhjosNJY4
 39T7Wt9qzQaFe4w+H9HwvXRup9Z7X1W0XgXnCcdzHiryLd9CklIu2pDLi
 +nJcgmSZIzLG1JDQX6+2yk0Ok6LIaHAQp6FMLwWolSRoLCHktowKPFYHK
 Eok9mtSY4/dnQhYHRvbMx5+HfYVbG8WZO2LqeLtBERDhEx5AHRioRXKvY g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="329500241"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; d="scan'208";a="329500241"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2023 09:25:53 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="664946820"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; d="scan'208";a="664946820"
Received: from grimpe-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.34.30])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2023 09:25:49 -0800
Date: Wed, 1 Feb 2023 18:25:45 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH v10 04/23] drm/i915/vm_bind: Support partially mapped vma
 resource
Message-ID: <Y9qgmYeOJdsHAnOO@ashyti-mobl2.lan>
References: <20230118071609.17572-1-niranjana.vishwanathapura@intel.com>
 <20230118071609.17572-5-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230118071609.17572-5-niranjana.vishwanathapura@intel.com>
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

On Tue, Jan 17, 2023 at 11:15:50PM -0800, Niranjana Vishwanathapura wrote:
> As persistent vmas can be partialled mapped to an object,
> remove restriction which require vma resource sg table to
> be just pointer to object's sg table.
> 
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Andi

> ---
>  drivers/gpu/drm/i915/i915_vma.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
> index 34f0e6c923c2..79b2e19a299f 100644
> --- a/drivers/gpu/drm/i915/i915_vma.c
> +++ b/drivers/gpu/drm/i915/i915_vma.c
> @@ -2060,8 +2060,7 @@ static struct dma_fence *__i915_vma_unbind_async(struct i915_vma *vma)
>  	if (!drm_mm_node_allocated(&vma->node))
>  		return NULL;
>  
> -	if (i915_vma_is_pinned(vma) ||
> -	    &vma->obj->mm.rsgt->table != vma->resource->bi.pages)
> +	if (i915_vma_is_pinned(vma))
>  		return ERR_PTR(-EAGAIN);
>  
>  	/*
> -- 
> 2.21.0.rc0.32.g243a4c7e27
