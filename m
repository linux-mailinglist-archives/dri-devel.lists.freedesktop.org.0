Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A79EE81E98B
	for <lists+dri-devel@lfdr.de>; Tue, 26 Dec 2023 20:54:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C8FF10E203;
	Tue, 26 Dec 2023 19:54:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEE9F10E1E5;
 Tue, 26 Dec 2023 19:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=z4Wn+/VNwpqOioXRh2QsUOx4g40GB1Jq0DfMlgit/VU=; b=i97GQpQrz/NVAFXnkXRX+XaxUs
 YJtus3r5FhJ+iUZhBb01XtjFT4gnmyxkrkhRTYFUegiJth/dup39weVst2FcSytZmRBcdcqXO2wKk
 04v5Y1Rt/ZNEnh8QP4H1soZN0b98Obv46dCg4bpuPMWFbHxWUcMsgCpa+U5fLv4FlIhYpU1EH/Sgr
 sIfcfoBpX+O2kthHbVOJh4KvIqOpxNz6EC81tKmh1f7uZfn6f2OHnKhcmQirGk0LGfrm5skTIuda9
 bUTBpYemXbJiQtRCj0/yFvcIvdAYxnILcpJJ7t0pbmn1mQmcjq8NJA1Re3kEDOuujHU+7rEWv2q1l
 aP099BLQ==;
Received: from [50.53.46.231] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1rIDVa-00DT1I-07; Tue, 26 Dec 2023 19:54:34 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] drm/i915/guc: reconcile Excess struct member
 kernel-doc warnings
Date: Tue, 26 Dec 2023 11:54:31 -0800
Message-ID: <20231226195432.10891-3-rdunlap@infradead.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231226195432.10891-1-rdunlap@infradead.org>
References: <20231226195432.10891-1-rdunlap@infradead.org>
MIME-Version: 1.0
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Randy Dunlap <rdunlap@infradead.org>, Jonathan Corbet <corbet@lwn.net>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Document nested struct members with full names as described in
Documentation/doc-guide/kernel-doc.rst.

intel_guc.h:305: warning: Excess struct member 'lock' description in 'intel_guc'
intel_guc.h:305: warning: Excess struct member 'guc_ids' description in 'intel_guc'
intel_guc.h:305: warning: Excess struct member 'num_guc_ids' description in 'intel_guc'
intel_guc.h:305: warning: Excess struct member 'guc_ids_bitmap' description in 'intel_guc'
intel_guc.h:305: warning: Excess struct member 'guc_id_list' description in 'intel_guc'
intel_guc.h:305: warning: Excess struct member 'guc_ids_in_use' description in 'intel_guc'
intel_guc.h:305: warning: Excess struct member 'destroyed_contexts' description in 'intel_guc'
intel_guc.h:305: warning: Excess struct member 'destroyed_worker' description in 'intel_guc'
intel_guc.h:305: warning: Excess struct member 'reset_fail_worker' description in 'intel_guc'
intel_guc.h:305: warning: Excess struct member 'reset_fail_mask' description in 'intel_guc'
intel_guc.h:305: warning: Excess struct member 'sched_disable_delay_ms' description in 'intel_guc'
intel_guc.h:305: warning: Excess struct member 'sched_disable_gucid_threshold' description in 'intel_guc'
intel_guc.h:305: warning: Excess struct member 'lock' description in 'intel_guc'
intel_guc.h:305: warning: Excess struct member 'gt_stamp' description in 'intel_guc'
intel_guc.h:305: warning: Excess struct member 'ping_delay' description in 'intel_guc'
intel_guc.h:305: warning: Excess struct member 'work' description in 'intel_guc'
intel_guc.h:305: warning: Excess struct member 'shift' description in 'intel_guc'
intel_guc.h:305: warning: Excess struct member 'last_stat_jiffies' description in 'intel_guc'
18 warnings as Errors

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: dri-devel@lists.freedesktop.org
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
v2: add Reviewed-by: Rodrigo
    rebase and resend due to (i915) patchwork being down

 drivers/gpu/drm/i915/gt/uc/intel_guc.h |   75 ++++++++++++-----------
 1 file changed, 42 insertions(+), 33 deletions(-)

diff -- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
@@ -105,61 +105,67 @@ struct intel_guc {
 	 */
 	struct {
 		/**
-		 * @lock: protects everything in submission_state,
-		 * ce->guc_id.id, and ce->guc_id.ref when transitioning in and
-		 * out of zero
+		 * @submission_state.lock: protects everything in
+		 * submission_state, ce->guc_id.id, and ce->guc_id.ref
+		 * when transitioning in and out of zero
 		 */
 		spinlock_t lock;
 		/**
-		 * @guc_ids: used to allocate new guc_ids, single-lrc
+		 * @submission_state.guc_ids: used to allocate new
+		 * guc_ids, single-lrc
 		 */
 		struct ida guc_ids;
 		/**
-		 * @num_guc_ids: Number of guc_ids, selftest feature to be able
-		 * to reduce this number while testing.
+		 * @submission_state.num_guc_ids: Number of guc_ids, selftest
+		 * feature to be able to reduce this number while testing.
 		 */
 		int num_guc_ids;
 		/**
-		 * @guc_ids_bitmap: used to allocate new guc_ids, multi-lrc
+		 * @submission_state.guc_ids_bitmap: used to allocate
+		 * new guc_ids, multi-lrc
 		 */
 		unsigned long *guc_ids_bitmap;
 		/**
-		 * @guc_id_list: list of intel_context with valid guc_ids but no
-		 * refs
+		 * @submission_state.guc_id_list: list of intel_context
+		 * with valid guc_ids but no refs
 		 */
 		struct list_head guc_id_list;
 		/**
-		 * @guc_ids_in_use: Number single-lrc guc_ids in use
+		 * @submission_state.guc_ids_in_use: Number single-lrc
+		 * guc_ids in use
 		 */
 		unsigned int guc_ids_in_use;
 		/**
-		 * @destroyed_contexts: list of contexts waiting to be destroyed
-		 * (deregistered with the GuC)
+		 * @submission_state.destroyed_contexts: list of contexts
+		 * waiting to be destroyed (deregistered with the GuC)
 		 */
 		struct list_head destroyed_contexts;
 		/**
-		 * @destroyed_worker: worker to deregister contexts, need as we
-		 * need to take a GT PM reference and can't from destroy
-		 * function as it might be in an atomic context (no sleeping)
+		 * @submission_state.destroyed_worker: worker to deregister
+		 * contexts, need as we need to take a GT PM reference and
+		 * can't from destroy function as it might be in an atomic
+		 * context (no sleeping)
 		 */
 		struct work_struct destroyed_worker;
 		/**
-		 * @reset_fail_worker: worker to trigger a GT reset after an
-		 * engine reset fails
+		 * @submission_state.reset_fail_worker: worker to trigger
+		 * a GT reset after an engine reset fails
 		 */
 		struct work_struct reset_fail_worker;
 		/**
-		 * @reset_fail_mask: mask of engines that failed to reset
+		 * @submission_state.reset_fail_mask: mask of engines that
+		 * failed to reset
 		 */
 		intel_engine_mask_t reset_fail_mask;
 		/**
-		 * @sched_disable_delay_ms: schedule disable delay, in ms, for
-		 * contexts
+		 * @submission_state.sched_disable_delay_ms: schedule
+		 * disable delay, in ms, for contexts
 		 */
 		unsigned int sched_disable_delay_ms;
 		/**
-		 * @sched_disable_gucid_threshold: threshold of min remaining available
-		 * guc_ids before we start bypassing the schedule disable delay
+		 * @submission_state.sched_disable_gucid_threshold:
+		 * threshold of min remaining available guc_ids before
+		 * we start bypassing the schedule disable delay
 		 */
 		unsigned int sched_disable_gucid_threshold;
 	} submission_state;
@@ -243,37 +249,40 @@ struct intel_guc {
 	 */
 	struct {
 		/**
-		 * @lock: Lock protecting the below fields and the engine stats.
+		 * @timestamp.lock: Lock protecting the below fields and
+		 * the engine stats.
 		 */
 		spinlock_t lock;
 
 		/**
-		 * @gt_stamp: 64 bit extended value of the GT timestamp.
+		 * @timestamp.gt_stamp: 64-bit extended value of the GT
+		 * timestamp.
 		 */
 		u64 gt_stamp;
 
 		/**
-		 * @ping_delay: Period for polling the GT timestamp for
-		 * overflow.
+		 * @timestamp.ping_delay: Period for polling the GT
+		 * timestamp for overflow.
 		 */
 		unsigned long ping_delay;
 
 		/**
-		 * @work: Periodic work to adjust GT timestamp, engine and
-		 * context usage for overflows.
+		 * @timestamp.work: Periodic work to adjust GT timestamp,
+		 * engine and context usage for overflows.
 		 */
 		struct delayed_work work;
 
 		/**
-		 * @shift: Right shift value for the gpm timestamp
+		 * @timestamp.shift: Right shift value for the gpm timestamp
 		 */
 		u32 shift;
 
 		/**
-		 * @last_stat_jiffies: jiffies at last actual stats collection time
-		 * We use this timestamp to ensure we don't oversample the
-		 * stats because runtime power management events can trigger
-		 * stats collection at much higher rates than required.
+		 * @timestamp.last_stat_jiffies: jiffies at last actual
+		 * stats collection time. We use this timestamp to ensure
+		 * we don't oversample the stats because runtime power
+		 * management events can trigger stats collection at much
+		 * higher rates than required.
 		 */
 		unsigned long last_stat_jiffies;
 	} timestamp;
