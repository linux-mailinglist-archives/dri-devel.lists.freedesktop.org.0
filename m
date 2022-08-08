Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FFAB58C97D
	for <lists+dri-devel@lfdr.de>; Mon,  8 Aug 2022 15:31:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7539A9BD92;
	Mon,  8 Aug 2022 13:26:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 607B59A5CD;
 Mon,  8 Aug 2022 13:03:58 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id z145so7005684iof.9;
 Mon, 08 Aug 2022 06:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=ZvT8zFSaN4+LwwHuSYqMb23PG3MGFvgeXxhuTYLZpLA=;
 b=bIV76remtNAYQAeCdeb3qJ3+b164qBdDrAh+RltF+dOCvtut76rYCFEeN05QWNkUuV
 AoVR5s8C364z0ybC7ibjDVnQDDa4asxYupQ5SMfZiDM9z7fodmeKYug3z8bzjsmQ+3Q0
 qoVud6QDZ7mOFNA9ESM5uAe9aFWlBDDNZvrbWyYB/qpn8LHm+33J2ADJwdmpnZZq2SW2
 BGrRUXM5imEq8M5Kiman/R0HF9ju5F9Y9WoiHfQxom2ElQLBXRg6lBPQBHG3rly+3UYV
 YSHbTbM5eTZT5Yhyfldvmq7YR1Hldk21TeWy52szjq0pmCwdvTf7O4OogCI1Lni7YdY3
 dP7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=ZvT8zFSaN4+LwwHuSYqMb23PG3MGFvgeXxhuTYLZpLA=;
 b=GX2V/SnRJOocpJu1J8yFwj1pzQ6/z0vJV24r3PbViOhLbQzvviZ9oXXuES+I0Qg9Vm
 fgCiSx3OX1Y5Fmi3Wqe1x20KzRyRFHPO2DlinVZg27M6N9fv/VWsafB097sbkxgvriGX
 JXP9jntoV39zQphUg+MBcjJ9aKAD9rPw1Q78GMBoQqoZ+D5+zP8R8AMZE61icOmiHbC3
 YDpIFjFsiQR1vk20GzRkKlJIkoGe+ep1nVSbn1cg1cMd8sKKeVRQCXW/PkTtgrgaO6Y0
 YGjlDue4l8QgJgRqzkq9BoM1L24y7Yh7tSDv8ZGUgL6KM4tdGCtWBNrgk4j8wZ0NOuQz
 6QXQ==
X-Gm-Message-State: ACgBeo3FkJhEqcT6p+kOvD4UyTOyi+BBkTr8Cl7a9lQXMQK/ZHT8VIcW
 l03A2U4P6ybd1ySXMBNylC1qA5d8YqdxjeophKfKydvT
X-Google-Smtp-Source: AA6agR60DUrBizeFAOIl0MFBBFVK7rm5XRv8HCDKfsPieaM8O+nIy31LtUASY2Py2R3HzanJm6GnC6zPInf13BA0Rpo=
X-Received: by 2002:a05:6638:f8f:b0:342:cb21:f6d6 with SMTP id
 h15-20020a0566380f8f00b00342cb21f6d6mr5560379jal.138.1659963837491; Mon, 08
 Aug 2022 06:03:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220729170744.1301044-1-robdclark@gmail.com>
 <20220729170744.1301044-2-robdclark@gmail.com>
 <62afe47a-1a50-80ef-400d-8c238f1cb332@quicinc.com>
In-Reply-To: <62afe47a-1a50-80ef-400d-8c238f1cb332@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 8 Aug 2022 06:04:19 -0700
Message-ID: <CAF6AEGuRnnjXN-sFeBkgF+ZiHQsABUEXBRLTO+jibHFk7RumSg@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 1/3] dma-buf: Add ioctl to query mmap info
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
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

On Sun, Aug 7, 2022 at 1:25 PM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>
> On 7/29/2022 10:37 PM, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > This is a fairly narrowly focused interface, providing a way for a VMM
> > in userspace to tell the guest kernel what pgprot settings to use when
> > mapping a buffer to guest userspace.
> >
> > For buffers that get mapped into guest userspace, virglrenderer returns
> > a dma-buf fd to the VMM (crosvm or qemu).  In addition to mapping the
> > pages into the guest VM, it needs to report to drm/virtio in the guest
> > the cache settings to use for guest userspace.  In particular, on some
> > architectures, creating aliased mappings with different cache attributes
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
> > @@ -326,6 +326,29 @@ static long dma_buf_set_name(struct dma_buf *dmabuf, const char __user *buf)
> >       return 0;
> >   }
> >
> > +static long dma_buf_info(struct dma_buf *dmabuf, const void __user *uarg)
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
> > +             arg.value = dmabuf->ops->mmap_info(dmabuf);
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
> >               return dma_buf_set_name(dmabuf, (const char __user *)arg);
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
> > +      * Return mmapping info for the buffer.  See DMA_BUF_INFO_VM_PROT.
> > +      */
> > +     int (*mmap_info)(struct dma_buf *);
> > +
> >       int (*vmap)(struct dma_buf *dmabuf, struct iosys_map *map);
> >       void (*vunmap)(struct dma_buf *dmabuf, struct iosys_map *map);
> >   };
> > diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.h
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
> Is there a typo here? BM -> VM ?

yes, fixed locally

>
> -Akhil.
> > +      *     Query the access permissions of userspace mmap's of this buffer.
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
> >   #define DMA_BUF_IOCTL_SYNC  _IOW(DMA_BUF_BASE, 0, struct dma_buf_sync)
> >
> > @@ -95,4 +121,6 @@ struct dma_buf_sync {
> >   #define DMA_BUF_SET_NAME_A  _IOW(DMA_BUF_BASE, 1, __u32)
> >   #define DMA_BUF_SET_NAME_B  _IOW(DMA_BUF_BASE, 1, __u64)
> >
> > +#define DMA_BUF_IOCTL_INFO   _IOWR(DMA_BUF_BASE, 2, struct dma_buf_info)
> > +
> >   #endif
>
