Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2889340B63D
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 19:53:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39AE06E520;
	Tue, 14 Sep 2021 17:53:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 646666E520
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 17:52:58 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id z24so198955ejf.5
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 10:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8cv1FBpy/7qLFuVsfQA5G/dGaflDdRbvC1Gj6UGLgUg=;
 b=AedXe/WUK1X2j6Zb1qbxsiF7/LWXH6IklKceyJPiTNXJdidOUbV07S1TJzn01vI0NO
 9iY3wANg1oNgeczpU8Yf7XGOmicgMuL4MpqhIXrFOJjdvKQE2BGELYs/ASpyS3x72A9I
 zl4gyqCKrhTU1wEPybRiJ/Cat5O31W/UpRPOElo5b5XHEhhHjPmGExuhaANq6X4qk44U
 ur92FNg3maLr5gDNFjjkAgKXbDL5+8Qs51GvbogsN6G8Xps0neKGhNrR9NZlrSrSY+zE
 2cBVOBBOgoDuLmbdBRHBHmV2pC90RnfgSqu+fSm7OMTmns2lapXkcaqUbqqcNI64AVGq
 qlLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8cv1FBpy/7qLFuVsfQA5G/dGaflDdRbvC1Gj6UGLgUg=;
 b=00+f2IGjBx4K/KIffrOobTOft+hso/ikntIIoYZ/TI7/SRpxrT86J82P2CZFYGhi1t
 pIyWUGG8Z5jel94eG57Cw2mJB5oIcx8ovk0mS9UOlpj7bguTusRdELc+hwnYSXEj7MI6
 Z3WWlPj9dbb5oSHEKcpsUllnNlFqi4U9epxLF67T9BgoI0VaQxY4PsR4cwy+KG0OTSOE
 G61JzjKnh7yPr8zvPpW7f4GRurMAKShJJGM+CEn1c2QQPEuBOwWiga3tqBlDFzaQ6HQx
 6GUt/85FJdcrNIfqo9WnMueBxKTF++xLcA+2MRNmTRvSXoFKQnzMQir9E99nV7iJCSbo
 0oTQ==
X-Gm-Message-State: AOAM533ofpVH6RSFO9BP+rgd1dtrDMAZv4zzrOyPdvqKOcJkoTZA9XAS
 ynRgpM3E+6bmD4Q1gHu5h58cFjGTOFHJSrHYDg4=
X-Google-Smtp-Source: ABdhPJw6EdwKOpBTBMX8hHHeWZvx959zYhOy3haqrzKZd0m9KEU4Tqe/6dmHOYMocGIh+G8hsDlM6Gc0U5EV4OwVPkI=
X-Received: by 2002:a17:906:308d:: with SMTP id
 13mr19834564ejv.570.1631641976640; 
 Tue, 14 Sep 2021 10:52:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210909013717.861-1-gurchetansingh@chromium.org>
 <20210909013717.861-10-gurchetansingh@chromium.org>
 <CAPaKu7RB0hHTW9_WoOvp1X1Wz8L65ptSsJXKcPu22Rm9NKjAFQ@mail.gmail.com>
 <CAAfnVBmRKWgGQ2NXQSK9T4Hc95Yh_bpb=TGvyZgwMzDJdghrTQ@mail.gmail.com>
 <CAPaKu7SvzWPDAOKVSot9W4M880Hgdjm=RbKVrU=nthOaXh_hEg@mail.gmail.com>
 <CAAfnVB=+fpYhnjpbAzAgvYBnH9amRx8Nn0kkSR3PBcqPpjWLbw@mail.gmail.com>
In-Reply-To: <CAAfnVB=+fpYhnjpbAzAgvYBnH9amRx8Nn0kkSR3PBcqPpjWLbw@mail.gmail.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Tue, 14 Sep 2021 10:52:45 -0700
Message-ID: <CAPaKu7R8RBTE7Njm3HY9kUq-3GGMVWVKf9RHYU9M7UGcSBuPhw@mail.gmail.com>
Subject: Re: [virtio-dev] [PATCH v1 09/12] drm/virtio: implement context init:
 allocate an array of fence contexts
To: Gurchetan Singh <gurchetansingh@chromium.org>
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>,
 virtio-dev@lists.oasis-open.org, Gerd Hoffmann <kraxel@redhat.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

,On Mon, Sep 13, 2021 at 6:57 PM Gurchetan Singh
<gurchetansingh@chromium.org> wrote:
>
>
>
>
> On Mon, Sep 13, 2021 at 11:52 AM Chia-I Wu <olvaffe@gmail.com> wrote:
>>
>> .
>>
>> On Mon, Sep 13, 2021 at 10:48 AM Gurchetan Singh
>> <gurchetansingh@chromium.org> wrote:
>> >
>> >
>> >
>> > On Fri, Sep 10, 2021 at 12:33 PM Chia-I Wu <olvaffe@gmail.com> wrote:
>> >>
>> >> On Wed, Sep 8, 2021 at 6:37 PM Gurchetan Singh
>> >> <gurchetansingh@chromium.org> wrote:
>> >> >
>> >> > We don't want fences from different 3D contexts (virgl, gfxstream,
>> >> > venus) to be on the same timeline.  With explicit context creation,
>> >> > we can specify the number of ring each context wants.
>> >> >
>> >> > Execbuffer can specify which ring to use.
>> >> >
>> >> > Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
>> >> > Acked-by: Lingfeng Yang <lfy@google.com>
>> >> > ---
>> >> >  drivers/gpu/drm/virtio/virtgpu_drv.h   |  3 +++
>> >> >  drivers/gpu/drm/virtio/virtgpu_ioctl.c | 34 ++++++++++++++++++++++++--
>> >> >  2 files changed, 35 insertions(+), 2 deletions(-)
>> >> >
>> >> > diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
>> >> > index a5142d60c2fa..cca9ab505deb 100644
>> >> > --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
>> >> > +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
>> >> > @@ -56,6 +56,7 @@
>> >> >  #define STATE_ERR 2
>> >> >
>> >> >  #define MAX_CAPSET_ID 63
>> >> > +#define MAX_RINGS 64
>> >> >
>> >> >  struct virtio_gpu_object_params {
>> >> >         unsigned long size;
>> >> > @@ -263,6 +264,8 @@ struct virtio_gpu_fpriv {
>> >> >         uint32_t ctx_id;
>> >> >         uint32_t context_init;
>> >> >         bool context_created;
>> >> > +       uint32_t num_rings;
>> >> > +       uint64_t base_fence_ctx;
>> >> >         struct mutex context_lock;
>> >> >  };
>> >> >
>> >> > diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
>> >> > index f51f3393a194..262f79210283 100644
>> >> > --- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
>> >> > +++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
>> >> > @@ -99,6 +99,11 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
>> >> >         int in_fence_fd = exbuf->fence_fd;
>> >> >         int out_fence_fd = -1;
>> >> >         void *buf;
>> >> > +       uint64_t fence_ctx;
>> >> > +       uint32_t ring_idx;
>> >> > +
>> >> > +       fence_ctx = vgdev->fence_drv.context;
>> >> > +       ring_idx = 0;
>> >> >
>> >> >         if (vgdev->has_virgl_3d == false)
>> >> >                 return -ENOSYS;
>> >> > @@ -106,6 +111,17 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
>> >> >         if ((exbuf->flags & ~VIRTGPU_EXECBUF_FLAGS))
>> >> >                 return -EINVAL;
>> >> >
>> >> > +       if ((exbuf->flags & VIRTGPU_EXECBUF_RING_IDX)) {
>> >> > +               if (exbuf->ring_idx >= vfpriv->num_rings)
>> >> > +                       return -EINVAL;
>> >> > +
>> >> > +               if (!vfpriv->base_fence_ctx)
>> >> > +                       return -EINVAL;
>> >> > +
>> >> > +               fence_ctx = vfpriv->base_fence_ctx;
>> >> > +               ring_idx = exbuf->ring_idx;
>> >> > +       }
>> >> > +
>> >> >         exbuf->fence_fd = -1;
>> >> >
>> >> >         virtio_gpu_create_context(dev, file);
>> >> > @@ -173,7 +189,7 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
>> >> >                         goto out_memdup;
>> >> >         }
>> >> >
>> >> > -       out_fence = virtio_gpu_fence_alloc(vgdev, vgdev->fence_drv.context, 0);
>> >> > +       out_fence = virtio_gpu_fence_alloc(vgdev, fence_ctx, ring_idx);
>> >> >         if(!out_fence) {
>> >> >                 ret = -ENOMEM;
>> >> >                 goto out_unresv;
>> >> > @@ -691,7 +707,7 @@ static int virtio_gpu_context_init_ioctl(struct drm_device *dev,
>> >> >                 return -EINVAL;
>> >> >
>> >> >         /* Number of unique parameters supported at this time. */
>> >> > -       if (num_params > 1)
>> >> > +       if (num_params > 2)
>> >> >                 return -EINVAL;
>> >> >
>> >> >         ctx_set_params = memdup_user(u64_to_user_ptr(args->ctx_set_params),
>> >> > @@ -731,6 +747,20 @@ static int virtio_gpu_context_init_ioctl(struct drm_device *dev,
>> >> >
>> >> >                         vfpriv->context_init |= value;
>> >> >                         break;
>> >> > +               case VIRTGPU_CONTEXT_PARAM_NUM_RINGS:
>> >> > +                       if (vfpriv->base_fence_ctx) {
>> >> > +                               ret = -EINVAL;
>> >> > +                               goto out_unlock;
>> >> > +                       }
>> >> > +
>> >> > +                       if (value > MAX_RINGS) {
>> >> > +                               ret = -EINVAL;
>> >> > +                               goto out_unlock;
>> >> > +                       }
>> >> > +
>> >> > +                       vfpriv->base_fence_ctx = dma_fence_context_alloc(value);
>> >> With multiple fence contexts, we should do something about implicit fencing.
>> >>
>> >> The classic example is Mesa and X server.  When both use virgl and the
>> >> global fence context, no dma_fence_wait is fine.  But when Mesa uses
>> >> venus and the ring fence context, dma_fence_wait should be inserted.
>> >
>> >
>> >  If I read your comment correctly, the use case is:
>> >
>> > context A (venus)
>> >
>> > sharing a render target with
>> >
>> > context B (Xserver backed virgl)
>> >
>> > ?
>> >
>> > Which function do you envisage dma_fence_wait(...) to be inserted?  Doesn't implicit synchronization mean there's no fence to share between contexts (only buffer objects)?
>>
>> Fences can be implicitly shared via reservation objects associated
>> with buffer objects.
>>
>> > It may be possible to wait on the reservation object associated with a buffer object from a different context (userspace can also do DRM_IOCTL_VIRTGPU_WAIT), but not sure if that's what you're looking for.
>>
>> Right, that's what I am looking for.  Userspace expects implicit
>> fencing to work.  While there are works to move the userspace to do
>> explicit fencing, it is not there yet in general and we can't require
>> the userspace to do explicit fencing or DRM_IOCTL_VIRTGPU_WAIT.
>
>
> Another option would be to use the upcoming DMA_BUF_IOCTL_EXPORT_SYNC_FILE + VIRTGPU_EXECBUF_FENCE_FD_IN (which checks the dma_fence context).
That requires the X server / compositors to be modified.  For example,
venus works under Android (where there is explicit fencing) or under a
modified compositor (which does DMA_BUF_IOCTL_EXPORT_SYNC_FILE or
DRM_IOCTL_VIRTGPU_WAIT).  But it does not work too well with an
unmodified X server.

>
> Generally, if it only requires virgl changes, userspace changes are fine since OpenGL drivers implement implicit sync in many ways.  Waiting on the reservation object in the kernel is fine too though.
I don't think we want to assume virgl to be the only consumer of
dma-bufs, despite that it is the most common use case.

>
> Though venus doesn't use the NUM_RINGS param yet.  Getting all permutations of context type + display integration working would take some time (patchset mostly tested with wayland + gfxstream/Android [no implicit sync]).
>
> WDYT of someone figuring out virgl/venus interop later, independently of this patchset?

I think we should understand the implications of multiple fence
contexts better, even if some changes are not included in this
patchset.

From my view, we don't need implicit fencing in most cases and
implicit fencing should be considered a legacy path.  But X server /
compositors today happen to require it.  Other drivers seem to use a
flag to control whether implicit fences are set up or waited (e.g.,
AMDGPU_GEM_CREATE_EXPLICIT_SYNC, MSM_SUBMIT_NO_IMPLICIT, or
EXEC_OBJECT_WRITE).  It seems to be the least surprising thing to do.


>
>>
>>
>>
>>
>> >
>> >>
>> >>
>> >> > +                       vfpriv->num_rings = value;
>> >> > +                       break;
>> >> >                 default:
>> >> >                         ret = -EINVAL;
>> >> >                         goto out_unlock;
>> >> > --
>> >> > 2.33.0.153.gba50c8fa24-goog
>> >> >
>> >> >
>> >> > ---------------------------------------------------------------------
>> >> > To unsubscribe, e-mail: virtio-dev-unsubscribe@lists.oasis-open.org
>> >> > For additional commands, e-mail: virtio-dev-help@lists.oasis-open.org
>> >> >
