Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA1C2D3525
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 22:22:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5306D89D40;
	Tue,  8 Dec 2020 21:22:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EB8489CD5;
 Tue,  8 Dec 2020 21:22:50 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id l200so53523oig.9;
 Tue, 08 Dec 2020 13:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7M0Etg3kU33oCk2hdtuR570YuJg9VtYLAOIHEHF9GVw=;
 b=pRw4xJ2KXT6pHK0Gol0wqGdRY30SafoqWUQxaXKpAZtHK+4cGVAZJ/9nibYIPQNFpI
 Q50eQ9tVxJxdRTpKwA22fpvN3g5VkbJ2aYYP3Lr6NA3TYEZ4HTsLhpVdtuXUPJ1z3ylH
 wB8yvHuZDVYzoxlCfSN5cf3XwHumJzMf/z128zsN6SXlJScU4QYihEiDYt72SEInN1wP
 8zcO+G8qx3LHXTxFGC+i3wFklFbWDHKuV28SWTzWqncNdg4KfOia/7lHP/87NPZ3hAA0
 DzdTWI4+IJEF8p7I83SyJ3IkTo0b/1HSAAcQI7ZtfTAiMbable4frfbdaMoYTdwz/psI
 TdDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7M0Etg3kU33oCk2hdtuR570YuJg9VtYLAOIHEHF9GVw=;
 b=FFQA112iITAnVLlLfUB7ahtaylfyfBFVBwbyehe3e0syMBXMY4y82cyA9CTcF0MTAO
 P2wa6I53OF31mrlcRtsvOEeI8by3GrqbkLX8on+TJ/lbRFFojPVfnqoiPURxIZXj/SyG
 2TWdg6vOTOxENetGshTYqDE/GBsB1hVNZeXOQgHL4jKCy4UMZttLxyV6V955nX+Ot3zI
 7+KG3Rctu0IWv9lHEee8Mgez1fj+sPnNSy+S2ziH/UBFQYFhPw5mo5Mwglo7D0eFtshC
 yVCRnM85DmQUwRqIPcbrzefd+L0+6A2i49U9AAOef0YivigRH4Ol+YMawFyj0sHeDSUR
 tGVw==
X-Gm-Message-State: AOAM533Er90jp0ZVhBRjrSlu/CrS08t+tw/1NsuJ1Aipn8LgQ2DhEv0g
 IfWdE4I1NDbgLyzcUbsY6Zd9B8y4w764FUSpoMYNWjiq
X-Google-Smtp-Source: ABdhPJzZdkv+bCA1SiWKN7kbBEcix1FhgXQ2aiYlInQXLLekwO6+oPlCiOb9B7xI3Od+oE//k25TG3epAYCJQsJnd4k=
X-Received: by 2002:a54:4083:: with SMTP id i3mr4275447oii.120.1607462569401; 
 Tue, 08 Dec 2020 13:22:49 -0800 (PST)
MIME-Version: 1.0
References: <1607458575-15197-1-git-send-email-andrey.grodzovsky@amd.com>
In-Reply-To: <1607458575-15197-1-git-send-email-andrey.grodzovsky@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 8 Dec 2020 16:22:38 -0500
Message-ID: <CADnq5_O0+hvZ_0_a6XYxi62tXFwU0bsz76p57KPPL3XsHyrhOw@mail.gmail.com>
Subject: Re: [PATCH v2] [PATCH] drm/amdgpu: Initialise drm_gem_object_funcs
 for imported BOs
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

On Tue, Dec 8, 2020 at 3:16 PM Andrey Grodzovsky
<andrey.grodzovsky@amd.com> wrote:
>
> For BOs imported from outside of amdgpu, setting of amdgpu_gem_object_funcs
> was missing in amdgpu_dma_buf_create_obj. Fix by refactoring BO creation
> and amdgpu_gem_object_funcs setting into single function called
> from both code paths.
>
> Fixes: d693def4fd1c ("drm: Remove obsolete GEM and PRIME callbacks
> from struct drm_driver")
>
> v2: Use use amdgpu_gem_object_create() directly
>
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c |  8 ++++--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c     | 41 ++++++++++++++++-------------
>  2 files changed, 29 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> index e5919ef..e42175e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> @@ -424,6 +424,7 @@ amdgpu_dma_buf_create_obj(struct drm_device *dev, struct dma_buf *dma_buf)
>         struct amdgpu_device *adev = drm_to_adev(dev);
>         struct amdgpu_bo *bo;
>         struct amdgpu_bo_param bp;
> +       struct drm_gem_object *gobj;
>         int ret;
>
>         memset(&bp, 0, sizeof(bp));
> @@ -434,17 +435,20 @@ amdgpu_dma_buf_create_obj(struct drm_device *dev, struct dma_buf *dma_buf)
>         bp.type = ttm_bo_type_sg;
>         bp.resv = resv;
>         dma_resv_lock(resv, NULL);
> -       ret = amdgpu_bo_create(adev, &bp, &bo);
> +       ret = amdgpu_gem_object_create(adev, dma_buf->size, PAGE_SIZE,
> +                       AMDGPU_GEM_DOMAIN_CPU,
> +                       0, ttm_bo_type_sg, resv, &gobj);
>         if (ret)
>                 goto error;
>
> +       bo = gem_to_amdgpu_bo(gobj);
>         bo->allowed_domains = AMDGPU_GEM_DOMAIN_GTT;
>         bo->preferred_domains = AMDGPU_GEM_DOMAIN_GTT;
>         if (dma_buf->ops != &amdgpu_dmabuf_ops)
>                 bo->prime_shared_count = 1;
>
>         dma_resv_unlock(resv);
> -       return &bo->tbo.base;
> +       return gobj;
>
>  error:
>         dma_resv_unlock(resv);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> index c9f94fb..ccf4d80 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> @@ -70,26 +70,12 @@ int amdgpu_gem_object_create(struct amdgpu_device *adev, unsigned long size,
>         bp.type = type;
>         bp.resv = resv;
>         bp.preferred_domain = initial_domain;
> -retry:
>         bp.flags = flags;
>         bp.domain = initial_domain;
>         r = amdgpu_bo_create(adev, &bp, &bo);
> -       if (r) {
> -               if (r != -ERESTARTSYS) {
> -                       if (flags & AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED) {
> -                               flags &= ~AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED;
> -                               goto retry;
> -                       }
> -
> -                       if (initial_domain == AMDGPU_GEM_DOMAIN_VRAM) {
> -                               initial_domain |= AMDGPU_GEM_DOMAIN_GTT;
> -                               goto retry;
> -                       }
> -                       DRM_DEBUG("Failed to allocate GEM object (%ld, %d, %u, %d)\n",
> -                                 size, initial_domain, alignment, r);
> -               }
> +       if (r)
>                 return r;
> -       }
> +
>         *obj = &bo->tbo.base;
>         (*obj)->funcs = &amdgpu_gem_object_funcs;
>
> @@ -239,7 +225,7 @@ int amdgpu_gem_create_ioctl(struct drm_device *dev, void *data,
>         uint64_t size = args->in.bo_size;
>         struct dma_resv *resv = NULL;
>         struct drm_gem_object *gobj;
> -       uint32_t handle;
> +       uint32_t handle, initial_domain;
>         int r;
>
>         /* reject invalid gem flags */
> @@ -283,9 +269,28 @@ int amdgpu_gem_create_ioctl(struct drm_device *dev, void *data,
>                 resv = vm->root.base.bo->tbo.base.resv;
>         }
>
> +retry:
> +       initial_domain = (u32)(0xffffffff & args->in.domains);
>         r = amdgpu_gem_object_create(adev, size, args->in.alignment,
> -                                    (u32)(0xffffffff & args->in.domains),
> +                                    initial_domain,
>                                      flags, ttm_bo_type_device, resv, &gobj);
> +       if (r) {
> +               if (r != -ERESTARTSYS) {
> +                       if (flags & AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED) {
> +                               flags &= ~AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED;
> +                               goto retry;
> +                       }
> +
> +                       if (initial_domain == AMDGPU_GEM_DOMAIN_VRAM) {
> +                               initial_domain |= AMDGPU_GEM_DOMAIN_GTT;
> +                               goto retry;
> +                       }
> +                       DRM_DEBUG("Failed to allocate GEM object (%ld, %d, %u, %d)\n",
> +                                 size, initial_domain, args->in.alignment, r);
> +               }
> +               return r;
> +       }
> +
>         if (flags & AMDGPU_GEM_CREATE_VM_ALWAYS_VALID) {
>                 if (!r) {
>                         struct amdgpu_bo *abo = gem_to_amdgpu_bo(gobj);
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
