Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4444F5F00
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 15:24:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BE6E10E09D;
	Wed,  6 Apr 2022 13:24:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DF7310E074;
 Wed,  6 Apr 2022 13:24:45 +0000 (UTC)
Received: by mail-qt1-x831.google.com with SMTP id t19so4215903qtc.4;
 Wed, 06 Apr 2022 06:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=d4iXvLjsK1mh946NkvFEHMXhSKuL2z+YcK+w/SirEdw=;
 b=MZquX42wF4ahLGQ/s5yIUSm3lMwGPG1pKMoCQSJWWLwuep13kV3W6976KU0dg9w1dz
 FgFCs7WKkX7uwq6HnmZNNlx3tpvJ/fstli4epY+WZB3i4x5cUT/eVdMUEqP1J+LeoCf5
 XIcI9MDKr6Q9vTcOS3rSHIW9UYZj3jnQwlQmn8FroRkcHe9aMa94N8EnTHW9cq9bQjWs
 QsDaw/Kvmq6A30RmFWoAF3x3Z2LWsc9TXCfEohIEBS3WR8kSAtXscf2OqoO7vV9WtzGJ
 GKz9Q3CqjYevFZTmop1hybYywjfW7E0yzxRmM6Qw/xqOmsWyKdsHndIqzCNi5tANifUD
 6BeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=d4iXvLjsK1mh946NkvFEHMXhSKuL2z+YcK+w/SirEdw=;
 b=YJC3t5gxcJhxGq7lfcJviC0uK9HGVaKgWVo00PIt+dpsG1KHXszYpTkQe+uHi6IU6f
 cKHLwyDm2eqGNR2C+OIsVBtAmVvFTE3gnflX+IJkSjXB1+LQOLOmifoGZxnPKiXqPcDr
 i5YaAySJkcQWTynVEw23r5RceMuJfi311R127eNLSyYCQIX78YiYrgePq/oWf1Pk1tXZ
 meodgnrspb+NT0XLUjxhkV+pjSP3b2qncgBALlFqeaGAYxWi2hQB2y7uBhizORs+LZ+f
 q5RVBGZwcOQaRSfo5we70gmchOJ8Rh/29j6EKoUQjmoezW9wOs9MrXuNiYf926CKVXV+
 g6eQ==
X-Gm-Message-State: AOAM531J79rqljUbr9gPVVjluOOc633401xnnBfS9bOh88L5X500vTg1
 uLX6jRWO1y/P+c2pbnjuNiW+N9hn6Lux0ERtfMg=
X-Google-Smtp-Source: ABdhPJy8uGbKLe9SJJNslWXlhJ/XZxgSFEk0UJFdh0ns0lIQ1sh5OzcAoko/RmOJrVFDBfe7mA9CvKsLpsuPps5Glcg=
X-Received: by 2002:a05:620a:f0d:b0:67e:1961:b061 with SMTP id
 v13-20020a05620a0f0d00b0067e1961b061mr5665760qkl.82.1649251484122; Wed, 06
 Apr 2022 06:24:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220406075132.3263-1-christian.koenig@amd.com>
 <20220406075132.3263-15-christian.koenig@amd.com>
In-Reply-To: <20220406075132.3263-15-christian.koenig@amd.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 6 Apr 2022 14:24:17 +0100
Message-ID: <CAM0jSHP2QV=4+Li1Fhfa84-6D-RCXrKp68RpBkudGy6h93ibaQ@mail.gmail.com>
Subject: Re: [PATCH 14/16] drm/i915: drop bo->moving dependency
To: DMA-resv@freedesktop.org
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 6 Apr 2022 at 08:52, Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> That should now be handled by the common dma_resv framework.
>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: intel-gfx@lists.freedesktop.org
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_object.c    | 41 ++++---------------
>  drivers/gpu/drm/i915/gem/i915_gem_object.h    |  8 +---
>  drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c  | 15 +------
>  .../drm/i915/gem/selftests/i915_gem_migrate.c |  3 +-
>  .../drm/i915/gem/selftests/i915_gem_mman.c    |  3 +-
>  drivers/gpu/drm/i915/i915_vma.c               |  9 +++-
>  6 files changed, 21 insertions(+), 58 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm=
/i915/gem/i915_gem_object.c
> index 372bc220faeb..ffde7bc0a95d 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> @@ -741,30 +741,19 @@ static const struct drm_gem_object_funcs i915_gem_o=
bject_funcs =3D {
>  /**
>   * i915_gem_object_get_moving_fence - Get the object's moving fence if a=
ny
>   * @obj: The object whose moving fence to get.
> + * @fence: The resulting fence
>   *
>   * A non-signaled moving fence means that there is an async operation
>   * pending on the object that needs to be waited on before setting up
>   * any GPU- or CPU PTEs to the object's pages.
>   *
> - * Return: A refcounted pointer to the object's moving fence if any,
> - * NULL otherwise.
> + * Return: Negative error code or 0 for success.
>   */
> -struct dma_fence *
> -i915_gem_object_get_moving_fence(struct drm_i915_gem_object *obj)
> +int i915_gem_object_get_moving_fence(struct drm_i915_gem_object *obj,
> +                                    struct dma_fence **fence)
>  {
> -       return dma_fence_get(i915_gem_to_ttm(obj)->moving);
> -}
> -
> -void i915_gem_object_set_moving_fence(struct drm_i915_gem_object *obj,
> -                                     struct dma_fence *fence)
> -{
> -       struct dma_fence **moving =3D &i915_gem_to_ttm(obj)->moving;
> -
> -       if (*moving =3D=3D fence)
> -               return;
> -
> -       dma_fence_put(*moving);
> -       *moving =3D dma_fence_get(fence);
> +       return dma_resv_get_singleton(obj->base.resv, DMA_RESV_USAGE_KERN=
EL,
> +                                     fence);
>  }
>
>  /**
> @@ -782,23 +771,9 @@ void i915_gem_object_set_moving_fence(struct drm_i91=
5_gem_object *obj,
>  int i915_gem_object_wait_moving_fence(struct drm_i915_gem_object *obj,
>                                       bool intr)
>  {
> -       struct dma_fence *fence =3D i915_gem_to_ttm(obj)->moving;
> -       int ret;
> -
>         assert_object_held(obj);
> -       if (!fence)
> -               return 0;
> -
> -       ret =3D dma_fence_wait(fence, intr);
> -       if (ret)
> -               return ret;
> -
> -       if (fence->error)
> -               return fence->error;
> -
> -       i915_gem_to_ttm(obj)->moving =3D NULL;
> -       dma_fence_put(fence);
> -       return 0;
> +       return dma_resv_wait_timeout(obj->base. resv, DMA_RESV_USAGE_KERN=
EL,
> +                                    intr, MAX_SCHEDULE_TIMEOUT);
>  }
>
>  #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm=
/i915/gem/i915_gem_object.h
> index 02c37fe4a535..e11d82a9f7c3 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> @@ -520,12 +520,8 @@ i915_gem_object_finish_access(struct drm_i915_gem_ob=
ject *obj)
>         i915_gem_object_unpin_pages(obj);
>  }
>
> -struct dma_fence *
> -i915_gem_object_get_moving_fence(struct drm_i915_gem_object *obj);
> -
> -void i915_gem_object_set_moving_fence(struct drm_i915_gem_object *obj,
> -                                     struct dma_fence *fence);
> -
> +int i915_gem_object_get_moving_fence(struct drm_i915_gem_object *obj,
> +                                    struct dma_fence **fence);
>  int i915_gem_object_wait_moving_fence(struct drm_i915_gem_object *obj,
>                                       bool intr);
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c b/drivers/gpu/d=
rm/i915/gem/i915_gem_ttm_move.c
> index 438b8a95b3d1..a10716f4e717 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> @@ -467,19 +467,6 @@ __i915_ttm_move(struct ttm_buffer_object *bo,
>         return fence;
>  }
>
> -static int
> -prev_deps(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
> -         struct i915_deps *deps)
> -{
> -       int ret;
> -
> -       ret =3D i915_deps_add_dependency(deps, bo->moving, ctx);
> -       if (!ret)
> -               ret =3D i915_deps_add_resv(deps, bo->base.resv, ctx);
> -
> -       return ret;
> -}
> -
>  /**
>   * i915_ttm_move - The TTM move callback used by i915.
>   * @bo: The buffer object.
> @@ -534,7 +521,7 @@ int i915_ttm_move(struct ttm_buffer_object *bo, bool =
evict,
>                 struct i915_deps deps;
>
>                 i915_deps_init(&deps, GFP_KERNEL | __GFP_NORETRY | __GFP_=
NOWARN);
> -               ret =3D prev_deps(bo, ctx, &deps);
> +               ret =3D i915_deps_add_resv(&deps, bo->base.resv, ctx);
>                 if (ret) {
>                         i915_refct_sgt_put(dst_rsgt);
>                         return ret;
> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c b/driv=
ers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
> index 4997ed18b6e4..0ad443a90c8b 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
> @@ -219,8 +219,7 @@ static int __igt_lmem_pages_migrate(struct intel_gt *=
gt,
>                         err =3D dma_resv_reserve_fences(obj->base.resv, 1=
);
>                         if (!err)
>                                 dma_resv_add_fence(obj->base.resv, &rq->f=
ence,
> -                                                  DMA_RESV_USAGE_WRITE);
> -                       i915_gem_object_set_moving_fence(obj, &rq->fence)=
;
> +                                                  DMA_RESV_USAGE_KERNEL)=
;
>                         i915_request_put(rq);
>                 }
>                 if (err)
> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c b/drivers=
/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> index 3a6e3f6d239f..dfc34cc2ef8c 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> @@ -1221,8 +1221,7 @@ static int __igt_mmap_migrate(struct intel_memory_r=
egion **placements,
>         i915_gem_object_unpin_pages(obj);
>         if (rq) {
>                 dma_resv_add_fence(obj->base.resv, &rq->fence,
> -                                  DMA_RESV_USAGE_WRITE);
> -               i915_gem_object_set_moving_fence(obj, &rq->fence);
> +                                  DMA_RESV_USAGE_KERNEL);
>                 i915_request_put(rq);
>         }
>         i915_gem_object_unlock(obj);
> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_=
vma.c
> index 524477d8939e..d077f7b9eaad 100644
> --- a/drivers/gpu/drm/i915/i915_vma.c
> +++ b/drivers/gpu/drm/i915/i915_vma.c
> @@ -1357,10 +1357,17 @@ int i915_vma_pin_ww(struct i915_vma *vma, struct =
i915_gem_ww_ctx *ww,
>         if (err)
>                 return err;
>
> +       if (vma->obj) {
> +               err =3D i915_gem_object_get_moving_fence(vma->obj, &movin=
g);
> +               if (err)

goto err_put_pages;

> +                       return err;
> +       } else {
> +               moving =3D NULL;

It looks like moving is already initialised with NULL further up.

> +       }
> +
>         if (flags & PIN_GLOBAL)
>                 wakeref =3D intel_runtime_pm_get(&vma->vm->i915->runtime_=
pm);
>
> -       moving =3D vma->obj ? i915_gem_object_get_moving_fence(vma->obj) =
: NULL;

Just fyi, this patch will conflict slightly with the following in gt-next:

e4b3ee71ec2a drm/i915: stop checking for NULL vma->obj
833124a0d169 drm/i915: limit the async bind to bind_async_flags

>         if (flags & vma->vm->bind_async_flags || moving) {
>                 /* lock VM */
>                 err =3D i915_vm_lock_objects(vma->vm, ww);
> --
> 2.25.1
>
