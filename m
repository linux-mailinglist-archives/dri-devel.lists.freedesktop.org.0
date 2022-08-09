Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D40658D6D5
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 11:53:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 543AB9183D;
	Tue,  9 Aug 2022 09:53:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 069C591176;
 Tue,  9 Aug 2022 09:52:46 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id m4so21285207ejr.3;
 Tue, 09 Aug 2022 02:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=wHoSlqmMtgv3RSRfv73vFTSusIfhwVDynxIvMNJ1bzQ=;
 b=RYB2yYmuxyXmNe24xbs+t7E3qwZGlW3YpzFLxTm6yBcZzgZG5oia+l8byq1aU8aatZ
 DVyx+4pEMXzlraWqfaA9KaazrLqF809Jj1SOumuRdkj9E3VA4boQTeo4aGZcStfefrC3
 ZHrA2xoqj+TPqUed8wHdhm1Clce9LMDRO25J3lf1MBSCbzdoNOpxZymTT1gKIv2Q3sIF
 UBXpWRoHj4L1MP47gVMQXWbPIM0MelrTielPgqMfmvXtpqotNWbSRFd16PvMPHURVrDy
 /8slgXp59vBppSLezcm3qCzen6r4Y4MbvN8vgp49vDvJ5EZL2ZCruCxpCAtKLlaYPWVi
 YA8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=wHoSlqmMtgv3RSRfv73vFTSusIfhwVDynxIvMNJ1bzQ=;
 b=EJA+vhzbjjfRiHhabhNe9iNwdm6YG2FBo+HOsUXrkTmfLm1UpASjsaH6jtZl/xrn/L
 vksb8VmMpnVqJVJyL5pyqibsoOL/lJEeSWPcbG/+OmUKrfpmB5GYlEsSUaFtXNNhPll4
 Lw4nIgqDAlEhcIIcMoX8fcg8HnxuA4LqP9EEVcigcRtmXZ8Zm8U2Jf3ich6TlJb6g6z1
 Fxkt2zYicI1AULPPSnxcemPoZ98euFpL/eyPziLOgQ7BSruGGQCpzlWHiscVGfJn5lum
 rAXVDqLqX66QVcEQMv6+e+f+eVhral/QAmYIfaOHCQ446ttdh3LKjnd8HrVscHUFmtyY
 zYbQ==
X-Gm-Message-State: ACgBeo0/p2MXM/apVeTMbSE326dOSASjxyXUBnQMNPJR17oJ5KXaE6VB
 hljabMe5aDjkBA/u4W8ws9Q=
X-Google-Smtp-Source: AA6agR4jSNh6rETUd+rE+SHoINNl0U3eqvkgQVwSNOcerMFJE6gGkZVN2NUWt6my7K97Ze8kZehf8g==
X-Received: by 2002:a17:907:da4:b0:72f:755:ce3f with SMTP id
 go36-20020a1709070da400b0072f0755ce3fmr17043908ejc.111.1660038765456; 
 Tue, 09 Aug 2022 02:52:45 -0700 (PDT)
Received: from [192.168.178.21] (p57b0bd9f.dip0.t-ipconnect.de.
 [87.176.189.159]) by smtp.gmail.com with ESMTPSA id
 zk3-20020a17090733c300b0072b2378027csm936935ejb.26.2022.08.09.02.52.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Aug 2022 02:52:44 -0700 (PDT)
Message-ID: <24c9482f-6e69-dddd-83d3-5164c6600e5c@gmail.com>
Date: Tue, 9 Aug 2022 11:52:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v5 6/6] drm/ttm: Switch to using the new res callback
Content-Language: en-US
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org
References: <20220809092230.2808-1-Arunpravin.PaneerSelvam@amd.com>
 <20220809092230.2808-6-Arunpravin.PaneerSelvam@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20220809092230.2808-6-Arunpravin.PaneerSelvam@amd.com>
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
Cc: alexander.deucher@amd.com, luben.tuikov@amd.com, christian.koenig@amd.com,
 matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 09.08.22 um 11:22 schrieb Arunpravin Paneer Selvam:
> Apply new intersect and compatible callback instead
> of having a generic placement range verfications.
>
> v2: Added a separate callback for compatiblilty
>      checks (Christian)

We need to move parts of this patch earlier or the i915 will temporary 
break the driver until this here is applied.

I suggest to have most of this in the first patch and use the existing 
res->start checks as fallback when the new callbacks are not implemented 
yet.

This here can then be the last patch with cleanups and removal of those 
workarounds.

Apart from that looks like a nice cleanup to me.

Regards,
Christian.

>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 45 +++++++------------------
>   drivers/gpu/drm/ttm/ttm_bo.c            |  9 +++--
>   drivers/gpu/drm/ttm/ttm_resource.c      |  5 +--
>   3 files changed, 20 insertions(+), 39 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 170935c294f5..7d25a10395c0 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -1328,11 +1328,12 @@ uint64_t amdgpu_ttm_tt_pte_flags(struct amdgpu_device *adev, struct ttm_tt *ttm,
>   static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
>   					    const struct ttm_place *place)
>   {
> -	unsigned long num_pages = bo->resource->num_pages;
>   	struct dma_resv_iter resv_cursor;
> -	struct amdgpu_res_cursor cursor;
>   	struct dma_fence *f;
>   
> +	if (!amdgpu_bo_is_amdgpu_bo(bo))
> +		return ttm_bo_eviction_valuable(bo, place);
> +
>   	/* Swapout? */
>   	if (bo->resource->mem_type == TTM_PL_SYSTEM)
>   		return true;
> @@ -1351,40 +1352,20 @@ static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
>   			return false;
>   	}
>   
> -	switch (bo->resource->mem_type) {
> -	case AMDGPU_PL_PREEMPT:
> -		/* Preemptible BOs don't own system resources managed by the
> -		 * driver (pages, VRAM, GART space). They point to resources
> -		 * owned by someone else (e.g. pageable memory in user mode
> -		 * or a DMABuf). They are used in a preemptible context so we
> -		 * can guarantee no deadlocks and good QoS in case of MMU
> -		 * notifiers or DMABuf move notifiers from the resource owner.
> -		 */
> +	/* Preemptible BOs don't own system resources managed by the
> +	 * driver (pages, VRAM, GART space). They point to resources
> +	 * owned by someone else (e.g. pageable memory in user mode
> +	 * or a DMABuf). They are used in a preemptible context so we
> +	 * can guarantee no deadlocks and good QoS in case of MMU
> +	 * notifiers or DMABuf move notifiers from the resource owner.
> +	 */
> +	if (bo->resource->mem_type == AMDGPU_PL_PREEMPT)
>   		return false;
> -	case TTM_PL_TT:
> -		if (amdgpu_bo_is_amdgpu_bo(bo) &&
> -		    amdgpu_bo_encrypted(ttm_to_amdgpu_bo(bo)))
> -			return false;
> -		return true;
>   
> -	case TTM_PL_VRAM:
> -		/* Check each drm MM node individually */
> -		amdgpu_res_first(bo->resource, 0, (u64)num_pages << PAGE_SHIFT,
> -				 &cursor);
> -		while (cursor.remaining) {
> -			if (place->fpfn < PFN_DOWN(cursor.start + cursor.size)
> -			    && !(place->lpfn &&
> -				 place->lpfn <= PFN_DOWN(cursor.start)))
> -				return true;
> -
> -			amdgpu_res_next(&cursor, cursor.size);
> -		}
> +	if (bo->resource->mem_type == TTM_PL_TT &&
> +	    amdgpu_bo_encrypted(ttm_to_amdgpu_bo(bo)))
>   		return false;
>   
> -	default:
> -		break;
> -	}
> -
>   	return ttm_bo_eviction_valuable(bo, place);
>   }
>   
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index c1bd006a5525..f066e8124c50 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -518,6 +518,9 @@ static int ttm_bo_evict(struct ttm_buffer_object *bo,
>   bool ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
>   			      const struct ttm_place *place)
>   {
> +	struct ttm_resource *res = bo->resource;
> +	struct ttm_device *bdev = bo->bdev;
> +
>   	dma_resv_assert_held(bo->base.resv);
>   	if (bo->resource->mem_type == TTM_PL_SYSTEM)
>   		return true;
> @@ -525,11 +528,7 @@ bool ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
>   	/* Don't evict this BO if it's outside of the
>   	 * requested placement range
>   	 */
> -	if (place->fpfn >= (bo->resource->start + bo->resource->num_pages) ||
> -	    (place->lpfn && place->lpfn <= bo->resource->start))
> -		return false;
> -
> -	return true;
> +	return ttm_resource_intersects(bdev, res, place, bo->base.size);
>   }
>   EXPORT_SYMBOL(ttm_bo_eviction_valuable);
>   
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
> index ea67976f1f60..a729c32a1e48 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -316,6 +316,8 @@ static bool ttm_resource_places_compat(struct ttm_resource *res,
>   				       const struct ttm_place *places,
>   				       unsigned num_placement)
>   {
> +	struct ttm_buffer_object *bo = res->bo;
> +	struct ttm_device *bdev = bo->bdev;
>   	unsigned i;
>   
>   	if (res->placement & TTM_PL_FLAG_TEMPORARY)
> @@ -324,8 +326,7 @@ static bool ttm_resource_places_compat(struct ttm_resource *res,
>   	for (i = 0; i < num_placement; i++) {
>   		const struct ttm_place *heap = &places[i];
>   
> -		if (res->start < heap->fpfn || (heap->lpfn &&
> -		    (res->start + res->num_pages) > heap->lpfn))
> +		if (!ttm_resource_compatible(bdev, res, heap, bo->base.size))
>   			continue;
>   
>   		if ((res->mem_type == heap->mem_type) &&

