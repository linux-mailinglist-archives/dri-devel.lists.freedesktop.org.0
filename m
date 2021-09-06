Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE25401844
	for <lists+dri-devel@lfdr.de>; Mon,  6 Sep 2021 10:51:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91DBD8957D;
	Mon,  6 Sep 2021 08:51:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F13098957D
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Sep 2021 08:51:47 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id q11so8666627wrr.9
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Sep 2021 01:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=/zC7T9LOb8BbJOsEWrdsQXxCqTMUe0H5oBlU/CmwugE=;
 b=FJSbAjHnuhb1o3BpYnsW/1rjuq32ufOuVqsjkSQcpIPHXT9uDvnyi04p/i0nbTp2Ze
 weQ8V/9aQHk98vF6vr8ul/1bIO1xKKL7b2ETjgDWO7LtYUAN/nBFurwKkse9nKi4z1rL
 E/xpb6glnkldTYInoRjH7CgbMwTcmJDgBwMLM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=/zC7T9LOb8BbJOsEWrdsQXxCqTMUe0H5oBlU/CmwugE=;
 b=NlxeueBIjbVWH0+h8PA8KlhDlkuUQnGjMA0HUpWSqy90qdUN8rYcJq20NYweNt/Mfi
 PFxtxGnVP76KhK3mBYaDUHETEpYi91Aw4zoO+tEaC5DeXUKV1kGyxEMf4p5bpzSLbKUn
 r3z6AcatoIFVjy4Whor45HcBaBqynBOsNwDd0uWS3mQKMj6SW9UnmA5Sm7FGySDzj9sE
 3y4ra3tX564oj3QsLq+SOlPOSoHxfT3Tr7aSNHIZgdbTI0xChVcVTFMcgrfr9UZPtrUM
 R6OAADet9z13xw4/7/tuZiw6AOLe4eS816qzNZXf6cq0sbMjOFjUQGFBRltzD3UGsrR5
 /E8A==
X-Gm-Message-State: AOAM530GE6KWNXtZmSHANjONIIKS+gnh2BdoQc2rpdEejjSIKzrIXTJ6
 tHY2qfZWIf1wPp11kLwkUQsBMQ==
X-Google-Smtp-Source: ABdhPJwnBEY6DLLS9Wvzg+oiuRSAKl3WXT0h8oQ9hXTc/l1OOH/OOe9FmaUkOTEMhwDUrRYqMukDmA==
X-Received: by 2002:adf:b743:: with SMTP id n3mr11925813wre.243.1630918306359; 
 Mon, 06 Sep 2021 01:51:46 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id d9sm7014641wrm.21.2021.09.06.01.51.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 01:51:45 -0700 (PDT)
Date: Mon, 6 Sep 2021 10:51:39 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Jon Bloomfield <jon.bloomfield@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Dave Airlie <airlied@redhat.com>, Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [Intel-gfx] [PATCH 05/11] drm/i915: Rename
 i915_gem_context_get_vm_rcu to i915_gem_context_get_eb_vm
Message-ID: <YTXWmy0DRBmDtQVK@phenom.ffwll.local>
References: <20210902142057.929669-1-daniel.vetter@ffwll.ch>
 <20210902142057.929669-5-daniel.vetter@ffwll.ch>
 <2a1f1395-2fe3-3c3d-48a6-bf741f910023@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2a1f1395-2fe3-3c3d-48a6-bf741f910023@linux.intel.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 03, 2021 at 09:05:00AM +0100, Tvrtko Ursulin wrote:
> 
> On 02/09/2021 15:20, Daniel Vetter wrote:
> > The important part isn't so much that this does an rcu lookup - that's
> > more an implementation detail, which will also be removed.
> > 
> > The thing that makes this different from other functions is that it's
> > gettting you the vm that batchbuffers will run in for that gem
> > context, which is either a full ppgtt stored in gem->ctx, or the ggtt.
> > 
> > We'll make more use of this function later on.
> > 
> > Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Jon Bloomfield <jon.bloomfield@intel.com>
> > Cc: Chris Wilson <chris@chris-wilson.co.uk>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> > Cc: Dave Airlie <airlied@redhat.com>
> > Cc: Jason Ekstrand <jason@jlekstrand.net>
> > ---
> >   drivers/gpu/drm/i915/gem/i915_gem_context.h           | 2 +-
> >   drivers/gpu/drm/i915/gem/selftests/huge_pages.c       | 4 ++--
> >   drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c | 4 ++--
> >   drivers/gpu/drm/i915/gt/selftest_execlists.c          | 2 +-
> >   drivers/gpu/drm/i915/gt/selftest_hangcheck.c          | 2 +-
> >   drivers/gpu/drm/i915/selftests/i915_gem_gtt.c         | 4 ++--
> >   drivers/gpu/drm/i915/selftests/i915_vma.c             | 2 +-
> >   7 files changed, 10 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.h b/drivers/gpu/drm/i915/gem/i915_gem_context.h
> > index 18060536b0c2..da6e8b506d96 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_context.h
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.h
> > @@ -155,7 +155,7 @@ i915_gem_context_vm(struct i915_gem_context *ctx)
> >   }
> >   static inline struct i915_address_space *
> > -i915_gem_context_get_vm_rcu(struct i915_gem_context *ctx)
> > +i915_gem_context_get_eb_vm(struct i915_gem_context *ctx)
> >   {
> >   	struct i915_address_space *vm;
> > diff --git a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
> > index a094f3ce1a90..6c68fe26bb32 100644
> > --- a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
> > +++ b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
> > @@ -1456,7 +1456,7 @@ static int igt_tmpfs_fallback(void *arg)
> >   	struct i915_gem_context *ctx = arg;
> >   	struct drm_i915_private *i915 = ctx->i915;
> >   	struct vfsmount *gemfs = i915->mm.gemfs;
> > -	struct i915_address_space *vm = i915_gem_context_get_vm_rcu(ctx);
> > +	struct i915_address_space *vm = i915_gem_context_get_eb_vm(ctx);
> >   	struct drm_i915_gem_object *obj;
> >   	struct i915_vma *vma;
> >   	u32 *vaddr;
> > @@ -1512,7 +1512,7 @@ static int igt_shrink_thp(void *arg)
> >   {
> >   	struct i915_gem_context *ctx = arg;
> >   	struct drm_i915_private *i915 = ctx->i915;
> > -	struct i915_address_space *vm = i915_gem_context_get_vm_rcu(ctx);
> > +	struct i915_address_space *vm = i915_gem_context_get_eb_vm(ctx);
> 
> Problem here (and probably elsewhere) is that this test does no "eb", nor
> even submits any requests for execution.
> 
> More so, execbuf path does currently rely on intel_context->vm which is
> always set. So I really wonder how it would look, what I touched on
> elsewhere in the thread, if we instead made ctx->vm always point to
> something. It would align the rules between intel_context and GEM context
> and may end up with a more consistent situation.

The entire thing is substantially more messy, and my few quick attempts at
fixing this went flat.

The thing is, this _is_ the vm we use for execbuf, patch 8 changes intel
context initialization to also use this function. I do think it would make
sense to always set the right vm in gem_ctx->vm, but when I tried to do
that I've also tried to implement a bit stricter rules for
intel_context->vm. Currently that's initialized to the single gt vm deep
down in the per-type (virtual vs engine ctx) code, and then later on we'd
overwrite that. My idea was that we'd no longer set the intel_context->vm
in low-level code at all, but instead the variuos callers that create the
ctx either pass the right vm down, or set it after initial setup is done.

This way we'd be guaranteed that we never accidentally run a userspace
context on the kernel's gt vm, which would be bad.

The problem was that the entire refactor became really messy, and it was
conflicting against the GuC stuff and the changed engines there, so I
figured I'll drop it. There's more locking cleanup tbd, so I'll keep that
on the list of things. Maybe once intel_context creation is a bit more
untangled.
-Daniel

> 
> Regards,
> 
> Tvrtko
> 
> >   	struct drm_i915_gem_object *obj;
> >   	struct i915_gem_engines_iter it;
> >   	struct intel_context *ce;
> > diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
> > index 4d2758718d21..fc7fb33a3a52 100644
> > --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
> > +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
> > @@ -1528,7 +1528,7 @@ static int write_to_scratch(struct i915_gem_context *ctx,
> >   	intel_gt_chipset_flush(engine->gt);
> > -	vm = i915_gem_context_get_vm_rcu(ctx);
> > +	vm = i915_gem_context_get_eb_vm(ctx);
> >   	vma = i915_vma_instance(obj, vm, NULL);
> >   	if (IS_ERR(vma)) {
> >   		err = PTR_ERR(vma);
> > @@ -1607,7 +1607,7 @@ static int read_from_scratch(struct i915_gem_context *ctx,
> >   	if (GRAPHICS_VER(i915) >= 8) {
> >   		const u32 GPR0 = engine->mmio_base + 0x600;
> > -		vm = i915_gem_context_get_vm_rcu(ctx);
> > +		vm = i915_gem_context_get_eb_vm(ctx);
> >   		vma = i915_vma_instance(obj, vm, NULL);
> >   		if (IS_ERR(vma)) {
> >   			err = PTR_ERR(vma);
> > diff --git a/drivers/gpu/drm/i915/gt/selftest_execlists.c b/drivers/gpu/drm/i915/gt/selftest_execlists.c
> > index f12ffe797639..b3863abc51f5 100644
> > --- a/drivers/gpu/drm/i915/gt/selftest_execlists.c
> > +++ b/drivers/gpu/drm/i915/gt/selftest_execlists.c
> > @@ -3493,7 +3493,7 @@ static int smoke_submit(struct preempt_smoke *smoke,
> >   	if (batch) {
> >   		struct i915_address_space *vm;
> > -		vm = i915_gem_context_get_vm_rcu(ctx);
> > +		vm = i915_gem_context_get_eb_vm(ctx);
> >   		vma = i915_vma_instance(batch, vm, NULL);
> >   		i915_vm_put(vm);
> >   		if (IS_ERR(vma))
> > diff --git a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
> > index 2c1ed32ca5ac..8be23e0f9306 100644
> > --- a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
> > +++ b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
> > @@ -117,7 +117,7 @@ static struct i915_request *
> >   hang_create_request(struct hang *h, struct intel_engine_cs *engine)
> >   {
> >   	struct intel_gt *gt = h->gt;
> > -	struct i915_address_space *vm = i915_gem_context_get_vm_rcu(h->ctx);
> > +	struct i915_address_space *vm = i915_gem_context_get_eb_vm(h->ctx);
> >   	struct drm_i915_gem_object *obj;
> >   	struct i915_request *rq = NULL;
> >   	struct i915_vma *hws, *vma;
> > diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
> > index f843a5040706..2d60a5a5b065 100644
> > --- a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
> > +++ b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
> > @@ -1300,7 +1300,7 @@ static int exercise_mock(struct drm_i915_private *i915,
> >   	if (!ctx)
> >   		return -ENOMEM;
> > -	vm = i915_gem_context_get_vm_rcu(ctx);
> > +	vm = i915_gem_context_get_eb_vm(ctx);
> >   	err = func(vm, 0, min(vm->total, limit), end_time);
> >   	i915_vm_put(vm);
> > @@ -1848,7 +1848,7 @@ static int igt_cs_tlb(void *arg)
> >   		goto out_unlock;
> >   	}
> > -	vm = i915_gem_context_get_vm_rcu(ctx);
> > +	vm = i915_gem_context_get_eb_vm(ctx);
> >   	if (i915_is_ggtt(vm))
> >   		goto out_vm;
> > diff --git a/drivers/gpu/drm/i915/selftests/i915_vma.c b/drivers/gpu/drm/i915/selftests/i915_vma.c
> > index dd0607254a95..79ba72da0813 100644
> > --- a/drivers/gpu/drm/i915/selftests/i915_vma.c
> > +++ b/drivers/gpu/drm/i915/selftests/i915_vma.c
> > @@ -118,7 +118,7 @@ static int create_vmas(struct drm_i915_private *i915,
> >   				struct i915_vma *vma;
> >   				int err;
> > -				vm = i915_gem_context_get_vm_rcu(ctx);
> > +				vm = i915_gem_context_get_eb_vm(ctx);
> >   				vma = checked_vma_instance(obj, vm, NULL);
> >   				i915_vm_put(vm);
> >   				if (IS_ERR(vma))
> > 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
