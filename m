Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C22399496
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 22:34:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9C386E094;
	Wed,  2 Jun 2021 20:34:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62F416E094
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 20:34:44 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id z38so5664502ybh.5
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 13:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Q1gg1f4aPl2pp7NPAXn1yNdnmcGcgYtYwuXw9d7ZO4A=;
 b=dYJuRmS9A+gGCBJuJuG+ZHCOH49CGT/tEVOhfJwYq74fKwKltQL2diYCV5odHBwtfO
 cX7ewrWcqC8nrEoGh5MPogQ40Dh6p7n2QiPOZnFdA2DQCCZlKGqXLDi1WvZk3Zp3t0cz
 f0LRUv6GUUWUcuu1jt6+VGizEpncCM8iumHunaz2L7uRMlZX3dn0yjuS+xUa30a7qSrs
 QGASRyO1BouGqeLoRTUo96Mtq/uJzZRlxxa8LK3sZLN1lEBfc8HcQYbqHYW3WIaM7EYA
 iBqx1lZ9nGjkZms0phdOkOufpb6kUv6Xp4Nd6/WIahfE6XDtEmZJFLoquesvBdVMXyTJ
 HPvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Q1gg1f4aPl2pp7NPAXn1yNdnmcGcgYtYwuXw9d7ZO4A=;
 b=LbYKgBK+x/h/lSFdFP9aDpfplw1Qn4JOEksvupgMxQjy4NYwe6XYVuQGHL9oNlyyb0
 LYXdPOt4H3nM72Oq8yE221UVkhGBRHom++ZtXBVI7RHUquIof+o+cgLqN3UlgcQ3ms8s
 cYRrze8UIGyIAfYBVUHno/pU6DVknE2hm4cISeQ1ap+1mkUAMq4L4OFNyaqTn6gc0SNc
 5AkAEWxI3Jjaro9D2eEBjMLxcU4PpCBYYbBmoILpWdpoRxF8AANydg2J4nFerKDPRYdT
 Lf/F6g3kOboGOy+ai0X6gudir1LM/8lvn4i5Q/oEkJY9Z8MKmKxwBpyUNnSRpPNh2ekv
 e0NQ==
X-Gm-Message-State: AOAM5336BXQEoofhPhaeyfx3VMEfai9zrE0JdJ8+zMiQCEOntbGys6dl
 RVe3snCZ4gUL6lyskIAtNjwLzx9jd/yLdxIDi6hzPg==
X-Google-Smtp-Source: ABdhPJxEglYWS89EWy8kccLd3pMq1drOjsKlIbnzumRvMQVkOkgz48dJRmM9zn1CW7uinpqyVGR2bkbNkJ4EWMRO1gg=
X-Received: by 2002:a25:81c5:: with SMTP id n5mr48931906ybm.323.1622666083159; 
 Wed, 02 Jun 2021 13:34:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210602111714.212426-1-christian.koenig@amd.com>
 <20210602111714.212426-7-christian.koenig@amd.com>
In-Reply-To: <20210602111714.212426-7-christian.koenig@amd.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed, 2 Jun 2021 15:34:32 -0500
Message-ID: <CAOFGe95KX4eJMMSON_OmzJ2+e0EzniRXgKOWvN+XG4z8mdCD2A@mail.gmail.com>
Subject: Re: [PATCH 7/7] dma-buf: drop the _rcu postfix on function names
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
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 2, 2021 at 6:17 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> The functions can be called both in _rcu context as well
> as while holding the lock.
>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
>  drivers/dma-buf/dma-buf.c                     |  3 +--
>  drivers/dma-buf/dma-resv.c                    | 24 +++++++++----------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c   |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c       |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c       |  4 ++--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c        |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c       |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        |  8 +++----
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  2 +-
>  drivers/gpu/drm/drm_gem.c                     |  4 ++--
>  drivers/gpu/drm/etnaviv/etnaviv_gem.c         |  4 ++--
>  drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c  |  2 +-
>  drivers/gpu/drm/i915/dma_resv_utils.c         |  2 +-
>  drivers/gpu/drm/i915/gem/i915_gem_busy.c      |  2 +-
>  .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  2 +-
>  drivers/gpu/drm/i915/gem/i915_gem_userptr.c   |  2 +-
>  drivers/gpu/drm/i915/gem/i915_gem_wait.c      |  4 ++--
>  drivers/gpu/drm/i915/i915_request.c           |  2 +-
>  drivers/gpu/drm/i915/i915_sw_fence.c          |  2 +-
>  drivers/gpu/drm/msm/msm_gem.c                 |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_gem.c         |  2 +-
>  drivers/gpu/drm/panfrost/panfrost_drv.c       |  2 +-
>  drivers/gpu/drm/radeon/radeon_gem.c           |  6 ++---
>  drivers/gpu/drm/radeon/radeon_mn.c            |  2 +-
>  drivers/gpu/drm/ttm/ttm_bo.c                  | 12 +++++-----
>  drivers/gpu/drm/vgem/vgem_fence.c             |  2 +-
>  drivers/gpu/drm/virtio/virtgpu_ioctl.c        |  4 ++--
>  drivers/gpu/drm/vmwgfx/vmwgfx_bo.c            |  2 +-
>  include/linux/dma-resv.h                      | 17 ++++---------
>  31 files changed, 60 insertions(+), 70 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 4d0ddc712f1e..f92931d8db51 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -1147,8 +1147,7 @@ static int __dma_buf_begin_cpu_access(struct dma_bu=
f *dmabuf,
>         long ret;
>
>         /* Wait on any implicit rendering fences */
> -       ret =3D dma_resv_wait_timeout_rcu(resv, write, true,
> -                                                 MAX_SCHEDULE_TIMEOUT);
> +       ret =3D dma_resv_wait_timeout(resv, write, true, MAX_SCHEDULE_TIM=
EOUT);
>         if (ret < 0)
>                 return ret;
>
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index b1a1a31dc009..74fe64dc1ce3 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -393,7 +393,7 @@ int dma_resv_copy_fences(struct dma_resv *dst, struct=
 dma_resv *src)
>  EXPORT_SYMBOL(dma_resv_copy_fences);
>
>  /**
> - * dma_resv_get_fences_rcu - Get an object's shared and exclusive
> + * dma_resv_get_fences - Get an object's shared and exclusive
>   * fences without update side lock held
>   * @obj: the reservation object
>   * @pfence_excl: the returned exclusive fence (or NULL)
> @@ -405,10 +405,9 @@ EXPORT_SYMBOL(dma_resv_copy_fences);
>   * exclusive fence is not specified the fence is put into the array of t=
he
>   * shared fences as well. Returns either zero or -ENOMEM.
>   */
> -int dma_resv_get_fences_rcu(struct dma_resv *obj,
> -                           struct dma_fence **pfence_excl,
> -                           unsigned int *pshared_count,
> -                           struct dma_fence ***pshared)
> +int dma_resv_get_fences(struct dma_resv *obj, struct dma_fence **pfence_=
excl,
> +                       unsigned int *pshared_count,
> +                       struct dma_fence ***pshared)
>  {
>         struct dma_fence **shared =3D NULL;
>         struct dma_fence *fence_excl;
> @@ -491,10 +490,10 @@ int dma_resv_get_fences_rcu(struct dma_resv *obj,
>         *pshared =3D shared;
>         return ret;
>  }
> -EXPORT_SYMBOL_GPL(dma_resv_get_fences_rcu);
> +EXPORT_SYMBOL_GPL(dma_resv_get_fences);
>
>  /**
> - * dma_resv_wait_timeout_rcu - Wait on reservation's objects
> + * dma_resv_wait_timeout - Wait on reservation's objects
>   * shared and/or exclusive fences.
>   * @obj: the reservation object
>   * @wait_all: if true, wait on all fences, else wait on just exclusive f=
ence
> @@ -505,9 +504,8 @@ EXPORT_SYMBOL_GPL(dma_resv_get_fences_rcu);
>   * Returns -ERESTARTSYS if interrupted, 0 if the wait timed out, or
>   * greater than zer on success.
>   */
> -long dma_resv_wait_timeout_rcu(struct dma_resv *obj,
> -                              bool wait_all, bool intr,
> -                              unsigned long timeout)
> +long dma_resv_wait_timeout(struct dma_resv *obj, bool wait_all, bool int=
r,
> +                          unsigned long timeout)
>  {
>         long ret =3D timeout ? timeout : 1;
>         unsigned int seq, shared_count;
> @@ -579,7 +577,7 @@ long dma_resv_wait_timeout_rcu(struct dma_resv *obj,
>         rcu_read_unlock();
>         goto retry;
>  }
> -EXPORT_SYMBOL_GPL(dma_resv_wait_timeout_rcu);
> +EXPORT_SYMBOL_GPL(dma_resv_wait_timeout);
>
>
>  static inline int dma_resv_test_signaled_single(struct dma_fence *passed=
_fence)
> @@ -608,7 +606,7 @@ static inline int dma_resv_test_signaled_single(struc=
t dma_fence *passed_fence)
>   * RETURNS
>   * true if all fences signaled, else false
>   */
> -bool dma_resv_test_signaled_rcu(struct dma_resv *obj, bool test_all)
> +bool dma_resv_test_signaled(struct dma_resv *obj, bool test_all)
>  {
>         unsigned int seq, shared_count;
>         int ret;
> @@ -657,7 +655,7 @@ bool dma_resv_test_signaled_rcu(struct dma_resv *obj,=
 bool test_all)
>         rcu_read_unlock();
>         return ret;
>  }
> -EXPORT_SYMBOL_GPL(dma_resv_test_signaled_rcu);
> +EXPORT_SYMBOL_GPL(dma_resv_test_signaled);
>
>  #if IS_ENABLED(CONFIG_LOCKDEP)
>  static int __init dma_resv_lockdep(void)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_display.c
> index 49f73b5b89b0..004d01d2e1d7 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> @@ -203,7 +203,7 @@ int amdgpu_display_crtc_page_flip_target(struct drm_c=
rtc *crtc,
>                 goto unpin;
>         }
>
> -       r =3D dma_resv_get_fences_rcu(new_abo->tbo.base.resv, &work->excl=
,
> +       r =3D dma_resv_get_fences(new_abo->tbo.base.resv, &work->excl,
>                                               &work->shared_count,
>                                               &work->shared);
>         if (unlikely(r !=3D 0)) {
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_dma_buf.c
> index 3b13c8a38c4e..615be1697d49 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> @@ -52,7 +52,7 @@ __dma_resv_make_exclusive(struct dma_resv *obj)
>         if (!dma_resv_shared(obj)) /* no shared fences to convert */
>                 return 0;
>
> -       r =3D dma_resv_get_fences_rcu(obj, NULL, &count, &fences);
> +       r =3D dma_resv_get_fences(obj, NULL, &count, &fences);
>         if (r)
>                 return r;
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_gem.c
> index cd5146fa6fb6..dafc96032d7d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> @@ -526,7 +526,7 @@ int amdgpu_gem_wait_idle_ioctl(struct drm_device *dev=
, void *data,
>                 return -ENOENT;
>         }
>         robj =3D gem_to_amdgpu_bo(gobj);
> -       ret =3D dma_resv_wait_timeout_rcu(robj->tbo.base.resv, true, true=
,
> +       ret =3D dma_resv_wait_timeout(robj->tbo.base.resv, true, true,
>                                                   timeout);
>
>         /* ret =3D=3D 0 means not signaled,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_ids.c
> index b4971e90b98c..65a3422ec078 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
> @@ -112,7 +112,7 @@ void amdgpu_pasid_free_delayed(struct dma_resv *resv,
>         unsigned count;
>         int r;
>
> -       r =3D dma_resv_get_fences_rcu(resv, NULL, &count, &fences);
> +       r =3D dma_resv_get_fences(resv, NULL, &count, &fences);
>         if (r)
>                 goto fallback;
>
> @@ -156,7 +156,7 @@ void amdgpu_pasid_free_delayed(struct dma_resv *resv,
>         /* Not enough memory for the delayed delete, as last resort
>          * block for all the fences to complete.
>          */
> -       dma_resv_wait_timeout_rcu(resv, true, false,
> +       dma_resv_wait_timeout(resv, true, false,
>                                             MAX_SCHEDULE_TIMEOUT);
>         amdgpu_pasid_free(pasid);
>  }
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c b/drivers/gpu/drm/amd=
/amdgpu/amdgpu_mn.c
> index 2741c28ff1b5..86de11a86a3e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c
> @@ -75,7 +75,7 @@ static bool amdgpu_mn_invalidate_gfx(struct mmu_interva=
l_notifier *mni,
>
>         mmu_interval_set_seq(mni, cur_seq);
>
> -       r =3D dma_resv_wait_timeout_rcu(bo->tbo.base.resv, true, false,
> +       r =3D dma_resv_wait_timeout(bo->tbo.base.resv, true, false,
>                                       MAX_SCHEDULE_TIMEOUT);
>         mutex_unlock(&adev->notifier_lock);
>         if (r <=3D 0)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_object.c
> index 03c6b63d1d54..821dec6d2f73 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -756,7 +756,7 @@ int amdgpu_bo_kmap(struct amdgpu_bo *bo, void **ptr)
>                 return 0;
>         }
>
> -       r =3D dma_resv_wait_timeout_rcu(bo->tbo.base.resv, false, false,
> +       r =3D dma_resv_wait_timeout(bo->tbo.base.resv, false, false,
>                                                 MAX_SCHEDULE_TIMEOUT);
>         if (r < 0)
>                 return r;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_uvd.c
> index 82f0542c7792..3773f5ff6f0e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> @@ -1126,7 +1126,7 @@ static int amdgpu_uvd_send_msg(struct amdgpu_ring *=
ring, struct amdgpu_bo *bo,
>         ib->length_dw =3D 16;
>
>         if (direct) {
> -               r =3D dma_resv_wait_timeout_rcu(bo->tbo.base.resv,
> +               r =3D dma_resv_wait_timeout(bo->tbo.base.resv,
>                                                         true, false,
>                                                         msecs_to_jiffies(=
10));

Some kernel CI thing (not sure who runs it) is likely going to
complain at you about messing up indentation.  I don't know how much
you care.  I went ahead and fixed it all in my version of this change
but it's annoying and half of them were indented wrong before this
change so I'm a bit Meh.

Either way, assuming you've done a grep for the _rcu versions to
ensure you haven't missed any and assuming it all compiles,

Reviewed-by: Jason Ekstrand <jason@jlekstrand.net>

>                 if (r =3D=3D 0)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd=
/amdgpu/amdgpu_vm.c
> index bcfd4a8d0288..da716aa38085 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -2022,13 +2022,13 @@ static void amdgpu_vm_prt_fini(struct amdgpu_devi=
ce *adev, struct amdgpu_vm *vm)
>         unsigned i, shared_count;
>         int r;
>
> -       r =3D dma_resv_get_fences_rcu(resv, &excl,
> +       r =3D dma_resv_get_fences(resv, &excl,
>                                               &shared_count, &shared);
>         if (r) {
>                 /* Not enough memory to grab the fence list, as last reso=
rt
>                  * block for all the fences to complete.
>                  */
> -               dma_resv_wait_timeout_rcu(resv, true, false,
> +               dma_resv_wait_timeout(resv, true, false,
>                                                     MAX_SCHEDULE_TIMEOUT)=
;
>                 return;
>         }
> @@ -2640,7 +2640,7 @@ bool amdgpu_vm_evictable(struct amdgpu_bo *bo)
>                 return true;
>
>         /* Don't evict VM page tables while they are busy */
> -       if (!dma_resv_test_signaled_rcu(bo->tbo.base.resv, true))
> +       if (!dma_resv_test_signaled(bo->tbo.base.resv, true))
>                 return false;
>
>         /* Try to block ongoing updates */
> @@ -2820,7 +2820,7 @@ void amdgpu_vm_adjust_size(struct amdgpu_device *ad=
ev, uint32_t min_vm_size,
>   */
>  long amdgpu_vm_wait_idle(struct amdgpu_vm *vm, long timeout)
>  {
> -       timeout =3D dma_resv_wait_timeout_rcu(vm->root.base.bo->tbo.base.=
resv,
> +       timeout =3D dma_resv_wait_timeout(vm->root.base.bo->tbo.base.resv=
,
>                                             true, true, timeout);
>         if (timeout <=3D 0)
>                 return timeout;
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/=
gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 3267eb2e35dd..1633afd3c03b 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -8400,7 +8400,7 @@ static void amdgpu_dm_commit_planes(struct drm_atom=
ic_state *state,
>                  * deadlock during GPU reset when this fence will not sig=
nal
>                  * but we hold reservation lock for the BO.
>                  */
> -               r =3D dma_resv_wait_timeout_rcu(abo->tbo.base.resv, true,
> +               r =3D dma_resv_wait_timeout(abo->tbo.base.resv, true,
>                                                         false,
>                                                         msecs_to_jiffies(=
5000));
>                 if (unlikely(r <=3D 0))
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 263b4fb03303..11770da97dc0 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -770,7 +770,7 @@ long drm_gem_dma_resv_wait(struct drm_file *filep, u3=
2 handle,
>                 return -EINVAL;
>         }
>
> -       ret =3D dma_resv_wait_timeout_rcu(obj->resv, wait_all,
> +       ret =3D dma_resv_wait_timeout(obj->resv, wait_all,
>                                                   true, timeout);
>         if (ret =3D=3D 0)
>                 ret =3D -ETIME;
> @@ -1380,7 +1380,7 @@ int drm_gem_fence_array_add_implicit(struct xarray =
*fence_array,
>                 return drm_gem_fence_array_add(fence_array, fence);
>         }
>
> -       ret =3D dma_resv_get_fences_rcu(obj->resv, NULL,
> +       ret =3D dma_resv_get_fences(obj->resv, NULL,
>                                                 &fence_count, &fences);
>         if (ret || !fence_count)
>                 return ret;
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etna=
viv/etnaviv_gem.c
> index 4d43b8630f0e..e3c209628688 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> @@ -390,13 +390,13 @@ int etnaviv_gem_cpu_prep(struct drm_gem_object *obj=
, u32 op,
>         }
>
>         if (op & ETNA_PREP_NOSYNC) {
> -               if (!dma_resv_test_signaled_rcu(obj->resv,
> +               if (!dma_resv_test_signaled(obj->resv,
>                                                           write))
>                         return -EBUSY;
>         } else {
>                 unsigned long remain =3D etnaviv_timeout_to_jiffies(timeo=
ut);
>
> -               ret =3D dma_resv_wait_timeout_rcu(obj->resv,
> +               ret =3D dma_resv_wait_timeout(obj->resv,
>                                                           write, true, re=
main);
>                 if (ret <=3D 0)
>                         return ret =3D=3D 0 ? -ETIMEDOUT : ret;
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/d=
rm/etnaviv/etnaviv_gem_submit.c
> index c942d2a8c252..9cc36bbc2502 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> @@ -189,7 +189,7 @@ static int submit_fence_sync(struct etnaviv_gem_submi=
t *submit)
>                         continue;
>
>                 if (bo->flags & ETNA_SUBMIT_BO_WRITE) {
> -                       ret =3D dma_resv_get_fences_rcu(robj, &bo->excl,
> +                       ret =3D dma_resv_get_fences(robj, &bo->excl,
>                                                                 &bo->nr_s=
hared,
>                                                                 &bo->shar=
ed);
>                         if (ret)
> diff --git a/drivers/gpu/drm/i915/dma_resv_utils.c b/drivers/gpu/drm/i915=
/dma_resv_utils.c
> index 9e508e7d4629..7df91b7e4ca8 100644
> --- a/drivers/gpu/drm/i915/dma_resv_utils.c
> +++ b/drivers/gpu/drm/i915/dma_resv_utils.c
> @@ -10,7 +10,7 @@
>  void dma_resv_prune(struct dma_resv *resv)
>  {
>         if (dma_resv_trylock(resv)) {
> -               if (dma_resv_test_signaled_rcu(resv, true))
> +               if (dma_resv_test_signaled(resv, true))
>                         dma_resv_add_excl_fence(resv, NULL);
>                 dma_resv_unlock(resv);
>         }
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_busy.c b/drivers/gpu/drm/i=
915/gem/i915_gem_busy.c
> index 3f94becac541..0083a850f839 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_busy.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
> @@ -105,7 +105,7 @@ i915_gem_busy_ioctl(struct drm_device *dev, void *dat=
a,
>          * Alternatively, we can trade that extra information on read/wri=
te
>          * activity with
>          *      args->busy =3D
> -        *              !dma_resv_test_signaled_rcu(obj->resv, true);
> +        *              !dma_resv_test_signaled(obj->resv, true);
>          * to report the overall busyness. This is what the wait-ioctl do=
es.
>          *
>          */
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu=
/drm/i915/gem/i915_gem_execbuffer.c
> index 297143511f99..66789111a24b 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -1481,7 +1481,7 @@ static inline bool use_reloc_gpu(struct i915_vma *v=
ma)
>         if (DBG_FORCE_RELOC)
>                 return false;
>
> -       return !dma_resv_test_signaled_rcu(vma->resv, true);
> +       return !dma_resv_test_signaled(vma->resv, true);
>  }
>
>  static unsigned long vma_phys_addr(struct i915_vma *vma, u32 offset)
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c b/drivers/gpu/dr=
m/i915/gem/i915_gem_userptr.c
> index a657b99ec760..e78738aec7b2 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
> @@ -85,7 +85,7 @@ static bool i915_gem_userptr_invalidate(struct mmu_inte=
rval_notifier *mni,
>                 return true;
>
>         /* we will unbind on next submission, still have userptr pins */
> -       r =3D dma_resv_wait_timeout_rcu(obj->base.resv, true, false,
> +       r =3D dma_resv_wait_timeout(obj->base.resv, true, false,
>                                       MAX_SCHEDULE_TIMEOUT);
>         if (r <=3D 0)
>                 drm_err(&i915->drm, "(%ld) failed to wait for idle\n", r)=
;
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_wait.c b/drivers/gpu/drm/i=
915/gem/i915_gem_wait.c
> index c13aeddf5aa7..e7aebb8fb468 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_wait.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
> @@ -45,7 +45,7 @@ i915_gem_object_wait_reservation(struct dma_resv *resv,
>                 unsigned int count, i;
>                 int ret;
>
> -               ret =3D dma_resv_get_fences_rcu(resv, &excl, &count, &sha=
red);
> +               ret =3D dma_resv_get_fences(resv, &excl, &count, &shared)=
;
>                 if (ret)
>                         return ret;
>
> @@ -158,7 +158,7 @@ i915_gem_object_wait_priority(struct drm_i915_gem_obj=
ect *obj,
>                 unsigned int count, i;
>                 int ret;
>
> -               ret =3D dma_resv_get_fences_rcu(obj->base.resv,
> +               ret =3D dma_resv_get_fences(obj->base.resv,
>                                               &excl, &count, &shared);
>                 if (ret)
>                         return ret;
> diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i=
915_request.c
> index c85494f411f4..4a70a1881d79 100644
> --- a/drivers/gpu/drm/i915/i915_request.c
> +++ b/drivers/gpu/drm/i915/i915_request.c
> @@ -1594,7 +1594,7 @@ i915_request_await_object(struct i915_request *to,
>                 struct dma_fence **shared;
>                 unsigned int count, i;
>
> -               ret =3D dma_resv_get_fences_rcu(obj->base.resv,
> +               ret =3D dma_resv_get_fences(obj->base.resv,
>                                                         &excl, &count, &s=
hared);
>                 if (ret)
>                         return ret;
> diff --git a/drivers/gpu/drm/i915/i915_sw_fence.c b/drivers/gpu/drm/i915/=
i915_sw_fence.c
> index 7aaf74552d06..c589a681da77 100644
> --- a/drivers/gpu/drm/i915/i915_sw_fence.c
> +++ b/drivers/gpu/drm/i915/i915_sw_fence.c
> @@ -582,7 +582,7 @@ int i915_sw_fence_await_reservation(struct i915_sw_fe=
nce *fence,
>                 struct dma_fence **shared;
>                 unsigned int count, i;
>
> -               ret =3D dma_resv_get_fences_rcu(resv, &excl, &count, &sha=
red);
> +               ret =3D dma_resv_get_fences(resv, &excl, &count, &shared)=
;
>                 if (ret)
>                         return ret;
>
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.=
c
> index 43af91df552e..ecd35986ddb5 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -915,7 +915,7 @@ int msm_gem_cpu_prep(struct drm_gem_object *obj, uint=
32_t op, ktime_t *timeout)
>                 op & MSM_PREP_NOSYNC ? 0 : timeout_to_jiffies(timeout);
>         long ret;
>
> -       ret =3D dma_resv_wait_timeout_rcu(obj->resv, write,
> +       ret =3D dma_resv_wait_timeout(obj->resv, write,
>                                                   true,  remain);
>         if (ret =3D=3D 0)
>                 return remain =3D=3D 0 ? -EBUSY : -ETIMEDOUT;
> diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouv=
eau/nouveau_gem.c
> index d863e5ed954a..c59072f254f1 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
> @@ -964,7 +964,7 @@ nouveau_gem_ioctl_cpu_prep(struct drm_device *dev, vo=
id *data,
>                 return -ENOENT;
>         nvbo =3D nouveau_gem_object(gem);
>
> -       lret =3D dma_resv_wait_timeout_rcu(nvbo->bo.base.resv, write, tru=
e,
> +       lret =3D dma_resv_wait_timeout(nvbo->bo.base.resv, write, true,
>                                                    no_wait ? 0 : 30 * HZ)=
;
>         if (!lret)
>                 ret =3D -EBUSY;
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/pa=
nfrost/panfrost_drv.c
> index ca07098a6141..0e6e893eb81d 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -311,7 +311,7 @@ panfrost_ioctl_wait_bo(struct drm_device *dev, void *=
data,
>         if (!gem_obj)
>                 return -ENOENT;
>
> -       ret =3D dma_resv_wait_timeout_rcu(gem_obj->resv, true,
> +       ret =3D dma_resv_wait_timeout(gem_obj->resv, true,
>                                                   true, timeout);
>         if (!ret)
>                 ret =3D timeout ? -ETIMEDOUT : -EBUSY;
> diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon=
/radeon_gem.c
> index 3272c33af8fe..458f92a70887 100644
> --- a/drivers/gpu/drm/radeon/radeon_gem.c
> +++ b/drivers/gpu/drm/radeon/radeon_gem.c
> @@ -161,7 +161,7 @@ static int radeon_gem_set_domain(struct drm_gem_objec=
t *gobj,
>         }
>         if (domain =3D=3D RADEON_GEM_DOMAIN_CPU) {
>                 /* Asking for cpu access wait for object idle */
> -               r =3D dma_resv_wait_timeout_rcu(robj->tbo.base.resv, true=
, true, 30 * HZ);
> +               r =3D dma_resv_wait_timeout(robj->tbo.base.resv, true, tr=
ue, 30 * HZ);
>                 if (!r)
>                         r =3D -EBUSY;
>
> @@ -523,7 +523,7 @@ int radeon_gem_busy_ioctl(struct drm_device *dev, voi=
d *data,
>         }
>         robj =3D gem_to_radeon_bo(gobj);
>
> -       r =3D dma_resv_test_signaled_rcu(robj->tbo.base.resv, true);
> +       r =3D dma_resv_test_signaled(robj->tbo.base.resv, true);
>         if (r =3D=3D 0)
>                 r =3D -EBUSY;
>         else
> @@ -552,7 +552,7 @@ int radeon_gem_wait_idle_ioctl(struct drm_device *dev=
, void *data,
>         }
>         robj =3D gem_to_radeon_bo(gobj);
>
> -       ret =3D dma_resv_wait_timeout_rcu(robj->tbo.base.resv, true, true=
, 30 * HZ);
> +       ret =3D dma_resv_wait_timeout(robj->tbo.base.resv, true, true, 30=
 * HZ);
>         if (ret =3D=3D 0)
>                 r =3D -EBUSY;
>         else if (ret < 0)
> diff --git a/drivers/gpu/drm/radeon/radeon_mn.c b/drivers/gpu/drm/radeon/=
radeon_mn.c
> index e37c9a57a7c3..adb084e6ddbe 100644
> --- a/drivers/gpu/drm/radeon/radeon_mn.c
> +++ b/drivers/gpu/drm/radeon/radeon_mn.c
> @@ -66,7 +66,7 @@ static bool radeon_mn_invalidate(struct mmu_interval_no=
tifier *mn,
>                 return true;
>         }
>
> -       r =3D dma_resv_wait_timeout_rcu(bo->tbo.base.resv, true, false,
> +       r =3D dma_resv_wait_timeout(bo->tbo.base.resv, true, false,
>                                       MAX_SCHEDULE_TIMEOUT);
>         if (r <=3D 0)
>                 DRM_ERROR("(%ld) failed to wait for user bo\n", r);
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index c41ef0caa492..32004cf37549 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -296,7 +296,7 @@ static int ttm_bo_cleanup_refs(struct ttm_buffer_obje=
ct *bo,
>         struct dma_resv *resv =3D &bo->base._resv;
>         int ret;
>
> -       if (dma_resv_test_signaled_rcu(resv, true))
> +       if (dma_resv_test_signaled(resv, true))
>                 ret =3D 0;
>         else
>                 ret =3D -EBUSY;
> @@ -308,7 +308,7 @@ static int ttm_bo_cleanup_refs(struct ttm_buffer_obje=
ct *bo,
>                         dma_resv_unlock(bo->base.resv);
>                 spin_unlock(&bo->bdev->lru_lock);
>
> -               lret =3D dma_resv_wait_timeout_rcu(resv, true, interrupti=
ble,
> +               lret =3D dma_resv_wait_timeout(resv, true, interruptible,
>                                                  30 * HZ);
>
>                 if (lret < 0)
> @@ -411,7 +411,7 @@ static void ttm_bo_release(struct kref *kref)
>                         /* Last resort, if we fail to allocate memory for=
 the
>                          * fences block for the BO to become idle
>                          */
> -                       dma_resv_wait_timeout_rcu(bo->base.resv, true, fa=
lse,
> +                       dma_resv_wait_timeout(bo->base.resv, true, false,
>                                                   30 * HZ);
>                 }
>
> @@ -422,7 +422,7 @@ static void ttm_bo_release(struct kref *kref)
>                 ttm_mem_io_free(bdev, bo->resource);
>         }
>
> -       if (!dma_resv_test_signaled_rcu(bo->base.resv, true) ||
> +       if (!dma_resv_test_signaled(bo->base.resv, true) ||
>             !dma_resv_trylock(bo->base.resv)) {
>                 /* The BO is not idle, resurrect it for delayed destroy *=
/
>                 ttm_bo_flush_all_fences(bo);
> @@ -1121,13 +1121,13 @@ int ttm_bo_wait(struct ttm_buffer_object *bo,
>         long timeout =3D 15 * HZ;
>
>         if (no_wait) {
> -               if (dma_resv_test_signaled_rcu(bo->base.resv, true))
> +               if (dma_resv_test_signaled(bo->base.resv, true))
>                         return 0;
>                 else
>                         return -EBUSY;
>         }
>
> -       timeout =3D dma_resv_wait_timeout_rcu(bo->base.resv, true,
> +       timeout =3D dma_resv_wait_timeout(bo->base.resv, true,
>                                                       interruptible, time=
out);
>         if (timeout < 0)
>                 return timeout;
> diff --git a/drivers/gpu/drm/vgem/vgem_fence.c b/drivers/gpu/drm/vgem/vge=
m_fence.c
> index 2902dc6e64fa..7f3125cf5358 100644
> --- a/drivers/gpu/drm/vgem/vgem_fence.c
> +++ b/drivers/gpu/drm/vgem/vgem_fence.c
> @@ -151,7 +151,7 @@ int vgem_fence_attach_ioctl(struct drm_device *dev,
>
>         /* Check for a conflicting fence */
>         resv =3D obj->resv;
> -       if (!dma_resv_test_signaled_rcu(resv,
> +       if (!dma_resv_test_signaled(resv,
>                                                   arg->flags & VGEM_FENCE=
_WRITE)) {
>                 ret =3D -EBUSY;
>                 goto err_fence;
> diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/vir=
tio/virtgpu_ioctl.c
> index 669f2ee39515..190d9495dc0e 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> @@ -451,9 +451,9 @@ static int virtio_gpu_wait_ioctl(struct drm_device *d=
ev, void *data,
>                 return -ENOENT;
>
>         if (args->flags & VIRTGPU_WAIT_NOWAIT) {
> -               ret =3D dma_resv_test_signaled_rcu(obj->resv, true);
> +               ret =3D dma_resv_test_signaled(obj->resv, true);
>         } else {
> -               ret =3D dma_resv_wait_timeout_rcu(obj->resv, true, true,
> +               ret =3D dma_resv_wait_timeout(obj->resv, true, true,
>                                                 timeout);
>         }
>         if (ret =3D=3D 0)
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/=
vmwgfx_bo.c
> index 176b6201ef2b..8faf1df027f3 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> @@ -743,7 +743,7 @@ static int vmw_user_bo_synccpu_grab(struct vmw_user_b=
uffer_object *user_bo,
>         if (flags & drm_vmw_synccpu_allow_cs) {
>                 long lret;
>
> -               lret =3D dma_resv_wait_timeout_rcu
> +               lret =3D dma_resv_wait_timeout
>                         (bo->base.resv, true, true,
>                          nonblock ? 0 : MAX_SCHEDULE_TIMEOUT);
>                 if (!lret)
> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> index f6b71712c029..22325dfa7744 100644
> --- a/include/linux/dma-resv.h
> +++ b/include/linux/dma-resv.h
> @@ -268,19 +268,12 @@ void dma_resv_init(struct dma_resv *obj);
>  void dma_resv_fini(struct dma_resv *obj);
>  int dma_resv_reserve_shared(struct dma_resv *obj, unsigned int num_fence=
s);
>  void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *f=
ence);
> -
>  void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fen=
ce);
> -
> -int dma_resv_get_fences_rcu(struct dma_resv *obj,
> -                           struct dma_fence **pfence_excl,
> -                           unsigned *pshared_count,
> -                           struct dma_fence ***pshared);
> -
> +int dma_resv_get_fences(struct dma_resv *obj, struct dma_fence **pfence_=
excl,
> +                       unsigned *pshared_count, struct dma_fence ***psha=
red);
>  int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src);
> -
> -long dma_resv_wait_timeout_rcu(struct dma_resv *obj, bool wait_all, bool=
 intr,
> -                              unsigned long timeout);
> -
> -bool dma_resv_test_signaled_rcu(struct dma_resv *obj, bool test_all);
> +long dma_resv_wait_timeout(struct dma_resv *obj, bool wait_all, bool int=
r,
> +                          unsigned long timeout);
> +bool dma_resv_test_signaled(struct dma_resv *obj, bool test_all);
>
>  #endif /* _LINUX_RESERVATION_H */
> --
> 2.25.1
>
