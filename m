Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D698240BD34
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 03:26:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE0C26E887;
	Wed, 15 Sep 2021 01:26:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 252AA6E887
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Sep 2021 01:26:02 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id h16so2472936lfk.10
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 18:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=odcxk/hjHnEnJwknKJJMKmpImmchwmbyMX0U+ha0GUw=;
 b=XJog4UvKNYs8/ffTqDMX8lWamXTRIQTbJ1ROpLld80G5gyyE+WxDIGKudMS3ivzGl6
 EtXSMZK+pTiyNE2SsRkrXI8PiBMBLzxVLRqMXxTHc6rFxw08goJPqhyfhIbHgYeIWI3B
 PE0mkUpL5IxLw1VmQYLS4eijzKc2r1waG+w5Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=odcxk/hjHnEnJwknKJJMKmpImmchwmbyMX0U+ha0GUw=;
 b=nvdxE4KaAozx4P9UBhzM8P87BrjzFrDdJj+n+CYtVi+K60td1pqamu7DaFbzbaCtd7
 Otoq7GuxD0cefp3LxTmaqxCG0LuylKU1mdIy2OKfgiZItvZnaNtJaotDgLION801/jLF
 wFXl+StIFysO/Gdf2Y9rVr1SgpD/mWFTGnnX6QbqbBH1CQbQ7tKv9WH0waFtoTjKZ2Kx
 hxqFkPvWvA8eDei1cqJVUh9L3cUFPCse4vx23upebn424OcuapMIVi9HGYXYZI5h3ul7
 6N/OhUos6BOpWCEtr5xNYUQ6Nk5OtIWCjBCab41ltho5/i/Po4b5ERitGx0ahYB8i9ar
 nbqw==
X-Gm-Message-State: AOAM532nvkw63LnLqsFl6REX5kvwM8giFI+bTWFvXWpDJWahIVf/rZ5D
 i6lyQDcEmBmJD9z88FPh1UCffKhfExeV+g==
X-Google-Smtp-Source: ABdhPJyfsa2DRcqt07HgkjT5bHfD1eI9KUZbEOtNg2NuR6NwvEo0fC1/BjAFXzhSrf59uJVM6yoDuQ==
X-Received: by 2002:ac2:48aa:: with SMTP id u10mr402368lfg.671.1631669159935; 
 Tue, 14 Sep 2021 18:25:59 -0700 (PDT)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com.
 [209.85.167.45])
 by smtp.gmail.com with ESMTPSA id t15sm1251208lfe.178.2021.09.14.18.25.58
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 18:25:59 -0700 (PDT)
Received: by mail-lf1-f45.google.com with SMTP id p29so2463235lfa.11
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 18:25:58 -0700 (PDT)
X-Received: by 2002:a05:6512:3da5:: with SMTP id
 k37mr15579135lfv.655.1631669158474; 
 Tue, 14 Sep 2021 18:25:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210909013717.861-1-gurchetansingh@chromium.org>
 <20210909013717.861-10-gurchetansingh@chromium.org>
 <CAPaKu7RB0hHTW9_WoOvp1X1Wz8L65ptSsJXKcPu22Rm9NKjAFQ@mail.gmail.com>
 <CAAfnVBmRKWgGQ2NXQSK9T4Hc95Yh_bpb=TGvyZgwMzDJdghrTQ@mail.gmail.com>
 <CAPaKu7SvzWPDAOKVSot9W4M880Hgdjm=RbKVrU=nthOaXh_hEg@mail.gmail.com>
 <CAAfnVB=+fpYhnjpbAzAgvYBnH9amRx8Nn0kkSR3PBcqPpjWLbw@mail.gmail.com>
 <CAPaKu7R8RBTE7Njm3HY9kUq-3GGMVWVKf9RHYU9M7UGcSBuPhw@mail.gmail.com>
In-Reply-To: <CAPaKu7R8RBTE7Njm3HY9kUq-3GGMVWVKf9RHYU9M7UGcSBuPhw@mail.gmail.com>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Tue, 14 Sep 2021 18:25:46 -0700
X-Gmail-Original-Message-ID: <CAAfnVBkF7rjbcCadiYXQcnYxZ6AW72=bA6tqu4EjjszeKeWEHQ@mail.gmail.com>
Message-ID: <CAAfnVBkF7rjbcCadiYXQcnYxZ6AW72=bA6tqu4EjjszeKeWEHQ@mail.gmail.com>
Subject: Re: [virtio-dev] [PATCH v1 09/12] drm/virtio: implement context init:
 allocate an array of fence contexts
To: Chia-I Wu <olvaffe@gmail.com>
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>,
 virtio-dev@lists.oasis-open.org, Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000095b6a005cbfe94ac"
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

--00000000000095b6a005cbfe94ac
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 14, 2021 at 10:53 AM Chia-I Wu <olvaffe@gmail.com> wrote:

> ,On Mon, Sep 13, 2021 at 6:57 PM Gurchetan Singh
> <gurchetansingh@chromium.org> wrote:
> >
> >
> >
> >
> > On Mon, Sep 13, 2021 at 11:52 AM Chia-I Wu <olvaffe@gmail.com> wrote:
> >>
> >> .
> >>
> >> On Mon, Sep 13, 2021 at 10:48 AM Gurchetan Singh
> >> <gurchetansingh@chromium.org> wrote:
> >> >
> >> >
> >> >
> >> > On Fri, Sep 10, 2021 at 12:33 PM Chia-I Wu <olvaffe@gmail.com> wrote:
> >> >>
> >> >> On Wed, Sep 8, 2021 at 6:37 PM Gurchetan Singh
> >> >> <gurchetansingh@chromium.org> wrote:
> >> >> >
> >> >> > We don't want fences from different 3D contexts (virgl, gfxstream,
> >> >> > venus) to be on the same timeline.  With explicit context creation,
> >> >> > we can specify the number of ring each context wants.
> >> >> >
> >> >> > Execbuffer can specify which ring to use.
> >> >> >
> >> >> > Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
> >> >> > Acked-by: Lingfeng Yang <lfy@google.com>
> >> >> > ---
> >> >> >  drivers/gpu/drm/virtio/virtgpu_drv.h   |  3 +++
> >> >> >  drivers/gpu/drm/virtio/virtgpu_ioctl.c | 34
> ++++++++++++++++++++++++--
> >> >> >  2 files changed, 35 insertions(+), 2 deletions(-)
> >> >> >
> >> >> > diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h
> b/drivers/gpu/drm/virtio/virtgpu_drv.h
> >> >> > index a5142d60c2fa..cca9ab505deb 100644
> >> >> > --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
> >> >> > +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
> >> >> > @@ -56,6 +56,7 @@
> >> >> >  #define STATE_ERR 2
> >> >> >
> >> >> >  #define MAX_CAPSET_ID 63
> >> >> > +#define MAX_RINGS 64
> >> >> >
> >> >> >  struct virtio_gpu_object_params {
> >> >> >         unsigned long size;
> >> >> > @@ -263,6 +264,8 @@ struct virtio_gpu_fpriv {
> >> >> >         uint32_t ctx_id;
> >> >> >         uint32_t context_init;
> >> >> >         bool context_created;
> >> >> > +       uint32_t num_rings;
> >> >> > +       uint64_t base_fence_ctx;
> >> >> >         struct mutex context_lock;
> >> >> >  };
> >> >> >
> >> >> > diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> >> >> > index f51f3393a194..262f79210283 100644
> >> >> > --- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> >> >> > +++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> >> >> > @@ -99,6 +99,11 @@ static int virtio_gpu_execbuffer_ioctl(struct
> drm_device *dev, void *data,
> >> >> >         int in_fence_fd = exbuf->fence_fd;
> >> >> >         int out_fence_fd = -1;
> >> >> >         void *buf;
> >> >> > +       uint64_t fence_ctx;
> >> >> > +       uint32_t ring_idx;
> >> >> > +
> >> >> > +       fence_ctx = vgdev->fence_drv.context;
> >> >> > +       ring_idx = 0;
> >> >> >
> >> >> >         if (vgdev->has_virgl_3d == false)
> >> >> >                 return -ENOSYS;
> >> >> > @@ -106,6 +111,17 @@ static int virtio_gpu_execbuffer_ioctl(struct
> drm_device *dev, void *data,
> >> >> >         if ((exbuf->flags & ~VIRTGPU_EXECBUF_FLAGS))
> >> >> >                 return -EINVAL;
> >> >> >
> >> >> > +       if ((exbuf->flags & VIRTGPU_EXECBUF_RING_IDX)) {
> >> >> > +               if (exbuf->ring_idx >= vfpriv->num_rings)
> >> >> > +                       return -EINVAL;
> >> >> > +
> >> >> > +               if (!vfpriv->base_fence_ctx)
> >> >> > +                       return -EINVAL;
> >> >> > +
> >> >> > +               fence_ctx = vfpriv->base_fence_ctx;
> >> >> > +               ring_idx = exbuf->ring_idx;
> >> >> > +       }
> >> >> > +
> >> >> >         exbuf->fence_fd = -1;
> >> >> >
> >> >> >         virtio_gpu_create_context(dev, file);
> >> >> > @@ -173,7 +189,7 @@ static int virtio_gpu_execbuffer_ioctl(struct
> drm_device *dev, void *data,
> >> >> >                         goto out_memdup;
> >> >> >         }
> >> >> >
> >> >> > -       out_fence = virtio_gpu_fence_alloc(vgdev,
> vgdev->fence_drv.context, 0);
> >> >> > +       out_fence = virtio_gpu_fence_alloc(vgdev, fence_ctx,
> ring_idx);
> >> >> >         if(!out_fence) {
> >> >> >                 ret = -ENOMEM;
> >> >> >                 goto out_unresv;
> >> >> > @@ -691,7 +707,7 @@ static int
> virtio_gpu_context_init_ioctl(struct drm_device *dev,
> >> >> >                 return -EINVAL;
> >> >> >
> >> >> >         /* Number of unique parameters supported at this time. */
> >> >> > -       if (num_params > 1)
> >> >> > +       if (num_params > 2)
> >> >> >                 return -EINVAL;
> >> >> >
> >> >> >         ctx_set_params =
> memdup_user(u64_to_user_ptr(args->ctx_set_params),
> >> >> > @@ -731,6 +747,20 @@ static int
> virtio_gpu_context_init_ioctl(struct drm_device *dev,
> >> >> >
> >> >> >                         vfpriv->context_init |= value;
> >> >> >                         break;
> >> >> > +               case VIRTGPU_CONTEXT_PARAM_NUM_RINGS:
> >> >> > +                       if (vfpriv->base_fence_ctx) {
> >> >> > +                               ret = -EINVAL;
> >> >> > +                               goto out_unlock;
> >> >> > +                       }
> >> >> > +
> >> >> > +                       if (value > MAX_RINGS) {
> >> >> > +                               ret = -EINVAL;
> >> >> > +                               goto out_unlock;
> >> >> > +                       }
> >> >> > +
> >> >> > +                       vfpriv->base_fence_ctx =
> dma_fence_context_alloc(value);
> >> >> With multiple fence contexts, we should do something about implicit
> fencing.
> >> >>
> >> >> The classic example is Mesa and X server.  When both use virgl and
> the
> >> >> global fence context, no dma_fence_wait is fine.  But when Mesa uses
> >> >> venus and the ring fence context, dma_fence_wait should be inserted.
> >> >
> >> >
> >> >  If I read your comment correctly, the use case is:
> >> >
> >> > context A (venus)
> >> >
> >> > sharing a render target with
> >> >
> >> > context B (Xserver backed virgl)
> >> >
> >> > ?
> >> >
> >> > Which function do you envisage dma_fence_wait(...) to be inserted?
> Doesn't implicit synchronization mean there's no fence to share between
> contexts (only buffer objects)?
> >>
> >> Fences can be implicitly shared via reservation objects associated
> >> with buffer objects.
> >>
> >> > It may be possible to wait on the reservation object associated with
> a buffer object from a different context (userspace can also do
> DRM_IOCTL_VIRTGPU_WAIT), but not sure if that's what you're looking for.
> >>
> >> Right, that's what I am looking for.  Userspace expects implicit
> >> fencing to work.  While there are works to move the userspace to do
> >> explicit fencing, it is not there yet in general and we can't require
> >> the userspace to do explicit fencing or DRM_IOCTL_VIRTGPU_WAIT.
> >
> >
> > Another option would be to use the upcoming
> DMA_BUF_IOCTL_EXPORT_SYNC_FILE + VIRTGPU_EXECBUF_FENCE_FD_IN (which checks
> the dma_fence context).
> That requires the X server / compositors to be modified.  For example,
> venus works under Android (where there is explicit fencing) or under a
> modified compositor (which does DMA_BUF_IOCTL_EXPORT_SYNC_FILE or
> DRM_IOCTL_VIRTGPU_WAIT).  But it does not work too well with an
> unmodified X server.
>

Some semi-recent virgl modifications will be needed regardless for interop,
such as VIRGL_CAP_V2_UNTYPED_RESOURCE (?).

Not sure aren't too many virgl users (most developers)

Does Xserver just pick up the latest Mesa release (including virgl/venus)?
Suppose context types land in 5.16, the userspace changes land (both
Venus/Virgl) in 21.2 stable releases.

https://docs.mesa3d.org/release-calendar.html


> >
> > Generally, if it only requires virgl changes, userspace changes are fine
> since OpenGL drivers implement implicit sync in many ways.  Waiting on the
> reservation object in the kernel is fine too though.
> I don't think we want to assume virgl to be the only consumer of
> dma-bufs, despite that it is the most common use case.


> >
> > Though venus doesn't use the NUM_RINGS param yet.  Getting all
> permutations of context type + display integration working would take some
> time (patchset mostly tested with wayland + gfxstream/Android [no implicit
> sync]).
> >
> > WDYT of someone figuring out virgl/venus interop later, independently of
> this patchset?
>
> I think we should understand the implications of multiple fence
> contexts better, even if some changes are not included in this
> patchset.
>
> From my view, we don't need implicit fencing in most cases and
> implicit fencing should be considered a legacy path.  But X server /
> compositors today happen to require it.  Other drivers seem to use a
> flag to control whether implicit fences are set up or waited (e.g.,
> AMDGPU_GEM_CREATE_EXPLICIT_SYNC, MSM_SUBMIT_NO_IMPLICIT, or
> EXEC_OBJECT_WRITE).  It seems to be the least surprising thing to do.
>

IMO, the easiest way is just to limit the change to userspace if possible
since implicit sync is legacy/something we want to deprecate over time.

Another option is to add something like VIRTGPU_EXECBUF_EXPLICIT_SYNC
(similar to MSM_SUBMIT_NO_IMPLICIT), where the reservation objects are
waited on / added to without that flag.  Since explicit sync will need new
hypercalls/params and is a major, that feature is expected to be
independent of context types.

With that option, waiting on the reservation object would just be another
bug fix + addition to 5.16 (perhaps by you) so we can proceed in parallel
faster.  VIRTGPU_EXECBUF_EXPLICIT_SYNC (or an equivalent) would be added
later.


>
> >
> >>
> >>
> >>
> >>
> >> >
> >> >>
> >> >>
> >> >> > +                       vfpriv->num_rings = value;
> >> >> > +                       break;
> >> >> >                 default:
> >> >> >                         ret = -EINVAL;
> >> >> >                         goto out_unlock;
> >> >> > --
> >> >> > 2.33.0.153.gba50c8fa24-goog
> >> >> >
> >> >> >
> >> >> >
> ---------------------------------------------------------------------
> >> >> > To unsubscribe, e-mail:
> virtio-dev-unsubscribe@lists.oasis-open.org
> >> >> > For additional commands, e-mail:
> virtio-dev-help@lists.oasis-open.org
> >> >> >
>

--00000000000095b6a005cbfe94ac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 14, 2021 at 10:53 AM Chia=
-I Wu &lt;<a href=3D"mailto:olvaffe@gmail.com" target=3D"_blank">olvaffe@gm=
ail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">,On Mon, Sep 13, 2021 at 6:57 PM Gurchetan Singh<br>
&lt;<a href=3D"mailto:gurchetansingh@chromium.org" target=3D"_blank">gurche=
tansingh@chromium.org</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Mon, Sep 13, 2021 at 11:52 AM Chia-I Wu &lt;<a href=3D"mailto:olvaf=
fe@gmail.com" target=3D"_blank">olvaffe@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; .<br>
&gt;&gt;<br>
&gt;&gt; On Mon, Sep 13, 2021 at 10:48 AM Gurchetan Singh<br>
&gt;&gt; &lt;<a href=3D"mailto:gurchetansingh@chromium.org" target=3D"_blan=
k">gurchetansingh@chromium.org</a>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; On Fri, Sep 10, 2021 at 12:33 PM Chia-I Wu &lt;<a href=3D"mai=
lto:olvaffe@gmail.com" target=3D"_blank">olvaffe@gmail.com</a>&gt; wrote:<b=
r>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; On Wed, Sep 8, 2021 at 6:37 PM Gurchetan Singh<br>
&gt;&gt; &gt;&gt; &lt;<a href=3D"mailto:gurchetansingh@chromium.org" target=
=3D"_blank">gurchetansingh@chromium.org</a>&gt; wrote:<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; We don&#39;t want fences from different 3D contexts =
(virgl, gfxstream,<br>
&gt;&gt; &gt;&gt; &gt; venus) to be on the same timeline.=C2=A0 With explic=
it context creation,<br>
&gt;&gt; &gt;&gt; &gt; we can specify the number of ring each context wants=
.<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; Execbuffer can specify which ring to use.<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; Signed-off-by: Gurchetan Singh &lt;<a href=3D"mailto=
:gurchetansingh@chromium.org" target=3D"_blank">gurchetansingh@chromium.org=
</a>&gt;<br>
&gt;&gt; &gt;&gt; &gt; Acked-by: Lingfeng Yang &lt;<a href=3D"mailto:lfy@go=
ogle.com" target=3D"_blank">lfy@google.com</a>&gt;<br>
&gt;&gt; &gt;&gt; &gt; ---<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 drivers/gpu/drm/virtio/virtgpu_drv.h=C2=A0 =C2=
=A0|=C2=A0 3 +++<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 34 ++=
++++++++++++++++++++++--<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 2 files changed, 35 insertions(+), 2 deletions=
(-)<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/=
drivers/gpu/drm/virtio/virtgpu_drv.h<br>
&gt;&gt; &gt;&gt; &gt; index a5142d60c2fa..cca9ab505deb 100644<br>
&gt;&gt; &gt;&gt; &gt; --- a/drivers/gpu/drm/virtio/virtgpu_drv.h<br>
&gt;&gt; &gt;&gt; &gt; +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h<br>
&gt;&gt; &gt;&gt; &gt; @@ -56,6 +56,7 @@<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 #define STATE_ERR 2<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 #define MAX_CAPSET_ID 63<br>
&gt;&gt; &gt;&gt; &gt; +#define MAX_RINGS 64<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 struct virtio_gpu_object_params {<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long size;=
<br>
&gt;&gt; &gt;&gt; &gt; @@ -263,6 +264,8 @@ struct virtio_gpu_fpriv {<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t ctx_id;<br=
>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t context_in=
it;<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool context_create=
d;<br>
&gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t num_rings;<br>
&gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t base_fence_ctx;=
<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct mutex contex=
t_lock;<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 };<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c =
b/drivers/gpu/drm/virtio/virtgpu_ioctl.c<br>
&gt;&gt; &gt;&gt; &gt; index f51f3393a194..262f79210283 100644<br>
&gt;&gt; &gt;&gt; &gt; --- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c<br>
&gt;&gt; &gt;&gt; &gt; +++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c<br>
&gt;&gt; &gt;&gt; &gt; @@ -99,6 +99,11 @@ static int virtio_gpu_execbuffer_=
ioctl(struct drm_device *dev, void *data,<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int in_fence_fd =3D=
 exbuf-&gt;fence_fd;<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int out_fence_fd =
=3D -1;<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void *buf;<br>
&gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t fence_ctx;<br>
&gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t ring_idx;<br>
&gt;&gt; &gt;&gt; &gt; +<br>
&gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0fence_ctx =3D vgdev-&gt;=
fence_drv.context;<br>
&gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ring_idx =3D 0;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (vgdev-&gt;has_v=
irgl_3d =3D=3D false)<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return -ENOSYS;<br>
&gt;&gt; &gt;&gt; &gt; @@ -106,6 +111,17 @@ static int virtio_gpu_execbuffe=
r_ioctl(struct drm_device *dev, void *data,<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((exbuf-&gt;flag=
s &amp; ~VIRTGPU_EXECBUF_FLAGS))<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return -EINVAL;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if ((exbuf-&gt;flags &am=
p; VIRTGPU_EXECBUF_RING_IDX)) {<br>
&gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0if (exbuf-&gt;ring_idx &gt;=3D vfpriv-&gt;num_rings)<br>
&gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt;&gt; &gt;&gt; &gt; +<br>
&gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0if (!vfpriv-&gt;base_fence_ctx)<br>
&gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt;&gt; &gt;&gt; &gt; +<br>
&gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0fence_ctx =3D vfpriv-&gt;base_fence_ctx;<br>
&gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0ring_idx =3D exbuf-&gt;ring_idx;<br>
&gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; &gt;&gt; &gt; +<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exbuf-&gt;fence_fd =
=3D -1;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0virtio_gpu_create_c=
ontext(dev, file);<br>
&gt;&gt; &gt;&gt; &gt; @@ -173,7 +189,7 @@ static int virtio_gpu_execbuffer=
_ioctl(struct drm_device *dev, void *data,<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out_memdup;<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0out_fence =3D virtio_gpu=
_fence_alloc(vgdev, vgdev-&gt;fence_drv.context, 0);<br>
&gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0out_fence =3D virtio_gpu=
_fence_alloc(vgdev, fence_ctx, ring_idx);<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if(!out_fence) {<br=
>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ret =3D -ENOMEM;<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0goto out_unresv;<br>
&gt;&gt; &gt;&gt; &gt; @@ -691,7 +707,7 @@ static int virtio_gpu_context_in=
it_ioctl(struct drm_device *dev,<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return -EINVAL;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Number of unique=
 parameters supported at this time. */<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (num_params &gt; 1)<b=
r>
&gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (num_params &gt; 2)<b=
r>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return -EINVAL;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ctx_set_params =3D =
memdup_user(u64_to_user_ptr(args-&gt;ctx_set_params),<br>
&gt;&gt; &gt;&gt; &gt; @@ -731,6 +747,20 @@ static int virtio_gpu_context_i=
nit_ioctl(struct drm_device *dev,<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vfpriv-&gt;context_init |=3D value;<b=
r>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0case VIRTGPU_CONTEXT_PARAM_NUM_RINGS:<br>
&gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (vfpriv-&gt;base_fence_ctx) {<br>
&gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D -EINV=
AL;<br>
&gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out_unlo=
ck;<br>
&gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; &gt;&gt; &gt; +<br>
&gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (value &gt; MAX_RINGS) {<br>
&gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D -EINV=
AL;<br>
&gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out_unlo=
ck;<br>
&gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; &gt;&gt; &gt; +<br>
&gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vfpriv-&gt;base_fence_ctx =3D dma_fence_c=
ontext_alloc(value);<br>
&gt;&gt; &gt;&gt; With multiple fence contexts, we should do something abou=
t implicit fencing.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; The classic example is Mesa and X server.=C2=A0 When both=
 use virgl and the<br>
&gt;&gt; &gt;&gt; global fence context, no dma_fence_wait is fine.=C2=A0 Bu=
t when Mesa uses<br>
&gt;&gt; &gt;&gt; venus and the ring fence context, dma_fence_wait should b=
e inserted.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 If I read your comment correctly, the use case is:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; context A (venus)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; sharing a render target with<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; context B (Xserver backed virgl)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; ?<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Which function do you envisage dma_fence_wait(...) to be inse=
rted?=C2=A0 Doesn&#39;t implicit synchronization mean there&#39;s no fence =
to share between contexts (only buffer objects)?<br>
&gt;&gt;<br>
&gt;&gt; Fences can be implicitly shared via reservation objects associated=
<br>
&gt;&gt; with buffer objects.<br>
&gt;&gt;<br>
&gt;&gt; &gt; It may be possible to wait on the reservation object associat=
ed with a buffer object from a different context (userspace can also do DRM=
_IOCTL_VIRTGPU_WAIT), but not sure if that&#39;s what you&#39;re looking fo=
r.<br>
&gt;&gt;<br>
&gt;&gt; Right, that&#39;s what I am looking for.=C2=A0 Userspace expects i=
mplicit<br>
&gt;&gt; fencing to work.=C2=A0 While there are works to move the userspace=
 to do<br>
&gt;&gt; explicit fencing, it is not there yet in general and we can&#39;t =
require<br>
&gt;&gt; the userspace to do explicit fencing or DRM_IOCTL_VIRTGPU_WAIT.<br=
>
&gt;<br>
&gt;<br>
&gt; Another option would be to use the upcoming DMA_BUF_IOCTL_EXPORT_SYNC_=
FILE + VIRTGPU_EXECBUF_FENCE_FD_IN (which checks the dma_fence context).<br=
>
That requires the X server / compositors to be modified.=C2=A0 For example,=
<br>
venus works under Android (where there is explicit fencing) or under a<br>
modified compositor (which does DMA_BUF_IOCTL_EXPORT_SYNC_FILE or<br>
DRM_IOCTL_VIRTGPU_WAIT).=C2=A0 But it does not work too well with an<br>
unmodified X server.<br></blockquote><div><br></div><div>Some semi-recent v=
irgl modifications will be needed regardless for interop, such as VIRGL_CAP=
_V2_UNTYPED_RESOURCE (?).</div><div><br></div><div>Not sure aren&#39;t too =
many virgl users (most developers)</div><div><br></div><div>Does Xserver ju=
st pick up the latest Mesa release (including virgl/venus)?=C2=A0 Suppose c=
ontext types land in 5.16, the userspace changes land (both Venus/Virgl) in=
 21.2 stable releases.</div><div><br></div><div><a href=3D"https://docs.mes=
a3d.org/release-calendar.html" target=3D"_blank">https://docs.mesa3d.org/re=
lease-calendar.html</a><br></div><div><br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
<br>
&gt;<br>
&gt; Generally, if it only requires virgl changes, userspace changes are fi=
ne since OpenGL drivers implement implicit sync in many ways.=C2=A0 Waiting=
 on the reservation object in the kernel is fine too though.<br>
I don&#39;t think we want to assume virgl to be the only consumer of<br>
dma-bufs, despite that it is the most common use case.</blockquote><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;<br>
&gt; Though venus doesn&#39;t use the NUM_RINGS param yet.=C2=A0 Getting al=
l permutations of context type + display integration working would take som=
e time (patchset mostly tested with wayland + gfxstream/Android [no implici=
t sync]).<br>
&gt;<br>
&gt; WDYT of someone figuring out virgl/venus interop later, independently =
of this patchset?<br>
<br>
I think we should understand the implications of multiple fence<br>
contexts better, even if some changes are not included in this<br>
patchset.<br>
<br>
From my view, we don&#39;t need implicit fencing in most cases and<br>
implicit fencing should be considered a legacy path.=C2=A0 But X server /<b=
r>
compositors today happen to require it.=C2=A0 Other drivers seem to use a<b=
r>
flag to control whether implicit fences are set up or waited (e.g.,<br>
AMDGPU_GEM_CREATE_EXPLICIT_SYNC, MSM_SUBMIT_NO_IMPLICIT, or<br>
EXEC_OBJECT_WRITE).=C2=A0 It seems to be the least surprising thing to do.<=
br></blockquote><div><br></div><div>IMO, the easiest way is just to limit t=
he change to userspace if possible since implicit sync is legacy/something =
we want to deprecate over time.=C2=A0=C2=A0</div><div><br></div><div>Anothe=
r option is to add something like VIRTGPU_EXECBUF_EXPLICIT_SYNC (similar to=
 MSM_SUBMIT_NO_IMPLICIT), where the reservation objects are waited on / add=
ed to without that flag.=C2=A0 Since explicit sync will need new hypercalls=
/params and is a major, that feature is expected to be independent of conte=
xt types.</div><div><br></div><div>With that option, waiting on the reserva=
tion object would just be another bug fix=C2=A0+ addition to 5.16 (perhaps =
by you) so we can proceed in parallel faster.=C2=A0 VIRTGPU_EXECBUF_EXPLICI=
T_SYNC (or an equivalent) would be added later.</div><div><br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
<br>
<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vfpriv-&gt;num_rings =3D value;<br>
&gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0default:<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D -EINVAL;<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out_unlock;<br>
&gt;&gt; &gt;&gt; &gt; --<br>
&gt;&gt; &gt;&gt; &gt; 2.33.0.153.gba50c8fa24-goog<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; ----------------------------------------------------=
-----------------<br>
&gt;&gt; &gt;&gt; &gt; To unsubscribe, e-mail: <a href=3D"mailto:virtio-dev=
-unsubscribe@lists.oasis-open.org" target=3D"_blank">virtio-dev-unsubscribe=
@lists.oasis-open.org</a><br>
&gt;&gt; &gt;&gt; &gt; For additional commands, e-mail: <a href=3D"mailto:v=
irtio-dev-help@lists.oasis-open.org" target=3D"_blank">virtio-dev-help@list=
s.oasis-open.org</a><br>
&gt;&gt; &gt;&gt; &gt;<br>
</blockquote></div></div>

--00000000000095b6a005cbfe94ac--
