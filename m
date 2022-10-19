Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95577604DB9
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 18:48:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8518410EB29;
	Wed, 19 Oct 2022 16:48:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3582F10EAC2;
 Wed, 19 Oct 2022 16:48:04 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id b12so26150785edd.6;
 Wed, 19 Oct 2022 09:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OSaSRyiX/wjWbh85TIQgF1JiqL7F2MK28+jKZKjK3/U=;
 b=MAOYJOm2tfpl9fGs5kmgvaFxbuD2WA4Ug0XHAu+awe0pxvtK75PSz94i4ZKhXZwhTa
 hgzUchrs5uGZ2FFAKzmsqnMYBeoJAUsVHvzaJOLzmsfglzhKXH6i0FAPeLq224nvsKYc
 V3cPvRVHx+EuKZfykBC+Et8usTyWw4oPbkTpxtnEf5TzXsMjK8fYoVMR8Wz5nY/c6NI+
 pTMi1WAULkfYbUQ7vbQSz2FcsPFj5QEiaQAWkAazjTzdbqq1mtrMwVcZjolWKnwmxaZa
 nq2Agm5lP3mPZQzuOA9qvf9j9lCmBgkg0s/9zx6hTMjGQ1F5Jg6VMmKbzzJCs4yuH0we
 aVJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OSaSRyiX/wjWbh85TIQgF1JiqL7F2MK28+jKZKjK3/U=;
 b=d6xuBCR5V4MGuoKtU2jpd1p34Ko7Kk6E5nKhw82W8Cd1wHFU5qJVoEwUpWB3Z06riA
 HX59qlxhlPyrUY+vdTQcVlGyaXYCMiWHTjsIirKCRS0eftEK4yBSoE0TvR6k2bCCWTkK
 9HMpqbIlRJxUAHnTKGkqWASUAmsOaC33s6QYkJsv1fBjF9yDXrFhTqBoY3QSkJJAl/mc
 //9PoFCfcTbIYsLx8tkeVCunjlYqdtbepKpf9mlKX1E9ZZhYSa4pBtOk+hUU5Zx5lJpH
 o3jq8zQJWtP+FmhWzNKxpWo9eDn7aj70xs7v04Hl3GqRDi/XtSnnCvIqI+FYRrAczWKS
 RCog==
X-Gm-Message-State: ACrzQf0Uz1Oh/sLosDddAQJfNFqzmMViRyl7I+eb9Z+2r/PuUuaop5cz
 Vf/bzvu8Qm6lHWcf8dNHh10=
X-Google-Smtp-Source: AMsMyM6tRJ+RBcN6fWqeo+ednNTravmSv48ucIxxfJtzUKfrv6hHUZqADP8DVZcPCCHMej2s2CKy0g==
X-Received: by 2002:a05:6402:1e88:b0:45d:237f:f468 with SMTP id
 f8-20020a0564021e8800b0045d237ff468mr8180892edf.45.1666198082674; 
 Wed, 19 Oct 2022 09:48:02 -0700 (PDT)
Received: from ?IPV6:2a02:908:1256:79a0:f4ab:6c74:114:840d?
 ([2a02:908:1256:79a0:f4ab:6c74:114:840d])
 by smtp.gmail.com with ESMTPSA id
 9-20020a170906308900b0073c8d4c9f38sm9311716ejv.177.2022.10.19.09.48.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Oct 2022 09:48:02 -0700 (PDT)
Message-ID: <51f6672b-230c-6a41-9ec0-27d8561c0ee2@gmail.com>
Date: Wed, 19 Oct 2022 18:48:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: =?UTF-8?Q?Re=3a_=5bPATCH_4/6=5d_drm/nouveau=3a_fix=e2=80=99s_on_ttm?=
 =?UTF-8?Q?=5fresource_rework_to_use_size=5ft_type?=
Content-Language: en-US
To: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org
References: <20221019152736.654451-1-Amaranath.Somalapuram@amd.com>
 <20221019152736.654451-4-Amaranath.Somalapuram@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20221019152736.654451-4-Amaranath.Somalapuram@amd.com>
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
Cc: alexander.deucher@amd.com, shashank.sharma@amd.com,
 christian.koenig@amd.com, arunpravin.paneerselvam@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 19.10.22 um 17:27 schrieb Somalapuram Amaranath:
> Fix the ttm_resource from num_pages to size_t size.
>
> Signed-off-by: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>

I'm not an expert for nouveau so it might be possible that we better use 
bo->base.size instead of bo->resource->size at some places. But that can 
be cleaned up later if anybody really cares.

Acked-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/nouveau/nouveau_bo.c     | 4 ++--
>   drivers/gpu/drm/nouveau/nouveau_bo0039.c | 4 ++--
>   drivers/gpu/drm/nouveau/nouveau_bo5039.c | 2 +-
>   drivers/gpu/drm/nouveau/nouveau_bo74c1.c | 2 +-
>   drivers/gpu/drm/nouveau/nouveau_bo85b5.c | 4 ++--
>   drivers/gpu/drm/nouveau/nouveau_bo9039.c | 4 ++--
>   drivers/gpu/drm/nouveau/nouveau_bo90b5.c | 4 ++--
>   drivers/gpu/drm/nouveau/nouveau_boa0b5.c | 2 +-
>   drivers/gpu/drm/nouveau/nouveau_gem.c    | 5 ++---
>   drivers/gpu/drm/nouveau/nouveau_mem.c    | 4 ++--
>   drivers/gpu/drm/nouveau/nouveau_ttm.c    | 2 +-
>   11 files changed, 18 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> index 126b3c6e12f9..16ca4a141866 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -532,7 +532,7 @@ nouveau_bo_map(struct nouveau_bo *nvbo)
>   	if (ret)
>   		return ret;
>   
> -	ret = ttm_bo_kmap(&nvbo->bo, 0, nvbo->bo.resource->num_pages, &nvbo->kmap);
> +	ret = ttm_bo_kmap(&nvbo->bo, 0, PFN_UP(nvbo->bo.resource->size), &nvbo->kmap);
>   
>   	ttm_bo_unreserve(&nvbo->bo);
>   	return ret;
> @@ -1236,7 +1236,7 @@ vm_fault_t nouveau_ttm_fault_reserve_notify(struct ttm_buffer_object *bo)
>   	} else {
>   		/* make sure bo is in mappable vram */
>   		if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_TESLA ||
> -		    bo->resource->start + bo->resource->num_pages < mappable)
> +		    bo->resource->start + PFN_UP(bo->resource->size) < mappable)
>   			return 0;
>   
>   		for (i = 0; i < nvbo->placement.num_placement; ++i) {
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo0039.c b/drivers/gpu/drm/nouveau/nouveau_bo0039.c
> index 7390132129fe..e2ce44adaa5c 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo0039.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo0039.c
> @@ -52,7 +52,7 @@ nv04_bo_move_m2mf(struct nouveau_channel *chan, struct ttm_buffer_object *bo,
>   	u32 src_offset = old_reg->start << PAGE_SHIFT;
>   	u32 dst_ctxdma = nouveau_bo_mem_ctxdma(bo, chan, new_reg);
>   	u32 dst_offset = new_reg->start << PAGE_SHIFT;
> -	u32 page_count = new_reg->num_pages;
> +	u32 page_count = PFN_UP(new_reg->size);
>   	int ret;
>   
>   	ret = PUSH_WAIT(push, 3);
> @@ -62,7 +62,7 @@ nv04_bo_move_m2mf(struct nouveau_channel *chan, struct ttm_buffer_object *bo,
>   	PUSH_MTHD(push, NV039, SET_CONTEXT_DMA_BUFFER_IN, src_ctxdma,
>   			       SET_CONTEXT_DMA_BUFFER_OUT, dst_ctxdma);
>   
> -	page_count = new_reg->num_pages;
> +	page_count = PFN_UP(new_reg->size);
>   	while (page_count) {
>   		int line_count = (page_count > 2047) ? 2047 : page_count;
>   
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo5039.c b/drivers/gpu/drm/nouveau/nouveau_bo5039.c
> index 4c75c7b3804c..c6cf3629a9f9 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo5039.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo5039.c
> @@ -41,7 +41,7 @@ nv50_bo_move_m2mf(struct nouveau_channel *chan, struct ttm_buffer_object *bo,
>   {
>   	struct nouveau_mem *mem = nouveau_mem(old_reg);
>   	struct nvif_push *push = chan->chan.push;
> -	u64 length = (new_reg->num_pages << PAGE_SHIFT);
> +	u64 length = new_reg->size;
>   	u64 src_offset = mem->vma[0].addr;
>   	u64 dst_offset = mem->vma[1].addr;
>   	int src_tiled = !!mem->kind;
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo74c1.c b/drivers/gpu/drm/nouveau/nouveau_bo74c1.c
> index ed6c09d67840..9b7ba31fae13 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo74c1.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo74c1.c
> @@ -44,7 +44,7 @@ nv84_bo_move_exec(struct nouveau_channel *chan, struct ttm_buffer_object *bo,
>   	if (ret)
>   		return ret;
>   
> -	PUSH_NVSQ(push, NV74C1, 0x0304, new_reg->num_pages << PAGE_SHIFT,
> +	PUSH_NVSQ(push, NV74C1, 0x0304, new_reg->size,
>   				0x0308, upper_32_bits(mem->vma[0].addr),
>   				0x030c, lower_32_bits(mem->vma[0].addr),
>   				0x0310, upper_32_bits(mem->vma[1].addr),
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo85b5.c b/drivers/gpu/drm/nouveau/nouveau_bo85b5.c
> index dec29b2d8bb2..a15a38a87a95 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo85b5.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo85b5.c
> @@ -44,10 +44,10 @@ nva3_bo_move_copy(struct nouveau_channel *chan, struct ttm_buffer_object *bo,
>   	struct nvif_push *push = chan->chan.push;
>   	u64 src_offset = mem->vma[0].addr;
>   	u64 dst_offset = mem->vma[1].addr;
> -	u32 page_count = new_reg->num_pages;
> +	u32 page_count = PFN_UP(new_reg->size);
>   	int ret;
>   
> -	page_count = new_reg->num_pages;
> +	page_count = PFN_UP(new_reg->size);
>   	while (page_count) {
>   		int line_count = (page_count > 8191) ? 8191 : page_count;
>   
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo9039.c b/drivers/gpu/drm/nouveau/nouveau_bo9039.c
> index 776b04976cdf..d2bb2687d401 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo9039.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo9039.c
> @@ -42,10 +42,10 @@ nvc0_bo_move_m2mf(struct nouveau_channel *chan, struct ttm_buffer_object *bo,
>   	struct nouveau_mem *mem = nouveau_mem(old_reg);
>   	u64 src_offset = mem->vma[0].addr;
>   	u64 dst_offset = mem->vma[1].addr;
> -	u32 page_count = new_reg->num_pages;
> +	u32 page_count = PFN_UP(new_reg->size);
>   	int ret;
>   
> -	page_count = new_reg->num_pages;
> +	page_count = PFN_UP(new_reg->size);
>   	while (page_count) {
>   		int line_count = (page_count > 2047) ? 2047 : page_count;
>   
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo90b5.c b/drivers/gpu/drm/nouveau/nouveau_bo90b5.c
> index 8499f58213e3..4618f4f5ab56 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo90b5.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo90b5.c
> @@ -37,10 +37,10 @@ nvc0_bo_move_copy(struct nouveau_channel *chan, struct ttm_buffer_object *bo,
>   	struct nvif_push *push = chan->chan.push;
>   	u64 src_offset = mem->vma[0].addr;
>   	u64 dst_offset = mem->vma[1].addr;
> -	u32 page_count = new_reg->num_pages;
> +	u32 page_count = PFN_UP(new_reg->size);
>   	int ret;
>   
> -	page_count = new_reg->num_pages;
> +	page_count = PFN_UP(new_reg->size);
>   	while (page_count) {
>   		int line_count = (page_count > 8191) ? 8191 : page_count;
>   
> diff --git a/drivers/gpu/drm/nouveau/nouveau_boa0b5.c b/drivers/gpu/drm/nouveau/nouveau_boa0b5.c
> index 575212472e7a..07a5c6302c98 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_boa0b5.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_boa0b5.c
> @@ -58,7 +58,7 @@ nve0_bo_move_copy(struct nouveau_channel *chan, struct ttm_buffer_object *bo,
>   				PITCH_IN, PAGE_SIZE,
>   				PITCH_OUT, PAGE_SIZE,
>   				LINE_LENGTH_IN, PAGE_SIZE,
> -				LINE_COUNT, new_reg->num_pages);
> +				LINE_COUNT, PFN_UP(new_reg->size));
>   
>   	PUSH_IMMD(push, NVA0B5, LAUNCH_DMA,
>   		  NVDEF(NVA0B5, LAUNCH_DMA, DATA_TRANSFER_TYPE, NON_PIPELINED) |
> diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
> index fab542a758ff..2f479c96e415 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
> @@ -679,7 +679,7 @@ nouveau_gem_pushbuf_reloc_apply(struct nouveau_cli *cli,
>   		}
>   
>   		if (!nvbo->kmap.virtual) {
> -			ret = ttm_bo_kmap(&nvbo->bo, 0, nvbo->bo.resource->num_pages,
> +			ret = ttm_bo_kmap(&nvbo->bo, 0, PFN_UP(nvbo->bo.resource->size),
>   					  &nvbo->kmap);
>   			if (ret) {
>   				NV_PRINTK(err, cli, "failed kmap for reloc\n");
> @@ -868,8 +868,7 @@ nouveau_gem_ioctl_pushbuf(struct drm_device *dev, void *data,
>   			if (unlikely(cmd != req->suffix0)) {
>   				if (!nvbo->kmap.virtual) {
>   					ret = ttm_bo_kmap(&nvbo->bo, 0,
> -							  nvbo->bo.resource->
> -							  num_pages,
> +							  PFN_UP(nvbo->bo.resource->size),
>   							  &nvbo->kmap);
>   					if (ret) {
>   						WIND_RING(chan);
> diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.c b/drivers/gpu/drm/nouveau/nouveau_mem.c
> index 76f8edefa637..1fde3a5d7c32 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_mem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_mem.c
> @@ -115,7 +115,7 @@ nouveau_mem_host(struct ttm_resource *reg, struct ttm_tt *tt)
>   
>   	mutex_lock(&drm->master.lock);
>   	ret = nvif_mem_ctor_type(mmu, "ttmHostMem", cli->mem->oclass, type, PAGE_SHIFT,
> -				 reg->num_pages << PAGE_SHIFT,
> +				 reg->size,
>   				 &args, sizeof(args), &mem->mem);
>   	mutex_unlock(&drm->master.lock);
>   	return ret;
> @@ -128,7 +128,7 @@ nouveau_mem_vram(struct ttm_resource *reg, bool contig, u8 page)
>   	struct nouveau_cli *cli = mem->cli;
>   	struct nouveau_drm *drm = cli->drm;
>   	struct nvif_mmu *mmu = &cli->mmu;
> -	u64 size = ALIGN(reg->num_pages << PAGE_SHIFT, 1 << page);
> +	u64 size = ALIGN(reg->size, 1 << page);
>   	int ret;
>   
>   	mutex_lock(&drm->master.lock);
> diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
> index 9602c30928f2..1469a88910e4 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
> @@ -139,7 +139,7 @@ nv04_gart_manager_new(struct ttm_resource_manager *man,
>   	mem = nouveau_mem(*res);
>   	ttm_resource_init(bo, place, *res);
>   	ret = nvif_vmm_get(&mem->cli->vmm.vmm, PTES, false, 12, 0,
> -			   (long)(*res)->num_pages << PAGE_SHIFT, &mem->vma[0]);
> +			   (long)(*res)->size, &mem->vma[0]);
>   	if (ret) {
>   		nouveau_mem_del(man, *res);
>   		return ret;

