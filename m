Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D96915B021
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2020 19:46:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F2166E0E9;
	Wed, 12 Feb 2020 18:46:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 649B36E0E9
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2020 18:46:14 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id z193so3465342iof.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2020 10:46:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HzSLfJ2Cz96C5x1hxzLlLC90Tdbu8hAdiVSaPD1a+ic=;
 b=rLB7ridDFInv5KEbCV4wR72IeOorx3/uFfPBRddOSwL5rm1J68nlhzi4mSNPXiURyy
 VlGhHVPy3y0ONC5pn2WzOggbtRT0VsRIpFxH4gCiHVYwCVtYXU2GLtwzaI4idbKa/ibZ
 fHbcPRjAFXocp8apZMEl2y+QOzLLhaBqy9fcSLaybRnBbCH5PcZm5PB8JfcOC9Ni5g2E
 sV6N2lzEuAOyY8tjrbZ/iziwvo3tNNvy9idhci0k34ObOA0BJKfTHnYbvBnCvMLr7iVL
 GbqJcauWybFpHGKBybFJf/ZP9DCakMGoZE43xpo0XySoudSKLqo1cm+OoHdiBOL3GaYQ
 M9+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HzSLfJ2Cz96C5x1hxzLlLC90Tdbu8hAdiVSaPD1a+ic=;
 b=X67UFo7W5rjiAneOpMsBrlZLU60o91lNqYR5iVBZzX5fDEoB74sbjHNbvonpcOoxRS
 HnSp0DvEPbleIXPS/t7tKWEJwmnzJS9bOkrJEuMpAee7zO+0DLhguCqkI2bdo5N5U9Fc
 qrO86IkwAgnHrFO3bUHjvYS+WpjHJfzY+XLVgWCSn494f9toZ3kISOdu+r3XCnol/3gU
 SN35Xi+m06UPjT4kz9M7cUfZRuIvhBDkdwmyffNdiTNe9NpX1Adorzxh9iiTq1UQdgJZ
 5tWCtOsnEzDS98UlN9HrMRv5Z5xbHEYyrOHObYcL6zqkpQ+liPDFDpSg7+l6oUCrwYPF
 q8Qw==
X-Gm-Message-State: APjAAAWfMbaTAj11Jc0MweiLZA5LcTI/oz5pDLhQu3pHM7NsJEMJBSZ4
 y26QCuIuZ4YYxEGkao40h3i2YvN7khxpcjoN4xCbcA==
X-Google-Smtp-Source: APXvYqzKX36oEmLhvvZsa4EIi0+SEY7HzfEPfdz7oprcG0POG6tAZ+iALBl5ZI+llvFnMZ/1jcPVGkrrsYrZwPyIGSw=
X-Received: by 2002:a5e:df06:: with SMTP id f6mr19200004ioq.84.1581533173586; 
 Wed, 12 Feb 2020 10:46:13 -0800 (PST)
MIME-Version: 1.0
References: <20200211235635.488-1-gurchetansingh@chromium.org>
 <20200211235635.488-3-gurchetansingh@chromium.org>
In-Reply-To: <20200211235635.488-3-gurchetansingh@chromium.org>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Wed, 12 Feb 2020 10:46:02 -0800
Message-ID: <CAPaKu7Qjbhpr-U9_A27AvPm_d8Df8rW+gh1X5irmN7amsiqS+A@mail.gmail.com>
Subject: Re: [PATCH 2/4] drm/virtio: factor out context create cmd
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
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 11, 2020 at 3:56 PM Gurchetan Singh
<gurchetansingh@chromium.org> wrote:
>
> We currently do it when open the DRM fd, let's delay it. First step,
> remove the hyercall from initialization.
>
> Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
> ---
>  drivers/gpu/drm/virtio/virtgpu_drv.h   |  2 ++
>  drivers/gpu/drm/virtio/virtgpu_ioctl.c | 16 ++++++++++++++++
>  drivers/gpu/drm/virtio/virtgpu_kms.c   | 10 ++++------
>  3 files changed, 22 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
> index 28aeac8717e1..edaa7b8224a8 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
> @@ -214,6 +214,8 @@ struct virtio_gpu_fpriv {
>  /* virtio_ioctl.c */
>  #define DRM_VIRTIO_NUM_IOCTLS 10
>  extern struct drm_ioctl_desc virtio_gpu_ioctls[DRM_VIRTIO_NUM_IOCTLS];
> +void virtio_gpu_create_context(struct drm_device *dev,
> +                              struct drm_file *file);
>
>  /* virtio_kms.c */
>  int virtio_gpu_init(struct drm_device *dev);
> diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> index 89d90e95900f..f1afabaa3a08 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> @@ -33,6 +33,22 @@
>
>  #include "virtgpu_drv.h"
>
> +void virtio_gpu_create_context(struct drm_device *dev,
> +                              struct drm_file *file)
> +{
> +       struct virtio_gpu_device *vgdev = dev->dev_private;
> +       struct virtio_gpu_fpriv *vfpriv = file->driver_priv;
> +       char dbgname[TASK_COMM_LEN];
> +
> +       /* can't create contexts without 3d renderer */
> +       if (!vgdev->has_virgl_3d)
> +               return;
> +
> +       get_task_comm(dbgname, current);
> +       virtio_gpu_cmd_context_create(vgdev, vfpriv->ctx_id,
> +                                     strlen(dbgname), dbgname);
> +}
> +
>  static int virtio_gpu_map_ioctl(struct drm_device *dev, void *data,
>                                 struct drm_file *file)
>  {
> diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
> index 44e4c07d0162..e1e1c0821a35 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_kms.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
> @@ -52,15 +52,13 @@ static void virtio_gpu_config_changed_work_func(struct work_struct *work)
>                       events_clear, &events_clear);
>  }
>
> -static int virtio_gpu_context_create(struct virtio_gpu_device *vgdev,
> -                                     uint32_t nlen, const char *name)
> +static int virtio_gpu_context_handle(struct virtio_gpu_device *vgdev)
virtio_gpu_context_id_get, to mirror virtio_gpu_resource_id_get?


>  {
>         int handle = ida_alloc(&vgdev->ctx_id_ida, GFP_KERNEL);
>
>         if (handle < 0)
>                 return handle;
>         handle += 1;
> -       virtio_gpu_cmd_context_create(vgdev, handle, nlen, name);
>         return handle;
>  }
>
> @@ -256,7 +254,6 @@ int virtio_gpu_driver_open(struct drm_device *dev, struct drm_file *file)
>         struct virtio_gpu_device *vgdev = dev->dev_private;
>         struct virtio_gpu_fpriv *vfpriv;
>         int id;
> -       char dbgname[TASK_COMM_LEN];
>
>         /* can't create contexts without 3d renderer */
>         if (!vgdev->has_virgl_3d)
> @@ -267,8 +264,7 @@ int virtio_gpu_driver_open(struct drm_device *dev, struct drm_file *file)
>         if (!vfpriv)
>                 return -ENOMEM;
>
> -       get_task_comm(dbgname, current);
> -       id = virtio_gpu_context_create(vgdev, strlen(dbgname), dbgname);
> +       id = virtio_gpu_context_handle(vgdev);
>         if (id < 0) {
>                 kfree(vfpriv);
>                 return id;
> @@ -276,6 +272,8 @@ int virtio_gpu_driver_open(struct drm_device *dev, struct drm_file *file)
>
>         vfpriv->ctx_id = id;
>         file->driver_priv = vfpriv;
> +       virtio_gpu_create_context(dev, file);
> +
>         return 0;
>  }
>
> --
> 2.25.0.225.g125e21ebc7-goog
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
