Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D808873F5B
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 19:33:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F338113448;
	Wed,  6 Mar 2024 18:33:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RdDHVOVB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BCF411343C;
 Wed,  6 Mar 2024 18:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709749994; x=1741285994;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kHwiGXs1UK0ffybUlmwpIRKtWWNC1naktCRnTPoYMo0=;
 b=RdDHVOVBbKyidffed9W7y+ddZYNNG2FJBU3vO22oFeZMr38EZt+2jfAS
 EpUPzFPGa0dk+ec6vuesp795aGh+5N4flvSQkcIzz7Tz5mAPsexUljLeN
 cnChoELRID+kKG7KSTmGaYDBsvJrkkt3eJvJe4BrIkdq0aBb2WBlHhniF
 YqxB5tNjknMGVKfgV0W6ukUpYoMPuRDQOS/xDufnpzzbYLdB3q0nyeA2a
 RyGAXA7FfdAal/PJoLdY/+q0BQiOJFe2bI+tEBL/k8s6iHknsE62q9w0V
 7UYYSnDxI3AsQZsDrjBDG8IAH1gcMyodpIq4bS5Bg8ham7pv9ZQhUCKSC Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="15102797"
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; d="scan'208";a="15102797"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 10:33:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="9989560"
Received: from rjongalo-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.33.211])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 10:33:01 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com
Subject: [PATCH 18/22] drm/ttm: fix ttm_bo.h kernel-doc warnings
Date: Wed,  6 Mar 2024 20:31:23 +0200
Message-Id: <a49f3dddc5a96fa2866ff6322c064f53edbfd93c.1709749576.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1709749576.git.jani.nikula@intel.com>
References: <cover.1709749576.git.jani.nikula@intel.com>
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

Some renames, some formatting fixes, add some as FIXME.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 include/drm/ttm/ttm_bo.h | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
index 0223a41a64b2..8b1eb6828f0a 100644
--- a/include/drm/ttm/ttm_bo.h
+++ b/include/drm/ttm/ttm_bo.h
@@ -83,6 +83,9 @@ enum ttm_bo_type {
  * @resource: structure describing current placement.
  * @ttm: TTM structure holding system pages.
  * @deleted: True if the object is only a zombie and already deleted.
+ * @bulk_move: FIXME
+ * @priority: FIXME
+ * @pin_count: FIXME
  *
  * Base class for TTM buffer object, that deals with data placement and CPU
  * mappings. GPU mappings are really up to the driver, but for simpler GPUs
@@ -128,26 +131,28 @@ struct ttm_buffer_object {
 	struct work_struct delayed_delete;
 
 	/**
-	 * Special members that are protected by the reserve lock
-	 * and the bo::lock when written to. Can be read with
-	 * either of these locks held.
+	 * @sg: Special members that are protected by the reserve lock and the
+	 * bo::lock when written to. Can be read with either of these locks
+	 * held.
 	 */
 	struct sg_table *sg;
 };
 
+#define TTM_BO_MAP_IOMEM_MASK 0x80
+
 /**
  * struct ttm_bo_kmap_obj
  *
  * @virtual: The current kernel virtual address.
  * @page: The page when kmap'ing a single page.
  * @bo_kmap_type: Type of bo_kmap.
+ * @bo: FIXME
  *
  * Object describing a kernel mapping. Since a TTM bo may be located
  * in various memory types with various caching policies, the
  * mapping can either be an ioremap, a vmap, a kmap or part of a
  * premapped region.
  */
-#define TTM_BO_MAP_IOMEM_MASK 0x80
 struct ttm_bo_kmap_obj {
 	void *virtual;
 	struct page *page;
@@ -171,6 +176,7 @@ struct ttm_bo_kmap_obj {
  * @force_alloc: Don't check the memory account during suspend or CPU page
  * faults. Should only be used by TTM internally.
  * @resv: Reservation object to allow reserved evictions with.
+ * @bytes_moved: FIXME
  *
  * Context for TTM operations like changing buffer placement or general memory
  * allocation.
@@ -264,7 +270,7 @@ static inline int ttm_bo_reserve(struct ttm_buffer_object *bo,
  * ttm_bo_reserve_slowpath:
  * @bo: A pointer to a struct ttm_buffer_object.
  * @interruptible: Sleep interruptible if waiting.
- * @sequence: Set (@bo)->sequence to this value after lock
+ * @ticket: FIXME
  *
  * This is called after ttm_bo_reserve returns -EAGAIN and we backed off
  * from all our other reservations. Because there are no other reservations
@@ -303,7 +309,7 @@ static inline void ttm_bo_assign_mem(struct ttm_buffer_object *bo,
 }
 
 /**
- * ttm_bo_move_null = assign memory for a buffer object.
+ * ttm_bo_move_null - assign memory for a buffer object.
  * @bo: The bo to assign the memory to
  * @new_mem: The memory to be assigned.
  *
-- 
2.39.2

