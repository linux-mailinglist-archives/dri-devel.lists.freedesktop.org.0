Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A62F23904A1
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 17:09:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 443DE6E332;
	Tue, 25 May 2021 15:08:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F8576E332
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 15:08:57 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id t206so16968791wmf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 08:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=GWcHUmtRoBbBVQFv/cG8c0UyohsWnVM1GgM0jUZFR+s=;
 b=Jkc/A5sxbK9TeCWpq4M4WD75ulozB2xWqCETYIcW6TngJfax+hz4N6J8dr9Bvms9dR
 Jn8Kz2rPndora2NJ93ZWSeLGLekf7fjxWITsmWXkMRdrOQf/+tYyK4O5X1wC6YDhcqsX
 esPPiKTjc/nIXxbjSTibXV2DJ3Usjs+38aaGA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=GWcHUmtRoBbBVQFv/cG8c0UyohsWnVM1GgM0jUZFR+s=;
 b=b2hZFwipzst1gM8m+FkeKfex6fSQHSFdvJDmG1I+nH0+06uOkPxcUZm3ZtSdkR9LHq
 WPS699/qqsjFjLtcaJwtO1GosXfnce9eEIOaEgzl52IE+SwIJulzP1xQ+1QOt9jzny0e
 zWxzOapR9GOzp5zXP5mtro5MDKG5IDp1vGOkaEDZYBgaX/n1t2gbObun30pBD8RdWTiv
 ahUdAIPhM6UGpU4u2lt5GxEBEKcRTGp0ZajuWBqLYZD1VcEnfW8BigL5pQMubp8TUEZA
 5oR4HcUSPXi8aLImK1GaQhq9lhWbFbMzlujs/anjPfDUdStyZod+lrszPa8ly48uRESQ
 uIIQ==
X-Gm-Message-State: AOAM533dG4ZAXIWVBpzjDrJQ5ij2b7ZWxtSSgULchPjh8QYL4MH1luEE
 tX7TNy6dOlB/ZgGZKOgr2KdkhDehRtwIDQ==
X-Google-Smtp-Source: ABdhPJw5ca24ZOwTNSBxWGZaM7dpEIS/Z6dMabADZTpfyChqRcTqGC4TBuCrQphWgqx2K4O+BG81bQ==
X-Received: by 2002:a05:600c:da:: with SMTP id
 u26mr23992052wmm.128.1621955335693; 
 Tue, 25 May 2021 08:08:55 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c6sm16789457wru.50.2021.05.25.08.08.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:08:55 -0700 (PDT)
Date: Tue, 25 May 2021 17:08:53 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [PATCH 4/6] dma-buf: Add an API for exporting sync files (v9)
Message-ID: <YK0TBaQ14cH1fcUA@phenom.ffwll.local>
References: <20210524205954.872814-1-jason@jlekstrand.net>
 <20210524205954.872814-5-jason@jlekstrand.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210524205954.872814-5-jason@jlekstrand.net>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: intel-gfx@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 24, 2021 at 03:59:52PM -0500, Jason Ekstrand wrote:
> Modern userspace APIs like Vulkan are built on an explicit
> synchronization model.  This doesn't always play nicely with the
> implicit synchronization used in the kernel and assumed by X11 and
> Wayland.  The client -> compositor half of the synchronization isn't too
> bad, at least on intel, because we can control whether or not i915
> synchronizes on the buffer and whether or not it's considered written.
> 
> The harder part is the compositor -> client synchronization when we get
> the buffer back from the compositor.  We're required to be able to
> provide the client with a VkSemaphore and VkFence representing the point
> in time where the window system (compositor and/or display) finished
> using the buffer.  With current APIs, it's very hard to do this in such
> a way that we don't get confused by the Vulkan driver's access of the
> buffer.  In particular, once we tell the kernel that we're rendering to
> the buffer again, any CPU waits on the buffer or GPU dependencies will
> wait on some of the client rendering and not just the compositor.
> 
> This new IOCTL solves this problem by allowing us to get a snapshot of
> the implicit synchronization state of a given dma-buf in the form of a
> sync file.  It's effectively the same as a poll() or I915_GEM_WAIT only,
> instead of CPU waiting directly, it encapsulates the wait operation, at
> the current moment in time, in a sync_file so we can check/wait on it
> later.  As long as the Vulkan driver does the sync_file export from the
> dma-buf before we re-introduce it for rendering, it will only contain
> fences from the compositor or display.  This allows to accurately turn
> it into a VkFence or VkSemaphore without any over- synchronization.
> 
> v2 (Jason Ekstrand):
>  - Use a wrapper dma_fence_array of all fences including the new one
>    when importing an exclusive fence.
> 
> v3 (Jason Ekstrand):
>  - Lock around setting shared fences as well as exclusive
>  - Mark SIGNAL_SYNC_FILE as a read-write ioctl.
>  - Initialize ret to 0 in dma_buf_wait_sync_file
> 
> v4 (Jason Ekstrand):
>  - Use the new dma_resv_get_singleton helper
> 
> v5 (Jason Ekstrand):
>  - Rename the IOCTLs to import/export rather than wait/signal
>  - Drop the WRITE flag and always get/set the exclusive fence
> 
> v6 (Jason Ekstrand):
>  - Drop the sync_file import as it was all-around sketchy and not nearly
>    as useful as import.
>  - Re-introduce READ/WRITE flag support for export
>  - Rework the commit message
> 
> v7 (Jason Ekstrand):
>  - Require at least one sync flag
>  - Fix a refcounting bug: dma_resv_get_excl() doesn't take a reference
>  - Use _rcu helpers since we're accessing the dma_resv read-only
> 
> v8 (Jason Ekstrand):
>  - Return -ENOMEM if the sync_file_create fails
>  - Predicate support on IS_ENABLED(CONFIG_SYNC_FILE)
> 
> v9 (Jason Ekstrand):
>  - Add documentation for the new ioctl
> 
> v10 (Jason Ekstrand):
>  - Go back to dma_buf_sync_file as the ioctl struct name
> 
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> Acked-by: Simon Ser <contact@emersion.fr>
> Acked-by: Christian König <christian.koenig@amd.com>

So one thing we need to capture here is that for amdgpu currently this
misreports, because amdgpu doesn't store write fences in the exclusive
slot. So that's a bit annoying.

If userspace only uses this sync_file to avoid stalls, then I think that's
all fine, we just lie about the stall that will still happen and maybe
there's more judder than necessary.

More annoying is when this is used in e.g. a vulkan based compositor. But
with current amdgpu userspace the kernel forces synchronization, even with
vulkan. So again no problem.

The only thing where we really need to be careful about is that when we
add more fine-grained implicit sync support to amdgpu (which needs more
than these patches, you need a per-file opt-out of the kernel's automagic
sync), then we also must fix the amdgpu use of the exclusive slot. But
that's doable I think.

I couldn't poke holes in your argument checking.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/dma-buf/dma-buf.c    | 64 ++++++++++++++++++++++++++++++++++++
>  include/uapi/linux/dma-buf.h | 24 ++++++++++++++
>  2 files changed, 88 insertions(+)
> 
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index d4529aa9d1a5a..86efe71c0db96 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -20,6 +20,7 @@
>  #include <linux/debugfs.h>
>  #include <linux/module.h>
>  #include <linux/seq_file.h>
> +#include <linux/sync_file.h>
>  #include <linux/poll.h>
>  #include <linux/dma-resv.h>
>  #include <linux/mm.h>
> @@ -362,6 +363,64 @@ static long dma_buf_set_name(struct dma_buf *dmabuf, const char __user *buf)
>  	return ret;
>  }
>  
> +#if IS_ENABLED(CONFIG_SYNC_FILE)
> +static long dma_buf_export_sync_file(struct dma_buf *dmabuf,
> +				     void __user *user_data)
> +{
> +	struct dma_buf_sync_file arg;
> +	struct dma_fence *fence = NULL;
> +	struct sync_file *sync_file;
> +	int fd, ret;
> +
> +	if (copy_from_user(&arg, user_data, sizeof(arg)))
> +		return -EFAULT;
> +
> +	if (arg.flags & ~DMA_BUF_SYNC_RW)
> +		return -EINVAL;
> +
> +	if ((arg.flags & DMA_BUF_SYNC_RW) == 0)
> +		return -EINVAL;
> +
> +	fd = get_unused_fd_flags(O_CLOEXEC);
> +	if (fd < 0)
> +		return fd;
> +
> +	if (arg.flags & DMA_BUF_SYNC_WRITE) {
> +		fence = dma_resv_get_singleton_unlocked(dmabuf->resv);
> +		if (IS_ERR(fence)) {
> +			ret = PTR_ERR(fence);
> +			goto err_put_fd;
> +		}
> +	} else if (arg.flags & DMA_BUF_SYNC_READ) {
> +		fence = dma_resv_get_excl_unlocked(dmabuf->resv);
> +	}
> +
> +	if (!fence)
> +		fence = dma_fence_get_stub();
> +
> +	sync_file = sync_file_create(fence);
> +
> +	dma_fence_put(fence);
> +
> +	if (!sync_file) {
> +		ret = -ENOMEM;
> +		goto err_put_fd;
> +	}
> +
> +	fd_install(fd, sync_file->file);
> +
> +	arg.fd = fd;
> +	if (copy_to_user(user_data, &arg, sizeof(arg)))
> +		return -EFAULT;
> +
> +	return 0;
> +
> +err_put_fd:
> +	put_unused_fd(fd);
> +	return ret;
> +}
> +#endif
> +
>  static long dma_buf_ioctl(struct file *file,
>  			  unsigned int cmd, unsigned long arg)
>  {
> @@ -405,6 +464,11 @@ static long dma_buf_ioctl(struct file *file,
>  	case DMA_BUF_SET_NAME_B:
>  		return dma_buf_set_name(dmabuf, (const char __user *)arg);
>  
> +#if IS_ENABLED(CONFIG_SYNC_FILE)
> +	case DMA_BUF_IOCTL_EXPORT_SYNC_FILE:
> +		return dma_buf_export_sync_file(dmabuf, (void __user *)arg);
> +#endif
> +
>  	default:
>  		return -ENOTTY;
>  	}
> diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.h
> index 7f30393b92c3b..f902cadcbdb56 100644
> --- a/include/uapi/linux/dma-buf.h
> +++ b/include/uapi/linux/dma-buf.h
> @@ -37,6 +37,29 @@ struct dma_buf_sync {
>  
>  #define DMA_BUF_NAME_LEN	32
>  
> +/**

Pulling the ioctl stuff into our docs (I'd put it right after the poll
support chapter) would be really nice. Bonus if you document the 2 simple
existing ones already there too ...

> + * struct dma_buf_export_sync_file - Get a sync_file from a dma-buf
> + *
> + * Userspace can perform a DMA_BUF_IOCTL_EXPORT_SYNC_FILE to retrieve the
> + * current set of fences on a dma-buf file descriptor as a sync_file.  CPU
> + * waits via poll() or other driver-specific mechanisms typically wait on
> + * whatever fences are on the dma-buf at the time the wait begins.  This
> + * is similar except that it takes a snapshot of the current fences on the
> + * dma-buf for waiting later instead of waiting immediately.  This is
> + * useful for modern graphics APIs such as Vulkan which assume an explicit
> + * synchronization model but still need to inter-operate with dma-buf.
> + */
> +struct dma_buf_sync_file {
> +	/**
> +	 * @flags: Read/write flags
> +	 *
> +	 * Must DMA_BUF_SYNC_READ, DMA_BUF_SYNC_WRITE, or both.
> +	 */
> +	__u32 flags;

Maybe spec what actually happens for each flag ... We've had epic
bikesheds about what each ones needs.
-Daniel

> +	/** @fd: Sync file file descriptor */
> +	__s32 fd;
> +};
> +
>  #define DMA_BUF_BASE		'b'
>  #define DMA_BUF_IOCTL_SYNC	_IOW(DMA_BUF_BASE, 0, struct dma_buf_sync)
>  
> @@ -46,5 +69,6 @@ struct dma_buf_sync {
>  #define DMA_BUF_SET_NAME	_IOW(DMA_BUF_BASE, 1, const char *)
>  #define DMA_BUF_SET_NAME_A	_IOW(DMA_BUF_BASE, 1, u32)
>  #define DMA_BUF_SET_NAME_B	_IOW(DMA_BUF_BASE, 1, u64)
> +#define DMA_BUF_IOCTL_EXPORT_SYNC_FILE	_IOWR(DMA_BUF_BASE, 2, struct dma_buf_sync_file)
>  
>  #endif
> -- 
> 2.31.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
