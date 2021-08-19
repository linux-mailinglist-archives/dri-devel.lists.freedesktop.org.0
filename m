Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1903F1ADD
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 15:45:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7427D6E969;
	Thu, 19 Aug 2021 13:45:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A18576E959
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 13:45:04 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id E99202B005D0;
 Thu, 19 Aug 2021 09:44:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 19 Aug 2021 09:45:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=3StIrRnb5NNmIWozrc+5wA2Uql
 F1wVymMmWtJfFjZOI=; b=RQDlU8bPpcsd2pLAexFk3l8OYwbrOcian+MnXv7yqD
 sa/M8KqeGrLWdDdwJl3KXtfCUwZx24jeTPIKW3POkyMzc21JlsZyxD2YDDLtgStR
 uV8a69DTbAMFRs/OYCLrx4K/g5JeWMOs8jegdeKEHskVfDLpJ+bt1w9INn2EKYC5
 zkGzIa6vH3ppKkWdQz5KUV7KXGPRLkWdrEn78Lb0fsmG9gtJq2igXwzEjEXHNZcY
 HCMGPo4EiO0wVkEZtVK7L1u4YEwN1c0cjsREksougGDumENZh6qZsgAGrNmr95/+
 NspctjHd1FKe8XaDplipKlOms1WiljWVA2C9aMzRXc9w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=3StIrRnb5NNmIWozr
 c+5wA2UqlF1wVymMmWtJfFjZOI=; b=mLVF6KWwd5+9H3b9+48E8qpJdlLS8hIvh
 zg8ydTGd764VwaCdn1Le1n/c1rwRcoPrca8koDV2A2fKqfDuAcofXzh6J94arTnh
 aVvUIHIz1HyQkziXOYu083+92eZ8S9G0mtRp6wN0B/Epu7Rs5J06UzSUqInEf01J
 rGYAZ/vEdlooEuNlUv6Cr38O4C8vCP9NW5lYHvQm+LqoB4AMKG7+cz7g7RkNp8+S
 yn03oW6is8TSftPkCpW3l4bBYD0M2NBu8TuyIReLPPfjd1B4TcD9Kxng6VmwN4IW
 D2HH928M+R8Ca9AIffZalNjNBuvTLHy2ovEIWisWnR1pjrU38wVxA==
X-ME-Sender: <xms:WWAeYf0R-xU90uyPgvckmc5ntJK2j21sRt4kFq9EekkOQ5ecDiJsfg>
 <xme:WWAeYeESQjEMkHBEqVmHvgEzqv6_VpRIPeKjc_cVpRzrTOs4II7kkZ2lSR7Jeq4FE
 u-rJGCIME08FDvPKw8>
X-ME-Received: <xmr:WWAeYf6H5NKJdyTF46FxxTi3vbB8NadkNTxbHtlPxjBDBQioHczZBhRFM4UzZZCHxJQhXI6CLyagxx0AavxChtKb8_A0xOz93cLk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrleejgdeiiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucft
 ihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrh
 hnpeejffehuddvvddvlefhgeelleffgfeijedvhefgieejtdeiueetjeetfeeukeejgeen
 ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigih
 hmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:WWAeYU2HhwS9loDvQ2-9I_vFD7c9Bk-XwPjuXGREJZAsRfgJz9y-oA>
 <xmx:WWAeYSGOg25QV10cMXarOC64riuy1cxwvXLtg_fbm_0sCLp3TEK-4w>
 <xmx:WWAeYV_GB2V7JRK2kdDhfqzZ0xpdEwdNVmXwlx2Zd9KwtlJc4o7rYQ>
 <xmx:W2AeYeHPAEjoFRRztgNSD_CyiWRW69u16R-5UDeZj8Bwp-E1pxlHXlsugoc>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Aug 2021 09:44:56 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Cc: linux-rpi-kernel@lists.infradead.org, Emma Anholt <emma@anholt.net>,
 bcm-kernel-feedback-list@broadcom.com,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] drm/probe-helper: Create a HPD IRQ event helper for a
 single connector
Date: Thu, 19 Aug 2021 15:44:53 +0200
Message-Id: <20210819134454.850031-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
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

The drm_helper_hpd_irq_event() function is iterating over all the
connectors when an hotplug event is detected.

During that iteration, it will call each connector detect function and
figure out if its status changed.

Finally, if any connector changed, it will notify the user-space and the
clients that something changed on the DRM device.

This is supposed to be used for drivers that don't have a hotplug
interrupt for individual connectors. However, drivers that can use an
interrupt for a single connector are left in the dust and can either
reimplement the logic used during the iteration for each connector or
use that helper and iterate over all connectors all the time.

Since both are suboptimal, let's create a helper that will only perform
the status detection on a single connector.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_probe_helper.c | 105 ++++++++++++++++++++---------
 include/drm/drm_probe_helper.h     |   1 +
 2 files changed, 74 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index 5606bca3caa8..7e3cbb4333ce 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -795,6 +795,77 @@ void drm_kms_helper_poll_fini(struct drm_device *dev)
 }
 EXPORT_SYMBOL(drm_kms_helper_poll_fini);
 
+static bool
+_drm_connector_helper_hpd_irq_event(struct drm_connector *connector,
+				    bool notify)
+{
+	struct drm_device *dev = connector->dev;
+	enum drm_connector_status old_status;
+	u64 old_epoch_counter;
+	bool changed = false;
+
+	/* Only handle HPD capable connectors. */
+	drm_WARN_ON(dev, !(connector->polled & DRM_CONNECTOR_POLL_HPD));
+
+	drm_WARN_ON(dev, !mutex_is_locked(&dev->mode_config.mutex));
+
+	old_status = connector->status;
+	old_epoch_counter = connector->epoch_counter;
+
+	DRM_DEBUG_KMS("[CONNECTOR:%d:%s] Old epoch counter %llu\n",
+		      connector->base.id,
+		      connector->name,
+		      old_epoch_counter);
+
+	connector->status = drm_helper_probe_detect(connector, NULL,
+						    false);
+	DRM_DEBUG_KMS("[CONNECTOR:%d:%s] status updated from %s to %s\n",
+		      connector->base.id,
+		      connector->name,
+		      drm_get_connector_status_name(old_status),
+		      drm_get_connector_status_name(connector->status));
+
+	DRM_DEBUG_KMS("[CONNECTOR:%d:%s] New epoch counter %llu\n",
+		      connector->base.id,
+		      connector->name,
+		      connector->epoch_counter);
+
+	/*
+	 * Check if epoch counter had changed, meaning that we need
+	 * to send a uevent.
+	 */
+	if (old_epoch_counter != connector->epoch_counter)
+		changed = true;
+
+	if (changed && notify) {
+		drm_kms_helper_hotplug_event(dev);
+		DRM_DEBUG_KMS("Sent hotplug event\n");
+	}
+
+	return changed;
+}
+
+/**
+ * drm_connector_helper_hpd_irq_event - hotplug processing
+ * @connector: drm_connector
+ *
+ * Drivers can use this helper function to run a detect cycle on a connector
+ * which has the DRM_CONNECTOR_POLL_HPD flag set in its &polled member.
+ *
+ * This helper function is useful for drivers which can track hotplug
+ * interrupts for a single connector.
+ *
+ * This function must be called with the mode setting locks held.
+ *
+ * Note that a connector can be both polled and probed from the hotplug
+ * handler, in case the hotplug interrupt is known to be unreliable.
+ */
+bool drm_connector_helper_hpd_irq_event(struct drm_connector *connector)
+{
+	return _drm_connector_helper_hpd_irq_event(connector, true);
+}
+EXPORT_SYMBOL(drm_connector_helper_hpd_irq_event);
+
 /**
  * drm_helper_hpd_irq_event - hotplug processing
  * @dev: drm_device
@@ -822,9 +893,7 @@ bool drm_helper_hpd_irq_event(struct drm_device *dev)
 {
 	struct drm_connector *connector;
 	struct drm_connector_list_iter conn_iter;
-	enum drm_connector_status old_status;
 	bool changed = false;
-	u64 old_epoch_counter;
 
 	if (!dev->mode_config.poll_enabled)
 		return false;
@@ -832,37 +901,9 @@ bool drm_helper_hpd_irq_event(struct drm_device *dev)
 	mutex_lock(&dev->mode_config.mutex);
 	drm_connector_list_iter_begin(dev, &conn_iter);
 	drm_for_each_connector_iter(connector, &conn_iter) {
-		/* Only handle HPD capable connectors. */
-		if (!(connector->polled & DRM_CONNECTOR_POLL_HPD))
-			continue;
-
-		old_status = connector->status;
-
-		old_epoch_counter = connector->epoch_counter;
-
-		DRM_DEBUG_KMS("[CONNECTOR:%d:%s] Old epoch counter %llu\n", connector->base.id,
-			      connector->name,
-			      old_epoch_counter);
-
-		connector->status = drm_helper_probe_detect(connector, NULL, false);
-		DRM_DEBUG_KMS("[CONNECTOR:%d:%s] status updated from %s to %s\n",
-			      connector->base.id,
-			      connector->name,
-			      drm_get_connector_status_name(old_status),
-			      drm_get_connector_status_name(connector->status));
-
-		DRM_DEBUG_KMS("[CONNECTOR:%d:%s] New epoch counter %llu\n",
-			      connector->base.id,
-			      connector->name,
-			      connector->epoch_counter);
-
-		/*
-		 * Check if epoch counter had changed, meaning that we need
-		 * to send a uevent.
-		 */
-		if (old_epoch_counter != connector->epoch_counter)
+		if (_drm_connector_helper_hpd_irq_event(connector,
+							false))
 			changed = true;
-
 	}
 	drm_connector_list_iter_end(&conn_iter);
 	mutex_unlock(&dev->mode_config.mutex);
diff --git a/include/drm/drm_probe_helper.h b/include/drm/drm_probe_helper.h
index 8d3ed2834d34..04c57564c397 100644
--- a/include/drm/drm_probe_helper.h
+++ b/include/drm/drm_probe_helper.h
@@ -18,6 +18,7 @@ int drm_helper_probe_detect(struct drm_connector *connector,
 void drm_kms_helper_poll_init(struct drm_device *dev);
 void drm_kms_helper_poll_fini(struct drm_device *dev);
 bool drm_helper_hpd_irq_event(struct drm_device *dev);
+bool drm_connector_helper_hpd_irq_event(struct drm_connector *connector);
 void drm_kms_helper_hotplug_event(struct drm_device *dev);
 
 void drm_kms_helper_poll_disable(struct drm_device *dev);
-- 
2.31.1

