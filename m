Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A02E5B303A
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 09:38:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 056C310EC2E;
	Fri,  9 Sep 2022 07:35:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31E0010EC05;
 Fri,  9 Sep 2022 07:35:02 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A43D561F0A;
 Fri,  9 Sep 2022 07:35:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73D0BC433D7;
 Fri,  9 Sep 2022 07:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662708901;
 bh=mx5m4W9+rdgIoXtdj6jbmkTk0F02+LuCdNxfXOHm9IM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=neYdglhMQDQLCT7D0utjejJwIG0jgf1mkOw1zGaOZb+DAoo5wET86qgH8etJlRac9
 Mbji4Ow248ahJkXdspRMD3VLAGT9VS46aalps+tSXbsoSQHwDqrtm98r9NI5aaei3n
 VtjXAaXGON19KsPuLjbOitce6oOQAsjgS99tN+zFT4b77HZtwFLa3ef/EAehdAGKn4
 K5stHLWtRxI3oqjezRo6+NBcroFNvawPjoFevKl5lJxBc8icCKV+H14cM/UchRsA8y
 1El/3ybrDCl8eMOhKhQIktnHb9dTkBsgXMsYSL6BgdMtoHjux6TX0qSnXterXQRhx4
 Oqhi3J4LyXWsQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1oWYXH-007FHr-LM;
 Fri, 09 Sep 2022 09:34:47 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH v3 35/37] drm/i915: add descriptions for some RPM macros at
 intel_gt_pm.h
Date: Fri,  9 Sep 2022 09:34:42 +0200
Message-Id: <997567dcc2b5942afde093d92d0666948e66d83a.1662708705.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <cover.1662708705.git.mchehab@kernel.org>
References: <cover.1662708705.git.mchehab@kernel.org>
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
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, linux-doc@vger.kernel.org,
 Andi Shyti <andi.shyti@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Chris Wilson <chris.p.wilson@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
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
See [PATCH v3 00/37] at: https://lore.kernel.org/all/cover.1662708705.git.mchehab@kernel.org/

 Documentation/gpu/i915.rst            |  2 ++
 drivers/gpu/drm/i915/gt/intel_gt_pm.h | 51 +++++++++++++++++++++++++++
 2 files changed, 53 insertions(+)

diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
index 7f5cd01ed398..59c532fe0332 100644
--- a/Documentation/gpu/i915.rst
+++ b/Documentation/gpu/i915.rst
@@ -446,6 +446,8 @@ Graphics Translation Tables
 Other GT functionality
 ----------------------
 
+.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_gt_pm.h
+
 .. kernel-doc:: drivers/gpu/drm/i915/gt/intel_context.h
 
 .. kernel-doc:: drivers/gpu/drm/i915/gt/intel_gsc.h
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.h b/drivers/gpu/drm/i915/gt/intel_gt_pm.h
index 6c9a46452364..7847e15d102e 100644
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
@@ -51,6 +95,13 @@ static inline void intel_gt_pm_might_put(struct intel_gt *gt)
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
-- 
2.37.3

