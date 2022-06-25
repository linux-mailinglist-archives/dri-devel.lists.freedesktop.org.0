Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0282255ABEE
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jun 2022 21:08:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB19A10EAA2;
	Sat, 25 Jun 2022 19:08:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9046610EAA2;
 Sat, 25 Jun 2022 19:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656184100; x=1687720100;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5dR9jxNPvacBhYbiEZkx4X/m49lOxEs8Yd90hex4BfE=;
 b=cAG2VOxPMR6/0kNuT9pG5FYWN8o1YMtilqE9En33vJF2edXGkXw5R/5Y
 rVus8VTi/xajuBew5FdUrm1/X61pqkltgULAU/hWlRBe1QfnB0EdfThrt
 CkrMFNur4PFTVsoX9d0kP4j/ib+BmwbiQmdktGGsWgaIW2pyYQo2F6992
 pJkh3m82Tx68lvw6M300BoTr6A8jXiWY+a65+BM/iUIRlJ3nz0wTGW5N9
 PNpJjnOfaCDgnLPbNDztpdMeout4LjcctRsMHfBWp0TpLIaP81lzRdqH/
 nFOL0dqhdOp7ABArXwGBVle/UZHi28mL9wiUXUWbbRDj3shDWlOYnGO7H w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10389"; a="282303429"
X-IronPort-AV: E=Sophos;i="5.92,222,1650956400"; d="scan'208";a="282303429"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2022 12:08:20 -0700
X-IronPort-AV: E=Sophos;i="5.92,222,1650956400"; d="scan'208";a="645760628"
Received: from nvishwa1-desk.sc.intel.com (HELO nvishwa1-DESK) ([172.25.29.76])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2022 12:08:19 -0700
Date: Sat, 25 Jun 2022 12:08:01 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v6 2/3] drm/i915: Update i915 uapi documentation
Message-ID: <20220625190801.GG376@nvishwa1-DESK>
References: <20220624174936.1065-1-niranjana.vishwanathapura@intel.com>
 <20220624174936.1065-3-niranjana.vishwanathapura@intel.com>
 <YrYSrMbmN06wZl2S@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <YrYSrMbmN06wZl2S@phenom.ffwll.local>
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
Cc: matthew.brost@intel.com, paulo.r.zanoni@intel.com,
 dri-devel@lists.freedesktop.org, tvrtko.ursulin@intel.com,
 intel-gfx@lists.freedesktop.org, lionel.g.landwerlin@intel.com,
 thomas.hellstrom@intel.com, oak.zeng@intel.com, chris.p.wilson@intel.com,
 jason@jlekstrand.net, daniel.vetter@intel.com, christian.koenig@amd.com,
 matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 24, 2022 at 09:38:20PM +0200, Daniel Vetter wrote:
>On Fri, Jun 24, 2022 at 10:49:35AM -0700, Niranjana Vishwanathapura wrote:
>> Add some missing i915 upai documentation which the new
>> i915 VM_BIND feature documentation will be refer to.
>>
>> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>> ---
>>  include/uapi/drm/i915_drm.h | 205 ++++++++++++++++++++++++++++--------
>>  1 file changed, 160 insertions(+), 45 deletions(-)
>>
>> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
>> index de49b68b4fc8..4afe95d8b98b 100644
>> --- a/include/uapi/drm/i915_drm.h
>> +++ b/include/uapi/drm/i915_drm.h
>> @@ -751,14 +751,27 @@ typedef struct drm_i915_irq_wait {
>>
>>  /* Must be kept compact -- no holes and well documented */
>>
>> -typedef struct drm_i915_getparam {
>> +/**
>> + * struct drm_i915_getparam - Driver parameter query structure.
>> + */
>> +struct drm_i915_getparam {
>> +	/** @param: Driver parameter to query. */
>>  	__s32 param;
>> -	/*
>> +
>> +	/**
>> +	 * @value: Address of memory where queried value should be put.
>> +	 *
>>  	 * WARNING: Using pointers instead of fixed-size u64 means we need to write
>>  	 * compat32 code. Don't repeat this mistake.
>>  	 */
>>  	int __user *value;
>> -} drm_i915_getparam_t;
>> +};
>> +
>> +/**
>> + * typedef drm_i915_getparam_t - Driver parameter query structure.
>> + * See struct drm_i915_getparam.
>> + */
>> +typedef struct drm_i915_getparam drm_i915_getparam_t;
>>
>>  /* Ioctl to set kernel params:
>>   */
>> @@ -1239,76 +1252,119 @@ struct drm_i915_gem_exec_object2 {
>>  	__u64 rsvd2;
>>  };
>>
>> +/**
>> + * struct drm_i915_gem_exec_fence - An input or output fence for the execbuf
>> + * ioctl.
>> + *
>> + * The request will wait for input fence to signal before submission.
>> + *
>> + * The returned output fence will be signaled after the completion of the
>> + * request.
>> + */
>>  struct drm_i915_gem_exec_fence {
>> -	/**
>> -	 * User's handle for a drm_syncobj to wait on or signal.
>> -	 */
>> +	/** @handle: User's handle for a drm_syncobj to wait on or signal. */
>>  	__u32 handle;
>>
>> +	/**
>> +	 * @flags: Supported flags are:
>> +	 *
>> +	 * I915_EXEC_FENCE_WAIT:
>> +	 * Wait for the input fence before request submission.
>> +	 *
>> +	 * I915_EXEC_FENCE_SIGNAL:
>> +	 * Return request completion fence as output
>> +	 */
>> +	__u32 flags;
>>  #define I915_EXEC_FENCE_WAIT            (1<<0)
>>  #define I915_EXEC_FENCE_SIGNAL          (1<<1)
>>  #define __I915_EXEC_FENCE_UNKNOWN_FLAGS (-(I915_EXEC_FENCE_SIGNAL << 1))
>> -	__u32 flags;
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
>> + * for execbuf ioctl.
>> + *
>>   * This structure describes an array of drm_syncobj and associated points for
>>   * timeline variants of drm_syncobj. It is invalid to append this structure to
>>   * the execbuf if I915_EXEC_FENCE_ARRAY is set.
>>   */
>>  struct drm_i915_gem_execbuffer_ext_timeline_fences {
>> +#define DRM_I915_GEM_EXECBUFFER_EXT_TIMELINE_FENCES 0
>> +	/** @base: Extension link. See struct i915_user_extension. */
>>  	struct i915_user_extension base;
>>
>>  	/**
>> -	 * Number of element in the handles_ptr & value_ptr arrays.
>> +	 * @fence_count: Number of elements in the @handles_ptr & @value_ptr
>> +	 * arrays.
>>  	 */
>>  	__u64 fence_count;
>>
>>  	/**
>> -	 * Pointer to an array of struct drm_i915_gem_exec_fence of length
>> -	 * fence_count.
>> +	 * @handles_ptr: Pointer to an array of struct drm_i915_gem_exec_fence
>> +	 * of length @fence_count.
>>  	 */
>>  	__u64 handles_ptr;
>>
>>  	/**
>> -	 * Pointer to an array of u64 values of length fence_count. Values
>> -	 * must be 0 for a binary drm_syncobj. A Value of 0 for a timeline
>> -	 * drm_syncobj is invalid as it turns a drm_syncobj into a binary one.
>> +	 * @values_ptr: Pointer to an array of u64 values of length
>> +	 * @fence_count.
>> +	 * Values must be 0 for a binary drm_syncobj. A Value of 0 for a
>> +	 * timeline drm_syncobj is invalid as it turns a drm_syncobj into a
>> +	 * binary one.
>>  	 */
>>  	__u64 values_ptr;
>>  };
>>
>> +/**
>> + * struct drm_i915_gem_execbuffer2 - Structure for DRM_I915_GEM_EXECBUFFER2
>> + * ioctl.
>> + */
>>  struct drm_i915_gem_execbuffer2 {
>> -	/**
>> -	 * List of gem_exec_object2 structs
>> -	 */
>> +	/** @buffers_ptr: Pointer to a list of gem_exec_object2 structs */
>>  	__u64 buffers_ptr;
>> +
>> +	/** @buffer_count: Number of elements in @buffers_ptr array */
>>  	__u32 buffer_count;
>>
>> -	/** Offset in the batchbuffer to start execution from. */
>> +	/**
>> +	 * @batch_start_offset: Offset in the batchbuffer to start execution
>> +	 * from.
>> +	 */
>>  	__u32 batch_start_offset;
>> -	/** Bytes used in batchbuffer from batch_start_offset */
>> +
>> +	/**
>> +	 * @batch_len: Length in bytes of the batch buffer, starting from the
>> +	 * @batch_start_offset. If 0, length is assumed to be the batch buffer
>> +	 * object size.
>> +	 */
>>  	__u32 batch_len;
>> +
>> +	/** @DR1: deprecated */
>>  	__u32 DR1;
>> +
>> +	/** @DR4: deprecated */
>>  	__u32 DR4;
>> +
>> +	/** @num_cliprects: See @cliprects_ptr */
>>  	__u32 num_cliprects;
>> +
>>  	/**
>> -	 * This is a struct drm_clip_rect *cliprects if I915_EXEC_FENCE_ARRAY
>> -	 * & I915_EXEC_USE_EXTENSIONS are not set.
>> +	 * @cliprects_ptr: Kernel clipping was a DRI1 misfeature.
>> +	 *
>> +	 * It is invalid to use this field if I915_EXEC_FENCE_ARRAY or
>> +	 * I915_EXEC_USE_EXTENSIONS flags are not set.
>>  	 *
>>  	 * If I915_EXEC_FENCE_ARRAY is set, then this is a pointer to an array
>> -	 * of struct drm_i915_gem_exec_fence and num_cliprects is the length
>> -	 * of the array.
>> +	 * of &drm_i915_gem_exec_fence and @num_cliprects is the length of the
>> +	 * array.
>>  	 *
>>  	 * If I915_EXEC_USE_EXTENSIONS is set, then this is a pointer to a
>> -	 * single struct i915_user_extension and num_cliprects is 0.
>> +	 * single &i915_user_extension and num_cliprects is 0.
>>  	 */
>>  	__u64 cliprects_ptr;
>> +
>> +	/** @flags: Execbuf flags */
>> +	__u64 flags;
>>  #define I915_EXEC_RING_MASK              (0x3f)
>>  #define I915_EXEC_DEFAULT                (0<<0)
>>  #define I915_EXEC_RENDER                 (1<<0)
>> @@ -1326,10 +1382,6 @@ struct drm_i915_gem_execbuffer2 {
>>  #define I915_EXEC_CONSTANTS_REL_GENERAL (0<<6) /* default */
>>  #define I915_EXEC_CONSTANTS_ABSOLUTE 	(1<<6)
>>  #define I915_EXEC_CONSTANTS_REL_SURFACE (2<<6) /* gen4/5 only */
>> -	__u64 flags;
>> -	__u64 rsvd1; /* now used for context info */
>> -	__u64 rsvd2;
>> -};
>>
>>  /** Resets the SO write offset registers for transform feedback on gen7. */
>>  #define I915_EXEC_GEN7_SOL_RESET	(1<<8)
>> @@ -1432,9 +1484,23 @@ struct drm_i915_gem_execbuffer2 {
>>   * drm_i915_gem_execbuffer_ext enum.
>>   */
>>  #define I915_EXEC_USE_EXTENSIONS	(1 << 21)
>> -
>>  #define __I915_EXEC_UNKNOWN_FLAGS (-(I915_EXEC_USE_EXTENSIONS << 1))
>>
>> +	/** @rsvd1: Context id */
>> +	__u64 rsvd1;
>> +
>> +	/**
>> +	 * @rsvd2: in and out sync_file file descriptors.
>> +	 *
>> +	 * When I915_EXEC_FENCE_IN or I915_EXEC_FENCE_SUBMIT flag is set, the
>> +	 * lower 32 bits of this field will have the in sync_file fd (input).
>> +	 *
>> +	 * When I915_EXEC_FENCE_OUT flag is set, the upper 32 bits of this
>> +	 * field will have the out sync_file fd (output).
>> +	 */
>> +	__u64 rsvd2;
>> +};
>> +
>>  #define I915_EXEC_CONTEXT_ID_MASK	(0xffffffff)
>>  #define i915_execbuffer2_set_context_id(eb2, context) \
>>  	(eb2).rsvd1 = context & I915_EXEC_CONTEXT_ID_MASK
>> @@ -1814,19 +1880,58 @@ struct drm_i915_gem_context_create {
>>  	__u32 pad;
>>  };
>>
>> +/**
>> + * struct drm_i915_gem_context_create_ext - Structure for creating contexts.
>
>I think a follow up patch which explains that despite that the uapi seems
>to allow context properties to be mutable this isn't the case, and the
>first execbuf call will freeze the context. Not super important for
>vm_bind except that this means the execbuf will convert the proto context
>into a real context and freeze the vm, which also locks down all the vm
>related semantics we're adding. So might be good to add a paragraph here
>explaining how this works (and then perhaps go through all the context
>parameters and explain which can still be changed after the first
>execbuf).

I had to update this as compute use case of VM_BIND was making a reference
to this structure. But we no longer have that use case for VM_BIND, but
didn't want to revert this documentation :).

Yah, I think it will help immensely if we document the proto context
design here. Ok, a follow up patch sounds good.

>
>> + */
>>  struct drm_i915_gem_context_create_ext {
>> -	__u32 ctx_id; /* output: id of new context*/
>> +	/** @ctx_id: Id of the created context (output) */
>> +	__u32 ctx_id;
>> +
>> +	/**
>> +	 * @flags: Supported flags are:
>> +	 *
>> +	 * I915_CONTEXT_CREATE_FLAGS_USE_EXTENSIONS:
>> +	 *
>> +	 * Extensions may be appended to this structure and driver must check
>> +	 * for those. See @extensions.
>> +	 *
>> +	 * I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE
>> +	 *
>> +	 * Created context will have single timeline.
>> +	 */
>>  	__u32 flags;
>>  #define I915_CONTEXT_CREATE_FLAGS_USE_EXTENSIONS	(1u << 0)
>>  #define I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE	(1u << 1)
>>  #define I915_CONTEXT_CREATE_FLAGS_UNKNOWN \
>>  	(-(I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE << 1))
>> +
>> +	/**
>> +	 * @extensions: Zero-terminated chain of extensions.
>> +	 *
>> +	 * I915_CONTEXT_CREATE_EXT_SETPARAM:
>> +	 * Context parameter to set or query during context creation.
>> +	 * See struct drm_i915_gem_context_create_ext_setparam.
>> +	 *
>> +	 * I915_CONTEXT_CREATE_EXT_CLONE:
>> +	 * This extension has been removed. On the off chance someone somewhere
>> +	 * has attempted to use it, never re-use this extension number.
>> +	 */
>>  	__u64 extensions;
>> +#define I915_CONTEXT_CREATE_EXT_SETPARAM 0
>> +#define I915_CONTEXT_CREATE_EXT_CLONE 1
>>  };
>>
>> +/**
>> + * struct drm_i915_gem_context_param - Context parameter to set or query.
>> + */
>>  struct drm_i915_gem_context_param {
>> +	/** @ctx_id: Context id */
>>  	__u32 ctx_id;
>> +
>> +	/** @size: Size of the parameter @value */
>>  	__u32 size;
>> +
>> +	/** @param: Parameter to set or query */
>>  	__u64 param;
>>  #define I915_CONTEXT_PARAM_BAN_PERIOD	0x1
>>  /* I915_CONTEXT_PARAM_NO_ZEROMAP has been removed.  On the off chance
>> @@ -1973,6 +2078,7 @@ struct drm_i915_gem_context_param {
>>  #define I915_CONTEXT_PARAM_PROTECTED_CONTENT    0xd
>>  /* Must be kept compact -- no holes and well documented */
>>
>> +	/** @value: Context parameter value to be set or queried */
>>  	__u64 value;
>>  };
>>
>> @@ -2371,23 +2477,29 @@ struct i915_context_param_engines {
>>  	struct i915_engine_class_instance engines[N__]; \
>>  } __attribute__((packed)) name__
>>
>> +/**
>> + * struct drm_i915_gem_context_create_ext_setparam - Context parameter
>> + * to set or query during context creation.
>> + */
>>  struct drm_i915_gem_context_create_ext_setparam {
>> -#define I915_CONTEXT_CREATE_EXT_SETPARAM 0
>> +	/** @base: Extension link. See struct i915_user_extension. */
>>  	struct i915_user_extension base;
>> +
>> +	/**
>> +	 * @param: Context parameter to set or query.
>> +	 * See struct drm_i915_gem_context_param.
>> +	 */
>>  	struct drm_i915_gem_context_param param;
>>  };
>>
>> -/* This API has been removed.  On the off chance someone somewhere has
>> - * attempted to use it, never re-use this extension number.
>> - */
>> -#define I915_CONTEXT_CREATE_EXT_CLONE 1
>> -
>>  struct drm_i915_gem_context_destroy {
>>  	__u32 ctx_id;
>>  	__u32 pad;
>>  };
>>
>> -/*
>> +/**
>> + * struct drm_i915_gem_vm_control - Structure to create or destroy VM.
>> + *
>>   * DRM_I915_GEM_VM_CREATE -
>>   *
>>   * Create a new virtual memory address space (ppGTT) for use within a context
>> @@ -2397,20 +2509,23 @@ struct drm_i915_gem_context_destroy {
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
>> +	/** @extensions: Zero-terminated chain of extensions. */
>>  	__u64 extensions;
>> +
>> +	/** @flags: reserved for future usage, currently MBZ */
>>  	__u32 flags;
>> +
>> +	/** @vm_id: Id of the VM created or to be destroyed */
>>  	__u32 vm_id;
>>  };
>
>Thanks for giving some much needed care to our docs.
>
>Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>

Thanks.

Niranjana

>>
>> --
>> 2.21.0.rc0.32.g243a4c7e27
>>
>
>-- 
>Daniel Vetter
>Software Engineer, Intel Corporation
>http://blog.ffwll.ch
