Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB3451B27B
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 00:53:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C54210E179;
	Wed,  4 May 2022 22:53:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C02D10E0A2
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 22:53:44 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id g20so3311380edw.6
 for <dri-devel@lists.freedesktop.org>; Wed, 04 May 2022 15:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=F7NA+WdObs4IZcmVR1EuGjey4fonjCAS2bzdy3Q/7VI=;
 b=T2qrd1n5pQbddKBKMhzaOHTK+qjAp2l0WGnl3ZaeuxV/IbciEh7N8ALS+i4oB5vPej
 zpUbM1wk1E4GEUKVEqMCbJR3+pVKeAzY4mssQ0cgvf+XgzD/3FeofsDz+gs1LFjN09oX
 tvIb583+yH5HSv4A0PadUkWOPwbQsMelyynlA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=F7NA+WdObs4IZcmVR1EuGjey4fonjCAS2bzdy3Q/7VI=;
 b=t//7Qrl9EIZxwEFz6w7oNIcyo3aUavo0cyXNdCI80uDL+4V1uSP1gErARIPmvNxjcR
 CNpv9g1PcQEvq9UfrTo4CiNHJVOGrNgGw3WwC1a87JeGTZopibcwtSlvjl5hv/0AtyIx
 aODJQjFJijWy5mQQWQbyiHqgt/aE9mbLmKOaiYXKN6UWOecNFjyOZG3sxCM/WmdDnutO
 Rspdklp05rOaOhO3s4+ZqrXUKfqhLgHWPH3lMrce7UoLrdAgUfMuijb77Kr4hJUNsaq5
 bvq+hjcm1rRXS6IQRYIu2FQMR1G1zGAdoqOa4jbeFhGiw1p8o4wveLmpEou4xCwieySD
 O73A==
X-Gm-Message-State: AOAM531XhW9VakBHDUcsxZiLbgS/MehqGFPWZgBB14zcRapN7IE6LuFX
 aXu6K6LX4neLvObIkvTW4m6yyg==
X-Google-Smtp-Source: ABdhPJwVyiZ0KNDbXxTxaMpIfJpIcRB9oN9k4wEglVa5KyoLz18Ze52uYaW7KTerdvjsTMPnLxkr7g==
X-Received: by 2002:a50:bae7:0:b0:425:c0fa:e0a7 with SMTP id
 x94-20020a50bae7000000b00425c0fae0a7mr26519064ede.104.1651704822860; 
 Wed, 04 May 2022 15:53:42 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 em10-20020a170907288a00b006f3ef214e6dsm46536ejc.211.2022.05.04.15.53.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 15:53:42 -0700 (PDT)
Date: Thu, 5 May 2022 00:53:40 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [PATCH 2/2] dma-buf: Add an API for importing sync files (v8)
Message-ID: <YnMD9JX/v6kSQE2t@phenom.ffwll.local>
References: <20220504203404.1495485-1-jason@jlekstrand.net>
 <20220504203404.1495485-3-jason@jlekstrand.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220504203404.1495485-3-jason@jlekstrand.net>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 04, 2022 at 03:34:04PM -0500, Jason Ekstrand wrote:
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
> v8 (Jason Ekstrand):
>  - Rebase on Christian König's fence rework
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
> index 529e0611e53b..68aac6f694f9 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -383,6 +383,40 @@ static long dma_buf_export_sync_file(struct dma_buf *dmabuf,
>  	put_unused_fd(fd);
>  	return ret;
>  }
> +
> +static long dma_buf_import_sync_file(struct dma_buf *dmabuf,
> +				     const void __user *user_data)
> +{
> +	struct dma_buf_import_sync_file arg;
> +	struct dma_fence *fence;
> +	enum dma_resv_usage usage;
> +	int ret = 0;
> +
> +	if (copy_from_user(&arg, user_data, sizeof(arg)))
> +		return -EFAULT;
> +
> +	if (arg.flags != DMA_BUF_SYNC_RW)

I think the flag validation here looks wrong? I think needs needs the
exact same 3 checks as the export ioctl.

> +		return -EINVAL;
> +
> +	fence = sync_file_get_fence(arg.fd);
> +	if (!fence)
> +		return -EINVAL;
> +
> +	usage = (arg.flags & DMA_BUF_SYNC_WRITE) ? DMA_RESV_USAGE_WRITE :
> +						   DMA_RESV_USAGE_READ;
> +
> +	dma_resv_lock(dmabuf->resv, NULL);
> +
> +	ret = dma_resv_reserve_fences(dmabuf->resv, 1);
> +	if (!ret)
> +		dma_resv_add_fence(dmabuf->resv, fence, usage);
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
> @@ -431,6 +465,8 @@ static long dma_buf_ioctl(struct file *file,
>  #if IS_ENABLED(CONFIG_SYNC_FILE)
>  	case DMA_BUF_IOCTL_EXPORT_SYNC_FILE:
>  		return dma_buf_export_sync_file(dmabuf, (void __user *)arg);
> +	case DMA_BUF_IOCTL_IMPORT_SYNC_FILE:
> +		return dma_buf_import_sync_file(dmabuf, (const void __user *)arg);
>  #endif
>  
>  	default:
> diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.h
> index 46f1e3e98b02..913119bf2201 100644
> --- a/include/uapi/linux/dma-buf.h
> +++ b/include/uapi/linux/dma-buf.h
> @@ -119,6 +119,27 @@ struct dma_buf_export_sync_file {
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

The checks are wrong, but the intent of your implementation looks a lot
more like you allow both SYNC_WRITE and SYNC_READ, and I think that makes
a lot of sense. Especially since we can now true sync-less access for vk
with DMA_RESV_USAGE_BOOKKEEPING, so allowing userspace to explicit set
read will be needed.

Or does vk only allow you to set write fences anyway? That would suck for
the vk app + gl compositor case a bit, so I hope not.

> +	 */
> +	__u32 flags;
> +	/** @fd: Sync file descriptor */
> +	__s32 fd;
> +};
> +
>  #define DMA_BUF_BASE		'b'
>  #define DMA_BUF_IOCTL_SYNC	_IOW(DMA_BUF_BASE, 0, struct dma_buf_sync)
>  
> @@ -129,5 +150,6 @@ struct dma_buf_export_sync_file {
>  #define DMA_BUF_SET_NAME_A	_IOW(DMA_BUF_BASE, 1, u32)
>  #define DMA_BUF_SET_NAME_B	_IOW(DMA_BUF_BASE, 1, u64)
>  #define DMA_BUF_IOCTL_EXPORT_SYNC_FILE	_IOWR(DMA_BUF_BASE, 2, struct dma_buf_export_sync_file)
> +#define DMA_BUF_IOCTL_IMPORT_SYNC_FILE	_IOW(DMA_BUF_BASE, 3, struct dma_buf_import_sync_file)

With the flag nits sorted out:

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
