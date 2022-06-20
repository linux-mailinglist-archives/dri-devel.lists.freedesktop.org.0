Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A838F5521BA
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 17:59:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CAF210E550;
	Mon, 20 Jun 2022 15:59:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D01210E52F;
 Mon, 20 Jun 2022 15:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655740749; x=1687276749;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=a06f4exqQQBqaYbiaFsOMsV7S0pQlF+RmFkXpQEopiU=;
 b=nt/KlJjFKjvPHSeR3phpI1H0U6ATjB52h9tbsjO4NfwjQyZNZrRts2KV
 n0nEEuTKKogjMWov1k/Vi3ggX1NIz5x2DS4/NEKp3Ro0vCnJjIdzRsKOq
 RShQNOUET1QRAu6T84CwMJ2XuHqq/FLETD73S6zbw6Ap+A5As1Q+/I5Bn
 Q+uBsO605oRzhoQR9lJKxYfTp8lWk20MfejEkVGBFlZKbKEYsFbUKIjvO
 qVC3Ers9xom8IYfKLgQraQs4u3j3qXL8zgZpqSQ41bS92bvWXE1DBncCV
 xupzhDZzW5NLfGbV9Cr+y0qnOI7yecZHJ/TkOzCQY55Z1OgcUU1RhksBc Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10384"; a="260361390"
X-IronPort-AV: E=Sophos;i="5.92,207,1650956400"; d="scan'208";a="260361390"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2022 08:59:08 -0700
X-IronPort-AV: E=Sophos;i="5.92,207,1650956400"; d="scan'208";a="643181526"
Received: from nvishwa1-desk.sc.intel.com (HELO nvishwa1-DESK) ([172.25.29.76])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2022 08:59:07 -0700
Date: Mon, 20 Jun 2022 08:58:47 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: "Zeng, Oak" <oak.zeng@intel.com>
Subject: Re: [PATCH v2 3/3] drm/doc/rfc: VM_BIND uapi definition
Message-ID: <20220620155846.GV376@nvishwa1-DESK>
References: <20220617051445.8901-1-niranjana.vishwanathapura@intel.com>
 <20220617051445.8901-4-niranjana.vishwanathapura@intel.com>
 <BN6PR11MB163332A00FE2C889C9C4956792B09@BN6PR11MB1633.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BN6PR11MB163332A00FE2C889C9C4956792B09@BN6PR11MB1633.namprd11.prod.outlook.com>
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
Cc: "Brost, Matthew" <matthew.brost@intel.com>, "Zanoni,
 Paulo R" <paulo.r.zanoni@intel.com>, "Landwerlin,
 Lionel G" <lionel.g.landwerlin@intel.com>, "Ursulin,
 Tvrtko" <tvrtko.ursulin@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Wilson,
 Chris P" <chris.p.wilson@intel.com>, "Hellstrom,
 Thomas" <thomas.hellstrom@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "jason@jlekstrand.net" <jason@jlekstrand.net>, "Vetter,
 Daniel" <daniel.vetter@intel.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>, "Auld,
 Matthew" <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 20, 2022 at 07:42:25AM -0700, Zeng, Oak wrote:
>
>
>Thanks,
>Oak
>
>> -----Original Message-----
>> From: Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>
>> Sent: June 17, 2022 1:15 AM
>> To: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; Vetter,
>> Daniel <daniel.vetter@intel.com>
>> Cc: Hellstrom, Thomas <thomas.hellstrom@intel.com>; Wilson, Chris P
>> <chris.p.wilson@intel.com>; jason@jlekstrand.net;
>> christian.koenig@amd.com; Brost, Matthew <matthew.brost@intel.com>;
>> Ursulin, Tvrtko <tvrtko.ursulin@intel.com>; Auld, Matthew
>> <matthew.auld@intel.com>; Landwerlin, Lionel G
>> <lionel.g.landwerlin@intel.com>; Zanoni, Paulo R
>> <paulo.r.zanoni@intel.com>; Zeng, Oak <oak.zeng@intel.com>
>> Subject: [PATCH v2 3/3] drm/doc/rfc: VM_BIND uapi definition
>>
>> VM_BIND and related uapi definitions
>>
>> v2: Reduce the scope to simple Mesa use case.
>>
>> Signed-off-by: Niranjana Vishwanathapura
>> <niranjana.vishwanathapura@intel.com>
>> ---
>>  Documentation/gpu/rfc/i915_vm_bind.h | 226
>> +++++++++++++++++++++++++++
>>  1 file changed, 226 insertions(+)
>>  create mode 100644 Documentation/gpu/rfc/i915_vm_bind.h
>>
>> diff --git a/Documentation/gpu/rfc/i915_vm_bind.h
>> b/Documentation/gpu/rfc/i915_vm_bind.h
>> new file mode 100644
>> index 000000000000..b7540ddb526d
>> --- /dev/null
>> +++ b/Documentation/gpu/rfc/i915_vm_bind.h
>> @@ -0,0 +1,226 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2022 Intel Corporation
>> + */
>> +
>> +/**
>> + * DOC: I915_PARAM_HAS_VM_BIND
>> + *
>> + * VM_BIND feature availability.
>> + * See typedef drm_i915_getparam_t param.
>> + */
>> +#define I915_PARAM_HAS_VM_BIND               57
>> +
>> +/**
>> + * DOC: I915_VM_CREATE_FLAGS_USE_VM_BIND
>> + *
>> + * Flag to opt-in for VM_BIND mode of binding during VM creation.
>> + * See struct drm_i915_gem_vm_control flags.
>> + *
>> + * The older execbuf2 ioctl will not support VM_BIND mode of operation.
>> + * For VM_BIND mode, we have new execbuf3 ioctl which will not accept
>> any
>> + * execlist (See struct drm_i915_gem_execbuffer3 for more details).
>> + *
>> + */
>> +#define I915_VM_CREATE_FLAGS_USE_VM_BIND     (1 << 0)
>> +
>> +/* VM_BIND related ioctls */
>> +#define DRM_I915_GEM_VM_BIND         0x3d
>> +#define DRM_I915_GEM_VM_UNBIND               0x3e
>> +#define DRM_I915_GEM_EXECBUFFER3     0x3f
>> +
>> +#define DRM_IOCTL_I915_GEM_VM_BIND
>>       DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_VM_BIND,
>> struct drm_i915_gem_vm_bind)
>> +#define DRM_IOCTL_I915_GEM_VM_UNBIND
>>       DRM_IOWR(DRM_COMMAND_BASE +
>> DRM_I915_GEM_VM_UNBIND, struct drm_i915_gem_vm_bind)
>> +#define DRM_IOCTL_I915_GEM_EXECBUFFER3
>>       DRM_IOWR(DRM_COMMAND_BASE +
>> DRM_I915_GEM_EXECBUFFER3, struct drm_i915_gem_execbuffer3)
>> +
>> +/**
>> + * struct drm_i915_gem_vm_bind_fence - Bind/unbind completion
>> notification.
>> + *
>> + * A timeline out fence for vm_bind/unbind completion notification.
>> + */
>> +struct drm_i915_gem_vm_bind_fence {
>> +     /** @handle: User's handle for a drm_syncobj to signal. */
>> +     __u32 handle;
>> +
>> +     /** @rsvd: Reserved, MBZ */
>> +     __u32 rsvd;
>> +
>> +     /**
>> +      * @value: A point in the timeline.
>> +      * Value must be 0 for a binary drm_syncobj. A Value of 0 for a
>> +      * timeline drm_syncobj is invalid as it turns a drm_syncobj into a
>> +      * binary one.
>> +      */
>> +     __u64 value;
>> +};
>> +
>> +/**
>> + * struct drm_i915_gem_vm_bind - VA to object mapping to bind.
>> + *
>> + * This structure is passed to VM_BIND ioctl and specifies the mapping of
>> GPU
>> + * virtual address (VA) range to the section of an object that should be
>> bound
>> + * in the device page table of the specified address space (VM).
>> + * The VA range specified must be unique (ie., not currently bound) and can
>> + * be mapped to whole object or a section of the object (partial binding).
>> + * Multiple VA mappings can be created to the same section of the object
>> + * (aliasing).
>> + *
>> + * The @start, @offset and @length should be 4K page aligned. However
>> the DG2
>> + * and XEHPSDV has 64K page size for device local-memory and has compact
>> page
>> + * table. On those platforms, for binding device local-memory objects, the
>> + * @start should be 2M aligned, @offset and @length should be 64K aligned.
>> + * Also, on those platforms, it is not allowed to bind an device local-memory
>> + * object and a system memory object in a single 2M section of VA range.
>> + */
>> +struct drm_i915_gem_vm_bind {
>> +     /** @vm_id: VM (address space) id to bind */
>> +     __u32 vm_id;
>> +
>> +     /** @handle: Object handle */
>> +     __u32 handle;
>> +
>> +     /** @start: Virtual Address start to bind */
>> +     __u64 start;
>> +
>> +     /** @offset: Offset in object to bind */
>> +     __u64 offset;
>> +
>> +     /** @length: Length of mapping to bind */
>> +     __u64 length;
>> +
>> +     /**
>> +      * @flags: Supported flags are:
>> +      *
>> +      * I915_GEM_VM_BIND_READONLY:
>> +      * Mapping is read-only.
>> +      *
>> +      * I915_GEM_VM_BIND_CAPTURE:
>> +      * Capture this mapping in the dump upon GPU error.
>> +      */
>> +     __u64 flags;
>> +#define I915_GEM_VM_BIND_READONLY    (1 << 0)
>
>Should we define another flag for DEVICE_ATOMIC? Without this flag, do you imply all the mapping support device atomic operation?
>HW platform also has an implication to device atomic, i.e., some platform don't support device atomics to system memory.
>

Thanks Oak, we can always add required flags later when we want to add the support.

Niranjana

>Regards,
>Oak
>
>> +#define I915_GEM_VM_BIND_CAPTURE     (1 << 1)
>> +
>> +     /** @fence: Timeline fence for bind completion signaling */
>> +     struct drm_i915_gem_vm_bind_fence fence;
>> +
>> +     /** @extensions: 0-terminated chain of extensions */
>> +     __u64 extensions;
>> +};
>> +
>> +/**
>> + * struct drm_i915_gem_vm_unbind - VA to object mapping to unbind.
>> + *
>> + * This structure is passed to VM_UNBIND ioctl and specifies the GPU virtual
>> + * address (VA) range that should be unbound from the device page table
>> of the
>> + * specified address space (VM). The specified VA range must match one of
>> the
>> + * mappings created with the VM_BIND ioctl. TLB is flushed upon unbind
>> + * completion.
>> + *
>> + * The @start and @length musy specify a unique mapping bound with
>> VM_BIND
>> + * ioctl.
>> + */
>> +struct drm_i915_gem_vm_unbind {
>> +     /** @vm_id: VM (address space) id to bind */
>> +     __u32 vm_id;
>> +
>> +     /** @rsvd: Reserved, MBZ */
>> +     __u32 rsvd;
>> +
>> +     /** @start: Virtual Address start to unbind */
>> +     __u64 start;
>> +
>> +     /** @length: Length of mapping to unbind */
>> +     __u64 length;
>> +
>> +     /** @flags: Reserved for future usage, currently MBZ */
>> +     __u64 flags;
>> +
>> +     /** @fence: Timeline fence for unbind completion signaling */
>> +     struct drm_i915_gem_vm_bind_fence fence;
>> +
>> +     /** @extensions: 0-terminated chain of extensions */
>> +     __u64 extensions;
>> +};
>> +
>> +/**
>> + * struct drm_i915_gem_execbuffer3 - Structure for
>> DRM_I915_GEM_EXECBUFFER3
>> + * ioctl.
>> + *
>> + * DRM_I915_GEM_EXECBUFFER3 ioctl only works in VM_BIND mode and
>> VM_BIND mode
>> + * only works with this ioctl for submission.
>> + * See I915_VM_CREATE_FLAGS_USE_VM_BIND.
>> + */
>> +struct drm_i915_gem_execbuffer3 {
>> +     /**
>> +      * @ctx_id: Context id
>> +      *
>> +      * Only contexts with user engine map are allowed.
>> +      */
>> +     __u32 ctx_id;
>> +
>> +     /**
>> +      * @engine_idx: Engine index
>> +      *
>> +      * An index in the user engine map of the context specified by
>> @ctx_id.
>> +      */
>> +     __u32 engine_idx;
>> +
>> +     /** @rsvd1: Reserved, MBZ */
>> +     __u32 rsvd1;
>> +
>> +     /**
>> +      * @batch_count: Number of batches in @batch_address array.
>> +      *
>> +      * 0 is invalid. For parallel submission, it should be equal to the
>> +      * number of (parallel) engines involved in that submission.
>> +      */
>> +     __u32 batch_count;
>> +
>> +     /**
>> +      * @batch_address: Array of batch gpu virtual addresses.
>> +      *
>> +      * If @batch_count is 1, then it is the gpu virtual address of the
>> +      * batch buffer. If @batch_count > 1, then it is a pointer to an array
>> +      * of batch buffer gpu virtual addresses.
>> +      */
>> +     __u64 batch_address;
>> +
>> +     /**
>> +      * @flags: Supported flags are:
>> +      *
>> +      * I915_EXEC3_SECURE:
>> +      * Request a privileged ("secure") batch buffer/s.
>> +      * It is only available for DRM_ROOT_ONLY | DRM_MASTER
>> processes.
>> +      */
>> +     __u64 flags;
>> +#define I915_EXEC3_SECURE    (1<<0)
>> +
>> +     /** @rsvd2: Reserved, MBZ */
>> +     __u64 rsvd2;
>> +
>> +     /**
>> +      * @extensions: Zero-terminated chain of extensions.
>> +      *
>> +      * DRM_I915_GEM_EXECBUFFER3_EXT_TIMELINE_FENCES:
>> +      * It has same format as
>> DRM_I915_GEM_EXECBUFFER_EXT_TIMELINE_FENCES.
>> +      * See struct drm_i915_gem_execbuffer_ext_timeline_fences.
>> +      */
>> +     __u64 extensions;
>> +#define DRM_I915_GEM_EXECBUFFER3_EXT_TIMELINE_FENCES 0
>> +};
>> +
>> +/**
>> + * struct drm_i915_gem_create_ext_vm_private - Extension to make the
>> object
>> + * private to the specified VM.
>> + *
>> + * See struct drm_i915_gem_create_ext.
>> + */
>> +struct drm_i915_gem_create_ext_vm_private {
>> +#define I915_GEM_CREATE_EXT_VM_PRIVATE               2
>> +     /** @base: Extension link. See struct i915_user_extension. */
>> +     struct i915_user_extension base;
>> +
>> +     /** @vm_id: Id of the VM to which the object is private */
>> +     __u32 vm_id;
>> +};
>> --
>> 2.21.0.rc0.32.g243a4c7e27
>
