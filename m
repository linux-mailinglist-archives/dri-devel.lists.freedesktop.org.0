Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0F567E9CE
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 16:44:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE12E10E9A8;
	Fri, 27 Jan 2023 15:44:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CCA210E9A5
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 15:44:30 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-15ff0a1f735so6927976fac.5
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 07:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=L5WWz9fhXxpXg6EmN48bNkcnM7o/dG+N+CVzIWey7Ow=;
 b=kB3eWzbBuevretKVLNQIc6LnDaUJHg5dX47XzvPpviB+kLJMTkhi9hl2bFF0hxzGc3
 1bmSwTNoKR8A+Z6O5ncrKR7CxOx7fXA75d3uTgdaCsreaoy//RN8rK0DyYDVGqmY6LLt
 2y/4h4bK8kJRWJYGcCig26s7uh0mZE/pdqy0ewstsusrnvnbrfiBYZr8IMxGJEMdYHzc
 M8lj0oIw3aH87LgaDDhE600YKPSJuZ3DWbAOKOMnNgnxlvpgh3tA7/4TZlDV8iWk7HAB
 +x6U3xQnbA/mApF+QruzLba0Dk/H/cWlrGCJ3tWceCwlFNM/X6mKz9KmRccQb5RxqJQo
 i47w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=L5WWz9fhXxpXg6EmN48bNkcnM7o/dG+N+CVzIWey7Ow=;
 b=SQFeaYkw0Lb5nxmyibNebO3Rtoahog3O0MisNEikkZlmna524GQ0kL4Tx3K7cQc0sF
 y49Nnz/j2GGFLsbw5kUsTrwfN+8th2gTtDgGHZG9nes3h835RF27R1QaJuKhSrHJGH/5
 IdvMg/JANOqieaelveq2ZsWHtiBXSSixXqD4CoiM4/iTIFFLg33ABOCkpp7AvWIZbFXF
 xxiohiJHcbl3a4ClBIfKXAsHAeMQTu/DW9K2iqgLdu7bMHhh9u4yuuKS5Yw9NnSTS5C2
 T5Wl5w8GuGZU0721oeEvqqp8ycGeWMkopw5/qYOKe8vMCDxbBE2F+Hum/NzqVT2pvaX3
 +eWg==
X-Gm-Message-State: AFqh2kq6nRCxHBSx+Piwg1ac/yqfZOV7AfObiLpyHkJHchF3Z0NFw4T1
 XFvvByOVFjoWOyDsMpJDK7hadl8rYq0L6HjLzQk=
X-Google-Smtp-Source: AMrXdXup/oiP7Q12YFafrFfdB69dMqfoWyegvyVl2UR664bFNRQnR7IiR+R5erW+114UUEr4FAe2K42dz+pOGsd06QE=
X-Received: by 2002:a05:6870:44d0:b0:15b:96b8:e2be with SMTP id
 t16-20020a05687044d000b0015b96b8e2bemr2505559oai.38.1674834269272; Fri, 27
 Jan 2023 07:44:29 -0800 (PST)
MIME-Version: 1.0
References: <20230126225815.1518839-1-ryanneph@chromium.org>
In-Reply-To: <20230126225815.1518839-1-ryanneph@chromium.org>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 27 Jan 2023 07:44:17 -0800
Message-ID: <CAF6AEGtQ1nsHZtigJs4ABe=3ibqbWJgWXzfPjypBcQZ8vgZekg@mail.gmail.com>
Subject: Re: [PATCH] drm/virtio: exbuf->fence_fd unmodified on interrupted wait
To: Ryan Neph <ryanneph@chromium.org>
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
Cc: Rob Clark <robdclark@chromium.org>, Robert Foss <robert.foss@collabora.com>,
 Yiwei Zhang <zzyiwei@chromium.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Gurchetan Singh <gurchetansingh@chromium.org>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Gerd Hoffmann <kraxel@redhat.com>, David Airlie <airlied@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Emil Velikov <emil.velikov@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 27, 2023 at 12:31 AM Ryan Neph <ryanneph@chromium.org> wrote:
>
> An interrupted dma_fence_wait() becomes an -ERESTARTSYS returned
> to userspace ioctl(DRM_IOCTL_VIRTGPU_EXECBUFFER) calls, prompting to
> retry the ioctl(), but the passed exbuf->fence_fd has been reset to -1,
> making the retry attempt fail at sync_file_get_fence().
>
> The uapi for DRM_IOCTL_VIRTGPU_EXECBUFFER is changed to retain the
> passed value for exbuf->fence_fd when returning ERESTARTSYS or EINTR.
>
> Fixes: 2cd7b6f08bc4 ("drm/virtio: add in/out fence support for explicit synchronization")
> Signed-off-by: Ryan Neph <ryanneph@chromium.org>

Reviewed-by: Rob Clark <robdclark@gmail.com>

> ---
>
>  drivers/gpu/drm/virtio/virtgpu_ioctl.c | 9 ++++++---
>  include/uapi/drm/virtgpu_drm.h         | 3 +++
>  2 files changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> index 9f4a90493aea..ffce4e2a409a 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> @@ -132,6 +132,8 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
>         uint64_t fence_ctx;
>         uint32_t ring_idx;
>
> +       exbuf->fence_fd = -1;
> +
>         fence_ctx = vgdev->fence_drv.context;
>         ring_idx = 0;
>
> @@ -152,8 +154,6 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
>                 ring_idx = exbuf->ring_idx;
>         }
>
> -       exbuf->fence_fd = -1;
> -
>         virtio_gpu_create_context(dev, file);
>         if (exbuf->flags & VIRTGPU_EXECBUF_FENCE_FD_IN) {
>                 struct dma_fence *in_fence;
> @@ -173,7 +173,7 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
>
>                 dma_fence_put(in_fence);
>                 if (ret)
> -                       return ret;
> +                       goto out_err;
>         }
>
>         if (exbuf->flags & VIRTGPU_EXECBUF_FENCE_FD_OUT) {
> @@ -259,6 +259,9 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
>
>         if (out_fence_fd >= 0)
>                 put_unused_fd(out_fence_fd);
> +out_err:
> +       if (ret == -EINTR || ret == -ERESTARTSYS)
> +               exbuf->fence_fd = in_fence_fd;
>
>         return ret;
>  }
> diff --git a/include/uapi/drm/virtgpu_drm.h b/include/uapi/drm/virtgpu_drm.h
> index 0512fde5e697..ac8d1eed12ab 100644
> --- a/include/uapi/drm/virtgpu_drm.h
> +++ b/include/uapi/drm/virtgpu_drm.h
> @@ -64,6 +64,9 @@ struct drm_virtgpu_map {
>         __u32 pad;
>  };
>
> +/* For ioctl() returning ERESTARTSYS or EINTR, fence_fd is unmodified.
> + * For all other errors it is set to -1.
> + */
>  struct drm_virtgpu_execbuffer {
>         __u32 flags;
>         __u32 size;
> --
> 2.39.1.456.gfc5497dd1b-goog
>
