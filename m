Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7529758BBED
	for <lists+dri-devel@lfdr.de>; Sun,  7 Aug 2022 19:12:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B4FF10F814;
	Sun,  7 Aug 2022 17:12:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D84DE10EE3A;
 Sun,  7 Aug 2022 17:02:06 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id p82so5459181iod.2;
 Sun, 07 Aug 2022 10:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=UexIQBHjABkmkv5zIZB336H90NxlDHKneuesdeJF4x0=;
 b=E2f7YV6xbfQ44d32cpGWSLgDK9oLKPy8mKTp/8YzYv7tfEvTmEV4OfnR7sY8x7yhbD
 n+9TciUdHz09F/mb2GrnUz0pW82Txr612T1t/kUH5ylxHx+DZ6FSHLjn3wUxsSafasRt
 5PJFwyJwpUTQ4mXVrSTrz8FqRrEGZEUxzuAiguy4bITWZNXj6Y9ruotpmPiccfD28DOp
 VdRlB7BqMakFg2l+fW+bs7HegSE4RGZt6P/7E+iDb+kgZ/hF0OFOZ7RVbQL3ikHWauej
 czMIWnEj0qu8HCh9h0Q5mqLQ/4WeZPjNb3sHXojcnHQNv61dGgTZPoAw5fPtKke3/Zv7
 ioxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=UexIQBHjABkmkv5zIZB336H90NxlDHKneuesdeJF4x0=;
 b=jtVGe6N75WSKoyQkmRPVN6qNYWt2KXS3Bu4R7gA0CVwBYMnmc60dqpJNVTXL0q32h/
 iplfK5a4xL6fmriCoohui9XdZQegAosaxan5tsxMQR3mUM4BEkQMXBI3yvZASERGQrFd
 4g6RBoM6yb106UOncKOIOU4k0gH7hhqssC2QbYMrSNYDk83Hm60rSlPj3isaB13rBe+7
 NxzrKQ8i8cHLbPfxd46A37Gyg2ziyg2KmHzylLOpGxIdKdYYU2l85fbohQv0y1mPveAC
 WBMti1ttG0025fqW4iqJzPHb8CknXb4doIY7ElexyE4ykQJq9G3JL4X5JRjHNdcxX53B
 tWiQ==
X-Gm-Message-State: ACgBeo13jbH4iarVOVpqHMRZnXvvclqaYw+AE31/e8wweoxJ1LnJ6a0u
 s2wL+dQM4v+nY3ytu0KR1VeMfDX+ClM9Se1WP90=
X-Google-Smtp-Source: AA6agR5FGLJdK80DHWxDZGOMT0ZMv7NTv7f+3NZtHwN+mriUQM/SVxdcP0GBxF0kFsiodmHTXl+Z3IfaTZ+yL7tvYMw=
X-Received: by 2002:a05:6638:25d6:b0:342:916c:d59a with SMTP id
 u22-20020a05663825d600b00342916cd59amr6676935jat.51.1659891726060; Sun, 07
 Aug 2022 10:02:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220729170744.1301044-1-robdclark@gmail.com>
 <20220729170744.1301044-2-robdclark@gmail.com>
 <3d2083aa-fc6c-6875-3daf-e5abe45fb762@gmail.com>
In-Reply-To: <3d2083aa-fc6c-6875-3daf-e5abe45fb762@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Sun, 7 Aug 2022 10:02:32 -0700
Message-ID: <CAF6AEGvKdM3vyCvBZK=ZcdGmak7tsrP1b8ANyyaMjVfNDViqyw@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH 1/3] dma-buf: Add ioctl to query mmap info
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Rob Clark <robdclark@chromium.org>,
 =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jerome.pouiller@silabs.com>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 freedreno@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Aug 7, 2022 at 9:09 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 29.07.22 um 19:07 schrieb Rob Clark:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > This is a fairly narrowly focused interface, providing a way for a VMM
> > in userspace to tell the guest kernel what pgprot settings to use when
> > mapping a buffer to guest userspace.
> >
> > For buffers that get mapped into guest userspace, virglrenderer returns
> > a dma-buf fd to the VMM (crosvm or qemu).
>
> Wow, wait a second. Who is giving whom the DMA-buf fd here?

Not sure I understand the question.. the dma-buf fd could come from
EGL_MESA_image_dma_buf_export, gbm, or similar.

> My last status was that this design was illegal and couldn't be
> implemented because it requires internal knowledge only the exporting
> driver can have.

This ioctl provides that information from the exporting driver so that
a VMM doesn't have to make assumptions ;-)

Currently crosvm assumes if (drivername =3D=3D "i915") then it is a cached
mapping, otherwise it is wc.  I'm trying to find a way to fix this.
Suggestions welcome, but because of how mapping to a guest VM works, a
VMM is a somewhat special case where this information is needed in
userspace.

BR,
-R

> @Daniel has anything changed on that is or my status still valid?
>
> Regards,
> Christian.
>
> >    In addition to mapping the
> > pages into the guest VM, it needs to report to drm/virtio in the guest
> > the cache settings to use for guest userspace.  In particular, on some
> > architectures, creating aliased mappings with different cache attribute=
s
> > is frowned upon, so it is important that the guest mappings have the
> > same cache attributes as any potential host mappings.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >   drivers/dma-buf/dma-buf.c    | 26 ++++++++++++++++++++++++++
> >   include/linux/dma-buf.h      |  7 +++++++
> >   include/uapi/linux/dma-buf.h | 28 ++++++++++++++++++++++++++++
> >   3 files changed, 61 insertions(+)
> >
> > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > index 32f55640890c..d02d6c2a3b49 100644
> > --- a/drivers/dma-buf/dma-buf.c
> > +++ b/drivers/dma-buf/dma-buf.c
> > @@ -326,6 +326,29 @@ static long dma_buf_set_name(struct dma_buf *dmabu=
f, const char __user *buf)
> >       return 0;
> >   }
> >
> > +static long dma_buf_info(struct dma_buf *dmabuf, const void __user *ua=
rg)
> > +{
> > +     struct dma_buf_info arg;
> > +
> > +     if (copy_from_user(&arg, uarg, sizeof(arg)))
> > +             return -EFAULT;
> > +
> > +     switch (arg.param) {
> > +     case DMA_BUF_INFO_VM_PROT:
> > +             if (!dmabuf->ops->mmap_info)
> > +                     return -ENOSYS;
> > +             arg.value =3D dmabuf->ops->mmap_info(dmabuf);
> > +             break;
> > +     default:
> > +             return -EINVAL;
> > +     }
> > +
> > +     if (copy_to_user(uarg, &arg, sizeof(arg)))
> > +             return -EFAULT;
> > +
> > +     return 0;
> > +}
> > +
> >   static long dma_buf_ioctl(struct file *file,
> >                         unsigned int cmd, unsigned long arg)
> >   {
> > @@ -369,6 +392,9 @@ static long dma_buf_ioctl(struct file *file,
> >       case DMA_BUF_SET_NAME_B:
> >               return dma_buf_set_name(dmabuf, (const char __user *)arg)=
;
> >
> > +     case DMA_BUF_IOCTL_INFO:
> > +             return dma_buf_info(dmabuf, (const void __user *)arg);
> > +
> >       default:
> >               return -ENOTTY;
> >       }
> > diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> > index 71731796c8c3..6f4de64a5937 100644
> > --- a/include/linux/dma-buf.h
> > +++ b/include/linux/dma-buf.h
> > @@ -283,6 +283,13 @@ struct dma_buf_ops {
> >        */
> >       int (*mmap)(struct dma_buf *, struct vm_area_struct *vma);
> >
> > +     /**
> > +      * @mmap_info:
> > +      *
> > +      * Return mmapping info for the buffer.  See DMA_BUF_INFO_VM_PROT=
.
> > +      */
> > +     int (*mmap_info)(struct dma_buf *);
> > +
> >       int (*vmap)(struct dma_buf *dmabuf, struct iosys_map *map);
> >       void (*vunmap)(struct dma_buf *dmabuf, struct iosys_map *map);
> >   };
> > diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.=
h
> > index b1523cb8ab30..a41adac0f46a 100644
> > --- a/include/uapi/linux/dma-buf.h
> > +++ b/include/uapi/linux/dma-buf.h
> > @@ -85,6 +85,32 @@ struct dma_buf_sync {
> >
> >   #define DMA_BUF_NAME_LEN    32
> >
> > +
> > +/**
> > + * struct dma_buf_info - Query info about the buffer.
> > + */
> > +struct dma_buf_info {
> > +
> > +#define DMA_BUF_INFO_VM_PROT      1
> > +#  define DMA_BUF_VM_PROT_WC      0
> > +#  define DMA_BUF_VM_PROT_CACHED  1
> > +
> > +     /**
> > +      * @param: Which param to query
> > +      *
> > +      * DMA_BUF_INFO_BM_PROT:
> > +      *     Query the access permissions of userspace mmap's of this b=
uffer.
> > +      *     Returns one of DMA_BUF_VM_PROT_x
> > +      */
> > +     __u32 param;
> > +     __u32 pad;
> > +
> > +     /**
> > +      * @value: Return value of the query.
> > +      */
> > +     __u64 value;
> > +};
> > +
> >   #define DMA_BUF_BASE                'b'
> >   #define DMA_BUF_IOCTL_SYNC  _IOW(DMA_BUF_BASE, 0, struct dma_buf_sync=
)
> >
> > @@ -95,4 +121,6 @@ struct dma_buf_sync {
> >   #define DMA_BUF_SET_NAME_A  _IOW(DMA_BUF_BASE, 1, __u32)
> >   #define DMA_BUF_SET_NAME_B  _IOW(DMA_BUF_BASE, 1, __u64)
> >
> > +#define DMA_BUF_IOCTL_INFO   _IOWR(DMA_BUF_BASE, 2, struct dma_buf_inf=
o)
> > +
> >   #endif
>
