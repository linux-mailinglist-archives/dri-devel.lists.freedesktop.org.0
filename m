Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AED2164DA2
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 19:28:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 007036E84A;
	Wed, 19 Feb 2020 18:28:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com
 [IPv6:2607:f8b0:4864:20::944])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A9C96E84A
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 18:28:49 +0000 (UTC)
Received: by mail-ua1-x944.google.com with SMTP id g13so578226uab.7
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 10:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MYZKhugRysOg1Vxn3QHVWrw8OHPKwmzxw9dn5xyapEc=;
 b=EKFsGsfarmKTWhkP2NIWV2cAn+D1nL8c0Sv3uBX0K1GsTVPc4Xz92olWdvSX3s5uq3
 D+y/4Rrfxp9l7EsqhGZznd6rH5C62fUlUu7MotV5Xnet0aRktgwcbHXswaKzm2Q8wu7w
 79bLXwHN9tbAuTkFY9TJfJ7psfDtKKGy2S0up6JT13Tz+sw3YG/BWq2sWxgk26Mo/W33
 RpAEdIvbJsUd55YfrJdF2Iw4HUVutZEN+xJtvz61hiyYLoemc87OFAh7BcGkGYWcLofW
 /+dnHhG9l/MpREHjEff3Q31LmIJ2bEF6OcJP9RKs5Y2yw0+oPqMBtydlHs+oac7pAs93
 vWYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MYZKhugRysOg1Vxn3QHVWrw8OHPKwmzxw9dn5xyapEc=;
 b=LyIHeFdKq9+7jhW9fKiteIeJ3qdB+oDxwDqUeUNSqyIUKAY0+ZEPR3lhsXiYEnqO2q
 6ZNhl9FEWcHIucCxVgDoUs+dR3xdOEwJoAg7PpJ0n2wuu1ZNJjHEF1++3SFU32fO7WnG
 fFLRWGJjAE2VQM+qmKKIYqXvimUo0Y0IzpKKV40ktVd8L8/cLB6vIGLqps+YF34q+cvX
 Qk9BySRGFqp7b1lAMAbdCNUtIEVpzk2uOpMq1wBC7AR8ZRddBy7rKNiOPRKpla/dqHyq
 yprYGiItvUYkTlZecYKEDV5N948ns3kWXUNZfZDj4BqDN55WVYIygC5FZnmCTB8ctt2X
 oNXA==
X-Gm-Message-State: APjAAAVFg/hvS6bUJLf+Zj+bHXjPS0o9SvJkNGIJs0W8n/0TnYOYnW81
 sUxPSS65Xk8zLRTcY6RL1t52lpXTE4PpZRT6HOw=
X-Google-Smtp-Source: APXvYqzuxMyeOil9QlFxgVAbWfXfifOAwJn5VBHvRNHpxFn3Tt3qNyCyztwqP+g72j7pb8i7mxqcOEDSiy0oLI3N4M0=
X-Received: by 2002:ab0:5bc6:: with SMTP id z6mr14875950uae.46.1582136928350; 
 Wed, 19 Feb 2020 10:28:48 -0800 (PST)
MIME-Version: 1.0
References: <20200219175640.809-1-gurchetansingh@chromium.org>
 <20200219175640.809-4-gurchetansingh@chromium.org>
In-Reply-To: <20200219175640.809-4-gurchetansingh@chromium.org>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Wed, 19 Feb 2020 18:28:38 +0000
Message-ID: <CACvgo50b1U+hyZ-CXCJ3VXCh-EMFDrC6F0ye5UnVFKzPC_D1qQ@mail.gmail.com>
Subject: Re: [PATCH 4/5 v5] drm/virtio: enqueue virtio_gpu_create_context
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
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, jbates@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 19 Feb 2020 at 17:57, Gurchetan Singh
<gurchetansingh@chromium.org> wrote:
>
> For old userspace, initialization will still be implicit.
>
> For backwards compatibility, enqueue virtio_gpu_cmd_context_create after
> the first 3D ioctl.
>
> v3: staticify virtio_gpu_create_context
>     remove notify to batch vm-exit
>
Similar to 2/5 I suspect we have nested has_virgl_3d checking.

> Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
> ---
>  drivers/gpu/drm/virtio/virtgpu_drv.h   |  2 --
>  drivers/gpu/drm/virtio/virtgpu_ioctl.c | 10 +++++++---
>  drivers/gpu/drm/virtio/virtgpu_kms.c   |  1 -
>  3 files changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
> index 0596d9618554..9fdc3b4cef48 100644
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
> index c1a6cb4ec375..2c182922ec78 100644
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
In this function...

>         struct virtio_gpu_device *vgdev = dev->dev_private;
>         struct virtio_gpu_fpriv *vfpriv = file->driver_priv;
> @@ -51,7 +51,6 @@ void virtio_gpu_create_context(struct drm_device *dev,
>         get_task_comm(dbgname, current);
>         virtio_gpu_cmd_context_create(vgdev, vfpriv->ctx_id,
>                                       strlen(dbgname), dbgname);
> -       virtio_gpu_notify(vgdev);
>         vfpriv->context_initiated = true;
>
>  out_unlock:
> @@ -99,6 +98,7 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
>
... and this caller, just a couple of lines above.

>         exbuf->fence_fd = -1;
>
> +       virtio_gpu_create_context(dev, file);
>         if (exbuf->flags & VIRTGPU_EXECBUF_FENCE_FD_IN) {
>                 struct dma_fence *in_fence;
>
> @@ -250,6 +250,7 @@ static int virtio_gpu_resource_create_ioctl(struct drm_device *dev, void *data,
>                         return -EINVAL;
>         }
>
Unrelated: might be a good idea to sort the has_virgl_3d == false
EINVAL handling like the has_virgl_3d == true hunk just below. Bonus
points for a comment explaining we don't check for the bind and flags
arguments.

> +       virtio_gpu_create_context(dev, file);
>         params.format = rc->format;
>         params.width = rc->width;
>         params.height = rc->height;
> @@ -323,6 +324,7 @@ static int virtio_gpu_transfer_from_host_ioctl(struct drm_device *dev,
>         if (vgdev->has_virgl_3d == false)
>                 return -ENOSYS;
>
... and this caller.

> +       virtio_gpu_create_context(dev, file);
>         objs = virtio_gpu_array_from_handles(file, &args->bo_handle, 1);
>         if (objs == NULL)
>                 return -ENOENT;
> @@ -371,6 +373,7 @@ static int virtio_gpu_transfer_to_host_ioctl(struct drm_device *dev, void *data,
>                          args->box.w, args->box.h, args->box.x, args->box.y,
>                          objs, NULL);
>         } else {
... and this caller, just a couple of lines above.

With the trivial comments addressed:
Reviewed-by: Emil Velikov <emil.velikov@collabora.com>

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
