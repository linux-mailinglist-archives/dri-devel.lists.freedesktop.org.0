Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF422D39AD
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 05:38:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 641846E0E8;
	Wed,  9 Dec 2020 04:38:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE4A16E0E8;
 Wed,  9 Dec 2020 04:38:46 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id q25so155209otn.10;
 Tue, 08 Dec 2020 20:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7x6ACDCbmKOeo6LyikYfe924z4n5Uz9un2KNBRHJIVk=;
 b=s2iC4/KKJUtXQcXDd3Wr0ZG0C4GIze4g1b2LoGg8YDxl4I1mqONNOFWIEw0gMl5u9F
 2jIJ6SmgmrG9KQrncCJ8jHkurzuFZtA3Hene8B5qpQueKrBpqX/HgVYVqk6BPHJMKmNw
 wRl6Aur0LcnquavcQ6dsL8/ZenkiTRvFyF3Ye3DyQUsZHtaZLOnR+rIZV9a+KLyIO4qc
 TE7KAraTwL7YXqnLayMQJlzB4GLbAEox/k3ljDHrgJz5x49YSHHvtLQODHE1i9zq24zB
 NNxBcaUB/JJglmABwvw/JIsCyDvzL5mU6BW4zDAx87lIZl2mzyLaOUwrzmo4PhuIME/r
 t7cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7x6ACDCbmKOeo6LyikYfe924z4n5Uz9un2KNBRHJIVk=;
 b=p4N2S5XuKDCqiujnBQBkEB7uixGLjqKEHPxdt2mPHUIErWOwMFgfuFpjEnoEWpm90T
 9NjFlOdCY3eX9JTuh9HX5wyQXLtFq2EA7ts5JY+XA30s8DAG1umYBUUsZuclxldX5+ry
 t83Cq0i43VfpT1+NurbHPHTY5PDArqYys1WBN0Ttj7nBsZen5/G5Gc5vOHA9+h5FqSGB
 TVabE022MvMrf8hdtXVN0v0JDlkx3rMCdrM1zmDFaKZfh6XVAYJ7BLEW7xba/vFxNp7v
 N6gcWi2pcJVSBDkCpe3E/MX65PiMMhcQIlkJzZRlbJ9qgmJOcEz80gkhHrhx7Kf8v5oQ
 AcXA==
X-Gm-Message-State: AOAM533Ko5qWPKgwWoerFoA2rz5bDMkOB8JHGHvKagg7UEszNdCGhISy
 T0aSaYboWRsNBLaroCJNx6ZYCNM4FUE5Hvaj9bU=
X-Google-Smtp-Source: ABdhPJxS9br4wc5WTMsuVzwBY15m3Do+aJYEGgD624z8CkIhePcIwcnSiczlH9AA4dPV50QoWMbUr2OQw2thF9MNP+Y=
X-Received: by 2002:a9d:4ce:: with SMTP id 72mr331270otm.23.1607488726098;
 Tue, 08 Dec 2020 20:38:46 -0800 (PST)
MIME-Version: 1.0
References: <1607458575-15197-1-git-send-email-andrey.grodzovsky@amd.com>
In-Reply-To: <1607458575-15197-1-git-send-email-andrey.grodzovsky@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 8 Dec 2020 23:38:35 -0500
Message-ID: <CADnq5_NQ7=uqQXfCMDLJxHhLnjXgdDHFMQdgi86YBkYhy5=inQ@mail.gmail.com>
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

Just noticed this, size and args->in.alignment are u64, so these
should be %llu.  With that fixed, my RB still stands.

Alex

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
