Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E7789CC03
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 20:55:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E856E112822;
	Mon,  8 Apr 2024 18:55:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FY0RjRKu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70110112822
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Apr 2024 18:55:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6830B61378;
 Mon,  8 Apr 2024 18:55:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C4ECC433A6;
 Mon,  8 Apr 2024 18:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712602522;
 bh=a35qe99T0ty/qo/ABfWr3rySxoEPvBFi4B3MDRC+sK0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FY0RjRKufGT3vRk0kkLSo0GAMdzzXJtqvbI/jK2bsN2IIeTf7Fwbpa2oij+7EKGr6
 QcJukV11+g9JvtPOMr5Cbq2aRi3rCgcRH1o2iOOo/emrisMWi8h7V/K62vSTe5urBo
 dout4fC9OBY11y9IjcD95Ys6jt00sW9oA+HNiqF2VuQMuhafksmVGpSaEvyKOgTY7O
 e4uYFc3Bhdvuh/ZM5H4ZdSW7as2p30fK3XITIkWFIaWjTGxYtevfTdjpvLCwldFXeg
 MqalayoD2SYf+bFD9VScUhEFoxuYLsiZtN2pDaoW/xnYwvioGDTkRhprKUeJeH3lG3
 U/QpQ0yuNeHLg==
From: Namhyung Kim <namhyung@kernel.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>,
 Ian Rogers <irogers@google.com>, Kan Liang <kan.liang@linux.intel.com>
Cc: Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, linux-perf-users@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: [PATCH 1/9] tools/include: Sync uapi/drm/i915_drm.h with the kernel
 sources
Date: Mon,  8 Apr 2024 11:55:12 -0700
Message-ID: <20240408185520.1550865-2-namhyung@kernel.org>
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
In-Reply-To: <20240408185520.1550865-1-namhyung@kernel.org>
References: <20240408185520.1550865-1-namhyung@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To pick up changes from:

   b112364867499 ("drm/i915: Add GuC submission interface version query")
   5cf0fbf763741 ("drm/i915: Add some boring kerneldoc")

This should be used to beautify DRM syscall arguments and it addresses
these tools/perf build warnings:

  Warning: Kernel ABI header differences:
    diff -u tools/include/uapi/drm/i915_drm.h include/uapi/drm/i915_drm.h

Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Namhyung Kim <namhyung@kernel.org>
---
 tools/include/uapi/drm/i915_drm.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/tools/include/uapi/drm/i915_drm.h b/tools/include/uapi/drm/i915_drm.h
index fd4f9574d177..2ee338860b7e 100644
--- a/tools/include/uapi/drm/i915_drm.h
+++ b/tools/include/uapi/drm/i915_drm.h
@@ -3013,6 +3013,7 @@ struct drm_i915_query_item {
 	 *  - %DRM_I915_QUERY_MEMORY_REGIONS (see struct drm_i915_query_memory_regions)
 	 *  - %DRM_I915_QUERY_HWCONFIG_BLOB (see `GuC HWCONFIG blob uAPI`)
 	 *  - %DRM_I915_QUERY_GEOMETRY_SUBSLICES (see struct drm_i915_query_topology_info)
+	 *  - %DRM_I915_QUERY_GUC_SUBMISSION_VERSION (see struct drm_i915_query_guc_submission_version)
 	 */
 	__u64 query_id;
 #define DRM_I915_QUERY_TOPOLOGY_INFO		1
@@ -3021,6 +3022,7 @@ struct drm_i915_query_item {
 #define DRM_I915_QUERY_MEMORY_REGIONS		4
 #define DRM_I915_QUERY_HWCONFIG_BLOB		5
 #define DRM_I915_QUERY_GEOMETRY_SUBSLICES	6
+#define DRM_I915_QUERY_GUC_SUBMISSION_VERSION	7
 /* Must be kept compact -- no holes and well documented */
 
 	/**
@@ -3566,6 +3568,20 @@ struct drm_i915_query_memory_regions {
 	struct drm_i915_memory_region_info regions[];
 };
 
+/**
+ * struct drm_i915_query_guc_submission_version - query GuC submission interface version
+ */
+struct drm_i915_query_guc_submission_version {
+	/** @branch: Firmware branch version. */
+	__u32 branch;
+	/** @major: Firmware major version. */
+	__u32 major;
+	/** @minor: Firmware minor version. */
+	__u32 minor;
+	/** @patch: Firmware patch version. */
+	__u32 patch;
+};
+
 /**
  * DOC: GuC HWCONFIG blob uAPI
  *
-- 
2.44.0.478.gd926399ef9-goog

