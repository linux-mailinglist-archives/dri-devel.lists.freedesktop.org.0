Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6F45986B4
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 17:03:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA115974D1;
	Thu, 18 Aug 2022 15:02:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 533A8BA6C1;
 Thu, 18 Aug 2022 15:02:08 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id m3so1768966ljp.8;
 Thu, 18 Aug 2022 08:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=plKduJf09QedWbZ3B9EXfzdWYbcPX8FJC1RiK7AZ2oI=;
 b=e0IG2YmDRqYJLmJHZFE/p4HJTQEMRSgeXhdNu/If4gBR2tfd6nDSmL0ZI1AoOMqYjK
 +hHM4cdW7C+Nsx1fmhXVICqutPQLyVUL7leTv7DbSwcqhaCsWEueTMwJaEX6T4BUcG0/
 CCMYM1bBVY+gEy43vSjvT3FQviXFGcrdWk3GZOC2yQ7awzp/R1b1zkBwuZow7xY3wQPx
 snhq1/4x+5IFBh1sidkMwfsyJJk9PQBSCkOQDcx7YsNQK+xm/yj5l5N89JmD6ElIWN/Z
 m7HNAlscg6IisLW3Dl8bfYyX9G3Gz9eGd5zJ90WvD4iW+5SN91RZGaUJGnWGFjx1k/Um
 La2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=plKduJf09QedWbZ3B9EXfzdWYbcPX8FJC1RiK7AZ2oI=;
 b=IyB4qSFuUhH1w+9s83wUdiLum+mNlnWxKlDg/0VqcOQIT/ETjANoqb7UA9JuR5olui
 /4jYN6Aqhc8V0raG3fI8y80j2BdEn8xV7ohcHbSpQqaR1Cm8Yvivze9CCQP2quuqOAG1
 Ri8FDR0QstlMh1hXWAzvEgf+hObzSgo31kY98uSqry3sPg/2RWeN/m6JUR7VrPNhdVuQ
 /wHezyInk/juAuibvvskXK+t5vFuhQwvMvzMBsxlo+z5xjEL8tvo775hDt+nh4dnwRkZ
 U2yxkONYXdXDWHQj05MLWRU2sMhJ3pvDZ/wUXJlajv//593FNr65CBtjhthCTU3wKuzr
 GfgA==
X-Gm-Message-State: ACgBeo1h9XtPWmM2iEu1pbt+f2mlc+C2meQkHjxNY072oz+YAcc9j9cP
 gZu7XhzQCq3q0/L4OZ0tMV9QNE+bGhzoLGfFYSk=
X-Google-Smtp-Source: AA6agR4IvymzL1J7shS6xNnghewFAJlJVkP2QmKmjQvXcWqWA1TA+u5zgdcb95Qwk9jvjaInIAx2grhcQ1pNPMzO3qw=
X-Received: by 2002:a2e:9b58:0:b0:261:b2c6:2e04 with SMTP id
 o24-20020a2e9b58000000b00261b2c62e04mr896207ljj.134.1660834926047; Thu, 18
 Aug 2022 08:02:06 -0700 (PDT)
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
 <CAF6AEGtVMAzqECSTUFX1Zmb8BOLiq-n04nizO22J2ENcGTgQBQ@mail.gmail.com>
 <1d9da979-7d09-d80b-bc0e-f9641422b962@amd.com>
In-Reply-To: <1d9da979-7d09-d80b-bc0e-f9641422b962@amd.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 18 Aug 2022 08:01:53 -0700
Message-ID: <CAF6AEGv7xYSucyriCkPhibQXs2KBxT5mMW6dMxX_E63xvpKLDA@mail.gmail.com>
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

On Thu, Aug 18, 2022 at 7:54 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 18.08.22 um 16:25 schrieb Rob Clark:
> > On Thu, Aug 18, 2022 at 4:21 AM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> >> Am 17.08.22 um 15:44 schrieb Rob Clark:
> >>> On Wed, Aug 17, 2022 at 2:57 AM Christian K=C3=B6nig
> >>> <christian.koenig@amd.com> wrote:
> >>>> [SNIP]
> >>>>
> >>>> The resulting cache attrs from combination of S1 and S2 translation
> >>>> can differ.  So ideally we setup the S2 pgtables in guest aligned wi=
th
> >>>> host userspace mappings
> >>>> Well exactly that is not very convincing.
> >>>>
> >>>> What you want to do is to use one channel for the address and a
> >>>> different one for the cache attrs, that's not something I would
> >>>> recommend doing in general.
> >>> How would that work.. mmap() is the channel for the address, we'd nee=
d
> >>> to introduce a new syscall that returned additional information?
> >> The channel for the address is not mmap(), but rather the page faults.
> >> mmap() is just the function setting up that channel.
> >>
> >> The page faults then insert both the address as well as the caching
> >> attributes (at least on x86).
> > This is true on arm64 as well, but only in the S1 tables (which I
> > would have to assume is the case on x86 as well)
> >
> >> That we then need to forward the caching attributes manually once more
> >> seems really misplaced.
> >>
> >>>> Instead the client pgtables should be setup in a way so that host ca=
n
> >>>> overwrite them.
> >>> How?  That is completely not how VMs work.  Even if the host knew
> >>> where the pgtables were and somehow magically knew the various guest
> >>> userspace VAs, it would be racey.
> >> Well you mentioned that the client page tables can be setup in a way
> >> that the host page tables determine what caching to use. As far as I c=
an
> >> see this is what we should use here.
> > On arm64/aarch64, they *can*.. but the system (on some versions of
> > armv8) can also be configured to let S2 determine the attributes.  And
> > apparently there are benefits to this (avoids unnecessary cache
> > flushing in the host, AFAIU.)  This is the case where we need this new
> > api.
> >
> > IMO it is fine for the exporter to return a value indicating that the
> > attributes change dynamically or that S1 attributes must somehow be
> > used by the hw.  This would at least let the VMM return an error in
> > cases where S1 attrs cannot be relied on.  But there are enough
> > exporters where the cache attrs are static for the life of the buffer.
> > So even if you need to return DMA_BUF_MAP_I_DONT_KNOW, maybe that is
> > fine (if x86 can always rely on S1 attrs), or at least will let the
> > VMM return an error rather than just blindly assuming things will
> > work.
> >
> > But it makes no sense to reject the whole idea just because of some
> > exporters (which may not even need this).  There is always room to let
> > them return a map-info value that describes the situation or
> > limitations to the VMM.
>
> Well it does make sense as far as I can see.
>
> This is a very specific workaround for a platform problem which only
> matters there, but increases complexity for everybody.

I'm not sure how this adds complexity for everybody.. or at least the
intention was the default value for the new enum is the same as
current status-quo, so no need to plumb something thru every single
exporter.

BR,
-R

> If we don't have any other choice on the problem to work around that I
> would say ok we add an ARM specific workaround.
>
> But as long as that's not the case the whole idea is pretty clearly a
> NAK from my side.
>
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
> >>>>>> Regards,
> >>>>>> Christian.
> >>>>>>
> >>>>>>> BR,
> >>>>>>> -R
> >>>>>>>
> >>>>>>>> If the hardware can't use the caching information from the host =
CPU page
> >>>>>>>> tables directly then that pretty much completely breaks the conc=
ept that
> >>>>>>>> the exporter is responsible for setting up those page tables.
> >>>>>>>>
> >>>>>>>> Regards,
> >>>>>>>> Christian.
> >>>>>>>>
> >>>>>>>>>       drivers/dma-buf/dma-buf.c    | 63 +++++++++++++++++++++++=
++++------
> >>>>>>>>>       include/linux/dma-buf.h      | 11 ++++++
> >>>>>>>>>       include/uapi/linux/dma-buf.h | 68 +++++++++++++++++++++++=
+++++++++++++
> >>>>>>>>>       3 files changed, 132 insertions(+), 10 deletions(-)
> >>>>>>>>>
> >>>>>>>>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-bu=
f.c
> >>>>>>>>> index 32f55640890c..262c4706f721 100644
> >>>>>>>>> --- a/drivers/dma-buf/dma-buf.c
> >>>>>>>>> +++ b/drivers/dma-buf/dma-buf.c
> >>>>>>>>> @@ -125,6 +125,32 @@ static struct file_system_type dma_buf_fs_=
type =3D {
> >>>>>>>>>           .kill_sb =3D kill_anon_super,
> >>>>>>>>>       };
> >>>>>>>>>
> >>>>>>>>> +static int __dma_buf_mmap(struct dma_buf *dmabuf, struct vm_ar=
ea_struct *vma)
> >>>>>>>>> +{
> >>>>>>>>> +     int ret;
> >>>>>>>>> +
> >>>>>>>>> +     /* check if buffer supports mmap */
> >>>>>>>>> +     if (!dmabuf->ops->mmap)
> >>>>>>>>> +             return -EINVAL;
> >>>>>>>>> +
> >>>>>>>>> +     ret =3D dmabuf->ops->mmap(dmabuf, vma);
> >>>>>>>>> +
> >>>>>>>>> +     /*
> >>>>>>>>> +      * If the exporter claims to support coherent access, ens=
ure the
> >>>>>>>>> +      * pgprot flags match the claim.
> >>>>>>>>> +      */
> >>>>>>>>> +     if ((dmabuf->map_info !=3D DMA_BUF_MAP_INCOHERENT) && !re=
t) {
> >>>>>>>>> +             pgprot_t wc_prot =3D pgprot_writecombine(vma->vm_=
page_prot);
> >>>>>>>>> +             if (dmabuf->map_info =3D=3D DMA_BUF_COHERENT_WC) =
{
> >>>>>>>>> +                     WARN_ON_ONCE(pgprot_val(vma->vm_page_prot=
) !=3D pgprot_val(wc_prot));
> >>>>>>>>> +             } else {
> >>>>>>>>> +                     WARN_ON_ONCE(pgprot_val(vma->vm_page_prot=
) =3D=3D pgprot_val(wc_prot));
> >>>>>>>>> +             }
> >>>>>>>>> +     }
> >>>>>>>>> +
> >>>>>>>>> +     return ret;
> >>>>>>>>> +}
> >>>>>>>>> +
> >>>>>>>>>       static int dma_buf_mmap_internal(struct file *file, struc=
t vm_area_struct *vma)
> >>>>>>>>>       {
> >>>>>>>>>           struct dma_buf *dmabuf;
> >>>>>>>>> @@ -134,16 +160,12 @@ static int dma_buf_mmap_internal(struct f=
ile *file, struct vm_area_struct *vma)
> >>>>>>>>>
> >>>>>>>>>           dmabuf =3D file->private_data;
> >>>>>>>>>
> >>>>>>>>> -     /* check if buffer supports mmap */
> >>>>>>>>> -     if (!dmabuf->ops->mmap)
> >>>>>>>>> -             return -EINVAL;
> >>>>>>>>> -
> >>>>>>>>>           /* check for overflowing the buffer's size */
> >>>>>>>>>           if (vma->vm_pgoff + vma_pages(vma) >
> >>>>>>>>>               dmabuf->size >> PAGE_SHIFT)
> >>>>>>>>>                   return -EINVAL;
> >>>>>>>>>
> >>>>>>>>> -     return dmabuf->ops->mmap(dmabuf, vma);
> >>>>>>>>> +     return __dma_buf_mmap(dmabuf, vma);
> >>>>>>>>>       }
> >>>>>>>>>
> >>>>>>>>>       static loff_t dma_buf_llseek(struct file *file, loff_t of=
fset, int whence)
> >>>>>>>>> @@ -326,6 +348,27 @@ static long dma_buf_set_name(struct dma_bu=
f *dmabuf, const char __user *buf)
> >>>>>>>>>           return 0;
> >>>>>>>>>       }
> >>>>>>>>>
> >>>>>>>>> +static long dma_buf_info(struct dma_buf *dmabuf, void __user *=
uarg)
> >>>>>>>>> +{
> >>>>>>>>> +     struct dma_buf_info arg;
> >>>>>>>>> +
> >>>>>>>>> +     if (copy_from_user(&arg, uarg, sizeof(arg)))
> >>>>>>>>> +             return -EFAULT;
> >>>>>>>>> +
> >>>>>>>>> +     switch (arg.param) {
> >>>>>>>>> +     case DMA_BUF_INFO_MAP_INFO:
> >>>>>>>>> +             arg.value =3D dmabuf->map_info;
> >>>>>>>>> +             break;
> >>>>>>>>> +     default:
> >>>>>>>>> +             return -EINVAL;
> >>>>>>>>> +     }
> >>>>>>>>> +
> >>>>>>>>> +     if (copy_to_user(uarg, &arg, sizeof(arg)))
> >>>>>>>>> +             return -EFAULT;
> >>>>>>>>> +
> >>>>>>>>> +     return 0;
> >>>>>>>>> +}
> >>>>>>>>> +
> >>>>>>>>>       static long dma_buf_ioctl(struct file *file,
> >>>>>>>>>                             unsigned int cmd, unsigned long arg=
)
> >>>>>>>>>       {
> >>>>>>>>> @@ -369,6 +412,9 @@ static long dma_buf_ioctl(struct file *file=
,
> >>>>>>>>>           case DMA_BUF_SET_NAME_B:
> >>>>>>>>>                   return dma_buf_set_name(dmabuf, (const char _=
_user *)arg);
> >>>>>>>>>
> >>>>>>>>> +     case DMA_BUF_IOCTL_INFO:
> >>>>>>>>> +             return dma_buf_info(dmabuf, (void __user *)arg);
> >>>>>>>>> +
> >>>>>>>>>           default:
> >>>>>>>>>                   return -ENOTTY;
> >>>>>>>>>           }
> >>>>>>>>> @@ -530,6 +576,7 @@ struct dma_buf *dma_buf_export(const struct=
 dma_buf_export_info *exp_info)
> >>>>>>>>>           dmabuf->priv =3D exp_info->priv;
> >>>>>>>>>           dmabuf->ops =3D exp_info->ops;
> >>>>>>>>>           dmabuf->size =3D exp_info->size;
> >>>>>>>>> +     dmabuf->map_info =3D exp_info->map_info;
> >>>>>>>>>           dmabuf->exp_name =3D exp_info->exp_name;
> >>>>>>>>>           dmabuf->owner =3D exp_info->owner;
> >>>>>>>>>           spin_lock_init(&dmabuf->name_lock);
> >>>>>>>>> @@ -1245,10 +1292,6 @@ int dma_buf_mmap(struct dma_buf *dmabuf,=
 struct vm_area_struct *vma,
> >>>>>>>>>           if (WARN_ON(!dmabuf || !vma))
> >>>>>>>>>                   return -EINVAL;
> >>>>>>>>>
> >>>>>>>>> -     /* check if buffer supports mmap */
> >>>>>>>>> -     if (!dmabuf->ops->mmap)
> >>>>>>>>> -             return -EINVAL;
> >>>>>>>>> -
> >>>>>>>>>           /* check for offset overflow */
> >>>>>>>>>           if (pgoff + vma_pages(vma) < pgoff)
> >>>>>>>>>                   return -EOVERFLOW;
> >>>>>>>>> @@ -1262,7 +1305,7 @@ int dma_buf_mmap(struct dma_buf *dmabuf, =
struct vm_area_struct *vma,
> >>>>>>>>>           vma_set_file(vma, dmabuf->file);
> >>>>>>>>>           vma->vm_pgoff =3D pgoff;
> >>>>>>>>>
> >>>>>>>>> -     return dmabuf->ops->mmap(dmabuf, vma);
> >>>>>>>>> +     return __dma_buf_mmap(dmabuf, vma);
> >>>>>>>>>       }
> >>>>>>>>>       EXPORT_SYMBOL_NS_GPL(dma_buf_mmap, DMA_BUF);
> >>>>>>>>>
> >>>>>>>>> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> >>>>>>>>> index 71731796c8c3..37923c8d5c24 100644
> >>>>>>>>> --- a/include/linux/dma-buf.h
> >>>>>>>>> +++ b/include/linux/dma-buf.h
> >>>>>>>>> @@ -23,6 +23,8 @@
> >>>>>>>>>       #include <linux/dma-fence.h>
> >>>>>>>>>       #include <linux/wait.h>
> >>>>>>>>>
> >>>>>>>>> +#include <uapi/linux/dma-buf.h>
> >>>>>>>>> +
> >>>>>>>>>       struct device;
> >>>>>>>>>       struct dma_buf;
> >>>>>>>>>       struct dma_buf_attachment;
> >>>>>>>>> @@ -307,6 +309,13 @@ struct dma_buf {
> >>>>>>>>>            */
> >>>>>>>>>           size_t size;
> >>>>>>>>>
> >>>>>>>>> +     /**
> >>>>>>>>> +      * @map_info:
> >>>>>>>>> +      *
> >>>>>>>>> +      * CPU mapping/coherency information for the buffer.
> >>>>>>>>> +      */
> >>>>>>>>> +     enum dma_buf_map_info map_info;
> >>>>>>>>> +
> >>>>>>>>>           /**
> >>>>>>>>>            * @file:
> >>>>>>>>>            *
> >>>>>>>>> @@ -533,6 +542,7 @@ struct dma_buf_attachment {
> >>>>>>>>>        * @ops:    Attach allocator-defined dma buf ops to the n=
ew buffer
> >>>>>>>>>        * @size:   Size of the buffer - invariant over the lifet=
ime of the buffer
> >>>>>>>>>        * @flags:  mode flags for the file
> >>>>>>>>> + * @map_info:        CPU mapping/coherency information for the=
 buffer
> >>>>>>>>>        * @resv:   reservation-object, NULL to allocate default =
one
> >>>>>>>>>        * @priv:   Attach private data of allocator to this buff=
er
> >>>>>>>>>        *
> >>>>>>>>> @@ -545,6 +555,7 @@ struct dma_buf_export_info {
> >>>>>>>>>           const struct dma_buf_ops *ops;
> >>>>>>>>>           size_t size;
> >>>>>>>>>           int flags;
> >>>>>>>>> +     enum dma_buf_map_info map_info;
> >>>>>>>>>           struct dma_resv *resv;
> >>>>>>>>>           void *priv;
> >>>>>>>>>       };
> >>>>>>>>> diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/=
dma-buf.h
> >>>>>>>>> index b1523cb8ab30..07b403ffdb43 100644
> >>>>>>>>> --- a/include/uapi/linux/dma-buf.h
> >>>>>>>>> +++ b/include/uapi/linux/dma-buf.h
> >>>>>>>>> @@ -85,6 +85,72 @@ struct dma_buf_sync {
> >>>>>>>>>
> >>>>>>>>>       #define DMA_BUF_NAME_LEN    32
> >>>>>>>>>
> >>>>>>>>> +/**
> >>>>>>>>> + * enum dma_buf_map_info - CPU mapping info
> >>>>>>>>> + *
> >>>>>>>>> + * This enum describes coherency of a userspace mapping of the=
 dmabuf.
> >>>>>>>>> + *
> >>>>>>>>> + * Importing devices should check dma_buf::map_info flag and r=
eject an
> >>>>>>>>> + * import if unsupported.  For example, if the exporting devic=
e uses
> >>>>>>>>> + * @DMA_BUF_COHERENT_CACHED but the importing device does not =
support
> >>>>>>>>> + * CPU cache coherency, the dma-buf import should fail.
> >>>>>>>>> + */
> >>>>>>>>> +enum dma_buf_map_info {
> >>>>>>>>> +     /**
> >>>>>>>>> +      * @DMA_BUF_MAP_INCOHERENT: CPU mapping is incoherent.
> >>>>>>>>> +      *
> >>>>>>>>> +      * Use of DMA_BUF_IOCTL_SYNC is required for CPU managed =
coherenency.
> >>>>>>>>> +      */
> >>>>>>>>> +     DMA_BUF_MAP_INCOHERENT,
> >>>>>>>>> +
> >>>>>>>>> +     /**
> >>>>>>>>> +      * @DMA_BUF_COHERENT_WC: CPU mapping is coherent but not =
cached.
> >>>>>>>>> +      *
> >>>>>>>>> +      * A cpu mmap'ing is coherent, and DMA_BUF_IOCTL_SYNC is =
not required.
> >>>>>>>>> +      * However fences may be still required for synchronizing=
 access.  Ie.
> >>>>>>>>> +      * coherency can only be relied upon by an explicit-fenci=
ng userspace.
> >>>>>>>>> +      * An implicit-sync userspace must still use DMA_BUF_IOCT=
L_SYNC.
> >>>>>>>>> +      *
> >>>>>>>>> +      * The cpu mapping is writecombine.
> >>>>>>>>> +      */
> >>>>>>>>> +     DMA_BUF_COHERENT_WC,
> >>>>>>>>> +
> >>>>>>>>> +     /**
> >>>>>>>>> +      * @DMA_BUF_COHERENT_CACHED: CPU mapping is coherent and =
CPU cached.
> >>>>>>>>> +      *
> >>>>>>>>> +      * A cpu mmap'ing is coherent, and DMA_BUF_IOCTL_SYNC is =
not required.
> >>>>>>>>> +      * However fences may be still required for synchronizing=
 access.  Ie.
> >>>>>>>>> +      * coherency can only be relied upon by an explicit-fenci=
ng userspace.
> >>>>>>>>> +      * An implicit-sync userspace must still use DMA_BUF_IOCT=
L_SYNC.
> >>>>>>>>> +      *
> >>>>>>>>> +      * The cpu mapping is cached.
> >>>>>>>>> +      */
> >>>>>>>>> +     DMA_BUF_COHERENT_CACHED,
> >>>>>>>>> +};
> >>>>>>>>> +
> >>>>>>>>> +/**
> >>>>>>>>> + * struct dma_buf_info - Query info about the buffer.
> >>>>>>>>> + */
> >>>>>>>>> +struct dma_buf_info {
> >>>>>>>>> +
> >>>>>>>>> +#define DMA_BUF_INFO_MAP_INFO    1
> >>>>>>>>> +
> >>>>>>>>> +     /**
> >>>>>>>>> +      * @param: Which param to query
> >>>>>>>>> +      *
> >>>>>>>>> +      * DMA_BUF_INFO_MAP_INFO:
> >>>>>>>>> +      *     Returns enum dma_buf_map_info, describing the cohe=
rency and
> >>>>>>>>> +      *     caching of a CPU mapping of the buffer.
> >>>>>>>>> +      */
> >>>>>>>>> +     __u32 param;
> >>>>>>>>> +     __u32 pad;
> >>>>>>>>> +
> >>>>>>>>> +     /**
> >>>>>>>>> +      * @value: Return value of the query.
> >>>>>>>>> +      */
> >>>>>>>>> +     __u64 value;
> >>>>>>>>> +};
> >>>>>>>>> +
> >>>>>>>>>       #define DMA_BUF_BASE                'b'
> >>>>>>>>>       #define DMA_BUF_IOCTL_SYNC  _IOW(DMA_BUF_BASE, 0, struct =
dma_buf_sync)
> >>>>>>>>>
> >>>>>>>>> @@ -95,4 +161,6 @@ struct dma_buf_sync {
> >>>>>>>>>       #define DMA_BUF_SET_NAME_A  _IOW(DMA_BUF_BASE, 1, __u32)
> >>>>>>>>>       #define DMA_BUF_SET_NAME_B  _IOW(DMA_BUF_BASE, 1, __u64)
> >>>>>>>>>
> >>>>>>>>> +#define DMA_BUF_IOCTL_INFO   _IOWR(DMA_BUF_BASE, 2, struct dma=
_buf_info)
> >>>>>>>>> +
> >>>>>>>>>       #endif
>
