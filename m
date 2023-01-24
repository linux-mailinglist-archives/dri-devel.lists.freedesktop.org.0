Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DDF679487
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 10:51:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDAB510E02E;
	Tue, 24 Jan 2023 09:51:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3D9F10E02E;
 Tue, 24 Jan 2023 09:51:32 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 d4-20020a05600c3ac400b003db1de2aef0so10488687wms.2; 
 Tue, 24 Jan 2023 01:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=b/hZAUEENIOpitZBZnZD+E68i4562ispX1r1ycpeYpc=;
 b=oYIyZc6rzay73sgztLEhw6NNSmCaFr3RVeP/xaswdl2t9V+9hu+Z7ltoQ6Fo1kSeWY
 3zVycVT63q4CBcnnXK70oDzJC4XdL+Hj8L1m3swGw5gx+fFvc+PEGi60tQJarRzaXgUH
 HT1MLbkhSdYz2SNViBtYpOE4/t3k14tJNe7Q7eg7wPbX4tE7KRwiczIDR+oS6Cfr2LaV
 TYuAnpDWN/I01uTPxUnftzHUlFlZQ52W79nKHexy/PJ4Z/NRnF4GTORg2SFSGPW3W9tx
 PWvMHJsXy2v2qHIzWbCnNDTXQ9Xq6piOOs8xxbbNka51ks1MpYsT7mcDTyaYaxhI4QFy
 Mbuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=b/hZAUEENIOpitZBZnZD+E68i4562ispX1r1ycpeYpc=;
 b=GnJkQFGLaySCkXuSwEzNi51zfJT69fjpCq2GY+yp04Gw2MNuneXSrS4iP5VLn4mD/V
 Igi8entGvzBMTcuUoU5vg7Kvi+B29fVTg2MkMucG5wZOMer1e+nWHkGZgFJWQi9TQPgD
 h5OTRNxlGei1ViTJtpuNxh358+sbaJdTDcWSGE6qZ2AuFj8y+xhLQ+sxW8xTeJ1cjV7q
 FnCyjYzQItLX9mqdsFAnuoOlO6uEKr/Ohp0pS7tBgjVhBZHNZgqnq3OTVQVPMQEpJoqk
 zWEsYWWfUN1Fy6zcl1blN/kobLA9naeN04o0wgLtCBfxnD6jbuaOUpK69b+Kums8wtre
 Abkg==
X-Gm-Message-State: AFqh2krdiDhbALAUB5RpzQxZpIMEg72FkL/6HJkJiYnUITU/NNK+Wveq
 qyZB1yEmHpaVGG3UEwXJisFBiQF8Cqs=
X-Google-Smtp-Source: AMrXdXsX6UoZqizK0I3nJ8+OplJorI77QJ9Uzb6BpjKqgUWPJYAv3y+ivePFN7Psy4MuPv2v4xbzAQ==
X-Received: by 2002:a7b:ca4a:0:b0:3d9:e8b3:57fa with SMTP id
 m10-20020a7bca4a000000b003d9e8b357famr27307764wml.30.1674553891019; 
 Tue, 24 Jan 2023 01:51:31 -0800 (PST)
Received: from [192.168.178.21] (p5b0ea2e7.dip0.t-ipconnect.de.
 [91.14.162.231]) by smtp.gmail.com with ESMTPSA id
 j25-20020a05600c1c1900b003c71358a42dsm18013558wms.18.2023.01.24.01.51.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jan 2023 01:51:30 -0800 (PST)
Message-ID: <f25004e8-ec4e-d9d7-3b8c-6115cf6692a1@gmail.com>
Date: Tue, 24 Jan 2023 10:51:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [Intel-gfx] [PATCH 1/2] drm/ttm: prevent moving of pinned BOs
Content-Language: en-US
To: Matthew Auld <matthew.william.auld@gmail.com>
References: <20230111114256.72669-1-christian.koenig@amd.com>
 <CAM0jSHP7bRn05sWrwHriLeaQifNuqO77UPFsWg0MrW5dCeZphQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <CAM0jSHP7bRn05sWrwHriLeaQifNuqO77UPFsWg0MrW5dCeZphQ@mail.gmail.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 11.01.23 um 14:17 schrieb Matthew Auld:
> On Wed, 11 Jan 2023 at 11:43, Christian König
> <ckoenig.leichtzumerken@gmail.com> wrote:
>> We have checks for this in the individual drivers move callback, but
>> it's probably better to generally forbit that on a higher level.
>>
>> Also stops exporting ttm_resource_compat() since that's not necessary
>> any more after removing the extra checks in vmwgfx.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c |  4 ----
>>   drivers/gpu/drm/nouveau/nouveau_bo.c    |  3 ---
>>   drivers/gpu/drm/radeon/radeon_ttm.c     |  4 ----
>>   drivers/gpu/drm/ttm/ttm_bo.c            | 20 ++++++++++++--------
>>   drivers/gpu/drm/ttm/ttm_resource.c      |  1 -
>>   drivers/gpu/drm/vmwgfx/vmwgfx_bo.c      | 19 ++-----------------
>>   6 files changed, 14 insertions(+), 37 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> index 068c2d8495fd..677cd7d91687 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> @@ -466,11 +466,7 @@ static int amdgpu_bo_move(struct ttm_buffer_object *bo, bool evict,
>>                          return r;
>>          }
>>
>> -       /* Can't move a pinned BO */
>>          abo = ttm_to_amdgpu_bo(bo);
>> -       if (WARN_ON_ONCE(abo->tbo.pin_count > 0))
>> -               return -EINVAL;
>> -
>>          adev = amdgpu_ttm_adev(bo->bdev);
>>
>>          if (!old_mem || (old_mem->mem_type == TTM_PL_SYSTEM &&
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
>> index 288eebc70a67..c2ec91cc845d 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
>> @@ -1015,9 +1015,6 @@ nouveau_bo_move(struct ttm_buffer_object *bo, bool evict,
>>          if (ret)
>>                  goto out_ntfy;
>>
>> -       if (nvbo->bo.pin_count)
>> -               NV_WARN(drm, "Moving pinned object %p!\n", nvbo);
>> -
>>          if (drm->client.device.info.family < NV_DEVICE_INFO_V0_TESLA) {
>>                  ret = nouveau_bo_vm_bind(bo, new_reg, &new_tile);
>>                  if (ret)
>> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
>> index 1e8e287e113c..67075c85f847 100644
>> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
>> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
>> @@ -211,11 +211,7 @@ static int radeon_bo_move(struct ttm_buffer_object *bo, bool evict,
>>          if (r)
>>                  return r;
>>
>> -       /* Can't move a pinned BO */
>>          rbo = container_of(bo, struct radeon_bo, tbo);
>> -       if (WARN_ON_ONCE(rbo->tbo.pin_count > 0))
>> -               return -EINVAL;
>> -
>>          rdev = radeon_get_rdev(bo->bdev);
>>          if (old_mem->mem_type == TTM_PL_SYSTEM && bo->ttm == NULL) {
>>                  ttm_bo_move_null(bo, new_mem);
>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
>> index 326a3d13a829..9baccb2f6e99 100644
>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>> @@ -894,14 +894,18 @@ int ttm_bo_validate(struct ttm_buffer_object *bo,
>>          if (!placement->num_placement && !placement->num_busy_placement)
>>                  return ttm_bo_pipeline_gutting(bo);
>>
>> -       /*
>> -        * Check whether we need to move buffer.
>> -        */
>> -       if (!bo->resource || !ttm_resource_compat(bo->resource, placement)) {
>> -               ret = ttm_bo_move_buffer(bo, placement, ctx);
>> -               if (ret)
>> -                       return ret;
>> -       }
>> +       /* Check whether we need to move buffer. */
>> +       if (bo->resource && ttm_resource_compat(bo->resource, placement))
>> +               return 0;
> Note this now skips the tt create below (intentional?). I think i915
> needed that, since it creates a dummy system resource initially for
> all objects, and then relies on ZERO_ALLOC being set for certain
> objects to know if the memory needs to be cleared or not when later
> doing the dummy -> vram. Thoughts?

That's unproblematic. On initial allocation bo->resource is NULL so we 
never branch out here.

Christian.

>
>> +
>> +       /* Moving of pinned BOs is forbidden */
>> +       if (bo->pin_count)
>> +               return -EINVAL;
>> +
>> +       ret = ttm_bo_move_buffer(bo, placement, ctx);
>> +       if (ret)
>> +               return ret;
>> +
>>          /*
>>           * We might need to add a TTM.
>>           */
>> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
>> index b8a826a24fb2..7333f7a87a2f 100644
>> --- a/drivers/gpu/drm/ttm/ttm_resource.c
>> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
>> @@ -361,7 +361,6 @@ bool ttm_resource_compat(struct ttm_resource *res,
>>
>>          return false;
>>   }
>> -EXPORT_SYMBOL(ttm_resource_compat);
>>
>>   void ttm_resource_set_bo(struct ttm_resource *res,
>>                           struct ttm_buffer_object *bo)
>> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
>> index 321c551784a1..dbcef460c452 100644
>> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
>> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
>> @@ -87,12 +87,7 @@ int vmw_bo_pin_in_placement(struct vmw_private *dev_priv,
>>          if (unlikely(ret != 0))
>>                  goto err;
>>
>> -       if (buf->base.pin_count > 0)
>> -               ret = ttm_resource_compat(bo->resource, placement)
>> -                       ? 0 : -EINVAL;
>> -       else
>> -               ret = ttm_bo_validate(bo, placement, &ctx);
>> -
>> +       ret = ttm_bo_validate(bo, placement, &ctx);
>>          if (!ret)
>>                  vmw_bo_pin_reserved(buf, true);
>>
>> @@ -128,12 +123,6 @@ int vmw_bo_pin_in_vram_or_gmr(struct vmw_private *dev_priv,
>>          if (unlikely(ret != 0))
>>                  goto err;
>>
>> -       if (buf->base.pin_count > 0) {
>> -               ret = ttm_resource_compat(bo->resource, &vmw_vram_gmr_placement)
>> -                       ? 0 : -EINVAL;
>> -               goto out_unreserve;
>> -       }
>> -
>>          ret = ttm_bo_validate(bo, &vmw_vram_gmr_placement, &ctx);
>>          if (likely(ret == 0) || ret == -ERESTARTSYS)
>>                  goto out_unreserve;
>> @@ -218,11 +207,7 @@ int vmw_bo_pin_in_start_of_vram(struct vmw_private *dev_priv,
>>                  (void) ttm_bo_validate(bo, &vmw_sys_placement, &ctx);
>>          }
>>
>> -       if (buf->base.pin_count > 0)
>> -               ret = ttm_resource_compat(bo->resource, &placement)
>> -                       ? 0 : -EINVAL;
>> -       else
>> -               ret = ttm_bo_validate(bo, &placement, &ctx);
>> +       ret = ttm_bo_validate(bo, &placement, &ctx);
>>
>>          /* For some reason we didn't end up at the start of vram */
>>          WARN_ON(ret == 0 && bo->resource->start != 0);
>> --
>> 2.34.1
>>

