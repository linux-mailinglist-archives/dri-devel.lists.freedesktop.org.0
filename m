Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E473242CBE5
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 22:50:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4EBC6EB5B;
	Wed, 13 Oct 2021 20:49:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BE026EB45;
 Wed, 13 Oct 2021 20:49:44 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 9EC94581178;
 Wed, 13 Oct 2021 16:49:43 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 13 Oct 2021 16:49:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=ecsQu7tdKkgkn
 KncDSxCGakyZcMIr6lVyFBxuQ1iKRU=; b=GnhF9DahHnTnPd4Tq+xVAhQPnlE0N
 bWHwLdwx2rJvORYJ9xSsDDptaR35qrzTgs+U7HkLbeCSO0uPWiuqxFZ/QV27+WTM
 vHuNy1O0UP4RoSdFXTbIM9MVnoGpYPUvZof/o/xm2Ctnd5Q546ItIOkjjwEUClcz
 QRNg95uER3+0cRbNVTwrLjoxz+PaZW6Hba2VuflbS5EPZCliWMSXUAwnT549U5Iy
 wFNkLbg/4SC9jfhwkQGPxG+/F6LgGhaiJ82qVHREOWdHCB1F9j8g9aA6CP6S/aca
 oC49xbl20GiksOET5HBYvZrGfXOGI1O9EiyNR/44dt1HdRAHl+bOv549w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=ecsQu7tdKkgknKncDSxCGakyZcMIr6lVyFBxuQ1iKRU=; b=EcdqXkkc
 puD4F+sN9+xN0bqSXEM0zLlL/V5tEbz6Qid4g9y8aAFTOEeOpO2DDwDcjbzr2Sv6
 /PlU2rwpgxu91KyoGsHJd2xUOWY2nEMwhBJgQ9mnSirvpS0/L+iRmh3o+131Oc51
 U4Nl9yvOKd7rqcqBf2R7m7QPBDmyuZJkEJVarxK0lJPkBq0I2m13YoL5jHEaoyBU
 3p5EbF30OebM8EirWJ9oENXwxJh54h1MhKJ5NAKPSf5zBxbjZawYH0Y6yHfviRa6
 D/6E0899/0vCOF1weF5QhOPR1fX3dWGhy6XLrOzDTMI0PCV+DHxYUUon9o4SrjUt
 zywlkIeoDQqYsw==
X-ME-Sender: <xms:Z0ZnYWjyVlMi3h6w0YXDR36VFBdEb1jUuC6jvB4Q-ktXAtGf4shwYw>
 <xme:Z0ZnYXDCpInBvX26x3VYsU4Ai-yzmK9SXQatPyJaPAYHADBa_y8MXunitJbqzB7jH
 ua1nkbsOnvEv0Tosg>
X-ME-Received: <xmr:Z0ZnYeHBd_iW-DGeyhBNxILqA5zo9i3sYawA8E1NUPoDfoeQiyMzcKF7JgQAubdj0Lkl>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddutddgudehvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefhvghrnhgrnhguohcutfgrmhhoshcuoehgrhgvvghnfhho
 ohesuhelvddrvghuqeenucggtffrrghtthgvrhhnpeekleekjedtheejheekfefggeevvd
 fgueegffeuveduhfehueegkeeijedvvdejfeenucevlhhushhtvghrufhiiigvpedunecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvvghnfhhoohesuhelvddrvghu
X-ME-Proxy: <xmx:Z0ZnYfQefYGtJKKrO1iRTyBdwAxjvpn-5cMexUfKX2M9fJev01lJoA>
 <xmx:Z0ZnYTwqSen2grR4Rqr0lX-H3iPrYRbCm8GuqDm9JZYqTJ5FzTY0CA>
 <xmx:Z0ZnYd5_T4hBjDSuIHpYBHAVOc6OF_21xypgX-ZKauInrjiTITmuTA>
 <xmx:Z0ZnYbfkp34zM6mD4nGEO68hnq1MzJqm846wPh2_78edos1lupmsnw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 Oct 2021 16:49:40 -0400 (EDT)
From: Fernando Ramos <greenfoo@u92.eu>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, sean@poorly.run, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH v4 17/20] drm/amd: cleanup: drm_modeset_lock_all() -->
 DRM_MODESET_LOCK_ALL_BEGIN() [part 2]
Date: Wed, 13 Oct 2021 22:48:43 +0200
Message-Id: <20211013204846.90026-18-greenfoo@u92.eu>
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

Refactor places using drm_modeset_{lock,unlock}_all() so that they only
appear once per function.

This is needed so that in the next commit I can replace those functions
by the new macros (which use labels that can only appear once per
function).

Signed-off-by: Fernando Ramos <greenfoo@u92.eu>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 43 ++++++++-----------
 .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 18 +++-----
 2 files changed, 26 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index f35561b5a465..10ed1f8ad514 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -2935,13 +2935,6 @@ static void handle_hpd_irq_helper(struct amdgpu_dm_connector *aconnector)
 	if (aconnector->base.force && new_connection_type == dc_connection_none) {
 		emulated_link_detect(aconnector->dc_link);
 
-		drm_modeset_lock_all(dev);
-		dm_restore_drm_connector_state(dev, connector);
-		drm_modeset_unlock_all(dev);
-
-		if (aconnector->base.force == DRM_FORCE_UNSPECIFIED)
-			drm_kms_helper_hotplug_event(dev);
-
 	} else if (dc_link_detect(aconnector->dc_link, DETECT_REASON_HPD)) {
 		if (new_connection_type == dc_connection_none &&
 		    aconnector->dc_link->type == dc_connection_none &&
@@ -2950,13 +2943,18 @@ static void handle_hpd_irq_helper(struct amdgpu_dm_connector *aconnector)
 
 		amdgpu_dm_update_connector_after_detect(aconnector);
 
-		drm_modeset_lock_all(dev);
-		dm_restore_drm_connector_state(dev, connector);
-		drm_modeset_unlock_all(dev);
-
-		if (aconnector->base.force == DRM_FORCE_UNSPECIFIED)
-			drm_kms_helper_hotplug_event(dev);
+	} else {
+		goto out;
 	}
+
+	drm_modeset_lock_all(dev);
+	dm_restore_drm_connector_state(dev, connector);
+	drm_modeset_unlock_all(dev);
+
+	if (aconnector->base.force == DRM_FORCE_UNSPECIFIED)
+		drm_kms_helper_hotplug_event(dev);
+
+out:
 	mutex_unlock(&aconnector->hpd_lock);
 
 }
@@ -3144,12 +3142,6 @@ static void handle_hpd_rx_irq(void *param)
 
 			amdgpu_dm_update_connector_after_detect(aconnector);
 
-
-			drm_modeset_lock_all(dev);
-			dm_restore_drm_connector_state(dev, connector);
-			drm_modeset_unlock_all(dev);
-
-			drm_kms_helper_hotplug_event(dev);
 		} else if (dc_link_detect(dc_link, DETECT_REASON_HPDRX)) {
 
 			if (aconnector->fake_enable)
@@ -3157,14 +3149,17 @@ static void handle_hpd_rx_irq(void *param)
 
 			amdgpu_dm_update_connector_after_detect(aconnector);
 
+		} else {
+			goto finish;
+		}
 
-			drm_modeset_lock_all(dev);
-			dm_restore_drm_connector_state(dev, connector);
-			drm_modeset_unlock_all(dev);
+		drm_modeset_lock_all(dev);
+		dm_restore_drm_connector_state(dev, connector);
+		drm_modeset_unlock_all(dev);
 
-			drm_kms_helper_hotplug_event(dev);
-		}
+		drm_kms_helper_hotplug_event(dev);
 	}
+finish:
 #ifdef CONFIG_DRM_AMD_DC_HDCP
 	if (hpd_irq_data.bytes.device_service_irq.bits.CP_IRQ) {
 		if (adev->dm.hdcp_workqueue)
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
index 814f67d86a3c..7751038d5788 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
@@ -1237,12 +1237,6 @@ static ssize_t trigger_hotplug(struct file *f, const char __user *buf,
 			goto unlock;
 
 		amdgpu_dm_update_connector_after_detect(aconnector);
-
-		drm_modeset_lock_all(dev);
-		dm_restore_drm_connector_state(dev, connector);
-		drm_modeset_unlock_all(dev);
-
-		drm_kms_helper_hotplug_event(dev);
 	} else if (param[0] == 0) {
 		if (!aconnector->dc_link)
 			goto unlock;
@@ -1260,13 +1254,15 @@ static ssize_t trigger_hotplug(struct file *f, const char __user *buf,
 
 		amdgpu_dm_update_connector_after_detect(aconnector);
 
-		drm_modeset_lock_all(dev);
-		dm_restore_drm_connector_state(dev, connector);
-		drm_modeset_unlock_all(dev);
-
-		drm_kms_helper_hotplug_event(dev);
+	} else {
+		goto unlock;
 	}
 
+	drm_modeset_lock_all(dev);
+	dm_restore_drm_connector_state(dev, connector);
+	drm_modeset_unlock_all(dev);
+	drm_kms_helper_hotplug_event(dev);
+
 unlock:
 	mutex_unlock(&aconnector->hpd_lock);
 
-- 
2.33.0

