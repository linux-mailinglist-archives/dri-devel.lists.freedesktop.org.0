Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C5976B733
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 16:20:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CA6A10E40A;
	Tue,  1 Aug 2023 14:20:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 939C610E406;
 Tue,  1 Aug 2023 14:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690899631; x=1722435631;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=W0X1eI2zfIuWryDzr1HjoWRd2SGVBENRVhmFmH7l9Zs=;
 b=IaL5IrUaV5h76Sr3kmKcgtrqnGbP3/NH8Hc0JUKSIyvlA9rBoTg7/dt5
 KWUTpli8WRZNr/36/r7Y4gnZbKmY4FoDUDA8Bf8qNGhP/tGYHP71vIX7J
 Odo6KIfe56+7aM1rRkk3ISGLPfLoN5wG2WKXf+os11boZZE75i5zT2U1s
 +UEbJalZ17hc8HhoL7KXo9rZwFFI+qRDcuAM8ZYQY3k3M5+Ye8aoTs5nz
 +X/J8xS6k4ldE0Jponw7oN8IS5O9Jrz2Mzz/ypXxY8UrPi5rvkZPxud/a
 kj3UCHjLC7mtVlqnE7sg3udTxPWqQkdnBa1zzWuPha5xohcNOfRDO5jdG g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="372023426"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; d="scan'208";a="372023426"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 07:20:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="678687270"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; d="scan'208";a="678687270"
Received: from jhajducz-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.37.77])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 07:20:28 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Chris Wilson <chris.p.wilson@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Subject: [PATCH 4/4] drm/i915: Remove unnecessary include
Date: Tue,  1 Aug 2023 16:19:55 +0200
Message-Id: <20230801141955.383305-5-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230801141955.383305-1-andi.shyti@linux.intel.com>
References: <20230801141955.383305-1-andi.shyti@linux.intel.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The inclusion of intel_gt_defines.h was initially added to
i915_drv.h to provide the definition of I915_MAX_GT, where it was
originally defined.

However, since I915_MAX_GT is now included in
i915_gem_object_types.h, it sis no longer required in i915_drv.h.

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_drv.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 1584b01e1bd6c..a1a2fe31f4340 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -44,7 +44,6 @@
 #include "gem/i915_gem_stolen.h"
 
 #include "gt/intel_engine.h"
-#include "gt/intel_gt_defines.h"
 #include "gt/intel_gt_types.h"
 #include "gt/intel_region_lmem.h"
 #include "gt/intel_workarounds.h"
-- 
2.40.1

