Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD3F2D30DE
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 18:23:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 405E26E039;
	Tue,  8 Dec 2020 17:23:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1707A6E039;
 Tue,  8 Dec 2020 17:23:37 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id o11so13813208ote.4;
 Tue, 08 Dec 2020 09:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l2ADj3/jrabhbbEx6nT75KCnigxoRQzQI6UplPH6ZHc=;
 b=ZvgJ0V+vnzXl+hSZ6EXCim4VgweEzRBJdVpc4TIdMmQXTMjOZCjcLRX1Zuy0rPyt6x
 5bO9pI5WMBt4HM6w5rdf9JXpviqmnxIFAVdXn1JjPo8DVamTRhAgLxaK1Mw6475wbPSi
 vXzD4n45eumzObsFc5xkHewR2pysEMoM09yeFkZL4D2PR+bMORpHUhTQP/1oT/8Kwi2k
 AfYm/WgqnDWjHnhJMr8tEdPTwT4YxF6GiZvkZYd2tnfVICUhIRR5/eEA7r+/zLeQgFmM
 cQF/BiS4rkoKCzB3sZ9RUG3GA9MwXCy3LR6iOgD9S7P9FVhQMPx874OByKyCZ0jbINJm
 2tTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l2ADj3/jrabhbbEx6nT75KCnigxoRQzQI6UplPH6ZHc=;
 b=pOBhShYSOT02Eg44QH8iMgmjzUKsvMBAKXaNlj7X3SCcQt87n5JmPrnue3HTlNXUFz
 4gAzn2Y7zEZKLnu7OOVC+TSlDcrUtOAqzugaTU0Nh4LvgKJKy5poEY7xgggMClWM7FJz
 ty6kokQrGnCqW6GuslUv8jOd+8qxd0Zi/KVb46yFo3xnolX4+bt170eNgfMa0+j443Ac
 ulUDDLEmtIHSEwTCEg0FNLmvGvA1fNu5ojuHd87pks5w8lZ3W7Uzyulw+XnrHLYf6r+f
 S0qBxlQ+881S21UDbcKhl2CHa2cB7VPF9XJE04NLuKtELfEG5fY0ZgTRUHTVzaqDMirX
 yd5A==
X-Gm-Message-State: AOAM531Gh0KXozFp2N2XsyS3ignRKEe7l3w3wxcbvCC5Nal6vW50Jl2W
 kESoADsdAsFSKVctEyvukl+oXdjeymEqLQ9+74M=
X-Google-Smtp-Source: ABdhPJx63rSabnH9/4eOtc/Q+07B0r3lO046UaFQeUstE8U/JKsxFV73b+bjzaBmVNKXFEv3/qK73caTuHFXnRlfU9Q=
X-Received: by 2002:a9d:5388:: with SMTP id w8mr17551664otg.311.1607448216328; 
 Tue, 08 Dec 2020 09:23:36 -0800 (PST)
MIME-Version: 1.0
References: <1607447432-28982-1-git-send-email-andrey.grodzovsky@amd.com>
In-Reply-To: <1607447432-28982-1-git-send-email-andrey.grodzovsky@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 8 Dec 2020 12:23:25 -0500
Message-ID: <CADnq5_PTs=KYm607xfi9-VefD6Teb2AZCHHeEDaAYJC0h9eRyw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Initialise drm_gem_object_funcs for imported
 BOs
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 8, 2020 at 12:10 PM Andrey Grodzovsky
<andrey.grodzovsky@amd.com> wrote:
>
> For BOs imported from outside of amdgpu, setting of amdgpu_gem_object_funcs
> was missing in amdgpu_dma_buf_create_obj. Fix by refactoring BO creation
> and amdgpu_gem_object_funcs setting into single function called
> from both code paths.
>
> This fixes null ptr regression casued by commit
> d693def drm: Remove obsolete GEM and PRIME callbacks from struct drm_driver
>

Fixes: d693def4fd1c ("drm: Remove obsolete GEM and PRIME callbacks
from struct drm_driver")

> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 13 ++++++-------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c     | 22 +++++++++++++++++-----
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gem.h     |  5 +++++
>  3 files changed, 28 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> index e5919ef..da4d0ab 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> @@ -405,6 +405,7 @@ struct dma_buf *amdgpu_gem_prime_export(struct drm_gem_object *gobj,
>         return buf;
>  }
>
> +

Unrelated whitespace change.

>  /**
>   * amdgpu_dma_buf_create_obj - create BO for DMA-buf import
>   *
> @@ -424,7 +425,7 @@ amdgpu_dma_buf_create_obj(struct drm_device *dev, struct dma_buf *dma_buf)
>         struct amdgpu_device *adev = drm_to_adev(dev);
>         struct amdgpu_bo *bo;
>         struct amdgpu_bo_param bp;
> -       int ret;
> +       struct drm_gem_object *obj;
>
>         memset(&bp, 0, sizeof(bp));
>         bp.size = dma_buf->size;
> @@ -434,21 +435,19 @@ amdgpu_dma_buf_create_obj(struct drm_device *dev, struct dma_buf *dma_buf)
>         bp.type = ttm_bo_type_sg;
>         bp.resv = resv;
>         dma_resv_lock(resv, NULL);
> -       ret = amdgpu_bo_create(adev, &bp, &bo);
> -       if (ret)
> +       obj = amdgpu_gem_object_create_raw(adev, &bp);
> +       if (IS_ERR(obj))
>                 goto error;
>
> +       bo = gem_to_amdgpu_bo(obj);
>         bo->allowed_domains = AMDGPU_GEM_DOMAIN_GTT;
>         bo->preferred_domains = AMDGPU_GEM_DOMAIN_GTT;
>         if (dma_buf->ops != &amdgpu_dmabuf_ops)
>                 bo->prime_shared_count = 1;
>
> -       dma_resv_unlock(resv);
> -       return &bo->tbo.base;
> -
>  error:
>         dma_resv_unlock(resv);
> -       return ERR_PTR(ret);
> +       return obj;
>  }
>
>  /**
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> index c9f94fb..5f22ce6 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> @@ -52,13 +52,26 @@ static void amdgpu_gem_object_free(struct drm_gem_object *gobj)
>         }
>  }
>
> +struct drm_gem_object *amdgpu_gem_object_create_raw(struct amdgpu_device *adev,
> +                                                   struct amdgpu_bo_param *bp)

Maybe call this amdgpu_gem_object_do_create() for consistency with
amdgpu_object.c and other areas of the code.

> +{
> +       struct amdgpu_bo *bo;
> +       int r;
> +
> +       r = amdgpu_bo_create(adev, bp, &bo);
> +       if (r)
> +               return ERR_PTR(r);
> +
> +       bo->tbo.base.funcs = &amdgpu_gem_object_funcs;
> +       return &bo->tbo.base;
> +}
> +
>  int amdgpu_gem_object_create(struct amdgpu_device *adev, unsigned long size,
>                              int alignment, u32 initial_domain,
>                              u64 flags, enum ttm_bo_type type,
>                              struct dma_resv *resv,
>                              struct drm_gem_object **obj)
>  {
> -       struct amdgpu_bo *bo;
>         struct amdgpu_bo_param bp;
>         int r;
>
> @@ -73,8 +86,9 @@ int amdgpu_gem_object_create(struct amdgpu_device *adev, unsigned long size,
>  retry:
>         bp.flags = flags;
>         bp.domain = initial_domain;
> -       r = amdgpu_bo_create(adev, &bp, &bo);
> -       if (r) {
> +       *obj = amdgpu_gem_object_create_raw(adev, &bp);
> +       if (IS_ERR(*obj)) {
> +               r = PTR_ERR(*obj);
>                 if (r != -ERESTARTSYS) {
>                         if (flags & AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED) {
>                                 flags &= ~AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED;
> @@ -90,8 +104,6 @@ int amdgpu_gem_object_create(struct amdgpu_device *adev, unsigned long size,
>                 }
>                 return r;
>         }
> -       *obj = &bo->tbo.base;
> -       (*obj)->funcs = &amdgpu_gem_object_funcs;
>
>         return 0;
>  }
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.h
> index 637bf51..a6b90d3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.h
> @@ -38,12 +38,17 @@ unsigned long amdgpu_gem_timeout(uint64_t timeout_ns);
>  /*
>   * GEM objects.
>   */
> +
> +struct amdgpu_bo_param;
> +
>  void amdgpu_gem_force_release(struct amdgpu_device *adev);
>  int amdgpu_gem_object_create(struct amdgpu_device *adev, unsigned long size,
>                              int alignment, u32 initial_domain,
>                              u64 flags, enum ttm_bo_type type,
>                              struct dma_resv *resv,
>                              struct drm_gem_object **obj);
> +struct drm_gem_object *amdgpu_gem_object_create_raw(struct amdgpu_device *adev,
> +                                                   struct amdgpu_bo_param *bp);
>
>  int amdgpu_mode_dumb_create(struct drm_file *file_priv,
>                             struct drm_device *dev,
> --
> 2.7.4
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
