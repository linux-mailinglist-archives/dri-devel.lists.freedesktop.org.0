Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3713FB364
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 11:49:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17DBB89AB9;
	Mon, 30 Aug 2021 09:49:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA5B289AB9
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 09:49:18 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 0F278580EE3;
 Mon, 30 Aug 2021 05:49:16 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 30 Aug 2021 05:49:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=jz0COXtUybZmOc4SqZPZDeC7z/
 JJFiq4JYG1YocPLRg=; b=I8UUE+mB0WsZE950fBZMmG2eEuRMeY1OyXAdhUXNYF
 tLg4MSO7j0rzK+TuF9fsuAM6kjyNIlaV/D2espQN8Z2YD7cbamMjNlu/urdbeVcP
 13ZXw19B6MVjsvUffAfHBfZFm7F9SuCzHpqSma5uU3KoxQ9RMefPmrXqvzB6+Oqz
 Y8ziOm4yr91s+nYiMgRgaPZ581QQ0sOk3uXms1HpYsv4G2GCcygGqq/voNNZu9LZ
 7Hshdh+nNidl2BDGEgBFDQvjH46fN/t6jBuFQDrATObP2Dm8wqhO0suBC+Xdezxp
 2hZ+SRFMqmsLBebJio1dyP9K7dymiSkzU3LAHR7cEm2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=jz0COXtUybZmOc4Sq
 ZPZDeC7z/JJFiq4JYG1YocPLRg=; b=A8l2P3PBCq6JW6iyyz0qjsA8k3YgMccVL
 O7s0EMEfcAZj5v/mkzQQUhnLfvSt6p9ep+u4Xml3JJs54AvxnMIedf2YZu0tSGR6
 DDwA7/QE9RCUFQJBdjNRHvR5eMzmtyL8atcWlxJ4N6JKwOOlY9IHShiPYk+TeMdq
 ILqFIEgqkzq2lptIqxB1Zx5texIyi3hzWmo0kNPxO8GhXPx2TfUXfRUaqHOMJvOU
 227ufBp9iL2JwfPSnR5QVjNMAQrC3kvfoDpn+WhmeocnvCVhmA4QE1tongxS/yyV
 fiqLX02QA2b2PtTPivRt+zLbjprUIF49iGGxRvPmeQGcw8cx5jNpg==
X-ME-Sender: <xms:mKksYcBhbqIliPBpiXrY7pb7Z_wfH95QDdLMe41-K2xBNzRd197vCg>
 <xme:mKksYeg6yDnzERCIkPAIMJQhMo07g2QtgGwkhQ7A18XLon1vG4OiHPvtFejgriwoQ
 nmnu5x5zs-4qGqkuRQ>
X-ME-Received: <xmr:mKksYfncbfRcWi10DYAglhBrHXbNBPeswnVyjd2ecLs165VxG6SXqb8r0ETIoRvcsELwic50aIWVCK2cxXXa_6kB-OSCZyb9Pw7p>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudduledgvdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepjeffheduvddvvdelhfegleelfffgieejvdehgfeijedtieeuteejteefueekjeeg
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgi
 himhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:mKksYSw4vq9lMJaY5c8jG7BwMCSAn6AsIO-sI5QRIRR0QnGTzdQZHQ>
 <xmx:mKksYRQ3SeecVt0LaATX_qhPyKjTClPSp2oPGXkB3JdtDLGzdFqnBw>
 <xmx:mKksYdYH_-Bd8xmHAO9ZBqXvsEHSj9rnavLDpR3Tg41vdJYf8iFeFg>
 <xmx:nKksYdod8BJyamt3SgWGOA0_AHkujU5ZqQmYMWNQJ_ZqIf7wowJVuA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 30 Aug 2021 05:49:12 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Cc: Sam Ravnborg <sam@ravnborg.org>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>, Emma Anholt <emma@anholt.net>,
 linux-rpi-kernel@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] drm/probe-helper: Create a HPD IRQ event helper for a
 single connector
Date: Mon, 30 Aug 2021 11:49:09 +0200
Message-Id: <20210830094910.150713-1-maxime@cerno.tech>
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

Changes from v1:
  - Rename the shared function
  - Move the hotplug event notification out of the shared function
  - Added missing locks
  - Improve the documentation
  - Switched to drm_dbg_kms
---
 drivers/gpu/drm/drm_probe_helper.c | 120 ++++++++++++++++++++---------
 include/drm/drm_probe_helper.h     |   1 +
 2 files changed, 86 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index 5606bca3caa8..fcf32ec0b0c8 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -795,6 +795,86 @@ void drm_kms_helper_poll_fini(struct drm_device *dev)
 }
 EXPORT_SYMBOL(drm_kms_helper_poll_fini);
 
+static bool check_connector_changed(struct drm_connector *connector)
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
+	drm_dbg_kms(dev, "[CONNECTOR:%d:%s] Old epoch counter %llu\n",
+		    connector->base.id,
+		    connector->name,
+		    old_epoch_counter);
+
+	connector->status = drm_helper_probe_detect(connector, NULL, false);
+	drm_dbg_kms(dev, "[CONNECTOR:%d:%s] status updated from %s to %s\n",
+		    connector->base.id,
+		    connector->name,
+		    drm_get_connector_status_name(old_status),
+		    drm_get_connector_status_name(connector->status));
+
+	drm_dbg_kms(dev, "[CONNECTOR:%d:%s] New epoch counter %llu\n",
+		    connector->base.id,
+		    connector->name,
+		    connector->epoch_counter);
+
+	/*
+	 * Check if epoch counter had changed, meaning that we need
+	 * to send a uevent.
+	 */
+	if (old_epoch_counter != connector->epoch_counter)
+		changed = true;
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
+ * interrupts for a single connector. Drivers that want to send a
+ * hotplug event for all connectors or can't track hotplug interrupts
+ * per connector need to use drm_helper_hpd_irq_event().
+ *
+ * This function must be called from process context with no mode
+ * setting locks held.
+ *
+ * Note that a connector can be both polled and probed from the hotplug
+ * handler, in case the hotplug interrupt is known to be unreliable.
+ */
+bool drm_connector_helper_hpd_irq_event(struct drm_connector *connector)
+{
+	struct drm_device *dev = connector->dev;
+	bool changed;
+
+	mutex_lock(&dev->mode_config.mutex);
+	changed = check_connector_changed(connector);
+	mutex_unlock(&dev->mode_config.mutex);
+
+	if (changed) {
+		drm_kms_helper_hotplug_event(dev);
+		drm_dbg_kms(dev, "[CONNECTOR:%d:%s] Sent hotplug event\n",
+			    connector->base.id,
+			    connector->name);
+	}
+
+	return changed;
+}
+EXPORT_SYMBOL(drm_connector_helper_hpd_irq_event);
+
 /**
  * drm_helper_hpd_irq_event - hotplug processing
  * @dev: drm_device
@@ -808,9 +888,10 @@ EXPORT_SYMBOL(drm_kms_helper_poll_fini);
  * interrupts for each connector.
  *
  * Drivers which support hotplug interrupts for each connector individually and
- * which have a more fine-grained detect logic should bypass this code and
- * directly call drm_kms_helper_hotplug_event() in case the connector state
- * changed.
+ * which have a more fine-grained detect logic can use
+ * drm_connector_helper_hpd_irq_event(). Alternatively, they should bypass this
+ * code and directly call drm_kms_helper_hotplug_event() in case the connector
+ * state changed.
  *
  * This function must be called from process context with no mode
  * setting locks held.
@@ -822,9 +903,7 @@ bool drm_helper_hpd_irq_event(struct drm_device *dev)
 {
 	struct drm_connector *connector;
 	struct drm_connector_list_iter conn_iter;
-	enum drm_connector_status old_status;
 	bool changed = false;
-	u64 old_epoch_counter;
 
 	if (!dev->mode_config.poll_enabled)
 		return false;
@@ -832,37 +911,8 @@ bool drm_helper_hpd_irq_event(struct drm_device *dev)
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
+		if (check_connector_changed(connector))
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

