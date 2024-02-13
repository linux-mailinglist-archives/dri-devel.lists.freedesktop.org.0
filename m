Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D9985291C
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 07:40:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 679A710E84A;
	Tue, 13 Feb 2024 06:40:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AuOUUVj7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0D0710E75F;
 Tue, 13 Feb 2024 06:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707806445; x=1739342445;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=knLSkOtkXElX8rmX7Q0gp0h2YpO311DrwydPDUR9OHE=;
 b=AuOUUVj7WlYg9zSZ9OtPB9WO3o4XheLuGTJzHYkdXKmcg7WjnQKKDmof
 4tSH0cMcbCXTuWtQl3a3W4j6RZoi33VwuyNUFWftwTnUHGk3UEN/tcUL+
 M5GhR5anLf6qglT9vMl4rWZ6n9QRh7AwRrDuDkOuHouC/wCRUxuDq0vqV
 X7S3qowC9DWFAn8xaq6pnAO+yFyqy37hA0NhGgUA3DFG2RpJIi3Ap61vd
 wgo7ltDDy0jRFJRIQGnVLmCzBdIOBSsbXODrbVyQasAgN3jE9CC+2+RPT
 K6aWpbiYCN2vprtfLUwrIaGN27q9FX8niMamGFZkZHGgQ0kYjDZ86/NmI g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="436947649"
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; d="scan'208";a="436947649"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 22:40:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="7450155"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orviesa003.jf.intel.com with ESMTP; 12 Feb 2024 22:40:36 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com,
 contact@emersion.fr, harry.wentland@amd.com, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, daniel@ffwll.ch,
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com,
 quic_abhinavk@quicinc.com, arthurgrillo@riseup.net, marcan@marcan.st,
 Liviu.Dudau@arm.com, sashamcintosh@google.com, sean@poorly.run,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Subject: [PATCH 02/28] drm: Add missing function declarations
Date: Tue, 13 Feb 2024 12:18:09 +0530
Message-ID: <20240213064835.139464-3-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240213064835.139464-1-uma.shankar@intel.com>
References: <20240213064835.139464-1-uma.shankar@intel.com>
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

From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

add missing declarations to avoid warnings.

Note: This patch should be squashed with patches it fixes
in the colorop series by Harry [1]

("drm/colorop: Introduce new drm_colorop mode object") [2]
("drm/plane: Add COLOR PIPELINE property") [3]

[1] https://patchwork.freedesktop.org/series/123446/
[2] https://patchwork.freedesktop.org/patch/566617/?series=123446&rev=3
[3] https://patchwork.freedesktop.org/patch/566616/?series=123446&rev=3

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 include/drm/drm_atomic.h  | 3 +++
 include/drm/drm_colorop.h | 3 ++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 898b02689d6d..5cf025895baf 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -847,6 +847,9 @@ drm_atomic_add_affected_connectors(struct drm_atomic_state *state,
 int __must_check
 drm_atomic_add_affected_planes(struct drm_atomic_state *state,
 			       struct drm_crtc *crtc);
+int __must_check
+drm_atomic_add_affected_colorops(struct drm_atomic_state *state,
+				 struct drm_plane *plane);
 
 int __must_check drm_atomic_check_only(struct drm_atomic_state *state);
 int __must_check drm_atomic_commit(struct drm_atomic_state *state);
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index faca6eba10e1..5b8c36538491 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -249,7 +249,8 @@ const char *drm_get_color_pipeline_name(struct drm_colorop *colorop);
 
 const char *drm_get_colorop_type_name(enum drm_colorop_type type);
 const char *drm_get_colorop_curve_1d_type_name(enum drm_colorop_curve_1d_type type);
-
+void drm_colorop_destroy_state(struct drm_colorop *colorop,
+			       struct drm_colorop_state *state);
 void drm_colorop_set_next_property(struct drm_colorop *colorop, struct drm_colorop *next);
 uint32_t drm_colorop_get_next_property(struct drm_colorop *colorop);
 struct drm_colorop *drm_colorop_get_next(struct drm_colorop *colorop);
-- 
2.42.0

