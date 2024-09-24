Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 794F59841D0
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 11:16:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78F9A10E29D;
	Tue, 24 Sep 2024 09:16:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="DEl6dtrr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5390C10E29D
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 09:16:06 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-a8d6ac24a3bso200441366b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 02:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1727169365; x=1727774165; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ziiscuLnBJDlShXEqi/2Y4xbwZJv/fiR4RqFRue3iYQ=;
 b=DEl6dtrrHsd+cNEWuQ50q7LS4ug7oKVJuR6M7yD/XPtgbaE9TAWXqp0E2qsm5+C2Qd
 af1ksxUkszzOXbezOoS9R4+vct+d/3kqhGQ6SVaBEbV7YJSGvo5KcUJ6M7GW12yPyeCF
 ZStxNVIMbQsp9aNGZiEb1A7weimS9BACq0rbs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727169365; x=1727774165;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ziiscuLnBJDlShXEqi/2Y4xbwZJv/fiR4RqFRue3iYQ=;
 b=cU8yWgyzjqsCaGkoGm1PQntzCDJtkK3DsvkHb+veqd/cUKeBvf8kcbmByChP3AlWZ6
 o+woKjvrEESsq3mNc/WJh06kWUtHRINcvwnePbO8dkWcp+uM769/dUeDX5n+aIrVvQbQ
 NoxpbyxZN5WXgkxsSwiIAbl7hydtEu0EmUNshqA+Zn0qarLNpT40BKV4pYtbACxumshW
 px6513pXTQUG9kxO2hieynlWiG+qD83P2W1mb1MhOpf3nwyFuu0xFf+41bfUfCUUoF34
 TobWumLtcAmzWh3H5qMHjWP5KE/vlok6kznqLEkdYDtyZ8xJAYiYUNrvPnf/AcW6eKHF
 B26w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWK7kw9ergz/eckMO060mYLhWE0rdCF7U3SfcjYCpWFaDQlW6Z++0Fk5EZpoRt5sXZtnFDnD6KoiQ4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxSv68AVGXNGE17he8Cjhd2TgOISfh5FNnnawzi2gK0tjyVqSWa
 NQOJIZcbVxV7U9XUVavWeDRQq4B4eVpqCD+Q7uQU9oDWCmJeydCZ0piBuQgKFmk=
X-Google-Smtp-Source: AGHT+IEjRUluK8lpjJJlh5ipszKnNKU9ZhIYMJ/9+5DC9LjHJfrqoHh+5gsqeNXob8fSu2hNOo/diw==
X-Received: by 2002:a17:906:dac3:b0:a8d:505a:5458 with SMTP id
 a640c23a62f3a-a92c482b07cmr288633866b.10.1727169364496; 
 Tue, 24 Sep 2024 02:16:04 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93930c8a8bsm60499066b.131.2024.09.24.02.16.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 02:16:03 -0700 (PDT)
Date: Tue, 24 Sep 2024 11:16:01 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, matthew.auld@intel.com, daniel@ffwll.ch
Subject: Re: [RFC PATCH 00/28] Introduce GPU SVM and Xe SVM implementation
Message-ID: <ZvKDUR3mSMEnQYeM@phenom.ffwll.local>
References: <20240828024901.2582335-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240828024901.2582335-1-matthew.brost@intel.com>
X-Operating-System: Linux phenom 6.10.6-amd64 
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

On Tue, Aug 27, 2024 at 07:48:33PM -0700, Matthew Brost wrote:
> Continuation of SVM work by Oak Zeng [1][2] based on community feedback.
> Introduces GPU SVM layer and new Xe uAPI. Supports GPU page faults for
> system allocations (e.g., malloc), runtime allocations (e.g., binding a
> BO), migration to and from VRAM, and unified eviction (BO and SVM VRAM
> allocations can evict each other). Fully tested; more on this below.
> 
> The patch breakdown is as follows:
> 
> 1. Preparation patches already on the list [3].
> 	- Patches 1-3.
> 	- Please refrain from reviewing these here.	
> 2. New migrate layer functionality
> 	- Patch 4.
> 	- Required for eviction to avoid locking inversion between
> 	  dma-resv and mmap lock.
> 3. GPU SVM.
> 	- Patch 5.
> 	- This is what needs community review.
> 	- Inspired by GPUVM.
> 	- Kernel doc should explain design principles.
> 	- There is certainly room for optimization of the implementation
> 	  and improvements with existing core MM interaction. Pulling in
> 	  pending DMA mapping work [4] and additional core MM support
> 	  for SVM is also likely desired. However, this serves as a good
> 	  starting point for any SVM discussions and could be used as a
> 	  stepping stone to future core MM work.
> 3. Basic SVM support in Xe (i.e., SRAM backing only).
> 	- Patches 6-15.
> 	- The uAPI in the patch could benefit from community input.
> 4. SVM VRAM migration support in Xe.
> 	- Patches 16-23.
> 	- Using TMM BOs for SVM VRAM allocations could use community
> 	  input. Patch 23 has a detailed explaination of this design
> 	  choice in the commit message.
> 5. SVM eviction support in Xe.
> 	- Patch 24.
> 	- Should work with exhaustive eviction [5] when it merges.
> 6. Xe SVM debug / tuning.
> 	- Patch 25-28.
> 
> Kernel documentation and commit messages are relatively light, aside
> from GPU SVM and uAPI patches as this is an RFC.
> 
> Testing has been conducted quite thoroughly with new IGT [6]. Various
> system allocation types (malloc, mmap, mmap flags, huge pages, different
> sizes, different alignments), mixing runtime allocations, unmapping
> corners, invalid faults, and eviction have been tested. Testing scales
> from single thread to multiple threads and multiple processes. Tests
> pass on LNL, BMG, PVC 1 tile, and PVC 2 tile.
> 
> 1. Multiple GPU support.
> 	- This is likely to follow or occur in parallel to this work.
> 2. Userptr unification with GPU SVM.
> 	- This is essentially designed in my head (likely involving a
> 	  few new GPU SVM layer functions) but would require some fairly
> 	  invasive changes to Xe KMD to test out. Therefore, I would
> 	  like GPU SVM to be reviewed first before proceeding with these
> 	  changes.
> 3. Madvise and prefetch IOCTLs
> 	- This is likely to follow or occur in parallel to this work.
> 
> Given the size of the series, I have pushed a GitLab branch for
> reference [7].
> 
> Matt
> 
> [1] https://patchwork.freedesktop.org/series/128910/
> [2] https://patchwork.freedesktop.org/series/132229/
> [3] https://patchwork.freedesktop.org/series/137805/
> [4] https://lore.kernel.org/linux-rdma/cover.1709635535.git.leon@kernel.org/
> [5] https://patchwork.freedesktop.org/series/133643/
> [6] https://patchwork.freedesktop.org/patch/610942/?series=137545&rev=2
> [7] https://gitlab.freedesktop.org/mbrost/xe-kernel-driver-svm-post-8-27-24/-/tree/post?ref_type=heads

Ok rather late, I wanted to type this up 2 weeks ago or so, but alas here
it is finally. I think with all the experiments and discussions I have
fairly clear understanding of the really tricky parts of svm (thanks a lot
to Matt for all the work done). From my side the key points, sorted
roughly in how important I think they are:

1. migrate_to_ram path

I think this is the absolute center piece of making sure we're aligned
with core mm and don't suffer from deadlocks or livelocks fundamental to
the gpusvm library design. So this part imo needs to be solid for the
first version we merge. But of course any core mm changes Matt prototyped
shouldn't gate merging the drm side since they're nicely decoupled, we
only need those to validate the design in testing.

I think the key points are:

- we rely on the migration pte, temporary page references and page lock
  only, which with the core mm changes Matt worked on gives us guaranteed
  reliable migration back to system memory. And we need that, or svm
  essentially becomes unusable as a concept.

- we need to support partial migration, including the worst case fallback
  of only migrating that single page core mm managed to trylock for us
  while holding the pagetable lock.

  Since we have guaranteed migration back to system memory we can make the
  assumption on the gpu fault handling side that we will only ever handle
  ranges that are entirely in vram (by throwing any partial migrations
  out). Needs a retry loop for that in the gpu fault side, but I no logner
  see an issue with that assumption on the gpu fault side otherwise, so
  not needed for merging or even later until we have a driver that
  requires partial vram support.

- no other driver locks related to that memory range in any way are
  allowed, and ideally we also test with the forced fallback to mmap_read
  lock in do_swap_page removed, i.e. calling migrate_to_ram with only
  holding the read vma lock. Of course driver locks for blitting are
  allowed, it's only locks related to managing physical memory which are
  problematic and could result in deadlocks.

- the drm side must uphold the guarantee of not having elevated page
  references whithout holding the page lock. Otherwise there's a race and
  we cannot guarantee migratione to sram.

- also through the try_to_migrate maze we'll hit our own gpu pte
  invalidate paths, so there's some requirements there too. But I've put
  the discussion for that at the very bottom, since most of the gpu pte
  locking questions are imo not that important, and definitely not
  important for the first version we merge.

Everything else below I think we can sort out post merge and just need
rough alignment on the design.

2. eviction

Requirements much like migrate_to_ram, because otherwise we break the
migration gurantee:

- Only looking at physical memory datastructures and locks, no looking at
  mm/vma structs or relying on those being locked. We rely entirely on
  reverse maps from try_to_migrate to find all the mappings on both cpu
  and gpu side (cpu only zone device swap or migration pte entries ofc).

- Partial migration needs to work to make sure we can get out of any
  low memory bind.

3. gpu fault side

- We can only rely on mmap_read for hmm_range_fault. And ideally should
  assume that's not held anywhere else since with per-vma locking I'd
  expect the mm/vma locking will move into hmm_range_fault. This also
  means no looking at vma beyond just passing it around as currently
  needed by core mm functions.

- Big retry loop to handle all races with the mmu notifier under the gpu
  pagetable locks/mmu notifier range lock/whatever we end up calling
  those. Races (especially against concurrent eviction/migrate_to_ram)
  should _not_ be handled on the fault side by trying to hold locks
  instead.

- Long term I think we need to be able to handle concurrent faults, even
  on hw where there's only one gpu fault handling queue. For performance
  we absolutely want to prefault aggressively, and that likely happens
  through cpu ioctls that are entirely independent from the gpu fault
  handling.

  Short term enough (driver-side) locking to make sure this doesn't go
  boom is enough, I think just some design goal documentation here on how
  to achieve that is all we need.

4. physical memory to virtual backpointer

No. Doesn't work :-) Also it's only used in in the eviction/migrate_to_ram
path and I think Matt already fixed this all anyway.

5. gpu pagetable locking

Or mmu notifier range locking or whatever you want to call it. Like on the
cpu side this should _only_ protect the pagetable entries and additional
for us mmu notifier seqno tracking, nothing else.

Any races due to concurrent eviction/migrate_to_ram/gpu fault/prefault
need to be handled by retrying outside of holding the pagetable locks. If
we try to impose additional consistency guarantees we'll fall over and
have a livelock/deadlock fight with core mm in migrate_to_ram. This part
is required I think for the first version, but we already need that anyway
to make migrate_to_ram work properly.

For the actual data structure/locking design I think anything on the
design line between a single global lock and the radix tree over-the-top
scalable per-pagetable (spin)lock design of the core mm is fine.

The design here with 3 levels (mmu notifer, range, struct page) wouldn't
be my first choice, but clearly fits on that line so imo is fine for
initial merging. We might want to make sure that the range locking (I
guess mostly relevant for the invalidate side, drivers don't see much
else) is somewhat abstracted so we can easily change that post-merge, but
not required imo at all.

For consensus documentation I'd recommend a todo or design documentation
patch, where we put down both the current design and why it's like that,
and some of the longer term goals. Then get that acked (imo needs at least
one other driver that's seriously interested in this, plus I think an ack
from Danilo for gpuvm interactions), then merge that. SVM is tricky enough
that I think this would be really useful to make sure we're not
unecessarily stuck in limbo.

From my side again I think the only part we really have to get right from
the start is migrate_to_ram. And I'm confident we've got that now really
solid.

Oh also you need userspace ofc :-)

Cheers, Sima

> Matthew Brost (28):
>   dma-buf: Split out dma fence array create into alloc and arm functions
>   drm/xe: Invalidate media_gt TLBs in PT code
>   drm/xe: Retry BO allocation
>   mm/migrate: Add migrate_device_vma_range
>   drm/gpusvm: Add support for GPU Shared Virtual Memory
>   drm/xe/uapi: Add DRM_XE_VM_BIND_FLAG_SYSTEM_ALLOCATON flag
>   drm/xe: Add SVM init / fini to faulting VMs
>   drm/xe: Add dma_addr res cursor
>   drm/xe: Add SVM range invalidation
>   drm/gpuvm: Add DRM_GPUVA_OP_USER
>   drm/xe: Add (re)bind to SVM page fault handler
>   drm/xe: Add SVM garbage collector
>   drm/xe: Add unbind to SVM garbage collector
>   drm/xe: Do not allow system allocator VMA unbind if the GPU has
>     bindings
>   drm/xe: Enable system allocator uAPI
>   drm/xe: Add migrate layer functions for SVM support
>   drm/xe: Add SVM device memory mirroring
>   drm/xe: Add GPUSVM copy SRAM / VRAM vfunc functions
>   drm/xe: Update PT layer to understand ranges in VRAM
>   drm/xe: Add Xe SVM populate_vram_pfn vfunc
>   drm/xe: Add Xe SVM vram_release vfunc
>   drm/xe: Add BO flags required for SVM
>   drm/xe: Add SVM VRAM migration
>   drm/xe: Basic SVM BO eviction
>   drm/xe: Add SVM debug
>   drm/xe: Add modparam for SVM notifier size
>   drm/xe: Add modparam for SVM prefault
>   drm/gpusvm: Ensure all pages migrated upon eviction
> 
>  drivers/dma-buf/dma-fence-array.c    |   78 +-
>  drivers/gpu/drm/xe/Makefile          |    4 +-
>  drivers/gpu/drm/xe/drm_gpusvm.c      | 2213 ++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/drm_gpusvm.h      |  415 +++++
>  drivers/gpu/drm/xe/xe_bo.c           |   54 +-
>  drivers/gpu/drm/xe/xe_bo.h           |    2 +
>  drivers/gpu/drm/xe/xe_bo_types.h     |    3 +
>  drivers/gpu/drm/xe/xe_device_types.h |    8 +
>  drivers/gpu/drm/xe/xe_gt_pagefault.c |   17 +-
>  drivers/gpu/drm/xe/xe_migrate.c      |  150 ++
>  drivers/gpu/drm/xe/xe_migrate.h      |   10 +
>  drivers/gpu/drm/xe/xe_module.c       |    7 +
>  drivers/gpu/drm/xe/xe_module.h       |    2 +
>  drivers/gpu/drm/xe/xe_pt.c           |  456 +++++-
>  drivers/gpu/drm/xe/xe_pt.h           |    3 +
>  drivers/gpu/drm/xe/xe_pt_types.h     |    2 +
>  drivers/gpu/drm/xe/xe_res_cursor.h   |   50 +-
>  drivers/gpu/drm/xe/xe_svm.c          |  775 +++++++++
>  drivers/gpu/drm/xe/xe_svm.h          |   70 +
>  drivers/gpu/drm/xe/xe_tile.c         |    5 +
>  drivers/gpu/drm/xe/xe_vm.c           |  286 +++-
>  drivers/gpu/drm/xe/xe_vm.h           |   15 +-
>  drivers/gpu/drm/xe/xe_vm_types.h     |   44 +
>  include/drm/drm_gpuvm.h              |    5 +
>  include/linux/dma-fence-array.h      |    6 +
>  include/linux/migrate.h              |    3 +
>  include/uapi/drm/xe_drm.h            |   19 +-
>  mm/migrate_device.c                  |   53 +
>  28 files changed, 4615 insertions(+), 140 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/drm_gpusvm.c
>  create mode 100644 drivers/gpu/drm/xe/drm_gpusvm.h
>  create mode 100644 drivers/gpu/drm/xe/xe_svm.c
>  create mode 100644 drivers/gpu/drm/xe/xe_svm.h
> 
> -- 
> 2.34.1
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
