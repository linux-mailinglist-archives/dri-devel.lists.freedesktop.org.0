Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8C1549A5B
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 19:50:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ADE410F499;
	Mon, 13 Jun 2022 17:50:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8159710F499;
 Mon, 13 Jun 2022 17:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655142616; x=1686678616;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Y6jxVEnvx+NecnAQiMdMJuSRara13O08a/wTdkIsCnA=;
 b=hCGid/TneStkKcdkN8l3Ak3W1sVQM24CTxc98PSuv5LkFrnKjz/ZN+An
 ZEF/gfearHJoSg+gkuC2q4cz0+NBFZ/XyaSj4AvfIFvGEh+4Um7RIsKUI
 pIpGjMSzW8/HF9fu2Zxw3MbddP72L0ExGjf+bl4yQWuqqhy4YKi7qdIe3
 xNF/xlP7C8pSfW0BQ8s8ydvh0nuZgngct4Kn8OuKlCs6fvrIZSPejNC+t
 2dVcLTPFQoAXno3xA3XB0KbuSeKDtViRPCPvr5oq+b0h4Vwtg/7NomVfT
 5VwM1UsJ/SfKnudyOAgebckGXoVlTc7HaiogQCuIJA0Rf03xfHXivo0Km g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10377"; a="261401313"
X-IronPort-AV: E=Sophos;i="5.91,297,1647327600"; d="scan'208";a="261401313"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2022 10:50:15 -0700
X-IronPort-AV: E=Sophos;i="5.91,297,1647327600"; d="scan'208";a="651546149"
Received: from nvishwa1-desk.sc.intel.com (HELO nvishwa1-DESK) ([172.25.29.76])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2022 10:50:15 -0700
Date: Mon, 13 Jun 2022 10:49:57 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 3/3] drm/doc/rfc: VM_BIND uapi definition
Message-ID: <20220613174956.GH376@nvishwa1-DESK>
References: <20220610070711.32407-1-niranjana.vishwanathapura@intel.com>
 <20220610070711.32407-4-niranjana.vishwanathapura@intel.com>
 <9b7c4864-18c2-5c70-009a-1c6e7843bf0d@linux.intel.com>
 <9043381e-ff63-934b-4576-132f15c2e363@intel.com>
 <20220610161420.GB376@nvishwa1-DESK>
 <b5292e01-5a1f-d339-cbb4-e565e07e4437@linux.intel.com>
 <20220613150551.GG376@nvishwa1-DESK>
 <459c327d-5796-f9e4-4442-a51714525c73@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <459c327d-5796-f9e4-4442-a51714525c73@linux.intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: paulo.r.zanoni@intel.com, Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 intel-gfx@lists.freedesktop.org, chris.p.wilson@intel.com,
 thomas.hellstrom@intel.com, dri-devel@lists.freedesktop.org,
 Jason Ekstrand <jason@jlekstrand.net>, daniel.vetter@intel.com,
 christian.koenig@amd.com, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 13, 2022 at 05:22:02PM +0100, Tvrtko Ursulin wrote:
>
>On 13/06/2022 16:05, Niranjana Vishwanathapura wrote:
>>On Mon, Jun 13, 2022 at 09:24:18AM +0100, Tvrtko Ursulin wrote:
>>>
>>>On 10/06/2022 17:14, Niranjana Vishwanathapura wrote:
>>>>On Fri, Jun 10, 2022 at 05:48:39PM +0300, Lionel Landwerlin wrote:
>>>>>On 10/06/2022 13:37, Tvrtko Ursulin wrote:
>>>>>>
>>>>>>On 10/06/2022 08:07, Niranjana Vishwanathapura wrote:
>>>>>>>VM_BIND and related uapi definitions
>>>>>>>
>>>>>>>Signed-off-by: Niranjana Vishwanathapura 
>>>>>>><niranjana.vishwanathapura@intel.com>
>>>>>>>---
>>>>>>>  Documentation/gpu/rfc/i915_vm_bind.h | 490 
>>>>>>>+++++++++++++++++++++++++++
>>>>>>>  1 file changed, 490 insertions(+)
>>>>>>>  create mode 100644 Documentation/gpu/rfc/i915_vm_bind.h
>>>>>>>
>>>>>>>diff --git a/Documentation/gpu/rfc/i915_vm_bind.h 
>>>>>>>b/Documentation/gpu/rfc/i915_vm_bind.h
>>>>>>>new file mode 100644
>>>>>>>index 000000000000..9fc854969cfb
>>>>>>>--- /dev/null
>>>>>>>+++ b/Documentation/gpu/rfc/i915_vm_bind.h
>>>>>>>@@ -0,0 +1,490 @@
>>>>>>>+/* SPDX-License-Identifier: MIT */
>>>>>>>+/*
>>>>>>>+ * Copyright © 2022 Intel Corporation
>>>>>>>+ */
>>>>>>>+
>>>>>>>+/**
>>>>>>>+ * DOC: I915_PARAM_HAS_VM_BIND
>>>>>>>+ *
>>>>>>>+ * VM_BIND feature availability.
>>>>>>>+ * See typedef drm_i915_getparam_t param.
>>>>>>>+ * bit[0]: If set, VM_BIND is supported, otherwise not.
>>>>>>>+ * bits[8-15]: VM_BIND implementation version.
>>>>>>>+ * version 0 will not have VM_BIND/UNBIND timeline fence 
>>>>>>>array support.
>>>>>>>+ */
>>>>>>>+#define I915_PARAM_HAS_VM_BIND        57
>>>>>>>+
>>>>>>>+/**
>>>>>>>+ * DOC: I915_VM_CREATE_FLAGS_USE_VM_BIND
>>>>>>>+ *
>>>>>>>+ * Flag to opt-in for VM_BIND mode of binding during VM creation.
>>>>>>>+ * See struct drm_i915_gem_vm_control flags.
>>>>>>>+ *
>>>>>>>+ * The older execbuf2 ioctl will not support VM_BIND mode 
>>>>>>>of operation.
>>>>>>>+ * For VM_BIND mode, we have new execbuf3 ioctl which 
>>>>>>>will not accept any
>>>>>>>+ * execlist (See struct drm_i915_gem_execbuffer3 for more details).
>>>>>>>+ *
>>>>>>>+ */
>>>>>>>+#define I915_VM_CREATE_FLAGS_USE_VM_BIND    (1 << 0)
>>>>>>>+
>>>>>>>+/**
>>>>>>>+ * DOC: I915_CONTEXT_CREATE_FLAGS_LONG_RUNNING
>>>>>>>+ *
>>>>>>>+ * Flag to declare context as long running.
>>>>>>>+ * See struct drm_i915_gem_context_create_ext flags.
>>>>>>>+ *
>>>>>>>+ * Usage of dma-fence expects that they complete in 
>>>>>>>reasonable amount of time.
>>>>>>>+ * Compute on the other hand can be long running. Hence 
>>>>>>>it is not appropriate
>>>>>>>+ * for compute contexts to export request completion 
>>>>>>>dma-fence to user.
>>>>>>>+ * The dma-fence usage will be limited to in-kernel 
>>>>>>>consumption only.
>>>>>>>+ * Compute contexts need to use user/memory fence.
>>>>>>>+ *
>>>>>>>+ * So, long running contexts do not support output fences. Hence,
>>>>>>>+ * I915_EXEC_FENCE_SIGNAL (See 
>>>>>>>&drm_i915_gem_exec_fence.flags) is expected
>>>>>>>+ * to be not used. DRM_I915_GEM_WAIT ioctl call is also 
>>>>>>>not supported for
>>>>>>>+ * objects mapped to long running contexts.
>>>>>>>+ */
>>>>>>>+#define I915_CONTEXT_CREATE_FLAGS_LONG_RUNNING   (1u << 2)
>>>>>>>+
>>>>>>>+/* VM_BIND related ioctls */
>>>>>>>+#define DRM_I915_GEM_VM_BIND        0x3d
>>>>>>>+#define DRM_I915_GEM_VM_UNBIND        0x3e
>>>>>>>+#define DRM_I915_GEM_EXECBUFFER3    0x3f
>>>>>>>+#define DRM_I915_GEM_WAIT_USER_FENCE    0x40
>>>>>>>+
>>>>>>>+#define DRM_IOCTL_I915_GEM_VM_BIND 
>>>>>>>DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_VM_BIND, struct 
>>>>>>>drm_i915_gem_vm_bind)
>>>>>>>+#define DRM_IOCTL_I915_GEM_VM_UNBIND 
>>>>>>>DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_VM_UNBIND, struct 
>>>>>>>drm_i915_gem_vm_bind)
>>>>>>>+#define DRM_IOCTL_I915_GEM_EXECBUFFER3 
>>>>>>>DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_EXECBUFFER3, 
>>>>>>>struct drm_i915_gem_execbuffer3)
>>>>>>>+#define DRM_IOCTL_I915_GEM_WAIT_USER_FENCE 
>>>>>>>DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_WAIT_USER_FENCE, 
>>>>>>>struct drm_i915_gem_wait_user_fence)
>>>>>>>+
>>>>>>>+/**
>>>>>>>+ * struct drm_i915_gem_vm_bind - VA to object mapping to bind.
>>>>>>>+ *
>>>>>>>+ * This structure is passed to VM_BIND ioctl and 
>>>>>>>specifies the mapping of GPU
>>>>>>>+ * virtual address (VA) range to the section of an object 
>>>>>>>that should be bound
>>>>>>>+ * in the device page table of the specified address space (VM).
>>>>>>>+ * The VA range specified must be unique (ie., not 
>>>>>>>currently bound) and can
>>>>>>>+ * be mapped to whole object or a section of the object 
>>>>>>>(partial binding).
>>>>>>>+ * Multiple VA mappings can be created to the same 
>>>>>>>section of the object
>>>>>>>+ * (aliasing).
>>>>>>>+ *
>>>>>>>+ * The @queue_idx specifies the queue to use for binding. 
>>>>>>>Same queue can be
>>>>>>>+ * used for both VM_BIND and VM_UNBIND calls. All 
>>>>>>>submitted bind and unbind
>>>>>>>+ * operations in a queue are performed in the order of submission.
>>>>>>>+ *
>>>>>>>+ * The @start, @offset and @length should be 4K page 
>>>>>>>aligned. However the DG2
>>>>>>>+ * and XEHPSDV has 64K page size for device local-memory 
>>>>>>>and has compact page
>>>>>>>+ * table. On those platforms, for binding device 
>>>>>>>local-memory objects, the
>>>>>>>+ * @start should be 2M aligned, @offset and @length 
>>>>>>>should be 64K aligned.
>>>>>>>+ * Also, on those platforms, it is not allowed to bind an 
>>>>>>>device local-memory
>>>>>>>+ * object and a system memory object in a single 2M 
>>>>>>>section of VA range.
>>>>>>>+ */
>>>>>>>+struct drm_i915_gem_vm_bind {
>>>>>>>+    /** @vm_id: VM (address space) id to bind */
>>>>>>>+    __u32 vm_id;
>>>>>>>+
>>>>>>>+    /** @queue_idx: Index of queue for binding */
>>>>>>>+    __u32 queue_idx;
>>>>>>
>>>>>>I have a question here to which I did not find an answer by 
>>>>>>browsing the old threads.
>>>>>>
>>>>>>Queue index appears to be an implicit synchronisation 
>>>>>>mechanism, right? Operations on the same index are 
>>>>>>executed/complete in order of ioctl submission?
>>>>>>
>>>>>>Do we _have_ to implement this on the kernel side and could 
>>>>>>just allow in/out fence and let userspace deal with it?
>>>>>
>>>>>
>>>>>It orders operations like in a queue. Which is kind of what 
>>>>>happens with existing queues/engines.
>>>>>
>>>>>If I understood correctly, it's going to be a kthread + a 
>>>>>linked list right?
>>>>>
>>>>
>>>>Yes, that is correct.
>>>>
>>>>>
>>>>>-Lionel
>>>>>
>>>>>
>>>>>>
>>>>>>Arbitrary/on-demand number of queues will add the complexity 
>>>>>>on the kernel side which should be avoided if possible.
>>>>>>
>>>>
>>>>It was discussed in the other thread. Jason prefers this over putting
>>>>an artificial limit on number of queues (as user can anyway can exhaust
>>>>the memory). I think complexity in the driver is manageable.
>>>
>>>You'll need to create tracking structures on demand, with atomic 
>>>replace of last fence, ref counting and locking of some sort, more 
>>>or less?
>>>
>>
>>We will have a workqueue, an work item and a linked list per queue.
>>VM_BIND/UNBIND call will add the mapping request to the specified queue's
>>linked list and schedule the work item on the workqueue of that queue.
>>I am not sure what you mean by last fence and replacing it.
>>
>>>>The other option being discussed in to have the user create those
>>>>queues (like creating engine map) before hand and use that in vm_bind
>>>>and vm_unbind ioctls. This puts a limit on the number of queues.
>>>>But it is not clean either and not sure it is worth making the interface
>>>>more complex.
>>>>https://www.spinics.net/lists/dri-devel/msg350448.html
>>>
>>>What about the third option of a flag to return a fence (of some 
>>>sort) and pass in a fence? That way userspace can imagine zero or 
>>>N queues with very little effort on the kernel side. Was this 
>>>considered?
>>>
>>
>>I am not clear what fence you are talking about here and how does that
>>help with the number of vm_bind queues. Can you eloborate?
>
>It is actually already documented that bind/unbind will support input 
>and output fences - so what are these queues on top of what userspace 
>can already achieve by using them? Purely a convenience or there is 
>more to it?
>

Oh, the vm_bind queues are discussed in this thread.
https://lists.freedesktop.org/archives/intel-gfx/2022-June/299217.html

Apparently Vulkan has requirement for multiple queues, each queue
processing vm_bind/unbind calls in the order of submission.

Niranjana

>Regards,
>
>Tvrtko
