Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6535730A5
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 10:14:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41BA6957F0;
	Wed, 13 Jul 2022 08:13:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F2D0951AC;
 Wed, 13 Jul 2022 08:12:35 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DB1A761B03;
 Wed, 13 Jul 2022 08:12:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DBA8C36AF8;
 Wed, 13 Jul 2022 08:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657699952;
 bh=a3vP6iHzNOJCMwtaBN14hmMw2q8S+uzTNcEZhZf06hE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UURe8/YXGfu2jqEBiwyn+AYexKbfLR5d2PncI/GYyBrZ6e8WtzIOerkTBqUmhIv9A
 V3CSLNC6DtjIZtvCb9GhVSxyKtwoOng05GfczPis02qGmY5sHlPll7pEhYvC2Q7P0t
 MUiugafiUUPQ9H2j1aCenP1Abw/HVR0Um7H9jesBsMdi/yJN5tEHf57mE9akKhpn52
 E4IiyL2qOlJ/hhSxZSeqweFhxEYaEpDQXUcWTkbhvJQe/qARc7j1NeAa7IVAdS34g5
 48DfFNaH1nd5Lh+xheaMarhJZIW76zaf9svvARLfzliAPIdbHC98b4aRMthS72EG5Q
 cDFG4nj1KCG0Q==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1oBXTy-004zun-3W;
 Wed, 13 Jul 2022 09:12:30 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH v2 38/39] drm/i915: add descriptions for some RPM macros at
 intel_gt_pm.h
Date: Wed, 13 Jul 2022 09:12:26 +0100
Message-Id: <37e3b9aac85f1d08c0a53bae86680d504308bf67.1657699522.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <cover.1657699522.git.mchehab@kernel.org>
References: <cover.1657699522.git.mchehab@kernel.org>
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
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, intel-gfx@lists.freedesktop.org,
 John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The intel_gt_pm.h file contains some convenient macros to be used
in GT code in order to get/put runtime PM references and for
checking them.

Add descriptions based on the ones at intel_wakeref.h and
intel_runtime_pm.c.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v2 00/39] at: https://lore.kernel.org/all/cover.1657699522.git.mchehab@kernel.org/

 Documentation/gpu/i915.rst            |  2 +
 drivers/gpu/drm/i915/gt/intel_gt_pm.h | 62 +++++++++++++++++++++++++++
 2 files changed, 64 insertions(+)

diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
index 6bb50edc6d79..9862d504df4d 100644
--- a/Documentation/gpu/i915.rst
+++ b/Documentation/gpu/i915.rst
@@ -709,6 +709,8 @@ Table Manager (TTM)
 
 .. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
 
+.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_gt_pm.h
+
 Graphics Execution Manager (GEM)
 --------------------------------
 
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.h b/drivers/gpu/drm/i915/gt/intel_gt_pm.h
index bc898df7a48c..a8ea6846980a 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_pm.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.h
@@ -11,21 +11,57 @@
 #include "intel_gt_types.h"
 #include "intel_wakeref.h"
 
+/**
+ * intel_gt_pm_is_awake: Query whether the runtime PM is awake held
+ *
+ * @gt: pointer to the graphics engine
+ *
+ * Returns: true if a runtime pm reference is currently held and the GT is
+ * awake.
+ */
 static inline bool intel_gt_pm_is_awake(const struct intel_gt *gt)
 {
 	return intel_wakeref_is_active(&gt->wakeref);
 }
 
+/**
+ * intel_gt_pm_get: grab a runtime PM reference ensuring that GT is powered up
+ * @gt: pointer to the graphics engine
+ *
+ * Any runtime pm reference obtained by this function must have a symmetric
+ * call to intel_gt_pm_put() to release the reference again.
+ *
+ * Note that this is allowed to fail, in which case the runtime-pm wakeref
+ * will be released and the acquisition unwound.
+ */
 static inline void intel_gt_pm_get(struct intel_gt *gt)
 {
 	intel_wakeref_get(&gt->wakeref);
 }
 
+/**
+ * __intel_gt_pm_get: Acquire the runtime PM reference again
+ * @gt: pointer to the graphics engine which contains the wakeref
+ *
+ * Increment the PM reference counter, only valid if it is already held by
+ * the caller.
+ *
+ * See intel_gt_pm_get().
+ */
 static inline void __intel_gt_pm_get(struct intel_gt *gt)
 {
 	__intel_wakeref_get(&gt->wakeref);
 }
 
+/**
+ * intel_gt_pm_get_if_awake: Acquire the runtime PM reference if active
+ * @gt: pointer to the graphics engine which contains the PM reference
+ *
+ * Acquire a hold on the PM reference, but only if the GT is already
+ * active.
+ *
+ * Returns: true if the wakeref was acquired, false otherwise.
+ */
 static inline bool intel_gt_pm_get_if_awake(struct intel_gt *gt)
 {
 	return intel_wakeref_get_if_active(&gt->wakeref);
@@ -36,6 +72,14 @@ static inline void intel_gt_pm_might_get(struct intel_gt *gt)
 	intel_wakeref_might_get(&gt->wakeref);
 }
 
+/**
+ * intel_gt_pm_put: Release the runtime PM reference
+ * @gt: pointer to the graphics engine which contains the PM reference
+ *
+ * Release our hold on the runtime PM for GT.
+ *
+ * It might power down the GT right away if this is the last reference.
+ */
 static inline void intel_gt_pm_put(struct intel_gt *gt)
 {
 	intel_wakeref_put(&gt->wakeref);
@@ -51,10 +95,28 @@ static inline void intel_gt_pm_might_put(struct intel_gt *gt)
 	intel_wakeref_might_put(&gt->wakeref);
 }
 
+/**
+ * with_intel_gt_pm - get a GT reference ensuring that GT is powered up,
+ *	run some code and then put the reference away.
+ *
+ * @gt: pointer to the gt
+ * @tmp: pointer to a temporary wakeref.
+ */
 #define with_intel_gt_pm(gt, tmp) \
 	for (tmp = 1, intel_gt_pm_get(gt); tmp; \
 	     intel_gt_pm_put(gt), tmp = 0)
 
+/**
+ * intel_gt_pm_wait_for_idle: Wait until the runtime PM reference is idle
+ * @gt: pointer to the graphics engine which contains the PM reference
+ *
+ * Wait for the earlier asynchronous release of the runtime PM reference. Note
+ * this will wait for any third party as well, so make sure you only wait
+ * when you have control over the GT runtime PM and trust no one else is
+ * acquiring it.
+ *
+ * Return: 0 on success, error code if killed.
+ */
 static inline int intel_gt_pm_wait_for_idle(struct intel_gt *gt)
 {
 	return intel_wakeref_wait_for_idle(&gt->wakeref);
-- 
2.36.1

