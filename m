Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C19576650A8
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 01:56:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0745210E06D;
	Wed, 11 Jan 2023 00:56:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B554210E06D;
 Wed, 11 Jan 2023 00:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673398610; x=1704934610;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=z9jY9ApRJfNRepgkR3ECDh+4/H9mgg6PKxpblab1qks=;
 b=belTuWwUJIDP3XbNtDOwe8YG5ZyvOhFxiBm7Sn6p9CdsRqopnhVNO/gv
 kkfhihrBzhDmyXWIrXJGm5AccYt/MtqWVUi8RSImRvetepmSexXFYyGRg
 YDntGVOystvGHmGGGOv8GxMTqNIGkG3jcGZ/Hl2G6WDW36w4XeWMOqtjE
 NdkS6OqvYz9qyj9U2laR0TyyEjxCp1YEGe5jcovpdFlp77VdC0c8sfaG9
 jlqSWIf3l7ArQgmsPLyhbvdjuWM3kgFeJputLsAub6PHif7+IY+2yO9KP
 jKsROgA1O3nEJB44FsYgzBhSnpCzO4ner5/RcC0mcyvBNgN1ppb6e9y4E Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="325307078"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; d="scan'208";a="325307078"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2023 16:56:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="831175638"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; d="scan'208";a="831175638"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by orsmga005.jf.intel.com with ESMTP; 10 Jan 2023 16:56:50 -0800
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/9] drm/i915/pxp: Add MTL PXP GSC-CS back-end skeleton
Date: Tue, 10 Jan 2023 16:56:31 -0800
Message-Id: <20230111005642.300761-2-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230111005642.300761-1-alan.previn.teres.alexis@intel.com>
References: <20230111005642.300761-1-alan.previn.teres.alexis@intel.com>
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
Cc: Juston Li <justonli@chromium.org>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add MTL PXP GSC-CS back-end stub functions hook them
up from PXP front-end and PXP session management functions.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/i915/Makefile                |  1 +
 drivers/gpu/drm/i915/pxp/intel_pxp.c         | 19 +++++++++++++---
 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c   | 23 ++++++++++++++++++++
 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h   | 18 +++++++++++++++
 drivers/gpu/drm/i915/pxp/intel_pxp_session.c |  6 ++++-
 drivers/gpu/drm/i915/pxp/intel_pxp_types.h   |  6 +++++
 6 files changed, 69 insertions(+), 4 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index f47f00b162a4..eae4325310e8 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -330,6 +330,7 @@ i915-y += \
 i915-$(CONFIG_DRM_I915_PXP) += \
 	pxp/intel_pxp_cmd.o \
 	pxp/intel_pxp_debugfs.o \
+	pxp/intel_pxp_gsccs.o \
 	pxp/intel_pxp_irq.o \
 	pxp/intel_pxp_pm.o \
 	pxp/intel_pxp_session.o
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.c b/drivers/gpu/drm/i915/pxp/intel_pxp.c
index cfc9af8b3d21..be52bf92e847 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp.c
@@ -12,6 +12,7 @@
 #include "i915_drv.h"
 
 #include "intel_pxp.h"
+#include "intel_pxp_gsccs.h"
 #include "intel_pxp_irq.h"
 #include "intel_pxp_session.h"
 #include "intel_pxp_tee.h"
@@ -132,7 +133,10 @@ static void pxp_init_full(struct intel_pxp *pxp)
 	if (ret)
 		return;
 
-	ret = intel_pxp_tee_component_init(pxp);
+	if (pxp->uses_gsccs)
+		ret = intel_pxp_gsccs_init(pxp);
+	else
+		ret = intel_pxp_tee_component_init(pxp);
 	if (ret)
 		goto out_context;
 
@@ -157,6 +161,11 @@ static struct intel_gt *find_gt_for_required_teelink(struct drm_i915_private *i9
 	return NULL;
 }
 
+static bool pxp_has_gsccs(struct drm_i915_private *i915)
+{
+	return (i915->media_gt && HAS_ENGINE(i915->media_gt, GSC0));
+}
+
 static struct intel_gt *find_gt_for_required_protected_content(struct drm_i915_private *i915)
 {
 	if (!IS_ENABLED(CONFIG_DRM_I915_PXP) || !INTEL_INFO(i915)->has_pxp)
@@ -167,7 +176,7 @@ static struct intel_gt *find_gt_for_required_protected_content(struct drm_i915_p
 	 * on the media GT. NOTE: if we have a media-tile with a GSC-engine,
 	 * the VDBOX is already present so skip that check
 	 */
-	if (i915->media_gt && HAS_ENGINE(i915->media_gt, GSC0))
+	if (pxp_has_gsccs(i915))
 		return i915->media_gt;
 
 	/*
@@ -208,6 +217,7 @@ int intel_pxp_init(struct drm_i915_private *i915)
 		return -ENOMEM;
 
 	i915->pxp->ctrl_gt = gt;
+	i915->pxp->uses_gsccs = pxp_has_gsccs(i915);
 
 	/*
 	 * If full PXP feature is not available but HuC is loaded by GSC on pre-MTL
@@ -229,7 +239,10 @@ void intel_pxp_fini(struct drm_i915_private *i915)
 
 	i915->pxp->arb_is_valid = false;
 
-	intel_pxp_tee_component_fini(i915->pxp);
+	if (i915->pxp->uses_gsccs)
+		intel_pxp_gsccs_fini(i915->pxp);
+	else
+		intel_pxp_tee_component_fini(i915->pxp);
 
 	destroy_vcs_context(i915->pxp);
 
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
new file mode 100644
index 000000000000..21400650fc86
--- /dev/null
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2023 Intel Corporation.
+ */
+
+#include "i915_drv.h"
+#include "intel_pxp_types.h"
+#include "intel_pxp_gsccs.h"
+
+int intel_pxp_gsccs_create_session(struct intel_pxp *pxp,
+				   int arb_session_id)
+{
+	return -ENODEV;
+}
+
+void intel_pxp_gsccs_fini(struct intel_pxp *pxp)
+{
+}
+
+int intel_pxp_gsccs_init(struct intel_pxp *pxp)
+{
+	return 0;
+}
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h
new file mode 100644
index 000000000000..967f8fc3b5b5
--- /dev/null
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2022, Intel Corporation. All rights reserved.
+ */
+
+#ifndef __INTEL_PXP_GSCCS_H__
+#define __INTEL_PXP_GSCCS_H__
+
+#include <linux/types.h>
+
+struct intel_pxp;
+
+int intel_pxp_gsccs_create_session(struct intel_pxp *pxp,
+				   int arb_session_id);
+void intel_pxp_gsccs_fini(struct intel_pxp *pxp);
+int intel_pxp_gsccs_init(struct intel_pxp *pxp);
+
+#endif /*__INTEL_PXP_GSCCS_H__ */
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
index ae413580b81a..080aa2209c5b 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
@@ -7,6 +7,7 @@
 
 #include "intel_pxp.h"
 #include "intel_pxp_cmd.h"
+#include "intel_pxp_gsccs.h"
 #include "intel_pxp_session.h"
 #include "intel_pxp_tee.h"
 #include "intel_pxp_types.h"
@@ -66,7 +67,10 @@ static int pxp_create_arb_session(struct intel_pxp *pxp)
 		return -EEXIST;
 	}
 
-	ret = intel_pxp_tee_cmd_create_arb_session(pxp, ARB_SESSION);
+	if (pxp->uses_gsccs)
+		ret = intel_pxp_gsccs_create_session(pxp, ARB_SESSION);
+	else
+		ret = intel_pxp_tee_cmd_create_arb_session(pxp, ARB_SESSION);
 	if (ret) {
 		drm_err(&gt->i915->drm, "tee cmd for arb session creation failed\n");
 		return ret;
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
index 7dc5f08d1583..43aa61c26de5 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
@@ -26,6 +26,12 @@ struct intel_pxp {
 	 */
 	struct intel_gt *ctrl_gt;
 
+	/**
+	 * @uses_gsccs: PXP interface for firmware access and pxp-session controls is
+	 * via the GSC-CS engine. This is for MTL+ platforms.
+	 */
+	bool uses_gsccs;
+
 	/**
 	 * @pxp_component: i915_pxp_component struct of the bound mei_pxp
 	 * module. Only set and cleared inside component bind/unbind functions,
-- 
2.39.0

