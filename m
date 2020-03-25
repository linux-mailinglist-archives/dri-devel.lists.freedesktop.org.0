Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B9B1932B0
	for <lists+dri-devel@lfdr.de>; Wed, 25 Mar 2020 22:31:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B4416E82B;
	Wed, 25 Mar 2020 21:31:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D69D6E82B
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Mar 2020 21:31:46 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id v3so3855756iot.11
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Mar 2020 14:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ti5pqebZBjASOepZ+b7wNwWSZu8P7d3ICC3UR3NBXfs=;
 b=qkollg5Bxd15dyQ6zQc7D8v7Gq1/suxyVJo5UiCtughRaNTRY5xke7xnx9Htdz0nYC
 ojvXaRu5pSTyP7CA9RW5nGLfer++4cfc8v6njqw2yNZM8ZI5sXPcrXzDFZY2nXo8JeKa
 e+hCeUMVSyYen6zjwWSzFFX4mC35UHFNhu0wljYESsR/67PO1tcFh9+Gj2psGnVU1mXy
 DKDkxbq4gqaR/WlcSyIhy34XiO/PcVMoOXYpu8Cyvr974UCnlIbkbdKSDmb9GPeGIH4h
 cmB45iBPVCTOT+h7JlABFMxOkv/8LxKYTry5LNRJr+yWlUTZzZt3I6cu7SahpiRVsNAI
 Fkow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ti5pqebZBjASOepZ+b7wNwWSZu8P7d3ICC3UR3NBXfs=;
 b=lH14JRCrbw9OO98gk2T59WivKC7yfbXhF+1MPzzBJR28cpNS3i4x81bvI5v99Uew+g
 sHL8UqjK+uA95NA/Ys0rRN3yhvl+jjavh4+8pu+Z7QhuyyPkO9IaQMGZbAsXvTrO5CuQ
 No7bERtkhZzOfG5Tkd+nap8pmBry6kKQqjhz/mvgnLagV1n/MLW3VgsZ7m+aKVThq5Gy
 s6/Vydor3i1S5yEgtcp9pRbhtv6v/DXR9jU2QTIFJAIsPSptdiwckCCF0GwHhMjwcvko
 FPck57jyzb3t6EN0YXIIYKJwyiGicU2sfqXMzV42TgHD0Yw3kLZ1poG8YW8GlTJ/JFwT
 exlw==
X-Gm-Message-State: ANhLgQ22J5JPdc6IjV0wbwalWgOP8v79+QD7+/en+eZHKuZ8eM/k01z7
 RIECXYU2LpygDBGPxLX4kL3RpRoq8x8BCZRTGrA=
X-Google-Smtp-Source: ADFU+vv4PalE7D7X5fiOcABbQD7txB0rA4Kc7li+wI8pvWE7cCSdPgjF7AuzCiMfUwCqRy19QvlLkqsiFOZgKHybQ8Y=
X-Received: by 2002:a02:954c:: with SMTP id y70mr4985182jah.16.1585171905759; 
 Wed, 25 Mar 2020 14:31:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAPaKu7SLyEdbzqDXxU7+Gm1Gjh2Q4C1buudmBCEHgsk6sJ5L8w@mail.gmail.com>
 <20200325004130.26766-1-gurchetansingh@chromium.org>
In-Reply-To: <20200325004130.26766-1-gurchetansingh@chromium.org>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Thu, 26 Mar 2020 05:31:33 +0800
Message-ID: <CAPaKu7ScaEefALSxqqugaUT+pLdQXcH5KupgqH1ZH5kzNJn3Vw@mail.gmail.com>
Subject: Re: [PATCH] drm/virtio: delete notify in virtio_gpu_object_create
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

On Wed, Mar 25, 2020 at 8:41 AM Gurchetan Singh
<gurchetansingh@chromium.org> wrote:
>
> For 3D buffers, virtio_gpu_gem_object_open notifies.
> We can have the same behavior for dumb buffer.  We just
> need to make sure the first open notifies the host for
> dumb buffers.
virtio_gpu_notify is cheap and does not kick unless there is a need.
I probably won't bother with adding `bool notified', which adds a
(harmless) data race.




>
> v2: virtio_gpu_gem_object_open always notifies
>
> Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
> ---
>  drivers/gpu/drm/virtio/virtgpu_drv.h    |  1 +
>  drivers/gpu/drm/virtio/virtgpu_gem.c    | 10 ++++++++--
>  drivers/gpu/drm/virtio/virtgpu_object.c |  1 -
>  3 files changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
> index 79ad176aca5a8..842200e01d785 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
> @@ -71,6 +71,7 @@ struct virtio_gpu_object {
>         uint32_t hw_res_handle;
>         bool dumb;
>         bool created;
> +       bool notified;
>  };
>  #define gem_to_virtio_gpu_obj(gobj) \
>         container_of((gobj), struct virtio_gpu_object, base.base)
> diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c b/drivers/gpu/drm/virtio/virtgpu_gem.c
> index 90c0a8ea1708c..597ddb7391fb9 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_gem.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_gem.c
> @@ -111,10 +111,13 @@ int virtio_gpu_gem_object_open(struct drm_gem_object *obj,
>  {
>         struct virtio_gpu_device *vgdev = obj->dev->dev_private;
>         struct virtio_gpu_fpriv *vfpriv = file->driver_priv;
> +       struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
>         struct virtio_gpu_object_array *objs;
>
> -       if (!vgdev->has_virgl_3d)
> -               return 0;
> +       if (!vgdev->has_virgl_3d && !bo->notified)
> +               goto out_notify;
> +       else if (!vgdev->has_virgl_3d)
> +               goto out;
>
>         objs = virtio_gpu_array_alloc(1);
>         if (!objs)
> @@ -123,7 +126,10 @@ int virtio_gpu_gem_object_open(struct drm_gem_object *obj,
>
>         virtio_gpu_cmd_context_attach_resource(vgdev, vfpriv->ctx_id,
>                                                objs);
> +out_notify:
> +       bo->notified = true;
>         virtio_gpu_notify(vgdev);
> +out:
>         return 0;
>  }
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
> index d9039bb7c5e37..51a8da7d5ef3b 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_object.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_object.c
> @@ -241,7 +241,6 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
>                 return ret;
>         }
>
> -       virtio_gpu_notify(vgdev);
>         *bo_ptr = bo;
>         return 0;
>
> --
> 2.24.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
