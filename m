Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDEFB4E2409
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 11:11:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A16E10E06E;
	Mon, 21 Mar 2022 10:11:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A381C10E06E;
 Mon, 21 Mar 2022 10:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647857497; x=1679393497;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=AP4kV1R1UHzXpAMOY2sWgl07rPEHfAd44wDgc9E7PE0=;
 b=LKf/3wThEJbHjWv0ixeopDnrJ+BHObJOmFRl4Xf3tEjmM+V0VA3xl3aF
 LC2ToGOZSkaQIQ47riResHM1tBOSHYBRDQ3wGlqWHz1bRmSIxeOEHtHax
 sUBhg16pCDcMCWzGK2eJmM77kvWnIrjeZ+FEVYux5tP7FbKYndeCOiiRY
 1nxR6LI5fTwR/ntl9jUTVpn4QMZ+fa1IrcF7Mdurl5wcABmzfnvfiuAI/
 erwLBMa0P4bAjWzZoSftebsiPrQMIZGSN5htQNSzPA3vVlVxqdwjiREZD
 97TLSFysZVSjzDc7coqv+atE1SEM0udgx1R2Yyl3Q+8tRCfLSn6zRi3vi A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10292"; a="343943712"
X-IronPort-AV: E=Sophos;i="5.90,198,1643702400"; d="scan'208";a="343943712"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 03:11:37 -0700
X-IronPort-AV: E=Sophos;i="5.90,198,1643702400"; d="scan'208";a="559802511"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.252.57.103])
 ([10.252.57.103])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 03:11:34 -0700
Message-ID: <f461eb40-2ae9-72f0-56a2-b06acc20f5c9@linux.intel.com>
Date: Mon, 21 Mar 2022 11:11:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [Intel-gfx] [PATCH v4 6/8] drm/ttm: Add a parameter to add extra
 pages into ttm_tt
Content-Language: en-US
To: Ramalingam C <ramalingam.c@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <20220319204229.9846-1-ramalingam.c@intel.com>
 <20220319204229.9846-7-ramalingam.c@intel.com>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <20220319204229.9846-7-ramalingam.c@intel.com>
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
Cc: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In the previous version I replied only to the mailing list email so 
probably my email slipped through.

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com> for patch 6-7

On 3/19/2022 9:42 PM, Ramalingam C wrote:
> Add a parameter called "extra_pages" for ttm_tt_init, to indicate that
> driver needs extra pages in ttm_tt.
>
> v2:
>    Used imperative wording [Thomas and Christian]
>
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> cc: Christian Koenig <christian.koenig@amd.com>
> cc: Hellstrom Thomas <thomas.hellstrom@intel.com>
> Reviewed-by: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
> Reviewed-by: Christian Konig <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/drm_gem_vram_helper.c      |  2 +-
>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c    |  2 +-
>   drivers/gpu/drm/qxl/qxl_ttm.c              |  2 +-
>   drivers/gpu/drm/ttm/ttm_agp_backend.c      |  2 +-
>   drivers/gpu/drm/ttm/ttm_tt.c               | 12 +++++++-----
>   drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c |  2 +-
>   include/drm/ttm/ttm_tt.h                   |  4 +++-
>   7 files changed, 15 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
> index dc7f938bfff2..123045b58fec 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -867,7 +867,7 @@ static struct ttm_tt *bo_driver_ttm_tt_create(struct ttm_buffer_object *bo,
>   	if (!tt)
>   		return NULL;
>   
> -	ret = ttm_tt_init(tt, bo, page_flags, ttm_cached);
> +	ret = ttm_tt_init(tt, bo, page_flags, ttm_cached, 0);
>   	if (ret < 0)
>   		goto err_ttm_tt_init;
>   
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> index e4a06fcf741a..3b9f99c765c4 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -290,7 +290,7 @@ static struct ttm_tt *i915_ttm_tt_create(struct ttm_buffer_object *bo,
>   		i915_tt->is_shmem = true;
>   	}
>   
> -	ret = ttm_tt_init(&i915_tt->ttm, bo, page_flags, caching);
> +	ret = ttm_tt_init(&i915_tt->ttm, bo, page_flags, caching, 0);
>   	if (ret)
>   		goto err_free;
>   
> diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_ttm.c
> index b2e33d5ba5d0..52156b54498f 100644
> --- a/drivers/gpu/drm/qxl/qxl_ttm.c
> +++ b/drivers/gpu/drm/qxl/qxl_ttm.c
> @@ -113,7 +113,7 @@ static struct ttm_tt *qxl_ttm_tt_create(struct ttm_buffer_object *bo,
>   	ttm = kzalloc(sizeof(struct ttm_tt), GFP_KERNEL);
>   	if (ttm == NULL)
>   		return NULL;
> -	if (ttm_tt_init(ttm, bo, page_flags, ttm_cached)) {
> +	if (ttm_tt_init(ttm, bo, page_flags, ttm_cached, 0)) {
>   		kfree(ttm);
>   		return NULL;
>   	}
> diff --git a/drivers/gpu/drm/ttm/ttm_agp_backend.c b/drivers/gpu/drm/ttm/ttm_agp_backend.c
> index 6ddc16f0fe2b..d27691f2e451 100644
> --- a/drivers/gpu/drm/ttm/ttm_agp_backend.c
> +++ b/drivers/gpu/drm/ttm/ttm_agp_backend.c
> @@ -134,7 +134,7 @@ struct ttm_tt *ttm_agp_tt_create(struct ttm_buffer_object *bo,
>   	agp_be->mem = NULL;
>   	agp_be->bridge = bridge;
>   
> -	if (ttm_tt_init(&agp_be->ttm, bo, page_flags, ttm_write_combined)) {
> +	if (ttm_tt_init(&agp_be->ttm, bo, page_flags, ttm_write_combined, 0)) {
>   		kfree(agp_be);
>   		return NULL;
>   	}
> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
> index d234aab800a0..1a66d9fc589a 100644
> --- a/drivers/gpu/drm/ttm/ttm_tt.c
> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> @@ -134,9 +134,10 @@ void ttm_tt_destroy(struct ttm_device *bdev, struct ttm_tt *ttm)
>   static void ttm_tt_init_fields(struct ttm_tt *ttm,
>   			       struct ttm_buffer_object *bo,
>   			       uint32_t page_flags,
> -			       enum ttm_caching caching)
> +			       enum ttm_caching caching,
> +			       unsigned long extra_pages)
>   {
> -	ttm->num_pages = PAGE_ALIGN(bo->base.size) >> PAGE_SHIFT;
> +	ttm->num_pages = (PAGE_ALIGN(bo->base.size) >> PAGE_SHIFT) + extra_pages;
>   	ttm->caching = ttm_cached;
>   	ttm->page_flags = page_flags;
>   	ttm->dma_address = NULL;
> @@ -146,9 +147,10 @@ static void ttm_tt_init_fields(struct ttm_tt *ttm,
>   }
>   
>   int ttm_tt_init(struct ttm_tt *ttm, struct ttm_buffer_object *bo,
> -		uint32_t page_flags, enum ttm_caching caching)
> +		uint32_t page_flags, enum ttm_caching caching,
> +		unsigned long extra_pages)
>   {
> -	ttm_tt_init_fields(ttm, bo, page_flags, caching);
> +	ttm_tt_init_fields(ttm, bo, page_flags, caching, extra_pages);
>   
>   	if (ttm_tt_alloc_page_directory(ttm)) {
>   		pr_err("Failed allocating page table\n");
> @@ -180,7 +182,7 @@ int ttm_sg_tt_init(struct ttm_tt *ttm, struct ttm_buffer_object *bo,
>   {
>   	int ret;
>   
> -	ttm_tt_init_fields(ttm, bo, page_flags, caching);
> +	ttm_tt_init_fields(ttm, bo, page_flags, caching, 0);
>   
>   	if (page_flags & TTM_TT_FLAG_EXTERNAL)
>   		ret = ttm_sg_tt_alloc_page_directory(ttm);
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> index b84ecc6d6611..4e3938e62c08 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> @@ -517,7 +517,7 @@ static struct ttm_tt *vmw_ttm_tt_create(struct ttm_buffer_object *bo,
>   				     ttm_cached);
>   	else
>   		ret = ttm_tt_init(&vmw_be->dma_ttm, bo, page_flags,
> -				  ttm_cached);
> +				  ttm_cached, 0);
>   	if (unlikely(ret != 0))
>   		goto out_no_init;
>   
> diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
> index f20832139815..17a0310e8aaa 100644
> --- a/include/drm/ttm/ttm_tt.h
> +++ b/include/drm/ttm/ttm_tt.h
> @@ -140,6 +140,7 @@ int ttm_tt_create(struct ttm_buffer_object *bo, bool zero_alloc);
>    * @bo: The buffer object we create the ttm for.
>    * @page_flags: Page flags as identified by TTM_TT_FLAG_XX flags.
>    * @caching: the desired caching state of the pages
> + * @extra_pages: Extra pages needed for the driver.
>    *
>    * Create a struct ttm_tt to back data with system memory pages.
>    * No pages are actually allocated.
> @@ -147,7 +148,8 @@ int ttm_tt_create(struct ttm_buffer_object *bo, bool zero_alloc);
>    * NULL: Out of memory.
>    */
>   int ttm_tt_init(struct ttm_tt *ttm, struct ttm_buffer_object *bo,
> -		uint32_t page_flags, enum ttm_caching caching);
> +		uint32_t page_flags, enum ttm_caching caching,
> +		unsigned long extra_pages);
>   int ttm_sg_tt_init(struct ttm_tt *ttm_dma, struct ttm_buffer_object *bo,
>   		   uint32_t page_flags, enum ttm_caching caching);
>   
