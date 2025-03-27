Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 245F7A7417F
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 00:26:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DD4310E191;
	Thu, 27 Mar 2025 23:26:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J3iGMSLJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CD9110E18C;
 Thu, 27 Mar 2025 23:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743118004; x=1774654004;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=alK8KeyWFwbGtHjzriFEZQXous5vD3TwT6G43Jy6pTw=;
 b=J3iGMSLJwl/V/aC3gk3AQEYZmO8JdVJ4YW4Qew11alyPwQiSubfZSYUM
 oIgr9osptYgnva3tPimcW8TqsaIBMdHJiUFR+F7dmVGhukoC73IDzAYuz
 assa+P8hUU02GJ8GNfYEoR+4/UCvWNwr4pFd55RqGC3Excf/Pza2S3XB2
 0RYypU+xqUnWglfjOMklRppBuasaydOWEEoBhSywrO7+ZU4PvynjtpseJ
 uKWY2yL6JszKvho58MoJIaFo0Q4FgFTrCm0MzIOMvE1oAUv3Uqj+RhT/3
 SoNQisHekvWu+zzkE6F+0Ys+CQfoZROMAUbuXSQXKRC/rrp5TUPOPIVCu w==;
X-CSE-ConnectionGUID: Q4Byls4+TpSUP8MZgAiayw==
X-CSE-MsgGUID: O5deP7yBTXKhgth00r97vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="32076241"
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; d="scan'208";a="32076241"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 16:26:43 -0700
X-CSE-ConnectionGUID: 4kzERssoRzmUO2QARWD5xQ==
X-CSE-MsgGUID: iyBZUAFNSHW5UGqGtc2Log==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; d="scan'208";a="129434999"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.230])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 16:26:42 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH] drm/i915/gem: Convert SPDX headers to single-line format
Date: Fri, 28 Mar 2025 00:26:29 +0100
Message-ID: <20250327232629.2939-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.47.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace multi-line SPDX license headers with single-line
equivalents (// SPDX-License-Identifier: MIT or /* ... */ for
headers), as preferred by current kernel coding style.

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_busy.c          | 3 +--
 drivers/gpu/drm/i915/gem/i915_gem_clflush.c       | 3 +--
 drivers/gpu/drm/i915/gem/i915_gem_clflush.h       | 3 +--
 drivers/gpu/drm/i915/gem/i915_gem_context.c       | 3 +--
 drivers/gpu/drm/i915/gem/i915_gem_context.h       | 3 +--
 drivers/gpu/drm/i915/gem/i915_gem_context_types.h | 3 +--
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c        | 3 +--
 drivers/gpu/drm/i915/gem/i915_gem_domain.c        | 3 +--
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c    | 3 +--
 drivers/gpu/drm/i915/gem/i915_gem_internal.c      | 3 +--
 drivers/gpu/drm/i915/gem/i915_gem_ioctls.h        | 3 +--
 drivers/gpu/drm/i915/gem/i915_gem_mman.c          | 3 +--
 drivers/gpu/drm/i915/gem/i915_gem_mman.h          | 3 +--
 drivers/gpu/drm/i915/gem/i915_gem_object.c        | 1 +
 drivers/gpu/drm/i915/gem/i915_gem_object.h        | 3 +--
 drivers/gpu/drm/i915/gem/i915_gem_object_types.h  | 3 +--
 drivers/gpu/drm/i915/gem/i915_gem_pages.c         | 3 +--
 drivers/gpu/drm/i915/gem/i915_gem_phys.c          | 3 +--
 drivers/gpu/drm/i915/gem/i915_gem_pm.c            | 3 +--
 drivers/gpu/drm/i915/gem/i915_gem_pm.h            | 3 +--
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c         | 3 +--
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c      | 3 +--
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c        | 3 +--
 drivers/gpu/drm/i915/gem/i915_gem_throttle.c      | 3 +--
 drivers/gpu/drm/i915/gem/i915_gem_tiling.c        | 3 +--
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c       | 5 ++---
 drivers/gpu/drm/i915/gem/i915_gem_wait.c          | 3 +--
 drivers/gpu/drm/i915/gem/i915_gemfs.c             | 3 +--
 drivers/gpu/drm/i915/gem/i915_gemfs.h             | 3 +--
 29 files changed, 30 insertions(+), 57 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_busy.c b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
index ddda468241ef..6e4d0ce3952f 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_busy.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: MIT
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2014-2016 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_clflush.c b/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
index 7d97ea2a653e..c4854c5b4e0f 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: MIT
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2016 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_clflush.h b/drivers/gpu/drm/i915/gem/i915_gem_clflush.h
index e6c382973129..9d7ee1579900 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_clflush.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_clflush.h
@@ -1,6 +1,5 @@
+/* SPDX-License-Identifier: MIT */
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2016 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index ab1af978911b..15835952352e 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: MIT
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2011-2012 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.h b/drivers/gpu/drm/i915/gem/i915_gem_context.h
index e5b0f66ea1fe..6e682a6a0574 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.h
@@ -1,6 +1,5 @@
+/* SPDX-License-Identifier: MIT */
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2016 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
index 67ac2586a0f3..0267c924634b 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
@@ -1,6 +1,5 @@
+/* SPDX-License-Identifier: MIT */
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2019 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
index 9473050ac842..05e440643aa2 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: MIT
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright 2012 Red Hat Inc
  */
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_domain.c b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
index 75a143d996e0..7a0cc51923b3 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_domain.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: MIT
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2014-2016 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 7796c4119ef5..ca7e9216934a 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: MIT
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2008,2010 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_internal.c b/drivers/gpu/drm/i915/gem/i915_gem_internal.c
index ea7561ae6e13..232b984f60b6 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_internal.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_internal.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: MIT
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2014-2016 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ioctls.h b/drivers/gpu/drm/i915/gem/i915_gem_ioctls.h
index 28d6526e32ab..8044d34707b6 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ioctls.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ioctls.h
@@ -1,6 +1,5 @@
+/* SPDX-License-Identifier: MIT */
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2019 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
index c3dabb857960..f6d37dff320d 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: MIT
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2014-2016 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.h b/drivers/gpu/drm/i915/gem/i915_gem_mman.h
index 196417fd0f5c..946fb9825eb3 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_mman.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.h
@@ -1,6 +1,5 @@
+/* SPDX-License-Identifier: MIT */
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2019 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index 356530b599ce..1f38e367c60b 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: MIT
 /*
  * Copyright © 2017 Intel Corporation
  *
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index a5f34542135c..c34f41605b46 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -1,6 +1,5 @@
+/* SPDX-License-Identifier: MIT */
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2016 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
index 68413c05c812..64600aa8227f 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
@@ -1,6 +1,5 @@
+/* SPDX-License-Identifier: MIT */
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2016 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
index 8780aa243105..7f83f8bdc8fb 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: MIT
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2014-2016 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_phys.c b/drivers/gpu/drm/i915/gem/i915_gem_phys.c
index ef85c6dc9fd5..f9e7cab140f8 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_phys.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_phys.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: MIT
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2014-2016 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pm.c b/drivers/gpu/drm/i915/gem/i915_gem_pm.c
index 900c08337942..f0857c5c96df 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_pm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_pm.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: MIT
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2019 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pm.h b/drivers/gpu/drm/i915/gem/i915_gem_pm.h
index bedf1e95941a..bd5bd2c5e7f9 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_pm.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_pm.h
@@ -1,6 +1,5 @@
+/* SPDX-License-Identifier: MIT */
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2019 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
index ae3343c81a64..3b81cc3ad5be 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: MIT
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2014-2016 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
index aec41f0f098f..b81e67504bbe 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: MIT
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2008-2015 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
index 9d958a6f377e..3380151edfc1 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: MIT
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2008-2012 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_throttle.c b/drivers/gpu/drm/i915/gem/i915_gem_throttle.c
index af85d0c28168..8814cbcde5b5 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_throttle.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_throttle.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: MIT
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2014-2016 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_tiling.c b/drivers/gpu/drm/i915/gem/i915_gem_tiling.c
index 5ac23ff3feff..5a296ba3758a 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_tiling.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_tiling.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: MIT
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2008 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
index 09b68713ab32..307a18eede72 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
@@ -1,9 +1,8 @@
+// SPDX-License-Identifier: MIT
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2012-2014 Intel Corporation
  *
-  * Based on amdgpu_mn, which bears the following notice:
+ * Based on amdgpu_mn, which bears the following notice:
  *
  * Copyright 2014 Advanced Micro Devices, Inc.
  * All Rights Reserved.
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_wait.c b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
index 1f55e62044a4..7127e90c1a8f 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_wait.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: MIT
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2016 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gemfs.c b/drivers/gpu/drm/i915/gem/i915_gemfs.c
index 46b9a17d6abc..65d84a93c525 100644
--- a/drivers/gpu/drm/i915/gem/i915_gemfs.c
+++ b/drivers/gpu/drm/i915/gem/i915_gemfs.c
@@ -1,6 +1,5 @@
+// SPDX-License-Identifier: MIT
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2017 Intel Corporation
  */
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gemfs.h b/drivers/gpu/drm/i915/gem/i915_gemfs.h
index 5d835e44c4f6..16d4333c9a4e 100644
--- a/drivers/gpu/drm/i915/gem/i915_gemfs.h
+++ b/drivers/gpu/drm/i915/gem/i915_gemfs.h
@@ -1,6 +1,5 @@
+/* SPDX-License-Identifier: MIT */
 /*
- * SPDX-License-Identifier: MIT
- *
  * Copyright © 2017 Intel Corporation
  */
 
-- 
2.47.2

