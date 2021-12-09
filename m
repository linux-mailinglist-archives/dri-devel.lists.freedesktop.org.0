Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC1E46F724
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 00:00:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BC0510E191;
	Thu,  9 Dec 2021 23:00:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85BEF10E191;
 Thu,  9 Dec 2021 23:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639090840; x=1670626840;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=GIKVUH/YQncjEMgfRVSzdOfskUv6fqJIdaWTnxVzc+I=;
 b=h+q06/Ku0xCaZlgp7f1G2VkWkdk2ZyXGGR9ehUJ/voh3VPLyT3oLf3dS
 yGjXKpy6F4ZGqZzP3TVreH11QQppT8aUA+reRHAQ0nRM9PgPlluC1uFiQ
 RWfh5PvKNo7NdSyedVQbcPsUFwXzYO6gyEpadU8UWYAnmnbA/44Zt1nEi
 5SX6VpfBm5jpC+uWIs2OisZF6PmsPWH0pgjXdJUPu+Tu2UrxBlvZiFRVK
 Ku39CHGLJ3MUicqj6ZI5TTRaInq5tKplii4ZxkdBUKBy8RSCxq/7waXs1
 oPALgFCu0Qn1/DACyMYXxnR4sjfMC4bXfC7huZnofmyEfHB0/gqyDII/P Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10193"; a="262332018"
X-IronPort-AV: E=Sophos;i="5.88,193,1635231600"; d="scan'208";a="262332018"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 15:00:27 -0800
X-IronPort-AV: E=Sophos;i="5.88,193,1635231600"; d="scan'208";a="462314136"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.134])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 15:00:26 -0800
Date: Thu, 9 Dec 2021 15:00:25 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH v6 02/11] drm/i915: Introduce to_gt() helper
Message-ID: <20211209230025.GP2219399@mdroper-desk1.amr.corp.intel.com>
References: <20211209132512.47241-1-andi.shyti@linux.intel.com>
 <20211209132512.47241-3-andi.shyti@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211209132512.47241-3-andi.shyti@linux.intel.com>
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
Cc: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 DRI Devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, Andi Shyti <andi@etezian.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 09, 2021 at 03:25:03PM +0200, Andi Shyti wrote:
> From: Michał Winiarski <michal.winiarski@intel.com>
> 
> To allow further refactoring and abstract away the fact that GT is
> stored inside i915 private.
> No functional changes.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.c | 7 +------
>  drivers/gpu/drm/i915/i915_drv.h                | 5 +++++
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.c b/drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.c
> index acc49c56a9f3..9db3dcbd917f 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.c
> @@ -9,11 +9,6 @@
>  #include "intel_engine_pm.h"
>  #include "intel_gt_buffer_pool.h"
>  
> -static struct intel_gt *to_gt(struct intel_gt_buffer_pool *pool)
> -{
> -	return container_of(pool, struct intel_gt, buffer_pool);
> -}
> -
>  static struct list_head *
>  bucket_for_size(struct intel_gt_buffer_pool *pool, size_t sz)
>  {
> @@ -141,7 +136,7 @@ static struct intel_gt_buffer_pool_node *
>  node_create(struct intel_gt_buffer_pool *pool, size_t sz,
>  	    enum i915_map_type type)
>  {
> -	struct intel_gt *gt = to_gt(pool);
> +	struct intel_gt *gt = container_of(pool, struct intel_gt, buffer_pool);
>  	struct intel_gt_buffer_pool_node *node;
>  	struct drm_i915_gem_object *obj;
>  
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index ae7dc7862b5d..c6f34ac353ff 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -1080,6 +1080,11 @@ static inline struct drm_i915_private *pdev_to_i915(struct pci_dev *pdev)
>  	return pci_get_drvdata(pdev);
>  }
>  
> +static inline struct intel_gt *to_gt(struct drm_i915_private *i915)
> +{
> +	return &i915->gt;
> +}
> +
>  /* Simple iterator over all initialised engines */
>  #define for_each_engine(engine__, dev_priv__, id__) \
>  	for ((id__) = 0; \
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
