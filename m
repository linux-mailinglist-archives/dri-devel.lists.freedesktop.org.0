Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A61500F2B
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 15:23:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3668C10FBDA;
	Thu, 14 Apr 2022 13:23:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B6FB10FBDA;
 Thu, 14 Apr 2022 13:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649942614; x=1681478614;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=NO3sfIaXbtW/daMNfOs46Z/HBgbjixeiUp7yO1HtmUY=;
 b=KFGglyIPytLZGwL1JCmMBRRLXXlryP27prpz/Nl9rq8Boa30+jCz6/dk
 ceQvASQI7hhgZw9NUBRCtPMK6cnwHKFHdGknraQN02d/Y6ve4xNTD0O07
 O5l6lRmMueggYq3JWrPZYUOZ5BhTBcp2nN43RC2jbIm7g1pfqRu4+Bcjd
 igRS1GmeagiVHkzEnB+qsXc8RpR0F8+p+ofFS/t4C13pwRQUDCc2fNp3z
 ubuwZMI0sXnKt+R2V9MXlkWNbG/HFgZU8iWrOBi+YTDLp2jSA/ZszGEyX
 FCjur/iRBUCRgkm3z8Rev168ByERh8WUnQlQ+o313/+LH10vqbhlHsoGO w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10316"; a="349362642"
X-IronPort-AV: E=Sophos;i="5.90,259,1643702400"; d="scan'208";a="349362642"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 06:23:33 -0700
X-IronPort-AV: E=Sophos;i="5.90,259,1643702400"; d="scan'208";a="508404605"
Received: from aviljane-mobl.ger.corp.intel.com (HELO [10.249.254.86])
 ([10.249.254.86])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 06:23:30 -0700
Message-ID: <28042cc2-be62-eeb7-35a7-f2e33c43bad5@linux.intel.com>
Date: Thu, 14 Apr 2022 15:23:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 1/5] drm/i915: instantiate ttm ranger manager for
 stolen memory
Content-Language: en-US
To: Robert Beckett <bob.beckett@collabora.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <20220412193817.2098308-1-bob.beckett@collabora.com>
 <20220412193817.2098308-2-bob.beckett@collabora.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20220412193817.2098308-2-bob.beckett@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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


On 4/12/22 21:38, Robert Beckett wrote:
> prepare for ttm based stolen region by using ttm range manager
> as the resource manager for stolen region.
>
> Signed-off-by: Robert Beckett <bob.beckett@collabora.com>

LGTM.

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>




> ---
>   drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c |  6 ++--
>   drivers/gpu/drm/i915/intel_region_ttm.c      | 31 +++++++++++++++-----
>   2 files changed, 27 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> index a10716f4e717..358f8a1a30ce 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> @@ -58,11 +58,13 @@ i915_ttm_region(struct ttm_device *bdev, int ttm_mem_type)
>   	struct drm_i915_private *i915 = container_of(bdev, typeof(*i915), bdev);
>   
>   	/* There's some room for optimization here... */
> -	GEM_BUG_ON(ttm_mem_type != I915_PL_SYSTEM &&
> -		   ttm_mem_type < I915_PL_LMEM0);
> +	GEM_BUG_ON(ttm_mem_type == I915_PL_GGTT);
> +
>   	if (ttm_mem_type == I915_PL_SYSTEM)
>   		return intel_memory_region_lookup(i915, INTEL_MEMORY_SYSTEM,
>   						  0);
> +	if (ttm_mem_type == I915_PL_STOLEN)
> +		return i915->mm.stolen_region;
>   
>   	return intel_memory_region_lookup(i915, INTEL_MEMORY_LOCAL,
>   					  ttm_mem_type - I915_PL_LMEM0);
> diff --git a/drivers/gpu/drm/i915/intel_region_ttm.c b/drivers/gpu/drm/i915/intel_region_ttm.c
> index 62ff77445b01..7d49ea72e33f 100644
> --- a/drivers/gpu/drm/i915/intel_region_ttm.c
> +++ b/drivers/gpu/drm/i915/intel_region_ttm.c
> @@ -49,7 +49,7 @@ void intel_region_ttm_device_fini(struct drm_i915_private *dev_priv)
>   
>   /*
>    * Map the i915 memory regions to TTM memory types. We use the
> - * driver-private types for now, reserving TTM_PL_VRAM for stolen
> + * driver-private types for now, reserving I915_PL_STOLEN for stolen
>    * memory and TTM_PL_TT for GGTT use if decided to implement this.
>    */
>   int intel_region_to_ttm_type(const struct intel_memory_region *mem)
> @@ -58,11 +58,17 @@ int intel_region_to_ttm_type(const struct intel_memory_region *mem)
>   
>   	GEM_BUG_ON(mem->type != INTEL_MEMORY_LOCAL &&
>   		   mem->type != INTEL_MEMORY_MOCK &&
> -		   mem->type != INTEL_MEMORY_SYSTEM);
> +		   mem->type != INTEL_MEMORY_SYSTEM &&
> +		   mem->type != INTEL_MEMORY_STOLEN_SYSTEM &&
> +		   mem->type != INTEL_MEMORY_STOLEN_LOCAL);
>   
>   	if (mem->type == INTEL_MEMORY_SYSTEM)
>   		return TTM_PL_SYSTEM;
>   
> +	if (mem->type == INTEL_MEMORY_STOLEN_SYSTEM ||
> +	    mem->type == INTEL_MEMORY_STOLEN_LOCAL)
> +		return I915_PL_STOLEN;
> +
>   	type = mem->instance + TTM_PL_PRIV;
>   	GEM_BUG_ON(type >= TTM_NUM_MEM_TYPES);
>   
> @@ -86,10 +92,16 @@ int intel_region_ttm_init(struct intel_memory_region *mem)
>   	int mem_type = intel_region_to_ttm_type(mem);
>   	int ret;
>   
> -	ret = i915_ttm_buddy_man_init(bdev, mem_type, false,
> -				      resource_size(&mem->region),
> -				      mem->io_size,
> -				      mem->min_page_size, PAGE_SIZE);
> +	if (mem_type == I915_PL_STOLEN) {
> +		ret = ttm_range_man_init(bdev, mem_type, false,
> +					 resource_size(&mem->region) >> PAGE_SHIFT);
> +		mem->is_range_manager = true;
> +	} else {
> +		ret = i915_ttm_buddy_man_init(bdev, mem_type, false,
> +					      resource_size(&mem->region),
> +					      mem->io_size,
> +					      mem->min_page_size, PAGE_SIZE);
> +	}
>   	if (ret)
>   		return ret;
>   
> @@ -109,6 +121,7 @@ int intel_region_ttm_init(struct intel_memory_region *mem)
>   int intel_region_ttm_fini(struct intel_memory_region *mem)
>   {
>   	struct ttm_resource_manager *man = mem->region_private;
> +	int mem_type = intel_region_to_ttm_type(mem);
>   	int ret = -EBUSY;
>   	int count;
>   
> @@ -139,8 +152,10 @@ int intel_region_ttm_fini(struct intel_memory_region *mem)
>   	if (ret || !man)
>   		return ret;
>   
> -	ret = i915_ttm_buddy_man_fini(&mem->i915->bdev,
> -				      intel_region_to_ttm_type(mem));
> +	if (mem_type == I915_PL_STOLEN)
> +		ret = ttm_range_man_fini(&mem->i915->bdev, mem_type);
> +	else
> +		ret = i915_ttm_buddy_man_fini(&mem->i915->bdev, mem_type);
>   	GEM_WARN_ON(ret);
>   	mem->region_private = NULL;
>   
