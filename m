Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B5F5413E8
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 22:09:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1FFE10E669;
	Tue,  7 Jun 2022 20:09:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17F7110E61C;
 Tue,  7 Jun 2022 20:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654632569; x=1686168569;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=IwVBRy+FJFfFmhVdTwBAH2paD31TiQryyHfWobapyKw=;
 b=PzLBH97F1g5/mVOFJi9BwmK5BmsOvjuP9b/DUeFSiuqNwEOGvLGOa/ua
 3lts7t5dxo43JNQfket/E7szyKzDG+9DRb/4cfYIR8a+OtEILOrzfudAE
 m4psydmSRTh0psJ3Icb/kJsiF4rg3B5LwAH2rqkvb74etfe6RfN+cYXBY
 zwJpOn+TpLR0Y0kzs+JgD9mD2WhmsF3fXiqvmmjcGZtW+bfUjnF0K8Uk2
 4Y0pCqND1bWa6eodbvuBi7451szquXjiJoeVkNwqi9AKcoeMH9OP98ed/
 DHumzSLvdTKb8GQG3QZP7Wb2jIOg0RUuqofcrQWQoAmdfE6lQCi/ssFPT Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10371"; a="265355761"
X-IronPort-AV: E=Sophos;i="5.91,284,1647327600"; d="scan'208";a="265355761"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2022 12:37:22 -0700
X-IronPort-AV: E=Sophos;i="5.91,284,1647327600"; d="scan'208";a="826513456"
Received: from nvishwa1-desk.sc.intel.com (HELO nvishwa1-DESK) ([172.25.29.76])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2022 12:37:21 -0700
Date: Tue, 7 Jun 2022 12:37:03 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [RFC v3 3/3] drm/doc/rfc: VM_BIND uapi definition
Message-ID: <20220607193702.GW4461@nvishwa1-DESK>
References: <20220517183212.20274-1-niranjana.vishwanathapura@intel.com>
 <20220517183212.20274-4-niranjana.vishwanathapura@intel.com>
 <14f7c965-5aa2-8404-534d-d15d31720139@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <14f7c965-5aa2-8404-534d-d15d31720139@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, chris.p.wilson@intel.com,
 thomas.hellstrom@intel.com, dri-devel@lists.freedesktop.org,
 daniel.vetter@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 07, 2022 at 11:27:14AM +0100, Tvrtko Ursulin wrote:
>
>On 17/05/2022 19:32, Niranjana Vishwanathapura wrote:
>>VM_BIND and related uapi definitions
>>
>>v2: Ensure proper kernel-doc formatting with cross references.
>>     Also add new uapi and documentation as per review comments
>>     from Daniel.
>>
>>Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>>---
>>  Documentation/gpu/rfc/i915_vm_bind.h | 399 +++++++++++++++++++++++++++
>>  1 file changed, 399 insertions(+)
>>  create mode 100644 Documentation/gpu/rfc/i915_vm_bind.h
>>
>>diff --git a/Documentation/gpu/rfc/i915_vm_bind.h b/Documentation/gpu/rfc/i915_vm_bind.h
>>new file mode 100644
>>index 000000000000..589c0a009107
>>--- /dev/null
>>+++ b/Documentation/gpu/rfc/i915_vm_bind.h
>>@@ -0,0 +1,399 @@
>>+/* SPDX-License-Identifier: MIT */
>>+/*
>>+ * Copyright © 2022 Intel Corporation
>>+ */
>>+
>>+/**
>>+ * DOC: I915_PARAM_HAS_VM_BIND
>>+ *
>>+ * VM_BIND feature availability.
>>+ * See typedef drm_i915_getparam_t param.
>>+ */
>>+#define I915_PARAM_HAS_VM_BIND		57
>>+
>>+/**
>>+ * DOC: I915_VM_CREATE_FLAGS_USE_VM_BIND
>>+ *
>>+ * Flag to opt-in for VM_BIND mode of binding during VM creation.
>>+ * See struct drm_i915_gem_vm_control flags.
>>+ *
>>+ * A VM in VM_BIND mode will not support the older execbuff mode of binding.
>>+ * In VM_BIND mode, execbuff ioctl will not accept any execlist (ie., the
>>+ * &drm_i915_gem_execbuffer2.buffer_count must be 0).
>>+ * Also, &drm_i915_gem_execbuffer2.batch_start_offset and
>>+ * &drm_i915_gem_execbuffer2.batch_len must be 0.
>>+ * DRM_I915_GEM_EXECBUFFER_EXT_BATCH_ADDRESSES extension must be provided
>>+ * to pass in the batch buffer addresses.
>>+ *
>>+ * Additionally, I915_EXEC_NO_RELOC, I915_EXEC_HANDLE_LUT and
>>+ * I915_EXEC_BATCH_FIRST of &drm_i915_gem_execbuffer2.flags must be 0
>>+ * (not used) in VM_BIND mode. I915_EXEC_USE_EXTENSIONS flag must always be
>>+ * set (See struct drm_i915_gem_execbuffer_ext_batch_addresses).
>>+ * The buffers_ptr, buffer_count, batch_start_offset and batch_len fields
>>+ * of struct drm_i915_gem_execbuffer2 are also not used and must be 0.
>>+ */
>>+#define I915_VM_CREATE_FLAGS_USE_VM_BIND	(1 << 0)
>>+
>>+/**
>>+ * DOC: I915_CONTEXT_CREATE_FLAGS_LONG_RUNNING
>>+ *
>>+ * Flag to declare context as long running.
>>+ * See struct drm_i915_gem_context_create_ext flags.
>>+ *
>>+ * Usage of dma-fence expects that they complete in reasonable amount of time.
>>+ * Compute on the other hand can be long running. Hence it is not appropriate
>>+ * for compute contexts to export request completion dma-fence to user.
>>+ * The dma-fence usage will be limited to in-kernel consumption only.
>>+ * Compute contexts need to use user/memory fence.
>>+ *
>>+ * So, long running contexts do not support output fences. Hence,
>>+ * I915_EXEC_FENCE_OUT (See &drm_i915_gem_execbuffer2.flags and
>>+ * I915_EXEC_FENCE_SIGNAL (See &drm_i915_gem_exec_fence.flags) are expected
>>+ * to be not used.
>>+ *
>>+ * DRM_I915_GEM_WAIT ioctl call is also not supported for objects mapped
>>+ * to long running contexts.
>>+ */
>>+#define I915_CONTEXT_CREATE_FLAGS_LONG_RUNNING   (1u << 2)
>>+
>>+/* VM_BIND related ioctls */
>>+#define DRM_I915_GEM_VM_BIND		0x3d
>>+#define DRM_I915_GEM_VM_UNBIND		0x3e
>>+#define DRM_I915_GEM_WAIT_USER_FENCE	0x3f
>>+
>>+#define DRM_IOCTL_I915_GEM_VM_BIND		DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_VM_BIND, struct drm_i915_gem_vm_bind)
>>+#define DRM_IOCTL_I915_GEM_VM_UNBIND		DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_VM_UNBIND, struct drm_i915_gem_vm_bind)
>>+#define DRM_IOCTL_I915_GEM_WAIT_USER_FENCE	DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_WAIT_USER_FENCE, struct drm_i915_gem_wait_user_fence)
>>+
>>+/**
>>+ * struct drm_i915_gem_vm_bind - VA to object mapping to bind.
>>+ *
>>+ * This structure is passed to VM_BIND ioctl and specifies the mapping of GPU
>>+ * virtual address (VA) range to the section of an object that should be bound
>>+ * in the device page table of the specified address space (VM).
>>+ * The VA range specified must be unique (ie., not currently bound) and can
>>+ * be mapped to whole object or a section of the object (partial binding).
>>+ * Multiple VA mappings can be created to the same section of the object
>>+ * (aliasing).
>>+ */
>>+struct drm_i915_gem_vm_bind {
>>+	/** @vm_id: VM (address space) id to bind */
>>+	__u32 vm_id;
>>+
>>+	/** @handle: Object handle */
>>+	__u32 handle;
>>+
>>+	/** @start: Virtual Address start to bind */
>>+	__u64 start;
>>+
>>+	/** @offset: Offset in object to bind */
>>+	__u64 offset;
>>+
>>+	/** @length: Length of mapping to bind */
>>+	__u64 length;
>
>Does it support, or should it, equivalent of EXEC_OBJECT_PAD_TO_SIZE? 
>Or if not userspace is expected to map the remainder of the space to a 
>dummy object? In which case would there be any alignment/padding 
>issues preventing the two bind to be placed next to each other?
>
>I ask because someone from the compute side asked me about a problem 
>with their strategy of dealing with overfetch and I suggested pad to 
>size.
>

Thanks Tvrtko,
I think we shouldn't be needing it. As with VM_BIND VA assignment
is completely pushed to userspace, no padding should be necessary
once the 'start' and 'size' alignment conditions are met.

I will add some documentation on alignment requirement here.
Generally, 'start' and 'size' should be 4K aligned. But, I think
when we have 64K lmem page sizes (dg2 and xehpsdv), they need to
be 64K aligned.

Niranjana

>Regards,
>
>Tvrtko
>
>>+
>>+	/**
>>+	 * @flags: Supported flags are,
>>+	 *
>>+	 * I915_GEM_VM_BIND_READONLY:
>>+	 * Mapping is read-only.
>>+	 *
>>+	 * I915_GEM_VM_BIND_CAPTURE:
>>+	 * Capture this mapping in the dump upon GPU error.
>>+	 */
>>+	__u64 flags;
>>+#define I915_GEM_VM_BIND_READONLY    (1 << 0)
>>+#define I915_GEM_VM_BIND_CAPTURE     (1 << 1)
>>+
>>+	/** @extensions: 0-terminated chain of extensions for this mapping. */
>>+	__u64 extensions;
>>+};
>>+
>>+/**
>>+ * struct drm_i915_gem_vm_unbind - VA to object mapping to unbind.
>>+ *
>>+ * This structure is passed to VM_UNBIND ioctl and specifies the GPU virtual
>>+ * address (VA) range that should be unbound from the device page table of the
>>+ * specified address space (VM). The specified VA range must match one of the
>>+ * mappings created with the VM_BIND ioctl. TLB is flushed upon unbind
>>+ * completion.
>>+ */
>>+struct drm_i915_gem_vm_unbind {
>>+	/** @vm_id: VM (address space) id to bind */
>>+	__u32 vm_id;
>>+
>>+	/** @rsvd: Reserved for future use; must be zero. */
>>+	__u32 rsvd;
>>+
>>+	/** @start: Virtual Address start to unbind */
>>+	__u64 start;
>>+
>>+	/** @length: Length of mapping to unbind */
>>+	__u64 length;
>>+
>>+	/** @flags: reserved for future usage, currently MBZ */
>>+	__u64 flags;
>>+
>>+	/** @extensions: 0-terminated chain of extensions for this mapping. */
>>+	__u64 extensions;
>>+};
>>+
>>+/**
>>+ * struct drm_i915_vm_bind_fence - An input or output fence for the vm_bind
>>+ * or the vm_unbind work.
>>+ *
>>+ * The vm_bind or vm_unbind aync worker will wait for input fence to signal
>>+ * before starting the binding or unbinding.
>>+ *
>>+ * The vm_bind or vm_unbind async worker will signal the returned output fence
>>+ * after the completion of binding or unbinding.
>>+ */
>>+struct drm_i915_vm_bind_fence {
>>+	/** @handle: User's handle for a drm_syncobj to wait on or signal. */
>>+	__u32 handle;
>>+
>>+	/**
>>+	 * @flags: Supported flags are,
>>+	 *
>>+	 * I915_VM_BIND_FENCE_WAIT:
>>+	 * Wait for the input fence before binding/unbinding
>>+	 *
>>+	 * I915_VM_BIND_FENCE_SIGNAL:
>>+	 * Return bind/unbind completion fence as output
>>+	 */
>>+	__u32 flags;
>>+#define I915_VM_BIND_FENCE_WAIT            (1<<0)
>>+#define I915_VM_BIND_FENCE_SIGNAL          (1<<1)
>>+#define __I915_VM_BIND_FENCE_UNKNOWN_FLAGS (-(I915_VM_BIND_FENCE_SIGNAL << 1))
>>+};
>>+
>>+/**
>>+ * struct drm_i915_vm_bind_ext_timeline_fences - Timeline fences for vm_bind
>>+ * and vm_unbind.
>>+ *
>>+ * This structure describes an array of timeline drm_syncobj and associated
>>+ * points for timeline variants of drm_syncobj. These timeline 'drm_syncobj's
>>+ * can be input or output fences (See struct drm_i915_vm_bind_fence).
>>+ */
>>+struct drm_i915_vm_bind_ext_timeline_fences {
>>+#define I915_VM_BIND_EXT_timeline_FENCES	0
>>+	/** @base: Extension link. See struct i915_user_extension. */
>>+	struct i915_user_extension base;
>>+
>>+	/**
>>+	 * @fence_count: Number of elements in the @handles_ptr & @value_ptr
>>+	 * arrays.
>>+	 */
>>+	__u64 fence_count;
>>+
>>+	/**
>>+	 * @handles_ptr: Pointer to an array of struct drm_i915_vm_bind_fence
>>+	 * of length @fence_count.
>>+	 */
>>+	__u64 handles_ptr;
>>+
>>+	/**
>>+	 * @values_ptr: Pointer to an array of u64 values of length
>>+	 * @fence_count.
>>+	 * Values must be 0 for a binary drm_syncobj. A Value of 0 for a
>>+	 * timeline drm_syncobj is invalid as it turns a drm_syncobj into a
>>+	 * binary one.
>>+	 */
>>+	__u64 values_ptr;
>>+};
>>+
>>+/**
>>+ * struct drm_i915_vm_bind_user_fence - An input or output user fence for the
>>+ * vm_bind or the vm_unbind work.
>>+ *
>>+ * The vm_bind or vm_unbind aync worker will wait for the input fence (value at
>>+ * @addr to become equal to @val) before starting the binding or unbinding.
>>+ *
>>+ * The vm_bind or vm_unbind async worker will signal the output fence after
>>+ * the completion of binding or unbinding by writing @val to memory location at
>>+ * @addr
>>+ */
>>+struct drm_i915_vm_bind_user_fence {
>>+	/** @addr: User/Memory fence qword aligned process virtual address */
>>+	__u64 addr;
>>+
>>+	/** @val: User/Memory fence value to be written after bind completion */
>>+	__u64 val;
>>+
>>+	/**
>>+	 * @flags: Supported flags are,
>>+	 *
>>+	 * I915_VM_BIND_USER_FENCE_WAIT:
>>+	 * Wait for the input fence before binding/unbinding
>>+	 *
>>+	 * I915_VM_BIND_USER_FENCE_SIGNAL:
>>+	 * Return bind/unbind completion fence as output
>>+	 */
>>+	__u32 flags;
>>+#define I915_VM_BIND_USER_FENCE_WAIT            (1<<0)
>>+#define I915_VM_BIND_USER_FENCE_SIGNAL          (1<<1)
>>+#define __I915_VM_BIND_USER_FENCE_UNKNOWN_FLAGS \
>>+	(-(I915_VM_BIND_USER_FENCE_SIGNAL << 1))
>>+};
>>+
>>+/**
>>+ * struct drm_i915_vm_bind_ext_user_fence - User/memory fences for vm_bind
>>+ * and vm_unbind.
>>+ *
>>+ * These user fences can be input or output fences
>>+ * (See struct drm_i915_vm_bind_user_fence).
>>+ */
>>+struct drm_i915_vm_bind_ext_user_fence {
>>+#define I915_VM_BIND_EXT_USER_FENCES	1
>>+	/** @base: Extension link. See struct i915_user_extension. */
>>+	struct i915_user_extension base;
>>+
>>+	/** @fence_count: Number of elements in the @user_fence_ptr array. */
>>+	__u64 fence_count;
>>+
>>+	/**
>>+	 * @user_fence_ptr: Pointer to an array of
>>+	 * struct drm_i915_vm_bind_user_fence of length @fence_count.
>>+	 */
>>+	__u64 user_fence_ptr;
>>+};
>>+
>>+/**
>>+ * struct drm_i915_gem_execbuffer_ext_batch_addresses - Array of batch buffer
>>+ * gpu virtual addresses.
>>+ *
>>+ * In the execbuff ioctl (See struct drm_i915_gem_execbuffer2), this extension
>>+ * must always be appended in the VM_BIND mode and it will be an error to
>>+ * append this extension in older non-VM_BIND mode.
>>+ */
>>+struct drm_i915_gem_execbuffer_ext_batch_addresses {
>>+#define DRM_I915_GEM_EXECBUFFER_EXT_BATCH_ADDRESSES	1
>>+	/** @base: Extension link. See struct i915_user_extension. */
>>+	struct i915_user_extension base;
>>+
>>+	/** @count: Number of addresses in the addr array. */
>>+	__u32 count;
>>+
>>+	/** @addr: An array of batch gpu virtual addresses. */
>>+	__u64 addr[0];
>>+};
>>+
>>+/**
>>+ * struct drm_i915_gem_execbuffer_ext_user_fence - First level batch completion
>>+ * signaling extension.
>>+ *
>>+ * This extension allows user to attach a user fence (@addr, @value pair) to an
>>+ * execbuf to be signaled by the command streamer after the completion of first
>>+ * level batch, by writing the @value at specified @addr and triggering an
>>+ * interrupt.
>>+ * User can either poll for this user fence to signal or can also wait on it
>>+ * with i915_gem_wait_user_fence ioctl.
>>+ * This is very much usefaul for long running contexts where waiting on dma-fence
>>+ * by user (like i915_gem_wait ioctl) is not supported.
>>+ */
>>+struct drm_i915_gem_execbuffer_ext_user_fence {
>>+#define DRM_I915_GEM_EXECBUFFER_EXT_USER_FENCE		2
>>+	/** @base: Extension link. See struct i915_user_extension. */
>>+	struct i915_user_extension base;
>>+
>>+	/**
>>+	 * @addr: User/Memory fence qword aligned GPU virtual address.
>>+	 *
>>+	 * Address has to be a valid GPU virtual address at the time of
>>+	 * first level batch completion.
>>+	 */
>>+	__u64 addr;
>>+
>>+	/**
>>+	 * @value: User/Memory fence Value to be written to above address
>>+	 * after first level batch completes.
>>+	 */
>>+	__u64 value;
>>+
>>+	/** @rsvd: Reserved for future extensions, MBZ */
>>+	__u64 rsvd;
>>+};
>>+
>>+/**
>>+ * struct drm_i915_gem_create_ext_vm_private - Extension to make the object
>>+ * private to the specified VM.
>>+ *
>>+ * See struct drm_i915_gem_create_ext.
>>+ */
>>+struct drm_i915_gem_create_ext_vm_private {
>>+#define I915_GEM_CREATE_EXT_VM_PRIVATE		2
>>+	/** @base: Extension link. See struct i915_user_extension. */
>>+	struct i915_user_extension base;
>>+
>>+	/** @vm_id: Id of the VM to which the object is private */
>>+	__u32 vm_id;
>>+};
>>+
>>+/**
>>+ * struct drm_i915_gem_wait_user_fence - Wait on user/memory fence.
>>+ *
>>+ * User/Memory fence can be woken up either by:
>>+ *
>>+ * 1. GPU context indicated by @ctx_id, or,
>>+ * 2. Kerrnel driver async worker upon I915_UFENCE_WAIT_SOFT.
>>+ *    @ctx_id is ignored when this flag is set.
>>+ *
>>+ * Wakeup condition is,
>>+ * ``((*addr & mask) op (value & mask))``
>>+ *
>>+ * See :ref:`Documentation/driver-api/dma-buf.rst <indefinite_dma_fences>`
>>+ */
>>+struct drm_i915_gem_wait_user_fence {
>>+	/** @extensions: Zero-terminated chain of extensions. */
>>+	__u64 extensions;
>>+
>>+	/** @addr: User/Memory fence address */
>>+	__u64 addr;
>>+
>>+	/** @ctx_id: Id of the Context which will signal the fence. */
>>+	__u32 ctx_id;
>>+
>>+	/** @op: Wakeup condition operator */
>>+	__u16 op;
>>+#define I915_UFENCE_WAIT_EQ      0
>>+#define I915_UFENCE_WAIT_NEQ     1
>>+#define I915_UFENCE_WAIT_GT      2
>>+#define I915_UFENCE_WAIT_GTE     3
>>+#define I915_UFENCE_WAIT_LT      4
>>+#define I915_UFENCE_WAIT_LTE     5
>>+#define I915_UFENCE_WAIT_BEFORE  6
>>+#define I915_UFENCE_WAIT_AFTER   7
>>+
>>+	/**
>>+	 * @flags: Supported flags are,
>>+	 *
>>+	 * I915_UFENCE_WAIT_SOFT:
>>+	 *
>>+	 * To be woken up by i915 driver async worker (not by GPU).
>>+	 *
>>+	 * I915_UFENCE_WAIT_ABSTIME:
>>+	 *
>>+	 * Wait timeout specified as absolute time.
>>+	 */
>>+	__u16 flags;
>>+#define I915_UFENCE_WAIT_SOFT    0x1
>>+#define I915_UFENCE_WAIT_ABSTIME 0x2
>>+
>>+	/** @value: Wakeup value */
>>+	__u64 value;
>>+
>>+	/** @mask: Wakeup mask */
>>+	__u64 mask;
>>+#define I915_UFENCE_WAIT_U8     0xffu
>>+#define I915_UFENCE_WAIT_U16    0xffffu
>>+#define I915_UFENCE_WAIT_U32    0xfffffffful
>>+#define I915_UFENCE_WAIT_U64    0xffffffffffffffffull
>>+
>>+	/**
>>+	 * @timeout: Wait timeout in nanoseconds.
>>+	 *
>>+	 * If I915_UFENCE_WAIT_ABSTIME flag is set, then time timeout is the
>>+	 * absolute time in nsec.
>>+	 */
>>+	__s64 timeout;
>>+};
