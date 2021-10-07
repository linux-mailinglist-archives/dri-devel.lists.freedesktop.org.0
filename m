Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34417425C3B
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 21:39:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 569446F4EA;
	Thu,  7 Oct 2021 19:39:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B7BF6F4EC;
 Thu,  7 Oct 2021 19:39:15 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id A7BB22B00A16;
 Thu,  7 Oct 2021 15:39:14 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 07 Oct 2021 15:39:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=shVkTm124VB9F
 355YCG5s6oXEMEVV213FKazFR0E27k=; b=rn8/2MOjoJaObtSKwvKvWXooqX1Z2
 ebYA/LRvCz1LtYaQrQG0tuEh9/bUoetkRA6nHESqfGgGEZvdONkz/2hFNlzvPad9
 U0RJPQj6T75Mtfn/dd/rOCrrnsQ0+W46PD7/0fQNHQ577po6JyryeDAIeYUk4ANW
 FQipm36Da5F1T0vb/dlhVaZPLn/eJXyqQoUJckARh8PXpEX3plSyJKDJ4FjR8tqS
 BOz7twfOMb5cbqjEZDEe+gDJwbQzTq/uHuOKX/dPmem1WrViuPqISJa4RJF/ohig
 bOjcv6ptuhgeJ6wgq4/7Lo28kULf9klFkdAe/TiTsrhMPV2PRna/pR+/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=shVkTm124VB9F355YCG5s6oXEMEVV213FKazFR0E27k=; b=P1WaKDSb
 3FFIKAFboQ4lidCIJsReAj2rNloe4vHzQ3pJSkhnNmPN7+BLfU6M3wdB8/miDcn+
 r8jTiSJ5w3CvEySSvkQLhur5SXBI+OlnMT4pKHUg/51yjt3F4bUqrh7DjDYL5LyC
 jV+tzaCRxQvpURw7uNMFmXPBAJBEmrXbOgFyffbfWQ8NVHXnGqF59Y/6NphRxrAl
 DaLl1KlPJpQfcSpkggYrhw33dGP8g+mRYD6d4EXDwhdTJE9qk0v/JeDluGTmvZI1
 /ZWMWS49qSdIRWuIaQskpGothf+E9qSWRqzdQ7kyh19Kw2qoPjNWwZVmEcyRBUVA
 EiLkjuP+s/wuuQ==
X-ME-Sender: <xms:4kxfYV4XXATQTXjncahACZ9OnT8aiqUVnu5t5qDK3aMW8TDOY-0AhQ>
 <xme:4kxfYS6D0u4XzsYUrFjHeqExH9F0TAF9g5XqEgIGaJAsjFjIGDvfG-XrVZzsgY-Yx
 1ySwqR0AXTVfIzOCA>
X-ME-Received: <xmr:4kxfYceGRZtearcn5YSgFiELAy5jqLW8orTc6aFYtapQUFzvSjCfK0CL31O0Sw8IfKE_>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudelkedgudefjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefhvghrnhgrnhguohcutfgrmhhoshcuoehgrhgvvghnfhho
 ohesuhelvddrvghuqeenucggtffrrghtthgvrhhnpeekleekjedtheejheekfefggeevvd
 fgueegffeuveduhfehueegkeeijedvvdejfeenucevlhhushhtvghrufhiiigvpedunecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvvghnfhhoohesuhelvddrvghu
X-ME-Proxy: <xmx:4kxfYeKYCKpvUlRlABdShAFTfsBl-MO89Pe7dHYyIts8enE8G-zXtw>
 <xmx:4kxfYZLon0dsPnDq4XtaCDA7T4xBpFEZ_iF_9vfNzG4TApU3NhgpjA>
 <xmx:4kxfYXzOh63UhLRFGaqZaIrcMCdALPu2aD5N-IX__5wiVr5fK9cvYg>
 <xmx:4kxfYSW23WCb_-Livhw88WSVsWqwMpYQiq5xl-q5iPWIkaPiotmpuHlpLgY>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 7 Oct 2021 15:39:11 -0400 (EDT)
From: Fernando Ramos <greenfoo@u92.eu>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, sean@poorly.run, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH v3 17/20] drm/amd: cleanup: drm_modeset_lock_all() -->
 DRM_MODESET_LOCK_ALL_BEGIN() [part 2]
Date: Thu,  7 Oct 2021 21:37:52 +0200
Message-Id: <20211007193755.29579-18-greenfoo@u92.eu>
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

Refactor places using drm_modeset_{lock,unlock}_all() so that they only
appear once per function.

This is needed so that in the next commit I can replace those functions
by the new macros (which use labels that can only appear once per
function).

Signed-off-by: Fernando Ramos <greenfoo@u92.eu>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 44 ++++++++-----------
 .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 18 +++-----
 2 files changed, 26 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index e676d0a56d50..444ad054980a 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -2909,14 +2909,6 @@ static void handle_hpd_irq_helper(struct amdgpu_dm_connector *aconnector)
 	if (aconnector->base.force && new_connection_type == dc_connection_none) {
 		emulated_link_detect(aconnector->dc_link);
 
-
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
@@ -2925,13 +2917,18 @@ static void handle_hpd_irq_helper(struct amdgpu_dm_connector *aconnector)
 
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
@@ -3119,12 +3116,6 @@ static void handle_hpd_rx_irq(void *param)
 
 			amdgpu_dm_update_connector_after_detect(aconnector);
 
-
-			drm_modeset_lock_all(dev);
-			dm_restore_drm_connector_state(dev, connector);
-			drm_modeset_unlock_all(dev);
-
-			drm_kms_helper_hotplug_event(dev);
 		} else if (dc_link_detect(dc_link, DETECT_REASON_HPDRX)) {
 
 			if (aconnector->fake_enable)
@@ -3132,14 +3123,17 @@ static void handle_hpd_rx_irq(void *param)
 
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
index f3ada9b6be5a..4efb1f355fe7 100644
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

