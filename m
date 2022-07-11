Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D03E57057E
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 16:24:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B6E68E9E7;
	Mon, 11 Jul 2022 14:24:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C006E8E9CA;
 Mon, 11 Jul 2022 14:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657549459; x=1689085459;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LkLJBRXU8CTqGSS1F9inx2PVVQ5ScUgpfznIVYvHZtw=;
 b=U3AbLXLeD7/DTkuMoUVSzG9ST0v13emhU4eA/hoBZcxRCE8roqaUu2Mu
 DcFZTHbM7W+7z3m2wq3gBFyHNFzTLdBywOQKLFyvwoEJX9HgvPCsCslYe
 ReO9/5G5UhD8Wk9iDsX7k6j2U6Fmtw9c99mBSuxcp+bQeFN5wTYvGGLRZ
 UEYJAGfALlc8quCxgOqV7HQbvAPOXSzCtZRQHe7EnPrqBJXeu9rzXXWiU
 XFnjjQ2WufstVmHOysTTsCwtBk2Jj4s9hFgahSyj9DbZGw+ffjSU8Q73g
 aUTf6U7nxoeITwxlHaAZgP+I/W9X1MjTL3PKDd8PtdLj2Mz3bkiY4DHRK w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10404"; a="283425292"
X-IronPort-AV: E=Sophos;i="5.92,263,1650956400"; d="scan'208";a="283425292"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2022 07:24:07 -0700
X-IronPort-AV: E=Sophos;i="5.92,263,1650956400"; d="scan'208";a="652477977"
Received: from lramir2-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.251.209.67])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2022 07:24:05 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/doc/rfc: VM_BIND fix a few grammatical slip-ups and typos
Date: Mon, 11 Jul 2022 16:23:52 +0200
Message-Id: <20220711142352.10188-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 Andi Shyti <andi@etezian.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Just a trivial review of an the vm bind document that is still
an rfc document.

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
Hi,

I'm not a big fan of this kind of patches, but while reading and
reviewing this document I spotted few potential grammatical fixes.

Andi

 Documentation/gpu/rfc/i915_vm_bind.rst | 52 +++++++++++++-------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/Documentation/gpu/rfc/i915_vm_bind.rst b/Documentation/gpu/rfc/i915_vm_bind.rst
index 9a1dcdf2799ef..78c17f345d82c 100644
--- a/Documentation/gpu/rfc/i915_vm_bind.rst
+++ b/Documentation/gpu/rfc/i915_vm_bind.rst
@@ -4,17 +4,17 @@ I915 VM_BIND feature design and use cases
 
 VM_BIND feature
 ================
-DRM_I915_GEM_VM_BIND/UNBIND ioctls allows UMD to bind/unbind GEM buffer
+DRM_I915_GEM_VM_BIND/UNBIND ioctls allow UMD to bind/unbind GEM buffer
 objects (BOs) or sections of a BOs at specified GPU virtual addresses on a
 specified address space (VM). These mappings (also referred to as persistent
 mappings) will be persistent across multiple GPU submissions (execbuf calls)
-issued by the UMD, without user having to provide a list of all required
+issued by the UMD, without the user having to provide a list of all required
 mappings during each submission (as required by older execbuf mode).
 
 The VM_BIND/UNBIND calls allow UMDs to request a timeline out fence for
 signaling the completion of bind/unbind operation.
 
-VM_BIND feature is advertised to user via I915_PARAM_VM_BIND_VERSION.
+VM_BIND feature is advertised to the user via I915_PARAM_VM_BIND_VERSION.
 User has to opt-in for VM_BIND mode of binding for an address space (VM)
 during VM creation time via I915_VM_CREATE_FLAGS_USE_VM_BIND extension.
 
@@ -33,8 +33,8 @@ VM_BIND features include:
 TLB flush consideration
 ------------------------
 The i915 driver flushes the TLB for each submission and when an object's
-pages are released. The VM_BIND/UNBIND operation will not do any additional
-TLB flush. Any VM_BIND mapping added will be in the working set for subsequent
+page is released. The VM_BIND/UNBIND operation will not do any additional TLB
+flush. Any VM_BIND mapping added will be in the working set for subsequent
 submissions on that VM and will not be in the working set for currently running
 batches (which would require additional TLB flushes, which is not supported).
 
@@ -57,13 +57,13 @@ works with execbuf3 ioctl for submission. All BOs mapped on that VM (through
 VM_BIND call) at the time of execbuf3 call are deemed required for that
 submission.
 
-The execbuf3 ioctl directly specifies the batch addresses instead of as
-object handles as in execbuf2 ioctl. The execbuf3 ioctl will also not
+The execbuf3 ioctl directly specifies the batch addresses instead of an
+object handle as in execbuf2 ioctl. The execbuf3 ioctl will also not
 support many of the older features like in/out/submit fences, fence array,
 default gem context and many more (See struct drm_i915_gem_execbuffer3).
 
 In VM_BIND mode, VA allocation is completely managed by the user instead of
-the i915 driver. Hence all VA assignment, eviction are not applicable in
+the i915 driver. Hence all VA assignments and eviction are not applicable in
 VM_BIND mode. Also, for determining object activeness, VM_BIND mode will not
 be using the i915_vma active reference tracking. It will instead use dma-resv
 object for that (See `VM_BIND dma_resv usage`_).
@@ -81,7 +81,7 @@ exported. Hence these BOs are referred to as Shared BOs.
 During each execbuf submission, the request fence must be added to the
 dma-resv fence list of all shared BOs mapped on the VM.
 
-VM_BIND feature introduces an optimization where user can create BO which
+VM_BIND feature introduces an optimization where the user can create a BO which
 is private to a specified VM via I915_GEM_CREATE_EXT_VM_PRIVATE flag during
 BO creation. Unlike Shared BOs, these VM private BOs can only be mapped on
 the VM they are private to and can't be dma-buf exported.
@@ -95,7 +95,7 @@ VM_BIND locking hirarchy
 The locking design here supports the older (execlist based) execbuf mode, the
 newer VM_BIND mode, the VM_BIND mode with GPU page faults and possible future
 system allocator support (See `Shared Virtual Memory (SVM) support`_).
-The older execbuf mode and the newer VM_BIND mode without page faults manages
+The older execbuf mode and the newer VM_BIND mode without page faults manage
 residency of backing storage using dma_fence. The VM_BIND mode with page faults
 and the system allocator support do not use any dma_fence at all.
 
@@ -105,10 +105,10 @@ VM_BIND locking order is as below.
    vm_bind/vm_unbind ioctl calls, in the execbuf path and while releasing the
    mapping.
 
-   In future, when GPU page faults are supported, we can potentially use a
+   In future, when GPU page faults will be supported, we will potentially use a
    rwsem instead, so that multiple page fault handlers can take the read side
    lock to lookup the mapping and hence can run in parallel.
-   The older execbuf mode of binding do not need this lock.
+   The older execbuf mode of binding does not need this lock.
 
 2) Lock-B: The object's dma-resv lock will protect i915_vma state and needs to
    be held while binding/unbinding a vma in the async worker and while updating
@@ -121,9 +121,9 @@ VM_BIND locking order is as below.
 3) Lock-C: Spinlock/s to protect some of the VM's lists like the list of
    invalidated vmas (due to eviction and userptr invalidation) etc.
 
-When GPU page faults are supported, the execbuf path do not take any of these
+When GPU page faults are supported, the execbuf path does not take any of these
 locks. There we will simply smash the new batch buffer address into the ring and
-then tell the scheduler run that. The lock taking only happens from the page
+then tell the scheduler to run that. The locking only happens from the page
 fault handler, where we take lock-A in read mode, whichever lock-B we need to
 find the backing storage (dma_resv lock for gem objects, and hmm/core mm for
 system allocator) and some additional locks (lock-D) for taking care of page
@@ -137,13 +137,13 @@ performance degradation. We will also need support for bulk LRU movement of
 VM_BIND objects to avoid additional latencies in execbuf path.
 
 The page table pages are similar to VM_BIND mapped objects (See
-`Evictable page table allocations`_) and are maintained per VM and needs to
+`Evictable page table allocations`_) and are maintained per VM and need to
 be pinned in memory when VM is made active (ie., upon an execbuf call with
 that VM). So, bulk LRU movement of page table pages is also needed.
 
 VM_BIND dma_resv usage
 -----------------------
-Fences needs to be added to all VM_BIND mapped objects. During each execbuf
+Fences need to be added to all VM_BIND mapped objects. During each execbuf
 submission, they are added with DMA_RESV_USAGE_BOOKKEEP usage to prevent
 over sync (See enum dma_resv_usage). One can override it with either
 DMA_RESV_USAGE_READ or DMA_RESV_USAGE_WRITE usage during explicit object
@@ -188,7 +188,7 @@ User/Memory Fence
 User/Memory fence is a <address, value> pair. To signal the user fence, the
 specified value will be written at the specified virtual address and wakeup the
 waiting process. User fence can be signaled either by the GPU or kernel async
-worker (like upon bind completion). User can wait on a user fence with a new
+worker (like upon bind completion). The user can wait on a user fence with a new
 user fence wait ioctl.
 
 Here is some prior work on this:
@@ -196,22 +196,22 @@ https://patchwork.freedesktop.org/patch/349417/
 
 Low Latency Submission
 ~~~~~~~~~~~~~~~~~~~~~~~
-Allows compute UMD to directly submit GPU jobs instead of through execbuf
-ioctl. This is made possible by VM_BIND is not being synchronized against
+Allows compute UMD to directly submit GPU jobs instead of using execbuf
+ioctl. This is made possible by VM_BIND and it's not being synchronized against
 execbuf. VM_BIND allows bind/unbind of mappings required for the directly
 submitted jobs.
 
 Debugger
 ---------
-With debug event interface user space process (debugger) is able to keep track
-of and act upon resources created by another process (debugged) and attached
-to GPU via vm_bind interface.
+With debug event interface the user space process (debugger) is able to keep
+track of and act upon resources created by another process (debugged) and
+attached to GPU via vm_bind interface.
 
 GPU page faults
 ----------------
 GPU page faults when supported (in future), will only be supported in the
 VM_BIND mode. While both the older execbuf mode and the newer VM_BIND mode of
-binding will require using dma-fence to ensure residency, the GPU page faults
+binding will require using dma-fence to ensure residency, the GPU page fault
 mode when supported, will not use any dma-fence as residency is purely managed
 by installing and removing/invalidating page table entries.
 
@@ -229,15 +229,15 @@ Evictable page table allocations
 ---------------------------------
 Make pagetable allocations evictable and manage them similar to VM_BIND
 mapped objects. Page table pages are similar to persistent mappings of a
-VM (difference here are that the page table pages will not have an i915_vma
-structure and after swapping pages back in, parent page link needs to be
+VM (the difference here is that the page table pages will not have an i915_vma
+structure and after swapping pages back in, the parent page link needs to be
 updated).
 
 Shared Virtual Memory (SVM) support
 ------------------------------------
 VM_BIND interface can be used to map system memory directly (without gem BO
 abstraction) using the HMM interface. SVM is only supported with GPU page
-faults enabled.
+fault enabled.
 
 VM_BIND UAPI
 =============
-- 
2.36.1

