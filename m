Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19271425C43
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 21:39:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B1FC6F4D6;
	Thu,  7 Oct 2021 19:39:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F36B16F4CC;
 Thu,  7 Oct 2021 19:39:19 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 07B282B00A30;
 Thu,  7 Oct 2021 15:39:18 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 07 Oct 2021 15:39:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=omW2dBXveyMqG
 7DvDdkh1H1/pnPFL38MoqzgQ5lnZto=; b=VbRIs9ovzOrzkRP5I5NQpGZTi6KNS
 z8q47PqR1h0M4i8FXRxzq/yqHJEpYi1dZMSKz1nNIUDn+X5tsMsToX+j24YFEqqV
 mZrFJ49qJRJ5KJHcENGQ19BsKcYM+PkRJ/rB45qQdRBv+yLxhAtPbtis+lkSwpda
 8Nog66oITdcyHmiiSeUeovT4wDSvIDXs6wLRHMLvCHLYNmhVKR4j+rjwalQPJf37
 i1oZAxmbb4KmcDBN+B51m1AtZDbr2rhxPjkAvs1bG/J1V4s6/nQmWxYGIU1yWhkS
 ngP0bejn2H7YtIIQxz8u4f/eg5tbdrFw5fp+SPPGxDl/styfL4wOQ90Pg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=omW2dBXveyMqG7DvDdkh1H1/pnPFL38MoqzgQ5lnZto=; b=Lkhn41XD
 JlDsqcRZlAl412IvIKTt4Z6XXC6LM2TkyCEIY3wwloPObQnHVUB6FImVh4yX6Fws
 mj9gaHbmwRe71F15MzVblEJykAkOu+jPoXrNzJqzOsuEKOdEgmdP+4SBtXyob/7W
 eGaABt4RACsWu23Qkx0vEzBgF/2MMtN6Ml0OVGoNgwkKg2VKsyg6gbfcpF+TXRWp
 2NyHhjTb2S411MvhmlCrFeP+/crAGMkTdCPJnXRzHn/EpmF2nuPU2e2XGUPK0v2d
 7anizruLkUC+TuJOAdeEE8vHnIttenconGd0B11mCIOgcS3RVy/LV7ZoTpk1PWTH
 KpYdI+v7pDiSQA==
X-ME-Sender: <xms:5kxfYRIHi862uq2BJDN-oTzXIBrcgMDpejttNKS6XcFHghZoEjE4JA>
 <xme:5kxfYdJKGkJv0vtQLb5T7LMEh1cz44GT1zYq7ua6WOY0k89qITECY2hna7lpvLG6P
 nBxeHjauJD8BOPSAg>
X-ME-Received: <xmr:5kxfYZvfYtGJUxocVtKPyAenti0VLXR9hSCnCbgdNC6mArmvF5lOZSW9dlcmGsYLTmLM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudelkedgudefjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefhvghrnhgrnhguohcutfgrmhhoshcuoehgrhgvvghnfhho
 ohesuhelvddrvghuqeenucggtffrrghtthgvrhhnpeekleekjedtheejheekfefggeevvd
 fgueegffeuveduhfehueegkeeijedvvdejfeenucevlhhushhtvghrufhiiigvpedtnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvvghnfhhoohesuhelvddrvghu
X-ME-Proxy: <xmx:5kxfYSbjxc1Dl2TStYzAAevlhYksDF22vJNyyAW5VXSQqqcc2liIYw>
 <xmx:5kxfYYafof77XHhQZJ3ghlxMMCADnLlawIXEdcIQfAZuN6dmLYZIjg>
 <xmx:5kxfYWDskWScm4uASznDW714P72SVH6zSlaMO9CXTa6jXoWxw7wY4A>
 <xmx:5kxfYWkZUhXNN9c2qXvDDCkxVNwurUEIloA1M4DNEvrpIKBJeVJcck_qqpI>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 7 Oct 2021 15:39:15 -0400 (EDT)
From: Fernando Ramos <greenfoo@u92.eu>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, sean@poorly.run, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH v3 18/20] drm/amd: cleanup: drm_modeset_lock_all() -->
 DRM_MODESET_LOCK_ALL_BEGIN() [part 3]
Date: Thu,  7 Oct 2021 21:37:53 +0200
Message-Id: <20211007193755.29579-19-greenfoo@u92.eu>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211007193755.29579-1-greenfoo@u92.eu>
References: <20211007193755.29579-1-greenfoo@u92.eu>
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

As requested in Documentation/gpu/todo.rst, replace driver calls to
drm_modeset_lock_all() with DRM_MODESET_LOCK_ALL_BEGIN() and
DRM_MODESET_LOCK_ALL_END()

NOTE:

While this change is similar to the one done two commits ago, it
contains an important extra nuances that I'm going to explain next.

The only difference between the old drm_modeset_{lock,unlock}_all()
functions and the new DRM_MODESET_LOCK_ALL_{BEGIN,END}() macros is that
the former use a global context stored in dev->mode_config.acquire_ctx
while the latter depend on a user provided one (typically in the stack).

This means that as long as no one accesses the global
dev->mode_config.acquire_ctx context in the block that runs between
lock/BEGIN and unlock/END, the code should be equivalent before and
after my changes.

Turns out that, while not obvious at first sight, the call to
dm_restore_drm_connector_state() done between drm_modset_lock_all() and
drm_modeset_unlock_all() ends up using that global context structure
stored in dev.

To fix this we need to update some function prototypes to accept the
new stack allocated variable as an argument.

Signed-off-by: Fernando Ramos <greenfoo@u92.eu>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 27 ++++++++++++-------
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  3 ++-
 .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 13 ++++++---
 3 files changed, 29 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 444ad054980a..2041075243d5 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -80,6 +80,7 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_vblank.h>
 #include <drm/drm_audio_component.h>
+#include <drm/drm_drv.h>
 
 #if defined(CONFIG_DRM_AMD_DC_DCN)
 #include "ivsrcid/dcn/irqsrcs_dcn_1_0.h"
@@ -2880,6 +2881,8 @@ static void handle_hpd_irq_helper(struct amdgpu_dm_connector *aconnector)
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct dm_connector_state *dm_con_state = to_dm_connector_state(connector->state);
 	struct dm_crtc_state *dm_crtc_state = NULL;
+	struct drm_modeset_acquire_ctx ctx;
+	int ret;
 
 	if (adev->dm.disable_hpd_irq)
 		return;
@@ -2921,9 +2924,9 @@ static void handle_hpd_irq_helper(struct amdgpu_dm_connector *aconnector)
 		goto out;
 	}
 
-	drm_modeset_lock_all(dev);
-	dm_restore_drm_connector_state(dev, connector);
-	drm_modeset_unlock_all(dev);
+	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
+	dm_restore_drm_connector_state(dev, connector, &ctx);
+	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
 
 	if (aconnector->base.force == DRM_FORCE_UNSPECIFIED)
 		drm_kms_helper_hotplug_event(dev);
@@ -3044,6 +3047,7 @@ static void handle_hpd_rx_irq(void *param)
 	struct drm_connector *connector = &aconnector->base;
 	struct drm_device *dev = connector->dev;
 	struct dc_link *dc_link = aconnector->dc_link;
+	struct drm_modeset_acquire_ctx ctx;
 	bool is_mst_root_connector = aconnector->mst_mgr.mst_state;
 	bool result = false;
 	enum dc_connection_type new_connection_type = dc_connection_none;
@@ -3053,6 +3057,7 @@ static void handle_hpd_rx_irq(void *param)
 	bool has_left_work = false;
 	int idx = aconnector->base.index;
 	struct hpd_rx_irq_offload_work_queue *offload_wq = &adev->dm.hpd_rx_offload_wq[idx];
+	int ret;
 
 	memset(&hpd_irq_data, 0, sizeof(hpd_irq_data));
 
@@ -3127,9 +3132,9 @@ static void handle_hpd_rx_irq(void *param)
 			goto finish;
 		}
 
-		drm_modeset_lock_all(dev);
-		dm_restore_drm_connector_state(dev, connector);
-		drm_modeset_unlock_all(dev);
+		DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
+		dm_restore_drm_connector_state(dev, connector, &ctx);
+		DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
 
 		drm_kms_helper_hotplug_event(dev);
 	}
@@ -9662,7 +9667,8 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
 }
 
 
-static int dm_force_atomic_commit(struct drm_connector *connector)
+static int dm_force_atomic_commit(struct drm_connector *connector,
+				  struct drm_modeset_acquire_ctx *ctx)
 {
 	int ret = 0;
 	struct drm_device *ddev = connector->dev;
@@ -9676,7 +9682,7 @@ static int dm_force_atomic_commit(struct drm_connector *connector)
 	if (!state)
 		return -ENOMEM;
 
-	state->acquire_ctx = ddev->mode_config.acquire_ctx;
+	state->acquire_ctx = ctx;
 
 	/* Construct an atomic state to restore previous display setting */
 
@@ -9723,7 +9729,8 @@ static int dm_force_atomic_commit(struct drm_connector *connector)
  * same port and when running without usermode desktop manager supprot
  */
 void dm_restore_drm_connector_state(struct drm_device *dev,
-				    struct drm_connector *connector)
+				    struct drm_connector *connector,
+				    struct drm_modeset_acquire_ctx *ctx)
 {
 	struct amdgpu_dm_connector *aconnector = to_amdgpu_dm_connector(connector);
 	struct amdgpu_crtc *disconnected_acrtc;
@@ -9746,7 +9753,7 @@ void dm_restore_drm_connector_state(struct drm_device *dev,
 	 * to turn on the display, so we do it here
 	 */
 	if (acrtc_state->stream->sink != aconnector->dc_sink)
-		dm_force_atomic_commit(&aconnector->base);
+		dm_force_atomic_commit(&aconnector->base, ctx);
 }
 
 /*
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index a85b09986aab..96fc74975dde 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -699,7 +699,8 @@ enum drm_mode_status amdgpu_dm_connector_mode_valid(struct drm_connector *connec
 				   struct drm_display_mode *mode);
 
 void dm_restore_drm_connector_state(struct drm_device *dev,
-				    struct drm_connector *connector);
+				    struct drm_connector *connector,
+				    struct drm_modeset_acquire_ctx *ctx);
 
 void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 					struct edid *edid);
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
index 4efb1f355fe7..5681476f8a57 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
@@ -24,6 +24,7 @@
  */
 
 #include <linux/uaccess.h>
+#include <drm/drm_drv.h>
 
 #include "dc.h"
 #include "amdgpu.h"
@@ -1192,12 +1193,14 @@ static ssize_t trigger_hotplug(struct file *f, const char __user *buf,
 	struct drm_connector *connector = &aconnector->base;
 	struct dc_link *link = NULL;
 	struct drm_device *dev = connector->dev;
+	struct drm_modeset_acquire_ctx ctx;
 	enum dc_connection_type new_connection_type = dc_connection_none;
 	char *wr_buf = NULL;
 	uint32_t wr_buf_size = 42;
 	int max_param_num = 1;
 	long param[1] = {0};
 	uint8_t param_nums = 0;
+	int ret;
 
 	if (!aconnector || !aconnector->dc_link)
 		return -EINVAL;
@@ -1258,9 +1261,13 @@ static ssize_t trigger_hotplug(struct file *f, const char __user *buf,
 		goto unlock;
 	}
 
-	drm_modeset_lock_all(dev);
-	dm_restore_drm_connector_state(dev, connector);
-	drm_modeset_unlock_all(dev);
+	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
+	dm_restore_drm_connector_state(dev, connector, &ctx);
+	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
+
+	if (ret)
+		return ret;
+
 	drm_kms_helper_hotplug_event(dev);
 
 unlock:
-- 
2.33.0

