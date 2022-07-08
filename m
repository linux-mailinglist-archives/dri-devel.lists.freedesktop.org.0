Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BDF56BB21
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 15:47:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE4A110E089;
	Fri,  8 Jul 2022 13:47:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 595C210E073;
 Fri,  8 Jul 2022 13:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657288064; x=1688824064;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=oV+HiiRpetDt3GaK/mTd2emADkETR9RV4NkxN3Xqv/A=;
 b=dg0gBou835EkeDAsCRBB/4Tx9wlsISaVGywJpbLeEa0gk8JYLCOkD7qX
 svWJ675kd/sgsuUQb/WY6i9r6I+8zNdWJDjF+wF5RCkcJmBEpomH2aUD2
 xO1dNqp16ZbvHDJGVTi03hdPkrXcr7KlxNOOHVG4nXvOCjuc1g/ddGK16
 BIrJ0OAje+haElqMySdziYLqQlx/NCl2wVsmtERFy8qLilPsSf2Rvj5aX
 JkwLeB/wEeMjtoacfuxqteRwDOk8mpNXmS0sGUT/k9HWoUysHXLbWit21
 UpZPrqf5iT1sZTav5SfKLmsKkSov+LlKICNeI7Aw/hVo8gHN+GqIOFxS4 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10401"; a="309852854"
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; d="scan'208";a="309852854"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2022 06:47:43 -0700
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; d="scan'208";a="696887206"
Received: from nvishwa1-desk.sc.intel.com (HELO nvishwa1-DESK) ([172.25.29.76])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2022 06:47:43 -0700
Date: Fri, 8 Jul 2022 06:47:24 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
Subject: Re: [RFC 06/10] drm/i915/vm_bind: Add I915_GEM_EXECBUFFER3 ioctl
Message-ID: <20220708134723.GW14039@nvishwa1-DESK>
References: <20220701225055.8204-1-niranjana.vishwanathapura@intel.com>
 <20220701225055.8204-7-niranjana.vishwanathapura@intel.com>
 <b652db18dc2ea6724aae175420192a8fc4fe932d.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b652db18dc2ea6724aae175420192a8fc4fe932d.camel@intel.com>
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
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Auld,
 Matthew" <matthew.auld@intel.com>,
 "jason@jlekstrand.net" <jason@jlekstrand.net>, "Vetter,
 Daniel" <daniel.vetter@intel.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 07, 2022 at 07:41:54AM -0700, Hellstrom, Thomas wrote:
>On Fri, 2022-07-01 at 15:50 -0700, Niranjana Vishwanathapura wrote:
>> Add new execbuf3 ioctl (I915_GEM_EXECBUFFER3) which only
>> works in vm_bind mode. The vm_bind mode only works with
>> this new execbuf3 ioctl.
>>
>> The new execbuf3 ioctl will not have any execlist
>
>I understand this that you mean there is no list of objects to validate
>attached to the drm_i915_gem_execbuffer3 structure rather than that the
>execlists submission backend is never used. Could we clarify this to
>avoid confusion.

Yah, side effect of overloading the word 'execlist' for multiple things.
Yah, I meant, no list of objects to validate. I agree, we need to clarify
that here.

>
>
>>  support
>> and all the legacy support like relocations etc are removed.
>>
>> Signed-off-by: Niranjana Vishwanathapura
>> <niranjana.vishwanathapura@intel.com>
>> ---
>>  drivers/gpu/drm/i915/Makefile                 |    1 +
>>  .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |    5 +
>>  .../gpu/drm/i915/gem/i915_gem_execbuffer3.c   | 1029
>> +++++++++++++++++
>>  drivers/gpu/drm/i915/gem/i915_gem_ioctls.h    |    2 +
>>  drivers/gpu/drm/i915/i915_driver.c            |    1 +
>>  include/uapi/drm/i915_drm.h                   |   67 +-
>>  6 files changed, 1104 insertions(+), 1 deletion(-)
>>  create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c
>>
>> diff --git a/drivers/gpu/drm/i915/Makefile
>> b/drivers/gpu/drm/i915/Makefile
>> index 4e1627e96c6e..38cd1c5bc1a5 100644
>> --- a/drivers/gpu/drm/i915/Makefile
>> +++ b/drivers/gpu/drm/i915/Makefile
>> @@ -148,6 +148,7 @@ gem-y += \
>>         gem/i915_gem_dmabuf.o \
>>         gem/i915_gem_domain.o \
>>         gem/i915_gem_execbuffer.o \
>> +       gem/i915_gem_execbuffer3.o \
>>         gem/i915_gem_internal.o \
>>         gem/i915_gem_object.o \
>>         gem/i915_gem_lmem.o \
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>> b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>> index b7b2c14fd9e1..37bb1383ab8f 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>> @@ -782,6 +782,11 @@ static int eb_select_context(struct
>> i915_execbuffer *eb)
>>         if (unlikely(IS_ERR(ctx)))
>>                 return PTR_ERR(ctx);
>>
>> +       if (ctx->vm->vm_bind_mode) {
>> +               i915_gem_context_put(ctx);
>> +               return -EOPNOTSUPP;
>> +       }
>> +
>>         eb->gem_context = ctx;
>>         if (i915_gem_context_has_full_ppgtt(ctx))
>>                 eb->invalid_flags |= EXEC_OBJECT_NEEDS_GTT;
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c
>> b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c
>> new file mode 100644
>> index 000000000000..13121df72e3d
>> --- /dev/null
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c
>> @@ -0,0 +1,1029 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2022 Intel Corporation
>> + */
>> +
>> +#include <linux/dma-resv.h>
>> +#include <linux/sync_file.h>
>> +#include <linux/uaccess.h>
>> +
>> +#include <drm/drm_syncobj.h>
>> +
>> +#include "gt/intel_context.h"
>> +#include "gt/intel_gpu_commands.h"
>> +#include "gt/intel_gt.h"
>> +#include "gt/intel_gt_pm.h"
>> +#include "gt/intel_ring.h"
>> +
>> +#include "i915_drv.h"
>> +#include "i915_file_private.h"
>> +#include "i915_gem_context.h"
>> +#include "i915_gem_ioctls.h"
>> +#include "i915_gem_vm_bind.h"
>> +#include "i915_trace.h"
>> +
>> +#define __EXEC3_ENGINE_PINNED          BIT_ULL(32)
>> +#define __EXEC3_INTERNAL_FLAGS         (~0ull << 32)
>> +
>> +/* Catch emission of unexpected errors for CI! */
>> +#if IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM)
>> +#undef EINVAL
>> +#define EINVAL ({ \
>> +       DRM_DEBUG_DRIVER("EINVAL at %s:%d\n", __func__, __LINE__); \
>> +       22; \
>> +})
>> +#endif
>> +
>> +/**
>> + * DOC: User command execution with execbuf3 ioctl
>> + *
>> + * A VM in VM_BIND mode will not support older execbuf mode of
>> binding.
>> + * The execbuf ioctl handling in VM_BIND mode differs significantly
>> from the
>> + * older execbuf2 ioctl (See struct drm_i915_gem_execbuffer2).
>> + * Hence, a new execbuf3 ioctl has been added to support VM_BIND
>> mode. (See
>> + * struct drm_i915_gem_execbuffer3). The execbuf3 ioctl will not
>> accept any
>> + * execlist. Hence, no support for implicit sync.
>> + *
>> + * The new execbuf3 ioctl only works in VM_BIND mode and the VM_BIND
>> mode only
>> + * works with execbuf3 ioctl for submission.
>> + *
>> + * The execbuf3 ioctl directly specifies the batch addresses instead
>> of as
>> + * object handles as in execbuf2 ioctl. The execbuf3 ioctl will also
>> not
>> + * support many of the older features like in/out/submit fences,
>> fence array,
>> + * default gem context etc. (See struct drm_i915_gem_execbuffer3).
>> + *
>> + * In VM_BIND mode, VA allocation is completely managed by the user
>> instead of
>> + * the i915 driver. Hence all VA assignment, eviction are not
>> applicable in
>> + * VM_BIND mode. Also, for determining object activeness, VM_BIND
>> mode will not
>> + * be using the i915_vma active reference tracking. It will instead
>> check the
>> + * dma-resv object's fence list for that.
>> + *
>> + * So, a lot of code supporting execbuf2 ioctl, like relocations, VA
>> evictions,
>> + * vma lookup table, implicit sync, vma active reference tracking
>> etc., are not
>> + * applicable for execbuf3 ioctl.
>> + */
>> +
>> +struct eb_fence {
>> +       struct drm_syncobj *syncobj; /* Use with ptr_mask_bits() */
>> +       struct dma_fence *dma_fence;
>> +       u64 value;
>> +       struct dma_fence_chain *chain_fence;
>> +};
>> +
>> +struct i915_execbuffer {
>> +       struct drm_i915_private *i915; /** i915 backpointer */
>> +       struct drm_file *file; /** per-file lookup tables and limits
>> */
>> +       struct drm_i915_gem_execbuffer3 *args; /** ioctl parameters
>> */
>> +
>> +       struct intel_gt *gt; /* gt for the execbuf */
>> +       struct intel_context *context; /* logical state for the
>> request */
>> +       struct i915_gem_context *gem_context; /** caller's context */
>> +
>> +       /** our requests to build */
>> +       struct i915_request *requests[MAX_ENGINE_INSTANCE + 1];
>> +
>> +       /** used for excl fence in dma_resv objects when > 1 BB
>> submitted */
>> +       struct dma_fence *composite_fence;
>> +
>> +       struct i915_gem_ww_ctx ww;
>> +
>> +       /* number of batches in execbuf IOCTL */
>> +       unsigned int num_batches;
>> +
>> +       u64 batch_addresses[MAX_ENGINE_INSTANCE + 1];
>> +       /** identity of the batch obj/vma */
>> +       struct i915_vma *batches[MAX_ENGINE_INSTANCE + 1];
>> +
>> +       struct eb_fence *fences;
>> +       unsigned long num_fences;
>> +};
>
>Kerneldoc structures please.
>
>It seems we are duplicating a lot of code from i915_execbuffer.c. Did
>you consider
>
>struct i915_execbuffer3 {
>...
>};
>
>struct i915_execbuffer2 {
>        struct i915_execbuffer3 eb3;
>        ...
>        [members that are not common]
>};
>
>Allowing execbuffer2 to share the execbuffer3 code to some extent.
>Not sure about the gain at this point though. My worry would be that fo
>r example fixes might be applied to one file and not the other.

I have added a TODO in the cover letter of this patch series to share
the code between execbuf2 and execbuf3.
But, I am not sure to what extent. Execbuf3 is much leaner than execbuf2
and we don't want to make it bad by forcing code sharing with legacy path.
We can perhaps abstract out some functions which takes specific arguments
(instead of 'eb'), that way we can keep these structures separate and still
share some code.

>
>> +
>> +static int eb_pin_engine(struct i915_execbuffer *eb, bool throttle);
>> +static void eb_unpin_engine(struct i915_execbuffer *eb);
>> +
>> +static int eb_select_context(struct i915_execbuffer *eb)
>> +{
>> +       struct i915_gem_context *ctx;
>> +
>> +       ctx = i915_gem_context_lookup(eb->file->driver_priv, eb-
>> >args->ctx_id);
>> +       if (IS_ERR(ctx))
>> +               return PTR_ERR(ctx);
>> +
>> +       eb->gem_context = ctx;
>> +       return 0;
>> +}
>> +
>> +static struct i915_vma *
>> +eb_find_vma(struct i915_address_space *vm, u64 addr)
>> +{
>> +       u64 va;
>> +
>> +       assert_vm_bind_held(vm);
>> +
>> +       va = gen8_noncanonical_addr(addr & PIN_OFFSET_MASK);
>> +       return i915_gem_vm_bind_lookup_vma(vm, va);
>> +}
>> +
>> +static int eb_lookup_vmas(struct i915_execbuffer *eb)
>> +{
>> +       unsigned int i, current_batch = 0;
>> +       struct i915_vma *vma;
>> +
>> +       for (i = 0; i < eb->num_batches; i++) {
>> +               vma = eb_find_vma(eb->context->vm, eb-
>> >batch_addresses[i]);
>> +               if (!vma)
>> +                       return -EINVAL;
>> +
>> +               eb->batches[current_batch] = vma;
>> +               ++current_batch;
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>> +static void eb_release_vmas(struct i915_execbuffer *eb, bool final)
>> +{
>> +}
>> +
>> +static int eb_validate_vmas(struct i915_execbuffer *eb)
>> +{
>> +       int err;
>> +       bool throttle = true;
>> +
>> +retry:
>> +       err = eb_pin_engine(eb, throttle);
>> +       if (err) {
>> +               if (err != -EDEADLK)
>> +                       return err;
>> +
>> +               goto err;
>> +       }
>> +
>> +       /* only throttle once, even if we didn't need to throttle */
>> +       throttle = false;
>> +
>> +err:
>> +       if (err == -EDEADLK) {
>> +               err = i915_gem_ww_ctx_backoff(&eb->ww);
>> +               if (!err)
>> +                       goto retry;
>> +       }
>> +
>> +       return err;
>> +}
>> +
>> +/*
>> + * Using two helper loops for the order of which requests / batches
>> are created
>> + * and added the to backend. Requests are created in order from the
>> parent to
>> + * the last child. Requests are added in the reverse order, from the
>> last child
>> + * to parent. This is done for locking reasons as the timeline lock
>> is acquired
>> + * during request creation and released when the request is added to
>> the
>> + * backend. To make lockdep happy (see intel_context_timeline_lock)
>> this must be
>> + * the ordering.
>> + */
>> +#define for_each_batch_create_order(_eb, _i) \
>> +       for ((_i) = 0; (_i) < (_eb)->num_batches; ++(_i))
>> +#define for_each_batch_add_order(_eb, _i) \
>> +       BUILD_BUG_ON(!typecheck(int, _i)); \
>> +       for ((_i) = (_eb)->num_batches - 1; (_i) >= 0; --(_i))
>> +
>> +static int eb_move_to_gpu(struct i915_execbuffer *eb)
>> +{
>> +       /* Unconditionally flush any chipset caches (for streaming
>> writes). */
>> +       intel_gt_chipset_flush(eb->gt);
>> +
>> +       return 0;
>> +}
>> +
>> +static int eb_request_submit(struct i915_execbuffer *eb,
>> +                            struct i915_request *rq,
>> +                            struct i915_vma *batch,
>> +                            u64 batch_len)
>> +{
>> +       int err;
>> +
>> +       if (intel_context_nopreempt(rq->context))
>> +               __set_bit(I915_FENCE_FLAG_NOPREEMPT, &rq-
>> >fence.flags);
>> +
>> +       /*
>> +        * After we completed waiting for other engines (using HW
>> semaphores)
>> +        * then we can signal that this request/batch is ready to
>> run. This
>> +        * allows us to determine if the batch is still waiting on
>> the GPU
>> +        * or actually running by checking the breadcrumb.
>> +        */
>> +       if (rq->context->engine->emit_init_breadcrumb) {
>> +               err = rq->context->engine->emit_init_breadcrumb(rq);
>> +               if (err)
>> +                       return err;
>> +       }
>> +
>> +       err = rq->context->engine->emit_bb_start(rq,
>> +                                                batch->node.start,
>> +                                                batch_len, 0);
>> +       if (err)
>> +               return err;
>> +
>> +       return 0;
>> +}
>> +
>> +static int eb_submit(struct i915_execbuffer *eb)
>> +{
>> +       unsigned int i;
>> +       int err;
>> +
>> +       err = eb_move_to_gpu(eb);
>> +
>> +       for_each_batch_create_order(eb, i) {
>> +               if (!eb->requests[i])
>> +                       break;
>> +
>> +               trace_i915_request_queue(eb->requests[i], 0);
>> +               if (!err)
>> +                       err = eb_request_submit(eb, eb->requests[i],
>> +                                               eb->batches[i],
>> +                                               eb->batches[i]-
>> >size);
>> +       }
>> +
>> +       return err;
>> +}
>> +
>> +static struct i915_request *eb_throttle(struct i915_execbuffer *eb,
>> struct intel_context *ce)
>> +{
>> +       struct intel_ring *ring = ce->ring;
>> +       struct intel_timeline *tl = ce->timeline;
>> +       struct i915_request *rq;
>> +
>> +       /*
>> +        * Completely unscientific finger-in-the-air estimates for
>> suitable
>> +        * maximum user request size (to avoid blocking) and then
>> backoff.
>> +        */
>> +       if (intel_ring_update_space(ring) >= PAGE_SIZE)
>> +               return NULL;
>> +
>> +       /*
>> +        * Find a request that after waiting upon, there will be at
>> least half
>> +        * the ring available. The hysteresis allows us to compete
>> for the
>> +        * shared ring and should mean that we sleep less often prior
>> to
>> +        * claiming our resources, but not so long that the ring
>> completely
>> +        * drains before we can submit our next request.
>> +        */
>> +       list_for_each_entry(rq, &tl->requests, link) {
>> +               if (rq->ring != ring)
>> +                       continue;
>> +
>> +               if (__intel_ring_space(rq->postfix,
>> +                                      ring->emit, ring->size) >
>> ring->size / 2)
>> +                       break;
>> +       }
>> +       if (&rq->link == &tl->requests)
>> +               return NULL; /* weird, we will check again later for
>> real */
>> +
>> +       return i915_request_get(rq);
>> +}
>> +
>> +static int eb_pin_timeline(struct i915_execbuffer *eb, struct
>> intel_context *ce,
>> +                          bool throttle)
>> +{
>> +       struct intel_timeline *tl;
>> +       struct i915_request *rq = NULL;
>> +
>> +       /*
>> +        * Take a local wakeref for preparing to dispatch the execbuf
>> as
>> +        * we expect to access the hardware fairly frequently in the
>> +        * process, and require the engine to be kept awake between
>> accesses.
>> +        * Upon dispatch, we acquire another prolonged wakeref that
>> we hold
>> +        * until the timeline is idle, which in turn releases the
>> wakeref
>> +        * taken on the engine, and the parent device.
>> +        */
>> +       tl = intel_context_timeline_lock(ce);
>> +       if (IS_ERR(tl))
>> +               return PTR_ERR(tl);
>> +
>> +       intel_context_enter(ce);
>> +       if (throttle)
>> +               rq = eb_throttle(eb, ce);
>> +       intel_context_timeline_unlock(tl);
>> +
>> +       if (rq) {
>> +               bool nonblock = eb->file->filp->f_flags & O_NONBLOCK;
>> +               long timeout = nonblock ? 0 : MAX_SCHEDULE_TIMEOUT;
>> +
>> +               if (i915_request_wait(rq, I915_WAIT_INTERRUPTIBLE,
>> +                                     timeout) < 0) {
>> +                       i915_request_put(rq);
>> +
>> +                       /*
>> +                        * Error path, cannot use
>> intel_context_timeline_lock as
>> +                        * that is user interruptable and this clean
>> up step
>> +                        * must be done.
>> +                        */
>> +                       mutex_lock(&ce->timeline->mutex);
>> +                       intel_context_exit(ce);
>> +                       mutex_unlock(&ce->timeline->mutex);
>> +
>> +                       if (nonblock)
>> +                               return -EWOULDBLOCK;
>> +                       else
>> +                               return -EINTR;
>> +               }
>> +               i915_request_put(rq);
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>> +static int eb_pin_engine(struct i915_execbuffer *eb, bool throttle)
>> +{
>> +       struct intel_context *ce = eb->context, *child;
>> +       int err;
>> +       int i = 0, j = 0;
>> +
>> +       GEM_BUG_ON(eb->args->flags & __EXEC3_ENGINE_PINNED);
>> +
>> +       if (unlikely(intel_context_is_banned(ce)))
>> +               return -EIO;
>> +
>> +       /*
>> +        * Pinning the contexts may generate requests in order to
>> acquire
>> +        * GGTT space, so do this first before we reserve a seqno for
>> +        * ourselves.
>> +        */
>> +       err = intel_context_pin_ww(ce, &eb->ww);
>> +       if (err)
>> +               return err;
>> +       for_each_child(ce, child) {
>> +               err = intel_context_pin_ww(child, &eb->ww);
>> +               GEM_BUG_ON(err);        /* perma-pinned should incr a
>> counter */
>> +       }
>> +
>> +       for_each_child(ce, child) {
>> +               err = eb_pin_timeline(eb, child, throttle);
>> +               if (err)
>> +                       goto unwind;
>> +               ++i;
>> +       }
>> +       err = eb_pin_timeline(eb, ce, throttle);
>> +       if (err)
>> +               goto unwind;
>> +
>> +       eb->args->flags |= __EXEC3_ENGINE_PINNED;
>> +       return 0;
>> +
>> +unwind:
>> +       for_each_child(ce, child) {
>> +               if (j++ < i) {
>> +                       mutex_lock(&child->timeline->mutex);
>> +                       intel_context_exit(child);
>> +                       mutex_unlock(&child->timeline->mutex);
>> +               }
>> +       }
>> +       for_each_child(ce, child)
>> +               intel_context_unpin(child);
>> +       intel_context_unpin(ce);
>> +       return err;
>> +}
>> +
>> +static void eb_unpin_engine(struct i915_execbuffer *eb)
>> +{
>> +       struct intel_context *ce = eb->context, *child;
>> +
>> +       if (!(eb->args->flags & __EXEC3_ENGINE_PINNED))
>> +               return;
>> +
>> +       eb->args->flags &= ~__EXEC3_ENGINE_PINNED;
>> +
>> +       for_each_child(ce, child) {
>> +               mutex_lock(&child->timeline->mutex);
>> +               intel_context_exit(child);
>> +               mutex_unlock(&child->timeline->mutex);
>> +
>> +               intel_context_unpin(child);
>> +       }
>> +
>> +       mutex_lock(&ce->timeline->mutex);
>> +       intel_context_exit(ce);
>> +       mutex_unlock(&ce->timeline->mutex);
>> +
>> +       intel_context_unpin(ce);
>> +}
>> +
>> +static int
>> +eb_select_engine(struct i915_execbuffer *eb)
>> +{
>> +       struct intel_context *ce, *child;
>> +       unsigned int idx;
>> +       int err;
>> +
>> +       if (!i915_gem_context_user_engines(eb->gem_context))
>> +               return -EINVAL;
>> +
>> +       idx = eb->args->engine_idx;
>> +       ce = i915_gem_context_get_engine(eb->gem_context, idx);
>> +       if (IS_ERR(ce))
>> +               return PTR_ERR(ce);
>> +
>> +       eb->num_batches = ce->parallel.number_children + 1;
>> +
>> +       for_each_child(ce, child)
>> +               intel_context_get(child);
>> +       intel_gt_pm_get(ce->engine->gt);
>> +
>> +       if (!test_bit(CONTEXT_ALLOC_BIT, &ce->flags)) {
>> +               err = intel_context_alloc_state(ce);
>> +               if (err)
>> +                       goto err;
>> +       }
>> +       for_each_child(ce, child) {
>> +               if (!test_bit(CONTEXT_ALLOC_BIT, &child->flags)) {
>> +                       err = intel_context_alloc_state(child);
>> +                       if (err)
>> +                               goto err;
>> +               }
>> +       }
>> +
>> +       /*
>> +        * ABI: Before userspace accesses the GPU (e.g. execbuffer),
>> report
>> +        * EIO if the GPU is already wedged.
>> +        */
>> +       err = intel_gt_terminally_wedged(ce->engine->gt);
>> +       if (err)
>> +               goto err;
>> +
>> +       if (!i915_vm_tryget(ce->vm)) {
>> +               err = -ENOENT;
>> +               goto err;
>> +       }
>> +
>> +       eb->context = ce;
>> +       eb->gt = ce->engine->gt;
>> +
>> +       /*
>> +        * Make sure engine pool stays alive even if we call
>> intel_context_put
>> +        * during ww handling. The pool is destroyed when last pm
>> reference
>> +        * is dropped, which breaks our -EDEADLK handling.
>> +        */
>> +       return err;
>> +
>> +err:
>> +       intel_gt_pm_put(ce->engine->gt);
>> +       for_each_child(ce, child)
>> +               intel_context_put(child);
>> +       intel_context_put(ce);
>> +       return err;
>> +}
>> +
>> +static void
>> +eb_put_engine(struct i915_execbuffer *eb)
>> +{
>> +       struct intel_context *child;
>> +
>> +       i915_vm_put(eb->context->vm);
>> +       intel_gt_pm_put(eb->gt);
>> +       for_each_child(eb->context, child)
>> +               intel_context_put(child);
>> +       intel_context_put(eb->context);
>> +}
>> +
>> +static void
>> +__free_fence_array(struct eb_fence *fences, unsigned int n)
>> +{
>> +       while (n--) {
>> +               drm_syncobj_put(ptr_mask_bits(fences[n].syncobj, 2));
>> +               dma_fence_put(fences[n].dma_fence);
>> +               dma_fence_chain_free(fences[n].chain_fence);
>> +       }
>> +       kvfree(fences);
>> +}
>> +
>> +static int add_timeline_fence_array(struct i915_execbuffer *eb)
>> +{
>> +       struct drm_i915_gem_timeline_fence __user *user_fences;
>> +       struct eb_fence *f;
>> +       u64 nfences;
>> +       int err = 0;
>> +
>> +       nfences = eb->args->fence_count;
>> +       if (!nfences)
>> +               return 0;
>> +
>> +       /* Check multiplication overflow for access_ok() and
>> kvmalloc_array() */
>> +       BUILD_BUG_ON(sizeof(size_t) > sizeof(unsigned long));
>> +       if (nfences > min_t(unsigned long,
>> +                           ULONG_MAX / sizeof(*user_fences),
>> +                           SIZE_MAX / sizeof(*f)) - eb->num_fences)
>> +               return -EINVAL;
>> +
>> +       user_fences = u64_to_user_ptr(eb->args->timeline_fences);
>> +       if (!access_ok(user_fences, nfences * sizeof(*user_fences)))
>> +               return -EFAULT;
>> +
>> +       f = krealloc(eb->fences,
>> +                    (eb->num_fences + nfences) * sizeof(*f),
>> +                    __GFP_NOWARN | GFP_KERNEL);
>> +       if (!f)
>> +               return -ENOMEM;
>> +
>> +       eb->fences = f;
>> +       f += eb->num_fences;
>> +
>> +       BUILD_BUG_ON(~(ARCH_KMALLOC_MINALIGN - 1) &
>> +                    ~__I915_TIMELINE_FENCE_UNKNOWN_FLAGS);
>> +
>> +       while (nfences--) {
>> +               struct drm_i915_gem_timeline_fence user_fence;
>> +               struct drm_syncobj *syncobj;
>> +               struct dma_fence *fence = NULL;
>> +               u64 point;
>> +
>> +               if (__copy_from_user(&user_fence,
>> +                                    user_fences++,
>> +                                    sizeof(user_fence)))
>> +                       return -EFAULT;
>> +
>> +               if (user_fence.flags &
>> __I915_TIMELINE_FENCE_UNKNOWN_FLAGS)
>> +                       return -EINVAL;
>> +
>> +               syncobj = drm_syncobj_find(eb->file,
>> user_fence.handle);
>> +               if (!syncobj) {
>> +                       DRM_DEBUG("Invalid syncobj handle
>> provided\n");
>> +                       return -ENOENT;
>> +               }
>> +
>> +               fence = drm_syncobj_fence_get(syncobj);
>> +
>> +               if (!fence && user_fence.flags &&
>> +                   !(user_fence.flags & I915_TIMELINE_FENCE_SIGNAL))
>> {
>> +                       DRM_DEBUG("Syncobj handle has no fence\n");
>> +                       drm_syncobj_put(syncobj);
>> +                       return -EINVAL;
>> +               }
>> +
>> +               point = user_fence.value;
>> +               if (fence)
>> +                       err = dma_fence_chain_find_seqno(&fence,
>> point);
>> +
>> +               if (err && !(user_fence.flags &
>> I915_TIMELINE_FENCE_SIGNAL)) {
>> +                       DRM_DEBUG("Syncobj handle missing requested
>> point %llu\n", point);
>> +                       dma_fence_put(fence);
>> +                       drm_syncobj_put(syncobj);
>> +                       return err;
>> +               }
>> +
>> +               /*
>> +                * A point might have been signaled already and
>> +                * garbage collected from the timeline. In this case
>> +                * just ignore the point and carry on.
>> +                */
>> +               if (!fence && !(user_fence.flags &
>> I915_TIMELINE_FENCE_SIGNAL)) {
>> +                       drm_syncobj_put(syncobj);
>> +                       continue;
>> +               }
>> +
>> +               /*
>> +                * For timeline syncobjs we need to preallocate
>> chains for
>> +                * later signaling.
>> +                */
>> +               if (point != 0 && user_fence.flags &
>> I915_TIMELINE_FENCE_SIGNAL) {
>> +                       /*
>> +                        * Waiting and signaling the same point (when
>> point !=
>> +                        * 0) would break the timeline.
>> +                        */
>> +                       if (user_fence.flags &
>> I915_TIMELINE_FENCE_WAIT) {
>> +                               DRM_DEBUG("Trying to wait & signal
>> the same timeline point.\n");
>> +                               dma_fence_put(fence);
>> +                               drm_syncobj_put(syncobj);
>> +                               return -EINVAL;
>> +                       }
>> +
>> +                       f->chain_fence = dma_fence_chain_alloc();
>> +                       if (!f->chain_fence) {
>> +                               drm_syncobj_put(syncobj);
>> +                               dma_fence_put(fence);
>> +                               return -ENOMEM;
>> +                       }
>> +               } else {
>> +                       f->chain_fence = NULL;
>> +               }
>> +
>> +               f->syncobj = ptr_pack_bits(syncobj, user_fence.flags,
>> 2);
>> +               f->dma_fence = fence;
>> +               f->value = point;
>> +               f++;
>> +               eb->num_fences++;
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>> +static void put_fence_array(struct eb_fence *fences, int num_fences)
>> +{
>> +       if (fences)
>> +               __free_fence_array(fences, num_fences);
>> +}
>> +
>> +static int
>> +await_fence_array(struct i915_execbuffer *eb,
>> +                 struct i915_request *rq)
>> +{
>> +       unsigned int n;
>> +       int err;
>> +
>> +       for (n = 0; n < eb->num_fences; n++) {
>> +               struct drm_syncobj *syncobj;
>> +               unsigned int flags;
>> +
>> +               syncobj = ptr_unpack_bits(eb->fences[n].syncobj,
>> &flags, 2);
>> +
>> +               if (!eb->fences[n].dma_fence)
>> +                       continue;
>> +
>> +               err = i915_request_await_dma_fence(rq, eb-
>> >fences[n].dma_fence);
>> +               if (err < 0)
>> +                       return err;
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>> +static void signal_fence_array(const struct i915_execbuffer *eb,
>> +                              struct dma_fence * const fence)
>> +{
>> +       unsigned int n;
>> +
>> +       for (n = 0; n < eb->num_fences; n++) {
>> +               struct drm_syncobj *syncobj;
>> +               unsigned int flags;
>> +
>> +               syncobj = ptr_unpack_bits(eb->fences[n].syncobj,
>> &flags, 2);
>> +               if (!(flags & I915_TIMELINE_FENCE_SIGNAL))
>> +                       continue;
>> +
>> +               if (eb->fences[n].chain_fence) {
>> +                       drm_syncobj_add_point(syncobj,
>> +                                             eb-
>> >fences[n].chain_fence,
>> +                                             fence,
>> +                                             eb->fences[n].value);
>> +                       /*
>> +                        * The chain's ownership is transferred to
>> the
>> +                        * timeline.
>> +                        */
>> +                       eb->fences[n].chain_fence = NULL;
>> +               } else {
>> +                       drm_syncobj_replace_fence(syncobj, fence);
>> +               }
>> +       }
>> +}
>> +
>> +static int parse_timeline_fences(struct i915_execbuffer *eb)
>> +{
>> +       return add_timeline_fence_array(eb);
>> +}
>> +
>> +static int parse_batch_addresses(struct i915_execbuffer *eb)
>> +{
>> +       struct drm_i915_gem_execbuffer3 *args = eb->args;
>> +       u64 __user *batch_addr = u64_to_user_ptr(args-
>> >batch_address);
>> +
>> +       if (copy_from_user(eb->batch_addresses, batch_addr,
>> +                          sizeof(batch_addr[0]) * eb->num_batches))
>> +               return -EFAULT;
>> +
>> +       return 0;
>> +}
>> +
>> +static void retire_requests(struct intel_timeline *tl, struct
>> i915_request *end)
>> +{
>> +       struct i915_request *rq, *rn;
>> +
>> +       list_for_each_entry_safe(rq, rn, &tl->requests, link)
>> +               if (rq == end || !i915_request_retire(rq))
>> +                       break;
>> +}
>> +
>> +static int eb_request_add(struct i915_execbuffer *eb, struct
>> i915_request *rq,
>> +                         int err, bool last_parallel)
>> +{
>> +       struct intel_timeline * const tl = i915_request_timeline(rq);
>> +       struct i915_sched_attr attr = {};
>> +       struct i915_request *prev;
>> +
>> +       lockdep_assert_held(&tl->mutex);
>> +       lockdep_unpin_lock(&tl->mutex, rq->cookie);
>> +
>> +       trace_i915_request_add(rq);
>> +
>> +       prev = __i915_request_commit(rq);
>> +
>> +       /* Check that the context wasn't destroyed before submission
>> */
>> +       if (likely(!intel_context_is_closed(eb->context))) {
>> +               attr = eb->gem_context->sched;
>> +       } else {
>> +               /* Serialise with context_close via the
>> add_to_timeline */
>> +               i915_request_set_error_once(rq, -ENOENT);
>> +               __i915_request_skip(rq);
>> +               err = -ENOENT; /* override any transient errors */
>> +       }
>> +
>> +       if (intel_context_is_parallel(eb->context)) {
>> +               if (err) {
>> +                       __i915_request_skip(rq);
>> +                       set_bit(I915_FENCE_FLAG_SKIP_PARALLEL,
>> +                               &rq->fence.flags);
>> +               }
>> +               if (last_parallel)
>> +                       set_bit(I915_FENCE_FLAG_SUBMIT_PARALLEL,
>> +                               &rq->fence.flags);
>> +       }
>> +
>> +       __i915_request_queue(rq, &attr);
>> +
>> +       /* Try to clean up the client's timeline after submitting the
>> request */
>> +       if (prev)
>> +               retire_requests(tl, prev);
>> +
>> +       mutex_unlock(&tl->mutex);
>> +
>> +       return err;
>> +}
>> +
>> +static int eb_requests_add(struct i915_execbuffer *eb, int err)
>> +{
>> +       int i;
>> +
>> +       /*
>> +        * We iterate in reverse order of creation to release
>> timeline mutexes in
>> +        * same order.
>> +        */
>> +       for_each_batch_add_order(eb, i) {
>> +               struct i915_request *rq = eb->requests[i];
>> +
>> +               if (!rq)
>> +                       continue;
>> +               err |= eb_request_add(eb, rq, err, i == 0);
>> +       }
>> +
>> +       return err;
>> +}
>> +
>> +static void eb_requests_get(struct i915_execbuffer *eb)
>> +{
>> +       unsigned int i;
>> +
>> +       for_each_batch_create_order(eb, i) {
>> +               if (!eb->requests[i])
>> +                       break;
>> +
>> +               i915_request_get(eb->requests[i]);
>> +       }
>> +}
>> +
>> +static void eb_requests_put(struct i915_execbuffer *eb)
>> +{
>> +       unsigned int i;
>> +
>> +       for_each_batch_create_order(eb, i) {
>> +               if (!eb->requests[i])
>> +                       break;
>> +
>> +               i915_request_put(eb->requests[i]);
>> +       }
>> +}
>> +
>> +static int
>> +eb_composite_fence_create(struct i915_execbuffer *eb)
>> +{
>> +       struct dma_fence_array *fence_array;
>> +       struct dma_fence **fences;
>> +       unsigned int i;
>> +
>> +       GEM_BUG_ON(!intel_context_is_parent(eb->context));
>> +
>> +       fences = kmalloc_array(eb->num_batches, sizeof(*fences),
>> GFP_KERNEL);
>> +       if (!fences)
>> +               return -ENOMEM;
>> +
>> +       for_each_batch_create_order(eb, i) {
>> +               fences[i] = &eb->requests[i]->fence;
>> +               __set_bit(I915_FENCE_FLAG_COMPOSITE,
>> +                         &eb->requests[i]->fence.flags);
>> +       }
>> +
>> +       fence_array = dma_fence_array_create(eb->num_batches,
>> +                                            fences,
>> +                                            eb->context-
>> >parallel.fence_context,
>> +                                            eb->context-
>> >parallel.seqno++,
>> +                                            false);
>> +       if (!fence_array) {
>> +               kfree(fences);
>> +               return -ENOMEM;
>> +       }
>> +
>> +       /* Move ownership to the dma_fence_array created above */
>> +       for_each_batch_create_order(eb, i)
>> +               dma_fence_get(fences[i]);
>> +
>> +       eb->composite_fence = &fence_array->base;
>> +
>> +       return 0;
>> +}
>> +
>> +static int
>> +eb_fences_add(struct i915_execbuffer *eb, struct i915_request *rq)
>> +{
>> +       int err;
>> +
>> +       if (unlikely(eb->gem_context->syncobj)) {
>> +               struct dma_fence *fence;
>> +
>> +               fence = drm_syncobj_fence_get(eb->gem_context-
>> >syncobj);
>> +               err = i915_request_await_dma_fence(rq, fence);
>> +               dma_fence_put(fence);
>> +               if (err)
>> +                       return err;
>> +       }
>> +
>> +       if (eb->fences) {
>> +               err = await_fence_array(eb, rq);
>> +               if (err)
>> +                       return err;
>> +       }
>> +
>> +       if (intel_context_is_parallel(eb->context)) {
>> +               err = eb_composite_fence_create(eb);
>> +               if (err)
>> +                       return err;
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>> +static struct intel_context *
>> +eb_find_context(struct i915_execbuffer *eb, unsigned int
>> context_number)
>> +{
>> +       struct intel_context *child;
>> +
>> +       if (likely(context_number == 0))
>> +               return eb->context;
>> +
>> +       for_each_child(eb->context, child)
>> +               if (!--context_number)
>> +                       return child;
>> +
>> +       GEM_BUG_ON("Context not found");
>> +
>> +       return NULL;
>> +}
>> +
>> +static int eb_requests_create(struct i915_execbuffer *eb)
>> +{
>> +       unsigned int i;
>> +       int err;
>> +
>> +       for_each_batch_create_order(eb, i) {
>> +               /* Allocate a request for this batch buffer nice and
>> early. */
>> +               eb->requests[i] =
>> i915_request_create(eb_find_context(eb, i));
>> +               if (IS_ERR(eb->requests[i])) {
>> +                       err = PTR_ERR(eb->requests[i]);
>> +                       eb->requests[i] = NULL;
>> +                       return err;
>> +               }
>> +
>> +               /*
>> +                * Only the first request added (committed to
>> backend) has to
>> +                * take the in fences into account as all subsequent
>> requests
>> +                * will have fences inserted inbetween them.
>> +                */
>> +               if (i + 1 == eb->num_batches) {
>> +                       err = eb_fences_add(eb, eb->requests[i]);
>> +                       if (err)
>> +                               return err;
>> +               }
>
>One thing I was hoping with the brand new execbuf3 IOCTL would be that
>we could actually make it dma_fence_signalling critical path compliant.
>
>That would mean annotate the dma_fence_signalling critical path just
>after the first request is created and ending it just before that same
>request was added.
>
>The main violators are memory allocated when adding dependencies in
>eb_fences_add(), but since those now are sort of limited in number, we
>might be able to pre-allocate that memory before the first request is
>created.
>
>The other main violator would be the multiple batch-buffers. Is this
>mode of operation strictly needed for version 1 or can we ditch it?
>

Hmm...I am not sure about multiple batch-buffers question. As Mesa is
the primary usecase, probably Mesa folks can answer that?

But, given we have to support to in any case, may be we can keep that
support and take on the dma_fence_signaling critical path annotation
separately in a subsequent patch series?

Niranjana

>
>
>> +
>> +               /*
>> +                * Not really on stack, but we don't want to call
>> +                * kfree on the batch_snapshot when we put it, so use
>> the
>> +                * _onstack interface.
>
>This comment is stale and can be removed.
>
>
>/Thomas
>
