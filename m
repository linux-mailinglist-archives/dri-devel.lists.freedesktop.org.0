Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 312E2BFB370
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 11:49:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F1D810E72B;
	Wed, 22 Oct 2025 09:48:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k7Onl6vD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD6C110E725;
 Wed, 22 Oct 2025 09:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761126536; x=1792662536;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zvWJFsqQ4gJo4ohq3uk5I5cWQCt7oxMRHuVsp/vflr0=;
 b=k7Onl6vDEsBEcoNXs5NX4/JeHuQ9PGOqiAHgjBfnVRaworddh5t1phHG
 gM/jLJShJ3xpEzD3F1aptpjX8wmzMCdQsdDG/umXsOPWK1Jh91eR8KbRy
 +3qQAqWfsrqtWcvRpXizKjMmj9+wBpMSK2Md/3gVdOi0e6ICcF9b+bZkC
 TuG5D8X7a3ZYELn/qfYlg321ewOI2AjUk3aYPQsAxlMyLVgwCVTqhBph9
 gygk8i7hVbdqtcySlqOcdDmgx6HhNNgsyVXVspGOZ3wS0FibHVOoA2Y8Z
 U51pMIQeg0BYYrBMEcLhf0MRfaK6n3pJHMKdY7IMtILplyOZy1rW2RdWC A==;
X-CSE-ConnectionGUID: tZbCAunHRMiTGGKumiqOHQ==
X-CSE-MsgGUID: 8k0ZEaX5TpuDxSHFT7E1CQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62972222"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="62972222"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 02:48:56 -0700
X-CSE-ConnectionGUID: yO2mc2UASICJQlIF+Mr1oQ==
X-CSE-MsgGUID: 2bk/0bD5S9CD5owqIJR5Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="183040172"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.104])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 02:48:52 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, maarten.lankhorst@linux.intel.com,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@redhat.com>,
 simona.vetter@ffwll.ch
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Subject: [PATCH v2 2/3] drm/buddy: replace drm_print.h include with a forward
 declaration
Date: Wed, 22 Oct 2025 12:48:32 +0300
Message-ID: <17c925aa3fee7b1771d1a550146ab243f23c54fb.1761126446.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1761126446.git.jani.nikula@intel.com>
References: <cover.1761126446.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

The drm_buddy.h header does not really need anything from drm_print.h. A
simple forward declaration for struct drm_printer is sufficient.

Add the include where needed.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_buddy.c | 1 +
 include/drm/drm_buddy.h     | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index f2c92902e4a3..2f279b46bd2c 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -11,6 +11,7 @@
 #include <linux/sizes.h>
 
 #include <drm/drm_buddy.h>
+#include <drm/drm_print.h>
 
 enum drm_buddy_free_tree {
 	DRM_BUDDY_CLEAR_TREE = 0,
diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
index c2e05a281252..b909fa8f810a 100644
--- a/include/drm/drm_buddy.h
+++ b/include/drm/drm_buddy.h
@@ -12,7 +12,7 @@
 #include <linux/sched.h>
 #include <linux/rbtree.h>
 
-#include <drm/drm_print.h>
+struct drm_printer;
 
 #define DRM_BUDDY_RANGE_ALLOCATION		BIT(0)
 #define DRM_BUDDY_TOPDOWN_ALLOCATION		BIT(1)
-- 
2.47.3

