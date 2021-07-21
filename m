Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 320843D0F0E
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 15:01:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B4E66E8DA;
	Wed, 21 Jul 2021 13:01:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91B4F6E89C
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 13:01:40 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso3373917wmh.4
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 06:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=YiW024uu64RKoSLCg8L6iDF7+iL98cCGTOlB6iZdPEc=;
 b=rPYhduA1oZRUm9sY8WM0D6oMGbC+KhQJnEAPW4hryFjb2mzRmnhuNpXy3CpG41To1P
 rmJnuEwu9bk7CL3cLeFUrpGs5kWqPadfr2IALSiHjYpkIHRQtC/4DBU8zhgUpLqRIukS
 Y5zn6mox0BjsZ/+wCrXhnT6UHZ1zWcs8hHsS+gZdTXyve3/8MPl7RtxsWgvBphJOwj/V
 gAicSR7dILj0d7oaOHgOL2XDlDR8/KxBaIRMmuqUsVs9qmt/eDq00m5pygvjJCxnWg8c
 b3njEK++qGTFrZfRqD3pYmmVa9gByrGrHpa1TGfzKkdTpLB10cJo4GfMuGOQyNQ8KmuV
 IbPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=YiW024uu64RKoSLCg8L6iDF7+iL98cCGTOlB6iZdPEc=;
 b=lTT6jdSVXJ9hE39/boF96dSIZmV7p03MxMRO/SOzUJ5C+4WHXLii2FHE/D+gLpiCrI
 ESCN5RDBD9Xm/DNLI2oZ5Pusiur7SDDqEWEDRPXLN7dQIYfL6l/LeQnOsyPSxrB2FtAl
 hwMZ0ndPfDrAnBz6WvAlIbx3Uq/NaAep3t33gNWV8IICEJQ7ZSr5QcL7tKxu7CoLoCWu
 XTOyvdDdiVQEEeeNZ9HMUYC+N7UoMnMr46cEXG/LbwuPqen4R1MBMff6WIg5fW+iiSna
 oSJgtDmOirHltk3CVfffsfRK/UGt6Pl29ULaK8ZFywDabshJueG1yDJs7fcpeNWgQ83G
 lo/g==
X-Gm-Message-State: AOAM533KgK9fLH9X6jR8LQLe7gOG/fUvi2Zvd/C/lOPbf3J2xAzrEBIE
 RRi2AT6PiuaFze6emCBBIOMXeU59Y7A=
X-Google-Smtp-Source: ABdhPJxsSifYJHZt5RQIeIFKeUzJjr0fIDQuS7L2VEbeFQJirdL5KTQYHQcIMsTe9XAfwANH5GVhMg==
X-Received: by 2002:a05:600c:511d:: with SMTP id
 o29mr3923787wms.26.1626872499156; 
 Wed, 21 Jul 2021 06:01:39 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:9bcf:837a:d18c:dc66?
 ([2a02:908:1252:fb60:9bcf:837a:d18c:dc66])
 by smtp.gmail.com with ESMTPSA id r19sm28810227wrg.74.2021.07.21.06.01.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jul 2021 06:01:38 -0700 (PDT)
Subject: Re: [PATCH] drm/ttm: remove special handling for non GEM drivers
To: Jamie Heilman <jamie@audible.transient.net>
References: <20210419092853.1605-1-christian.koenig@amd.com>
 <YPgZxiRY5/pl9IeK@audible.transient.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <f4f6a295-83b2-6ba3-149e-4a49933c9458@gmail.com>
Date: Wed, 21 Jul 2021 15:01:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YPgZxiRY5/pl9IeK@audible.transient.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a known issue and fixed by:

commit a3a9ee4b5254f212c2adaa8cd8ca03bfa112f49d
Author: Christian König <christian.koenig@amd.com>
Date:   Wed Jun 9 19:25:56 2021 +0200

     drm/nouveau: init the base GEM fields for internal BOs

     TTMs buffer objects are based on GEM objects for quite a while
     and rely on initializing those fields before initializing the TTM BO.

     Nouveau now doesn't init the GEM object for internally allocated BOs,
     so make sure that we at least initialize some necessary fields.

Regards,
Christian.

Am 21.07.21 um 14:57 schrieb Jamie Heilman:
> Christian König wrote:
>> vmwgfx is the only driver actually using this. Move the handling into
>> the driver instead.
> Maybe it isn't the only driver?  This commit broke video on my system
> with a G86 [Quadro NVS 290].  Bisected to
> d02117f8efaa5fbc37437df1ae955a147a2a424a, and reverting it restored
> functionality.
>
> dmesg of v5.14-rc2:
>
>   nouveau 0000:01:00.0: vgaarb: deactivate vga console
>   Console: switching to colour dummy device 80x25
>   nouveau 0000:01:00.0: NVIDIA G86 (086f00a2)
>   nouveau 0000:01:00.0: bios: version 60.86.6c.00.21
>   nouveau 0000:01:00.0: bios: M0203T not found
>   nouveau 0000:01:00.0: bios: M0203E not matched!
>   nouveau 0000:01:00.0: fb: 256 MiB DDR2
>   nouveau 0000:01:00.0: DRM: VRAM: 256 MiB
>   nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
>   nouveau 0000:01:00.0: DRM: TMDS table version 2.0
>   nouveau 0000:01:00.0: DRM: DCB version 4.0
>   nouveau 0000:01:00.0: DRM: DCB outp 00: 02011300 00000028
>   nouveau 0000:01:00.0: DRM: DCB outp 01: 01011302 00000010
>   nouveau 0000:01:00.0: DRM: DCB outp 02: 01000310 00000028
>   nouveau 0000:01:00.0: DRM: DCB outp 03: 02000312 00000010
>   nouveau 0000:01:00.0: DRM: DCB conn 00: 2030
>   nouveau 0000:01:00.0: DRM: DCB conn 01: 1130
>   nouveau 0000:01:00.0: DRM: failed to initialise sync subsystem, -28
>   nouveau: probe of 0000:01:00.0 failed with error -28
>
> dmesg of v5.14-rc2 w/d02117f8efaa5fbc37437df1ae955a147a2a424a
> reverted:
>
>   nouveau 0000:01:00.0: vgaarb: deactivate vga console
>   Console: switching to colour dummy device 80x25
>   nouveau 0000:01:00.0: NVIDIA G86 (086f00a2)
>   nouveau 0000:01:00.0: bios: version 60.86.6c.00.21
>   nouveau 0000:01:00.0: bios: M0203T not found
>   nouveau 0000:01:00.0: bios: M0203E not matched!
>   nouveau 0000:01:00.0: fb: 256 MiB DDR2
>   nouveau 0000:01:00.0: DRM: VRAM: 256 MiB
>   nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
>   nouveau 0000:01:00.0: DRM: TMDS table version 2.0
>   nouveau 0000:01:00.0: DRM: DCB version 4.0
>   nouveau 0000:01:00.0: DRM: DCB outp 00: 02011300 00000028
>   nouveau 0000:01:00.0: DRM: DCB outp 01: 01011302 00000010
>   nouveau 0000:01:00.0: DRM: DCB outp 02: 01000310 00000028
>   nouveau 0000:01:00.0: DRM: DCB outp 03: 02000312 00000010
>   nouveau 0000:01:00.0: DRM: DCB conn 00: 2030
>   nouveau 0000:01:00.0: DRM: DCB conn 01: 1130
>   nouveau 0000:01:00.0: DRM: MM: using CRYPT for buffer copies
>   nouveau 0000:01:00.0: DRM: allocated 1920x1200 fb: 0x50000, bo 00000000d0819d42
>   fbcon: nouveau (fb0) is primary device
>   Console: switching to colour frame buffer device 240x75
>   nouveau 0000:01:00.0: [drm] fb0: nouveau frame buffer device
>   [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on minor 0
>
>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/ttm/ttm_bo.c       | 11 -----------
>>   drivers/gpu/drm/vmwgfx/vmwgfx_bo.c | 10 ++++++++++
>>   include/drm/ttm/ttm_bo_api.h       | 19 -------------------
>>   3 files changed, 10 insertions(+), 30 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
>> index 80831df0ef61..38183e227116 100644
>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>> @@ -460,8 +460,6 @@ static void ttm_bo_release(struct kref *kref)
>>   
>>   	atomic_dec(&ttm_glob.bo_count);
>>   	dma_fence_put(bo->moving);
>> -	if (!ttm_bo_uses_embedded_gem_object(bo))
>> -		dma_resv_fini(&bo->base._resv);
>>   	bo->destroy(bo);
>>   }
>>   
>> @@ -1056,15 +1054,6 @@ int ttm_bo_init_reserved(struct ttm_device *bdev,
>>   	} else {
>>   		bo->base.resv = &bo->base._resv;
>>   	}
>> -	if (!ttm_bo_uses_embedded_gem_object(bo)) {
>> -		/*
>> -		 * bo.base is not initialized, so we have to setup the
>> -		 * struct elements we want use regardless.
>> -		 */
>> -		bo->base.size = size;
>> -		dma_resv_init(&bo->base._resv);
>> -		drm_vma_node_reset(&bo->base.vma_node);
>> -	}
>>   	atomic_inc(&ttm_glob.bo_count);
>>   
>>   	/*
>> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
>> index 50e529a01677..587314d57991 100644
>> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
>> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
>> @@ -460,6 +460,7 @@ void vmw_bo_bo_free(struct ttm_buffer_object *bo)
>>   	WARN_ON(vmw_bo->dirty);
>>   	WARN_ON(!RB_EMPTY_ROOT(&vmw_bo->res_tree));
>>   	vmw_bo_unmap(vmw_bo);
>> +	dma_resv_fini(&bo->base._resv);
>>   	kfree(vmw_bo);
>>   }
>>   
>> @@ -512,6 +513,11 @@ int vmw_bo_create_kernel(struct vmw_private *dev_priv, unsigned long size,
>>   	if (unlikely(ret))
>>   		goto error_free;
>>   
>> +
>> +	bo->base.size = size;
>> +	dma_resv_init(&bo->base._resv);
>> +	drm_vma_node_reset(&bo->base.vma_node);
>> +
>>   	ret = ttm_bo_init_reserved(&dev_priv->bdev, bo, size,
>>   				   ttm_bo_type_device, placement, 0,
>>   				   &ctx, NULL, NULL, NULL);
>> @@ -570,6 +576,10 @@ int vmw_bo_init(struct vmw_private *dev_priv,
>>   	if (unlikely(ret))
>>   		return ret;
>>   
>> +	vmw_bo->base.base.size = size;
>> +	dma_resv_init(&vmw_bo->base.base._resv);
>> +	drm_vma_node_reset(&vmw_bo->base.base.vma_node);
>> +
>>   	ret = ttm_bo_init_reserved(bdev, &vmw_bo->base, size,
>>   				   ttm_bo_type_device, placement,
>>   				   0, &ctx, NULL, NULL, bo_free);
>> diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
>> index 3587f660e8f4..e88da481a976 100644
>> --- a/include/drm/ttm/ttm_bo_api.h
>> +++ b/include/drm/ttm/ttm_bo_api.h
>> @@ -562,25 +562,6 @@ ssize_t ttm_bo_io(struct ttm_device *bdev, struct file *filp,
>>   int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
>>   		   gfp_t gfp_flags);
>>   
>> -/**
>> - * ttm_bo_uses_embedded_gem_object - check if the given bo uses the
>> - * embedded drm_gem_object.
>> - *
>> - * Most ttm drivers are using gem too, so the embedded
>> - * ttm_buffer_object.base will be initialized by the driver (before
>> - * calling ttm_bo_init).  It is also possible to use ttm without gem
>> - * though (vmwgfx does that).
>> - *
>> - * This helper will figure whenever a given ttm bo is a gem object too
>> - * or not.
>> - *
>> - * @bo: The bo to check.
>> - */
>> -static inline bool ttm_bo_uses_embedded_gem_object(struct ttm_buffer_object *bo)
>> -{
>> -	return bo->base.dev != NULL;
>> -}
>> -
>>   /**
>>    * ttm_bo_pin - Pin the buffer object.
>>    * @bo: The buffer object to pin
>> -- 
>> 2.25.1
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel

