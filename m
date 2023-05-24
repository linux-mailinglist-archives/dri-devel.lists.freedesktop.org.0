Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D1170F447
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 12:32:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D268710E5E3;
	Wed, 24 May 2023 10:32:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0895C10E5DD;
 Wed, 24 May 2023 10:32:49 +0000 (UTC)
X-UUID: 902cfb92b315469abe58eec95e6a8660-20230524
X-CID-O-RULE: Release_Ham
X-CID-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22, REQID:9e56b5b9-9528-4ab5-8a67-9f47867fe627, IP:5,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-10
X-CID-INFO: VERSION:1.1.22, REQID:9e56b5b9-9528-4ab5-8a67-9f47867fe627, IP:5,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:-10
X-CID-META: VersionHash:120426c, CLOUDID:b15ddc6c-2f20-4998-991c-3b78627e4938,
 B
 ulkID:23052418324559N28CF5,BulkQuantity:0,Recheck:0,SF:19|44|24|17|102,TC:
 nil,Content:0,EDM:-3,IP:-2,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
 I:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 902cfb92b315469abe58eec95e6a8660-20230524
X-User: pengfuyuan@kylinos.cn
Received: from localhost.localdomain [(116.128.244.169)] by mailgw
 (envelope-from <pengfuyuan@kylinos.cn>) (Generic MTA)
 with ESMTP id 634748836; Wed, 24 May 2023 18:32:44 +0800
From: pengfuyuan <pengfuyuan@kylinos.cn>
To: David Airlie <airlied@gmail.com>
Subject: [PATCH] drm/i915/gt: fix kernel-doc trivial warnings
Date: Wed, 24 May 2023 18:32:42 +0800
Message-Id: <20230524103242.1486266-1-pengfuyuan@kylinos.cn>
X-Mailer: git-send-email 2.25.1
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 pengfuyuan <pengfuyuan@kylinos.cn>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 k2ci <kernel-bot@kylinos.cn>, Sumit Semwal <sumit.semwal@linaro.org>,
 John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The test robot reports some make warnings.

Fix those warnings:
    drivers/gpu/drm/i915/gt/intel_gtt.h:499: warning: Function parameter or member 'vm' not described in 'i915_vm_resv_put'
    drivers/gpu/drm/i915/gt/intel_context.h:108: warning: Function parameter or member 'ce' not described in 'intel_context_lock_pinned'
    drivers/gpu/drm/i915/gt/intel_context.h:123: warning: Function parameter or member 'ce' not described in 'intel_context_is_pinned'
    drivers/gpu/drm/i915/gt/intel_context.h:142: warning: Function parameter or member 'ce' not described in 'intel_context_unlock_pinned
    drivers/gpu/drm/i915/gt/intel_engine_types.h:293: warning: Function parameter or member 'preempt_hang' not described in 'intel_engine_execlists'

Reported-by: k2ci <kernel-bot@kylinos.cn>
Signed-off-by: pengfuyuan <pengfuyuan@kylinos.cn>
---
 drivers/gpu/drm/i915/gt/intel_context.h      | 6 +++---
 drivers/gpu/drm/i915/gt/intel_engine_types.h | 3 +++
 drivers/gpu/drm/i915/gt/intel_gtt.h          | 2 +-
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915/gt/intel_context.h
index 48f888c3da08..6b5eae7b88bc 100644
--- a/drivers/gpu/drm/i915/gt/intel_context.h
+++ b/drivers/gpu/drm/i915/gt/intel_context.h
@@ -97,7 +97,7 @@ void intel_context_bind_parent_child(struct intel_context *parent,
 
 /**
  * intel_context_lock_pinned - Stablises the 'pinned' status of the HW context
- * @ce - the context
+ * @ce: the context
  *
  * Acquire a lock on the pinned status of the HW context, such that the context
  * can neither be bound to the GPU or unbound whilst the lock is held, i.e.
@@ -111,7 +111,7 @@ static inline int intel_context_lock_pinned(struct intel_context *ce)
 
 /**
  * intel_context_is_pinned - Reports the 'pinned' status
- * @ce - the context
+ * @ce: the context
  *
  * While in use by the GPU, the context, along with its ring and page
  * tables is pinned into memory and the GTT.
@@ -133,7 +133,7 @@ static inline void intel_context_cancel_request(struct intel_context *ce,
 
 /**
  * intel_context_unlock_pinned - Releases the earlier locking of 'pinned' status
- * @ce - the context
+ * @ce: the context
  *
  * Releases the lock earlier acquired by intel_context_unlock_pinned().
  */
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
index 960291f88fd6..1fc1fc882097 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
@@ -289,6 +289,9 @@ struct intel_engine_execlists {
 	 */
 	u8 csb_head;
 
+	/**
+	 * @preempt_hang: preempt hang state for self-tests.
+	 */
 	I915_SELFTEST_DECLARE(struct st_preempt_hang preempt_hang;)
 };
 
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
index 69ce55f517f5..a9aa72a8c59c 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.h
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
@@ -493,7 +493,7 @@ static inline void i915_vm_put(struct i915_address_space *vm)
 
 /**
  * i915_vm_resv_put - Release a reference on the vm's reservation lock
- * @resv: Pointer to a reservation lock obtained from i915_vm_resv_get()
+ * @vm: Pointer to a reservation lock obtained from i915_vm_resv_release()
  */
 static inline void i915_vm_resv_put(struct i915_address_space *vm)
 {
-- 
2.25.1


No virus found
		Checked by Hillstone Network AntiVirus
