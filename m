Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72DA151B241
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 00:49:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51E3E10E654;
	Wed,  4 May 2022 22:49:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7B6410E654
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 22:49:27 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id l18so5554244ejc.7
 for <dri-devel@lists.freedesktop.org>; Wed, 04 May 2022 15:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=GfoI0vpP3KEwp/7zD0HSGcO1z33rqb8sKBwbNTjoHfg=;
 b=Q+zNCuuUdiDvsc3Miew9BTNqGX5rApBJGfRN5jVn9Y9ev4vTKGIq+eXgrMjcEpdaVh
 aAgFZBSM9xjskEts/rVB+iISCy486XvmHPNokPDSPmYnl05jqWtCeSKYuWNylKK/0TNS
 bIn/E5f5LNqHEwQEHs1iFI4emEHRFL14f4D3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=GfoI0vpP3KEwp/7zD0HSGcO1z33rqb8sKBwbNTjoHfg=;
 b=LB0IZLtpryrM+gzYzZ95UWZbdtpJasKGBzsxa7RT/m2mhJjXCN53enlpH41M8VDFWW
 yd0MQEtCLFGuGdEQATNC3DlgYjaC4QvJOdzi6kr8InpYH0rnCPh/ieyBZLX/hpzN2FLP
 GcP9AHqyqUauKGwUNgRyZXmSntsKxZSITMbAgTPiYZyYUdKVa7FJus0mR6ifd9bOKlw0
 Y1lDENN6DOzXjpZko5KvXKLGVj5UckQrC9JiBO0qOINXhZB/af3FMq+M0dHf/zDbo1/c
 GFYYVYgI+5SoTEN3zMAQijMhaYQCfmQDEZfNwOdF/KlQFEIMS5mqNVcMVXWWmuBUUDor
 Hagw==
X-Gm-Message-State: AOAM532qhsB3rloYcKzlDereGKwwwc8iuXcUy5GvgtFuvpCHMwOGWGeN
 d2XSfgR2BIVMh4aXDwUwaYUAKQqlhnZN8Q==
X-Google-Smtp-Source: ABdhPJxqttvkh7SQ67lLdn1WoZJ8BHPn7l5wjzODbcQBTZWpS6exUmMoCwXEB8yR3vWGcqVK/ruHLQ==
X-Received: by 2002:a17:907:6da5:b0:6f3:c4b1:378b with SMTP id
 sb37-20020a1709076da500b006f3c4b1378bmr22697732ejc.307.1651704566148; 
 Wed, 04 May 2022 15:49:26 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 v21-20020aa7d815000000b0042617ba63b8sm9636470edq.66.2022.05.04.15.49.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 15:49:25 -0700 (PDT)
Date: Thu, 5 May 2022 00:49:23 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [PATCH 1/2] dma-buf: Add an API for exporting sync files (v13)
Message-ID: <YnMC8xKCUqfaHtfT@phenom.ffwll.local>
References: <20220504203404.1495485-1-jason@jlekstrand.net>
 <20220504203404.1495485-2-jason@jlekstrand.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220504203404.1495485-2-jason@jlekstrand.net>
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
Cc: dri-devel@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 04, 2022 at 03:34:03PM -0500, Jason Ekstrand wrote:
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
> it into a VkFence or VkSemaphore without any over-synchronization.
> 
> By making this an ioctl on the dma-buf itself, it allows this new
> functionality to be used in an entirely driver-agnostic way without
> having access to a DRM fd. This makes it ideal for use in driver-generic
> code in Mesa or in a client such as a compositor where the DRM fd may be
> hard to reach.
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
> v11 (Daniel Vetter):
>  - Go back to dma_buf_export_sync_file as the ioctl struct name
>  - Better kerneldoc describing what the read/write flags do
> 
> v12 (Christian König):
>  - Document why we chose to make it an ioctl on dma-buf
> 
> v12 (Jason Ekstrand):
>  - Rebase on Christian König's fence rework
> 
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> Acked-by: Simon Ser <contact@emersion.fr>
> Acked-by: Christian König <christian.koenig@amd.com>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Not sure which version it was that I reviewed, but with dma_resv_usage
this all looks neat and tidy. One nit below.

> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>  drivers/dma-buf/dma-buf.c    | 64 ++++++++++++++++++++++++++++++++++++
>  include/uapi/linux/dma-buf.h | 35 ++++++++++++++++++++
>  2 files changed, 99 insertions(+)
> 
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 79795857be3e..529e0611e53b 100644
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
> @@ -192,6 +193,9 @@ static loff_t dma_buf_llseek(struct file *file, loff_t offset, int whence)
>   * Note that this only signals the completion of the respective fences, i.e. the
>   * DMA transfers are complete. Cache flushing and any other necessary
>   * preparations before CPU access can begin still need to happen.
> + *
> + * As an alternative to poll(), the set of fences on DMA buffer can be
> + * exported as a &sync_file using &dma_buf_sync_file_export.
>   */
>  
>  static void dma_buf_poll_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
> @@ -326,6 +330,61 @@ static long dma_buf_set_name(struct dma_buf *dmabuf, const char __user *buf)
>  	return 0;
>  }
>  
> +#if IS_ENABLED(CONFIG_SYNC_FILE)
> +static long dma_buf_export_sync_file(struct dma_buf *dmabuf,
> +				     void __user *user_data)
> +{
> +	struct dma_buf_export_sync_file arg;
> +	enum dma_resv_usage usage;
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

We allow userspace to set both SYNC_READ and SYNC_WRITE here, I think

	if ((arg.flags & DMA_BUF_SYNC_RW) == DMA_BUF_SYNC_RW)
		return -EINVAL;

is missing?

Also maybe a case to add to your igt.

> +
> +	fd = get_unused_fd_flags(O_CLOEXEC);
> +	if (fd < 0)
> +		return fd;
> +
> +	usage = (arg.flags & DMA_BUF_SYNC_WRITE) ? DMA_RESV_USAGE_WRITE :
> +						   DMA_RESV_USAGE_READ;
> +	ret = dma_resv_get_singleton(dmabuf->resv, usage, &fence);
> +	if (ret)
> +		goto err_put_fd;
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
> @@ -369,6 +428,11 @@ static long dma_buf_ioctl(struct file *file,
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
> index 8e4a2ca0bcbf..46f1e3e98b02 100644
> --- a/include/uapi/linux/dma-buf.h
> +++ b/include/uapi/linux/dma-buf.h
> @@ -85,6 +85,40 @@ struct dma_buf_sync {
>  
>  #define DMA_BUF_NAME_LEN	32
>  
> +/**
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
> +struct dma_buf_export_sync_file {
> +	/**
> +	 * @flags: Read/write flags
> +	 *
> +	 * Must be DMA_BUF_SYNC_READ, DMA_BUF_SYNC_WRITE, or both.
> +	 *
> +	 * If DMA_BUF_SYNC_READ is set and DMA_BUF_SYNC_WRITE is not set,
> +	 * the returned sync file waits on any writers of the dma-buf to
> +	 * complete.  Waiting on the returned sync file is equivalent to
> +	 * poll() with POLLIN.
> +	 *
> +	 * If DMA_BUF_SYNC_WRITE is set, the returned sync file waits on
> +	 * any users of the dma-buf (read or write) to complete.  Waiting
> +	 * on the returned sync file is equivalent to poll() with POLLOUT.
> +	 * If both DMA_BUF_SYNC_WRITE and DMA_BUF_SYNC_READ are set, this
> +	 * is equivalent to just DMA_BUF_SYNC_WRITE.
> +	 */
> +	__u32 flags;
> +	/** @fd: Returned sync file descriptor */
> +	__s32 fd;
> +};
> +
>  #define DMA_BUF_BASE		'b'
>  #define DMA_BUF_IOCTL_SYNC	_IOW(DMA_BUF_BASE, 0, struct dma_buf_sync)
>  
> @@ -94,5 +128,6 @@ struct dma_buf_sync {
>  #define DMA_BUF_SET_NAME	_IOW(DMA_BUF_BASE, 1, const char *)
>  #define DMA_BUF_SET_NAME_A	_IOW(DMA_BUF_BASE, 1, u32)
>  #define DMA_BUF_SET_NAME_B	_IOW(DMA_BUF_BASE, 1, u64)
> +#define DMA_BUF_IOCTL_EXPORT_SYNC_FILE	_IOWR(DMA_BUF_BASE, 2, struct dma_buf_export_sync_file)

With the one nit fixed for this version:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

>  
>  #endif
> -- 
> 2.36.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
