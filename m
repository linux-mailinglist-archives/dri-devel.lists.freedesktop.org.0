Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C27E3168B4E
	for <lists+dri-devel@lfdr.de>; Sat, 22 Feb 2020 01:54:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFF206F58B;
	Sat, 22 Feb 2020 00:54:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62AC16F58B
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2020 00:54:17 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id m30so2771597lfp.8
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 16:54:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KBFiCXB3XeBD2yKVsj/RLYxcvGTPg+9MBr3DEdg+hvw=;
 b=nXzd/Y1fARvUCZCutJ5ETLU9kQ4i6LpZeEtSCViZXJP6FY+hopdGa6xEu6MnCa/Vdb
 oTAh36j1IE/Qwip544mbQvkthOEC9QDlcWhwsikqbLGdR3B1kr+S2JQBNnah74NO4DSq
 WFt+37jnRGjnWSysdKVIg85Wx4pSY3b7JHgUw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KBFiCXB3XeBD2yKVsj/RLYxcvGTPg+9MBr3DEdg+hvw=;
 b=LxTuiu41JVytOU4OJDRRSb3ub8llfYUWlJj/AdGVh4qY5RDwQqROez4x9Tn908kb57
 Y7pE89b5xdVvAzeUA6TGT+Th1cxj46aoqewmJ+sH+qSmF1PnVdDo8NElAZCUUjpLZFgl
 VcSKmghzLXXv4h8ZZAcBsncBKosP4xk/vRbw0XmQ9z9PTFs2bTju0KBy/ew2AA2UvE46
 3yLxzdCcQz+v9ec4jupWvgdRHYZZBFADwfQYOJZGe0s8N3KMxokNQu1d4UfULr+QhOY6
 Sajo0u/9w9Sy2BXE8186Fy7y0DX0J7uKN/BfRs492VJUXwkkrvqClZ3d6Uc71ao0x2ny
 8CRA==
X-Gm-Message-State: APjAAAXzHGNnj7lTBG5ZmEmLb3FUxwpHmVx1JWaukK1ROIUTPkI+dCww
 76cAiHG8W1IGNqbwHGM2FgGqnp6eAug=
X-Google-Smtp-Source: APXvYqxS1278H/tB6RK3mCexNw+MRMzRCf0SQV/0lNzDOO+XAbSULkU51xs1DSPOc0oaXql+pBP02w==
X-Received: by 2002:a05:6512:3189:: with SMTP id
 i9mr2434082lfe.60.1582332855169; 
 Fri, 21 Feb 2020 16:54:15 -0800 (PST)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com.
 [209.85.167.48])
 by smtp.gmail.com with ESMTPSA id u22sm2427056lff.65.2020.02.21.16.54.14
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Feb 2020 16:54:14 -0800 (PST)
Received: by mail-lf1-f48.google.com with SMTP id l16so2794794lfg.2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 16:54:14 -0800 (PST)
X-Received: by 2002:a19:7b0a:: with SMTP id w10mr21273761lfc.90.1582332853905; 
 Fri, 21 Feb 2020 16:54:13 -0800 (PST)
MIME-Version: 1.0
References: <20200219223423.53319-1-gurchetansingh@chromium.org>
 <20200219223423.53319-4-gurchetansingh@chromium.org>
 <CAPaKu7QakQzeT3YrP5ctGfkAToNpq+E+qZ9pq5j-VOgTE4KYvg@mail.gmail.com>
In-Reply-To: <CAPaKu7QakQzeT3YrP5ctGfkAToNpq+E+qZ9pq5j-VOgTE4KYvg@mail.gmail.com>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Fri, 21 Feb 2020 16:54:02 -0800
X-Gmail-Original-Message-ID: <CAAfnVBkGYX6=eaViT0Qw0gecd9DJHOURaAZSvL6OVVkgE=+f2A@mail.gmail.com>
Message-ID: <CAAfnVBkGYX6=eaViT0Qw0gecd9DJHOURaAZSvL6OVVkgE=+f2A@mail.gmail.com>
Subject: Re: [PATCH 4/4 v6] drm/virtio: enqueue virtio_gpu_create_context
 after the first 3D ioctl
To: Chia-I Wu <olvaffe@gmail.com>
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

On Fri, Feb 21, 2020 at 3:06 PM Chia-I Wu <olvaffe@gmail.com> wrote:
>
> On Wed, Feb 19, 2020 at 2:34 PM Gurchetan Singh
> <gurchetansingh@chromium.org> wrote:
> >
> > For old userspace, initialization will still be implicit.
> >
> > For backwards compatibility, enqueue virtio_gpu_cmd_context_create after
> > the first 3D ioctl.
> >
> > v3: staticify virtio_gpu_create_context
> >     remove notify to batch vm-exit
> > v6: Remove nested 3D checks (emil.velikov):
> >       - unify 3D check in resource create
> >       - VIRTIO_GPU_CMD_GET_CAPSET is listed as a 2D ioctl, added a
> >         3D check there.
> I missed this change.  Why do we need a context to get capsets?  Is
> this a workaround or something?

No, don't need a context to get a capset.  The patch tries to create a
context when a 3D userspace first talks to the host, not when a 3D
userspace first needs a context ID.  If the latter is preferred, we
can do that too.

>
> >
> > Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
> > Reviewed-by: Emil Velikov <emil.velikov@collabora.com>
> > Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
> > ---
> >  drivers/gpu/drm/virtio/virtgpu_drv.h   |  2 --
> >  drivers/gpu/drm/virtio/virtgpu_ioctl.c | 32 +++++++++++++++-----------
> >  drivers/gpu/drm/virtio/virtgpu_kms.c   |  1 -
> >  3 files changed, 19 insertions(+), 16 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
> > index 76b7b7c30e10..95a7443baaba 100644
> > --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
> > +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
> > @@ -216,8 +216,6 @@ struct virtio_gpu_fpriv {
> >  /* virtio_ioctl.c */
> >  #define DRM_VIRTIO_NUM_IOCTLS 10
> >  extern struct drm_ioctl_desc virtio_gpu_ioctls[DRM_VIRTIO_NUM_IOCTLS];
> > -void virtio_gpu_create_context(struct drm_device *dev,
> > -                              struct drm_file *file);
> >
> >  /* virtio_kms.c */
> >  int virtio_gpu_init(struct drm_device *dev);
> > diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> > index ec38cf5573aa..c36faa572caa 100644
> > --- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> > +++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> > @@ -33,8 +33,8 @@
> >
> >  #include "virtgpu_drv.h"
> >
> > -void virtio_gpu_create_context(struct drm_device *dev,
> > -                              struct drm_file *file)
> > +static void virtio_gpu_create_context(struct drm_device *dev,
> > +                                     struct drm_file *file)
> >  {
> >         struct virtio_gpu_device *vgdev = dev->dev_private;
> >         struct virtio_gpu_fpriv *vfpriv = file->driver_priv;
> > @@ -95,6 +95,7 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
> >
> >         exbuf->fence_fd = -1;
> >
> > +       virtio_gpu_create_context(dev, file);
> >         if (exbuf->flags & VIRTGPU_EXECBUF_FENCE_FD_IN) {
> >                 struct dma_fence *in_fence;
> >
> > @@ -233,7 +234,17 @@ static int virtio_gpu_resource_create_ioctl(struct drm_device *dev, void *data,
> >         uint32_t handle = 0;
> >         struct virtio_gpu_object_params params = { 0 };
> >
> > -       if (vgdev->has_virgl_3d == false) {
> > +       if (vgdev->has_virgl_3d) {
> > +               virtio_gpu_create_context(dev, file);
> > +               params.virgl = true;
> > +               params.target = rc->target;
> > +               params.bind = rc->bind;
> > +               params.depth = rc->depth;
> > +               params.array_size = rc->array_size;
> > +               params.last_level = rc->last_level;
> > +               params.nr_samples = rc->nr_samples;
> > +               params.flags = rc->flags;
> > +       } else {
> >                 if (rc->depth > 1)
> >                         return -EINVAL;
> >                 if (rc->nr_samples > 1)
> > @@ -250,16 +261,6 @@ static int virtio_gpu_resource_create_ioctl(struct drm_device *dev, void *data,
> >         params.width = rc->width;
> >         params.height = rc->height;
> >         params.size = rc->size;
> > -       if (vgdev->has_virgl_3d) {
> > -               params.virgl = true;
> > -               params.target = rc->target;
> > -               params.bind = rc->bind;
> > -               params.depth = rc->depth;
> > -               params.array_size = rc->array_size;
> > -               params.last_level = rc->last_level;
> > -               params.nr_samples = rc->nr_samples;
> > -               params.flags = rc->flags;
> > -       }
> >         /* allocate a single page size object */
> >         if (params.size == 0)
> >                 params.size = PAGE_SIZE;
> > @@ -319,6 +320,7 @@ static int virtio_gpu_transfer_from_host_ioctl(struct drm_device *dev,
> >         if (vgdev->has_virgl_3d == false)
> >                 return -ENOSYS;
> >
> > +       virtio_gpu_create_context(dev, file);
> >         objs = virtio_gpu_array_from_handles(file, &args->bo_handle, 1);
> >         if (objs == NULL)
> >                 return -ENOENT;
> > @@ -367,6 +369,7 @@ static int virtio_gpu_transfer_to_host_ioctl(struct drm_device *dev, void *data,
> >                          args->box.w, args->box.h, args->box.x, args->box.y,
> >                          objs, NULL);
> >         } else {
> > +               virtio_gpu_create_context(dev, file);
> >                 ret = virtio_gpu_array_lock_resv(objs);
> >                 if (ret != 0)
> >                         goto err_put_free;
> > @@ -466,6 +469,9 @@ static int virtio_gpu_get_caps_ioctl(struct drm_device *dev,
> >         }
> >         spin_unlock(&vgdev->display_info_lock);
> >
> > +       if (vgdev->has_virgl_3d)
> > +               virtio_gpu_create_context(dev, file);
> > +
> >         /* not in cache - need to talk to hw */
> >         virtio_gpu_cmd_get_capset(vgdev, found_valid, args->cap_set_ver,
> >                                   &cache_ent);
> > diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
> > index 424729cb81d1..023a030ca7b9 100644
> > --- a/drivers/gpu/drm/virtio/virtgpu_kms.c
> > +++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
> > @@ -268,7 +268,6 @@ int virtio_gpu_driver_open(struct drm_device *dev, struct drm_file *file)
> >
> >         vfpriv->ctx_id = handle + 1;
> >         file->driver_priv = vfpriv;
> > -       virtio_gpu_create_context(dev, file);
> >         return 0;
> >  }
> >
> > --
> > 2.25.0.265.gbab2e86ba0-goog
> >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
