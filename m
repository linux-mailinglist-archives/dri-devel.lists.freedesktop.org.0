Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C758ABF7A97
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 18:29:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D57A910E623;
	Tue, 21 Oct 2025 16:29:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dG4k9j7I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93D3310E61D;
 Tue, 21 Oct 2025 16:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761064192; x=1792600192;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zvWJFsqQ4gJo4ohq3uk5I5cWQCt7oxMRHuVsp/vflr0=;
 b=dG4k9j7IKTUWnv4sKUJy81ic9hpgOkgJbM3TOsYJiYXYMv3vKjB5Dr7g
 Q+Ox8t1vZToJJgO49A52offPYr+GhP9PiTGFfwO/dZmZsFEGukLFsNkiV
 ntCONrDkvXL1It+/ztab1LdpbqmC9lTg0gDSFdiAK5rcZWDzNJbIGQ2tF
 Y/v3fisSaKC89p9ENdkgvsFhSOyOOwI+9eCHHg7VfABpf4KO1P3g4xeB8
 ppScdvaQw3HYAhHFppQnm+gT/JzHwR1xniGgycEOVCUE/nqT3l6deW+pq
 qKVs0YNsMdaYKSRdeQpa2d+2JMhTcXIzm8V+20N3zu/8LYb6IKQ7P0W+7 Q==;
X-CSE-ConnectionGUID: TZJhBRAeRMqSl+uVjgoFLw==
X-CSE-MsgGUID: fvCNJ6QkT720hb/MP6MIaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63292748"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="63292748"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 09:29:52 -0700
X-CSE-ConnectionGUID: FD+ZxpEATCmPkcbX2UMGAg==
X-CSE-MsgGUID: 7jJoosJOR6iE276nsZS01Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="184409832"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.52])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 09:29:49 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, maarten.lankhorst@linux.intel.com,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@redhat.com>,
 simona.vetter@ffwll.ch
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Subject: [PATCH 2/3] drm/buddy: replace drm_print.h include with a forward
 declaration
Date: Tue, 21 Oct 2025 19:29:27 +0300
Message-ID: <1fe6524aeb048c02d574e43fd323f1dacd301e4f.1761063757.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1761063757.git.jani.nikula@intel.com>
References: <cover.1761063757.git.jani.nikula@intel.com>
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

