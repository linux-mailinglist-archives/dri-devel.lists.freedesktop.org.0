Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 795BE2D3131
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 18:36:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 560A86E953;
	Tue,  8 Dec 2020 17:36:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 995826E037;
 Tue,  8 Dec 2020 17:36:23 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id f23so25768030ejk.2;
 Tue, 08 Dec 2020 09:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=8w4fKJv8eo2vaTGReEnvZwtl54DPRpPa1Jw4KxhaEFY=;
 b=X6Qay3JfQgyRjgI3T8tX9NileZAqjcqZE/mqPCm/VJ60sTxZ5fjenMpmS8dpaFzq7n
 zJpdyBvXX5loLiK0GpGAk7DqUdsdGYPKymev5d6/P37qYw3BSvezC9Rwkqp4p93pwMJZ
 IhiYX8q4NqpU1q7xAKhF6wwZ8DDm6Qc+aZBP3gWg2iOLfeTKbj3Z2ydcBax4jL+m/C+R
 6DUxtdfl9cSvU2Y7DDVd3ClulOGmpJUbBLBWN/Bg1Wz8byhLZuWMrY9zlLuQzMFmZ6uS
 WnwEjqmVKz4C9rQW20/6YxlpvkrV5jRvr0SKnn4ZCGjg+pg1O78EfTenvmUCjZ0xtyAx
 6WlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=8w4fKJv8eo2vaTGReEnvZwtl54DPRpPa1Jw4KxhaEFY=;
 b=ODx3ovi6g3OcbENCSQzeYCFp0/Tr0OqK9mkZ2Rf+LYwkMF94uCBo31mHluXyQDBWFV
 r9Ic4vqjEoQeFaaV0kBHqmERbmcMbSmbCDOu49sWaOraE7529zO1rUXiReCeEKqO0ngb
 QfxvOrgkSlSpwEszCArcWA3MSwhklmCt8jacyhmOid0GF9JFi0vxHtJ75cVttesuMlMJ
 1ySDqrKCYp5pTi3tC7fE29wRGvI8IGPTNe5GI3i9XytyGRANmr41+Ub+V2O6cToUXhOF
 ntB45gcIHTVHPSrnqUQyOiBUUMLNNtlwFCm4oPp6djfFDjgqsJ0KMT8y/c0sFCBB9qRH
 Oexg==
X-Gm-Message-State: AOAM532UozRrXh0T7jEEFGYI7M1yly+p6hXtD1VuV/01+F9eCXHgbP2A
 ihrEY/wQSVfTqbtpZ6Q6f74=
X-Google-Smtp-Source: ABdhPJxOWpZfeqjp7b0tL5Oy2j9XMvq2+UqpX/Aw312cu7KAKqz7W9qiBur1p7ECzKKlEr28iOLcaA==
X-Received: by 2002:a17:906:a982:: with SMTP id
 jr2mr24971096ejb.292.1607448982218; 
 Tue, 08 Dec 2020 09:36:22 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id bo20sm13460766edb.1.2020.12.08.09.36.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Dec 2020 09:36:21 -0800 (PST)
Subject: Re: [PATCH] drm/amdgpu: Initialise drm_gem_object_funcs for imported
 BOs
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 dri-devel@lists.freedesktop.org
References: <1607447432-28982-1-git-send-email-andrey.grodzovsky@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <76baebc8-6fd3-6b28-8c62-bd049875a8c5@gmail.com>
Date: Tue, 8 Dec 2020 18:36:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1607447432-28982-1-git-send-email-andrey.grodzovsky@amd.com>
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
Reply-To: christian.koenig@amd.com
Cc: Alexander.Deucher@amd.com, tzimmermann@suse.de,
 amd-gfx@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 08.12.20 um 18:10 schrieb Andrey Grodzovsky:
> For BOs imported from outside of amdgpu, setting of amdgpu_gem_object_funcs
> was missing in amdgpu_dma_buf_create_obj. Fix by refactoring BO creation
> and amdgpu_gem_object_funcs setting into single function called
> from both code paths.

Can you outline why we can't use amdgpu_gem_object_create() directly?

I mean we have a bit of extra error handling in there and we need to 
grab the resv lock and set the domains after creation, but that 
shouldn't matter and I don't see why that should not work.

Thanks,
Christian.

>
> This fixes null ptr regression casued by commit
> d693def drm: Remove obsolete GEM and PRIME callbacks from struct drm_driver
>
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 13 ++++++-------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c     | 22 +++++++++++++++++-----
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.h     |  5 +++++
>   3 files changed, 28 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> index e5919ef..da4d0ab 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> @@ -405,6 +405,7 @@ struct dma_buf *amdgpu_gem_prime_export(struct drm_gem_object *gobj,
>   	return buf;
>   }
>   
> +
>   /**
>    * amdgpu_dma_buf_create_obj - create BO for DMA-buf import
>    *
> @@ -424,7 +425,7 @@ amdgpu_dma_buf_create_obj(struct drm_device *dev, struct dma_buf *dma_buf)
>   	struct amdgpu_device *adev = drm_to_adev(dev);
>   	struct amdgpu_bo *bo;
>   	struct amdgpu_bo_param bp;
> -	int ret;
> +	struct drm_gem_object *obj;
>   
>   	memset(&bp, 0, sizeof(bp));
>   	bp.size = dma_buf->size;
> @@ -434,21 +435,19 @@ amdgpu_dma_buf_create_obj(struct drm_device *dev, struct dma_buf *dma_buf)
>   	bp.type = ttm_bo_type_sg;
>   	bp.resv = resv;
>   	dma_resv_lock(resv, NULL);
> -	ret = amdgpu_bo_create(adev, &bp, &bo);
> -	if (ret)
> +	obj = amdgpu_gem_object_create_raw(adev, &bp);
> +	if (IS_ERR(obj))
>   		goto error;
>   
> +	bo = gem_to_amdgpu_bo(obj);
>   	bo->allowed_domains = AMDGPU_GEM_DOMAIN_GTT;
>   	bo->preferred_domains = AMDGPU_GEM_DOMAIN_GTT;
>   	if (dma_buf->ops != &amdgpu_dmabuf_ops)
>   		bo->prime_shared_count = 1;
>   
> -	dma_resv_unlock(resv);
> -	return &bo->tbo.base;
> -
>   error:
>   	dma_resv_unlock(resv);
> -	return ERR_PTR(ret);
> +	return obj;
>   }
>   
>   /**
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> index c9f94fb..5f22ce6 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> @@ -52,13 +52,26 @@ static void amdgpu_gem_object_free(struct drm_gem_object *gobj)
>   	}
>   }
>   
> +struct drm_gem_object *amdgpu_gem_object_create_raw(struct amdgpu_device *adev,
> +						    struct amdgpu_bo_param *bp)
> +{
> +	struct amdgpu_bo *bo;
> +	int r;
> +
> +	r = amdgpu_bo_create(adev, bp, &bo);
> +	if (r)
> +		return ERR_PTR(r);
> +
> +	bo->tbo.base.funcs = &amdgpu_gem_object_funcs;
> +	return &bo->tbo.base;
> +}
> +
>   int amdgpu_gem_object_create(struct amdgpu_device *adev, unsigned long size,
>   			     int alignment, u32 initial_domain,
>   			     u64 flags, enum ttm_bo_type type,
>   			     struct dma_resv *resv,
>   			     struct drm_gem_object **obj)
>   {
> -	struct amdgpu_bo *bo;
>   	struct amdgpu_bo_param bp;
>   	int r;
>   
> @@ -73,8 +86,9 @@ int amdgpu_gem_object_create(struct amdgpu_device *adev, unsigned long size,
>   retry:
>   	bp.flags = flags;
>   	bp.domain = initial_domain;
> -	r = amdgpu_bo_create(adev, &bp, &bo);
> -	if (r) {
> +	*obj = amdgpu_gem_object_create_raw(adev, &bp);
> +	if (IS_ERR(*obj)) {
> +		r = PTR_ERR(*obj);
>   		if (r != -ERESTARTSYS) {
>   			if (flags & AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED) {
>   				flags &= ~AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED;
> @@ -90,8 +104,6 @@ int amdgpu_gem_object_create(struct amdgpu_device *adev, unsigned long size,
>   		}
>   		return r;
>   	}
> -	*obj = &bo->tbo.base;
> -	(*obj)->funcs = &amdgpu_gem_object_funcs;
>   
>   	return 0;
>   }
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.h
> index 637bf51..a6b90d3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.h
> @@ -38,12 +38,17 @@ unsigned long amdgpu_gem_timeout(uint64_t timeout_ns);
>   /*
>    * GEM objects.
>    */
> +
> +struct amdgpu_bo_param;
> +
>   void amdgpu_gem_force_release(struct amdgpu_device *adev);
>   int amdgpu_gem_object_create(struct amdgpu_device *adev, unsigned long size,
>   			     int alignment, u32 initial_domain,
>   			     u64 flags, enum ttm_bo_type type,
>   			     struct dma_resv *resv,
>   			     struct drm_gem_object **obj);
> +struct drm_gem_object *amdgpu_gem_object_create_raw(struct amdgpu_device *adev,
> +						    struct amdgpu_bo_param *bp);
>   
>   int amdgpu_mode_dumb_create(struct drm_file *file_priv,
>   			    struct drm_device *dev,

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
