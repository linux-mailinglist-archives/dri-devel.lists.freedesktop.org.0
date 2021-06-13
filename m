Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DCB3A5A01
	for <lists+dri-devel@lfdr.de>; Sun, 13 Jun 2021 20:26:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11DC08904A;
	Sun, 13 Jun 2021 18:26:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 044808904A
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Jun 2021 18:26:20 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id x196so12033174oif.10
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Jun 2021 11:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:date:message-id:in-reply-to:references:user-agent
 :subject:mime-version;
 bh=WHIyrU+gcZaGKi7x4ycTTJpEAyiWaHXKxlWc5BDO/Bs=;
 b=G7LfhCf0CT4aPtOlvhp7lczqfmKOIXfjUMiuWXwQr1BSM0jYOsYxACqDCJAJDnhmez
 c460bbKvGiovWLojsVKthCJeOe8t2hdIgianPC/p4rpZBlLpLeLEUaYvRdidegzO6zvR
 ov9ZFeV2bkYDw+yd+S88w47L4swTzUCbHjaYdSYWfeR1a1akGPyQTyDPwDFdzwU+RRi2
 wOU8gAeYmrbv5545eGew44uYaXoN0ew90CYs6FUYAiybBIHCCNtWafzcN4hu2PtwSPYi
 3Nq/wWl1povS/CG1nPp9668F7fhJuwL+oIA6ZdE6OkddSsaj4FG94+fj9jWOK3LFL88m
 I/DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:date:message-id:in-reply-to
 :references:user-agent:subject:mime-version;
 bh=WHIyrU+gcZaGKi7x4ycTTJpEAyiWaHXKxlWc5BDO/Bs=;
 b=OEiRnMfB2NN0KEOrpreUYLYGr3GlXCyC6omxUiDqk9VEtk8MoMkTweHmv6jz9Cj1lO
 Qej0dJYuo0yhysRd7Mdm/iD3eZHTD6Ml3+0o7dVQpdlrF+3ggw2gZZmq6zT2nrTfIAFr
 1R2WFVeCpbMvavir0UFN5ZSt6HslHO7Co6wzb5nwfAyntJg+y9wiErusFmROf2mAvMi/
 OGy7NQVMnohkairdm2ATf6c9L0wKnTO8pA4Tf+Ow1fZ4lj0pdNH6wxr51D+wzZMNKoi3
 j3xnF++mI9PBWOnJqkuuSveqP4+7E6jOBpUlG28VVBxqm/h9fSOoCQtqBpwGoyG9GR4S
 9fOw==
X-Gm-Message-State: AOAM530e/hWR6d2S89vd0YrM9h6NIy0XzfLHciwwQr+zbahiYrqOw5MZ
 9WKivmrjf4G/+N+smn0ZQNXnHLcRoKQUyg==
X-Google-Smtp-Source: ABdhPJxnYm9DDlOvoqgbUP3Y356qiSE8eSxdLjtbBAqG204iodXDa/JivuKZaumFH1pE+MeD7U9Ozg==
X-Received: by 2002:aca:d706:: with SMTP id o6mr12968547oig.10.1623608779766; 
 Sun, 13 Jun 2021 11:26:19 -0700 (PDT)
Received: from [100.82.101.81] ([216.252.221.39])
 by smtp.gmail.com with ESMTPSA id 2sm2713290ota.58.2021.06.13.11.26.18
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 13 Jun 2021 11:26:19 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: <dri-devel@lists.freedesktop.org>
Date: Sun, 13 Jun 2021 13:26:16 -0500
Message-ID: <17a069fd158.2817.c6988b7ea6112e3e892765a0d4287e0c@jlekstrand.net>
In-Reply-To: <20210610210925.642582-5-jason@jlekstrand.net>
References: <20210610210925.642582-1-jason@jlekstrand.net>
 <20210610210925.642582-5-jason@jlekstrand.net>
User-Agent: AquaMail/1.29.2-1810 (build: 102900008)
Subject: Re: [PATCH 4/6] dma-buf: Add an API for exporting sync files (v12)
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="17a069fd8a3451d2817dfcc4a7"
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
Cc: =?UTF-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>,
 Jason Ekstrand <jason@jlekstrand.net>, Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--17a069fd8a3451d2817dfcc4a7
Content-Type: text/plain; format=flowed; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On June 10, 2021 16:09:49 Jason Ekstrand <jason@jlekstrand.net> wrote:

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

FYI, the Mesa MR for using this ioctl (the export one) have now been 
reviewed. As far as I'm concerned, we're ready to land patches 1-4 from 
this series.

--Jason


> By making this an ioctl on the dma-buf itself, it allows this new
> functionality to be used in an entirely driver-agnostic way without
> having access to a DRM fd. This makes it ideal for use in driver-generic
> code in Mesa or in a client such as a compositor where the DRM fd may be
> hard to reach.
>
> v2 (Jason Ekstrand):
> - Use a wrapper dma_fence_array of all fences including the new one
>   when importing an exclusive fence.
>
> v3 (Jason Ekstrand):
> - Lock around setting shared fences as well as exclusive
> - Mark SIGNAL_SYNC_FILE as a read-write ioctl.
> - Initialize ret to 0 in dma_buf_wait_sync_file
>
> v4 (Jason Ekstrand):
> - Use the new dma_resv_get_singleton helper
>
> v5 (Jason Ekstrand):
> - Rename the IOCTLs to import/export rather than wait/signal
> - Drop the WRITE flag and always get/set the exclusive fence
>
> v6 (Jason Ekstrand):
> - Drop the sync_file import as it was all-around sketchy and not nearly
>   as useful as import.
> - Re-introduce READ/WRITE flag support for export
> - Rework the commit message
>
> v7 (Jason Ekstrand):
> - Require at least one sync flag
> - Fix a refcounting bug: dma_resv_get_excl() doesn't take a reference
> - Use _rcu helpers since we're accessing the dma_resv read-only
>
> v8 (Jason Ekstrand):
> - Return -ENOMEM if the sync_file_create fails
> - Predicate support on IS_ENABLED(CONFIG_SYNC_FILE)
>
> v9 (Jason Ekstrand):
> - Add documentation for the new ioctl
>
> v10 (Jason Ekstrand):
> - Go back to dma_buf_sync_file as the ioctl struct name
>
> v11 (Daniel Vetter):
> - Go back to dma_buf_export_sync_file as the ioctl struct name
> - Better kerneldoc describing what the read/write flags do
>
> v12 (Christian König):
> - Document why we chose to make it an ioctl on dma-buf
>
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> Acked-by: Simon Ser <contact@emersion.fr>
> Acked-by: Christian König <christian.koenig@amd.com>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
> drivers/dma-buf/dma-buf.c    | 67 ++++++++++++++++++++++++++++++++++++
> include/uapi/linux/dma-buf.h | 35 +++++++++++++++++++
> 2 files changed, 102 insertions(+)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 511fe0d217a08..41b14b53cdda3 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -20,6 +20,7 @@
> #include <linux/debugfs.h>
> #include <linux/module.h>
> #include <linux/seq_file.h>
> +#include <linux/sync_file.h>
> #include <linux/poll.h>
> #include <linux/dma-resv.h>
> #include <linux/mm.h>
> @@ -191,6 +192,9 @@ static loff_t dma_buf_llseek(struct file *file, loff_t 
> offset, int whence)
>  * Note that this only signals the completion of the respective fences, i.e. the
>  * DMA transfers are complete. Cache flushing and any other necessary
>  * preparations before CPU access can begin still need to happen.
> + *
> + * As an alternative to poll(), the set of fences on DMA buffer can be
> + * exported as a &sync_file using &dma_buf_sync_file_export.
>  */
>
> static void dma_buf_poll_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
> @@ -362,6 +366,64 @@ static long dma_buf_set_name(struct dma_buf *dmabuf, 
> const char __user *buf)
>  return ret;
> }
>
> +#if IS_ENABLED(CONFIG_SYNC_FILE)
> +static long dma_buf_export_sync_file(struct dma_buf *dmabuf,
> +     void __user *user_data)
> +{
> + struct dma_buf_export_sync_file arg;
> + struct dma_fence *fence = NULL;
> + struct sync_file *sync_file;
> + int fd, ret;
> +
> + if (copy_from_user(&arg, user_data, sizeof(arg)))
> + return -EFAULT;
> +
> + if (arg.flags & ~DMA_BUF_SYNC_RW)
> + return -EINVAL;
> +
> + if ((arg.flags & DMA_BUF_SYNC_RW) == 0)
> + return -EINVAL;
> +
> + fd = get_unused_fd_flags(O_CLOEXEC);
> + if (fd < 0)
> + return fd;
> +
> + if (arg.flags & DMA_BUF_SYNC_WRITE) {
> + fence = dma_resv_get_singleton(dmabuf->resv);
> + if (IS_ERR(fence)) {
> + ret = PTR_ERR(fence);
> + goto err_put_fd;
> + }
> + } else if (arg.flags & DMA_BUF_SYNC_READ) {
> + fence = dma_resv_get_excl_unlocked(dmabuf->resv);
> + }
> +
> + if (!fence)
> + fence = dma_fence_get_stub();
> +
> + sync_file = sync_file_create(fence);
> +
> + dma_fence_put(fence);
> +
> + if (!sync_file) {
> + ret = -ENOMEM;
> + goto err_put_fd;
> + }
> +
> + fd_install(fd, sync_file->file);
> +
> + arg.fd = fd;
> + if (copy_to_user(user_data, &arg, sizeof(arg)))
> + return -EFAULT;
> +
> + return 0;
> +
> +err_put_fd:
> + put_unused_fd(fd);
> + return ret;
> +}
> +#endif
> +
> static long dma_buf_ioctl(struct file *file,
>   unsigned int cmd, unsigned long arg)
> {
> @@ -405,6 +467,11 @@ static long dma_buf_ioctl(struct file *file,
>  case DMA_BUF_SET_NAME_B:
>  return dma_buf_set_name(dmabuf, (const char __user *)arg);
>
> +#if IS_ENABLED(CONFIG_SYNC_FILE)
> + case DMA_BUF_IOCTL_EXPORT_SYNC_FILE:
> + return dma_buf_export_sync_file(dmabuf, (void __user *)arg);
> +#endif
> +
>  default:
>  return -ENOTTY;
>  }
> diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.h
> index 1c131002fe1ee..82f12a4640403 100644
> --- a/include/uapi/linux/dma-buf.h
> +++ b/include/uapi/linux/dma-buf.h
> @@ -81,6 +81,40 @@ struct dma_buf_sync {
>
> #define DMA_BUF_NAME_LEN 32
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
> + /**
> + * @flags: Read/write flags
> + *
> + * Must be DMA_BUF_SYNC_READ, DMA_BUF_SYNC_WRITE, or both.
> + *
> + * If DMA_BUF_SYNC_READ is set and DMA_BUF_SYNC_WRITE is not set,
> + * the returned sync file waits on any writers of the dma-buf to
> + * complete.  Waiting on the returned sync file is equivalent to
> + * poll() with POLLIN.
> + *
> + * If DMA_BUF_SYNC_WRITE is set, the returned sync file waits on
> + * any users of the dma-buf (read or write) to complete.  Waiting
> + * on the returned sync file is equivalent to poll() with POLLOUT.
> + * If both DMA_BUF_SYNC_WRITE and DMA_BUF_SYNC_READ are set, this
> + * is equivalent to just DMA_BUF_SYNC_WRITE.
> + */
> + __u32 flags;
> + /** @fd: Returned sync file descriptor */
> + __s32 fd;
> +};
> +
> #define DMA_BUF_BASE 'b'
> #define DMA_BUF_IOCTL_SYNC _IOW(DMA_BUF_BASE, 0, struct dma_buf_sync)
>
> @@ -90,5 +124,6 @@ struct dma_buf_sync {
> #define DMA_BUF_SET_NAME _IOW(DMA_BUF_BASE, 1, const char *)
> #define DMA_BUF_SET_NAME_A _IOW(DMA_BUF_BASE, 1, u32)
> #define DMA_BUF_SET_NAME_B _IOW(DMA_BUF_BASE, 1, u64)
> +#define DMA_BUF_IOCTL_EXPORT_SYNC_FILE _IOWR(DMA_BUF_BASE, 2, struct 
> dma_buf_export_sync_file)
>
> #endif
> --
> 2.31.1


--17a069fd8a3451d2817dfcc4a7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.=
w3.org/TR/html4/loose.dtd">
<html>
<body>
<div dir=3D"auto">
<div dir=3D"auto"><span style=3D"font-size: 12pt;">On June 10, 2021 16:09:4=
9 Jason Ekstrand &lt;jason@jlekstrand.net&gt; wrote:</span></div><div id=3D=
"aqm-original" style=3D"color: black;">
<div><br></div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #808080; padding-left: 0.75ex;">
<div dir=3D"auto">Modern userspace APIs like Vulkan are built on an explici=
t</div>
<div dir=3D"auto">synchronization model. &nbsp;This doesn't always play nic=
ely with the</div>
<div dir=3D"auto">implicit synchronization used in the kernel and assumed b=
y X11 and</div>
<div dir=3D"auto">Wayland. &nbsp;The client -&gt; compositor half of the sy=
nchronization isn't too</div>
<div dir=3D"auto">bad, at least on intel, because we can control whether or=
 not i915</div>
<div dir=3D"auto">synchronizes on the buffer and whether or not it's consid=
ered written.</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">The harder part is the compositor -&gt; client synchroniz=
ation when we get</div>
<div dir=3D"auto">the buffer back from the compositor. &nbsp;We're required=
 to be able to</div>
<div dir=3D"auto">provide the client with a VkSemaphore and VkFence represe=
nting the point</div>
<div dir=3D"auto">in time where the window system (compositor and/or displa=
y) finished</div>
<div dir=3D"auto">using the buffer. &nbsp;With current APIs, it's very hard=
 to do this in such</div>
<div dir=3D"auto">a way that we don't get confused by the Vulkan driver's a=
ccess of the</div>
<div dir=3D"auto">buffer. &nbsp;In particular, once we tell the kernel that=
 we're rendering to</div>
<div dir=3D"auto">the buffer again, any CPU waits on the buffer or GPU depe=
ndencies will</div>
<div dir=3D"auto">wait on some of the client rendering and not just the com=
positor.</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">This new IOCTL solves this problem by allowing us to get =
a snapshot of</div>
<div dir=3D"auto">the implicit synchronization state of a given dma-buf in =
the form of a</div>
<div dir=3D"auto">sync file. &nbsp;It's effectively the same as a poll() or=
 I915_GEM_WAIT only,</div>
<div dir=3D"auto">instead of CPU waiting directly, it encapsulates the wait=
 operation, at</div>
<div dir=3D"auto">the current moment in time, in a sync_file so we can chec=
k/wait on it</div>
<div dir=3D"auto">later. &nbsp;As long as the Vulkan driver does the sync_f=
ile export from the</div>
<div dir=3D"auto">dma-buf before we re-introduce it for rendering, it will =
only contain</div>
<div dir=3D"auto">fences from the compositor or display. &nbsp;This allows =
to accurately turn</div>
<div dir=3D"auto">it into a VkFence or VkSemaphore without any over-synchro=
nization.</div></blockquote></div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">FYI, the Mesa MR for using this ioctl (the export one) have now been r=
eviewed. As far as I'm concerned, we're ready to land patches 1-4 from this=
 series.</div><div dir=3D"auto"><br></div><div dir=3D"auto">--Jason</div><d=
iv dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div id=3D"aqm-origin=
al" style=3D"color: black;" dir=3D"auto"><blockquote type=3D"cite" class=3D=
"gmail_quote" style=3D"margin: 0 0 0 0.75ex; border-left: 1px solid #808080=
; padding-left: 0.75ex;"><div dir=3D"auto"></div>
<div dir=3D"auto">By making this an ioctl on the dma-buf itself, it allows =
this new</div>
<div dir=3D"auto">functionality to be used in an entirely driver-agnostic w=
ay without</div>
<div dir=3D"auto">having access to a DRM fd. This makes it ideal for use in=
 driver-generic</div>
<div dir=3D"auto">code in Mesa or in a client such as a compositor where th=
e DRM fd may be</div>
<div dir=3D"auto">hard to reach.</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">v2 (Jason Ekstrand):</div>
<div dir=3D"auto">&nbsp;- Use a wrapper dma_fence_array of all fences inclu=
ding the new one</div>
<div dir=3D"auto">&nbsp; &nbsp;when importing an exclusive fence.</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">v3 (Jason Ekstrand):</div>
<div dir=3D"auto">&nbsp;- Lock around setting shared fences as well as excl=
usive</div>
<div dir=3D"auto">&nbsp;- Mark SIGNAL_SYNC_FILE as a read-write ioctl.</div=
>
<div dir=3D"auto">&nbsp;- Initialize ret to 0 in dma_buf_wait_sync_file</di=
v>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">v4 (Jason Ekstrand):</div>
<div dir=3D"auto">&nbsp;- Use the new dma_resv_get_singleton helper</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">v5 (Jason Ekstrand):</div>
<div dir=3D"auto">&nbsp;- Rename the IOCTLs to import/export rather than wa=
it/signal</div>
<div dir=3D"auto">&nbsp;- Drop the WRITE flag and always get/set the exclus=
ive fence</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">v6 (Jason Ekstrand):</div>
<div dir=3D"auto">&nbsp;- Drop the sync_file import as it was all-around sk=
etchy and not nearly</div>
<div dir=3D"auto">&nbsp; &nbsp;as useful as import.</div>
<div dir=3D"auto">&nbsp;- Re-introduce READ/WRITE flag support for export</=
div>
<div dir=3D"auto">&nbsp;- Rework the commit message</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">v7 (Jason Ekstrand):</div>
<div dir=3D"auto">&nbsp;- Require at least one sync flag</div>
<div dir=3D"auto">&nbsp;- Fix a refcounting bug: dma_resv_get_excl() doesn'=
t take a reference</div>
<div dir=3D"auto">&nbsp;- Use _rcu helpers since we're accessing the dma_re=
sv read-only</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">v8 (Jason Ekstrand):</div>
<div dir=3D"auto">&nbsp;- Return -ENOMEM if the sync_file_create fails</div=
>
<div dir=3D"auto">&nbsp;- Predicate support on IS_ENABLED(CONFIG_SYNC_FILE)=
</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">v9 (Jason Ekstrand):</div>
<div dir=3D"auto">&nbsp;- Add documentation for the new ioctl</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">v10 (Jason Ekstrand):</div>
<div dir=3D"auto">&nbsp;- Go back to dma_buf_sync_file as the ioctl struct =
name</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">v11 (Daniel Vetter):</div>
<div dir=3D"auto">&nbsp;- Go back to dma_buf_export_sync_file as the ioctl =
struct name</div>
<div dir=3D"auto">&nbsp;- Better kerneldoc describing what the read/write f=
lags do</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">v12 (Christian K=C3=B6nig):</div>
<div dir=3D"auto">&nbsp;- Document why we chose to make it an ioctl on dma-=
buf</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">Signed-off-by: Jason Ekstrand &lt;jason@jlekstrand.net&gt=
;</div>
<div dir=3D"auto">Acked-by: Simon Ser &lt;contact@emersion.fr&gt;</div>
<div dir=3D"auto">Acked-by: Christian K=C3=B6nig &lt;christian.koenig@amd.c=
om&gt;</div>
<div dir=3D"auto">Reviewed-by: Daniel Vetter &lt;daniel.vetter@ffwll.ch&gt;=
</div>
<div dir=3D"auto">Cc: Sumit Semwal &lt;sumit.semwal@linaro.org&gt;</div>
<div dir=3D"auto">Cc: Maarten Lankhorst &lt;maarten.lankhorst@linux.intel.c=
om&gt;</div>
<div dir=3D"auto">---</div>
<div dir=3D"auto">&nbsp;drivers/dma-buf/dma-buf.c &nbsp; &nbsp;| 67 +++++++=
+++++++++++++++++++++++++++++</div>
<div dir=3D"auto">&nbsp;include/uapi/linux/dma-buf.h | 35 +++++++++++++++++=
++</div>
<div dir=3D"auto">&nbsp;2 files changed, 102 insertions(+)</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/=
dma-buf.c</div>
<div dir=3D"auto">index 511fe0d217a08..41b14b53cdda3 100644</div>
<div dir=3D"auto">--- a/drivers/dma-buf/dma-buf.c</div>
<div dir=3D"auto">+++ b/drivers/dma-buf/dma-buf.c</div>
<div dir=3D"auto">@@ -20,6 +20,7 @@</div>
<div dir=3D"auto">&nbsp;#include &lt;linux/debugfs.h&gt;</div>
<div dir=3D"auto">&nbsp;#include &lt;linux/module.h&gt;</div>
<div dir=3D"auto">&nbsp;#include &lt;linux/seq_file.h&gt;</div>
<div dir=3D"auto">+#include &lt;linux/sync_file.h&gt;</div>
<div dir=3D"auto">&nbsp;#include &lt;linux/poll.h&gt;</div>
<div dir=3D"auto">&nbsp;#include &lt;linux/dma-resv.h&gt;</div>
<div dir=3D"auto">&nbsp;#include &lt;linux/mm.h&gt;</div>
<div dir=3D"auto">@@ -191,6 +192,9 @@ static loff_t dma_buf_llseek(struct f=
ile *file, loff_t offset, int whence)</div>
<div dir=3D"auto">&nbsp; * Note that this only signals the completion of th=
e respective fences, i.e. the</div>
<div dir=3D"auto">&nbsp; * DMA transfers are complete. Cache flushing and a=
ny other necessary</div>
<div dir=3D"auto">&nbsp; * preparations before CPU access can begin still n=
eed to happen.</div>
<div dir=3D"auto">+ *</div>
<div dir=3D"auto">+ * As an alternative to poll(), the set of fences on DMA=
 buffer can be</div>
<div dir=3D"auto">+ * exported as a &amp;sync_file using &amp;dma_buf_sync_=
file_export.</div>
<div dir=3D"auto">&nbsp; */</div>
<div dir=3D"auto">&nbsp;</div>
<div dir=3D"auto">&nbsp;static void dma_buf_poll_cb(struct dma_fence *fence=
, struct dma_fence_cb *cb)</div>
<div dir=3D"auto">@@ -362,6 +366,64 @@ static long dma_buf_set_name(struct =
dma_buf *dmabuf, const char __user *buf)</div>
<div dir=3D"auto">&nbsp;=09return ret;</div>
<div dir=3D"auto">&nbsp;}</div>
<div dir=3D"auto">&nbsp;</div>
<div dir=3D"auto">+#if IS_ENABLED(CONFIG_SYNC_FILE)</div>
<div dir=3D"auto">+static long dma_buf_export_sync_file(struct dma_buf *dma=
buf,</div>
<div dir=3D"auto">+=09=09=09=09 &nbsp; &nbsp; void __user *user_data)</div>
<div dir=3D"auto">+{</div>
<div dir=3D"auto">+=09struct dma_buf_export_sync_file arg;</div>
<div dir=3D"auto">+=09struct dma_fence *fence =3D NULL;</div>
<div dir=3D"auto">+=09struct sync_file *sync_file;</div>
<div dir=3D"auto">+=09int fd, ret;</div>
<div dir=3D"auto">+</div>
<div dir=3D"auto">+=09if (copy_from_user(&amp;arg, user_data, sizeof(arg)))=
</div>
<div dir=3D"auto">+=09=09return -EFAULT;</div>
<div dir=3D"auto">+</div>
<div dir=3D"auto">+=09if (arg.flags &amp; ~DMA_BUF_SYNC_RW)</div>
<div dir=3D"auto">+=09=09return -EINVAL;</div>
<div dir=3D"auto">+</div>
<div dir=3D"auto">+=09if ((arg.flags &amp; DMA_BUF_SYNC_RW) =3D=3D 0)</div>
<div dir=3D"auto">+=09=09return -EINVAL;</div>
<div dir=3D"auto">+</div>
<div dir=3D"auto">+=09fd =3D get_unused_fd_flags(O_CLOEXEC);</div>
<div dir=3D"auto">+=09if (fd &lt; 0)</div>
<div dir=3D"auto">+=09=09return fd;</div>
<div dir=3D"auto">+</div>
<div dir=3D"auto">+=09if (arg.flags &amp; DMA_BUF_SYNC_WRITE) {</div>
<div dir=3D"auto">+=09=09fence =3D dma_resv_get_singleton(dmabuf-&gt;resv);=
</div>
<div dir=3D"auto">+=09=09if (IS_ERR(fence)) {</div>
<div dir=3D"auto">+=09=09=09ret =3D PTR_ERR(fence);</div>
<div dir=3D"auto">+=09=09=09goto err_put_fd;</div>
<div dir=3D"auto">+=09=09}</div>
<div dir=3D"auto">+=09} else if (arg.flags &amp; DMA_BUF_SYNC_READ) {</div>
<div dir=3D"auto">+=09=09fence =3D dma_resv_get_excl_unlocked(dmabuf-&gt;re=
sv);</div>
<div dir=3D"auto">+=09}</div>
<div dir=3D"auto">+</div>
<div dir=3D"auto">+=09if (!fence)</div>
<div dir=3D"auto">+=09=09fence =3D dma_fence_get_stub();</div>
<div dir=3D"auto">+</div>
<div dir=3D"auto">+=09sync_file =3D sync_file_create(fence);</div>
<div dir=3D"auto">+</div>
<div dir=3D"auto">+=09dma_fence_put(fence);</div>
<div dir=3D"auto">+</div>
<div dir=3D"auto">+=09if (!sync_file) {</div>
<div dir=3D"auto">+=09=09ret =3D -ENOMEM;</div>
<div dir=3D"auto">+=09=09goto err_put_fd;</div>
<div dir=3D"auto">+=09}</div>
<div dir=3D"auto">+</div>
<div dir=3D"auto">+=09fd_install(fd, sync_file-&gt;file);</div>
<div dir=3D"auto">+</div>
<div dir=3D"auto">+=09arg.fd =3D fd;</div>
<div dir=3D"auto">+=09if (copy_to_user(user_data, &amp;arg, sizeof(arg)))</=
div>
<div dir=3D"auto">+=09=09return -EFAULT;</div>
<div dir=3D"auto">+</div>
<div dir=3D"auto">+=09return 0;</div>
<div dir=3D"auto">+</div>
<div dir=3D"auto">+err_put_fd:</div>
<div dir=3D"auto">+=09put_unused_fd(fd);</div>
<div dir=3D"auto">+=09return ret;</div>
<div dir=3D"auto">+}</div>
<div dir=3D"auto">+#endif</div>
<div dir=3D"auto">+</div>
<div dir=3D"auto">&nbsp;static long dma_buf_ioctl(struct file *file,</div>
<div dir=3D"auto">&nbsp;=09=09=09 &nbsp;unsigned int cmd, unsigned long arg=
)</div>
<div dir=3D"auto">&nbsp;{</div>
<div dir=3D"auto">@@ -405,6 +467,11 @@ static long dma_buf_ioctl(struct fil=
e *file,</div>
<div dir=3D"auto">&nbsp;=09case DMA_BUF_SET_NAME_B:</div>
<div dir=3D"auto">&nbsp;=09=09return dma_buf_set_name(dmabuf, (const char _=
_user *)arg);</div>
<div dir=3D"auto">&nbsp;</div>
<div dir=3D"auto">+#if IS_ENABLED(CONFIG_SYNC_FILE)</div>
<div dir=3D"auto">+=09case DMA_BUF_IOCTL_EXPORT_SYNC_FILE:</div>
<div dir=3D"auto">+=09=09return dma_buf_export_sync_file(dmabuf, (void __us=
er *)arg);</div>
<div dir=3D"auto">+#endif</div>
<div dir=3D"auto">+</div>
<div dir=3D"auto">&nbsp;=09default:</div>
<div dir=3D"auto">&nbsp;=09=09return -ENOTTY;</div>
<div dir=3D"auto">&nbsp;=09}</div>
<div dir=3D"auto">diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/=
linux/dma-buf.h</div>
<div dir=3D"auto">index 1c131002fe1ee..82f12a4640403 100644</div>
<div dir=3D"auto">--- a/include/uapi/linux/dma-buf.h</div>
<div dir=3D"auto">+++ b/include/uapi/linux/dma-buf.h</div>
<div dir=3D"auto">@@ -81,6 +81,40 @@ struct dma_buf_sync {</div>
<div dir=3D"auto">&nbsp;</div>
<div dir=3D"auto">&nbsp;#define DMA_BUF_NAME_LEN=0932</div>
<div dir=3D"auto">&nbsp;</div>
<div dir=3D"auto">+/**</div>
<div dir=3D"auto">+ * struct dma_buf_export_sync_file - Get a sync_file fro=
m a dma-buf</div>
<div dir=3D"auto">+ *</div>
<div dir=3D"auto">+ * Userspace can perform a DMA_BUF_IOCTL_EXPORT_SYNC_FIL=
E to retrieve the</div>
<div dir=3D"auto">+ * current set of fences on a dma-buf file descriptor as=
 a sync_file. &nbsp;CPU</div>
<div dir=3D"auto">+ * waits via poll() or other driver-specific mechanisms =
typically wait on</div>
<div dir=3D"auto">+ * whatever fences are on the dma-buf at the time the wa=
it begins. &nbsp;This</div>
<div dir=3D"auto">+ * is similar except that it takes a snapshot of the cur=
rent fences on the</div>
<div dir=3D"auto">+ * dma-buf for waiting later instead of waiting immediat=
ely. &nbsp;This is</div>
<div dir=3D"auto">+ * useful for modern graphics APIs such as Vulkan which =
assume an explicit</div>
<div dir=3D"auto">+ * synchronization model but still need to inter-operate=
 with dma-buf.</div>
<div dir=3D"auto">+ */</div>
<div dir=3D"auto">+struct dma_buf_export_sync_file {</div>
<div dir=3D"auto">+=09/**</div>
<div dir=3D"auto">+=09 * @flags: Read/write flags</div>
<div dir=3D"auto">+=09 *</div>
<div dir=3D"auto">+=09 * Must be DMA_BUF_SYNC_READ, DMA_BUF_SYNC_WRITE, or =
both.</div>
<div dir=3D"auto">+=09 *</div>
<div dir=3D"auto">+=09 * If DMA_BUF_SYNC_READ is set and DMA_BUF_SYNC_WRITE=
 is not set,</div>
<div dir=3D"auto">+=09 * the returned sync file waits on any writers of the=
 dma-buf to</div>
<div dir=3D"auto">+=09 * complete. &nbsp;Waiting on the returned sync file =
is equivalent to</div>
<div dir=3D"auto">+=09 * poll() with POLLIN.</div>
<div dir=3D"auto">+=09 *</div>
<div dir=3D"auto">+=09 * If DMA_BUF_SYNC_WRITE is set, the returned sync fi=
le waits on</div>
<div dir=3D"auto">+=09 * any users of the dma-buf (read or write) to comple=
te. &nbsp;Waiting</div>
<div dir=3D"auto">+=09 * on the returned sync file is equivalent to poll() =
with POLLOUT.</div>
<div dir=3D"auto">+=09 * If both DMA_BUF_SYNC_WRITE and DMA_BUF_SYNC_READ a=
re set, this</div>
<div dir=3D"auto">+=09 * is equivalent to just DMA_BUF_SYNC_WRITE.</div>
<div dir=3D"auto">+=09 */</div>
<div dir=3D"auto">+=09__u32 flags;</div>
<div dir=3D"auto">+=09/** @fd: Returned sync file descriptor */</div>
<div dir=3D"auto">+=09__s32 fd;</div>
<div dir=3D"auto">+};</div>
<div dir=3D"auto">+</div>
<div dir=3D"auto">&nbsp;#define DMA_BUF_BASE=09=09'b'</div>
<div dir=3D"auto">&nbsp;#define DMA_BUF_IOCTL_SYNC=09_IOW(DMA_BUF_BASE, 0, =
struct dma_buf_sync)</div>
<div dir=3D"auto">&nbsp;</div>
<div dir=3D"auto">@@ -90,5 +124,6 @@ struct dma_buf_sync {</div>
<div dir=3D"auto">&nbsp;#define DMA_BUF_SET_NAME=09_IOW(DMA_BUF_BASE, 1, co=
nst char *)</div>
<div dir=3D"auto">&nbsp;#define DMA_BUF_SET_NAME_A=09_IOW(DMA_BUF_BASE, 1, =
u32)</div>
<div dir=3D"auto">&nbsp;#define DMA_BUF_SET_NAME_B=09_IOW(DMA_BUF_BASE, 1, =
u64)</div>
<div dir=3D"auto">+#define DMA_BUF_IOCTL_EXPORT_SYNC_FILE=09_IOWR(DMA_BUF_B=
ASE, 2, struct dma_buf_export_sync_file)</div>
<div dir=3D"auto">&nbsp;</div>
<div dir=3D"auto">&nbsp;#endif</div>
<div dir=3D"auto">--&nbsp;</div>
<div dir=3D"auto">2.31.1</div>
</blockquote>
</div><div dir=3D"auto"><br></div>
</div></body>
</html>

--17a069fd8a3451d2817dfcc4a7--

