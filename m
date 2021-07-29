Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7D43DA332
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 14:31:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F5766E082;
	Thu, 29 Jul 2021 12:31:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7CB46E082
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 12:31:40 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 c7-20020a9d27870000b02904d360fbc71bso5648174otb.10
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 05:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Kjd2WJ5/vwtAR5EF+yYhE5KpkDdl2tyxxCEI14OcFo4=;
 b=Zi/bOaiIJHbniXArTRUNWs/o/No7tm5K4P9QlUKOExj8sbqBxGLN9Uta8kR0f/KbCe
 lZ1hmrvaUM3Y00PgrgL3WC8xGCUUNlfaLjywXa/baBUM0tv8aMpOdMrFBfsKNbnua3Fw
 5AsYCkNMmK461lvRXyS3JsUcAMpJZqvLLXUtE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Kjd2WJ5/vwtAR5EF+yYhE5KpkDdl2tyxxCEI14OcFo4=;
 b=oJiflyMdDLuOGKGYf1PY+ysoljz8aCZ4XvVGm5dEo+qXXPHBa3ig7CEHlZw/2ydJ07
 8LfKehg7HGv6JfOjtTdLOHQdV/e5V63/68SGUBCmCZspmxwFPw5ajMiHlatMsxZprQpt
 3jH8JVcvwB9H/y/4oFaNBgO3k/xZNBMsk+xo13nJrqkYOvIl8Dbrov59jzcgPEUQeGDi
 NyEriXuWps01v0bIJUAW8yfBiMO0ZF+Mj7As4TZngUiv4+/cicU4e7CHT0et8D3xj6nn
 cyTuZX8fKd3minbaCXj+aQ3zBOFqYJA7Ubq1+E9JEbu083/l7a+ZdOdc8qP3dXg/GZUf
 vuRQ==
X-Gm-Message-State: AOAM5335SZOHID89Hf5MqYGEd4sLnqD6g5qLIugYk8tgux0R6MKbcN7v
 JLbxJZwLMt9I3GB/1TfvRtixicL9zNbMrul6GJxV6Q==
X-Google-Smtp-Source: ABdhPJwJnYHqrf0jJ9fQQJ32c7P2QVQphg1F+TVYAqCOXl+6V5+8fOHahVTIg4VNad0UFtnn4Z8cGbD1sbII4ngabVw=
X-Received: by 2002:a9d:27a4:: with SMTP id c33mr3346635otb.281.1627561899939; 
 Thu, 29 Jul 2021 05:31:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210729070330.41443-1-christian.koenig@amd.com>
 <20210729070330.41443-3-christian.koenig@amd.com>
 <YQJXi2JNZdH5DaR2@phenom.ffwll.local>
 <800b0278-922e-e7d8-450d-59721bb68585@gmail.com>
 <CAKMK7uHzbXY3vsGtwMaqzJNuXPffgOz8xuWDfgDPqsW7ijMnJw@mail.gmail.com>
 <14321470-0c5a-c8df-44b7-0873b6a44166@gmail.com>
 <CAKMK7uH5nJxrN30t_GkxgH2eKXYJO3uN8pod20R0bJeEoSsNiQ@mail.gmail.com>
 <0acb7094-ee1f-cc52-e077-795f7119b3e1@gmail.com>
In-Reply-To: <0acb7094-ee1f-cc52-e077-795f7119b3e1@gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 29 Jul 2021 14:31:28 +0200
Message-ID: <CAKMK7uGQJpgPN8PJPzz27b=sUy41gnkzhWPXvwsB0ym3Xi_F7Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] dma-buf: nuke SW_SYNC debugfs files
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
Cc: "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>, Gustavo Padovan <gustavo@padovan.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 29, 2021 at 2:25 PM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 29.07.21 um 13:59 schrieb Daniel Vetter:
> > On Thu, Jul 29, 2021 at 12:21 PM Christian K=C3=B6nig
> > <ckoenig.leichtzumerken@gmail.com> wrote:
> >> Am 29.07.21 um 11:03 schrieb Daniel Vetter:
> >>> On Thu, Jul 29, 2021 at 10:38 AM Christian K=C3=B6nig
> >>> <ckoenig.leichtzumerken@gmail.com> wrote:
> >>>> Am 29.07.21 um 09:23 schrieb Daniel Vetter:
> >>>>> On Thu, Jul 29, 2021 at 09:03:30AM +0200, Christian K=C3=B6nig wrot=
e:
> >>>>>> As we now knew controlling dma_fence synchronization from userspac=
e is
> >>>>>> extremely dangerous and can not only deadlock drivers but triviall=
y also the
> >>>>>> whole kernel memory management.
> >>>>>>
> >>>>>> Entirely remove this option. We now have in kernel unit tests to e=
xercise the
> >>>>>> dma_fence framework and it's containers.
> >>>>>>
> >>>>>> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >>>>> There's also igts for this, and Android heavily uses this. So I'm n=
ot sure
> >>>>> we can just nuke it.
> >>>> I feared that you would say that.
> >>>>
> >>>>> I guess what we could do is maybe just taint the kernel if it's eve=
r used?
> >>>> What should we use then? TAINT_SOFTLOCKUP or TAINT_CRAP? :)
> >>> I think the cleanest solution would be to install a 10s timer on each
> >>> sw fence, and TAINT_SOFTLOOKUP if it fails to signal. That's similar
> >>> to what we do with vgem, except vgem then just steps in with a
> >>> dma_fence_signal() instead of tainting the kernel.
> >> Well vgem is only for testing as far as I know.
> > I think CrOS is using it to shovel buffers around between process, as
> > a convenient allocator for sw rendering dma-buf. But they don't use
> > the dma-fence part afaik.
> >
> > We can't taint in vgem fences though because our CI reboots on any
> > taint (or lockdep splat) and a few others, so that would make it
> > useless for testing. Maybe we should have the fence part of vgem
> > behind a separate Kconfig?
>
> And then making it depend on CONFIG_BROKEN? :)
>
> But more serious, that it probably makes sense.
>
> Can you take care of that? I'm not that familiar with the vgem code base.

Iirc CONFIG_BROKEN is stuff you can't even enable at all. So not an
option. Just a separate Kconfig for the fence ioctls.

> >> When Android is using this for a production environment I think we
> >> should be a bit harder and explicitly note that this is not a good ide=
a
> >> in sw_sync_debugfs_open().
> >>
> >>> I think that should keep everyone happy, because if your Android has =
a
> >>> fence stuck for more than 10s it's busted.
> >> Well when they are using userptrs they are busted as soon as they have=
 a
> >> fence stuck for much less time.
> > Hm right I forgot that you can't guarantee that it will complete, ever =
:-)
> >
> > Otoh I'm not sure the unconditional taint is very nice to the android
> > folks, they'll probably just patch it out and then it looses it
> > usefulness. taint on timeout otoh makes sure that normally it's not
> > hit, but anytime you die in userptr or shrinker there will be a taint
> > before anything else (since 10s is much shorter than the "stuck in
> > non-interruptible sleep" warning).
>
> And then you don't hit the timeout during test but only in production,
> e.g. not good enough either.
>
> And yes I know that this is not really nice. But since this depends on
> debugfs and Android usually disables debugfs AFAIK, they probably have
> that heavily patched already anyway.
>
> I just want to make sure that nobody else has the brilliant idea to
> enable this and build an userspace stack on top of a fundamentally
> broken approach.
>
> Alternative is to add a dependency to CONFIG_BROKEN.

Yeah CONFIG_BROKEN isn't a thing either that is useful. It's for code
that doesn't even compile (or soon will stop compiling) because build
testers never set that. And I think you have to patch the source to
even be able to get at it. So about equivalent to removal, except less
honest :-)

Tbh I'd just leave things as-is. Occasionally we have mildly terrible
stuff in-tree ...
-Daniel

> Christian.
>
> > -Daniel
> >
> >> Regards,
> >> Christian.
> >>
> >>> Note that with hwc1 the indefinite fence was actually the model, when
> >>> you did a page_flip you got an out-fence back which will only be
> >>> signalled when the new buffer _stopped_ being used for scanout. Which
> >>> generally depends upon the next page-flip happening (except for manua=
l
> >>> mode display, which only scan out once, if you ignore that the
> >>> kernel's supposed to restore the display after suspend/resume, which
> >>> android did). hwc2 fixed this, so a 10s timeout-to-taint should be
> >>> fine with Android people.
> >>>
> >>> Also since we do have the igt/sw_sync.c test intel-gfx-ci should be
> >>> able to check that code even.
> >>> -Daniel
> >>>
> >>>> Regards,
> >>>> Christian.
> >>>>
> >>>>> Also for testing we use vgem now, which enforces a timeout.
> >>>>> -Daniel
> >>>>>
> >>>>>> ---
> >>>>>>     drivers/dma-buf/Kconfig      |  13 --
> >>>>>>     drivers/dma-buf/Makefile     |   1 -
> >>>>>>     drivers/dma-buf/sw_sync.c    | 412 ---------------------------=
--------
> >>>>>>     drivers/dma-buf/sync_debug.c | 190 ----------------
> >>>>>>     drivers/dma-buf/sync_debug.h |  72 ------
> >>>>>>     5 files changed, 688 deletions(-)
> >>>>>>     delete mode 100644 drivers/dma-buf/sw_sync.c
> >>>>>>     delete mode 100644 drivers/dma-buf/sync_debug.c
> >>>>>>     delete mode 100644 drivers/dma-buf/sync_debug.h
> >>>>>>
> >>>>>> diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
> >>>>>> index 9561e3d2d428..26c53f45616a 100644
> >>>>>> --- a/drivers/dma-buf/Kconfig
> >>>>>> +++ b/drivers/dma-buf/Kconfig
> >>>>>> @@ -17,19 +17,6 @@ config SYNC_FILE
> >>>>>>          Files fds, to the DRM driver for example. More details at
> >>>>>>          Documentation/driver-api/sync_file.rst.
> >>>>>>
> >>>>>> -config SW_SYNC
> >>>>>> -    bool "Sync File Validation Framework"
> >>>>>> -    default n
> >>>>>> -    depends on SYNC_FILE
> >>>>>> -    depends on DEBUG_FS
> >>>>>> -    help
> >>>>>> -      A sync object driver that uses a 32bit counter to coordinat=
e
> >>>>>> -      synchronization.  Useful when there is no hardware primitiv=
e backing
> >>>>>> -      the synchronization.
> >>>>>> -
> >>>>>> -      WARNING: improper use of this can result in deadlocking ker=
nel
> >>>>>> -      drivers from userspace. Intended for test and debug only.
> >>>>>> -
> >>>>>>     config UDMABUF
> >>>>>>        bool "userspace dmabuf misc driver"
> >>>>>>        default n
> >>>>>> diff --git a/drivers/dma-buf/Makefile b/drivers/dma-buf/Makefile
> >>>>>> index 1ef021273a06..fa3af0953f87 100644
> >>>>>> --- a/drivers/dma-buf/Makefile
> >>>>>> +++ b/drivers/dma-buf/Makefile
> >>>>>> @@ -4,7 +4,6 @@ obj-y :=3D dma-buf.o dma-fence.o dma-fence-array.o=
 dma-fence-chain.o \
> >>>>>>     obj-$(CONFIG_DMABUF_HEAPS) +=3D dma-heap.o
> >>>>>>     obj-$(CONFIG_DMABUF_HEAPS) +=3D heaps/
> >>>>>>     obj-$(CONFIG_SYNC_FILE)            +=3D sync_file.o
> >>>>>> -obj-$(CONFIG_SW_SYNC)               +=3D sw_sync.o sync_debug.o
> >>>>>>     obj-$(CONFIG_UDMABUF)              +=3D udmabuf.o
> >>>>>>     obj-$(CONFIG_DMABUF_SYSFS_STATS) +=3D dma-buf-sysfs-stats.o
> >>>>>>
> >>>>>> diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
> >>>>>> deleted file mode 100644
> >>>>>> index 348b3a9170fa..000000000000
> >>>>>> --- a/drivers/dma-buf/sw_sync.c
> >>>>>> +++ /dev/null
> >>>>>> @@ -1,412 +0,0 @@
> >>>>>> -// SPDX-License-Identifier: GPL-2.0-only
> >>>>>> -/*
> >>>>>> - * Sync File validation framework
> >>>>>> - *
> >>>>>> - * Copyright (C) 2012 Google, Inc.
> >>>>>> - */
> >>>>>> -
> >>>>>> -#include <linux/file.h>
> >>>>>> -#include <linux/fs.h>
> >>>>>> -#include <linux/uaccess.h>
> >>>>>> -#include <linux/slab.h>
> >>>>>> -#include <linux/sync_file.h>
> >>>>>> -
> >>>>>> -#include "sync_debug.h"
> >>>>>> -
> >>>>>> -#define CREATE_TRACE_POINTS
> >>>>>> -#include "sync_trace.h"
> >>>>>> -
> >>>>>> -/*
> >>>>>> - * SW SYNC validation framework
> >>>>>> - *
> >>>>>> - * A sync object driver that uses a 32bit counter to coordinate
> >>>>>> - * synchronization.  Useful when there is no hardware primitive b=
acking
> >>>>>> - * the synchronization.
> >>>>>> - *
> >>>>>> - * To start the framework just open:
> >>>>>> - *
> >>>>>> - * <debugfs>/sync/sw_sync
> >>>>>> - *
> >>>>>> - * That will create a sync timeline, all fences created under thi=
s timeline
> >>>>>> - * file descriptor will belong to the this timeline.
> >>>>>> - *
> >>>>>> - * The 'sw_sync' file can be opened many times as to create diffe=
rent
> >>>>>> - * timelines.
> >>>>>> - *
> >>>>>> - * Fences can be created with SW_SYNC_IOC_CREATE_FENCE ioctl with=
 struct
> >>>>>> - * sw_sync_create_fence_data as parameter.
> >>>>>> - *
> >>>>>> - * To increment the timeline counter, SW_SYNC_IOC_INC ioctl shoul=
d be used
> >>>>>> - * with the increment as u32. This will update the last signaled =
value
> >>>>>> - * from the timeline and signal any fence that has a seqno smalle=
r or equal
> >>>>>> - * to it.
> >>>>>> - *
> >>>>>> - * struct sw_sync_create_fence_data
> >>>>>> - * @value:  the seqno to initialise the fence with
> >>>>>> - * @name:   the name of the new sync point
> >>>>>> - * @fence:  return the fd of the new sync_file with the created f=
ence
> >>>>>> - */
> >>>>>> -struct sw_sync_create_fence_data {
> >>>>>> -    __u32   value;
> >>>>>> -    char    name[32];
> >>>>>> -    __s32   fence; /* fd of new fence */
> >>>>>> -};
> >>>>>> -
> >>>>>> -#define SW_SYNC_IOC_MAGIC   'W'
> >>>>>> -
> >>>>>> -#define SW_SYNC_IOC_CREATE_FENCE    _IOWR(SW_SYNC_IOC_MAGIC, 0,\
> >>>>>> -            struct sw_sync_create_fence_data)
> >>>>>> -
> >>>>>> -#define SW_SYNC_IOC_INC                     _IOW(SW_SYNC_IOC_MAGI=
C, 1, __u32)
> >>>>>> -
> >>>>>> -static const struct dma_fence_ops timeline_fence_ops;
> >>>>>> -
> >>>>>> -static inline struct sync_pt *dma_fence_to_sync_pt(struct dma_fen=
ce *fence)
> >>>>>> -{
> >>>>>> -    if (fence->ops !=3D &timeline_fence_ops)
> >>>>>> -            return NULL;
> >>>>>> -    return container_of(fence, struct sync_pt, base);
> >>>>>> -}
> >>>>>> -
> >>>>>> -/**
> >>>>>> - * sync_timeline_create() - creates a sync object
> >>>>>> - * @name:   sync_timeline name
> >>>>>> - *
> >>>>>> - * Creates a new sync_timeline. Returns the sync_timeline object =
or NULL in
> >>>>>> - * case of error.
> >>>>>> - */
> >>>>>> -static struct sync_timeline *sync_timeline_create(const char *nam=
e)
> >>>>>> -{
> >>>>>> -    struct sync_timeline *obj;
> >>>>>> -
> >>>>>> -    obj =3D kzalloc(sizeof(*obj), GFP_KERNEL);
> >>>>>> -    if (!obj)
> >>>>>> -            return NULL;
> >>>>>> -
> >>>>>> -    kref_init(&obj->kref);
> >>>>>> -    obj->context =3D dma_fence_context_alloc(1);
> >>>>>> -    strlcpy(obj->name, name, sizeof(obj->name));
> >>>>>> -
> >>>>>> -    obj->pt_tree =3D RB_ROOT;
> >>>>>> -    INIT_LIST_HEAD(&obj->pt_list);
> >>>>>> -    spin_lock_init(&obj->lock);
> >>>>>> -
> >>>>>> -    sync_timeline_debug_add(obj);
> >>>>>> -
> >>>>>> -    return obj;
> >>>>>> -}
> >>>>>> -
> >>>>>> -static void sync_timeline_free(struct kref *kref)
> >>>>>> -{
> >>>>>> -    struct sync_timeline *obj =3D
> >>>>>> -            container_of(kref, struct sync_timeline, kref);
> >>>>>> -
> >>>>>> -    sync_timeline_debug_remove(obj);
> >>>>>> -
> >>>>>> -    kfree(obj);
> >>>>>> -}
> >>>>>> -
> >>>>>> -static void sync_timeline_get(struct sync_timeline *obj)
> >>>>>> -{
> >>>>>> -    kref_get(&obj->kref);
> >>>>>> -}
> >>>>>> -
> >>>>>> -static void sync_timeline_put(struct sync_timeline *obj)
> >>>>>> -{
> >>>>>> -    kref_put(&obj->kref, sync_timeline_free);
> >>>>>> -}
> >>>>>> -
> >>>>>> -static const char *timeline_fence_get_driver_name(struct dma_fenc=
e *fence)
> >>>>>> -{
> >>>>>> -    return "sw_sync";
> >>>>>> -}
> >>>>>> -
> >>>>>> -static const char *timeline_fence_get_timeline_name(struct dma_fe=
nce *fence)
> >>>>>> -{
> >>>>>> -    struct sync_timeline *parent =3D dma_fence_parent(fence);
> >>>>>> -
> >>>>>> -    return parent->name;
> >>>>>> -}
> >>>>>> -
> >>>>>> -static void timeline_fence_release(struct dma_fence *fence)
> >>>>>> -{
> >>>>>> -    struct sync_pt *pt =3D dma_fence_to_sync_pt(fence);
> >>>>>> -    struct sync_timeline *parent =3D dma_fence_parent(fence);
> >>>>>> -    unsigned long flags;
> >>>>>> -
> >>>>>> -    spin_lock_irqsave(fence->lock, flags);
> >>>>>> -    if (!list_empty(&pt->link)) {
> >>>>>> -            list_del(&pt->link);
> >>>>>> -            rb_erase(&pt->node, &parent->pt_tree);
> >>>>>> -    }
> >>>>>> -    spin_unlock_irqrestore(fence->lock, flags);
> >>>>>> -
> >>>>>> -    sync_timeline_put(parent);
> >>>>>> -    dma_fence_free(fence);
> >>>>>> -}
> >>>>>> -
> >>>>>> -static bool timeline_fence_signaled(struct dma_fence *fence)
> >>>>>> -{
> >>>>>> -    struct sync_timeline *parent =3D dma_fence_parent(fence);
> >>>>>> -
> >>>>>> -    return !__dma_fence_is_later(fence->seqno, parent->value, fen=
ce->ops);
> >>>>>> -}
> >>>>>> -
> >>>>>> -static bool timeline_fence_enable_signaling(struct dma_fence *fen=
ce)
> >>>>>> -{
> >>>>>> -    return true;
> >>>>>> -}
> >>>>>> -
> >>>>>> -static void timeline_fence_value_str(struct dma_fence *fence,
> >>>>>> -                                char *str, int size)
> >>>>>> -{
> >>>>>> -    snprintf(str, size, "%lld", fence->seqno);
> >>>>>> -}
> >>>>>> -
> >>>>>> -static void timeline_fence_timeline_value_str(struct dma_fence *f=
ence,
> >>>>>> -                                         char *str, int size)
> >>>>>> -{
> >>>>>> -    struct sync_timeline *parent =3D dma_fence_parent(fence);
> >>>>>> -
> >>>>>> -    snprintf(str, size, "%d", parent->value);
> >>>>>> -}
> >>>>>> -
> >>>>>> -static const struct dma_fence_ops timeline_fence_ops =3D {
> >>>>>> -    .get_driver_name =3D timeline_fence_get_driver_name,
> >>>>>> -    .get_timeline_name =3D timeline_fence_get_timeline_name,
> >>>>>> -    .enable_signaling =3D timeline_fence_enable_signaling,
> >>>>>> -    .signaled =3D timeline_fence_signaled,
> >>>>>> -    .release =3D timeline_fence_release,
> >>>>>> -    .fence_value_str =3D timeline_fence_value_str,
> >>>>>> -    .timeline_value_str =3D timeline_fence_timeline_value_str,
> >>>>>> -};
> >>>>>> -
> >>>>>> -/**
> >>>>>> - * sync_timeline_signal() - signal a status change on a sync_time=
line
> >>>>>> - * @obj:    sync_timeline to signal
> >>>>>> - * @inc:    num to increment on timeline->value
> >>>>>> - *
> >>>>>> - * A sync implementation should call this any time one of it's fe=
nces
> >>>>>> - * has signaled or has an error condition.
> >>>>>> - */
> >>>>>> -static void sync_timeline_signal(struct sync_timeline *obj, unsig=
ned int inc)
> >>>>>> -{
> >>>>>> -    struct sync_pt *pt, *next;
> >>>>>> -
> >>>>>> -    trace_sync_timeline(obj);
> >>>>>> -
> >>>>>> -    spin_lock_irq(&obj->lock);
> >>>>>> -
> >>>>>> -    obj->value +=3D inc;
> >>>>>> -
> >>>>>> -    list_for_each_entry_safe(pt, next, &obj->pt_list, link) {
> >>>>>> -            if (!timeline_fence_signaled(&pt->base))
> >>>>>> -                    break;
> >>>>>> -
> >>>>>> -            list_del_init(&pt->link);
> >>>>>> -            rb_erase(&pt->node, &obj->pt_tree);
> >>>>>> -
> >>>>>> -            /*
> >>>>>> -             * A signal callback may release the last reference t=
o this
> >>>>>> -             * fence, causing it to be freed. That operation has =
to be
> >>>>>> -             * last to avoid a use after free inside this loop, a=
nd must
> >>>>>> -             * be after we remove the fence from the timeline in =
order to
> >>>>>> -             * prevent deadlocking on timeline->lock inside
> >>>>>> -             * timeline_fence_release().
> >>>>>> -             */
> >>>>>> -            dma_fence_signal_locked(&pt->base);
> >>>>>> -    }
> >>>>>> -
> >>>>>> -    spin_unlock_irq(&obj->lock);
> >>>>>> -}
> >>>>>> -
> >>>>>> -/**
> >>>>>> - * sync_pt_create() - creates a sync pt
> >>>>>> - * @obj:    parent sync_timeline
> >>>>>> - * @value:  value of the fence
> >>>>>> - *
> >>>>>> - * Creates a new sync_pt (fence) as a child of @parent.  @size by=
tes will be
> >>>>>> - * allocated allowing for implementation specific data to be kept=
 after
> >>>>>> - * the generic sync_timeline struct. Returns the sync_pt object o=
r
> >>>>>> - * NULL in case of error.
> >>>>>> - */
> >>>>>> -static struct sync_pt *sync_pt_create(struct sync_timeline *obj,
> >>>>>> -                                  unsigned int value)
> >>>>>> -{
> >>>>>> -    struct sync_pt *pt;
> >>>>>> -
> >>>>>> -    pt =3D kzalloc(sizeof(*pt), GFP_KERNEL);
> >>>>>> -    if (!pt)
> >>>>>> -            return NULL;
> >>>>>> -
> >>>>>> -    sync_timeline_get(obj);
> >>>>>> -    dma_fence_init(&pt->base, &timeline_fence_ops, &obj->lock,
> >>>>>> -                   obj->context, value);
> >>>>>> -    INIT_LIST_HEAD(&pt->link);
> >>>>>> -
> >>>>>> -    spin_lock_irq(&obj->lock);
> >>>>>> -    if (!dma_fence_is_signaled_locked(&pt->base)) {
> >>>>>> -            struct rb_node **p =3D &obj->pt_tree.rb_node;
> >>>>>> -            struct rb_node *parent =3D NULL;
> >>>>>> -
> >>>>>> -            while (*p) {
> >>>>>> -                    struct sync_pt *other;
> >>>>>> -                    int cmp;
> >>>>>> -
> >>>>>> -                    parent =3D *p;
> >>>>>> -                    other =3D rb_entry(parent, typeof(*pt), node)=
;
> >>>>>> -                    cmp =3D value - other->base.seqno;
> >>>>>> -                    if (cmp > 0) {
> >>>>>> -                            p =3D &parent->rb_right;
> >>>>>> -                    } else if (cmp < 0) {
> >>>>>> -                            p =3D &parent->rb_left;
> >>>>>> -                    } else {
> >>>>>> -                            if (dma_fence_get_rcu(&other->base)) =
{
> >>>>>> -                                    sync_timeline_put(obj);
> >>>>>> -                                    kfree(pt);
> >>>>>> -                                    pt =3D other;
> >>>>>> -                                    goto unlock;
> >>>>>> -                            }
> >>>>>> -                            p =3D &parent->rb_left;
> >>>>>> -                    }
> >>>>>> -            }
> >>>>>> -            rb_link_node(&pt->node, parent, p);
> >>>>>> -            rb_insert_color(&pt->node, &obj->pt_tree);
> >>>>>> -
> >>>>>> -            parent =3D rb_next(&pt->node);
> >>>>>> -            list_add_tail(&pt->link,
> >>>>>> -                          parent ? &rb_entry(parent, typeof(*pt),=
 node)->link : &obj->pt_list);
> >>>>>> -    }
> >>>>>> -unlock:
> >>>>>> -    spin_unlock_irq(&obj->lock);
> >>>>>> -
> >>>>>> -    return pt;
> >>>>>> -}
> >>>>>> -
> >>>>>> -/*
> >>>>>> - * *WARNING*
> >>>>>> - *
> >>>>>> - * improper use of this can result in deadlocking kernel drivers =
from userspace.
> >>>>>> - */
> >>>>>> -
> >>>>>> -/* opening sw_sync create a new sync obj */
> >>>>>> -static int sw_sync_debugfs_open(struct inode *inode, struct file =
*file)
> >>>>>> -{
> >>>>>> -    struct sync_timeline *obj;
> >>>>>> -    char task_comm[TASK_COMM_LEN];
> >>>>>> -
> >>>>>> -    get_task_comm(task_comm, current);
> >>>>>> -
> >>>>>> -    obj =3D sync_timeline_create(task_comm);
> >>>>>> -    if (!obj)
> >>>>>> -            return -ENOMEM;
> >>>>>> -
> >>>>>> -    file->private_data =3D obj;
> >>>>>> -
> >>>>>> -    return 0;
> >>>>>> -}
> >>>>>> -
> >>>>>> -static int sw_sync_debugfs_release(struct inode *inode, struct fi=
le *file)
> >>>>>> -{
> >>>>>> -    struct sync_timeline *obj =3D file->private_data;
> >>>>>> -    struct sync_pt *pt, *next;
> >>>>>> -
> >>>>>> -    spin_lock_irq(&obj->lock);
> >>>>>> -
> >>>>>> -    list_for_each_entry_safe(pt, next, &obj->pt_list, link) {
> >>>>>> -            dma_fence_set_error(&pt->base, -ENOENT);
> >>>>>> -            dma_fence_signal_locked(&pt->base);
> >>>>>> -    }
> >>>>>> -
> >>>>>> -    spin_unlock_irq(&obj->lock);
> >>>>>> -
> >>>>>> -    sync_timeline_put(obj);
> >>>>>> -    return 0;
> >>>>>> -}
> >>>>>> -
> >>>>>> -static long sw_sync_ioctl_create_fence(struct sync_timeline *obj,
> >>>>>> -                                   unsigned long arg)
> >>>>>> -{
> >>>>>> -    int fd =3D get_unused_fd_flags(O_CLOEXEC);
> >>>>>> -    int err;
> >>>>>> -    struct sync_pt *pt;
> >>>>>> -    struct sync_file *sync_file;
> >>>>>> -    struct sw_sync_create_fence_data data;
> >>>>>> -
> >>>>>> -    if (fd < 0)
> >>>>>> -            return fd;
> >>>>>> -
> >>>>>> -    if (copy_from_user(&data, (void __user *)arg, sizeof(data))) =
{
> >>>>>> -            err =3D -EFAULT;
> >>>>>> -            goto err;
> >>>>>> -    }
> >>>>>> -
> >>>>>> -    pt =3D sync_pt_create(obj, data.value);
> >>>>>> -    if (!pt) {
> >>>>>> -            err =3D -ENOMEM;
> >>>>>> -            goto err;
> >>>>>> -    }
> >>>>>> -
> >>>>>> -    sync_file =3D sync_file_create(&pt->base);
> >>>>>> -    dma_fence_put(&pt->base);
> >>>>>> -    if (!sync_file) {
> >>>>>> -            err =3D -ENOMEM;
> >>>>>> -            goto err;
> >>>>>> -    }
> >>>>>> -
> >>>>>> -    data.fence =3D fd;
> >>>>>> -    if (copy_to_user((void __user *)arg, &data, sizeof(data))) {
> >>>>>> -            fput(sync_file->file);
> >>>>>> -            err =3D -EFAULT;
> >>>>>> -            goto err;
> >>>>>> -    }
> >>>>>> -
> >>>>>> -    fd_install(fd, sync_file->file);
> >>>>>> -
> >>>>>> -    return 0;
> >>>>>> -
> >>>>>> -err:
> >>>>>> -    put_unused_fd(fd);
> >>>>>> -    return err;
> >>>>>> -}
> >>>>>> -
> >>>>>> -static long sw_sync_ioctl_inc(struct sync_timeline *obj, unsigned=
 long arg)
> >>>>>> -{
> >>>>>> -    u32 value;
> >>>>>> -
> >>>>>> -    if (copy_from_user(&value, (void __user *)arg, sizeof(value))=
)
> >>>>>> -            return -EFAULT;
> >>>>>> -
> >>>>>> -    while (value > INT_MAX)  {
> >>>>>> -            sync_timeline_signal(obj, INT_MAX);
> >>>>>> -            value -=3D INT_MAX;
> >>>>>> -    }
> >>>>>> -
> >>>>>> -    sync_timeline_signal(obj, value);
> >>>>>> -
> >>>>>> -    return 0;
> >>>>>> -}
> >>>>>> -
> >>>>>> -static long sw_sync_ioctl(struct file *file, unsigned int cmd,
> >>>>>> -                      unsigned long arg)
> >>>>>> -{
> >>>>>> -    struct sync_timeline *obj =3D file->private_data;
> >>>>>> -
> >>>>>> -    switch (cmd) {
> >>>>>> -    case SW_SYNC_IOC_CREATE_FENCE:
> >>>>>> -            return sw_sync_ioctl_create_fence(obj, arg);
> >>>>>> -
> >>>>>> -    case SW_SYNC_IOC_INC:
> >>>>>> -            return sw_sync_ioctl_inc(obj, arg);
> >>>>>> -
> >>>>>> -    default:
> >>>>>> -            return -ENOTTY;
> >>>>>> -    }
> >>>>>> -}
> >>>>>> -
> >>>>>> -const struct file_operations sw_sync_debugfs_fops =3D {
> >>>>>> -    .open           =3D sw_sync_debugfs_open,
> >>>>>> -    .release        =3D sw_sync_debugfs_release,
> >>>>>> -    .unlocked_ioctl =3D sw_sync_ioctl,
> >>>>>> -    .compat_ioctl   =3D compat_ptr_ioctl,
> >>>>>> -};
> >>>>>> diff --git a/drivers/dma-buf/sync_debug.c b/drivers/dma-buf/sync_d=
ebug.c
> >>>>>> deleted file mode 100644
> >>>>>> index 101394f16930..000000000000
> >>>>>> --- a/drivers/dma-buf/sync_debug.c
> >>>>>> +++ /dev/null
> >>>>>> @@ -1,190 +0,0 @@
> >>>>>> -// SPDX-License-Identifier: GPL-2.0-only
> >>>>>> -/*
> >>>>>> - * Sync File validation framework and debug information
> >>>>>> - *
> >>>>>> - * Copyright (C) 2012 Google, Inc.
> >>>>>> - */
> >>>>>> -
> >>>>>> -#include <linux/debugfs.h>
> >>>>>> -#include "sync_debug.h"
> >>>>>> -
> >>>>>> -static struct dentry *dbgfs;
> >>>>>> -
> >>>>>> -static LIST_HEAD(sync_timeline_list_head);
> >>>>>> -static DEFINE_SPINLOCK(sync_timeline_list_lock);
> >>>>>> -static LIST_HEAD(sync_file_list_head);
> >>>>>> -static DEFINE_SPINLOCK(sync_file_list_lock);
> >>>>>> -
> >>>>>> -void sync_timeline_debug_add(struct sync_timeline *obj)
> >>>>>> -{
> >>>>>> -    unsigned long flags;
> >>>>>> -
> >>>>>> -    spin_lock_irqsave(&sync_timeline_list_lock, flags);
> >>>>>> -    list_add_tail(&obj->sync_timeline_list, &sync_timeline_list_h=
ead);
> >>>>>> -    spin_unlock_irqrestore(&sync_timeline_list_lock, flags);
> >>>>>> -}
> >>>>>> -
> >>>>>> -void sync_timeline_debug_remove(struct sync_timeline *obj)
> >>>>>> -{
> >>>>>> -    unsigned long flags;
> >>>>>> -
> >>>>>> -    spin_lock_irqsave(&sync_timeline_list_lock, flags);
> >>>>>> -    list_del(&obj->sync_timeline_list);
> >>>>>> -    spin_unlock_irqrestore(&sync_timeline_list_lock, flags);
> >>>>>> -}
> >>>>>> -
> >>>>>> -void sync_file_debug_add(struct sync_file *sync_file)
> >>>>>> -{
> >>>>>> -    unsigned long flags;
> >>>>>> -
> >>>>>> -    spin_lock_irqsave(&sync_file_list_lock, flags);
> >>>>>> -    list_add_tail(&sync_file->sync_file_list, &sync_file_list_hea=
d);
> >>>>>> -    spin_unlock_irqrestore(&sync_file_list_lock, flags);
> >>>>>> -}
> >>>>>> -
> >>>>>> -void sync_file_debug_remove(struct sync_file *sync_file)
> >>>>>> -{
> >>>>>> -    unsigned long flags;
> >>>>>> -
> >>>>>> -    spin_lock_irqsave(&sync_file_list_lock, flags);
> >>>>>> -    list_del(&sync_file->sync_file_list);
> >>>>>> -    spin_unlock_irqrestore(&sync_file_list_lock, flags);
> >>>>>> -}
> >>>>>> -
> >>>>>> -static const char *sync_status_str(int status)
> >>>>>> -{
> >>>>>> -    if (status < 0)
> >>>>>> -            return "error";
> >>>>>> -
> >>>>>> -    if (status > 0)
> >>>>>> -            return "signaled";
> >>>>>> -
> >>>>>> -    return "active";
> >>>>>> -}
> >>>>>> -
> >>>>>> -static void sync_print_fence(struct seq_file *s,
> >>>>>> -                         struct dma_fence *fence, bool show)
> >>>>>> -{
> >>>>>> -    struct sync_timeline *parent =3D dma_fence_parent(fence);
> >>>>>> -    int status;
> >>>>>> -
> >>>>>> -    status =3D dma_fence_get_status_locked(fence);
> >>>>>> -
> >>>>>> -    seq_printf(s, "  %s%sfence %s",
> >>>>>> -               show ? parent->name : "",
> >>>>>> -               show ? "_" : "",
> >>>>>> -               sync_status_str(status));
> >>>>>> -
> >>>>>> -    if (test_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT, &fence->flags)) {
> >>>>>> -            struct timespec64 ts64 =3D
> >>>>>> -                    ktime_to_timespec64(fence->timestamp);
> >>>>>> -
> >>>>>> -            seq_printf(s, "@%lld.%09ld", (s64)ts64.tv_sec, ts64.t=
v_nsec);
> >>>>>> -    }
> >>>>>> -
> >>>>>> -    if (fence->ops->timeline_value_str &&
> >>>>>> -            fence->ops->fence_value_str) {
> >>>>>> -            char value[64];
> >>>>>> -            bool success;
> >>>>>> -
> >>>>>> -            fence->ops->fence_value_str(fence, value, sizeof(valu=
e));
> >>>>>> -            success =3D strlen(value);
> >>>>>> -
> >>>>>> -            if (success) {
> >>>>>> -                    seq_printf(s, ": %s", value);
> >>>>>> -
> >>>>>> -                    fence->ops->timeline_value_str(fence, value,
> >>>>>> -                                                   sizeof(value))=
;
> >>>>>> -
> >>>>>> -                    if (strlen(value))
> >>>>>> -                            seq_printf(s, " / %s", value);
> >>>>>> -            }
> >>>>>> -    }
> >>>>>> -
> >>>>>> -    seq_putc(s, '\n');
> >>>>>> -}
> >>>>>> -
> >>>>>> -static void sync_print_obj(struct seq_file *s, struct sync_timeli=
ne *obj)
> >>>>>> -{
> >>>>>> -    struct list_head *pos;
> >>>>>> -
> >>>>>> -    seq_printf(s, "%s: %d\n", obj->name, obj->value);
> >>>>>> -
> >>>>>> -    spin_lock_irq(&obj->lock);
> >>>>>> -    list_for_each(pos, &obj->pt_list) {
> >>>>>> -            struct sync_pt *pt =3D container_of(pos, struct sync_=
pt, link);
> >>>>>> -            sync_print_fence(s, &pt->base, false);
> >>>>>> -    }
> >>>>>> -    spin_unlock_irq(&obj->lock);
> >>>>>> -}
> >>>>>> -
> >>>>>> -static void sync_print_sync_file(struct seq_file *s,
> >>>>>> -                              struct sync_file *sync_file)
> >>>>>> -{
> >>>>>> -    char buf[128];
> >>>>>> -    int i;
> >>>>>> -
> >>>>>> -    seq_printf(s, "[%p] %s: %s\n", sync_file,
> >>>>>> -               sync_file_get_name(sync_file, buf, sizeof(buf)),
> >>>>>> -               sync_status_str(dma_fence_get_status(sync_file->fe=
nce)));
> >>>>>> -
> >>>>>> -    if (dma_fence_is_array(sync_file->fence)) {
> >>>>>> -            struct dma_fence_array *array =3D to_dma_fence_array(=
sync_file->fence);
> >>>>>> -
> >>>>>> -            for (i =3D 0; i < array->num_fences; ++i)
> >>>>>> -                    sync_print_fence(s, array->fences[i], true);
> >>>>>> -    } else {
> >>>>>> -            sync_print_fence(s, sync_file->fence, true);
> >>>>>> -    }
> >>>>>> -}
> >>>>>> -
> >>>>>> -static int sync_info_debugfs_show(struct seq_file *s, void *unuse=
d)
> >>>>>> -{
> >>>>>> -    struct list_head *pos;
> >>>>>> -
> >>>>>> -    seq_puts(s, "objs:\n--------------\n");
> >>>>>> -
> >>>>>> -    spin_lock_irq(&sync_timeline_list_lock);
> >>>>>> -    list_for_each(pos, &sync_timeline_list_head) {
> >>>>>> -            struct sync_timeline *obj =3D
> >>>>>> -                    container_of(pos, struct sync_timeline,
> >>>>>> -                                 sync_timeline_list);
> >>>>>> -
> >>>>>> -            sync_print_obj(s, obj);
> >>>>>> -            seq_putc(s, '\n');
> >>>>>> -    }
> >>>>>> -    spin_unlock_irq(&sync_timeline_list_lock);
> >>>>>> -
> >>>>>> -    seq_puts(s, "fences:\n--------------\n");
> >>>>>> -
> >>>>>> -    spin_lock_irq(&sync_file_list_lock);
> >>>>>> -    list_for_each(pos, &sync_file_list_head) {
> >>>>>> -            struct sync_file *sync_file =3D
> >>>>>> -                    container_of(pos, struct sync_file, sync_file=
_list);
> >>>>>> -
> >>>>>> -            sync_print_sync_file(s, sync_file);
> >>>>>> -            seq_putc(s, '\n');
> >>>>>> -    }
> >>>>>> -    spin_unlock_irq(&sync_file_list_lock);
> >>>>>> -    return 0;
> >>>>>> -}
> >>>>>> -
> >>>>>> -DEFINE_SHOW_ATTRIBUTE(sync_info_debugfs);
> >>>>>> -
> >>>>>> -static __init int sync_debugfs_init(void)
> >>>>>> -{
> >>>>>> -    dbgfs =3D debugfs_create_dir("sync", NULL);
> >>>>>> -
> >>>>>> -    /*
> >>>>>> -     * The debugfs files won't ever get removed and thus, there i=
s
> >>>>>> -     * no need to protect it against removal races. The use of
> >>>>>> -     * debugfs_create_file_unsafe() is actually safe here.
> >>>>>> -     */
> >>>>>> -    debugfs_create_file_unsafe("info", 0444, dbgfs, NULL,
> >>>>>> -                               &sync_info_debugfs_fops);
> >>>>>> -    debugfs_create_file_unsafe("sw_sync", 0644, dbgfs, NULL,
> >>>>>> -                               &sw_sync_debugfs_fops);
> >>>>>> -
> >>>>>> -    return 0;
> >>>>>> -}
> >>>>>> -late_initcall(sync_debugfs_init);
> >>>>>> diff --git a/drivers/dma-buf/sync_debug.h b/drivers/dma-buf/sync_d=
ebug.h
> >>>>>> deleted file mode 100644
> >>>>>> index 6176e52ba2d7..000000000000
> >>>>>> --- a/drivers/dma-buf/sync_debug.h
> >>>>>> +++ /dev/null
> >>>>>> @@ -1,72 +0,0 @@
> >>>>>> -/*
> >>>>>> - * Sync File validation framework and debug infomation
> >>>>>> - *
> >>>>>> - * Copyright (C) 2012 Google, Inc.
> >>>>>> - *
> >>>>>> - * This program is distributed in the hope that it will be useful=
,
> >>>>>> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> >>>>>> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> >>>>>> - * GNU General Public License for more details.
> >>>>>> - *
> >>>>>> - */
> >>>>>> -
> >>>>>> -#ifndef _LINUX_SYNC_H
> >>>>>> -#define _LINUX_SYNC_H
> >>>>>> -
> >>>>>> -#include <linux/list.h>
> >>>>>> -#include <linux/rbtree.h>
> >>>>>> -#include <linux/spinlock.h>
> >>>>>> -#include <linux/dma-fence.h>
> >>>>>> -
> >>>>>> -#include <linux/sync_file.h>
> >>>>>> -#include <uapi/linux/sync_file.h>
> >>>>>> -
> >>>>>> -/**
> >>>>>> - * struct sync_timeline - sync object
> >>>>>> - * @kref:           reference count on fence.
> >>>>>> - * @name:           name of the sync_timeline. Useful for debuggi=
ng
> >>>>>> - * @lock:           lock protecting @pt_list and @value
> >>>>>> - * @pt_tree:                rbtree of active (unsignaled/errored)=
 sync_pts
> >>>>>> - * @pt_list:                list of active (unsignaled/errored) s=
ync_pts
> >>>>>> - * @sync_timeline_list:     membership in global sync_timeline_li=
st
> >>>>>> - */
> >>>>>> -struct sync_timeline {
> >>>>>> -    struct kref             kref;
> >>>>>> -    char                    name[32];
> >>>>>> -
> >>>>>> -    /* protected by lock */
> >>>>>> -    u64                     context;
> >>>>>> -    int                     value;
> >>>>>> -
> >>>>>> -    struct rb_root          pt_tree;
> >>>>>> -    struct list_head        pt_list;
> >>>>>> -    spinlock_t              lock;
> >>>>>> -
> >>>>>> -    struct list_head        sync_timeline_list;
> >>>>>> -};
> >>>>>> -
> >>>>>> -static inline struct sync_timeline *dma_fence_parent(struct dma_f=
ence *fence)
> >>>>>> -{
> >>>>>> -    return container_of(fence->lock, struct sync_timeline, lock);
> >>>>>> -}
> >>>>>> -
> >>>>>> -/**
> >>>>>> - * struct sync_pt - sync_pt object
> >>>>>> - * @base: base fence object
> >>>>>> - * @link: link on the sync timeline's list
> >>>>>> - * @node: node in the sync timeline's tree
> >>>>>> - */
> >>>>>> -struct sync_pt {
> >>>>>> -    struct dma_fence base;
> >>>>>> -    struct list_head link;
> >>>>>> -    struct rb_node node;
> >>>>>> -};
> >>>>>> -
> >>>>>> -extern const struct file_operations sw_sync_debugfs_fops;
> >>>>>> -
> >>>>>> -void sync_timeline_debug_add(struct sync_timeline *obj);
> >>>>>> -void sync_timeline_debug_remove(struct sync_timeline *obj);
> >>>>>> -void sync_file_debug_add(struct sync_file *fence);
> >>>>>> -void sync_file_debug_remove(struct sync_file *fence);
> >>>>>> -
> >>>>>> -#endif /* _LINUX_SYNC_H */
> >>>>>> --
> >>>>>> 2.25.1
> >>>>>>
> >
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
