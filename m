Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E2358843E
	for <lists+dri-devel@lfdr.de>; Wed,  3 Aug 2022 00:31:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7764811AA7B;
	Tue,  2 Aug 2022 22:31:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 041AE11A867;
 Tue,  2 Aug 2022 22:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659479466; x=1691015466;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=tQu+HMFHSRdp1UJcOF9yUMiNr1GqWutaQgzsxRFsrPg=;
 b=Vgcc6QwcRf+OHxg99NcyjtY/fnm0gei9H/MmT9ajroKNU8P/ECdWiq/Y
 SLRb26sFdLiNGKRPgn6FPQ0as7rUPt2GhTmlFpYBOAKxhItBxc/zSLijn
 rYz2a+2B0P7NfSLOSNDMCD56uyZPWJXVJuDZ6hfUzuL/d8JJ2/2JvodHY
 Bu0oBgrXnq4Lzl0QAo+WOBa88FFW5Uzsc7odvORe7VE+sOUKOrqwCC6EG
 eEs3gFnELaBKFIu906VoTYlq67Xqfz5pRck4IqeFylkj1o89wyjAiU1Vc
 gvRDwfNWTA4WgRptR/pNNFhIs4nx9252rd6sMdWshi3fFANoexCfEsKi2 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10427"; a="315386593"
X-IronPort-AV: E=Sophos;i="5.93,212,1654585200"; d="scan'208";a="315386593"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2022 15:31:04 -0700
X-IronPort-AV: E=Sophos;i="5.93,212,1654585200"; d="scan'208";a="630894236"
Received: from nvishwa1-desk.sc.intel.com (HELO nvishwa1-DESK) ([172.25.29.76])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2022 15:31:04 -0700
Date: Tue, 2 Aug 2022 15:30:44 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [Intel-gfx] [PATCH v2 2/2] drm/i915/gt: document TLB cache
 invalidation functions
Message-ID: <20220802223042.GL14039@nvishwa1-DESK>
References: <cover.1659077372.git.mchehab@kernel.org>
 <ebb5f34f223626038f241fdf00a0dcfd33a19606.1659077372.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <ebb5f34f223626038f241fdf00a0dcfd33a19606.1659077372.git.mchehab@kernel.org>
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
Cc: Chris Wilson <chris.p.wilson@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 29, 2022 at 09:03:55AM +0200, Mauro Carvalho Chehab wrote:
>Add a description for the TLB cache invalidation algorithm and for
>the related kAPI functions.
>
>Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
>---
>
>To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
>See [PATCH v2 0/2] at: https://lore.kernel.org/all/cover.1659077372.git.mchehab@kernel.org/
>
> Documentation/gpu/i915.rst          |   7 ++
> drivers/gpu/drm/i915/gt/intel_tlb.c |  25 +++++++
> drivers/gpu/drm/i915/gt/intel_tlb.h | 101 ++++++++++++++++++++++++++++
> 3 files changed, 133 insertions(+)
>
>diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
>index 4e59db1cfb00..46911fdd79e8 100644
>--- a/Documentation/gpu/i915.rst
>+++ b/Documentation/gpu/i915.rst
>@@ -58,6 +58,13 @@ Intel GVT-g Host Support(vGPU device model)
> .. kernel-doc:: drivers/gpu/drm/i915/intel_gvt.c
>    :internal:
>
>+TLB cache invalidation
>+----------------------
>+
>+.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_tlb.h
>+
>+.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_tlb.c
>+
> Workarounds
> -----------
>
>diff --git a/drivers/gpu/drm/i915/gt/intel_tlb.c b/drivers/gpu/drm/i915/gt/intel_tlb.c
>index af8cae979489..4873b7ecc015 100644
>--- a/drivers/gpu/drm/i915/gt/intel_tlb.c
>+++ b/drivers/gpu/drm/i915/gt/intel_tlb.c
>@@ -145,6 +145,18 @@ static void mmio_invalidate_full(struct intel_gt *gt)
> 	intel_uncore_forcewake_put_delayed(uncore, FORCEWAKE_ALL);
> }
>
>+/**
>+ * intel_gt_invalidate_tlb_full - do full TLB cache invalidation
>+ * @gt: GT structure
>+ * @seqno: sequence number
>+ *
>+ * Do a full TLB cache invalidation if the @seqno is bigger than the last
>+ * full TLB cache invalidation.
>+ *
>+ * Note:
>+ * The TLB cache invalidation logic depends on GEN-specific registers.
>+ * It currently supports MMIO-based TLB flush for GEN8 to GEN12.
>+ */
> void intel_gt_invalidate_tlb_full(struct intel_gt *gt, u32 seqno)
> {
> 	intel_wakeref_t wakeref;
>@@ -171,12 +183,25 @@ void intel_gt_invalidate_tlb_full(struct intel_gt *gt, u32 seqno)
> 	}
> }
>
>+/**
>+ * intel_gt_init_tlb - initialize TLB-specific vars
>+ * @gt: GT structure
>+ *
>+ * TLB cache invalidation logic internally uses some resources that require
>+ * initialization. Should be called before doing any TLB cache invalidation.
>+ */
> void intel_gt_init_tlb(struct intel_gt *gt)
> {
> 	mutex_init(&gt->tlb.invalidate_lock);
> 	seqcount_mutex_init(&gt->tlb.seqno, &gt->tlb.invalidate_lock);
> }
>
>+/**
>+ * intel_gt_fini_tlb - initialize TLB-specific vars

Free TLB-specific vars

>+ * @gt: GT structure
>+ *
>+ * Frees any resources needed by TLB cache invalidation logic.
>+ */
> void intel_gt_fini_tlb(struct intel_gt *gt)
> {
> 	mutex_destroy(&gt->tlb.invalidate_lock);
>diff --git a/drivers/gpu/drm/i915/gt/intel_tlb.h b/drivers/gpu/drm/i915/gt/intel_tlb.h
>index 46ce25bf5afe..dca70c33bd61 100644
>--- a/drivers/gpu/drm/i915/gt/intel_tlb.h
>+++ b/drivers/gpu/drm/i915/gt/intel_tlb.h
>@@ -11,16 +11,117 @@
>
> #include "intel_gt_types.h"
>
>+/**
>+ * DOC: TLB cache invalidation logic
>+ *
>+ * The way the current algorithm works is that a struct drm_i915_gem_object can
>+ * be created on any order. At unbind/evict time, the object is warranted that
>+ * it won't be used anymore. So, a sequence number provided by
>+ * intel_gt_next_invalidate_tlb_full() is stored on it. This can happen either
>+ * at __vma_put_pages() - for VMA sync unbind, or at ppgtt_unbind_vma() - for
>+ * VMA async VMA bind.
>+ *
>+ * At __i915_gem_object_unset_pages(), intel_gt_invalidate_tlb_full() is called,
>+ * where it checks if the sequence number of the object was already invalidated
>+ * or not. If not, it flushes the TLB and increments the sequence number::
>+ *
>+ *   void intel_gt_invalidate_tlb_full(struct intel_gt *gt, u32 seqno)
>+ *   {
>+ *   ...
>+ * 	with_intel_gt_pm_if_awake(gt, wakeref) {
>+ * 		mutex_lock(&gt->tlb.invalidate_lock);
>+ * 		if (tlb_seqno_passed(gt, seqno))
>+ * 				goto unlock;
>+ *
>+ * 		// Some code to do TLB invalidation
>+ *   ...
>+ *
>+ * 		write_seqcount_invalidate(&gt->tlb.seqno); // increment seqno
>+ * 		mutex_lock(&gt->tlb.invalidate_lock);
>+ *      }
>+ *
>+ * So, let's say the current seqno is 2 and 3 new objects were created,
>+ * on this order::
>+ *
>+ * 	obj1
>+ * 	obj2
>+ * 	obj3
>+ *
>+ * They can be unbind/evict on a different order. At unbind/evict time,
>+ * the mm.tlb will be stamped with the sequence number, using the number
>+ * from the last TLB flush, plus 1.

I am trying to get my head around the below function.

void vma_invalidate_tlb(struct i915_address_space *vm, u32 tlb)
{
        WRITE_ONCE(tlb, intel_gt_next_invalidate_tlb_full(vm->gt));
}

Though we pass obj->mm.tlb for 'tlb' while calling this function,
aren't we writing to local 'tlb' variable here instead of obj->mm.tlb?

>+ *
>+ * Different threads may be used on unbind/evict and/or unset pages.
>+ * As the logic at void intel_gt_invalidate_tlb_full() is protected by a mutex,

May be we can skip 'void' and just keep function name here.

>+ * for simplicity, let's consider just two threads:
>+ *
>+ * +-------------------+-------------------------+---------------------------------+
>+ * | sequence number   | Thread 0                | Thread 1                        +
>+ * +===================+=========================+=================================+
>+ * | seqno=2           |                         |                                 |
>+ * |                   +-------------------------+---------------------------------+
>+ * |                   | unbind/evict obj3.      |                                 |
>+ * |                   |                         |                                 |
>+ * |                   | obj3.mm.tlb = seqno | 1 |                                 |
>+ * |                   | // obj3.mm.tlb = 3      |                                 |
>+ * |                   +-------------------------+---------------------------------+
>+ * |                   | unbind/evict obj1.      |                                 |
>+ * |                   |                         |                                 |
>+ * |                   | obj1.mm.tlb = seqno | 1 |                                 |
>+ * |                   | // obj1.mm.tlb = 3      |                                 |
>+ * |                   +-------------------------+---------------------------------+
>+ * |                   |                         | __i915_gem_object_unset_pages() |
>+ * |                   |                         | called for obj3 => TLB flush    |
>+ * |                   |                         | invalidating both obj1 and obj2.|
>+ * |                   |                         |                                 |
>+ * |                   |                         | seqno += 2                      |
>+ * +-------------------+-------------------------+---------------------------------+
>+ * | seqno=4           |                         |                                 |
>+ * |                   +-------------------------+---------------------------------+
>+ * |                   | unbind/evict obj2.      |                                 |
>+ * |                   |                         |                                 |
>+ * |                   | obj2.mm.tlb = seqno | 1 |                                 |
>+ * |                   | // obj2.mm.tlb = 5      |                                 |
>+ * |                   +-------------------------+---------------------------------+
>+ * |                   |                         | __i915_gem_object_unset_pages() |
>+ * |                   |                         | called for obj1, don't flush    |
>+ * |                   |                         | as past flush invalidated obj1. |
>+ * |                   +-------------------------+---------------------------------+
>+ * |                   |                         | __i915_gem_object_unset_pages() |
>+ * |                   |                         | called for obj2 => TLB flush.   |
>+ * |                   |                         | invalidating obj2.              |
>+ * |                   |                         |                                 |
>+ * |                   |                         | seqno += 2                      |
>+ * +-------------------+-------------------------+---------------------------------+
>+ * | seqno=6           |                         |                                 |
>+ * +-------------------+-------------------------+---------------------------------+
>+ */
>+
> void intel_gt_invalidate_tlb_full(struct intel_gt *gt, u32 seqno);
>
> void intel_gt_init_tlb(struct intel_gt *gt);
> void intel_gt_fini_tlb(struct intel_gt *gt);
>
>+/**
>+ * intel_gt_tlb_seqno - Returns the current TLB invlidation sequence number
>+ *

Probably this empty comment line needs to be removed before the parameter
description below?

>+ * @gt: GT structure
>+ *
>+ * There's no need to lock while calling it, as seqprop_sequence is thread-safe
>+ */
> static inline u32 intel_gt_tlb_seqno(const struct intel_gt *gt)
> {
> 	return seqprop_sequence(&gt->tlb.seqno);
> }
>
>+/**
>+ * intel_gt_next_invalidate_tlb_full - Returns the next TLB full invalidation
>+ *	sequence number
>+ *

Same here.

-Niranjana

>+ * @gt: GT structure
>+ *
>+ * There's no need to lock while calling it, as seqprop_sequence is thread-safe
>+ */
> static inline u32 intel_gt_next_invalidate_tlb_full(const struct intel_gt *gt)
> {
> 	return intel_gt_tlb_seqno(gt) | 1;
>-- 
>2.36.1
>
