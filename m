Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA86675F9F
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 22:25:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CA8110E13C;
	Fri, 20 Jan 2023 21:25:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B129010E244
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 21:25:41 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 k10-20020a17090a590a00b0022ba875a1a4so3263111pji.3
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 13:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=lx7Bv+SVM/w6kHv4tQh6+Mruz9/kiECXW3eC6e0xGg0=;
 b=ZNqm4HSbdl4pAHwhx7RgOiCKpib4uiI7hPCKWGQR15JiJ8StAy/J4Zm31u6iK6lGLM
 QiLA0PCFNKBXcST29+sq0iPmSPSg7V0T7p/HZidnE3iM7F2kusC33U/bwnzKsx1UmGCU
 bx+Xo+t2JyFyOxQIacT59Z6mRKwQ35EBjzNYcrfMK0SdOqDCHb4QbH8QwOQFL03I+2q4
 9XVR+kwNAW15vZSyXHa+uXJCz2PV2UGIpUDKPAE7zJ4V/WMVUgJxyKxkdMbJ5mMeVcah
 J9gZ47LBgo9fAhOcHF2aZvcxatMn/XQ/J0FLq60IOAPtLLFX30u20oObRkFQbRLEPFMv
 4Uyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lx7Bv+SVM/w6kHv4tQh6+Mruz9/kiECXW3eC6e0xGg0=;
 b=ncZveCg5Ir7u54PIxlrixm2BEgMOZugpNF04SX8wi2Oh+cT7qTM8ZoJFVrgrbXaTq7
 dAl35mgfh0kGaABSPecMRbfr+g5JBwy5hjWhbvx7eJG8nZJVOTM13YbtyodSWI99yknF
 iafWlXTzRpbtTwpPaKQQnFnhZZ8inb1FYE27Wyq6v2pKum92yCgHJI6sgi7wH51sq1iB
 JTT3ycKi4BOziegVaWu1Vjyaewd7DSF8KImhn7kq8uV5dBurZIAFZlHAY38i6mYS1Epn
 Y41yrHU5zT2qhlLlbocVLOhJBBdnsJ0+KzHcGXXfdGX0nT0BVecYlx94jP6FLW3gVqZK
 3a/w==
X-Gm-Message-State: AFqh2kpPw5aglOvdxx4vLJxOsFjy92GHRxJ+p7t3uu/X9cW6iCAPymmc
 aTNl2QHqIAOdfGQKg2/EEIMCng==
X-Google-Smtp-Source: AMrXdXtwhIqtBWU45zyf1bzkiqUzuWp2dKInBgUEkeiJg+t/kbCqaHe66mWt/V9avpd8lqioBqzT9Q==
X-Received: by 2002:a17:903:2481:b0:194:b105:5cb4 with SMTP id
 p1-20020a170903248100b00194b1055cb4mr13282543plw.25.1674249940805; 
 Fri, 20 Jan 2023 13:25:40 -0800 (PST)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157]) by smtp.gmail.com with ESMTPSA id
 p17-20020a170902a41100b0017a032d7ae4sm14892384plq.104.2023.01.20.13.25.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 13:25:40 -0800 (PST)
Date: Fri, 20 Jan 2023 21:25:36 +0000
From: Carlos Llamas <cmllamas@google.com>
To: "T.J. Mercier" <tjmercier@google.com>
Subject: Re: [PATCH 3/4] binder: Add flags to relinquish ownership of fds
Message-ID: <Y8sG0BSlZ4l8XX89@google.com>
References: <20230109213809.418135-1-tjmercier@google.com>
 <20230109213809.418135-4-tjmercier@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230109213809.418135-4-tjmercier@google.com>
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
Cc: linux-doc@vger.kernel.org, daniel.vetter@ffwll.ch,
 dri-devel@lists.freedesktop.org, jstultz@google.com,
 Zefan Li <lizefan.x@bytedance.com>, Joel Fernandes <joel@joelfernandes.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, android-mm@google.com,
 Jonathan Corbet <corbet@lwn.net>, Martijn Coenen <maco@android.com>,
 linux-media@vger.kernel.org, Todd Kjos <tkjos@android.com>,
 linaro-mm-sig@lists.linaro.org, Hridya Valsaraju <hridya@google.com>,
 cgroups@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>,
 Christian Brauner <brauner@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Tejun Heo <tj@kernel.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 09, 2023 at 09:38:06PM +0000, T.J. Mercier wrote:
> From: Hridya Valsaraju <hridya@google.com>
> 
> This patch introduces flags BINDER_FD_FLAG_XFER_CHARGE, and
> BINDER_FD_FLAG_XFER_CHARGE that a process sending an individual fd or

I believe the second one was meant to be BINDER_FDA_FLAG_XFER_CHARGE.
However, I don't think a separation of flags is needed. We process each
fd in the array individually anyway. So, it's OK to reuse the FD flags
for FDAs too.

> fd array to another process over binder IPC can set to relinquish
> ownership of the fd(s) being sent for memory accounting purposes. If the
> flag is found to be set during the fd or fd array translation and the
> fd is for a DMA-BUF, the buffer is uncharged from the sender's cgroup
> and charged to the receiving process's cgroup instead.
> 
> It is up to the sending process to ensure that it closes the fds
> regardless of whether the transfer failed or succeeded.
> 
> Most graphics shared memory allocations in Android are done by the
> graphics allocator HAL process. On requests from clients, the HAL
> process allocates memory and sends the fds to the clients over binder
> IPC. The graphics allocator HAL will not retain any references to the
> buffers. When the HAL sets *_FLAG_XFER_CHARGE for fd arrays holding
> DMA-BUF fds, or individual fd objects, binder will transfer the charge
> for the buffer from the allocator process cgroup to the client process
> cgroup.
> 
> The pad [1] and pad_flags [2] fields of binder_fd_object and
> binder_fda_array_object come from alignment with flat_binder_object and
> have never been exposed for use from userspace. This new flags use
> follows the pattern set by binder_buffer_object.
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/include/uapi/linux/android/binder.h?id=feba3900cabb8e7c87368faa28e7a6936809ba22
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/include/uapi/linux/android/binder.h?id=5cdcf4c6a638591ec0e98c57404a19e7f9997567
> 
> Signed-off-by: Hridya Valsaraju <hridya@google.com>
> Signed-off-by: T.J. Mercier <tjmercier@google.com>
> ---
>  Documentation/admin-guide/cgroup-v2.rst |  3 ++-
>  drivers/android/binder.c                | 31 +++++++++++++++++++++----
>  drivers/dma-buf/dma-buf.c               |  4 +---
>  include/linux/dma-buf.h                 |  1 +
>  include/uapi/linux/android/binder.h     | 23 ++++++++++++++----
>  5 files changed, 50 insertions(+), 12 deletions(-)
> 
> diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
> index 538ae22bc514..d225295932c0 100644
> --- a/Documentation/admin-guide/cgroup-v2.rst
> +++ b/Documentation/admin-guide/cgroup-v2.rst
> @@ -1457,7 +1457,8 @@ PAGE_SIZE multiple when read back.
>  
>  	  dmabuf (npn)
>  		Amount of memory used for exported DMA buffers allocated by the cgroup.
> -		Stays with the allocating cgroup regardless of how the buffer is shared.
> +		Stays with the allocating cgroup regardless of how the buffer is shared
> +		unless explicitly transferred.
>  
>  	  workingset_refault_anon
>  		Number of refaults of previously evicted anonymous pages.
> diff --git a/drivers/android/binder.c b/drivers/android/binder.c
> index 880224ec6abb..9830848c8d25 100644
> --- a/drivers/android/binder.c
> +++ b/drivers/android/binder.c
> @@ -42,6 +42,7 @@
>  
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>  
> +#include <linux/dma-buf.h>
>  #include <linux/fdtable.h>
>  #include <linux/file.h>
>  #include <linux/freezer.h>
> @@ -2237,7 +2238,7 @@ static int binder_translate_handle(struct flat_binder_object *fp,
>  	return ret;
>  }
>  
> -static int binder_translate_fd(u32 fd, binder_size_t fd_offset,
> +static int binder_translate_fd(u32 fd, binder_size_t fd_offset, __u32 flags,
>  			       struct binder_transaction *t,
>  			       struct binder_thread *thread,
>  			       struct binder_transaction *in_reply_to)
> @@ -2275,6 +2276,26 @@ static int binder_translate_fd(u32 fd, binder_size_t fd_offset,
>  		goto err_security;
>  	}
>  
> +	if (IS_ENABLED(CONFIG_MEMCG) && (flags & BINDER_FD_FLAG_XFER_CHARGE)) {
> +		struct dma_buf *dmabuf;
> +
> +		if (unlikely(!is_dma_buf_file(file))) {
> +			binder_user_error(
> +				"%d:%d got transaction with XFER_CHARGE for non-dmabuf fd, %d\n",
> +				proc->pid, thread->pid, fd);
> +			ret = -EINVAL;
> +			goto err_dmabuf;
> +		}
> +
> +		dmabuf = file->private_data;
> +		ret = dma_buf_transfer_charge(dmabuf, target_proc->tsk);
> +		if (ret) {
> +			pr_warn("%d:%d Unable to transfer DMA-BUF fd charge to %d\n",
> +				proc->pid, thread->pid, target_proc->pid);
> +			goto err_xfer;
> +		}
> +	}
> +
>  	/*
>  	 * Add fixup record for this transaction. The allocation
>  	 * of the fd in the target needs to be done from a
> @@ -2294,6 +2315,8 @@ static int binder_translate_fd(u32 fd, binder_size_t fd_offset,
>  	return ret;
>  
>  err_alloc:
> +err_xfer:
> +err_dmabuf:
>  err_security:
>  	fput(file);
>  err_fget:
> @@ -2604,7 +2627,7 @@ static int binder_translate_fd_array(struct list_head *pf_head,
>  
>  		ret = copy_from_user(&fd, sender_ufda_base + sender_uoffset, sizeof(fd));
>  		if (!ret)
> -			ret = binder_translate_fd(fd, offset, t, thread,
> +			ret = binder_translate_fd(fd, offset, fda->flags, t, thread,
>  						  in_reply_to);
>  		if (ret)
>  			return ret > 0 ? -EINVAL : ret;
> @@ -3383,8 +3406,8 @@ static void binder_transaction(struct binder_proc *proc,
>  			struct binder_fd_object *fp = to_binder_fd_object(hdr);
>  			binder_size_t fd_offset = object_offset +
>  				(uintptr_t)&fp->fd - (uintptr_t)fp;
> -			int ret = binder_translate_fd(fp->fd, fd_offset, t,
> -						      thread, in_reply_to);
> +			int ret = binder_translate_fd(fp->fd, fd_offset, fp->flags,
> +						      t, thread, in_reply_to);
>  
>  			fp->pad_binder = 0;
>  			if (ret < 0 ||

IMO the changes to the dma-buf api should some in a separate patch. So
those can be approved and managed separately.

> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index fd6c5002032b..a65b42433099 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -34,8 +34,6 @@
>  
>  #include "dma-buf-sysfs-stats.h"
>  
> -static inline int is_dma_buf_file(struct file *);
> -
>  struct dma_buf_list {
>  	struct list_head head;
>  	struct mutex lock;
> @@ -527,7 +525,7 @@ static const struct file_operations dma_buf_fops = {
>  /*
>   * is_dma_buf_file - Check if struct file* is associated with dma_buf
>   */
> -static inline int is_dma_buf_file(struct file *file)
> +int is_dma_buf_file(struct file *file)
>  {
>  	return file->f_op == &dma_buf_fops;
>  }
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index 6aa128d76aa7..092d572ce528 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -595,6 +595,7 @@ dma_buf_attachment_is_dynamic(struct dma_buf_attachment *attach)
>  	return !!attach->importer_ops;
>  }
>  
> +int is_dma_buf_file(struct file *file);
>  struct dma_buf_attachment *dma_buf_attach(struct dma_buf *dmabuf,
>  					  struct device *dev);
>  struct dma_buf_attachment *
> diff --git a/include/uapi/linux/android/binder.h b/include/uapi/linux/android/binder.h
> index e72e4de8f452..696c2bdb8a7e 100644
> --- a/include/uapi/linux/android/binder.h
> +++ b/include/uapi/linux/android/binder.h
> @@ -91,14 +91,14 @@ struct flat_binder_object {
>  /**
>   * struct binder_fd_object - describes a filedescriptor to be fixed up.
>   * @hdr:	common header structure
> - * @pad_flags:	padding to remain compatible with old userspace code
> + * @flags:	One or more BINDER_FD_FLAG_* flags
>   * @pad_binder:	padding to remain compatible with old userspace code
>   * @fd:		file descriptor
>   * @cookie:	opaque data, used by user-space
>   */
>  struct binder_fd_object {
>  	struct binder_object_header	hdr;
> -	__u32				pad_flags;
> +	__u32				flags;
>  	union {
>  		binder_uintptr_t	pad_binder;
>  		__u32			fd;
> @@ -107,6 +107,17 @@ struct binder_fd_object {
>  	binder_uintptr_t		cookie;
>  };
>  
> +enum {
> +	/**
> +	 * @BINDER_FD_FLAG_XFER_CHARGE
> +	 *
> +	 * When set, the sender of a binder_fd_object wishes to relinquish ownership of the fd for
> +	 * memory accounting purposes. If the fd is for a DMA-BUF, the buffer is uncharged from the
> +	 * sender's cgroup and charged to the receiving process's cgroup instead.
> +	 */
> +	BINDER_FD_FLAG_XFER_CHARGE = 0x01,
> +};
> +
>  /* struct binder_buffer_object - object describing a userspace buffer
>   * @hdr:		common header structure
>   * @flags:		one or more BINDER_BUFFER_* flags
> @@ -141,7 +152,7 @@ enum {
>  
>  /* struct binder_fd_array_object - object describing an array of fds in a buffer
>   * @hdr:		common header structure
> - * @pad:		padding to ensure correct alignment
> + * @flags:		One or more BINDER_FDA_FLAG_* flags
>   * @num_fds:		number of file descriptors in the buffer
>   * @parent:		index in offset array to buffer holding the fd array
>   * @parent_offset:	start offset of fd array in the buffer
> @@ -162,12 +173,16 @@ enum {
>   */
>  struct binder_fd_array_object {
>  	struct binder_object_header	hdr;
> -	__u32				pad;
> +	__u32				flags;
>  	binder_size_t			num_fds;
>  	binder_size_t			parent;
>  	binder_size_t			parent_offset;
>  };
>  
> +enum {
> +	BINDER_FDA_FLAG_XFER_CHARGE = BINDER_FD_FLAG_XFER_CHARGE,
> +};
> +

I would prefer to drop this. It should avoid silly mistakes in
userspace similar to the typo in the commit message above.

>  /*
>   * On 64-bit platforms where user code may run in 32-bits the driver must
>   * translate the buffer (and local binder) addresses appropriately.
> -- 
> 2.39.0.314.g84b9a713c41-goog
> 

Thanks,
--
Carlos Llamas
