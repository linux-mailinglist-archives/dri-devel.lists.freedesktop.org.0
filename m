Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57247533DAB
	for <lists+dri-devel@lfdr.de>; Wed, 25 May 2022 15:20:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B14F10ED5D;
	Wed, 25 May 2022 13:20:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 011AB10ED5D
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 13:20:20 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id k30so30099481wrd.5
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 06:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=wgf/++uc1ijlNjkSSP+fRHiPJRurMsME9W0kuWV7pwY=;
 b=gPwu39r+yN7uiQUhx6yfD8Taq8rnVQv27+iDH85avi8Esn1KwIEM24Hjl0l2QDklJk
 ycudLm/f8zf+K8WPifHNUmn74K9S655DN1lJpIDEWf5Xv+7bx9e7BfpJFwx/aZd4ayNN
 kLkdJKypZt/n8z/8IYK0RGoN+GrYek2tklxOY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=wgf/++uc1ijlNjkSSP+fRHiPJRurMsME9W0kuWV7pwY=;
 b=4OvG3IQfchcGaEonvDCyUE635Wuwgm+DlvPp52qGrs5eVuBQsaZ+pPp63bJd/b3ZSa
 LnTL/lpenjZscd6XxYLs1sl+uNkQbGJ0ea6zD+KrN0eiiq+txvOlMfTRsibFfrdPkuLM
 2wcan7ZFdaPx4/wa503yCCo5IbpZaoElVISjjneRrdxWqmXbBR78GjO/6Wph2N9uOTZ/
 K+eoHHAU8/VtGIhYJfXKEo9RlzTvyeLYBNCOWxnJr/Aa4qe6cJlGnDRqVsdH+TpNgQlj
 JT4vRqfcPJu5/CIZD6IVXLENlmEeGlRnpJbckmYbEzaik9ugds/SPHBGJbTc8UcCQ+U/
 gsiw==
X-Gm-Message-State: AOAM533ghrutDBwZ+C1T+9GbNQBUeUWUWTfOGlZE/O2K5Rs+O922ibsd
 PW9ziIYDPQaIHDxmLpxP7PZnbA==
X-Google-Smtp-Source: ABdhPJwlUUnuMEAYJrJ/tya+iVGoONO2bU24NWalIelC4TiFrf4wy2R+4OS5EueLjhsNx4Sb/zdDcw==
X-Received: by 2002:adf:d188:0:b0:20f:fa4b:9c81 with SMTP id
 v8-20020adfd188000000b0020ffa4b9c81mr4649552wrc.241.1653484819431; 
 Wed, 25 May 2022 06:20:19 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 s1-20020a5d4ec1000000b0020d098935dbsm2127524wrv.58.2022.05.25.06.20.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 May 2022 06:20:18 -0700 (PDT)
Date: Wed, 25 May 2022 15:20:16 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH 1/2] dma-buf: Add an API for exporting sync files (v14)
Message-ID: <Yo4tEIouNU04Z3H1@phenom.ffwll.local>
References: <20220506180216.2095060-1-jason@jlekstrand.net>
 <20220506180216.2095060-2-jason@jlekstrand.net>
 <8bdd71c9-970b-219c-0d5d-67eabe1ab11b@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8bdd71c9-970b-219c-0d5d-67eabe1ab11b@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: Jason Ekstrand <jason.ekstrand@collabora.com>,
 dri-devel@lists.freedesktop.org, Jason Ekstrand <jason.ekstrand@intel.com>,
 Jason Ekstrand <jason@jlekstrand.net>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 09, 2022 at 07:54:19AM +0200, Christian König wrote:
> Reviewed-by: Christian König <christian.koenig@amd.com> for the series.
> 
> I assume you have the userspace part ready as well? If yes let's push this
> to drm-misc-next asap.

Hopefully I'm not too late, but I think all my review has also been
addressed. On the series:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> 
> Christian.
> 
> Am 06.05.22 um 20:02 schrieb Jason Ekstrand:
> > Modern userspace APIs like Vulkan are built on an explicit
> > synchronization model.  This doesn't always play nicely with the
> > implicit synchronization used in the kernel and assumed by X11 and
> > Wayland.  The client -> compositor half of the synchronization isn't too
> > bad, at least on intel, because we can control whether or not i915
> > synchronizes on the buffer and whether or not it's considered written.
> > 
> > The harder part is the compositor -> client synchronization when we get
> > the buffer back from the compositor.  We're required to be able to
> > provide the client with a VkSemaphore and VkFence representing the point
> > in time where the window system (compositor and/or display) finished
> > using the buffer.  With current APIs, it's very hard to do this in such
> > a way that we don't get confused by the Vulkan driver's access of the
> > buffer.  In particular, once we tell the kernel that we're rendering to
> > the buffer again, any CPU waits on the buffer or GPU dependencies will
> > wait on some of the client rendering and not just the compositor.
> > 
> > This new IOCTL solves this problem by allowing us to get a snapshot of
> > the implicit synchronization state of a given dma-buf in the form of a
> > sync file.  It's effectively the same as a poll() or I915_GEM_WAIT only,
> > instead of CPU waiting directly, it encapsulates the wait operation, at
> > the current moment in time, in a sync_file so we can check/wait on it
> > later.  As long as the Vulkan driver does the sync_file export from the
> > dma-buf before we re-introduce it for rendering, it will only contain
> > fences from the compositor or display.  This allows to accurately turn
> > it into a VkFence or VkSemaphore without any over-synchronization.
> > 
> > By making this an ioctl on the dma-buf itself, it allows this new
> > functionality to be used in an entirely driver-agnostic way without
> > having access to a DRM fd. This makes it ideal for use in driver-generic
> > code in Mesa or in a client such as a compositor where the DRM fd may be
> > hard to reach.
> > 
> > v2 (Jason Ekstrand):
> >   - Use a wrapper dma_fence_array of all fences including the new one
> >     when importing an exclusive fence.
> > 
> > v3 (Jason Ekstrand):
> >   - Lock around setting shared fences as well as exclusive
> >   - Mark SIGNAL_SYNC_FILE as a read-write ioctl.
> >   - Initialize ret to 0 in dma_buf_wait_sync_file
> > 
> > v4 (Jason Ekstrand):
> >   - Use the new dma_resv_get_singleton helper
> > 
> > v5 (Jason Ekstrand):
> >   - Rename the IOCTLs to import/export rather than wait/signal
> >   - Drop the WRITE flag and always get/set the exclusive fence
> > 
> > v6 (Jason Ekstrand):
> >   - Drop the sync_file import as it was all-around sketchy and not nearly
> >     as useful as import.
> >   - Re-introduce READ/WRITE flag support for export
> >   - Rework the commit message
> > 
> > v7 (Jason Ekstrand):
> >   - Require at least one sync flag
> >   - Fix a refcounting bug: dma_resv_get_excl() doesn't take a reference
> >   - Use _rcu helpers since we're accessing the dma_resv read-only
> > 
> > v8 (Jason Ekstrand):
> >   - Return -ENOMEM if the sync_file_create fails
> >   - Predicate support on IS_ENABLED(CONFIG_SYNC_FILE)
> > 
> > v9 (Jason Ekstrand):
> >   - Add documentation for the new ioctl
> > 
> > v10 (Jason Ekstrand):
> >   - Go back to dma_buf_sync_file as the ioctl struct name
> > 
> > v11 (Daniel Vetter):
> >   - Go back to dma_buf_export_sync_file as the ioctl struct name
> >   - Better kerneldoc describing what the read/write flags do
> > 
> > v12 (Christian König):
> >   - Document why we chose to make it an ioctl on dma-buf
> > 
> > v13 (Jason Ekstrand):
> >   - Rebase on Christian König's fence rework
> > 
> > v14 (Daniel Vetter & Christian König):
> >   - Use dma_rev_usage_rw to get the properly inverted usage to pass to
> >     dma_resv_get_singleton()
> >   - Clean up the sync_file and fd if copy_to_user() fails
> > 
> > Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> > Signed-off-by: Jason Ekstrand <jason.ekstrand@intel.com>
> > Signed-off-by: Jason Ekstrand <jason.ekstrand@collabora.com>
> > Acked-by: Simon Ser <contact@emersion.fr>
> > Acked-by: Christian König <christian.koenig@amd.com>
> > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > ---
> >   drivers/dma-buf/dma-buf.c    | 67 ++++++++++++++++++++++++++++++++++++
> >   include/uapi/linux/dma-buf.h | 35 +++++++++++++++++++
> >   2 files changed, 102 insertions(+)
> > 
> > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > index 79795857be3e..6ff54f7e6119 100644
> > --- a/drivers/dma-buf/dma-buf.c
> > +++ b/drivers/dma-buf/dma-buf.c
> > @@ -20,6 +20,7 @@
> >   #include <linux/debugfs.h>
> >   #include <linux/module.h>
> >   #include <linux/seq_file.h>
> > +#include <linux/sync_file.h>
> >   #include <linux/poll.h>
> >   #include <linux/dma-resv.h>
> >   #include <linux/mm.h>
> > @@ -192,6 +193,9 @@ static loff_t dma_buf_llseek(struct file *file, loff_t offset, int whence)
> >    * Note that this only signals the completion of the respective fences, i.e. the
> >    * DMA transfers are complete. Cache flushing and any other necessary
> >    * preparations before CPU access can begin still need to happen.
> > + *
> > + * As an alternative to poll(), the set of fences on DMA buffer can be
> > + * exported as a &sync_file using &dma_buf_sync_file_export.
> >    */
> >   static void dma_buf_poll_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
> > @@ -326,6 +330,64 @@ static long dma_buf_set_name(struct dma_buf *dmabuf, const char __user *buf)
> >   	return 0;
> >   }
> > +#if IS_ENABLED(CONFIG_SYNC_FILE)
> > +static long dma_buf_export_sync_file(struct dma_buf *dmabuf,
> > +				     void __user *user_data)
> > +{
> > +	struct dma_buf_export_sync_file arg;
> > +	enum dma_resv_usage usage;
> > +	struct dma_fence *fence = NULL;
> > +	struct sync_file *sync_file;
> > +	int fd, ret;
> > +
> > +	if (copy_from_user(&arg, user_data, sizeof(arg)))
> > +		return -EFAULT;
> > +
> > +	if (arg.flags & ~DMA_BUF_SYNC_RW)
> > +		return -EINVAL;
> > +
> > +	if ((arg.flags & DMA_BUF_SYNC_RW) == 0)
> > +		return -EINVAL;
> > +
> > +	fd = get_unused_fd_flags(O_CLOEXEC);
> > +	if (fd < 0)
> > +		return fd;
> > +
> > +	usage = dma_resv_usage_rw(arg.flags & DMA_BUF_SYNC_WRITE);
> > +	ret = dma_resv_get_singleton(dmabuf->resv, usage, &fence);
> > +	if (ret)
> > +		goto err_put_fd;
> > +
> > +	if (!fence)
> > +		fence = dma_fence_get_stub();
> > +
> > +	sync_file = sync_file_create(fence);
> > +
> > +	dma_fence_put(fence);
> > +
> > +	if (!sync_file) {
> > +		ret = -ENOMEM;
> > +		goto err_put_fd;
> > +	}
> > +
> > +	arg.fd = fd;
> > +	if (copy_to_user(user_data, &arg, sizeof(arg))) {
> > +		ret = -EFAULT;
> > +		goto err_put_file;
> > +	}
> > +
> > +	fd_install(fd, sync_file->file);
> > +
> > +	return 0;
> > +
> > +err_put_file:
> > +	fput(sync_file->file);
> > +err_put_fd:
> > +	put_unused_fd(fd);
> > +	return ret;
> > +}
> > +#endif
> > +
> >   static long dma_buf_ioctl(struct file *file,
> >   			  unsigned int cmd, unsigned long arg)
> >   {
> > @@ -369,6 +431,11 @@ static long dma_buf_ioctl(struct file *file,
> >   	case DMA_BUF_SET_NAME_B:
> >   		return dma_buf_set_name(dmabuf, (const char __user *)arg);
> > +#if IS_ENABLED(CONFIG_SYNC_FILE)
> > +	case DMA_BUF_IOCTL_EXPORT_SYNC_FILE:
> > +		return dma_buf_export_sync_file(dmabuf, (void __user *)arg);
> > +#endif
> > +
> >   	default:
> >   		return -ENOTTY;
> >   	}
> > diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.h
> > index 8e4a2ca0bcbf..46f1e3e98b02 100644
> > --- a/include/uapi/linux/dma-buf.h
> > +++ b/include/uapi/linux/dma-buf.h
> > @@ -85,6 +85,40 @@ struct dma_buf_sync {
> >   #define DMA_BUF_NAME_LEN	32
> > +/**
> > + * struct dma_buf_export_sync_file - Get a sync_file from a dma-buf
> > + *
> > + * Userspace can perform a DMA_BUF_IOCTL_EXPORT_SYNC_FILE to retrieve the
> > + * current set of fences on a dma-buf file descriptor as a sync_file.  CPU
> > + * waits via poll() or other driver-specific mechanisms typically wait on
> > + * whatever fences are on the dma-buf at the time the wait begins.  This
> > + * is similar except that it takes a snapshot of the current fences on the
> > + * dma-buf for waiting later instead of waiting immediately.  This is
> > + * useful for modern graphics APIs such as Vulkan which assume an explicit
> > + * synchronization model but still need to inter-operate with dma-buf.
> > + */
> > +struct dma_buf_export_sync_file {
> > +	/**
> > +	 * @flags: Read/write flags
> > +	 *
> > +	 * Must be DMA_BUF_SYNC_READ, DMA_BUF_SYNC_WRITE, or both.
> > +	 *
> > +	 * If DMA_BUF_SYNC_READ is set and DMA_BUF_SYNC_WRITE is not set,
> > +	 * the returned sync file waits on any writers of the dma-buf to
> > +	 * complete.  Waiting on the returned sync file is equivalent to
> > +	 * poll() with POLLIN.
> > +	 *
> > +	 * If DMA_BUF_SYNC_WRITE is set, the returned sync file waits on
> > +	 * any users of the dma-buf (read or write) to complete.  Waiting
> > +	 * on the returned sync file is equivalent to poll() with POLLOUT.
> > +	 * If both DMA_BUF_SYNC_WRITE and DMA_BUF_SYNC_READ are set, this
> > +	 * is equivalent to just DMA_BUF_SYNC_WRITE.
> > +	 */
> > +	__u32 flags;
> > +	/** @fd: Returned sync file descriptor */
> > +	__s32 fd;
> > +};
> > +
> >   #define DMA_BUF_BASE		'b'
> >   #define DMA_BUF_IOCTL_SYNC	_IOW(DMA_BUF_BASE, 0, struct dma_buf_sync)
> > @@ -94,5 +128,6 @@ struct dma_buf_sync {
> >   #define DMA_BUF_SET_NAME	_IOW(DMA_BUF_BASE, 1, const char *)
> >   #define DMA_BUF_SET_NAME_A	_IOW(DMA_BUF_BASE, 1, u32)
> >   #define DMA_BUF_SET_NAME_B	_IOW(DMA_BUF_BASE, 1, u64)
> > +#define DMA_BUF_IOCTL_EXPORT_SYNC_FILE	_IOWR(DMA_BUF_BASE, 2, struct dma_buf_export_sync_file)
> >   #endif
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
