Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 377AF2FE575
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jan 2021 09:53:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB55E6E536;
	Thu, 21 Jan 2021 08:52:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEE6B6E141
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jan 2021 09:51:15 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id b64so24730661qkc.12
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jan 2021 01:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=android.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IPCL/E40PTZ+d1dIo1i9GsY75jeKId+u+Yf9cEQriqo=;
 b=ELKMR37qP4HjvYt3xdnU5n2c1UcX3KMLjCYXObgPZLj6ESWnb4ZgkMphLzc222r/Co
 dUcGbCenZaXjkTgAShIzEIJTYa+FOpq03y/3UB8UHIxi50sRcK9KT5L6Ike/kep7gF2s
 BBQzrrUZAWFf97RIV1H+tLKcz1LHOb+Jo9e2bqGLvObegDoUyuyiRzS6mbnqQxtSw1Ea
 H24/GRAfYn/6n1b4OKlJ6gvBnuSeILcz95gWMYF2xYqLe7Q6GAd2FROuH5R2T87gZAG9
 zTTrkPQLLdnBuTtr0c4irhMi51XV+x/GToNg+DlGwWzak0bNdApaGa7bL2QyXl9l92Gm
 aWQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IPCL/E40PTZ+d1dIo1i9GsY75jeKId+u+Yf9cEQriqo=;
 b=A0T/+XZ0mCT7bFBsZCg1tZAHB2gd9Ft1XmeotUUwAiOWRkGbD8Xo6sqE0p4YXwQW8j
 Ks1tWSACVS4+0Rx7dF3iX0N6nfVrG0FNey+qZmxmoqBhYckgHAMSto65vIF4Zt0RplC2
 ZM69fP/1i2/UIHVUnFcaJqa9Lco5CK+5zNjj8JkzkZoy0DtISHPikD3z1BkTT8DUDXO3
 2zvn7O9bKn7ZuLHikmqSWWuN9IH+Qzn4Db7dkAq2uFgXTG9zD9rLV01JNh63xY/6KVEY
 kWNY7xtG/COWDHLxqjZmXLW8f+pXCO+bJconyAUBZJ03fIerrSX6Ysvaio5N6BXh9n3F
 qbTQ==
X-Gm-Message-State: AOAM530FeTtAXXo082mTrNGm0VX9JsetrvWVe4OhTTDS535OBc1S/f2K
 f02Pugj9GXEIDZkyWwH47TV7kHjhMr5uwtD6aoxqpw==
X-Google-Smtp-Source: ABdhPJw+h9vd215MUpsi+OVt87bGlHhTfSiTfeQbDvThGP1JcM8yFWTtQr1Dict7DvzKTF+2EK/4O3n7KA9sooMOS7w=
X-Received: by 2002:a37:a241:: with SMTP id l62mr8291059qke.482.1611136274602; 
 Wed, 20 Jan 2021 01:51:14 -0800 (PST)
MIME-Version: 1.0
References: <CAKB3++adfpdBHFEyGZ3v2V6zyW+ayg86CLDRKx1ty+OytjYFNw@mail.gmail.com>
 <20210118234057.270930-1-zzyiwei@android.com>
 <CAKMK7uE+7S5q8bU0ibyepb8yQL3QYNjZE+Jwf13+bVfAmoSuhw@mail.gmail.com>
 <CAKB3++aNtrjzFoq4icMWSUvXw7bL69FRM+9t69firXHkiuTwDQ@mail.gmail.com>
 <YAfzxS95Yy86qnBi@phenom.ffwll.local>
In-Reply-To: <YAfzxS95Yy86qnBi@phenom.ffwll.local>
From: =?UTF-8?B?WWl3ZWkgWmhhbmfigI4=?= <zzyiwei@android.com>
Date: Wed, 20 Jan 2021 01:51:03 -0800
Message-ID: <CAKB3++ZYacAN2ZVSGGm0uEDQtowcS9LDPPYCqt6Pj+-WEFxMSQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/virtio: Track total GPU memory for virtio driver
To: Yiwei Zhang <zzyiwei@android.com>, David Airlie <airlied@linux.ie>, 
 Gerd Hoffmann <kraxel@redhat.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:VIRTIO CORE, NET..." <virtualization@lists.linux-foundation.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Android Kernel Team <kernel-team@android.com>
X-Mailman-Approved-At: Thu, 21 Jan 2021 08:52:32 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 20, 2021 at 1:11 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Tue, Jan 19, 2021 at 11:08:12AM -0800, Yiwei Zhang wrote:
> > On Mon, Jan 18, 2021 at 11:03 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > >
> > > On Tue, Jan 19, 2021 at 12:41 AM Yiwei Zhang <zzyiwei@android.com> wrote:
> > > >
> > > > On the success of virtio_gpu_object_create, add size of newly allocated
> > > > bo to the tracled total_mem. In drm_gem_object_funcs.free, after the gem
> > > > bo lost its last refcount, subtract the bo size from the tracked
> > > > total_mem if the original underlying memory allocation is successful.
> > > >
> > > > Signed-off-by: Yiwei Zhang <zzyiwei@android.com>
> > >
> > > Isn't this something that ideally we'd for everyone? Also tracepoint
> > > for showing the total feels like tracepoint abuse, usually we show
> > > totals somewhere in debugfs or similar, and tracepoint just for what's
> > > happening (i.e. which object got deleted/created).
> > >
> > > What is this for exactly?
> > > -Daniel
> > >
> > > > ---
> > > >  drivers/gpu/drm/virtio/Kconfig          |  1 +
> > > >  drivers/gpu/drm/virtio/virtgpu_drv.h    |  4 ++++
> > > >  drivers/gpu/drm/virtio/virtgpu_object.c | 19 +++++++++++++++++++
> > > >  3 files changed, 24 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/virtio/Kconfig b/drivers/gpu/drm/virtio/Kconfig
> > > > index b925b8b1da16..e103b7e883b1 100644
> > > > --- a/drivers/gpu/drm/virtio/Kconfig
> > > > +++ b/drivers/gpu/drm/virtio/Kconfig
> > > > @@ -5,6 +5,7 @@ config DRM_VIRTIO_GPU
> > > >         select DRM_KMS_HELPER
> > > >         select DRM_GEM_SHMEM_HELPER
> > > >         select VIRTIO_DMA_SHARED_BUFFER
> > > > +       select TRACE_GPU_MEM
> > > >         help
> > > >            This is the virtual GPU driver for virtio.  It can be used with
> > > >            QEMU based VMMs (like KVM or Xen).
> > > > diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
> > > > index 6a232553c99b..7c60e7486bc4 100644
> > > > --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
> > > > +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
> > > > @@ -249,6 +249,10 @@ struct virtio_gpu_device {
> > > >         spinlock_t resource_export_lock;
> > > >         /* protects map state and host_visible_mm */
> > > >         spinlock_t host_visible_lock;
> > > > +
> > > > +#ifdef CONFIG_TRACE_GPU_MEM
> > > > +       atomic64_t total_mem;
> > > > +#endif
> > > >  };
> > > >
> > > >  struct virtio_gpu_fpriv {
> > > > diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
> > > > index d69a5b6da553..1e16226cebbe 100644
> > > > --- a/drivers/gpu/drm/virtio/virtgpu_object.c
> > > > +++ b/drivers/gpu/drm/virtio/virtgpu_object.c
> > > > @@ -25,12 +25,29 @@
> > > >
> > > >  #include <linux/dma-mapping.h>
> > > >  #include <linux/moduleparam.h>
> > > > +#ifdef CONFIG_TRACE_GPU_MEM
> > > > +#include <trace/events/gpu_mem.h>
> > > > +#endif
> > > >
> > > >  #include "virtgpu_drv.h"
> > > >
> > > >  static int virtio_gpu_virglrenderer_workaround = 1;
> > > >  module_param_named(virglhack, virtio_gpu_virglrenderer_workaround, int, 0400);
> > > >
> > > > +#ifdef CONFIG_TRACE_GPU_MEM
> > > > +static inline void virtio_gpu_trace_total_mem(struct virtio_gpu_device *vgdev,
> > > > +                                             s64 delta)
> > > > +{
> > > > +       u64 total_mem = atomic64_add_return(delta, &vgdev->total_mem);
> > > > +
> > > > +       trace_gpu_mem_total(0, 0, total_mem);
> > > > +}
> > > > +#else
> > > > +static inline void virtio_gpu_trace_total_mem(struct virtio_gpu_device *, s64)
> > > > +{
> > > > +}
> > > > +#endif
> > > > +
> > > >  int virtio_gpu_resource_id_get(struct virtio_gpu_device *vgdev, uint32_t *resid)
> > > >  {
> > > >         if (virtio_gpu_virglrenderer_workaround) {
> > > > @@ -104,6 +121,7 @@ static void virtio_gpu_free_object(struct drm_gem_object *obj)
> > > >         struct virtio_gpu_device *vgdev = bo->base.base.dev->dev_private;
> > > >
> > > >         if (bo->created) {
> > > > +               virtio_gpu_trace_total_mem(vgdev, -(obj->size));
> > > >                 virtio_gpu_cmd_unref_resource(vgdev, bo);
> > > >                 virtio_gpu_notify(vgdev);
> > > >                 /* completion handler calls virtio_gpu_cleanup_object() */
> > > > @@ -265,6 +283,7 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
> > > >                 virtio_gpu_object_attach(vgdev, bo, ents, nents);
> > > >         }
> > > >
> > > > +       virtio_gpu_trace_total_mem(vgdev, shmem_obj->base.size);
> > > >         *bo_ptr = bo;
> > > >         return 0;
> > > >
> > > > --
> > > > 2.30.0.284.gd98b1dd5eaa7-goog
> > > >
> > >
> > >
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
> >
> > Thanks for your reply! Android Cuttlefish virtual platform is using
> > the virtio-gpu driver, and we currently are carrying this small patch
> > at the downstream side. This is essential for us because:
> > (1) Android has deprecated debugfs on production devices already
> > (2) Android GPU drivers are not DRM based, and this won't change in a
> > short term.
> >
> > Android relies on this tracepoint + eBPF to make the GPU memory totals
> > available at runtime on production devices, which has been enforced
> > already. Not only game developers can have a reliable kernel total GPU
> > memory to look at, but also Android leverages this to take GPU memory
> > usage out from the system lost ram.
> >
> > I'm not sure whether the other DRM drivers would like to integrate
> > this tracepoint(maybe upstream drivers will move away from debugfs
> > later as well?), but at least we hope virtio-gpu can take this.
>
> There's already another proposal from Android people for tracking dma-buf
> (in dma-buf heaps/ion) usage. I think we need something which is overall
> integrated, otherwise we have a complete mess of partial solutions.
>
> Also there's work going on to add cgroups support to gpu drivers (pushed
> by amd and intel folks, latest rfc have been quite old), so that's another
> proposal for gpu memory usage tracking.
>
> Also for upstream we need something which works with upstream gpu drivers
> (even if you don't end up using that in shipping products). So that's
> another reason maybe why a quick hack in the virtio gpu driver isn't the
> best approach here.
>
> I guess a good approach would be if Android at least can get to something
> unified (gpu driver, virtio-gpu, dma-buf heaps), and then we need to
> figure out how to mesh that with the cgroups side somehow.
>
> Also note that at least on dma-buf we already have some other debug
> features (for android), so an overall "how does this all fit together"
> would be good.
> -Daniel
>
> >
> > Many thanks!
> > Yiwei
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

The entire story is to better explain Android system memory usage.
They fit together so that the dma-bufs overlap can be removed.

Android GPU vendors have integrated this tracepoint to track gpu
memory usage total(mapped into the gpu address space), which consists
of below:
(1) directly allocated via physical page allocator
(2) imported external memory backed by dma-bufs
(3) allocated exportable memory backed by dma-bufs

Our Android kernel team is leading the other side of effort to help
remove the dma-bufs overlap(those mapped into a gpu device) as a joint
effort, so that we can accurately explain the memory usage of the
entire Android system.

For virtio-gpu, since that's used by our reference platform
Cuttlefish(Cloud Android), we have to integrate the same tracepoint as
well to enforce the use of this tracepoint and the eBPF stuff built on
top to support runtime query of gpu memory on production devices. For
virtio-gpu at this moment, we only want to track GEM allocations since
PRIME import is currently not supported/used in Cuttlefish. That's all
we are doing in this small patch.

Best,
Yiwei
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
