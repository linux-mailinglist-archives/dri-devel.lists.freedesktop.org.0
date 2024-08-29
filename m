Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C40964079
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 11:45:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2296610E138;
	Thu, 29 Aug 2024 09:45:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="VXLPRr4Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0717310E09C
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 09:45:17 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-371a13c7c80so1001630f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 02:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1724924716; x=1725529516; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=X/ew6c3GPDdN6TI82CEgi7J8JUI/XfLe9JX3r53NCwE=;
 b=VXLPRr4QjJjhfdmVjKHO6mQzI3l965nblEeCXAz2pHXTAScusQshchcBxTLDarNOoU
 k3II3HHc43xL/dIRqJmz9LlrcedPzu8CL2Ao06OirSVUT/6dQ7jb1waGThsgGMKWaDeV
 MwrcWZVvApWuTeUQa7pj7ibi7nbkkmpZySY4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724924716; x=1725529516;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=X/ew6c3GPDdN6TI82CEgi7J8JUI/XfLe9JX3r53NCwE=;
 b=WS2yCYTPIkEoUtwChRmObQKakNxkRM6YlTcplfmB3MvFBCE87UoUKZ4MoCPH0AvwnB
 P4YX/HPKwMM2atdfVZqOcL0urRaCmY2E1b4Toy363/CyRLzrek40r3MGrudhaYNF+qY9
 Fo9GnmW/Q5rHPW6n0f5tIfhP36RWRZr37GeVGaVTAKPDQMFd4bvM71W0HemjRl4rY8t9
 O2kWWJl4j5Ytr8nAmasyWy9ocqRuGLs+DvcQ2uhwQXUc+Pkiakn1kgPyiLkECYlrVZc3
 /+F6QaUsuSYmNfc62ZQ9kdPPvjeTUyRMmHA5/IgaESNK1tJo4vEAJgaVmsNV81PnhDPm
 /HeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOT/rxrWViAAM2Jo5POdnBW1ObS6b3nZZIM/kZ2uXMNnaD1wkVMmIL/e35WzHmcm1kjcSid0p1p3o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzgqCrX4vB84/EQuBsk/PILy6v9bz09Knb3cdhMqZ27+Za8DGoY
 fnpwRsAqiACXyLe7eY3IF2n9I7dhcte4/nq/N+dTeYdyS0aO4/SBiCMT5GSc/fI=
X-Google-Smtp-Source: AGHT+IEeyXz42Yl3en6obJZBMXx3grdFd4H/pRAvWWVle1TWKoNuJSEnuvJzXGahZHxanNR4n4F5yA==
X-Received: by 2002:a5d:5e13:0:b0:366:dfc4:3790 with SMTP id
 ffacd0b85a97d-3749fcdec8fmr679625f8f.0.1724924715727; 
 Thu, 29 Aug 2024 02:45:15 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3749ee71856sm955067f8f.30.2024.08.29.02.45.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2024 02:45:10 -0700 (PDT)
Date: Thu, 29 Aug 2024 11:45:08 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, matthew.auld@intel.com, daniel@ffwll.ch
Subject: Re: [RFC PATCH 05/28] drm/gpusvm: Add support for GPU Shared Virtual
 Memory
Message-ID: <ZtBDJCfWxaEOqILc@phenom.ffwll.local>
References: <20240828024901.2582335-1-matthew.brost@intel.com>
 <20240828024901.2582335-6-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240828024901.2582335-6-matthew.brost@intel.com>
X-Operating-System: Linux phenom 6.9.12-amd64 
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

On Tue, Aug 27, 2024 at 07:48:38PM -0700, Matthew Brost wrote:
> This patch introduces support for GPU Shared Virtual Memory (SVM) in the
> Direct Rendering Manager (DRM) subsystem. SVM allows for seamless
> sharing of memory between the CPU and GPU, enhancing performance and
> flexibility in GPU computing tasks.
> 
> The patch adds the necessary infrastructure for SVM, including data
> structures and functions for managing SVM ranges and notifiers. It also
> provides mechanisms for allocating, deallocating, and migrating memory
> regions between system RAM and GPU VRAM.
> 
> This mid-layer is largely inspired by GPUVM.
> 
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: <dri-devel@lists.freedesktop.org>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Still not sure I've got the right race that you paper over with
mmap_write_lock, but I spotted a few things, commments inline.

> ---
>  drivers/gpu/drm/xe/Makefile     |    3 +-
>  drivers/gpu/drm/xe/drm_gpusvm.c | 2174 +++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/drm_gpusvm.h |  415 ++++++
>  3 files changed, 2591 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/xe/drm_gpusvm.c
>  create mode 100644 drivers/gpu/drm/xe/drm_gpusvm.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index b9670ae09a9e..b8fc2ee58f1a 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -25,7 +25,8 @@ $(obj)/generated/%_wa_oob.c $(obj)/generated/%_wa_oob.h: $(obj)/xe_gen_wa_oob \
>  
>  # core driver code
>  
> -xe-y += xe_bb.o \
> +xe-y += drm_gpusvm.o \
> +	xe_bb.o \
>  	xe_bo.o \
>  	xe_bo_evict.o \
>  	xe_devcoredump.o \
> diff --git a/drivers/gpu/drm/xe/drm_gpusvm.c b/drivers/gpu/drm/xe/drm_gpusvm.c
> new file mode 100644
> index 000000000000..fc1e44e6ae72
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/drm_gpusvm.c
> @@ -0,0 +1,2174 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + *
> + * Authors:
> + *     Matthew Brost <matthew.brost@intel.com>
> + */
> +
> +#include <linux/dma-mapping.h>
> +#include <linux/interval_tree_generic.h>
> +#include <linux/hmm.h>
> +#include <linux/memremap.h>
> +#include <linux/migrate.h>
> +#include <linux/mm_types.h>
> +#include <linux/pagemap.h>
> +#include <linux/slab.h>
> +
> +#include <drm/drm_device.h>
> +#include "drm_gpusvm.h"
> +
> +/**
> + * DOC: Overview
> + *
> + * GPU Shared Virtual Memory (GPU SVM) layer for the Direct Rendering Manager (DRM)
> + *
> + * The GPU SVM layer is a component of the DRM framework designed to manage shared
> + * virtual memory between the CPU and GPU. It enables efficient data exchange and
> + * processing for GPU-accelerated applications by allowing memory sharing and
> + * synchronization between the CPU's and GPU's virtual address spaces.
> + *
> + * Key GPU SVM Components:
> + * - Notifiers: Notifiers: Used for tracking memory intervals and notifying the
> + *		GPU of changes, notifiers are sized based on a GPU SVM
> + *		initialization parameter, with a recommendation of 512M or
> + *		larger. They maintain a Red-BlacK tree and a list of ranges that
> + *		fall within the notifier interval. Notifiers are tracked within
> + *		a GPU SVM Red-BlacK tree and list and are dynamically inserted
> + *		or removed as ranges within the interval are created or
> + *		destroyed.
> + * - Ranges: Represent memory ranges mapped in a DRM device and managed
> + *	     by GPU SVM. They are sized based on an array of chunk sizes, which
> + *	     is a GPU SVM initialization parameter, and the CPU address space.
> + *	     Upon GPU fault, the largest aligned chunk that fits within the
> + *	     faulting CPU address space is chosen for the range size. Ranges are
> + *	     expected to be dynamically allocated on GPU fault and removed on an
> + *	     MMU notifier UNMAP event. As mentioned above, ranges are tracked in
> + *	     a notifier's Red-Black tree.
> + * - Operations: Define the interface for driver-specific SVM operations such as
> + *		 allocation, page collection, migration, invalidations, and VRAM
> + *		 release.
> + *
> + * This layer provides interfaces for allocating, mapping, migrating, and
> + * releasing memory ranges between the CPU and GPU. It handles all core memory
> + * management interactions (DMA mapping, HMM, and migration) and provides
> + * driver-specific virtual functions (vfuncs). This infrastructure is sufficient
> + * to build the expected driver components for an SVM implementation as detailed
> + * below.
> + *
> + * Expected Driver Components:
> + * - GPU page fault handler: Used to create ranges and notifiers based on the
> + *			     fault address, optionally migrate the range to
> + *			     VRAM, and create GPU bindings.
> + * - Garbage collector: Used to destroy GPU bindings for ranges. Ranges are
> + *			expected to be added to the garbage collector upon
> + *			MMU_NOTIFY_UNMAP event.
> + */
> +
> +/**
> + * DOC: Locking
> + *
> + * GPU SVM handles locking for core MM interactions, i.e., it locks/unlocks the
> + * mmap lock as needed. Alternatively, if the driver prefers to handle the mmap
> + * lock itself, a 'locked' argument is provided to the functions that require
> + * the mmap lock. This option may be useful for drivers that need to call into
> + * GPU SVM while also holding a dma-resv lock, thus preventing locking
> + * inversions between the mmap and dma-resv locks.
> + *
> + * GPU SVM introduces a global notifier lock, which safeguards the notifier's
> + * range RB tree and list, as well as the range's DMA mappings and sequence
> + * number. GPU SVM manages all necessary locking and unlocking operations,
> + * except for the recheck of the range's sequence number
> + * (mmu_interval_read_retry) when the driver is committing GPU bindings. This
> + * lock corresponds to the 'driver->update' lock mentioned in the HMM
> + * documentation (TODO: Link). Future revisions may transition from a GPU SVM
> + * global lock to a per-notifier lock if finer-grained locking is deemed
> + * necessary.
> + *
> + * In addition to the locking mentioned above, the driver should implement a
> + * lock to safeguard core GPU SVM function calls that modify state, such as
> + * drm_gpusvm_range_find_or_insert and drm_gpusvm_range_remove. Alternatively,
> + * these core functions can be called within a single kernel thread, for
> + * instance, using an ordered work queue. This lock is denoted as
> + * 'driver_svm_lock' in code examples.

I think this doesn't work, because essentially it forces a single threaded
design. Core mm isn't single threaded, and you cannot lock them all out,
at least not easily.

So I think a design requirement is that gpusvm can cope with migrations to
ram due to cpu faults, migrations for other reasons, gpu fault handling
all concurrently. Currently with the combo of driver_svm_lock + taking
mmap_write_lock you serialize this all a lot, which I think is hiding
design bugs.

> + */
> +
> +/**
> + * DOC: Migrataion
> + *
> + * The migration support is quite simple, allowing migration between SRAM and
> + * VRAM at the range granularity. For example, GPU SVM currently does not
> + * support mixing SRAM and VRAM pages within a range. This means that upon GPU
> + * fault, the entire range can be migrated to VRAM, and upon CPU fault, the
> + * entire range is migrated to SRAM.
> + *
> + * The reasoning for only supporting range granularity is as follows: it
> + * simplifies the implementation, and range sizes are driver-defined and should
> + * be relatively small.
> + */
> +
> +/**
> + * DOC: Partial Unmapping of Ranges
> + *
> + * Partial unmapping of ranges (e.g., 1M out of 2M is unmapped by CPU resulting
> + * in MMU_NOTIFY_UNMAP event) presents several challenges, with the main one
> + * being that a subset of the range still has CPU and GPU mappings. If the
> + * backing store for the range is in VRAM, a subset of the backing store has
> + * references. One option would be to split the range and VRAM backing store,
> + * but the implementation for this would be quite complicated. Given that
> + * partial unmappings are rare and driver-defined range sizes are relatively
> + * small, GPU SVM does not support splitting of ranges.
> + *
> + * With no support for range splitting, upon partial unmapping of a range, the
> + * driver is expected to invalidate and destroy the entire range. If the range
> + * has VRAM as its backing, the driver is also expected to migrate any remaining
> + * pages back to SRAM.
> + */
> +
> +/**
> + * DOC: Examples
> + *
> + * This section provides two examples of how to build the expected driver
> + * components: the GPU page fault handler and the garbage collector. A third
> + * example demonstrates a sample invalidation driver vfunc.
> + *
> + * The generic code provided does not include logic for complex migration
> + * policies, optimized invalidations, or other potentially required driver
> + * locking (e.g., DMA-resv locks).
> + *
> + * 1) GPU page fault handler
> + *
> + *	int driver_bind_range(struct drm_gpusvm *gpusvm, struct drm_gpusvm_range *range)
> + *	{
> + *		int err = 0;
> + *
> + *		driver_alloc_and_setup_memory_for_bind(gpusvm, range);
> + *
> + *		drm_gpusvm_notifier_lock(gpusvm);
> + *		if (drm_gpusvm_range_pages_valid(range))
> + *			driver_commit_bind(gpusvm, range);
> + *		else
> + *			err = -EAGAIN;
> + *		drm_gpusvm_notifier_unlock(gpusvm);
> + *
> + *		return err;
> + *	}
> + *
> + *	int driver_gpu_fault(struct drm_gpusvm *gpusvm, u64 fault_addr,
> + *			     u64 gpuva_start, u64 gpuva_end)
> + *	{
> + *		struct drm_gpusvm_ctx ctx = {};
> + *		int err;
> + *
> + *		driver_svm_lock();
> + *	retry:
> + *		// Always process UNMAPs first so view of GPU SVM ranges is current
> + *		driver_garbage_collector(gpusvm);
> + *
> + *		range = drm_gpusvm_range_find_or_insert(gpusvm, fault_addr,
> + *							gpuva_start, gpuva_end,
> + *						        &ctx);
> + *		if (IS_ERR(range)) {
> + *			err = PTR_ERR(range);
> + *			goto unlock;
> + *		}
> + *
> + *		if (driver_migration_policy(range)) {
> + *			bo = driver_alloc_bo();
> + *			err = drm_gpusvm_migrate_to_vram(gpusvm, range, bo, &ctx);
> + *			if (err)	// CPU mappings may have changed
> + *				goto retry;
> + *		}
> + *
> + *		err = drm_gpusvm_range_get_pages(gpusvm, range, &ctx);
> + *		if (err == -EFAULT || err == -EPERM)	// CPU mappings changed
> + *			goto retry;
> + *		else if (err)
> + *			goto unlock;
> + *
> + *		err = driver_bind_range(gpusvm, range);
> + *		if (err == -EAGAIN)	// CPU mappings changed
> + *			goto retry
> + *
> + *	unlock:
> + *		driver_svm_unlock();
> + *		return err;
> + *	}
> + *
> + * 2) Garbage Collector.
> + *
> + *	void __driver_garbage_collector(struct drm_gpusvm *gpusvm,
> + *					struct drm_gpusvm_range *range)
> + *	{
> + *		struct drm_gpusvm_ctx ctx = {};
> + *
> + *		assert_driver_svm_locked(gpusvm);
> + *
> + *		// Partial unmap, migrate any remaining VRAM pages back to SRAM
> + *		if (range->flags.partial_unmap)
> + *			drm_gpusvm_migrate_to_sram(gpusvm, range, &ctx);

Note that the migration back to sram isn't guaranteed to succeed, so you
might be still stuck with partially migrated range. This might be a case
where hmm gives you vram pfns, but the range you have doesn't have any
vram allocation anymore because you droppped it here. Not sure tbh.

> + *
> + *		driver_unbind_range(range);
> + *		drm_gpusvm_range_remove(gpusvm, range);
> + *	}
> + *
> + *	void driver_garbage_collector(struct drm_gpusvm *gpusvm)
> + *	{
> + *		assert_driver_svm_locked(gpusvm);
> + *
> + *		for_each_range_in_garbage_collector(gpusvm, range)
> + *			__driver_garbage_collector(gpusvm, range);
> + *	}
> + *
> + * 3) Invalidation driver vfunc.
> + *
> + *	void driver_invalidation(struct drm_gpusvm *gpusvm,
> + *				 struct drm_gpusvm_notifier *notifier,
> + *				 const struct mmu_notifier_range *mmu_range)
> + *	{
> + *		struct drm_gpusvm_ctx ctx = { .in_notifier = true, };
> + *		struct drm_gpusvm_range *range = NULL;
> + *
> + *		driver_invalidate_device_tlb(gpusvm, mmu_range->start, mmu_range->end);
> + *
> + *		drm_gpusvm_for_each_range(range, notifier, mmu_range->start,
> + *					  mmu_range->end) {
> + *			drm_gpusvm_range_unmap_pages(gpusvm, range, &ctx);
> + *
> + *			if (mmu_range->event != MMU_NOTIFY_UNMAP)
> + *				continue;
> + *
> + *			drm_gpusvm_range_set_unmapped(range, mmu_range);
> + *			driver_garbage_collector_add(gpusvm, range);
> + *		}
> + *	}
> + */
> +
> +#define DRM_GPUSVM_RANGE_START(_range)	((_range)->va.start)
> +#define DRM_GPUSVM_RANGE_END(_range)	((_range)->va.end - 1)
> +INTERVAL_TREE_DEFINE(struct drm_gpusvm_range, rb.node, u64, rb.__subtree_last,
> +		     DRM_GPUSVM_RANGE_START, DRM_GPUSVM_RANGE_END,
> +		     static __maybe_unused, range);
> +
> +#define DRM_GPUSVM_NOTIFIER_START(_notifier)	((_notifier)->interval.start)
> +#define DRM_GPUSVM_NOTIFIER_END(_notifier)	((_notifier)->interval.end - 1)
> +INTERVAL_TREE_DEFINE(struct drm_gpusvm_notifier, rb.node, u64,
> +		     rb.__subtree_last, DRM_GPUSVM_NOTIFIER_START,
> +		     DRM_GPUSVM_NOTIFIER_END, static __maybe_unused, notifier);
> +
> +/**
> + * npages_in_range() - Calculate the number of pages in a given range
> + * @start__: The start address of the range
> + * @end__: The end address of the range
> + *
> + * This macro calculates the number of pages in a given memory range,
> + * specified by the start and end addresses. It divides the difference
> + * between the end and start addresses by the page size (PAGE_SIZE) to
> + * determine the number of pages in the range.
> + *
> + * Return: The number of pages in the specified range.
> + */
> +#define npages_in_range(start__, end__)	\
> +	(((end__) - (start__)) >> PAGE_SHIFT)
> +
> +/**
> + * struct drm_gpusvm_zdd - GPU SVM zone device data
> + *
> + * @refcount: Reference count for the zdd
> + * @destroy_work: Work structure for asynchronous zdd destruction
> + * @range: Pointer to the GPU SVM range
> + * @vram_allocation: Driver-private pointer to the VRAM allocation
> + *
> + * This structure serves as a generic wrapper installed in
> + * page->zone_device_data. It provides infrastructure for looking up a range
> + * upon CPU page fault and asynchronously releasing VRAM once the CPU has no
> + * page references. Asynchronous release is useful because CPU page references
> + * can be dropped in IRQ contexts, while releasing VRAM likely requires sleeping
> + * locks.
> + */
> +struct drm_gpusvm_zdd {
> +	struct kref refcount;
> +	struct work_struct destroy_work;
> +	struct drm_gpusvm_range *range;
> +	void *vram_allocation;
> +};
> +
> +/**
> + * drm_gpusvm_zdd_destroy_work_func - Work function for destroying a zdd
> + * @w: Pointer to the work_struct
> + *
> + * This function releases VRAM, puts GPU SVM range, and frees zdd.
> + */
> +static void drm_gpusvm_zdd_destroy_work_func(struct work_struct *w)
> +{
> +	struct drm_gpusvm_zdd *zdd =
> +		container_of(w, struct drm_gpusvm_zdd, destroy_work);
> +	struct drm_gpusvm_range *range = zdd->range;
> +	struct drm_gpusvm *gpusvm = range->gpusvm;
> +
> +	if (gpusvm->ops->vram_release && zdd->vram_allocation)
> +		gpusvm->ops->vram_release(zdd->vram_allocation);
> +	drm_gpusvm_range_put(range);
> +	kfree(zdd);
> +}
> +
> +/**
> + * drm_gpusvm_zdd_alloc - Allocate a zdd structure.
> + * @range: Pointer to the GPU SVM range.
> + *
> + * This function allocates and initializes a new zdd structure. It sets up the
> + * reference count, initializes the destroy work, and links the provided GPU SVM
> + * range.
> + *
> + * Returns:
> + * Pointer to the allocated zdd on success, ERR_PTR() on failure.
> + */
> +static struct drm_gpusvm_zdd *
> +drm_gpusvm_zdd_alloc(struct drm_gpusvm_range *range)
> +{
> +	struct drm_gpusvm_zdd *zdd;
> +
> +	zdd = kmalloc(sizeof(*zdd), GFP_KERNEL);
> +	if (!zdd)
> +		return NULL;
> +
> +	kref_init(&zdd->refcount);
> +	INIT_WORK(&zdd->destroy_work, drm_gpusvm_zdd_destroy_work_func);
> +	zdd->range = drm_gpusvm_range_get(range);
> +	zdd->vram_allocation = NULL;
> +
> +	return zdd;
> +}
> +
> +/**
> + * drm_gpusvm_zdd_get - Get a reference to a zdd structure.
> + * @zdd: Pointer to the zdd structure.
> + *
> + * This function increments the reference count of the provided zdd structure.
> + *
> + * Returns: Pointer to the zdd structure.
> + */
> +static struct drm_gpusvm_zdd *drm_gpusvm_zdd_get(struct drm_gpusvm_zdd *zdd)
> +{
> +	kref_get(&zdd->refcount);
> +	return zdd;
> +}
> +
> +/**
> + * drm_gpusvm_zdd_destroy - Destroy a zdd structure.
> + * @ref: Pointer to the reference count structure.
> + *
> + * This function queues the destroy_work of the zdd for asynchronous destruction.
> + */
> +static void drm_gpusvm_zdd_destroy(struct kref *ref)
> +{
> +	struct drm_gpusvm_zdd *zdd =
> +		container_of(ref, struct drm_gpusvm_zdd, refcount);
> +	struct drm_gpusvm *gpusvm = zdd->range->gpusvm;
> +
> +	queue_work(gpusvm->zdd_wq, &zdd->destroy_work);
> +}
> +
> +/**
> + * drm_gpusvm_zdd_put - Put a zdd reference.
> + * @zdd: Pointer to the zdd structure.
> + *
> + * This function decrements the reference count of the provided zdd structure
> + * and schedules its destruction if the count drops to zero.
> + */
> +static void drm_gpusvm_zdd_put(struct drm_gpusvm_zdd *zdd)
> +{
> +	kref_put(&zdd->refcount, drm_gpusvm_zdd_destroy);
> +}
> +
> +/**
> + * drm_gpusvm_range_find - Find GPU SVM range from GPU SVM notifier
> + * @notifier: Pointer to the GPU SVM notifier structure.
> + * @start: Start address of the range
> + * @end: End address of the range
> + *
> + * Return: A pointer to the drm_gpusvm_range if found or NULL
> + */
> +struct drm_gpusvm_range *
> +drm_gpusvm_range_find(struct drm_gpusvm_notifier *notifier, u64 start, u64 end)
> +{
> +	return range_iter_first(&notifier->root, start, end - 1);
> +}
> +
> +/**
> + * drm_gpusvm_for_each_range_safe - Safely iterate over GPU SVM ranges in a notifier
> + * @range__: Iterator variable for the ranges
> + * @next__: Iterator variable for the ranges temporay storage
> + * @notifier__: Pointer to the GPU SVM notifier
> + * @start__: Start address of the range
> + * @end__: End address of the range
> + *
> + * This macro is used to iterate over GPU SVM ranges in a notifier while
> + * removing ranges from it.
> + */
> +#define drm_gpusvm_for_each_range_safe(range__, next__, notifier__, start__, end__)	\
> +	for ((range__) = drm_gpusvm_range_find((notifier__), (start__), (end__)),	\
> +	     (next__) = __drm_gpusvm_range_next(range__);				\
> +	     (range__) && (range__->va.start < (end__));				\
> +	     (range__) = (next__), (next__) = __drm_gpusvm_range_next(range__))
> +
> +/**
> + * __drm_gpusvm_notifier_next - get the next drm_gpusvm_notifier in the list
> + * @notifier: a pointer to the current drm_gpusvm_notifier
> + *
> + * Return: A pointer to the next drm_gpusvm_notifier if available, or NULL if
> + *         the current notifier is the last one or if the input notifier is
> + *         NULL.
> + */
> +static struct drm_gpusvm_notifier *
> +__drm_gpusvm_notifier_next(struct drm_gpusvm_notifier *notifier)
> +{
> +	if (notifier && !list_is_last(&notifier->rb.entry,
> +				      &notifier->gpusvm->notifier_list))
> +		return list_next_entry(notifier, rb.entry);
> +
> +	return NULL;
> +}
> +
> +/**
> + * drm_gpusvm_for_each_notifier - Iterate over GPU SVM notifiers in a gpusvm
> + * @notifier__: Iterator variable for the notifiers
> + * @notifier__: Pointer to the GPU SVM notifier
> + * @start__: Start address of the notifier
> + * @end__: End address of the notifier
> + *
> + * This macro is used to iterate over GPU SVM notifiers in a gpusvm.
> + */
> +#define drm_gpusvm_for_each_notifier(notifier__, gpusvm__, start__, end__)		\
> +	for ((notifier__) = notifier_iter_first(&(gpusvm__)->root, (start__), (end__) - 1);	\
> +	     (notifier__) && (notifier__->interval.start < (end__));			\
> +	     (notifier__) = __drm_gpusvm_notifier_next(notifier__))
> +
> +/**
> + * drm_gpusvm_for_each_notifier_safe - Safely iterate over GPU SVM notifiers in a gpusvm
> + * @notifier__: Iterator variable for the notifiers
> + * @next__: Iterator variable for the notifiers temporay storage
> + * @notifier__: Pointer to the GPU SVM notifier
> + * @start__: Start address of the notifier
> + * @end__: End address of the notifier
> + *
> + * This macro is used to iterate over GPU SVM notifiers in a gpusvm while
> + * removing notifiers from it.
> + */
> +#define drm_gpusvm_for_each_notifier_safe(notifier__, next__, gpusvm__, start__, end__)	\
> +	for ((notifier__) = notifier_iter_first(&(gpusvm__)->root, (start__), (end__) - 1),	\
> +	     (next__) = __drm_gpusvm_notifier_next(notifier__);				\
> +	     (notifier__) && (notifier__->interval.start < (end__));			\
> +	     (notifier__) = (next__), (next__) = __drm_gpusvm_notifier_next(notifier__))
> +
> +/**
> + * drm_gpusvm_notifier_invalidate - Invalidate a GPU SVM notifier.
> + * @mni: Pointer to the mmu_interval_notifier structure.
> + * @mmu_range: Pointer to the mmu_notifier_range structure.
> + * @cur_seq: Current sequence number.
> + *
> + * This function serves as a generic MMU notifier for GPU SVM. It sets the MMU
> + * notifier sequence number and calls the driver invalidate vfunc under
> + * gpusvm->notifier_lock.
> + *
> + * Returns:
> + * true if the operation succeeds, false otherwise.
> + */
> +static bool
> +drm_gpusvm_notifier_invalidate(struct mmu_interval_notifier *mni,
> +			       const struct mmu_notifier_range *mmu_range,
> +			       unsigned long cur_seq)
> +{
> +	struct drm_gpusvm_notifier *notifier =
> +		container_of(mni, typeof(*notifier), notifier);
> +	struct drm_gpusvm *gpusvm = notifier->gpusvm;
> +
> +	if (!mmu_notifier_range_blockable(mmu_range))
> +		return false;
> +
> +	down_write(&gpusvm->notifier_lock);
> +	mmu_interval_set_seq(mni, cur_seq);
> +	gpusvm->ops->invalidate(gpusvm, notifier, mmu_range);
> +	up_write(&gpusvm->notifier_lock);
> +
> +	return true;
> +}
> +
> +/**
> + * drm_gpusvm_notifier_ops - MMU interval notifier operations for GPU SVM
> + */
> +static const struct mmu_interval_notifier_ops drm_gpusvm_notifier_ops = {
> +	.invalidate = drm_gpusvm_notifier_invalidate,
> +};
> +
> +/**
> + * drm_gpusvm_init - Initialize the GPU SVM.
> + * @gpusvm: Pointer to the GPU SVM structure.
> + * @name: Name of the GPU SVM.
> + * @drm: Pointer to the DRM device structure.
> + * @mm: Pointer to the mm_struct for the address space.
> + * @device_private_page_owner: Device private pages owner.
> + * @mm_start: Start address of GPU SVM.
> + * @mm_range: Range of the GPU SVM.
> + * @notifier_size: Size of individual notifiers.
> + * @ops: Pointer to the operations structure for GPU SVM.
> + * @chunk_sizes: Pointer to the array of chunk sizes used in range allocation.
> + *               Entries should be powers of 2 in descending order with last
> + *               entry being SZ_4K.
> + * @num_chunks: Number of chunks.
> + *
> + * This function initializes the GPU SVM.
> + *
> + * Returns:
> + * 0 on success, a negative error code on failure.
> + */
> +int drm_gpusvm_init(struct drm_gpusvm *gpusvm,
> +		    const char *name, struct drm_device *drm,
> +		    struct mm_struct *mm, void *device_private_page_owner,
> +		    u64 mm_start, u64 mm_range, u64 notifier_size,
> +		    const struct drm_gpusvm_ops *ops,
> +		    const u64 *chunk_sizes, int num_chunks)
> +{
> +	if (!ops->invalidate || !num_chunks)
> +		return -EINVAL;
> +
> +	gpusvm->name = name;
> +	gpusvm->drm = drm;
> +	gpusvm->mm = mm;
> +	gpusvm->device_private_page_owner = device_private_page_owner;
> +	gpusvm->mm_start = mm_start;
> +	gpusvm->mm_range = mm_range;
> +	gpusvm->notifier_size = notifier_size;
> +	gpusvm->ops = ops;
> +	gpusvm->chunk_sizes = chunk_sizes;
> +	gpusvm->num_chunks = num_chunks;
> +	gpusvm->zdd_wq = system_wq;
> +
> +	mmgrab(mm);
> +	gpusvm->root = RB_ROOT_CACHED;
> +	INIT_LIST_HEAD(&gpusvm->notifier_list);
> +
> +	init_rwsem(&gpusvm->notifier_lock);
> +
> +	fs_reclaim_acquire(GFP_KERNEL);
> +	might_lock(&gpusvm->notifier_lock);
> +	fs_reclaim_release(GFP_KERNEL);
> +
> +	return 0;
> +}
> +
> +/**
> + * drm_gpusvm_notifier_find - Find GPU SVM notifier
> + * @gpusvm__: Pointer to the GPU SVM structure
> + * @fault_addr__: Fault address
> + *
> + * This macro finds the GPU SVM notifier associated with the fault address.
> + *
> + * Returns:
> + * Pointer to the GPU SVM notifier on success, NULL otherwise.
> + */
> +#define drm_gpusvm_notifier_find(gpusvm__, fault_addr__)	\
> +	notifier_iter_first(&(gpusvm__)->root, (fault_addr__),	\
> +			    (fault_addr__ + 1))
> +
> +/**
> + * to_drm_gpusvm_notifier - retrieve the container struct for a given rbtree node
> + * @node__: a pointer to the rbtree node embedded within a drm_gpusvm_notifier struct
> + *
> + * Return: A pointer to the containing drm_gpusvm_notifier structure.
> + */
> +#define to_drm_gpusvm_notifier(__node)				\
> +	container_of((__node), struct drm_gpusvm_notifier, rb.node)
> +
> +/**
> + * drm_gpusvm_notifier_insert - Insert GPU SVM notifier
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @notifier: Pointer to the GPU SVM notifier structure
> + *
> + * This function inserts the GPU SVM notifier into the GPU SVM RB tree and list.
> + */
> +static void drm_gpusvm_notifier_insert(struct drm_gpusvm *gpusvm,
> +				       struct drm_gpusvm_notifier *notifier)
> +{
> +	struct rb_node *node;
> +	struct list_head *head;
> +
> +	notifier_insert(notifier, &gpusvm->root);
> +
> +	node = rb_prev(&notifier->rb.node);
> +	if (node)
> +		head = &(to_drm_gpusvm_notifier(node))->rb.entry;
> +	else
> +		head = &gpusvm->notifier_list;
> +
> +	list_add(&notifier->rb.entry, head);
> +}
> +
> +/**
> + * drm_gpusvm_notifier_remove - Remove GPU SVM notifier
> + * @gpusvm__: Pointer to the GPU SVM tructure
> + * @notifier__: Pointer to the GPU SVM notifier structure
> + *
> + * This macro removes the GPU SVM notifier from the GPU SVM RB tree and list.
> + */
> +#define drm_gpusvm_notifier_remove(gpusvm__, notifier__)	\
> +	notifier_remove((notifier__), &(gpusvm__)->root);	\
> +	list_del(&(notifier__)->rb.entry)
> +
> +/**
> + * drm_gpusvm_fini - Finalize the GPU SVM.
> + * @gpusvm: Pointer to the GPU SVM structure.
> + *
> + * This function finalizes the GPU SVM by cleaning up any remaining ranges and
> + * notifiers, and dropping a reference to struct MM.
> + */
> +void drm_gpusvm_fini(struct drm_gpusvm *gpusvm)
> +{
> +	struct drm_gpusvm_notifier *notifier, *next;
> +
> +	drm_gpusvm_for_each_notifier_safe(notifier, next, gpusvm, 0, LONG_MAX) {
> +		struct drm_gpusvm_range *range, *__next;
> +
> +		/*
> +		 * Remove notifier first to avoid racing with any invalidation
> +		 */
> +		mmu_interval_notifier_remove(&notifier->notifier);
> +		notifier->flags.removed = true;
> +
> +		drm_gpusvm_for_each_range_safe(range, __next, notifier, 0,
> +					       LONG_MAX)
> +			drm_gpusvm_range_remove(gpusvm, range);
> +	}
> +
> +	mmdrop(gpusvm->mm);
> +	WARN_ON(!RB_EMPTY_ROOT(&gpusvm->root.rb_root));
> +}
> +
> +/**
> + * drm_gpusvm_notifier_alloc - Allocate GPU SVM notifier
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @fault_addr: Fault address
> + *
> + * This function allocates and initializes the GPU SVM notifier structure.
> + *
> + * Returns:
> + * Pointer to the allocated GPU SVM notifier on success, ERR_PTR() on failure.
> + */
> +static struct drm_gpusvm_notifier *
> +drm_gpusvm_notifier_alloc(struct drm_gpusvm *gpusvm, u64 fault_addr)
> +{
> +	struct drm_gpusvm_notifier *notifier;
> +
> +	if (gpusvm->ops->notifier_alloc)
> +		notifier = gpusvm->ops->notifier_alloc();
> +	else
> +		notifier = kzalloc(sizeof(*notifier), GFP_KERNEL);
> +
> +	if (!notifier)
> +		return ERR_PTR(-ENOMEM);
> +
> +	notifier->gpusvm = gpusvm;
> +	notifier->interval.start = ALIGN_DOWN(fault_addr, gpusvm->notifier_size);
> +	notifier->interval.end = ALIGN(fault_addr + 1, gpusvm->notifier_size);
> +	INIT_LIST_HEAD(&notifier->rb.entry);
> +	notifier->root = RB_ROOT_CACHED;
> +	INIT_LIST_HEAD(&notifier->range_list);
> +
> +	return notifier;
> +}
> +
> +/**
> + * drm_gpusvm_notifier_free - Free GPU SVM notifier
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @notifier: Pointer to the GPU SVM notifier structure
> + *
> + * This function frees the GPU SVM notifier structure.
> + */
> +static void drm_gpusvm_notifier_free(struct drm_gpusvm *gpusvm,
> +				     struct drm_gpusvm_notifier *notifier)
> +{
> +	WARN_ON(!RB_EMPTY_ROOT(&notifier->root.rb_root));
> +
> +	if (gpusvm->ops->notifier_free)
> +		gpusvm->ops->notifier_free(notifier);
> +	else
> +		kfree(notifier);
> +}
> +
> +/**
> + * to_drm_gpusvm_range - retrieve the container struct for a given rbtree node
> + * @node__: a pointer to the rbtree node embedded within a drm_gpusvm_range struct
> + *
> + * Return: A pointer to the containing drm_gpusvm_range structure.
> + */
> +#define to_drm_gpusvm_range(node__)	\
> +	container_of((node__), struct drm_gpusvm_range, rb.node)
> +
> +/**
> + * drm_gpusvm_range_insert - Insert GPU SVM range
> + * @notifier: Pointer to the GPU SVM notifier structure
> + * @range: Pointer to the GPU SVM range structure
> + *
> + * This function inserts the GPU SVM range into the notifier RB tree and list.
> + */
> +static void drm_gpusvm_range_insert(struct drm_gpusvm_notifier *notifier,
> +				    struct drm_gpusvm_range *range)
> +{
> +	struct rb_node *node;
> +	struct list_head *head;
> +
> +	drm_gpusvm_notifier_lock(notifier->gpusvm);
> +	range_insert(range, &notifier->root);
> +
> +	node = rb_prev(&range->rb.node);
> +	if (node)
> +		head = &(to_drm_gpusvm_range(node))->rb.entry;
> +	else
> +		head = &notifier->range_list;
> +
> +	list_add(&range->rb.entry, head);
> +	drm_gpusvm_notifier_unlock(notifier->gpusvm);
> +}
> +
> +/**
> + * __drm_gpusvm_range_remove - Remove GPU SVM range
> + * @notifier__: Pointer to the GPU SVM notifier structure
> + * @range__: Pointer to the GPU SVM range structure
> + *
> + * This macro removes the GPU SVM range from the notifier RB tree and list.
> + */
> +#define __drm_gpusvm_range_remove(notifier__, range__)		\
> +	range_remove((range__), &(notifier__)->root);		\
> +	list_del(&(range__)->rb.entry)
> +
> +/**
> + * drm_gpusvm_range_alloc - Allocate GPU SVM range
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @notifier: Pointer to the GPU SVM notifier structure
> + * @fault_addr: Fault address
> + * @chunk_size: Chunk size
> + * @migrate_vram: Flag indicating whether to migrate VRAM
> + *
> + * This function allocates and initializes the GPU SVM range structure.
> + *
> + * Returns:
> + * Pointer to the allocated GPU SVM range on success, ERR_PTR() on failure.
> + */
> +static struct drm_gpusvm_range *
> +drm_gpusvm_range_alloc(struct drm_gpusvm *gpusvm,
> +		       struct drm_gpusvm_notifier *notifier,
> +		       u64 fault_addr, u64 chunk_size, bool migrate_vram)
> +{
> +	struct drm_gpusvm_range *range;
> +
> +	if (gpusvm->ops->range_alloc)
> +		range = gpusvm->ops->range_alloc(gpusvm);
> +	else
> +		range = kzalloc(sizeof(*range), GFP_KERNEL);
> +
> +	if (!range)
> +		return ERR_PTR(-ENOMEM);
> +
> +	kref_init(&range->refcount);
> +	range->gpusvm = gpusvm;
> +	range->notifier = notifier;
> +	range->va.start = ALIGN_DOWN(fault_addr, chunk_size);
> +	range->va.end = ALIGN(fault_addr + 1, chunk_size);
> +	INIT_LIST_HEAD(&range->rb.entry);
> +	range->notifier_seq = LONG_MAX;
> +	range->flags.migrate_vram = migrate_vram ? 1 : 0;
> +
> +	return range;
> +}
> +
> +/**
> + * drm_gpusvm_check_pages - Check pages
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @notifier: Pointer to the GPU SVM notifier structure
> + * @start: Start address
> + * @end: End address
> + *
> + * Check if pages between start and end have been faulted in on the CPU. Use to
> + * prevent migration of pages without CPU backing store.
> + *
> + * Returns:
> + * True if pages have been faulted into CPU, False otherwise
> + */
> +static bool drm_gpusvm_check_pages(struct drm_gpusvm *gpusvm,
> +				   struct drm_gpusvm_notifier *notifier,
> +				   u64 start, u64 end)
> +{
> +	struct hmm_range hmm_range = {
> +		.default_flags = 0,
> +		.notifier = &notifier->notifier,
> +		.start = start,
> +		.end = end,
> +		.dev_private_owner = gpusvm->device_private_page_owner,
> +	};
> +	unsigned long timeout =
> +		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
> +	unsigned long *pfns;
> +	unsigned long npages = npages_in_range(start, end);
> +	int err, i;
> +
> +	mmap_assert_locked(gpusvm->mm);
> +
> +	pfns = kvmalloc_array(npages, sizeof(*pfns), GFP_KERNEL);
> +	if (!pfns)
> +		return false;
> +
> +	hmm_range.notifier_seq = mmu_interval_read_begin(&notifier->notifier);
> +	hmm_range.hmm_pfns = pfns;
> +
> +	while (true) {
> +		err = hmm_range_fault(&hmm_range);
> +		if (err == -EBUSY) {
> +			if (time_after(jiffies, timeout))
> +				break;
> +
> +			hmm_range.notifier_seq = mmu_interval_read_begin(&notifier->notifier);
> +			continue;
> +		}
> +		break;
> +	}
> +	if (err)
> +		goto err_free;
> +
> +	for (i = 0; i < npages; ++i) {
> +		if (!(pfns[i] & HMM_PFN_VALID)) {
> +			err = -EFAULT;
> +			goto err_free;
> +		}
> +	}
> +
> +err_free:
> +	kvfree(pfns);
> +	return err ? false : true;
> +}
> +
> +/**
> + * drm_gpusvm_range_chunk_size - Determine chunk size for GPU SVM range
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @notifier: Pointer to the GPU SVM notifier structure
> + * @vas: Pointer to the virtual memory area structure
> + * @fault_addr: Fault address
> + * @gpuva_start: Start address of GPUVA which mirrors CPU
> + * @gpuva_end: End address of GPUVA which mirrors CPU
> + * @check_pages: Flag indicating whether to check pages
> + *
> + * This function determines the chunk size for the GPU SVM range based on the
> + * fault address, GPU SVM chunk sizes, existing GPU SVM ranges, and the virtual
> + * memory area boundaries.
> + *
> + * Returns:
> + * Chunk size on success, LONG_MAX on failure.
> + */
> +static u64 drm_gpusvm_range_chunk_size(struct drm_gpusvm *gpusvm,
> +				       struct drm_gpusvm_notifier *notifier,
> +				       struct vm_area_struct *vas,
> +				       u64 fault_addr, u64 gpuva_start,
> +				       u64 gpuva_end, bool check_pages)
> +{
> +	u64 start, end;
> +	int i = 0;
> +
> +retry:
> +	for (; i < gpusvm->num_chunks; ++i) {
> +		start = ALIGN_DOWN(fault_addr, gpusvm->chunk_sizes[i]);
> +		end = ALIGN(fault_addr + 1, gpusvm->chunk_sizes[i]);
> +
> +		if (start >= vas->vm_start && end <= vas->vm_end &&
> +		    start >= notifier->interval.start &&
> +		    end <= notifier->interval.end &&
> +		    start >= gpuva_start && end <= gpuva_end)
> +			break;
> +	}
> +
> +	if (i == gpusvm->num_chunks)
> +		return LONG_MAX;
> +
> +	/*
> +	 * If allocation more than page, ensure not to overlap with existing
> +	 * ranges.
> +	 */
> +	if (end - start != SZ_4K) {
> +		struct drm_gpusvm_range *range;
> +
> +		range = drm_gpusvm_range_find(notifier, start, end);
> +		if (range) {
> +			++i;
> +			goto retry;
> +		}
> +
> +		/*
> +		 * XXX: Only create range on pages CPU has faulted in. Without
> +		 * this check, or prefault, on BMG 'xe_exec_system_allocator --r
> +		 * process-many-malloc' fails. In the failure case, each process
> +		 * mallocs 16k but the CPU VMA is ~128k which results in 64k SVM
> +		 * ranges. When migrating the SVM ranges, some processes fail in
> +		 * drm_gpusvm_migrate_to_vram with 'migrate.cpages != npages'
> +		 * and then upon drm_gpusvm_range_get_pages device pages from
> +		 * other processes are collected + faulted in which creates all
> +		 * sorts of problems. Unsure exactly how this happening, also
> +		 * problem goes away if 'xe_exec_system_allocator --r
> +		 * process-many-malloc' mallocs at least 64k at a time.
> +		 */
> +		if (check_pages &&
> +		    !drm_gpusvm_check_pages(gpusvm, notifier, start, end)) {
> +			++i;
> +			goto retry;
> +		}
> +	}
> +
> +	return end - start;
> +}
> +
> +/**
> + * drm_gpusvm_range_find_or_insert - Find or insert GPU SVM range
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @fault_addr: Fault address
> + * @gpuva_start: Start address of GPUVA which mirrors CPU
> + * @gpuva_end: End address of GPUVA which mirrors CPU
> + * @ctx: GPU SVM context
> + *
> + * This function finds or inserts a newly allocated a GPU SVM range based on the
> + * fault address. Caller must hold a lock to protect range lookup and insertion.
> + *
> + * Returns:
> + * Pointer to the GPU SVM range on success, ERR_PTR() on failure.
> + */
> +struct drm_gpusvm_range *
> +drm_gpusvm_range_find_or_insert(struct drm_gpusvm *gpusvm, u64 fault_addr,
> +				u64 gpuva_start, u64 gpuva_end,
> +				const struct drm_gpusvm_ctx *ctx)
> +{
> +	struct drm_gpusvm_notifier *notifier;
> +	struct drm_gpusvm_range *range;
> +	struct mm_struct *mm = gpusvm->mm;
> +	struct vm_area_struct *vas;
> +	bool notifier_alloc = false;
> +	u64 chunk_size;
> +	int err;
> +	bool migrate_vram;
> +
> +	if (fault_addr < gpusvm->mm_start ||
> +	    fault_addr > gpusvm->mm_start + gpusvm->mm_range) {
> +		err = -EINVAL;
> +		goto err_out;
> +	}
> +
> +	if (!ctx->mmap_locked) {
> +		if (!mmget_not_zero(mm)) {
> +			err = -EFAULT;
> +			goto err_out;
> +		}
> +		mmap_write_lock(mm);
> +	}
> +
> +	mmap_assert_write_locked(mm);
> +
> +	notifier = drm_gpusvm_notifier_find(gpusvm, fault_addr);
> +	if (!notifier) {
> +		notifier = drm_gpusvm_notifier_alloc(gpusvm, fault_addr);
> +		if (IS_ERR(notifier)) {
> +			err = PTR_ERR(notifier);
> +			goto err_mmunlock;
> +		}
> +		notifier_alloc = true;
> +		err = mmu_interval_notifier_insert_locked(&notifier->notifier,
> +							  mm, notifier->interval.start,
> +							  notifier->interval.end -
> +							  notifier->interval.start,
> +							  &drm_gpusvm_notifier_ops);
> +		if (err)
> +			goto err_notifier;
> +	}
> +
> +	vas = vma_lookup(mm, fault_addr);
> +	if (!vas) {
> +		err = -ENOENT;
> +		goto err_notifier_remove;
> +	}
> +
> +	if (!ctx->read_only && !(vas->vm_flags & VM_WRITE)) {
> +		err = -EPERM;
> +		goto err_notifier_remove;
> +	}
> +
> +	range = drm_gpusvm_range_find(notifier, fault_addr, fault_addr + 1);
> +	if (range)
> +		goto out_mmunlock;
> +	/*
> +	 * XXX: Short-circuiting migration based on migrate_vma_* current
> +	 * limitations. If/when migrate_vma_* add more support, this logic will
> +	 * have to change.
> +	 */
> +	migrate_vram = ctx->vram_possible &&
> +		vma_is_anonymous(vas) && !is_vm_hugetlb_page(vas);
> +
> +	chunk_size = drm_gpusvm_range_chunk_size(gpusvm, notifier, vas,
> +						 fault_addr, gpuva_start,
> +						 gpuva_end, migrate_vram &&
> +						 !ctx->prefault);
> +	if (chunk_size == LONG_MAX) {
> +		err = -EINVAL;
> +		goto err_notifier_remove;
> +	}
> +
> +	range = drm_gpusvm_range_alloc(gpusvm, notifier, fault_addr, chunk_size,
> +				       migrate_vram);
> +	if (IS_ERR(range)) {
> +		err = PTR_ERR(range);
> +		goto err_notifier_remove;
> +	}
> +
> +	drm_gpusvm_range_insert(notifier, range);
> +	if (notifier_alloc)
> +		drm_gpusvm_notifier_insert(gpusvm, notifier);
> +
> +	if (ctx->prefault) {
> +		struct drm_gpusvm_ctx __ctx = *ctx;
> +
> +		__ctx.mmap_locked = true;
> +		err = drm_gpusvm_range_get_pages(gpusvm, range, &__ctx);
> +		if (err)
> +			goto err_range_remove;
> +	}
> +
> +out_mmunlock:
> +	if (!ctx->mmap_locked) {
> +		mmap_write_unlock(mm);
> +		mmput(mm);
> +	}
> +
> +	return range;
> +
> +err_range_remove:
> +	__drm_gpusvm_range_remove(notifier, range);
> +err_notifier_remove:
> +	if (notifier_alloc)
> +		mmu_interval_notifier_remove(&notifier->notifier);
> +err_notifier:
> +	if (notifier_alloc)
> +		drm_gpusvm_notifier_free(gpusvm, notifier);
> +err_mmunlock:
> +	if (!ctx->mmap_locked) {
> +		mmap_write_unlock(mm);
> +		mmput(mm);
> +	}
> +err_out:
> +	return ERR_PTR(err);
> +}
> +
> +/**
> + * for_each_dma_page - iterate over pages in a DMA regio`n
> + * @i__: the current page index in the iteration
> + * @j__: the current page index, log order, in the iteration
> + * @npages__: the total number of pages in the DMA region
> + * @order__: the order of the pages in the DMA region
> + *
> + * This macro iterates over each page in a DMA region. The DMA region
> + * is assumed to be composed of 2^@order__ pages, and the macro will
> + * step through the region one block of 2^@order__ pages at a time.
> + */
> +#define for_each_dma_page(i__, j__, npages__, order__)	\
> +	for ((i__) = 0, (j__) = 0; (i__) < (npages__);	\
> +	     (j__)++, (i__) += 0x1 << (order__))
> +
> +/**
> + * __drm_gpusvm_range_unmap_pages - Unmap pages associated with a GPU SVM range (internal)
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @range: Pointer to the GPU SVM range structure
> + *
> + * This function unmap pages associated with a GPU SVM range. Assumes and
> + * asserts correct locking is in place when called.
> + */
> +static void __drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
> +					   struct drm_gpusvm_range *range)
> +{
> +	lockdep_assert_held(&gpusvm->notifier_lock);
> +
> +	if (range->pages) {
> +		unsigned long i, j, npages = npages_in_range(range->va.start,
> +							     range->va.end);
> +
> +		if (range->flags.has_dma_mapping) {
> +			for_each_dma_page(i, j, npages, range->order)
> +				dma_unmap_page(gpusvm->drm->dev,
> +					       range->dma_addr[j],
> +					       PAGE_SIZE << range->order,
> +					       DMA_BIDIRECTIONAL);
> +		}
> +
> +		range->flags.has_vram_pages = false;
> +		range->flags.has_dma_mapping = false;
> +	}
> +}
> +
> +/**
> + * drm_gpusvm_range_free_pages - Free pages associated with a GPU SVM range
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @range: Pointer to the GPU SVM range structure
> + *
> + * This function free pages associated with a GPU SVM range.
> + */
> +static void drm_gpusvm_range_free_pages(struct drm_gpusvm *gpusvm,
> +					struct drm_gpusvm_range *range)
> +{
> +	lockdep_assert_held(&gpusvm->notifier_lock);
> +
> +	if (range->pages) {
> +		if (range->flags.kfree_mapping) {
> +			kfree(range->dma_addr);
> +			range->flags.kfree_mapping = false;
> +			range->pages = NULL;
> +		} else {
> +			kvfree(range->pages);
> +			range->pages = NULL;
> +		}
> +	}
> +}
> +
> +/**
> + * drm_gpusvm_range_remove - Remove GPU SVM range
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @range: Pointer to the GPU SVM range to be removed
> + *
> + * This function removes the specified GPU SVM range and also removes the parent
> + * GPU SVM notifier if no more ranges remain in the notifier. The caller must
> + * hold a lock to protect range and notifier removal.
> + */
> +void drm_gpusvm_range_remove(struct drm_gpusvm *gpusvm,
> +			     struct drm_gpusvm_range *range)
> +{
> +	struct drm_gpusvm_notifier *notifier;
> +
> +	notifier = drm_gpusvm_notifier_find(gpusvm, range->va.start);
> +	if (WARN_ON_ONCE(!notifier))
> +		return;
> +
> +	drm_gpusvm_notifier_lock(gpusvm);
> +	__drm_gpusvm_range_unmap_pages(gpusvm, range);
> +	drm_gpusvm_range_free_pages(gpusvm, range);
> +	__drm_gpusvm_range_remove(notifier, range);
> +	drm_gpusvm_notifier_unlock(gpusvm);
> +
> +	drm_gpusvm_range_put(range);
> +
> +	if (RB_EMPTY_ROOT(&notifier->root.rb_root)) {
> +		if (!notifier->flags.removed)
> +			mmu_interval_notifier_remove(&notifier->notifier);
> +		drm_gpusvm_notifier_remove(gpusvm, notifier);
> +		drm_gpusvm_notifier_free(gpusvm, notifier);
> +	}
> +}
> +
> +/**
> + * drm_gpusvm_range_get - Get a reference to GPU SVM range
> + * @range: Pointer to the GPU SVM range
> + *
> + * This function increments the reference count of the specified GPU SVM range.
> + *
> + * Returns:
> + * Pointer to the GPU SVM range.
> + */
> +struct drm_gpusvm_range *
> +drm_gpusvm_range_get(struct drm_gpusvm_range *range)
> +{
> +	kref_get(&range->refcount);
> +
> +	return range;
> +}
> +
> +/**
> + * drm_gpusvm_range_destroy - Destroy GPU SVM range
> + * @refcount: Pointer to the reference counter embedded in the GPU SVM range
> + *
> + * This function destroys the specified GPU SVM range when its reference count
> + * reaches zero. If a custom range-free function is provided, it is invoked to
> + * free the range; otherwise, the range is deallocated using kfree().
> + */
> +static void drm_gpusvm_range_destroy(struct kref *refcount)
> +{
> +	struct drm_gpusvm_range *range =
> +		container_of(refcount, struct drm_gpusvm_range, refcount);
> +	struct drm_gpusvm *gpusvm = range->gpusvm;
> +
> +	if (gpusvm->ops->range_free)
> +		gpusvm->ops->range_free(range);
> +	else
> +		kfree(range);
> +}
> +
> +/**
> + * drm_gpusvm_range_put - Put a reference to GPU SVM range
> + * @range: Pointer to the GPU SVM range
> + *
> + * This function decrements the reference count of the specified GPU SVM range
> + * and frees it when the count reaches zero.
> + */
> +void drm_gpusvm_range_put(struct drm_gpusvm_range *range)
> +{
> +	kref_put(&range->refcount, drm_gpusvm_range_destroy);
> +}
> +
> +/**
> + * drm_gpusvm_range_pages_valid - GPU SVM range pages valid
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @range: Pointer to the GPU SVM range structure
> + *
> + * This function determines if a GPU SVM range pages are valid. Expected be
> + * called holding gpusvm->notifier_lock and as the last step before commiting a
> + * GPU binding.
> + *
> + * Returns:
> + * True if GPU SVM range has valid pages, False otherwise
> + */
> +bool drm_gpusvm_range_pages_valid(struct drm_gpusvm *gpusvm,
> +				  struct drm_gpusvm_range *range)
> +{
> +	lockdep_assert_held(&gpusvm->notifier_lock);
> +
> +	return range->flags.has_vram_pages || range->flags.has_dma_mapping;
> +}
> +
> +/**
> + * drm_gpusvm_range_pages_valid_unlocked - GPU SVM range pages valid unlocked
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @range: Pointer to the GPU SVM range structure
> + *
> + * This function determines if a GPU SVM range pages are valid. Expected be
> + * called without holding gpusvm->notifier_lock.
> + *
> + * Returns:
> + * True if GPU SVM range has valid pages, False otherwise
> + */
> +static bool
> +drm_gpusvm_range_pages_valid_unlocked(struct drm_gpusvm *gpusvm,
> +				      struct drm_gpusvm_range *range)
> +{
> +	bool pages_valid;
> +
> +	if (!range->pages)
> +		return false;
> +
> +	drm_gpusvm_notifier_lock(gpusvm);
> +	pages_valid = drm_gpusvm_range_pages_valid(gpusvm, range);
> +	if (!pages_valid && range->flags.kfree_mapping) {
> +		kfree(range->dma_addr);
> +		range->flags.kfree_mapping = false;
> +		range->pages = NULL;
> +	}
> +	drm_gpusvm_notifier_unlock(gpusvm);
> +
> +	return pages_valid;
> +}
> +
> +/**
> + * drm_gpusvm_range_get_pages - Get pages for a GPU SVM range
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @range: Pointer to the GPU SVM range structure
> + * @ctx: GPU SVM context
> + *
> + * This function gets pages for a GPU SVM range and ensures they are mapped for
> + * DMA access.
> + *
> + * Returns:
> + * 0 on success, negative error code on failure.
> + */
> +int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
> +			       struct drm_gpusvm_range *range,
> +			       const struct drm_gpusvm_ctx *ctx)
> +{
> +	struct mmu_interval_notifier *notifier = &range->notifier->notifier;
> +	struct hmm_range hmm_range = {
> +		.default_flags = HMM_PFN_REQ_FAULT | (ctx->read_only ? 0 :
> +			HMM_PFN_REQ_WRITE),
> +		.notifier = notifier,
> +		.start = range->va.start,
> +		.end = range->va.end,
> +		.dev_private_owner = gpusvm->device_private_page_owner,
> +	};
> +	struct mm_struct *mm = gpusvm->mm;
> +	unsigned long timeout =
> +		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
> +	unsigned long i, j;
> +	unsigned long npages = npages_in_range(range->va.start, range->va.end);
> +	unsigned int order = 0;
> +	unsigned long *pfns;
> +	struct page **pages;
> +	int err = 0;
> +	bool vram_pages = !!range->flags.migrate_vram;
> +	bool alloc_pfns = false, kfree_mapping;
> +
> +retry:
> +	kfree_mapping = false;
> +	hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
> +	if (drm_gpusvm_range_pages_valid_unlocked(gpusvm, range))
> +		return 0;
> +
> +	if (range->notifier_seq == hmm_range.notifier_seq && range->pages) {
> +		if (ctx->prefault)
> +			return 0;
> +
> +		pfns = (unsigned long *)range->pages;
> +		pages = range->pages;
> +		goto map_pages;
> +	}
> +
> +	if (!range->pages) {
> +		pfns = kvmalloc_array(npages, sizeof(*pfns), GFP_KERNEL);
> +		if (!pfns)
> +			return -ENOMEM;
> +		alloc_pfns = true;
> +	} else {
> +		pfns = (unsigned long *)range->pages;
> +	}
> +
> +	if (!ctx->mmap_locked) {
> +		if (!mmget_not_zero(mm)) {
> +			err = -EFAULT;
> +			goto err_out;
> +		}
> +	}
> +
> +	hmm_range.hmm_pfns = pfns;
> +	while (true) {
> +		/* Must be checked after mmu_interval_read_begin */
> +		if (range->flags.unmapped) {
> +			err = -EFAULT;
> +			break;
> +		}
> +
> +		if (!ctx->mmap_locked) {
> +			/*
> +			 * XXX: HMM locking document indicates only a read-lock
> +			 * is required but there apears to be a window between
> +			 * the MMU_NOTIFY_MIGRATE event triggered in a CPU fault
> +			 * via migrate_vma_setup and the pages actually moving
> +			 * in migrate_vma_finalize in which this code can grab
> +			 * garbage pages. Grabbing the write-lock if the range
> +			 * is attached to vram appears to protect against this
> +			 * race.
> +			 */
> +			if (vram_pages)
> +				mmap_write_lock(mm);
> +			else
> +				mmap_read_lock(mm);
> +		}
> +		err = hmm_range_fault(&hmm_range);
> +		if (!ctx->mmap_locked) {
> +			if (vram_pages)
> +				mmap_write_unlock(mm);
> +			else
> +				mmap_read_unlock(mm);
> +		}
> +
> +		if (err == -EBUSY) {
> +			if (time_after(jiffies, timeout))
> +				break;
> +
> +			hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
> +			continue;
> +		}
> +		break;
> +	}
> +	if (!ctx->mmap_locked)
> +		mmput(mm);
> +	if (err)
> +		goto err_free;
> +
> +	pages = (struct page **)pfns;
> +
> +	if (ctx->prefault) {
> +		range->pages = pages;
> +		goto set_seqno;
> +	}
> +
> +map_pages:
> +	if (is_device_private_page(hmm_pfn_to_page(pfns[0]))) {
> +		WARN_ON_ONCE(!range->vram_allocation);
> +
> +		for (i = 0; i < npages; ++i) {
> +			pages[i] = hmm_pfn_to_page(pfns[i]);
> +
> +			if (WARN_ON_ONCE(!is_device_private_page(pages[i]))) {
> +				err = -EOPNOTSUPP;
> +				goto err_free;
> +			}
> +		}

You can't do the above, because the pfn you get from hmm come with zero
guarantees, you neither hold a page reference nor the page lock. The only
thing you can do is grab the pagetable lock (or mmu notifier locks) and
check it's still valid, before you can touch any state. I think the
range->vram_allocation is probably always valid since you clean that up
under the same lock/thread, but there's good chances the vram allocation
is otherwise already gone for good. Or you get an inconsistent snapshot.

> +
> +		/* Do not race with notifier unmapping pages */
> +		drm_gpusvm_notifier_lock(gpusvm);
> +		range->flags.has_vram_pages = true;
> +		range->pages = pages;
> +		if (mmu_interval_read_retry(notifier, hmm_range.notifier_seq)) {
> +			err = -EAGAIN;
> +			__drm_gpusvm_range_unmap_pages(gpusvm, range);
> +		}
> +		drm_gpusvm_notifier_unlock(gpusvm);
> +	} else {
> +		dma_addr_t *dma_addr = (dma_addr_t *)pfns;
> +
> +		for_each_dma_page(i, j, npages, order) {
> +			if (WARN_ON_ONCE(i && order !=
> +					 hmm_pfn_to_map_order(pfns[i]))) {
> +				err = -EOPNOTSUPP;
> +				npages = i;
> +				goto err_unmap;
> +			}
> +			order = hmm_pfn_to_map_order(pfns[i]);
> +
> +			pages[j] = hmm_pfn_to_page(pfns[i]);
> +			if (WARN_ON_ONCE(is_zone_device_page(pages[j]))) {
> +				err = -EOPNOTSUPP;
> +				npages = i;
> +				goto err_unmap;
> +			}
> +
> +			set_page_dirty_lock(pages[j]);
> +			mark_page_accessed(pages[j]);

You can't do these, because you don't hold a page reference. They're also
not needed because hmm_range_fault goes thorugh the full mkwrite dance,
which takes care of these, unlike the gup family of functions.

> +
> +			dma_addr[j] = dma_map_page(gpusvm->drm->dev,
> +						   pages[j], 0,
> +						   PAGE_SIZE << order,
> +						   DMA_BIDIRECTIONAL);
> +			if (dma_mapping_error(gpusvm->drm->dev, dma_addr[j])) {
> +				err = -EFAULT;
> +				npages = i;
> +				goto err_unmap;
> +			}

Aside: dma_map_page is about the only thing that's ok, because it doesn't
do anything harmful and especially doesn't make any assumption about what
that page is.

> +		}
> +
> +		/* Huge pages, reduce memory footprint */
> +		if (order) {
> +			dma_addr = kmalloc_array(j, sizeof(*dma_addr),
> +						 GFP_KERNEL);
> +			if (dma_addr) {
> +				for (i = 0; i < j; ++i)
> +					dma_addr[i] = (dma_addr_t)pfns[i];
> +				kvfree(pfns);
> +				kfree_mapping = true;
> +			} else {
> +				dma_addr = (dma_addr_t *)pfns;
> +			}
> +		}
> +
> +		/* Do not race with notifier unmapping pages */
> +		drm_gpusvm_notifier_lock(gpusvm);
> +		range->order = order;
> +		range->flags.kfree_mapping = kfree_mapping;
> +		range->flags.has_dma_mapping = true;
> +		range->dma_addr = dma_addr;
> +		range->vram_allocation = NULL;
> +		if (mmu_interval_read_retry(notifier, hmm_range.notifier_seq)) {
> +			err = -EAGAIN;
> +			__drm_gpusvm_range_unmap_pages(gpusvm, range);
> +		}
> +		drm_gpusvm_notifier_unlock(gpusvm);
> +	}
> +
> +	if (err == -EAGAIN)
> +		goto retry;
> +set_seqno:
> +	range->notifier_seq = hmm_range.notifier_seq;
> +
> +	return 0;
> +
> +err_unmap:
> +	for_each_dma_page(i, j, npages, order)
> +		dma_unmap_page(gpusvm->drm->dev,
> +			       (dma_addr_t)pfns[j],
> +			       PAGE_SIZE << order, DMA_BIDIRECTIONAL);
> +err_free:
> +	if (alloc_pfns)
> +		kvfree(pfns);
> +err_out:
> +	return err;
> +}
> +
> +/**
> + * drm_gpusvm_range_unmap_pages - Unmap pages associated with a GPU SVM range
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @range: Pointer to the GPU SVM range structure
> + * @ctx: GPU SVM context
> + *
> + * This function unmaps pages associated with a GPU SVM range. If @in_notifier
> + * is set, it is assumed that gpusvm->notifier_lock is held in write mode; if it
> + * is clear, it acquires gpusvm->notifier_lock in read mode. Must be called on
> + * each GPU SVM range attached to notifier in gpusvm->ops->invalidate for IOMMU
> + * security model.
> + */
> +void drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
> +				  struct drm_gpusvm_range *range,
> +				  const struct drm_gpusvm_ctx *ctx)
> +{
> +	if (ctx->in_notifier)
> +		lockdep_assert_held_write(&gpusvm->notifier_lock);
> +	else
> +		drm_gpusvm_notifier_lock(gpusvm);
> +
> +	__drm_gpusvm_range_unmap_pages(gpusvm, range);
> +
> +	if (!ctx->in_notifier)
> +		drm_gpusvm_notifier_unlock(gpusvm);
> +}
> +
> +/**
> + * drm_gpusvm_migration_put_page - Put a migration page
> + * @page: Pointer to the page to put
> + *
> + * This function unlocks and puts a page.
> + */
> +static void drm_gpusvm_migration_put_page(struct page *page)
> +{
> +	unlock_page(page);
> +	put_page(page);
> +}
> +
> +/**
> + * drm_gpusvm_migration_put_pages - Put migration pages
> + * @npages: Number of pages
> + * @migrate_pfn: Array of migrate page frame numbers
> + *
> + * This function puts an array of pages.
> + */
> +static void drm_gpusvm_migration_put_pages(unsigned long npages,
> +					   unsigned long *migrate_pfn)
> +{
> +	unsigned long i;
> +
> +	for (i = 0; i < npages; ++i) {
> +		if (!migrate_pfn[i])
> +			continue;
> +
> +		drm_gpusvm_migration_put_page(migrate_pfn_to_page(migrate_pfn[i]));
> +		migrate_pfn[i] = 0;
> +	}
> +}
> +
> +/**
> + * drm_gpusvm_get_vram_page - Get a reference to a VRAM page
> + * @page: Pointer to the page
> + * @zdd: Pointer to the GPU SVM zone device data
> + *
> + * This function associates the given page with the specified GPU SVM zone
> + * device data and initializes it for zone device usage.
> + */
> +static void drm_gpusvm_get_vram_page(struct page *page,
> +				     struct drm_gpusvm_zdd *zdd)
> +{
> +	page->zone_device_data = drm_gpusvm_zdd_get(zdd);
> +	zone_device_page_init(page);
> +}
> +
> +/**
> + * drm_gpusvm_migrate_map_pages() - Map migration pages for GPU SVM migration
> + * @dev: The device for which the pages are being mapped
> + * @dma_addr: Array to store DMA addresses corresponding to mapped pages
> + * @migrate_pfn: Array of migrate page frame numbers to map
> + * @npages: Number of pages to map
> + * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
> + *
> + * This function maps pages of memory for migration usage in GPU SVM. It
> + * iterates over each page frame number provided in @migrate_pfn, maps the
> + * corresponding page, and stores the DMA address in the provided @dma_addr
> + * array.
> + *
> + * Return: 0 on success, -EFAULT if an error occurs during mapping.
> + */
> +static int drm_gpusvm_migrate_map_pages(struct device *dev,
> +					dma_addr_t *dma_addr,
> +					long unsigned int *migrate_pfn,
> +					unsigned long npages,
> +					enum dma_data_direction dir)
> +{
> +	unsigned long i;
> +
> +	for (i = 0; i < npages; ++i) {
> +		struct page *page = migrate_pfn_to_page(migrate_pfn[i]);
> +
> +		if (!page)
> +			continue;
> +
> +		if (WARN_ON_ONCE(is_zone_device_page(page)))
> +			return -EFAULT;
> +
> +		dma_addr[i] = dma_map_page(dev, page, 0, PAGE_SIZE, dir);
> +		if (dma_mapping_error(dev, dma_addr[i]))
> +			return -EFAULT;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * drm_gpusvm_migrate_unmap_pages() - Unmap pages previously mapped for GPU SVM migration
> + * @dev: The device for which the pages were mapped
> + * @dma_addr: Array of DMA addresses corresponding to mapped pages
> + * @npages: Number of pages to unmap
> + * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
> + *
> + * This function unmaps previously mapped pages of memory for GPU Shared Virtual
> + * Memory (SVM). It iterates over each DMA address provided in @dma_addr, checks
> + * if it's valid and not already unmapped, and unmaps the corresponding page.
> + */
> +static void drm_gpusvm_migrate_unmap_pages(struct device *dev,
> +					   dma_addr_t *dma_addr,
> +					   unsigned long npages,
> +					   enum dma_data_direction dir)
> +{
> +	unsigned long i;
> +
> +	for (i = 0; i < npages; ++i) {
> +		if (!dma_addr[i] || dma_mapping_error(dev, dma_addr[i]))
> +			continue;
> +
> +		dma_unmap_page(dev, dma_addr[i], PAGE_SIZE, dir);
> +	}
> +}
> +
> +/**
> + * drm_gpusvm_migrate_to_vram - Migrate GPU SVM range to VRAM
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @range: Pointer to the GPU SVM range structure
> + *                   failure of this function.
> + * @vram_allocation: Driver-private pointer to the VRAM allocation. The caller
> + *                   should hold a reference to the VRAM allocation, which
> + *                   should be dropped via ops->vram_allocation or upon the
> + *                   failure of this function.
> + * @ctx: GPU SVM context
> + *
> + * This function migrates the specified GPU SVM range to VRAM. It performs the
> + * necessary setup and invokes the driver-specific operations for migration to
> + * VRAM. Upon successful return, @vram_allocation can safely reference @range
> + * until ops->vram_release is called which only upon successful return.
> + *
> + * Returns:
> + * 0 on success, negative error code on failure.
> + */
> +int drm_gpusvm_migrate_to_vram(struct drm_gpusvm *gpusvm,
> +			       struct drm_gpusvm_range *range,
> +			       void *vram_allocation,
> +			       const struct drm_gpusvm_ctx *ctx)
> +{
> +	u64 start = range->va.start, end = range->va.end;
> +	struct migrate_vma migrate = {
> +		.start		= start,
> +		.end		= end,
> +		.pgmap_owner	= gpusvm->device_private_page_owner,
> +		.flags		= MIGRATE_VMA_SELECT_SYSTEM,
> +	};
> +	struct mm_struct *mm = gpusvm->mm;
> +	unsigned long i, npages = npages_in_range(start, end);
> +	struct vm_area_struct *vas;
> +	struct drm_gpusvm_zdd *zdd = NULL;
> +	struct page **pages;
> +	dma_addr_t *dma_addr;
> +	void *buf;
> +	int err;
> +
> +	if (!range->flags.migrate_vram)
> +		return -EINVAL;
> +
> +	if (!gpusvm->ops->populate_vram_pfn || !gpusvm->ops->copy_to_vram ||
> +	    !gpusvm->ops->copy_to_sram)
> +		return -EOPNOTSUPP;
> +
> +	if (!ctx->mmap_locked) {
> +		if (!mmget_not_zero(mm)) {
> +			err = -EFAULT;
> +			goto err_out;
> +		}
> +		mmap_write_lock(mm);
> +	}
> +
> +	mmap_assert_locked(mm);
> +
> +	vas = vma_lookup(mm, start);
> +	if (!vas) {
> +		err = -ENOENT;
> +		goto err_mmunlock;
> +	}
> +
> +	if (end > vas->vm_end || start < vas->vm_start) {
> +		err = -EINVAL;
> +		goto err_mmunlock;
> +	}
> +
> +	if (!vma_is_anonymous(vas)) {
> +		err = -EBUSY;
> +		goto err_mmunlock;
> +	}
> +
> +	buf = kvcalloc(npages, 2 * sizeof(*migrate.src) + sizeof(*dma_addr) +
> +		       sizeof(*pages), GFP_KERNEL);
> +	if (!buf) {
> +		err = -ENOMEM;
> +		goto err_mmunlock;
> +	}
> +	dma_addr = buf + (2 * sizeof(*migrate.src) * npages);
> +	pages = buf + (2 * sizeof(*migrate.src) + sizeof(*dma_addr)) * npages;
> +
> +	zdd = drm_gpusvm_zdd_alloc(range);
> +	if (!zdd) {
> +		err = -ENOMEM;
> +		goto err_free;
> +	}
> +
> +	migrate.vma = vas;
> +	migrate.src = buf;
> +	migrate.dst = migrate.src + npages;
> +
> +	err = migrate_vma_setup(&migrate);
> +	if (err)
> +		goto err_free;
> +
> +	/*
> +	 * FIXME: Below cases, !migrate.cpages and migrate.cpages != npages, not
> +	 * always an error. Need to revisit possible cases and how to handle. We
> +	 * could prefault on migrate.cpages != npages via hmm_range_fault.
> +	 */

Yeah I think especially under contention partial migrations, at least back
to sram due to cpu faults, are pretty much expected. And you need to cope
somehow.

> +
> +	if (!migrate.cpages) {
> +		err = -EFAULT;
> +		goto err_free;
> +	}
> +
> +	if (migrate.cpages != npages) {
> +		err = -EBUSY;
> +		goto err_finalize;
> +	}
> +
> +	err = gpusvm->ops->populate_vram_pfn(gpusvm, vram_allocation, npages,
> +					     migrate.dst);
> +	if (err)
> +		goto err_finalize;
> +
> +	err = drm_gpusvm_migrate_map_pages(gpusvm->drm->dev, dma_addr,
> +					   migrate.src, npages, DMA_TO_DEVICE);
> +	if (err)
> +		goto err_finalize;
> +
> +	for (i = 0; i < npages; ++i) {
> +		struct page *page = pfn_to_page(migrate.dst[i]);
> +
> +		pages[i] = page;
> +		migrate.dst[i] = migrate_pfn(migrate.dst[i]);
> +		drm_gpusvm_get_vram_page(page, zdd);
> +	}
> +
> +	err = gpusvm->ops->copy_to_vram(gpusvm, pages, dma_addr, npages);
> +	if (err)
> +		goto err_finalize;
> +
> +	/* Upon success bind vram allocation to range and zdd */
> +	range->vram_allocation = vram_allocation;
> +	WRITE_ONCE(zdd->vram_allocation, vram_allocation);	/* Owns ref */
> +
> +err_finalize:
> +	if (err)
> +		drm_gpusvm_migration_put_pages(npages, migrate.dst);
> +	migrate_vma_pages(&migrate);
> +	migrate_vma_finalize(&migrate);
> +	drm_gpusvm_migrate_unmap_pages(gpusvm->drm->dev, dma_addr, npages,
> +				       DMA_TO_DEVICE);
> +err_free:
> +	if (zdd)
> +		drm_gpusvm_zdd_put(zdd);
> +	kvfree(buf);
> +err_mmunlock:
> +	if (!ctx->mmap_locked) {
> +		mmap_write_unlock(mm);
> +		mmput(mm);
> +	}
> +err_out:
> +	return err;
> +}
> +
> +/**
> + * drm_gpusvm_migrate_populate_sram_pfn - Populate SRAM PFNs for a VM area
> + * @vas: Pointer to the VM area structure, can be NULL
> + * @npages: Number of pages to populate
> + * @src_mpfn: Source array of migrate PFNs
> + * @mpfn: Array of migrate PFNs to populate
> + * @addr: Start address for PFN allocation
> + *
> + * This function populates the SRAM migrate page frame numbers (PFNs) for the
> + * specified VM area structure. It allocates and locks pages in the VM area for
> + * SRAM usage. If vas is non-NULL use alloc_page_vma for allocation, if NULL use
> + * alloc_page for allocation.
> + *
> + * Returns:
> + * 0 on success, negative error code on failure.
> + */
> +static int drm_gpusvm_migrate_populate_sram_pfn(struct vm_area_struct *vas,
> +						unsigned long npages,
> +						unsigned long *src_mpfn,
> +						unsigned long *mpfn, u64 addr)
> +{
> +	unsigned long i;
> +
> +	for (i = 0; i < npages; ++i, addr += PAGE_SIZE) {
> +		struct page *page;
> +
> +		if (!(src_mpfn[i] & MIGRATE_PFN_MIGRATE))
> +			continue;
> +
> +		if (vas)
> +			page = alloc_page_vma(GFP_HIGHUSER, vas, addr);
> +		else
> +			page = alloc_page(GFP_HIGHUSER);
> +
> +		if (!page)
> +			return -ENOMEM;
> +
> +		lock_page(page);
> +		mpfn[i] = migrate_pfn(page_to_pfn(page));
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * drm_gpusvm_evict_to_sram - Evict GPU SVM range to SRAM
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @range: Pointer to the GPU SVM range structure
> + *
> + * Similar to __drm_gpusvm_migrate_to_sram but does not require mmap lock and
> + * migration done via migrate_device_* functions. Fallback path as it is
> + * preferred to issue migrations with mmap lock.
> + *
> + * Returns:
> + * 0 on success, negative error code on failure.
> + */
> +static int drm_gpusvm_evict_to_sram(struct drm_gpusvm *gpusvm,
> +				    struct drm_gpusvm_range *range)
> +{
> +	unsigned long npages;
> +	struct page **pages;
> +	unsigned long *src, *dst;
> +	dma_addr_t *dma_addr;
> +	void *buf;
> +	int i, err = 0;
> +
> +	npages = npages_in_range(range->va.start, range->va.end);
> +
> +	buf = kvcalloc(npages, 2 * sizeof(*src) + sizeof(*dma_addr) +
> +		       sizeof(*pages), GFP_KERNEL);
> +	if (!buf) {
> +		err = -ENOMEM;
> +		goto err_out;
> +	}
> +	src = buf;
> +	dst = buf + (sizeof(*src) * npages);
> +	dma_addr = buf + (2 * sizeof(*src) * npages);
> +	pages = buf + (2 * sizeof(*src) + sizeof(*dma_addr)) * npages;
> +
> +	err = gpusvm->ops->populate_vram_pfn(gpusvm, range->vram_allocation,
> +					     npages, src);
> +	if (err)
> +		goto err_free;
> +
> +	err = migrate_device_vma_range(gpusvm->mm,
> +				       gpusvm->device_private_page_owner, src,
> +				       npages, range->va.start);
> +	if (err)
> +		goto err_free;
> +
> +	err = drm_gpusvm_migrate_populate_sram_pfn(NULL, npages, src, dst, 0);
> +	if (err)
> +		goto err_finalize;
> +
> +	err = drm_gpusvm_migrate_map_pages(gpusvm->drm->dev, dma_addr,
> +					   dst, npages, DMA_BIDIRECTIONAL);
> +	if (err)
> +		goto err_finalize;
> +
> +	for (i = 0; i < npages; ++i)
> +		pages[i] = migrate_pfn_to_page(src[i]);
> +
> +	err = gpusvm->ops->copy_to_sram(gpusvm, pages, dma_addr, npages);
> +	if (err)
> +		goto err_finalize;
> +
> +err_finalize:
> +	if (err)
> +		drm_gpusvm_migration_put_pages(npages, dst);
> +	migrate_device_pages(src, dst, npages);
> +	migrate_device_finalize(src, dst, npages);
> +	drm_gpusvm_migrate_unmap_pages(gpusvm->drm->dev, dma_addr, npages,
> +				       DMA_BIDIRECTIONAL);
> +err_free:
> +	kvfree(buf);
> +err_out:
> +
> +	return err;
> +}
> +
> +/**
> + * __drm_gpusvm_migrate_to_sram - Migrate GPU SVM range to SRAM (internal)
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @vas: Pointer to the VM area structure
> + * @page: Pointer to the page for fault handling (can be NULL)
> + * @start: Start address of the migration range
> + * @end: End address of the migration range
> + *
> + * This internal function performs the migration of the specified GPU SVM range
> + * to SRAM. It sets up the migration, populates + dma maps SRAM PFNs, and
> + * invokes the driver-specific operations for migration to SRAM.
> + *
> + * Returns:
> + * 0 on success, negative error code on failure.
> + */
> +static int __drm_gpusvm_migrate_to_sram(struct drm_gpusvm *gpusvm,
> +					struct vm_area_struct *vas,
> +					struct page *page,
> +					u64 start, u64 end)
> +{
> +	struct migrate_vma migrate = {
> +		.vma		= vas,
> +		.pgmap_owner	= gpusvm->device_private_page_owner,
> +		.flags		= MIGRATE_VMA_SELECT_DEVICE_PRIVATE,
> +		.fault_page	= page,
> +	};
> +	unsigned long npages;
> +	struct page **pages;
> +	dma_addr_t *dma_addr;
> +	void *buf;
> +	int i, err = 0;
> +
> +	mmap_assert_locked(gpusvm->mm);

That's the wrong mm, at least for the ->migrate_to_ram path. You might be
called on a anon mapping from a child process. That also means that the
vma you're looking at might have no relationship with anythign you're
tracking in your gpusvm.

> +
> +	/* Corner where VMA area struct has been partially unmapped */
> +	if (start < vas->vm_start)
> +		start = vas->vm_start;
> +	if (end > vas->vm_end)
> +		end = vas->vm_end;
> +
> +	migrate.start = start;
> +	migrate.end = end;
> +	npages = npages_in_range(start, end);
> +
> +	buf = kvcalloc(npages, 2 * sizeof(*migrate.src) + sizeof(*dma_addr) +
> +		       sizeof(*pages), GFP_KERNEL);
> +	if (!buf) {
> +		err = -ENOMEM;
> +		goto err_out;
> +	}
> +	dma_addr = buf + (2 * sizeof(*migrate.src) * npages);
> +	pages = buf + (2 * sizeof(*migrate.src) + sizeof(*dma_addr)) * npages;
> +
> +	migrate.vma = vas;
> +	migrate.src = buf;
> +	migrate.dst = migrate.src + npages;
> +
> +	err = migrate_vma_setup(&migrate);
> +	if (err)
> +		goto err_free;
> +
> +	/* Raced with another CPU fault, nothing to do */
> +	if (!migrate.cpages)
> +		goto err_free;
> +
> +	err = drm_gpusvm_migrate_populate_sram_pfn(vas, npages,
> +						   migrate.src, migrate.dst,
> +						   start);
> +	if (err)
> +		goto err_finalize;
> +
> +	err = drm_gpusvm_migrate_map_pages(gpusvm->drm->dev, dma_addr,
> +					   migrate.dst, npages,
> +					   DMA_BIDIRECTIONAL);
> +	if (err)
> +		goto err_finalize;
> +
> +	for (i = 0; i < npages; ++i)
> +		pages[i] = migrate_pfn_to_page(migrate.src[i]);
> +
> +	err = gpusvm->ops->copy_to_sram(gpusvm, pages, dma_addr, npages);
> +	if (err)
> +		goto err_finalize;
> +
> +err_finalize:
> +	if (err)
> +		drm_gpusvm_migration_put_pages(npages, migrate.dst);
> +	migrate_vma_pages(&migrate);
> +	migrate_vma_finalize(&migrate);
> +	drm_gpusvm_migrate_unmap_pages(gpusvm->drm->dev, dma_addr, npages,
> +				       DMA_BIDIRECTIONAL);
> +err_free:
> +	kvfree(buf);
> +err_out:
> +	mmap_assert_locked(gpusvm->mm);
> +
> +	return err;
> +}
> +
> +/**
> + * drm_gpusvm_migrate_to_sram - Migrate (evict) GPU SVM range to SRAM
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @range: Pointer to the GPU SVM range structure
> + * @ctx: GPU SVM context
> + *
> + * This function initiates the migration of the specified GPU SVM range to
> + * SRAM. It performs necessary checks and invokes the internal migration
> + * function for actual migration.
> + *
> + * Returns:
> + * 0 on success, negative error code on failure.
> + */
> +int drm_gpusvm_migrate_to_sram(struct drm_gpusvm *gpusvm,
> +			       struct drm_gpusvm_range *range,
> +			       const struct drm_gpusvm_ctx *ctx)
> +{
> +	u64 start = range->va.start, end = range->va.end;
> +	struct mm_struct *mm = gpusvm->mm;
> +	struct vm_area_struct *vas;
> +	int err;
> +	bool retry = false;
> +
> +	if (!ctx->mmap_locked) {
> +		if (!mmget_not_zero(mm)) {
> +			err = -EFAULT;
> +			goto err_out;
> +		}
> +		if (ctx->trylock_mmap) {
> +			if (!mmap_read_trylock(mm))  {
> +				err = drm_gpusvm_evict_to_sram(gpusvm, range);
> +				goto err_mmput;
> +			}
> +		} else {
> +			mmap_read_lock(mm);
> +		}
> +	}
> +
> +	mmap_assert_locked(mm);
> +
> +	/*
> +	 * Loop required to find all VMA area structs for the corner case when
> +	 * VRAM backing has been partially unmapped from MM's address space.
> +	 */
> +again:
> +	vas = find_vma(mm, start);
> +	if (!vas) {
> +		if (!retry)
> +			err = -ENOENT;
> +		goto err_mmunlock;
> +	}
> +
> +	if (end <= vas->vm_start || start >= vas->vm_end) {
> +		if (!retry)
> +			err = -EINVAL;
> +		goto err_mmunlock;
> +	}
> +
> +	err = __drm_gpusvm_migrate_to_sram(gpusvm, vas, NULL, start, end);
> +	if (err)
> +		goto err_mmunlock;
> +
> +	if (vas->vm_end < end) {
> +		retry = true;
> +		start = vas->vm_end;
> +		goto again;
> +	}
> +
> +	if (!ctx->mmap_locked) {
> +		mmap_read_unlock(mm);
> +		/*
> +		 * Using mmput_async as this function can be called while
> +		 * holding a dma-resv lock, and a final put can grab the mmap
> +		 * lock, causing a lock inversion.
> +		 */
> +		mmput_async(mm);
> +	}
> +
> +	return 0;
> +
> +err_mmunlock:
> +	if (!ctx->mmap_locked)
> +		mmap_read_unlock(mm);
> +err_mmput:
> +	if (!ctx->mmap_locked)
> +		mmput_async(mm);
> +err_out:
> +	return err;
> +}
> +
> +/**
> + * drm_gpusvm_page_free - Put GPU SVM zone device data associated with a page
> + * @page: Pointer to the page
> + *
> + * This function is a callback used to put the GPU SVM zone device data
> + * associated with a page when it is being released.
> + */
> +static void drm_gpusvm_page_free(struct page *page)
> +{
> +	drm_gpusvm_zdd_put(page->zone_device_data);
> +}
> +
> +/**
> + * drm_gpusvm_migrate_to_ram - Migrate GPU SVM range to RAM (page fault handler)
> + * @vmf: Pointer to the fault information structure
> + *
> + * This function is a page fault handler used to migrate a GPU SVM range to RAM.
> + * It retrieves the GPU SVM range information from the faulting page and invokes
> + * the internal migration function to migrate the range back to RAM.
> + *
> + * Returns:
> + * VM_FAULT_SIGBUS on failure, 0 on success.
> + */
> +static vm_fault_t drm_gpusvm_migrate_to_ram(struct vm_fault *vmf)
> +{
> +	struct drm_gpusvm_zdd *zdd = vmf->page->zone_device_data;
> +	int err;
> +
> +	err = __drm_gpusvm_migrate_to_sram(zdd->range->gpusvm,

So I think zdd->range doesn't work, because even within a single mm the
vma mapping a given piece of anon memory does not need to be unique, you
can duplicate them with mremap.

So all you have here is the physical memory and the vma, which might or
might not be from the same process as gpusvm->mm.

Also the child process scenario means you using mmap_write on the fault
side doesn't stop all cpu faults migrating stuff back.

Somewhat aside, but I think that means amdkfd's svm_range->migration_mutex
is busted, because it's va based and so misses concurrently ongoing
different mappings moving physical storage around underneath.


Cheers, Sima

> +					   vmf->vma, vmf->page,
> +					   zdd->range->va.start,
> +					   zdd->range->va.end);
> +
> +	return err ? VM_FAULT_SIGBUS : 0;
> +}
> +
> +/**
> + * drm_gpusvm_pagemap_ops - Device page map operations for GPU SVM
> + */
> +static const struct dev_pagemap_ops drm_gpusvm_pagemap_ops = {
> +	.page_free = drm_gpusvm_page_free,
> +	.migrate_to_ram = drm_gpusvm_migrate_to_ram,
> +};
> +
> +/**
> + * drm_gpusvm_pagemap_ops_get - Retrieve GPU SVM device page map operations
> + *
> + * Returns:
> + * Pointer to the GPU SVM device page map operations structure.
> + */
> +const struct dev_pagemap_ops *drm_gpusvm_pagemap_ops_get(void)
> +{
> +	return &drm_gpusvm_pagemap_ops;
> +}
> +
> +/**
> + * drm_gpusvm_has_mapping - Check if GPU SVM has mapping for the given address range
> + * @gpusvm: Pointer to the GPU SVM structure.
> + * @start: Start address
> + * @end: End address
> + *
> + * Returns:
> + * True if GPU SVM has mapping, False otherwise
> + */
> +bool drm_gpusvm_has_mapping(struct drm_gpusvm *gpusvm, u64 start, u64 end)
> +{
> +	struct drm_gpusvm_notifier *notifier;
> +
> +	drm_gpusvm_for_each_notifier(notifier, gpusvm, start, end) {
> +		struct drm_gpusvm_range *range = NULL;
> +
> +		drm_gpusvm_for_each_range(range, notifier, start, end)
> +			return true;
> +	}
> +
> +	return false;
> +}
> diff --git a/drivers/gpu/drm/xe/drm_gpusvm.h b/drivers/gpu/drm/xe/drm_gpusvm.h
> new file mode 100644
> index 000000000000..0ea70f8534a8
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/drm_gpusvm.h
> @@ -0,0 +1,415 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#ifndef __DRM_GPUSVM_H__
> +#define __DRM_GPUSVM_H__
> +
> +#include <linux/kref.h>
> +#include <linux/mmu_notifier.h>
> +#include <linux/workqueue.h>
> +
> +struct dev_pagemap_ops;
> +struct drm_device;
> +struct drm_gpusvm;
> +struct drm_gpusvm_notifier;
> +struct drm_gpusvm_ops;
> +struct drm_gpusvm_range;
> +
> +/**
> + * struct drm_gpusvm_ops - Operations structure for GPU SVM
> + *
> + * This structure defines the operations for GPU Shared Virtual Memory (SVM).
> + * These operations are provided by the GPU driver to manage SVM ranges and
> + * perform operations such as migration between VRAM and system RAM.
> + */
> +struct drm_gpusvm_ops {
> +	/**
> +	 * @notifier_alloc: Allocate a GPU SVM notifier (optional)
> +	 *
> +	 * This function shall allocate a GPU SVM notifier.
> +	 *
> +	 * Returns:
> +	 * Pointer to the allocated GPU SVM notifier on success, NULL on failure.
> +	 */
> +	struct drm_gpusvm_notifier *(*notifier_alloc)(void);
> +
> +	/**
> +	 * @notifier_free: Free a GPU SVM notifier (optional)
> +	 * @notifier: Pointer to the GPU SVM notifier to be freed
> +	 *
> +	 * This function shall free a GPU SVM notifier.
> +	 */
> +	void (*notifier_free)(struct drm_gpusvm_notifier *notifier);
> +
> +	/**
> +	 * @range_alloc: Allocate a GPU SVM range (optional)
> +	 * @gpusvm: Pointer to the GPU SVM
> +	 *
> +	 * This function shall allocate a GPU SVM range.
> +	 *
> +	 * Returns:
> +	 * Pointer to the allocated GPU SVM range on success, NULL on failure.
> +	 */
> +	struct drm_gpusvm_range *(*range_alloc)(struct drm_gpusvm *gpusvm);
> +
> +	/**
> +	 * @range_free: Free a GPU SVM range (optional)
> +	 * @range: Pointer to the GPU SVM range to be freed
> +	 *
> +	 * This function shall free a GPU SVM range.
> +	 */
> +	void (*range_free)(struct drm_gpusvm_range *range);
> +
> +	/**
> +	 * @vram_release: Release VRAM allocation (optional)
> +	 * @vram_allocation: Driver-private pointer to the VRAM allocation
> +	 *
> +	 * This function shall release VRAM allocation and expects to drop a
> +	 * reference to VRAM allocation.
> +	 */
> +	void (*vram_release)(void *vram_allocation);
> +
> +	/**
> +	 * @populate_vram_pfn: Populate VRAM PFN (required for migration)
> +	 * @gpusvm: Pointer to the GPU SVM
> +	 * @vram_allocation: Driver-private pointer to the VRAM allocation
> +	 * @npages: Number of pages to populate
> +	 * @pfn: Array of page frame numbers to populate
> +	 *
> +	 * This function shall populate VRAM page frame numbers (PFN).
> +	 *
> +	 * Returns:
> +	 * 0 on success, a negative error code on failure.
> +	 */
> +	int (*populate_vram_pfn)(struct drm_gpusvm *gpusvm,
> +				 void *vram_allocation,
> +				 unsigned long npages,
> +				 unsigned long *pfn);
> +
> +	/**
> +	 * @copy_to_vram: Copy to VRAM (required for migration)
> +	 * @gpusvm: Pointer to the GPU SVM
> +	 * @pages: Pointer to array of VRAM pages (destination)
> +	 * @dma_addr: Pointer to array of DMA addresses (source)
> +	 * @npages: Number of pages to copy
> +	 *
> +	 * This function shall copy pages to VRAM.
> +	 *
> +	 * Returns:
> +	 * 0 on success, a negative error code on failure.
> +	 */
> +	int (*copy_to_vram)(struct drm_gpusvm *gpusvm,
> +			    struct page **pages,
> +			    dma_addr_t *dma_addr,
> +			    unsigned long npages);
> +
> +	/**
> +	 * @copy_to_sram: Copy to system RAM (required for migration)
> +	 * @gpusvm: Pointer to the GPU SVM
> +	 * @pages: Pointer to array of VRAM pages (source)
> +	 * @dma_addr: Pointer to array of DMA addresses (destination)
> +	 * @npages: Number of pages to copy
> +	 *
> +	 * This function shall copy pages to system RAM.
> +	 *
> +	 * Returns:
> +	 * 0 on success, a negative error code on failure.
> +	 */
> +	int (*copy_to_sram)(struct drm_gpusvm *gpusvm,
> +			    struct page **pages,
> +			    dma_addr_t *dma_addr,
> +			    unsigned long npages);
> +
> +	/**
> +	 * @invalidate: Invalidate GPU SVM notifier (required)
> +	 * @gpusvm: Pointer to the GPU SVM
> +	 * @notifier: Pointer to the GPU SVM notifier
> +	 * @mmu_range: Pointer to the mmu_notifier_range structure
> +	 *
> +	 * This function shall invalidate the GPU page tables. It can safely
> +	 * walk the notifier range RB tree/list in this function. Called while
> +	 * holding the notifier lock.
> +	 */
> +	void (*invalidate)(struct drm_gpusvm *gpusvm,
> +			   struct drm_gpusvm_notifier *notifier,
> +			   const struct mmu_notifier_range *mmu_range);
> +};
> +
> +/**
> + * struct drm_gpusvm_notifier - Structure representing a GPU SVM notifier
> + *
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @notifier: MMU interval notifier
> + * @interval: Interval for the notifier
> + * @rb: Red-black tree node for the parent GPU SVM structure notifier tree
> + * @root: Cached root node of the RB tree containing ranges
> + * @range_list: List head containing of ranges in the same order they appear in
> + *              interval tree. This is useful to keep iterating ranges while
> + *              doing modifications to RB tree.
> + * @flags.removed: Flag indicating whether the MMU interval notifier has been
> + *                 removed
> + *
> + * This structure represents a GPU SVM notifier.
> + */
> +struct drm_gpusvm_notifier {
> +	struct drm_gpusvm *gpusvm;
> +	struct mmu_interval_notifier notifier;
> +	struct {
> +		u64 start;
> +		u64 end;
> +	} interval;
> +	struct {
> +		struct rb_node node;
> +		struct list_head entry;
> +		u64 __subtree_last;
> +	} rb;
> +	struct rb_root_cached root;
> +	struct list_head range_list;
> +	struct {
> +		u32 removed : 1;
> +	} flags;
> +};
> +
> +/**
> + * struct drm_gpusvm_range - Structure representing a GPU SVM range
> + *
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @notifier: Pointer to the GPU SVM notifier
> + * @refcount: Reference count for the range
> + * @rb: Red-black tree node for the parent GPU SVM notifier structure range tree
> + * @va: Virtual address range
> + * @notifier_seq: Notifier sequence number of the range's pages
> + * @pages: Pointer to the array of pages (if backing store is in VRAM)
> + * @dma_addr: DMA address array (if backing store is SRAM and DMA mapped)
> + * @vram_allocation: Driver-private pointer to the VRAM allocation
> + * @order: Order of dma mapping. i.e. PAGE_SIZE << order is mapping size
> + * @flags.migrate_vram: Flag indicating whether the range can be migrated to VRAM
> + * @flags.unmapped: Flag indicating if the range has been unmapped
> + * @flags.partial_unmap: Flag indicating if the range has been partially unmapped
> + * @flags.has_vram_pages: Flag indicating if the range has vram pages
> + * @flags.has_dma_mapping: Flag indicating if the range has a DMA mapping
> + * @flags.kfree_mapping: Flag indicating @dma_addr is a compact allocation based
> + *                       on @order which releases via kfree
> + *
> + * This structure represents a GPU SVM range used for tracking memory ranges
> + * mapped in a DRM device.
> + */
> +struct drm_gpusvm_range {
> +	struct drm_gpusvm *gpusvm;
> +	struct drm_gpusvm_notifier *notifier;
> +	struct kref refcount;
> +	struct {
> +		struct rb_node node;
> +		struct list_head entry;
> +		u64 __subtree_last;
> +	} rb;
> +	struct {
> +		u64 start;
> +		u64 end;
> +	} va;
> +	unsigned long notifier_seq;
> +	union {
> +		struct page **pages;
> +		dma_addr_t *dma_addr;
> +	};
> +	void *vram_allocation;
> +	u16 order;
> +	struct {
> +		/* All flags below must be set upon creation */
> +		u16 migrate_vram : 1;
> +		/* All flags below must be set / cleared under notifier lock */
> +		u16 unmapped : 1;
> +		u16 partial_unmap : 1;
> +		u16 has_vram_pages : 1;
> +		u16 has_dma_mapping : 1;
> +		u16 kfree_mapping : 1;
> +	} flags;
> +};
> +
> +/**
> + * struct drm_gpusvm - GPU SVM structure
> + *
> + * @name: Name of the GPU SVM
> + * @drm: Pointer to the DRM device structure
> + * @mm: Pointer to the mm_struct for the address space
> + * @device_private_page_owner: Device private pages owner
> + * @mm_start: Start address of GPU SVM
> + * @mm_range: Range of the GPU SVM
> + * @notifier_size: Size of individual notifiers
> + * @ops: Pointer to the operations structure for GPU SVM
> + * @chunk_sizes: Pointer to the array of chunk sizes used in range allocation.
> + *               Entries should be powers of 2 in descending order.
> + * @num_chunks: Number of chunks
> + * @notifier_lock: Read-write semaphore for protecting notifier operations
> + * @zdd_wq: Workqueue for deferred work on zdd destruction
> + * @root: Cached root node of the Red-Black tree containing GPU SVM notifiers
> + * @notifier_list: list head containing of notifiers in the same order they
> + *                 appear in interval tree. This is useful to keep iterating
> + *                 notifiers while doing modifications to RB tree.
> + *
> + * This structure represents a GPU SVM (Shared Virtual Memory) used for tracking
> + * memory ranges mapped in a DRM (Direct Rendering Manager) device.
> + *
> + * No reference counting is provided, as this is expected to be embedded in the
> + * driver VM structure along with the struct drm_gpuvm, which handles reference
> + * counting.
> + */
> +struct drm_gpusvm {
> +	const char *name;
> +	struct drm_device *drm;
> +	struct mm_struct *mm;
> +	void *device_private_page_owner;
> +	u64 mm_start;
> +	u64 mm_range;
> +	u64 notifier_size;
> +	const struct drm_gpusvm_ops *ops;
> +	const u64 *chunk_sizes;
> +	int num_chunks;
> +	struct rw_semaphore notifier_lock;
> +	struct workqueue_struct *zdd_wq;
> +	struct rb_root_cached root;
> +	struct list_head notifier_list;
> +};
> +
> +/**
> + * struct drm_gpusvm_ctx - DRM GPU SVM context
> + *
> + * @mmap_locked: mmap lock is locked
> + * @trylock_mmap: trylock mmap lock, used to avoid locking inversions
> + *                (e.g.dma-revs -> mmap lock)
> + * @in_notifier: entering from a MMU notifier
> + * @read_only: operating on read-only memory
> + * @vram_possible: possible to use VRAM
> + * @prefault: prefault pages
> + *
> + * Context that is DRM GPUSVM is operating in (i.e. user arguments).
> + */
> +struct drm_gpusvm_ctx {
> +	u32 mmap_locked :1;
> +	u32 trylock_mmap :1;
> +	u32 in_notifier :1;
> +	u32 read_only :1;
> +	u32 vram_possible :1;
> +	u32 prefault :1;
> +};
> +
> +int drm_gpusvm_init(struct drm_gpusvm *gpusvm,
> +		    const char *name, struct drm_device *drm,
> +		    struct mm_struct *mm, void *device_private_page_owner,
> +		    u64 mm_start, u64 mm_range, u64 notifier_size,
> +		    const struct drm_gpusvm_ops *ops,
> +		    const u64 *chunk_sizes, int num_chunks);
> +void drm_gpusvm_fini(struct drm_gpusvm *gpusvm);
> +void drm_gpusvm_free(struct drm_gpusvm *gpusvm);
> +
> +struct drm_gpusvm_range *
> +drm_gpusvm_range_find_or_insert(struct drm_gpusvm *gpusvm, u64 fault_addr,
> +				u64 gpuva_start, u64 gpuva_end,
> +				const struct drm_gpusvm_ctx *ctx);
> +void drm_gpusvm_range_remove(struct drm_gpusvm *gpusvm,
> +			     struct drm_gpusvm_range *range);
> +
> +struct drm_gpusvm_range *
> +drm_gpusvm_range_get(struct drm_gpusvm_range *range);
> +void drm_gpusvm_range_put(struct drm_gpusvm_range *range);
> +
> +bool drm_gpusvm_range_pages_valid(struct drm_gpusvm *gpusvm,
> +				  struct drm_gpusvm_range *range);
> +
> +int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
> +			       struct drm_gpusvm_range *range,
> +			       const struct drm_gpusvm_ctx *ctx);
> +void drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
> +				  struct drm_gpusvm_range *range,
> +				  const struct drm_gpusvm_ctx *ctx);
> +
> +int drm_gpusvm_migrate_to_vram(struct drm_gpusvm *gpusvm,
> +			       struct drm_gpusvm_range *range,
> +			       void *vram_allocation,
> +			       const struct drm_gpusvm_ctx *ctx);
> +int drm_gpusvm_migrate_to_sram(struct drm_gpusvm *gpusvm,
> +			       struct drm_gpusvm_range *range,
> +			       const struct drm_gpusvm_ctx *ctx);
> +
> +const struct dev_pagemap_ops *drm_gpusvm_pagemap_ops_get(void);
> +
> +bool drm_gpusvm_has_mapping(struct drm_gpusvm *gpusvm, u64 start, u64 end);
> +
> +struct drm_gpusvm_range *
> +drm_gpusvm_range_find(struct drm_gpusvm_notifier *notifier, u64 start, u64 end);
> +
> +/**
> + * drm_gpusvm_notifier_lock - Lock GPU SVM notifier
> + * @gpusvm__: Pointer to the GPU SVM structure.
> + *
> + * Abstract client usage GPU SVM notifier lock, take lock
> + */
> +#define drm_gpusvm_notifier_lock(gpusvm__)	\
> +	down_read(&(gpusvm__)->notifier_lock)
> +
> +/**
> + * drm_gpusvm_notifier_unlock - Unlock GPU SVM notifier
> + * @gpusvm__: Pointer to the GPU SVM structure.
> + *
> + * Abstract client usage GPU SVM notifier lock, drop lock
> + */
> +#define drm_gpusvm_notifier_unlock(gpusvm__)	\
> +	up_read(&(gpusvm__)->notifier_lock)
> +
> +/**
> + * __drm_gpusvm_range_next - Get the next GPU SVM range in the list
> + * @range: a pointer to the current GPU SVM range
> + *
> + * Return: A pointer to the next drm_gpusvm_range if available, or NULL if the
> + *         current range is the last one or if the input range is NULL.
> + */
> +static inline struct drm_gpusvm_range *
> +__drm_gpusvm_range_next(struct drm_gpusvm_range *range)
> +{
> +	if (range && !list_is_last(&range->rb.entry,
> +				   &range->notifier->range_list))
> +		return list_next_entry(range, rb.entry);
> +
> +	return NULL;
> +}
> +
> +/**
> + * drm_gpusvm_for_each_range - Iterate over GPU SVM ranges in a notifier
> + * @range__: Iterator variable for the ranges. If set, it indicates the start of
> + *	     the iterator. If NULL, call drm_gpusvm_range_find() to get the range.
> + * @notifier__: Pointer to the GPU SVM notifier
> + * @start__: Start address of the range
> + * @end__: End address of the range
> + *
> + * This macro is used to iterate over GPU SVM ranges in a notifier. It is safe
> + * to use while holding the driver SVM lock or the notifier lock.
> + */
> +#define drm_gpusvm_for_each_range(range__, notifier__, start__, end__)	\
> +	for ((range__) = (range__) ?:					\
> +	     drm_gpusvm_range_find((notifier__), (start__), (end__));	\
> +	     (range__) && (range__->va.start < (end__));		\
> +	     (range__) = __drm_gpusvm_range_next(range__))
> +
> +/**
> + * drm_gpusvm_range_set_unmapped - Mark a GPU SVM range as unmapped
> + * @range: Pointer to the GPU SVM range structure.
> + * @mmu_range: Pointer to the MMU notifier range structure.
> + *
> + * This function marks a GPU SVM range as unmapped and sets the partial_unmap flag
> + * if the range partially falls within the provided MMU notifier range.
> + */
> +static inline void
> +drm_gpusvm_range_set_unmapped(struct drm_gpusvm_range *range,
> +			      const struct mmu_notifier_range *mmu_range)
> +{
> +	lockdep_assert_held_write(&range->gpusvm->notifier_lock);
> +
> +	range->flags.unmapped = true;
> +	if (range->va.start < mmu_range->start ||
> +	    range->va.end > mmu_range->end)
> +		range->flags.partial_unmap = true;
> +}
> +
> +#endif /* __DRM_GPUSVM_H__ */
> -- 
> 2.34.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
