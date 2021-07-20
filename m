Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 934CD3CFB2E
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 15:51:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A560689DFE;
	Tue, 20 Jul 2021 13:51:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 637BD89DFE
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 13:51:25 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id t5so26062625wrw.12
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 06:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=ki/Be1Noj+Lnn82TKD8NCe5ajSAnrSCKnzzWUSsnJXw=;
 b=JWdPZhCs/abc3JXeB6fuX/sZGa3flYWLD8bHm0FjSqwPhbY+5QT1eEpMpTZTNExzkq
 4qe0CHZ1te5iQ9FNgNd9hs046D7+YH0uM0bJ9CSsWl4Am82ijs+qtqJJJlkBE4xZW15Q
 yU6JKSkhaaL+RaJg/hZ6FWbL7L4tUIpVdxJ7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ki/Be1Noj+Lnn82TKD8NCe5ajSAnrSCKnzzWUSsnJXw=;
 b=fU4uwVv9C5V4mtdGkgaudY3iFQ5HMQ2gU/+uRAdw682fTTsN0pULcA9IqM+vzZJQ8J
 fKL+zIPpTj1XKnaTygsc9cbEAFu9kvEO6MKZUIk/+FPEL6rtD3p2aQjGEKs0pGYwbjCg
 1r8dqcnIFtlM8OBGJm0Ju1PcKsYi20j81OINpcj8LqvZVOwuOyAbzx5HvXqN43SEI82K
 b36H7kyVH7HwrlfA1db7Y9hqvfbRg1RBUA86Tk6uVDovCyCyKmw/lXd5zsahWwRBwR5H
 V8pR6da868R3s9CwM6DIYO8rdTMcW9ascZKudCJtiV4191oOfqUf3zQnNPCqFgzuhI0j
 YKzg==
X-Gm-Message-State: AOAM531j0l8TNZWgG58IQKW+0f4bw1suixk76HTKC2bXWSyV8eWorij3
 Wm4HMbSwRzYo02WpCMAByACqUg==
X-Google-Smtp-Source: ABdhPJwAJkr8nQqX/RmfMWq+BTcmUWxdtC/FKdcvrutUkNJw7cgOjF21rsbU3dDYAbmMBJlwThGDwA==
X-Received: by 2002:adf:efc6:: with SMTP id i6mr35655763wrp.213.1626789084229; 
 Tue, 20 Jul 2021 06:51:24 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id m20sm4288236wms.3.2021.07.20.06.51.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 06:51:23 -0700 (PDT)
Date: Tue, 20 Jul 2021 15:51:21 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH] drm/ttm: revert "Fix COW check"
Message-ID: <YPbU2XiJCgzXRMjQ@phenom.ffwll.local>
References: <20210716070647.1274-1-christian.koenig@amd.com>
 <CADnq5_Pp2VZ33OHq7EUte5gmZq=DyzGwMiaZkE+Yv_JkHkfJOw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADnq5_Pp2VZ33OHq7EUte5gmZq=DyzGwMiaZkE+Yv_JkHkfJOw@mail.gmail.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 16, 2021 at 09:14:31AM -0400, Alex Deucher wrote:
> On Fri, Jul 16, 2021 at 3:06 AM Christian König
> <ckoenig.leichtzumerken@gmail.com> wrote:
> >
> > This reverts commit 85fd4a8a84316166640102676a356755ddec80e0.
> >
> > Daniel pointed out that even PROT_READ can cause a BUG_ON() with this.
> >
> > Signed-off-by: Christian König <christian.koenig@amd.com>
> 
> Acked-by: Alex Deucher <alexander.deucher@amd.com>

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> 
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c  |  3 +--
> >  drivers/gpu/drm/nouveau/nouveau_gem.c    |  3 +--
> >  drivers/gpu/drm/radeon/radeon_gem.c      |  3 +--
> >  drivers/gpu/drm/ttm/ttm_bo_vm.c          | 14 +-------------
> >  drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c |  1 -
> >  include/drm/ttm/ttm_bo_api.h             |  4 ----
> >  6 files changed, 4 insertions(+), 24 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> > index 0d65c9d2144e..9cf4beaf646c 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> > @@ -79,8 +79,7 @@ static const struct vm_operations_struct amdgpu_gem_vm_ops = {
> >         .fault = amdgpu_gem_fault,
> >         .open = ttm_bo_vm_open,
> >         .close = ttm_bo_vm_close,
> > -       .access = ttm_bo_vm_access,
> > -       .mprotect = ttm_bo_vm_mprotect
> > +       .access = ttm_bo_vm_access
> >  };
> >
> >  static void amdgpu_gem_object_free(struct drm_gem_object *gobj)
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
> > index 164ea564bb7a..5b27845075a1 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
> > @@ -70,8 +70,7 @@ static const struct vm_operations_struct nouveau_ttm_vm_ops = {
> >         .fault = nouveau_ttm_fault,
> >         .open = ttm_bo_vm_open,
> >         .close = ttm_bo_vm_close,
> > -       .access = ttm_bo_vm_access,
> > -       .mprotect = ttm_bo_vm_mprotect
> > +       .access = ttm_bo_vm_access
> >  };
> >
> >  void
> > diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
> > index c19ad07eb7b5..458f92a70887 100644
> > --- a/drivers/gpu/drm/radeon/radeon_gem.c
> > +++ b/drivers/gpu/drm/radeon/radeon_gem.c
> > @@ -77,8 +77,7 @@ static const struct vm_operations_struct radeon_gem_vm_ops = {
> >         .fault = radeon_gem_fault,
> >         .open = ttm_bo_vm_open,
> >         .close = ttm_bo_vm_close,
> > -       .access = ttm_bo_vm_access,
> > -       .mprotect = ttm_bo_vm_mprotect
> > +       .access = ttm_bo_vm_access
> >  };
> >
> >  static void radeon_gem_object_free(struct drm_gem_object *gobj)
> > diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > index fb325bad5db6..f56be5bc0861 100644
> > --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > @@ -542,29 +542,17 @@ int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
> >  }
> >  EXPORT_SYMBOL(ttm_bo_vm_access);
> >
> > -int ttm_bo_vm_mprotect(struct vm_area_struct *vma, unsigned long start,
> > -                      unsigned long end, unsigned long newflags)
> > -{
> > -       /* Enforce no COW since would have really strange behavior with it. */
> > -       if (is_cow_mapping(newflags) && (newflags & VM_WRITE))
> > -               return -EINVAL;
> > -
> > -       return 0;
> > -}
> > -EXPORT_SYMBOL(ttm_bo_vm_mprotect);
> > -
> >  static const struct vm_operations_struct ttm_bo_vm_ops = {
> >         .fault = ttm_bo_vm_fault,
> >         .open = ttm_bo_vm_open,
> >         .close = ttm_bo_vm_close,
> >         .access = ttm_bo_vm_access,
> > -       .mprotect = ttm_bo_vm_mprotect,
> >  };
> >
> >  int ttm_bo_mmap_obj(struct vm_area_struct *vma, struct ttm_buffer_object *bo)
> >  {
> >         /* Enforce no COW since would have really strange behavior with it. */
> > -       if (is_cow_mapping(vma->vm_flags) && (vma->vm_flags & VM_WRITE))
> > +       if (is_cow_mapping(vma->vm_flags))
> >                 return -EINVAL;
> >
> >         ttm_bo_get(bo);
> > diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
> > index e4bf7dc99320..e6b1f98ec99f 100644
> > --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
> > +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
> > @@ -61,7 +61,6 @@ int vmw_mmap(struct file *filp, struct vm_area_struct *vma)
> >                 .fault = vmw_bo_vm_fault,
> >                 .open = ttm_bo_vm_open,
> >                 .close = ttm_bo_vm_close,
> > -               .mprotect = ttm_bo_vm_mprotect,
> >  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
> >                 .huge_fault = vmw_bo_vm_huge_fault,
> >  #endif
> > diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
> > index 40eb95875355..f681bbdbc698 100644
> > --- a/include/drm/ttm/ttm_bo_api.h
> > +++ b/include/drm/ttm/ttm_bo_api.h
> > @@ -605,10 +605,6 @@ void ttm_bo_vm_close(struct vm_area_struct *vma);
> >
> >  int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
> >                      void *buf, int len, int write);
> > -
> > -int ttm_bo_vm_mprotect(struct vm_area_struct *vma, unsigned long start,
> > -                      unsigned long end, unsigned long newflags);
> > -
> >  bool ttm_bo_delayed_delete(struct ttm_device *bdev, bool remove_all);
> >
> >  vm_fault_t ttm_bo_vm_dummy_page(struct vm_fault *vmf, pgprot_t prot);
> > --
> > 2.25.1
> >

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
