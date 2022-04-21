Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 799F750ACA7
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 02:11:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC0E010E00E;
	Fri, 22 Apr 2022 00:11:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 565EB10E429
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 18:28:45 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id t13so5330264pgn.8
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 11:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Sqioiy8FTVIwwfgTrHoYKbgJrbPNKg5lpVy2JdR4EHU=;
 b=gX6IxUwKDSgUOrXLTiECcpA3Rp48wGxfgveQhWleNt2G3dILaJc7TVhv8vFGVxEaVi
 wfheNUizycAF5wCMRaBvqgTP3V27a1ohLtxvHpRlhbQDLXoE4BT1zxOmVKVhlvggvxD8
 xBKKCYXGGarCUjyHuEo39d2CON29e1o3eIsp/F33Pk8UOvQlPrrVxrJ19w7FqJzHsyBq
 aA6F2c+bBR9zHjvgNNjT4A6mNFBu2jia5hbCy32kvSIkc+As4VWEhQemAqWBBVdBNled
 r8iHp9BpG8kcfHIzDk1y0ELM0+HKHZvTjASj9vKr6JrzOXK14OHdpvwzUTP3LOun+0sy
 4ijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Sqioiy8FTVIwwfgTrHoYKbgJrbPNKg5lpVy2JdR4EHU=;
 b=uEKQKHVp/i9TUcP6AAb6c2J4ipj/01zVhu+RlUsL3Ld4M6OQoOaKNuWGuwW4bzh5Gk
 LJFPD0RXAJ0KGyTxs9kV+S70+W5CXXhJKpI9HeBUBS6vMky/M86gl408DyqnVbfU/AT9
 pm/Pk+i8mYfrFwXAw7a7u/ql5RxeC3ibyy/MkFnryKiUI5wFC7WS0YSMCLwgOT1uo8se
 rxZtmI/WVI1eYzFKVESl3JUM7aOwb7vhnu1T1VqQmgn7sfqjbBIZxBsP7+ffmFVHuE8L
 RK558t4ZWY6W+V5Dn50uiNyP4gxPzXpJjy7gWFoYvoTij3y6FSF6f08xShKpYhL+2mDt
 /Zlg==
X-Gm-Message-State: AOAM530Of4LoG3BHbYCocPkAmgfig+qotF0hi/Ea/QMlP4cR4GRckwiK
 QaR72MF0ONAFiXPn3uNsokWz5w==
X-Google-Smtp-Source: ABdhPJxepqVRb/L/wsoSRAnZEmxspQCHxD1CdYluXSymWq1W4Cyc26xyjzczEUvd8gXIIPzMw4rFqA==
X-Received: by 2002:a05:6a00:b87:b0:50a:5ff2:bb2d with SMTP id
 g7-20020a056a000b8700b0050a5ff2bb2dmr944441pfj.68.1650565724550; 
 Thu, 21 Apr 2022 11:28:44 -0700 (PDT)
Received: from google.com (201.59.83.34.bc.googleusercontent.com.
 [34.83.59.201]) by smtp.gmail.com with ESMTPSA id
 fv9-20020a17090b0e8900b001cd4989febcsm3506238pjb.8.2022.04.21.11.28.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 11:28:44 -0700 (PDT)
Date: Thu, 21 Apr 2022 18:28:40 +0000
From: Carlos Llamas <cmllamas@google.com>
To: "T.J. Mercier" <tjmercier@google.com>
Subject: Re: [RFC v5 5/6] binder: Add flags to relinquish ownership of fds
Message-ID: <YmGiNh0DDIcwcnVl@google.com>
References: <20220420235228.2767816-1-tjmercier@google.com>
 <20220420235228.2767816-6-tjmercier@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220420235228.2767816-6-tjmercier@google.com>
X-Mailman-Approved-At: Fri, 22 Apr 2022 00:10:53 +0000
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
Cc: dri-devel@lists.freedesktop.org, jstultz@google.com, kaleshsingh@google.com,
 Joel Fernandes <joel@joelfernandes.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Martijn Coenen <maco@android.com>,
 kernel-team@android.com, linux-media@vger.kernel.org,
 Todd Kjos <tkjos@android.com>, linaro-mm-sig@lists.linaro.org,
 Hridya Valsaraju <hridya@google.com>, skhan@linuxfoundation.org,
 Suren Baghdasaryan <surenb@google.com>, Christian Brauner <brauner@kernel.org>,
 Kenny.Ho@amd.com, linux-kernel@vger.kernel.org,
 Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>, mkoutny@suse.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, tj@kernel.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 20, 2022 at 11:52:23PM +0000, T.J. Mercier wrote:
> From: Hridya Valsaraju <hridya@google.com>
> 
> This patch introduces flags BINDER_FD_FLAG_SENDER_NO_NEED, and
> BINDER_FDA_FLAG_SENDER_NO_NEED that a process sending an individual
> fd or fd array to another process over binder IPC can set to relinquish
> ownership of the fds being sent for memory accounting purposes. If the
> flag is found to be set during the fd or fd array translation and the
> fd is for a DMA-BUF, the buffer is uncharged from the sender's cgroup
> and charged to the receiving process's cgroup instead.
> 
> It is up to the sending process to ensure that it closes the fds
> regardless of whether the transfer failed or succeeded.
> 
> Most graphics shared memory allocations in Android are done by the
> graphics allocator HAL process. On requests from clients, the HAL process
> allocates memory and sends the fds to the clients over binder IPC.
> The graphics allocator HAL will not retain any references to the
> buffers. When the HAL sets *_FLAG_SENDER_NO_NEED for fd arrays holding
> DMA-BUF fds, or individual fd objects, the gpu cgroup controller will
> be able to correctly charge the buffers to the client processes instead
> of the graphics allocator HAL.
> 
> Since this is a new feature exposed to userspace, the kernel and userspace
> must be compatible for the accounting to work for transfers. In all cases
> the allocation and transport of DMA buffers via binder will succeed, but
> only when both the kernel supports, and userspace depends on this feature
> will the transfer accounting work. The possible scenarios are detailed
> below:

New binder driver features which require userspace coordination can be
"advertised" by the kernel via binderfs. You can see an example of how
oneway_spam_detection is exposed in commit fc470abf54b2 ("binderfs: add
support for feature files"). This is just an option to consider if it
makes things easier in userspace. Although it seems that for the second
scenario (old kernel + new userpsace) the flags would just be ignored.

> 
> 1. new kernel + old userspace
> The kernel supports the feature but userspace does not use it. The old
> userspace won't mount the new cgroup controller, accounting is not
> performed, charge is not transferred.
> 
> 2. old kernel + new userspace
> The new cgroup controller is not supported by the kernel, accounting is
> not performed, charge is not transferred.
> 
> 3. old kernel + old userspace
> Same as #2
> 
> 4. new kernel + new userspace
> Cgroup is mounted, feature is supported and used.
> 
> Signed-off-by: Hridya Valsaraju <hridya@google.com>
> Signed-off-by: T.J. Mercier <tjmercier@google.com>
> 
> ---
> v5 changes
> Support both binder_fd_array_object and binder_fd_object. This is
> necessary because new versions of Android will use binder_fd_object
> instead of binder_fd_array_object, and we need to support both.
> 
> Use the new, simpler dma_buf_transfer_charge API.
> 
> v3 changes
> Remove android from title per Todd Kjos.
> 
> Use more common dual author commit message format per John Stultz.
> 
> Include details on behavior for all combinations of kernel/userspace
> versions in changelog (thanks Suren Baghdasaryan) per Greg Kroah-Hartman.
> 
> v2 changes
> Move dma-buf cgroup charge transfer from a dma_buf_op defined by every
> heap to a single dma-buf function for all heaps per Daniel Vetter and
> Christian König.
> ---
>  drivers/android/binder.c            | 27 +++++++++++++++++++++++----
>  drivers/dma-buf/dma-buf.c           |  4 ++--
>  include/linux/dma-buf.h             |  2 +-
>  include/uapi/linux/android/binder.h | 23 +++++++++++++++++++----
>  4 files changed, 45 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/android/binder.c b/drivers/android/binder.c
> index 8351c5638880..b07d50fe1c80 100644
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
> @@ -2170,7 +2171,7 @@ static int binder_translate_handle(struct flat_binder_object *fp,
>  	return ret;
>  }
>  
> -static int binder_translate_fd(u32 fd, binder_size_t fd_offset,
> +static int binder_translate_fd(u32 fd, binder_size_t fd_offset, __u32 flags,
>  			       struct binder_transaction *t,
>  			       struct binder_thread *thread,
>  			       struct binder_transaction *in_reply_to)
> @@ -2208,6 +2209,23 @@ static int binder_translate_fd(u32 fd, binder_size_t fd_offset,
>  		goto err_security;
>  	}
>  
> +	if (IS_ENABLED(CONFIG_CGROUP_GPU) && (flags & BINDER_FD_FLAG_SENDER_NO_NEED)) {
> +		if (is_dma_buf_file(file)) {
> +			struct dma_buf *dmabuf = file->private_data;
> +
> +			ret = dma_buf_transfer_charge(dmabuf, target_proc->tsk);
> +			if (ret)
> +				pr_warn("%d:%d Unable to transfer DMA-BUF fd charge to %d\n",
> +					proc->pid, thread->pid, target_proc->pid);

If we fail to transfer the charge, it seems we continue with the fixup
allocation and then propagate the error. Shouldn't the translation be
aborted at this point instead? Or is this supposed to be handled?

> +		} else {

nit: negating is_dma_buf_file() check eliminates the "else" here.

> +			binder_user_error(
> +				"%d:%d got transaction with SENDER_NO_NEED for non-dmabuf fd, %d\n",
> +				proc->pid, thread->pid, fd);
> +			ret = -EINVAL;
> +			goto err_noneed;
> +		}
> +	}
> +
>  	/*
>  	 * Add fixup record for this transaction. The allocation
>  	 * of the fd in the target needs to be done from a
> @@ -2226,6 +2244,7 @@ static int binder_translate_fd(u32 fd, binder_size_t fd_offset,
>  	return ret;
>  
>  err_alloc:
> +err_noneed:
>  err_security:
>  	fput(file);
>  err_fget:
> @@ -2528,7 +2547,7 @@ static int binder_translate_fd_array(struct list_head *pf_head,
>  
>  		ret = copy_from_user(&fd, sender_ufda_base + sender_uoffset, sizeof(fd));
>  		if (!ret)
> -			ret = binder_translate_fd(fd, offset, t, thread,
> +			ret = binder_translate_fd(fd, offset, fda->flags, t, thread,
>  						  in_reply_to);
>  		if (ret)
>  			return ret > 0 ? -EINVAL : ret;
> @@ -3179,8 +3198,8 @@ static void binder_transaction(struct binder_proc *proc,
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
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index f3fb844925e2..36ed6cd4ddcc 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -31,7 +31,6 @@
>  
>  #include "dma-buf-sysfs-stats.h"
>  
> -static inline int is_dma_buf_file(struct file *);
>  
>  struct dma_buf_list {
>  	struct list_head head;
> @@ -400,10 +399,11 @@ static const struct file_operations dma_buf_fops = {
>  /*
>   * is_dma_buf_file - Check if struct file* is associated with dma_buf
>   */
> -static inline int is_dma_buf_file(struct file *file)
> +int is_dma_buf_file(struct file *file)
>  {
>  	return file->f_op == &dma_buf_fops;
>  }
> +EXPORT_SYMBOL_NS_GPL(is_dma_buf_file, DMA_BUF);
>  
>  static struct file *dma_buf_getfile(struct dma_buf *dmabuf, int flags)
>  {
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index 438ad8577b76..2b9812758fee 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -614,7 +614,7 @@ dma_buf_attachment_is_dynamic(struct dma_buf_attachment *attach)
>  {
>  	return !!attach->importer_ops;
>  }
> -
> +int is_dma_buf_file(struct file *file);
>  struct dma_buf_attachment *dma_buf_attach(struct dma_buf *dmabuf,
>  					  struct device *dev);
>  struct dma_buf_attachment *
> diff --git a/include/uapi/linux/android/binder.h b/include/uapi/linux/android/binder.h
> index 11157fae8a8e..b263cbb603ea 100644
> --- a/include/uapi/linux/android/binder.h
> +++ b/include/uapi/linux/android/binder.h
> @@ -91,14 +91,14 @@ struct flat_binder_object {
>  /**
>   * struct binder_fd_object - describes a filedescriptor to be fixed up.
>   * @hdr:	common header structure
> - * @pad_flags:	padding to remain compatible with old userspace code

Does this mean we no longer need to keep the compatibility with the "old
userspace code"? Maybe these old flags are all less than 0x2000?

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
> +	 * @BINDER_FD_FLAG_SENDER_NO_NEED
> +	 *
> +	 * When set, the sender of a binder_fd_object wishes to relinquish ownership of the fd for
> +	 * memory accounting purposes. If the fd is for a DMA-BUF, the buffer is uncharged from the
> +	 * sender's cgroup and charged to the receiving process's cgroup instead.
> +	 */
> +	BINDER_FD_FLAG_SENDER_NO_NEED = 0x2000,

SENDER_NO_NEED wasn't straight-forward for me. Perhaps RELINQUISH or
XFER_{OWNER|CHARGE|CGROUP} could be some other options to consider.

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
> + * flags:		One or more BINDER_FDA_FLAG_* flags
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
> +	BINDER_FDA_FLAG_SENDER_NO_NEED = BINDER_FD_FLAG_SENDER_NO_NEED,
> +};
> +
>  /*
>   * On 64-bit platforms where user code may run in 32-bits the driver must
>   * translate the buffer (and local binder) addresses appropriately.
> -- 
> 2.36.0.rc0.470.gd361397f0d-goog
> 

Other than included minor comments:

Reviewed-by: Carlos Llamas <cmllamas@google.com>

--
Carlos Llamas
