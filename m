Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE495459A6
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 03:44:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D9F310EC04;
	Fri, 10 Jun 2022 01:44:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1751F10EC04;
 Fri, 10 Jun 2022 01:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654825447; x=1686361447;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=MVGkKshuTK3Ea9AR+jCLesZJlSGrIcBLAY1lqV31b4o=;
 b=SKr9RyDD6K3SpiJ+GIUjMdlo/FsNvk+pRshRMDboMCcrw32D01of6kfk
 n5UIV3BEWSyQLlNfPY1efkpUf5sHwY9KimKqs2atiNdzUd4jOLLQszp3q
 JkBMDiLpkp26lTs4xC1pffcs0S0UsjFWEmDM51C5SyO1WC3uilgDRwaqH
 3i2y1h8yfUxrsS1nU4P5x9e9bwQkOuALQuUR3hp2lVPClKMrsGmCKOJYw
 wp3JKwQLLVAsyx0Q/Mn/bNnsv3pfwZCLfrn4KKIKtwZP3OQ4uYjiF1ttC
 gc7/Sdg3yNitkAIV0B3pRwAovPzU8+wXOk8dM20NObBX88ivid2unuodn g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="278285067"
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; d="scan'208";a="278285067"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2022 18:44:06 -0700
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; d="scan'208";a="566654119"
Received: from nvishwa1-desk.sc.intel.com (HELO nvishwa1-DESK) ([172.25.29.76])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2022 18:44:05 -0700
Date: Thu, 9 Jun 2022 18:43:47 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Auld <matthew.william.auld@gmail.com>
Subject: Re: [RFC v3 2/3] drm/i915: Update i915 uapi documentation
Message-ID: <20220610014346.GH4461@nvishwa1-DESK>
References: <20220517183212.20274-1-niranjana.vishwanathapura@intel.com>
 <20220517183212.20274-3-niranjana.vishwanathapura@intel.com>
 <CAM0jSHPbNikJbnwR15kt=2S2HNFG21Ad4pH7h48d1qejTLX-kg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAM0jSHPbNikJbnwR15kt=2S2HNFG21Ad4pH7h48d1qejTLX-kg@mail.gmail.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@intel.com>,
 Chris Wilson <chris.p.wilson@intel.com>, Jason Ekstrand <jason@jlekstrand.net>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 08, 2022 at 12:24:04PM +0100, Matthew Auld wrote:
>On Tue, 17 May 2022 at 19:32, Niranjana Vishwanathapura
><niranjana.vishwanathapura@intel.com> wrote:
>>
>> Add some missing i915 upai documentation which the new
>> i915 VM_BIND feature documentation will be refer to.
>>
>> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>> ---
>>  include/uapi/drm/i915_drm.h | 153 +++++++++++++++++++++++++++---------
>>  1 file changed, 116 insertions(+), 37 deletions(-)
>>
>> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
>> index a2def7b27009..8c834a31b56f 100644
>> --- a/include/uapi/drm/i915_drm.h
>> +++ b/include/uapi/drm/i915_drm.h
>> @@ -751,9 +751,16 @@ typedef struct drm_i915_irq_wait {
>>
>>  /* Must be kept compact -- no holes and well documented */
>>
>> +/**
>> + * typedef drm_i915_getparam_t - Driver parameter query structure.
>
>This one looks funny in the rendered html for some reason, since it
>doesn't seem to emit the @param and @value, I guess it doesn't really
>understand typedef <struct> ?
>
>Maybe make this "struct drm_i915_getparam - Driver parameter query structure." ?

Thanks Matt.
Yah, there doesn't seems to be a good way to add kernel doc for this
kind of declaration. 'struct drm_i915_getparam' also didn't help.
I was able to fix it by first defining the structure and then adding
a typedef for it. Not sure if that has any value, but at least we can
get kernel doc for that.

>
>> + */
>>  typedef struct drm_i915_getparam {
>> +       /** @param: Driver parameter to query. */
>>         __s32 param;
>> -       /*
>> +
>> +       /**
>> +        * @value: Address of memory where queried value should be put.
>> +        *
>>          * WARNING: Using pointers instead of fixed-size u64 means we need to write
>>          * compat32 code. Don't repeat this mistake.
>>          */
>> @@ -1239,76 +1246,114 @@ struct drm_i915_gem_exec_object2 {
>>         __u64 rsvd2;
>>  };
>>
>> +/**
>> + * struct drm_i915_gem_exec_fence - An input or output fence for the execbuff
>
>s/execbuff/execbuf/, at least that seems to be what we use elsewhere, AFAICT.
>
>> + * ioctl.
>> + *
>> + * The request will wait for input fence to signal before submission.
>> + *
>> + * The returned output fence will be signaled after the completion of the
>> + * request.
>> + */
>>  struct drm_i915_gem_exec_fence {
>> -       /**
>> -        * User's handle for a drm_syncobj to wait on or signal.
>> -        */
>> +       /** @handle: User's handle for a drm_syncobj to wait on or signal. */
>>         __u32 handle;
>>
>> +       /**
>> +        * @flags: Supported flags are,
>
>are:
>
>> +        *
>> +        * I915_EXEC_FENCE_WAIT:
>> +        * Wait for the input fence before request submission.
>> +        *
>> +        * I915_EXEC_FENCE_SIGNAL:
>> +        * Return request completion fence as output
>> +        */
>> +       __u32 flags;
>>  #define I915_EXEC_FENCE_WAIT            (1<<0)
>>  #define I915_EXEC_FENCE_SIGNAL          (1<<1)
>>  #define __I915_EXEC_FENCE_UNKNOWN_FLAGS (-(I915_EXEC_FENCE_SIGNAL << 1))
>> -       __u32 flags;
>>  };
>>
>> -/*
>> - * See drm_i915_gem_execbuffer_ext_timeline_fences.
>> - */
>> -#define DRM_I915_GEM_EXECBUFFER_EXT_TIMELINE_FENCES 0
>> -
>> -/*
>> +/**
>> + * struct drm_i915_gem_execbuffer_ext_timeline_fences - Timeline fences
>> + * for execbuff.
>> + *
>>   * This structure describes an array of drm_syncobj and associated points for
>>   * timeline variants of drm_syncobj. It is invalid to append this structure to
>>   * the execbuf if I915_EXEC_FENCE_ARRAY is set.
>>   */
>>  struct drm_i915_gem_execbuffer_ext_timeline_fences {
>> +#define DRM_I915_GEM_EXECBUFFER_EXT_TIMELINE_FENCES 0
>> +       /** @base: Extension link. See struct i915_user_extension. */
>>         struct i915_user_extension base;
>>
>>         /**
>> -        * Number of element in the handles_ptr & value_ptr arrays.
>> +        * @fence_count: Number of element in the @handles_ptr & @value_ptr
>
>s/element/elements/
>
>> +        * arrays.
>>          */
>>         __u64 fence_count;
>>
>>         /**
>> -        * Pointer to an array of struct drm_i915_gem_exec_fence of length
>> -        * fence_count.
>> +        * @handles_ptr: Pointer to an array of struct drm_i915_gem_exec_fence
>> +        * of length @fence_count.
>>          */
>>         __u64 handles_ptr;
>>
>>         /**
>> -        * Pointer to an array of u64 values of length fence_count. Values
>> -        * must be 0 for a binary drm_syncobj. A Value of 0 for a timeline
>> -        * drm_syncobj is invalid as it turns a drm_syncobj into a binary one.
>> +        * @values_ptr: Pointer to an array of u64 values of length
>> +        * @fence_count.
>> +        * Values must be 0 for a binary drm_syncobj. A Value of 0 for a
>> +        * timeline drm_syncobj is invalid as it turns a drm_syncobj into a
>> +        * binary one.
>>          */
>>         __u64 values_ptr;
>>  };
>>
>> +/**
>> + * struct drm_i915_gem_execbuffer2 - Structure for execbuff submission
>> + */
>>  struct drm_i915_gem_execbuffer2 {
>> -       /**
>> -        * List of gem_exec_object2 structs
>> -        */
>> +       /** @buffers_ptr: Pointer to a list of gem_exec_object2 structs */
>>         __u64 buffers_ptr;
>> +
>> +       /** @buffer_count: Number of elements in @buffers_ptr array */
>>         __u32 buffer_count;
>>
>> -       /** Offset in the batchbuffer to start execution from. */
>> +       /**
>> +        * @batch_start_offset: Offset in the batchbuffer to start execution
>> +        * from.
>> +        */
>>         __u32 batch_start_offset;
>> -       /** Bytes used in batchbuffer from batch_start_offset */
>> +
>> +       /** @batch_len: Bytes used in batchbuffer from batch_start_offset */
>
>"Length in bytes of the batchbuffer, otherwise assumed to be the
>object size if zero, starting from the @batch_start_offset."
>
>>         __u32 batch_len;
>> +
>> +       /** @DR1: deprecated */
>>         __u32 DR1;
>> +
>> +       /** @DR4: deprecated */
>>         __u32 DR4;
>> +
>> +       /** @num_cliprects: See @cliprects_ptr */
>>         __u32 num_cliprects;
>> +
>>         /**
>> -        * This is a struct drm_clip_rect *cliprects if I915_EXEC_FENCE_ARRAY
>> -        * & I915_EXEC_USE_EXTENSIONS are not set.
>> +        * @cliprects_ptr: Kernel clipping was a DRI1 misfeature.
>> +        *
>> +        * It is invalid to use this field if I915_EXEC_FENCE_ARRAY or
>> +        * I915_EXEC_USE_EXTENSIONS flags are not set.
>>          *
>>          * If I915_EXEC_FENCE_ARRAY is set, then this is a pointer to an array
>> -        * of struct drm_i915_gem_exec_fence and num_cliprects is the length
>> -        * of the array.
>> +        * of &drm_i915_gem_exec_fence and @num_cliprects is the length of the
>> +        * array.
>>          *
>>          * If I915_EXEC_USE_EXTENSIONS is set, then this is a pointer to a
>> -        * single struct i915_user_extension and num_cliprects is 0.
>> +        * single &i915_user_extension and num_cliprects is 0.
>>          */
>>         __u64 cliprects_ptr;
>> +
>> +       /** @flags: Execbuff flags */
>
>s/Execbuff/Execbuf/
>
>Could maybe document the I915_EXEC_* also, or maybe not ;)
>

We no longer need to refer to execbuf2 as vm_bind will have its own
new execbuf3. But will keep the already added execbuf2 documentation.

>> +       __u64 flags;
>>  #define I915_EXEC_RING_MASK              (0x3f)
>>  #define I915_EXEC_DEFAULT                (0<<0)
>>  #define I915_EXEC_RENDER                 (1<<0)
>> @@ -1326,10 +1371,6 @@ struct drm_i915_gem_execbuffer2 {
>>  #define I915_EXEC_CONSTANTS_REL_GENERAL (0<<6) /* default */
>>  #define I915_EXEC_CONSTANTS_ABSOLUTE   (1<<6)
>>  #define I915_EXEC_CONSTANTS_REL_SURFACE (2<<6) /* gen4/5 only */
>> -       __u64 flags;
>> -       __u64 rsvd1; /* now used for context info */
>> -       __u64 rsvd2;
>> -};
>>
>>  /** Resets the SO write offset registers for transform feedback on gen7. */
>>  #define I915_EXEC_GEN7_SOL_RESET       (1<<8)
>> @@ -1432,9 +1473,23 @@ struct drm_i915_gem_execbuffer2 {
>>   * drm_i915_gem_execbuffer_ext enum.
>>   */
>>  #define I915_EXEC_USE_EXTENSIONS       (1 << 21)
>> -
>>  #define __I915_EXEC_UNKNOWN_FLAGS (-(I915_EXEC_USE_EXTENSIONS << 1))
>>
>> +       /** @rsvd1: Context id */
>> +       __u64 rsvd1;
>> +
>> +       /**
>> +        * @rsvd2: in and out sync_file file descriptors.
>> +        *
>> +        * When I915_EXEC_FENCE_IN or I915_EXEC_FENCE_SUBMIT flag is set, the
>> +        * lower 32 bits of this field will have the in sync_file fd (input).
>> +        *
>> +        * When I915_EXEC_FENCE_OUT flag is set, the upper 32 bits of this
>> +        * field will have the out sync_file fd (output).
>> +        */
>> +       __u64 rsvd2;
>> +};
>> +
>>  #define I915_EXEC_CONTEXT_ID_MASK      (0xffffffff)
>>  #define i915_execbuffer2_set_context_id(eb2, context) \
>>         (eb2).rsvd1 = context & I915_EXEC_CONTEXT_ID_MASK
>> @@ -1814,13 +1869,32 @@ struct drm_i915_gem_context_create {
>>         __u32 pad;
>>  };
>>
>> +/**
>> + * struct drm_i915_gem_context_create_ext - Structure for creating contexts.
>> + */
>>  struct drm_i915_gem_context_create_ext {
>> -       __u32 ctx_id; /* output: id of new context*/
>> +       /** @ctx_id: Id of the created context (output) */
>> +       __u32 ctx_id;
>> +
>> +       /**
>> +        * @flags: Supported flags are,
>
>are:
>
>> +        *
>> +        * I915_CONTEXT_CREATE_FLAGS_USE_EXTENSIONS:
>> +        *
>> +        * Extensions may be appended to this structure and driver must check
>> +        * for those.
>
>Maybe add "See @extensions.", and then....
>
>> +        *
>> +        * I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE
>> +        *
>> +        * Created context will have single timeline.
>> +        */
>>         __u32 flags;
>>  #define I915_CONTEXT_CREATE_FLAGS_USE_EXTENSIONS       (1u << 0)
>>  #define I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE      (1u << 1)
>>  #define I915_CONTEXT_CREATE_FLAGS_UNKNOWN \
>>         (-(I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE << 1))
>> +
>> +       /** @extensions: Zero-terminated chain of extensions. */
>
>...here perhaps list the extensions, and maybe also move the #define
>for each here? See for example @extensions in drm_i915_gem_create_ext.
>

Ok, will address all your comments above.

Niranjana

>Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>
>>         __u64 extensions;
>>  };
>>
>> @@ -2387,7 +2461,9 @@ struct drm_i915_gem_context_destroy {
>>         __u32 pad;
>>  };
>>
>> -/*
>> +/**
>> + * struct drm_i915_gem_vm_control - Structure to create or destroy VM.
>> + *
>>   * DRM_I915_GEM_VM_CREATE -
>>   *
>>   * Create a new virtual memory address space (ppGTT) for use within a context
>> @@ -2397,20 +2473,23 @@ struct drm_i915_gem_context_destroy {
>>   * The id of new VM (bound to the fd) for use with I915_CONTEXT_PARAM_VM is
>>   * returned in the outparam @id.
>>   *
>> - * No flags are defined, with all bits reserved and must be zero.
>> - *
>>   * An extension chain maybe provided, starting with @extensions, and terminated
>>   * by the @next_extension being 0. Currently, no extensions are defined.
>>   *
>>   * DRM_I915_GEM_VM_DESTROY -
>>   *
>> - * Destroys a previously created VM id, specified in @id.
>> + * Destroys a previously created VM id, specified in @vm_id.
>>   *
>>   * No extensions or flags are allowed currently, and so must be zero.
>>   */
>>  struct drm_i915_gem_vm_control {
>> +       /** @extensions: Zero-terminated chain of extensions. */
>>         __u64 extensions;
>> +
>> +       /** @flags: reserved for future usage, currently MBZ */
>>         __u32 flags;
>> +
>> +       /** @vm_id: Id of the VM created or to be destroyed */
>>         __u32 vm_id;
>>  };
>>
>> --
>> 2.21.0.rc0.32.g243a4c7e27
>>
