Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E24E7604DD0
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 18:53:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D7FA10EAC2;
	Wed, 19 Oct 2022 16:53:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A23910E7BD;
 Wed, 19 Oct 2022 16:53:10 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id j7so30133739wrr.3;
 Wed, 19 Oct 2022 09:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5DFiDHx5wZGd/yzujkohJJ41a468Rylww7APwMMpKn4=;
 b=bzPrbgNYfXwdkhopwLn8ymzPsBrlZ30EX3+az2D3Lc5d4yg6S/fRbsBmbLMaA6NAts
 iVpDZ0V/kPaRRjy9L1A8APZ6yIR2savHbZsboNyym6zGPJwqbrvhU79EG0Ud5fTm54MA
 3cphkOsqMi3XjypXvRPtlKiM4C2mBvXLuGgMWUZqrzl9C/k93X8ZRbaZIDLfHozEADFR
 DPqnnioH3nPttow+j9bw1eZoY+vH/5FT2NDDumFMEqQvI9P9+3/X3CuhWMOJGAoDPJ3r
 zsrq8Ne5kOxK/JC83FEKjUwSLTvnVV77zzOkQhOlT0iszh27d3nWDYPyyWE3oxLLQyZ/
 i9Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5DFiDHx5wZGd/yzujkohJJ41a468Rylww7APwMMpKn4=;
 b=DuhuHkhlu/lEzYIS6j7g6GxqhBD+XHTFYo8v6s5DrXmhZFDuvnpnhVA3aQhN/zGz6i
 dUwrqyPOxWfeQQqqCvd/JKtU8oON/GfCzKNi9VHkRDET8Pg82CuT+Rk0IWgORrEnNa9e
 lPoeH6JSZYe29ebvxuv10C3Uw7sWO6DjUuVMaSnN6r+blYWoogiX217juXjwCTxsKVjd
 5gXXAZOM0Ny2jF/Ye4HKgfD3PnUvTEwcbbLEnt3vrgLF8WOOQLLgBHKsQ+FawLnApri8
 ZID8FZigwUH47m94XmYqfNpvjrxj5I37EN+9BGUYqzb34TkHH6IqhfwaoAxbB+9KgV9m
 uwrA==
X-Gm-Message-State: ACrzQf0DLA/imvCoy3oxjNiGH5vDoolnbGhEE7X2X5KNn5qazC3u5E4Y
 8qIro5kIOA9squBTsykRUBUk8cFKC6c=
X-Google-Smtp-Source: AMsMyM4RIfA1QI4OC4Ia4N+eUpNxPu9nQ66XldpkOoEqi3iFNIE6g1LBWU4SXrLT9q5GVd3/2iZsHg==
X-Received: by 2002:a05:6000:1549:b0:22e:519e:f39d with SMTP id
 9-20020a056000154900b0022e519ef39dmr5842291wry.703.1666198388729; 
 Wed, 19 Oct 2022 09:53:08 -0700 (PDT)
Received: from ?IPV6:2a02:908:1256:79a0:f4ab:6c74:114:840d?
 ([2a02:908:1256:79a0:f4ab:6c74:114:840d])
 by smtp.gmail.com with ESMTPSA id
 c11-20020a05600c0a4b00b003c0d504a92csm480928wmq.22.2022.10.19.09.53.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Oct 2022 09:53:08 -0700 (PDT)
Message-ID: <9fbd22af-e21b-a3bb-634c-53b4ca22297d@gmail.com>
Date: Wed, 19 Oct 2022 18:53:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: =?UTF-8?Q?Re=3a_=5bPATCH_5/6=5d_drm/radeon=3a_fix=e2=80=99s_on_ttm?=
 =?UTF-8?Q?=5fresource_rework_to_use_size=5ft_type?=
Content-Language: en-US
To: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org
References: <20221019152736.654451-1-Amaranath.Somalapuram@amd.com>
 <20221019152736.654451-5-Amaranath.Somalapuram@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20221019152736.654451-5-Amaranath.Somalapuram@amd.com>
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
> ---
>   drivers/gpu/drm/radeon/radeon_cs.c     | 4 ++--
>   drivers/gpu/drm/radeon/radeon_object.c | 4 ++--
>   drivers/gpu/drm/radeon/radeon_trace.h  | 2 +-
>   drivers/gpu/drm/radeon/radeon_ttm.c    | 4 ++--
>   4 files changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_cs.c b/drivers/gpu/drm/radeon/radeon_cs.c
> index 446f7bae54c4..4c930f0cf132 100644
> --- a/drivers/gpu/drm/radeon/radeon_cs.c
> +++ b/drivers/gpu/drm/radeon/radeon_cs.c
> @@ -400,8 +400,8 @@ static int cmp_size_smaller_first(void *priv, const struct list_head *a,
>   	struct radeon_bo_list *lb = list_entry(b, struct radeon_bo_list, tv.head);
>   
>   	/* Sort A before B if A is smaller. */
> -	return (int)la->robj->tbo.resource->num_pages -
> -		(int)lb->robj->tbo.resource->num_pages;
> +	return (int)PFN_UP(la->robj->tbo.resource->size) -
> +		(int)PFN_UP(lb->robj->tbo.resource->size);

I think you can drop the conversion and PFN_UP. What we need here is a 
compare result. Something like this:

if (la->robj->tbo.resource->size > lb->robj->tbo.resource->size)
     return 1;
if (la->robj->tbo.resource->size < lb->robj->tbo.resource->size)
     return -1;
return 0;

And I think it makes more sense to use tbo.base.size here as well 
instead of the resource size.

Regards,
Christian.

>   }
>   
>   /**
> diff --git a/drivers/gpu/drm/radeon/radeon_object.c b/drivers/gpu/drm/radeon/radeon_object.c
> index 00c33b24d5d3..710d04fcbea6 100644
> --- a/drivers/gpu/drm/radeon/radeon_object.c
> +++ b/drivers/gpu/drm/radeon/radeon_object.c
> @@ -232,7 +232,7 @@ int radeon_bo_kmap(struct radeon_bo *bo, void **ptr)
>   		}
>   		return 0;
>   	}
> -	r = ttm_bo_kmap(&bo->tbo, 0, bo->tbo.resource->num_pages, &bo->kmap);
> +	r = ttm_bo_kmap(&bo->tbo, 0, PFN_UP(bo->tbo.resource->size), &bo->kmap);
>   	if (r) {
>   		return r;
>   	}
> @@ -737,7 +737,7 @@ vm_fault_t radeon_bo_fault_reserve_notify(struct ttm_buffer_object *bo)
>   	if (bo->resource->mem_type != TTM_PL_VRAM)
>   		return 0;
>   
> -	size = bo->resource->num_pages << PAGE_SHIFT;
> +	size = bo->resource->size;
>   	offset = bo->resource->start << PAGE_SHIFT;
>   	if ((offset + size) <= rdev->mc.visible_vram_size)
>   		return 0;
> diff --git a/drivers/gpu/drm/radeon/radeon_trace.h b/drivers/gpu/drm/radeon/radeon_trace.h
> index c9fed5f2b870..22676617e1a5 100644
> --- a/drivers/gpu/drm/radeon/radeon_trace.h
> +++ b/drivers/gpu/drm/radeon/radeon_trace.h
> @@ -22,7 +22,7 @@ TRACE_EVENT(radeon_bo_create,
>   
>   	    TP_fast_assign(
>   			   __entry->bo = bo;
> -			   __entry->pages = bo->tbo.resource->num_pages;
> +			   __entry->pages = PFN_UP(bo->tbo.resource->size);
>   			   ),
>   	    TP_printk("bo=%p, pages=%u", __entry->bo, __entry->pages)
>   );
> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
> index d33fec488713..fff48306c05f 100644
> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> @@ -181,7 +181,7 @@ static int radeon_move_blit(struct ttm_buffer_object *bo,
>   
>   	BUILD_BUG_ON((PAGE_SIZE % RADEON_GPU_PAGE_SIZE) != 0);
>   
> -	num_pages = new_mem->num_pages * (PAGE_SIZE / RADEON_GPU_PAGE_SIZE);
> +	num_pages = PFN_UP(new_mem->size) * (PAGE_SIZE / RADEON_GPU_PAGE_SIZE);
>   	fence = radeon_copy(rdev, old_start, new_start, num_pages, bo->base.resv);
>   	if (IS_ERR(fence))
>   		return PTR_ERR(fence);
> @@ -268,7 +268,7 @@ static int radeon_bo_move(struct ttm_buffer_object *bo, bool evict,
>   static int radeon_ttm_io_mem_reserve(struct ttm_device *bdev, struct ttm_resource *mem)
>   {
>   	struct radeon_device *rdev = radeon_get_rdev(bdev);
> -	size_t bus_size = (size_t)mem->num_pages << PAGE_SHIFT;
> +	size_t bus_size = (size_t)mem->size;
>   
>   	switch (mem->mem_type) {
>   	case TTM_PL_SYSTEM:

