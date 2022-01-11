Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E0948A78C
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 07:02:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B64B412AA35;
	Tue, 11 Jan 2022 06:02:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78B2B12AA35
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 06:02:29 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id p5so37040523ybd.13
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jan 2022 22:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4ylUepVeOtwlKTbhgwu5JZVm8jvIdhjAW/3Qk7rDEMI=;
 b=Mf2diaJk3CYfSUHtw2WKMkLQkpqARBZwM7bE4lmnW3iXsw4cp9VQ/wL+52f3NiO2bf
 9A5wBw617qKKb+KfIPR5xRPWn2KTe1F8qP29p4BKd4n8AB3Dgnh0ujA3uUv/31POT5yM
 LuD2F7290969o4NeB7vpQfa0dvMHCQnRDkMpbClx+Pw/Ax0/+Ui5mWtfyIXNhRYW9DD+
 vBQlSqWGYhVN/O337hPQ841RJHkTMEsCxpjpVq3kIwIqqFQQ4m6Yy7fpRbhlrA69KI+x
 05quuZGZ9Hfx868VeCB9mICgmtuCuDaGWFd1gCrrLhnuuEA/dZN3bymKZnYaGTEd2Jc9
 CLSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4ylUepVeOtwlKTbhgwu5JZVm8jvIdhjAW/3Qk7rDEMI=;
 b=EGXh4jI9UqxQz/kWRBsRkNXEPfJ6jyalqv4Ae0YMYl/eKMMfyNcefqZvYw4zefJtjB
 80BpElly2MifacNApXy+qfs0gHm77FeU8n4BuZ4sObfwb7KWyfsJOsasNom+P1yfWkf2
 riB9FGNm4+tMFVAW2hJvp3r84cdO+YA1diFoV7Q40cL11cKfskStDiHT8dw95yA5XYEk
 zesyVMrJs9m7b1Ye82r/Q6Zcdapz/1+Kxl+9F5FAWB2CGP0bI6zKgUyLMU2hMvAn7UmJ
 4kCebP0AOPoCaOhRI+ln/gZLrJ178EHZgsgDxc611hpjdD/nkkXdc9DiWelDzVqUPtOW
 C5eQ==
X-Gm-Message-State: AOAM53204yKVoDRkFLqbSCvvqgZ25kCq/IPDTL+RgwJQgISitWuVP9Bk
 Mm1VBnkWXf+S/ofxhLks6pepeZuo/5EdJe2/NyK9Iw==
X-Google-Smtp-Source: ABdhPJz7KMS2B8d0TlgC5zbG3CNjBCiAsLI0sejmhLCwNgXprdMG8MZ6HIoH+QNrFWiA/EF10/XtE3heLWd4bysjNro=
X-Received: by 2002:a25:29c2:: with SMTP id p185mr1973185ybp.322.1641880948090; 
 Mon, 10 Jan 2022 22:02:28 -0800 (PST)
MIME-Version: 1.0
References: <20220104235148.21320-1-hridya@google.com>
 <49b29081-42df-ffcd-8fea-bd819499ff1b@amd.com>
 <CA+wgaPMWT0s0KNo_wM7jU+bH626OAVtn77f7_WX=E1wyU8aBzg@mail.gmail.com>
 <3a29914d-0c7b-1f10-49cb-dbc1cc6e52b0@amd.com>
 <CA+wgaPOmRTAuXiSRRmj-s=3d2W6ny=EMFtroOShYKrp0u+xF+g@mail.gmail.com>
 <CA+wgaPO81R+NckRt0nzZazxs9fqSC_V_wyChU=kcMqJ01WxXNw@mail.gmail.com>
 <5a6bd742-10ca-2e88-afaa-3744731c2c0c@amd.com>
In-Reply-To: <5a6bd742-10ca-2e88-afaa-3744731c2c0c@amd.com>
From: Hridya Valsaraju <hridya@google.com>
Date: Mon, 10 Jan 2022 22:01:52 -0800
Message-ID: <CA+wgaPPdCMPi1t+ObyO4+cqsk7Xx3E=K5BOPM37=QAviQDAfmw@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: Move sysfs work out of DMA-BUF export/release
 path
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
Cc: keescook@google.com, Daniel Vetter <daniel.vetter@ffwll.ch>,
 kaleshsingh@google.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tjmercier@google.com,
 linaro-mm-sig@lists.linaro.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, surenb@google.com,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jan 9, 2022 at 11:28 PM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 07.01.22 um 22:25 schrieb Hridya Valsaraju:
> > On Fri, Jan 7, 2022 at 10:17 AM Hridya Valsaraju <hridya@google.com> wr=
ote:
> >> On Fri, Jan 7, 2022 at 2:22 AM Christian K=C3=B6nig <christian.koenig@=
amd.com> wrote:
> >>> Am 06.01.22 um 20:04 schrieb Hridya Valsaraju:
> >>>> On Thu, Jan 6, 2022 at 12:59 AM Christian K=C3=B6nig
> >>>> <christian.koenig@amd.com> wrote:
> >>>>> Am 05.01.22 um 00:51 schrieb Hridya Valsaraju:
> >>>>>> Recently, we noticed an issue where a process went into direct rec=
laim
> >>>>>> while holding the kernfs rw semaphore for sysfs in write(exclusive=
)
> >>>>>> mode. This caused processes who were doing DMA-BUF exports and rel=
eases
> >>>>>> to go into uninterruptible sleep since they needed to acquire the =
same
> >>>>>> semaphore for the DMA-BUF sysfs entry creation/deletion. In order =
to avoid
> >>>>>> blocking DMA-BUF export/release for an indeterminate amount of tim=
e
> >>>>>> while another process is holding the sysfs rw semaphore in exclusi=
ve
> >>>>>> mode, this patch moves the per-buffer sysfs file creation/deleteio=
n to
> >>>>>> a kthread.
> >>>>> Well I absolutely don't think that this is justified.
> >>>>>
> >>>>> You adding tons of complexity here just to avoid the overhead of
> >>>>> creating the sysfs files while exporting DMA-bufs which is an opera=
tion
> >>>>> which should be done exactly once in the lifecycle for the most com=
mon
> >>>>> use case.
> >>>>>
> >>>>> Please explain further why that should be necessary.
> >>>> Hi Christian,
> >>>>
> >>>> We noticed that the issue sometimes causes the exporting process to =
go
> >>>> to the uninterrupted sleep state for tens of milliseconds which
> >>>> unfortunately leads to user-perceptible UI jank. This is the reason
> >>>> why we are trying to move the sysfs entry creation and deletion out =
of
> >>>> the DMA-BUF export/release path. I will update the commit message to
> >>>> include the same in the next revision.
> >>> That is still not a justification for this change. The question is wh=
y
> >>> do you need that in the first place?
> >>>
> >>> Exporting a DMA-buf should be something would should be very rarely,
> >>> e.g. only at the start of an application.
> >> Hi Christian,
> >>
> >> Yes, that is correct. Noticeable jank caused by the issue is not
> >> present at all times and happens on UI transitions(for example during
> >> app launches and exits) when there are several DMA-BUFs being exported
> >> and released. This is especially true in the case of the camera app
> >> since it exports and releases a relatively larger number of DMA-BUFs
> >> during launch and exit respectively.
>
> Well, that sounds at least better than before.
>
> >>
> >> Regards,
> >> Hridya
> >>
> >>> So this strongly looks like you are trying to optimize for an use cas=
e
> >>> where we should probably rethink what userspace is doing here instead=
.
> > Hello Christian,
> >
> > If you don't mind, could you please elaborate on the above statement?
>
> The purpose of DMA-buf is to share a rather low number of buffers
> between different drivers and/or applications.
>
> For example with triple buffering we have three buffers shared between
> the camera driver and the display driver, same thing for use cases
> between rendering and display.
>
> So even when you have ~100 applications open your should not share more
> than ~300 DMA-buf handles and doing that should absolutely not cause any
> problems like you described above.
>
> Long story short when this affects your user experience then your user
> space is exporting *much* more buffers than expected. Especially since
> the sysfs overhead is completely negligible compared to the overhead
> drivers have when they export buffers.



I do not think we can solve this issue from userspace since the
problem is not due to the overhead of sysfs creation/teardown itself.
The problem is that the duration of time for which the exporting
process would need to sleep waiting for the kernfs_rwsem semaphore is
undefined when the holder of the semaphore goes under direct reclaim.
Fsnotify events for sysfs files are also generated while holding the
same semaphore.

This is also not a problem due to the high number of DMA-BUF
exports during launch time, as even a single export can be delayed for
an unpredictable amount of time. We cannot eliminate DMA-BUF exports
completely during app-launches and we are unfortunately seeing reports
of the exporting process occasionally sleeping long enough to cause
user-visible jankiness :(

We also looked at whether any optimizations are possible from the
kernfs implementation side[1] but the semaphore is used quite extensively
and it looks like the best way forward would be to remove sysfs
creation/teardown from the DMA-BUF export/release path altogether. We
have some ideas on how we can reduce the code-complexity in the
current patch. If we manage to
simplify it considerably, would the approach of offloading sysfs
creation and teardown into a separate thread be acceptable Christian?
Thank you for the guidance!

Regards,
Hridya

[1]: https://lore.kernel.org/all/20211118230008.2679780-1-minchan@kernel.or=
g/



>
> I think in that light adding sysfs was rather questionable to begin
> with, but that change here is a complete no-go if you ask me. You are
> adding complexity to the kernel for something which should probably be
> optimized in userspace.
>
> Regards,
> Christian.
>
> > Thanks in advance for the guidance!
> >
> > Regards,
> > Hridya
> >
> >>> If we would want to go down this route you would need to change all t=
he
> >>> drivers implementing the DMA-buf export functionality to avoid
> >>> uninterruptible sleep as well and that is certainly something I would=
 NAK.
> >>>
> >>> Regards,
> >>> Christian.
> >>>
> >>>> Thanks,
> >>>> Hridya
> >>>>
> >>>>
> >>>>> Regards,
> >>>>> Christian.
> >>>>>
> >>>>>> Fixes: bdb8d06dfefd ("dmabuf: Add the capability to expose DMA-BUF=
 stats in sysfs")
> >>>>>> Signed-off-by: Hridya Valsaraju <hridya@google.com>
> >>>>>> ---
> >>>>>>     drivers/dma-buf/dma-buf-sysfs-stats.c | 343 ++++++++++++++++++=
++++++--
> >>>>>>     include/linux/dma-buf.h               |  46 ++++
> >>>>>>     2 files changed, 366 insertions(+), 23 deletions(-)
> >>>>>>
> >>>>>> diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.c b/drivers/dma-b=
uf/dma-buf-sysfs-stats.c
> >>>>>> index 053baadcada9..3251fdf2f05f 100644
> >>>>>> --- a/drivers/dma-buf/dma-buf-sysfs-stats.c
> >>>>>> +++ b/drivers/dma-buf/dma-buf-sysfs-stats.c
> >>>>>> @@ -7,13 +7,39 @@
> >>>>>>
> >>>>>>     #include <linux/dma-buf.h>
> >>>>>>     #include <linux/dma-resv.h>
> >>>>>> +#include <linux/freezer.h>
> >>>>>>     #include <linux/kobject.h>
> >>>>>> +#include <linux/kthread.h>
> >>>>>> +#include <linux/list.h>
> >>>>>>     #include <linux/printk.h>
> >>>>>> +#include <linux/sched/signal.h>
> >>>>>>     #include <linux/slab.h>
> >>>>>>     #include <linux/sysfs.h>
> >>>>>>
> >>>>>>     #include "dma-buf-sysfs-stats.h"
> >>>>>>
> >>>>>> +struct dmabuf_kobj_work {
> >>>>>> +     struct list_head list;
> >>>>>> +     struct dma_buf_sysfs_entry *sysfs_entry;
> >>>>>> +     struct dma_buf_sysfs_entry_metadata *sysfs_metadata;
> >>>>>> +     unsigned long uid;
> >>>>>> +};
> >>>>>> +
> >>>>>> +/* Both kobject setup and teardown work gets queued on the list. =
*/
> >>>>>> +static LIST_HEAD(dmabuf_kobj_work_list);
> >>>>>> +
> >>>>>> +/* dmabuf_kobj_list_lock protects dmabuf_kobj_work_list. */
> >>>>>> +static DEFINE_SPINLOCK(dmabuf_kobj_list_lock);
> >>>>>> +
> >>>>>> +/*
> >>>>>> + * dmabuf_sysfs_show_lock prevents a race between a DMA-BUF sysfs=
 file being
> >>>>>> + * read and the DMA-BUF being freed by protecting sysfs_entry->dm=
abuf.
> >>>>>> + */
> >>>>>> +static DEFINE_SPINLOCK(dmabuf_sysfs_show_lock);
> >>>>>> +
> >>>>>> +static struct task_struct *dmabuf_kobject_task;
> >>>>>> +static wait_queue_head_t dmabuf_kobject_waitqueue;
> >>>>>> +
> >>>>>>     #define to_dma_buf_entry_from_kobj(x) container_of(x, struct d=
ma_buf_sysfs_entry, kobj)
> >>>>>>
> >>>>>>     /**
> >>>>>> @@ -64,15 +90,26 @@ static ssize_t dma_buf_stats_attribute_show(st=
ruct kobject *kobj,
> >>>>>>         struct dma_buf_stats_attribute *attribute;
> >>>>>>         struct dma_buf_sysfs_entry *sysfs_entry;
> >>>>>>         struct dma_buf *dmabuf;
> >>>>>> +     int ret;
> >>>>>>
> >>>>>>         attribute =3D to_dma_buf_stats_attr(attr);
> >>>>>>         sysfs_entry =3D to_dma_buf_entry_from_kobj(kobj);
> >>>>>> +
> >>>>>> +     /*
> >>>>>> +      * acquire dmabuf_sysfs_show_lock to prevent a race with the=
 DMA-BUF
> >>>>>> +      * being freed while sysfs_entry->dmabuf is being accessed.
> >>>>>> +      */
> >>>>>> +     spin_lock(&dmabuf_sysfs_show_lock);
> >>>>>>         dmabuf =3D sysfs_entry->dmabuf;
> >>>>>>
> >>>>>> -     if (!dmabuf || !attribute->show)
> >>>>>> +     if (!dmabuf || !attribute->show) {
> >>>>>> +             spin_unlock(&dmabuf_sysfs_show_lock);
> >>>>>>                 return -EIO;
> >>>>>> +     }
> >>>>>>
> >>>>>> -     return attribute->show(dmabuf, attribute, buf);
> >>>>>> +     ret =3D attribute->show(dmabuf, attribute, buf);
> >>>>>> +     spin_unlock(&dmabuf_sysfs_show_lock);
> >>>>>> +     return ret;
> >>>>>>     }
> >>>>>>
> >>>>>>     static const struct sysfs_ops dma_buf_stats_sysfs_ops =3D {
> >>>>>> @@ -118,33 +155,275 @@ static struct kobj_type dma_buf_ktype =3D {
> >>>>>>         .default_groups =3D dma_buf_stats_default_groups,
> >>>>>>     };
> >>>>>>
> >>>>>> -void dma_buf_stats_teardown(struct dma_buf *dmabuf)
> >>>>>> +/* Statistics files do not need to send uevents. */
> >>>>>> +static int dmabuf_sysfs_uevent_filter(struct kset *kset, struct k=
object *kobj)
> >>>>>>     {
> >>>>>> -     struct dma_buf_sysfs_entry *sysfs_entry;
> >>>>>> +     return 0;
> >>>>>> +}
> >>>>>>
> >>>>>> -     sysfs_entry =3D dmabuf->sysfs_entry;
> >>>>>> -     if (!sysfs_entry)
> >>>>>> -             return;
> >>>>>> +static const struct kset_uevent_ops dmabuf_sysfs_no_uevent_ops =
=3D {
> >>>>>> +     .filter =3D dmabuf_sysfs_uevent_filter,
> >>>>>> +};
> >>>>>> +
> >>>>>> +/* setup of sysfs entries done asynchronously in the worker threa=
d. */
> >>>>>> +static void dma_buf_sysfs_stats_setup_work(struct dmabuf_kobj_wor=
k *kobject_work)
> >>>>>> +{
> >>>>>> +     struct dma_buf_sysfs_entry *sysfs_entry =3D kobject_work->sy=
sfs_entry;
> >>>>>> +     struct dma_buf_sysfs_entry_metadata *sysfs_metadata =3D
> >>>>>> +                     kobject_work->sysfs_metadata;
> >>>>>> +     bool free_metadata =3D false;
> >>>>>> +
> >>>>>> +     int ret =3D kobject_init_and_add(&sysfs_entry->kobj, &dma_bu=
f_ktype, NULL,
> >>>>>> +                                    "%lu", kobject_work->uid);
> >>>>>> +     if (ret) {
> >>>>>> +             kobject_put(&sysfs_entry->kobj);
> >>>>>> +
> >>>>>> +             spin_lock(&sysfs_metadata->sysfs_entry_lock);
> >>>>>> +             if (sysfs_metadata->status =3D=3D SYSFS_ENTRY_INIT_A=
BORTED) {
> >>>>>> +                     /*
> >>>>>> +                      * SYSFS_ENTRY_INIT_ABORTED means that the D=
MA-BUF has already
> >>>>>> +                      * been freed. At this point, its safe to fr=
ee the memory for
> >>>>>> +                      * the sysfs_metadata;
> >>>>>> +                      */
> >>>>>> +                     free_metadata =3D true;
> >>>>>> +             } else {
> >>>>>> +                     /*
> >>>>>> +                      * The DMA-BUF has not yet been freed, set t=
he status to
> >>>>>> +                      * sysfs_entry_error so that when the DMA-BU=
F gets
> >>>>>> +                      * freed, we know there is no need to teardo=
wn the sysfs
> >>>>>> +                      * entry.
> >>>>>> +                      */
> >>>>>> +                     sysfs_metadata->status =3D SYSFS_ENTRY_ERROR=
;
> >>>>>> +             }
> >>>>>> +             goto unlock;
> >>>>>> +     }
> >>>>>> +
> >>>>>> +     /*
> >>>>>> +      * If the DMA-BUF has not yet been released, status would st=
ill be
> >>>>>> +      * SYSFS_ENTRY_INIT_IN_PROGRESS. We set the status as initia=
lized.
> >>>>>> +      */
> >>>>>> +     spin_lock(&sysfs_metadata->sysfs_entry_lock);
> >>>>>> +     if (sysfs_metadata->status =3D=3D SYSFS_ENTRY_INIT_IN_PROGRE=
SS) {
> >>>>>> +             sysfs_metadata->status =3D SYSFS_ENTRY_INITIALIZED;
> >>>>>> +             goto unlock;
> >>>>>> +     }
> >>>>>>
> >>>>>> +     /*
> >>>>>> +      * At this point the status is SYSFS_ENTRY_INIT_ABORTED whic=
h means
> >>>>>> +      * that the DMA-BUF has already been freed. Hence, we cleanu=
p the
> >>>>>> +      * sysfs_entry and its metadata since neither of them are ne=
eded
> >>>>>> +      * anymore.
> >>>>>> +      */
> >>>>>> +     free_metadata =3D true;
> >>>>>>         kobject_del(&sysfs_entry->kobj);
> >>>>>>         kobject_put(&sysfs_entry->kobj);
> >>>>>> +
> >>>>>> +unlock:
> >>>>>> +     spin_unlock(&sysfs_metadata->sysfs_entry_lock);
> >>>>>> +     if (free_metadata) {
> >>>>>> +             kfree(kobject_work->sysfs_metadata);
> >>>>>> +             kobject_work->sysfs_metadata =3D NULL;
> >>>>>> +     }
> >>>>>>     }
> >>>>>>
> >>>>>> +/* teardown of sysfs entries done asynchronously in the worker th=
read. */
> >>>>>> +static void dma_buf_sysfs_stats_teardown_work(struct dmabuf_kobj_=
work *kobject_work)
> >>>>>> +{
> >>>>>> +     struct dma_buf_sysfs_entry *sysfs_entry =3D kobject_work->sy=
sfs_entry;
> >>>>>>
> >>>>>> -/* Statistics files do not need to send uevents. */
> >>>>>> -static int dmabuf_sysfs_uevent_filter(struct kset *kset, struct k=
object *kobj)
> >>>>>> +     kobject_del(&sysfs_entry->kobj);
> >>>>>> +     kobject_put(&sysfs_entry->kobj);
> >>>>>> +
> >>>>>> +     kfree(kobject_work->sysfs_metadata);
> >>>>>> +     kobject_work->sysfs_metadata =3D NULL;
> >>>>>> +}
> >>>>>> +
> >>>>>> +/* do setup or teardown of sysfs entries as required */
> >>>>>> +static void do_kobject_work(struct dmabuf_kobj_work *kobject_work=
)
> >>>>>>     {
> >>>>>> +     struct dma_buf_sysfs_entry_metadata *sysfs_metadata;
> >>>>>> +     bool setup_needed =3D false;
> >>>>>> +     bool teardown_needed =3D false;
> >>>>>> +
> >>>>>> +     sysfs_metadata =3D kobject_work->sysfs_metadata;
> >>>>>> +     spin_lock(&sysfs_metadata->sysfs_entry_lock);
> >>>>>> +     if (sysfs_metadata->status =3D=3D SYSFS_ENTRY_UNINITIALIZED)=
 {
> >>>>>> +             setup_needed =3D true;
> >>>>>> +             sysfs_metadata->status =3D SYSFS_ENTRY_INIT_IN_PROGR=
ESS;
> >>>>>> +     } else if (sysfs_metadata->status =3D=3D SYSFS_ENTRY_INITIAL=
IZED) {
> >>>>>> +             teardown_needed =3D true;
> >>>>>> +     }
> >>>>>> +
> >>>>>> +     /*
> >>>>>> +      * It is ok to release the sysfs_entry_lock here.
> >>>>>> +      *
> >>>>>> +      * If setup_needed is true, we check the status again after =
the kobject
> >>>>>> +      * initialization to see if it has been set to SYSFS_ENTRY_I=
NIT_ABORTED
> >>>>>> +      * and if so teardown the kobject.
> >>>>>> +      *
> >>>>>> +      * If teardown_needed is true, there are no more changes exp=
ected to the
> >>>>>> +      * status.
> >>>>>> +      *
> >>>>>> +      * If neither setup_needed nor teardown needed are true, it
> >>>>>> +      * means the DMA-BUF was freed before we got around to setti=
ng up the
> >>>>>> +      * sysfs entry and hence we just need to release the metadat=
a and
> >>>>>> +      * return.
> >>>>>> +      */
> >>>>>> +     spin_unlock(&kobject_work->sysfs_metadata->sysfs_entry_lock)=
;
> >>>>>> +
> >>>>>> +     if (setup_needed)
> >>>>>> +             dma_buf_sysfs_stats_setup_work(kobject_work);
> >>>>>> +     else if (teardown_needed)
> >>>>>> +             dma_buf_sysfs_stats_teardown_work(kobject_work);
> >>>>>> +     else
> >>>>>> +             kfree(kobject_work->sysfs_metadata);
> >>>>>> +
> >>>>>> +     kfree(kobject_work);
> >>>>>> +}
> >>>>>> +
> >>>>>> +static struct dmabuf_kobj_work *get_next_kobj_work(void)
> >>>>>> +{
> >>>>>> +     struct dmabuf_kobj_work *kobject_work;
> >>>>>> +
> >>>>>> +     spin_lock(&dmabuf_kobj_list_lock);
> >>>>>> +     kobject_work =3D list_first_entry_or_null(&dmabuf_kobj_work_=
list,
> >>>>>> +                                             struct dmabuf_kobj_w=
ork, list);
> >>>>>> +     if (kobject_work)
> >>>>>> +             list_del(&kobject_work->list);
> >>>>>> +     spin_unlock(&dmabuf_kobj_list_lock);
> >>>>>> +     return kobject_work;
> >>>>>> +}
> >>>>>> +
> >>>>>> +static int kobject_work_thread(void *data)
> >>>>>> +{
> >>>>>> +     struct dmabuf_kobj_work *kobject_work;
> >>>>>> +
> >>>>>> +     while (1) {
> >>>>>> +             wait_event_freezable(dmabuf_kobject_waitqueue,
> >>>>>> +                                  (kobject_work =3D get_next_kobj=
_work()));
> >>>>>> +             do_kobject_work(kobject_work);
> >>>>>> +     }
> >>>>>> +
> >>>>>>         return 0;
> >>>>>>     }
> >>>>>>
> >>>>>> -static const struct kset_uevent_ops dmabuf_sysfs_no_uevent_ops =
=3D {
> >>>>>> -     .filter =3D dmabuf_sysfs_uevent_filter,
> >>>>>> -};
> >>>>>> +static int kobject_worklist_init(void)
> >>>>>> +{
> >>>>>> +     init_waitqueue_head(&dmabuf_kobject_waitqueue);
> >>>>>> +     dmabuf_kobject_task =3D kthread_run(kobject_work_thread, NUL=
L,
> >>>>>> +                                       "%s", "dmabuf-kobject-work=
er");
> >>>>>> +     if (IS_ERR(dmabuf_kobject_task)) {
> >>>>>> +             pr_err("Creating thread for deferred sysfs entry cre=
ation/deletion failed\n");
> >>>>>> +             return PTR_ERR(dmabuf_kobject_task);
> >>>>>> +     }
> >>>>>> +     sched_set_normal(dmabuf_kobject_task, MAX_NICE);
> >>>>>> +
> >>>>>> +     return 0;
> >>>>>> +}
> >>>>>> +
> >>>>>> +static void deferred_kobject_create(struct dmabuf_kobj_work *kobj=
ect_work)
> >>>>>> +{
> >>>>>> +     INIT_LIST_HEAD(&kobject_work->list);
> >>>>>> +
> >>>>>> +     spin_lock(&dmabuf_kobj_list_lock);
> >>>>>> +
> >>>>>> +     list_add_tail(&kobject_work->list, &dmabuf_kobj_work_list);
> >>>>>> +
> >>>>>> +     spin_unlock(&dmabuf_kobj_list_lock);
> >>>>>> +
> >>>>>> +     wake_up(&dmabuf_kobject_waitqueue);
> >>>>>> +}
> >>>>>> +
> >>>>>> +
> >>>>>> +void dma_buf_stats_teardown(struct dma_buf *dmabuf)
> >>>>>> +{
> >>>>>> +     struct dma_buf_sysfs_entry *sysfs_entry;
> >>>>>> +     struct dma_buf_sysfs_entry_metadata *sysfs_metadata;
> >>>>>> +     struct dmabuf_kobj_work *kobj_work;
> >>>>>> +
> >>>>>> +     sysfs_entry =3D dmabuf->sysfs_entry;
> >>>>>> +     if (!sysfs_entry)
> >>>>>> +             return;
> >>>>>> +
> >>>>>> +     sysfs_metadata =3D dmabuf->sysfs_entry_metadata;
> >>>>>> +     if (!sysfs_metadata)
> >>>>>> +             return;
> >>>>>> +
> >>>>>> +     spin_lock(&sysfs_metadata->sysfs_entry_lock);
> >>>>>> +
> >>>>>> +     if (sysfs_metadata->status =3D=3D SYSFS_ENTRY_UNINITIALIZED =
||
> >>>>>> +         sysfs_metadata->status =3D=3D SYSFS_ENTRY_INIT_IN_PROGRE=
SS) {
> >>>>>> +             /*
> >>>>>> +              * The sysfs entry for this buffer has not yet been =
initialized,
> >>>>>> +              * we set the status to SYSFS_ENTRY_INIT_ABORTED to =
abort the
> >>>>>> +              * initialization.
> >>>>>> +              */
> >>>>>> +             sysfs_metadata->status =3D SYSFS_ENTRY_INIT_ABORTED;
> >>>>>> +             spin_unlock(&sysfs_metadata->sysfs_entry_lock);
> >>>>>> +
> >>>>>> +             /*
> >>>>>> +              * In case kobject initialization completes right as=
 we release
> >>>>>> +              * the sysfs_entry_lock, disable show() for the sysf=
s entry by
> >>>>>> +              * setting sysfs_entry->dmabuf to NULL to prevent a =
race.
> >>>>>> +              */
> >>>>>> +             spin_lock(&dmabuf_sysfs_show_lock);
> >>>>>> +             sysfs_entry->dmabuf =3D NULL;
> >>>>>> +             spin_unlock(&dmabuf_sysfs_show_lock);
> >>>>>> +
> >>>>>> +             return;
> >>>>>> +     }
> >>>>>> +
> >>>>>> +     if (sysfs_metadata->status =3D=3D SYSFS_ENTRY_INITIALIZED) {
> >>>>>> +             /*
> >>>>>> +              * queue teardown work only if sysfs_entry is fully =
inititalized.
> >>>>>> +              * It is ok to release the sysfs_entry_lock here sin=
ce the
> >>>>>> +              * status can no longer change.
> >>>>>> +              */
> >>>>>> +             spin_unlock(&sysfs_metadata->sysfs_entry_lock);
> >>>>>> +
> >>>>>> +             /*
> >>>>>> +              * Meanwhile disable show() for the sysfs entry to a=
void a race
> >>>>>> +              * between teardown and show().
> >>>>>> +              */
> >>>>>> +             spin_lock(&dmabuf_sysfs_show_lock);
> >>>>>> +             sysfs_entry->dmabuf =3D NULL;
> >>>>>> +             spin_unlock(&dmabuf_sysfs_show_lock);
> >>>>>> +
> >>>>>> +             kobj_work =3D kzalloc(sizeof(struct dmabuf_kobj_work=
), GFP_KERNEL);
> >>>>>> +             if (!kobj_work) {
> >>>>>> +                     /* do the teardown immediately. */
> >>>>>> +                     kobject_del(&sysfs_entry->kobj);
> >>>>>> +                     kobject_put(&sysfs_entry->kobj);
> >>>>>> +                     kfree(sysfs_metadata);
> >>>>>> +             } else {
> >>>>>> +                     /* queue teardown work. */
> >>>>>> +                     kobj_work->sysfs_entry =3D dmabuf->sysfs_ent=
ry;
> >>>>>> +                     kobj_work->sysfs_metadata =3D dmabuf->sysfs_=
entry_metadata;
> >>>>>> +                     deferred_kobject_create(kobj_work);
> >>>>>> +             }
> >>>>>> +
> >>>>>> +             return;
> >>>>>> +     }
> >>>>>> +
> >>>>>> +     /*
> >>>>>> +      * status is SYSFS_ENTRY_INIT_ERROR so we only need to free =
the
> >>>>>> +      * metadata.
> >>>>>> +      */
> >>>>>> +     spin_unlock(&sysfs_metadata->sysfs_entry_lock);
> >>>>>> +     kfree(dmabuf->sysfs_entry_metadata);
> >>>>>> +     dmabuf->sysfs_entry_metadata =3D NULL;
> >>>>>> +}
> >>>>>>
> >>>>>>     static struct kset *dma_buf_stats_kset;
> >>>>>>     static struct kset *dma_buf_per_buffer_stats_kset;
> >>>>>>     int dma_buf_init_sysfs_statistics(void)
> >>>>>>     {
> >>>>>> +     int ret;
> >>>>>> +
> >>>>>> +     ret =3D kobject_worklist_init();
> >>>>>> +     if (ret)
> >>>>>> +             return ret;
> >>>>>> +
> >>>>>>         dma_buf_stats_kset =3D kset_create_and_add("dmabuf",
> >>>>>>                                                  &dmabuf_sysfs_no_=
uevent_ops,
> >>>>>>                                                  kernel_kobj);
> >>>>>> @@ -171,7 +450,8 @@ void dma_buf_uninit_sysfs_statistics(void)
> >>>>>>     int dma_buf_stats_setup(struct dma_buf *dmabuf)
> >>>>>>     {
> >>>>>>         struct dma_buf_sysfs_entry *sysfs_entry;
> >>>>>> -     int ret;
> >>>>>> +     struct dma_buf_sysfs_entry_metadata *sysfs_metadata;
> >>>>>> +     struct dmabuf_kobj_work *kobj_work;
> >>>>>>
> >>>>>>         if (!dmabuf || !dmabuf->file)
> >>>>>>                 return -EINVAL;
> >>>>>> @@ -188,18 +468,35 @@ int dma_buf_stats_setup(struct dma_buf *dmab=
uf)
> >>>>>>         sysfs_entry->kobj.kset =3D dma_buf_per_buffer_stats_kset;
> >>>>>>         sysfs_entry->dmabuf =3D dmabuf;
> >>>>>>
> >>>>>> +     sysfs_metadata =3D kzalloc(sizeof(struct dma_buf_sysfs_entry=
_metadata),
> >>>>>> +                              GFP_KERNEL);
> >>>>>> +     if (!sysfs_metadata) {
> >>>>>> +             kfree(sysfs_entry);
> >>>>>> +             return -ENOMEM;
> >>>>>> +     }
> >>>>>> +
> >>>>>>         dmabuf->sysfs_entry =3D sysfs_entry;
> >>>>>>
> >>>>>> -     /* create the directory for buffer stats */
> >>>>>> -     ret =3D kobject_init_and_add(&sysfs_entry->kobj, &dma_buf_kt=
ype, NULL,
> >>>>>> -                                "%lu", file_inode(dmabuf->file)->=
i_ino);
> >>>>>> -     if (ret)
> >>>>>> -             goto err_sysfs_dmabuf;
> >>>>>> +     sysfs_metadata->status =3D SYSFS_ENTRY_UNINITIALIZED;
> >>>>>> +     spin_lock_init(&sysfs_metadata->sysfs_entry_lock);
> >>>>>>
> >>>>>> -     return 0;
> >>>>>> +     dmabuf->sysfs_entry_metadata =3D sysfs_metadata;
> >>>>>>
> >>>>>> -err_sysfs_dmabuf:
> >>>>>> -     kobject_put(&sysfs_entry->kobj);
> >>>>>> -     dmabuf->sysfs_entry =3D NULL;
> >>>>>> -     return ret;
> >>>>>> +     kobj_work =3D kzalloc(sizeof(struct dmabuf_kobj_work), GFP_K=
ERNEL);
> >>>>>> +     if (!kobj_work) {
> >>>>>> +             kfree(sysfs_entry);
> >>>>>> +             kfree(sysfs_metadata);
> >>>>>> +             return -ENOMEM;
> >>>>>> +     }
> >>>>>> +
> >>>>>> +     kobj_work->sysfs_entry =3D dmabuf->sysfs_entry;
> >>>>>> +     kobj_work->sysfs_metadata =3D dmabuf->sysfs_entry_metadata;
> >>>>>> +     /*
> >>>>>> +      * stash the inode number in struct dmabuf_kobj_work since s=
etup
> >>>>>> +      * might race with DMA-BUF teardown.
> >>>>>> +      */
> >>>>>> +     kobj_work->uid =3D file_inode(dmabuf->file)->i_ino;
> >>>>>> +
> >>>>>> +     deferred_kobject_create(kobj_work);
> >>>>>> +     return 0;
> >>>>>>     }
> >>>>>> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> >>>>>> index 7ab50076e7a6..0597690023a0 100644
> >>>>>> --- a/include/linux/dma-buf.h
> >>>>>> +++ b/include/linux/dma-buf.h
> >>>>>> @@ -287,6 +287,50 @@ struct dma_buf_ops {
> >>>>>>         void (*vunmap)(struct dma_buf *dmabuf, struct dma_buf_map =
*map);
> >>>>>>     };
> >>>>>>
> >>>>>> +#ifdef CONFIG_DMABUF_SYSFS_STATS
> >>>>>> +enum sysfs_entry_status {
> >>>>>> +     SYSFS_ENTRY_UNINITIALIZED,
> >>>>>> +     SYSFS_ENTRY_INIT_IN_PROGRESS,
> >>>>>> +     SYSFS_ENTRY_ERROR,
> >>>>>> +     SYSFS_ENTRY_INIT_ABORTED,
> >>>>>> +     SYSFS_ENTRY_INITIALIZED,
> >>>>>> +};
> >>>>>> +
> >>>>>> +/*
> >>>>>> + * struct dma_buf_sysfs_entry_metadata - Holds the current status=
 for the
> >>>>>> + * DMA-BUF sysfs entry.
> >>>>>> + *
> >>>>>> + * @status: holds the current status for the DMA-BUF sysfs entry.=
 The status of
> >>>>>> + * the sysfs entry has the following path.
> >>>>>> + *
> >>>>>> + *                   SYSFS_ENTRY_UNINITIALIZED
> >>>>>> + *            __________________|____________________
> >>>>>> + *           |                                       |
> >>>>>> + *     SYSFS_ENTRY_INIT_IN_PROGRESS      SYSFS_ENTRY_INIT_ABORTED=
 (DMA-BUF
> >>>>>> + *           |                                                   =
  gets freed
> >>>>>> + *           |                                                   =
  before
> >>>>>> + *           |                                                   =
  init)
> >>>>>> + *   ________|_____________________________________
> >>>>>> + *   |                         |                   |
> >>>>>> + * SYSFS_ENTRY_INITIALIZED     |       SYSFS_ENTRY_INIT_ABORTED
> >>>>>> + *                             |               (DMA-BUF gets free=
d during kobject
> >>>>>> + *                             |               init)
> >>>>>> + *                             |
> >>>>>> + *                             |
> >>>>>> + *                 SYSFS_ENTRY_ERROR
> >>>>>> + *                 (error during kobject init)
> >>>>>> + *
> >>>>>> + * @sysfs_entry_lock: protects access to @status.
> >>>>>> + */
> >>>>>> +struct dma_buf_sysfs_entry_metadata {
> >>>>>> +     enum sysfs_entry_status status;
> >>>>>> +     /*
> >>>>>> +      * Protects sysfs_entry_metadata->status
> >>>>>> +      */
> >>>>>> +     spinlock_t sysfs_entry_lock;
> >>>>>> +};
> >>>>>> +#endif
> >>>>>> +
> >>>>>>     /**
> >>>>>>      * struct dma_buf - shared buffer object
> >>>>>>      *
> >>>>>> @@ -452,6 +496,8 @@ struct dma_buf {
> >>>>>>                 struct kobject kobj;
> >>>>>>                 struct dma_buf *dmabuf;
> >>>>>>         } *sysfs_entry;
> >>>>>> +
> >>>>>> +     struct dma_buf_sysfs_entry_metadata *sysfs_entry_metadata;
> >>>>>>     #endif
> >>>>>>     };
> >>>>>>
>
