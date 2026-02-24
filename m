Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gLowOq7FnWnsRwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 16:37:18 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0281891D3
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 16:37:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4DCB10E5B6;
	Tue, 24 Feb 2026 15:37:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="CHA9htZJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QlOAvP4M";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CHA9htZJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QlOAvP4M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9478B10E5AE
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 15:37:11 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9F51F3F2C1;
 Tue, 24 Feb 2026 15:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1771947422; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PY79QwSAPOpYCesftBXxKudEPNYN+N/VLZdkdwiuHck=;
 b=CHA9htZJLcG4WDk8c2BIO2wyGYLlP+gslFqrqc+E6HxaDCToJQCUshrqL3xqbnjQfyaGRf
 PU93aW2DI8FtzPp+zLigH/XVMq63lviRMp8qz8eSx5OSpeLDAStjBH8fnX1fFRzd+8jgqT
 +B2T6ekv5EoAPQCesyq7GfEfXaeSWyQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1771947422;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PY79QwSAPOpYCesftBXxKudEPNYN+N/VLZdkdwiuHck=;
 b=QlOAvP4MOu6xRt5GxjDc1gc6ddJwvY77nqzMlfJJqOETisjyBxFVmnXZR1T9RnaYRpwlW7
 CmvtXYUfqicpvXAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1771947422; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PY79QwSAPOpYCesftBXxKudEPNYN+N/VLZdkdwiuHck=;
 b=CHA9htZJLcG4WDk8c2BIO2wyGYLlP+gslFqrqc+E6HxaDCToJQCUshrqL3xqbnjQfyaGRf
 PU93aW2DI8FtzPp+zLigH/XVMq63lviRMp8qz8eSx5OSpeLDAStjBH8fnX1fFRzd+8jgqT
 +B2T6ekv5EoAPQCesyq7GfEfXaeSWyQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1771947422;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PY79QwSAPOpYCesftBXxKudEPNYN+N/VLZdkdwiuHck=;
 b=QlOAvP4MOu6xRt5GxjDc1gc6ddJwvY77nqzMlfJJqOETisjyBxFVmnXZR1T9RnaYRpwlW7
 CmvtXYUfqicpvXAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3DB5F3EA69;
 Tue, 24 Feb 2026 15:37:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id cCZrDZ7FnWm0FgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 24 Feb 2026 15:37:02 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, lanzano.alex@gmail.com, kamlesh.gurudasani@gmail.com,
 david@lechnology.com, architanant5@gmail.com, wens@kernel.org,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com, simona@ffwll.ch,
 airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 03/16] drm/mipi-dbi: Provide callbacks for atomic interfaces
Date: Tue, 24 Feb 2026 16:24:40 +0100
Message-ID: <20260224153656.261351-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260224153656.261351-1-tzimmermann@suse.de>
References: <20260224153656.261351-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.30
X-Spam-Level: 
X-Spam-Flag: NO
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[redhat.com,gmail.com,lechnology.com,kernel.org,linux.intel.com,ffwll.ch];
	FORGED_RECIPIENTS(0.00)[m:javierm@redhat.com,m:lanzano.alex@gmail.com,m:kamlesh.gurudasani@gmail.com,m:david@lechnology.com,m:architanant5@gmail.com,m:wens@kernel.org,m:mripard@kernel.org,m:maarten.lankhorst@linux.intel.com,m:simona@ffwll.ch,m:airlied@gmail.com,m:tzimmermann@suse.de,m:lanzanoalex@gmail.com,m:kamleshgurudasani@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[suse.de:+];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 8A0281891D3
X-Rspamd-Action: no action

Refactor the existing simple-display callbacks such that they invoke
helpers compatible with regular atomic modesetting. Allows for adding
mipi-dbi drives that do not require simple-display helpers. Provide
initializer macro for elements of the regular modesetting pipeline.

As the new helpers are DRM functions, add the drm_ prefix. Mipi-dbi
interfaces currently lack this.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_mipi_dbi.c | 167 +++++++++++++++++++++++----------
 include/drm/drm_mipi_dbi.h     |  86 +++++++++++++++++
 2 files changed, 206 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index 86f38d59c6e9..6846cb73ea87 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -14,6 +14,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/spi/spi.h>
 
+#include <drm/drm_atomic.h>
 #include <drm/drm_connector.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_drv.h>
@@ -22,12 +23,9 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem.h>
-#include <drm/drm_gem_atomic_helper.h>
-#include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_mipi_dbi.h>
 #include <drm/drm_modes.h>
 #include <drm/drm_print.h>
-#include <drm/drm_probe_helper.h>
 #include <drm/drm_rect.h>
 #include <video/mipi_display.h>
 
@@ -316,6 +314,24 @@ static void mipi_dbi_fb_dirty(struct iosys_map *src, struct drm_framebuffer *fb,
 		drm_err_once(fb->dev, "Failed to update display %d\n", ret);
 }
 
+/**
+ * drm_mipi_dbi_crtc_helper_mode_valid - MIPI DBI mode-valid helper
+ * @crtc: The CRTC
+ * @mode: The mode to test
+ *
+ * This function validates a given display mode against the MIPI DBI's hardware
+ * display. Drivers can use this as their struct &drm_crtc_helper_funcs.mode_valid
+ * callback.
+ */
+enum drm_mode_status drm_mipi_dbi_crtc_helper_mode_valid(struct drm_crtc *crtc,
+							 const struct drm_display_mode *mode)
+{
+	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(crtc->dev);
+
+	return drm_crtc_helper_mode_valid_fixed(crtc, mode, &dbidev->mode);
+}
+EXPORT_SYMBOL(drm_mipi_dbi_crtc_helper_mode_valid);
+
 /**
  * mipi_dbi_pipe_mode_valid - MIPI DBI mode-valid helper
  * @pipe: Simple display pipe
@@ -328,43 +344,75 @@ static void mipi_dbi_fb_dirty(struct iosys_map *src, struct drm_framebuffer *fb,
 enum drm_mode_status mipi_dbi_pipe_mode_valid(struct drm_simple_display_pipe *pipe,
 					      const struct drm_display_mode *mode)
 {
-	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.dev);
-
-	return drm_crtc_helper_mode_valid_fixed(&pipe->crtc, mode, &dbidev->mode);
+	return drm_mipi_dbi_crtc_helper_mode_valid(&pipe->crtc, mode);
 }
 EXPORT_SYMBOL(mipi_dbi_pipe_mode_valid);
 
+int drm_mipi_dbi_plane_helper_atomic_check(struct drm_plane *plane,
+					   struct drm_atomic_state *state)
+{
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state, plane);
+	struct drm_crtc_state *new_crtc_state;
+	int ret;
+
+	if (new_plane_state->crtc)
+		new_crtc_state = drm_atomic_get_new_crtc_state(state, new_plane_state->crtc);
+
+	ret = drm_atomic_helper_check_plane_state(new_plane_state, new_crtc_state,
+						  DRM_PLANE_NO_SCALING,
+						  DRM_PLANE_NO_SCALING,
+						  false, false);
+	if (ret)
+		return ret;
+	else if (!new_plane_state->visible)
+		return 0;
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_mipi_dbi_plane_helper_atomic_check);
+
 /**
- * mipi_dbi_pipe_update - Display pipe update helper
- * @pipe: Simple display pipe
- * @old_state: Old plane state
+ * drm_mipi_dbi_plane_helper_atomic_update - Display update helper
+ * @plane: Plane
+ * @state: Atomic state
  *
  * This function handles framebuffer flushing and vblank events. Drivers can use
- * this as their &drm_simple_display_pipe_funcs->update callback.
+ * this as their struct &drm_plane_helper_funcs.atomic_update callback.
  */
-void mipi_dbi_pipe_update(struct drm_simple_display_pipe *pipe,
-			  struct drm_plane_state *old_state)
+void drm_mipi_dbi_plane_helper_atomic_update(struct drm_plane *plane,
+					     struct drm_atomic_state *state)
 {
-	struct drm_plane_state *state = pipe->plane.state;
-	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(state);
-	struct drm_framebuffer *fb = state->fb;
+	struct drm_plane_state *plane_state = plane->state;
+	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
+	struct drm_framebuffer *fb = plane_state->fb;
+	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
 	struct drm_rect rect;
 	int idx;
 
-	if (!pipe->crtc.state->active)
-		return;
-
-	if (WARN_ON(!fb))
-		return;
-
-	if (!drm_dev_enter(fb->dev, &idx))
+	if (!fb)
 		return;
 
-	if (drm_atomic_helper_damage_merged(old_state, state, &rect))
-		mipi_dbi_fb_dirty(&shadow_plane_state->data[0], fb, &rect,
-				  &shadow_plane_state->fmtcnv_state);
+	if (drm_dev_enter(plane->dev, &idx)) {
+		if (drm_atomic_helper_damage_merged(old_plane_state, plane_state, &rect))
+			mipi_dbi_fb_dirty(&shadow_plane_state->data[0], fb, &rect,
+					  &shadow_plane_state->fmtcnv_state);
+		drm_dev_exit(idx);
+	}
+}
+EXPORT_SYMBOL(drm_mipi_dbi_plane_helper_atomic_update);
 
-	drm_dev_exit(idx);
+/**
+ * mipi_dbi_pipe_update - Display pipe update helper
+ * @pipe: Simple display pipe
+ * @old_state: Old plane state
+ *
+ * This function handles framebuffer flushing and vblank events. Drivers can use
+ * this as their &drm_simple_display_pipe_funcs->update callback.
+ */
+void mipi_dbi_pipe_update(struct drm_simple_display_pipe *pipe,
+			  struct drm_plane_state *old_state)
+{
+	return drm_mipi_dbi_plane_helper_atomic_update(&pipe->plane, old_state->state);
 }
 EXPORT_SYMBOL(mipi_dbi_pipe_update);
 
@@ -393,19 +441,36 @@ static void mipi_dbi_blank(struct mipi_dbi_dev *dbidev)
 	drm_dev_exit(idx);
 }
 
+int drm_mipi_dbi_crtc_helper_atomic_check(struct drm_crtc *crtc, struct drm_atomic_state *state)
+{
+	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+	int ret;
+
+	if (!crtc_state->enable)
+		goto out;
+
+	ret = drm_atomic_helper_check_crtc_primary_plane(crtc_state);
+	if (ret)
+		return ret;
+
+out:
+	return drm_atomic_add_affected_planes(state, crtc);
+}
+EXPORT_SYMBOL(drm_mipi_dbi_crtc_helper_atomic_check);
+
 /**
- * mipi_dbi_pipe_disable - MIPI DBI pipe disable helper
- * @pipe: Display pipe
+ * drm_mipi_dbi_crtc_helper_atomic_disable - MIPI DBI CRTC disable helper
+ * @crtc: CRTC to disable
+ * @state: Atomic state
  *
  * This function disables backlight if present, if not the display memory is
  * blanked. The regulator is disabled if in use. Drivers can use this as their
- * &drm_simple_display_pipe_funcs->disable callback.
+ * struct &drm_crtc_helper_funcs.atomic_disable callback.
  */
-void mipi_dbi_pipe_disable(struct drm_simple_display_pipe *pipe)
+void drm_mipi_dbi_crtc_helper_atomic_disable(struct drm_crtc *crtc,
+					     struct drm_atomic_state *state)
 {
-	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.dev);
-
-	DRM_DEBUG_KMS("\n");
+	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(crtc->dev);
 
 	if (dbidev->backlight)
 		backlight_disable(dbidev->backlight);
@@ -417,6 +482,20 @@ void mipi_dbi_pipe_disable(struct drm_simple_display_pipe *pipe)
 	if (dbidev->io_regulator)
 		regulator_disable(dbidev->io_regulator);
 }
+EXPORT_SYMBOL(drm_mipi_dbi_crtc_helper_atomic_disable);
+
+/**
+ * mipi_dbi_pipe_disable - MIPI DBI pipe disable helper
+ * @pipe: Display pipe
+ *
+ * This function disables backlight if present, if not the display memory is
+ * blanked. The regulator is disabled if in use. Drivers can use this as their
+ * &drm_simple_display_pipe_funcs->disable callback.
+ */
+void mipi_dbi_pipe_disable(struct drm_simple_display_pipe *pipe)
+{
+	drm_mipi_dbi_crtc_helper_atomic_disable(&pipe->crtc, pipe->crtc.state->state);
+}
 EXPORT_SYMBOL(mipi_dbi_pipe_disable);
 
 /**
@@ -503,23 +582,21 @@ void mipi_dbi_pipe_destroy_plane_state(struct drm_simple_display_pipe *pipe,
 }
 EXPORT_SYMBOL(mipi_dbi_pipe_destroy_plane_state);
 
-static int mipi_dbi_connector_get_modes(struct drm_connector *connector)
+int drm_mipi_dbi_connector_helper_get_modes(struct drm_connector *connector)
 {
 	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(connector->dev);
 
 	return drm_connector_helper_get_modes_fixed(connector, &dbidev->mode);
 }
+EXPORT_SYMBOL(drm_mipi_dbi_connector_helper_get_modes);
 
 static const struct drm_connector_helper_funcs mipi_dbi_connector_hfuncs = {
-	.get_modes = mipi_dbi_connector_get_modes,
+	DRM_MIPI_DBI_CONNECTOR_HELPER_FUNCS,
 };
 
 static const struct drm_connector_funcs mipi_dbi_connector_funcs = {
-	.reset = drm_atomic_helper_connector_reset,
-	.fill_modes = drm_helper_probe_single_connector_modes,
+	DRM_MIPI_DBI_CONNECTOR_FUNCS,
 	.destroy = drm_connector_cleanup,
-	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
-	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
 static int mipi_dbi_rotate_mode(struct drm_display_mode *mode,
@@ -540,18 +617,15 @@ static int mipi_dbi_rotate_mode(struct drm_display_mode *mode,
 }
 
 static const struct drm_mode_config_helper_funcs mipi_dbi_mode_config_helper_funcs = {
-	.atomic_commit_tail = drm_atomic_helper_commit_tail_rpm,
+	DRM_MIPI_DBI_MODE_CONFIG_HELPER_FUNCS,
 };
 
 static const struct drm_mode_config_funcs mipi_dbi_mode_config_funcs = {
-	.fb_create = drm_gem_fb_create_with_dirty,
-	.atomic_check = drm_atomic_helper_check,
-	.atomic_commit = drm_atomic_helper_commit,
+	DRM_MIPI_DBI_MODE_CONFIG_FUNCS,
 };
 
 static const uint32_t mipi_dbi_formats[] = {
-	DRM_FORMAT_RGB565,
-	DRM_FORMAT_XRGB8888,
+	DRM_MIPI_DBI_PLANE_FORMATS,
 };
 
 /**
@@ -633,8 +707,7 @@ int mipi_dbi_dev_init_with_formats(struct mipi_dbi_dev *dbidev,
 				   unsigned int rotation, size_t tx_buf_size)
 {
 	static const uint64_t modifiers[] = {
-		DRM_FORMAT_MOD_LINEAR,
-		DRM_FORMAT_MOD_INVALID
+		DRM_MIPI_DBI_PLANE_FORMAT_MODIFIERS,
 	};
 	struct drm_device *drm = &dbidev->drm;
 	int ret;
diff --git a/include/drm/drm_mipi_dbi.h b/include/drm/drm_mipi_dbi.h
index 9c0e015dd929..ae92a5e8d13b 100644
--- a/include/drm/drm_mipi_dbi.h
+++ b/include/drm/drm_mipi_dbi.h
@@ -9,7 +9,12 @@
 #define __LINUX_MIPI_DBI_H
 
 #include <linux/mutex.h>
+
+#include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_device.h>
+#include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 
 struct drm_format_conv_state;
@@ -230,6 +235,87 @@ int mipi_dbi_buf_copy(void *dst, struct iosys_map *src, struct drm_framebuffer *
 	ret; \
 })
 
+/*
+ * Plane
+ */
+
+#define DRM_MIPI_DBI_PLANE_FORMATS \
+	DRM_FORMAT_RGB565, \
+	DRM_FORMAT_XRGB8888
+
+#define DRM_MIPI_DBI_PLANE_FORMAT_MODIFIERS \
+	DRM_FORMAT_MOD_LINEAR, \
+	DRM_FORMAT_MOD_INVALID
+
+#define DRM_MIPI_DBI_PLANE_FUNCS \
+	DRM_GEM_SHADOW_PLANE_FUNCS, \
+	.update_plane = drm_atomic_helper_update_plane, \
+	.disable_plane = drm_atomic_helper_disable_plane
+
+int drm_mipi_dbi_plane_helper_atomic_check(struct drm_plane *plane,
+					   struct drm_atomic_state *state);
+void drm_mipi_dbi_plane_helper_atomic_update(struct drm_plane *plane,
+					     struct drm_atomic_state *state);
+
+#define DRM_MIPI_DBI_PLANE_HELPER_FUNCS \
+	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS, \
+	.atomic_check = drm_mipi_dbi_plane_helper_atomic_check, \
+	.atomic_update = drm_mipi_dbi_plane_helper_atomic_update
+
+/*
+ * CRTC
+ */
+
+#define DRM_MIPI_DBI_CRTC_FUNCS \
+	.reset = drm_atomic_helper_crtc_reset, \
+	.set_config = drm_atomic_helper_set_config, \
+	.page_flip = drm_atomic_helper_page_flip, \
+	.atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state, \
+	.atomic_destroy_state = drm_atomic_helper_crtc_destroy_state
+
+enum drm_mode_status drm_mipi_dbi_crtc_helper_mode_valid(struct drm_crtc *crtc,
+							 const struct drm_display_mode *mode);
+int drm_mipi_dbi_crtc_helper_atomic_check(struct drm_crtc *crtc,
+					  struct drm_atomic_state *state);
+void drm_mipi_dbi_crtc_helper_atomic_disable(struct drm_crtc *crtc,
+					     struct drm_atomic_state *state);
+
+#define DRM_MIPI_DBI_CRTC_HELPER_FUNCS \
+	.mode_valid = drm_mipi_dbi_crtc_helper_mode_valid, \
+	.atomic_check = drm_mipi_dbi_crtc_helper_atomic_check, \
+	.atomic_disable = drm_mipi_dbi_crtc_helper_atomic_disable
+
+/*
+ * Connector
+ */
+
+#define DRM_MIPI_DBI_CONNECTOR_FUNCS \
+	.reset = drm_atomic_helper_connector_reset, \
+	.fill_modes = drm_helper_probe_single_connector_modes, \
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state, \
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state
+
+int drm_mipi_dbi_connector_helper_get_modes(struct drm_connector *connector);
+
+#define DRM_MIPI_DBI_CONNECTOR_HELPER_FUNCS \
+	.get_modes = drm_mipi_dbi_connector_helper_get_modes
+
+/*
+ * Mode config
+ */
+
+#define DRM_MIPI_DBI_MODE_CONFIG_FUNCS \
+	.fb_create = drm_gem_fb_create_with_dirty, \
+	.atomic_check = drm_atomic_helper_check, \
+	.atomic_commit = drm_atomic_helper_commit
+
+#define DRM_MIPI_DBI_MODE_CONFIG_HELPER_FUNCS \
+	.atomic_commit_tail = drm_atomic_helper_commit_tail_rpm
+
+/*
+ * Debug FS
+ */
+
 #ifdef CONFIG_DEBUG_FS
 void mipi_dbi_debugfs_init(struct drm_minor *minor);
 #else
-- 
2.52.0

