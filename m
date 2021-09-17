Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA5A40EE92
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 03:07:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07E8D6EA54;
	Fri, 17 Sep 2021 01:07:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 788B86EA54
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 01:07:00 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id x27so25909263lfu.5
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 18:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Jsh4uOg+deq2eeZ/agcGKShwP5MDbGUASvB4Cfvw8Ac=;
 b=lHD3VY83Ir/JQFQCJh5FsIXwjozMWi5qS/ugRn4Ua0RQv1685HB9smWyjpo+QXPbW/
 tu1VXDgKqWxfbxmRIvyXmTwKC2tWSAW87IJfeEddmsj6751mYlkaAqLlzvzg8lUD169R
 YM0yHomeKZmvmuTtmewi/lvfjIqft3VzYyYRE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Jsh4uOg+deq2eeZ/agcGKShwP5MDbGUASvB4Cfvw8Ac=;
 b=1lDNIYlqXvBxMurpZ9qWxiHzSusV8zWm1iEKYfeGT+r5/ZQfOaspBCcfGdvbeO91QO
 pT0HPzOqegBupG/CblBYqSAXGjqSoUuwcOdVrHVqud1LUsTI8lZxUaJo3Juyl5fKntKU
 6DwZ1dRrYH0pspyjqWvbuytZXU1dcT8fm0WRPxfR9iMScQCA+Lt6H27xvzwXiwXf8pRK
 VOAZUa4ltLL/2uPB5dagXhCz8HQkOwKzbC2l2oDjlb8Pkpx2gM2cWrDZw/wuM4LGa6+t
 H0FuwveZWhW8pXF45RmXaOkIsMS+QWTiEFEa1IRBeTuoccP40RZXSJ19cT5j+zr9jSl9
 JvMA==
X-Gm-Message-State: AOAM531EoOq2glfRY1T1R4iFWzWBLd+Cq2DXJXucDr9FgF5L9HUaREmO
 dHFBqnV5Eo1dFVGhllZx52tmds7cF1fUeg==
X-Google-Smtp-Source: ABdhPJybY8VBpY5k3CYmKnTR0CnWwA1F8/qc9BRgzYFuDKk/cGvai476m3L66mqUGMleRkxM9Z7EBA==
X-Received: by 2002:ac2:4e05:: with SMTP id e5mr5908868lfr.632.1631840818174; 
 Thu, 16 Sep 2021 18:06:58 -0700 (PDT)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com.
 [209.85.167.50])
 by smtp.gmail.com with ESMTPSA id s2sm518985lji.1.2021.09.16.18.06.57
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Sep 2021 18:06:57 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id y28so25844732lfb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 18:06:57 -0700 (PDT)
X-Received: by 2002:a2e:bb93:: with SMTP id y19mr7064519lje.79.1631840816595; 
 Thu, 16 Sep 2021 18:06:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210909013717.861-1-gurchetansingh@chromium.org>
 <20210909013717.861-10-gurchetansingh@chromium.org>
 <CAPaKu7RB0hHTW9_WoOvp1X1Wz8L65ptSsJXKcPu22Rm9NKjAFQ@mail.gmail.com>
 <CAAfnVBmRKWgGQ2NXQSK9T4Hc95Yh_bpb=TGvyZgwMzDJdghrTQ@mail.gmail.com>
 <CAPaKu7SvzWPDAOKVSot9W4M880Hgdjm=RbKVrU=nthOaXh_hEg@mail.gmail.com>
 <CAAfnVB=+fpYhnjpbAzAgvYBnH9amRx8Nn0kkSR3PBcqPpjWLbw@mail.gmail.com>
 <CAPaKu7R8RBTE7Njm3HY9kUq-3GGMVWVKf9RHYU9M7UGcSBuPhw@mail.gmail.com>
 <CAAfnVBkF7rjbcCadiYXQcnYxZ6AW72=bA6tqu4EjjszeKeWEHQ@mail.gmail.com>
 <CAPaKu7TLeTAPNnKeF-XkY68VorHGBEDb2XbGAWi2JU89y10qig@mail.gmail.com>
In-Reply-To: <CAPaKu7TLeTAPNnKeF-XkY68VorHGBEDb2XbGAWi2JU89y10qig@mail.gmail.com>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Thu, 16 Sep 2021 18:06:45 -0700
X-Gmail-Original-Message-ID: <CAAfnVB=v-NpsBMUVfeKTVrXbUCdQ++So=9mi5OAr19iedPuEjw@mail.gmail.com>
Message-ID: <CAAfnVB=v-NpsBMUVfeKTVrXbUCdQ++So=9mi5OAr19iedPuEjw@mail.gmail.com>
Subject: Re: [virtio-dev] [PATCH v1 09/12] drm/virtio: implement context init:
 allocate an array of fence contexts
To: Chia-I Wu <olvaffe@gmail.com>
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>,
 virtio-dev@lists.oasis-open.org, Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000034a7b305cc268cab"
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

--00000000000034a7b305cc268cab
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 15, 2021 at 5:11 PM Chia-I Wu <olvaffe@gmail.com> wrote:

>  i
>
> On Tue, Sep 14, 2021 at 6:26 PM Gurchetan Singh
> <gurchetansingh@chromium.org> wrote:
> >
> >
> >
> > On Tue, Sep 14, 2021 at 10:53 AM Chia-I Wu <olvaffe@gmail.com> wrote:
> >>
> >> ,On Mon, Sep 13, 2021 at 6:57 PM Gurchetan Singh
> >> <gurchetansingh@chromium.org> wrote:
> >> >
> >> >
> >> >
> >> >
> >> > On Mon, Sep 13, 2021 at 11:52 AM Chia-I Wu <olvaffe@gmail.com> wrote:
> >> >>
> >> >> .
> >> >>
> >> >> On Mon, Sep 13, 2021 at 10:48 AM Gurchetan Singh
> >> >> <gurchetansingh@chromium.org> wrote:
> >> >> >
> >> >> >
> >> >> >
> >> >> > On Fri, Sep 10, 2021 at 12:33 PM Chia-I Wu <olvaffe@gmail.com>
> wrote:
> >> >> >>
> >> >> >> On Wed, Sep 8, 2021 at 6:37 PM Gurchetan Singh
> >> >> >> <gurchetansingh@chromium.org> wrote:
> >> >> >> >
> >> >> >> > We don't want fences from different 3D contexts (virgl,
> gfxstream,
> >> >> >> > venus) to be on the same timeline.  With explicit context
> creation,
> >> >> >> > we can specify the number of ring each context wants.
> >> >> >> >
> >> >> >> > Execbuffer can specify which ring to use.
> >> >> >> >
> >> >> >> > Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
> >> >> >> > Acked-by: Lingfeng Yang <lfy@google.com>
> >> >> >> > ---
> >> >> >> >  drivers/gpu/drm/virtio/virtgpu_drv.h   |  3 +++
> >> >> >> >  drivers/gpu/drm/virtio/virtgpu_ioctl.c | 34
> ++++++++++++++++++++++++--
> >> >> >> >  2 files changed, 35 insertions(+), 2 deletions(-)
> >> >> >> >
> >> >> >> > diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h
> b/drivers/gpu/drm/virtio/virtgpu_drv.h
> >> >> >> > index a5142d60c2fa..cca9ab505deb 100644
> >> >> >> > --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
> >> >> >> > +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
> >> >> >> > @@ -56,6 +56,7 @@
> >> >> >> >  #define STATE_ERR 2
> >> >> >> >
> >> >> >> >  #define MAX_CAPSET_ID 63
> >> >> >> > +#define MAX_RINGS 64
> >> >> >> >
> >> >> >> >  struct virtio_gpu_object_params {
> >> >> >> >         unsigned long size;
> >> >> >> > @@ -263,6 +264,8 @@ struct virtio_gpu_fpriv {
> >> >> >> >         uint32_t ctx_id;
> >> >> >> >         uint32_t context_init;
> >> >> >> >         bool context_created;
> >> >> >> > +       uint32_t num_rings;
> >> >> >> > +       uint64_t base_fence_ctx;
> >> >> >> >         struct mutex context_lock;
> >> >> >> >  };
> >> >> >> >
> >> >> >> > diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> >> >> >> > index f51f3393a194..262f79210283 100644
> >> >> >> > --- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> >> >> >> > +++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> >> >> >> > @@ -99,6 +99,11 @@ static int
> virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
> >> >> >> >         int in_fence_fd = exbuf->fence_fd;
> >> >> >> >         int out_fence_fd = -1;
> >> >> >> >         void *buf;
> >> >> >> > +       uint64_t fence_ctx;
> >> >> >> > +       uint32_t ring_idx;
> >> >> >> > +
> >> >> >> > +       fence_ctx = vgdev->fence_drv.context;
> >> >> >> > +       ring_idx = 0;
> >> >> >> >
> >> >> >> >         if (vgdev->has_virgl_3d == false)
> >> >> >> >                 return -ENOSYS;
> >> >> >> > @@ -106,6 +111,17 @@ static int
> virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
> >> >> >> >         if ((exbuf->flags & ~VIRTGPU_EXECBUF_FLAGS))
> >> >> >> >                 return -EINVAL;
> >> >> >> >
> >> >> >> > +       if ((exbuf->flags & VIRTGPU_EXECBUF_RING_IDX)) {
> >> >> >> > +               if (exbuf->ring_idx >= vfpriv->num_rings)
> >> >> >> > +                       return -EINVAL;
> >> >> >> > +
> >> >> >> > +               if (!vfpriv->base_fence_ctx)
> >> >> >> > +                       return -EINVAL;
> >> >> >> > +
> >> >> >> > +               fence_ctx = vfpriv->base_fence_ctx;
> >> >> >> > +               ring_idx = exbuf->ring_idx;
> >> >> >> > +       }
> >> >> >> > +
> >> >> >> >         exbuf->fence_fd = -1;
> >> >> >> >
> >> >> >> >         virtio_gpu_create_context(dev, file);
> >> >> >> > @@ -173,7 +189,7 @@ static int
> virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
> >> >> >> >                         goto out_memdup;
> >> >> >> >         }
> >> >> >> >
> >> >> >> > -       out_fence = virtio_gpu_fence_alloc(vgdev,
> vgdev->fence_drv.context, 0);
> >> >> >> > +       out_fence = virtio_gpu_fence_alloc(vgdev, fence_ctx,
> ring_idx);
> >> >> >> >         if(!out_fence) {
> >> >> >> >                 ret = -ENOMEM;
> >> >> >> >                 goto out_unresv;
> >> >> >> > @@ -691,7 +707,7 @@ static int
> virtio_gpu_context_init_ioctl(struct drm_device *dev,
> >> >> >> >                 return -EINVAL;
> >> >> >> >
> >> >> >> >         /* Number of unique parameters supported at this time.
> */
> >> >> >> > -       if (num_params > 1)
> >> >> >> > +       if (num_params > 2)
> >> >> >> >                 return -EINVAL;
> >> >> >> >
> >> >> >> >         ctx_set_params =
> memdup_user(u64_to_user_ptr(args->ctx_set_params),
> >> >> >> > @@ -731,6 +747,20 @@ static int
> virtio_gpu_context_init_ioctl(struct drm_device *dev,
> >> >> >> >
> >> >> >> >                         vfpriv->context_init |= value;
> >> >> >> >                         break;
> >> >> >> > +               case VIRTGPU_CONTEXT_PARAM_NUM_RINGS:
> >> >> >> > +                       if (vfpriv->base_fence_ctx) {
> >> >> >> > +                               ret = -EINVAL;
> >> >> >> > +                               goto out_unlock;
> >> >> >> > +                       }
> >> >> >> > +
> >> >> >> > +                       if (value > MAX_RINGS) {
> >> >> >> > +                               ret = -EINVAL;
> >> >> >> > +                               goto out_unlock;
> >> >> >> > +                       }
> >> >> >> > +
> >> >> >> > +                       vfpriv->base_fence_ctx =
> dma_fence_context_alloc(value);
> >> >> >> With multiple fence contexts, we should do something about
> implicit fencing.
> >> >> >>
> >> >> >> The classic example is Mesa and X server.  When both use virgl
> and the
> >> >> >> global fence context, no dma_fence_wait is fine.  But when Mesa
> uses
> >> >> >> venus and the ring fence context, dma_fence_wait should be
> inserted.
> >> >> >
> >> >> >
> >> >> >  If I read your comment correctly, the use case is:
> >> >> >
> >> >> > context A (venus)
> >> >> >
> >> >> > sharing a render target with
> >> >> >
> >> >> > context B (Xserver backed virgl)
> >> >> >
> >> >> > ?
> >> >> >
> >> >> > Which function do you envisage dma_fence_wait(...) to be
> inserted?  Doesn't implicit synchronization mean there's no fence to share
> between contexts (only buffer objects)?
> >> >>
> >> >> Fences can be implicitly shared via reservation objects associated
> >> >> with buffer objects.
> >> >>
> >> >> > It may be possible to wait on the reservation object associated
> with a buffer object from a different context (userspace can also do
> DRM_IOCTL_VIRTGPU_WAIT), but not sure if that's what you're looking for.
> >> >>
> >> >> Right, that's what I am looking for.  Userspace expects implicit
> >> >> fencing to work.  While there are works to move the userspace to do
> >> >> explicit fencing, it is not there yet in general and we can't require
> >> >> the userspace to do explicit fencing or DRM_IOCTL_VIRTGPU_WAIT.
> >> >
> >> >
> >> > Another option would be to use the upcoming
> DMA_BUF_IOCTL_EXPORT_SYNC_FILE + VIRTGPU_EXECBUF_FENCE_FD_IN (which checks
> the dma_fence context).
> >> That requires the X server / compositors to be modified.  For example,
> >> venus works under Android (where there is explicit fencing) or under a
> >> modified compositor (which does DMA_BUF_IOCTL_EXPORT_SYNC_FILE or
> >> DRM_IOCTL_VIRTGPU_WAIT).  But it does not work too well with an
> >> unmodified X server.
> >
> >
> > Some semi-recent virgl modifications will be needed regardless for
> interop, such as VIRGL_CAP_V2_UNTYPED_RESOURCE (?).
> >
> > Not sure aren't too many virgl users (most developers)
> >
> > Does Xserver just pick up the latest Mesa release (including
> virgl/venus)?  Suppose context types land in 5.16, the userspace changes
> land (both Venus/Virgl) in 21.2 stable releases.
> >
> > https://docs.mesa3d.org/release-calendar.html
> >
> >>
> >> >
> >> > Generally, if it only requires virgl changes, userspace changes are
> fine since OpenGL drivers implement implicit sync in many ways.  Waiting on
> the reservation object in the kernel is fine too though.
> >> I don't think we want to assume virgl to be the only consumer of
> >> dma-bufs, despite that it is the most common use case.
> >>
> >>
> >> >
> >> > Though venus doesn't use the NUM_RINGS param yet.  Getting all
> permutations of context type + display integration working would take some
> time (patchset mostly tested with wayland + gfxstream/Android [no implicit
> sync]).
> >> >
> >> > WDYT of someone figuring out virgl/venus interop later, independently
> of this patchset?
> >>
> >> I think we should understand the implications of multiple fence
> >> contexts better, even if some changes are not included in this
> >> patchset.
> >>
> >> From my view, we don't need implicit fencing in most cases and
> >> implicit fencing should be considered a legacy path.  But X server /
> >> compositors today happen to require it.  Other drivers seem to use a
> >> flag to control whether implicit fences are set up or waited (e.g.,
> >> AMDGPU_GEM_CREATE_EXPLICIT_SYNC, MSM_SUBMIT_NO_IMPLICIT, or
> >> EXEC_OBJECT_WRITE).  It seems to be the least surprising thing to do.
> >
> >
> > IMO, the easiest way is just to limit the change to userspace if
> possible since implicit sync is legacy/something we want to deprecate over
> time.
> >
> > Another option is to add something like VIRTGPU_EXECBUF_EXPLICIT_SYNC
> (similar to MSM_SUBMIT_NO_IMPLICIT), where the reservation objects are
> waited on / added to without that flag.  Since explicit sync will need new
> hypercalls/params and is a major, that feature is expected to be
> independent of context types.
> >
> > With that option, waiting on the reservation object would just be
> another bug fix + addition to 5.16 (perhaps by you) so we can proceed in
> parallel faster.  VIRTGPU_EXECBUF_EXPLICIT_SYNC (or an equivalent) would be
> added later.
>
> It is fine to add it later, but VIRTGPU_EXECBUF_EXPLICIT_SYNC sounds
> better to me than a userspace solution.  I don't think we need a new
> hypercall as the wait can be a guest-side wait, similar to how
> VIRTGPU_EXECBUF_FENCE_FD_IN is a guest-side wait.  The flag can also
> suppress VIRTIO_GPU_FLAG_FENCE and make the SUBMIT_3D hypercall
> cheaper.
>

Okay, I will add a note regarding the plan in patch 9 of v2 for context
types that need implicit sync.


>
> Even before this patchset, unless I miss something, it seems the fact
> that we have a global fence context and assume all host GL contexts
> are on the same timeline is not exactly correct.  When glFlush is
> called on two host GL contexts, the flush order is not exactly the
> same as the execution order.  But that is a different issue that can
> be solved in virglrenderer.
>
>
> >
> >>
> >>
> >> >
> >> >>
> >> >>
> >> >>
> >> >>
> >> >> >
> >> >> >>
> >> >> >>
> >> >> >> > +                       vfpriv->num_rings = value;
> >> >> >> > +                       break;
> >> >> >> >                 default:
> >> >> >> >                         ret = -EINVAL;
> >> >> >> >                         goto out_unlock;
> >> >> >> > --
> >> >> >> > 2.33.0.153.gba50c8fa24-goog
> >> >> >> >
> >> >> >> >
> >> >> >> >
> ---------------------------------------------------------------------
> >> >> >> > To unsubscribe, e-mail:
> virtio-dev-unsubscribe@lists.oasis-open.org
> >> >> >> > For additional commands, e-mail:
> virtio-dev-help@lists.oasis-open.org
> >> >> >> >
>

--00000000000034a7b305cc268cab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 15, 2021 at 5:11 PM Chia-=
I Wu &lt;<a href=3D"mailto:olvaffe@gmail.com">olvaffe@gmail.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=C2=A0i<br>
<br>
On Tue, Sep 14, 2021 at 6:26 PM Gurchetan Singh<br>
&lt;<a href=3D"mailto:gurchetansingh@chromium.org" target=3D"_blank">gurche=
tansingh@chromium.org</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Tue, Sep 14, 2021 at 10:53 AM Chia-I Wu &lt;<a href=3D"mailto:olvaf=
fe@gmail.com" target=3D"_blank">olvaffe@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; ,On Mon, Sep 13, 2021 at 6:57 PM Gurchetan Singh<br>
&gt;&gt; &lt;<a href=3D"mailto:gurchetansingh@chromium.org" target=3D"_blan=
k">gurchetansingh@chromium.org</a>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; On Mon, Sep 13, 2021 at 11:52 AM Chia-I Wu &lt;<a href=3D"mai=
lto:olvaffe@gmail.com" target=3D"_blank">olvaffe@gmail.com</a>&gt; wrote:<b=
r>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; .<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; On Mon, Sep 13, 2021 at 10:48 AM Gurchetan Singh<br>
&gt;&gt; &gt;&gt; &lt;<a href=3D"mailto:gurchetansingh@chromium.org" target=
=3D"_blank">gurchetansingh@chromium.org</a>&gt; wrote:<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; On Fri, Sep 10, 2021 at 12:33 PM Chia-I Wu &lt;<a hr=
ef=3D"mailto:olvaffe@gmail.com" target=3D"_blank">olvaffe@gmail.com</a>&gt;=
 wrote:<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; On Wed, Sep 8, 2021 at 6:37 PM Gurchetan Singh<b=
r>
&gt;&gt; &gt;&gt; &gt;&gt; &lt;<a href=3D"mailto:gurchetansingh@chromium.or=
g" target=3D"_blank">gurchetansingh@chromium.org</a>&gt; wrote:<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; We don&#39;t want fences from different 3D =
contexts (virgl, gfxstream,<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; venus) to be on the same timeline.=C2=A0 Wi=
th explicit context creation,<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; we can specify the number of ring each cont=
ext wants.<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; Execbuffer can specify which ring to use.<b=
r>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; Signed-off-by: Gurchetan Singh &lt;<a href=
=3D"mailto:gurchetansingh@chromium.org" target=3D"_blank">gurchetansingh@ch=
romium.org</a>&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; Acked-by: Lingfeng Yang &lt;<a href=3D"mail=
to:lfy@google.com" target=3D"_blank">lfy@google.com</a>&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; ---<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 drivers/gpu/drm/virtio/virtgpu_drv.h=
=C2=A0 =C2=A0|=C2=A0 3 +++<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 drivers/gpu/drm/virtio/virtgpu_ioctl.=
c | 34 ++++++++++++++++++++++++--<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 2 files changed, 35 insertions(+), 2 =
deletions(-)<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; diff --git a/drivers/gpu/drm/virtio/virtgpu=
_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; index a5142d60c2fa..cca9ab505deb 100644<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; --- a/drivers/gpu/drm/virtio/virtgpu_drv.h<=
br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h<=
br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; @@ -56,6 +56,7 @@<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 #define STATE_ERR 2<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 #define MAX_CAPSET_ID 63<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +#define MAX_RINGS 64<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 struct virtio_gpu_object_params {<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned l=
ong size;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; @@ -263,6 +264,8 @@ struct virtio_gpu_fpriv=
 {<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t c=
tx_id;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t c=
ontext_init;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool conte=
xt_created;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t num_ri=
ngs;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t base_f=
ence_ctx;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct mut=
ex context_lock;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 };<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; diff --git a/drivers/gpu/drm/virtio/virtgpu=
_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; index f51f3393a194..262f79210283 100644<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; --- a/drivers/gpu/drm/virtio/virtgpu_ioctl.=
c<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.=
c<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; @@ -99,6 +99,11 @@ static int virtio_gpu_ex=
ecbuffer_ioctl(struct drm_device *dev, void *data,<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int in_fen=
ce_fd =3D exbuf-&gt;fence_fd;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int out_fe=
nce_fd =3D -1;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void *buf;=
<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t fence_=
ctx;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t ring_i=
dx;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0fence_ctx =3D v=
gdev-&gt;fence_drv.context;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ring_idx =3D 0;=
<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (vgdev-=
&gt;has_virgl_3d =3D=3D false)<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0return -ENOSYS;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; @@ -106,6 +111,17 @@ static int virtio_gpu_=
execbuffer_ioctl(struct drm_device *dev, void *data,<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((exbuf=
-&gt;flags &amp; ~VIRTGPU_EXECBUF_FLAGS))<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if ((exbuf-&gt;=
flags &amp; VIRTGPU_EXECBUF_RING_IDX)) {<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0if (exbuf-&gt;ring_idx &gt;=3D vfpriv-&gt;num_rings)<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0if (!vfpriv-&gt;base_fence_ctx)<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0fence_ctx =3D vfpriv-&gt;base_fence_ctx;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0ring_idx =3D exbuf-&gt;ring_idx;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exbuf-&gt;=
fence_fd =3D -1;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0virtio_gpu=
_create_context(dev, file);<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; @@ -173,7 +189,7 @@ static int virtio_gpu_e=
xecbuffer_ioctl(struct drm_device *dev, void *data,<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out_memdup;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0out_fence =3D v=
irtio_gpu_fence_alloc(vgdev, vgdev-&gt;fence_drv.context, 0);<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0out_fence =3D v=
irtio_gpu_fence_alloc(vgdev, fence_ctx, ring_idx);<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if(!out_fe=
nce) {<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0ret =3D -ENOMEM;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0goto out_unresv;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; @@ -691,7 +707,7 @@ static int virtio_gpu_c=
ontext_init_ioctl(struct drm_device *dev,<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Number =
of unique parameters supported at this time. */<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (num_params =
&gt; 1)<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (num_params =
&gt; 2)<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ctx_set_pa=
rams =3D memdup_user(u64_to_user_ptr(args-&gt;ctx_set_params),<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; @@ -731,6 +747,20 @@ static int virtio_gpu_=
context_init_ioctl(struct drm_device *dev,<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vfpriv-&gt;context_init |=
=3D value;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0case VIRTGPU_CONTEXT_PARAM_NUM_RINGS:<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (vfpriv-&gt;base_fence_ctx) {<b=
r>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =
=3D -EINVAL;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto o=
ut_unlock;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (value &gt; MAX_RINGS) {<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =
=3D -EINVAL;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto o=
ut_unlock;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vfpriv-&gt;base_fence_ctx =3D dma_=
fence_context_alloc(value);<br>
&gt;&gt; &gt;&gt; &gt;&gt; With multiple fence contexts, we should do somet=
hing about implicit fencing.<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; The classic example is Mesa and X server.=C2=A0 =
When both use virgl and the<br>
&gt;&gt; &gt;&gt; &gt;&gt; global fence context, no dma_fence_wait is fine.=
=C2=A0 But when Mesa uses<br>
&gt;&gt; &gt;&gt; &gt;&gt; venus and the ring fence context, dma_fence_wait=
 should be inserted.<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 If I read your comment correctly, the use case=
 is:<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; context A (venus)<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; sharing a render target with<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; context B (Xserver backed virgl)<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; ?<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; Which function do you envisage dma_fence_wait(...) t=
o be inserted?=C2=A0 Doesn&#39;t implicit synchronization mean there&#39;s =
no fence to share between contexts (only buffer objects)?<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Fences can be implicitly shared via reservation objects a=
ssociated<br>
&gt;&gt; &gt;&gt; with buffer objects.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt; It may be possible to wait on the reservation object=
 associated with a buffer object from a different context (userspace can al=
so do DRM_IOCTL_VIRTGPU_WAIT), but not sure if that&#39;s what you&#39;re l=
ooking for.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Right, that&#39;s what I am looking for.=C2=A0 Userspace =
expects implicit<br>
&gt;&gt; &gt;&gt; fencing to work.=C2=A0 While there are works to move the =
userspace to do<br>
&gt;&gt; &gt;&gt; explicit fencing, it is not there yet in general and we c=
an&#39;t require<br>
&gt;&gt; &gt;&gt; the userspace to do explicit fencing or DRM_IOCTL_VIRTGPU=
_WAIT.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Another option would be to use the upcoming DMA_BUF_IOCTL_EXP=
ORT_SYNC_FILE + VIRTGPU_EXECBUF_FENCE_FD_IN (which checks the dma_fence con=
text).<br>
&gt;&gt; That requires the X server / compositors to be modified.=C2=A0 For=
 example,<br>
&gt;&gt; venus works under Android (where there is explicit fencing) or und=
er a<br>
&gt;&gt; modified compositor (which does DMA_BUF_IOCTL_EXPORT_SYNC_FILE or<=
br>
&gt;&gt; DRM_IOCTL_VIRTGPU_WAIT).=C2=A0 But it does not work too well with =
an<br>
&gt;&gt; unmodified X server.<br>
&gt;<br>
&gt;<br>
&gt; Some semi-recent virgl modifications will be needed regardless for int=
erop, such as VIRGL_CAP_V2_UNTYPED_RESOURCE (?).<br>
&gt;<br>
&gt; Not sure aren&#39;t too many virgl users (most developers)<br>
&gt;<br>
&gt; Does Xserver just pick up the latest Mesa release (including virgl/ven=
us)?=C2=A0 Suppose context types land in 5.16, the userspace changes land (=
both Venus/Virgl) in 21.2 stable releases.<br>
&gt;<br>
&gt; <a href=3D"https://docs.mesa3d.org/release-calendar.html" rel=3D"noref=
errer" target=3D"_blank">https://docs.mesa3d.org/release-calendar.html</a><=
br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Generally, if it only requires virgl changes, userspace chang=
es are fine since OpenGL drivers implement implicit sync in many ways.=C2=
=A0 Waiting on the reservation object in the kernel is fine too though.<br>
&gt;&gt; I don&#39;t think we want to assume virgl to be the only consumer =
of<br>
&gt;&gt; dma-bufs, despite that it is the most common use case.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Though venus doesn&#39;t use the NUM_RINGS param yet.=C2=A0 G=
etting all permutations of context type + display integration working would=
 take some time (patchset mostly tested with wayland + gfxstream/Android [n=
o implicit sync]).<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; WDYT of someone figuring out virgl/venus interop later, indep=
endently of this patchset?<br>
&gt;&gt;<br>
&gt;&gt; I think we should understand the implications of multiple fence<br=
>
&gt;&gt; contexts better, even if some changes are not included in this<br>
&gt;&gt; patchset.<br>
&gt;&gt;<br>
&gt;&gt; From my view, we don&#39;t need implicit fencing in most cases and=
<br>
&gt;&gt; implicit fencing should be considered a legacy path.=C2=A0 But X s=
erver /<br>
&gt;&gt; compositors today happen to require it.=C2=A0 Other drivers seem t=
o use a<br>
&gt;&gt; flag to control whether implicit fences are set up or waited (e.g.=
,<br>
&gt;&gt; AMDGPU_GEM_CREATE_EXPLICIT_SYNC, MSM_SUBMIT_NO_IMPLICIT, or<br>
&gt;&gt; EXEC_OBJECT_WRITE).=C2=A0 It seems to be the least surprising thin=
g to do.<br>
&gt;<br>
&gt;<br>
&gt; IMO, the easiest way is just to limit the change to userspace if possi=
ble since implicit sync is legacy/something we want to deprecate over time.=
<br>
&gt;<br>
&gt; Another option is to add something like VIRTGPU_EXECBUF_EXPLICIT_SYNC =
(similar to MSM_SUBMIT_NO_IMPLICIT), where the reservation objects are wait=
ed on / added to without that flag.=C2=A0 Since explicit sync will need new=
 hypercalls/params and is a major, that feature is expected to be independe=
nt of context types.<br>
&gt;<br>
&gt; With that option, waiting on the reservation object would just be anot=
her bug fix + addition to 5.16 (perhaps by you) so we can proceed in parall=
el faster.=C2=A0 VIRTGPU_EXECBUF_EXPLICIT_SYNC (or an equivalent) would be =
added later.<br>
<br>
It is fine to add it later, but VIRTGPU_EXECBUF_EXPLICIT_SYNC sounds<br>
better to me than a userspace solution.=C2=A0 I don&#39;t think we need a n=
ew<br>
hypercall as the wait can be a guest-side wait, similar to how<br>
VIRTGPU_EXECBUF_FENCE_FD_IN is a guest-side wait.=C2=A0 The flag can also<b=
r>
suppress VIRTIO_GPU_FLAG_FENCE and make the SUBMIT_3D hypercall<br>
cheaper.<br></blockquote><div><br></div><div>Okay, I will add a note regard=
ing the plan in patch 9 of v2 for context types that need implicit sync.</d=
iv><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Even before this patchset, unless I miss something, it seems the fact<br>
that we have a global fence context and assume all host GL contexts<br>
are on the same timeline is not exactly correct.=C2=A0 When glFlush is<br>
called on two host GL contexts, the flush order is not exactly the<br>
same as the execution order.=C2=A0 But that is a different issue that can<b=
r>
be solved in virglrenderer.<br>
<br>
<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vfpriv-&gt;num_rings =3D value;<br=
>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0default:<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D -EINVAL;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out_unlock;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; --<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; 2.33.0.153.gba50c8fa24-goog<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; -------------------------------------------=
--------------------------<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; To unsubscribe, e-mail: <a href=3D"mailto:v=
irtio-dev-unsubscribe@lists.oasis-open.org" target=3D"_blank">virtio-dev-un=
subscribe@lists.oasis-open.org</a><br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; For additional commands, e-mail: <a href=3D=
"mailto:virtio-dev-help@lists.oasis-open.org" target=3D"_blank">virtio-dev-=
help@lists.oasis-open.org</a><br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
</blockquote></div></div>

--00000000000034a7b305cc268cab--
