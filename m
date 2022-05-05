Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 769A151D588
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 12:19:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E265C10FB73;
	Fri,  6 May 2022 10:19:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [IPv6:2607:f8b0:4864:20::1131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B7F110F7AD
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 08:10:45 +0000 (UTC)
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-2f83983782fso40236867b3.6
 for <dri-devel@lists.freedesktop.org>; Thu, 05 May 2022 01:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xqj1PK8l3CukS2Ifv9U0ecyZxwMggi8LxIQgF+eSLsQ=;
 b=UHE1beiL3tx7MHrhMK2N8k+pn1z+ddVRGBS8+ovvpZQ+dXuXqwBApwTEk12c/xB+j4
 aRXo4p6tIiOmualdK4aw8ad3BsblHpyPliuvRl6SSDJHHIGp3bxFYK4nTNJlnJlyBzR0
 Rz3uCLmIEKIpkMqVaOj7EtcBozc6x1ohk2xmve7IOe9mddtoRlLToQ6Abl8Y43ckJmn0
 KmNFtMT7hO1ubY5haoCPGlExQJISrNx2yhZWsLUklrAjR6hjGj7QjgMpoAH6ymioMtWB
 REZYBzGMnIdIWOqrPvwR7aALN4LI/QeeE3+eVNuPlx6oh7X1jAxNYq1YRUTi6UtNQ9bo
 iYlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xqj1PK8l3CukS2Ifv9U0ecyZxwMggi8LxIQgF+eSLsQ=;
 b=UqHBA90A5M3tbi6mYTLGYdZ7h4/mKmK1JLSfBnqTiUQ2Jr1UMeTjn/mEXKNbKbXw4b
 j4xe6iVCJ8wcAayEPOTroW0mF3jBSEYOM7KHkinof3bvl8sJBsjenHbsS7lCQ4IfT4E1
 xC14OeQnYTu4e1xSGNX2z0g70Qq0hOb+M/kjJowPMLyFuJMZqEUT1v2bsXBS1Gmn3efO
 +U+bxJvDjdwKsPOXZSPFB7xLBKpXvEV0o+LIOKIbR67Z8yBSTG28PpDAyHtWGbkeI4Mi
 12hSl+Vr+eNv0fHCtkfJv+drWQneeoiQI8k2I7NJRhAU7W5PtXEuKWBYddl8h3SKYacP
 u2Ng==
X-Gm-Message-State: AOAM530OtcyQB55h0Asav3+40UKBUxPbSekMRWGaRUgJrg8uXvqz6+oR
 YMwLjpRbTl0UhO8sKNX13ssuCsT8v0sHDFG/dtpU+Q==
X-Google-Smtp-Source: ABdhPJxIxsdDx4zpk/wS5+kv+mgg0TE1/Ed4fkZJGKwCZYXeprCTFcZfnsxFRtB3iwuQXIoO4EjpGMLX94Hf4e+EV+I=
X-Received: by 2002:a81:f0e:0:b0:2f7:d523:e49d with SMTP id
 14-20020a810f0e000000b002f7d523e49dmr22072039ywp.311.1651738244042; Thu, 05
 May 2022 01:10:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220504203404.1495485-1-jason@jlekstrand.net>
 <20220504203404.1495485-2-jason@jlekstrand.net>
 <7d478470-00fa-07a6-1479-dee80ced5b76@amd.com>
In-Reply-To: <7d478470-00fa-07a6-1479-dee80ced5b76@amd.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Thu, 5 May 2022 03:10:33 -0500
Message-ID: <CAOFGe948_qtwrLd1DiHOJOkxK-iT_qU-3FG+uz4bGGnL7oKpCw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dma-buf: Add an API for exporting sync files (v13)
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: multipart/alternative; boundary="0000000000004c641905de3f4732"
X-Mailman-Approved-At: Fri, 06 May 2022 10:19:04 +0000
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
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000004c641905de3f4732
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 5, 2022 at 1:25 AM Christian K=C3=B6nig <christian.koenig@amd.c=
om>
wrote:

> Am 04.05.22 um 22:34 schrieb Jason Ekstrand:
> > Modern userspace APIs like Vulkan are built on an explicit
> > synchronization model.  This doesn't always play nicely with the
> > implicit synchronization used in the kernel and assumed by X11 and
> > Wayland.  The client -> compositor half of the synchronization isn't to=
o
> > bad, at least on intel, because we can control whether or not i915
> > synchronizes on the buffer and whether or not it's considered written.
> >
> > The harder part is the compositor -> client synchronization when we get
> > the buffer back from the compositor.  We're required to be able to
> > provide the client with a VkSemaphore and VkFence representing the poin=
t
> > in time where the window system (compositor and/or display) finished
> > using the buffer.  With current APIs, it's very hard to do this in such
> > a way that we don't get confused by the Vulkan driver's access of the
> > buffer.  In particular, once we tell the kernel that we're rendering to
> > the buffer again, any CPU waits on the buffer or GPU dependencies will
> > wait on some of the client rendering and not just the compositor.
> >
> > This new IOCTL solves this problem by allowing us to get a snapshot of
> > the implicit synchronization state of a given dma-buf in the form of a
> > sync file.  It's effectively the same as a poll() or I915_GEM_WAIT only=
,
> > instead of CPU waiting directly, it encapsulates the wait operation, at
> > the current moment in time, in a sync_file so we can check/wait on it
> > later.  As long as the Vulkan driver does the sync_file export from the
> > dma-buf before we re-introduce it for rendering, it will only contain
> > fences from the compositor or display.  This allows to accurately turn
> > it into a VkFence or VkSemaphore without any over-synchronization.
> >
> > By making this an ioctl on the dma-buf itself, it allows this new
> > functionality to be used in an entirely driver-agnostic way without
> > having access to a DRM fd. This makes it ideal for use in driver-generi=
c
> > code in Mesa or in a client such as a compositor where the DRM fd may b=
e
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
> >   - Drop the sync_file import as it was all-around sketchy and not near=
ly
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
> > v12 (Christian K=C3=B6nig):
> >   - Document why we chose to make it an ioctl on dma-buf
> >
> > v12 (Jason Ekstrand):
> >   - Rebase on Christian K=C3=B6nig's fence rework
> >
> > Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> > Acked-by: Simon Ser <contact@emersion.fr>
> > Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > ---
> >   drivers/dma-buf/dma-buf.c    | 64 +++++++++++++++++++++++++++++++++++=
+
> >   include/uapi/linux/dma-buf.h | 35 ++++++++++++++++++++
> >   2 files changed, 99 insertions(+)
> >
> > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > index 79795857be3e..529e0611e53b 100644
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
> > @@ -192,6 +193,9 @@ static loff_t dma_buf_llseek(struct file *file,
> loff_t offset, int whence)
> >    * Note that this only signals the completion of the respective
> fences, i.e. the
> >    * DMA transfers are complete. Cache flushing and any other necessary
> >    * preparations before CPU access can begin still need to happen.
> > + *
> > + * As an alternative to poll(), the set of fences on DMA buffer can be
> > + * exported as a &sync_file using &dma_buf_sync_file_export.
> >    */
> >
> >   static void dma_buf_poll_cb(struct dma_fence *fence, struct
> dma_fence_cb *cb)
> > @@ -326,6 +330,61 @@ static long dma_buf_set_name(struct dma_buf
> *dmabuf, const char __user *buf)
> >       return 0;
> >   }
> >
> > +#if IS_ENABLED(CONFIG_SYNC_FILE)
> > +static long dma_buf_export_sync_file(struct dma_buf *dmabuf,
> > +                                  void __user *user_data)
> > +{
> > +     struct dma_buf_export_sync_file arg;
> > +     enum dma_resv_usage usage;
> > +     struct dma_fence *fence =3D NULL;
> > +     struct sync_file *sync_file;
> > +     int fd, ret;
> > +
> > +     if (copy_from_user(&arg, user_data, sizeof(arg)))
> > +             return -EFAULT;
> > +
> > +     if (arg.flags & ~DMA_BUF_SYNC_RW)
> > +             return -EINVAL;
> > +
> > +     if ((arg.flags & DMA_BUF_SYNC_RW) =3D=3D 0)
> > +             return -EINVAL;
> > +
> > +     fd =3D get_unused_fd_flags(O_CLOEXEC);
> > +     if (fd < 0)
> > +             return fd;
> > +
> > +     usage =3D (arg.flags & DMA_BUF_SYNC_WRITE) ? DMA_RESV_USAGE_WRITE=
 :
> > +                                                DMA_RESV_USAGE_READ;
> > +     ret =3D dma_resv_get_singleton(dmabuf->resv, usage, &fence);
> > +     if (ret)
> > +             goto err_put_fd;
> > +
> > +     if (!fence)
> > +             fence =3D dma_fence_get_stub();
> > +
> > +     sync_file =3D sync_file_create(fence);
> > +
> > +     dma_fence_put(fence);
> > +
> > +     if (!sync_file) {
> > +             ret =3D -ENOMEM;
> > +             goto err_put_fd;
> > +     }
> > +
> > +     fd_install(fd, sync_file->file);
> > +
> > +     arg.fd =3D fd;
> > +     if (copy_to_user(user_data, &arg, sizeof(arg)))
> > +             return -EFAULT;
>
> I know we had that discussion before, but I'm not 100% any more what the
> outcome was.
>
> The problem here is that when the copy_to_user fails we have a file
> descriptor which is valid, but userspace doesn't know anything about it.
>
> I only see a few possibilities here:
> 1. Keep it like this and just assume that a process which you can't copy
> the fd to is also dying (a bit to much assumption for my taste).
>
> 2. Close the file descriptor when this happens (not ideal either).
>
> 3. Instead of returning the fd in the parameter structure return it as
> IOCTL result.
>
> Number 3 is what drm_prime_handle_to_fd_ioctl() is doing as well and
> IIRC we said that this is probably the best option.
>

I don't have a strong preference here, so I'll go with whatever in the end
but let me at least explain my reasoning.  First, this was based on the FD
import/export in syncobj which stuffs the FD in the args struct.  If
`copy_to_user` is a problem here, it's a problem there as well.  Second,
the only way `copy_to_user` can fail is if the client gives us a read-only
page or somehow manages to race removing the page from their address space
(via unmap(), for instance) with this ioctl.  Both of those seem like
pretty serious client errors to me.  That, or the client is in the process
of dying, in which case we really don't care.

--Jason



> Apart from that the patch set looks really clean to me now.
>
> Regards,
> Christian.
>
>
> > +
> > +     return 0;
> > +
> > +err_put_fd:
> > +     put_unused_fd(fd);
> > +     return ret;
> > +}
> > +#endif
> > +
> >   static long dma_buf_ioctl(struct file *file,
> >                         unsigned int cmd, unsigned long arg)
> >   {
> > @@ -369,6 +428,11 @@ static long dma_buf_ioctl(struct file *file,
> >       case DMA_BUF_SET_NAME_B:
> >               return dma_buf_set_name(dmabuf, (const char __user *)arg)=
;
> >
> > +#if IS_ENABLED(CONFIG_SYNC_FILE)
> > +     case DMA_BUF_IOCTL_EXPORT_SYNC_FILE:
> > +             return dma_buf_export_sync_file(dmabuf, (void __user
> *)arg);
> > +#endif
> > +
> >       default:
> >               return -ENOTTY;
> >       }
> > diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.=
h
> > index 8e4a2ca0bcbf..46f1e3e98b02 100644
> > --- a/include/uapi/linux/dma-buf.h
> > +++ b/include/uapi/linux/dma-buf.h
> > @@ -85,6 +85,40 @@ struct dma_buf_sync {
> >
> >   #define DMA_BUF_NAME_LEN    32
> >
> > +/**
> > + * struct dma_buf_export_sync_file - Get a sync_file from a dma-buf
> > + *
> > + * Userspace can perform a DMA_BUF_IOCTL_EXPORT_SYNC_FILE to retrieve
> the
> > + * current set of fences on a dma-buf file descriptor as a sync_file.
> CPU
> > + * waits via poll() or other driver-specific mechanisms typically wait
> on
> > + * whatever fences are on the dma-buf at the time the wait begins.  Th=
is
> > + * is similar except that it takes a snapshot of the current fences on
> the
> > + * dma-buf for waiting later instead of waiting immediately.  This is
> > + * useful for modern graphics APIs such as Vulkan which assume an
> explicit
> > + * synchronization model but still need to inter-operate with dma-buf.
> > + */
> > +struct dma_buf_export_sync_file {
> > +     /**
> > +      * @flags: Read/write flags
> > +      *
> > +      * Must be DMA_BUF_SYNC_READ, DMA_BUF_SYNC_WRITE, or both.
> > +      *
> > +      * If DMA_BUF_SYNC_READ is set and DMA_BUF_SYNC_WRITE is not set,
> > +      * the returned sync file waits on any writers of the dma-buf to
> > +      * complete.  Waiting on the returned sync file is equivalent to
> > +      * poll() with POLLIN.
> > +      *
> > +      * If DMA_BUF_SYNC_WRITE is set, the returned sync file waits on
> > +      * any users of the dma-buf (read or write) to complete.  Waiting
> > +      * on the returned sync file is equivalent to poll() with POLLOUT=
.
> > +      * If both DMA_BUF_SYNC_WRITE and DMA_BUF_SYNC_READ are set, this
> > +      * is equivalent to just DMA_BUF_SYNC_WRITE.
> > +      */
> > +     __u32 flags;
> > +     /** @fd: Returned sync file descriptor */
> > +     __s32 fd;
> > +};
> > +
> >   #define DMA_BUF_BASE                'b'
> >   #define DMA_BUF_IOCTL_SYNC  _IOW(DMA_BUF_BASE, 0, struct dma_buf_sync=
)
> >
> > @@ -94,5 +128,6 @@ struct dma_buf_sync {
> >   #define DMA_BUF_SET_NAME    _IOW(DMA_BUF_BASE, 1, const char *)
> >   #define DMA_BUF_SET_NAME_A  _IOW(DMA_BUF_BASE, 1, u32)
> >   #define DMA_BUF_SET_NAME_B  _IOW(DMA_BUF_BASE, 1, u64)
> > +#define DMA_BUF_IOCTL_EXPORT_SYNC_FILE       _IOWR(DMA_BUF_BASE, 2,
> struct dma_buf_export_sync_file)
> >
> >   #endif
>
>

--0000000000004c641905de3f4732
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Thu, May 5, 2022 at 1:25 AM Christian K=C3=B6nig &lt;<a href=3D"m=
ailto:christian.koenig@amd.com">christian.koenig@amd.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">Am 04.05.22 um 22:3=
4 schrieb Jason Ekstrand:<br>
&gt; Modern userspace APIs like Vulkan are built on an explicit<br>
&gt; synchronization model.=C2=A0 This doesn&#39;t always play nicely with =
the<br>
&gt; implicit synchronization used in the kernel and assumed by X11 and<br>
&gt; Wayland.=C2=A0 The client -&gt; compositor half of the synchronization=
 isn&#39;t too<br>
&gt; bad, at least on intel, because we can control whether or not i915<br>
&gt; synchronizes on the buffer and whether or not it&#39;s considered writ=
ten.<br>
&gt;<br>
&gt; The harder part is the compositor -&gt; client synchronization when we=
 get<br>
&gt; the buffer back from the compositor.=C2=A0 We&#39;re required to be ab=
le to<br>
&gt; provide the client with a VkSemaphore and VkFence representing the poi=
nt<br>
&gt; in time where the window system (compositor and/or display) finished<b=
r>
&gt; using the buffer.=C2=A0 With current APIs, it&#39;s very hard to do th=
is in such<br>
&gt; a way that we don&#39;t get confused by the Vulkan driver&#39;s access=
 of the<br>
&gt; buffer.=C2=A0 In particular, once we tell the kernel that we&#39;re re=
ndering to<br>
&gt; the buffer again, any CPU waits on the buffer or GPU dependencies will=
<br>
&gt; wait on some of the client rendering and not just the compositor.<br>
&gt;<br>
&gt; This new IOCTL solves this problem by allowing us to get a snapshot of=
<br>
&gt; the implicit synchronization state of a given dma-buf in the form of a=
<br>
&gt; sync file.=C2=A0 It&#39;s effectively the same as a poll() or I915_GEM=
_WAIT only,<br>
&gt; instead of CPU waiting directly, it encapsulates the wait operation, a=
t<br>
&gt; the current moment in time, in a sync_file so we can check/wait on it<=
br>
&gt; later.=C2=A0 As long as the Vulkan driver does the sync_file export fr=
om the<br>
&gt; dma-buf before we re-introduce it for rendering, it will only contain<=
br>
&gt; fences from the compositor or display.=C2=A0 This allows to accurately=
 turn<br>
&gt; it into a VkFence or VkSemaphore without any over-synchronization.<br>
&gt;<br>
&gt; By making this an ioctl on the dma-buf itself, it allows this new<br>
&gt; functionality to be used in an entirely driver-agnostic way without<br=
>
&gt; having access to a DRM fd. This makes it ideal for use in driver-gener=
ic<br>
&gt; code in Mesa or in a client such as a compositor where the DRM fd may =
be<br>
&gt; hard to reach.<br>
&gt;<br>
&gt; v2 (Jason Ekstrand):<br>
&gt;=C2=A0 =C2=A0- Use a wrapper dma_fence_array of all fences including th=
e new one<br>
&gt;=C2=A0 =C2=A0 =C2=A0when importing an exclusive fence.<br>
&gt;<br>
&gt; v3 (Jason Ekstrand):<br>
&gt;=C2=A0 =C2=A0- Lock around setting shared fences as well as exclusive<b=
r>
&gt;=C2=A0 =C2=A0- Mark SIGNAL_SYNC_FILE as a read-write ioctl.<br>
&gt;=C2=A0 =C2=A0- Initialize ret to 0 in dma_buf_wait_sync_file<br>
&gt;<br>
&gt; v4 (Jason Ekstrand):<br>
&gt;=C2=A0 =C2=A0- Use the new dma_resv_get_singleton helper<br>
&gt;<br>
&gt; v5 (Jason Ekstrand):<br>
&gt;=C2=A0 =C2=A0- Rename the IOCTLs to import/export rather than wait/sign=
al<br>
&gt;=C2=A0 =C2=A0- Drop the WRITE flag and always get/set the exclusive fen=
ce<br>
&gt;<br>
&gt; v6 (Jason Ekstrand):<br>
&gt;=C2=A0 =C2=A0- Drop the sync_file import as it was all-around sketchy a=
nd not nearly<br>
&gt;=C2=A0 =C2=A0 =C2=A0as useful as import.<br>
&gt;=C2=A0 =C2=A0- Re-introduce READ/WRITE flag support for export<br>
&gt;=C2=A0 =C2=A0- Rework the commit message<br>
&gt;<br>
&gt; v7 (Jason Ekstrand):<br>
&gt;=C2=A0 =C2=A0- Require at least one sync flag<br>
&gt;=C2=A0 =C2=A0- Fix a refcounting bug: dma_resv_get_excl() doesn&#39;t t=
ake a reference<br>
&gt;=C2=A0 =C2=A0- Use _rcu helpers since we&#39;re accessing the dma_resv =
read-only<br>
&gt;<br>
&gt; v8 (Jason Ekstrand):<br>
&gt;=C2=A0 =C2=A0- Return -ENOMEM if the sync_file_create fails<br>
&gt;=C2=A0 =C2=A0- Predicate support on IS_ENABLED(CONFIG_SYNC_FILE)<br>
&gt;<br>
&gt; v9 (Jason Ekstrand):<br>
&gt;=C2=A0 =C2=A0- Add documentation for the new ioctl<br>
&gt;<br>
&gt; v10 (Jason Ekstrand):<br>
&gt;=C2=A0 =C2=A0- Go back to dma_buf_sync_file as the ioctl struct name<br=
>
&gt;<br>
&gt; v11 (Daniel Vetter):<br>
&gt;=C2=A0 =C2=A0- Go back to dma_buf_export_sync_file as the ioctl struct =
name<br>
&gt;=C2=A0 =C2=A0- Better kerneldoc describing what the read/write flags do=
<br>
&gt;<br>
&gt; v12 (Christian K=C3=B6nig):<br>
&gt;=C2=A0 =C2=A0- Document why we chose to make it an ioctl on dma-buf<br>
&gt;<br>
&gt; v12 (Jason Ekstrand):<br>
&gt;=C2=A0 =C2=A0- Rebase on Christian K=C3=B6nig&#39;s fence rework<br>
&gt;<br>
&gt; Signed-off-by: Jason Ekstrand &lt;<a href=3D"mailto:jason@jlekstrand.n=
et" target=3D"_blank">jason@jlekstrand.net</a>&gt;<br>
&gt; Acked-by: Simon Ser &lt;<a href=3D"mailto:contact@emersion.fr" target=
=3D"_blank">contact@emersion.fr</a>&gt;<br>
&gt; Acked-by: Christian K=C3=B6nig &lt;<a href=3D"mailto:christian.koenig@=
amd.com" target=3D"_blank">christian.koenig@amd.com</a>&gt;<br>
&gt; Reviewed-by: Daniel Vetter &lt;<a href=3D"mailto:daniel.vetter@ffwll.c=
h" target=3D"_blank">daniel.vetter@ffwll.ch</a>&gt;<br>
&gt; Cc: Sumit Semwal &lt;<a href=3D"mailto:sumit.semwal@linaro.org" target=
=3D"_blank">sumit.semwal@linaro.org</a>&gt;<br>
&gt; Cc: Maarten Lankhorst &lt;<a href=3D"mailto:maarten.lankhorst@linux.in=
tel.com" target=3D"_blank">maarten.lankhorst@linux.intel.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0drivers/dma-buf/dma-buf.c=C2=A0 =C2=A0 | 64 ++++++++++++++=
++++++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0include/uapi/linux/dma-buf.h | 35 ++++++++++++++++++++<br>
&gt;=C2=A0 =C2=A02 files changed, 99 insertions(+)<br>
&gt;<br>
&gt; diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c<br>
&gt; index 79795857be3e..529e0611e53b 100644<br>
&gt; --- a/drivers/dma-buf/dma-buf.c<br>
&gt; +++ b/drivers/dma-buf/dma-buf.c<br>
&gt; @@ -20,6 +20,7 @@<br>
&gt;=C2=A0 =C2=A0#include &lt;linux/debugfs.h&gt;<br>
&gt;=C2=A0 =C2=A0#include &lt;linux/module.h&gt;<br>
&gt;=C2=A0 =C2=A0#include &lt;linux/seq_file.h&gt;<br>
&gt; +#include &lt;linux/sync_file.h&gt;<br>
&gt;=C2=A0 =C2=A0#include &lt;linux/poll.h&gt;<br>
&gt;=C2=A0 =C2=A0#include &lt;linux/dma-resv.h&gt;<br>
&gt;=C2=A0 =C2=A0#include &lt;linux/mm.h&gt;<br>
&gt; @@ -192,6 +193,9 @@ static loff_t dma_buf_llseek(struct file *file, lo=
ff_t offset, int whence)<br>
&gt;=C2=A0 =C2=A0 * Note that this only signals the completion of the respe=
ctive fences, i.e. the<br>
&gt;=C2=A0 =C2=A0 * DMA transfers are complete. Cache flushing and any othe=
r necessary<br>
&gt;=C2=A0 =C2=A0 * preparations before CPU access can begin still need to =
happen.<br>
&gt; + *<br>
&gt; + * As an alternative to poll(), the set of fences on DMA buffer can b=
e<br>
&gt; + * exported as a &amp;sync_file using &amp;dma_buf_sync_file_export.<=
br>
&gt;=C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0static void dma_buf_poll_cb(struct dma_fence *fence, struc=
t dma_fence_cb *cb)<br>
&gt; @@ -326,6 +330,61 @@ static long dma_buf_set_name(struct dma_buf *dmab=
uf, const char __user *buf)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +#if IS_ENABLED(CONFIG_SYNC_FILE)<br>
&gt; +static long dma_buf_export_sync_file(struct dma_buf *dmabuf,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 void __user *user_data)<b=
r>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dma_buf_export_sync_file arg;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0enum dma_resv_usage usage;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dma_fence *fence =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sync_file *sync_file;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int fd, ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (copy_from_user(&amp;arg, user_data, sizeof(ar=
g)))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EFAULT;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (arg.flags &amp; ~DMA_BUF_SYNC_RW)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if ((arg.flags &amp; DMA_BUF_SYNC_RW) =3D=3D 0)<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0fd =3D get_unused_fd_flags(O_CLOEXEC);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (fd &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return fd;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0usage =3D (arg.flags &amp; DMA_BUF_SYNC_WRITE) ? =
DMA_RESV_USAGE_WRITE :<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 DMA_RESV_USAGE_READ;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D dma_resv_get_singleton(dmabuf-&gt;resv, u=
sage, &amp;fence);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_put_fd;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!fence)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fence =3D dma_fence_g=
et_stub();<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0sync_file =3D sync_file_create(fence);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dma_fence_put(fence);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!sync_file) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D -ENOMEM;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_put_fd;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0fd_install(fd, sync_file-&gt;file);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0arg.fd =3D fd;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (copy_to_user(user_data, &amp;arg, sizeof(arg)=
))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EFAULT;<br>
<br>
I know we had that discussion before, but I&#39;m not 100% any more what th=
e <br>
outcome was.<br>
<br>
The problem here is that when the copy_to_user fails we have a file <br>
descriptor which is valid, but userspace doesn&#39;t know anything about it=
.<br>
<br>
I only see a few possibilities here:<br>
1. Keep it like this and just assume that a process which you can&#39;t cop=
y <br>
the fd to is also dying (a bit to much assumption for my taste).<br>
<br>
2. Close the file descriptor when this happens (not ideal either).<br>
<br>
3. Instead of returning the fd in the parameter structure return it as <br>
IOCTL result.<br>
<br>
Number 3 is what drm_prime_handle_to_fd_ioctl() is doing as well and <br>
IIRC we said that this is probably the best option.<br></blockquote><div><b=
r></div><div>I don&#39;t have a strong preference here, so I&#39;ll go with=
 whatever in the end but let me at least explain my reasoning.=C2=A0 First,=
 this was based on the FD import/export in syncobj which stuffs the FD in t=
he args struct.=C2=A0 If `copy_to_user` is a problem here, it&#39;s a probl=
em there as well.=C2=A0 Second, the only way `copy_to_user` can fail is if =
the client gives us a read-only page or somehow manages to race removing th=
e page from their address space (via unmap(), for instance) with this ioctl=
.=C2=A0 Both of those seem like pretty serious client errors to me.=C2=A0 T=
hat, or the client is in the process of dying, in which case we really don&=
#39;t care.</div><div><br></div><div>--Jason</div><div><br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Apart from that the patch set looks really clean to me now.<br>
<br>
Regards,<br>
Christian.<br>
<br>
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +<br>
&gt; +err_put_fd:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0put_unused_fd(fd);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +}<br>
&gt; +#endif<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0static long dma_buf_ioctl(struct file *file,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0unsigned int cmd, unsigned long arg)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt; @@ -369,6 +428,11 @@ static long dma_buf_ioctl(struct file *file,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0case DMA_BUF_SET_NAME_B:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return dma_buf_s=
et_name(dmabuf, (const char __user *)arg);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +#if IS_ENABLED(CONFIG_SYNC_FILE)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case DMA_BUF_IOCTL_EXPORT_SYNC_FILE:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return dma_buf_export=
_sync_file(dmabuf, (void __user *)arg);<br>
&gt; +#endif<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOTTY;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf=
.h<br>
&gt; index 8e4a2ca0bcbf..46f1e3e98b02 100644<br>
&gt; --- a/include/uapi/linux/dma-buf.h<br>
&gt; +++ b/include/uapi/linux/dma-buf.h<br>
&gt; @@ -85,6 +85,40 @@ struct dma_buf_sync {<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0#define DMA_BUF_NAME_LEN=C2=A0 =C2=A0 32<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +/**<br>
&gt; + * struct dma_buf_export_sync_file - Get a sync_file from a dma-buf<b=
r>
&gt; + *<br>
&gt; + * Userspace can perform a DMA_BUF_IOCTL_EXPORT_SYNC_FILE to retrieve=
 the<br>
&gt; + * current set of fences on a dma-buf file descriptor as a sync_file.=
=C2=A0 CPU<br>
&gt; + * waits via poll() or other driver-specific mechanisms typically wai=
t on<br>
&gt; + * whatever fences are on the dma-buf at the time the wait begins.=C2=
=A0 This<br>
&gt; + * is similar except that it takes a snapshot of the current fences o=
n the<br>
&gt; + * dma-buf for waiting later instead of waiting immediately.=C2=A0 Th=
is is<br>
&gt; + * useful for modern graphics APIs such as Vulkan which assume an exp=
licit<br>
&gt; + * synchronization model but still need to inter-operate with dma-buf=
.<br>
&gt; + */<br>
&gt; +struct dma_buf_export_sync_file {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/**<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * @flags: Read/write flags<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 *<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * Must be DMA_BUF_SYNC_READ, DMA_BUF_SYNC_WRITE,=
 or both.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 *<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * If DMA_BUF_SYNC_READ is set and DMA_BUF_SYNC_W=
RITE is not set,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * the returned sync file waits on any writers of=
 the dma-buf to<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * complete.=C2=A0 Waiting on the returned sync f=
ile is equivalent to<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * poll() with POLLIN.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 *<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * If DMA_BUF_SYNC_WRITE is set, the returned syn=
c file waits on<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * any users of the dma-buf (read or write) to co=
mplete.=C2=A0 Waiting<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * on the returned sync file is equivalent to pol=
l() with POLLOUT.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * If both DMA_BUF_SYNC_WRITE and DMA_BUF_SYNC_RE=
AD are set, this<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * is equivalent to just DMA_BUF_SYNC_WRITE.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0__u32 flags;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/** @fd: Returned sync file descriptor */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0__s32 fd;<br>
&gt; +};<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0#define DMA_BUF_BASE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &#39;b&#39;<br>
&gt;=C2=A0 =C2=A0#define DMA_BUF_IOCTL_SYNC=C2=A0 _IOW(DMA_BUF_BASE, 0, str=
uct dma_buf_sync)<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -94,5 +128,6 @@ struct dma_buf_sync {<br>
&gt;=C2=A0 =C2=A0#define DMA_BUF_SET_NAME=C2=A0 =C2=A0 _IOW(DMA_BUF_BASE, 1=
, const char *)<br>
&gt;=C2=A0 =C2=A0#define DMA_BUF_SET_NAME_A=C2=A0 _IOW(DMA_BUF_BASE, 1, u32=
)<br>
&gt;=C2=A0 =C2=A0#define DMA_BUF_SET_NAME_B=C2=A0 _IOW(DMA_BUF_BASE, 1, u64=
)<br>
&gt; +#define DMA_BUF_IOCTL_EXPORT_SYNC_FILE=C2=A0 =C2=A0 =C2=A0 =C2=A0_IOW=
R(DMA_BUF_BASE, 2, struct dma_buf_export_sync_file)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0#endif<br>
<br>
</blockquote></div></div>

--0000000000004c641905de3f4732--
