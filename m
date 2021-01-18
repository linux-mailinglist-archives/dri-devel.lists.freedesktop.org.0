Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 359802FB433
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jan 2021 09:37:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 837E26E071;
	Tue, 19 Jan 2021 08:37:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 908EF6E5BB
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jan 2021 23:23:18 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id w79so20276488qkb.5
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jan 2021 15:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=android.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DBvkANnsASxNzW1l4kG04pLbjkG68+3VpEAecnZNaSA=;
 b=XDm097mldCjKNGSrByLQ0T7F7N9MUkOW49lOtt+kzwDNZ2vn4ZgGt98sJsHoiJ3PpD
 2CXsO7iCz4GOUKGp9omKhzptoX41tdKD6/5rs2JGStmHiEToMK7YhljMwGSseW/5AE90
 XstktZpNsBNFrtASn1vL3HMq0VTMQuDCvjA+XdLcoFpGFFxQzwng/2E6vWxw6e9RBR8G
 zClNzhSTKcv1ZfWBnxNK+4jZZpVfVlw35nDG5JWBKP0t1DwKyitaS2E+w0Ax/k0aKbMp
 Jm8ZsVWhgvy89C3mx6/elomre4rUs6JhYdw6+ANB0C6h/HJ35BGQ6XZ+vamtnavlOSt2
 fUNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DBvkANnsASxNzW1l4kG04pLbjkG68+3VpEAecnZNaSA=;
 b=L8QzExKVKBjkOb4yjD4pW2mRLd4VyMfnDh0Lovy/6C7CujPgqeEE8ya/CMihnfioo9
 4RQHJKVcUDW9MF34ZT5ykhY6+T9s2OK/PvgvIaVDZJ2CzkDNmxD+5sfxK14CEKOVWJjg
 BFsafrgTva+eAp4lM/GAzTorhdxvtmosv1LiFW2B4jXwTT1a+IZ6Dw9bycCAG05iwZ5E
 M9QbJzytErv58F57vRdI032zcG8IgcvnKSSSKVY0cS1QPjw7++HZJqp+AwDrrIC04LWa
 V6MceiKx6PJhxIn8sPfhc9orLb6VIA+a1x+rcB39VPo5OpfZTrRMIFM+gfV0VTCcstV/
 U6mg==
X-Gm-Message-State: AOAM533KOABmD/sp7a38JPElemMoyBZIC0mNFhZZy8in9TuoIDKgf14m
 tt9pW0Ag8wNlXw5A5d/gN6/rUYHJ1PyNwJAwN7hL5Q==
X-Google-Smtp-Source: ABdhPJxUVtLZ5wlXdNBM3SyiUYqA8bQPWf2PF9ARLTVL4xSRF3Uvs7Olys7HhET4W8YekMTWVyI4yCY7mD9ViPLhu0A=
X-Received: by 2002:a37:68e:: with SMTP id 136mr1897310qkg.121.1611012197723; 
 Mon, 18 Jan 2021 15:23:17 -0800 (PST)
MIME-Version: 1.0
References: <20210118224659.263928-1-zzyiwei@android.com>
In-Reply-To: <20210118224659.263928-1-zzyiwei@android.com>
From: =?UTF-8?B?WWl3ZWkgWmhhbmfigI4=?= <zzyiwei@android.com>
Date: Mon, 18 Jan 2021 15:23:07 -0800
Message-ID: <CAKB3++adfpdBHFEyGZ3v2V6zyW+ayg86CLDRKx1ty+OytjYFNw@mail.gmail.com>
Subject: Re: [PATCH] Track total GPU memory for virtio driver
To: David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>
X-Mailman-Approved-At: Tue, 19 Jan 2021 08:37:25 +0000
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
Cc: kernel-team <kernel-team@android.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 18, 2021 at 2:47 PM Yiwei Zhang <zzyiwei@android.com> wrote:
>
> On the success of virtio_gpu_object_create, add size of newly allocated
> bo to the tracled total_mem. In drm_gem_object_funcs.free, after the gem
> bo lost its last refcount, subtract the bo size from the tracked
> total_mem if the original underlying memory allocation is successful.
>
> Signed-off-by: Yiwei Zhang <zzyiwei@android.com>
> ---
>  drivers/gpu/drm/virtio/Kconfig          |  1 +
>  drivers/gpu/drm/virtio/virtgpu_drv.h    |  4 ++++
>  drivers/gpu/drm/virtio/virtgpu_object.c | 19 +++++++++++++++++++
>  3 files changed, 24 insertions(+)
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
> index 6a232553c99b..7c60e7486bc4 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
> @@ -249,6 +249,10 @@ struct virtio_gpu_device {
>         spinlock_t resource_export_lock;
>         /* protects map state and host_visible_mm */
>         spinlock_t host_visible_lock;
> +
> +#ifdef CONFIG_TRACE_GPU_MEM
> +       atomic64_t total_mem;
> +#endif
>  };
>
>  struct virtio_gpu_fpriv {
> diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
> index d69a5b6da553..1e16226cebbe 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_object.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_object.c
> @@ -25,12 +25,29 @@
>
>  #include <linux/dma-mapping.h>
>  #include <linux/moduleparam.h>
> +#ifdef CONFIG_TRACE_GPU_MEM
> +#include <trace/events/gpu_mem.h>
> +#endif
>
>  #include "virtgpu_drv.h"
>
>  static int virtio_gpu_virglrenderer_workaround = 1;
>  module_param_named(virglhack, virtio_gpu_virglrenderer_workaround, int, 0400);
>
> +#ifdef CONFIG_TRACE_GPU_MEM
> +static inline void virtio_gpu_trace_total_mem(struct virtio_gpu_device *vgdev,
> +                                             s64 delta)
> +{
> +       u64 total_mem = atomic64_add_return(delta, &vgdev->total_mem);
> +
> +       trace_gpu_mem_total(0, 0, total_mem);
> +}
> +#else
> +static inline void virtio_gpu_trace_total_mem(struct virtio_gpu_device *, s64)
> +{
> +}
> +#endif
> +
>  int virtio_gpu_resource_id_get(struct virtio_gpu_device *vgdev, uint32_t *resid)
>  {
>         if (virtio_gpu_virglrenderer_workaround) {
> @@ -104,6 +121,7 @@ static void virtio_gpu_free_object(struct drm_gem_object *obj)
>         struct virtio_gpu_device *vgdev = bo->base.base.dev->dev_private;
>
>         if (bo->created) {
> +               virtio_gpu_trace_total_mem(vgdev, -(obj->size));
>                 virtio_gpu_cmd_unref_resource(vgdev, bo);
>                 virtio_gpu_notify(vgdev);
>                 /* completion handler calls virtio_gpu_cleanup_object() */
> @@ -265,6 +283,7 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
>                 virtio_gpu_object_attach(vgdev, bo, ents, nents);
>         }
>
> +       virtio_gpu_trace_total_mem(vgdev, shmem_obj->base.size);
>         *bo_ptr = bo;
>         return 0;
>
> --
> 2.30.0.284.gd98b1dd5eaa7-goog
>

-CC android-kernel-team@google.com
+CC kernel-team@android.com
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
