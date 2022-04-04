Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A824F0D59
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 03:13:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B327A10E1B6;
	Mon,  4 Apr 2022 01:13:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5296A10E1B6
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Apr 2022 01:13:24 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id r2so9524899iod.9
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Apr 2022 18:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen.nl; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=L5t9vDb/q7yo0Mpw5Frcm50ZrCGWmohnXx2AZjXwmyE=;
 b=Z5Wj+BJKPBsYHmwsDMtyMHuQQVjz11GNxpl4ecUyzfYuqJucDIixEh5sYlUCzpCeAl
 KLmvILLm0T0oDwplbqtKZt+1CorjMXHHWq6+y4KSsQBBWAQHRrvSol+70UPHTgIFknBc
 J/skDkh3A14vtUKgi3pt/fa/AjOVeXnmphxbTdmmfz8kjmxCat0FVpNbsuAkMv/3X0wR
 EYT0FLl5PPKel5i3Mv7/isxf04CircifeOjvy8CAGr7fp/4bKoJiIn43JTO2Ie9SN+AV
 oTdNlIcIqkHNmOMT71pdZbg6nH78aU/+MEXHGTvClSobax6saWS5gZmUqHNGu2a1txPv
 k8EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=L5t9vDb/q7yo0Mpw5Frcm50ZrCGWmohnXx2AZjXwmyE=;
 b=pOBDV8r/rLYTDhZnlvhT0Y+SCb8jOG5e/NFCaIfTfLah/yczVDLS8j78lK+LBef4vu
 OvtSQYnUcrU7/doBr1FbASuDU4cesS8LM3QOqi2/ZdCn4Z6e+YzftHj3VEdHaGNqOJw7
 OMZBqK+WvhoWSHMfItbZuTfCeVc3ZqZBjdVjGZBCp/67RT+RYvjbf/KFRZJhMuGtC8DY
 HgAU5vQebkFWFqfVZvEDBSltNB130pUUV6rdhXICJQzwUG1iB2MsNwjxWWLz0uXnO+bz
 x/UrEPN712YQ6xbhYRriGEVaoRsjNQ+vNwUwmXhRX07n2MaomjywjMnHnDV+y9fa2yr9
 rQPw==
X-Gm-Message-State: AOAM5325JsizArwrMnk/JrxPJ2Hg6Kw1kp5TyyqauPZhAxwzKAwieGJv
 iLStwgKDnyxCbZxB1AcoxRR4DeRUZky9wuruR82Vzw==
X-Google-Smtp-Source: ABdhPJxxqr5Os2E4MDghvq2cJakr256OjjS5dA37PLLwTWTsUU0+8kOuS1BjGZec8DAni2VE5QUR5FBTAI02XfpCSQE=
X-Received: by 2002:a6b:fb15:0:b0:64c:9b3a:2182 with SMTP id
 h21-20020a6bfb15000000b0064c9b3a2182mr4495828iog.211.1649034802734; Sun, 03
 Apr 2022 18:13:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220321135856.1331-1-christian.koenig@amd.com>
 <20220321135856.1331-16-christian.koenig@amd.com>
In-Reply-To: <20220321135856.1331-16-christian.koenig@amd.com>
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Date: Mon, 4 Apr 2022 03:13:25 +0200
Message-ID: <CAP+8YyEpzTjxFzPBqDTwOyHgedBXxs7NZBZ2cekVwQ8SD-UpPA@mail.gmail.com>
Subject: Re: [PATCH 16/23] dma-buf: add enum dma_resv_usage v3
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 21, 2022 at 2:59 PM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> This change adds the dma_resv_usage enum and allows us to specify why a
> dma_resv object is queried for its containing fences.
>
> Additional to that a dma_resv_usage_rw() helper function is added to aid
> retrieving the fences for a read or write userspace submission.
>
> This is then deployed to the different query functions of the dma_resv
> object and all of their users. When the write paratermer was previously
> true we now use DMA_RESV_USAGE_WRITE and DMA_RESV_USAGE_READ otherwise.
>
> v2: add KERNEL/OTHER in separate patch
> v3: some kerneldoc suggestions by Daniel
>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
>  drivers/dma-buf/dma-buf.c                     |  3 +-
>  drivers/dma-buf/dma-resv.c                    | 33 +++++----
>  drivers/dma-buf/st-dma-resv.c                 | 48 ++++++-------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |  4 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   |  3 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c       |  3 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c       |  5 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c        |  4 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    |  4 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c      |  3 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |  3 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c       |  3 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        |  7 +-
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  3 +-
>  drivers/gpu/drm/drm_gem.c                     |  6 +-
>  drivers/gpu/drm/drm_gem_atomic_helper.c       |  2 +-
>  drivers/gpu/drm/etnaviv/etnaviv_gem.c         |  6 +-
>  drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c  |  7 +-
>  .../gpu/drm/i915/display/intel_atomic_plane.c |  3 +-
>  drivers/gpu/drm/i915/gem/i915_gem_busy.c      |  4 +-
>  drivers/gpu/drm/i915/gem/i915_gem_lmem.c      |  2 +-
>  drivers/gpu/drm/i915/gem/i915_gem_userptr.c   |  2 +-
>  drivers/gpu/drm/i915/gem/i915_gem_wait.c      |  6 +-
>  .../drm/i915/gem/selftests/i915_gem_dmabuf.c  |  3 +-
>  drivers/gpu/drm/i915/i915_request.c           |  3 +-
>  drivers/gpu/drm/i915/i915_sw_fence.c          |  2 +-
>  drivers/gpu/drm/msm/msm_gem.c                 |  3 +-
>  drivers/gpu/drm/nouveau/dispnv50/wndw.c       |  3 +-
>  drivers/gpu/drm/nouveau/nouveau_bo.c          |  8 +--
>  drivers/gpu/drm/nouveau/nouveau_fence.c       |  8 ++-
>  drivers/gpu/drm/nouveau/nouveau_gem.c         |  3 +-
>  drivers/gpu/drm/panfrost/panfrost_drv.c       |  3 +-
>  drivers/gpu/drm/qxl/qxl_debugfs.c             |  3 +-
>  drivers/gpu/drm/radeon/radeon_display.c       |  3 +-
>  drivers/gpu/drm/radeon/radeon_gem.c           |  9 ++-
>  drivers/gpu/drm/radeon/radeon_mn.c            |  4 +-
>  drivers/gpu/drm/radeon/radeon_sync.c          |  2 +-
>  drivers/gpu/drm/radeon/radeon_uvd.c           |  4 +-
>  drivers/gpu/drm/scheduler/sched_main.c        |  3 +-
>  drivers/gpu/drm/ttm/ttm_bo.c                  | 18 ++---
>  drivers/gpu/drm/vgem/vgem_fence.c             |  4 +-
>  drivers/gpu/drm/virtio/virtgpu_ioctl.c        |  5 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_bo.c            |  4 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_resource.c      |  4 +-
>  drivers/infiniband/core/umem_dmabuf.c         |  3 +-
>  include/linux/dma-resv.h                      | 69 +++++++++++++++----
>  46 files changed, 208 insertions(+), 127 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 602b12d7470d..528983d3ba64 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c

In dma-buf.c I think we also need to update dma_buf_poll_add_cb to use
the usage flags instead of the bool for dma_resv_for_each_fence.


> @@ -1124,7 +1124,8 @@ static int __dma_buf_begin_cpu_access(struct dma_bu=
f *dmabuf,
>         long ret;
>
>         /* Wait on any implicit rendering fences */
> -       ret =3D dma_resv_wait_timeout(resv, write, true, MAX_SCHEDULE_TIM=
EOUT);
> +       ret =3D dma_resv_wait_timeout(resv, dma_resv_usage_rw(write),
> +                                   true, MAX_SCHEDULE_TIMEOUT);
>         if (ret < 0)
>                 return ret;
>
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index 78a32da2cb0b..bb7b023c2d33 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -384,7 +384,7 @@ static void dma_resv_iter_restart_unlocked(struct dma=
_resv_iter *cursor)
>         cursor->seq =3D read_seqcount_begin(&cursor->obj->seq);
>         cursor->index =3D -1;
>         cursor->shared_count =3D 0;
> -       if (cursor->all_fences) {
> +       if (cursor->usage >=3D DMA_RESV_USAGE_READ) {
>                 cursor->fences =3D dma_resv_shared_list(cursor->obj);
>                 if (cursor->fences)
>                         cursor->shared_count =3D cursor->fences->shared_c=
ount;
> @@ -496,7 +496,7 @@ struct dma_fence *dma_resv_iter_first(struct dma_resv=
_iter *cursor)
>         dma_resv_assert_held(cursor->obj);
>
>         cursor->index =3D 0;
> -       if (cursor->all_fences)
> +       if (cursor->usage >=3D DMA_RESV_USAGE_READ)
>                 cursor->fences =3D dma_resv_shared_list(cursor->obj);
>         else
>                 cursor->fences =3D NULL;
> @@ -551,7 +551,7 @@ int dma_resv_copy_fences(struct dma_resv *dst, struct=
 dma_resv *src)
>         list =3D NULL;
>         excl =3D NULL;
>
> -       dma_resv_iter_begin(&cursor, src, true);
> +       dma_resv_iter_begin(&cursor, src, DMA_RESV_USAGE_READ);
>         dma_resv_for_each_fence_unlocked(&cursor, f) {
>
>                 if (dma_resv_iter_is_restarted(&cursor)) {
> @@ -597,7 +597,7 @@ EXPORT_SYMBOL(dma_resv_copy_fences);
>   * dma_resv_get_fences - Get an object's shared and exclusive
>   * fences without update side lock held
>   * @obj: the reservation object
> - * @write: true if we should return all fences
> + * @usage: controls which fences to include, see enum dma_resv_usage.
>   * @num_fences: the number of fences returned
>   * @fences: the array of fence ptrs returned (array is krealloc'd to the
>   * required size, and must be freed by caller)
> @@ -605,7 +605,7 @@ EXPORT_SYMBOL(dma_resv_copy_fences);
>   * Retrieve all fences from the reservation object.
>   * Returns either zero or -ENOMEM.
>   */
> -int dma_resv_get_fences(struct dma_resv *obj, bool write,
> +int dma_resv_get_fences(struct dma_resv *obj, enum dma_resv_usage usage,
>                         unsigned int *num_fences, struct dma_fence ***fen=
ces)
>  {
>         struct dma_resv_iter cursor;
> @@ -614,7 +614,7 @@ int dma_resv_get_fences(struct dma_resv *obj, bool wr=
ite,
>         *num_fences =3D 0;
>         *fences =3D NULL;
>
> -       dma_resv_iter_begin(&cursor, obj, write);
> +       dma_resv_iter_begin(&cursor, obj, usage);
>         dma_resv_for_each_fence_unlocked(&cursor, fence) {
>
>                 if (dma_resv_iter_is_restarted(&cursor)) {
> @@ -646,7 +646,7 @@ EXPORT_SYMBOL_GPL(dma_resv_get_fences);
>  /**
>   * dma_resv_get_singleton - Get a single fence for all the fences
>   * @obj: the reservation object
> - * @write: true if we should return all fences
> + * @usage: controls which fences to include, see enum dma_resv_usage.
>   * @fence: the resulting fence
>   *
>   * Get a single fence representing all the fences inside the resv object=
.
> @@ -656,7 +656,7 @@ EXPORT_SYMBOL_GPL(dma_resv_get_fences);
>   * object since that can lead to stack corruption when finalizing the
>   * dma_fence_array.
>   */
> -int dma_resv_get_singleton(struct dma_resv *obj, bool write,
> +int dma_resv_get_singleton(struct dma_resv *obj, enum dma_resv_usage usa=
ge,
>                            struct dma_fence **fence)
>  {
>         struct dma_fence_array *array;
> @@ -664,7 +664,7 @@ int dma_resv_get_singleton(struct dma_resv *obj, bool=
 write,
>         unsigned count;
>         int r;
>
> -       r =3D dma_resv_get_fences(obj, write, &count, &fences);
> +       r =3D dma_resv_get_fences(obj, usage, &count, &fences);
>          if (r)
>                 return r;
>
> @@ -698,7 +698,7 @@ EXPORT_SYMBOL_GPL(dma_resv_get_singleton);
>   * dma_resv_wait_timeout - Wait on reservation's objects
>   * shared and/or exclusive fences.
>   * @obj: the reservation object
> - * @wait_all: if true, wait on all fences, else wait on just exclusive f=
ence
> + * @usage: controls which fences to include, see enum dma_resv_usage.
>   * @intr: if true, do interruptible wait
>   * @timeout: timeout value in jiffies or zero to return immediately
>   *
> @@ -708,14 +708,14 @@ EXPORT_SYMBOL_GPL(dma_resv_get_singleton);
>   * Returns -ERESTARTSYS if interrupted, 0 if the wait timed out, or
>   * greater than zer on success.
>   */
> -long dma_resv_wait_timeout(struct dma_resv *obj, bool wait_all, bool int=
r,
> -                          unsigned long timeout)
> +long dma_resv_wait_timeout(struct dma_resv *obj, enum dma_resv_usage usa=
ge,
> +                          bool intr, unsigned long timeout)
>  {
>         long ret =3D timeout ? timeout : 1;
>         struct dma_resv_iter cursor;
>         struct dma_fence *fence;
>
> -       dma_resv_iter_begin(&cursor, obj, wait_all);
> +       dma_resv_iter_begin(&cursor, obj, usage);
>         dma_resv_for_each_fence_unlocked(&cursor, fence) {
>
>                 ret =3D dma_fence_wait_timeout(fence, intr, ret);
> @@ -735,8 +735,7 @@ EXPORT_SYMBOL_GPL(dma_resv_wait_timeout);
>   * dma_resv_test_signaled - Test if a reservation object's fences have b=
een
>   * signaled.
>   * @obj: the reservation object
> - * @test_all: if true, test all fences, otherwise only test the exclusiv=
e
> - * fence
> + * @usage: controls which fences to include, see enum dma_resv_usage.
>   *
>   * Callers are not required to hold specific locks, but maybe hold
>   * dma_resv_lock() already.
> @@ -745,12 +744,12 @@ EXPORT_SYMBOL_GPL(dma_resv_wait_timeout);
>   *
>   * True if all fences signaled, else false.
>   */
> -bool dma_resv_test_signaled(struct dma_resv *obj, bool test_all)
> +bool dma_resv_test_signaled(struct dma_resv *obj, enum dma_resv_usage us=
age)
>  {
>         struct dma_resv_iter cursor;
>         struct dma_fence *fence;
>
> -       dma_resv_iter_begin(&cursor, obj, test_all);
> +       dma_resv_iter_begin(&cursor, obj, usage);
>         dma_resv_for_each_fence_unlocked(&cursor, fence) {
>                 dma_resv_iter_end(&cursor);
>                 return false;
> diff --git a/drivers/dma-buf/st-dma-resv.c b/drivers/dma-buf/st-dma-resv.=
c
> index d2e61f6ae989..d097981061b1 100644
> --- a/drivers/dma-buf/st-dma-resv.c
> +++ b/drivers/dma-buf/st-dma-resv.c
> @@ -58,7 +58,7 @@ static int sanitycheck(void *arg)
>         return r;
>  }
>
> -static int test_signaling(void *arg, bool shared)
> +static int test_signaling(void *arg, enum dma_resv_usage usage)
>  {
>         struct dma_resv resv;
>         struct dma_fence *f;
> @@ -81,18 +81,18 @@ static int test_signaling(void *arg, bool shared)
>                 goto err_unlock;
>         }
>
> -       if (shared)
> +       if (usage >=3D DMA_RESV_USAGE_READ)
>                 dma_resv_add_shared_fence(&resv, f);
>         else
>                 dma_resv_add_excl_fence(&resv, f);
>
> -       if (dma_resv_test_signaled(&resv, shared)) {
> +       if (dma_resv_test_signaled(&resv, usage)) {
>                 pr_err("Resv unexpectedly signaled\n");
>                 r =3D -EINVAL;
>                 goto err_unlock;
>         }
>         dma_fence_signal(f);
> -       if (!dma_resv_test_signaled(&resv, shared)) {
> +       if (!dma_resv_test_signaled(&resv, usage)) {
>                 pr_err("Resv not reporting signaled\n");
>                 r =3D -EINVAL;
>                 goto err_unlock;
> @@ -107,15 +107,15 @@ static int test_signaling(void *arg, bool shared)
>
>  static int test_excl_signaling(void *arg)
>  {
> -       return test_signaling(arg, false);
> +       return test_signaling(arg, DMA_RESV_USAGE_WRITE);
>  }
>
>  static int test_shared_signaling(void *arg)
>  {
> -       return test_signaling(arg, true);
> +       return test_signaling(arg, DMA_RESV_USAGE_READ);
>  }
>
> -static int test_for_each(void *arg, bool shared)
> +static int test_for_each(void *arg, enum dma_resv_usage usage)
>  {
>         struct dma_resv_iter cursor;
>         struct dma_fence *f, *fence;
> @@ -139,13 +139,13 @@ static int test_for_each(void *arg, bool shared)
>                 goto err_unlock;
>         }
>
> -       if (shared)
> +       if (usage >=3D DMA_RESV_USAGE_READ)
>                 dma_resv_add_shared_fence(&resv, f);
>         else
>                 dma_resv_add_excl_fence(&resv, f);
>
>         r =3D -ENOENT;
> -       dma_resv_for_each_fence(&cursor, &resv, shared, fence) {
> +       dma_resv_for_each_fence(&cursor, &resv, usage, fence) {
>                 if (!r) {
>                         pr_err("More than one fence found\n");
>                         r =3D -EINVAL;
> @@ -156,7 +156,8 @@ static int test_for_each(void *arg, bool shared)
>                         r =3D -EINVAL;
>                         goto err_unlock;
>                 }
> -               if (dma_resv_iter_is_exclusive(&cursor) !=3D !shared) {
> +               if (dma_resv_iter_is_exclusive(&cursor) !=3D
> +                   (usage >=3D DMA_RESV_USAGE_READ)) {
>                         pr_err("Unexpected fence usage\n");
>                         r =3D -EINVAL;
>                         goto err_unlock;
> @@ -178,15 +179,15 @@ static int test_for_each(void *arg, bool shared)
>
>  static int test_excl_for_each(void *arg)
>  {
> -       return test_for_each(arg, false);
> +       return test_for_each(arg, DMA_RESV_USAGE_WRITE);
>  }
>
>  static int test_shared_for_each(void *arg)
>  {
> -       return test_for_each(arg, true);
> +       return test_for_each(arg, DMA_RESV_USAGE_READ);
>  }
>
> -static int test_for_each_unlocked(void *arg, bool shared)
> +static int test_for_each_unlocked(void *arg, enum dma_resv_usage usage)
>  {
>         struct dma_resv_iter cursor;
>         struct dma_fence *f, *fence;
> @@ -211,14 +212,14 @@ static int test_for_each_unlocked(void *arg, bool s=
hared)
>                 goto err_free;
>         }
>
> -       if (shared)
> +       if (usage >=3D DMA_RESV_USAGE_READ)
>                 dma_resv_add_shared_fence(&resv, f);
>         else
>                 dma_resv_add_excl_fence(&resv, f);
>         dma_resv_unlock(&resv);
>
>         r =3D -ENOENT;
> -       dma_resv_iter_begin(&cursor, &resv, shared);
> +       dma_resv_iter_begin(&cursor, &resv, usage);
>         dma_resv_for_each_fence_unlocked(&cursor, fence) {
>                 if (!r) {
>                         pr_err("More than one fence found\n");
> @@ -234,7 +235,8 @@ static int test_for_each_unlocked(void *arg, bool sha=
red)
>                         r =3D -EINVAL;
>                         goto err_iter_end;
>                 }
> -               if (dma_resv_iter_is_exclusive(&cursor) !=3D !shared) {
> +               if (dma_resv_iter_is_exclusive(&cursor) !=3D
> +                   (usage >=3D DMA_RESV_USAGE_READ)) {
>                         pr_err("Unexpected fence usage\n");
>                         r =3D -EINVAL;
>                         goto err_iter_end;
> @@ -262,15 +264,15 @@ static int test_for_each_unlocked(void *arg, bool s=
hared)
>
>  static int test_excl_for_each_unlocked(void *arg)
>  {
> -       return test_for_each_unlocked(arg, false);
> +       return test_for_each_unlocked(arg, DMA_RESV_USAGE_WRITE);
>  }
>
>  static int test_shared_for_each_unlocked(void *arg)
>  {
> -       return test_for_each_unlocked(arg, true);
> +       return test_for_each_unlocked(arg, DMA_RESV_USAGE_READ);
>  }
>
> -static int test_get_fences(void *arg, bool shared)
> +static int test_get_fences(void *arg, enum dma_resv_usage usage)
>  {
>         struct dma_fence *f, **fences =3D NULL;
>         struct dma_resv resv;
> @@ -294,13 +296,13 @@ static int test_get_fences(void *arg, bool shared)
>                 goto err_resv;
>         }
>
> -       if (shared)
> +       if (usage >=3D DMA_RESV_USAGE_READ)
>                 dma_resv_add_shared_fence(&resv, f);
>         else
>                 dma_resv_add_excl_fence(&resv, f);
>         dma_resv_unlock(&resv);
>
> -       r =3D dma_resv_get_fences(&resv, shared, &i, &fences);
> +       r =3D dma_resv_get_fences(&resv, usage, &i, &fences);
>         if (r) {
>                 pr_err("get_fences failed\n");
>                 goto err_free;
> @@ -324,12 +326,12 @@ static int test_get_fences(void *arg, bool shared)
>
>  static int test_excl_get_fences(void *arg)
>  {
> -       return test_get_fences(arg, false);
> +       return test_get_fences(arg, DMA_RESV_USAGE_WRITE);
>  }
>
>  static int test_shared_get_fences(void *arg)
>  {
> -       return test_get_fences(arg, true);
> +       return test_get_fences(arg, DMA_RESV_USAGE_READ);
>  }
>
>  int dma_resv(void)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd=
/amdgpu/amdgpu_cs.c
> index 02488a824fe8..2bf909a4242a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -1278,7 +1278,9 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser=
 *p,
>                  * submission in a dma_fence_chain and add it as exclusiv=
e
>                  * fence.
>                  */
> -               dma_resv_for_each_fence(&cursor, resv, false, fence) {
> +               dma_resv_for_each_fence(&cursor, resv,
> +                                       DMA_RESV_USAGE_WRITE,
> +                                       fence) {
>                         break;
>                 }
>                 dma_fence_chain_init(chain, fence, dma_fence_get(p->fence=
), 1);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_display.c
> index e76b96d55551..cefa404d7842 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> @@ -200,8 +200,7 @@ int amdgpu_display_crtc_page_flip_target(struct drm_c=
rtc *crtc,
>                 goto unpin;
>         }
>
> -       /* TODO: Unify this with other drivers */
> -       r =3D dma_resv_get_fences(new_abo->tbo.base.resv, true,
> +       r =3D dma_resv_get_fences(new_abo->tbo.base.resv, DMA_RESV_USAGE_=
WRITE,
>                                 &work->shared_count,
>                                 &work->shared);
>         if (unlikely(r !=3D 0)) {
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_gem.c
> index 9b12cab5e606..3a5fe05c7a7e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> @@ -526,7 +526,8 @@ int amdgpu_gem_wait_idle_ioctl(struct drm_device *dev=
, void *data,
>                 return -ENOENT;
>         }
>         robj =3D gem_to_amdgpu_bo(gobj);
> -       ret =3D dma_resv_wait_timeout(robj->tbo.base.resv, true, true, ti=
meout);
> +       ret =3D dma_resv_wait_timeout(robj->tbo.base.resv, DMA_RESV_USAGE=
_READ,
> +                                   true, timeout);
>
>         /* ret =3D=3D 0 means not signaled,
>          * ret > 0 means signaled
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_ids.c
> index 888d97143177..490d2a7a3e2b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
> @@ -111,7 +111,7 @@ void amdgpu_pasid_free_delayed(struct dma_resv *resv,
>         struct dma_fence *fence;
>         int r;
>
> -       r =3D dma_resv_get_singleton(resv, true, &fence);
> +       r =3D dma_resv_get_singleton(resv, DMA_RESV_USAGE_READ, &fence);
>         if (r)
>                 goto fallback;
>
> @@ -139,7 +139,8 @@ void amdgpu_pasid_free_delayed(struct dma_resv *resv,
>         /* Not enough memory for the delayed delete, as last resort
>          * block for all the fences to complete.
>          */
> -       dma_resv_wait_timeout(resv, true, false, MAX_SCHEDULE_TIMEOUT);
> +       dma_resv_wait_timeout(resv, DMA_RESV_USAGE_READ,
> +                             false, MAX_SCHEDULE_TIMEOUT);
>         amdgpu_pasid_free(pasid);
>  }
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c b/drivers/gpu/drm/amd=
/amdgpu/amdgpu_mn.c
> index 4b153daf283d..86f5248676b0 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c
> @@ -75,8 +75,8 @@ static bool amdgpu_mn_invalidate_gfx(struct mmu_interva=
l_notifier *mni,
>
>         mmu_interval_set_seq(mni, cur_seq);
>
> -       r =3D dma_resv_wait_timeout(bo->tbo.base.resv, true, false,
> -                                 MAX_SCHEDULE_TIMEOUT);
> +       r =3D dma_resv_wait_timeout(bo->tbo.base.resv, DMA_RESV_USAGE_REA=
D,
> +                                 false, MAX_SCHEDULE_TIMEOUT);
>         mutex_unlock(&adev->notifier_lock);
>         if (r <=3D 0)
>                 DRM_ERROR("(%ld) failed to wait for user bo\n", r);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_object.c
> index 2f808decd8d9..0a843cc54945 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -765,8 +765,8 @@ int amdgpu_bo_kmap(struct amdgpu_bo *bo, void **ptr)
>                 return 0;
>         }
>
> -       r =3D dma_resv_wait_timeout(bo->tbo.base.resv, false, false,
> -                                 MAX_SCHEDULE_TIMEOUT);
> +       r =3D dma_resv_wait_timeout(bo->tbo.base.resv, DMA_RESV_USAGE_WRI=
TE,
> +                                 false, MAX_SCHEDULE_TIMEOUT);
>         if (r < 0)
>                 return r;
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_sync.c
> index 40e06745fae9..744e144e5fc2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
> @@ -259,7 +259,8 @@ int amdgpu_sync_resv(struct amdgpu_device *adev, stru=
ct amdgpu_sync *sync,
>         if (resv =3D=3D NULL)
>                 return -EINVAL;
>
> -       dma_resv_for_each_fence(&cursor, resv, true, f) {
> +       /* TODO: Use DMA_RESV_USAGE_READ here */
> +       dma_resv_for_each_fence(&cursor, resv, DMA_RESV_USAGE_READ, f) {
>                 dma_fence_chain_for_each(f, f) {
>                         struct dma_fence *tmp =3D dma_fence_chain_contain=
ed(f);
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_ttm.c
> index 5859ed0552a4..9ffd8c4c34a0 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -1356,7 +1356,8 @@ static bool amdgpu_ttm_bo_eviction_valuable(struct =
ttm_buffer_object *bo,
>          * If true, then return false as any KFD process needs all its BO=
s to
>          * be resident to run successfully
>          */
> -       dma_resv_for_each_fence(&resv_cursor, bo->base.resv, true, f) {
> +       dma_resv_for_each_fence(&resv_cursor, bo->base.resv,
> +                               DMA_RESV_USAGE_READ, f) {
>                 if (amdkfd_fence_check_mm(f, current->mm))
>                         return false;
>         }
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_uvd.c
> index 6f8de11a17f1..33deb0df62fd 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> @@ -1162,7 +1162,8 @@ static int amdgpu_uvd_send_msg(struct amdgpu_ring *=
ring, struct amdgpu_bo *bo,
>         ib->length_dw =3D 16;
>
>         if (direct) {
> -               r =3D dma_resv_wait_timeout(bo->tbo.base.resv, true, fals=
e,
> +               r =3D dma_resv_wait_timeout(bo->tbo.base.resv,
> +                                         DMA_RESV_USAGE_WRITE, false,
>                                           msecs_to_jiffies(10));
>                 if (r =3D=3D 0)
>                         r =3D -ETIMEDOUT;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd=
/amdgpu/amdgpu_vm.c
> index 0ab85280e8ed..f3235aad7282 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -2105,7 +2105,7 @@ static void amdgpu_vm_prt_fini(struct amdgpu_device=
 *adev, struct amdgpu_vm *vm)
>         struct dma_resv_iter cursor;
>         struct dma_fence *fence;
>
> -       dma_resv_for_each_fence(&cursor, resv, true, fence) {
> +       dma_resv_for_each_fence(&cursor, resv, DMA_RESV_USAGE_READ, fence=
) {
>                 /* Add a callback for each fence in the reservation objec=
t */
>                 amdgpu_vm_prt_get(adev);
>                 amdgpu_vm_add_prt_cb(adev, fence);
> @@ -2707,7 +2707,7 @@ bool amdgpu_vm_evictable(struct amdgpu_bo *bo)
>                 return true;
>
>         /* Don't evict VM page tables while they are busy */
> -       if (!dma_resv_test_signaled(bo->tbo.base.resv, true))
> +       if (!dma_resv_test_signaled(bo->tbo.base.resv, DMA_RESV_USAGE_REA=
D))
>                 return false;
>
>         /* Try to block ongoing updates */
> @@ -2887,7 +2887,8 @@ void amdgpu_vm_adjust_size(struct amdgpu_device *ad=
ev, uint32_t min_vm_size,
>   */
>  long amdgpu_vm_wait_idle(struct amdgpu_vm *vm, long timeout)
>  {
> -       timeout =3D dma_resv_wait_timeout(vm->root.bo->tbo.base.resv, tru=
e,
> +       timeout =3D dma_resv_wait_timeout(vm->root.bo->tbo.base.resv,
> +                                       DMA_RESV_USAGE_READ,
>                                         true, timeout);
>         if (timeout <=3D 0)
>                 return timeout;
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/=
gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 0eeb394e949c..c9532642559c 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -9199,7 +9199,8 @@ static void amdgpu_dm_commit_planes(struct drm_atom=
ic_state *state,
>                  * deadlock during GPU reset when this fence will not sig=
nal
>                  * but we hold reservation lock for the BO.
>                  */
> -               r =3D dma_resv_wait_timeout(abo->tbo.base.resv, true, fal=
se,
> +               r =3D dma_resv_wait_timeout(abo->tbo.base.resv,
> +                                         DMA_RESV_USAGE_WRITE, false,
>                                           msecs_to_jiffies(5000));
>                 if (unlikely(r <=3D 0))
>                         DRM_ERROR("Waiting for fences timed out!");
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 3c888db59ea4..54079d762051 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -771,7 +771,8 @@ long drm_gem_dma_resv_wait(struct drm_file *filep, u3=
2 handle,
>                 return -EINVAL;
>         }
>
> -       ret =3D dma_resv_wait_timeout(obj->resv, wait_all, true, timeout)=
;
> +       ret =3D dma_resv_wait_timeout(obj->resv, dma_resv_usage_rw(wait_a=
ll),
> +                                   true, timeout);
>         if (ret =3D=3D 0)
>                 ret =3D -ETIME;
>         else if (ret > 0)
> @@ -1345,7 +1346,8 @@ int drm_gem_fence_array_add_implicit(struct xarray =
*fence_array,
>         struct dma_fence *fence;
>         int ret =3D 0;
>
> -       dma_resv_for_each_fence(&cursor, obj->resv, write, fence) {
> +       dma_resv_for_each_fence(&cursor, obj->resv, dma_resv_usage_rw(wri=
te),
> +                               fence) {
>                 ret =3D drm_gem_fence_array_add(fence_array, fence);
>                 if (ret)
>                         break;
> diff --git a/drivers/gpu/drm/drm_gem_atomic_helper.c b/drivers/gpu/drm/dr=
m_gem_atomic_helper.c
> index 9338ddb7edff..a6d89aed0bda 100644
> --- a/drivers/gpu/drm/drm_gem_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_gem_atomic_helper.c
> @@ -151,7 +151,7 @@ int drm_gem_plane_helper_prepare_fb(struct drm_plane =
*plane, struct drm_plane_st
>                 return 0;
>
>         obj =3D drm_gem_fb_get_obj(state->fb, 0);
> -       ret =3D dma_resv_get_singleton(obj->resv, false, &fence);
> +       ret =3D dma_resv_get_singleton(obj->resv, DMA_RESV_USAGE_WRITE, &=
fence);
>         if (ret)
>                 return ret;
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etna=
viv/etnaviv_gem.c
> index d5314aa28ff7..507172e2780b 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> @@ -380,12 +380,14 @@ int etnaviv_gem_cpu_prep(struct drm_gem_object *obj=
, u32 op,
>         }
>
>         if (op & ETNA_PREP_NOSYNC) {
> -               if (!dma_resv_test_signaled(obj->resv, write))
> +               if (!dma_resv_test_signaled(obj->resv,
> +                                           dma_resv_usage_rw(write)))
>                         return -EBUSY;
>         } else {
>                 unsigned long remain =3D etnaviv_timeout_to_jiffies(timeo=
ut);
>
> -               ret =3D dma_resv_wait_timeout(obj->resv, write, true, rem=
ain);
> +               ret =3D dma_resv_wait_timeout(obj->resv, dma_resv_usage_r=
w(write),
> +                                           true, remain);
>                 if (ret <=3D 0)
>                         return ret =3D=3D 0 ? -ETIMEDOUT : ret;
>         }
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/d=
rm/etnaviv/etnaviv_gem_submit.c
> index b808ddb9da48..d7cd26dfaf8a 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> @@ -178,6 +178,7 @@ static int submit_fence_sync(struct etnaviv_gem_submi=
t *submit)
>         for (i =3D 0; i < submit->nr_bos; i++) {
>                 struct etnaviv_gem_submit_bo *bo =3D &submit->bos[i];
>                 struct dma_resv *robj =3D bo->obj->base.resv;
> +               enum dma_resv_usage usage;
>
>                 ret =3D dma_resv_reserve_fences(robj, 1);
>                 if (ret)
> @@ -186,9 +187,9 @@ static int submit_fence_sync(struct etnaviv_gem_submi=
t *submit)
>                 if (submit->flags & ETNA_SUBMIT_NO_IMPLICIT)
>                         continue;
>
> -               ret =3D dma_resv_get_fences(robj,
> -                                         bo->flags & ETNA_SUBMIT_BO_WRIT=
E,
> -                                         &bo->nr_shared, &bo->shared);
> +               usage =3D dma_resv_usage_rw(bo->flags & ETNA_SUBMIT_BO_WR=
ITE);
> +               ret =3D dma_resv_get_fences(robj, usage, &bo->nr_shared,
> +                                         &bo->shared);
>                 if (ret)
>                         return ret;
>         }
> diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/=
gpu/drm/i915/display/intel_atomic_plane.c
> index c2c512cd8ec0..2c3bb8aecd07 100644
> --- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> +++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> @@ -799,7 +799,8 @@ intel_prepare_plane_fb(struct drm_plane *_plane,
>                 if (ret < 0)
>                         goto unpin_fb;
>
> -               dma_resv_iter_begin(&cursor, obj->base.resv, false);
> +               dma_resv_iter_begin(&cursor, obj->base.resv,
> +                                   DMA_RESV_USAGE_WRITE);
>                 dma_resv_for_each_fence_unlocked(&cursor, fence) {
>                         add_rps_boost_after_vblank(new_plane_state->hw.cr=
tc,
>                                                    fence);
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_busy.c b/drivers/gpu/drm/i=
915/gem/i915_gem_busy.c
> index 470fdfd61a0f..14a1c0ad8c3c 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_busy.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
> @@ -138,12 +138,12 @@ i915_gem_busy_ioctl(struct drm_device *dev, void *d=
ata,
>          * Alternatively, we can trade that extra information on read/wri=
te
>          * activity with
>          *      args->busy =3D
> -        *              !dma_resv_test_signaled(obj->resv, true);
> +        *              !dma_resv_test_signaled(obj->resv, DMA_RESV_USAGE=
_READ);
>          * to report the overall busyness. This is what the wait-ioctl do=
es.
>          *
>          */
>         args->busy =3D 0;
> -       dma_resv_iter_begin(&cursor, obj->base.resv, true);
> +       dma_resv_iter_begin(&cursor, obj->base.resv, DMA_RESV_USAGE_READ)=
;
>         dma_resv_for_each_fence_unlocked(&cursor, fence) {
>                 if (dma_resv_iter_is_restarted(&cursor))
>                         args->busy =3D 0;
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_lmem.c b/drivers/gpu/drm/i=
915/gem/i915_gem_lmem.c
> index 444f8268b9c5..a200d3e66573 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
> @@ -66,7 +66,7 @@ bool __i915_gem_object_is_lmem(struct drm_i915_gem_obje=
ct *obj)
>         struct intel_memory_region *mr =3D READ_ONCE(obj->mm.region);
>
>  #ifdef CONFIG_LOCKDEP
> -       GEM_WARN_ON(dma_resv_test_signaled(obj->base.resv, true) &&
> +       GEM_WARN_ON(dma_resv_test_signaled(obj->base.resv, DMA_RESV_USAGE=
_READ) &&
>                     i915_gem_object_evictable(obj));
>  #endif
>         return mr && (mr->type =3D=3D INTEL_MEMORY_LOCAL ||
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c b/drivers/gpu/dr=
m/i915/gem/i915_gem_userptr.c
> index 3cc01c30dd62..60feff9160de 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
> @@ -85,7 +85,7 @@ static bool i915_gem_userptr_invalidate(struct mmu_inte=
rval_notifier *mni,
>                 return true;
>
>         /* we will unbind on next submission, still have userptr pins */
> -       r =3D dma_resv_wait_timeout(obj->base.resv, true, false,
> +       r =3D dma_resv_wait_timeout(obj->base.resv, DMA_RESV_USAGE_READ, =
false,
>                                   MAX_SCHEDULE_TIMEOUT);
>         if (r <=3D 0)
>                 drm_err(&i915->drm, "(%ld) failed to wait for idle\n", r)=
;
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_wait.c b/drivers/gpu/drm/i=
915/gem/i915_gem_wait.c
> index dab3d30c09a0..319936f91ac5 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_wait.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
> @@ -40,7 +40,8 @@ i915_gem_object_wait_reservation(struct dma_resv *resv,
>         struct dma_fence *fence;
>         long ret =3D timeout ?: 1;
>
> -       dma_resv_iter_begin(&cursor, resv, flags & I915_WAIT_ALL);
> +       dma_resv_iter_begin(&cursor, resv,
> +                           dma_resv_usage_rw(flags & I915_WAIT_ALL));
>         dma_resv_for_each_fence_unlocked(&cursor, fence) {
>                 ret =3D i915_gem_object_wait_fence(fence, flags, timeout)=
;
>                 if (ret <=3D 0)
> @@ -117,7 +118,8 @@ i915_gem_object_wait_priority(struct drm_i915_gem_obj=
ect *obj,
>         struct dma_resv_iter cursor;
>         struct dma_fence *fence;
>
> -       dma_resv_iter_begin(&cursor, obj->base.resv, flags & I915_WAIT_AL=
L);
> +       dma_resv_iter_begin(&cursor, obj->base.resv,
> +                           dma_resv_usage_rw(flags & I915_WAIT_ALL));
>         dma_resv_for_each_fence_unlocked(&cursor, fence)
>                 i915_gem_fence_wait_priority(fence, attr);
>         dma_resv_iter_end(&cursor);
> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c b/drive=
rs/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
> index 3cc74b0fed06..342df658e0fc 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
> @@ -219,7 +219,8 @@ static int igt_dmabuf_import_same_driver(struct drm_i=
915_private *i915,
>                 goto out_detach;
>         }
>
> -       timeout =3D dma_resv_wait_timeout(dmabuf->resv, false, true, 5 * =
HZ);
> +       timeout =3D dma_resv_wait_timeout(dmabuf->resv, DMA_RESV_USAGE_WR=
ITE,
> +                                       true, 5 * HZ);
>         if (!timeout) {
>                 pr_err("dmabuf wait for exclusive fence timed out.\n");
>                 timeout =3D -ETIME;
> diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i=
915_request.c
> index 76cf5ac91e94..17d7216ce221 100644
> --- a/drivers/gpu/drm/i915/i915_request.c
> +++ b/drivers/gpu/drm/i915/i915_request.c
> @@ -1594,7 +1594,8 @@ i915_request_await_object(struct i915_request *to,
>         struct dma_fence *fence;
>         int ret =3D 0;
>
> -       dma_resv_for_each_fence(&cursor, obj->base.resv, write, fence) {
> +       dma_resv_for_each_fence(&cursor, obj->base.resv,
> +                               dma_resv_usage_rw(write), fence) {
>                 ret =3D i915_request_await_dma_fence(to, fence);
>                 if (ret)
>                         break;
> diff --git a/drivers/gpu/drm/i915/i915_sw_fence.c b/drivers/gpu/drm/i915/=
i915_sw_fence.c
> index 2a74a9a1cafe..ae984c66c48a 100644
> --- a/drivers/gpu/drm/i915/i915_sw_fence.c
> +++ b/drivers/gpu/drm/i915/i915_sw_fence.c
> @@ -585,7 +585,7 @@ int i915_sw_fence_await_reservation(struct i915_sw_fe=
nce *fence,
>         debug_fence_assert(fence);
>         might_sleep_if(gfpflags_allow_blocking(gfp));
>
> -       dma_resv_iter_begin(&cursor, resv, write);
> +       dma_resv_iter_begin(&cursor, resv, dma_resv_usage_rw(write));
>         dma_resv_for_each_fence_unlocked(&cursor, f) {
>                 pending =3D i915_sw_fence_await_dma_fence(fence, f, timeo=
ut,
>                                                         gfp);
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.=
c
> index 02b9ae65a96a..01bbb5f2d462 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -848,7 +848,8 @@ int msm_gem_cpu_prep(struct drm_gem_object *obj, uint=
32_t op, ktime_t *timeout)
>                 op & MSM_PREP_NOSYNC ? 0 : timeout_to_jiffies(timeout);
>         long ret;
>
> -       ret =3D dma_resv_wait_timeout(obj->resv, write, true,  remain);
> +       ret =3D dma_resv_wait_timeout(obj->resv, dma_resv_usage_rw(write)=
,
> +                                   true,  remain);
>         if (ret =3D=3D 0)
>                 return remain =3D=3D 0 ? -EBUSY : -ETIMEDOUT;
>         else if (ret < 0)
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/no=
uveau/dispnv50/wndw.c
> index e2faf92e4831..8642b84ea20c 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> @@ -558,7 +558,8 @@ nv50_wndw_prepare_fb(struct drm_plane *plane, struct =
drm_plane_state *state)
>                         asyw->image.handle[0] =3D ctxdma->object.handle;
>         }
>
> -       ret =3D dma_resv_get_singleton(nvbo->bo.base.resv, false,
> +       ret =3D dma_resv_get_singleton(nvbo->bo.base.resv,
> +                                    DMA_RESV_USAGE_WRITE,
>                                      &asyw->state.fence);
>         if (ret)
>                 return ret;
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouve=
au/nouveau_bo.c
> index 74f8652d2bd3..c6bb4dbcd735 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -962,11 +962,11 @@ nouveau_bo_vm_cleanup(struct ttm_buffer_object *bo,
>         struct dma_fence *fence;
>         int ret;
>
> -       /* TODO: This is actually a memory management dependency */
> -       ret =3D dma_resv_get_singleton(bo->base.resv, false, &fence);
> +       ret =3D dma_resv_get_singleton(bo->base.resv, DMA_RESV_USAGE_WRIT=
E,
> +                                    &fence);
>         if (ret)
> -               dma_resv_wait_timeout(bo->base.resv, false, false,
> -                                     MAX_SCHEDULE_TIMEOUT);
> +               dma_resv_wait_timeout(bo->base.resv, DMA_RESV_USAGE_WRITE=
,
> +                                     false, MAX_SCHEDULE_TIMEOUT);
>
>         nv10_bo_put_tile_region(dev, *old_tile, fence);
>         *old_tile =3D new_tile;
> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/no=
uveau/nouveau_fence.c
> index 0268259e97eb..d5e81ccee01c 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
> @@ -350,14 +350,16 @@ nouveau_fence_sync(struct nouveau_bo *nvbo, struct =
nouveau_channel *chan,
>         if (ret)
>                 return ret;
>
> -       /* Waiting for the exclusive fence first causes performance regre=
ssions
> -        * under some circumstances. So manually wait for the shared ones=
 first.
> +       /* Waiting for the writes first causes performance regressions
> +        * under some circumstances. So manually wait for the reads first=
.
>          */
>         for (i =3D 0; i < 2; ++i) {
>                 struct dma_resv_iter cursor;
>                 struct dma_fence *fence;
>
> -               dma_resv_for_each_fence(&cursor, resv, exclusive, fence) =
{
> +               dma_resv_for_each_fence(&cursor, resv,
> +                                       dma_resv_usage_rw(exclusive),
> +                                       fence) {
>                         struct nouveau_fence *f;
>
>                         if (i =3D=3D 0 && dma_resv_iter_is_exclusive(&cur=
sor))
> diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouv=
eau/nouveau_gem.c
> index 9416bee92141..fab542a758ff 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
> @@ -962,7 +962,8 @@ nouveau_gem_ioctl_cpu_prep(struct drm_device *dev, vo=
id *data,
>                 return -ENOENT;
>         nvbo =3D nouveau_gem_object(gem);
>
> -       lret =3D dma_resv_wait_timeout(nvbo->bo.base.resv, write, true,
> +       lret =3D dma_resv_wait_timeout(nvbo->bo.base.resv,
> +                                    dma_resv_usage_rw(write), true,
>                                      no_wait ? 0 : 30 * HZ);
>         if (!lret)
>                 ret =3D -EBUSY;
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/pa=
nfrost/panfrost_drv.c
> index 94b6f0a19c83..7fcbc2a5b6cd 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -316,7 +316,8 @@ panfrost_ioctl_wait_bo(struct drm_device *dev, void *=
data,
>         if (!gem_obj)
>                 return -ENOENT;
>
> -       ret =3D dma_resv_wait_timeout(gem_obj->resv, true, true, timeout)=
;
> +       ret =3D dma_resv_wait_timeout(gem_obj->resv, DMA_RESV_USAGE_READ,
> +                                   true, timeout);
>         if (!ret)
>                 ret =3D timeout ? -ETIMEDOUT : -EBUSY;
>
> diff --git a/drivers/gpu/drm/qxl/qxl_debugfs.c b/drivers/gpu/drm/qxl/qxl_=
debugfs.c
> index 6a36b0fd845c..33e5889d6608 100644
> --- a/drivers/gpu/drm/qxl/qxl_debugfs.c
> +++ b/drivers/gpu/drm/qxl/qxl_debugfs.c
> @@ -61,7 +61,8 @@ qxl_debugfs_buffers_info(struct seq_file *m, void *data=
)
>                 struct dma_fence *fence;
>                 int rel =3D 0;
>
> -               dma_resv_iter_begin(&cursor, bo->tbo.base.resv, true);
> +               dma_resv_iter_begin(&cursor, bo->tbo.base.resv,
> +                                   DMA_RESV_USAGE_READ);
>                 dma_resv_for_each_fence_unlocked(&cursor, fence) {
>                         if (dma_resv_iter_is_restarted(&cursor))
>                                 rel =3D 0;
> diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/ra=
deon/radeon_display.c
> index f60e826cd292..57ff2b723c87 100644
> --- a/drivers/gpu/drm/radeon/radeon_display.c
> +++ b/drivers/gpu/drm/radeon/radeon_display.c
> @@ -533,7 +533,8 @@ static int radeon_crtc_page_flip_target(struct drm_cr=
tc *crtc,
>                 DRM_ERROR("failed to pin new rbo buffer before flip\n");
>                 goto cleanup;
>         }
> -       r =3D dma_resv_get_singleton(new_rbo->tbo.base.resv, false, &work=
->fence);
> +       r =3D dma_resv_get_singleton(new_rbo->tbo.base.resv, DMA_RESV_USA=
GE_WRITE,
> +                                  &work->fence);
>         if (r) {
>                 radeon_bo_unreserve(new_rbo);
>                 DRM_ERROR("failed to get new rbo buffer fences\n");
> diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon=
/radeon_gem.c
> index a36a4f2c76b0..71bf9299e45c 100644
> --- a/drivers/gpu/drm/radeon/radeon_gem.c
> +++ b/drivers/gpu/drm/radeon/radeon_gem.c
> @@ -161,7 +161,9 @@ static int radeon_gem_set_domain(struct drm_gem_objec=
t *gobj,
>         }
>         if (domain =3D=3D RADEON_GEM_DOMAIN_CPU) {
>                 /* Asking for cpu access wait for object idle */
> -               r =3D dma_resv_wait_timeout(robj->tbo.base.resv, true, tr=
ue, 30 * HZ);
> +               r =3D dma_resv_wait_timeout(robj->tbo.base.resv,
> +                                         DMA_RESV_USAGE_READ,
> +                                         true, 30 * HZ);
>                 if (!r)
>                         r =3D -EBUSY;
>
> @@ -523,7 +525,7 @@ int radeon_gem_busy_ioctl(struct drm_device *dev, voi=
d *data,
>         }
>         robj =3D gem_to_radeon_bo(gobj);
>
> -       r =3D dma_resv_test_signaled(robj->tbo.base.resv, true);
> +       r =3D dma_resv_test_signaled(robj->tbo.base.resv, DMA_RESV_USAGE_=
READ);
>         if (r =3D=3D 0)
>                 r =3D -EBUSY;
>         else
> @@ -552,7 +554,8 @@ int radeon_gem_wait_idle_ioctl(struct drm_device *dev=
, void *data,
>         }
>         robj =3D gem_to_radeon_bo(gobj);
>
> -       ret =3D dma_resv_wait_timeout(robj->tbo.base.resv, true, true, 30=
 * HZ);
> +       ret =3D dma_resv_wait_timeout(robj->tbo.base.resv, DMA_RESV_USAGE=
_READ,
> +                                   true, 30 * HZ);
>         if (ret =3D=3D 0)
>                 r =3D -EBUSY;
>         else if (ret < 0)
> diff --git a/drivers/gpu/drm/radeon/radeon_mn.c b/drivers/gpu/drm/radeon/=
radeon_mn.c
> index 9fa88549c89e..68ebeb1bdfff 100644
> --- a/drivers/gpu/drm/radeon/radeon_mn.c
> +++ b/drivers/gpu/drm/radeon/radeon_mn.c
> @@ -66,8 +66,8 @@ static bool radeon_mn_invalidate(struct mmu_interval_no=
tifier *mn,
>                 return true;
>         }
>
> -       r =3D dma_resv_wait_timeout(bo->tbo.base.resv, true, false,
> -                                 MAX_SCHEDULE_TIMEOUT);
> +       r =3D dma_resv_wait_timeout(bo->tbo.base.resv, DMA_RESV_USAGE_REA=
D,
> +                                 false, MAX_SCHEDULE_TIMEOUT);
>         if (r <=3D 0)
>                 DRM_ERROR("(%ld) failed to wait for user bo\n", r);
>
> diff --git a/drivers/gpu/drm/radeon/radeon_sync.c b/drivers/gpu/drm/radeo=
n/radeon_sync.c
> index b991ba1bcd51..49bbb2266c0f 100644
> --- a/drivers/gpu/drm/radeon/radeon_sync.c
> +++ b/drivers/gpu/drm/radeon/radeon_sync.c
> @@ -96,7 +96,7 @@ int radeon_sync_resv(struct radeon_device *rdev,
>         struct dma_fence *f;
>         int r =3D 0;
>
> -       dma_resv_for_each_fence(&cursor, resv, shared, f) {
> +       dma_resv_for_each_fence(&cursor, resv, dma_resv_usage_rw(shared),=
 f) {
>                 fence =3D to_radeon_fence(f);
>                 if (fence && fence->rdev =3D=3D rdev)
>                         radeon_sync_fence(sync, fence);
> diff --git a/drivers/gpu/drm/radeon/radeon_uvd.c b/drivers/gpu/drm/radeon=
/radeon_uvd.c
> index 377f9cdb5b53..4000ad2f39ba 100644
> --- a/drivers/gpu/drm/radeon/radeon_uvd.c
> +++ b/drivers/gpu/drm/radeon/radeon_uvd.c
> @@ -478,8 +478,8 @@ static int radeon_uvd_cs_msg(struct radeon_cs_parser =
*p, struct radeon_bo *bo,
>                 return -EINVAL;
>         }
>
> -       r =3D dma_resv_wait_timeout(bo->tbo.base.resv, false, false,
> -                                 MAX_SCHEDULE_TIMEOUT);
> +       r =3D dma_resv_wait_timeout(bo->tbo.base.resv, DMA_RESV_USAGE_WRI=
TE,
> +                                 false, MAX_SCHEDULE_TIMEOUT);
>         if (r <=3D 0) {
>                 DRM_ERROR("Failed waiting for UVD message (%d)!\n", r);
>                 return r ? r : -ETIME;
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/sch=
eduler/sched_main.c
> index b81fceb0b8a2..0a1377dac58d 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -703,7 +703,8 @@ int drm_sched_job_add_implicit_dependencies(struct dr=
m_sched_job *job,
>         struct dma_fence *fence;
>         int ret;
>
> -       dma_resv_for_each_fence(&cursor, obj->resv, write, fence) {
> +       dma_resv_for_each_fence(&cursor, obj->resv, dma_resv_usage_rw(wri=
te),
> +                               fence) {
>                 /* Make sure to grab an additional ref on the added fence=
 */
>                 dma_fence_get(fence);
>                 ret =3D drm_sched_job_add_dependency(job, fence);
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 1dd6f13bb03c..d4b2695606e2 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -272,7 +272,7 @@ static void ttm_bo_flush_all_fences(struct ttm_buffer=
_object *bo)
>         struct dma_resv_iter cursor;
>         struct dma_fence *fence;
>
> -       dma_resv_iter_begin(&cursor, resv, true);
> +       dma_resv_iter_begin(&cursor, resv, DMA_RESV_USAGE_READ);
>         dma_resv_for_each_fence_unlocked(&cursor, fence) {
>                 if (!fence->ops->signaled)
>                         dma_fence_enable_sw_signaling(fence);
> @@ -301,7 +301,7 @@ static int ttm_bo_cleanup_refs(struct ttm_buffer_obje=
ct *bo,
>         struct dma_resv *resv =3D &bo->base._resv;
>         int ret;
>
> -       if (dma_resv_test_signaled(resv, true))
> +       if (dma_resv_test_signaled(resv, DMA_RESV_USAGE_READ))
>                 ret =3D 0;
>         else
>                 ret =3D -EBUSY;
> @@ -313,7 +313,8 @@ static int ttm_bo_cleanup_refs(struct ttm_buffer_obje=
ct *bo,
>                         dma_resv_unlock(bo->base.resv);
>                 spin_unlock(&bo->bdev->lru_lock);
>
> -               lret =3D dma_resv_wait_timeout(resv, true, interruptible,
> +               lret =3D dma_resv_wait_timeout(resv, DMA_RESV_USAGE_READ,
> +                                            interruptible,
>                                              30 * HZ);
>
>                 if (lret < 0)
> @@ -416,7 +417,8 @@ static void ttm_bo_release(struct kref *kref)
>                         /* Last resort, if we fail to allocate memory for=
 the
>                          * fences block for the BO to become idle
>                          */
> -                       dma_resv_wait_timeout(bo->base.resv, true, false,
> +                       dma_resv_wait_timeout(bo->base.resv,
> +                                             DMA_RESV_USAGE_READ, false,
>                                               30 * HZ);
>                 }
>
> @@ -427,7 +429,7 @@ static void ttm_bo_release(struct kref *kref)
>                 ttm_mem_io_free(bdev, bo->resource);
>         }
>
> -       if (!dma_resv_test_signaled(bo->base.resv, true) ||
> +       if (!dma_resv_test_signaled(bo->base.resv, DMA_RESV_USAGE_READ) |=
|
>             !dma_resv_trylock(bo->base.resv)) {
>                 /* The BO is not idle, resurrect it for delayed destroy *=
/
>                 ttm_bo_flush_all_fences(bo);
> @@ -1072,14 +1074,14 @@ int ttm_bo_wait(struct ttm_buffer_object *bo,
>         long timeout =3D 15 * HZ;
>
>         if (no_wait) {
> -               if (dma_resv_test_signaled(bo->base.resv, true))
> +               if (dma_resv_test_signaled(bo->base.resv, DMA_RESV_USAGE_=
READ))
>                         return 0;
>                 else
>                         return -EBUSY;
>         }
>
> -       timeout =3D dma_resv_wait_timeout(bo->base.resv, true, interrupti=
ble,
> -                                       timeout);
> +       timeout =3D dma_resv_wait_timeout(bo->base.resv, DMA_RESV_USAGE_R=
EAD,
> +                                       interruptible, timeout);
>         if (timeout < 0)
>                 return timeout;
>
> diff --git a/drivers/gpu/drm/vgem/vgem_fence.c b/drivers/gpu/drm/vgem/vge=
m_fence.c
> index 2ddbebca87d9..91fc4940c65a 100644
> --- a/drivers/gpu/drm/vgem/vgem_fence.c
> +++ b/drivers/gpu/drm/vgem/vgem_fence.c
> @@ -130,6 +130,7 @@ int vgem_fence_attach_ioctl(struct drm_device *dev,
>         struct vgem_file *vfile =3D file->driver_priv;
>         struct dma_resv *resv;
>         struct drm_gem_object *obj;
> +       enum dma_resv_usage usage;
>         struct dma_fence *fence;
>         int ret;
>
> @@ -151,7 +152,8 @@ int vgem_fence_attach_ioctl(struct drm_device *dev,
>
>         /* Check for a conflicting fence */
>         resv =3D obj->resv;
> -       if (!dma_resv_test_signaled(resv, arg->flags & VGEM_FENCE_WRITE))=
 {
> +       usage =3D dma_resv_usage_rw(arg->flags & VGEM_FENCE_WRITE);
> +       if (!dma_resv_test_signaled(resv, usage)) {
>                 ret =3D -EBUSY;
>                 goto err_fence;
>         }
> diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/vir=
tio/virtgpu_ioctl.c
> index c708bab555c6..5577cc7408b2 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> @@ -518,9 +518,10 @@ static int virtio_gpu_wait_ioctl(struct drm_device *=
dev, void *data,
>                 return -ENOENT;
>
>         if (args->flags & VIRTGPU_WAIT_NOWAIT) {
> -               ret =3D dma_resv_test_signaled(obj->resv, true);
> +               ret =3D dma_resv_test_signaled(obj->resv, DMA_RESV_USAGE_=
READ);
>         } else {
> -               ret =3D dma_resv_wait_timeout(obj->resv, true, true, time=
out);
> +               ret =3D dma_resv_wait_timeout(obj->resv, DMA_RESV_USAGE_R=
EAD,
> +                                           true, timeout);
>         }
>         if (ret =3D=3D 0)
>                 ret =3D -EBUSY;
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/=
vmwgfx_bo.c
> index fe13aa8b4a64..b96884f7d03d 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> @@ -528,8 +528,8 @@ static int vmw_user_bo_synccpu_grab(struct vmw_buffer=
_object *vmw_bo,
>         if (flags & drm_vmw_synccpu_allow_cs) {
>                 long lret;
>
> -               lret =3D dma_resv_wait_timeout(bo->base.resv, true, true,
> -                                            nonblock ? 0 :
> +               lret =3D dma_resv_wait_timeout(bo->base.resv, DMA_RESV_US=
AGE_READ,
> +                                            true, nonblock ? 0 :
>                                              MAX_SCHEDULE_TIMEOUT);
>                 if (!lret)
>                         return -EBUSY;
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c b/drivers/gpu/drm/v=
mwgfx/vmwgfx_resource.c
> index 36c3b5db7e69..39081dbf9ac8 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
> @@ -1166,8 +1166,8 @@ int vmw_resources_clean(struct vmw_buffer_object *v=
bo, pgoff_t start,
>                 if (bo->moving)
>                         dma_fence_put(bo->moving);
>
> -               /* TODO: This is actually a memory management dependency =
*/
> -               return dma_resv_get_singleton(bo->base.resv, false,
> +               return dma_resv_get_singleton(bo->base.resv,
> +                                             DMA_RESV_USAGE_WRITE,
>                                               &bo->moving);
>         }
>
> diff --git a/drivers/infiniband/core/umem_dmabuf.c b/drivers/infiniband/c=
ore/umem_dmabuf.c
> index d32cd7538835..f9901d273b8e 100644
> --- a/drivers/infiniband/core/umem_dmabuf.c
> +++ b/drivers/infiniband/core/umem_dmabuf.c
> @@ -67,7 +67,8 @@ int ib_umem_dmabuf_map_pages(struct ib_umem_dmabuf *ume=
m_dmabuf)
>          * may be not up-to-date. Wait for the exporter to finish
>          * the migration.
>          */
> -       return dma_resv_wait_timeout(umem_dmabuf->attach->dmabuf->resv, f=
alse,
> +       return dma_resv_wait_timeout(umem_dmabuf->attach->dmabuf->resv,
> +                                    DMA_RESV_USAGE_WRITE,
>                                      false, MAX_SCHEDULE_TIMEOUT);
>  }
>  EXPORT_SYMBOL(ib_umem_dmabuf_map_pages);
> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> index 5fa04d0fccad..658674c4b7b9 100644
> --- a/include/linux/dma-resv.h
> +++ b/include/linux/dma-resv.h
> @@ -49,6 +49,49 @@ extern struct ww_class reservation_ww_class;
>
>  struct dma_resv_list;
>
> +/**
> + * enum dma_resv_usage - how the fences from a dma_resv obj are used
> + *
> + * This enum describes the different use cases for a dma_resv object and
> + * controls which fences are returned when queried.
> + */
> +enum dma_resv_usage {
> +       /**
> +        * @DMA_RESV_USAGE_WRITE: Implicit write synchronization.
> +        *
> +        * This should only be used for userspace command submissions whi=
ch add
> +        * an implicit write dependency.
> +        */
> +       DMA_RESV_USAGE_WRITE,
> +
> +       /**
> +        * @DMA_RESV_USAGE_READ: Implicit read synchronization.
> +        *
> +        * This should only be used for userspace command submissions whi=
ch add
> +        * an implicit read dependency.
> +        */
> +       DMA_RESV_USAGE_READ,
> +};
> +
> +/**
> + * dma_resv_usage_rw - helper for implicit sync
> + * @write: true if we create a new implicit sync write
> + *
> + * This returns the implicit synchronization usage for write or read acc=
esses,
> + * see enum dma_resv_usage.
> + */
> +static inline enum dma_resv_usage dma_resv_usage_rw(bool write)
> +{
> +       /* This looks confusing at first sight, but is indeed correct.
> +        *
> +        * The rational is that new write operations needs to wait for th=
e
> +        * existing read and write operations to finish.
> +        * But a new read operation only needs to wait for the existing w=
rite
> +        * operations to finish.
> +        */
> +       return write ? DMA_RESV_USAGE_READ : DMA_RESV_USAGE_WRITE;
> +}
> +
>  /**
>   * struct dma_resv - a reservation object manages fences for a buffer
>   *
> @@ -142,8 +185,8 @@ struct dma_resv_iter {
>         /** @obj: The dma_resv object we iterate over */
>         struct dma_resv *obj;
>
> -       /** @all_fences: If all fences should be returned */
> -       bool all_fences;
> +       /** @usage: Controls which fences are returned */
> +       enum dma_resv_usage usage;
>
>         /** @fence: the currently handled fence */
>         struct dma_fence *fence;
> @@ -173,14 +216,14 @@ struct dma_fence *dma_resv_iter_next(struct dma_res=
v_iter *cursor);
>   * dma_resv_iter_begin - initialize a dma_resv_iter object
>   * @cursor: The dma_resv_iter object to initialize
>   * @obj: The dma_resv object which we want to iterate over
> - * @all_fences: If all fences should be returned or just the exclusive o=
ne
> + * @usage: controls which fences to include, see enum dma_resv_usage.
>   */
>  static inline void dma_resv_iter_begin(struct dma_resv_iter *cursor,
>                                        struct dma_resv *obj,
> -                                      bool all_fences)
> +                                      enum dma_resv_usage usage)
>  {
>         cursor->obj =3D obj;
> -       cursor->all_fences =3D all_fences;
> +       cursor->usage =3D usage;
>         cursor->fence =3D NULL;
>  }
>
> @@ -241,7 +284,7 @@ static inline bool dma_resv_iter_is_restarted(struct =
dma_resv_iter *cursor)
>   * dma_resv_for_each_fence - fence iterator
>   * @cursor: a struct dma_resv_iter pointer
>   * @obj: a dma_resv object pointer
> - * @all_fences: true if all fences should be returned
> + * @usage: controls which fences to return
>   * @fence: the current fence
>   *
>   * Iterate over the fences in a struct dma_resv object while holding the
> @@ -250,8 +293,8 @@ static inline bool dma_resv_iter_is_restarted(struct =
dma_resv_iter *cursor)
>   * valid as long as the lock is held and so no extra reference to the fe=
nce is
>   * taken.
>   */
> -#define dma_resv_for_each_fence(cursor, obj, all_fences, fence)        \
> -       for (dma_resv_iter_begin(cursor, obj, all_fences),      \
> +#define dma_resv_for_each_fence(cursor, obj, usage, fence)     \
> +       for (dma_resv_iter_begin(cursor, obj, usage),   \
>              fence =3D dma_resv_iter_first(cursor); fence;        \
>              fence =3D dma_resv_iter_next(cursor))
>
> @@ -418,14 +461,14 @@ void dma_resv_add_shared_fence(struct dma_resv *obj=
, struct dma_fence *fence);
>  void dma_resv_replace_fences(struct dma_resv *obj, uint64_t context,
>                              struct dma_fence *fence);
>  void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fen=
ce);
> -int dma_resv_get_fences(struct dma_resv *obj, bool write,
> +int dma_resv_get_fences(struct dma_resv *obj, enum dma_resv_usage usage,
>                         unsigned int *num_fences, struct dma_fence ***fen=
ces);
> -int dma_resv_get_singleton(struct dma_resv *obj, bool write,
> +int dma_resv_get_singleton(struct dma_resv *obj, enum dma_resv_usage usa=
ge,
>                            struct dma_fence **fence);
>  int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src);
> -long dma_resv_wait_timeout(struct dma_resv *obj, bool wait_all, bool int=
r,
> -                          unsigned long timeout);
> -bool dma_resv_test_signaled(struct dma_resv *obj, bool test_all);
> +long dma_resv_wait_timeout(struct dma_resv *obj, enum dma_resv_usage usa=
ge,
> +                          bool intr, unsigned long timeout);
> +bool dma_resv_test_signaled(struct dma_resv *obj, enum dma_resv_usage us=
age);
>  void dma_resv_describe(struct dma_resv *obj, struct seq_file *seq);
>
>  #endif /* _LINUX_RESERVATION_H */
> --
> 2.25.1
>
