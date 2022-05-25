Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA371534A71
	for <lists+dri-devel@lfdr.de>; Thu, 26 May 2022 08:47:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00D1210F2B5;
	Thu, 26 May 2022 06:47:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7363E10E184
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 15:35:59 +0000 (UTC)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-2ff90e0937aso144041057b3.4
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 08:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WQ41PAa6V/Y14+f82ke5KsX61ath2/VZ/7cY5tEDNWA=;
 b=RzbGuRl2N6k2nhheB2NpLaTveumLI2TCY2+tjePC+lWpfxzzV8+GCXsT0bBdGoAEaM
 YagLml3PJi5TyAxON6sdvQyeD59TT3a6RYo5CIkMwGfM8wWqd5rmDLWF1Rgae082fjRd
 GX+RLjKo+j+vvYCpp9bnWMTZQNJ0fUsjshDEnEKjnE5FYS8giatz5f1BL7M2F7uh0xWx
 z1Z1il8juqZvdqXca1+yotQrBeZKn1NX9tYmiX1SjGik/Vd2bWbHNNwTZU7/s/uAEd1W
 jt9XDj/9NaTgxYansuFxQef+v2Wrd+YKf7K0kEwUfHrGdTVgm78sOL/hgJiolrI61Ai1
 fYSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WQ41PAa6V/Y14+f82ke5KsX61ath2/VZ/7cY5tEDNWA=;
 b=BVwGzmRkCjgrZxtmliiZekUx2QDYFrdapZPP2lbMoOwgqNhFY9TTYWbK3072i71E9i
 tHpRV6IZ/qEPRb8gwJSchSgBjUT23MiqEPY0fIv+mnu0zeJvDsDOFQ3Q9HpPxfusW8sK
 qR8eSgpH45Kl7w/PdD/MZedaxZY47zWcBoT/Ac4CQYRpvTvr4R1wbHFbl9dvUcPv1Xmq
 dWdop/GM+BU4s8awRwUl7rh618fxRsY70OlujqhnOQgxCwahrQPYrY3NKWe8dkcevINC
 nqdfRQRR/ZcQcFJOiXvta8usDeAHWuqtLzmKFDrxyihNi0Tx7XJuhoSt/+MSdM1n6Fca
 pgoQ==
X-Gm-Message-State: AOAM532RJg+DUJaBMfvBs0Pme4kU9ayfdpv608Pxa6EVgNOWceVU/21e
 92f3CwQ7gx0862C9+4NVvYyQ57XNYlydI1ORFtjGbA==
X-Google-Smtp-Source: ABdhPJw5PKEyfCrUfiyxk8/wfIQqFy/VQWb0VAIVPgYDwQcDm6UXReJLp+Np0BZD5fwoRvogy6Nhuo+uXQ7HwBERLeE=
X-Received: by 2002:a0d:ea13:0:b0:2ff:91a:4e51 with SMTP id
 t19-20020a0dea13000000b002ff091a4e51mr35980816ywe.490.1653492958440; Wed, 25
 May 2022 08:35:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220506180216.2095060-1-jason@jlekstrand.net>
 <20220506180216.2095060-2-jason@jlekstrand.net>
 <8bdd71c9-970b-219c-0d5d-67eabe1ab11b@amd.com>
 <Yo4tEIouNU04Z3H1@phenom.ffwll.local>
In-Reply-To: <Yo4tEIouNU04Z3H1@phenom.ffwll.local>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed, 25 May 2022 10:35:47 -0500
Message-ID: <CAOFGe976kGheo-7kJiz-RrmUGcuX9A4cnJkgDg7Vc_yAPh=FhA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dma-buf: Add an API for exporting sync files (v14)
To: Daniel Vetter <daniel@ffwll.ch>
Content-Type: multipart/alternative; boundary="0000000000006d41d805dfd7d4d9"
X-Mailman-Approved-At: Thu, 26 May 2022 06:47:10 +0000
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
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Jason Ekstrand <jason.ekstrand@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000006d41d805dfd7d4d9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 25, 2022 at 8:20 AM Daniel Vetter <daniel@ffwll.ch> wrote:

> On Mon, May 09, 2022 at 07:54:19AM +0200, Christian K=C3=B6nig wrote:
> > Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com> for the se=
ries.
> >
> > I assume you have the userspace part ready as well? If yes let's push
> this
> > to drm-misc-next asap.
>
> Hopefully I'm not too late, but I think all my review has also been
> addressed. On the series:
>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>

Thanks!  If Christian hasn't already, can we get this in drm-misc-next
please?  I don't have access AFAIK.

--Jason



> >
> > Christian.
> >
> > Am 06.05.22 um 20:02 schrieb Jason Ekstrand:
> > > Modern userspace APIs like Vulkan are built on an explicit
> > > synchronization model.  This doesn't always play nicely with the
> > > implicit synchronization used in the kernel and assumed by X11 and
> > > Wayland.  The client -> compositor half of the synchronization isn't
> too
> > > bad, at least on intel, because we can control whether or not i915
> > > synchronizes on the buffer and whether or not it's considered written=
.
> > >
> > > The harder part is the compositor -> client synchronization when we g=
et
> > > the buffer back from the compositor.  We're required to be able to
> > > provide the client with a VkSemaphore and VkFence representing the
> point
> > > in time where the window system (compositor and/or display) finished
> > > using the buffer.  With current APIs, it's very hard to do this in su=
ch
> > > a way that we don't get confused by the Vulkan driver's access of the
> > > buffer.  In particular, once we tell the kernel that we're rendering =
to
> > > the buffer again, any CPU waits on the buffer or GPU dependencies wil=
l
> > > wait on some of the client rendering and not just the compositor.
> > >
> > > This new IOCTL solves this problem by allowing us to get a snapshot o=
f
> > > the implicit synchronization state of a given dma-buf in the form of =
a
> > > sync file.  It's effectively the same as a poll() or I915_GEM_WAIT
> only,
> > > instead of CPU waiting directly, it encapsulates the wait operation, =
at
> > > the current moment in time, in a sync_file so we can check/wait on it
> > > later.  As long as the Vulkan driver does the sync_file export from t=
he
> > > dma-buf before we re-introduce it for rendering, it will only contain
> > > fences from the compositor or display.  This allows to accurately tur=
n
> > > it into a VkFence or VkSemaphore without any over-synchronization.
> > >
> > > By making this an ioctl on the dma-buf itself, it allows this new
> > > functionality to be used in an entirely driver-agnostic way without
> > > having access to a DRM fd. This makes it ideal for use in
> driver-generic
> > > code in Mesa or in a client such as a compositor where the DRM fd may
> be
> > > hard to reach.
> > >
> > > v2 (Jason Ekstrand):
> > >   - Use a wrapper dma_fence_array of all fences including the new one
> > >     when importing an exclusive fence.
> > >
> > > v3 (Jason Ekstrand):
> > >   - Lock around setting shared fences as well as exclusive
> > >   - Mark SIGNAL_SYNC_FILE as a read-write ioctl.
> > >   - Initialize ret to 0 in dma_buf_wait_sync_file
> > >
> > > v4 (Jason Ekstrand):
> > >   - Use the new dma_resv_get_singleton helper
> > >
> > > v5 (Jason Ekstrand):
> > >   - Rename the IOCTLs to import/export rather than wait/signal
> > >   - Drop the WRITE flag and always get/set the exclusive fence
> > >
> > > v6 (Jason Ekstrand):
> > >   - Drop the sync_file import as it was all-around sketchy and not
> nearly
> > >     as useful as import.
> > >   - Re-introduce READ/WRITE flag support for export
> > >   - Rework the commit message
> > >
> > > v7 (Jason Ekstrand):
> > >   - Require at least one sync flag
> > >   - Fix a refcounting bug: dma_resv_get_excl() doesn't take a referen=
ce
> > >   - Use _rcu helpers since we're accessing the dma_resv read-only
> > >
> > > v8 (Jason Ekstrand):
> > >   - Return -ENOMEM if the sync_file_create fails
> > >   - Predicate support on IS_ENABLED(CONFIG_SYNC_FILE)
> > >
> > > v9 (Jason Ekstrand):
> > >   - Add documentation for the new ioctl
> > >
> > > v10 (Jason Ekstrand):
> > >   - Go back to dma_buf_sync_file as the ioctl struct name
> > >
> > > v11 (Daniel Vetter):
> > >   - Go back to dma_buf_export_sync_file as the ioctl struct name
> > >   - Better kerneldoc describing what the read/write flags do
> > >
> > > v12 (Christian K=C3=B6nig):
> > >   - Document why we chose to make it an ioctl on dma-buf
> > >
> > > v13 (Jason Ekstrand):
> > >   - Rebase on Christian K=C3=B6nig's fence rework
> > >
> > > v14 (Daniel Vetter & Christian K=C3=B6nig):
> > >   - Use dma_rev_usage_rw to get the properly inverted usage to pass t=
o
> > >     dma_resv_get_singleton()
> > >   - Clean up the sync_file and fd if copy_to_user() fails
> > >
> > > Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> > > Signed-off-by: Jason Ekstrand <jason.ekstrand@intel.com>
> > > Signed-off-by: Jason Ekstrand <jason.ekstrand@collabora.com>
> > > Acked-by: Simon Ser <contact@emersion.fr>
> > > Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > ---
> > >   drivers/dma-buf/dma-buf.c    | 67
> ++++++++++++++++++++++++++++++++++++
> > >   include/uapi/linux/dma-buf.h | 35 +++++++++++++++++++
> > >   2 files changed, 102 insertions(+)
> > >
> > > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > > index 79795857be3e..6ff54f7e6119 100644
> > > --- a/drivers/dma-buf/dma-buf.c
> > > +++ b/drivers/dma-buf/dma-buf.c
> > > @@ -20,6 +20,7 @@
> > >   #include <linux/debugfs.h>
> > >   #include <linux/module.h>
> > >   #include <linux/seq_file.h>
> > > +#include <linux/sync_file.h>
> > >   #include <linux/poll.h>
> > >   #include <linux/dma-resv.h>
> > >   #include <linux/mm.h>
> > > @@ -192,6 +193,9 @@ static loff_t dma_buf_llseek(struct file *file,
> loff_t offset, int whence)
> > >    * Note that this only signals the completion of the respective
> fences, i.e. the
> > >    * DMA transfers are complete. Cache flushing and any other necessa=
ry
> > >    * preparations before CPU access can begin still need to happen.
> > > + *
> > > + * As an alternative to poll(), the set of fences on DMA buffer can =
be
> > > + * exported as a &sync_file using &dma_buf_sync_file_export.
> > >    */
> > >   static void dma_buf_poll_cb(struct dma_fence *fence, struct
> dma_fence_cb *cb)
> > > @@ -326,6 +330,64 @@ static long dma_buf_set_name(struct dma_buf
> *dmabuf, const char __user *buf)
> > >     return 0;
> > >   }
> > > +#if IS_ENABLED(CONFIG_SYNC_FILE)
> > > +static long dma_buf_export_sync_file(struct dma_buf *dmabuf,
> > > +                                void __user *user_data)
> > > +{
> > > +   struct dma_buf_export_sync_file arg;
> > > +   enum dma_resv_usage usage;
> > > +   struct dma_fence *fence =3D NULL;
> > > +   struct sync_file *sync_file;
> > > +   int fd, ret;
> > > +
> > > +   if (copy_from_user(&arg, user_data, sizeof(arg)))
> > > +           return -EFAULT;
> > > +
> > > +   if (arg.flags & ~DMA_BUF_SYNC_RW)
> > > +           return -EINVAL;
> > > +
> > > +   if ((arg.flags & DMA_BUF_SYNC_RW) =3D=3D 0)
> > > +           return -EINVAL;
> > > +
> > > +   fd =3D get_unused_fd_flags(O_CLOEXEC);
> > > +   if (fd < 0)
> > > +           return fd;
> > > +
> > > +   usage =3D dma_resv_usage_rw(arg.flags & DMA_BUF_SYNC_WRITE);
> > > +   ret =3D dma_resv_get_singleton(dmabuf->resv, usage, &fence);
> > > +   if (ret)
> > > +           goto err_put_fd;
> > > +
> > > +   if (!fence)
> > > +           fence =3D dma_fence_get_stub();
> > > +
> > > +   sync_file =3D sync_file_create(fence);
> > > +
> > > +   dma_fence_put(fence);
> > > +
> > > +   if (!sync_file) {
> > > +           ret =3D -ENOMEM;
> > > +           goto err_put_fd;
> > > +   }
> > > +
> > > +   arg.fd =3D fd;
> > > +   if (copy_to_user(user_data, &arg, sizeof(arg))) {
> > > +           ret =3D -EFAULT;
> > > +           goto err_put_file;
> > > +   }
> > > +
> > > +   fd_install(fd, sync_file->file);
> > > +
> > > +   return 0;
> > > +
> > > +err_put_file:
> > > +   fput(sync_file->file);
> > > +err_put_fd:
> > > +   put_unused_fd(fd);
> > > +   return ret;
> > > +}
> > > +#endif
> > > +
> > >   static long dma_buf_ioctl(struct file *file,
> > >                       unsigned int cmd, unsigned long arg)
> > >   {
> > > @@ -369,6 +431,11 @@ static long dma_buf_ioctl(struct file *file,
> > >     case DMA_BUF_SET_NAME_B:
> > >             return dma_buf_set_name(dmabuf, (const char __user *)arg)=
;
> > > +#if IS_ENABLED(CONFIG_SYNC_FILE)
> > > +   case DMA_BUF_IOCTL_EXPORT_SYNC_FILE:
> > > +           return dma_buf_export_sync_file(dmabuf, (void __user
> *)arg);
> > > +#endif
> > > +
> > >     default:
> > >             return -ENOTTY;
> > >     }
> > > diff --git a/include/uapi/linux/dma-buf.h
> b/include/uapi/linux/dma-buf.h
> > > index 8e4a2ca0bcbf..46f1e3e98b02 100644
> > > --- a/include/uapi/linux/dma-buf.h
> > > +++ b/include/uapi/linux/dma-buf.h
> > > @@ -85,6 +85,40 @@ struct dma_buf_sync {
> > >   #define DMA_BUF_NAME_LEN  32
> > > +/**
> > > + * struct dma_buf_export_sync_file - Get a sync_file from a dma-buf
> > > + *
> > > + * Userspace can perform a DMA_BUF_IOCTL_EXPORT_SYNC_FILE to retriev=
e
> the
> > > + * current set of fences on a dma-buf file descriptor as a
> sync_file.  CPU
> > > + * waits via poll() or other driver-specific mechanisms typically
> wait on
> > > + * whatever fences are on the dma-buf at the time the wait begins.
> This
> > > + * is similar except that it takes a snapshot of the current fences
> on the
> > > + * dma-buf for waiting later instead of waiting immediately.  This i=
s
> > > + * useful for modern graphics APIs such as Vulkan which assume an
> explicit
> > > + * synchronization model but still need to inter-operate with dma-bu=
f.
> > > + */
> > > +struct dma_buf_export_sync_file {
> > > +   /**
> > > +    * @flags: Read/write flags
> > > +    *
> > > +    * Must be DMA_BUF_SYNC_READ, DMA_BUF_SYNC_WRITE, or both.
> > > +    *
> > > +    * If DMA_BUF_SYNC_READ is set and DMA_BUF_SYNC_WRITE is not set,
> > > +    * the returned sync file waits on any writers of the dma-buf to
> > > +    * complete.  Waiting on the returned sync file is equivalent to
> > > +    * poll() with POLLIN.
> > > +    *
> > > +    * If DMA_BUF_SYNC_WRITE is set, the returned sync file waits on
> > > +    * any users of the dma-buf (read or write) to complete.  Waiting
> > > +    * on the returned sync file is equivalent to poll() with POLLOUT=
.
> > > +    * If both DMA_BUF_SYNC_WRITE and DMA_BUF_SYNC_READ are set, this
> > > +    * is equivalent to just DMA_BUF_SYNC_WRITE.
> > > +    */
> > > +   __u32 flags;
> > > +   /** @fd: Returned sync file descriptor */
> > > +   __s32 fd;
> > > +};
> > > +
> > >   #define DMA_BUF_BASE              'b'
> > >   #define DMA_BUF_IOCTL_SYNC        _IOW(DMA_BUF_BASE, 0, struct
> dma_buf_sync)
> > > @@ -94,5 +128,6 @@ struct dma_buf_sync {
> > >   #define DMA_BUF_SET_NAME  _IOW(DMA_BUF_BASE, 1, const char *)
> > >   #define DMA_BUF_SET_NAME_A        _IOW(DMA_BUF_BASE, 1, u32)
> > >   #define DMA_BUF_SET_NAME_B        _IOW(DMA_BUF_BASE, 1, u64)
> > > +#define DMA_BUF_IOCTL_EXPORT_SYNC_FILE     _IOWR(DMA_BUF_BASE, 2,
> struct dma_buf_export_sync_file)
> > >   #endif
> >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
>

--0000000000006d41d805dfd7d4d9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, May 25, 2022 at 8:20 AM Daniel Vetter &lt;<a href=3D"mailto:=
daniel@ffwll.ch">daniel@ffwll.ch</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Mon, May 09, 2022 at 07:54:19AM +0200, =
Christian K=C3=B6nig wrote:<br>
&gt; Reviewed-by: Christian K=C3=B6nig &lt;<a href=3D"mailto:christian.koen=
ig@amd.com" target=3D"_blank">christian.koenig@amd.com</a>&gt; for the seri=
es.<br>
&gt; <br>
&gt; I assume you have the userspace part ready as well? If yes let&#39;s p=
ush this<br>
&gt; to drm-misc-next asap.<br>
<br>
Hopefully I&#39;m not too late, but I think all my review has also been<br>
addressed. On the series:<br>
<br>
Reviewed-by: Daniel Vetter &lt;<a href=3D"mailto:daniel.vetter@ffwll.ch" ta=
rget=3D"_blank">daniel.vetter@ffwll.ch</a>&gt;<br></blockquote><div><br></d=
iv><div>Thanks!=C2=A0 If Christian hasn&#39;t already, can we get this in d=
rm-misc-next please?=C2=A0 I don&#39;t have access AFAIK.</div><div><br></d=
iv><div>--Jason</div><div><br></div><div>=C2=A0<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
&gt; <br>
&gt; Christian.<br>
&gt; <br>
&gt; Am 06.05.22 um 20:02 schrieb Jason Ekstrand:<br>
&gt; &gt; Modern userspace APIs like Vulkan are built on an explicit<br>
&gt; &gt; synchronization model.=C2=A0 This doesn&#39;t always play nicely =
with the<br>
&gt; &gt; implicit synchronization used in the kernel and assumed by X11 an=
d<br>
&gt; &gt; Wayland.=C2=A0 The client -&gt; compositor half of the synchroniz=
ation isn&#39;t too<br>
&gt; &gt; bad, at least on intel, because we can control whether or not i91=
5<br>
&gt; &gt; synchronizes on the buffer and whether or not it&#39;s considered=
 written.<br>
&gt; &gt; <br>
&gt; &gt; The harder part is the compositor -&gt; client synchronization wh=
en we get<br>
&gt; &gt; the buffer back from the compositor.=C2=A0 We&#39;re required to =
be able to<br>
&gt; &gt; provide the client with a VkSemaphore and VkFence representing th=
e point<br>
&gt; &gt; in time where the window system (compositor and/or display) finis=
hed<br>
&gt; &gt; using the buffer.=C2=A0 With current APIs, it&#39;s very hard to =
do this in such<br>
&gt; &gt; a way that we don&#39;t get confused by the Vulkan driver&#39;s a=
ccess of the<br>
&gt; &gt; buffer.=C2=A0 In particular, once we tell the kernel that we&#39;=
re rendering to<br>
&gt; &gt; the buffer again, any CPU waits on the buffer or GPU dependencies=
 will<br>
&gt; &gt; wait on some of the client rendering and not just the compositor.=
<br>
&gt; &gt; <br>
&gt; &gt; This new IOCTL solves this problem by allowing us to get a snapsh=
ot of<br>
&gt; &gt; the implicit synchronization state of a given dma-buf in the form=
 of a<br>
&gt; &gt; sync file.=C2=A0 It&#39;s effectively the same as a poll() or I91=
5_GEM_WAIT only,<br>
&gt; &gt; instead of CPU waiting directly, it encapsulates the wait operati=
on, at<br>
&gt; &gt; the current moment in time, in a sync_file so we can check/wait o=
n it<br>
&gt; &gt; later.=C2=A0 As long as the Vulkan driver does the sync_file expo=
rt from the<br>
&gt; &gt; dma-buf before we re-introduce it for rendering, it will only con=
tain<br>
&gt; &gt; fences from the compositor or display.=C2=A0 This allows to accur=
ately turn<br>
&gt; &gt; it into a VkFence or VkSemaphore without any over-synchronization=
.<br>
&gt; &gt; <br>
&gt; &gt; By making this an ioctl on the dma-buf itself, it allows this new=
<br>
&gt; &gt; functionality to be used in an entirely driver-agnostic way witho=
ut<br>
&gt; &gt; having access to a DRM fd. This makes it ideal for use in driver-=
generic<br>
&gt; &gt; code in Mesa or in a client such as a compositor where the DRM fd=
 may be<br>
&gt; &gt; hard to reach.<br>
&gt; &gt; <br>
&gt; &gt; v2 (Jason Ekstrand):<br>
&gt; &gt;=C2=A0 =C2=A0- Use a wrapper dma_fence_array of all fences includi=
ng the new one<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0when importing an exclusive fence.<br>
&gt; &gt; <br>
&gt; &gt; v3 (Jason Ekstrand):<br>
&gt; &gt;=C2=A0 =C2=A0- Lock around setting shared fences as well as exclus=
ive<br>
&gt; &gt;=C2=A0 =C2=A0- Mark SIGNAL_SYNC_FILE as a read-write ioctl.<br>
&gt; &gt;=C2=A0 =C2=A0- Initialize ret to 0 in dma_buf_wait_sync_file<br>
&gt; &gt; <br>
&gt; &gt; v4 (Jason Ekstrand):<br>
&gt; &gt;=C2=A0 =C2=A0- Use the new dma_resv_get_singleton helper<br>
&gt; &gt; <br>
&gt; &gt; v5 (Jason Ekstrand):<br>
&gt; &gt;=C2=A0 =C2=A0- Rename the IOCTLs to import/export rather than wait=
/signal<br>
&gt; &gt;=C2=A0 =C2=A0- Drop the WRITE flag and always get/set the exclusiv=
e fence<br>
&gt; &gt; <br>
&gt; &gt; v6 (Jason Ekstrand):<br>
&gt; &gt;=C2=A0 =C2=A0- Drop the sync_file import as it was all-around sket=
chy and not nearly<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0as useful as import.<br>
&gt; &gt;=C2=A0 =C2=A0- Re-introduce READ/WRITE flag support for export<br>
&gt; &gt;=C2=A0 =C2=A0- Rework the commit message<br>
&gt; &gt; <br>
&gt; &gt; v7 (Jason Ekstrand):<br>
&gt; &gt;=C2=A0 =C2=A0- Require at least one sync flag<br>
&gt; &gt;=C2=A0 =C2=A0- Fix a refcounting bug: dma_resv_get_excl() doesn&#3=
9;t take a reference<br>
&gt; &gt;=C2=A0 =C2=A0- Use _rcu helpers since we&#39;re accessing the dma_=
resv read-only<br>
&gt; &gt; <br>
&gt; &gt; v8 (Jason Ekstrand):<br>
&gt; &gt;=C2=A0 =C2=A0- Return -ENOMEM if the sync_file_create fails<br>
&gt; &gt;=C2=A0 =C2=A0- Predicate support on IS_ENABLED(CONFIG_SYNC_FILE)<b=
r>
&gt; &gt; <br>
&gt; &gt; v9 (Jason Ekstrand):<br>
&gt; &gt;=C2=A0 =C2=A0- Add documentation for the new ioctl<br>
&gt; &gt; <br>
&gt; &gt; v10 (Jason Ekstrand):<br>
&gt; &gt;=C2=A0 =C2=A0- Go back to dma_buf_sync_file as the ioctl struct na=
me<br>
&gt; &gt; <br>
&gt; &gt; v11 (Daniel Vetter):<br>
&gt; &gt;=C2=A0 =C2=A0- Go back to dma_buf_export_sync_file as the ioctl st=
ruct name<br>
&gt; &gt;=C2=A0 =C2=A0- Better kerneldoc describing what the read/write fla=
gs do<br>
&gt; &gt; <br>
&gt; &gt; v12 (Christian K=C3=B6nig):<br>
&gt; &gt;=C2=A0 =C2=A0- Document why we chose to make it an ioctl on dma-bu=
f<br>
&gt; &gt; <br>
&gt; &gt; v13 (Jason Ekstrand):<br>
&gt; &gt;=C2=A0 =C2=A0- Rebase on Christian K=C3=B6nig&#39;s fence rework<b=
r>
&gt; &gt; <br>
&gt; &gt; v14 (Daniel Vetter &amp; Christian K=C3=B6nig):<br>
&gt; &gt;=C2=A0 =C2=A0- Use dma_rev_usage_rw to get the properly inverted u=
sage to pass to<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0dma_resv_get_singleton()<br>
&gt; &gt;=C2=A0 =C2=A0- Clean up the sync_file and fd if copy_to_user() fai=
ls<br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Jason Ekstrand &lt;<a href=3D"mailto:jason@jlekstr=
and.net" target=3D"_blank">jason@jlekstrand.net</a>&gt;<br>
&gt; &gt; Signed-off-by: Jason Ekstrand &lt;<a href=3D"mailto:jason.ekstran=
d@intel.com" target=3D"_blank">jason.ekstrand@intel.com</a>&gt;<br>
&gt; &gt; Signed-off-by: Jason Ekstrand &lt;<a href=3D"mailto:jason.ekstran=
d@collabora.com" target=3D"_blank">jason.ekstrand@collabora.com</a>&gt;<br>
&gt; &gt; Acked-by: Simon Ser &lt;<a href=3D"mailto:contact@emersion.fr" ta=
rget=3D"_blank">contact@emersion.fr</a>&gt;<br>
&gt; &gt; Acked-by: Christian K=C3=B6nig &lt;<a href=3D"mailto:christian.ko=
enig@amd.com" target=3D"_blank">christian.koenig@amd.com</a>&gt;<br>
&gt; &gt; Reviewed-by: Daniel Vetter &lt;<a href=3D"mailto:daniel.vetter@ff=
wll.ch" target=3D"_blank">daniel.vetter@ffwll.ch</a>&gt;<br>
&gt; &gt; Cc: Sumit Semwal &lt;<a href=3D"mailto:sumit.semwal@linaro.org" t=
arget=3D"_blank">sumit.semwal@linaro.org</a>&gt;<br>
&gt; &gt; Cc: Maarten Lankhorst &lt;<a href=3D"mailto:maarten.lankhorst@lin=
ux.intel.com" target=3D"_blank">maarten.lankhorst@linux.intel.com</a>&gt;<b=
r>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 =C2=A0drivers/dma-buf/dma-buf.c=C2=A0 =C2=A0 | 67 +++++++++=
+++++++++++++++++++++++++++<br>
&gt; &gt;=C2=A0 =C2=A0include/uapi/linux/dma-buf.h | 35 +++++++++++++++++++=
<br>
&gt; &gt;=C2=A0 =C2=A02 files changed, 102 insertions(+)<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.=
c<br>
&gt; &gt; index 79795857be3e..6ff54f7e6119 100644<br>
&gt; &gt; --- a/drivers/dma-buf/dma-buf.c<br>
&gt; &gt; +++ b/drivers/dma-buf/dma-buf.c<br>
&gt; &gt; @@ -20,6 +20,7 @@<br>
&gt; &gt;=C2=A0 =C2=A0#include &lt;linux/debugfs.h&gt;<br>
&gt; &gt;=C2=A0 =C2=A0#include &lt;linux/module.h&gt;<br>
&gt; &gt;=C2=A0 =C2=A0#include &lt;linux/seq_file.h&gt;<br>
&gt; &gt; +#include &lt;linux/sync_file.h&gt;<br>
&gt; &gt;=C2=A0 =C2=A0#include &lt;linux/poll.h&gt;<br>
&gt; &gt;=C2=A0 =C2=A0#include &lt;linux/dma-resv.h&gt;<br>
&gt; &gt;=C2=A0 =C2=A0#include &lt;linux/mm.h&gt;<br>
&gt; &gt; @@ -192,6 +193,9 @@ static loff_t dma_buf_llseek(struct file *fil=
e, loff_t offset, int whence)<br>
&gt; &gt;=C2=A0 =C2=A0 * Note that this only signals the completion of the =
respective fences, i.e. the<br>
&gt; &gt;=C2=A0 =C2=A0 * DMA transfers are complete. Cache flushing and any=
 other necessary<br>
&gt; &gt;=C2=A0 =C2=A0 * preparations before CPU access can begin still nee=
d to happen.<br>
&gt; &gt; + *<br>
&gt; &gt; + * As an alternative to poll(), the set of fences on DMA buffer =
can be<br>
&gt; &gt; + * exported as a &amp;sync_file using &amp;dma_buf_sync_file_exp=
ort.<br>
&gt; &gt;=C2=A0 =C2=A0 */<br>
&gt; &gt;=C2=A0 =C2=A0static void dma_buf_poll_cb(struct dma_fence *fence, =
struct dma_fence_cb *cb)<br>
&gt; &gt; @@ -326,6 +330,64 @@ static long dma_buf_set_name(struct dma_buf =
*dmabuf, const char __user *buf)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; &gt;=C2=A0 =C2=A0}<br>
&gt; &gt; +#if IS_ENABLED(CONFIG_SYNC_FILE)<br>
&gt; &gt; +static long dma_buf_export_sync_file(struct dma_buf *dmabuf,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 void __user *user_data)<br=
>
&gt; &gt; +{<br>
&gt; &gt; +=C2=A0 =C2=A0struct dma_buf_export_sync_file arg;<br>
&gt; &gt; +=C2=A0 =C2=A0enum dma_resv_usage usage;<br>
&gt; &gt; +=C2=A0 =C2=A0struct dma_fence *fence =3D NULL;<br>
&gt; &gt; +=C2=A0 =C2=A0struct sync_file *sync_file;<br>
&gt; &gt; +=C2=A0 =C2=A0int fd, ret;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0if (copy_from_user(&amp;arg, user_data, sizeof(arg)=
))<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EFAULT;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0if (arg.flags &amp; ~DMA_BUF_SYNC_RW)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0if ((arg.flags &amp; DMA_BUF_SYNC_RW) =3D=3D 0)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0fd =3D get_unused_fd_flags(O_CLOEXEC);<br>
&gt; &gt; +=C2=A0 =C2=A0if (fd &lt; 0)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return fd;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0usage =3D dma_resv_usage_rw(arg.flags &amp; DMA_BUF=
_SYNC_WRITE);<br>
&gt; &gt; +=C2=A0 =C2=A0ret =3D dma_resv_get_singleton(dmabuf-&gt;resv, usa=
ge, &amp;fence);<br>
&gt; &gt; +=C2=A0 =C2=A0if (ret)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_put_fd;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0if (!fence)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fence =3D dma_fence_get=
_stub();<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0sync_file =3D sync_file_create(fence);<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0dma_fence_put(fence);<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0if (!sync_file) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D -ENOMEM;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_put_fd;<br>
&gt; &gt; +=C2=A0 =C2=A0}<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0arg.fd =3D fd;<br>
&gt; &gt; +=C2=A0 =C2=A0if (copy_to_user(user_data, &amp;arg, sizeof(arg)))=
 {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D -EFAULT;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_put_file;<br>
&gt; &gt; +=C2=A0 =C2=A0}<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0fd_install(fd, sync_file-&gt;file);<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0return 0;<br>
&gt; &gt; +<br>
&gt; &gt; +err_put_file:<br>
&gt; &gt; +=C2=A0 =C2=A0fput(sync_file-&gt;file);<br>
&gt; &gt; +err_put_fd:<br>
&gt; &gt; +=C2=A0 =C2=A0put_unused_fd(fd);<br>
&gt; &gt; +=C2=A0 =C2=A0return ret;<br>
&gt; &gt; +}<br>
&gt; &gt; +#endif<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 =C2=A0static long dma_buf_ioctl(struct file *file,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0unsigned int cmd, unsigned long arg)<br>
&gt; &gt;=C2=A0 =C2=A0{<br>
&gt; &gt; @@ -369,6 +431,11 @@ static long dma_buf_ioctl(struct file *file,=
<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0case DMA_BUF_SET_NAME_B:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return dma_buf_set=
_name(dmabuf, (const char __user *)arg);<br>
&gt; &gt; +#if IS_ENABLED(CONFIG_SYNC_FILE)<br>
&gt; &gt; +=C2=A0 =C2=A0case DMA_BUF_IOCTL_EXPORT_SYNC_FILE:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return dma_buf_export_s=
ync_file(dmabuf, (void __user *)arg);<br>
&gt; &gt; +#endif<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0default:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOTTY;<br=
>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dm=
a-buf.h<br>
&gt; &gt; index 8e4a2ca0bcbf..46f1e3e98b02 100644<br>
&gt; &gt; --- a/include/uapi/linux/dma-buf.h<br>
&gt; &gt; +++ b/include/uapi/linux/dma-buf.h<br>
&gt; &gt; @@ -85,6 +85,40 @@ struct dma_buf_sync {<br>
&gt; &gt;=C2=A0 =C2=A0#define DMA_BUF_NAME_LEN=C2=A0 32<br>
&gt; &gt; +/**<br>
&gt; &gt; + * struct dma_buf_export_sync_file - Get a sync_file from a dma-=
buf<br>
&gt; &gt; + *<br>
&gt; &gt; + * Userspace can perform a DMA_BUF_IOCTL_EXPORT_SYNC_FILE to ret=
rieve the<br>
&gt; &gt; + * current set of fences on a dma-buf file descriptor as a sync_=
file.=C2=A0 CPU<br>
&gt; &gt; + * waits via poll() or other driver-specific mechanisms typicall=
y wait on<br>
&gt; &gt; + * whatever fences are on the dma-buf at the time the wait begin=
s.=C2=A0 This<br>
&gt; &gt; + * is similar except that it takes a snapshot of the current fen=
ces on the<br>
&gt; &gt; + * dma-buf for waiting later instead of waiting immediately.=C2=
=A0 This is<br>
&gt; &gt; + * useful for modern graphics APIs such as Vulkan which assume a=
n explicit<br>
&gt; &gt; + * synchronization model but still need to inter-operate with dm=
a-buf.<br>
&gt; &gt; + */<br>
&gt; &gt; +struct dma_buf_export_sync_file {<br>
&gt; &gt; +=C2=A0 =C2=A0/**<br>
&gt; &gt; +=C2=A0 =C2=A0 * @flags: Read/write flags<br>
&gt; &gt; +=C2=A0 =C2=A0 *<br>
&gt; &gt; +=C2=A0 =C2=A0 * Must be DMA_BUF_SYNC_READ, DMA_BUF_SYNC_WRITE, o=
r both.<br>
&gt; &gt; +=C2=A0 =C2=A0 *<br>
&gt; &gt; +=C2=A0 =C2=A0 * If DMA_BUF_SYNC_READ is set and DMA_BUF_SYNC_WRI=
TE is not set,<br>
&gt; &gt; +=C2=A0 =C2=A0 * the returned sync file waits on any writers of t=
he dma-buf to<br>
&gt; &gt; +=C2=A0 =C2=A0 * complete.=C2=A0 Waiting on the returned sync fil=
e is equivalent to<br>
&gt; &gt; +=C2=A0 =C2=A0 * poll() with POLLIN.<br>
&gt; &gt; +=C2=A0 =C2=A0 *<br>
&gt; &gt; +=C2=A0 =C2=A0 * If DMA_BUF_SYNC_WRITE is set, the returned sync =
file waits on<br>
&gt; &gt; +=C2=A0 =C2=A0 * any users of the dma-buf (read or write) to comp=
lete.=C2=A0 Waiting<br>
&gt; &gt; +=C2=A0 =C2=A0 * on the returned sync file is equivalent to poll(=
) with POLLOUT.<br>
&gt; &gt; +=C2=A0 =C2=A0 * If both DMA_BUF_SYNC_WRITE and DMA_BUF_SYNC_READ=
 are set, this<br>
&gt; &gt; +=C2=A0 =C2=A0 * is equivalent to just DMA_BUF_SYNC_WRITE.<br>
&gt; &gt; +=C2=A0 =C2=A0 */<br>
&gt; &gt; +=C2=A0 =C2=A0__u32 flags;<br>
&gt; &gt; +=C2=A0 =C2=A0/** @fd: Returned sync file descriptor */<br>
&gt; &gt; +=C2=A0 =C2=A0__s32 fd;<br>
&gt; &gt; +};<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 =C2=A0#define DMA_BUF_BASE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &#39;b&#39;<br>
&gt; &gt;=C2=A0 =C2=A0#define DMA_BUF_IOCTL_SYNC=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 _IOW(DMA_BUF_BASE, 0, struct dma_buf_sync)<br>
&gt; &gt; @@ -94,5 +128,6 @@ struct dma_buf_sync {<br>
&gt; &gt;=C2=A0 =C2=A0#define DMA_BUF_SET_NAME=C2=A0 _IOW(DMA_BUF_BASE, 1, =
const char *)<br>
&gt; &gt;=C2=A0 =C2=A0#define DMA_BUF_SET_NAME_A=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 _IOW(DMA_BUF_BASE, 1, u32)<br>
&gt; &gt;=C2=A0 =C2=A0#define DMA_BUF_SET_NAME_B=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 _IOW(DMA_BUF_BASE, 1, u64)<br>
&gt; &gt; +#define DMA_BUF_IOCTL_EXPORT_SYNC_FILE=C2=A0 =C2=A0 =C2=A0_IOWR(=
DMA_BUF_BASE, 2, struct dma_buf_export_sync_file)<br>
&gt; &gt;=C2=A0 =C2=A0#endif<br>
&gt; <br>
<br>
-- <br>
Daniel Vetter<br>
Software Engineer, Intel Corporation<br>
<a href=3D"http://blog.ffwll.ch" rel=3D"noreferrer" target=3D"_blank">http:=
//blog.ffwll.ch</a><br>
</blockquote></div></div>

--0000000000006d41d805dfd7d4d9--
