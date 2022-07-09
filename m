Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A8956CB5C
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jul 2022 22:24:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 458B9112F6A;
	Sat,  9 Jul 2022 20:24:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30834112298;
 Sat,  9 Jul 2022 20:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657398257; x=1688934257;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=+QQuQLwoLR67dhL+kQsnYggm13/AHYQRsgvlwzJ+yyk=;
 b=Nfkc2PVbHpLYK+ePvjNoSiTKBLoStLXB0VN347vbGG9U8emM32dFUEPg
 nOJs0ABLQEf2JaJWqwOlX6IOLvW3Iax73hCMcH/31ytDXYAFz3PMCSnVH
 GNcDgm7AGFmctq35Ia8Yx4nGCOSnFBpz54q9i+gDmwI/X2pgqLFJeGxbR
 VhwOdHTtWZ+v0AKB7mA83VTGU4xR6hGP6WUIeapk2jgapc678G///HZsf
 0UdBTD2MY3GgVExbODg/RMcz1G0A2k/e6UIRcJw6rpdRRNI0gYhmtWpl9
 BEazzNDKOWdZVl810U31GKsgGv2M5Fl8fQXeiwA0qc3LK+bPP3h9f4MyB Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10403"; a="346144050"
X-IronPort-AV: E=Sophos;i="5.92,259,1650956400"; d="scan'208";a="346144050"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2022 13:24:17 -0700
X-IronPort-AV: E=Sophos;i="5.92,259,1650956400"; d="scan'208";a="621615946"
Received: from nvishwa1-desk.sc.intel.com (HELO nvishwa1-DESK) ([172.25.29.76])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2022 13:24:15 -0700
Date: Sat, 9 Jul 2022 13:23:56 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
Subject: Re: [RFC 06/10] drm/i915/vm_bind: Add I915_GEM_EXECBUFFER3 ioctl
Message-ID: <20220709202355.GC14039@nvishwa1-DESK>
References: <20220701225055.8204-1-niranjana.vishwanathapura@intel.com>
 <20220701225055.8204-7-niranjana.vishwanathapura@intel.com>
 <b652db18dc2ea6724aae175420192a8fc4fe932d.camel@intel.com>
 <20220708134723.GW14039@nvishwa1-DESK>
 <74bbde76b87185c3f89a74432242d1a1f8f180af.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <74bbde76b87185c3f89a74432242d1a1f8f180af.camel@intel.com>
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

On Fri, Jul 08, 2022 at 07:37:30AM -0700, Hellstrom, Thomas wrote:
>Hi,
>
>On Fri, 2022-07-08 at 06:47 -0700, Niranjana Vishwanathapura wrote:
>> On Thu, Jul 07, 2022 at 07:41:54AM -0700, Hellstrom, Thomas wrote:
>> > On Fri, 2022-07-01 at 15:50 -0700, Niranjana Vishwanathapura wrote:
>> > > Add new execbuf3 ioctl (I915_GEM_EXECBUFFER3) which only
>> > > works in vm_bind mode. The vm_bind mode only works with
>> > > this new execbuf3 ioctl.
>> > >
>> > > The new execbuf3 ioctl will not have any execlist
>> >
>> > I understand this that you mean there is no list of objects to
>> > validate
>> > attached to the drm_i915_gem_execbuffer3 structure rather than that
>> > the
>> > execlists submission backend is never used. Could we clarify this
>> > to
>> > avoid confusion.
>>
>> Yah, side effect of overloading the word 'execlist' for multiple
>> things.
>> Yah, I meant, no list of objects to validate. I agree, we need to
>> clarify
>> that here.
>>
>> >
>> >
>> > >  support
>> > > and all the legacy support like relocations etc are removed.
>> > >
>> > > Signed-off-by: Niranjana Vishwanathapura
>> > > <niranjana.vishwanathapura@intel.com>
>> > > ---
>> > >  drivers/gpu/drm/i915/Makefile                 |    1 +
>> > >  .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |    5 +
>> > >  .../gpu/drm/i915/gem/i915_gem_execbuffer3.c   | 1029
>> > > +++++++++++++++++
>> > >  drivers/gpu/drm/i915/gem/i915_gem_ioctls.h    |    2 +
>> > >  drivers/gpu/drm/i915/i915_driver.c            |    1 +
>> > >  include/uapi/drm/i915_drm.h                   |   67 +-
>> > >  6 files changed, 1104 insertions(+), 1 deletion(-)
>> > >  create mode 100644
>> > > drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c
>> > >
>> > > diff --git a/drivers/gpu/drm/i915/Makefile
>> > > b/drivers/gpu/drm/i915/Makefile
>> > > index 4e1627e96c6e..38cd1c5bc1a5 100644
>> > > --- a/drivers/gpu/drm/i915/Makefile
>> > > +++ b/drivers/gpu/drm/i915/Makefile
>> > > @@ -148,6 +148,7 @@ gem-y += \
>> > >         gem/i915_gem_dmabuf.o \
>> > >         gem/i915_gem_domain.o \
>> > >         gem/i915_gem_execbuffer.o \
>> > > +       gem/i915_gem_execbuffer3.o \
>> > >         gem/i915_gem_internal.o \
>> > >         gem/i915_gem_object.o \
>> > >         gem/i915_gem_lmem.o \
>> > > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>> > > b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>> > > index b7b2c14fd9e1..37bb1383ab8f 100644
>> > > --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>> > > +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>> > > @@ -782,6 +782,11 @@ static int eb_select_context(struct
>> > > i915_execbuffer *eb)
>> > >         if (unlikely(IS_ERR(ctx)))
>> > >                 return PTR_ERR(ctx);
>> > >
>> > > +       if (ctx->vm->vm_bind_mode) {
>> > > +               i915_gem_context_put(ctx);
>> > > +               return -EOPNOTSUPP;
>> > > +       }
>> > > +
>> > >         eb->gem_context = ctx;
>> > >         if (i915_gem_context_has_full_ppgtt(ctx))
>> > >                 eb->invalid_flags |= EXEC_OBJECT_NEEDS_GTT;
>> > > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c
>> > > b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c
>> > > new file mode 100644
>> > > index 000000000000..13121df72e3d
>> > > --- /dev/null
>> > > +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c
>> > > @@ -0,0 +1,1029 @@
>> > > +// SPDX-License-Identifier: MIT
>> > > +/*
>> > > + * Copyright © 2022 Intel Corporation
>> > > + */
>> > > +
>> > > +#include <linux/dma-resv.h>
>> > > +#include <linux/sync_file.h>
>> > > +#include <linux/uaccess.h>
>> > > +
>> > > +#include <drm/drm_syncobj.h>
>> > > +
>> > > +#include "gt/intel_context.h"
>> > > +#include "gt/intel_gpu_commands.h"
>> > > +#include "gt/intel_gt.h"
>> > > +#include "gt/intel_gt_pm.h"
>> > > +#include "gt/intel_ring.h"
>> > > +
>> > > +#include "i915_drv.h"
>> > > +#include "i915_file_private.h"
>> > > +#include "i915_gem_context.h"
>> > > +#include "i915_gem_ioctls.h"
>> > > +#include "i915_gem_vm_bind.h"
>> > > +#include "i915_trace.h"
>> > > +
>> > > +#define __EXEC3_ENGINE_PINNED          BIT_ULL(32)
>> > > +#define __EXEC3_INTERNAL_FLAGS         (~0ull << 32)
>> > > +
>> > > +/* Catch emission of unexpected errors for CI! */
>> > > +#if IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM)
>> > > +#undef EINVAL
>> > > +#define EINVAL ({ \
>> > > +       DRM_DEBUG_DRIVER("EINVAL at %s:%d\n", __func__,
>> > > __LINE__); \
>> > > +       22; \
>> > > +})
>> > > +#endif
>> > > +
>> > > +/**
>> > > + * DOC: User command execution with execbuf3 ioctl
>> > > + *
>> > > + * A VM in VM_BIND mode will not support older execbuf mode of
>> > > binding.
>> > > + * The execbuf ioctl handling in VM_BIND mode differs
>> > > significantly
>> > > from the
>> > > + * older execbuf2 ioctl (See struct drm_i915_gem_execbuffer2).
>> > > + * Hence, a new execbuf3 ioctl has been added to support VM_BIND
>> > > mode. (See
>> > > + * struct drm_i915_gem_execbuffer3). The execbuf3 ioctl will not
>> > > accept any
>> > > + * execlist. Hence, no support for implicit sync.
>> > > + *
>> > > + * The new execbuf3 ioctl only works in VM_BIND mode and the
>> > > VM_BIND
>> > > mode only
>> > > + * works with execbuf3 ioctl for submission.
>> > > + *
>> > > + * The execbuf3 ioctl directly specifies the batch addresses
>> > > instead
>> > > of as
>> > > + * object handles as in execbuf2 ioctl. The execbuf3 ioctl will
>> > > also
>> > > not
>> > > + * support many of the older features like in/out/submit fences,
>> > > fence array,
>> > > + * default gem context etc. (See struct
>> > > drm_i915_gem_execbuffer3).
>> > > + *
>> > > + * In VM_BIND mode, VA allocation is completely managed by the
>> > > user
>> > > instead of
>> > > + * the i915 driver. Hence all VA assignment, eviction are not
>> > > applicable in
>> > > + * VM_BIND mode. Also, for determining object activeness,
>> > > VM_BIND
>> > > mode will not
>> > > + * be using the i915_vma active reference tracking. It will
>> > > instead
>> > > check the
>> > > + * dma-resv object's fence list for that.
>> > > + *
>> > > + * So, a lot of code supporting execbuf2 ioctl, like
>> > > relocations, VA
>> > > evictions,
>> > > + * vma lookup table, implicit sync, vma active reference
>> > > tracking
>> > > etc., are not
>> > > + * applicable for execbuf3 ioctl.
>> > > + */
>> > > +
>> > > +struct eb_fence {
>> > > +       struct drm_syncobj *syncobj; /* Use with ptr_mask_bits()
>> > > */
>> > > +       struct dma_fence *dma_fence;
>> > > +       u64 value;
>> > > +       struct dma_fence_chain *chain_fence;
>> > > +};
>> > > +
>> > > +struct i915_execbuffer {
>> > > +       struct drm_i915_private *i915; /** i915 backpointer */
>> > > +       struct drm_file *file; /** per-file lookup tables and
>> > > limits
>> > > */
>> > > +       struct drm_i915_gem_execbuffer3 *args; /** ioctl
>> > > parameters
>> > > */
>> > > +
>> > > +       struct intel_gt *gt; /* gt for the execbuf */
>> > > +       struct intel_context *context; /* logical state for the
>> > > request */
>> > > +       struct i915_gem_context *gem_context; /** caller's
>> > > context */
>> > > +
>> > > +       /** our requests to build */
>> > > +       struct i915_request *requests[MAX_ENGINE_INSTANCE + 1];
>> > > +
>> > > +       /** used for excl fence in dma_resv objects when > 1 BB
>> > > submitted */
>> > > +       struct dma_fence *composite_fence;
>> > > +
>> > > +       struct i915_gem_ww_ctx ww;
>> > > +
>> > > +       /* number of batches in execbuf IOCTL */
>> > > +       unsigned int num_batches;
>> > > +
>> > > +       u64 batch_addresses[MAX_ENGINE_INSTANCE + 1];
>> > > +       /** identity of the batch obj/vma */
>> > > +       struct i915_vma *batches[MAX_ENGINE_INSTANCE + 1];
>> > > +
>> > > +       struct eb_fence *fences;
>> > > +       unsigned long num_fences;
>> > > +};
>> >
>> > Kerneldoc structures please.
>> >
>> > It seems we are duplicating a lot of code from i915_execbuffer.c.
>> > Did
>> > you consider
>> >
>> > struct i915_execbuffer3 {
>> > ...
>> > };
>> >
>> > struct i915_execbuffer2 {
>> >        struct i915_execbuffer3 eb3;
>> >        ...
>> >        [members that are not common]
>> > };
>> >
>> > Allowing execbuffer2 to share the execbuffer3 code to some extent.
>> > Not sure about the gain at this point though. My worry would be
>> > that fo
>> > r example fixes might be applied to one file and not the other.
>>
>> I have added a TODO in the cover letter of this patch series to share
>> the code between execbuf2 and execbuf3.
>> But, I am not sure to what extent. Execbuf3 is much leaner than
>> execbuf2
>> and we don't want to make it bad by forcing code sharing with legacy
>> path.
>> We can perhaps abstract out some functions which takes specific
>> arguments
>> (instead of 'eb'), that way we can keep these structures separate and
>> still
>> share some code.
>
>
>Fully agree we shouldn't make eb3 code more complicated because of eb2.
>My question was more of using i915_execbuffer3 and its functions as a
>"base class" and subclass it for eb2, eb2 adding and implementing
>additional functionality it needs.

Yah, this was Daniel's feedback before the new execbuf3 was proposed.
A base eb class derived to execlist mode and vm_bind mode eb classes.

I think that this will require lot of changes in the legacy execbuf2
code, which we are now not touching for VM_BIND mode. Hence, I am not
sure if it is worth it.

>
>But OTOH I just learned we've might have been asked not to share any
>code between those two from drm maintainers, so need to dig up that
>discussion.

Yah, that is what I understood from the VM_BIND design feedback.
Here I am only thinking about possiblity having some common helper
functions that both can make use of (like eb_pin/unpin_engine etc).

Niranjana

>
>/Thomas
>
>
>
