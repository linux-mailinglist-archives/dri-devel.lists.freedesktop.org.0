Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E061A364ED
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 18:46:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6FFF10ED28;
	Fri, 14 Feb 2025 17:46:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fM6V42Xf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
 [209.85.166.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A840D10ED28
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 17:46:03 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id
 ca18e2360f4ac-8552ae0fc4dso179443639f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 09:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739555163; x=1740159963; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MdHmmXoGeu+JiG7O9/5MQZwbG+iCEqiFjAryJoBKTeE=;
 b=fM6V42XfS3X0QPoXMQuEBNwxpgIWJxRauGVTuR59D1gRRE6X2cHY/Ik7Ht8gI/NTGS
 kGbWTyjbgbIOrY0TYLhuSxrqzrt9eyj3rkvdQR9HS17D4p+/MpL0ej+s+5qG0Mh7XExb
 P5CXRtA0h9Wx8nf2gMNlJakYKRecyMoJnRCDw6FAIcXjLNfE4wZn35pb2XesgaUFOHqt
 XttcgmAKAGbPI2Zr73u+FsYG3fIhmsrdBsT0aEsBJoWnrSCoL6F6qdR/hJ6Wj25leMnf
 HUaA7+UodR++LH8e25tPlY6GcZlZtIFbB6ral6AVOoItzxls+i3sTZsQfKZLDkZB9+Vu
 kyLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739555163; x=1740159963;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MdHmmXoGeu+JiG7O9/5MQZwbG+iCEqiFjAryJoBKTeE=;
 b=RgBglpO9dNSCAQ2l0oRqvlbgHBTwvwow3jqwGWfPqlAfNngEhUJf5ru0/DH5atZKLk
 FwMLp0OwLphhku/KCcV3Lf6qCcaSVwvb5FQOR+MfNvtSgugHUFv89z+h63hgytL+L+Dm
 il+sPw7e52K43L0icw9NLBCK0P3Q1pf+0GIjWeLkMOVUqifb+fNdSmMsCBMaAes+GtmX
 Kaiu8mr+/LfXg8mW1RIofI2um6+AN6ZduZJAOOz8Lj0kD31dlW9zx1VWWzK/WX9XTryj
 Ud4FNJ6fj4OkZFpmn6GzLWBdqNFChHh4JpGJd9ayWZVyz+ulcC5YIvNHrGmp5u733Anj
 cZAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBOPGXVpyv224r9Yx/8vrbv0lZCT6hBFzesvyRIjw8vXtihigyHtFsee64620/0B9Jiafzq7U9Y6Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzYOeuHfieY93onc7sah7WM+jz/bynoGvAgkbNpVCULLlFxR1wR
 VqALAdR+ymVW5kdz8fxh7Jfk9wV0GbUe4PXmcdiCewxSVY4vgob9ytpEYIBoh/gtl292uU5T1fh
 aDKaMpzgWAtkuSvsExXndl/ohhTI=
X-Gm-Gg: ASbGnctws47/W+WZo+5hS+wSROtPonQ1s8H6+1JUIhBz4AxzxQ0jGBWA63mhid1iOpJ
 W3bmpDAx8hkYTyCxSYjX7jRnlofccU80KGu15SOfFgVKA5kWTA6tb3d1dn6w/87qZTOdPbn1kcU
 bb8+ZK34zk7wh44sxWZ9tboD06wA==
X-Google-Smtp-Source: AGHT+IGJFHvnSl9GTHyqhkKVxMP/sSpy01siSVjv+TjhYmIRjgndz+v/byVwlFWN9Q72CCZtRy1DDX8TCXIzWp8/Ges=
X-Received: by 2002:a05:6e02:170d:b0:3d0:1932:7695 with SMTP id
 e9e14a558f8ab-3d28088690fmr2314105ab.8.1739555162697; Fri, 14 Feb 2025
 09:46:02 -0800 (PST)
MIME-Version: 1.0
References: <20250126204239.474847-1-dmitry.osipenko@collabora.com>
In-Reply-To: <20250126204239.474847-1-dmitry.osipenko@collabora.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 14 Feb 2025 09:45:50 -0800
X-Gm-Features: AWEUYZlbQzYhMxEmBtfBqEpXdqgRBTAayEgifmUEUg9bYiGnlInLT6pNk87gOSE
Message-ID: <CAF6AEGsHY+kh-k+=FqNzf=d=60JqkfFC=+U039XYK-7dTkXZmA@mail.gmail.com>
Subject: Re: [PATCH v1] drm/virtio: Extend blob UAPI with deferred-mapping
 hinting
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, 
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Asahi Lina <lina@asahilina.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, dri-devel@lists.freedesktop.org, 
 virtualization@lists.linux.dev, linux-kernel@vger.kernel.org, 
 kernel@collabora.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jan 26, 2025 at 12:43=E2=80=AFPM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> If userspace never maps GEM object, then BO wastes hostmem space
> because VirtIO-GPU driver maps VRAM BO at the BO's creating time.
>
> Make mappings on-demand by adding new RESOURCE_CREATE_BLOB IOCTL/UAPI
> hinting flag telling that host mapping should be deferred until first
> mapping is made when the flag is set by userspace.
>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

I suppose we could have just added a new blob_flag, but then userspace
would need to probe the kernel to see whether the new flag was
supported.  (Which isn't a big deal, that sort of thing is done in
many places.)  But extending the struct does make it more transparent
to userspace.  Either way,

Reviewed-by: Rob Clark <robdclark@gmail.com


> ---
>  drivers/gpu/drm/virtio/virtgpu_drv.h   |  2 ++
>  drivers/gpu/drm/virtio/virtgpu_gem.c   |  9 ++++++++
>  drivers/gpu/drm/virtio/virtgpu_ioctl.c |  1 +
>  drivers/gpu/drm/virtio/virtgpu_vram.c  | 30 +++++++++++++++++++++-----
>  include/uapi/drm/virtgpu_drm.h         |  4 ++++
>  5 files changed, 41 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virti=
o/virtgpu_drv.h
> index 64c236169db8..e5db91a3e8ba 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
> @@ -85,6 +85,7 @@ struct virtio_gpu_object_params {
>         uint32_t blob_mem;
>         uint32_t blob_flags;
>         uint64_t blob_id;
> +       uint32_t blob_hints;
>  };
>
>  struct virtio_gpu_object {
> @@ -483,6 +484,7 @@ struct sg_table *virtio_gpu_vram_map_dma_buf(struct v=
irtio_gpu_object *bo,
>  void virtio_gpu_vram_unmap_dma_buf(struct device *dev,
>                                    struct sg_table *sgt,
>                                    enum dma_data_direction dir);
> +void virtio_gpu_vram_map_deferred(struct virtio_gpu_object_vram *vram);
>
>  /* virtgpu_submit.c */
>  int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
> diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c b/drivers/gpu/drm/virti=
o/virtgpu_gem.c
> index 7db48d17ee3a..c902b68cc25a 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_gem.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_gem.c
> @@ -103,12 +103,21 @@ int virtio_gpu_mode_dumb_mmap(struct drm_file *file=
_priv,
>                               struct drm_device *dev,
>                               uint32_t handle, uint64_t *offset_p)
>  {
> +       struct virtio_gpu_object_vram *vram;
> +       struct virtio_gpu_object *bo;
>         struct drm_gem_object *gobj;
>
>         BUG_ON(!offset_p);
>         gobj =3D drm_gem_object_lookup(file_priv, handle);
>         if (gobj =3D=3D NULL)
>                 return -ENOENT;
> +
> +       bo =3D gem_to_virtio_gpu_obj(gobj);
> +       if (virtio_gpu_is_vram(bo)) {
> +               vram =3D to_virtio_gpu_vram(bo);
> +               virtio_gpu_vram_map_deferred(vram);
> +       }
> +
>         *offset_p =3D drm_vma_node_offset_addr(&gobj->vma_node);
>         drm_gem_object_put(gobj);
>         return 0;
> diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/vir=
tio/virtgpu_ioctl.c
> index e4f76f315550..51544ee8d3c3 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> @@ -489,6 +489,7 @@ static int verify_blob(struct virtio_gpu_device *vgde=
v,
>         params->size =3D rc_blob->size;
>         params->blob =3D true;
>         params->blob_flags =3D rc_blob->blob_flags;
> +       params->blob_hints =3D rc_blob->blob_hints;
>         return 0;
>  }
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_vram.c b/drivers/gpu/drm/virt=
io/virtgpu_vram.c
> index 25df81c02783..d72c93e06a4a 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_vram.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_vram.c
> @@ -41,6 +41,11 @@ static int virtio_gpu_vram_mmap(struct drm_gem_object =
*obj,
>         if (!(bo->blob_flags & VIRTGPU_BLOB_FLAG_USE_MAPPABLE))
>                 return -EINVAL;
>
> +       virtio_gpu_vram_map_deferred(vram);
> +
> +       if (vram->map_state =3D=3D STATE_INITIALIZING)
> +               virtio_gpu_notify(vgdev);
> +
>         wait_event(vgdev->resp_wq, vram->map_state !=3D STATE_INITIALIZIN=
G);
>         if (vram->map_state !=3D STATE_OK)
>                 return -EINVAL;
> @@ -215,14 +220,29 @@ int virtio_gpu_vram_create(struct virtio_gpu_device=
 *vgdev,
>
>         virtio_gpu_cmd_resource_create_blob(vgdev, &vram->base, params, N=
ULL,
>                                             0);
> -       if (params->blob_flags & VIRTGPU_BLOB_FLAG_USE_MAPPABLE) {
> -               ret =3D virtio_gpu_vram_map(&vram->base);
> -               if (ret) {
> -                       virtio_gpu_vram_free(obj);
> -                       return ret;
> +       if (!(params->blob_hints & DRM_VIRTGPU_BLOB_FLAG_HINT_DEFER_MAPPI=
NG)) {
> +               if (params->blob_flags & VIRTGPU_BLOB_FLAG_USE_MAPPABLE) =
{
> +                       ret =3D virtio_gpu_vram_map(&vram->base);
> +                       if (ret) {
> +                               virtio_gpu_vram_free(obj);
> +                               return ret;
> +                       }
>                 }
>         }
>
>         *bo_ptr =3D &vram->base;
>         return 0;
>  }
> +
> +void virtio_gpu_vram_map_deferred(struct virtio_gpu_object_vram *vram)
> +{
> +       static DEFINE_MUTEX(map_lock);
> +
> +       if (!(vram->base.blob_flags & VIRTGPU_BLOB_FLAG_USE_MAPPABLE))
> +               return;
> +
> +       mutex_lock(&map_lock);
> +       if (!drm_mm_node_allocated(&vram->vram_node))
> +               virtio_gpu_vram_map(&vram->base);
> +       mutex_unlock(&map_lock);
> +}
> diff --git a/include/uapi/drm/virtgpu_drm.h b/include/uapi/drm/virtgpu_dr=
m.h
> index c2ce71987e9b..3004a1d08570 100644
> --- a/include/uapi/drm/virtgpu_drm.h
> +++ b/include/uapi/drm/virtgpu_drm.h
> @@ -194,6 +194,10 @@ struct drm_virtgpu_resource_create_blob {
>         __u32 cmd_size;
>         __u64 cmd;
>         __u64 blob_id;
> +
> +#define DRM_VIRTGPU_BLOB_FLAG_HINT_DEFER_MAPPING        0x0001
> +       __u32 blob_hints;
> +       __u32 pad2;
>  };
>
>  #define VIRTGPU_CONTEXT_PARAM_CAPSET_ID       0x0001
> --
> 2.47.1
>
