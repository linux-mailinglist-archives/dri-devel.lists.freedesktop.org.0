Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31AED4798BA
	for <lists+dri-devel@lfdr.de>; Sat, 18 Dec 2021 06:05:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5020710EC3F;
	Sat, 18 Dec 2021 05:05:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63FDD10EC3F;
 Sat, 18 Dec 2021 05:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639803922; x=1671339922;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=XmO78q/VzmM8PZ1EshwaQ0RVKpZCy7RxRZEmZuzS0ss=;
 b=F6TpCAU9NyNrp0newQA9qq5UKNUHu48alGa1FSdxDdXsi1U3h+m46R0S
 LMSq7q1O0me+MEanHWf+0Kyaeou7z0VLb7tz/fn36eG8s+0bJaB3auetj
 ux/wfm/rvu9sE6DJY9qQ3/8xa7lL8g2jyWJeF6qwokdotvPXEBWPLFwxn
 kvYGhSbU9HQMtsYUQk5dwJ19gCwVFMXfSLEl1t1TgB1z2qiYBPKlwy4qy
 VDYVQWeu8giwJI8/3Z4GaYx0SbAogq6z+NidhXDgRPKOCLdpXA3qsrMnh
 OgAbZMXlBM8iZuzfMu5gRzHbkWgLWYeYMjGErgFM2izkoU6/uhhTN8FYM g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10201"; a="300661416"
X-IronPort-AV: E=Sophos;i="5.88,215,1635231600"; d="scan'208";a="300661416"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2021 21:05:21 -0800
X-IronPort-AV: E=Sophos;i="5.88,215,1635231600"; d="scan'208";a="507023613"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.134])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2021 21:05:21 -0800
Date: Fri, 17 Dec 2021 21:05:20 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH v8 16/16] drm/i915: Remove unused i915->ggtt
Message-ID: <Yb1sEDuiYKbfrhKj@mdroper-desk1.amr.corp.intel.com>
References: <20211214193346.21231-1-andi.shyti@linux.intel.com>
 <20211214193346.21231-17-andi.shyti@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211214193346.21231-17-andi.shyti@linux.intel.com>
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

On Tue, Dec 14, 2021 at 09:33:46PM +0200, Andi Shyti wrote:
> The reference to the GGTT from the private date is not used
> anymore. Remove it.

You may want to also mention here that tile0's ggtt will now be
dynamically allocated (and auto-deallocated on driver unload by the
drmm_* infrastructure).

Otherwise,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


Matt

> 
> Suggested-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gt.c            |  7 +++++--
>  drivers/gpu/drm/i915/gt/intel_gt.h            |  2 +-
>  drivers/gpu/drm/i915/i915_driver.c            |  4 +++-
>  drivers/gpu/drm/i915/i915_drv.h               |  2 --
>  drivers/gpu/drm/i915/selftests/i915_gem_gtt.c | 20 ++++++++++---------
>  drivers/gpu/drm/i915/selftests/i915_vma.c     | 20 ++++++++++---------
>  .../gpu/drm/i915/selftests/mock_gem_device.c  |  9 +++++++--
>  drivers/gpu/drm/i915/selftests/mock_gtt.c     |  9 ++++-----
>  drivers/gpu/drm/i915/selftests/mock_gtt.h     |  3 ++-
>  9 files changed, 44 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> index f98f0fb21efb..298ff32c8d0c 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -3,6 +3,7 @@
>   * Copyright © 2019 Intel Corporation
>   */
>  
> +#include <drm/drm_managed.h>
>  #include <drm/intel-gtt.h>
>  
>  #include "intel_gt_debugfs.h"
> @@ -85,9 +86,11 @@ int intel_gt_probe_lmem(struct intel_gt *gt)
>  	return 0;
>  }
>  
> -void intel_gt_init_hw_early(struct intel_gt *gt, struct i915_ggtt *ggtt)
> +int intel_gt_assign_ggtt(struct intel_gt *gt)
>  {
> -	gt->ggtt = ggtt;
> +	gt->ggtt = drmm_kzalloc(&gt->i915->drm, sizeof(*gt->ggtt), GFP_KERNEL);
> +
> +	return gt->ggtt ? 0 : -ENOMEM;
>  }
>  
>  static const struct intel_mmio_range icl_l3bank_steering_table[] = {
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.h b/drivers/gpu/drm/i915/gt/intel_gt.h
> index 3ace129eb2af..94e1bac8c0cc 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.h
> @@ -36,7 +36,7 @@ static inline struct intel_gt *huc_to_gt(struct intel_huc *huc)
>  
>  void intel_gt_init_early(struct intel_gt *gt, struct drm_i915_private *i915);
>  void __intel_gt_init_early(struct intel_gt *gt, struct drm_i915_private *i915);
> -void intel_gt_init_hw_early(struct intel_gt *gt, struct i915_ggtt *ggtt);
> +int intel_gt_assign_ggtt(struct intel_gt *gt);
>  int intel_gt_probe_lmem(struct intel_gt *gt);
>  int intel_gt_init_mmio(struct intel_gt *gt);
>  int __must_check intel_gt_init_hw(struct intel_gt *gt);
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> index 3c984553d86f..5f2343389b5e 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -571,7 +571,9 @@ static int i915_driver_hw_probe(struct drm_i915_private *dev_priv)
>  
>  	i915_perf_init(dev_priv);
>  
> -	intel_gt_init_hw_early(to_gt(dev_priv), &dev_priv->ggtt);
> +	ret = intel_gt_assign_ggtt(to_gt(dev_priv));
> +	if (ret)
> +		goto err_perf;
>  
>  	ret = i915_ggtt_probe_hw(dev_priv);
>  	if (ret)
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index 65724e4df3bd..8266df3e11ac 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -838,8 +838,6 @@ struct drm_i915_private {
>  	struct drm_atomic_state *modeset_restore_state;
>  	struct drm_modeset_acquire_ctx reset_ctx;
>  
> -	struct i915_ggtt ggtt; /* VM representing the global address space */
> -
>  	struct i915_gem_mm mm;
>  
>  	/* Kernel Modesetting */
> diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
> index 9afe7cf9d068..f62f7dac57f2 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
> @@ -1737,26 +1737,28 @@ int i915_gem_gtt_mock_selftests(void)
>  		SUBTEST(igt_gtt_insert),
>  	};
>  	struct drm_i915_private *i915;
> -	struct i915_ggtt *ggtt;
> +	struct intel_gt *gt;
>  	int err;
>  
>  	i915 = mock_gem_device();
>  	if (!i915)
>  		return -ENOMEM;
>  
> -	ggtt = kmalloc(sizeof(*ggtt), GFP_KERNEL);
> -	if (!ggtt) {
> -		err = -ENOMEM;
> +	/* allocate the ggtt */
> +	err = intel_gt_assign_ggtt(to_gt(i915));
> +	if (err)
>  		goto out_put;
> -	}
> -	mock_init_ggtt(i915, ggtt);
>  
> -	err = i915_subtests(tests, ggtt);
> +	gt = to_gt(i915);
> +
> +	mock_init_ggtt(gt);
> +
> +	err = i915_subtests(tests, gt->ggtt);
>  
>  	mock_device_flush(i915);
>  	i915_gem_drain_freed_objects(i915);
> -	mock_fini_ggtt(ggtt);
> -	kfree(ggtt);
> +	mock_fini_ggtt(gt->ggtt);
> +
>  out_put:
>  	mock_destroy_device(i915);
>  	return err;
> diff --git a/drivers/gpu/drm/i915/selftests/i915_vma.c b/drivers/gpu/drm/i915/selftests/i915_vma.c
> index 6ac15d3bc5bc..a87cba4eb92f 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_vma.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_vma.c
> @@ -907,26 +907,28 @@ int i915_vma_mock_selftests(void)
>  		SUBTEST(igt_vma_partial),
>  	};
>  	struct drm_i915_private *i915;
> -	struct i915_ggtt *ggtt;
> +	struct intel_gt *gt;
>  	int err;
>  
>  	i915 = mock_gem_device();
>  	if (!i915)
>  		return -ENOMEM;
>  
> -	ggtt = kmalloc(sizeof(*ggtt), GFP_KERNEL);
> -	if (!ggtt) {
> -		err = -ENOMEM;
> +	/* allocate the ggtt */
> +	err = intel_gt_assign_ggtt(to_gt(i915));
> +	if (err)
>  		goto out_put;
> -	}
> -	mock_init_ggtt(i915, ggtt);
>  
> -	err = i915_subtests(tests, ggtt);
> +	gt = to_gt(i915);
> +
> +	mock_init_ggtt(gt);
> +
> +	err = i915_subtests(tests, gt->ggtt);
>  
>  	mock_device_flush(i915);
>  	i915_gem_drain_freed_objects(i915);
> -	mock_fini_ggtt(ggtt);
> -	kfree(ggtt);
> +	mock_fini_ggtt(gt->ggtt);
> +
>  out_put:
>  	mock_destroy_device(i915);
>  	return err;
> diff --git a/drivers/gpu/drm/i915/selftests/mock_gem_device.c b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> index 0b469ae0f474..28a0f054009a 100644
> --- a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> +++ b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> @@ -194,8 +194,13 @@ struct drm_i915_private *mock_gem_device(void)
>  
>  	mock_init_contexts(i915);
>  
> -	mock_init_ggtt(i915, &i915->ggtt);
> -	to_gt(i915)->vm = i915_vm_get(&i915->ggtt.vm);
> +	/* allocate the ggtt */
> +	ret = intel_gt_assign_ggtt(to_gt(i915));
> +	if (ret)
> +		goto err_unlock;
> +
> +	mock_init_ggtt(to_gt(i915));
> +	to_gt(i915)->vm = i915_vm_get(&to_gt(i915)->ggtt->vm);
>  
>  	mkwrite_device_info(i915)->platform_engine_mask = BIT(0);
>  	to_gt(i915)->info.engine_mask = BIT(0);
> diff --git a/drivers/gpu/drm/i915/selftests/mock_gtt.c b/drivers/gpu/drm/i915/selftests/mock_gtt.c
> index 13bb0c3c3f0d..a36f46d50e83 100644
> --- a/drivers/gpu/drm/i915/selftests/mock_gtt.c
> +++ b/drivers/gpu/drm/i915/selftests/mock_gtt.c
> @@ -106,12 +106,12 @@ static void mock_unbind_ggtt(struct i915_address_space *vm,
>  {
>  }
>  
> -void mock_init_ggtt(struct drm_i915_private *i915, struct i915_ggtt *ggtt)
> +void mock_init_ggtt(struct intel_gt *gt)
>  {
> -	memset(ggtt, 0, sizeof(*ggtt));
> +	struct i915_ggtt *ggtt = gt->ggtt;
>  
> -	ggtt->vm.gt = to_gt(i915);
> -	ggtt->vm.i915 = i915;
> +	ggtt->vm.gt = gt;
> +	ggtt->vm.i915 = gt->i915;
>  	ggtt->vm.is_ggtt = true;
>  
>  	ggtt->gmadr = (struct resource) DEFINE_RES_MEM(0, 2048 * PAGE_SIZE);
> @@ -132,7 +132,6 @@ void mock_init_ggtt(struct drm_i915_private *i915, struct i915_ggtt *ggtt)
>  	ggtt->vm.vma_ops.clear_pages = clear_pages;
>  
>  	i915_address_space_init(&ggtt->vm, VM_CLASS_GGTT);
> -	to_gt(i915)->ggtt = ggtt;
>  }
>  
>  void mock_fini_ggtt(struct i915_ggtt *ggtt)
> diff --git a/drivers/gpu/drm/i915/selftests/mock_gtt.h b/drivers/gpu/drm/i915/selftests/mock_gtt.h
> index e3f224f43beb..d6eb90bd7f3f 100644
> --- a/drivers/gpu/drm/i915/selftests/mock_gtt.h
> +++ b/drivers/gpu/drm/i915/selftests/mock_gtt.h
> @@ -27,8 +27,9 @@
>  
>  struct drm_i915_private;
>  struct i915_ggtt;
> +struct intel_gt;
>  
> -void mock_init_ggtt(struct drm_i915_private *i915, struct i915_ggtt *ggtt);
> +void mock_init_ggtt(struct intel_gt *gt);
>  void mock_fini_ggtt(struct i915_ggtt *ggtt);
>  
>  struct i915_ppgtt *mock_ppgtt(struct drm_i915_private *i915, const char *name);
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
