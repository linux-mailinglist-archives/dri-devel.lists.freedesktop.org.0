Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A51842FE521
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jan 2021 09:36:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F6846E530;
	Thu, 21 Jan 2021 08:36:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCE8889B84
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jan 2021 19:08:23 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id b64so22951708qkc.12
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jan 2021 11:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=android.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3UvSSj7FihiEFVi0RGPwt1INmt76yzIjTycQHPLRAfM=;
 b=ZMtqNibv8mF11Vx2yC6cc6h8bkhNBMC4+hjLOJX2JbTYFfxgJfZz5nYhVAzGp6A1Xj
 z0+qyRYZW7ROj1Cg5sW+UQVmT+SnIc2USYejRzCJnTjtKYE8J3WQbzqVMZ5FiJFG97UG
 Ebp4OWPoetgrzq3ohwTgViRaiFNN089B4jIzhoYDgDQj9MpaAp4c7SrU+sDFAQ4fIZzM
 nsKREWlUBZ97nW4Lt0wyfKhKsyoqjALt6Fa2UgX9Wpmu1fZWjvoFhswoufeGIco9BJQy
 0xJq8ByhLV5IkW/MsFOYNTEvK7H52f1a9nFgVeJLPNrGfV5f5bNIW+xQXIsJDVToxzRc
 Gv9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3UvSSj7FihiEFVi0RGPwt1INmt76yzIjTycQHPLRAfM=;
 b=WWJXsLkFPiTPPfcsG2bmBFTgjNGRGlPhepnlWqu8ybkV4uyiu0kTJ2IIN3Ez3C+bzQ
 h9Bpvs1BGNNo8JItBLzw1g9RxSOx/M9zrEYvniWRpWXAXGp8uV7xbzuPMqiftvdtK5/8
 Ebeq3I3iOR+l8ssQTrLYTXDl7bXdBMt14YGFvYcNJdCcS23kXYYghylLUjrtWjQEfQNj
 IGMs2I5CYWAm49ap3riBETtcHbxrEj6T/EM4UEJrPP2TFQjHd67yOptMi4VI7cK4UubI
 tjY63Mb+cfJT2sr8Wy8gWIsnWDDoiA3fnhP2dapJfP728+jDIzCXCCkrALhRLd2VutQ/
 N63w==
X-Gm-Message-State: AOAM533GhYIfopuLVqqNXLOC6vA3ngMaJfwp+FlUQb2cqI/VRfclxP1E
 h7ADr1E0SP09GxyA+2veHaD0yc73wOqB418MEJ7HXg==
X-Google-Smtp-Source: ABdhPJzuVOPoCj0aRbqV9LR8ha00BJ3589ff8a3Agw9tVpcuBaHbMvOz/1fsBmo5ODDdaDbnxDLmXvEav/ZmTtLOKsc=
X-Received: by 2002:a37:afc2:: with SMTP id y185mr5930151qke.499.1611083302926; 
 Tue, 19 Jan 2021 11:08:22 -0800 (PST)
MIME-Version: 1.0
References: <CAKB3++adfpdBHFEyGZ3v2V6zyW+ayg86CLDRKx1ty+OytjYFNw@mail.gmail.com>
 <20210118234057.270930-1-zzyiwei@android.com>
 <CAKMK7uE+7S5q8bU0ibyepb8yQL3QYNjZE+Jwf13+bVfAmoSuhw@mail.gmail.com>
In-Reply-To: <CAKMK7uE+7S5q8bU0ibyepb8yQL3QYNjZE+Jwf13+bVfAmoSuhw@mail.gmail.com>
From: =?UTF-8?B?WWl3ZWkgWmhhbmfigI4=?= <zzyiwei@android.com>
Date: Tue, 19 Jan 2021 11:08:12 -0800
Message-ID: <CAKB3++aNtrjzFoq4icMWSUvXw7bL69FRM+9t69firXHkiuTwDQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/virtio: Track total GPU memory for virtio driver
To: Daniel Vetter <daniel@ffwll.ch>
X-Mailman-Approved-At: Thu, 21 Jan 2021 08:36:20 +0000
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
Cc: David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, "open list:VIRTIO CORE,
 NET..." <virtualization@lists.linux-foundation.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Android Kernel Team <kernel-team@android.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 18, 2021 at 11:03 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Tue, Jan 19, 2021 at 12:41 AM Yiwei Zhang <zzyiwei@android.com> wrote:
> >
> > On the success of virtio_gpu_object_create, add size of newly allocated
> > bo to the tracled total_mem. In drm_gem_object_funcs.free, after the gem
> > bo lost its last refcount, subtract the bo size from the tracked
> > total_mem if the original underlying memory allocation is successful.
> >
> > Signed-off-by: Yiwei Zhang <zzyiwei@android.com>
>
> Isn't this something that ideally we'd for everyone? Also tracepoint
> for showing the total feels like tracepoint abuse, usually we show
> totals somewhere in debugfs or similar, and tracepoint just for what's
> happening (i.e. which object got deleted/created).
>
> What is this for exactly?
> -Daniel
>
> > ---
> >  drivers/gpu/drm/virtio/Kconfig          |  1 +
> >  drivers/gpu/drm/virtio/virtgpu_drv.h    |  4 ++++
> >  drivers/gpu/drm/virtio/virtgpu_object.c | 19 +++++++++++++++++++
> >  3 files changed, 24 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/virtio/Kconfig b/drivers/gpu/drm/virtio/Kconfig
> > index b925b8b1da16..e103b7e883b1 100644
> > --- a/drivers/gpu/drm/virtio/Kconfig
> > +++ b/drivers/gpu/drm/virtio/Kconfig
> > @@ -5,6 +5,7 @@ config DRM_VIRTIO_GPU
> >         select DRM_KMS_HELPER
> >         select DRM_GEM_SHMEM_HELPER
> >         select VIRTIO_DMA_SHARED_BUFFER
> > +       select TRACE_GPU_MEM
> >         help
> >            This is the virtual GPU driver for virtio.  It can be used with
> >            QEMU based VMMs (like KVM or Xen).
> > diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
> > index 6a232553c99b..7c60e7486bc4 100644
> > --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
> > +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
> > @@ -249,6 +249,10 @@ struct virtio_gpu_device {
> >         spinlock_t resource_export_lock;
> >         /* protects map state and host_visible_mm */
> >         spinlock_t host_visible_lock;
> > +
> > +#ifdef CONFIG_TRACE_GPU_MEM
> > +       atomic64_t total_mem;
> > +#endif
> >  };
> >
> >  struct virtio_gpu_fpriv {
> > diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
> > index d69a5b6da553..1e16226cebbe 100644
> > --- a/drivers/gpu/drm/virtio/virtgpu_object.c
> > +++ b/drivers/gpu/drm/virtio/virtgpu_object.c
> > @@ -25,12 +25,29 @@
> >
> >  #include <linux/dma-mapping.h>
> >  #include <linux/moduleparam.h>
> > +#ifdef CONFIG_TRACE_GPU_MEM
> > +#include <trace/events/gpu_mem.h>
> > +#endif
> >
> >  #include "virtgpu_drv.h"
> >
> >  static int virtio_gpu_virglrenderer_workaround = 1;
> >  module_param_named(virglhack, virtio_gpu_virglrenderer_workaround, int, 0400);
> >
> > +#ifdef CONFIG_TRACE_GPU_MEM
> > +static inline void virtio_gpu_trace_total_mem(struct virtio_gpu_device *vgdev,
> > +                                             s64 delta)
> > +{
> > +       u64 total_mem = atomic64_add_return(delta, &vgdev->total_mem);
> > +
> > +       trace_gpu_mem_total(0, 0, total_mem);
> > +}
> > +#else
> > +static inline void virtio_gpu_trace_total_mem(struct virtio_gpu_device *, s64)
> > +{
> > +}
> > +#endif
> > +
> >  int virtio_gpu_resource_id_get(struct virtio_gpu_device *vgdev, uint32_t *resid)
> >  {
> >         if (virtio_gpu_virglrenderer_workaround) {
> > @@ -104,6 +121,7 @@ static void virtio_gpu_free_object(struct drm_gem_object *obj)
> >         struct virtio_gpu_device *vgdev = bo->base.base.dev->dev_private;
> >
> >         if (bo->created) {
> > +               virtio_gpu_trace_total_mem(vgdev, -(obj->size));
> >                 virtio_gpu_cmd_unref_resource(vgdev, bo);
> >                 virtio_gpu_notify(vgdev);
> >                 /* completion handler calls virtio_gpu_cleanup_object() */
> > @@ -265,6 +283,7 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
> >                 virtio_gpu_object_attach(vgdev, bo, ents, nents);
> >         }
> >
> > +       virtio_gpu_trace_total_mem(vgdev, shmem_obj->base.size);
> >         *bo_ptr = bo;
> >         return 0;
> >
> > --
> > 2.30.0.284.gd98b1dd5eaa7-goog
> >
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

Thanks for your reply! Android Cuttlefish virtual platform is using
the virtio-gpu driver, and we currently are carrying this small patch
at the downstream side. This is essential for us because:
(1) Android has deprecated debugfs on production devices already
(2) Android GPU drivers are not DRM based, and this won't change in a
short term.

Android relies on this tracepoint + eBPF to make the GPU memory totals
available at runtime on production devices, which has been enforced
already. Not only game developers can have a reliable kernel total GPU
memory to look at, but also Android leverages this to take GPU memory
usage out from the system lost ram.

I'm not sure whether the other DRM drivers would like to integrate
this tracepoint(maybe upstream drivers will move away from debugfs
later as well?), but at least we hope virtio-gpu can take this.

Many thanks!
Yiwei
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
