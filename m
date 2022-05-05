Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 233D551D58C
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 12:19:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9877110FD0D;
	Fri,  6 May 2022 10:19:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [IPv6:2607:f8b0:4864:20::1129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52E6710F7C8
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 08:14:07 +0000 (UTC)
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-2f16645872fso40291477b3.4
 for <dri-devel@lists.freedesktop.org>; Thu, 05 May 2022 01:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E0li8VCK5rLoqBm7jSUzWKiZig06N7OaR5oxcekfT7g=;
 b=uG02yJT2fs/IBuQFGG5npkSvIx33Mman6DZ7bLHwfcVLRH5ae/3C0ILVQDRa5bP2N5
 dD/W4TlpOTVDd4mj0jIprDBjF54xDTaWIXF9h8+AxNP4AbggbDE61OZ+1BG6WCyWkA1K
 gG7fPI0lyr2/B0mD7/lh6184TsRvQL057wvPanMWk2GoX82sqqd+HecU8o4E+Q7gK5T9
 rSpv8FR48VZ0vIr/UftwcmngzEstJH5M9WA2Mw7qrfzyKzaDj/ycYKEDMuMv1phmSa/z
 DPAd9vwuXZ6y7jKcTavkHUXz8giJPoI5YRcFysETXvO1ghAi0baAb/3maUnhDXcgrLU9
 4hrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E0li8VCK5rLoqBm7jSUzWKiZig06N7OaR5oxcekfT7g=;
 b=k5QcAcxYOxCjJ+ggT5zWabB0aCG8YS/hX3EddV/pkWFki+HO5uqNEPlRQaxDIiCcUI
 h6qUwWG7MCNh8I3ZRdiLw0ratw7akBA00ExJhvnZ+8cWn5uEwIAEP/gvM/7OVcu2Y9iG
 mQQ+cqFVD1IMWg2bipUi2SEdmJQskg0YBEHvVsa/NSXTxXRryiETor9qOo/byX0uSD7R
 FrEs8yiOEEPC8FXxMhpXUmM5vA26ChSZVMdVgU2yC2DdB9aLNr/2XatXrs+IkGTD/d8z
 c37M7L5zFOA/fc0lRMDL/XyhE8iOyMXDoX5Iw6bNF/ayOLpGx2gB9cqzrVOoQDeH0Bq5
 C/mw==
X-Gm-Message-State: AOAM5315EHFlFpagFf16UyDwVuqbT6a1W24CqK+cRDzYjRqx8VmvE7X8
 hZbjyfcsxfEYBODi8ZtoaiZnv/wkPEYemGP4E8tEew==
X-Google-Smtp-Source: ABdhPJz7M1bjc0dAULMbY81NAVY9G1dvSbUkluctxOj5cK3+L6VK4K/H4xrlXRKGGm6ALjoDBsDiRrDvv2wHXTikwNU=
X-Received: by 2002:a81:f90:0:b0:2f8:46f4:a61b with SMTP id
 138-20020a810f90000000b002f846f4a61bmr22215514ywp.115.1651738446397; Thu, 05
 May 2022 01:14:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220504203404.1495485-1-jason@jlekstrand.net>
 <20220504203404.1495485-3-jason@jlekstrand.net>
 <YnMD9JX/v6kSQE2t@phenom.ffwll.local>
In-Reply-To: <YnMD9JX/v6kSQE2t@phenom.ffwll.local>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Thu, 5 May 2022 03:13:55 -0500
Message-ID: <CAOFGe96vXRjUzi3CLj788=Wy3VxGcM-bB3+0M2Ttbg4GPwti7A@mail.gmail.com>
Subject: Re: [PATCH 2/2] dma-buf: Add an API for importing sync files (v8)
To: Daniel Vetter <daniel@ffwll.ch>
Content-Type: multipart/alternative; boundary="0000000000005c190b05de3f53d3"
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000005c190b05de3f53d3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 4, 2022 at 5:53 PM Daniel Vetter <daniel@ffwll.ch> wrote:

> On Wed, May 04, 2022 at 03:34:04PM -0500, Jason Ekstrand wrote:
> > This patch is analogous to the previous sync file export patch in that
> > it allows you to import a sync_file into a dma-buf.  Unlike the previou=
s
> > patch, however, this does add genuinely new functionality to dma-buf.
> > Without this, the only way to attach a sync_file to a dma-buf is to
> > submit a batch to your driver of choice which waits on the sync_file an=
d
> > claims to write to the dma-buf.  Even if said batch is a no-op, a submi=
t
> > is typically way more overhead than just attaching a fence.  A submit
> > may also imply extra synchronization with other work because it happens
> > on a hardware queue.
> >
> > In the Vulkan world, this is useful for dealing with the out-fence from
> > vkQueuePresent.  Current Linux window-systems (X11, Wayland, etc.) all
> > rely on dma-buf implicit sync.  Since Vulkan is an explicit sync API, w=
e
> > get a set of fences (VkSemaphores) in vkQueuePresent and have to stash
> > those as an exclusive (write) fence on the dma-buf.  We handle it in
> > Mesa today with the above mentioned dummy submit trick.  This ioctl
> > would allow us to set it directly without the dummy submit.
> >
> > This may also open up possibilities for GPU drivers to move away from
> > implicit sync for their kernel driver uAPI and instead provide sync
> > files and rely on dma-buf import/export for communicating with other
> > implicit sync clients.
> >
> > We make the explicit choice here to only allow setting RW fences which
> > translates to an exclusive fence on the dma_resv.  There's no use for
> > read-only fences for communicating with other implicit sync userspace
> > and any such attempts are likely to be racy at best.  When we got to
> > insert the RW fence, the actual fence we set as the new exclusive fence
> > is a combination of the sync_file provided by the user and all the othe=
r
> > fences on the dma_resv.  This ensures that the newly added exclusive
> > fence will never signal before the old one would have and ensures that
> > we don't break any dma_resv contracts.  We require userspace to specify
> > RW in the flags for symmetry with the export ioctl and in case we ever
> > want to support read fences in the future.
> >
> > There is one downside here that's worth documenting:  If two clients
> > writing to the same dma-buf using this API race with each other, their
> > actions on the dma-buf may happen in parallel or in an undefined order.
> > Both with and without this API, the pattern is the same:  Collect all
> > the fences on dma-buf, submit work which depends on said fences, and
> > then set a new exclusive (write) fence on the dma-buf which depends on
> > said work.  The difference is that, when it's all handled by the GPU
> > driver's submit ioctl, the three operations happen atomically under the
> > dma_resv lock.  If two userspace submits race, one will happen before
> > the other.  You aren't guaranteed which but you are guaranteed that
> > they're strictly ordered.  If userspace manages the fences itself, then
> > these three operations happen separately and the two render operations
> > may happen genuinely in parallel or get interleaved.  However, this is =
a
> > case of userspace racing with itself.  As long as we ensure userspace
> > can't back the kernel into a corner, it should be fine.
> >
> > v2 (Jason Ekstrand):
> >  - Use a wrapper dma_fence_array of all fences including the new one
> >    when importing an exclusive fence.
> >
> > v3 (Jason Ekstrand):
> >  - Lock around setting shared fences as well as exclusive
> >  - Mark SIGNAL_SYNC_FILE as a read-write ioctl.
> >  - Initialize ret to 0 in dma_buf_wait_sync_file
> >
> > v4 (Jason Ekstrand):
> >  - Use the new dma_resv_get_singleton helper
> >
> > v5 (Jason Ekstrand):
> >  - Rename the IOCTLs to import/export rather than wait/signal
> >  - Drop the WRITE flag and always get/set the exclusive fence
> >
> > v6 (Jason Ekstrand):
> >  - Split import and export into separate patches
> >  - New commit message
> >
> > v7 (Daniel Vetter):
> >  - Fix the uapi header to use the right struct in the ioctl
> >  - Use a separate dma_buf_import_sync_file struct
> >  - Add kerneldoc for dma_buf_import_sync_file
> >
> > v8 (Jason Ekstrand):
> >  - Rebase on Christian K=C3=B6nig's fence rework
> >
> > Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > ---
> >  drivers/dma-buf/dma-buf.c    | 36 ++++++++++++++++++++++++++++++++++++
> >  include/uapi/linux/dma-buf.h | 22 ++++++++++++++++++++++
> >  2 files changed, 58 insertions(+)
> >
> > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > index 529e0611e53b..68aac6f694f9 100644
> > --- a/drivers/dma-buf/dma-buf.c
> > +++ b/drivers/dma-buf/dma-buf.c
> > @@ -383,6 +383,40 @@ static long dma_buf_export_sync_file(struct dma_bu=
f
> *dmabuf,
> >       put_unused_fd(fd);
> >       return ret;
> >  }
> > +
> > +static long dma_buf_import_sync_file(struct dma_buf *dmabuf,
> > +                                  const void __user *user_data)
> > +{
> > +     struct dma_buf_import_sync_file arg;
> > +     struct dma_fence *fence;
> > +     enum dma_resv_usage usage;
> > +     int ret =3D 0;
> > +
> > +     if (copy_from_user(&arg, user_data, sizeof(arg)))
> > +             return -EFAULT;
> > +
> > +     if (arg.flags !=3D DMA_BUF_SYNC_RW)
>
> I think the flag validation here looks wrong? I think needs needs the
> exact same 3 checks as the export ioctl.
>

Yup.  Fixed.  By which I mean I stuck in the 2-check version.  Let's chat
on patch 1 about whether or not RW should be allowed.


>
> > +             return -EINVAL;
> > +
> > +     fence =3D sync_file_get_fence(arg.fd);
> > +     if (!fence)
> > +             return -EINVAL;
> > +
> > +     usage =3D (arg.flags & DMA_BUF_SYNC_WRITE) ? DMA_RESV_USAGE_WRITE=
 :
> > +                                                DMA_RESV_USAGE_READ;
> > +
> > +     dma_resv_lock(dmabuf->resv, NULL);
> > +
> > +     ret =3D dma_resv_reserve_fences(dmabuf->resv, 1);
> > +     if (!ret)
> > +             dma_resv_add_fence(dmabuf->resv, fence, usage);
> > +
> > +     dma_resv_unlock(dmabuf->resv);
> > +
> > +     dma_fence_put(fence);
> > +
> > +     return ret;
> > +}
> >  #endif
> >
> >  static long dma_buf_ioctl(struct file *file,
> > @@ -431,6 +465,8 @@ static long dma_buf_ioctl(struct file *file,
> >  #if IS_ENABLED(CONFIG_SYNC_FILE)
> >       case DMA_BUF_IOCTL_EXPORT_SYNC_FILE:
> >               return dma_buf_export_sync_file(dmabuf, (void __user
> *)arg);
> > +     case DMA_BUF_IOCTL_IMPORT_SYNC_FILE:
> > +             return dma_buf_import_sync_file(dmabuf, (const void __use=
r
> *)arg);
> >  #endif
> >
> >       default:
> > diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.=
h
> > index 46f1e3e98b02..913119bf2201 100644
> > --- a/include/uapi/linux/dma-buf.h
> > +++ b/include/uapi/linux/dma-buf.h
> > @@ -119,6 +119,27 @@ struct dma_buf_export_sync_file {
> >       __s32 fd;
> >  };
> >
> > +/**
> > + * struct dma_buf_import_sync_file - Insert a sync_file into a dma-buf
> > + *
> > + * Userspace can perform a DMA_BUF_IOCTL_IMPORT_SYNC_FILE to insert a
> > + * sync_file into a dma-buf for the purposes of implicit synchronizati=
on
> > + * with other dma-buf consumers.  This allows clients using explicitly
> > + * synchronized APIs such as Vulkan to inter-op with dma-buf consumers
> > + * which expect implicit synchronization such as OpenGL or most media
> > + * drivers/video.
> > + */
> > +struct dma_buf_import_sync_file {
> > +     /**
> > +      * @flags: Read/write flags
> > +      *
> > +      * Must be DMA_BUF_SYNC_RW.
>
> The checks are wrong, but the intent of your implementation looks a lot
> more like you allow both SYNC_WRITE and SYNC_READ, and I think that makes
> a lot of sense. Especially since we can now true sync-less access for vk
> with DMA_RESV_USAGE_BOOKKEEPING, so allowing userspace to explicit set
> read will be needed.
>
> Or does vk only allow you to set write fences anyway? That would suck for
> the vk app + gl compositor case a bit, so I hope not.
>

I just forgot to update the docs.  The reason for only allowing RW before
was because we were all scared of inserting shared fences and not exclusive
fences.  Now that we have the fence rework, I think being able to stick in
a read fence is safe.  Not sure if it's useful, but it's at least safe.

--Jason


> > +      */
> > +     __u32 flags;
> > +     /** @fd: Sync file descriptor */
> > +     __s32 fd;
> > +};
> > +
> >  #define DMA_BUF_BASE         'b'
> >  #define DMA_BUF_IOCTL_SYNC   _IOW(DMA_BUF_BASE, 0, struct dma_buf_sync=
)
> >
> > @@ -129,5 +150,6 @@ struct dma_buf_export_sync_file {
> >  #define DMA_BUF_SET_NAME_A   _IOW(DMA_BUF_BASE, 1, u32)
> >  #define DMA_BUF_SET_NAME_B   _IOW(DMA_BUF_BASE, 1, u64)
> >  #define DMA_BUF_IOCTL_EXPORT_SYNC_FILE       _IOWR(DMA_BUF_BASE, 2,
> struct dma_buf_export_sync_file)
> > +#define DMA_BUF_IOCTL_IMPORT_SYNC_FILE       _IOW(DMA_BUF_BASE, 3,
> struct dma_buf_import_sync_file)
>
> With the flag nits sorted out:
>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>
> >
> >  #endif
> > --
> > 2.36.0
> >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
>

--0000000000005c190b05de3f53d3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, May 4, 2022 at 5:53 PM Daniel Vetter &lt;<a href=3D"mailto:d=
aniel@ffwll.ch">daniel@ffwll.ch</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Wed, May 04, 2022 at 03:34:04PM -0500, =
Jason Ekstrand wrote:<br>
&gt; This patch is analogous to the previous sync file export patch in that=
<br>
&gt; it allows you to import a sync_file into a dma-buf.=C2=A0 Unlike the p=
revious<br>
&gt; patch, however, this does add genuinely new functionality to dma-buf.<=
br>
&gt; Without this, the only way to attach a sync_file to a dma-buf is to<br=
>
&gt; submit a batch to your driver of choice which waits on the sync_file a=
nd<br>
&gt; claims to write to the dma-buf.=C2=A0 Even if said batch is a no-op, a=
 submit<br>
&gt; is typically way more overhead than just attaching a fence.=C2=A0 A su=
bmit<br>
&gt; may also imply extra synchronization with other work because it happen=
s<br>
&gt; on a hardware queue.<br>
&gt; <br>
&gt; In the Vulkan world, this is useful for dealing with the out-fence fro=
m<br>
&gt; vkQueuePresent.=C2=A0 Current Linux window-systems (X11, Wayland, etc.=
) all<br>
&gt; rely on dma-buf implicit sync.=C2=A0 Since Vulkan is an explicit sync =
API, we<br>
&gt; get a set of fences (VkSemaphores) in vkQueuePresent and have to stash=
<br>
&gt; those as an exclusive (write) fence on the dma-buf.=C2=A0 We handle it=
 in<br>
&gt; Mesa today with the above mentioned dummy submit trick.=C2=A0 This ioc=
tl<br>
&gt; would allow us to set it directly without the dummy submit.<br>
&gt; <br>
&gt; This may also open up possibilities for GPU drivers to move away from<=
br>
&gt; implicit sync for their kernel driver uAPI and instead provide sync<br=
>
&gt; files and rely on dma-buf import/export for communicating with other<b=
r>
&gt; implicit sync clients.<br>
&gt; <br>
&gt; We make the explicit choice here to only allow setting RW fences which=
<br>
&gt; translates to an exclusive fence on the dma_resv.=C2=A0 There&#39;s no=
 use for<br>
&gt; read-only fences for communicating with other implicit sync userspace<=
br>
&gt; and any such attempts are likely to be racy at best.=C2=A0 When we got=
 to<br>
&gt; insert the RW fence, the actual fence we set as the new exclusive fenc=
e<br>
&gt; is a combination of the sync_file provided by the user and all the oth=
er<br>
&gt; fences on the dma_resv.=C2=A0 This ensures that the newly added exclus=
ive<br>
&gt; fence will never signal before the old one would have and ensures that=
<br>
&gt; we don&#39;t break any dma_resv contracts.=C2=A0 We require userspace =
to specify<br>
&gt; RW in the flags for symmetry with the export ioctl and in case we ever=
<br>
&gt; want to support read fences in the future.<br>
&gt; <br>
&gt; There is one downside here that&#39;s worth documenting:=C2=A0 If two =
clients<br>
&gt; writing to the same dma-buf using this API race with each other, their=
<br>
&gt; actions on the dma-buf may happen in parallel or in an undefined order=
.<br>
&gt; Both with and without this API, the pattern is the same:=C2=A0 Collect=
 all<br>
&gt; the fences on dma-buf, submit work which depends on said fences, and<b=
r>
&gt; then set a new exclusive (write) fence on the dma-buf which depends on=
<br>
&gt; said work.=C2=A0 The difference is that, when it&#39;s all handled by =
the GPU<br>
&gt; driver&#39;s submit ioctl, the three operations happen atomically unde=
r the<br>
&gt; dma_resv lock.=C2=A0 If two userspace submits race, one will happen be=
fore<br>
&gt; the other.=C2=A0 You aren&#39;t guaranteed which but you are guarantee=
d that<br>
&gt; they&#39;re strictly ordered.=C2=A0 If userspace manages the fences it=
self, then<br>
&gt; these three operations happen separately and the two render operations=
<br>
&gt; may happen genuinely in parallel or get interleaved.=C2=A0 However, th=
is is a<br>
&gt; case of userspace racing with itself.=C2=A0 As long as we ensure users=
pace<br>
&gt; can&#39;t back the kernel into a corner, it should be fine.<br>
&gt; <br>
&gt; v2 (Jason Ekstrand):<br>
&gt;=C2=A0 - Use a wrapper dma_fence_array of all fences including the new =
one<br>
&gt;=C2=A0 =C2=A0 when importing an exclusive fence.<br>
&gt; <br>
&gt; v3 (Jason Ekstrand):<br>
&gt;=C2=A0 - Lock around setting shared fences as well as exclusive<br>
&gt;=C2=A0 - Mark SIGNAL_SYNC_FILE as a read-write ioctl.<br>
&gt;=C2=A0 - Initialize ret to 0 in dma_buf_wait_sync_file<br>
&gt; <br>
&gt; v4 (Jason Ekstrand):<br>
&gt;=C2=A0 - Use the new dma_resv_get_singleton helper<br>
&gt; <br>
&gt; v5 (Jason Ekstrand):<br>
&gt;=C2=A0 - Rename the IOCTLs to import/export rather than wait/signal<br>
&gt;=C2=A0 - Drop the WRITE flag and always get/set the exclusive fence<br>
&gt; <br>
&gt; v6 (Jason Ekstrand):<br>
&gt;=C2=A0 - Split import and export into separate patches<br>
&gt;=C2=A0 - New commit message<br>
&gt; <br>
&gt; v7 (Daniel Vetter):<br>
&gt;=C2=A0 - Fix the uapi header to use the right struct in the ioctl<br>
&gt;=C2=A0 - Use a separate dma_buf_import_sync_file struct<br>
&gt;=C2=A0 - Add kerneldoc for dma_buf_import_sync_file<br>
&gt; <br>
&gt; v8 (Jason Ekstrand):<br>
&gt;=C2=A0 - Rebase on Christian K=C3=B6nig&#39;s fence rework<br>
&gt; <br>
&gt; Signed-off-by: Jason Ekstrand &lt;<a href=3D"mailto:jason@jlekstrand.n=
et" target=3D"_blank">jason@jlekstrand.net</a>&gt;<br>
&gt; Cc: Christian K=C3=B6nig &lt;<a href=3D"mailto:christian.koenig@amd.co=
m" target=3D"_blank">christian.koenig@amd.com</a>&gt;<br>
&gt; Cc: Daniel Vetter &lt;<a href=3D"mailto:daniel.vetter@ffwll.ch" target=
=3D"_blank">daniel.vetter@ffwll.ch</a>&gt;<br>
&gt; Cc: Sumit Semwal &lt;<a href=3D"mailto:sumit.semwal@linaro.org" target=
=3D"_blank">sumit.semwal@linaro.org</a>&gt;<br>
&gt; Cc: Maarten Lankhorst &lt;<a href=3D"mailto:maarten.lankhorst@linux.in=
tel.com" target=3D"_blank">maarten.lankhorst@linux.intel.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/dma-buf/dma-buf.c=C2=A0 =C2=A0 | 36 ++++++++++++++++++++=
++++++++++++++++<br>
&gt;=C2=A0 include/uapi/linux/dma-buf.h | 22 ++++++++++++++++++++++<br>
&gt;=C2=A0 2 files changed, 58 insertions(+)<br>
&gt; <br>
&gt; diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c<br>
&gt; index 529e0611e53b..68aac6f694f9 100644<br>
&gt; --- a/drivers/dma-buf/dma-buf.c<br>
&gt; +++ b/drivers/dma-buf/dma-buf.c<br>
&gt; @@ -383,6 +383,40 @@ static long dma_buf_export_sync_file(struct dma_b=
uf *dmabuf,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0put_unused_fd(fd);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt;=C2=A0 }<br>
&gt; +<br>
&gt; +static long dma_buf_import_sync_file(struct dma_buf *dmabuf,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const void __user *user_d=
ata)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dma_buf_import_sync_file arg;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dma_fence *fence;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0enum dma_resv_usage usage;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret =3D 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (copy_from_user(&amp;arg, user_data, sizeof(ar=
g)))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EFAULT;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (arg.flags !=3D DMA_BUF_SYNC_RW)<br>
<br>
I think the flag validation here looks wrong? I think needs needs the<br>
exact same 3 checks as the export ioctl.<br></blockquote><div><br></div><di=
v>Yup.=C2=A0 Fixed.=C2=A0 By which I mean I stuck in the 2-check version.=
=C2=A0 Let&#39;s chat on patch 1 about whether or not RW should be allowed.=
<br></div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0fence =3D sync_file_get_fence(arg.fd);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!fence)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0usage =3D (arg.flags &amp; DMA_BUF_SYNC_WRITE) ? =
DMA_RESV_USAGE_WRITE :<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 DMA_RESV_USAGE_READ;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dma_resv_lock(dmabuf-&gt;resv, NULL);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D dma_resv_reserve_fences(dmabuf-&gt;resv, =
1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!ret)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dma_resv_add_fence(dm=
abuf-&gt;resv, fence, usage);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dma_resv_unlock(dmabuf-&gt;resv);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dma_fence_put(fence);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +}<br>
&gt;=C2=A0 #endif<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static long dma_buf_ioctl(struct file *file,<br>
&gt; @@ -431,6 +465,8 @@ static long dma_buf_ioctl(struct file *file,<br>
&gt;=C2=A0 #if IS_ENABLED(CONFIG_SYNC_FILE)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0case DMA_BUF_IOCTL_EXPORT_SYNC_FILE:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return dma_buf_e=
xport_sync_file(dmabuf, (void __user *)arg);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case DMA_BUF_IOCTL_IMPORT_SYNC_FILE:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return dma_buf_import=
_sync_file(dmabuf, (const void __user *)arg);<br>
&gt;=C2=A0 #endif<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
&gt; diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf=
.h<br>
&gt; index 46f1e3e98b02..913119bf2201 100644<br>
&gt; --- a/include/uapi/linux/dma-buf.h<br>
&gt; +++ b/include/uapi/linux/dma-buf.h<br>
&gt; @@ -119,6 +119,27 @@ struct dma_buf_export_sync_file {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0__s32 fd;<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt; +/**<br>
&gt; + * struct dma_buf_import_sync_file - Insert a sync_file into a dma-bu=
f<br>
&gt; + *<br>
&gt; + * Userspace can perform a DMA_BUF_IOCTL_IMPORT_SYNC_FILE to insert a=
<br>
&gt; + * sync_file into a dma-buf for the purposes of implicit synchronizat=
ion<br>
&gt; + * with other dma-buf consumers.=C2=A0 This allows clients using expl=
icitly<br>
&gt; + * synchronized APIs such as Vulkan to inter-op with dma-buf consumer=
s<br>
&gt; + * which expect implicit synchronization such as OpenGL or most media=
<br>
&gt; + * drivers/video.<br>
&gt; + */<br>
&gt; +struct dma_buf_import_sync_file {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/**<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * @flags: Read/write flags<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 *<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * Must be DMA_BUF_SYNC_RW.<br>
<br>
The checks are wrong, but the intent of your implementation looks a lot<br>
more like you allow both SYNC_WRITE and SYNC_READ, and I think that makes<b=
r>
a lot of sense. Especially since we can now true sync-less access for vk<br=
>
with DMA_RESV_USAGE_BOOKKEEPING, so allowing userspace to explicit set<br>
read will be needed.<br>
<br>
Or does vk only allow you to set write fences anyway? That would suck for<b=
r>
the vk app + gl compositor case a bit, so I hope not.<br></blockquote><div>=
<br></div><div>I just forgot to update the docs.=C2=A0 The reason for only =
allowing RW before was because we were all scared of inserting shared fence=
s and not exclusive fences.=C2=A0 Now that we have the fence rework, I thin=
k being able to stick in a read fence is safe.=C2=A0 Not sure if it&#39;s u=
seful, but it&#39;s at least safe.</div><div><br></div><div>--Jason<br></di=
v><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0__u32 flags;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/** @fd: Sync file descriptor */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0__s32 fd;<br>
&gt; +};<br>
&gt; +<br>
&gt;=C2=A0 #define DMA_BUF_BASE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;b&#39=
;<br>
&gt;=C2=A0 #define DMA_BUF_IOCTL_SYNC=C2=A0 =C2=A0_IOW(DMA_BUF_BASE, 0, str=
uct dma_buf_sync)<br>
&gt;=C2=A0 <br>
&gt; @@ -129,5 +150,6 @@ struct dma_buf_export_sync_file {<br>
&gt;=C2=A0 #define DMA_BUF_SET_NAME_A=C2=A0 =C2=A0_IOW(DMA_BUF_BASE, 1, u32=
)<br>
&gt;=C2=A0 #define DMA_BUF_SET_NAME_B=C2=A0 =C2=A0_IOW(DMA_BUF_BASE, 1, u64=
)<br>
&gt;=C2=A0 #define DMA_BUF_IOCTL_EXPORT_SYNC_FILE=C2=A0 =C2=A0 =C2=A0 =C2=
=A0_IOWR(DMA_BUF_BASE, 2, struct dma_buf_export_sync_file)<br>
&gt; +#define DMA_BUF_IOCTL_IMPORT_SYNC_FILE=C2=A0 =C2=A0 =C2=A0 =C2=A0_IOW=
(DMA_BUF_BASE, 3, struct dma_buf_import_sync_file)<br>
<br>
With the flag nits sorted out:<br>
<br>
Reviewed-by: Daniel Vetter &lt;<a href=3D"mailto:daniel.vetter@ffwll.ch" ta=
rget=3D"_blank">daniel.vetter@ffwll.ch</a>&gt;<br>
<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 #endif<br>
&gt; -- <br>
&gt; 2.36.0<br>
&gt; <br>
<br>
-- <br>
Daniel Vetter<br>
Software Engineer, Intel Corporation<br>
<a href=3D"http://blog.ffwll.ch" rel=3D"noreferrer" target=3D"_blank">http:=
//blog.ffwll.ch</a><br>
</blockquote></div></div>

--0000000000005c190b05de3f53d3--
