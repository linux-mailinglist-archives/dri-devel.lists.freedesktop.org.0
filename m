Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B19555161E
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 12:44:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5B0910ECE0;
	Mon, 20 Jun 2022 10:44:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECE6810ECE0;
 Mon, 20 Jun 2022 10:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655721849; x=1687257849;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=9iStiXgeIs3dw9StqRjFKS89VMxuLayzWKeYM6ABkig=;
 b=BeQm79QA6EYaV7skLTfKyJ+CsDXsZwi7o1kLsiqH+0MQnUIHnW2Purkc
 K1CplWbfQtH0D3tvdu4WXZfOUMDiH2el32kfESnFdp0q5xc8Q5uFmksNI
 qc72TYpc3TZ+RYqSpIy9K4y5hlxVLbu2o0B2vhazt5S3Hw9gnJ/GlfELu
 FebGT8nAA+VoHEKXgPyye5fKTgycLdqEQ6c1RcYeYS4ih3pzrj4ToBLsX
 afb9/eO7cuFFdbCsFOC1bifsl7bsCH2811M8dOseLWPHTP/fQ7nEEVZ2V
 DHeQ8Ilt5Odkx6b3OcBwwMl4CS/frrnURM55PQHCgO+exxlWEazrJ6fCb w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="279912334"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="279912334"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2022 03:44:09 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="643057547"
Received: from malikhan-mobl1.amr.corp.intel.com (HELO [10.212.127.6])
 ([10.212.127.6])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2022 03:43:13 -0700
Message-ID: <c153dc07-f44d-ba83-cad6-2005a497a519@linux.intel.com>
Date: Mon, 20 Jun 2022 11:43:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [Intel-gfx] [PATCH v2 1/3] drm/doc/rfc: VM_BIND feature design
 document
Content-Language: en-US
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@intel.com
References: <20220617051445.8901-1-niranjana.vishwanathapura@intel.com>
 <20220617051445.8901-2-niranjana.vishwanathapura@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220617051445.8901-2-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: christian.koenig@amd.com, thomas.hellstrom@intel.com,
 paulo.r.zanoni@intel.com, chris.p.wilson@intel.com, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi,

On 17/06/2022 06:14, Niranjana Vishwanathapura wrote:
> VM_BIND design document with description of intended use cases.
> 
> v2: Reduce the scope to simple Mesa use case.

since I expressed interest please add me to cc when sending out.

How come the direction changed to simplify all of a sudden? I did not 
spot any discussion to that effect. Was it internal talks?

> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>   Documentation/gpu/rfc/i915_vm_bind.rst | 238 +++++++++++++++++++++++++
>   Documentation/gpu/rfc/index.rst        |   4 +
>   2 files changed, 242 insertions(+)
>   create mode 100644 Documentation/gpu/rfc/i915_vm_bind.rst
> 
> diff --git a/Documentation/gpu/rfc/i915_vm_bind.rst b/Documentation/gpu/rfc/i915_vm_bind.rst
> new file mode 100644
> index 000000000000..4ab590ef11fd
> --- /dev/null
> +++ b/Documentation/gpu/rfc/i915_vm_bind.rst
> @@ -0,0 +1,238 @@
> +==========================================
> +I915 VM_BIND feature design and use cases
> +==========================================
> +
> +VM_BIND feature
> +================
> +DRM_I915_GEM_VM_BIND/UNBIND ioctls allows UMD to bind/unbind GEM buffer
> +objects (BOs) or sections of a BOs at specified GPU virtual addresses on a
> +specified address space (VM). These mappings (also referred to as persistent
> +mappings) will be persistent across multiple GPU submissions (execbuf calls)
> +issued by the UMD, without user having to provide a list of all required
> +mappings during each submission (as required by older execbuf mode).
> +
> +The VM_BIND/UNBIND calls allow UMDs to request a timeline fence for signaling
> +the completion of bind/unbind operation.
> +
> +VM_BIND feature is advertised to user via I915_PARAM_HAS_VM_BIND.
> +User has to opt-in for VM_BIND mode of binding for an address space (VM)
> +during VM creation time via I915_VM_CREATE_FLAGS_USE_VM_BIND extension.
> +
> +Normally, vm_bind/unbind operations will get completed synchronously,

To me synchronously, at this point in the text, reads as ioctl will 
return only when the operation is done. Rest of the paragraph however 
disagrees (plus existence of out fence). It is not clear to me what is 
the actual behaviour. Will it be clear to userspace developers reading 
uapi kerneldoc? If it is async, what are the ordering rules in this version?

> +but if the object is being moved, the binding will happen once that the
> +moving is complete and out fence will be signaled after binding is complete.
> +The bind/unbind operation can get completed out of submission order.
> +
> +VM_BIND features include:
> +
> +* Multiple Virtual Address (VA) mappings can map to the same physical pages
> +  of an object (aliasing).
> +* VA mapping can map to a partial section of the BO (partial binding).
> +* Support capture of persistent mappings in the dump upon GPU error.
> +* TLB is flushed upon unbind completion. Batching of TLB flushes in some
> +  use cases will be helpful.
> +* Support for userptr gem objects (no special uapi is required for this).
> +
> +Execbuf ioctl in VM_BIND mode
> +-------------------------------
> +A VM in VM_BIND mode will not support older execbuf mode of binding.
> +The execbuf ioctl handling in VM_BIND mode differs significantly from the
> +older execbuf2 ioctl (See struct drm_i915_gem_execbuffer2).
> +Hence, a new execbuf3 ioctl has been added to support VM_BIND mode. (See
> +struct drm_i915_gem_execbuffer3). The execbuf3 ioctl will not accept any
> +execlist. Hence, no support for implicit sync. It is expected that the below
> +work will be able to support requirements of object dependency setting in all
> +use cases:
> +
> +"dma-buf: Add an API for exporting sync files"
> +(https://lwn.net/Articles/859290/)

What does this mean? If execbuf3 does not know about target objects how 
can we add a meaningful fence?

> +
> +The execbuf3 ioctl directly specifies the batch addresses instead of as
> +object handles as in execbuf2 ioctl. The execbuf3 ioctl will also not
> +support many of the older features like in/out/submit fences, fence array,
> +default gem context and many more (See struct drm_i915_gem_execbuffer3).
> +
> +In VM_BIND mode, VA allocation is completely managed by the user instead of
> +the i915 driver. Hence all VA assignment, eviction are not applicable in
> +VM_BIND mode. Also, for determining object activeness, VM_BIND mode will not
> +be using the i915_vma active reference tracking. It will instead use dma-resv
> +object for that (See `VM_BIND dma_resv usage`_).
> +
> +So, a lot of existing code supporting execbuf2 ioctl, like relocations, VA
> +evictions, vma lookup table, implicit sync, vma active reference tracking etc.,
> +are not applicable for execbuf3 ioctl. Hence, all execbuf3 specific handling
> +should be in a separate file and only functionalities common to these ioctls
> +can be the shared code where possible.
> +
> +VM_PRIVATE objects
> +-------------------
> +By default, BOs can be mapped on multiple VMs and can also be dma-buf
> +exported. Hence these BOs are referred to as Shared BOs.
> +During each execbuf submission, the request fence must be added to the
> +dma-resv fence list of all shared BOs mapped on the VM.

Does this tie to my previous question? Design is to add each fence to 
literally _all_ BOs mapped to a VM, on every execbuf3? If so, is that 
definitely needed and for what use case? Mixing implicit and explicit, I 
mean bridging implicit and explicit sync clients?

Regards,

Tvrtko

> +
> +VM_BIND feature introduces an optimization where user can create BO which
> +is private to a specified VM via I915_GEM_CREATE_EXT_VM_PRIVATE flag during
> +BO creation. Unlike Shared BOs, these VM private BOs can only be mapped on
> +the VM they are private to and can't be dma-buf exported.
> +All private BOs of a VM share the dma-resv object. Hence during each execbuf
> +submission, they need only one dma-resv fence list updated. Thus, the fast
> +path (where required mappings are already bound) submission latency is O(1)
> +w.r.t the number of VM private BOs.
> +
> +VM_BIND locking hirarchy
> +-------------------------
> +The locking design here supports the older (execlist based) execbuf mode, the
> +newer VM_BIND mode, the VM_BIND mode with GPU page faults and possible future
> +system allocator support (See `Shared Virtual Memory (SVM) support`_).
> +The older execbuf mode and the newer VM_BIND mode without page faults manages
> +residency of backing storage using dma_fence. The VM_BIND mode with page faults
> +and the system allocator support do not use any dma_fence at all.
> +
> +VM_BIND locking order is as below.
> +
> +1) Lock-A: A vm_bind mutex will protect vm_bind lists. This lock is taken in
> +   vm_bind/vm_unbind ioctl calls, in the execbuf path and while releasing the
> +   mapping.
> +
> +   In future, when GPU page faults are supported, we can potentially use a
> +   rwsem instead, so that multiple page fault handlers can take the read side
> +   lock to lookup the mapping and hence can run in parallel.
> +   The older execbuf mode of binding do not need this lock.
> +
> +2) Lock-B: The object's dma-resv lock will protect i915_vma state and needs to
> +   be held while binding/unbinding a vma in the async worker and while updating
> +   dma-resv fence list of an object. Note that private BOs of a VM will all
> +   share a dma-resv object.
> +
> +   The future system allocator support will use the HMM prescribed locking
> +   instead.
> +
> +3) Lock-C: Spinlock/s to protect some of the VM's lists like the list of
> +   invalidated vmas (due to eviction and userptr invalidation) etc.
> +
> +When GPU page faults are supported, the execbuf path do not take any of these
> +locks. There we will simply smash the new batch buffer address into the ring and
> +then tell the scheduler run that. The lock taking only happens from the page
> +fault handler, where we take lock-A in read mode, whichever lock-B we need to
> +find the backing storage (dma_resv lock for gem objects, and hmm/core mm for
> +system allocator) and some additional locks (lock-D) for taking care of page
> +table races. Page fault mode should not need to ever manipulate the vm lists,
> +so won't ever need lock-C.
> +
> +VM_BIND LRU handling
> +---------------------
> +We need to ensure VM_BIND mapped objects are properly LRU tagged to avoid
> +performance degradation. We will also need support for bulk LRU movement of
> +VM_BIND objects to avoid additional latencies in execbuf path.
> +
> +The page table pages are similar to VM_BIND mapped objects (See
> +`Evictable page table allocations`_) and are maintained per VM and needs to
> +be pinned in memory when VM is made active (ie., upon an execbuf call with
> +that VM). So, bulk LRU movement of page table pages is also needed.
> +
> +VM_BIND dma_resv usage
> +-----------------------
> +Fences needs to be added to all VM_BIND mapped objects. During each execbuf
> +submission, they are added with DMA_RESV_USAGE_BOOKKEEP usage to prevent
> +over sync (See enum dma_resv_usage). One can override it with either
> +DMA_RESV_USAGE_READ or DMA_RESV_USAGE_WRITE usage during object dependency
> +setting (either through explicit or implicit mechanism).
> +
> +When vm_bind is called for a non-private object while the VM is already
> +active, the fences need to be copied from VM's shared dma-resv object
> +(common to all private objects of the VM) to this non-private object.
> +If this results in performance degradation, then some optimization will
> +be needed here. This is not a problem for VM's private objects as they use
> +shared dma-resv object which is always updated on each execbuf submission.
> +
> +Also, in VM_BIND mode, use dma-resv apis for determining object activeness
> +(See dma_resv_test_signaled() and dma_resv_wait_timeout()) and do not use the
> +older i915_vma active reference tracking which is deprecated. This should be
> +easier to get it working with the current TTM backend.
> +
> +Mesa use case
> +--------------
> +VM_BIND can potentially reduce the CPU overhead in Mesa (both Vulkan and Iris),
> +hence improving performance of CPU-bound applications. It also allows us to
> +implement Vulkan's Sparse Resources. With increasing GPU hardware performance,
> +reducing CPU overhead becomes more impactful.
> +
> +
> +Other VM_BIND use cases
> +========================
> +
> +Long running Compute contexts
> +------------------------------
> +Usage of dma-fence expects that they complete in reasonable amount of time.
> +Compute on the other hand can be long running. Hence it is appropriate for
> +compute to use user/memory fence (See `User/Memory Fence`_) and dma-fence usage
> +must be limited to in-kernel consumption only.
> +
> +Where GPU page faults are not available, kernel driver upon buffer invalidation
> +will initiate a suspend (preemption) of long running context, finish the
> +invalidation, revalidate the BO and then resume the compute context. This is
> +done by having a per-context preempt fence which is enabled when someone tries
> +to wait on it and triggers the context preemption.
> +
> +User/Memory Fence
> +~~~~~~~~~~~~~~~~~~
> +User/Memory fence is a <address, value> pair. To signal the user fence, the
> +specified value will be written at the specified virtual address and wakeup the
> +waiting process. User fence can be signaled either by the GPU or kernel async
> +worker (like upon bind completion). User can wait on a user fence with a new
> +user fence wait ioctl.
> +
> +Here is some prior work on this:
> +https://patchwork.freedesktop.org/patch/349417/
> +
> +Low Latency Submission
> +~~~~~~~~~~~~~~~~~~~~~~~
> +Allows compute UMD to directly submit GPU jobs instead of through execbuf
> +ioctl. This is made possible by VM_BIND is not being synchronized against
> +execbuf. VM_BIND allows bind/unbind of mappings required for the directly
> +submitted jobs.
> +
> +Debugger
> +---------
> +With debug event interface user space process (debugger) is able to keep track
> +of and act upon resources created by another process (debugged) and attached
> +to GPU via vm_bind interface.
> +
> +GPU page faults
> +----------------
> +GPU page faults when supported (in future), will only be supported in the
> +VM_BIND mode. While both the older execbuf mode and the newer VM_BIND mode of
> +binding will require using dma-fence to ensure residency, the GPU page faults
> +mode when supported, will not use any dma-fence as residency is purely managed
> +by installing and removing/invalidating page table entries.
> +
> +Page level hints settings
> +--------------------------
> +VM_BIND allows any hints setting per mapping instead of per BO.
> +Possible hints include read-only mapping, placement and atomicity.
> +Sub-BO level placement hint will be even more relevant with
> +upcoming GPU on-demand page fault support.
> +
> +Page level Cache/CLOS settings
> +-------------------------------
> +VM_BIND allows cache/CLOS settings per mapping instead of per BO.
> +
> +Evictable page table allocations
> +---------------------------------
> +Make pagetable allocations evictable and manage them similar to VM_BIND
> +mapped objects. Page table pages are similar to persistent mappings of a
> +VM (difference here are that the page table pages will not have an i915_vma
> +structure and after swapping pages back in, parent page link needs to be
> +updated).
> +
> +Shared Virtual Memory (SVM) support
> +------------------------------------
> +VM_BIND interface can be used to map system memory directly (without gem BO
> +abstraction) using the HMM interface. SVM is only supported with GPU page
> +faults enabled.
> +
> +VM_BIND UAPI
> +=============
> +
> +.. kernel-doc:: Documentation/gpu/rfc/i915_vm_bind.h
> diff --git a/Documentation/gpu/rfc/index.rst b/Documentation/gpu/rfc/index.rst
> index 91e93a705230..7d10c36b268d 100644
> --- a/Documentation/gpu/rfc/index.rst
> +++ b/Documentation/gpu/rfc/index.rst
> @@ -23,3 +23,7 @@ host such documentation:
>   .. toctree::
>   
>       i915_scheduler.rst
> +
> +.. toctree::
> +
> +    i915_vm_bind.rst
