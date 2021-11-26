Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E807045E88F
	for <lists+dri-devel@lfdr.de>; Fri, 26 Nov 2021 08:39:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8465B6E8F3;
	Fri, 26 Nov 2021 07:39:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E7056E8F3
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Nov 2021 07:39:33 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id u18so16705268wrg.5
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Nov 2021 23:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=Z4qM1aDwBXx0naI+WdfxulobluLFLoXrQOLk9yCjQdw=;
 b=bKs4QO57RaXkxGQhUbMyBvyhqBB9EmvPYIVwk4iXtq6ei9vxJ8jT5YojLw0voesGRv
 QhyYmA9FKFwVePty9EoFwxAvt4lf+P6bCmJ8csMK12g6WHdr6eCmmJr5250QOzS3mJ/t
 AAt2hfuK6PPXjKV6/LcJ392Bbic8Mbd0kv/D16QeyHBbXBuJDpX9nLngiHWgfcHpx2Gv
 6L9qJm+0q8l13ief/gXvdIwQtAYrCw+oJBFTsBunlkqpzKxIMlGlvE01n4nSzJSJWqhh
 +JEZdhVRbsnKjH/ouQzFgWQ97jn1OY/wSZm9EJbhB3UUOx6pqON6uP4GBcYJMsoGXous
 BOfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Z4qM1aDwBXx0naI+WdfxulobluLFLoXrQOLk9yCjQdw=;
 b=AOaWrqUlM8PnRKW6Hzog3MU14l72pvvs7BxDKRTzM2e7CbLvgsv3g8QkVU16BHz6bB
 MrqUPZC5G9nJJvm+r8du3RU8lxwUqIFqsJwknx4jZBD6Ra4elMw2x5TdSEoOgHHDgKnM
 s4sxygqoBdm0MELtzxUmPK8B6m5Ud6v/jxQESAlGyJZiNEuhAZQGyCeuYVpQWl7258Pf
 eTCuQU+px+qZD0WAlFcSfNba+98ms2DwZkdkPwjMO0fpGFgT/0OcojWN0/R9Btf+UIPh
 hkFZgX93WtqUIjPg5xSntSSZEL0q/bJkIoKSTY/8ozP+Mgr11HcdVH8cEi7wWFpRf5ww
 Vuzw==
X-Gm-Message-State: AOAM532StkCewlEkYcPWd7NfsmYKBVX34b//I9kkZ2Iam322JX4KNwaV
 +cLoW8+A8lMc9lObbNTDKbmbYEni8GA=
X-Google-Smtp-Source: ABdhPJzXYP1eKy6RvPVuFaoHKQwSIrEc+xwtxjG+Eu95OqsfZ/bPlE466zPW6u64xHLIC5XzNrE/tg==
X-Received: by 2002:adf:e8d1:: with SMTP id k17mr12115956wrn.465.1637912371527; 
 Thu, 25 Nov 2021 23:39:31 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:9698:4ba1:7e0f:eebe?
 ([2a02:908:1252:fb60:9698:4ba1:7e0f:eebe])
 by smtp.gmail.com with ESMTPSA id 4sm6137547wrz.90.2021.11.25.23.39.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Nov 2021 23:39:31 -0800 (PST)
Subject: Re: [PATCH 01/12] drm/ttm: add ttm_resource_fini
To: Huang Rui <ray.huang@amd.com>
References: <20211124124430.20859-1-christian.koenig@amd.com>
 <20211124124430.20859-2-christian.koenig@amd.com> <YaCDI8Ck5V7JBFkM@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <db952696-e45f-bc20-983e-ed7cbe7a1321@gmail.com>
Date: Fri, 26 Nov 2021 08:39:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YaCDI8Ck5V7JBFkM@amd.com>
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
Cc: "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 26.11.21 um 07:48 schrieb Huang Rui:
> On Wed, Nov 24, 2021 at 08:44:19PM +0800, Christian König wrote:
>> Make sure we call the common cleanup function in all
>> implementations of the resource manager.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c     | 2 ++
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c | 1 +
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c    | 2 ++
>>   drivers/gpu/drm/i915/i915_ttm_buddy_manager.c   | 1 +
>>   drivers/gpu/drm/nouveau/nouveau_mem.c           | 3 ++-
>>   drivers/gpu/drm/nouveau/nouveau_mem.h           | 3 ++-
>>   drivers/gpu/drm/nouveau/nouveau_ttm.c           | 9 +++++----
>>   drivers/gpu/drm/ttm/ttm_range_manager.c         | 2 ++
>>   drivers/gpu/drm/ttm/ttm_resource.c              | 6 ++++++
>>   drivers/gpu/drm/ttm/ttm_sys_manager.c           | 1 +
>>   drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c   | 2 ++
>>   drivers/gpu/drm/vmwgfx/vmwgfx_thp.c             | 3 ++-
>>   include/drm/ttm/ttm_resource.h                  | 3 +++
>>   13 files changed, 31 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
>> index 675a72ef305d..ea5470c8c921 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
>> @@ -169,6 +169,7 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
>>   	return 0;
>>   
>>   err_free:
>> +	ttm_resource_fini(man, &node->base.base);
>>   	kfree(node);
>>   
>>   err_out:
>> @@ -200,6 +201,7 @@ static void amdgpu_gtt_mgr_del(struct ttm_resource_manager *man,
>>   	if (!(res->placement & TTM_PL_FLAG_TEMPORARY))
>>   		atomic64_sub(res->num_pages, &mgr->used);
>>   
>> +	ttm_resource_fini(man, res);
>>   	kfree(node);
>>   }
>>   
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c
>> index d02c8637f909..ffddec08e931 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c
>> @@ -95,6 +95,7 @@ static void amdgpu_preempt_mgr_del(struct ttm_resource_manager *man,
>>   	struct amdgpu_preempt_mgr *mgr = to_preempt_mgr(man);
>>   
>>   	atomic64_sub(res->num_pages, &mgr->used);
>> +	ttm_resource_fini(man, res);
>>   	kfree(res);
>>   }
>>   
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>> index 7b2b0980ec41..55d68408951d 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>> @@ -476,6 +476,7 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>>   	while (i--)
>>   		drm_mm_remove_node(&node->mm_nodes[i]);
>>   	spin_unlock(&mgr->lock);
>> +	ttm_resource_fini(man, &node->base);
>>   	kvfree(node);
>>   
>>   error_sub:
>> @@ -515,6 +516,7 @@ static void amdgpu_vram_mgr_del(struct ttm_resource_manager *man,
>>   	atomic64_sub(usage, &mgr->usage);
>>   	atomic64_sub(vis_usage, &mgr->vis_usage);
>>   
>> +	ttm_resource_fini(man, res);
>>   	kvfree(node);
>>   }
>>   
>> diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
>> index d59fbb019032..ca3ca1f7f850 100644
>> --- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
>> +++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
>> @@ -123,6 +123,7 @@ static void i915_ttm_buddy_man_free(struct ttm_resource_manager *man,
>>   	i915_buddy_free_list(&bman->mm, &bman_res->blocks);
>>   	mutex_unlock(&bman->lock);
>>   
>> +	ttm_resource_fini(man, res);
>>   	kfree(bman_res);
>>   }
>>   
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.c b/drivers/gpu/drm/nouveau/nouveau_mem.c
>> index 2ca3207c13fc..2e517cdc24c9 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_mem.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_mem.c
>> @@ -162,11 +162,12 @@ nouveau_mem_vram(struct ttm_resource *reg, bool contig, u8 page)
>>   }
>>   
>>   void
>> -nouveau_mem_del(struct ttm_resource *reg)
>> +nouveau_mem_del(struct ttm_resource_manager *man, struct ttm_resource *reg)
>>   {
>>   	struct nouveau_mem *mem = nouveau_mem(reg);
>>   
>>   	nouveau_mem_fini(mem);
>> +	ttm_resource_fini(man, reg);
>>   	kfree(mem);
>>   }
>>   
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.h b/drivers/gpu/drm/nouveau/nouveau_mem.h
>> index 2c01166a90f2..325551eba5cd 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_mem.h
>> +++ b/drivers/gpu/drm/nouveau/nouveau_mem.h
>> @@ -23,7 +23,8 @@ nouveau_mem(struct ttm_resource *reg)
>>   
>>   int nouveau_mem_new(struct nouveau_cli *, u8 kind, u8 comp,
>>   		    struct ttm_resource **);
>> -void nouveau_mem_del(struct ttm_resource *);
>> +void nouveau_mem_del(struct ttm_resource_manager *man,
>> +		     struct ttm_resource *);
>>   int nouveau_mem_vram(struct ttm_resource *, bool contig, u8 page);
>>   int nouveau_mem_host(struct ttm_resource *, struct ttm_tt *);
>>   void nouveau_mem_fini(struct nouveau_mem *);
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
>> index 2ca9d9a9e5d5..91ef33f8f22c 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
>> @@ -36,9 +36,10 @@
>>   #include <core/tegra.h>
>>   
>>   static void
>> -nouveau_manager_del(struct ttm_resource_manager *man, struct ttm_resource *reg)
>> +nouveau_manager_del(struct ttm_resource_manager *man,
>> +		    struct ttm_resource *reg)
>>   {
>> -	nouveau_mem_del(reg);
>> +	nouveau_mem_del(man, reg);
>>   }
>>   
>>   static int
>> @@ -62,7 +63,7 @@ nouveau_vram_manager_new(struct ttm_resource_manager *man,
>>   
>>   	ret = nouveau_mem_vram(*res, nvbo->contig, nvbo->page);
>>   	if (ret) {
>> -		nouveau_mem_del(*res);
>> +		nouveau_mem_del(man, *res);
>>   		return ret;
>>   	}
>>   
>> @@ -118,7 +119,7 @@ nv04_gart_manager_new(struct ttm_resource_manager *man,
>>   	ret = nvif_vmm_get(&mem->cli->vmm.vmm, PTES, false, 12, 0,
>>   			   (long)(*res)->num_pages << PAGE_SHIFT, &mem->vma[0]);
>>   	if (ret) {
>> -		nouveau_mem_del(*res);
>> +		nouveau_mem_del(man, *res);
>>   		return ret;
>>   	}
>>   
>> diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c b/drivers/gpu/drm/ttm/ttm_range_manager.c
>> index 67d68a4a8640..25fcf0d63c2d 100644
>> --- a/drivers/gpu/drm/ttm/ttm_range_manager.c
>> +++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
>> @@ -89,6 +89,7 @@ static int ttm_range_man_alloc(struct ttm_resource_manager *man,
>>   	spin_unlock(&rman->lock);
>>   
>>   	if (unlikely(ret)) {
>> +		ttm_resource_fini(man, *res);
>>   		kfree(node);
>>   		return ret;
>>   	}
>> @@ -108,6 +109,7 @@ static void ttm_range_man_free(struct ttm_resource_manager *man,
>>   	drm_mm_remove_node(&node->mm_nodes[0]);
>>   	spin_unlock(&rman->lock);
>>   
>> +	ttm_resource_fini(man, res);
>>   	kfree(node);
>>   }
>>   
>> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
>> index 035d71332d18..89bcfe22a0ca 100644
>> --- a/drivers/gpu/drm/ttm/ttm_resource.c
>> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
>> @@ -44,6 +44,12 @@ void ttm_resource_init(struct ttm_buffer_object *bo,
>>   }
>>   EXPORT_SYMBOL(ttm_resource_init);
>>   
>> +void ttm_resource_fini(struct ttm_resource_manager *man,
>> +		       struct ttm_resource *res)
>> +{
> Maybe we should clean up the res data here. E.X. memset(res, 0, sizeof(*res).
> The previous data should invalid while we call fini.

Nah, calling _fini means the resource structure is about to be freed.

memset in this situation doesn't make much sense.

Christian.

>
> Thanks,
> Ray
>
>> +}
>> +EXPORT_SYMBOL(ttm_resource_fini);
>> +
>>   int ttm_resource_alloc(struct ttm_buffer_object *bo,
>>   		       const struct ttm_place *place,
>>   		       struct ttm_resource **res_ptr)
>> diff --git a/drivers/gpu/drm/ttm/ttm_sys_manager.c b/drivers/gpu/drm/ttm/ttm_sys_manager.c
>> index 63aca52f75e1..135394dcca95 100644
>> --- a/drivers/gpu/drm/ttm/ttm_sys_manager.c
>> +++ b/drivers/gpu/drm/ttm/ttm_sys_manager.c
>> @@ -23,6 +23,7 @@ static int ttm_sys_man_alloc(struct ttm_resource_manager *man,
>>   static void ttm_sys_man_free(struct ttm_resource_manager *man,
>>   			     struct ttm_resource *res)
>>   {
>> +	ttm_resource_fini(man, res);
>>   	kfree(res);
>>   }
>>   
>> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c b/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
>> index b2c4af331c9d..bfd686bb8d19 100644
>> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
>> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
>> @@ -116,6 +116,7 @@ static int vmw_gmrid_man_get_node(struct ttm_resource_manager *man,
>>   	gman->used_gmr_pages -= (*res)->num_pages;
>>   	spin_unlock(&gman->lock);
>>   	ida_free(&gman->gmr_ida, id);
>> +	ttm_resource_fini(man, *res);
>>   	kfree(*res);
>>   	return -ENOSPC;
>>   }
>> @@ -129,6 +130,7 @@ static void vmw_gmrid_man_put_node(struct ttm_resource_manager *man,
>>   	spin_lock(&gman->lock);
>>   	gman->used_gmr_pages -= res->num_pages;
>>   	spin_unlock(&gman->lock);
>> +	ttm_resource_fini(man, res);
>>   	kfree(res);
>>   }
>>   
>> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c b/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
>> index 2a3d3468e4e0..4fcbd94ccc11 100644
>> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
>> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
>> @@ -104,6 +104,7 @@ static int vmw_thp_get_node(struct ttm_resource_manager *man,
>>   	spin_unlock(&rman->lock);
>>   
>>   	if (unlikely(ret)) {
>> +		ttm_resource_fini(man, &node->base);
>>   		kfree(node);
>>   	} else {
>>   		node->base.start = node->mm_nodes[0].start;
>> @@ -122,7 +123,7 @@ static void vmw_thp_put_node(struct ttm_resource_manager *man,
>>   	spin_lock(&rman->lock);
>>   	drm_mm_remove_node(&node->mm_nodes[0]);
>>   	spin_unlock(&rman->lock);
>> -
>> +	ttm_resource_fini(man, res);
>>   	kfree(node);
>>   }
>>   
>> diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
>> index 5952051091cd..df1f06b7b504 100644
>> --- a/include/drm/ttm/ttm_resource.h
>> +++ b/include/drm/ttm/ttm_resource.h
>> @@ -261,6 +261,9 @@ ttm_resource_manager_cleanup(struct ttm_resource_manager *man)
>>   void ttm_resource_init(struct ttm_buffer_object *bo,
>>                          const struct ttm_place *place,
>>                          struct ttm_resource *res);
>> +void ttm_resource_fini(struct ttm_resource_manager *man,
>> +		       struct ttm_resource *res);
>> +
>>   int ttm_resource_alloc(struct ttm_buffer_object *bo,
>>   		       const struct ttm_place *place,
>>   		       struct ttm_resource **res);
>> -- 
>> 2.25.1
>>

