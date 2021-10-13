Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1E142CBEB
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 22:50:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 364E76EB5D;
	Wed, 13 Oct 2021 20:49:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E0DA6EB57;
 Wed, 13 Oct 2021 20:49:47 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 9AA1B581179;
 Wed, 13 Oct 2021 16:49:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Wed, 13 Oct 2021 16:49:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=Syhj3W/cQiaj2
 hWt6LLSuR5PoC77D+Grc5i/IeSAmg8=; b=TZUL9sxAm4qN01TGtC4UsXyGTLhVz
 t9t50ouTs3y4iY/fYliUgaF3huVh4tQwORSqva7DCyTYJtVJUmetmxKqtRnA0rNU
 BP7Rlkmig6xim17wdsVfrs2q1C/HIf6TEo89DeJDkyo96CGtPoeeeXBPwCQb2gBp
 EZWBSvIpuzOayS57mhA+dNqunFcsEw/YzFMeOF2c8Sp+Ih5Mp29mTqvgJ1qRXPE0
 FQjfdGPudizn6bUplIO0smtuQdHG1ZIW5Ni7UAMgRnModmpWWisb4PXlU5DCaDlH
 gsNeTFuUtmasV4mx23Df8Qpf1TywmJGLMsvn8WdIKAZTPmOzTzkdK+XAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=Syhj3W/cQiaj2hWt6LLSuR5PoC77D+Grc5i/IeSAmg8=; b=V0vkfuAC
 8qHw/oEl89+tbjQnesuk1MnOKey4mCI8y8BVGP+VUuT1SWgrZ8Ekiq9uZdbn4jGA
 BHvS5ctecdOPlcxM1zshgMyq/tbsAfi5fXp6mDxK5bJP+kSLZy8I0Kfg5DTl9sIw
 9UB55eOgK+vC/cuSLuBD4zCxXzIkDdX6qPkwE/wk0q6oeR3WzNYRFdTI11m7fNPk
 2BJgqBFEtQ2zF83u1rVJmy3FD9Cly9c1owCQ57xWN9aqp4bO3yH8fvUenTOCVfVw
 NanI4ovSxa2WzYCi64xdVlLBT72g5AlleWcP7BofKBCnUKPiE0S6hNDzpWSWeq+P
 rn2ALb4lixrwcg==
X-ME-Sender: <xms:akZnYQ5GTWUEkXEJGfef3Z1FLTlJfN7k0_CHFo9I3LrBS6UI7HHnBA>
 <xme:akZnYR6EtY_I9iWP6nW9TB54bhOBjG0cSzftqJnttlmnI3SfJn6rh2YAkdYWsAOey
 4f9EjIgTBR6ccNkMw>
X-ME-Received: <xmr:akZnYfeMBAydXEPwxjJuYL7druN21er16ImUBo3IghrW5qgrI6vqi00VMObh2ay2eeux>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddutddgudehudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefhvghrnhgrnhguohcutfgrmhhoshcuoehgrhgvvghnfhho
 ohesuhelvddrvghuqeenucggtffrrghtthgvrhhnpeekleekjedtheejheekfefggeevvd
 fgueegffeuveduhfehueegkeeijedvvdejfeenucevlhhushhtvghrufhiiigvpedvnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvvghnfhhoohesuhelvddrvghu
X-ME-Proxy: <xmx:akZnYVJbLZ9cBCppg6tKimmGHQnm_BJIYWpwwS0PrhDfx-OYDiu1UQ>
 <xmx:akZnYUJSNw5Mpwb2vtSvTufVFucoWGZMVX62gycwomzZbsCV7YRlXA>
 <xmx:akZnYWzuM1PmPK8l262WRpPBilUnO7gurzIXb4VxTM-Jo7Z2lAm78w>
 <xmx:akZnYZX0dwNiUOy25al0rIdYyFWSfkrkYSIJXzKj159tleyAYepTxw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 Oct 2021 16:49:43 -0400 (EDT)
From: Fernando Ramos <greenfoo@u92.eu>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, sean@poorly.run, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH v4 18/20] drm/amd: cleanup: drm_modeset_lock_all() -->
 DRM_MODESET_LOCK_ALL_BEGIN() [part 3]
Date: Wed, 13 Oct 2021 22:48:44 +0200
Message-Id: <20211013204846.90026-19-greenfoo@u92.eu>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211013204846.90026-1-greenfoo@u92.eu>
References: <20211013204846.90026-1-greenfoo@u92.eu>
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
index 10ed1f8ad514..7a3c5def9fb9 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -81,6 +81,7 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_vblank.h>
 #include <drm/drm_audio_component.h>
+#include <drm/drm_drv.h>
 
 #if defined(CONFIG_DRM_AMD_DC_DCN)
 #include "ivsrcid/dcn/irqsrcs_dcn_1_0.h"
@@ -2906,6 +2907,8 @@ static void handle_hpd_irq_helper(struct amdgpu_dm_connector *aconnector)
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct dm_connector_state *dm_con_state = to_dm_connector_state(connector->state);
 	struct dm_crtc_state *dm_crtc_state = NULL;
+	struct drm_modeset_acquire_ctx ctx;
+	int ret;
 
 	if (adev->dm.disable_hpd_irq)
 		return;
@@ -2947,9 +2950,9 @@ static void handle_hpd_irq_helper(struct amdgpu_dm_connector *aconnector)
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
@@ -3070,6 +3073,7 @@ static void handle_hpd_rx_irq(void *param)
 	struct drm_connector *connector = &aconnector->base;
 	struct drm_device *dev = connector->dev;
 	struct dc_link *dc_link = aconnector->dc_link;
+	struct drm_modeset_acquire_ctx ctx;
 	bool is_mst_root_connector = aconnector->mst_mgr.mst_state;
 	bool result = false;
 	enum dc_connection_type new_connection_type = dc_connection_none;
@@ -3079,6 +3083,7 @@ static void handle_hpd_rx_irq(void *param)
 	bool has_left_work = false;
 	int idx = aconnector->base.index;
 	struct hpd_rx_irq_offload_work_queue *offload_wq = &adev->dm.hpd_rx_offload_wq[idx];
+	int ret;
 
 	memset(&hpd_irq_data, 0, sizeof(hpd_irq_data));
 
@@ -3153,9 +3158,9 @@ static void handle_hpd_rx_irq(void *param)
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
@@ -9703,7 +9708,8 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
 }
 
 
-static int dm_force_atomic_commit(struct drm_connector *connector)
+static int dm_force_atomic_commit(struct drm_connector *connector,
+				  struct drm_modeset_acquire_ctx *ctx)
 {
 	int ret = 0;
 	struct drm_device *ddev = connector->dev;
@@ -9717,7 +9723,7 @@ static int dm_force_atomic_commit(struct drm_connector *connector)
 	if (!state)
 		return -ENOMEM;
 
-	state->acquire_ctx = ddev->mode_config.acquire_ctx;
+	state->acquire_ctx = ctx;
 
 	/* Construct an atomic state to restore previous display setting */
 
@@ -9764,7 +9770,8 @@ static int dm_force_atomic_commit(struct drm_connector *connector)
  * same port and when running without usermode desktop manager supprot
  */
 void dm_restore_drm_connector_state(struct drm_device *dev,
-				    struct drm_connector *connector)
+				    struct drm_connector *connector,
+				    struct drm_modeset_acquire_ctx *ctx)
 {
 	struct amdgpu_dm_connector *aconnector = to_amdgpu_dm_connector(connector);
 	struct amdgpu_crtc *disconnected_acrtc;
@@ -9787,7 +9794,7 @@ void dm_restore_drm_connector_state(struct drm_device *dev,
 	 * to turn on the display, so we do it here
 	 */
 	if (acrtc_state->stream->sink != aconnector->dc_sink)
-		dm_force_atomic_commit(&aconnector->base);
+		dm_force_atomic_commit(&aconnector->base, ctx);
 }
 
 /*
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index 37e61a88d49e..1a7c8fbf149a 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -706,7 +706,8 @@ enum drm_mode_status amdgpu_dm_connector_mode_valid(struct drm_connector *connec
 				   struct drm_display_mode *mode);
 
 void dm_restore_drm_connector_state(struct drm_device *dev,
-				    struct drm_connector *connector);
+				    struct drm_connector *connector,
+				    struct drm_modeset_acquire_ctx *ctx);
 
 void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 					struct edid *edid);
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
index 7751038d5788..f4542760b006 100644
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

