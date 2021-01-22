Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C650A2FFE8A
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jan 2021 09:46:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F5226E9D4;
	Fri, 22 Jan 2021 08:46:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D46126E2EF
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jan 2021 07:58:33 +0000 (UTC)
Received: by mail-qk1-x731.google.com with SMTP id x81so1479037qkb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 23:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=android.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LlnD7Zwth8kJl753Ww9WFQKiEwV5qtL3iOD2rycD9tA=;
 b=u4WEuEwO/1CKmHHMGX4MJ/0miWGn1+qvGeCtAWRuFR8Ia0p8WS68kV4SGcAnrMSqY5
 sCwks3YyAFHgbzVHmMx8ByINsANRc8IXaixQD4MpAIOtKlmUEqgP01m4pVXAFj22TLam
 j0MuCMZxld4VWgAeMWRdEV76PAYQkOLkTgUGYapklSsh2tDdCyYPTacDaGzJfqQHA0te
 GnHSdnkqB3f6+8gLirmFLrs0HpmcwBnjCx8iimf/zTb14CuiTufLdcId4sTrcOW4My0n
 Hv24bipUbjAmrsRuBNezwPiWb3/3GBVDW/vaj202yjjpiwp9CfFsKsGNBzXA9C/BrxD4
 LYqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LlnD7Zwth8kJl753Ww9WFQKiEwV5qtL3iOD2rycD9tA=;
 b=J9qmySE6Zv9f6JnmSiYfD6Qx7RWf9MkoDRP67sF5AJ6VhTZtd3M8Cijv97c4XH973O
 0Ps2aS9WQnlA/dAZLwDd+igiYb5alHX9oC5ol4qoTkQmtD4sVHbQVd6WdB3SJeQ9J0qX
 GVVJ3lv3gDsPqAFV8m/wLG9bv7yTQn+oq082NNgXGmobyl8PIjWkJJQoG7N8/DQU7PjA
 1KG/rQQwiN9RmFpu7ctHO9Z6Va7QLSvZnExc1knaeq1EsxVoders3g//ePCg1cw0PpD5
 b0yUL/6+8TvAA41AEULIAjmCePSNDx9jOlFxTvY4ArdK9v73a5mpTBF8HTMMOEo246JD
 1Ngw==
X-Gm-Message-State: AOAM533YV5qdBrFjV2dAhWXq9dCxRjDx781rzBNu53GWuKR3epl188WP
 8M6twNpg1E4VXRLflAJIo6s8xPiJ1t5J/6HtLWw8Nw==
X-Google-Smtp-Source: ABdhPJzFcCeg4URy8hQIO6n6N8vcypHwKE9xDwf10IPfxm54qBxw3QFlquRMI+KZRoFUBwYtR1hIxDUtZJ28l4yfFyk=
X-Received: by 2002:a05:620a:21db:: with SMTP id
 h27mr3687267qka.121.1611302312854; 
 Thu, 21 Jan 2021 23:58:32 -0800 (PST)
MIME-Version: 1.0
References: <20210122053159.1720274-1-zzyiwei@android.com>
 <20210122054011.1722954-1-zzyiwei@android.com>
In-Reply-To: <20210122054011.1722954-1-zzyiwei@android.com>
From: =?UTF-8?B?WWl3ZWkgWmhhbmfigI4=?= <zzyiwei@android.com>
Date: Thu, 21 Jan 2021 23:58:22 -0800
Message-ID: <CAKB3++bLzn5YVaR3iUTHtNYwBeG6Z27NjtWZ1q-xmjOkApAQwg@mail.gmail.com>
Subject: Re: [PATCH v4] drm/virtio: Track total GPU memory for virtio driver
To: David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>
X-Mailman-Approved-At: Fri, 22 Jan 2021 08:45:43 +0000
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
Cc: kernel-team <kernel-team@android.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, "open list:VIRTIO CORE,
 NET..." <virtualization@lists.linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 21, 2021 at 9:40 PM Yiwei Zhang <zzyiwei@android.com> wrote:
>
> On the success of virtio_gpu_object_create, add size of newly allocated
> bo to the tracked total_mem. In drm_gem_object_funcs.free, after the gem
> bo loses its last refcount, subtract the bo size from the tracked
> total_mem if the original underlying memory allocation is successful.
>
> It's more accurate to do this in device driver layer to best match when
> the underlying resource gets allocated and destroyed during tracing.
>
> Signed-off-by: Yiwei Zhang <zzyiwei@android.com>
> ---
>  drivers/gpu/drm/virtio/Kconfig          |  1 +
>  drivers/gpu/drm/virtio/virtgpu_drv.h    |  2 ++
>  drivers/gpu/drm/virtio/virtgpu_object.c | 11 +++++++++++
>  3 files changed, 14 insertions(+)
>
> diff --git a/drivers/gpu/drm/virtio/Kconfig b/drivers/gpu/drm/virtio/Kconfig
> index b925b8b1da16..e103b7e883b1 100644
> --- a/drivers/gpu/drm/virtio/Kconfig
> +++ b/drivers/gpu/drm/virtio/Kconfig
> @@ -5,6 +5,7 @@ config DRM_VIRTIO_GPU
>         select DRM_KMS_HELPER
>         select DRM_GEM_SHMEM_HELPER
>         select VIRTIO_DMA_SHARED_BUFFER
> +       select TRACE_GPU_MEM
>         help
>            This is the virtual GPU driver for virtio.  It can be used with
>            QEMU based VMMs (like KVM or Xen).
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
> index 6a232553c99b..c5622f9b591f 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
> @@ -249,6 +249,8 @@ struct virtio_gpu_device {
>         spinlock_t resource_export_lock;
>         /* protects map state and host_visible_mm */
>         spinlock_t host_visible_lock;
> +
> +       atomic64_t total_mem;
>  };
>
>  struct virtio_gpu_fpriv {
> diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
> index d69a5b6da553..e2251fc41509 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_object.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_object.c
> @@ -25,12 +25,21 @@
>
>  #include <linux/dma-mapping.h>
>  #include <linux/moduleparam.h>
> +#include <trace/events/gpu_mem.h>
>
>  #include "virtgpu_drv.h"
>
>  static int virtio_gpu_virglrenderer_workaround = 1;
>  module_param_named(virglhack, virtio_gpu_virglrenderer_workaround, int, 0400);
>
> +static inline void virtio_gpu_trace_total_mem(struct virtio_gpu_device *vgdev,
> +                                             s64 delta)
> +{
> +       u64 total_mem = atomic64_add_return(delta, &vgdev->total_mem);
> +
> +       trace_gpu_mem_total(vgdev->ddev->primary->index, 0, total_mem);
> +}
> +
>  int virtio_gpu_resource_id_get(struct virtio_gpu_device *vgdev, uint32_t *resid)
>  {
>         if (virtio_gpu_virglrenderer_workaround) {
> @@ -104,6 +113,7 @@ static void virtio_gpu_free_object(struct drm_gem_object *obj)
>         struct virtio_gpu_device *vgdev = bo->base.base.dev->dev_private;
>
>         if (bo->created) {
> +               virtio_gpu_trace_total_mem(vgdev, -(obj->size));
>                 virtio_gpu_cmd_unref_resource(vgdev, bo);
>                 virtio_gpu_notify(vgdev);
>                 /* completion handler calls virtio_gpu_cleanup_object() */
> @@ -265,6 +275,7 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
>                 virtio_gpu_object_attach(vgdev, bo, ents, nents);
>         }
>
> +       virtio_gpu_trace_total_mem(vgdev, shmem_obj->base.size);
>         *bo_ptr = bo;
>         return 0;
>
> --
> 2.30.0.280.ga3ce27912f-goog
>

Re Gerd and Daniel:

I'm not sure why we want to couple this patch too much with the
dma-bufs tracking. The tracepoint added here itself is pretty useful
for tracking gem bo total usage in virtio gpu upon tracing. The
original purpose for integrating this tracepoint in all Android gpu
kernel drivers is to just track total gpu memory usage and serve the
accurate data to game developers in a much easier way. It's something
they can rely on for robust testing and regression monitoring.

The only overlap with the dma-buf side is when we export a bo via
prime to a dma-buf. But still, the total here is already useful for
this particular device. Using which approach to account for the
overlap wouldn't block this small integration from my understanding.

Besides, there's no plan for adding per-process gem total tracking in
virtio-gpu at this moment. This patch should be light enough to carry
without worrying about tech debt I believe.

Many thanks!
Yiwei
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
