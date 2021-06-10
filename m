Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8438F3A29E0
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 13:07:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 781BB6ECFB;
	Thu, 10 Jun 2021 11:07:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 151976ECFB
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 11:07:36 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 v206-20020a1cded70000b02901a586d3fa23so6150342wmg.4
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 04:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=EtGiGvyyOPesj7q5/7JRH4ZzsIDhtTLAX7ZWxpcISsM=;
 b=O6pwItcyTIZKkK+7Hvh8iSlnjvEmgB/7gE7mJuYAylrPj8FhRE2L6pf5NjzTW0H9Jp
 6viN+SRBiQalyJIBhrmb13PkZiyHxdxek3eqyMxm+WyAIWAR31VimB5ckjOWlG3HjmxU
 DmLpekpZmZTe8iH+3zBqjhXxUQM9QMYuntpeRJra2mEVpxfH0mYCBDed/0+HhmcuY6Y6
 LDr7Vs9NFnzFR5oVRoEtYovdIIpZ7JNWJwCyJj24vLQO2xtTd8C5PBb7pk5TPVY7Jgpp
 COA1mofobcZAWFZlkvkFAeqXaa032GqjgwnGI3xtM+mCAGN6CdThARrsbytBBjzEDDgS
 zovw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=EtGiGvyyOPesj7q5/7JRH4ZzsIDhtTLAX7ZWxpcISsM=;
 b=HNewzuqT4N/83BrYpa+zdebRxKvA+8Rhme8dar5wy/WX5n5dmjzK+0rTqfHY5gbCWH
 CdTkUueThDta2zEmOcC7choFhHRqlnRiDhFuISZFlplSXVZkQG7IdQGYf2Gak7tjMdo7
 iR1OAMyNlRbqPqDaFGV7NyUU/Apmm/EQwXt6oSc6PteGpHIPNQ7Rzna+veSR/3qq4V1a
 SkT/8rPSXzR8cZF9B/DngarZQJY0PzkbMPvLbgHwcsmzICxjE1Y8ICorzKY3K1vpuV2M
 bwm3RbG0O9b5OD7lyNcKKqg3qlg7pJ5kCDI9ozhNH8Xc38DJ0Yi4IkBoN5kYS3kRk1rw
 3a1w==
X-Gm-Message-State: AOAM532x8HpKsuLeyi8o3oyqP/u4cj2y1igrVHKZUm1VcDhmSu0hp/s0
 pUaRp3WdR7EHNsNawKc78m0VLX8a7Eo=
X-Google-Smtp-Source: ABdhPJxb8xsa8FI9NTQyEsOYVYoptc7Tu9PZAQ/Dl+24lJ0h9IrBWmEUy1T0VsCPYDmUXSLuTpkrMw==
X-Received: by 2002:a1c:7912:: with SMTP id l18mr4462540wme.135.1623323254762; 
 Thu, 10 Jun 2021 04:07:34 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:c285:5f9a:99f5:633e?
 ([2a02:908:1252:fb60:c285:5f9a:99f5:633e])
 by smtp.gmail.com with ESMTPSA id o9sm2892168wri.68.2021.06.10.04.07.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jun 2021 04:07:34 -0700 (PDT)
Subject: Re: [PATCH 2/4] drm/ttm: add ttm_resource_fini
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
To: thomas_os@shipmail.org, matthew.auld@intel.com,
 dri-devel@lists.freedesktop.org
References: <20210610110559.1758-1-christian.koenig@amd.com>
 <20210610110559.1758-2-christian.koenig@amd.com>
Message-ID: <a616f7b8-28e1-c1dc-cad8-b75956140763@gmail.com>
Date: Thu, 10 Jun 2021 13:07:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210610110559.1758-2-christian.koenig@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ah, crap forget this patch. I wanted to squash it into the next one.

Am 10.06.21 um 13:05 schrieb Christian König:
> For now that function is just a stub.
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c  | 1 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 1 +
>   drivers/gpu/drm/nouveau/nouveau_ttm.c        | 1 +
>   drivers/gpu/drm/ttm/ttm_range_manager.c      | 1 +
>   drivers/gpu/drm/ttm/ttm_resource.c           | 5 +++++
>   drivers/gpu/drm/ttm/ttm_sys_manager.c        | 1 +
>   drivers/gpu/drm/vmwgfx/vmwgfx_thp.c          | 1 +
>   include/drm/ttm/ttm_resource.h               | 2 ++
>   8 files changed, 13 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> index 8e3f5da44e4f..95d1cd338cf4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> @@ -187,6 +187,7 @@ static void amdgpu_gtt_mgr_del(struct ttm_resource_manager *man,
>   	spin_unlock(&mgr->lock);
>   	atomic64_add(res->num_pages, &mgr->available);
>   
> +	ttm_resource_fini(&node->base);
>   	kfree(node);
>   }
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> index 9a6df02477ce..9f0eb93123ec 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> @@ -510,6 +510,7 @@ static void amdgpu_vram_mgr_del(struct ttm_resource_manager *man,
>   	atomic64_sub(usage, &mgr->usage);
>   	atomic64_sub(vis_usage, &mgr->vis_usage);
>   
> +	ttm_resource_fini(&node->base);
>   	kvfree(node);
>   }
>   
> diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
> index f4c2e46b6fe1..1969759ee2ee 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
> @@ -38,6 +38,7 @@
>   static void
>   nouveau_manager_del(struct ttm_resource_manager *man, struct ttm_resource *reg)
>   {
> +	ttm_resource_fini(reg);
>   	nouveau_mem_del(reg);
>   }
>   
> diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c b/drivers/gpu/drm/ttm/ttm_range_manager.c
> index 03395386e8a7..3636601fd4b0 100644
> --- a/drivers/gpu/drm/ttm/ttm_range_manager.c
> +++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
> @@ -108,6 +108,7 @@ static void ttm_range_man_free(struct ttm_resource_manager *man,
>   	drm_mm_remove_node(&node->mm_nodes[0]);
>   	spin_unlock(&rman->lock);
>   
> +	ttm_resource_fini(&node->base);
>   	kfree(node);
>   }
>   
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
> index 7ff6194154fe..5df1c63373cf 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -45,6 +45,11 @@ void ttm_resource_init(struct ttm_buffer_object *bo,
>   }
>   EXPORT_SYMBOL(ttm_resource_init);
>   
> +void ttm_resource_fini(struct ttm_resource *res)
> +{
> +}
> +EXPORT_SYMBOL(ttm_resource_fini);
> +
>   int ttm_resource_alloc(struct ttm_buffer_object *bo,
>   		       const struct ttm_place *place,
>   		       struct ttm_resource **res_ptr)
> diff --git a/drivers/gpu/drm/ttm/ttm_sys_manager.c b/drivers/gpu/drm/ttm/ttm_sys_manager.c
> index 63aca52f75e1..4427bf6b076b 100644
> --- a/drivers/gpu/drm/ttm/ttm_sys_manager.c
> +++ b/drivers/gpu/drm/ttm/ttm_sys_manager.c
> @@ -23,6 +23,7 @@ static int ttm_sys_man_alloc(struct ttm_resource_manager *man,
>   static void ttm_sys_man_free(struct ttm_resource_manager *man,
>   			     struct ttm_resource *res)
>   {
> +	ttm_resource_fini(res);
>   	kfree(res);
>   }
>   
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c b/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
> index 2a3d3468e4e0..414d3713f250 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
> @@ -123,6 +123,7 @@ static void vmw_thp_put_node(struct ttm_resource_manager *man,
>   	drm_mm_remove_node(&node->mm_nodes[0]);
>   	spin_unlock(&rman->lock);
>   
> +	ttm_resource_fini(&node->base);
>   	kfree(node);
>   }
>   
> diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
> index 6d0b7a6d2169..7fc42db688b8 100644
> --- a/include/drm/ttm/ttm_resource.h
> +++ b/include/drm/ttm/ttm_resource.h
> @@ -263,6 +263,8 @@ ttm_resource_manager_cleanup(struct ttm_resource_manager *man)
>   void ttm_resource_init(struct ttm_buffer_object *bo,
>                          const struct ttm_place *place,
>                          struct ttm_resource *res);
> +void ttm_resource_fini(struct ttm_resource *res);
> +
>   int ttm_resource_alloc(struct ttm_buffer_object *bo,
>   		       const struct ttm_place *place,
>   		       struct ttm_resource **res);

