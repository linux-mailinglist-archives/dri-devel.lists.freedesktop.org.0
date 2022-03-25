Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 456234E703D
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 10:49:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 701ED10E1BF;
	Fri, 25 Mar 2022 09:49:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 516F910E1BF;
 Fri, 25 Mar 2022 09:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648201770; x=1679737770;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oOxK6Sxwjhkr4sQCIltGC+1KBxtzROBiHetlgY9Z9R4=;
 b=mDz4snDIV90gSH3jdvr7oiGxqMS8xzcDLUuSUsTP4M0eZ0QQPYN6J2i7
 m5yeS1Wt+1iX/1WxztjCOdbjln9phJ/aXoQoMWcBDedN1pRW06OmE+54P
 +U6MpwxKvEkRXnKrZxt/4xWBRm3wUxjXWQ6IFC97Tv0pVkX5sEup8JNgb
 2K2WduEgmVXOKQ+a2ax0ucs+09qWZDxu8aAXhUBv3Y7PTETqtw7oM2OO1
 MSAOMuB5xs1ZRiS01EClfb2hiS5KOgW4DqeMLzZiCNgsxG+0guie94Ae5
 DBy8cFKyH6RKrdC/NOo74JvzdclNRzlqYt2xrZgdM7CssIcUBHUNXIQYA Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10296"; a="258565233"
X-IronPort-AV: E=Sophos;i="5.90,209,1643702400"; d="scan'208";a="258565233"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2022 02:49:27 -0700
X-IronPort-AV: E=Sophos;i="5.90,209,1643702400"; d="scan'208";a="545022439"
Received: from cfmcclea-mobl.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.232.142])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2022 02:49:25 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/uapi: Document DRM_I915_QUERY_HWCONFIG_BLOB
Date: Fri, 25 Mar 2022 09:49:16 +0000
Message-Id: <20220325094916.2186367-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.32.0
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Jon Ewins <jon.ewins@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jon Bloomfield <jon.bloomfield@intel.com>,
 Jordan Justen <jordan.l.justen@intel.com>,
 John Harrison <john.c.harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

UAPI with absolutely no documentation should not have been added -
clarify blob format and content will be described externally.

Fixes: 78e1fb3112c0 ("drm/i915/uapi: Add query for hwconfig blob")
Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Co-developed-by: Jordan Justen <jordan.l.justen@intel.com>
Cc: Jon Bloomfield <jon.bloomfield@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: John Harrison <john.c.harrison@intel.com>
Cc: Jon Ewins <jon.ewins@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 include/uapi/drm/i915_drm.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index 071ffd9d51f1..8d0719bee8fc 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -2683,6 +2683,9 @@ struct drm_i915_perf_oa_config {
  *
  * The behaviour is determined by the @query_id. Note that exactly what
  * @data_ptr is also depends on the specific @query_id.
+ *
+ * For specific queries see:
+ *  * `GuC HWCONFIG blob uAPI`_
  */
 struct drm_i915_query_item {
 	/** @query_id: The id for this query */
@@ -3135,6 +3138,16 @@ struct drm_i915_query_memory_regions {
 	struct drm_i915_memory_region_info regions[];
 };
 
+/**
+ * DOC: GuC HWCONFIG blob uAPI
+ *
+ * The GuC produces a blob with information about the current device.
+ * i915 reads this blob from GuC and makes it available via this uAPI.
+ *
+ * The format and meading of the blob content are documented in the
+ * Programmer's Reference Manual.
+ */
+
 /**
  * struct drm_i915_gem_create_ext - Existing gem_create behaviour, with added
  * extension support using struct i915_user_extension.
-- 
2.32.0

