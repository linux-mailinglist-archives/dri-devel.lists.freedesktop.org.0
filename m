Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B00475543C1
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 10:10:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7722A10EBBE;
	Wed, 22 Jun 2022 08:10:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10A3B10E4B0;
 Wed, 22 Jun 2022 08:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655885412; x=1687421412;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=uhpw9i4Ix/9DQLqq4yvXsjKVMFT/x7D3gTQ4Rzu8hiw=;
 b=BCo03XOtnLyR27/OH0rpjjnp0HXoBe5sFGWyIfUXUJTsWGp4j6aD7Rzc
 zxdP4/WkogNkjWz54nM22qua2rpKvJZYsHzTQS1+m737lNwUlmmh/rpVf
 M7nP2mtCC81txES+saq9KQWS2xNRwoerJdsHBXb7aTLZ6dB8kg2/lJzjb
 zb9Fnsb1yduwHWSlbOpe0ICv9y4gSe++ULNR49Ng4doyIacu4LW38zMcR
 1gT8iyugiugEsMUcSo5CYYCGTebRdCNeySGD/RlnDwidRw4Kbv8Pu/m9/
 xBsykzfdWQOy3iVvIiqiFooTlXQUW4sC5IchYn8L88SeFOFLI/pqkqdo8 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="263383987"
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="263383987"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 01:10:11 -0700
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="615071703"
Received: from ebrazil-mobl1.amr.corp.intel.com (HELO [10.213.200.60])
 ([10.213.200.60])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 01:10:09 -0700
Message-ID: <6ac2f495-8ead-4824-f9af-1c03fb3770c4@linux.intel.com>
Date: Wed, 22 Jun 2022 09:10:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [Intel-gfx] [PATCH v3 3/3] drm/doc/rfc: VM_BIND uapi definition
Content-Language: en-US
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20220622035650.29256-1-niranjana.vishwanathapura@intel.com>
 <20220622035650.29256-4-niranjana.vishwanathapura@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220622035650.29256-4-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: paulo.r.zanoni@intel.com, chris.p.wilson@intel.com,
 thomas.hellstrom@intel.com, matthew.auld@intel.com, daniel.vetter@intel.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 22/06/2022 04:56, Niranjana Vishwanathapura wrote:
> VM_BIND and related uapi definitions
> 
> v2: Reduce the scope to simple Mesa use case.
> v3: Expand VM_UNBIND documentation and add
>      I915_GEM_VM_BIND/UNBIND_FENCE_VALID
>      and I915_GEM_VM_BIND_TLB_FLUSH flags.
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>   Documentation/gpu/rfc/i915_vm_bind.h | 243 +++++++++++++++++++++++++++
>   1 file changed, 243 insertions(+)
>   create mode 100644 Documentation/gpu/rfc/i915_vm_bind.h
> 
> diff --git a/Documentation/gpu/rfc/i915_vm_bind.h b/Documentation/gpu/rfc/i915_vm_bind.h
> new file mode 100644
> index 000000000000..fa23b2d7ec6f
> --- /dev/null
> +++ b/Documentation/gpu/rfc/i915_vm_bind.h
> @@ -0,0 +1,243 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2022 Intel Corporation
> + */
> +
> +/**
> + * DOC: I915_PARAM_HAS_VM_BIND
> + *
> + * VM_BIND feature availability.
> + * See typedef drm_i915_getparam_t param.
> + */
> +#define I915_PARAM_HAS_VM_BIND		57
> +
> +/**
> + * DOC: I915_VM_CREATE_FLAGS_USE_VM_BIND
> + *
> + * Flag to opt-in for VM_BIND mode of binding during VM creation.
> + * See struct drm_i915_gem_vm_control flags.
> + *
> + * The older execbuf2 ioctl will not support VM_BIND mode of operation.
> + * For VM_BIND mode, we have new execbuf3 ioctl which will not accept any
> + * execlist (See struct drm_i915_gem_execbuffer3 for more details).
> + *
> + */
> +#define I915_VM_CREATE_FLAGS_USE_VM_BIND	(1 << 0)
> +
> +/* VM_BIND related ioctls */
> +#define DRM_I915_GEM_VM_BIND		0x3d
> +#define DRM_I915_GEM_VM_UNBIND		0x3e
> +#define DRM_I915_GEM_EXECBUFFER3	0x3f
> +
> +#define DRM_IOCTL_I915_GEM_VM_BIND		DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_VM_BIND, struct drm_i915_gem_vm_bind)
> +#define DRM_IOCTL_I915_GEM_VM_UNBIND		DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_VM_UNBIND, struct drm_i915_gem_vm_bind)
> +#define DRM_IOCTL_I915_GEM_EXECBUFFER3		DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_EXECBUFFER3, struct drm_i915_gem_execbuffer3)
> +
> +/**
> + * struct drm_i915_gem_vm_bind_fence - Bind/unbind completion notification.
> + *
> + * A timeline out fence for vm_bind/unbind completion notification.
> + */
> +struct drm_i915_gem_vm_bind_fence {
> +	/** @handle: User's handle for a drm_syncobj to signal. */
> +	__u32 handle;
> +
> +	/** @rsvd: Reserved, MBZ */
> +	__u32 rsvd;
> +
> +	/**
> +	 * @value: A point in the timeline.
> +	 * Value must be 0 for a binary drm_syncobj. A Value of 0 for a
> +	 * timeline drm_syncobj is invalid as it turns a drm_syncobj into a
> +	 * binary one.
> +	 */
> +	__u64 value;
> +};
> +
> +/**
> + * struct drm_i915_gem_vm_bind - VA to object mapping to bind.
> + *
> + * This structure is passed to VM_BIND ioctl and specifies the mapping of GPU
> + * virtual address (VA) range to the section of an object that should be bound
> + * in the device page table of the specified address space (VM).
> + * The VA range specified must be unique (ie., not currently bound) and can
> + * be mapped to whole object or a section of the object (partial binding).
> + * Multiple VA mappings can be created to the same section of the object
> + * (aliasing).
> + *
> + * The @start, @offset and @length should be 4K page aligned. However the DG2
> + * and XEHPSDV has 64K page size for device local-memory and has compact page
> + * table. On those platforms, for binding device local-memory objects, the
> + * @start should be 2M aligned, @offset and @length should be 64K aligned.

Should some error codes be documented and has the ability to 
programmatically probe the alignment restrictions been considered?

> + * Also, on those platforms, it is not allowed to bind an device local-memory
> + * object and a system memory object in a single 2M section of VA range.

Text should be clear whether "not allowed" means there will be an error 
returned, or it will appear to work but bad things will happen.

> + */
> +struct drm_i915_gem_vm_bind {
> +	/** @vm_id: VM (address space) id to bind */
> +	__u32 vm_id;
> +
> +	/** @handle: Object handle */
> +	__u32 handle;
> +
> +	/** @start: Virtual Address start to bind */
> +	__u64 start;
> +
> +	/** @offset: Offset in object to bind */
> +	__u64 offset;
> +
> +	/** @length: Length of mapping to bind */
> +	__u64 length;
> +
> +	/**
> +	 * @flags: Supported flags are:
> +	 *
> +	 * I915_GEM_VM_BIND_FENCE_VALID:
> +	 * @fence is valid, needs bind completion notification.
> +	 *
> +	 * I915_GEM_VM_BIND_READONLY:
> +	 * Mapping is read-only.
> +	 *
> +	 * I915_GEM_VM_BIND_CAPTURE:
> +	 * Capture this mapping in the dump upon GPU error.
> +	 *
> +	 * I915_GEM_VM_BIND_TLB_FLUSH:
> +	 * Flush the TLB for the specified range after bind completion.
> +	 */
> +	__u64 flags;
> +#define I915_GEM_VM_BIND_FENCE_VALID	(1 << 0)
> +#define I915_GEM_VM_BIND_READONLY	(1 << 1)
> +#define I915_GEM_VM_BIND_CAPTURE	(1 << 2)
> +#define I915_GEM_VM_BIND_TLB_FLUSH	(1 << 2)

What is the use case for allowing any random user to play with (global) 
TLB flushing?

> +
> +	/** @fence: Timeline fence for bind completion signaling */
> +	struct drm_i915_gem_vm_bind_fence fence;

As agreed the other day - please document in the main kerneldoc section 
that all (un)binds are executed asynchronously and out of order.

> +
> +	/** @extensions: 0-terminated chain of extensions */
> +	__u64 extensions;
> +};
> +
> +/**
> + * struct drm_i915_gem_vm_unbind - VA to object mapping to unbind.
> + *
> + * This structure is passed to VM_UNBIND ioctl and specifies the GPU virtual
> + * address (VA) range that should be unbound from the device page table of the
> + * specified address space (VM). The specified VA range must match one of the
> + * mappings created with the VM_BIND ioctl. TLB is flushed upon unbind
> + * completion. The unbind operation will force unbind the specified 

Do we want to provide TLB flushing guarantees here and why? (As opposed 
to leaving them for implementation details.) If there is no implied 
order in either binds/unbinds, or between the two intermixed, then what 
is the point of guaranteeing a TLB flush on unbind completion?

range from
> + * device page table without waiting for any GPU job to complete. It is UMDs
> + * responsibility to ensure the mapping is no longer in use before calling
> + * VM_UNBIND.
> + *
> + * The @start and @length musy specify a unique mapping bound with VM_BIND
> + * ioctl.
> + */
> +struct drm_i915_gem_vm_unbind {
> +	/** @vm_id: VM (address space) id to bind */
> +	__u32 vm_id;
> +
> +	/** @rsvd: Reserved, MBZ */
> +	__u32 rsvd;
> +
> +	/** @start: Virtual Address start to unbind */
> +	__u64 start;
> +
> +	/** @length: Length of mapping to unbind */
> +	__u64 length;
> +
> +	/**
> +	 * @flags: Supported flags are:
> +	 *
> +	 * I915_GEM_VM_UNBIND_FENCE_VALID:
> +	 * @fence is valid, needs unbind completion notification.
> +	 */
> +	__u64 flags;
> +#define I915_GEM_VM_UNBIND_FENCE_VALID	(1 << 0)
> +
> +	/** @fence: Timeline fence for unbind completion signaling */
> +	struct drm_i915_gem_vm_bind_fence fence;

I am not sure the simplified ioctl story is super coherent. If 
everything is now fully async and out of order, but the input fence has 
been dropped, then how is userspace supposed to handle the address 
space? It will have to wait (in userspace) for unbinds to complete 
before submitting subsequent binds which use the same VA range.

Maybe that's passable, but then the fact execbuf3 has no input fence 
suggests a userspace wait between it and binds. And I am pretty sure 
historically those were always quite bad for performance.

Presumably userspace clients are happy with no input fences or it was 
considered to costly to implement it?

Regards,

Tvrtko

> +
> +	/** @extensions: 0-terminated chain of extensions */
> +	__u64 extensions;
> +};
> +
> +/**
> + * struct drm_i915_gem_execbuffer3 - Structure for DRM_I915_GEM_EXECBUFFER3
> + * ioctl.
> + *
> + * DRM_I915_GEM_EXECBUFFER3 ioctl only works in VM_BIND mode and VM_BIND mode
> + * only works with this ioctl for submission.
> + * See I915_VM_CREATE_FLAGS_USE_VM_BIND.
> + */
> +struct drm_i915_gem_execbuffer3 {
> +	/**
> +	 * @ctx_id: Context id
> +	 *
> +	 * Only contexts with user engine map are allowed.
> +	 */
> +	__u32 ctx_id;
> +
> +	/**
> +	 * @engine_idx: Engine index
> +	 *
> +	 * An index in the user engine map of the context specified by @ctx_id.
> +	 */
> +	__u32 engine_idx;
> +
> +	/** @rsvd1: Reserved, MBZ */
> +	__u32 rsvd1;
> +
> +	/**
> +	 * @batch_count: Number of batches in @batch_address array.
> +	 *
> +	 * 0 is invalid. For parallel submission, it should be equal to the
> +	 * number of (parallel) engines involved in that submission.
> +	 */
> +	__u32 batch_count;
> +
> +	/**
> +	 * @batch_address: Array of batch gpu virtual addresses.
> +	 *
> +	 * If @batch_count is 1, then it is the gpu virtual address of the
> +	 * batch buffer. If @batch_count > 1, then it is a pointer to an array
> +	 * of batch buffer gpu virtual addresses.
> +	 */
> +	__u64 batch_address;
> +
> +	/**
> +	 * @flags: Supported flags are:
> +	 *
> +	 * I915_EXEC3_SECURE:
> +	 * Request a privileged ("secure") batch buffer/s.
> +	 * It is only available for DRM_ROOT_ONLY | DRM_MASTER processes.
> +	 */
> +	__u64 flags;
> +#define I915_EXEC3_SECURE	(1<<0)
> +
> +	/** @rsvd2: Reserved, MBZ */
> +	__u64 rsvd2;
> +
> +	/**
> +	 * @extensions: Zero-terminated chain of extensions.
> +	 *
> +	 * DRM_I915_GEM_EXECBUFFER3_EXT_TIMELINE_FENCES:
> +	 * It has same format as DRM_I915_GEM_EXECBUFFER_EXT_TIMELINE_FENCES.
> +	 * See struct drm_i915_gem_execbuffer_ext_timeline_fences.
> +	 */
> +	__u64 extensions;
> +#define DRM_I915_GEM_EXECBUFFER3_EXT_TIMELINE_FENCES	0
> +};
> +
> +/**
> + * struct drm_i915_gem_create_ext_vm_private - Extension to make the object
> + * private to the specified VM.
> + *
> + * See struct drm_i915_gem_create_ext.
> + */
> +struct drm_i915_gem_create_ext_vm_private {
> +#define I915_GEM_CREATE_EXT_VM_PRIVATE		2
> +	/** @base: Extension link. See struct i915_user_extension. */
> +	struct i915_user_extension base;
> +
> +	/** @vm_id: Id of the VM to which the object is private */
> +	__u32 vm_id;
> +};
