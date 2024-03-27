Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC3688DBA1
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 11:57:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98C3210F9EC;
	Wed, 27 Mar 2024 10:57:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KEhF1pOE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 896C110F9EC
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Mar 2024 10:57:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D6905CE2617;
 Wed, 27 Mar 2024 10:57:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72AE5C43330;
 Wed, 27 Mar 2024 10:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711537039;
 bh=S8RFljb9RNOKlN2Sn5crLFkHNu0wqqwOWO27cARbVDo=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=KEhF1pOE4PDbk2q1VnL3liV1Xadv1v2TySvEOo8LdXOhxC8ru6Fgv8TZohY8Y+a/g
 BlNqim03ueCzC13vIT/vtLECmxj13mbFiC4gGv+/q/k4UXsLJDLkyyo9FKuP761Af0
 fa7WQK0G/pIIJ1K//x08l2P1506PEUOTvGwB5ghuyQKqZloa1+RwgC/VhBHwgJNtS5
 Cd0cwDwYoYvkEiCOpfWSJK+9FfyRc08mP5XrpDNpg57QfXEg+qfNLAjgeuE8GP05zm
 AmuEHduIhA8+S5liKlG3r9ayvLponDi1E0z+1uGoLBvKmukJbzdgl0vrJnafrPHTaI
 f5LK86ABuufIA==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 27 Mar 2024 11:56:57 +0100
Subject: [PATCH v3 02/13] drm/display: Make DisplayPort tunnel debug
 Kconfig name consistent
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-kms-kconfig-helpers-v3-2-eafee11b84b3@kernel.org>
References: <20240327-kms-kconfig-helpers-v3-0-eafee11b84b3@kernel.org>
In-Reply-To: <20240327-kms-kconfig-helpers-v3-0-eafee11b84b3@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Jani Nikula <jani.nikula@intel.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4397; i=mripard@kernel.org;
 h=from:subject:message-id; bh=S8RFljb9RNOKlN2Sn5crLFkHNu0wqqwOWO27cARbVDo=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDGnMvxv8UmxfhQvZzZ/VlXWDf8pejigdHufz5jGbfZbHC
 QnLaNzqmMrCIMzJICumyPJEJuz08vbFVQ72K3/AzGFlAhnCwMUpABPpP8HYMKFCjC8rnkFozbKu
 eS6BL1vmmLvcn7Zoc8P3Mz/eboln65WL9z6ivSOo3+lk8sEnL/74M9anFhp0Fn7rdfqR1PWqnPu
 GnEOJ3lzO9Tplny8+stvAwvubndn6zZ1HZRulf1evNTfLMAUA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

While most display helpers Kconfig symbols have the DRM_DISPLAY prefix,
the DisplayPort Tunnel debugging uses DRM_DISPLAY_DEBUG_DP_TUNNEL_STATE.

Since the number of users is limited and it's a selected symbol, we can
easily rename it to make it consistent.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/display/Kconfig         |  2 +-
 drivers/gpu/drm/display/drm_dp_tunnel.c | 10 +++++-----
 drivers/gpu/drm/i915/Kconfig.debug      |  2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
index 843d74db1dce..0d350e9db807 100644
--- a/drivers/gpu/drm/display/Kconfig
+++ b/drivers/gpu/drm/display/Kconfig
@@ -23,11 +23,11 @@ config DRM_DISPLAY_DP_TUNNEL
 	help
 	  Enable support for DisplayPort tunnels. This allows drivers to use
 	  DP tunnel features like the Bandwidth Allocation mode to maximize the
 	  BW utilization for display streams on Thunderbolt links.
 
-config DRM_DISPLAY_DEBUG_DP_TUNNEL_STATE
+config DRM_DISPLAY_DP_TUNNEL_STATE_DEBUG
 	bool "Enable debugging the DP tunnel state"
 	depends on REF_TRACKER
 	depends on DRM_DISPLAY_DP_TUNNEL
 	depends on DEBUG_KERNEL
 	depends on EXPERT
diff --git a/drivers/gpu/drm/display/drm_dp_tunnel.c b/drivers/gpu/drm/display/drm_dp_tunnel.c
index 120e0de674c1..2a91e9b11d03 100644
--- a/drivers/gpu/drm/display/drm_dp_tunnel.c
+++ b/drivers/gpu/drm/display/drm_dp_tunnel.c
@@ -189,11 +189,11 @@ struct drm_dp_tunnel_mgr {
 
 	int group_count;
 	struct drm_dp_tunnel_group *groups;
 	wait_queue_head_t bw_req_queue;
 
-#ifdef CONFIG_DRM_DISPLAY_DEBUG_DP_TUNNEL_STATE
+#ifdef CONFIG_DRM_DISPLAY_DP_TUNNEL_STATE_DEBUG
 	struct ref_tracker_dir ref_tracker;
 #endif
 };
 
 /*
@@ -383,11 +383,11 @@ static void free_tunnel(struct kref *kref)
 static void tunnel_put(struct drm_dp_tunnel *tunnel)
 {
 	kref_put(&tunnel->kref, free_tunnel);
 }
 
-#ifdef CONFIG_DRM_DISPLAY_DEBUG_DP_TUNNEL_STATE
+#ifdef CONFIG_DRM_DISPLAY_DP_TUNNEL_STATE_DEBUG
 static void track_tunnel_ref(struct drm_dp_tunnel *tunnel,
 			     struct ref_tracker **tracker)
 {
 	ref_tracker_alloc(&tunnel->group->mgr->ref_tracker,
 			  tracker, GFP_KERNEL);
@@ -1601,11 +1601,11 @@ static bool init_group(struct drm_dp_tunnel_mgr *mgr, struct drm_dp_tunnel_group
 static void cleanup_group(struct drm_dp_tunnel_group *group)
 {
 	drm_atomic_private_obj_fini(&group->base);
 }
 
-#ifdef CONFIG_DRM_DISPLAY_DEBUG_DP_TUNNEL_STATE
+#ifdef CONFIG_DRM_DISPLAY_DP_TUNNEL_STATE_DEBUG
 static void check_unique_stream_ids(const struct drm_dp_tunnel_group_state *group_state)
 {
 	const struct drm_dp_tunnel_state *tunnel_state;
 	u32 stream_mask = 0;
 
@@ -1879,11 +1879,11 @@ static void destroy_mgr(struct drm_dp_tunnel_mgr *mgr)
 	for (i = 0; i < mgr->group_count; i++) {
 		cleanup_group(&mgr->groups[i]);
 		drm_WARN_ON(mgr->dev, !list_empty(&mgr->groups[i].tunnels));
 	}
 
-#ifdef CONFIG_DRM_DISPLAY_DEBUG_DP_TUNNEL_STATE
+#ifdef CONFIG_DRM_DISPLAY_DP_TUNNEL_STATE_DEBUG
 	ref_tracker_dir_exit(&mgr->ref_tracker);
 #endif
 
 	kfree(mgr->groups);
 	kfree(mgr);
@@ -1916,11 +1916,11 @@ drm_dp_tunnel_mgr_create(struct drm_device *dev, int max_group_count)
 		kfree(mgr);
 
 		return NULL;
 	}
 
-#ifdef CONFIG_DRM_DISPLAY_DEBUG_DP_TUNNEL_STATE
+#ifdef CONFIG_DRM_DISPLAY_DP_TUNNEL_STATE_DEBUG
 	ref_tracker_dir_init(&mgr->ref_tracker, 16, "dptun");
 #endif
 
 	for (i = 0; i < max_group_count; i++) {
 		if (!init_group(mgr, &mgr->groups[i])) {
diff --git a/drivers/gpu/drm/i915/Kconfig.debug b/drivers/gpu/drm/i915/Kconfig.debug
index bc18e2d9ea05..5ae02c1cd25c 100644
--- a/drivers/gpu/drm/i915/Kconfig.debug
+++ b/drivers/gpu/drm/i915/Kconfig.debug
@@ -26,11 +26,11 @@ config DRM_I915_DEBUG
 	select I2C_CHARDEV
 	select REF_TRACKER
 	select STACKDEPOT
 	select STACKTRACE
 	select DRM_DP_AUX_CHARDEV
-	select DRM_DISPLAY_DEBUG_DP_TUNNEL_STATE if DRM_I915_DP_TUNNEL
+	select DRM_DISPLAY_DP_TUNNEL_STATE_DEBUG if DRM_I915_DP_TUNNEL
 	select X86_MSR # used by igt/pm_rpm
 	select DRM_VGEM # used by igt/prime_vgem (dmabuf interop checks)
 	select DRM_DEBUG_MM if DRM=y
 	select DRM_EXPORT_FOR_TESTS if m
 	select DRM_DEBUG_SELFTEST

-- 
2.44.0

