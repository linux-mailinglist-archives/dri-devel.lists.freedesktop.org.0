Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 960F05B1405
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 07:24:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C51A210E95D;
	Thu,  8 Sep 2022 05:24:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4657D10E95B;
 Thu,  8 Sep 2022 05:24:08 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-12803ac8113so8273312fac.8; 
 Wed, 07 Sep 2022 22:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=wyFhj1OfH89txgQDD8qoI39mAgLWWFpHpztMTGE9Yvk=;
 b=VpaJ8hBORW9XzjL3shAqQ4RCLxYy1SeN9m96Pmgx0XBoY0uDSVwIDvVCWctnFnjlji
 FhCwIia9bw4yJAyU7XserzfCFIsGGMLTWblRRv/Unc1OWkqqVuod808WIuGKuUvtQHEH
 DvjdaZUZJnO2tUbUT2XOWYfmzvhnDeiuKZdXxbCP7pos9h+DIFkte8OI9M2DuKDiNXSv
 Bu5Y/0xVTHeOXIvg+ZvM9doyeXo1zM+4HltXHJ1rMI5Aj/VdvMySz2zHXI5As55Y3fH5
 FmzQceGhAMWvXH1V0c5NFhuz0eolI3XpmsKMDSyXGitSVG2f49P9gngJQJemRlKt9u4I
 EX/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=wyFhj1OfH89txgQDD8qoI39mAgLWWFpHpztMTGE9Yvk=;
 b=4/jwnzJ3mSmE0CzvCxT0gKtGj8w21gIEyVw8UxGgoiPhfa8faprhERIzcSQudmjbpJ
 Wfz33bq1T13aeoo+U5fCPYbU/gCv/7BtNJW6OUCTmN1LLH+LlViUuNwkZIXlaKlKgzvl
 z5CYW0YM6SHGkC5ZE3YwG1HQsVy6rq1kJg4VStBf48qo5HGoSQjb2xFHbbL+t3WND0e3
 GEqtfOYf6CNAYZNWeQQIYiID+KNiW8aCwBp9QleZfSM533MpXKPwaDsz0NaQTAPTVHEC
 tj6vb2izqxasdjvAw5E6Tw5ucSoSLBEYjTooxSUSTsAEfRXX2B4UB+C43XrTuwzw76HJ
 9F5A==
X-Gm-Message-State: ACgBeo1D1swT+ombcFNatZEa1MqVpxXZv5v00DeAW9ldu0CMeXpwFR58
 A/akch2F5GQOoCVugRUHN5I4gunz97T2yjKM/xk=
X-Google-Smtp-Source: AA6agR4KS0ltU4U42ipL1+DCW65ss+l+HWS4ijitg8vYvgsGHzeixe4Zh6yO0O425wXVBV+mxoKtcZRU46NSukYafto=
X-Received: by 2002:a05:6808:21a0:b0:345:b8ec:636e with SMTP id
 be32-20020a05680821a000b00345b8ec636emr747996oib.38.1662614647107; Wed, 07
 Sep 2022 22:24:07 -0700 (PDT)
MIME-Version: 1.0
References: <327c77d5-5812-a158-6c9f-c68e15a5a6b4@amd.com>
 <CAF6AEGu3oxM+EX_FsLpw4m0KouMyFMLN=AGGbf=6TVQGkJ7jQg@mail.gmail.com>
 <6396ccf9-a677-427d-f5f9-12d30ad2197e@amd.com>
 <CAF6AEGsbc9PuSOyvhnr0ALQiLY9gSBySHyisEOfteZq9NXN0VA@mail.gmail.com>
 <8afce42b-db0e-9f71-7cd7-2680b6c9a1c9@amd.com>
 <CAF6AEGvBhx9ZFBzb8dUymhN99HPq7eTyGwVH-Uk9GQr1QjWN+Q@mail.gmail.com>
 <973682df-b2e5-020c-98e9-96ec9af214d5@amd.com>
 <CAF6AEGtVMAzqECSTUFX1Zmb8BOLiq-n04nizO22J2ENcGTgQBQ@mail.gmail.com>
 <1d9da979-7d09-d80b-bc0e-f9641422b962@amd.com>
 <CAF6AEGv7xYSucyriCkPhibQXs2KBxT5mMW6dMxX_E63xvpKLDA@mail.gmail.com>
 <YxjNEr888ndOnBjI@phenom.ffwll.local>
In-Reply-To: <YxjNEr888ndOnBjI@phenom.ffwll.local>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 7 Sep 2022 22:24:48 -0700
Message-ID: <CAF6AEGsekn5qNo3hGjOE=zeSVf+b+M0tjuZRTWryh+3W8C5O5Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dma-buf: Add ioctl to query mmap coherency/cache
 info
To: Rob Clark <robdclark@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Rob Clark <robdclark@chromium.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jerome.pouiller@silabs.com>, 
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>, 
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 open list <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 7, 2022 at 9:55 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Thu, Aug 18, 2022 at 08:01:53AM -0700, Rob Clark wrote:
> > On Thu, Aug 18, 2022 at 7:54 AM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> > >
> > > Am 18.08.22 um 16:25 schrieb Rob Clark:
> > > > On Thu, Aug 18, 2022 at 4:21 AM Christian K=C3=B6nig
> > > > <christian.koenig@amd.com> wrote:
> > > >> Am 17.08.22 um 15:44 schrieb Rob Clark:
> > > >>> On Wed, Aug 17, 2022 at 2:57 AM Christian K=C3=B6nig
> > > >>> <christian.koenig@amd.com> wrote:
> > > >>>> [SNIP]
> > > >>>>
> > > >>>> The resulting cache attrs from combination of S1 and S2 translat=
ion
> > > >>>> can differ.  So ideally we setup the S2 pgtables in guest aligne=
d with
> > > >>>> host userspace mappings
> > > >>>> Well exactly that is not very convincing.
> > > >>>>
> > > >>>> What you want to do is to use one channel for the address and a
> > > >>>> different one for the cache attrs, that's not something I would
> > > >>>> recommend doing in general.
> > > >>> How would that work.. mmap() is the channel for the address, we'd=
 need
> > > >>> to introduce a new syscall that returned additional information?
> > > >> The channel for the address is not mmap(), but rather the page fau=
lts.
> > > >> mmap() is just the function setting up that channel.
> > > >>
> > > >> The page faults then insert both the address as well as the cachin=
g
> > > >> attributes (at least on x86).
> > > > This is true on arm64 as well, but only in the S1 tables (which I
> > > > would have to assume is the case on x86 as well)
> > > >
> > > >> That we then need to forward the caching attributes manually once =
more
> > > >> seems really misplaced.
> > > >>
> > > >>>> Instead the client pgtables should be setup in a way so that hos=
t can
> > > >>>> overwrite them.
> > > >>> How?  That is completely not how VMs work.  Even if the host knew
> > > >>> where the pgtables were and somehow magically knew the various gu=
est
> > > >>> userspace VAs, it would be racey.
> > > >> Well you mentioned that the client page tables can be setup in a w=
ay
> > > >> that the host page tables determine what caching to use. As far as=
 I can
> > > >> see this is what we should use here.
> > > > On arm64/aarch64, they *can*.. but the system (on some versions of
> > > > armv8) can also be configured to let S2 determine the attributes.  =
And
> > > > apparently there are benefits to this (avoids unnecessary cache
> > > > flushing in the host, AFAIU.)  This is the case where we need this =
new
> > > > api.
> > > >
> > > > IMO it is fine for the exporter to return a value indicating that t=
he
> > > > attributes change dynamically or that S1 attributes must somehow be
> > > > used by the hw.  This would at least let the VMM return an error in
> > > > cases where S1 attrs cannot be relied on.  But there are enough
> > > > exporters where the cache attrs are static for the life of the buff=
er.
> > > > So even if you need to return DMA_BUF_MAP_I_DONT_KNOW, maybe that i=
s
> > > > fine (if x86 can always rely on S1 attrs), or at least will let the
> > > > VMM return an error rather than just blindly assuming things will
> > > > work.
> > > >
> > > > But it makes no sense to reject the whole idea just because of some
> > > > exporters (which may not even need this).  There is always room to =
let
> > > > them return a map-info value that describes the situation or
> > > > limitations to the VMM.
> > >
> > > Well it does make sense as far as I can see.
> > >
> > > This is a very specific workaround for a platform problem which only
> > > matters there, but increases complexity for everybody.
> >
> > I'm not sure how this adds complexity for everybody.. or at least the
> > intention was the default value for the new enum is the same as
> > current status-quo, so no need to plumb something thru every single
> > exporter.
>
> I think what K=C3=B6nig freaks out about here, and I think it's the same
> concern I have, is that this is for _all_ dma-buf exporter.
>
> Yeah I know we're having this "anything might not be implemented" escape
> hatch, but we're also slowly working to get that fixed and make dma-buf
> implementations. And so adding a fully generic dma-buf ioctl which is ver=
y
> limited use for arm64 VM in funky configuration (where the guest controls
> caching mode in ptes fully). The usual way we do these very special thing=
s
> are:

I'm not sure that it is necessarily arm64 specific (or rather I guess
there are additional archs where virtualization works)..

But this isn't *only* solving caching modes, it is also letting the
dmabuf exporter indicate to userspace when it shouldn't even try to
map to guest (ie. cases where you really do require the SYNC ioctl),
which seems useful.

> - Importer upcasts the dma-buf to the exporters buffer type by checking
>   the ops structure pointer.

The "importer" in this case is userspace ;-)

> - There is no dma-buf interface anymore really, and you can do very
>   specific stuff like xgmi mappings, or virtio uuid, or whatever.
>
> I think this should also work like that. Which means the query ioctl
> should be on some kvm/vm specific interface most likely, and not on
> generic dma-buf.

A kvm specific ioctl would seem.. odd.  Given that kvm doesn't
otherwise have anything to do with dmabuf fd's.  The kvm interaction
is simply "make these pages that are mmap'd into VMM visible in the
guest"

If I were to do something else, it would be a drm/msm specific ioctl.
But that only solves the issue for one driver.. maybe that is ok, I'm
not sure if any of the other non-dGPU drivers that can appear on
anything other than x86 support cached coherent buffers.

But still, having a way to indicate to userspace whether or not SYNC
ioctl is required seems useful.  Ie. rather than assume that because
x86 doesn't need this, no one does, let's provide userspace VMM with
the information it needs.  (The VMM already has arch specific
knowledge, so it should be aware about archs where it doesn't need to
care about getting guest cache attrs correct.)

> Also if we add this interface somewhere in the kvm world then that would
> also be a natural place to implement stuff like "the guest can't actually
> overwrite caching modes, ignore this all" and anything else. Ideally this
> thing exists only where it's actually needed, i.e. this specific vm+arm64
> cases. Not anywhere else, because experience says that if dma-buf can be
> abused in some way, people will.
>
> Also I'd really like to understand the full flow here too, some vague
> hand-waving that "apparently it has some cache flushing benefits" is a bi=
t
> too vague, if this is really only for performance. Like my experience has
> been that when a less priviledge entity can control caching, then you
> actually have to flush more often, not less. At least depending upon
> hardware (some recent intel igpu chips have this issue where due to
> userspace overwriting cache control too much we have to defensively flush
> caches again for everything - hw design is going to get fixed again soon)=
.

See for ex, https://patchwork.kernel.org/project/linux-arm-kernel/patch/202=
00915170442.131635-1-alexandru.elisei@arm.com/

BR,
-R

> -Daniel
>
> >
> > BR,
> > -R
> >
> > > If we don't have any other choice on the problem to work around that =
I
> > > would say ok we add an ARM specific workaround.
> > >
> > > But as long as that's not the case the whole idea is pretty clearly a
> > > NAK from my side.
> > >
> > > Regards,
> > > Christian.
> > >
> > > >
> > > > BR,
> > > > -R
> > > >
> > > >> Regards,
> > > >> Christian.
> > > >>
> > > >>> BR,
> > > >>> -R
> > > >>>
> > > >>>> Regards,
> > > >>>> Christian.
> > > >>>>
> > > >>>>> BR,
> > > >>>>> -R
> > > >>>>>
> > > >>>>>> Regards,
> > > >>>>>> Christian.
> > > >>>>>>
> > > >>>>>>> BR,
> > > >>>>>>> -R
> > > >>>>>>>
> > > >>>>>>>> If the hardware can't use the caching information from the h=
ost CPU page
> > > >>>>>>>> tables directly then that pretty much completely breaks the =
concept that
> > > >>>>>>>> the exporter is responsible for setting up those page tables=
.
> > > >>>>>>>>
> > > >>>>>>>> Regards,
> > > >>>>>>>> Christian.
> > > >>>>>>>>
> > > >>>>>>>>>       drivers/dma-buf/dma-buf.c    | 63 +++++++++++++++++++=
++++++++------
> > > >>>>>>>>>       include/linux/dma-buf.h      | 11 ++++++
> > > >>>>>>>>>       include/uapi/linux/dma-buf.h | 68 +++++++++++++++++++=
+++++++++++++++++
> > > >>>>>>>>>       3 files changed, 132 insertions(+), 10 deletions(-)
> > > >>>>>>>>>
> > > >>>>>>>>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dm=
a-buf.c
> > > >>>>>>>>> index 32f55640890c..262c4706f721 100644
> > > >>>>>>>>> --- a/drivers/dma-buf/dma-buf.c
> > > >>>>>>>>> +++ b/drivers/dma-buf/dma-buf.c
> > > >>>>>>>>> @@ -125,6 +125,32 @@ static struct file_system_type dma_buf=
_fs_type =3D {
> > > >>>>>>>>>           .kill_sb =3D kill_anon_super,
> > > >>>>>>>>>       };
> > > >>>>>>>>>
> > > >>>>>>>>> +static int __dma_buf_mmap(struct dma_buf *dmabuf, struct v=
m_area_struct *vma)
> > > >>>>>>>>> +{
> > > >>>>>>>>> +     int ret;
> > > >>>>>>>>> +
> > > >>>>>>>>> +     /* check if buffer supports mmap */
> > > >>>>>>>>> +     if (!dmabuf->ops->mmap)
> > > >>>>>>>>> +             return -EINVAL;
> > > >>>>>>>>> +
> > > >>>>>>>>> +     ret =3D dmabuf->ops->mmap(dmabuf, vma);
> > > >>>>>>>>> +
> > > >>>>>>>>> +     /*
> > > >>>>>>>>> +      * If the exporter claims to support coherent access,=
 ensure the
> > > >>>>>>>>> +      * pgprot flags match the claim.
> > > >>>>>>>>> +      */
> > > >>>>>>>>> +     if ((dmabuf->map_info !=3D DMA_BUF_MAP_INCOHERENT) &&=
 !ret) {
> > > >>>>>>>>> +             pgprot_t wc_prot =3D pgprot_writecombine(vma-=
>vm_page_prot);
> > > >>>>>>>>> +             if (dmabuf->map_info =3D=3D DMA_BUF_COHERENT_=
WC) {
> > > >>>>>>>>> +                     WARN_ON_ONCE(pgprot_val(vma->vm_page_=
prot) !=3D pgprot_val(wc_prot));
> > > >>>>>>>>> +             } else {
> > > >>>>>>>>> +                     WARN_ON_ONCE(pgprot_val(vma->vm_page_=
prot) =3D=3D pgprot_val(wc_prot));
> > > >>>>>>>>> +             }
> > > >>>>>>>>> +     }
> > > >>>>>>>>> +
> > > >>>>>>>>> +     return ret;
> > > >>>>>>>>> +}
> > > >>>>>>>>> +
> > > >>>>>>>>>       static int dma_buf_mmap_internal(struct file *file, s=
truct vm_area_struct *vma)
> > > >>>>>>>>>       {
> > > >>>>>>>>>           struct dma_buf *dmabuf;
> > > >>>>>>>>> @@ -134,16 +160,12 @@ static int dma_buf_mmap_internal(stru=
ct file *file, struct vm_area_struct *vma)
> > > >>>>>>>>>
> > > >>>>>>>>>           dmabuf =3D file->private_data;
> > > >>>>>>>>>
> > > >>>>>>>>> -     /* check if buffer supports mmap */
> > > >>>>>>>>> -     if (!dmabuf->ops->mmap)
> > > >>>>>>>>> -             return -EINVAL;
> > > >>>>>>>>> -
> > > >>>>>>>>>           /* check for overflowing the buffer's size */
> > > >>>>>>>>>           if (vma->vm_pgoff + vma_pages(vma) >
> > > >>>>>>>>>               dmabuf->size >> PAGE_SHIFT)
> > > >>>>>>>>>                   return -EINVAL;
> > > >>>>>>>>>
> > > >>>>>>>>> -     return dmabuf->ops->mmap(dmabuf, vma);
> > > >>>>>>>>> +     return __dma_buf_mmap(dmabuf, vma);
> > > >>>>>>>>>       }
> > > >>>>>>>>>
> > > >>>>>>>>>       static loff_t dma_buf_llseek(struct file *file, loff_=
t offset, int whence)
> > > >>>>>>>>> @@ -326,6 +348,27 @@ static long dma_buf_set_name(struct dm=
a_buf *dmabuf, const char __user *buf)
> > > >>>>>>>>>           return 0;
> > > >>>>>>>>>       }
> > > >>>>>>>>>
> > > >>>>>>>>> +static long dma_buf_info(struct dma_buf *dmabuf, void __us=
er *uarg)
> > > >>>>>>>>> +{
> > > >>>>>>>>> +     struct dma_buf_info arg;
> > > >>>>>>>>> +
> > > >>>>>>>>> +     if (copy_from_user(&arg, uarg, sizeof(arg)))
> > > >>>>>>>>> +             return -EFAULT;
> > > >>>>>>>>> +
> > > >>>>>>>>> +     switch (arg.param) {
> > > >>>>>>>>> +     case DMA_BUF_INFO_MAP_INFO:
> > > >>>>>>>>> +             arg.value =3D dmabuf->map_info;
> > > >>>>>>>>> +             break;
> > > >>>>>>>>> +     default:
> > > >>>>>>>>> +             return -EINVAL;
> > > >>>>>>>>> +     }
> > > >>>>>>>>> +
> > > >>>>>>>>> +     if (copy_to_user(uarg, &arg, sizeof(arg)))
> > > >>>>>>>>> +             return -EFAULT;
> > > >>>>>>>>> +
> > > >>>>>>>>> +     return 0;
> > > >>>>>>>>> +}
> > > >>>>>>>>> +
> > > >>>>>>>>>       static long dma_buf_ioctl(struct file *file,
> > > >>>>>>>>>                             unsigned int cmd, unsigned long=
 arg)
> > > >>>>>>>>>       {
> > > >>>>>>>>> @@ -369,6 +412,9 @@ static long dma_buf_ioctl(struct file *=
file,
> > > >>>>>>>>>           case DMA_BUF_SET_NAME_B:
> > > >>>>>>>>>                   return dma_buf_set_name(dmabuf, (const ch=
ar __user *)arg);
> > > >>>>>>>>>
> > > >>>>>>>>> +     case DMA_BUF_IOCTL_INFO:
> > > >>>>>>>>> +             return dma_buf_info(dmabuf, (void __user *)ar=
g);
> > > >>>>>>>>> +
> > > >>>>>>>>>           default:
> > > >>>>>>>>>                   return -ENOTTY;
> > > >>>>>>>>>           }
> > > >>>>>>>>> @@ -530,6 +576,7 @@ struct dma_buf *dma_buf_export(const st=
ruct dma_buf_export_info *exp_info)
> > > >>>>>>>>>           dmabuf->priv =3D exp_info->priv;
> > > >>>>>>>>>           dmabuf->ops =3D exp_info->ops;
> > > >>>>>>>>>           dmabuf->size =3D exp_info->size;
> > > >>>>>>>>> +     dmabuf->map_info =3D exp_info->map_info;
> > > >>>>>>>>>           dmabuf->exp_name =3D exp_info->exp_name;
> > > >>>>>>>>>           dmabuf->owner =3D exp_info->owner;
> > > >>>>>>>>>           spin_lock_init(&dmabuf->name_lock);
> > > >>>>>>>>> @@ -1245,10 +1292,6 @@ int dma_buf_mmap(struct dma_buf *dma=
buf, struct vm_area_struct *vma,
> > > >>>>>>>>>           if (WARN_ON(!dmabuf || !vma))
> > > >>>>>>>>>                   return -EINVAL;
> > > >>>>>>>>>
> > > >>>>>>>>> -     /* check if buffer supports mmap */
> > > >>>>>>>>> -     if (!dmabuf->ops->mmap)
> > > >>>>>>>>> -             return -EINVAL;
> > > >>>>>>>>> -
> > > >>>>>>>>>           /* check for offset overflow */
> > > >>>>>>>>>           if (pgoff + vma_pages(vma) < pgoff)
> > > >>>>>>>>>                   return -EOVERFLOW;
> > > >>>>>>>>> @@ -1262,7 +1305,7 @@ int dma_buf_mmap(struct dma_buf *dmab=
uf, struct vm_area_struct *vma,
> > > >>>>>>>>>           vma_set_file(vma, dmabuf->file);
> > > >>>>>>>>>           vma->vm_pgoff =3D pgoff;
> > > >>>>>>>>>
> > > >>>>>>>>> -     return dmabuf->ops->mmap(dmabuf, vma);
> > > >>>>>>>>> +     return __dma_buf_mmap(dmabuf, vma);
> > > >>>>>>>>>       }
> > > >>>>>>>>>       EXPORT_SYMBOL_NS_GPL(dma_buf_mmap, DMA_BUF);
> > > >>>>>>>>>
> > > >>>>>>>>> diff --git a/include/linux/dma-buf.h b/include/linux/dma-bu=
f.h
> > > >>>>>>>>> index 71731796c8c3..37923c8d5c24 100644
> > > >>>>>>>>> --- a/include/linux/dma-buf.h
> > > >>>>>>>>> +++ b/include/linux/dma-buf.h
> > > >>>>>>>>> @@ -23,6 +23,8 @@
> > > >>>>>>>>>       #include <linux/dma-fence.h>
> > > >>>>>>>>>       #include <linux/wait.h>
> > > >>>>>>>>>
> > > >>>>>>>>> +#include <uapi/linux/dma-buf.h>
> > > >>>>>>>>> +
> > > >>>>>>>>>       struct device;
> > > >>>>>>>>>       struct dma_buf;
> > > >>>>>>>>>       struct dma_buf_attachment;
> > > >>>>>>>>> @@ -307,6 +309,13 @@ struct dma_buf {
> > > >>>>>>>>>            */
> > > >>>>>>>>>           size_t size;
> > > >>>>>>>>>
> > > >>>>>>>>> +     /**
> > > >>>>>>>>> +      * @map_info:
> > > >>>>>>>>> +      *
> > > >>>>>>>>> +      * CPU mapping/coherency information for the buffer.
> > > >>>>>>>>> +      */
> > > >>>>>>>>> +     enum dma_buf_map_info map_info;
> > > >>>>>>>>> +
> > > >>>>>>>>>           /**
> > > >>>>>>>>>            * @file:
> > > >>>>>>>>>            *
> > > >>>>>>>>> @@ -533,6 +542,7 @@ struct dma_buf_attachment {
> > > >>>>>>>>>        * @ops:    Attach allocator-defined dma buf ops to t=
he new buffer
> > > >>>>>>>>>        * @size:   Size of the buffer - invariant over the l=
ifetime of the buffer
> > > >>>>>>>>>        * @flags:  mode flags for the file
> > > >>>>>>>>> + * @map_info:        CPU mapping/coherency information for=
 the buffer
> > > >>>>>>>>>        * @resv:   reservation-object, NULL to allocate defa=
ult one
> > > >>>>>>>>>        * @priv:   Attach private data of allocator to this =
buffer
> > > >>>>>>>>>        *
> > > >>>>>>>>> @@ -545,6 +555,7 @@ struct dma_buf_export_info {
> > > >>>>>>>>>           const struct dma_buf_ops *ops;
> > > >>>>>>>>>           size_t size;
> > > >>>>>>>>>           int flags;
> > > >>>>>>>>> +     enum dma_buf_map_info map_info;
> > > >>>>>>>>>           struct dma_resv *resv;
> > > >>>>>>>>>           void *priv;
> > > >>>>>>>>>       };
> > > >>>>>>>>> diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/li=
nux/dma-buf.h
> > > >>>>>>>>> index b1523cb8ab30..07b403ffdb43 100644
> > > >>>>>>>>> --- a/include/uapi/linux/dma-buf.h
> > > >>>>>>>>> +++ b/include/uapi/linux/dma-buf.h
> > > >>>>>>>>> @@ -85,6 +85,72 @@ struct dma_buf_sync {
> > > >>>>>>>>>
> > > >>>>>>>>>       #define DMA_BUF_NAME_LEN    32
> > > >>>>>>>>>
> > > >>>>>>>>> +/**
> > > >>>>>>>>> + * enum dma_buf_map_info - CPU mapping info
> > > >>>>>>>>> + *
> > > >>>>>>>>> + * This enum describes coherency of a userspace mapping of=
 the dmabuf.
> > > >>>>>>>>> + *
> > > >>>>>>>>> + * Importing devices should check dma_buf::map_info flag a=
nd reject an
> > > >>>>>>>>> + * import if unsupported.  For example, if the exporting d=
evice uses
> > > >>>>>>>>> + * @DMA_BUF_COHERENT_CACHED but the importing device does =
not support
> > > >>>>>>>>> + * CPU cache coherency, the dma-buf import should fail.
> > > >>>>>>>>> + */
> > > >>>>>>>>> +enum dma_buf_map_info {
> > > >>>>>>>>> +     /**
> > > >>>>>>>>> +      * @DMA_BUF_MAP_INCOHERENT: CPU mapping is incoherent=
.
> > > >>>>>>>>> +      *
> > > >>>>>>>>> +      * Use of DMA_BUF_IOCTL_SYNC is required for CPU mana=
ged coherenency.
> > > >>>>>>>>> +      */
> > > >>>>>>>>> +     DMA_BUF_MAP_INCOHERENT,
> > > >>>>>>>>> +
> > > >>>>>>>>> +     /**
> > > >>>>>>>>> +      * @DMA_BUF_COHERENT_WC: CPU mapping is coherent but =
not cached.
> > > >>>>>>>>> +      *
> > > >>>>>>>>> +      * A cpu mmap'ing is coherent, and DMA_BUF_IOCTL_SYNC=
 is not required.
> > > >>>>>>>>> +      * However fences may be still required for synchroni=
zing access.  Ie.
> > > >>>>>>>>> +      * coherency can only be relied upon by an explicit-f=
encing userspace.
> > > >>>>>>>>> +      * An implicit-sync userspace must still use DMA_BUF_=
IOCTL_SYNC.
> > > >>>>>>>>> +      *
> > > >>>>>>>>> +      * The cpu mapping is writecombine.
> > > >>>>>>>>> +      */
> > > >>>>>>>>> +     DMA_BUF_COHERENT_WC,
> > > >>>>>>>>> +
> > > >>>>>>>>> +     /**
> > > >>>>>>>>> +      * @DMA_BUF_COHERENT_CACHED: CPU mapping is coherent =
and CPU cached.
> > > >>>>>>>>> +      *
> > > >>>>>>>>> +      * A cpu mmap'ing is coherent, and DMA_BUF_IOCTL_SYNC=
 is not required.
> > > >>>>>>>>> +      * However fences may be still required for synchroni=
zing access.  Ie.
> > > >>>>>>>>> +      * coherency can only be relied upon by an explicit-f=
encing userspace.
> > > >>>>>>>>> +      * An implicit-sync userspace must still use DMA_BUF_=
IOCTL_SYNC.
> > > >>>>>>>>> +      *
> > > >>>>>>>>> +      * The cpu mapping is cached.
> > > >>>>>>>>> +      */
> > > >>>>>>>>> +     DMA_BUF_COHERENT_CACHED,
> > > >>>>>>>>> +};
> > > >>>>>>>>> +
> > > >>>>>>>>> +/**
> > > >>>>>>>>> + * struct dma_buf_info - Query info about the buffer.
> > > >>>>>>>>> + */
> > > >>>>>>>>> +struct dma_buf_info {
> > > >>>>>>>>> +
> > > >>>>>>>>> +#define DMA_BUF_INFO_MAP_INFO    1
> > > >>>>>>>>> +
> > > >>>>>>>>> +     /**
> > > >>>>>>>>> +      * @param: Which param to query
> > > >>>>>>>>> +      *
> > > >>>>>>>>> +      * DMA_BUF_INFO_MAP_INFO:
> > > >>>>>>>>> +      *     Returns enum dma_buf_map_info, describing the =
coherency and
> > > >>>>>>>>> +      *     caching of a CPU mapping of the buffer.
> > > >>>>>>>>> +      */
> > > >>>>>>>>> +     __u32 param;
> > > >>>>>>>>> +     __u32 pad;
> > > >>>>>>>>> +
> > > >>>>>>>>> +     /**
> > > >>>>>>>>> +      * @value: Return value of the query.
> > > >>>>>>>>> +      */
> > > >>>>>>>>> +     __u64 value;
> > > >>>>>>>>> +};
> > > >>>>>>>>> +
> > > >>>>>>>>>       #define DMA_BUF_BASE                'b'
> > > >>>>>>>>>       #define DMA_BUF_IOCTL_SYNC  _IOW(DMA_BUF_BASE, 0, str=
uct dma_buf_sync)
> > > >>>>>>>>>
> > > >>>>>>>>> @@ -95,4 +161,6 @@ struct dma_buf_sync {
> > > >>>>>>>>>       #define DMA_BUF_SET_NAME_A  _IOW(DMA_BUF_BASE, 1, __u=
32)
> > > >>>>>>>>>       #define DMA_BUF_SET_NAME_B  _IOW(DMA_BUF_BASE, 1, __u=
64)
> > > >>>>>>>>>
> > > >>>>>>>>> +#define DMA_BUF_IOCTL_INFO   _IOWR(DMA_BUF_BASE, 2, struct=
 dma_buf_info)
> > > >>>>>>>>> +
> > > >>>>>>>>>       #endif
> > >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
