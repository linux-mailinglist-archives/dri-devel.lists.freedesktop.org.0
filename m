Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B473B7FD7F
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 16:15:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B78A10E840;
	Wed, 17 Sep 2025 14:15:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U7ySC5Bo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9299010E840
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 14:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758118515; x=1789654515;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=PvjMnOUKLqdPV8xVLo20HFKg/yu6uJC0sbCEMxaY1GE=;
 b=U7ySC5BovCCZBZmoLoTMf8KKZjs/Fg56yZzc/qRzX9DfgagwanifoQkh
 3HNEGMS/OVd8PTnvBSD607aKGFmhvINWE/9oUvy/jXdlsn46rN7GpU4b/
 Na/Qf6NpOleZqfZacbMJ6zOj0Oh8JpdG40TDsEBO5VSZXWv1VnjHY664T
 1LOPE035bMHI86k6bkcMk5Y9nc/Jf0pImwR39cPmNYVlW5OWcmnWuYjXe
 +VWbzGvjXukrWcXWY/uQERT8lQ7dlwR+V2YReYrNbNChlyJ1w8J91BnMm
 XEhqMEoS3LHInWVes6KrJBjfrXwBtBGrSZcn6whSo++4hT80KWmsS994H A==;
X-CSE-ConnectionGUID: 5iVINg4ARfuNvWaoyDV2Mg==
X-CSE-MsgGUID: frbRibrxRHCQFeUF619Rmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="60305592"
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; d="scan'208";a="60305592"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 07:15:14 -0700
X-CSE-ConnectionGUID: Q5ny7hW3TBCcs6wQCEYGew==
X-CSE-MsgGUID: KqteOelKRHeBSHX7pWIwPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; d="scan'208";a="206192108"
Received: from mfalkows-mobl.ger.corp.intel.com (HELO [10.245.84.158])
 ([10.245.84.158])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 07:15:12 -0700
Message-ID: <a682eea5-8956-49a4-87a5-8affc3a03c03@linux.intel.com>
Date: Wed, 17 Sep 2025 16:15:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] accel/amdxdna: Call dma_buf_vmap_unlocked() for
 imported object
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com,
 mario.limonciello@amd.com
References: <20250916174842.234709-1-lizhi.hou@amd.com>
Content-Language: en-US
From: "Falkowski, Maciej" <maciej.falkowski@linux.intel.com>
In-Reply-To: <20250916174842.234709-1-lizhi.hou@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>

On 9/16/2025 7:48 PM, Lizhi Hou wrote:
> In amdxdna_gem_obj_vmap(), calling dma_buf_vmap() triggers a kernel
> warning if LOCKDEP is enabled. So for imported object, use
> dma_buf_vmap_unlocked(). Then, use drm_gem_vmap() for other objects.
> The similar change applies to vunmap code.
>
> Fixes: bd72d4acda10 ("accel/amdxdna: Support user space allocated buffer")
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
> ---
>   drivers/accel/amdxdna/amdxdna_gem.c | 47 ++++++++++++-----------------
>   1 file changed, 20 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/accel/amdxdna/amdxdna_gem.c b/drivers/accel/amdxdna/amdxdna_gem.c
> index d407a36eb412..7f91863c3f24 100644
> --- a/drivers/accel/amdxdna/amdxdna_gem.c
> +++ b/drivers/accel/amdxdna/amdxdna_gem.c
> @@ -392,35 +392,33 @@ static const struct dma_buf_ops amdxdna_dmabuf_ops = {
>   	.vunmap = drm_gem_dmabuf_vunmap,
>   };
>   
> -static int amdxdna_gem_obj_vmap(struct drm_gem_object *obj, struct iosys_map *map)
> +static int amdxdna_gem_obj_vmap(struct amdxdna_gem_obj *abo, void **vaddr)
>   {
> -	struct amdxdna_gem_obj *abo = to_xdna_obj(obj);
> -
> -	iosys_map_clear(map);
> -
> -	dma_resv_assert_held(obj->resv);
> +	struct iosys_map map = IOSYS_MAP_INIT_VADDR(NULL);
> +	int ret;
>   
>   	if (is_import_bo(abo))
> -		dma_buf_vmap(abo->dma_buf, map);
> +		ret = dma_buf_vmap_unlocked(abo->dma_buf, &map);
>   	else
> -		drm_gem_shmem_object_vmap(obj, map);
> -
> -	if (!map->vaddr)
> -		return -ENOMEM;
> +		ret = drm_gem_vmap(to_gobj(abo), &map);
>   
> -	return 0;
> +	*vaddr = map.vaddr;
> +	return ret;
>   }
>   
> -static void amdxdna_gem_obj_vunmap(struct drm_gem_object *obj, struct iosys_map *map)
> +static void amdxdna_gem_obj_vunmap(struct amdxdna_gem_obj *abo)
>   {
> -	struct amdxdna_gem_obj *abo = to_xdna_obj(obj);
> +	struct iosys_map map;
> +
> +	if (!abo->mem.kva)
> +		return;
>   
> -	dma_resv_assert_held(obj->resv);
> +	iosys_map_set_vaddr(&map, abo->mem.kva);
>   
>   	if (is_import_bo(abo))
> -		dma_buf_vunmap(abo->dma_buf, map);
> +		dma_buf_vunmap_unlocked(abo->dma_buf, &map);
>   	else
> -		drm_gem_shmem_object_vunmap(obj, map);
> +		drm_gem_vunmap(to_gobj(abo), &map);
>   }
>   
>   static struct dma_buf *amdxdna_gem_prime_export(struct drm_gem_object *gobj, int flags)
> @@ -455,7 +453,6 @@ static void amdxdna_gem_obj_free(struct drm_gem_object *gobj)
>   {
>   	struct amdxdna_dev *xdna = to_xdna_dev(gobj->dev);
>   	struct amdxdna_gem_obj *abo = to_xdna_obj(gobj);
> -	struct iosys_map map = IOSYS_MAP_INIT_VADDR(abo->mem.kva);
>   
>   	XDNA_DBG(xdna, "BO type %d xdna_addr 0x%llx", abo->type, abo->mem.dev_addr);
>   
> @@ -468,7 +465,7 @@ static void amdxdna_gem_obj_free(struct drm_gem_object *gobj)
>   	if (abo->type == AMDXDNA_BO_DEV_HEAP)
>   		drm_mm_takedown(&abo->mm);
>   
> -	drm_gem_vunmap(gobj, &map);
> +	amdxdna_gem_obj_vunmap(abo);
>   	mutex_destroy(&abo->lock);
>   
>   	if (is_import_bo(abo)) {
> @@ -489,8 +486,8 @@ static const struct drm_gem_object_funcs amdxdna_gem_shmem_funcs = {
>   	.pin = drm_gem_shmem_object_pin,
>   	.unpin = drm_gem_shmem_object_unpin,
>   	.get_sg_table = drm_gem_shmem_object_get_sg_table,
> -	.vmap = amdxdna_gem_obj_vmap,
> -	.vunmap = amdxdna_gem_obj_vunmap,
> +	.vmap = drm_gem_shmem_object_vmap,
> +	.vunmap = drm_gem_shmem_object_vunmap,
>   	.mmap = amdxdna_gem_obj_mmap,
>   	.vm_ops = &drm_gem_shmem_vm_ops,
>   	.export = amdxdna_gem_prime_export,
> @@ -663,7 +660,6 @@ amdxdna_drm_create_dev_heap(struct drm_device *dev,
>   			    struct drm_file *filp)
>   {
>   	struct amdxdna_client *client = filp->driver_priv;
> -	struct iosys_map map = IOSYS_MAP_INIT_VADDR(NULL);
>   	struct amdxdna_dev *xdna = to_xdna_dev(dev);
>   	struct amdxdna_gem_obj *abo;
>   	int ret;
> @@ -692,12 +688,11 @@ amdxdna_drm_create_dev_heap(struct drm_device *dev,
>   	abo->mem.dev_addr = client->xdna->dev_info->dev_mem_base;
>   	drm_mm_init(&abo->mm, abo->mem.dev_addr, abo->mem.size);
>   
> -	ret = drm_gem_vmap(to_gobj(abo), &map);
> +	ret = amdxdna_gem_obj_vmap(abo, &abo->mem.kva);
>   	if (ret) {
>   		XDNA_ERR(xdna, "Vmap heap bo failed, ret %d", ret);
>   		goto release_obj;
>   	}
> -	abo->mem.kva = map.vaddr;
>   
>   	client->dev_heap = abo;
>   	drm_gem_object_get(to_gobj(abo));
> @@ -748,7 +743,6 @@ amdxdna_drm_create_cmd_bo(struct drm_device *dev,
>   			  struct amdxdna_drm_create_bo *args,
>   			  struct drm_file *filp)
>   {
> -	struct iosys_map map = IOSYS_MAP_INIT_VADDR(NULL);
>   	struct amdxdna_dev *xdna = to_xdna_dev(dev);
>   	struct amdxdna_gem_obj *abo;
>   	int ret;
> @@ -770,12 +764,11 @@ amdxdna_drm_create_cmd_bo(struct drm_device *dev,
>   	abo->type = AMDXDNA_BO_CMD;
>   	abo->client = filp->driver_priv;
>   
> -	ret = drm_gem_vmap(to_gobj(abo), &map);
> +	ret = amdxdna_gem_obj_vmap(abo, &abo->mem.kva);
>   	if (ret) {
>   		XDNA_ERR(xdna, "Vmap cmd bo failed, ret %d", ret);
>   		goto release_obj;
>   	}
> -	abo->mem.kva = map.vaddr;
>   
>   	return abo;
>   
