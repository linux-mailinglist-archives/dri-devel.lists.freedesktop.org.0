Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE29C19CB8
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 11:40:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 038CE10E799;
	Wed, 29 Oct 2025 10:40:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QVf4SavS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1957C10E785;
 Wed, 29 Oct 2025 10:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761734411; x=1793270411;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Vo5fDg5l1cQVRflLceG3f1a0GaAWCXIWqwrg7GsYNKs=;
 b=QVf4SavS8/i1mR+YG7Yn/yT/REhFnIk8cDzTn7lqvSwAJIUQN5/FHjHr
 P9K2VZ5JYOjdlpoK8JKNtwckprBJ8t4nnIrhMO7GUE3H8WLkDUzcHkvru
 woU2HWMgLzvdHxzdGC2yEuSLg+FKpKM5B18jJjECBKstSETPiGG0g6S+X
 v+Y/xC+9uNW25/4jGIdqt9gVOvGZKDUI7t0XeldNJlACROEJln1ziRJfu
 pVKQaV3/0ZE+7HvrGcPzoSBteQCpgF11ZPeFqFboRURq7bakYkdP+ULNh
 IqcC+YPUuYMEIrdhf0Bd7YTlkD8+FLt46dk5GHPJyFNzXSNy9Sx2EtbGE w==;
X-CSE-ConnectionGUID: mNYgMu2qRM+0WocrUFD7gw==
X-CSE-MsgGUID: zfMGkgeySfiJ32+7J2uE1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11596"; a="66467209"
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; d="scan'208";a="66467209"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 03:40:11 -0700
X-CSE-ConnectionGUID: lBqa6dCLReeVyB0emBoBBw==
X-CSE-MsgGUID: 0UQh4TxORiWF7oIp1f2Lhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; d="scan'208";a="184859587"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.160])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 03:40:08 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, maarten.lankhorst@linux.intel.com,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@redhat.com>,
 simona.vetter@ffwll.ch
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Subject: [PATCH v3 2/4] drm/buddy: replace drm_print.h include with a forward
 declaration
Date: Wed, 29 Oct 2025 12:39:46 +0200
Message-ID: <b303996b407fcbe2c7357bea036f79c45d6dae49.1761734313.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1761734313.git.jani.nikula@intel.com>
References: <cover.1761734313.git.jani.nikula@intel.com>
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

An explicit drm_print.h include has previously been added to all the
files that indirectly depended on this include.

v3: Only remove the include here (Thomas)

Cc: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 include/drm/drm_buddy.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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

