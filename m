Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 799D85985A8
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 16:25:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1758B9CD5;
	Thu, 18 Aug 2022 14:25:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A416D8A5D;
 Thu, 18 Aug 2022 14:24:35 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id v2so2336099lfi.6;
 Thu, 18 Aug 2022 07:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=NXVJVUWynn6wvx9ndQACrA8b2MjhBwHgS2ceozjPi38=;
 b=Rd7MOY6WkZG9EOq/99PHAtWlSDdrtf0i0HZCtPfVC9jQa1MOXM0VjUsF0X2RU11SG4
 lBMDnLzGjCNiKxzNu+l0qMdDtfsqa8mP8cJeqMY6KRUnmkb+4BrrSadMZ7YLWo7jZCHy
 GuFrMnN6I4vck7vZ2Y89/LZcZ7l4Dk7WFraqY2fc0RTuBoYXZRIoNf4qGjZNqsJbOEw2
 Gz2dtMKJjk1YT3R1U3zZX8L1+SI7smp15S+YgHTvRp2CbuhqJrHiMiG+mOalXe5psQgu
 KCQJAC+BQ+u0IES+jpt4O5A51NccK/0eqN9l6t2lVjRZlodUuUz9LPFdtkqpMR1kgbGs
 wMXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=NXVJVUWynn6wvx9ndQACrA8b2MjhBwHgS2ceozjPi38=;
 b=DediEOj5cdZ/+bryw122eYCWzra+62i5rcouY9i1dzepes+niEgU0ejrmcBvNgH9v0
 8myqFUZqaQ7l1fDNFgukGlfgx6ffcCvxWg9HLLltFso+JAZ6kdbxIXDdZ/gEN6UrfTE4
 koioRstDKb+j5vSPLQC/CjPTSjRr2oA+FgY6vv3Awr0ZcnUbdJEvr7rRLjyhzQT4GJoe
 clYL7aR1tqD9/oZr4uBWs1u1J+nnz24kQvtKxWHPB3ykrodz1k1UYTVYBXo/NhEzgVhM
 ApybsfWG2cYXF2hxp/sfKxOx80o7uz3glAdhYweChQSh3fs0VHoZwdQj0rIKSxAvw9pR
 izQg==
X-Gm-Message-State: ACgBeo1Z6qdY+JutW1+U3IGNw3nvuGn4NQBP7CaQ7h1M5G0k8natre2a
 wSWTEYwh6hKirxqIjXt2mdTnHrC9rEoEil/OnnI8ES6Y+TQ=
X-Google-Smtp-Source: AA6agR6lEKw6ZuU+vQoUF7wzY82Ac6bYdwLllwyeMhz8EG3/CRQZZu7sycE6R/W8XIwn0GcGzsoIXIB74ZY6OvOhXj0=
X-Received: by 2002:a05:6512:3a93:b0:48a:fbd4:1d89 with SMTP id
 q19-20020a0565123a9300b0048afbd41d89mr1134332lfu.473.1660832673551; Thu, 18
 Aug 2022 07:24:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220815211516.3169470-1-robdclark@gmail.com>
 <20220815211516.3169470-2-robdclark@gmail.com>
 <327c77d5-5812-a158-6c9f-c68e15a5a6b4@amd.com>
 <CAF6AEGu3oxM+EX_FsLpw4m0KouMyFMLN=AGGbf=6TVQGkJ7jQg@mail.gmail.com>
 <6396ccf9-a677-427d-f5f9-12d30ad2197e@amd.com>
 <CAF6AEGsbc9PuSOyvhnr0ALQiLY9gSBySHyisEOfteZq9NXN0VA@mail.gmail.com>
 <8afce42b-db0e-9f71-7cd7-2680b6c9a1c9@amd.com>
 <CAF6AEGvBhx9ZFBzb8dUymhN99HPq7eTyGwVH-Uk9GQr1QjWN+Q@mail.gmail.com>
 <973682df-b2e5-020c-98e9-96ec9af214d5@amd.com>
In-Reply-To: <973682df-b2e5-020c-98e9-96ec9af214d5@amd.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 18 Aug 2022 07:25:05 -0700
Message-ID: <CAF6AEGtVMAzqECSTUFX1Zmb8BOLiq-n04nizO22J2ENcGTgQBQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dma-buf: Add ioctl to query mmap coherency/cache
 info
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 freedreno@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 18, 2022 at 4:21 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 17.08.22 um 15:44 schrieb Rob Clark:
> > On Wed, Aug 17, 2022 at 2:57 AM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> >> [SNIP]
> >>
> >> The resulting cache attrs from combination of S1 and S2 translation
> >> can differ.  So ideally we setup the S2 pgtables in guest aligned with
> >> host userspace mappings
> >> Well exactly that is not very convincing.
> >>
> >> What you want to do is to use one channel for the address and a
> >> different one for the cache attrs, that's not something I would
> >> recommend doing in general.
> > How would that work.. mmap() is the channel for the address, we'd need
> > to introduce a new syscall that returned additional information?
>
> The channel for the address is not mmap(), but rather the page faults.
> mmap() is just the function setting up that channel.
>
> The page faults then insert both the address as well as the caching
> attributes (at least on x86).

This is true on arm64 as well, but only in the S1 tables (which I
would have to assume is the case on x86 as well)

> That we then need to forward the caching attributes manually once more
> seems really misplaced.
>
> >> Instead the client pgtables should be setup in a way so that host can
> >> overwrite them.
> > How?  That is completely not how VMs work.  Even if the host knew
> > where the pgtables were and somehow magically knew the various guest
> > userspace VAs, it would be racey.
>
> Well you mentioned that the client page tables can be setup in a way
> that the host page tables determine what caching to use. As far as I can
> see this is what we should use here.

On arm64/aarch64, they *can*.. but the system (on some versions of
armv8) can also be configured to let S2 determine the attributes.  And
apparently there are benefits to this (avoids unnecessary cache
flushing in the host, AFAIU.)  This is the case where we need this new
api.

IMO it is fine for the exporter to return a value indicating that the
attributes change dynamically or that S1 attributes must somehow be
used by the hw.  This would at least let the VMM return an error in
cases where S1 attrs cannot be relied on.  But there are enough
exporters where the cache attrs are static for the life of the buffer.
So even if you need to return DMA_BUF_MAP_I_DONT_KNOW, maybe that is
fine (if x86 can always rely on S1 attrs), or at least will let the
VMM return an error rather than just blindly assuming things will
work.

But it makes no sense to reject the whole idea just because of some
exporters (which may not even need this).  There is always room to let
them return a map-info value that describes the situation or
limitations to the VMM.

BR,
-R

> Regards,
> Christian.
>
> >
> > BR,
> > -R
> >
> >> Regards,
> >> Christian.
> >>
> >>> BR,
> >>> -R
> >>>
> >>>> Regards,
> >>>> Christian.
> >>>>
> >>>>> BR,
> >>>>> -R
> >>>>>
> >>>>>> If the hardware can't use the caching information from the host CP=
U page
> >>>>>> tables directly then that pretty much completely breaks the concep=
t that
> >>>>>> the exporter is responsible for setting up those page tables.
> >>>>>>
> >>>>>> Regards,
> >>>>>> Christian.
> >>>>>>
> >>>>>>>      drivers/dma-buf/dma-buf.c    | 63 ++++++++++++++++++++++++++=
+------
> >>>>>>>      include/linux/dma-buf.h      | 11 ++++++
> >>>>>>>      include/uapi/linux/dma-buf.h | 68 ++++++++++++++++++++++++++=
++++++++++
> >>>>>>>      3 files changed, 132 insertions(+), 10 deletions(-)
> >>>>>>>
> >>>>>>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.=
c
> >>>>>>> index 32f55640890c..262c4706f721 100644
> >>>>>>> --- a/drivers/dma-buf/dma-buf.c
> >>>>>>> +++ b/drivers/dma-buf/dma-buf.c
> >>>>>>> @@ -125,6 +125,32 @@ static struct file_system_type dma_buf_fs_ty=
pe =3D {
> >>>>>>>          .kill_sb =3D kill_anon_super,
> >>>>>>>      };
> >>>>>>>
> >>>>>>> +static int __dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area=
_struct *vma)
> >>>>>>> +{
> >>>>>>> +     int ret;
> >>>>>>> +
> >>>>>>> +     /* check if buffer supports mmap */
> >>>>>>> +     if (!dmabuf->ops->mmap)
> >>>>>>> +             return -EINVAL;
> >>>>>>> +
> >>>>>>> +     ret =3D dmabuf->ops->mmap(dmabuf, vma);
> >>>>>>> +
> >>>>>>> +     /*
> >>>>>>> +      * If the exporter claims to support coherent access, ensur=
e the
> >>>>>>> +      * pgprot flags match the claim.
> >>>>>>> +      */
> >>>>>>> +     if ((dmabuf->map_info !=3D DMA_BUF_MAP_INCOHERENT) && !ret)=
 {
> >>>>>>> +             pgprot_t wc_prot =3D pgprot_writecombine(vma->vm_pa=
ge_prot);
> >>>>>>> +             if (dmabuf->map_info =3D=3D DMA_BUF_COHERENT_WC) {
> >>>>>>> +                     WARN_ON_ONCE(pgprot_val(vma->vm_page_prot) =
!=3D pgprot_val(wc_prot));
> >>>>>>> +             } else {
> >>>>>>> +                     WARN_ON_ONCE(pgprot_val(vma->vm_page_prot) =
=3D=3D pgprot_val(wc_prot));
> >>>>>>> +             }
> >>>>>>> +     }
> >>>>>>> +
> >>>>>>> +     return ret;
> >>>>>>> +}
> >>>>>>> +
> >>>>>>>      static int dma_buf_mmap_internal(struct file *file, struct v=
m_area_struct *vma)
> >>>>>>>      {
> >>>>>>>          struct dma_buf *dmabuf;
> >>>>>>> @@ -134,16 +160,12 @@ static int dma_buf_mmap_internal(struct fil=
e *file, struct vm_area_struct *vma)
> >>>>>>>
> >>>>>>>          dmabuf =3D file->private_data;
> >>>>>>>
> >>>>>>> -     /* check if buffer supports mmap */
> >>>>>>> -     if (!dmabuf->ops->mmap)
> >>>>>>> -             return -EINVAL;
> >>>>>>> -
> >>>>>>>          /* check for overflowing the buffer's size */
> >>>>>>>          if (vma->vm_pgoff + vma_pages(vma) >
> >>>>>>>              dmabuf->size >> PAGE_SHIFT)
> >>>>>>>                  return -EINVAL;
> >>>>>>>
> >>>>>>> -     return dmabuf->ops->mmap(dmabuf, vma);
> >>>>>>> +     return __dma_buf_mmap(dmabuf, vma);
> >>>>>>>      }
> >>>>>>>
> >>>>>>>      static loff_t dma_buf_llseek(struct file *file, loff_t offse=
t, int whence)
> >>>>>>> @@ -326,6 +348,27 @@ static long dma_buf_set_name(struct dma_buf =
*dmabuf, const char __user *buf)
> >>>>>>>          return 0;
> >>>>>>>      }
> >>>>>>>
> >>>>>>> +static long dma_buf_info(struct dma_buf *dmabuf, void __user *ua=
rg)
> >>>>>>> +{
> >>>>>>> +     struct dma_buf_info arg;
> >>>>>>> +
> >>>>>>> +     if (copy_from_user(&arg, uarg, sizeof(arg)))
> >>>>>>> +             return -EFAULT;
> >>>>>>> +
> >>>>>>> +     switch (arg.param) {
> >>>>>>> +     case DMA_BUF_INFO_MAP_INFO:
> >>>>>>> +             arg.value =3D dmabuf->map_info;
> >>>>>>> +             break;
> >>>>>>> +     default:
> >>>>>>> +             return -EINVAL;
> >>>>>>> +     }
> >>>>>>> +
> >>>>>>> +     if (copy_to_user(uarg, &arg, sizeof(arg)))
> >>>>>>> +             return -EFAULT;
> >>>>>>> +
> >>>>>>> +     return 0;
> >>>>>>> +}
> >>>>>>> +
> >>>>>>>      static long dma_buf_ioctl(struct file *file,
> >>>>>>>                            unsigned int cmd, unsigned long arg)
> >>>>>>>      {
> >>>>>>> @@ -369,6 +412,9 @@ static long dma_buf_ioctl(struct file *file,
> >>>>>>>          case DMA_BUF_SET_NAME_B:
> >>>>>>>                  return dma_buf_set_name(dmabuf, (const char __us=
er *)arg);
> >>>>>>>
> >>>>>>> +     case DMA_BUF_IOCTL_INFO:
> >>>>>>> +             return dma_buf_info(dmabuf, (void __user *)arg);
> >>>>>>> +
> >>>>>>>          default:
> >>>>>>>                  return -ENOTTY;
> >>>>>>>          }
> >>>>>>> @@ -530,6 +576,7 @@ struct dma_buf *dma_buf_export(const struct d=
ma_buf_export_info *exp_info)
> >>>>>>>          dmabuf->priv =3D exp_info->priv;
> >>>>>>>          dmabuf->ops =3D exp_info->ops;
> >>>>>>>          dmabuf->size =3D exp_info->size;
> >>>>>>> +     dmabuf->map_info =3D exp_info->map_info;
> >>>>>>>          dmabuf->exp_name =3D exp_info->exp_name;
> >>>>>>>          dmabuf->owner =3D exp_info->owner;
> >>>>>>>          spin_lock_init(&dmabuf->name_lock);
> >>>>>>> @@ -1245,10 +1292,6 @@ int dma_buf_mmap(struct dma_buf *dmabuf, s=
truct vm_area_struct *vma,
> >>>>>>>          if (WARN_ON(!dmabuf || !vma))
> >>>>>>>                  return -EINVAL;
> >>>>>>>
> >>>>>>> -     /* check if buffer supports mmap */
> >>>>>>> -     if (!dmabuf->ops->mmap)
> >>>>>>> -             return -EINVAL;
> >>>>>>> -
> >>>>>>>          /* check for offset overflow */
> >>>>>>>          if (pgoff + vma_pages(vma) < pgoff)
> >>>>>>>                  return -EOVERFLOW;
> >>>>>>> @@ -1262,7 +1305,7 @@ int dma_buf_mmap(struct dma_buf *dmabuf, st=
ruct vm_area_struct *vma,
> >>>>>>>          vma_set_file(vma, dmabuf->file);
> >>>>>>>          vma->vm_pgoff =3D pgoff;
> >>>>>>>
> >>>>>>> -     return dmabuf->ops->mmap(dmabuf, vma);
> >>>>>>> +     return __dma_buf_mmap(dmabuf, vma);
> >>>>>>>      }
> >>>>>>>      EXPORT_SYMBOL_NS_GPL(dma_buf_mmap, DMA_BUF);
> >>>>>>>
> >>>>>>> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> >>>>>>> index 71731796c8c3..37923c8d5c24 100644
> >>>>>>> --- a/include/linux/dma-buf.h
> >>>>>>> +++ b/include/linux/dma-buf.h
> >>>>>>> @@ -23,6 +23,8 @@
> >>>>>>>      #include <linux/dma-fence.h>
> >>>>>>>      #include <linux/wait.h>
> >>>>>>>
> >>>>>>> +#include <uapi/linux/dma-buf.h>
> >>>>>>> +
> >>>>>>>      struct device;
> >>>>>>>      struct dma_buf;
> >>>>>>>      struct dma_buf_attachment;
> >>>>>>> @@ -307,6 +309,13 @@ struct dma_buf {
> >>>>>>>           */
> >>>>>>>          size_t size;
> >>>>>>>
> >>>>>>> +     /**
> >>>>>>> +      * @map_info:
> >>>>>>> +      *
> >>>>>>> +      * CPU mapping/coherency information for the buffer.
> >>>>>>> +      */
> >>>>>>> +     enum dma_buf_map_info map_info;
> >>>>>>> +
> >>>>>>>          /**
> >>>>>>>           * @file:
> >>>>>>>           *
> >>>>>>> @@ -533,6 +542,7 @@ struct dma_buf_attachment {
> >>>>>>>       * @ops:    Attach allocator-defined dma buf ops to the new =
buffer
> >>>>>>>       * @size:   Size of the buffer - invariant over the lifetime=
 of the buffer
> >>>>>>>       * @flags:  mode flags for the file
> >>>>>>> + * @map_info:        CPU mapping/coherency information for the b=
uffer
> >>>>>>>       * @resv:   reservation-object, NULL to allocate default one
> >>>>>>>       * @priv:   Attach private data of allocator to this buffer
> >>>>>>>       *
> >>>>>>> @@ -545,6 +555,7 @@ struct dma_buf_export_info {
> >>>>>>>          const struct dma_buf_ops *ops;
> >>>>>>>          size_t size;
> >>>>>>>          int flags;
> >>>>>>> +     enum dma_buf_map_info map_info;
> >>>>>>>          struct dma_resv *resv;
> >>>>>>>          void *priv;
> >>>>>>>      };
> >>>>>>> diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dm=
a-buf.h
> >>>>>>> index b1523cb8ab30..07b403ffdb43 100644
> >>>>>>> --- a/include/uapi/linux/dma-buf.h
> >>>>>>> +++ b/include/uapi/linux/dma-buf.h
> >>>>>>> @@ -85,6 +85,72 @@ struct dma_buf_sync {
> >>>>>>>
> >>>>>>>      #define DMA_BUF_NAME_LEN    32
> >>>>>>>
> >>>>>>> +/**
> >>>>>>> + * enum dma_buf_map_info - CPU mapping info
> >>>>>>> + *
> >>>>>>> + * This enum describes coherency of a userspace mapping of the d=
mabuf.
> >>>>>>> + *
> >>>>>>> + * Importing devices should check dma_buf::map_info flag and rej=
ect an
> >>>>>>> + * import if unsupported.  For example, if the exporting device =
uses
> >>>>>>> + * @DMA_BUF_COHERENT_CACHED but the importing device does not su=
pport
> >>>>>>> + * CPU cache coherency, the dma-buf import should fail.
> >>>>>>> + */
> >>>>>>> +enum dma_buf_map_info {
> >>>>>>> +     /**
> >>>>>>> +      * @DMA_BUF_MAP_INCOHERENT: CPU mapping is incoherent.
> >>>>>>> +      *
> >>>>>>> +      * Use of DMA_BUF_IOCTL_SYNC is required for CPU managed co=
herenency.
> >>>>>>> +      */
> >>>>>>> +     DMA_BUF_MAP_INCOHERENT,
> >>>>>>> +
> >>>>>>> +     /**
> >>>>>>> +      * @DMA_BUF_COHERENT_WC: CPU mapping is coherent but not ca=
ched.
> >>>>>>> +      *
> >>>>>>> +      * A cpu mmap'ing is coherent, and DMA_BUF_IOCTL_SYNC is no=
t required.
> >>>>>>> +      * However fences may be still required for synchronizing a=
ccess.  Ie.
> >>>>>>> +      * coherency can only be relied upon by an explicit-fencing=
 userspace.
> >>>>>>> +      * An implicit-sync userspace must still use DMA_BUF_IOCTL_=
SYNC.
> >>>>>>> +      *
> >>>>>>> +      * The cpu mapping is writecombine.
> >>>>>>> +      */
> >>>>>>> +     DMA_BUF_COHERENT_WC,
> >>>>>>> +
> >>>>>>> +     /**
> >>>>>>> +      * @DMA_BUF_COHERENT_CACHED: CPU mapping is coherent and CP=
U cached.
> >>>>>>> +      *
> >>>>>>> +      * A cpu mmap'ing is coherent, and DMA_BUF_IOCTL_SYNC is no=
t required.
> >>>>>>> +      * However fences may be still required for synchronizing a=
ccess.  Ie.
> >>>>>>> +      * coherency can only be relied upon by an explicit-fencing=
 userspace.
> >>>>>>> +      * An implicit-sync userspace must still use DMA_BUF_IOCTL_=
SYNC.
> >>>>>>> +      *
> >>>>>>> +      * The cpu mapping is cached.
> >>>>>>> +      */
> >>>>>>> +     DMA_BUF_COHERENT_CACHED,
> >>>>>>> +};
> >>>>>>> +
> >>>>>>> +/**
> >>>>>>> + * struct dma_buf_info - Query info about the buffer.
> >>>>>>> + */
> >>>>>>> +struct dma_buf_info {
> >>>>>>> +
> >>>>>>> +#define DMA_BUF_INFO_MAP_INFO    1
> >>>>>>> +
> >>>>>>> +     /**
> >>>>>>> +      * @param: Which param to query
> >>>>>>> +      *
> >>>>>>> +      * DMA_BUF_INFO_MAP_INFO:
> >>>>>>> +      *     Returns enum dma_buf_map_info, describing the cohere=
ncy and
> >>>>>>> +      *     caching of a CPU mapping of the buffer.
> >>>>>>> +      */
> >>>>>>> +     __u32 param;
> >>>>>>> +     __u32 pad;
> >>>>>>> +
> >>>>>>> +     /**
> >>>>>>> +      * @value: Return value of the query.
> >>>>>>> +      */
> >>>>>>> +     __u64 value;
> >>>>>>> +};
> >>>>>>> +
> >>>>>>>      #define DMA_BUF_BASE                'b'
> >>>>>>>      #define DMA_BUF_IOCTL_SYNC  _IOW(DMA_BUF_BASE, 0, struct dma=
_buf_sync)
> >>>>>>>
> >>>>>>> @@ -95,4 +161,6 @@ struct dma_buf_sync {
> >>>>>>>      #define DMA_BUF_SET_NAME_A  _IOW(DMA_BUF_BASE, 1, __u32)
> >>>>>>>      #define DMA_BUF_SET_NAME_B  _IOW(DMA_BUF_BASE, 1, __u64)
> >>>>>>>
> >>>>>>> +#define DMA_BUF_IOCTL_INFO   _IOWR(DMA_BUF_BASE, 2, struct dma_b=
uf_info)
> >>>>>>> +
> >>>>>>>      #endif
>
