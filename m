Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D89825CBDD
	for <lists+dri-devel@lfdr.de>; Thu,  3 Sep 2020 23:11:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41A246E083;
	Thu,  3 Sep 2020 21:11:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8925D6E083
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 21:11:27 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id g14so5025249iom.0
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Sep 2020 14:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=C1QVoQMK/RnGNgl6zUgDW4hCfIREKSbOXHI+gdnCNYU=;
 b=DWPldwAynD3zWm7AuT6r67QAfOF+Ll+n7oUof7d7DVOq3Pta7kQNCk1S/p1e5lqya0
 A3i7MN/9X6c2/5wIR7TkOoqYTvrd9Tv14VPhz/SNfaerTUQRWTpkVxM+5nbwOx4UwYIx
 zh2NIpGyunC0hTAZB9UR2DQ8EG1Cm/bmZBqsMxhXQP7YECMnmEBvpAaS6JRhAs9wnum6
 +lEfJX7Sk4Kf7NaB0x3lYAUkQLeRHq3e/JsYrMr6REYFLyorLSZI4sjuqQ52CmBc5CxW
 V3EO7LvTePHeKWiOCdK5NDNcZUWlYYJRLMDsWjMUbZ/DX9t17utAeiA31IPvJByADlxe
 1gHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C1QVoQMK/RnGNgl6zUgDW4hCfIREKSbOXHI+gdnCNYU=;
 b=HcojObAsDTKfRyePthUpEqdt6SkMP4vD2DQiDy8ukukD6Ts/YALUonbi2UdZLwsmpy
 YrbHZoArJxAdxtdFcbNxs4Ml3ZZkxXRwbKm6KT3vialyYUW1OPuOtuxrdx82rMRIv7DB
 nh4gjF48IWCVFte3H3D1OuQ3bwbnPaLbBJYfpFQlEf6dLBcTKZ5vOnXN9zGnp+IFujAn
 hyZKiHX4QH1uQOkTob91r3m1f77o1Y/WtzKRGfuMpcUc29T099bh6ZI7x8Xjixr5l0Ht
 pkKsyiRTCxWwLAwLDfwV9SdoPStuwgAX/FQGsjaT0fo7HRAIHT9KqnYjxeKqs9LOKiXr
 ge7Q==
X-Gm-Message-State: AOAM531NRHCdAjY2/GwYA4Jaw1T2+xw7kj8TwxLZjYvuS/Alp9oO3zWt
 6mMO5VAkQg++GmT6jy66V8yjstVDbyCN9m+Xw68=
X-Google-Smtp-Source: ABdhPJxNi1eo8MklyIxGQdC5XpElhbvoNXBKULLj44l417t+BR3+FgC+yQQ50q5wLY+66fSkMnSTwDnJgFmH8q7OHrA=
X-Received: by 2002:a05:6602:2d90:: with SMTP id
 k16mr4761487iow.19.1599167486781; 
 Thu, 03 Sep 2020 14:11:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200902210847.2689-1-gurchetansingh@chromium.org>
 <20200902210847.2689-23-gurchetansingh@chromium.org>
In-Reply-To: <20200902210847.2689-23-gurchetansingh@chromium.org>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Thu, 3 Sep 2020 14:11:15 -0700
Message-ID: <CAPaKu7Riurr-+O8Kdi=e2+ivG=P2L1CKGtu8cXGpSjnC34pYPw@mail.gmail.com>
Subject: Re: [PATCH v2 22/23] drm/virtio: implement blob resources: resource
 create blob ioctl
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
Cc: virtio-dev@lists.oasis-open.org, "Michael S. Tsirkin" <mst@redhat.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, sebastien.boeuf@intel.com,
 Gerd Hoffmann <kraxel@redhat.com>, vgoyal@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 2, 2020 at 2:09 PM Gurchetan Singh
<gurchetansingh@chromium.org> wrote:
>
> From: Gerd Hoffmann <kraxel@redhat.com>
>
> Implement resource create blob as specified.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> Co-developed-by: Gurchetan Singh <gurchetansingh@chromium.org>
> Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
> Acked-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_drv.h    |   4 +-
>  drivers/gpu/drm/virtio/virtgpu_ioctl.c  | 136 ++++++++++++++++++++++++
>  drivers/gpu/drm/virtio/virtgpu_object.c |   5 +-
>  drivers/gpu/drm/virtio/virtgpu_vram.c   |   2 +
>  4 files changed, 144 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
> index 6162865c162df..d2ea199dbdb90 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
> @@ -257,8 +257,8 @@ struct virtio_gpu_fpriv {
>         struct mutex context_lock;
>  };
>
> -/* virtgpu_ioctl.c */
> -#define DRM_VIRTIO_NUM_IOCTLS 10
> +/* virtio_ioctl.c */
> +#define DRM_VIRTIO_NUM_IOCTLS 11
>  extern struct drm_ioctl_desc virtio_gpu_ioctls[DRM_VIRTIO_NUM_IOCTLS];
>  void virtio_gpu_create_context(struct drm_device *dev, struct drm_file *file);
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> index 7dbe24248a200..442cbca59c8a5 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> @@ -34,6 +34,10 @@
>
>  #include "virtgpu_drv.h"
>
> +#define VIRTGPU_BLOB_FLAG_USE_MASK (VIRTGPU_BLOB_FLAG_USE_MAPPABLE | \
> +                                   VIRTGPU_BLOB_FLAG_USE_SHAREABLE | \
> +                                   VIRTGPU_BLOB_FLAG_USE_CROSS_DEVICE)
> +
>  void virtio_gpu_create_context(struct drm_device *dev, struct drm_file *file)
>  {
>         struct virtio_gpu_device *vgdev = dev->dev_private;
> @@ -520,6 +524,134 @@ static int virtio_gpu_get_caps_ioctl(struct drm_device *dev,
>         return 0;
>  }
>
> +static int verify_blob(struct virtio_gpu_device *vgdev,
> +                      struct virtio_gpu_fpriv *vfpriv,
> +                      struct virtio_gpu_object_params *params,
> +                      struct drm_virtgpu_resource_create_blob *rc_blob,
> +                      bool *guest_blob, bool *host3d_blob)
> +{
> +       if (!vgdev->has_resource_blob)
> +               return -EINVAL;
> +
> +       if ((rc_blob->blob_flags & ~VIRTGPU_BLOB_FLAG_USE_MASK) ||
> +           !rc_blob->blob_flags)
> +               return -EINVAL;
> +
> +       if (rc_blob->blob_flags & VIRTGPU_BLOB_FLAG_USE_CROSS_DEVICE) {
> +               if (!vgdev->has_resource_assign_uuid)
> +                       return -EINVAL;
> +       }
> +
> +       switch (rc_blob->blob_mem) {
> +       case VIRTGPU_BLOB_MEM_GUEST:
> +               *guest_blob = true;
> +               break;
> +       case VIRTGPU_BLOB_MEM_HOST3D_GUEST:
> +               *guest_blob = true;
> +               fallthrough;
> +       case VIRTGPU_BLOB_MEM_HOST3D:
> +               *host3d_blob = true;
> +               break;
> +       default:
> +               return -EINVAL;
> +       }
> +
> +       if (*host3d_blob) {
> +               if (!vgdev->has_virgl_3d)
> +                       return -EINVAL;
> +
> +               /* Must be dword aligned. */
> +               if (rc_blob->cmd_size % 4 != 0)
> +                       return -EINVAL;
> +
> +               params->ctx_id = vfpriv->ctx_id;
> +               params->blob_id = rc_blob->blob_id;
> +       } else {
> +               if (rc_blob->blob_id != 0)
> +                       return -EINVAL;
> +
> +               if (rc_blob->cmd_size != 0)
> +                       return -EINVAL;
> +       }
> +
> +       params->blob_mem = rc_blob->blob_mem;
> +       params->size = rc_blob->size;
> +       params->blob = true;
> +       params->blob_flags = rc_blob->blob_flags;
> +       return 0;
> +}
> +
> +static int virtio_gpu_resource_create_blob(struct drm_device *dev,
> +                                          void *data, struct drm_file *file)
> +{
> +       int ret = 0;
> +       uint32_t handle = 0;
> +       bool guest_blob = false;
> +       bool host3d_blob = false;
> +       struct drm_gem_object *obj;
> +       struct virtio_gpu_object *bo;
> +       struct virtio_gpu_object_params params = { 0 };
> +       struct virtio_gpu_device *vgdev = dev->dev_private;
> +       struct virtio_gpu_fpriv *vfpriv = file->driver_priv;
> +       struct drm_virtgpu_resource_create_blob *rc_blob = data;
> +
> +       if (verify_blob(vgdev, vfpriv, &params, rc_blob,
> +                       &guest_blob, &host3d_blob))
> +               return -EINVAL;
> +
> +       if (vgdev->has_virgl_3d)
> +               virtio_gpu_create_context(dev, file);
> +
> +       if (rc_blob->cmd_size) {
> +               void *buf;
> +
> +               buf = memdup_user(u64_to_user_ptr(rc_blob->cmd),
> +                                 rc_blob->cmd_size);
> +
> +               if (IS_ERR(buf))
> +                       return PTR_ERR(buf);
> +
> +               virtio_gpu_cmd_submit(vgdev, buf, rc_blob->cmd_size,
> +                                     vfpriv->ctx_id, NULL, NULL);
> +       }
> +
> +       if (guest_blob)
> +               ret = virtio_gpu_object_create(vgdev, &params, &bo, NULL);
> +       else if (!guest_blob && host3d_blob)
> +               ret = virtio_gpu_vram_create(vgdev, &params, &bo);
When cmd_size != 0, a host blob has been allocated.  Will it be leaked
if virtio_gpu_{object,vram}_create fails?


> +       else
> +               return -EINVAL;
> +
> +       if (ret < 0)
> +               return ret;
> +
> +       bo->guest_blob = guest_blob;
> +       bo->host3d_blob = host3d_blob;
> +       bo->blob_mem = rc_blob->blob_mem;
> +       bo->blob_flags = rc_blob->blob_flags;
> +
> +       obj = &bo->base.base;
> +       if (params.blob_flags & VIRTGPU_BLOB_FLAG_USE_CROSS_DEVICE) {
> +               ret = virtio_gpu_resource_assign_uuid(vgdev, bo);
> +               if (ret) {
> +                       drm_gem_object_release(obj);
> +                       return ret;
> +               }
> +       }
> +
> +       ret = drm_gem_handle_create(file, obj, &handle);
> +       if (ret) {
> +               drm_gem_object_release(obj);
> +               return ret;
> +       }
> +       drm_gem_object_put(obj);
> +
> +       rc_blob->res_handle = bo->hw_res_handle;
> +       rc_blob->bo_handle = handle;
> +
> +       return 0;
> +}
> +
>  struct drm_ioctl_desc virtio_gpu_ioctls[DRM_VIRTIO_NUM_IOCTLS] = {
>         DRM_IOCTL_DEF_DRV(VIRTGPU_MAP, virtio_gpu_map_ioctl,
>                           DRM_RENDER_ALLOW),
> @@ -552,4 +684,8 @@ struct drm_ioctl_desc virtio_gpu_ioctls[DRM_VIRTIO_NUM_IOCTLS] = {
>
>         DRM_IOCTL_DEF_DRV(VIRTGPU_GET_CAPS, virtio_gpu_get_caps_ioctl,
>                           DRM_RENDER_ALLOW),
> +
> +       DRM_IOCTL_DEF_DRV(VIRTGPU_RESOURCE_CREATE_BLOB,
> +                         virtio_gpu_resource_create_blob,
> +                         DRM_RENDER_ALLOW),
>  };
> diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
> index cef79455257df..258b4eeae7c2c 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_object.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_object.c
> @@ -244,7 +244,10 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
>                 return ret;
>         }
>
> -       if (params->virgl) {
> +       if (params->blob) {
> +               virtio_gpu_cmd_resource_create_blob(vgdev, bo, params,
> +                                                   ents, nents);
> +       } else if (params->virgl) {
>                 virtio_gpu_cmd_resource_create_3d(vgdev, bo, params,
>                                                   objs, fence);
>                 virtio_gpu_object_attach(vgdev, bo, ents, nents);
> diff --git a/drivers/gpu/drm/virtio/virtgpu_vram.c b/drivers/gpu/drm/virtio/virtgpu_vram.c
> index 087945fcd230f..23c21bc4d01e2 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_vram.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_vram.c
> @@ -149,6 +149,8 @@ int virtio_gpu_vram_create(struct virtio_gpu_device *vgdev,
>                 return ret;
>         }
>
> +       virtio_gpu_cmd_resource_create_blob(vgdev, &vram->base, params, NULL,
> +                                           0);
>         if (params->blob_flags & VIRTGPU_BLOB_FLAG_USE_MAPPABLE) {
>                 ret = virtio_gpu_vram_map(&vram->base);
>                 if (ret) {
> --
> 2.26.2
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
