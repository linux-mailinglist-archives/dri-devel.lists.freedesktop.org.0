Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E335E25CD44
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 00:12:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42DB16E0CC;
	Thu,  3 Sep 2020 22:12:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D90026E0CC
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 22:12:45 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id s205so5610060lja.7
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Sep 2020 15:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bhS/ptDJRdnTt3SH+QTGWzrYWnz437pYM3XunaayGOA=;
 b=BlBfey02C+sFMhZ1xOHrXCSqsu3Ht/FsyoEa/OqssKAwrMVwE1h9w6/HSbzaZc5HXH
 aOwOzhwEojB5iZz01lU2KDNyEHZ0NZ6LyjId9bCrFi7/0Uq3UbgiWOnY4dETVk+Yygyu
 D9rEJ3lKvA1yzMgNZgtFrbug9JW/aVnt2Tsao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bhS/ptDJRdnTt3SH+QTGWzrYWnz437pYM3XunaayGOA=;
 b=sD/jeeRebxa82ARi4t9cFt6y6xSByYKBU7MBaJLyaP1tRVtGD9Det4ftvi/FXLOjwF
 iadoF1TUtykpNqpHu76Es98WrghjbFED54DuQToKnz7HfON3hnKmUllHYHg7753VBtEz
 DvKEFjqYXwy1N5gbBDcz8Ci2IRftYrXgWoCNY1aNhNhKiu3WnZxDnu1X/Ay778Qo3DST
 S9g9MRSmTPDT0IxuGuHUOYqvxHBbdYpnK/otSdrL98lHv4G4azNySPbrFZHaMJq6rUZ8
 07nnNLKDqE8UfL0f3m9spcep/+ocRK+bBfPh2y3Zqgr/zqFxYp0n/oYeLz7voVWEZWmi
 +HBg==
X-Gm-Message-State: AOAM530Bpw6i6a3t6DcCbCjXpHRLJOmC0lbtBRBDkzIcGIBucGV2ae+b
 8bd818x5HHC8LYOlEeZWsB+CAq0I8tYzyg==
X-Google-Smtp-Source: ABdhPJxB9GdsHzeH1stCdJ7CubtvLzrzmCZf6qCCRgVO8fJKkeSXsSMp7QZ8RbMx2JHB88GIWQqQIg==
X-Received: by 2002:a2e:9943:: with SMTP id r3mr2226895ljj.342.1599171163718; 
 Thu, 03 Sep 2020 15:12:43 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com.
 [209.85.208.181])
 by smtp.gmail.com with ESMTPSA id y4sm859928ljk.61.2020.09.03.15.12.42
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Sep 2020 15:12:42 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id c2so5560153ljj.12
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Sep 2020 15:12:42 -0700 (PDT)
X-Received: by 2002:a2e:7a04:: with SMTP id v4mr2408205ljc.128.1599171162385; 
 Thu, 03 Sep 2020 15:12:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200902210847.2689-1-gurchetansingh@chromium.org>
 <20200902210847.2689-23-gurchetansingh@chromium.org>
 <CAPaKu7Riurr-+O8Kdi=e2+ivG=P2L1CKGtu8cXGpSjnC34pYPw@mail.gmail.com>
In-Reply-To: <CAPaKu7Riurr-+O8Kdi=e2+ivG=P2L1CKGtu8cXGpSjnC34pYPw@mail.gmail.com>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Thu, 3 Sep 2020 15:12:23 -0700
X-Gmail-Original-Message-ID: <CAAfnVBkDsMK038dU53hGUt3voqi4x_HtOV0kHV+CkonfGaehCg@mail.gmail.com>
Message-ID: <CAAfnVBkDsMK038dU53hGUt3voqi4x_HtOV0kHV+CkonfGaehCg@mail.gmail.com>
Subject: Re: [PATCH v2 22/23] drm/virtio: implement blob resources: resource
 create blob ioctl
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
Cc: virtio-dev@lists.oasis-open.org,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1268056754=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1268056754==
Content-Type: multipart/alternative; boundary="000000000000120e5305ae700db6"

--000000000000120e5305ae700db6
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 3, 2020 at 2:11 PM Chia-I Wu <olvaffe@gmail.com> wrote:

> On Wed, Sep 2, 2020 at 2:09 PM Gurchetan Singh
> <gurchetansingh@chromium.org> wrote:
> >
> > From: Gerd Hoffmann <kraxel@redhat.com>
> >
> > Implement resource create blob as specified.
> >
> > Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> > Co-developed-by: Gurchetan Singh <gurchetansingh@chromium.org>
> > Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
> > Acked-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> > ---
> >  drivers/gpu/drm/virtio/virtgpu_drv.h    |   4 +-
> >  drivers/gpu/drm/virtio/virtgpu_ioctl.c  | 136 ++++++++++++++++++++++++
> >  drivers/gpu/drm/virtio/virtgpu_object.c |   5 +-
> >  drivers/gpu/drm/virtio/virtgpu_vram.c   |   2 +
> >  4 files changed, 144 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h
> b/drivers/gpu/drm/virtio/virtgpu_drv.h
> > index 6162865c162df..d2ea199dbdb90 100644
> > --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
> > +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
> > @@ -257,8 +257,8 @@ struct virtio_gpu_fpriv {
> >         struct mutex context_lock;
> >  };
> >
> > -/* virtgpu_ioctl.c */
> > -#define DRM_VIRTIO_NUM_IOCTLS 10
> > +/* virtio_ioctl.c */
> > +#define DRM_VIRTIO_NUM_IOCTLS 11
> >  extern struct drm_ioctl_desc virtio_gpu_ioctls[DRM_VIRTIO_NUM_IOCTLS];
> >  void virtio_gpu_create_context(struct drm_device *dev, struct drm_file
> *file);
> >
> > diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> > index 7dbe24248a200..442cbca59c8a5 100644
> > --- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> > +++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> > @@ -34,6 +34,10 @@
> >
> >  #include "virtgpu_drv.h"
> >
> > +#define VIRTGPU_BLOB_FLAG_USE_MASK (VIRTGPU_BLOB_FLAG_USE_MAPPABLE | \
> > +                                   VIRTGPU_BLOB_FLAG_USE_SHAREABLE | \
> > +                                   VIRTGPU_BLOB_FLAG_USE_CROSS_DEVICE)
> > +
> >  void virtio_gpu_create_context(struct drm_device *dev, struct drm_file
> *file)
> >  {
> >         struct virtio_gpu_device *vgdev = dev->dev_private;
> > @@ -520,6 +524,134 @@ static int virtio_gpu_get_caps_ioctl(struct
> drm_device *dev,
> >         return 0;
> >  }
> >
> > +static int verify_blob(struct virtio_gpu_device *vgdev,
> > +                      struct virtio_gpu_fpriv *vfpriv,
> > +                      struct virtio_gpu_object_params *params,
> > +                      struct drm_virtgpu_resource_create_blob *rc_blob,
> > +                      bool *guest_blob, bool *host3d_blob)
> > +{
> > +       if (!vgdev->has_resource_blob)
> > +               return -EINVAL;
> > +
> > +       if ((rc_blob->blob_flags & ~VIRTGPU_BLOB_FLAG_USE_MASK) ||
> > +           !rc_blob->blob_flags)
> > +               return -EINVAL;
> > +
> > +       if (rc_blob->blob_flags & VIRTGPU_BLOB_FLAG_USE_CROSS_DEVICE) {
> > +               if (!vgdev->has_resource_assign_uuid)
> > +                       return -EINVAL;
> > +       }
> > +
> > +       switch (rc_blob->blob_mem) {
> > +       case VIRTGPU_BLOB_MEM_GUEST:
> > +               *guest_blob = true;
> > +               break;
> > +       case VIRTGPU_BLOB_MEM_HOST3D_GUEST:
> > +               *guest_blob = true;
> > +               fallthrough;
> > +       case VIRTGPU_BLOB_MEM_HOST3D:
> > +               *host3d_blob = true;
> > +               break;
> > +       default:
> > +               return -EINVAL;
> > +       }
> > +
> > +       if (*host3d_blob) {
> > +               if (!vgdev->has_virgl_3d)
> > +                       return -EINVAL;
> > +
> > +               /* Must be dword aligned. */
> > +               if (rc_blob->cmd_size % 4 != 0)
> > +                       return -EINVAL;
> > +
> > +               params->ctx_id = vfpriv->ctx_id;
> > +               params->blob_id = rc_blob->blob_id;
> > +       } else {
> > +               if (rc_blob->blob_id != 0)
> > +                       return -EINVAL;
> > +
> > +               if (rc_blob->cmd_size != 0)
> > +                       return -EINVAL;
> > +       }
> > +
> > +       params->blob_mem = rc_blob->blob_mem;
> > +       params->size = rc_blob->size;
> > +       params->blob = true;
> > +       params->blob_flags = rc_blob->blob_flags;
> > +       return 0;
> > +}
> > +
> > +static int virtio_gpu_resource_create_blob(struct drm_device *dev,
> > +                                          void *data, struct drm_file
> *file)
> > +{
> > +       int ret = 0;
> > +       uint32_t handle = 0;
> > +       bool guest_blob = false;
> > +       bool host3d_blob = false;
> > +       struct drm_gem_object *obj;
> > +       struct virtio_gpu_object *bo;
> > +       struct virtio_gpu_object_params params = { 0 };
> > +       struct virtio_gpu_device *vgdev = dev->dev_private;
> > +       struct virtio_gpu_fpriv *vfpriv = file->driver_priv;
> > +       struct drm_virtgpu_resource_create_blob *rc_blob = data;
> > +
> > +       if (verify_blob(vgdev, vfpriv, &params, rc_blob,
> > +                       &guest_blob, &host3d_blob))
> > +               return -EINVAL;
> > +
> > +       if (vgdev->has_virgl_3d)
> > +               virtio_gpu_create_context(dev, file);
> > +
> > +       if (rc_blob->cmd_size) {
> > +               void *buf;
> > +
> > +               buf = memdup_user(u64_to_user_ptr(rc_blob->cmd),
> > +                                 rc_blob->cmd_size);
> > +
> > +               if (IS_ERR(buf))
> > +                       return PTR_ERR(buf);
> > +
> > +               virtio_gpu_cmd_submit(vgdev, buf, rc_blob->cmd_size,
> > +                                     vfpriv->ctx_id, NULL, NULL);
> > +       }
> > +
> > +       if (guest_blob)
> > +               ret = virtio_gpu_object_create(vgdev, &params, &bo,
> NULL);
> > +       else if (!guest_blob && host3d_blob)
> > +               ret = virtio_gpu_vram_create(vgdev, &params, &bo);
> When cmd_size != 0, a host blob has been allocated.  Will it be leaked
> if virtio_gpu_{object,vram}_create fails?
>

The actual kick happens as a result of drm_gem_handle_create (similar to
drm_virtgpu_resource_create), so the host-side allocation doesn't happen if
the virtio_gpu_{object,vram}_create sanity checks fail.  We could unqueue
items from the virtqueue on the failure cases, but blob is big enough
already and userspace doesn't really recover gracefully if an ioctl fails
either.


>
> > +       else
> > +               return -EINVAL;
> > +
> > +       if (ret < 0)
> > +               return ret;
> > +
> > +       bo->guest_blob = guest_blob;
> > +       bo->host3d_blob = host3d_blob;
> > +       bo->blob_mem = rc_blob->blob_mem;
> > +       bo->blob_flags = rc_blob->blob_flags;
> > +
> > +       obj = &bo->base.base;
> > +       if (params.blob_flags & VIRTGPU_BLOB_FLAG_USE_CROSS_DEVICE) {
> > +               ret = virtio_gpu_resource_assign_uuid(vgdev, bo);
> > +               if (ret) {
> > +                       drm_gem_object_release(obj);
> > +                       return ret;
> > +               }
> > +       }
> > +
> > +       ret = drm_gem_handle_create(file, obj, &handle);
> > +       if (ret) {
> > +               drm_gem_object_release(obj);
> > +               return ret;
> > +       }
> > +       drm_gem_object_put(obj);
> > +
> > +       rc_blob->res_handle = bo->hw_res_handle;
> > +       rc_blob->bo_handle = handle;
> > +
> > +       return 0;
> > +}
> > +
> >  struct drm_ioctl_desc virtio_gpu_ioctls[DRM_VIRTIO_NUM_IOCTLS] = {
> >         DRM_IOCTL_DEF_DRV(VIRTGPU_MAP, virtio_gpu_map_ioctl,
> >                           DRM_RENDER_ALLOW),
> > @@ -552,4 +684,8 @@ struct drm_ioctl_desc
> virtio_gpu_ioctls[DRM_VIRTIO_NUM_IOCTLS] = {
> >
> >         DRM_IOCTL_DEF_DRV(VIRTGPU_GET_CAPS, virtio_gpu_get_caps_ioctl,
> >                           DRM_RENDER_ALLOW),
> > +
> > +       DRM_IOCTL_DEF_DRV(VIRTGPU_RESOURCE_CREATE_BLOB,
> > +                         virtio_gpu_resource_create_blob,
> > +                         DRM_RENDER_ALLOW),
> >  };
> > diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c
> b/drivers/gpu/drm/virtio/virtgpu_object.c
> > index cef79455257df..258b4eeae7c2c 100644
> > --- a/drivers/gpu/drm/virtio/virtgpu_object.c
> > +++ b/drivers/gpu/drm/virtio/virtgpu_object.c
> > @@ -244,7 +244,10 @@ int virtio_gpu_object_create(struct
> virtio_gpu_device *vgdev,
> >                 return ret;
> >         }
> >
> > -       if (params->virgl) {
> > +       if (params->blob) {
> > +               virtio_gpu_cmd_resource_create_blob(vgdev, bo, params,
> > +                                                   ents, nents);
> > +       } else if (params->virgl) {
> >                 virtio_gpu_cmd_resource_create_3d(vgdev, bo, params,
> >                                                   objs, fence);
> >                 virtio_gpu_object_attach(vgdev, bo, ents, nents);
> > diff --git a/drivers/gpu/drm/virtio/virtgpu_vram.c
> b/drivers/gpu/drm/virtio/virtgpu_vram.c
> > index 087945fcd230f..23c21bc4d01e2 100644
> > --- a/drivers/gpu/drm/virtio/virtgpu_vram.c
> > +++ b/drivers/gpu/drm/virtio/virtgpu_vram.c
> > @@ -149,6 +149,8 @@ int virtio_gpu_vram_create(struct virtio_gpu_device
> *vgdev,
> >                 return ret;
> >         }
> >
> > +       virtio_gpu_cmd_resource_create_blob(vgdev, &vram->base, params,
> NULL,
> > +                                           0);
> >         if (params->blob_flags & VIRTGPU_BLOB_FLAG_USE_MAPPABLE) {
> >                 ret = virtio_gpu_vram_map(&vram->base);
> >                 if (ret) {
> > --
> > 2.26.2
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
>

--000000000000120e5305ae700db6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 3, 2020 at 2:11 PM Chia-I=
 Wu &lt;<a href=3D"mailto:olvaffe@gmail.com">olvaffe@gmail.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, Sep 2=
, 2020 at 2:09 PM Gurchetan Singh<br>
&lt;<a href=3D"mailto:gurchetansingh@chromium.org" target=3D"_blank">gurche=
tansingh@chromium.org</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" target=3D=
"_blank">kraxel@redhat.com</a>&gt;<br>
&gt;<br>
&gt; Implement resource create blob as specified.<br>
&gt;<br>
&gt; Signed-off-by: Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" =
target=3D"_blank">kraxel@redhat.com</a>&gt;<br>
&gt; Co-developed-by: Gurchetan Singh &lt;<a href=3D"mailto:gurchetansingh@=
chromium.org" target=3D"_blank">gurchetansingh@chromium.org</a>&gt;<br>
&gt; Signed-off-by: Gurchetan Singh &lt;<a href=3D"mailto:gurchetansingh@ch=
romium.org" target=3D"_blank">gurchetansingh@chromium.org</a>&gt;<br>
&gt; Acked-by: Tomeu Vizoso &lt;<a href=3D"mailto:tomeu.vizoso@collabora.co=
m" target=3D"_blank">tomeu.vizoso@collabora.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/gpu/drm/virtio/virtgpu_drv.h=C2=A0 =C2=A0 |=C2=A0 =C2=A0=
4 +-<br>
&gt;=C2=A0 drivers/gpu/drm/virtio/virtgpu_ioctl.c=C2=A0 | 136 +++++++++++++=
+++++++++++<br>
&gt;=C2=A0 drivers/gpu/drm/virtio/virtgpu_object.c |=C2=A0 =C2=A05 +-<br>
&gt;=C2=A0 drivers/gpu/drm/virtio/virtgpu_vram.c=C2=A0 =C2=A0|=C2=A0 =C2=A0=
2 +<br>
&gt;=C2=A0 4 files changed, 144 insertions(+), 3 deletions(-)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/vi=
rtio/virtgpu_drv.h<br>
&gt; index 6162865c162df..d2ea199dbdb90 100644<br>
&gt; --- a/drivers/gpu/drm/virtio/virtgpu_drv.h<br>
&gt; +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h<br>
&gt; @@ -257,8 +257,8 @@ struct virtio_gpu_fpriv {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct mutex context_lock;<br>
&gt;=C2=A0 };<br>
&gt;<br>
&gt; -/* virtgpu_ioctl.c */<br>
&gt; -#define DRM_VIRTIO_NUM_IOCTLS 10<br>
&gt; +/* virtio_ioctl.c */<br>
&gt; +#define DRM_VIRTIO_NUM_IOCTLS 11<br>
&gt;=C2=A0 extern struct drm_ioctl_desc virtio_gpu_ioctls[DRM_VIRTIO_NUM_IO=
CTLS];<br>
&gt;=C2=A0 void virtio_gpu_create_context(struct drm_device *dev, struct dr=
m_file *file);<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/=
virtio/virtgpu_ioctl.c<br>
&gt; index 7dbe24248a200..442cbca59c8a5 100644<br>
&gt; --- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c<br>
&gt; +++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c<br>
&gt; @@ -34,6 +34,10 @@<br>
&gt;<br>
&gt;=C2=A0 #include &quot;virtgpu_drv.h&quot;<br>
&gt;<br>
&gt; +#define VIRTGPU_BLOB_FLAG_USE_MASK (VIRTGPU_BLOB_FLAG_USE_MAPPABLE | =
\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VIRTGPU_BLOB_FLAG_U=
SE_SHAREABLE | \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VIRTGPU_BLOB_FLAG_U=
SE_CROSS_DEVICE)<br>
&gt; +<br>
&gt;=C2=A0 void virtio_gpu_create_context(struct drm_device *dev, struct dr=
m_file *file)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct virtio_gpu_device *vgdev =3D d=
ev-&gt;dev_private;<br>
&gt; @@ -520,6 +524,134 @@ static int virtio_gpu_get_caps_ioctl(struct drm_=
device *dev,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; +static int verify_blob(struct virtio_gpu_device *vgdev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 struct virtio_gpu_fpriv *vfpriv,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 struct virtio_gpu_object_params *params,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 struct drm_virtgpu_resource_create_blob *rc_blob,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 bool *guest_blob, bool *host3d_blob)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!vgdev-&gt;has_resource_blob)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if ((rc_blob-&gt;blob_flags &amp; ~VIRTGPU=
_BLOB_FLAG_USE_MASK) ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!rc_blob-&gt;blob_flags)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (rc_blob-&gt;blob_flags &amp; VIRTGPU_B=
LOB_FLAG_USE_CROSS_DEVICE) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!vgdev-&gt=
;has_resource_assign_uuid)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (rc_blob-&gt;blob_mem) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case VIRTGPU_BLOB_MEM_GUEST:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*guest_blob =
=3D true;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case VIRTGPU_BLOB_MEM_HOST3D_GUEST:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*guest_blob =
=3D true;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fallthrough;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case VIRTGPU_BLOB_MEM_HOST3D:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*host3d_blob =
=3D true;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (*host3d_blob) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!vgdev-&gt=
;has_virgl_3d)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Must be dwo=
rd aligned. */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (rc_blob-&g=
t;cmd_size % 4 !=3D 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0params-&gt;ctx=
_id =3D vfpriv-&gt;ctx_id;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0params-&gt;blo=
b_id =3D rc_blob-&gt;blob_id;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (rc_blob-&g=
t;blob_id !=3D 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (rc_blob-&g=
t;cmd_size !=3D 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0params-&gt;blob_mem =3D rc_blob-&gt;blob_m=
em;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0params-&gt;size =3D rc_blob-&gt;size;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0params-&gt;blob =3D true;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0params-&gt;blob_flags =3D rc_blob-&gt;blob=
_flags;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int virtio_gpu_resource_create_blob(struct drm_device *dev,<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 void *data, struct drm_file *file)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t handle =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0bool guest_blob =3D false;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0bool host3d_blob =3D false;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_gem_object *obj;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct virtio_gpu_object *bo;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct virtio_gpu_object_params params =3D=
 { 0 };<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct virtio_gpu_device *vgdev =3D dev-&g=
t;dev_private;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct virtio_gpu_fpriv *vfpriv =3D file-&=
gt;driver_priv;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_virtgpu_resource_create_blob *r=
c_blob =3D data;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (verify_blob(vgdev, vfpriv, &amp;params=
, rc_blob,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0&amp;guest_blob, &amp;host3d_blob))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (vgdev-&gt;has_virgl_3d)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0virtio_gpu_cre=
ate_context(dev, file);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (rc_blob-&gt;cmd_size) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void *buf;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0buf =3D memdup=
_user(u64_to_user_ptr(rc_blob-&gt;cmd),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rc_blob-&gt;cmd_size);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(buf=
))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0return PTR_ERR(buf);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0virtio_gpu_cmd=
_submit(vgdev, buf, rc_blob-&gt;cmd_size,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vfpriv-&gt;c=
tx_id, NULL, NULL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (guest_blob)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D virtio=
_gpu_object_create(vgdev, &amp;params, &amp;bo, NULL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0else if (!guest_blob &amp;&amp; host3d_blo=
b)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D virtio=
_gpu_vram_create(vgdev, &amp;params, &amp;bo);<br>
When cmd_size !=3D 0, a host blob has been allocated.=C2=A0 Will it be leak=
ed<br>
if virtio_gpu_{object,vram}_create fails?<br></blockquote><div><br></div><d=
iv>The actual kick happens as a result of=C2=A0drm_gem_handle_create (simil=
ar=C2=A0to drm_virtgpu_resource_create), so the host-side allocation doesn&=
#39;t happen if the virtio_gpu_{object,vram}_create sanity checks fail.=C2=
=A0 We could unqueue items from the virtqueue on the failure cases, but blo=
b is big enough already and userspace doesn&#39;t really recover=C2=A0grace=
fully if an ioctl fails either.</div><div><br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0bo-&gt;guest_blob =3D guest_blob;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0bo-&gt;host3d_blob =3D host3d_blob;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0bo-&gt;blob_mem =3D rc_blob-&gt;blob_mem;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0bo-&gt;blob_flags =3D rc_blob-&gt;blob_fla=
gs;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0obj =3D &amp;bo-&gt;base.base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (params.blob_flags &amp; VIRTGPU_BLOB_F=
LAG_USE_CROSS_DEVICE) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D virtio=
_gpu_resource_assign_uuid(vgdev, bo);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0drm_gem_object_release(obj);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0return ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D drm_gem_handle_create(file, obj, &=
amp;handle);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_gem_object=
_release(obj);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_gem_object_put(obj);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0rc_blob-&gt;res_handle =3D bo-&gt;hw_res_h=
andle;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0rc_blob-&gt;bo_handle =3D handle;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 struct drm_ioctl_desc virtio_gpu_ioctls[DRM_VIRTIO_NUM_IOCTLS] =
=3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_IOCTL_DEF_DRV(VIRTGPU_MAP, virtio=
_gpu_map_ioctl,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_RENDER_ALLOW),<br>
&gt; @@ -552,4 +684,8 @@ struct drm_ioctl_desc virtio_gpu_ioctls[DRM_VIRTIO=
_NUM_IOCTLS] =3D {<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_IOCTL_DEF_DRV(VIRTGPU_GET_CAPS, v=
irtio_gpu_get_caps_ioctl,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_RENDER_ALLOW),<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_IOCTL_DEF_DRV(VIRTGPU_RESOURCE_CREATE_=
BLOB,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0virtio_gpu_resource_create_blob,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0DRM_RENDER_ALLOW),<br>
&gt;=C2=A0 };<br>
&gt; diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm=
/virtio/virtgpu_object.c<br>
&gt; index cef79455257df..258b4eeae7c2c 100644<br>
&gt; --- a/drivers/gpu/drm/virtio/virtgpu_object.c<br>
&gt; +++ b/drivers/gpu/drm/virtio/virtgpu_object.c<br>
&gt; @@ -244,7 +244,10 @@ int virtio_gpu_object_create(struct virtio_gpu_de=
vice *vgdev,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return re=
t;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (params-&gt;virgl) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (params-&gt;blob) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0virtio_gpu_cmd=
_resource_create_blob(vgdev, bo, params,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ents, nents);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (params-&gt;virgl) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0virtio_gp=
u_cmd_resource_create_3d(vgdev, bo, params,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0objs, fence);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0virtio_gp=
u_object_attach(vgdev, bo, ents, nents);<br>
&gt; diff --git a/drivers/gpu/drm/virtio/virtgpu_vram.c b/drivers/gpu/drm/v=
irtio/virtgpu_vram.c<br>
&gt; index 087945fcd230f..23c21bc4d01e2 100644<br>
&gt; --- a/drivers/gpu/drm/virtio/virtgpu_vram.c<br>
&gt; +++ b/drivers/gpu/drm/virtio/virtgpu_vram.c<br>
&gt; @@ -149,6 +149,8 @@ int virtio_gpu_vram_create(struct virtio_gpu_devic=
e *vgdev,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return re=
t;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0virtio_gpu_cmd_resource_create_blob(vgdev,=
 &amp;vram-&gt;base, params, NULL,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (params-&gt;blob_flags &amp; VIRTG=
PU_BLOB_FLAG_USE_MAPPABLE) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D v=
irtio_gpu_vram_map(&amp;vram-&gt;base);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) =
{<br>
&gt; --<br>
&gt; 2.26.2<br>
&gt;<br>
&gt; _______________________________________________<br>
&gt; dri-devel mailing list<br>
&gt; <a href=3D"mailto:dri-devel@lists.freedesktop.org" target=3D"_blank">d=
ri-devel@lists.freedesktop.org</a><br>
&gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/dri-devel" r=
el=3D"noreferrer" target=3D"_blank">https://lists.freedesktop.org/mailman/l=
istinfo/dri-devel</a><br>
</blockquote></div></div>

--000000000000120e5305ae700db6--

--===============1268056754==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1268056754==--
