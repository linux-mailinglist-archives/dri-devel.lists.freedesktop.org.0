Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B31B4C790D
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 20:54:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 392F710E737;
	Mon, 28 Feb 2022 19:54:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51B3A10E737;
 Mon, 28 Feb 2022 19:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646078039; x=1677614039;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=uuq5WGM4pWm6kk5l65xapk7KAPIAYU5gj54xZ5UxI4k=;
 b=FzcA+5k2xkCJ1HjVhNEcYNecnNOkpZLNHoWHQvufl0K3z7oi0BYZh6al
 Y8dWcxgq7dYkHdlWCYj7A0CS995SrCieW27whn2Ovx9oomruG3jgqmwfj
 t8ggmogMlJe0gFqq+dnonc3YnKRQcM8DkQtXgKPvVdyOqKXo6/aDwmEAl
 cr6rFrcA4hqoaUR2GOD038nzX+y6NXIwidHu0rnDGExvlDnV8aqFz72oz
 v/+wAjUVE1e7/gK943l8pn1PsPFbcXnvYnVS6YAVh2/8eTWV6I+t9chvc
 HXB4uYZIS5047Nt6n3I2buexRAbT6v4IQDsM52MDjDDgy/FZUpgXV6YII A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10272"; a="251804037"
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; d="scan'208";a="251804037"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 11:53:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; d="scan'208";a="510220249"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by orsmga006.jf.intel.com with ESMTP; 28 Feb 2022 11:53:54 -0800
Received: from [10.249.130.171] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.130.171])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 21SJrqZX011865; Mon, 28 Feb 2022 19:53:53 GMT
Message-ID: <90e7df58-9515-138a-86bb-8524f8d22708@intel.com>
Date: Mon, 28 Feb 2022 20:53:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [PATCH v5 1/7] drm/i915: Rename INTEL_REGION_LMEM with
 INTEL_REGION_LMEM_0
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>
References: <20220217144158.21555-1-andi.shyti@linux.intel.com>
 <20220217144158.21555-2-andi.shyti@linux.intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20220217144158.21555-2-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Andi Shyti <andi@etezian.org>,
 Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 17.02.2022 15:41, Andi Shyti wrote:
> With the upcoming multitile support each tile will have its own
> local memory. Mark the current LMEM with the suffix '0' to
> emphasise that it belongs to the root tile.
> 
> Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_fb.c               | 2 +-
>  drivers/gpu/drm/i915/display/intel_fb_pin.c           | 2 +-
>  drivers/gpu/drm/i915/gem/i915_gem_lmem.c              | 4 ++--
>  drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c  | 6 +++---
>  drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c | 8 ++++----
>  drivers/gpu/drm/i915/gt/intel_gt.c                    | 2 +-
>  drivers/gpu/drm/i915/intel_memory_region.c            | 2 +-
>  drivers/gpu/drm/i915/intel_memory_region.h            | 4 ++--
>  8 files changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
> index 23cfe2e5ce2a..421f7238da05 100644
> --- a/drivers/gpu/drm/i915/display/intel_fb.c
> +++ b/drivers/gpu/drm/i915/display/intel_fb.c
> @@ -1981,7 +1981,7 @@ intel_user_framebuffer_create(struct drm_device *dev,
>  
>  	/* object is backed with LMEM for discrete */
>  	i915 = to_i915(obj->base.dev);
> -	if (HAS_LMEM(i915) && !i915_gem_object_can_migrate(obj, INTEL_REGION_LMEM)) {
> +	if (HAS_LMEM(i915) && !i915_gem_object_can_migrate(obj, INTEL_REGION_LMEM_0)) {
>  		/* object is "remote", not in local memory */
>  		i915_gem_object_put(obj);
>  		return ERR_PTR(-EREMOTE);
> diff --git a/drivers/gpu/drm/i915/display/intel_fb_pin.c b/drivers/gpu/drm/i915/display/intel_fb_pin.c
> index a307b4993bcf..bd6e7c98e751 100644
> --- a/drivers/gpu/drm/i915/display/intel_fb_pin.c
> +++ b/drivers/gpu/drm/i915/display/intel_fb_pin.c
> @@ -140,7 +140,7 @@ intel_pin_and_fence_fb_obj(struct drm_framebuffer *fb,
>  	if (!ret && phys_cursor)
>  		ret = i915_gem_object_attach_phys(obj, alignment);
>  	else if (!ret && HAS_LMEM(dev_priv))
> -		ret = i915_gem_object_migrate(obj, &ww, INTEL_REGION_LMEM);
> +		ret = i915_gem_object_migrate(obj, &ww, INTEL_REGION_LMEM_0);
>  	/* TODO: Do we need to sync when migration becomes async? */
>  	if (!ret)
>  		ret = i915_gem_object_pin_pages(obj);
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_lmem.c b/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
> index 444f8268b9c5..47e43dc3a174 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
> @@ -100,7 +100,7 @@ __i915_gem_object_create_lmem_with_ps(struct drm_i915_private *i915,
>  				      resource_size_t page_size,
>  				      unsigned int flags)
>  {
> -	return i915_gem_object_create_region(i915->mm.regions[INTEL_REGION_LMEM],
> +	return i915_gem_object_create_region(i915->mm.regions[INTEL_REGION_LMEM_0],
>  					     size, page_size, flags);
>  }
>  
> @@ -135,6 +135,6 @@ i915_gem_object_create_lmem(struct drm_i915_private *i915,
>  			    resource_size_t size,
>  			    unsigned int flags)
>  {
> -	return i915_gem_object_create_region(i915->mm.regions[INTEL_REGION_LMEM],
> +	return i915_gem_object_create_region(i915->mm.regions[INTEL_REGION_LMEM_0],
>  					     size, 0, flags);
>  }
> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
> index b071a58dd6da..a342fd387d4e 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
> @@ -88,7 +88,7 @@ static int igt_dmabuf_import_self(void *arg)
>  static int igt_dmabuf_import_same_driver_lmem(void *arg)
>  {
>  	struct drm_i915_private *i915 = arg;
> -	struct intel_memory_region *lmem = i915->mm.regions[INTEL_REGION_LMEM];
> +	struct intel_memory_region *lmem = i915->mm.regions[INTEL_REGION_LMEM_0];
>  	struct drm_i915_gem_object *obj;
>  	struct drm_gem_object *import;
>  	struct dma_buf *dmabuf;
> @@ -252,10 +252,10 @@ static int igt_dmabuf_import_same_driver_lmem_smem(void *arg)
>  	struct drm_i915_private *i915 = arg;
>  	struct intel_memory_region *regions[2];
>  
> -	if (!i915->mm.regions[INTEL_REGION_LMEM])
> +	if (!i915->mm.regions[INTEL_REGION_LMEM_0])
>  		return 0;
>  
> -	regions[0] = i915->mm.regions[INTEL_REGION_LMEM];
> +	regions[0] = i915->mm.regions[INTEL_REGION_LMEM_0];
>  	regions[1] = i915->mm.regions[INTEL_REGION_SMEM];
>  	return igt_dmabuf_import_same_driver(i915, regions, 2);
>  }
> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
> index d534141b2cf7..2c63daf932de 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
> @@ -92,17 +92,17 @@ static int igt_create_migrate(struct intel_gt *gt, enum intel_region_id src,
>  
>  static int igt_smem_create_migrate(void *arg)
>  {
> -	return igt_create_migrate(arg, INTEL_REGION_LMEM, INTEL_REGION_SMEM);
> +	return igt_create_migrate(arg, INTEL_REGION_LMEM_0, INTEL_REGION_SMEM);
>  }
>  
>  static int igt_lmem_create_migrate(void *arg)
>  {
> -	return igt_create_migrate(arg, INTEL_REGION_SMEM, INTEL_REGION_LMEM);
> +	return igt_create_migrate(arg, INTEL_REGION_SMEM, INTEL_REGION_LMEM_0);
>  }
>  
>  static int igt_same_create_migrate(void *arg)
>  {
> -	return igt_create_migrate(arg, INTEL_REGION_LMEM, INTEL_REGION_LMEM);
> +	return igt_create_migrate(arg, INTEL_REGION_LMEM_0, INTEL_REGION_LMEM_0);
>  }
>  
>  static int lmem_pages_migrate_one(struct i915_gem_ww_ctx *ww,
> @@ -152,7 +152,7 @@ static int lmem_pages_migrate_one(struct i915_gem_ww_ctx *ww,
>  		}
>  
>  	} else {
> -		err = i915_gem_object_migrate(obj, ww, INTEL_REGION_LMEM);
> +		err = i915_gem_object_migrate(obj, ww, INTEL_REGION_LMEM_0);
>  		if (err) {
>  			pr_err("Object failed migration to lmem\n");
>  			if (err)
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> index e8403fa53909..db171e85f4df 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -78,7 +78,7 @@ int intel_gt_probe_lmem(struct intel_gt *gt)
>  		return err;
>  	}
>  
> -	id = INTEL_REGION_LMEM;
> +	id = INTEL_REGION_LMEM_0;
>  
>  	mem->id = id;
>  
> diff --git a/drivers/gpu/drm/i915/intel_memory_region.c b/drivers/gpu/drm/i915/intel_memory_region.c
> index c70d7e286a51..18d7f0aa314e 100644
> --- a/drivers/gpu/drm/i915/intel_memory_region.c
> +++ b/drivers/gpu/drm/i915/intel_memory_region.c
> @@ -17,7 +17,7 @@ static const struct {
>  		.class = INTEL_MEMORY_SYSTEM,
>  		.instance = 0,
>  	},
> -	[INTEL_REGION_LMEM] = {
> +	[INTEL_REGION_LMEM_0] = {
>  		.class = INTEL_MEMORY_LOCAL,
>  		.instance = 0,
>  	},
> diff --git a/drivers/gpu/drm/i915/intel_memory_region.h b/drivers/gpu/drm/i915/intel_memory_region.h
> index 5625c9c38993..95db0a8029e2 100644
> --- a/drivers/gpu/drm/i915/intel_memory_region.h
> +++ b/drivers/gpu/drm/i915/intel_memory_region.h
> @@ -29,14 +29,14 @@ enum intel_memory_type {
>  
>  enum intel_region_id {
>  	INTEL_REGION_SMEM = 0,
> -	INTEL_REGION_LMEM,
> +	INTEL_REGION_LMEM_0,

wasn't sure how big this change will be, but after looking at next
patch, it was worth doing that, so

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

>  	INTEL_REGION_STOLEN_SMEM,
>  	INTEL_REGION_STOLEN_LMEM,
>  	INTEL_REGION_UNKNOWN, /* Should be last */
>  };
>  
>  #define REGION_SMEM     BIT(INTEL_REGION_SMEM)
> -#define REGION_LMEM     BIT(INTEL_REGION_LMEM)
> +#define REGION_LMEM     BIT(INTEL_REGION_LMEM_0)
>  #define REGION_STOLEN_SMEM   BIT(INTEL_REGION_STOLEN_SMEM)
>  #define REGION_STOLEN_LMEM   BIT(INTEL_REGION_STOLEN_LMEM)
>  
