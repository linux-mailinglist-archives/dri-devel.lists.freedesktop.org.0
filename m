Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B095133C9BC
	for <lists+dri-devel@lfdr.de>; Tue, 16 Mar 2021 00:11:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A86CC89CAF;
	Mon, 15 Mar 2021 23:11:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9DBF89CAF
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Mar 2021 23:11:09 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id e19so69184184ejt.3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Mar 2021 16:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=98I3TRRYGxZTj37QVsZ+dDR7gjUnpCxgBiiIVEuTDRE=;
 b=ttr47w1ZKpS35q9rCHzZMWtVI2yDyGVVGUv7qZJG6d/ok6CBqEDeB86Ml+ugC+R6EQ
 nuuKNJArj8f0BFkouwRGBEBq6hboGUwvQKtcI28YYOlabRyB8BS2lk3sy3q3N2NXmU8y
 0kkYrUOrIXAeCHvELUInfQC24loCBzrMZcHEOAZ9K4Xd0teMGH6Jb74+me5A/airyQFr
 ePggCpzcOtLkzkM5R+SRz83S39e9NZM/4imJR1eRab/fED7CAOEfyoABsZ1Au3UJJiBW
 Q3xxje8E0M7m5R6yVq8gnD46NlwL8nCreo4D2tbVYg8mqWr5HSR8xxp7pEcM1AhBzu0S
 UPHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=98I3TRRYGxZTj37QVsZ+dDR7gjUnpCxgBiiIVEuTDRE=;
 b=qTwixrdyuPDSquN1T3d2/FjITBnK8KRPwPvusQG0NmAivmm/x19+i2sPOs0oqmC9LR
 77EhWak34XGGrgflFfRCczf/oQhz5oy6y9CsXYJXJ8SXoxjCSMHQqgCOXJ1829WHcsZ6
 ce1UVQ4e6tRXDxJ4Sz7nqjKOt3VpEs/Vh4t4RmZ9UDE3FZAP+iZXxtiClQg9Um9aQCz9
 +LAg6s0ivFCca3HpUvoMlXQ0VecXx9d03jdRtj4kB7ZkulWe5RKJ4HfQ2tQt/1um4KTy
 JMrRSdsBRt//STEY7p5l+648w67EWRkJxEs1iWVlmJ6jsvkx3CjBLjrUg++bz29/lft7
 vyew==
X-Gm-Message-State: AOAM530xGNS4ZfrNMv/34p7mke73LZDwYXIrh6K0ReVdmJkpIHPX0dvR
 g9ZMRWOhW1113g70x2ozVFSCXHu2H/hYNjcGAPzuJmaiPsc=
X-Google-Smtp-Source: ABdhPJwazwgw6OwbxbREDFu6JfOG0WM9X+GyoEqYGIT6pllWkRJ7WQobqM0qrUG7k1YAzY2pF0TMaDD/BUaGDIBqEYc=
X-Received: by 2002:a17:906:3c18:: with SMTP id
 h24mr26049965ejg.435.1615849868000; 
 Mon, 15 Mar 2021 16:11:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200317212115.419358-1-jason@jlekstrand.net>
 <20210315210453.1667925-1-jason@jlekstrand.net>
 <20210315210453.1667925-4-jason@jlekstrand.net>
In-Reply-To: <20210315210453.1667925-4-jason@jlekstrand.net>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Mon, 15 Mar 2021 18:10:56 -0500
Message-ID: <CAOFGe96CDjucaqppf8a2pnw8N2-deTnHEQ_oyq5irRL-7=2NLw@mail.gmail.com>
Subject: Re: [PATCH 3/3] dma-buf: Add an API for exporting sync files (v6)
To: Maling list - DRI developers <dri-devel@lists.freedesktop.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 15, 2021 at 4:05 PM Jason Ekstrand <jason@jlekstrand.net> wrote:
>
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
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> ---
>  drivers/dma-buf/dma-buf.c    | 55 ++++++++++++++++++++++++++++++++++++
>  include/uapi/linux/dma-buf.h |  6 ++++
>  2 files changed, 61 insertions(+)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index f264b70c383eb..e7f9dd62c19a9 100644
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
> @@ -362,6 +363,57 @@ static long dma_buf_set_name(struct dma_buf *dmabuf, const char __user *buf)
>         return ret;
>  }
>
> +static long dma_buf_export_sync_file(struct dma_buf *dmabuf,
> +                                    void __user *user_data)
> +{
> +       struct dma_buf_sync_file arg;
> +       struct dma_fence *fence = NULL;
> +       struct sync_file *sync_file;
> +       int fd, ret;
> +
> +       if (copy_from_user(&arg, user_data, sizeof(arg)))
> +               return -EFAULT;
> +
> +       if (arg.flags & ~DMA_BUF_SYNC_RW)
> +               return -EINVAL;
> +
> +       fd = get_unused_fd_flags(O_CLOEXEC);
> +       if (fd < 0)
> +               return fd;
> +
> +       if (arg.flags & DMA_BUF_SYNC_WRITE) {
> +               ret = dma_resv_get_singleton(dmabuf->resv, NULL, &fence);
> +               if (ret)
> +                       goto err_put_fd;
> +       } else if (arg.flags & DMA_BUF_SYNC_READ) {
> +               fence = dma_resv_get_excl(dmabuf->resv);
> +       }
> +
> +       if (!fence)
> +               fence = dma_fence_get_stub();
> +
> +       sync_file = sync_file_create(fence);
> +
> +       dma_fence_put(fence);
> +
> +       if (!sync_file) {
> +               ret = -EINVAL;

Should this be -EINVAL or -ENOMEM?

> +               goto err_put_fd;
> +       }
> +
> +       fd_install(fd, sync_file->file);
> +
> +       arg.fd = fd;
> +       if (copy_to_user(user_data, &arg, sizeof(arg)))
> +               return -EFAULT;
> +
> +       return 0;
> +
> +err_put_fd:
> +       put_unused_fd(fd);
> +       return ret;
> +}
> +
>  static long dma_buf_ioctl(struct file *file,
>                           unsigned int cmd, unsigned long arg)
>  {
> @@ -405,6 +457,9 @@ static long dma_buf_ioctl(struct file *file,
>         case DMA_BUF_SET_NAME_B:
>                 return dma_buf_set_name(dmabuf, (const char __user *)arg);
>
> +       case DMA_BUF_IOCTL_EXPORT_SYNC_FILE:
> +               return dma_buf_export_sync_file(dmabuf, (void __user *)arg);
> +
>         default:
>                 return -ENOTTY;
>         }
> diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.h
> index 7f30393b92c3b..9bce1e8bd31d3 100644
> --- a/include/uapi/linux/dma-buf.h
> +++ b/include/uapi/linux/dma-buf.h
> @@ -37,6 +37,11 @@ struct dma_buf_sync {
>
>  #define DMA_BUF_NAME_LEN       32
>
> +struct dma_buf_sync_file {
> +       __u32 flags;
> +       __s32 fd;
> +};
> +
>  #define DMA_BUF_BASE           'b'
>  #define DMA_BUF_IOCTL_SYNC     _IOW(DMA_BUF_BASE, 0, struct dma_buf_sync)
>
> @@ -46,5 +51,6 @@ struct dma_buf_sync {
>  #define DMA_BUF_SET_NAME       _IOW(DMA_BUF_BASE, 1, const char *)
>  #define DMA_BUF_SET_NAME_A     _IOW(DMA_BUF_BASE, 1, u32)
>  #define DMA_BUF_SET_NAME_B     _IOW(DMA_BUF_BASE, 1, u64)
> +#define DMA_BUF_IOCTL_EXPORT_SYNC_FILE _IOWR(DMA_BUF_BASE, 2, struct dma_buf_sync_file)
>
>  #endif
> --
> 2.29.2
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
