Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2231A2FFFAC
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jan 2021 11:03:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 601166E9CB;
	Fri, 22 Jan 2021 10:03:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BA176E9B9
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jan 2021 10:03:05 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id 190so3766890wmz.0
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jan 2021 02:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=pxR73uYax2G5yfjba411z30jS6rXBdckdXhkr2akbsA=;
 b=X5WwYFfsYNJfDQh92DGtNFimXbpUN+GxqfLE1NYzEe3/wu5PgFoLIvm7+ki/7buNkl
 kZ7RdFYAlQPqXf/58zvq7XnDgQ1lbSBY6MD18BNTiXhDewgngp7ByIGO1awg/WVpMYos
 IfC9x4aac9zTPv6TJxwkXPhaYSyoZUf4qrM0k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=pxR73uYax2G5yfjba411z30jS6rXBdckdXhkr2akbsA=;
 b=MOEeAErOdwPBEr/20GfGrBn+9nXgMsJNdMg+QPDu0cOabZqksBOu3txeBdFZIcgh9f
 JgN8+CsTtLOuIQTKheGOweOFN/3nC1ySL3wHRhTfBUGXKMpWB3oSP7+Swi7BjwOZ1fDg
 vTr/lFKHobqEj7lKLwh2VyL3tKlAeYTR34WzfryO8gmPAlL3H6YGT9unV6j+8ptrZAL0
 5jJQTZECBF8uAvKvtZQEZiztswltoTkO+m2Q1HDLbz4R6u1Vx5xrnyt/pdbMOrC8cnJD
 +JYBOheUPoA/+4nDhLkOWNnjUECmlUdCu0+Ad2BSm02kNoXMf8E7cMADf/zN9L15yskm
 czXA==
X-Gm-Message-State: AOAM5331+NdbxqwhGsIohvqOdO60nk5jARl+L5JITr4JfZXHmRR9BTGU
 SNctox4TxJRj7ET08HWkQ0v+JA==
X-Google-Smtp-Source: ABdhPJwktUuERnfSCATLUZYNfXmNl/x8CSvfB/VjEK+Oyk/w1j74oeLsbOorMsQA09eB6833W+nOvQ==
X-Received: by 2002:a05:600c:215:: with SMTP id
 21mr3149956wmi.54.1611309783694; 
 Fri, 22 Jan 2021 02:03:03 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o14sm10491607wmc.28.2021.01.22.02.03.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 02:03:03 -0800 (PST)
Date: Fri, 22 Jan 2021 11:03:01 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Yiwei Zhang <zzyiwei@android.com>
Subject: Re: [PATCH v4] drm/virtio: Track total GPU memory for virtio driver
Message-ID: <YAqi1fKM8Vy8ocay@phenom.ffwll.local>
Mail-Followup-To: Yiwei Zhang <zzyiwei@android.com>,
 David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:VIRTIO CORE, NET..." <virtualization@lists.linux-foundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 kernel-team <kernel-team@android.com>
References: <20210122053159.1720274-1-zzyiwei@android.com>
 <20210122054011.1722954-1-zzyiwei@android.com>
 <CAKB3++bLzn5YVaR3iUTHtNYwBeG6Z27NjtWZ1q-xmjOkApAQwg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKB3++bLzn5YVaR3iUTHtNYwBeG6Z27NjtWZ1q-xmjOkApAQwg@mail.gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
 Gerd Hoffmann <kraxel@redhat.com>, kernel-team <kernel-team@android.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 21, 2021 at 11:58:22PM -0800, Yiwei Zhang wrote:
> On Thu, Jan 21, 2021 at 9:40 PM Yiwei Zhang <zzyiwei@android.com> wrote:
> >
> > On the success of virtio_gpu_object_create, add size of newly allocated
> > bo to the tracked total_mem. In drm_gem_object_funcs.free, after the gem
> > bo loses its last refcount, subtract the bo size from the tracked
> > total_mem if the original underlying memory allocation is successful.
> >
> > It's more accurate to do this in device driver layer to best match when
> > the underlying resource gets allocated and destroyed during tracing.
> >
> > Signed-off-by: Yiwei Zhang <zzyiwei@android.com>
> > ---
> >  drivers/gpu/drm/virtio/Kconfig          |  1 +
> >  drivers/gpu/drm/virtio/virtgpu_drv.h    |  2 ++
> >  drivers/gpu/drm/virtio/virtgpu_object.c | 11 +++++++++++
> >  3 files changed, 14 insertions(+)
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
> > index 6a232553c99b..c5622f9b591f 100644
> > --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
> > +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
> > @@ -249,6 +249,8 @@ struct virtio_gpu_device {
> >         spinlock_t resource_export_lock;
> >         /* protects map state and host_visible_mm */
> >         spinlock_t host_visible_lock;
> > +
> > +       atomic64_t total_mem;
> >  };
> >
> >  struct virtio_gpu_fpriv {
> > diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
> > index d69a5b6da553..e2251fc41509 100644
> > --- a/drivers/gpu/drm/virtio/virtgpu_object.c
> > +++ b/drivers/gpu/drm/virtio/virtgpu_object.c
> > @@ -25,12 +25,21 @@
> >
> >  #include <linux/dma-mapping.h>
> >  #include <linux/moduleparam.h>
> > +#include <trace/events/gpu_mem.h>
> >
> >  #include "virtgpu_drv.h"
> >
> >  static int virtio_gpu_virglrenderer_workaround = 1;
> >  module_param_named(virglhack, virtio_gpu_virglrenderer_workaround, int, 0400);
> >
> > +static inline void virtio_gpu_trace_total_mem(struct virtio_gpu_device *vgdev,
> > +                                             s64 delta)
> > +{
> > +       u64 total_mem = atomic64_add_return(delta, &vgdev->total_mem);
> > +
> > +       trace_gpu_mem_total(vgdev->ddev->primary->index, 0, total_mem);
> > +}
> > +
> >  int virtio_gpu_resource_id_get(struct virtio_gpu_device *vgdev, uint32_t *resid)
> >  {
> >         if (virtio_gpu_virglrenderer_workaround) {
> > @@ -104,6 +113,7 @@ static void virtio_gpu_free_object(struct drm_gem_object *obj)
> >         struct virtio_gpu_device *vgdev = bo->base.base.dev->dev_private;
> >
> >         if (bo->created) {
> > +               virtio_gpu_trace_total_mem(vgdev, -(obj->size));
> >                 virtio_gpu_cmd_unref_resource(vgdev, bo);
> >                 virtio_gpu_notify(vgdev);
> >                 /* completion handler calls virtio_gpu_cleanup_object() */
> > @@ -265,6 +275,7 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
> >                 virtio_gpu_object_attach(vgdev, bo, ents, nents);
> >         }
> >
> > +       virtio_gpu_trace_total_mem(vgdev, shmem_obj->base.size);
> >         *bo_ptr = bo;
> >         return 0;
> >
> > --
> > 2.30.0.280.ga3ce27912f-goog
> >
> 
> Re Gerd and Daniel:
> 
> I'm not sure why we want to couple this patch too much with the
> dma-bufs tracking. The tracepoint added here itself is pretty useful
> for tracking gem bo total usage in virtio gpu upon tracing. The
> original purpose for integrating this tracepoint in all Android gpu
> kernel drivers is to just track total gpu memory usage and serve the
> accurate data to game developers in a much easier way. It's something
> they can rely on for robust testing and regression monitoring.
> 
> The only overlap with the dma-buf side is when we export a bo via
> prime to a dma-buf. But still, the total here is already useful for
> this particular device. Using which approach to account for the
> overlap wouldn't block this small integration from my understanding.
> 
> Besides, there's no plan for adding per-process gem total tracking in
> virtio-gpu at this moment. This patch should be light enough to carry
> without worrying about tech debt I believe.

The tracepoint is clearly more generic than just what you implement here,
to support the full use cases on Android's closed stacks. And it is uapi.

Tech debt isn't measured in lines of code, but in how expensive it's going
to be to fix up the mess in the future. uapi is expensive no matter how
few lines are used to implement it.

So yeah this needs to be properly thought out, properly implemented (not
just on the virtual demo stack but something that looks like actual
production stack), with open drivers, proper alignment with other efforts
like tracking memory with cgroups, and the interactions with dma-buf
tracking resolved, and igt testcases (this is meant to be generic after
all), and at least solid proposals for rolling this out across the drm
drivers, and ...

In other words, new uapi needs to be done right.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
