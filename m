Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8938749B88F
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 17:26:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34F6510E259;
	Tue, 25 Jan 2022 16:26:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A49610E27B
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 16:26:12 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id l25so20871839wrb.13
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 08:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=H5QESonq3y51yS99j9GOLWLYVU4HoiofIZ3mR2wqjiI=;
 b=d9JfPcQ1BtqARs5jceXWXSNRTQEIhIIE/U2TTHk512vpe51L+2Z0/Q7zP9jGQa/Up0
 06Ykyb/0V7XJawUphP/hf3sh53i0nfH8egXwKWbAZZHlBAVJbjlpnDP/uXCMglX/rZXY
 sas7aHNTkRPhYbUaN82pSOD7WKvnr8NAFSBb8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=H5QESonq3y51yS99j9GOLWLYVU4HoiofIZ3mR2wqjiI=;
 b=3OY8W1A3WNKrbQRwKxjSPY6dBtIAAhCJ/GuUvxaNsHomq/kctVG3659Ztn65ciAsdH
 V551y1Wsky2EqbgP/fgFJpt5vqKUzL05ExiPuatlKoNtudKC6qWZGEZng3t3Ml0pOrnY
 f3cCryGftUw9L8ZdRDSsaXc/c6wXVIBrtyvwSn6aNRk6ocXCh1ebVwAOJ8AN7rAiq4YR
 Vu8Haagp6nVJDB4fTo+qI91JO7bYUx0WGCMaFu5Cl6q5fWd0HKgxpPCxFf3OJ6O/II81
 ddusGOk8zRf4IQEEfn5zMDNHA2ZQSBbdhdyPKFXYMfQDmJeI1RHTRy4Rpl90OaL2PpFu
 n1xw==
X-Gm-Message-State: AOAM5326R93MRaIBZr0trRgiYgu07xE3040OEofDmiRwdYo14jIdNsCj
 CG22q4rkx7YQyNT1ktjhgjd9AQ==
X-Google-Smtp-Source: ABdhPJyfulTFZmXk+9ZW6HCBZ6mNewHiwvmR/sW19OXBX0YYu+qFMs2h76aI3SJZGn5gB6XbC2Tz0g==
X-Received: by 2002:a5d:508a:: with SMTP id a10mr4255385wrt.719.1643127970688; 
 Tue, 25 Jan 2022 08:26:10 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c13sm17958847wrv.24.2022.01.25.08.26.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jan 2022 08:26:09 -0800 (PST)
Date: Tue, 25 Jan 2022 17:26:07 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 01/12] drm/ttm: add ttm_resource_fini
Message-ID: <YfAkn5f98ykKtkVC@phenom.ffwll.local>
References: <20220124122514.1832-1-christian.koenig@amd.com>
 <20220124122514.1832-2-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220124122514.1832-2-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: thomas.hellstrom@linux.intel.com, ray.huang@amd.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 24, 2022 at 01:25:03PM +0100, Christian König wrote:
> Make sure we call the common cleanup function in all
> implementations of the resource manager.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c     | 2 ++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c | 1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c    | 2 ++
>  drivers/gpu/drm/i915/i915_ttm_buddy_manager.c   | 1 +
>  drivers/gpu/drm/nouveau/nouveau_mem.c           | 3 ++-
>  drivers/gpu/drm/nouveau/nouveau_mem.h           | 3 ++-
>  drivers/gpu/drm/nouveau/nouveau_ttm.c           | 9 +++++----
>  drivers/gpu/drm/ttm/ttm_range_manager.c         | 2 ++
>  drivers/gpu/drm/ttm/ttm_resource.c              | 6 ++++++
>  drivers/gpu/drm/ttm/ttm_sys_manager.c           | 1 +
>  drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c   | 2 ++
>  drivers/gpu/drm/vmwgfx/vmwgfx_system_manager.c  | 1 +
>  include/drm/ttm/ttm_resource.h                  | 3 +++
>  13 files changed, 30 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> index 675a72ef305d..ea5470c8c921 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> @@ -169,6 +169,7 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
>  	return 0;
>  
>  err_free:
> +	ttm_resource_fini(man, &node->base.base);
>  	kfree(node);
>  
>  err_out:
> @@ -200,6 +201,7 @@ static void amdgpu_gtt_mgr_del(struct ttm_resource_manager *man,
>  	if (!(res->placement & TTM_PL_FLAG_TEMPORARY))
>  		atomic64_sub(res->num_pages, &mgr->used);
>  
> +	ttm_resource_fini(man, res);
>  	kfree(node);
>  }
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c
> index d02c8637f909..ffddec08e931 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c
> @@ -95,6 +95,7 @@ static void amdgpu_preempt_mgr_del(struct ttm_resource_manager *man,
>  	struct amdgpu_preempt_mgr *mgr = to_preempt_mgr(man);
>  
>  	atomic64_sub(res->num_pages, &mgr->used);
> +	ttm_resource_fini(man, res);
>  	kfree(res);
>  }
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> index 7b2b0980ec41..55d68408951d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> @@ -476,6 +476,7 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>  	while (i--)
>  		drm_mm_remove_node(&node->mm_nodes[i]);
>  	spin_unlock(&mgr->lock);
> +	ttm_resource_fini(man, &node->base);
>  	kvfree(node);
>  
>  error_sub:
> @@ -515,6 +516,7 @@ static void amdgpu_vram_mgr_del(struct ttm_resource_manager *man,
>  	atomic64_sub(usage, &mgr->usage);
>  	atomic64_sub(vis_usage, &mgr->vis_usage);
>  
> +	ttm_resource_fini(man, res);
>  	kvfree(node);
>  }
>  
> diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> index 6ba314f9836a..bf857703c797 100644
> --- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> +++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> @@ -124,6 +124,7 @@ static void i915_ttm_buddy_man_free(struct ttm_resource_manager *man,
>  	drm_buddy_free_list(&bman->mm, &bman_res->blocks);
>  	mutex_unlock(&bman->lock);
>  
> +	ttm_resource_fini(man, res);
>  	kfree(bman_res);
>  }

The call in i915_ttm_buddy_man_alloc() in the error unwind call is
missing.

>  
> diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.c b/drivers/gpu/drm/nouveau/nouveau_mem.c
> index 2ca3207c13fc..2e517cdc24c9 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_mem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_mem.c
> @@ -162,11 +162,12 @@ nouveau_mem_vram(struct ttm_resource *reg, bool contig, u8 page)
>  }
>  
>  void
> -nouveau_mem_del(struct ttm_resource *reg)
> +nouveau_mem_del(struct ttm_resource_manager *man, struct ttm_resource *reg)
>  {
>  	struct nouveau_mem *mem = nouveau_mem(reg);
>  
>  	nouveau_mem_fini(mem);
> +	ttm_resource_fini(man, reg);
>  	kfree(mem);
>  }
>  
> diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.h b/drivers/gpu/drm/nouveau/nouveau_mem.h
> index 2c01166a90f2..325551eba5cd 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_mem.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_mem.h
> @@ -23,7 +23,8 @@ nouveau_mem(struct ttm_resource *reg)
>  
>  int nouveau_mem_new(struct nouveau_cli *, u8 kind, u8 comp,
>  		    struct ttm_resource **);
> -void nouveau_mem_del(struct ttm_resource *);
> +void nouveau_mem_del(struct ttm_resource_manager *man,
> +		     struct ttm_resource *);
>  int nouveau_mem_vram(struct ttm_resource *, bool contig, u8 page);
>  int nouveau_mem_host(struct ttm_resource *, struct ttm_tt *);
>  void nouveau_mem_fini(struct nouveau_mem *);
> diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
> index 2ca9d9a9e5d5..91ef33f8f22c 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
> @@ -36,9 +36,10 @@
>  #include <core/tegra.h>
>  
>  static void
> -nouveau_manager_del(struct ttm_resource_manager *man, struct ttm_resource *reg)
> +nouveau_manager_del(struct ttm_resource_manager *man,
> +		    struct ttm_resource *reg)
>  {
> -	nouveau_mem_del(reg);
> +	nouveau_mem_del(man, reg);
>  }
>  
>  static int
> @@ -62,7 +63,7 @@ nouveau_vram_manager_new(struct ttm_resource_manager *man,
>  
>  	ret = nouveau_mem_vram(*res, nvbo->contig, nvbo->page);
>  	if (ret) {
> -		nouveau_mem_del(*res);
> +		nouveau_mem_del(man, *res);
>  		return ret;
>  	}
>  
> @@ -118,7 +119,7 @@ nv04_gart_manager_new(struct ttm_resource_manager *man,
>  	ret = nvif_vmm_get(&mem->cli->vmm.vmm, PTES, false, 12, 0,
>  			   (long)(*res)->num_pages << PAGE_SHIFT, &mem->vma[0]);
>  	if (ret) {
> -		nouveau_mem_del(*res);
> +		nouveau_mem_del(man, *res);
>  		return ret;
>  	}
>  
> diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c b/drivers/gpu/drm/ttm/ttm_range_manager.c
> index 072e0baf2ab4..55a41355f684 100644
> --- a/drivers/gpu/drm/ttm/ttm_range_manager.c
> +++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
> @@ -89,6 +89,7 @@ static int ttm_range_man_alloc(struct ttm_resource_manager *man,
>  	spin_unlock(&rman->lock);
>  
>  	if (unlikely(ret)) {
> +		ttm_resource_fini(man, *res);
>  		kfree(node);
>  		return ret;
>  	}
> @@ -108,6 +109,7 @@ static void ttm_range_man_free(struct ttm_resource_manager *man,
>  	drm_mm_remove_node(&node->mm_nodes[0]);
>  	spin_unlock(&rman->lock);
>  
> +	ttm_resource_fini(man, res);
>  	kfree(node);
>  }
>  
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
> index 035d71332d18..89bcfe22a0ca 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -44,6 +44,12 @@ void ttm_resource_init(struct ttm_buffer_object *bo,
>  }
>  EXPORT_SYMBOL(ttm_resource_init);
>  

Please add kerneldoc here, minimally mention from which callback this
usually should be called from. And also link from the kerneldoc of
ttm_resource_init to this one and back for completeness. I just like to
link stuff as much as possible :-)

Which I guess please add kerneldoc for the _init() version too at least,
we got to start somewhere ... Maybe even the entire file, probably worth
it to review this all and update as part of the lru extraction work here.

> +void ttm_resource_fini(struct ttm_resource_manager *man,
> +		       struct ttm_resource *res)
> +{
> +}
> +EXPORT_SYMBOL(ttm_resource_fini);
> +
>  int ttm_resource_alloc(struct ttm_buffer_object *bo,
>  		       const struct ttm_place *place,
>  		       struct ttm_resource **res_ptr)
> diff --git a/drivers/gpu/drm/ttm/ttm_sys_manager.c b/drivers/gpu/drm/ttm/ttm_sys_manager.c
> index 63aca52f75e1..135394dcca95 100644
> --- a/drivers/gpu/drm/ttm/ttm_sys_manager.c
> +++ b/drivers/gpu/drm/ttm/ttm_sys_manager.c
> @@ -23,6 +23,7 @@ static int ttm_sys_man_alloc(struct ttm_resource_manager *man,
>  static void ttm_sys_man_free(struct ttm_resource_manager *man,
>  			     struct ttm_resource *res)
>  {
> +	ttm_resource_fini(man, res);
>  	kfree(res);
>  }
>  
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c b/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
> index ebb4505a31a3..99ccf690f8a1 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
> @@ -117,6 +117,7 @@ static int vmw_gmrid_man_get_node(struct ttm_resource_manager *man,
>  	gman->used_gmr_pages -= (*res)->num_pages;
>  	spin_unlock(&gman->lock);
>  	ida_free(&gman->gmr_ida, id);
> +	ttm_resource_fini(man, *res);
>  	kfree(*res);
>  	return -ENOSPC;
>  }
> @@ -130,6 +131,7 @@ static void vmw_gmrid_man_put_node(struct ttm_resource_manager *man,
>  	spin_lock(&gman->lock);
>  	gman->used_gmr_pages -= res->num_pages;
>  	spin_unlock(&gman->lock);
> +	ttm_resource_fini(man, res);
>  	kfree(res);
>  }
>  
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_system_manager.c b/drivers/gpu/drm/vmwgfx/vmwgfx_system_manager.c
> index b0005b03a617..a64188c7268d 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_system_manager.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_system_manager.c
> @@ -49,6 +49,7 @@ static int vmw_sys_man_alloc(struct ttm_resource_manager *man,
>  static void vmw_sys_man_free(struct ttm_resource_manager *man,
>  			     struct ttm_resource *res)
>  {
> +	ttm_resource_fini(man, res);
>  	kfree(res);
>  }
>  
> diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
> index 5952051091cd..df1f06b7b504 100644
> --- a/include/drm/ttm/ttm_resource.h
> +++ b/include/drm/ttm/ttm_resource.h
> @@ -261,6 +261,9 @@ ttm_resource_manager_cleanup(struct ttm_resource_manager *man)
>  void ttm_resource_init(struct ttm_buffer_object *bo,
>                         const struct ttm_place *place,
>                         struct ttm_resource *res);
> +void ttm_resource_fini(struct ttm_resource_manager *man,
> +		       struct ttm_resource *res);
> +
>  int ttm_resource_alloc(struct ttm_buffer_object *bo,
>  		       const struct ttm_place *place,
>  		       struct ttm_resource **res);

With the i915 code fix and kerneldoc added:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
