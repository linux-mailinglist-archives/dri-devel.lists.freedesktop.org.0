Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28EEB47D8D3
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 22:34:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D05410E2DD;
	Wed, 22 Dec 2021 21:34:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A17810E2E5
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 21:34:41 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id j6so13521702edw.12
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 13:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=wfOEB+bzuAfsFTR0SufiF9ccHoaUKxsmrvvFuKGhyLs=;
 b=ISO/Ks55rc/20DDwd+rlhF+J04Jrq+B/XIlPpGSXwO2R8fEnrUuGYlXJIv8TcfvtDD
 hKr3QtBTojQJgqfM9o8koThnL+Y1X3au5fDPAd96/wIKfuLG4FrOSiaGtmfibpAz3ADv
 eEWVAS+QN38BbFse2hSzuLAuD0QBbycq/6src=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=wfOEB+bzuAfsFTR0SufiF9ccHoaUKxsmrvvFuKGhyLs=;
 b=Q83Ecknoi0aFqbOHG4r2zfGbpCQ3U4vOcpZMxyVfstHTOPMpU98OKyYjcCfa3Jvdfl
 cI2Ubp8umOVjjR+kNAe57VHYAB/WsVdxBMqy/UTEARWyZSeQ42PTqdFJQdSBuc5wYsZg
 qfXF0YG5iARB4LV2bvrQJ4PlFYlrKz9fFJrxh3Q4Eyfyqpwv14CZO4WshvPVhKdRfqm+
 CLyWf9XIyuzxOMNXTGPBMt/XpaudSuJdDqP6wjyJMgAvlxwZoJbG+XPdI5ijrzPt3QAv
 7lvC7FQSwEk+MGVJHL/UHCzUyGC0zny3RfxxrIixNmX7L0PsVvR1dmDx6x93t5htpRqW
 qvNg==
X-Gm-Message-State: AOAM532oG1SJQqkRNu9GPsKml2vxbDj5d0APWiGNEEOIPrh/IxaShJiF
 YMA+15sPyYX28vShdQ7HzZyX8Q==
X-Google-Smtp-Source: ABdhPJw1YV4/gu6BG9RWLSHUVwAoW2Cy0gsRK2wW2t0xKfyxMzxCmc1yh/wqrf2O6Zr9h4R9stlZ0A==
X-Received: by 2002:a17:906:b24a:: with SMTP id
 ce10mr3782971ejb.20.1640208879615; 
 Wed, 22 Dec 2021 13:34:39 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id ck14sm1296560edb.5.2021.12.22.13.34.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 13:34:39 -0800 (PST)
Date: Wed, 22 Dec 2021 22:34:37 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 10/24] drm/amdgpu: remove excl as shared workarounds
Message-ID: <YcOZ7XdwGp8c7fh+@phenom.ffwll.local>
References: <20211207123411.167006-1-christian.koenig@amd.com>
 <20211207123411.167006-11-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211207123411.167006-11-christian.koenig@amd.com>
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
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 07, 2021 at 01:33:57PM +0100, Christian König wrote:
> This was added because of the now dropped shared on excl dependency.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

I didn't do a full re-audit of whether you got them all, I think latest
with the semantic change to allow more kinds of fence types with dma-resv
we should catch them all.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c  | 5 +----
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 6 ------
>  2 files changed, 1 insertion(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> index 0311d799a010..53e407ea4c89 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -1275,14 +1275,11 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
>  		/*
>  		 * Work around dma_resv shortcommings by wrapping up the
>  		 * submission in a dma_fence_chain and add it as exclusive
> -		 * fence, but first add the submission as shared fence to make
> -		 * sure that shared fences never signal before the exclusive
> -		 * one.
> +		 * fence.
>  		 */
>  		dma_fence_chain_init(chain, dma_resv_excl_fence(resv),
>  				     dma_fence_get(p->fence), 1);
>  
> -		dma_resv_add_shared_fence(resv, p->fence);
>  		rcu_assign_pointer(resv->fence_excl, &chain->base);
>  		e->chain = NULL;
>  	}
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> index a1e63ba4c54a..85d31d85c384 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> @@ -226,12 +226,6 @@ static void amdgpu_gem_object_close(struct drm_gem_object *obj,
>  	if (!amdgpu_vm_ready(vm))
>  		goto out_unlock;
>  
> -	fence = dma_resv_excl_fence(bo->tbo.base.resv);
> -	if (fence) {
> -		amdgpu_bo_fence(bo, fence, true);
> -		fence = NULL;
> -	}
> -
>  	r = amdgpu_vm_clear_freed(adev, vm, &fence);
>  	if (r || !fence)
>  		goto out_unlock;
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
