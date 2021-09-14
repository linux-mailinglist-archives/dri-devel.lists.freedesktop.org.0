Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A65C40AB84
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 12:17:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DF076E45C;
	Tue, 14 Sep 2021 10:17:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4F536E45C
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 10:17:32 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id A3C7C2B01319;
 Tue, 14 Sep 2021 06:17:31 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 14 Sep 2021 06:17:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=aqgRvMs0BxhIF
 S88UH5yd61ULEKhKt9XbEdULeJxcJg=; b=YADb+8fTj1z85HMouYKA7mmrniSTW
 nBo+IPpdFIX/M/qzCBCmT9a7tZWGEb8z7UoYTaLxc+l/t60NrDVSLAu54VtrRiXq
 hS41r6T9pa32KT1bkOwdO0+WYMXH3Lz86vkRqQBlZ5ZzPpQRx8Z8LZq9cIXTfEv7
 BVNgtNP9Fe6DECn5Ftqg0Zs9aSEcwzChceUeh6EI5Egp1cAjPtxNnfGJOEJ060rJ
 4udwuSLSNubiv4oHWQwTqxZbwxnPkA06mVDvA9pc2d+mCN4RbYLq8iXDwhMtEtfU
 DHvl5L2Y+8O9apwG6byhramJk50wHWYA9Keyzs1+IcrSyoRlwdj0P8wvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=aqgRvMs0BxhIFS88UH5yd61ULEKhKt9XbEdULeJxcJg=; b=cD8yAPs0
 dj5SYx8IwcRQyktfq+jfWV/vFP5tCjIGo9LCplioXYUnVo0dikFjggF0jLNFmvCC
 W96Ct+1Y+23qAX1sGJ2uVex5u4dDgsYFll3ZrSjz1vN5SlNOtfUEZur6/vkymhCC
 O3u386XCAmEQFBMAlHq3q5KGpLIDVeyg2h/m75VdGcEubSMgc2z0bxyzq2NMmBHi
 2nV6j8h3reuOaa9Bwp/hg+gJUPhkNZx9JC6awsNLTRr0l3bWwyb0/mFHOU2cQiQx
 Ye56q2kRxKEHsdY1x3/fLYMbjbjDI7qv3shFJM/6s2tDJuE/RADTbKtu4qzipcPu
 jT4D2p9fmN7nKQ==
X-ME-Sender: <xms:u3ZAYcBSaBn2wKk2640kZ2Z_TsnLYMCXls2RX5VTjGK2xYFJ478MOQ>
 <xme:u3ZAYejXuZxRyCV90Lzj4qIrvWxqD7-jZVruoUk7tMd6LsEgI6r79R6-27vG7DmtY
 UVSuo0WBEYR084BxZw>
X-ME-Received: <xmr:u3ZAYfm1W-T1NffCRLMJRA45p8cGQYPTtukst08m0Ecu2czIV22lsOKhRFkK3jMreYxeLgdQc_vL65gRMsg92LQMwaDcJ_iJWLRB>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudegledgvdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:u3ZAYSyd-ZTm44iaMkeVeH2KuOWF7h5E7D73p3um1xv_UAHmsvdPJw>
 <xmx:u3ZAYRQ4Ufrh_nWcZX2UPi_XHRZTe7WUglJCR6H6OwXC8WRgWeWHfg>
 <xmx:u3ZAYdZ0TRhG9yKJtps5yYrtjgQ_6Dl9sJeeA2nEMdWnEsCbZE2bdQ>
 <xmx:u3ZAYdpuvfb8KT1A0fSL_ycUb9hre7VG5TaDtEYM32rzBfx-3Dx1LtQ0u_s>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Sep 2021 06:17:30 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Cc: Emma Anholt <emma@anholt.net>, linux-rpi-kernel@lists.infradead.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>, Sam Ravnborg <sam@ravnborg.org>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] drm/probe-helper: Create a HPD IRQ event helper for a
 single connector
Date: Tue, 14 Sep 2021 12:17:23 +0200
Message-Id: <20210914101724.266570-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210914101724.266570-1-maxime@cerno.tech>
References: <20210914101724.266570-1-maxime@cerno.tech>
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
Changes from v2:
  - Skip connectors with DRM_CONNECTOR_POLL_HPD in drm_helper_hpd_irq_event
  - Add drm_connector_helper_hpd_irq_event returned value documentation
  - Improve logging

Changes from v1:
  - Rename the shared function
  - Move the hotplug event notification out of the shared function
  - Added missing locks
  - Improve the documentation
  - Switched to drm_dbg_kms
---
 drivers/gpu/drm/drm_probe_helper.c | 117 +++++++++++++++++++++--------
 include/drm/drm_probe_helper.h     |   1 +
 2 files changed, 87 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index 5b77fb5c1a32..a1ffc0c30b3a 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -795,6 +795,87 @@ void drm_kms_helper_poll_fini(struct drm_device *dev)
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
+	connector->status = drm_helper_probe_detect(connector, NULL, false);
+
+	if (old_epoch_counter == connector->epoch_counter) {
+                drm_dbg_kms(dev, "[CONNECTOR:%d:%s] Same epoch counter %llu\n",
+			    connector->base.id,
+			    connector->name,
+			    connector->epoch_counter);
+
+                return false;
+	}
+
+	drm_dbg_kms(dev, "[CONNECTOR:%d:%s] status updated from %s to %s\n",
+		    connector->base.id,
+		    connector->name,
+		    drm_get_connector_status_name(old_status)
+		    drm_get_connector_status_name(connector->status));
+
+	drm_dbg_kms(dev, "[CONNECTOR:%d:%s] Changed epoch counter %llu => %llu\n",
+                    connector->base.id,
+                    connector->name,
+                    old_epoch_counter,
+                    connector->epoch_counter);
+
+	return true;
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
+ *
+ * Returns:
+ * A boolean indicating whether the connector status changed or not
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
@@ -808,9 +889,10 @@ EXPORT_SYMBOL(drm_kms_helper_poll_fini);
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
@@ -825,9 +907,7 @@ bool drm_helper_hpd_irq_event(struct drm_device *dev)
 {
 	struct drm_connector *connector;
 	struct drm_connector_list_iter conn_iter;
-	enum drm_connector_status old_status;
 	bool changed = false;
-	u64 old_epoch_counter;
 
 	if (!dev->mode_config.poll_enabled)
 		return false;
@@ -839,33 +919,8 @@ bool drm_helper_hpd_irq_event(struct drm_device *dev)
 		if (!(connector->polled & DRM_CONNECTOR_POLL_HPD))
 			continue;
 
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

