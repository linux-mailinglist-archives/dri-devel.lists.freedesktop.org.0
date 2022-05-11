Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2BA52316D
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 13:25:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B81B10ED7C;
	Wed, 11 May 2022 11:25:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2006110ED6F;
 Wed, 11 May 2022 11:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652268299; x=1683804299;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0mBxdYYhd/ynDopbSkM/840fXVGCFQrMoEdfUTAyB3M=;
 b=KXKXgQEayZbHKyrtn7o5lxf08AbrJO87iIa9k5uiNzaDAPZG7vmefh9/
 5IsGF8PRqKVUAe1NOOIpwrp0Usw+KbWqHBaktLTqP3Ps6kwa1uxx4GrAe
 akEdPOqN/l+W3L+jQKP246z7cODLaHwoOYKroRebp8Jw4tnBiHbeF6+pG
 a9rwzB6SaoSEkxnqzLIpTgDWT1FGF0rT67Kb99fYjOq1yJyF80zTIb33J
 j10IfZYyMlVy3PO81xphidjAmumyyqcTNwXfD24z0Ggrt6PyFmTK6QFlL
 io06/jbp+xv86CyWDewCLZvcxYD4oVnG+IaC/2O1iub8szpu8GVZ5D7hO Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10343"; a="332706318"
X-IronPort-AV: E=Sophos;i="5.91,217,1647327600"; d="scan'208";a="332706318"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2022 04:24:58 -0700
X-IronPort-AV: E=Sophos;i="5.91,217,1647327600"; d="scan'208";a="636377532"
Received: from mstribae-mobl1.ger.corp.intel.com (HELO [10.249.254.135])
 ([10.249.254.135])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2022 04:24:55 -0700
Message-ID: <ac755766559a3f1bdfefa7a34751dbe8ce3a80cc.camel@linux.intel.com>
Subject: Re: [PATCH 2/4] drm/i915: setup ggtt scratch page after memory regions
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Robert Beckett <bob.beckett@collabora.com>, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, Jani
 Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>,  Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 11 May 2022 13:24:53 +0200
In-Reply-To: <20220503191316.1145124-3-bob.beckett@collabora.com>
References: <20220503191316.1145124-1-bob.beckett@collabora.com>
 <20220503191316.1145124-3-bob.beckett@collabora.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-3.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Matthew Auld <matthew.auld@intel.com>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2022-05-03 at 19:13 +0000, Robert Beckett wrote:
> reorder scratch page allocation so that memory regions are available

Nit: s/reorder/Reorder/

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

> to allocate the buffers
> 
> Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gt_gmch.c | 20 ++++++++++++++++++--
>  drivers/gpu/drm/i915/gt/intel_gt_gmch.h |  6 ++++++
>  drivers/gpu/drm/i915/i915_driver.c      | 16 ++++++++++------
>  3 files changed, 34 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_gmch.c
> b/drivers/gpu/drm/i915/gt/intel_gt_gmch.c
> index 18e488672d1b..5411df1734ac 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_gmch.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_gmch.c
> @@ -440,8 +440,6 @@ static int ggtt_probe_common(struct i915_ggtt
> *ggtt, u64 size)
>         struct drm_i915_private *i915 = ggtt->vm.i915;
>         struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
>         phys_addr_t phys_addr;
> -       u32 pte_flags;
> -       int ret;
>  
>         GEM_WARN_ON(pci_resource_len(pdev, 0) !=
> gen6_gttmmadr_size(i915));
>         phys_addr = pci_resource_start(pdev, 0) +
> gen6_gttadr_offset(i915);
> @@ -463,6 +461,24 @@ static int ggtt_probe_common(struct i915_ggtt
> *ggtt, u64 size)
>         }
>  
>         kref_init(&ggtt->vm.resv_ref);
> +
> +       return 0;
> +}
> +
> +/**
> + * i915_ggtt_setup_scratch_page - setup ggtt scratch page
> + * @i915: i915 device
> + */
> +int i915_ggtt_setup_scratch_page(struct drm_i915_private *i915)
> +{
> +       struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
> +       u32 pte_flags;
> +       int ret;
> +
> +       /* gen5- scratch setup currently happens in @intel_gtt_init
> */
> +       if (GRAPHICS_VER(i915) <= 5)
> +               return 0;
> +
>         ret = setup_scratch_page(&ggtt->vm);
>         if (ret) {
>                 drm_err(&i915->drm, "Scratch setup failed\n");
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_gmch.h
> b/drivers/gpu/drm/i915/gt/intel_gt_gmch.h
> index 75ed55c1f30a..c6b79cb78637 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_gmch.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_gmch.h
> @@ -15,6 +15,7 @@ int intel_gt_gmch_gen6_probe(struct i915_ggtt
> *ggtt);
>  int intel_gt_gmch_gen8_probe(struct i915_ggtt *ggtt);
>  int intel_gt_gmch_gen5_probe(struct i915_ggtt *ggtt);
>  int intel_gt_gmch_gen5_enable_hw(struct drm_i915_private *i915);
> +int i915_ggtt_setup_scratch_page(struct drm_i915_private *i915);
>  
>  /* Stubs for non-x86 platforms */
>  #else
> @@ -41,6 +42,11 @@ static inline int
> intel_gt_gmch_gen5_enable_hw(struct drm_i915_private *i915)
>         /* No HW should be enabled for this case yet, return fail */
>         return -ENODEV;
>  }
> +
> +static inline int i915_ggtt_setup_scratch_page(struct
> drm_i915_private *i915)
> +{
> +       return 0;
> +}
>  #endif
>  
>  #endif /* __INTEL_GT_GMCH_H__ */
> diff --git a/drivers/gpu/drm/i915/i915_driver.c
> b/drivers/gpu/drm/i915/i915_driver.c
> index 90b0ce5051af..f67476b2f349 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -69,6 +69,7 @@
>  #include "gem/i915_gem_mman.h"
>  #include "gem/i915_gem_pm.h"
>  #include "gt/intel_gt.h"
> +#include "gt/intel_gt_gmch.h"
>  #include "gt/intel_gt_pm.h"
>  #include "gt/intel_rc6.h"
>  
> @@ -589,12 +590,16 @@ static int i915_driver_hw_probe(struct
> drm_i915_private *dev_priv)
>  
>         ret = intel_gt_tiles_init(dev_priv);
>         if (ret)
> -               goto err_mem_regions;
> +               goto err_ggtt;
> +
> +       ret = i915_ggtt_setup_scratch_page(dev_priv);
> +       if (ret)
> +               goto err_ggtt;
>  
>         ret = i915_ggtt_enable_hw(dev_priv);
>         if (ret) {
>                 drm_err(&dev_priv->drm, "failed to enable GGTT\n");
> -               goto err_mem_regions;
> +               goto err_ggtt;
>         }
>  
>         pci_set_master(pdev);
> @@ -646,11 +651,10 @@ static int i915_driver_hw_probe(struct
> drm_i915_private *dev_priv)
>  err_msi:
>         if (pdev->msi_enabled)
>                 pci_disable_msi(pdev);
> -err_mem_regions:
> -       intel_memory_regions_driver_release(dev_priv);
>  err_ggtt:
>         i915_ggtt_driver_release(dev_priv);
>         i915_gem_drain_freed_objects(dev_priv);
> +       intel_memory_regions_driver_release(dev_priv);
>         i915_ggtt_driver_late_release(dev_priv);
>  err_perf:
>         i915_perf_fini(dev_priv);
> @@ -896,9 +900,9 @@ int i915_driver_probe(struct pci_dev *pdev, const
> struct pci_device_id *ent)
>         intel_modeset_driver_remove_nogem(i915);
>  out_cleanup_hw:
>         i915_driver_hw_remove(i915);
> -       intel_memory_regions_driver_release(i915);
>         i915_ggtt_driver_release(i915);
>         i915_gem_drain_freed_objects(i915);
> +       intel_memory_regions_driver_release(i915);
>         i915_ggtt_driver_late_release(i915);
>  out_cleanup_mmio:
>         i915_driver_mmio_release(i915);
> @@ -955,9 +959,9 @@ static void i915_driver_release(struct drm_device
> *dev)
>  
>         i915_gem_driver_release(dev_priv);
>  
> -       intel_memory_regions_driver_release(dev_priv);
>         i915_ggtt_driver_release(dev_priv);
>         i915_gem_drain_freed_objects(dev_priv);
> +       intel_memory_regions_driver_release(dev_priv);
>         i915_ggtt_driver_late_release(dev_priv);
>  
>         i915_driver_mmio_release(dev_priv);


