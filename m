Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 753F276B72F
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 16:20:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3401A10E404;
	Tue,  1 Aug 2023 14:20:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8415B10E404;
 Tue,  1 Aug 2023 14:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690899620; x=1722435620;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yopxHFAmKF3ujlsbpXmUVr+HF/2AeF7lTo5uZcuQ11g=;
 b=TV7gdGoFmR9KjcYFFHTxYGW2rnPGJVDFFtWAS1vheXcxUx4xZwTE6gah
 1sBc1A7JFmck2jRVz1mcSFI5ucagv1FVI62cYg1BWMCnSuvD3ezkrH6mV
 U5nYRv4dzmKvzT3/OFGY7mn3CWXsaoN8rZ6u3mjiEqbWsB3zEcy19T+m9
 ZSr1RDUJ6Gr9bAQrj7xBY1F7nRCOAFb1S7emXIrteBScgFi03XfCBBNpE
 A6HNhKD/oW2jDuJYpMPReQVeB3a2xFZJcgBWCFc1r5L+t76fucs10k7v0
 I5BiHPYHTCFtgRJnA+dNGJ3/KCOGXXi78vwH0V3LJK6+Pvam7z5Iamqq4 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="372941632"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; d="scan'208";a="372941632"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 07:20:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="722496250"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; d="scan'208";a="722496250"
Received: from jhajducz-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.37.77])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 07:20:18 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Chris Wilson <chris.p.wilson@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Subject: [PATCH 2/4] i915/drm/gt: Move the gt defines in the gt directory
Date: Tue,  1 Aug 2023 16:19:53 +0200
Message-Id: <20230801141955.383305-3-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230801141955.383305-1-andi.shyti@linux.intel.com>
References: <20230801141955.383305-1-andi.shyti@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Create a new intel_gt_defines.h inside the gt/ directory as a
placeholder for all the generic GT based defines.

As of now place only I915_MAX_GT.

Co-developed-by: Chris Wilson <chris.p.wilson@linux.intel.com>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_defines.h | 11 +++++++++++
 drivers/gpu/drm/i915/i915_drv.h            |  2 +-
 2 files changed, 12 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_defines.h

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_defines.h b/drivers/gpu/drm/i915/gt/intel_gt_defines.h
new file mode 100644
index 0000000000000..5017788bac8fb
--- /dev/null
+++ b/drivers/gpu/drm/i915/gt/intel_gt_defines.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2019 Intel Corporation
+ */
+
+#ifndef __INTEL_GT_DEFINES__
+#define __INTEL_GT_DEFINES__
+
+#define I915_MAX_GT 2
+
+#endif
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 682ef2b5c7d59..1584b01e1bd6c 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -44,6 +44,7 @@
 #include "gem/i915_gem_stolen.h"
 
 #include "gt/intel_engine.h"
+#include "gt/intel_gt_defines.h"
 #include "gt/intel_gt_types.h"
 #include "gt/intel_region_lmem.h"
 #include "gt/intel_workarounds.h"
@@ -323,7 +324,6 @@ struct drm_i915_private {
 	/*
 	 * i915->gt[0] == &i915->gt0
 	 */
-#define I915_MAX_GT 2
 	struct intel_gt *gt[I915_MAX_GT];
 
 	struct kobject *sysfs_gt;
-- 
2.40.1

