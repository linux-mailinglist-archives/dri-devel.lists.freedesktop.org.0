Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D6B390989
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 21:19:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7F086EAAD;
	Tue, 25 May 2021 19:19:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B62266EA8A
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 19:19:19 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id s6so37497947edu.10
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 12:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q698qI1CAQTda9+1079AXd8sJTyjOMlXYRJmvIg7e8E=;
 b=Blf7UkzIo7xvOEY7+MCxDPx3uxam0me7+yaGpM232xZN4XoxeEmj/Ivwj6jWrBx7pl
 lown8HDdcJ4updq5xJXN4wVMx866kG3Jd1qOziHF5XEJAg+n1hFeNR9QD16XIs9JB9ES
 XL42NJExRB4Lcdn6jBvQVDfmt3yzMRcCUCqpyb0MMwMRmcqUG2vsappJmTP/NaA1tFXr
 310jG2szkLFtpAJs8lS5mjD6oTgvm4oR3H3ltgMqvPSzxNjxV7NgjIcNqna/RH14TgyL
 +GA8Z7YeOegsHbuaGrMujzNDk0Z9dz7NBKZ7cOFAQB0Q7j4jVPE9eOMfsssWAHG5p2Wr
 BboA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q698qI1CAQTda9+1079AXd8sJTyjOMlXYRJmvIg7e8E=;
 b=tpZd8I7VJbbmIxjKDXzffFKM54+JFcVioAGb094bkOItkoxqMiTEObKLvbIuJrmvB4
 cX6JHwyW6GW6yywyc3hFiUv0rHeLmktabUfQ4cMmYDwhNP+qUclM2q0YDn9tzseQh9JY
 4Vrhoh1sWucLss9qGVQarPo+3lCjGcQhTX81MMJeRoQcuLKXzZnSv8YVKOUvl6m3qJqn
 CFfQ8UdLY+84sufxhZ7zlYGo4e/rOw+cYab9xY0Ml/nvqK26kHqDRhniym3aWfW7AeSH
 FFDhIl7HRWfiqrpvI7e3h9xKPivzBNQNvORSu9vNqvZFcTDBU6qdg9+jdILlQBHoQO8C
 H2Rw==
X-Gm-Message-State: AOAM533p4/A80Xzait1hE0O6FmTTA27KhDBm8VdxEG1mO472ZAU8XWnq
 upfFQQ3XQh53e+K2tnTwjj2rG4V5yknNI3PUxXeDpA==
X-Google-Smtp-Source: ABdhPJxihMltmFq2NUm/ZlIPdIo6Cidre+GjEDgIXZd6oxqftTXmC4XI6cEFt0rVCRzuscjoqi0Gt9yQuYOli0BxlDM=
X-Received: by 2002:a05:6402:1719:: with SMTP id
 y25mr33665851edu.304.1621970357925; 
 Tue, 25 May 2021 12:19:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210524205954.872814-1-jason@jlekstrand.net>
 <20210524205954.872814-7-jason@jlekstrand.net>
 <YK0Zvb4SStiCxhpk@phenom.ffwll.local>
In-Reply-To: <YK0Zvb4SStiCxhpk@phenom.ffwll.local>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Tue, 25 May 2021 14:19:06 -0500
Message-ID: <CAOFGe95YJsW8goeDMPzLm=oHc0_Z7NHCAnPDwPaRWToN8s39=g@mail.gmail.com>
Subject: Re: [PATCH 6/6] RFC: dma-buf: Add an API for importing sync files (v6)
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: Intel GFX <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 25, 2021 at 10:37 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Mon, May 24, 2021 at 03:59:54PM -0500, Jason Ekstrand wrote:
> > This patch is analogous to the previous sync file export patch in that
> > it allows you to import a sync_file into a dma-buf.  Unlike the previous
> > patch, however, this does add genuinely new functionality to dma-buf.
> > Without this, the only way to attach a sync_file to a dma-buf is to
> > submit a batch to your driver of choice which waits on the sync_file and
> > claims to write to the dma-buf.  Even if said batch is a no-op, a submit
> > is typically way more overhead than just attaching a fence.  A submit
> > may also imply extra synchronization with other work because it happens
> > on a hardware queue.
> >
> > In the Vulkan world, this is useful for dealing with the out-fence from
> > vkQueuePresent.  Current Linux window-systems (X11, Wayland, etc.) all
> > rely on dma-buf implicit sync.  Since Vulkan is an explicit sync API, we
> > get a set of fences (VkSemaphores) in vkQueuePresent and have to stash
> > those as an exclusive (write) fence on the dma-buf.  We handle it in
> > Mesa today with the above mentioned dummy submit trick.  This ioctl
> > would allow us to set it directly without the dummy submit.
> >
> > This may also open up possibilities for GPU drivers to move away from
> > implicit sync for their kernel driver uAPI and instead provide sync
> > files and rely on dma-buf import/export for communicating with other
> > implicit sync clients.
> >
> > We make the explicit choice here to only allow setting RW fences which
> > translates to an exclusive fence on the dma_resv.  There's no use for
> > read-only fences for communicating with other implicit sync userspace
> > and any such attempts are likely to be racy at best.  When we got to
> > insert the RW fence, the actual fence we set as the new exclusive fence
> > is a combination of the sync_file provided by the user and all the other
> > fences on the dma_resv.  This ensures that the newly added exclusive
> > fence will never signal before the old one would have and ensures that
> > we don't break any dma_resv contracts.  We require userspace to specify
> > RW in the flags for symmetry with the export ioctl and in case we ever
> > want to support read fences in the future.
> >
> > There is one downside here that's worth documenting:  If two clients
> > writing to the same dma-buf using this API race with each other, their
> > actions on the dma-buf may happen in parallel or in an undefined order.
> > Both with and without this API, the pattern is the same:  Collect all
> > the fences on dma-buf, submit work which depends on said fences, and
> > then set a new exclusive (write) fence on the dma-buf which depends on
> > said work.  The difference is that, when it's all handled by the GPU
> > driver's submit ioctl, the three operations happen atomically under the
> > dma_resv lock.  If two userspace submits race, one will happen before
> > the other.  You aren't guaranteed which but you are guaranteed that
> > they're strictly ordered.  If userspace manages the fences itself, then
> > these three operations happen separately and the two render operations
> > may happen genuinely in parallel or get interleaved.  However, this is a
> > case of userspace racing with itself.  As long as we ensure userspace
> > can't back the kernel into a corner, it should be fine.
> >
> > v2 (Jason Ekstrand):
> >  - Use a wrapper dma_fence_array of all fences including the new one
> >    when importing an exclusive fence.
> >
> > v3 (Jason Ekstrand):
> >  - Lock around setting shared fences as well as exclusive
> >  - Mark SIGNAL_SYNC_FILE as a read-write ioctl.
> >  - Initialize ret to 0 in dma_buf_wait_sync_file
> >
> > v4 (Jason Ekstrand):
> >  - Use the new dma_resv_get_singleton helper
> >
> > v5 (Jason Ekstrand):
> >  - Rename the IOCTLs to import/export rather than wait/signal
> >  - Drop the WRITE flag and always get/set the exclusive fence
> >
> > v5 (Jason Ekstrand):
> >  - Split import and export into separate patches
> >  - New commit message
> >
> > Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> > ---
> >  drivers/dma-buf/dma-buf.c    | 34 ++++++++++++++++++++++++++++++++++
> >  include/uapi/linux/dma-buf.h |  1 +
> >  2 files changed, 35 insertions(+)
> >
> > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > index f23d939e0e833..0a50c19dcf015 100644
> > --- a/drivers/dma-buf/dma-buf.c
> > +++ b/drivers/dma-buf/dma-buf.c
> > @@ -419,6 +419,38 @@ static long dma_buf_export_sync_file(struct dma_buf *dmabuf,
> >       put_unused_fd(fd);
> >       return ret;
> >  }
> > +
> > +static long dma_buf_import_sync_file(struct dma_buf *dmabuf,
> > +                                  const void __user *user_data)
> > +{
> > +     struct dma_buf_sync_file arg;
> > +     struct dma_fence *fence, *singleton = NULL;
> > +     int ret = 0;
> > +
> > +     if (copy_from_user(&arg, user_data, sizeof(arg)))
> > +             return -EFAULT;
> > +
> > +     if (arg.flags != DMA_BUF_SYNC_RW)
> > +             return -EINVAL;
> > +
> > +     fence = sync_file_get_fence(arg.fd);
> > +     if (!fence)
> > +             return -EINVAL;
> > +
> > +     dma_resv_lock(dmabuf->resv, NULL);
> > +
> > +     singleton = dma_resv_get_singleton_unlocked(dmabuf->resv, fence);
> > +     if (IS_ERR(singleton))
> > +             ret = PTR_ERR(singleton);
> > +     else if (singleton)
> > +             dma_resv_add_excl_fence(dmabuf->resv, singleton);
>
> We also need to add the new fence to the shared slots, to make sure that
> the collective sum of shared fences still retires after the exclusive one.
> Not holding this up will pretty surely allow userspace to pull a bunch of
> ttm based drivers over the table I think.

Ok, will fix.

> Note that with dma-buf shared buffers there shouldn't be a problem here,
> since as long as the buffer is in use by the other driver (which might
> break the contract here) it's pinned. So nothing bad can happen.
>
>
> Aside: The read-only version of this just adds the new fence, and the
> exclusive fence to the shared array. I think that would be useful to have,
> if just for completeness. I need to pester you how external images work
> here with vulkan ...

As discussed on IRC, let's leave that out until we can figure out how
it works. :-)

> > +
> > +     dma_resv_unlock(dmabuf->resv);
> > +
> > +     dma_fence_put(fence);
> > +
> > +     return ret;
> > +}
> >  #endif
> >
> >  static long dma_buf_ioctl(struct file *file,
> > @@ -467,6 +499,8 @@ static long dma_buf_ioctl(struct file *file,
> >  #if IS_ENABLED(CONFIG_SYNC_FILE)
> >       case DMA_BUF_IOCTL_EXPORT_SYNC_FILE:
> >               return dma_buf_export_sync_file(dmabuf, (void __user *)arg);
> > +     case DMA_BUF_IOCTL_IMPORT_SYNC_FILE:
> > +             return dma_buf_import_sync_file(dmabuf, (const void __user *)arg);
> >  #endif
> >
> >       default:
> > diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.h
> > index f902cadcbdb56..75fdde4800267 100644
> > --- a/include/uapi/linux/dma-buf.h
> > +++ b/include/uapi/linux/dma-buf.h
> > @@ -70,5 +70,6 @@ struct dma_buf_sync_file {
> >  #define DMA_BUF_SET_NAME_A   _IOW(DMA_BUF_BASE, 1, u32)
> >  #define DMA_BUF_SET_NAME_B   _IOW(DMA_BUF_BASE, 1, u64)
> >  #define DMA_BUF_IOCTL_EXPORT_SYNC_FILE       _IOWR(DMA_BUF_BASE, 2, struct dma_buf_sync_file)
> > +#define DMA_BUF_IOCTL_IMPORT_SYNC_FILE       _IOW(DMA_BUF_BASE, 3, struct dma_buf_sync)
>
> Uh wrong struct here. Not good :-)
>
> Also more kerneldoc would be really nice, plus on 2nd thought I'm not
> really sure saving the few bytes in storage

Not sure what storage you're talking about.  Kernel headers?

> is such a bright idea, and
> maybe we should have distinct dma_buf_export/import_sync_file structures,
> each with their appropriate kerneldoc and no confusion.

Sure. I can do that.

> Aside from these I think this looks good. And as long as we keep up the
> "shared fences in their entirety complete after the exclusive fence if
> both are present", then I think we'll be fine.
> -Daniel
>
>
>
> >
> >  #endif
> > --
> > 2.31.1
> >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
