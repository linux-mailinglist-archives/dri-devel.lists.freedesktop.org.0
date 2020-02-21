Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8746C168A3B
	for <lists+dri-devel@lfdr.de>; Sat, 22 Feb 2020 00:06:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF8626E2A9;
	Fri, 21 Feb 2020 23:06:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B86B06E2A9
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 23:06:17 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id 13so3595607iou.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 15:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i/wNvx9MWibIfuw0nDf4zYEfIIEN7w7NgU+vz9gJEr4=;
 b=BfsSqjUtMVFd9NvQ9UnS3GIZyHWRnkdL4wldqguUPuNtJ0uEFqN4OPm87OiM3N6O/k
 HHVRVQZdUC0j56X+ZhRwxTriol4TNDEg6ApUak1BuxZXylO1URJfbp+NdyN9Qumkb3KC
 5sv981GwkD6M7Wi/kSWrjkbAGY+YHQE3ZVfDzy/Jgz6sPIF9kB0DsUjgsdjdKlGAVCBD
 Z5xW8/v+sNUz5neIOxXafSdOF8xQKwlLhQYFl8egTSGg8nnFj+7P/ZGF3ZSqCJN4z+62
 Bzh5mUpqcrbM0wxn7zOQ4dapkb0uj2GNRabifWEi40Q4J4Uqj9zZtTNbltB9YKVFi63y
 KE7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i/wNvx9MWibIfuw0nDf4zYEfIIEN7w7NgU+vz9gJEr4=;
 b=cqsr2vVsoLCh1MiiHfbBz4sRVPUhMxR7tGzolNc/AiOEm4mWuMsxcDlYii+i/asA6X
 885NBmajmaJtOtM/eolinrcu/CudkHHYwhuAlmGLJ5YzqSxRlhen6IxxIOcQiC5Dgupr
 m67Q/z95svDqdE+dXW2xpIN8Zn/8WCE3L4HlS/5uXGp67bo8nG729uvFi4JDwJ95w5Pb
 yuDhczfT7imtpYvrLcO6zb1AnIRzTfCbeumM1C+f+OQpQEqRtXKhtUbBRq4OZTwT02Hp
 yRqdXvd1diBepeVt0pOwge6VfKm29zbt/e4ZpMiYHJfUX//ecWfRqCFAivS/xObeMs1M
 szOQ==
X-Gm-Message-State: APjAAAVfNACqy21HtFy1AJNqGoqLd55jiQDdNSK4+ZnWbFxPy+Nsb+W6
 6yVD7uBZZtSLhRt8oameJlQgYmBgSDDcnDm2mPQ=
X-Google-Smtp-Source: APXvYqzDfj2YEAPBOX1/xweLeAKLWthe9nQgW66d+gGJSxL0yF8LEYuCmpAWlZbfd0lKEt6NZqzQsOA+b5AyeF6GVoU=
X-Received: by 2002:a5e:9246:: with SMTP id z6mr35984434iop.232.1582326376822; 
 Fri, 21 Feb 2020 15:06:16 -0800 (PST)
MIME-Version: 1.0
References: <20200219223423.53319-1-gurchetansingh@chromium.org>
 <20200219223423.53319-4-gurchetansingh@chromium.org>
In-Reply-To: <20200219223423.53319-4-gurchetansingh@chromium.org>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Fri, 21 Feb 2020 15:06:06 -0800
Message-ID: <CAPaKu7QakQzeT3YrP5ctGfkAToNpq+E+qZ9pq5j-VOgTE4KYvg@mail.gmail.com>
Subject: Re: [PATCH 4/4 v6] drm/virtio: enqueue virtio_gpu_create_context
 after the first 3D ioctl
To: Gurchetan Singh <gurchetansingh@chromium.org>
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
Cc: Emil Velikov <emil.l.velikov@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 19, 2020 at 2:34 PM Gurchetan Singh
<gurchetansingh@chromium.org> wrote:
>
> For old userspace, initialization will still be implicit.
>
> For backwards compatibility, enqueue virtio_gpu_cmd_context_create after
> the first 3D ioctl.
>
> v3: staticify virtio_gpu_create_context
>     remove notify to batch vm-exit
> v6: Remove nested 3D checks (emil.velikov):
>       - unify 3D check in resource create
>       - VIRTIO_GPU_CMD_GET_CAPSET is listed as a 2D ioctl, added a
>         3D check there.
I missed this change.  Why do we need a context to get capsets?  Is
this a workaround or something?

>
> Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
> Reviewed-by: Emil Velikov <emil.velikov@collabora.com>
> Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
> ---
>  drivers/gpu/drm/virtio/virtgpu_drv.h   |  2 --
>  drivers/gpu/drm/virtio/virtgpu_ioctl.c | 32 +++++++++++++++-----------
>  drivers/gpu/drm/virtio/virtgpu_kms.c   |  1 -
>  3 files changed, 19 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
> index 76b7b7c30e10..95a7443baaba 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
> @@ -216,8 +216,6 @@ struct virtio_gpu_fpriv {
>  /* virtio_ioctl.c */
>  #define DRM_VIRTIO_NUM_IOCTLS 10
>  extern struct drm_ioctl_desc virtio_gpu_ioctls[DRM_VIRTIO_NUM_IOCTLS];
> -void virtio_gpu_create_context(struct drm_device *dev,
> -                              struct drm_file *file);
>
>  /* virtio_kms.c */
>  int virtio_gpu_init(struct drm_device *dev);
> diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> index ec38cf5573aa..c36faa572caa 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> @@ -33,8 +33,8 @@
>
>  #include "virtgpu_drv.h"
>
> -void virtio_gpu_create_context(struct drm_device *dev,
> -                              struct drm_file *file)
> +static void virtio_gpu_create_context(struct drm_device *dev,
> +                                     struct drm_file *file)
>  {
>         struct virtio_gpu_device *vgdev = dev->dev_private;
>         struct virtio_gpu_fpriv *vfpriv = file->driver_priv;
> @@ -95,6 +95,7 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
>
>         exbuf->fence_fd = -1;
>
> +       virtio_gpu_create_context(dev, file);
>         if (exbuf->flags & VIRTGPU_EXECBUF_FENCE_FD_IN) {
>                 struct dma_fence *in_fence;
>
> @@ -233,7 +234,17 @@ static int virtio_gpu_resource_create_ioctl(struct drm_device *dev, void *data,
>         uint32_t handle = 0;
>         struct virtio_gpu_object_params params = { 0 };
>
> -       if (vgdev->has_virgl_3d == false) {
> +       if (vgdev->has_virgl_3d) {
> +               virtio_gpu_create_context(dev, file);
> +               params.virgl = true;
> +               params.target = rc->target;
> +               params.bind = rc->bind;
> +               params.depth = rc->depth;
> +               params.array_size = rc->array_size;
> +               params.last_level = rc->last_level;
> +               params.nr_samples = rc->nr_samples;
> +               params.flags = rc->flags;
> +       } else {
>                 if (rc->depth > 1)
>                         return -EINVAL;
>                 if (rc->nr_samples > 1)
> @@ -250,16 +261,6 @@ static int virtio_gpu_resource_create_ioctl(struct drm_device *dev, void *data,
>         params.width = rc->width;
>         params.height = rc->height;
>         params.size = rc->size;
> -       if (vgdev->has_virgl_3d) {
> -               params.virgl = true;
> -               params.target = rc->target;
> -               params.bind = rc->bind;
> -               params.depth = rc->depth;
> -               params.array_size = rc->array_size;
> -               params.last_level = rc->last_level;
> -               params.nr_samples = rc->nr_samples;
> -               params.flags = rc->flags;
> -       }
>         /* allocate a single page size object */
>         if (params.size == 0)
>                 params.size = PAGE_SIZE;
> @@ -319,6 +320,7 @@ static int virtio_gpu_transfer_from_host_ioctl(struct drm_device *dev,
>         if (vgdev->has_virgl_3d == false)
>                 return -ENOSYS;
>
> +       virtio_gpu_create_context(dev, file);
>         objs = virtio_gpu_array_from_handles(file, &args->bo_handle, 1);
>         if (objs == NULL)
>                 return -ENOENT;
> @@ -367,6 +369,7 @@ static int virtio_gpu_transfer_to_host_ioctl(struct drm_device *dev, void *data,
>                          args->box.w, args->box.h, args->box.x, args->box.y,
>                          objs, NULL);
>         } else {
> +               virtio_gpu_create_context(dev, file);
>                 ret = virtio_gpu_array_lock_resv(objs);
>                 if (ret != 0)
>                         goto err_put_free;
> @@ -466,6 +469,9 @@ static int virtio_gpu_get_caps_ioctl(struct drm_device *dev,
>         }
>         spin_unlock(&vgdev->display_info_lock);
>
> +       if (vgdev->has_virgl_3d)
> +               virtio_gpu_create_context(dev, file);
> +
>         /* not in cache - need to talk to hw */
>         virtio_gpu_cmd_get_capset(vgdev, found_valid, args->cap_set_ver,
>                                   &cache_ent);
> diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
> index 424729cb81d1..023a030ca7b9 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_kms.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
> @@ -268,7 +268,6 @@ int virtio_gpu_driver_open(struct drm_device *dev, struct drm_file *file)
>
>         vfpriv->ctx_id = handle + 1;
>         file->driver_priv = vfpriv;
> -       virtio_gpu_create_context(dev, file);
>         return 0;
>  }
>
> --
> 2.25.0.265.gbab2e86ba0-goog
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
