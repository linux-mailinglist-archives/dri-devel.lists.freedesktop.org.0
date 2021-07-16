Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E05EF3CB7C2
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 15:14:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 685666E96C;
	Fri, 16 Jul 2021 13:14:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7AB06E96C
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 13:14:43 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 e1-20020a9d63c10000b02904b8b87ecc43so9821169otl.4
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 06:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zKdyfD5wEbaVq8gMSyaxnOPWLGVFHqKC2n9GbEy0UsU=;
 b=uG/2/QnMTRePqGv7KfoIeX7s+9blGRskN0aTy4gW/MT82p775k7/eAYet/cjfil5dv
 UVzAZh+pNWKUQA60Ae8MMjwwTUVrpIY1xLBf38gMmW86AGInkmUXugSJm00KJ/QoYXrP
 o4suXKHkpyl0DqY2FSWmXdONVzwI4qPSGYl68eDxDWCMXprqq2nWPmqvCDY6jfFzsgx2
 P7tOXDpAqSpIUvFgyHlBC7Uk7qUCwf4aiUI/ku4TMJQngAhCcMNvSnOzVB5pXLvMUjpk
 5HYVON6J2p85ICvaG492qra8cWNjJPOZvRG/H75PSVXkFnSZaMWmVSQU6XBIti8STzPr
 BxpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zKdyfD5wEbaVq8gMSyaxnOPWLGVFHqKC2n9GbEy0UsU=;
 b=Zw3rdyLjTkCjmi6AFFT5z0omtmUmMZ8Qmy7zpbDiKevSL+qbKVOzkisQGOA3MBp7DW
 OPhFQnThS3FiiZJ04Kj2FWxCYpSBetmQTjzJTXQPErk6UThrW3+QetNIEu1r48M8xRl0
 D6W2jlSfE2hSC9yWuVLUtxaSSBUbdpphqj1dk4QecQEVL4mlN8FwsU/kYk0bK3jbyG5R
 eTsTGdHS0tEtEY7YK2xmFINg0spzaOTfABfl/qdgaus4YQ/QZSk5fP4iIt/vcXpycpQ/
 /kFOvetURbun0OnOMEWNkvPQjuWrRl6UUU/0hu48QMpl+ZwYkmOoZn84VRKksQKNSREl
 T22Q==
X-Gm-Message-State: AOAM531l5hvY4jQJ5UusaQAGnUAvk4HYMxJDuxu9as6JYWCHCpF5jgUx
 AD78lVfUw3TKn/n8f9yiAQ0fh2rO2ipOgqKxDUo=
X-Google-Smtp-Source: ABdhPJzPXtKDuXLG7iacBPXA2973fPGsIQdFm4ereCIgEyABpr0pJFwV4jKe/BQiYTYA2x5u/TExpsvg0ZDCP9/QTyU=
X-Received: by 2002:a9d:2482:: with SMTP id z2mr8326672ota.132.1626441282976; 
 Fri, 16 Jul 2021 06:14:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210716070647.1274-1-christian.koenig@amd.com>
In-Reply-To: <20210716070647.1274-1-christian.koenig@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 16 Jul 2021 09:14:31 -0400
Message-ID: <CADnq5_Pp2VZ33OHq7EUte5gmZq=DyzGwMiaZkE+Yv_JkHkfJOw@mail.gmail.com>
Subject: Re: [PATCH] drm/ttm: revert "Fix COW check"
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 16, 2021 at 3:06 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> This reverts commit 85fd4a8a84316166640102676a356755ddec80e0.
>
> Daniel pointed out that even PROT_READ can cause a BUG_ON() with this.
>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>

Acked-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c  |  3 +--
>  drivers/gpu/drm/nouveau/nouveau_gem.c    |  3 +--
>  drivers/gpu/drm/radeon/radeon_gem.c      |  3 +--
>  drivers/gpu/drm/ttm/ttm_bo_vm.c          | 14 +-------------
>  drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c |  1 -
>  include/drm/ttm/ttm_bo_api.h             |  4 ----
>  6 files changed, 4 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_gem.c
> index 0d65c9d2144e..9cf4beaf646c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> @@ -79,8 +79,7 @@ static const struct vm_operations_struct amdgpu_gem_vm_=
ops =3D {
>         .fault =3D amdgpu_gem_fault,
>         .open =3D ttm_bo_vm_open,
>         .close =3D ttm_bo_vm_close,
> -       .access =3D ttm_bo_vm_access,
> -       .mprotect =3D ttm_bo_vm_mprotect
> +       .access =3D ttm_bo_vm_access
>  };
>
>  static void amdgpu_gem_object_free(struct drm_gem_object *gobj)
> diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouv=
eau/nouveau_gem.c
> index 164ea564bb7a..5b27845075a1 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
> @@ -70,8 +70,7 @@ static const struct vm_operations_struct nouveau_ttm_vm=
_ops =3D {
>         .fault =3D nouveau_ttm_fault,
>         .open =3D ttm_bo_vm_open,
>         .close =3D ttm_bo_vm_close,
> -       .access =3D ttm_bo_vm_access,
> -       .mprotect =3D ttm_bo_vm_mprotect
> +       .access =3D ttm_bo_vm_access
>  };
>
>  void
> diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon=
/radeon_gem.c
> index c19ad07eb7b5..458f92a70887 100644
> --- a/drivers/gpu/drm/radeon/radeon_gem.c
> +++ b/drivers/gpu/drm/radeon/radeon_gem.c
> @@ -77,8 +77,7 @@ static const struct vm_operations_struct radeon_gem_vm_=
ops =3D {
>         .fault =3D radeon_gem_fault,
>         .open =3D ttm_bo_vm_open,
>         .close =3D ttm_bo_vm_close,
> -       .access =3D ttm_bo_vm_access,
> -       .mprotect =3D ttm_bo_vm_mprotect
> +       .access =3D ttm_bo_vm_access
>  };
>
>  static void radeon_gem_object_free(struct drm_gem_object *gobj)
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo=
_vm.c
> index fb325bad5db6..f56be5bc0861 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> @@ -542,29 +542,17 @@ int ttm_bo_vm_access(struct vm_area_struct *vma, un=
signed long addr,
>  }
>  EXPORT_SYMBOL(ttm_bo_vm_access);
>
> -int ttm_bo_vm_mprotect(struct vm_area_struct *vma, unsigned long start,
> -                      unsigned long end, unsigned long newflags)
> -{
> -       /* Enforce no COW since would have really strange behavior with i=
t. */
> -       if (is_cow_mapping(newflags) && (newflags & VM_WRITE))
> -               return -EINVAL;
> -
> -       return 0;
> -}
> -EXPORT_SYMBOL(ttm_bo_vm_mprotect);
> -
>  static const struct vm_operations_struct ttm_bo_vm_ops =3D {
>         .fault =3D ttm_bo_vm_fault,
>         .open =3D ttm_bo_vm_open,
>         .close =3D ttm_bo_vm_close,
>         .access =3D ttm_bo_vm_access,
> -       .mprotect =3D ttm_bo_vm_mprotect,
>  };
>
>  int ttm_bo_mmap_obj(struct vm_area_struct *vma, struct ttm_buffer_object=
 *bo)
>  {
>         /* Enforce no COW since would have really strange behavior with i=
t. */
> -       if (is_cow_mapping(vma->vm_flags) && (vma->vm_flags & VM_WRITE))
> +       if (is_cow_mapping(vma->vm_flags))
>                 return -EINVAL;
>
>         ttm_bo_get(bo);
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c b/drivers/gpu/drm/v=
mwgfx/vmwgfx_ttm_glue.c
> index e4bf7dc99320..e6b1f98ec99f 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
> @@ -61,7 +61,6 @@ int vmw_mmap(struct file *filp, struct vm_area_struct *=
vma)
>                 .fault =3D vmw_bo_vm_fault,
>                 .open =3D ttm_bo_vm_open,
>                 .close =3D ttm_bo_vm_close,
> -               .mprotect =3D ttm_bo_vm_mprotect,
>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>                 .huge_fault =3D vmw_bo_vm_huge_fault,
>  #endif
> diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
> index 40eb95875355..f681bbdbc698 100644
> --- a/include/drm/ttm/ttm_bo_api.h
> +++ b/include/drm/ttm/ttm_bo_api.h
> @@ -605,10 +605,6 @@ void ttm_bo_vm_close(struct vm_area_struct *vma);
>
>  int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
>                      void *buf, int len, int write);
> -
> -int ttm_bo_vm_mprotect(struct vm_area_struct *vma, unsigned long start,
> -                      unsigned long end, unsigned long newflags);
> -
>  bool ttm_bo_delayed_delete(struct ttm_device *bdev, bool remove_all);
>
>  vm_fault_t ttm_bo_vm_dummy_page(struct vm_fault *vmf, pgprot_t prot);
> --
> 2.25.1
>
