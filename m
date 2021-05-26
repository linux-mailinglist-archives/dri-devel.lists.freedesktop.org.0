Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D01391D95
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 19:09:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 360A16ED18;
	Wed, 26 May 2021 17:09:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 538086ED18
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 17:09:34 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id f18so3574346ejq.10
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 10:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=HzOsaV8uPz4RvAniacpVMtfVF7njsV6EGs/QV53jdxI=;
 b=G0EAn1MZohPdcgN1UrV/Z3NV7e4lHfhkM8O+icERC1b+CCBTZmlKjVUPAkwcou+EbP
 t8CKLRnNRd3c79rmDFzZ7GTt+5hA2ZlEJ73LjSFf4WcM3oyfzUJeZv6WtIOZ8k2r1DZb
 WMrTBiFFxQJXbyA0UX7Ox0VOPQBgZd3D36IQA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=HzOsaV8uPz4RvAniacpVMtfVF7njsV6EGs/QV53jdxI=;
 b=YZy2NdQJ5SSEqGOZz0ICavJ2SWke3m6FFzGeo6ygC7zEBnoTThbg/v6fwlB5KpFvSN
 vOg/eRNum+jekQHvHmI3SlP7IR2ssjm+97sCuQxDQNk84rdeVZF1R5DtdCF3Z03aj8K3
 WRD0FKODoYXL9FgNtOKGP9GfkauREF8rDn0EIEx8oxDK5F62GFWdHtZE7C3sV1//BCqO
 Y2T68EB3SVgkQ76o/RGNgi5feCetwGFjFBYdoyoyqdAkz0bBM9YBoLNEQoefEM36fzTw
 +Fa1zPWytlVKlTqKLEqHZFSX0p0xUyIxI13AsHHC7NSj5bH+Ip+wnokWNyuJ2faR8TNM
 yaWQ==
X-Gm-Message-State: AOAM532U52JLdErhyCt/LysmKgvE+/j4nQb0aorZgj/8+cym0LHThnMb
 rUzt4P2XV8fatGdb88GbzwJQSw==
X-Google-Smtp-Source: ABdhPJyAvIHLsK0axpwt3TQphtkI0ESr/8loek5ybwVniIs32TxuYuWovKrHWDf5hrmEoW5TWUUPNQ==
X-Received: by 2002:a17:906:c7d2:: with SMTP id
 dc18mr35706673ejb.188.1622048972826; 
 Wed, 26 May 2021 10:09:32 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id d11sm10476075ejr.58.2021.05.26.10.09.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 10:09:32 -0700 (PDT)
Date: Wed, 26 May 2021 19:09:30 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [PATCH 7/7] RFC: dma-buf: Add an API for importing sync files (v7)
Message-ID: <YK6Ays2ZSUKJbd7F@phenom.ffwll.local>
References: <20210525211753.1086069-1-jason@jlekstrand.net>
 <20210525211753.1086069-8-jason@jlekstrand.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210525211753.1086069-8-jason@jlekstrand.net>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 25, 2021 at 04:17:53PM -0500, Jason Ekstrand wrote:
> This patch is analogous to the previous sync file export patch in that
> it allows you to import a sync_file into a dma-buf.  Unlike the previous
> patch, however, this does add genuinely new functionality to dma-buf.
> Without this, the only way to attach a sync_file to a dma-buf is to
> submit a batch to your driver of choice which waits on the sync_file and
> claims to write to the dma-buf.  Even if said batch is a no-op, a submit
> is typically way more overhead than just attaching a fence.  A submit
> may also imply extra synchronization with other work because it happens
> on a hardware queue.
> 
> In the Vulkan world, this is useful for dealing with the out-fence from
> vkQueuePresent.  Current Linux window-systems (X11, Wayland, etc.) all
> rely on dma-buf implicit sync.  Since Vulkan is an explicit sync API, we
> get a set of fences (VkSemaphores) in vkQueuePresent and have to stash
> those as an exclusive (write) fence on the dma-buf.  We handle it in
> Mesa today with the above mentioned dummy submit trick.  This ioctl
> would allow us to set it directly without the dummy submit.
> 
> This may also open up possibilities for GPU drivers to move away from
> implicit sync for their kernel driver uAPI and instead provide sync
> files and rely on dma-buf import/export for communicating with other
> implicit sync clients.
> 
> We make the explicit choice here to only allow setting RW fences which
> translates to an exclusive fence on the dma_resv.  There's no use for
> read-only fences for communicating with other implicit sync userspace
> and any such attempts are likely to be racy at best.  When we got to
> insert the RW fence, the actual fence we set as the new exclusive fence
> is a combination of the sync_file provided by the user and all the other
> fences on the dma_resv.  This ensures that the newly added exclusive
> fence will never signal before the old one would have and ensures that
> we don't break any dma_resv contracts.  We require userspace to specify
> RW in the flags for symmetry with the export ioctl and in case we ever
> want to support read fences in the future.
> 
> There is one downside here that's worth documenting:  If two clients
> writing to the same dma-buf using this API race with each other, their
> actions on the dma-buf may happen in parallel or in an undefined order.
> Both with and without this API, the pattern is the same:  Collect all
> the fences on dma-buf, submit work which depends on said fences, and
> then set a new exclusive (write) fence on the dma-buf which depends on
> said work.  The difference is that, when it's all handled by the GPU
> driver's submit ioctl, the three operations happen atomically under the
> dma_resv lock.  If two userspace submits race, one will happen before
> the other.  You aren't guaranteed which but you are guaranteed that
> they're strictly ordered.  If userspace manages the fences itself, then
> these three operations happen separately and the two render operations
> may happen genuinely in parallel or get interleaved.  However, this is a
> case of userspace racing with itself.  As long as we ensure userspace
> can't back the kernel into a corner, it should be fine.
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
>  - Split import and export into separate patches
>  - New commit message
> 
> v7 (Daniel Vetter):
>  - Fix the uapi header to use the right struct in the ioctl
>  - Use a separate dma_buf_import_sync_file struct
>  - Add kerneldoc for dma_buf_import_sync_file
> 
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>  drivers/dma-buf/dma-buf.c    | 36 ++++++++++++++++++++++++++++++++++++
>  include/uapi/linux/dma-buf.h | 22 ++++++++++++++++++++++
>  2 files changed, 58 insertions(+)
> 
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index ea117de962903..098340222662b 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -422,6 +422,40 @@ static long dma_buf_export_sync_file(struct dma_buf *dmabuf,
>  	put_unused_fd(fd);
>  	return ret;
>  }
> +
> +static long dma_buf_import_sync_file(struct dma_buf *dmabuf,
> +				     const void __user *user_data)
> +{
> +	struct dma_buf_import_sync_file arg;
> +	struct dma_fence *fence, *singleton = NULL;
> +	int ret = 0;
> +
> +	if (copy_from_user(&arg, user_data, sizeof(arg)))
> +		return -EFAULT;
> +
> +	if (arg.flags != DMA_BUF_SYNC_RW)
> +		return -EINVAL;
> +
> +	fence = sync_file_get_fence(arg.fd);
> +	if (!fence)
> +		return -EINVAL;
> +
> +	dma_resv_lock(dmabuf->resv, NULL);
> +
> +	singleton = dma_resv_get_singleton_unlocked(dmabuf->resv, fence);
> +	if (IS_ERR(singleton)) {
> +		ret = PTR_ERR(singleton);
> +	} else if (singleton) {
> +		dma_resv_add_excl_fence(dmabuf->resv, singleton);
> +		dma_resv_add_shared_fence(dmabuf->resv, singleton);

Thought some more about this, and I think what we actually need is:
- the "combine everything" singleton as shared fence
- but only the new + eventually current exclusive fence in the exclusive
  slot

This way the rules are still all upheld, but we avoid including all
current shared fences in our new exclusive fence. And there's potentially
a lot included in these shared fences, like the beginning of rendering the
next frame. So exactly what we're trying to avoid.

This is endless amounts of tricky ...
-Daniel

> +	}
> +
> +	dma_resv_unlock(dmabuf->resv);
> +
> +	dma_fence_put(fence);
> +
> +	return ret;
> +}
>  #endif
>  
>  static long dma_buf_ioctl(struct file *file,
> @@ -470,6 +504,8 @@ static long dma_buf_ioctl(struct file *file,
>  #if IS_ENABLED(CONFIG_SYNC_FILE)
>  	case DMA_BUF_IOCTL_EXPORT_SYNC_FILE:
>  		return dma_buf_export_sync_file(dmabuf, (void __user *)arg);
> +	case DMA_BUF_IOCTL_IMPORT_SYNC_FILE:
> +		return dma_buf_import_sync_file(dmabuf, (const void __user *)arg);
>  #endif
>  
>  	default:
> diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.h
> index aeba45180b028..af53987db24be 100644
> --- a/include/uapi/linux/dma-buf.h
> +++ b/include/uapi/linux/dma-buf.h
> @@ -101,6 +101,27 @@ struct dma_buf_export_sync_file {
>  	__s32 fd;
>  };
>  
> +/**
> + * struct dma_buf_import_sync_file - Insert a sync_file into a dma-buf
> + *
> + * Userspace can perform a DMA_BUF_IOCTL_IMPORT_SYNC_FILE to insert a
> + * sync_file into a dma-buf for the purposes of implicit synchronization
> + * with other dma-buf consumers.  This allows clients using explicitly
> + * synchronized APIs such as Vulkan to inter-op with dma-buf consumers
> + * which expect implicit synchronization such as OpenGL or most media
> + * drivers/video.
> + */
> +struct dma_buf_import_sync_file {
> +	/**
> +	 * @flags: Read/write flags
> +	 *
> +	 * Must be DMA_BUF_SYNC_RW.
> +	 */
> +	__u32 flags;
> +	/** @fd: Sync file descriptor */
> +	__s32 fd;
> +};
> +
>  #define DMA_BUF_BASE		'b'
>  #define DMA_BUF_IOCTL_SYNC	_IOW(DMA_BUF_BASE, 0, struct dma_buf_sync)
>  
> @@ -111,5 +132,6 @@ struct dma_buf_export_sync_file {
>  #define DMA_BUF_SET_NAME_A	_IOW(DMA_BUF_BASE, 1, u32)
>  #define DMA_BUF_SET_NAME_B	_IOW(DMA_BUF_BASE, 1, u64)
>  #define DMA_BUF_IOCTL_EXPORT_SYNC_FILE	_IOWR(DMA_BUF_BASE, 2, struct dma_buf_export_sync_file)
> +#define DMA_BUF_IOCTL_IMPORT_SYNC_FILE	_IOW(DMA_BUF_BASE, 3, struct dma_buf_import_sync_file)
>  
>  #endif
> -- 
> 2.31.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
