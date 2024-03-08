Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B09D28763CB
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 12:57:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE13B113899;
	Fri,  8 Mar 2024 11:57:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hdng7vy6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4325011389A;
 Fri,  8 Mar 2024 11:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709899029; x=1741435029;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XOvwpxtMLS91XNHKuhCHjLkFXhUKzy8vr1s/svPWN2s=;
 b=Hdng7vy6TKImAiHX2vEJHAdkViiWJezF8uXVz2ejA9u0Tlu1m8h8+nfZ
 onb4tQbgNOWZIkMt/dlFSFftclpmVca8L6WAXZhDEtJtBkHIjKArC5hGg
 c70PXBytSTdMFguyMIPlum/ATQolYXnTlPcbTjaXkT6YkNnGz43OmNpPS
 KmDMKxxDVJTAX6VDlOlufxwYWLt0tbOA9nqLKxLR7PFcJh+1yyCIiI0QU
 8c3Zakc3tMmmfObaaW6Flni04iPO7QoKvqmH8JKRHNCrMphHQD6my+O+a
 b19k00qGT+mF1xQ33gHb0SorUbktd4C0dSuq1FR1xwy++nPianvq0KgNa g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4794560"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="4794560"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 03:57:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="10378591"
Received: from unknown (HELO localhost) ([10.252.34.187])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 03:57:05 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Masahiro Yamada <masahiroy@kernel.org>, lucas.demarchi@intel.com,
 Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>
Subject: [PATCH v2 09/16] drm/ttm: fix ttm_bo.h kernel-doc warnings
Date: Fri,  8 Mar 2024 13:55:47 +0200
Message-Id: <bf51b87689f0c5c5f2343c75e14b984afcb6a58c.1709898638.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1709898638.git.jani.nikula@intel.com>
References: <cover.1709898638.git.jani.nikula@intel.com>
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

Some renames, some formatting fixes, add some missing documentation.

Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Huang Rui <ray.huang@amd.com>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 include/drm/ttm/ttm_bo.h | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
index 0223a41a64b2..59151ecb2db3 100644
--- a/include/drm/ttm/ttm_bo.h
+++ b/include/drm/ttm/ttm_bo.h
@@ -83,6 +83,9 @@ enum ttm_bo_type {
  * @resource: structure describing current placement.
  * @ttm: TTM structure holding system pages.
  * @deleted: True if the object is only a zombie and already deleted.
+ * @bulk_move: The bulk move object.
+ * @priority: Priority for LRU, BOs with lower priority are evicted first.
+ * @pin_count: Pin count.
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
+ * @bo: The TTM BO.
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
+ * @bytes_moved: Statistics on how many bytes have been moved.
  *
  * Context for TTM operations like changing buffer placement or general memory
  * allocation.
@@ -264,7 +270,7 @@ static inline int ttm_bo_reserve(struct ttm_buffer_object *bo,
  * ttm_bo_reserve_slowpath:
  * @bo: A pointer to a struct ttm_buffer_object.
  * @interruptible: Sleep interruptible if waiting.
- * @sequence: Set (@bo)->sequence to this value after lock
+ * @ticket: Ticket used to acquire the ww_mutex.
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

