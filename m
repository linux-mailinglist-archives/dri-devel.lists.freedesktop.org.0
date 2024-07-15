Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89727931167
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 11:39:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA24E10E1A5;
	Mon, 15 Jul 2024 09:39:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="JTX5+jib";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tq3KT+t1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JTX5+jib";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tq3KT+t1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDB1510E1A5
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 09:39:47 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A37511F7E2;
 Mon, 15 Jul 2024 09:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1721036386; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7vjwHdMmGPViBh2c9N/zcRkOZ62oEkG/Ou8gjaW1Q/Y=;
 b=JTX5+jibFGgCxjgOPIT2JDTKbg0bxI1ViY/W5EebeDEezSSdC5anwiHTKqCnSrmTwl/X5e
 97Xuxmow+YtUeCCrYPxAmVKWAcgFv4sEM7EnxjFAVs6PzjYXv5Nw85TxVzvk2ABTVn+lyn
 H/eqsPyc75uty2pKF4byQoXOS8p1KJA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1721036386;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7vjwHdMmGPViBh2c9N/zcRkOZ62oEkG/Ou8gjaW1Q/Y=;
 b=tq3KT+t1+ZUCqYjdsrYMgDlECmGBOGXKcvhPEGx8ooYvIL3yWJMXcmd1pRwEb4MM7jfmLz
 c/tdLxmWVjV1IcDA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=JTX5+jib;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=tq3KT+t1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1721036386; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7vjwHdMmGPViBh2c9N/zcRkOZ62oEkG/Ou8gjaW1Q/Y=;
 b=JTX5+jibFGgCxjgOPIT2JDTKbg0bxI1ViY/W5EebeDEezSSdC5anwiHTKqCnSrmTwl/X5e
 97Xuxmow+YtUeCCrYPxAmVKWAcgFv4sEM7EnxjFAVs6PzjYXv5Nw85TxVzvk2ABTVn+lyn
 H/eqsPyc75uty2pKF4byQoXOS8p1KJA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1721036386;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7vjwHdMmGPViBh2c9N/zcRkOZ62oEkG/Ou8gjaW1Q/Y=;
 b=tq3KT+t1+ZUCqYjdsrYMgDlECmGBOGXKcvhPEGx8ooYvIL3yWJMXcmd1pRwEb4MM7jfmLz
 c/tdLxmWVjV1IcDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 67F81134AB;
 Mon, 15 Jul 2024 09:39:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ABUoGGLulGbTEgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 15 Jul 2024 09:39:46 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 2/7] drm/probe-helper: Optionally report single connected
 output per CRTC
Date: Mon, 15 Jul 2024 11:38:58 +0200
Message-ID: <20240715093936.793552-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240715093936.793552-1-tzimmermann@suse.de>
References: <20240715093936.793552-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: A37511F7E2
X-Spam-Flag: NO
X-Spam-Score: 0.99
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [0.99 / 50.00]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 RCVD_TLS_ALL(0.00)[]; ARC_NA(0.00)[]; TO_DN_SOME(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_SEVEN(0.00)[8];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 FREEMAIL_TO(0.00)[redhat.com,ffwll.ch,gmail.com,kernel.org,linux.intel.com];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:email];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Level: 
X-Spamd-Bar: /
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

For CRTCs with multiple outputs (i.e., encoders plus connectors),
only report at most a single connected output to userspace. Make
this configurable via CONFIG_DRM_REPORT_SINGLE_CONNECTED_CRTC_OUTPUT.

Having multiple connected outputs on the same CRTC complicates
display-mode and format selection, so most userspace does not
support this. This is mostly not a problem in practice, as modern
display hardware provides a separate CRTC for each output. On
old hardware or hardware with BMCs, a single CRTC often drives
multiple displays. Only reporting one of them as connected makes
the hardware compatible with common userspace.

Add the field prioritized_connectors to struct drm_connector. The
bitmask signals which other connectors have priority. Also provide
the helper drm_probe_helper_prioritize_connectors() that sets
default priorities for a given set of connectors. Calling the
helper should be enough to set up the functionality for most drivers.

With the prioritization bits in place, update connector-status
detection to test against prioritized conenctors. So when the probe
helpers detect a connector as connected, test against the prioritized
connectors. If any is also connected, set the connector status to
disconnected.

Please note that this functionality is a workaround for limitations
in userspace. If your compositor supports multiple outputs per CRTC,
CONFIG_DRM_REPORT_SINGLE_CONNECTED_CRTC_OUTPUT should be disabled.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/Kconfig            |  15 +++++
 drivers/gpu/drm/drm_probe_helper.c | 104 +++++++++++++++++++++++++++++
 include/drm/drm_connector.h        |   2 +
 include/drm/drm_probe_helper.h     |   2 +
 4 files changed, 123 insertions(+)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index fd0749c0c630..d1afdbd2d93b 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -105,6 +105,21 @@ config DRM_KMS_HELPER
 	help
 	  CRTC helpers for KMS drivers.
 
+config DRM_REPORT_SINGLE_CONNECTED_CRTC_OUTPUT
+       bool "Report only a single connected output per CRTC"
+       depends on DRM
+       default n
+       help
+         CRTCs can support multiple encoders and connectors for output.
+         More than one pair can be connected to a display at a time. Most
+         userspace only supports at most one connected output per CRTC at a
+	 time. Enable this option to let DRM report at most one connected
+	 output per CRTC. This is mostly relevant for low-end and old
+	 hardware. Most modern graphics hardware supports a separate CRTC
+	 per output and won't be affected by this setting.
+
+         If in doubt, say "Y".
+
 config DRM_PANIC
 	bool "Display a user-friendly message when a kernel panic occurs"
 	depends on DRM && !(FRAMEBUFFER_CONSOLE && VT_CONSOLE)
diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index f14301abf53f..fc0652635148 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -352,6 +352,74 @@ static int detect_connector_status(struct drm_connector *connector,
 	return connector_status_connected;
 }
 
+static int reported_connector_status(struct drm_connector *connector, int detected_status,
+				     struct drm_modeset_acquire_ctx *ctx, bool force)
+{
+#if defined(CONFIG_DRM_REPORT_SINGLE_CONNECTED_CRTC_OUTPUT)
+	struct drm_connector *prio_connector = connector;
+	struct drm_device *dev = connector->dev;
+	struct drm_connector_list_iter iter;
+	struct drm_connector *pos;
+	u32 connector_mask;
+	int ret = 0;
+
+	if (!connector->prioritized_connectors)
+		return detected_status;
+
+	if (detected_status != connector_status_connected)
+		return detected_status;
+
+	connector_mask = drm_connector_mask(connector);
+
+	/*
+	 * Find the connector with status 'connected' and a higher
+	 * priority.
+	 */
+	drm_connector_list_iter_begin(dev, &iter);
+	drm_for_each_connector_iter(pos, &iter) {
+		if (!(drm_connector_mask(pos) & connector->prioritized_connectors))
+			continue;
+
+		/*
+		 * Warn if connector has priority over itself.
+		 */
+		if (drm_WARN_ON_ONCE(dev, pos == connector))
+			continue;
+
+		/*
+		 * Warn if both connectors have priority over each other. Pick the
+		 * one with the lower index.
+		 */
+		if (drm_WARN_ON_ONCE(dev, pos->prioritized_connectors & connector_mask)) {
+			if (pos->index > connector->index)
+				continue;
+		}
+
+		ret = detect_connector_status(pos, ctx, force);
+		if (ret < 0)
+			break;
+		if (ret == connector_status_disconnected)
+			continue;
+
+		prio_connector = pos;
+		break;
+	}
+	drm_connector_list_iter_end(&iter);
+
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * We've found another connected connector. Report our connector
+	 * as 'disconnected'.
+	 */
+	if (prio_connector != connector)
+		detected_status = connector_status_disconnected;
+#endif
+
+	return detected_status;
+}
+
 static enum drm_connector_status
 drm_helper_probe_detect_ctx(struct drm_connector *connector, bool force)
 {
@@ -373,6 +441,12 @@ drm_helper_probe_detect_ctx(struct drm_connector *connector, bool force)
 	if (WARN_ON(ret < 0))
 		ret = connector_status_unknown;
 
+	ret = reported_connector_status(connector, ret, &ctx, force);
+	if (ret == -EDEADLK) {
+		drm_modeset_backoff(&ctx);
+		goto retry;
+	}
+
 	if (ret != connector->status)
 		connector->epoch_counter += 1;
 
@@ -408,6 +482,7 @@ drm_helper_probe_detect(struct drm_connector *connector,
 		return ret;
 
 	ret = detect_connector_status(connector, ctx, force);
+	ret = reported_connector_status(connector, ret, ctx, force);
 
 	if (ret != connector->status)
 		connector->epoch_counter += 1;
@@ -416,6 +491,35 @@ drm_helper_probe_detect(struct drm_connector *connector,
 }
 EXPORT_SYMBOL(drm_helper_probe_detect);
 
+/**
+ * drm_probe_helper_prioritize_connectors - Set connector priorities
+ * @dev: the DRM device with connectors
+ * @connector_mask: Bitmask connector indices
+ *
+ * drm_probe_helper_prioritize_connectors() prioritizes all connectors
+ * specified in @connector_mask. All given connectors are assumed to
+ * interfere with each other. Connectors with a lower index have priority
+ * over connectors with a higher index.
+ */
+void drm_probe_helper_prioritize_connectors(struct drm_device *dev, u32 connector_mask)
+{
+	struct drm_connector_list_iter iter;
+	struct drm_connector *connector;
+	u32 prioritized_connectors = 0;
+
+	drm_connector_list_iter_begin(dev, &iter);
+	drm_for_each_connector_iter(connector, &iter) {
+		u32 mask = drm_connector_mask(connector);
+
+		if (!(mask & connector_mask))
+			continue;
+		connector->prioritized_connectors = prioritized_connectors;
+		prioritized_connectors |= mask;
+	}
+	drm_connector_list_iter_end(&iter);
+}
+EXPORT_SYMBOL(drm_probe_helper_prioritize_connectors);
+
 static int drm_helper_probe_get_modes(struct drm_connector *connector)
 {
 	const struct drm_connector_helper_funcs *connector_funcs =
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 5ad735253413..e3039478e928 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1985,6 +1985,8 @@ struct drm_connector {
 	/** @epoch_counter: used to detect any other changes in connector, besides status */
 	u64 epoch_counter;
 
+	u32 prioritized_connectors;
+
 	/**
 	 * @possible_encoders: Bit mask of encoders that can drive this
 	 * connector, drm_encoder_index() determines the index into the bitfield
diff --git a/include/drm/drm_probe_helper.h b/include/drm/drm_probe_helper.h
index d6ce7b218b77..05e23485550d 100644
--- a/include/drm/drm_probe_helper.h
+++ b/include/drm/drm_probe_helper.h
@@ -17,6 +17,8 @@ int drm_helper_probe_detect(struct drm_connector *connector,
 			    struct drm_modeset_acquire_ctx *ctx,
 			    bool force);
 
+void drm_probe_helper_prioritize_connectors(struct drm_device *dev, u32 connector_mask);
+
 int drmm_kms_helper_poll_init(struct drm_device *dev);
 void drm_kms_helper_poll_init(struct drm_device *dev);
 void drm_kms_helper_poll_fini(struct drm_device *dev);
-- 
2.45.2

