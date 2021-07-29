Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C70CC3D9FB4
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 10:38:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F7DB6ECD3;
	Thu, 29 Jul 2021 08:38:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40D9A6ECD3
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 08:38:47 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id g15so5893789wrd.3
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 01:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=NwqDJ6EVt8QMfnd9L1yG2lm06cgfJs4oO0VF5FpuCE4=;
 b=OOM/UJJGTsoR/4YKqCE0TXtFRSf9c3HY2V2nYqH00pNBxV8OXsSSuBcYNk4JvtljJu
 ffQG8hIODx8cEaDkMdBjUPuzeiid0JOKM871Egyc4iXfPUuXqmi/8Fhum+accp45W/5J
 wif2HaRABQD9pDPDyxDKRz5eslxapHww2/aQJSnlG5z2TQV5GmAwYXHAaJk7oqYUUIEJ
 TPGeR8UoePaaSXkXKtHMvMi7x0Przg52bUrgvUC8YSMC1jP9K3rfVG+NCNO2Abph9pd4
 pPUVUH44NuygG2tSX1yqK1lnebmOs9JhymU83yYBAoYbaNxB+vE4hnIapLFjNi8UUSLy
 a8bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=NwqDJ6EVt8QMfnd9L1yG2lm06cgfJs4oO0VF5FpuCE4=;
 b=GHetTIIwnSAyED24ptKn3Zpao3vHaoffhZghMhGrdyF+AErHC4/7DiCfymn36mfZHn
 1bU5OTMLLXcTecOkCg2DBC7kojQP4MXMg2RLNO1bulV5izL6mSeBlVC7y30Jz2ipKFfr
 UfI5OjocCdxLPWR3zPAo5s7V7ISyr4AV2aW7gLc43XKt9+m5/AUC5ymOCI/Ht/irbsqM
 LwNM8ElrtOyoamF43nlV3Fy1BrCh2F4VLpbbgzE1KbGQ+HY46NRi5pa0sOg6i5e0NOj3
 +f/kdXwV8MlTM/GnpyCyUL2s04iYyYQ0DY3pnD3wQV/gN+Rvw/SSNLix3+SUHZR8kOAA
 zP9Q==
X-Gm-Message-State: AOAM530PElkB2Rr6Mfz+nl/o0V/Fw25fg2WbsA78Y4Y0AV6VQf2IJ1at
 /yQockPtX3MkwlA8mNbs4+E=
X-Google-Smtp-Source: ABdhPJyH8t6xj3jlZXDB9TdCUUQ3QXcUa0j3gXigEl32KmK6DkImwiFYLdy03AC9hzMoXuzFL/5WWQ==
X-Received: by 2002:adf:f7c4:: with SMTP id a4mr3481726wrq.130.1627547925669; 
 Thu, 29 Jul 2021 01:38:45 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:4b10:6e80:f619:9837?
 ([2a02:908:1252:fb60:4b10:6e80:f619:9837])
 by smtp.gmail.com with ESMTPSA id b15sm2528366wrx.73.2021.07.29.01.38.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jul 2021 01:38:45 -0700 (PDT)
Subject: Re: [PATCH 3/3] dma-buf: nuke SW_SYNC debugfs files
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210729070330.41443-1-christian.koenig@amd.com>
 <20210729070330.41443-3-christian.koenig@amd.com>
 <YQJXi2JNZdH5DaR2@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <800b0278-922e-e7d8-450d-59721bb68585@gmail.com>
Date: Thu, 29 Jul 2021 10:38:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YQJXi2JNZdH5DaR2@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: linaro-mm-sig@lists.linaro.org, gustavo@padovan.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 29.07.21 um 09:23 schrieb Daniel Vetter:
> On Thu, Jul 29, 2021 at 09:03:30AM +0200, Christian König wrote:
>> As we now knew controlling dma_fence synchronization from userspace is
>> extremely dangerous and can not only deadlock drivers but trivially also the
>> whole kernel memory management.
>>
>> Entirely remove this option. We now have in kernel unit tests to exercise the
>> dma_fence framework and it's containers.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
> There's also igts for this, and Android heavily uses this. So I'm not sure
> we can just nuke it.

I feared that you would say that.

> I guess what we could do is maybe just taint the kernel if it's ever used?

What should we use then? TAINT_SOFTLOCKUP or TAINT_CRAP? :)

Regards,
Christian.

>
> Also for testing we use vgem now, which enforces a timeout.
> -Daniel
>
>> ---
>>   drivers/dma-buf/Kconfig      |  13 --
>>   drivers/dma-buf/Makefile     |   1 -
>>   drivers/dma-buf/sw_sync.c    | 412 -----------------------------------
>>   drivers/dma-buf/sync_debug.c | 190 ----------------
>>   drivers/dma-buf/sync_debug.h |  72 ------
>>   5 files changed, 688 deletions(-)
>>   delete mode 100644 drivers/dma-buf/sw_sync.c
>>   delete mode 100644 drivers/dma-buf/sync_debug.c
>>   delete mode 100644 drivers/dma-buf/sync_debug.h
>>
>> diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
>> index 9561e3d2d428..26c53f45616a 100644
>> --- a/drivers/dma-buf/Kconfig
>> +++ b/drivers/dma-buf/Kconfig
>> @@ -17,19 +17,6 @@ config SYNC_FILE
>>   	  Files fds, to the DRM driver for example. More details at
>>   	  Documentation/driver-api/sync_file.rst.
>>   
>> -config SW_SYNC
>> -	bool "Sync File Validation Framework"
>> -	default n
>> -	depends on SYNC_FILE
>> -	depends on DEBUG_FS
>> -	help
>> -	  A sync object driver that uses a 32bit counter to coordinate
>> -	  synchronization.  Useful when there is no hardware primitive backing
>> -	  the synchronization.
>> -
>> -	  WARNING: improper use of this can result in deadlocking kernel
>> -	  drivers from userspace. Intended for test and debug only.
>> -
>>   config UDMABUF
>>   	bool "userspace dmabuf misc driver"
>>   	default n
>> diff --git a/drivers/dma-buf/Makefile b/drivers/dma-buf/Makefile
>> index 1ef021273a06..fa3af0953f87 100644
>> --- a/drivers/dma-buf/Makefile
>> +++ b/drivers/dma-buf/Makefile
>> @@ -4,7 +4,6 @@ obj-y := dma-buf.o dma-fence.o dma-fence-array.o dma-fence-chain.o \
>>   obj-$(CONFIG_DMABUF_HEAPS)	+= dma-heap.o
>>   obj-$(CONFIG_DMABUF_HEAPS)	+= heaps/
>>   obj-$(CONFIG_SYNC_FILE)		+= sync_file.o
>> -obj-$(CONFIG_SW_SYNC)		+= sw_sync.o sync_debug.o
>>   obj-$(CONFIG_UDMABUF)		+= udmabuf.o
>>   obj-$(CONFIG_DMABUF_SYSFS_STATS) += dma-buf-sysfs-stats.o
>>   
>> diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
>> deleted file mode 100644
>> index 348b3a9170fa..000000000000
>> --- a/drivers/dma-buf/sw_sync.c
>> +++ /dev/null
>> @@ -1,412 +0,0 @@
>> -// SPDX-License-Identifier: GPL-2.0-only
>> -/*
>> - * Sync File validation framework
>> - *
>> - * Copyright (C) 2012 Google, Inc.
>> - */
>> -
>> -#include <linux/file.h>
>> -#include <linux/fs.h>
>> -#include <linux/uaccess.h>
>> -#include <linux/slab.h>
>> -#include <linux/sync_file.h>
>> -
>> -#include "sync_debug.h"
>> -
>> -#define CREATE_TRACE_POINTS
>> -#include "sync_trace.h"
>> -
>> -/*
>> - * SW SYNC validation framework
>> - *
>> - * A sync object driver that uses a 32bit counter to coordinate
>> - * synchronization.  Useful when there is no hardware primitive backing
>> - * the synchronization.
>> - *
>> - * To start the framework just open:
>> - *
>> - * <debugfs>/sync/sw_sync
>> - *
>> - * That will create a sync timeline, all fences created under this timeline
>> - * file descriptor will belong to the this timeline.
>> - *
>> - * The 'sw_sync' file can be opened many times as to create different
>> - * timelines.
>> - *
>> - * Fences can be created with SW_SYNC_IOC_CREATE_FENCE ioctl with struct
>> - * sw_sync_create_fence_data as parameter.
>> - *
>> - * To increment the timeline counter, SW_SYNC_IOC_INC ioctl should be used
>> - * with the increment as u32. This will update the last signaled value
>> - * from the timeline and signal any fence that has a seqno smaller or equal
>> - * to it.
>> - *
>> - * struct sw_sync_create_fence_data
>> - * @value:	the seqno to initialise the fence with
>> - * @name:	the name of the new sync point
>> - * @fence:	return the fd of the new sync_file with the created fence
>> - */
>> -struct sw_sync_create_fence_data {
>> -	__u32	value;
>> -	char	name[32];
>> -	__s32	fence; /* fd of new fence */
>> -};
>> -
>> -#define SW_SYNC_IOC_MAGIC	'W'
>> -
>> -#define SW_SYNC_IOC_CREATE_FENCE	_IOWR(SW_SYNC_IOC_MAGIC, 0,\
>> -		struct sw_sync_create_fence_data)
>> -
>> -#define SW_SYNC_IOC_INC			_IOW(SW_SYNC_IOC_MAGIC, 1, __u32)
>> -
>> -static const struct dma_fence_ops timeline_fence_ops;
>> -
>> -static inline struct sync_pt *dma_fence_to_sync_pt(struct dma_fence *fence)
>> -{
>> -	if (fence->ops != &timeline_fence_ops)
>> -		return NULL;
>> -	return container_of(fence, struct sync_pt, base);
>> -}
>> -
>> -/**
>> - * sync_timeline_create() - creates a sync object
>> - * @name:	sync_timeline name
>> - *
>> - * Creates a new sync_timeline. Returns the sync_timeline object or NULL in
>> - * case of error.
>> - */
>> -static struct sync_timeline *sync_timeline_create(const char *name)
>> -{
>> -	struct sync_timeline *obj;
>> -
>> -	obj = kzalloc(sizeof(*obj), GFP_KERNEL);
>> -	if (!obj)
>> -		return NULL;
>> -
>> -	kref_init(&obj->kref);
>> -	obj->context = dma_fence_context_alloc(1);
>> -	strlcpy(obj->name, name, sizeof(obj->name));
>> -
>> -	obj->pt_tree = RB_ROOT;
>> -	INIT_LIST_HEAD(&obj->pt_list);
>> -	spin_lock_init(&obj->lock);
>> -
>> -	sync_timeline_debug_add(obj);
>> -
>> -	return obj;
>> -}
>> -
>> -static void sync_timeline_free(struct kref *kref)
>> -{
>> -	struct sync_timeline *obj =
>> -		container_of(kref, struct sync_timeline, kref);
>> -
>> -	sync_timeline_debug_remove(obj);
>> -
>> -	kfree(obj);
>> -}
>> -
>> -static void sync_timeline_get(struct sync_timeline *obj)
>> -{
>> -	kref_get(&obj->kref);
>> -}
>> -
>> -static void sync_timeline_put(struct sync_timeline *obj)
>> -{
>> -	kref_put(&obj->kref, sync_timeline_free);
>> -}
>> -
>> -static const char *timeline_fence_get_driver_name(struct dma_fence *fence)
>> -{
>> -	return "sw_sync";
>> -}
>> -
>> -static const char *timeline_fence_get_timeline_name(struct dma_fence *fence)
>> -{
>> -	struct sync_timeline *parent = dma_fence_parent(fence);
>> -
>> -	return parent->name;
>> -}
>> -
>> -static void timeline_fence_release(struct dma_fence *fence)
>> -{
>> -	struct sync_pt *pt = dma_fence_to_sync_pt(fence);
>> -	struct sync_timeline *parent = dma_fence_parent(fence);
>> -	unsigned long flags;
>> -
>> -	spin_lock_irqsave(fence->lock, flags);
>> -	if (!list_empty(&pt->link)) {
>> -		list_del(&pt->link);
>> -		rb_erase(&pt->node, &parent->pt_tree);
>> -	}
>> -	spin_unlock_irqrestore(fence->lock, flags);
>> -
>> -	sync_timeline_put(parent);
>> -	dma_fence_free(fence);
>> -}
>> -
>> -static bool timeline_fence_signaled(struct dma_fence *fence)
>> -{
>> -	struct sync_timeline *parent = dma_fence_parent(fence);
>> -
>> -	return !__dma_fence_is_later(fence->seqno, parent->value, fence->ops);
>> -}
>> -
>> -static bool timeline_fence_enable_signaling(struct dma_fence *fence)
>> -{
>> -	return true;
>> -}
>> -
>> -static void timeline_fence_value_str(struct dma_fence *fence,
>> -				    char *str, int size)
>> -{
>> -	snprintf(str, size, "%lld", fence->seqno);
>> -}
>> -
>> -static void timeline_fence_timeline_value_str(struct dma_fence *fence,
>> -					     char *str, int size)
>> -{
>> -	struct sync_timeline *parent = dma_fence_parent(fence);
>> -
>> -	snprintf(str, size, "%d", parent->value);
>> -}
>> -
>> -static const struct dma_fence_ops timeline_fence_ops = {
>> -	.get_driver_name = timeline_fence_get_driver_name,
>> -	.get_timeline_name = timeline_fence_get_timeline_name,
>> -	.enable_signaling = timeline_fence_enable_signaling,
>> -	.signaled = timeline_fence_signaled,
>> -	.release = timeline_fence_release,
>> -	.fence_value_str = timeline_fence_value_str,
>> -	.timeline_value_str = timeline_fence_timeline_value_str,
>> -};
>> -
>> -/**
>> - * sync_timeline_signal() - signal a status change on a sync_timeline
>> - * @obj:	sync_timeline to signal
>> - * @inc:	num to increment on timeline->value
>> - *
>> - * A sync implementation should call this any time one of it's fences
>> - * has signaled or has an error condition.
>> - */
>> -static void sync_timeline_signal(struct sync_timeline *obj, unsigned int inc)
>> -{
>> -	struct sync_pt *pt, *next;
>> -
>> -	trace_sync_timeline(obj);
>> -
>> -	spin_lock_irq(&obj->lock);
>> -
>> -	obj->value += inc;
>> -
>> -	list_for_each_entry_safe(pt, next, &obj->pt_list, link) {
>> -		if (!timeline_fence_signaled(&pt->base))
>> -			break;
>> -
>> -		list_del_init(&pt->link);
>> -		rb_erase(&pt->node, &obj->pt_tree);
>> -
>> -		/*
>> -		 * A signal callback may release the last reference to this
>> -		 * fence, causing it to be freed. That operation has to be
>> -		 * last to avoid a use after free inside this loop, and must
>> -		 * be after we remove the fence from the timeline in order to
>> -		 * prevent deadlocking on timeline->lock inside
>> -		 * timeline_fence_release().
>> -		 */
>> -		dma_fence_signal_locked(&pt->base);
>> -	}
>> -
>> -	spin_unlock_irq(&obj->lock);
>> -}
>> -
>> -/**
>> - * sync_pt_create() - creates a sync pt
>> - * @obj:	parent sync_timeline
>> - * @value:	value of the fence
>> - *
>> - * Creates a new sync_pt (fence) as a child of @parent.  @size bytes will be
>> - * allocated allowing for implementation specific data to be kept after
>> - * the generic sync_timeline struct. Returns the sync_pt object or
>> - * NULL in case of error.
>> - */
>> -static struct sync_pt *sync_pt_create(struct sync_timeline *obj,
>> -				      unsigned int value)
>> -{
>> -	struct sync_pt *pt;
>> -
>> -	pt = kzalloc(sizeof(*pt), GFP_KERNEL);
>> -	if (!pt)
>> -		return NULL;
>> -
>> -	sync_timeline_get(obj);
>> -	dma_fence_init(&pt->base, &timeline_fence_ops, &obj->lock,
>> -		       obj->context, value);
>> -	INIT_LIST_HEAD(&pt->link);
>> -
>> -	spin_lock_irq(&obj->lock);
>> -	if (!dma_fence_is_signaled_locked(&pt->base)) {
>> -		struct rb_node **p = &obj->pt_tree.rb_node;
>> -		struct rb_node *parent = NULL;
>> -
>> -		while (*p) {
>> -			struct sync_pt *other;
>> -			int cmp;
>> -
>> -			parent = *p;
>> -			other = rb_entry(parent, typeof(*pt), node);
>> -			cmp = value - other->base.seqno;
>> -			if (cmp > 0) {
>> -				p = &parent->rb_right;
>> -			} else if (cmp < 0) {
>> -				p = &parent->rb_left;
>> -			} else {
>> -				if (dma_fence_get_rcu(&other->base)) {
>> -					sync_timeline_put(obj);
>> -					kfree(pt);
>> -					pt = other;
>> -					goto unlock;
>> -				}
>> -				p = &parent->rb_left;
>> -			}
>> -		}
>> -		rb_link_node(&pt->node, parent, p);
>> -		rb_insert_color(&pt->node, &obj->pt_tree);
>> -
>> -		parent = rb_next(&pt->node);
>> -		list_add_tail(&pt->link,
>> -			      parent ? &rb_entry(parent, typeof(*pt), node)->link : &obj->pt_list);
>> -	}
>> -unlock:
>> -	spin_unlock_irq(&obj->lock);
>> -
>> -	return pt;
>> -}
>> -
>> -/*
>> - * *WARNING*
>> - *
>> - * improper use of this can result in deadlocking kernel drivers from userspace.
>> - */
>> -
>> -/* opening sw_sync create a new sync obj */
>> -static int sw_sync_debugfs_open(struct inode *inode, struct file *file)
>> -{
>> -	struct sync_timeline *obj;
>> -	char task_comm[TASK_COMM_LEN];
>> -
>> -	get_task_comm(task_comm, current);
>> -
>> -	obj = sync_timeline_create(task_comm);
>> -	if (!obj)
>> -		return -ENOMEM;
>> -
>> -	file->private_data = obj;
>> -
>> -	return 0;
>> -}
>> -
>> -static int sw_sync_debugfs_release(struct inode *inode, struct file *file)
>> -{
>> -	struct sync_timeline *obj = file->private_data;
>> -	struct sync_pt *pt, *next;
>> -
>> -	spin_lock_irq(&obj->lock);
>> -
>> -	list_for_each_entry_safe(pt, next, &obj->pt_list, link) {
>> -		dma_fence_set_error(&pt->base, -ENOENT);
>> -		dma_fence_signal_locked(&pt->base);
>> -	}
>> -
>> -	spin_unlock_irq(&obj->lock);
>> -
>> -	sync_timeline_put(obj);
>> -	return 0;
>> -}
>> -
>> -static long sw_sync_ioctl_create_fence(struct sync_timeline *obj,
>> -				       unsigned long arg)
>> -{
>> -	int fd = get_unused_fd_flags(O_CLOEXEC);
>> -	int err;
>> -	struct sync_pt *pt;
>> -	struct sync_file *sync_file;
>> -	struct sw_sync_create_fence_data data;
>> -
>> -	if (fd < 0)
>> -		return fd;
>> -
>> -	if (copy_from_user(&data, (void __user *)arg, sizeof(data))) {
>> -		err = -EFAULT;
>> -		goto err;
>> -	}
>> -
>> -	pt = sync_pt_create(obj, data.value);
>> -	if (!pt) {
>> -		err = -ENOMEM;
>> -		goto err;
>> -	}
>> -
>> -	sync_file = sync_file_create(&pt->base);
>> -	dma_fence_put(&pt->base);
>> -	if (!sync_file) {
>> -		err = -ENOMEM;
>> -		goto err;
>> -	}
>> -
>> -	data.fence = fd;
>> -	if (copy_to_user((void __user *)arg, &data, sizeof(data))) {
>> -		fput(sync_file->file);
>> -		err = -EFAULT;
>> -		goto err;
>> -	}
>> -
>> -	fd_install(fd, sync_file->file);
>> -
>> -	return 0;
>> -
>> -err:
>> -	put_unused_fd(fd);
>> -	return err;
>> -}
>> -
>> -static long sw_sync_ioctl_inc(struct sync_timeline *obj, unsigned long arg)
>> -{
>> -	u32 value;
>> -
>> -	if (copy_from_user(&value, (void __user *)arg, sizeof(value)))
>> -		return -EFAULT;
>> -
>> -	while (value > INT_MAX)  {
>> -		sync_timeline_signal(obj, INT_MAX);
>> -		value -= INT_MAX;
>> -	}
>> -
>> -	sync_timeline_signal(obj, value);
>> -
>> -	return 0;
>> -}
>> -
>> -static long sw_sync_ioctl(struct file *file, unsigned int cmd,
>> -			  unsigned long arg)
>> -{
>> -	struct sync_timeline *obj = file->private_data;
>> -
>> -	switch (cmd) {
>> -	case SW_SYNC_IOC_CREATE_FENCE:
>> -		return sw_sync_ioctl_create_fence(obj, arg);
>> -
>> -	case SW_SYNC_IOC_INC:
>> -		return sw_sync_ioctl_inc(obj, arg);
>> -
>> -	default:
>> -		return -ENOTTY;
>> -	}
>> -}
>> -
>> -const struct file_operations sw_sync_debugfs_fops = {
>> -	.open           = sw_sync_debugfs_open,
>> -	.release        = sw_sync_debugfs_release,
>> -	.unlocked_ioctl = sw_sync_ioctl,
>> -	.compat_ioctl	= compat_ptr_ioctl,
>> -};
>> diff --git a/drivers/dma-buf/sync_debug.c b/drivers/dma-buf/sync_debug.c
>> deleted file mode 100644
>> index 101394f16930..000000000000
>> --- a/drivers/dma-buf/sync_debug.c
>> +++ /dev/null
>> @@ -1,190 +0,0 @@
>> -// SPDX-License-Identifier: GPL-2.0-only
>> -/*
>> - * Sync File validation framework and debug information
>> - *
>> - * Copyright (C) 2012 Google, Inc.
>> - */
>> -
>> -#include <linux/debugfs.h>
>> -#include "sync_debug.h"
>> -
>> -static struct dentry *dbgfs;
>> -
>> -static LIST_HEAD(sync_timeline_list_head);
>> -static DEFINE_SPINLOCK(sync_timeline_list_lock);
>> -static LIST_HEAD(sync_file_list_head);
>> -static DEFINE_SPINLOCK(sync_file_list_lock);
>> -
>> -void sync_timeline_debug_add(struct sync_timeline *obj)
>> -{
>> -	unsigned long flags;
>> -
>> -	spin_lock_irqsave(&sync_timeline_list_lock, flags);
>> -	list_add_tail(&obj->sync_timeline_list, &sync_timeline_list_head);
>> -	spin_unlock_irqrestore(&sync_timeline_list_lock, flags);
>> -}
>> -
>> -void sync_timeline_debug_remove(struct sync_timeline *obj)
>> -{
>> -	unsigned long flags;
>> -
>> -	spin_lock_irqsave(&sync_timeline_list_lock, flags);
>> -	list_del(&obj->sync_timeline_list);
>> -	spin_unlock_irqrestore(&sync_timeline_list_lock, flags);
>> -}
>> -
>> -void sync_file_debug_add(struct sync_file *sync_file)
>> -{
>> -	unsigned long flags;
>> -
>> -	spin_lock_irqsave(&sync_file_list_lock, flags);
>> -	list_add_tail(&sync_file->sync_file_list, &sync_file_list_head);
>> -	spin_unlock_irqrestore(&sync_file_list_lock, flags);
>> -}
>> -
>> -void sync_file_debug_remove(struct sync_file *sync_file)
>> -{
>> -	unsigned long flags;
>> -
>> -	spin_lock_irqsave(&sync_file_list_lock, flags);
>> -	list_del(&sync_file->sync_file_list);
>> -	spin_unlock_irqrestore(&sync_file_list_lock, flags);
>> -}
>> -
>> -static const char *sync_status_str(int status)
>> -{
>> -	if (status < 0)
>> -		return "error";
>> -
>> -	if (status > 0)
>> -		return "signaled";
>> -
>> -	return "active";
>> -}
>> -
>> -static void sync_print_fence(struct seq_file *s,
>> -			     struct dma_fence *fence, bool show)
>> -{
>> -	struct sync_timeline *parent = dma_fence_parent(fence);
>> -	int status;
>> -
>> -	status = dma_fence_get_status_locked(fence);
>> -
>> -	seq_printf(s, "  %s%sfence %s",
>> -		   show ? parent->name : "",
>> -		   show ? "_" : "",
>> -		   sync_status_str(status));
>> -
>> -	if (test_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT, &fence->flags)) {
>> -		struct timespec64 ts64 =
>> -			ktime_to_timespec64(fence->timestamp);
>> -
>> -		seq_printf(s, "@%lld.%09ld", (s64)ts64.tv_sec, ts64.tv_nsec);
>> -	}
>> -
>> -	if (fence->ops->timeline_value_str &&
>> -		fence->ops->fence_value_str) {
>> -		char value[64];
>> -		bool success;
>> -
>> -		fence->ops->fence_value_str(fence, value, sizeof(value));
>> -		success = strlen(value);
>> -
>> -		if (success) {
>> -			seq_printf(s, ": %s", value);
>> -
>> -			fence->ops->timeline_value_str(fence, value,
>> -						       sizeof(value));
>> -
>> -			if (strlen(value))
>> -				seq_printf(s, " / %s", value);
>> -		}
>> -	}
>> -
>> -	seq_putc(s, '\n');
>> -}
>> -
>> -static void sync_print_obj(struct seq_file *s, struct sync_timeline *obj)
>> -{
>> -	struct list_head *pos;
>> -
>> -	seq_printf(s, "%s: %d\n", obj->name, obj->value);
>> -
>> -	spin_lock_irq(&obj->lock);
>> -	list_for_each(pos, &obj->pt_list) {
>> -		struct sync_pt *pt = container_of(pos, struct sync_pt, link);
>> -		sync_print_fence(s, &pt->base, false);
>> -	}
>> -	spin_unlock_irq(&obj->lock);
>> -}
>> -
>> -static void sync_print_sync_file(struct seq_file *s,
>> -				  struct sync_file *sync_file)
>> -{
>> -	char buf[128];
>> -	int i;
>> -
>> -	seq_printf(s, "[%p] %s: %s\n", sync_file,
>> -		   sync_file_get_name(sync_file, buf, sizeof(buf)),
>> -		   sync_status_str(dma_fence_get_status(sync_file->fence)));
>> -
>> -	if (dma_fence_is_array(sync_file->fence)) {
>> -		struct dma_fence_array *array = to_dma_fence_array(sync_file->fence);
>> -
>> -		for (i = 0; i < array->num_fences; ++i)
>> -			sync_print_fence(s, array->fences[i], true);
>> -	} else {
>> -		sync_print_fence(s, sync_file->fence, true);
>> -	}
>> -}
>> -
>> -static int sync_info_debugfs_show(struct seq_file *s, void *unused)
>> -{
>> -	struct list_head *pos;
>> -
>> -	seq_puts(s, "objs:\n--------------\n");
>> -
>> -	spin_lock_irq(&sync_timeline_list_lock);
>> -	list_for_each(pos, &sync_timeline_list_head) {
>> -		struct sync_timeline *obj =
>> -			container_of(pos, struct sync_timeline,
>> -				     sync_timeline_list);
>> -
>> -		sync_print_obj(s, obj);
>> -		seq_putc(s, '\n');
>> -	}
>> -	spin_unlock_irq(&sync_timeline_list_lock);
>> -
>> -	seq_puts(s, "fences:\n--------------\n");
>> -
>> -	spin_lock_irq(&sync_file_list_lock);
>> -	list_for_each(pos, &sync_file_list_head) {
>> -		struct sync_file *sync_file =
>> -			container_of(pos, struct sync_file, sync_file_list);
>> -
>> -		sync_print_sync_file(s, sync_file);
>> -		seq_putc(s, '\n');
>> -	}
>> -	spin_unlock_irq(&sync_file_list_lock);
>> -	return 0;
>> -}
>> -
>> -DEFINE_SHOW_ATTRIBUTE(sync_info_debugfs);
>> -
>> -static __init int sync_debugfs_init(void)
>> -{
>> -	dbgfs = debugfs_create_dir("sync", NULL);
>> -
>> -	/*
>> -	 * The debugfs files won't ever get removed and thus, there is
>> -	 * no need to protect it against removal races. The use of
>> -	 * debugfs_create_file_unsafe() is actually safe here.
>> -	 */
>> -	debugfs_create_file_unsafe("info", 0444, dbgfs, NULL,
>> -				   &sync_info_debugfs_fops);
>> -	debugfs_create_file_unsafe("sw_sync", 0644, dbgfs, NULL,
>> -				   &sw_sync_debugfs_fops);
>> -
>> -	return 0;
>> -}
>> -late_initcall(sync_debugfs_init);
>> diff --git a/drivers/dma-buf/sync_debug.h b/drivers/dma-buf/sync_debug.h
>> deleted file mode 100644
>> index 6176e52ba2d7..000000000000
>> --- a/drivers/dma-buf/sync_debug.h
>> +++ /dev/null
>> @@ -1,72 +0,0 @@
>> -/*
>> - * Sync File validation framework and debug infomation
>> - *
>> - * Copyright (C) 2012 Google, Inc.
>> - *
>> - * This program is distributed in the hope that it will be useful,
>> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> - * GNU General Public License for more details.
>> - *
>> - */
>> -
>> -#ifndef _LINUX_SYNC_H
>> -#define _LINUX_SYNC_H
>> -
>> -#include <linux/list.h>
>> -#include <linux/rbtree.h>
>> -#include <linux/spinlock.h>
>> -#include <linux/dma-fence.h>
>> -
>> -#include <linux/sync_file.h>
>> -#include <uapi/linux/sync_file.h>
>> -
>> -/**
>> - * struct sync_timeline - sync object
>> - * @kref:		reference count on fence.
>> - * @name:		name of the sync_timeline. Useful for debugging
>> - * @lock:		lock protecting @pt_list and @value
>> - * @pt_tree:		rbtree of active (unsignaled/errored) sync_pts
>> - * @pt_list:		list of active (unsignaled/errored) sync_pts
>> - * @sync_timeline_list:	membership in global sync_timeline_list
>> - */
>> -struct sync_timeline {
>> -	struct kref		kref;
>> -	char			name[32];
>> -
>> -	/* protected by lock */
>> -	u64			context;
>> -	int			value;
>> -
>> -	struct rb_root		pt_tree;
>> -	struct list_head	pt_list;
>> -	spinlock_t		lock;
>> -
>> -	struct list_head	sync_timeline_list;
>> -};
>> -
>> -static inline struct sync_timeline *dma_fence_parent(struct dma_fence *fence)
>> -{
>> -	return container_of(fence->lock, struct sync_timeline, lock);
>> -}
>> -
>> -/**
>> - * struct sync_pt - sync_pt object
>> - * @base: base fence object
>> - * @link: link on the sync timeline's list
>> - * @node: node in the sync timeline's tree
>> - */
>> -struct sync_pt {
>> -	struct dma_fence base;
>> -	struct list_head link;
>> -	struct rb_node node;
>> -};
>> -
>> -extern const struct file_operations sw_sync_debugfs_fops;
>> -
>> -void sync_timeline_debug_add(struct sync_timeline *obj);
>> -void sync_timeline_debug_remove(struct sync_timeline *obj);
>> -void sync_file_debug_add(struct sync_file *fence);
>> -void sync_file_debug_remove(struct sync_file *fence);
>> -
>> -#endif /* _LINUX_SYNC_H */
>> -- 
>> 2.25.1
>>

