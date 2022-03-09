Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB03E4D2513
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 02:11:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6936410E362;
	Wed,  9 Mar 2022 01:11:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA21810E362
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Mar 2022 01:11:50 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id q14so717447wrc.4
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Mar 2022 17:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jpY2z4H34H3eyBeRRD+CGY7silW4WSqrGPqcmBECpU8=;
 b=OQR6wnO5d5c3LTMBJooNcShzMDnrZE0ChK/EkciE7eBjvAp9AaNTh8JGyr9hqlIe8o
 /uLpYB3Sz5zoaFGYFpt6ebZD8vcNRigI2VhxHWkHBGHeMI5X4yVN+av7yUE0A4dksIjT
 fz6/CovaYl8F+Gl4PS4wx725aQ2QwTOGvwK8bvceboZj1VlrJ6pLLMF2GFGLzX9QXTKt
 xCSafwiMNAidJBvjoxUwKtaQPB2Qs3FRt0A5UoEpCYNk8OZNYo29CazknewuE2JjVElV
 7cesBfsDlrU3roEDItdYH7xJ10SRqQ/6EvLmITBvheW5vavY0ObFtOFW2WTbvIZhGwT0
 tfGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jpY2z4H34H3eyBeRRD+CGY7silW4WSqrGPqcmBECpU8=;
 b=ZQMJYwS2DDsZmnXpP8ifdHMAbdnt9Icy9XB5Ika/RMA/t8QD69Kkadx7XSvrGFUawY
 E8j4xCk8irCLtP23ECOPuvO3R0bGa4dP8CGEpKU1TENI6fMSt+1XkFfh2jZzEKz2wAQk
 ru1VGZDAIXSha62CV/D8aANhz/ZUCRjOzVVjDYIQuqkg37D8nHrZXd9AkyfrPbzZEF17
 7WU1CJb9bLyPx8z/DCWYMBAtCBUP/YY0L0r1FxPWCu7V2rMyuRqB6OwZBb6saNOk15tr
 a4xLsESJXgiGbVfmZQ8PdJ3X9IFUOK77h7VLC/mDTbx1j14PBS3GSkyFzKGcsCCohZG3
 d5Lg==
X-Gm-Message-State: AOAM532aflhRiBw6RxIjioPfzraloG0dMZzKxP5WsC8OUBzIoOEImvzh
 FoFvYljb1r0LePnOvH0bDEjrrr5vl2uLH218cok=
X-Google-Smtp-Source: ABdhPJxzYEf+xhzYvzLMbZ4CzUdlFlyPdwT3Ou9S7TZYGaRoHbCq8sPvHqx4BSkcicG04BJi2Bnpw9/xcgw7LbDC4hs=
X-Received: by 2002:a5d:6344:0:b0:1f0:21ee:9705 with SMTP id
 b4-20020a5d6344000000b001f021ee9705mr13967971wrw.93.1646788309356; Tue, 08
 Mar 2022 17:11:49 -0800 (PST)
MIME-Version: 1.0
References: <20220308131725.60607-1-dmitry.osipenko@collabora.com>
 <20220308131725.60607-6-dmitry.osipenko@collabora.com>
In-Reply-To: <20220308131725.60607-6-dmitry.osipenko@collabora.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 8 Mar 2022 17:12:18 -0800
Message-ID: <CAF6AEGvVmV4fesd0MsSo-4WxSVqOFN-U+p5HOE2job6CeYbqTA@mail.gmail.com>
Subject: Re: [PATCH v1 5/5] drm/virtio: Add memory shrinker
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Gert Wollny <gert.wollny@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Dmitry Osipenko <digetx@gmail.com>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 8, 2022 at 5:17 AM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> Add memory shrinker and new madvise IOCTL to the VirtIO-GPU driver.
> Userspace (BO cache manager of Mesa driver) will mark BOs as "don't need"
> using the new IOCTL to let shrinker purge the marked BOs on OOM, thus
> shrinker will lower memory pressure and prevent OOM kills.
>
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>  drivers/gpu/drm/virtio/Makefile               |   3 +-
>  drivers/gpu/drm/virtio/virtgpu_drv.h          |  26 +++-
>  drivers/gpu/drm/virtio/virtgpu_gem.c          |  84 ++++++++++++
>  drivers/gpu/drm/virtio/virtgpu_gem_shrinker.c | 124 ++++++++++++++++++
>  drivers/gpu/drm/virtio/virtgpu_ioctl.c        |  37 ++++++
>  drivers/gpu/drm/virtio/virtgpu_kms.c          |  10 ++
>  drivers/gpu/drm/virtio/virtgpu_object.c       |   7 +
>  drivers/gpu/drm/virtio/virtgpu_plane.c        |  17 ++-
>  drivers/gpu/drm/virtio/virtgpu_vq.c           |  15 +++
>  include/uapi/drm/virtgpu_drm.h                |  14 ++
>  10 files changed, 333 insertions(+), 4 deletions(-)
>  create mode 100644 drivers/gpu/drm/virtio/virtgpu_gem_shrinker.c
>

[snip]

> diff --git a/drivers/gpu/drm/virtio/virtgpu_gem_shrinker.c b/drivers/gpu/drm/virtio/virtgpu_gem_shrinker.c
> new file mode 100644
> index 000000000000..39eb9a3e7e4a
> --- /dev/null
> +++ b/drivers/gpu/drm/virtio/virtgpu_gem_shrinker.c
> @@ -0,0 +1,124 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2022 Collabora Ltd.
> + */
> +
> +#include <linux/dma-mapping.h>
> +#include <linux/shmem_fs.h>
> +
> +#include "virtgpu_drv.h"
> +
> +static unsigned long
> +virtio_gpu_gem_shrinker_count_objects(struct shrinker *shrinker,
> +                                     struct shrink_control *sc)
> +{
> +       struct drm_gem_shmem_object *shmem;
> +       struct virtio_gpu_device *vgdev;
> +       unsigned long count = 0;
> +       bool empty = true;
> +
> +       vgdev = container_of(shrinker, struct virtio_gpu_device,
> +                            vgshrinker.shrinker);
> +
> +       if (!mutex_trylock(&vgdev->mm_lock))
> +               return 0;

One bit of advice from previously dealing with shrinker and heavy
memory pressure situations (turns out 4GB chromebooks can be pretty
much under *constant* memory pressure):

You *really* want to make shrinker->count_objects lockless.. and
minimize the lock contention on shrinker->scan_objects (ie.  The
problem is you can end up with shrinking going on on all CPU cores in
parallel, you want to not funnel that thru one lock as much as
possible.

See in particular:

25ed38b3ed26 ("drm/msm: Drop mm_lock in scan loop")
cc8a4d5a1bd8 ("drm/msm: Avoid mutex in shrinker_count()")

BR,
-R

> +       list_for_each_entry(shmem, &vgdev->vgshrinker.list, madv_list) {
> +               empty = false;
> +
> +               if (!mutex_trylock(&shmem->pages_lock))
> +                       continue;
> +
> +               if (drm_gem_shmem_is_purgeable(shmem))
> +                       count += shmem->base.size >> PAGE_SHIFT;
> +
> +               mutex_unlock(&shmem->pages_lock);
> +       }
> +
> +       mutex_unlock(&vgdev->mm_lock);
> +
> +       return empty ? SHRINK_EMPTY : count;
> +}
> +
> +static bool virtio_gpu_gem_shrinker_purge(struct virtio_gpu_device *vgdev,
> +                                         struct drm_gem_object *obj)
> +{
> +       struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
> +       struct drm_gem_shmem_object *shmem = &bo->base;
> +       int err;
> +
> +       if (!dma_resv_test_signaled(obj->resv, true) ||
> +           !drm_gem_shmem_is_purgeable(shmem) ||
> +           refcount_read(&bo->pin_count))
> +               return false;
> +
> +       /*
> +        * Release host's memory before guest's memory is gone to ensure that
> +        * host won't touch released memory of the guest.
> +        */
> +       err = virtio_gpu_gem_host_mem_release(bo);
> +       if (err)
> +               return false;
> +
> +       list_del_init(&shmem->madv_list);
> +       drm_gem_shmem_purge_locked(shmem);
> +
> +       return true;
> +}
> +
> +static unsigned long
> +virtio_gpu_gem_shrinker_scan_objects(struct shrinker *shrinker,
> +                                    struct shrink_control *sc)
> +{
> +       struct drm_gem_shmem_object *shmem, *tmp;
> +       struct virtio_gpu_device *vgdev;
> +       unsigned long freed = 0;
> +
> +       vgdev = container_of(shrinker, struct virtio_gpu_device,
> +                            vgshrinker.shrinker);
> +
> +       if (!mutex_trylock(&vgdev->mm_lock))
> +               return SHRINK_STOP;
> +
> +       list_for_each_entry_safe(shmem, tmp, &vgdev->vgshrinker.list, madv_list) {
> +               if (freed >= sc->nr_to_scan)
> +                       break;
> +
> +               if (!dma_resv_trylock(shmem->base.resv))
> +                       continue;
> +
> +               if (!mutex_trylock(&shmem->pages_lock))
> +                       goto resv_unlock;
> +
> +               if (virtio_gpu_gem_shrinker_purge(vgdev, &shmem->base))
> +                       freed += shmem->base.size >> PAGE_SHIFT;
> +
> +               mutex_unlock(&shmem->pages_lock);
> +resv_unlock:
> +               dma_resv_unlock(shmem->base.resv);
> +       }
> +
> +       mutex_unlock(&vgdev->mm_lock);
> +
> +       return freed;
> +}
> +
> +int virtio_gpu_gem_shrinker_init(struct virtio_gpu_device *vgdev)
> +{
> +       struct shrinker *shrinker = &vgdev->vgshrinker.shrinker;
> +
> +       shrinker->count_objects = virtio_gpu_gem_shrinker_count_objects;
> +       shrinker->scan_objects = virtio_gpu_gem_shrinker_scan_objects;
> +       shrinker->seeks = DEFAULT_SEEKS;
> +
> +       INIT_LIST_HEAD(&vgdev->vgshrinker.list);
> +
> +       return register_shrinker(shrinker);
> +}
> +
> +void virtio_gpu_gem_shrinker_fini(struct virtio_gpu_device *vgdev)
> +{
> +       struct shrinker *shrinker = &vgdev->vgshrinker.shrinker;
> +
> +       unregister_shrinker(shrinker);
> +}
