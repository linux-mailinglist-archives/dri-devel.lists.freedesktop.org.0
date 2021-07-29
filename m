Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D4B3DA006
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 11:04:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A57C76ECF4;
	Thu, 29 Jul 2021 09:04:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 106CF6ECF4
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 09:04:06 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 c7-20020a9d27870000b02904d360fbc71bso5149144otb.10
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 02:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ed6kEnKmuiU+jB5gA7YuX+yI/VT7KhzVF6VTop0ll0g=;
 b=BiTvmhLz+dpR1jFRjrXrjH+8jduEPxMSdKMUMiOoHfKrj6A7H/4T9OwJCjqIcUaIQi
 tUAdZKyDRuvSFswOCixztTeiIjg3D63xXDjZpfU3LM8BNHOJZ1FJjZ2XyjgZ2tTL/85O
 nqBqorEoS7afuxJo4lo4T51shxZhpW9SM76NU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ed6kEnKmuiU+jB5gA7YuX+yI/VT7KhzVF6VTop0ll0g=;
 b=Ikqv4KrlJdXYN05uFacypy6yee2hTDljKXdMR40KC3/XUC/DPM5GCN2FBO20FirMPD
 KquLOLZMsB8P9WYg0WdCI8Ia+dD/YLihTWwiuPzeXlGnjGslgsX7MPgsy8T74XT1rxG6
 4amvClJFABIb71I0Psn8p/+2PcLA13FLUK/Z3rZuSTO/zK/4PGUxnJsOjy7MV7iZal+V
 7TMwH7vgpub3TQncs3ZKrFZrZXnZ4Ts9kLLbARs1nkxLkSGtKy8n+nHXnB6MQjOonfET
 a3meG920dvE02N61SmdOKDE84GrQfSyii8XSq4G6m1BIOf4K3CSi54aVaxbHch9V02oF
 kJOg==
X-Gm-Message-State: AOAM531hO5N5W11hVP7vjOIvePXQIFV4hq5mbTHamvI9xhHcpQzfIWgU
 JfLEWswyNkQcSZZ8YHKNksloE0szHLrVzwFCUWe7fQ==
X-Google-Smtp-Source: ABdhPJzQ4zM5dfyvJ1bAOVzq972zD0WQTlaOPnnAdu6TzLIU8MVJFoSbUPALTIRyRCAvfVgji/LH8cL+3BQW+LQJeOY=
X-Received: by 2002:a9d:6d86:: with SMTP id x6mr2735467otp.188.1627549445102; 
 Thu, 29 Jul 2021 02:04:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210729070330.41443-1-christian.koenig@amd.com>
 <20210729070330.41443-3-christian.koenig@amd.com>
 <YQJXi2JNZdH5DaR2@phenom.ffwll.local>
 <800b0278-922e-e7d8-450d-59721bb68585@gmail.com>
In-Reply-To: <800b0278-922e-e7d8-450d-59721bb68585@gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 29 Jul 2021 11:03:53 +0200
Message-ID: <CAKMK7uHzbXY3vsGtwMaqzJNuXPffgOz8xuWDfgDPqsW7ijMnJw@mail.gmail.com>
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

On Thu, Jul 29, 2021 at 10:38 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
> Am 29.07.21 um 09:23 schrieb Daniel Vetter:
> > On Thu, Jul 29, 2021 at 09:03:30AM +0200, Christian K=C3=B6nig wrote:
> >> As we now knew controlling dma_fence synchronization from userspace is
> >> extremely dangerous and can not only deadlock drivers but trivially al=
so the
> >> whole kernel memory management.
> >>
> >> Entirely remove this option. We now have in kernel unit tests to exerc=
ise the
> >> dma_fence framework and it's containers.
> >>
> >> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > There's also igts for this, and Android heavily uses this. So I'm not s=
ure
> > we can just nuke it.
>
> I feared that you would say that.
>
> > I guess what we could do is maybe just taint the kernel if it's ever us=
ed?
>
> What should we use then? TAINT_SOFTLOCKUP or TAINT_CRAP? :)

I think the cleanest solution would be to install a 10s timer on each
sw fence, and TAINT_SOFTLOOKUP if it fails to signal. That's similar
to what we do with vgem, except vgem then just steps in with a
dma_fence_signal() instead of tainting the kernel.

I think that should keep everyone happy, because if your Android has a
fence stuck for more than 10s it's busted.

Note that with hwc1 the indefinite fence was actually the model, when
you did a page_flip you got an out-fence back which will only be
signalled when the new buffer _stopped_ being used for scanout. Which
generally depends upon the next page-flip happening (except for manual
mode display, which only scan out once, if you ignore that the
kernel's supposed to restore the display after suspend/resume, which
android did). hwc2 fixed this, so a 10s timeout-to-taint should be
fine with Android people.

Also since we do have the igt/sw_sync.c test intel-gfx-ci should be
able to check that code even.
-Daniel

> Regards,
> Christian.
>
> >
> > Also for testing we use vgem now, which enforces a timeout.
> > -Daniel
> >
> >> ---
> >>   drivers/dma-buf/Kconfig      |  13 --
> >>   drivers/dma-buf/Makefile     |   1 -
> >>   drivers/dma-buf/sw_sync.c    | 412 ---------------------------------=
--
> >>   drivers/dma-buf/sync_debug.c | 190 ----------------
> >>   drivers/dma-buf/sync_debug.h |  72 ------
> >>   5 files changed, 688 deletions(-)
> >>   delete mode 100644 drivers/dma-buf/sw_sync.c
> >>   delete mode 100644 drivers/dma-buf/sync_debug.c
> >>   delete mode 100644 drivers/dma-buf/sync_debug.h
> >>
> >> diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
> >> index 9561e3d2d428..26c53f45616a 100644
> >> --- a/drivers/dma-buf/Kconfig
> >> +++ b/drivers/dma-buf/Kconfig
> >> @@ -17,19 +17,6 @@ config SYNC_FILE
> >>        Files fds, to the DRM driver for example. More details at
> >>        Documentation/driver-api/sync_file.rst.
> >>
> >> -config SW_SYNC
> >> -    bool "Sync File Validation Framework"
> >> -    default n
> >> -    depends on SYNC_FILE
> >> -    depends on DEBUG_FS
> >> -    help
> >> -      A sync object driver that uses a 32bit counter to coordinate
> >> -      synchronization.  Useful when there is no hardware primitive ba=
cking
> >> -      the synchronization.
> >> -
> >> -      WARNING: improper use of this can result in deadlocking kernel
> >> -      drivers from userspace. Intended for test and debug only.
> >> -
> >>   config UDMABUF
> >>      bool "userspace dmabuf misc driver"
> >>      default n
> >> diff --git a/drivers/dma-buf/Makefile b/drivers/dma-buf/Makefile
> >> index 1ef021273a06..fa3af0953f87 100644
> >> --- a/drivers/dma-buf/Makefile
> >> +++ b/drivers/dma-buf/Makefile
> >> @@ -4,7 +4,6 @@ obj-y :=3D dma-buf.o dma-fence.o dma-fence-array.o dma=
-fence-chain.o \
> >>   obj-$(CONFIG_DMABUF_HEAPS) +=3D dma-heap.o
> >>   obj-$(CONFIG_DMABUF_HEAPS) +=3D heaps/
> >>   obj-$(CONFIG_SYNC_FILE)            +=3D sync_file.o
> >> -obj-$(CONFIG_SW_SYNC)               +=3D sw_sync.o sync_debug.o
> >>   obj-$(CONFIG_UDMABUF)              +=3D udmabuf.o
> >>   obj-$(CONFIG_DMABUF_SYSFS_STATS) +=3D dma-buf-sysfs-stats.o
> >>
> >> diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
> >> deleted file mode 100644
> >> index 348b3a9170fa..000000000000
> >> --- a/drivers/dma-buf/sw_sync.c
> >> +++ /dev/null
> >> @@ -1,412 +0,0 @@
> >> -// SPDX-License-Identifier: GPL-2.0-only
> >> -/*
> >> - * Sync File validation framework
> >> - *
> >> - * Copyright (C) 2012 Google, Inc.
> >> - */
> >> -
> >> -#include <linux/file.h>
> >> -#include <linux/fs.h>
> >> -#include <linux/uaccess.h>
> >> -#include <linux/slab.h>
> >> -#include <linux/sync_file.h>
> >> -
> >> -#include "sync_debug.h"
> >> -
> >> -#define CREATE_TRACE_POINTS
> >> -#include "sync_trace.h"
> >> -
> >> -/*
> >> - * SW SYNC validation framework
> >> - *
> >> - * A sync object driver that uses a 32bit counter to coordinate
> >> - * synchronization.  Useful when there is no hardware primitive backi=
ng
> >> - * the synchronization.
> >> - *
> >> - * To start the framework just open:
> >> - *
> >> - * <debugfs>/sync/sw_sync
> >> - *
> >> - * That will create a sync timeline, all fences created under this ti=
meline
> >> - * file descriptor will belong to the this timeline.
> >> - *
> >> - * The 'sw_sync' file can be opened many times as to create different
> >> - * timelines.
> >> - *
> >> - * Fences can be created with SW_SYNC_IOC_CREATE_FENCE ioctl with str=
uct
> >> - * sw_sync_create_fence_data as parameter.
> >> - *
> >> - * To increment the timeline counter, SW_SYNC_IOC_INC ioctl should be=
 used
> >> - * with the increment as u32. This will update the last signaled valu=
e
> >> - * from the timeline and signal any fence that has a seqno smaller or=
 equal
> >> - * to it.
> >> - *
> >> - * struct sw_sync_create_fence_data
> >> - * @value:  the seqno to initialise the fence with
> >> - * @name:   the name of the new sync point
> >> - * @fence:  return the fd of the new sync_file with the created fence
> >> - */
> >> -struct sw_sync_create_fence_data {
> >> -    __u32   value;
> >> -    char    name[32];
> >> -    __s32   fence; /* fd of new fence */
> >> -};
> >> -
> >> -#define SW_SYNC_IOC_MAGIC   'W'
> >> -
> >> -#define SW_SYNC_IOC_CREATE_FENCE    _IOWR(SW_SYNC_IOC_MAGIC, 0,\
> >> -            struct sw_sync_create_fence_data)
> >> -
> >> -#define SW_SYNC_IOC_INC                     _IOW(SW_SYNC_IOC_MAGIC, 1=
, __u32)
> >> -
> >> -static const struct dma_fence_ops timeline_fence_ops;
> >> -
> >> -static inline struct sync_pt *dma_fence_to_sync_pt(struct dma_fence *=
fence)
> >> -{
> >> -    if (fence->ops !=3D &timeline_fence_ops)
> >> -            return NULL;
> >> -    return container_of(fence, struct sync_pt, base);
> >> -}
> >> -
> >> -/**
> >> - * sync_timeline_create() - creates a sync object
> >> - * @name:   sync_timeline name
> >> - *
> >> - * Creates a new sync_timeline. Returns the sync_timeline object or N=
ULL in
> >> - * case of error.
> >> - */
> >> -static struct sync_timeline *sync_timeline_create(const char *name)
> >> -{
> >> -    struct sync_timeline *obj;
> >> -
> >> -    obj =3D kzalloc(sizeof(*obj), GFP_KERNEL);
> >> -    if (!obj)
> >> -            return NULL;
> >> -
> >> -    kref_init(&obj->kref);
> >> -    obj->context =3D dma_fence_context_alloc(1);
> >> -    strlcpy(obj->name, name, sizeof(obj->name));
> >> -
> >> -    obj->pt_tree =3D RB_ROOT;
> >> -    INIT_LIST_HEAD(&obj->pt_list);
> >> -    spin_lock_init(&obj->lock);
> >> -
> >> -    sync_timeline_debug_add(obj);
> >> -
> >> -    return obj;
> >> -}
> >> -
> >> -static void sync_timeline_free(struct kref *kref)
> >> -{
> >> -    struct sync_timeline *obj =3D
> >> -            container_of(kref, struct sync_timeline, kref);
> >> -
> >> -    sync_timeline_debug_remove(obj);
> >> -
> >> -    kfree(obj);
> >> -}
> >> -
> >> -static void sync_timeline_get(struct sync_timeline *obj)
> >> -{
> >> -    kref_get(&obj->kref);
> >> -}
> >> -
> >> -static void sync_timeline_put(struct sync_timeline *obj)
> >> -{
> >> -    kref_put(&obj->kref, sync_timeline_free);
> >> -}
> >> -
> >> -static const char *timeline_fence_get_driver_name(struct dma_fence *f=
ence)
> >> -{
> >> -    return "sw_sync";
> >> -}
> >> -
> >> -static const char *timeline_fence_get_timeline_name(struct dma_fence =
*fence)
> >> -{
> >> -    struct sync_timeline *parent =3D dma_fence_parent(fence);
> >> -
> >> -    return parent->name;
> >> -}
> >> -
> >> -static void timeline_fence_release(struct dma_fence *fence)
> >> -{
> >> -    struct sync_pt *pt =3D dma_fence_to_sync_pt(fence);
> >> -    struct sync_timeline *parent =3D dma_fence_parent(fence);
> >> -    unsigned long flags;
> >> -
> >> -    spin_lock_irqsave(fence->lock, flags);
> >> -    if (!list_empty(&pt->link)) {
> >> -            list_del(&pt->link);
> >> -            rb_erase(&pt->node, &parent->pt_tree);
> >> -    }
> >> -    spin_unlock_irqrestore(fence->lock, flags);
> >> -
> >> -    sync_timeline_put(parent);
> >> -    dma_fence_free(fence);
> >> -}
> >> -
> >> -static bool timeline_fence_signaled(struct dma_fence *fence)
> >> -{
> >> -    struct sync_timeline *parent =3D dma_fence_parent(fence);
> >> -
> >> -    return !__dma_fence_is_later(fence->seqno, parent->value, fence->=
ops);
> >> -}
> >> -
> >> -static bool timeline_fence_enable_signaling(struct dma_fence *fence)
> >> -{
> >> -    return true;
> >> -}
> >> -
> >> -static void timeline_fence_value_str(struct dma_fence *fence,
> >> -                                char *str, int size)
> >> -{
> >> -    snprintf(str, size, "%lld", fence->seqno);
> >> -}
> >> -
> >> -static void timeline_fence_timeline_value_str(struct dma_fence *fence=
,
> >> -                                         char *str, int size)
> >> -{
> >> -    struct sync_timeline *parent =3D dma_fence_parent(fence);
> >> -
> >> -    snprintf(str, size, "%d", parent->value);
> >> -}
> >> -
> >> -static const struct dma_fence_ops timeline_fence_ops =3D {
> >> -    .get_driver_name =3D timeline_fence_get_driver_name,
> >> -    .get_timeline_name =3D timeline_fence_get_timeline_name,
> >> -    .enable_signaling =3D timeline_fence_enable_signaling,
> >> -    .signaled =3D timeline_fence_signaled,
> >> -    .release =3D timeline_fence_release,
> >> -    .fence_value_str =3D timeline_fence_value_str,
> >> -    .timeline_value_str =3D timeline_fence_timeline_value_str,
> >> -};
> >> -
> >> -/**
> >> - * sync_timeline_signal() - signal a status change on a sync_timeline
> >> - * @obj:    sync_timeline to signal
> >> - * @inc:    num to increment on timeline->value
> >> - *
> >> - * A sync implementation should call this any time one of it's fences
> >> - * has signaled or has an error condition.
> >> - */
> >> -static void sync_timeline_signal(struct sync_timeline *obj, unsigned =
int inc)
> >> -{
> >> -    struct sync_pt *pt, *next;
> >> -
> >> -    trace_sync_timeline(obj);
> >> -
> >> -    spin_lock_irq(&obj->lock);
> >> -
> >> -    obj->value +=3D inc;
> >> -
> >> -    list_for_each_entry_safe(pt, next, &obj->pt_list, link) {
> >> -            if (!timeline_fence_signaled(&pt->base))
> >> -                    break;
> >> -
> >> -            list_del_init(&pt->link);
> >> -            rb_erase(&pt->node, &obj->pt_tree);
> >> -
> >> -            /*
> >> -             * A signal callback may release the last reference to th=
is
> >> -             * fence, causing it to be freed. That operation has to b=
e
> >> -             * last to avoid a use after free inside this loop, and m=
ust
> >> -             * be after we remove the fence from the timeline in orde=
r to
> >> -             * prevent deadlocking on timeline->lock inside
> >> -             * timeline_fence_release().
> >> -             */
> >> -            dma_fence_signal_locked(&pt->base);
> >> -    }
> >> -
> >> -    spin_unlock_irq(&obj->lock);
> >> -}
> >> -
> >> -/**
> >> - * sync_pt_create() - creates a sync pt
> >> - * @obj:    parent sync_timeline
> >> - * @value:  value of the fence
> >> - *
> >> - * Creates a new sync_pt (fence) as a child of @parent.  @size bytes =
will be
> >> - * allocated allowing for implementation specific data to be kept aft=
er
> >> - * the generic sync_timeline struct. Returns the sync_pt object or
> >> - * NULL in case of error.
> >> - */
> >> -static struct sync_pt *sync_pt_create(struct sync_timeline *obj,
> >> -                                  unsigned int value)
> >> -{
> >> -    struct sync_pt *pt;
> >> -
> >> -    pt =3D kzalloc(sizeof(*pt), GFP_KERNEL);
> >> -    if (!pt)
> >> -            return NULL;
> >> -
> >> -    sync_timeline_get(obj);
> >> -    dma_fence_init(&pt->base, &timeline_fence_ops, &obj->lock,
> >> -                   obj->context, value);
> >> -    INIT_LIST_HEAD(&pt->link);
> >> -
> >> -    spin_lock_irq(&obj->lock);
> >> -    if (!dma_fence_is_signaled_locked(&pt->base)) {
> >> -            struct rb_node **p =3D &obj->pt_tree.rb_node;
> >> -            struct rb_node *parent =3D NULL;
> >> -
> >> -            while (*p) {
> >> -                    struct sync_pt *other;
> >> -                    int cmp;
> >> -
> >> -                    parent =3D *p;
> >> -                    other =3D rb_entry(parent, typeof(*pt), node);
> >> -                    cmp =3D value - other->base.seqno;
> >> -                    if (cmp > 0) {
> >> -                            p =3D &parent->rb_right;
> >> -                    } else if (cmp < 0) {
> >> -                            p =3D &parent->rb_left;
> >> -                    } else {
> >> -                            if (dma_fence_get_rcu(&other->base)) {
> >> -                                    sync_timeline_put(obj);
> >> -                                    kfree(pt);
> >> -                                    pt =3D other;
> >> -                                    goto unlock;
> >> -                            }
> >> -                            p =3D &parent->rb_left;
> >> -                    }
> >> -            }
> >> -            rb_link_node(&pt->node, parent, p);
> >> -            rb_insert_color(&pt->node, &obj->pt_tree);
> >> -
> >> -            parent =3D rb_next(&pt->node);
> >> -            list_add_tail(&pt->link,
> >> -                          parent ? &rb_entry(parent, typeof(*pt), nod=
e)->link : &obj->pt_list);
> >> -    }
> >> -unlock:
> >> -    spin_unlock_irq(&obj->lock);
> >> -
> >> -    return pt;
> >> -}
> >> -
> >> -/*
> >> - * *WARNING*
> >> - *
> >> - * improper use of this can result in deadlocking kernel drivers from=
 userspace.
> >> - */
> >> -
> >> -/* opening sw_sync create a new sync obj */
> >> -static int sw_sync_debugfs_open(struct inode *inode, struct file *fil=
e)
> >> -{
> >> -    struct sync_timeline *obj;
> >> -    char task_comm[TASK_COMM_LEN];
> >> -
> >> -    get_task_comm(task_comm, current);
> >> -
> >> -    obj =3D sync_timeline_create(task_comm);
> >> -    if (!obj)
> >> -            return -ENOMEM;
> >> -
> >> -    file->private_data =3D obj;
> >> -
> >> -    return 0;
> >> -}
> >> -
> >> -static int sw_sync_debugfs_release(struct inode *inode, struct file *=
file)
> >> -{
> >> -    struct sync_timeline *obj =3D file->private_data;
> >> -    struct sync_pt *pt, *next;
> >> -
> >> -    spin_lock_irq(&obj->lock);
> >> -
> >> -    list_for_each_entry_safe(pt, next, &obj->pt_list, link) {
> >> -            dma_fence_set_error(&pt->base, -ENOENT);
> >> -            dma_fence_signal_locked(&pt->base);
> >> -    }
> >> -
> >> -    spin_unlock_irq(&obj->lock);
> >> -
> >> -    sync_timeline_put(obj);
> >> -    return 0;
> >> -}
> >> -
> >> -static long sw_sync_ioctl_create_fence(struct sync_timeline *obj,
> >> -                                   unsigned long arg)
> >> -{
> >> -    int fd =3D get_unused_fd_flags(O_CLOEXEC);
> >> -    int err;
> >> -    struct sync_pt *pt;
> >> -    struct sync_file *sync_file;
> >> -    struct sw_sync_create_fence_data data;
> >> -
> >> -    if (fd < 0)
> >> -            return fd;
> >> -
> >> -    if (copy_from_user(&data, (void __user *)arg, sizeof(data))) {
> >> -            err =3D -EFAULT;
> >> -            goto err;
> >> -    }
> >> -
> >> -    pt =3D sync_pt_create(obj, data.value);
> >> -    if (!pt) {
> >> -            err =3D -ENOMEM;
> >> -            goto err;
> >> -    }
> >> -
> >> -    sync_file =3D sync_file_create(&pt->base);
> >> -    dma_fence_put(&pt->base);
> >> -    if (!sync_file) {
> >> -            err =3D -ENOMEM;
> >> -            goto err;
> >> -    }
> >> -
> >> -    data.fence =3D fd;
> >> -    if (copy_to_user((void __user *)arg, &data, sizeof(data))) {
> >> -            fput(sync_file->file);
> >> -            err =3D -EFAULT;
> >> -            goto err;
> >> -    }
> >> -
> >> -    fd_install(fd, sync_file->file);
> >> -
> >> -    return 0;
> >> -
> >> -err:
> >> -    put_unused_fd(fd);
> >> -    return err;
> >> -}
> >> -
> >> -static long sw_sync_ioctl_inc(struct sync_timeline *obj, unsigned lon=
g arg)
> >> -{
> >> -    u32 value;
> >> -
> >> -    if (copy_from_user(&value, (void __user *)arg, sizeof(value)))
> >> -            return -EFAULT;
> >> -
> >> -    while (value > INT_MAX)  {
> >> -            sync_timeline_signal(obj, INT_MAX);
> >> -            value -=3D INT_MAX;
> >> -    }
> >> -
> >> -    sync_timeline_signal(obj, value);
> >> -
> >> -    return 0;
> >> -}
> >> -
> >> -static long sw_sync_ioctl(struct file *file, unsigned int cmd,
> >> -                      unsigned long arg)
> >> -{
> >> -    struct sync_timeline *obj =3D file->private_data;
> >> -
> >> -    switch (cmd) {
> >> -    case SW_SYNC_IOC_CREATE_FENCE:
> >> -            return sw_sync_ioctl_create_fence(obj, arg);
> >> -
> >> -    case SW_SYNC_IOC_INC:
> >> -            return sw_sync_ioctl_inc(obj, arg);
> >> -
> >> -    default:
> >> -            return -ENOTTY;
> >> -    }
> >> -}
> >> -
> >> -const struct file_operations sw_sync_debugfs_fops =3D {
> >> -    .open           =3D sw_sync_debugfs_open,
> >> -    .release        =3D sw_sync_debugfs_release,
> >> -    .unlocked_ioctl =3D sw_sync_ioctl,
> >> -    .compat_ioctl   =3D compat_ptr_ioctl,
> >> -};
> >> diff --git a/drivers/dma-buf/sync_debug.c b/drivers/dma-buf/sync_debug=
.c
> >> deleted file mode 100644
> >> index 101394f16930..000000000000
> >> --- a/drivers/dma-buf/sync_debug.c
> >> +++ /dev/null
> >> @@ -1,190 +0,0 @@
> >> -// SPDX-License-Identifier: GPL-2.0-only
> >> -/*
> >> - * Sync File validation framework and debug information
> >> - *
> >> - * Copyright (C) 2012 Google, Inc.
> >> - */
> >> -
> >> -#include <linux/debugfs.h>
> >> -#include "sync_debug.h"
> >> -
> >> -static struct dentry *dbgfs;
> >> -
> >> -static LIST_HEAD(sync_timeline_list_head);
> >> -static DEFINE_SPINLOCK(sync_timeline_list_lock);
> >> -static LIST_HEAD(sync_file_list_head);
> >> -static DEFINE_SPINLOCK(sync_file_list_lock);
> >> -
> >> -void sync_timeline_debug_add(struct sync_timeline *obj)
> >> -{
> >> -    unsigned long flags;
> >> -
> >> -    spin_lock_irqsave(&sync_timeline_list_lock, flags);
> >> -    list_add_tail(&obj->sync_timeline_list, &sync_timeline_list_head)=
;
> >> -    spin_unlock_irqrestore(&sync_timeline_list_lock, flags);
> >> -}
> >> -
> >> -void sync_timeline_debug_remove(struct sync_timeline *obj)
> >> -{
> >> -    unsigned long flags;
> >> -
> >> -    spin_lock_irqsave(&sync_timeline_list_lock, flags);
> >> -    list_del(&obj->sync_timeline_list);
> >> -    spin_unlock_irqrestore(&sync_timeline_list_lock, flags);
> >> -}
> >> -
> >> -void sync_file_debug_add(struct sync_file *sync_file)
> >> -{
> >> -    unsigned long flags;
> >> -
> >> -    spin_lock_irqsave(&sync_file_list_lock, flags);
> >> -    list_add_tail(&sync_file->sync_file_list, &sync_file_list_head);
> >> -    spin_unlock_irqrestore(&sync_file_list_lock, flags);
> >> -}
> >> -
> >> -void sync_file_debug_remove(struct sync_file *sync_file)
> >> -{
> >> -    unsigned long flags;
> >> -
> >> -    spin_lock_irqsave(&sync_file_list_lock, flags);
> >> -    list_del(&sync_file->sync_file_list);
> >> -    spin_unlock_irqrestore(&sync_file_list_lock, flags);
> >> -}
> >> -
> >> -static const char *sync_status_str(int status)
> >> -{
> >> -    if (status < 0)
> >> -            return "error";
> >> -
> >> -    if (status > 0)
> >> -            return "signaled";
> >> -
> >> -    return "active";
> >> -}
> >> -
> >> -static void sync_print_fence(struct seq_file *s,
> >> -                         struct dma_fence *fence, bool show)
> >> -{
> >> -    struct sync_timeline *parent =3D dma_fence_parent(fence);
> >> -    int status;
> >> -
> >> -    status =3D dma_fence_get_status_locked(fence);
> >> -
> >> -    seq_printf(s, "  %s%sfence %s",
> >> -               show ? parent->name : "",
> >> -               show ? "_" : "",
> >> -               sync_status_str(status));
> >> -
> >> -    if (test_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT, &fence->flags)) {
> >> -            struct timespec64 ts64 =3D
> >> -                    ktime_to_timespec64(fence->timestamp);
> >> -
> >> -            seq_printf(s, "@%lld.%09ld", (s64)ts64.tv_sec, ts64.tv_ns=
ec);
> >> -    }
> >> -
> >> -    if (fence->ops->timeline_value_str &&
> >> -            fence->ops->fence_value_str) {
> >> -            char value[64];
> >> -            bool success;
> >> -
> >> -            fence->ops->fence_value_str(fence, value, sizeof(value));
> >> -            success =3D strlen(value);
> >> -
> >> -            if (success) {
> >> -                    seq_printf(s, ": %s", value);
> >> -
> >> -                    fence->ops->timeline_value_str(fence, value,
> >> -                                                   sizeof(value));
> >> -
> >> -                    if (strlen(value))
> >> -                            seq_printf(s, " / %s", value);
> >> -            }
> >> -    }
> >> -
> >> -    seq_putc(s, '\n');
> >> -}
> >> -
> >> -static void sync_print_obj(struct seq_file *s, struct sync_timeline *=
obj)
> >> -{
> >> -    struct list_head *pos;
> >> -
> >> -    seq_printf(s, "%s: %d\n", obj->name, obj->value);
> >> -
> >> -    spin_lock_irq(&obj->lock);
> >> -    list_for_each(pos, &obj->pt_list) {
> >> -            struct sync_pt *pt =3D container_of(pos, struct sync_pt, =
link);
> >> -            sync_print_fence(s, &pt->base, false);
> >> -    }
> >> -    spin_unlock_irq(&obj->lock);
> >> -}
> >> -
> >> -static void sync_print_sync_file(struct seq_file *s,
> >> -                              struct sync_file *sync_file)
> >> -{
> >> -    char buf[128];
> >> -    int i;
> >> -
> >> -    seq_printf(s, "[%p] %s: %s\n", sync_file,
> >> -               sync_file_get_name(sync_file, buf, sizeof(buf)),
> >> -               sync_status_str(dma_fence_get_status(sync_file->fence)=
));
> >> -
> >> -    if (dma_fence_is_array(sync_file->fence)) {
> >> -            struct dma_fence_array *array =3D to_dma_fence_array(sync=
_file->fence);
> >> -
> >> -            for (i =3D 0; i < array->num_fences; ++i)
> >> -                    sync_print_fence(s, array->fences[i], true);
> >> -    } else {
> >> -            sync_print_fence(s, sync_file->fence, true);
> >> -    }
> >> -}
> >> -
> >> -static int sync_info_debugfs_show(struct seq_file *s, void *unused)
> >> -{
> >> -    struct list_head *pos;
> >> -
> >> -    seq_puts(s, "objs:\n--------------\n");
> >> -
> >> -    spin_lock_irq(&sync_timeline_list_lock);
> >> -    list_for_each(pos, &sync_timeline_list_head) {
> >> -            struct sync_timeline *obj =3D
> >> -                    container_of(pos, struct sync_timeline,
> >> -                                 sync_timeline_list);
> >> -
> >> -            sync_print_obj(s, obj);
> >> -            seq_putc(s, '\n');
> >> -    }
> >> -    spin_unlock_irq(&sync_timeline_list_lock);
> >> -
> >> -    seq_puts(s, "fences:\n--------------\n");
> >> -
> >> -    spin_lock_irq(&sync_file_list_lock);
> >> -    list_for_each(pos, &sync_file_list_head) {
> >> -            struct sync_file *sync_file =3D
> >> -                    container_of(pos, struct sync_file, sync_file_lis=
t);
> >> -
> >> -            sync_print_sync_file(s, sync_file);
> >> -            seq_putc(s, '\n');
> >> -    }
> >> -    spin_unlock_irq(&sync_file_list_lock);
> >> -    return 0;
> >> -}
> >> -
> >> -DEFINE_SHOW_ATTRIBUTE(sync_info_debugfs);
> >> -
> >> -static __init int sync_debugfs_init(void)
> >> -{
> >> -    dbgfs =3D debugfs_create_dir("sync", NULL);
> >> -
> >> -    /*
> >> -     * The debugfs files won't ever get removed and thus, there is
> >> -     * no need to protect it against removal races. The use of
> >> -     * debugfs_create_file_unsafe() is actually safe here.
> >> -     */
> >> -    debugfs_create_file_unsafe("info", 0444, dbgfs, NULL,
> >> -                               &sync_info_debugfs_fops);
> >> -    debugfs_create_file_unsafe("sw_sync", 0644, dbgfs, NULL,
> >> -                               &sw_sync_debugfs_fops);
> >> -
> >> -    return 0;
> >> -}
> >> -late_initcall(sync_debugfs_init);
> >> diff --git a/drivers/dma-buf/sync_debug.h b/drivers/dma-buf/sync_debug=
.h
> >> deleted file mode 100644
> >> index 6176e52ba2d7..000000000000
> >> --- a/drivers/dma-buf/sync_debug.h
> >> +++ /dev/null
> >> @@ -1,72 +0,0 @@
> >> -/*
> >> - * Sync File validation framework and debug infomation
> >> - *
> >> - * Copyright (C) 2012 Google, Inc.
> >> - *
> >> - * This program is distributed in the hope that it will be useful,
> >> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> >> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> >> - * GNU General Public License for more details.
> >> - *
> >> - */
> >> -
> >> -#ifndef _LINUX_SYNC_H
> >> -#define _LINUX_SYNC_H
> >> -
> >> -#include <linux/list.h>
> >> -#include <linux/rbtree.h>
> >> -#include <linux/spinlock.h>
> >> -#include <linux/dma-fence.h>
> >> -
> >> -#include <linux/sync_file.h>
> >> -#include <uapi/linux/sync_file.h>
> >> -
> >> -/**
> >> - * struct sync_timeline - sync object
> >> - * @kref:           reference count on fence.
> >> - * @name:           name of the sync_timeline. Useful for debugging
> >> - * @lock:           lock protecting @pt_list and @value
> >> - * @pt_tree:                rbtree of active (unsignaled/errored) syn=
c_pts
> >> - * @pt_list:                list of active (unsignaled/errored) sync_=
pts
> >> - * @sync_timeline_list:     membership in global sync_timeline_list
> >> - */
> >> -struct sync_timeline {
> >> -    struct kref             kref;
> >> -    char                    name[32];
> >> -
> >> -    /* protected by lock */
> >> -    u64                     context;
> >> -    int                     value;
> >> -
> >> -    struct rb_root          pt_tree;
> >> -    struct list_head        pt_list;
> >> -    spinlock_t              lock;
> >> -
> >> -    struct list_head        sync_timeline_list;
> >> -};
> >> -
> >> -static inline struct sync_timeline *dma_fence_parent(struct dma_fence=
 *fence)
> >> -{
> >> -    return container_of(fence->lock, struct sync_timeline, lock);
> >> -}
> >> -
> >> -/**
> >> - * struct sync_pt - sync_pt object
> >> - * @base: base fence object
> >> - * @link: link on the sync timeline's list
> >> - * @node: node in the sync timeline's tree
> >> - */
> >> -struct sync_pt {
> >> -    struct dma_fence base;
> >> -    struct list_head link;
> >> -    struct rb_node node;
> >> -};
> >> -
> >> -extern const struct file_operations sw_sync_debugfs_fops;
> >> -
> >> -void sync_timeline_debug_add(struct sync_timeline *obj);
> >> -void sync_timeline_debug_remove(struct sync_timeline *obj);
> >> -void sync_file_debug_add(struct sync_file *fence);
> >> -void sync_file_debug_remove(struct sync_file *fence);
> >> -
> >> -#endif /* _LINUX_SYNC_H */
> >> --
> >> 2.25.1
> >>
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
