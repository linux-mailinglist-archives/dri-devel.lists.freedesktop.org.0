Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2036C93116F
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 11:40:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6289D10E0EA;
	Mon, 15 Jul 2024 09:40:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="qC4L1E2W";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="npQrFcD2";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qC4L1E2W";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="npQrFcD2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D73B10E24F
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 09:39:48 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 38E711F7FA;
 Mon, 15 Jul 2024 09:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1721036387; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l0m+YbXd8M4EOX4UqRttnuAb3AT6tMM7aAZL58pthF0=;
 b=qC4L1E2WWSvykF+WvEyjl7EejFoJIbIRu8O+WoxS8Ium6zaqnELMa4MKwgPtxpaCWkfBXG
 T0Y3xqKis1ZLNPG10X/NdgS9mFGxUkIb/mfBGlBVAHj4oPaObejrmjwv75dUPjH1Wy5P7o
 qIegJlhhBeC0O4DtON2F2PyijN2+j9g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1721036387;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l0m+YbXd8M4EOX4UqRttnuAb3AT6tMM7aAZL58pthF0=;
 b=npQrFcD2pETrm+F0zyBr7MfiqrBrKPd9EeZHn4izEsWjFAV4c8gpjEgUasixVPFkNRHUrG
 2Y01UJioD3mWGgAA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=qC4L1E2W;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=npQrFcD2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1721036387; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l0m+YbXd8M4EOX4UqRttnuAb3AT6tMM7aAZL58pthF0=;
 b=qC4L1E2WWSvykF+WvEyjl7EejFoJIbIRu8O+WoxS8Ium6zaqnELMa4MKwgPtxpaCWkfBXG
 T0Y3xqKis1ZLNPG10X/NdgS9mFGxUkIb/mfBGlBVAHj4oPaObejrmjwv75dUPjH1Wy5P7o
 qIegJlhhBeC0O4DtON2F2PyijN2+j9g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1721036387;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l0m+YbXd8M4EOX4UqRttnuAb3AT6tMM7aAZL58pthF0=;
 b=npQrFcD2pETrm+F0zyBr7MfiqrBrKPd9EeZHn4izEsWjFAV4c8gpjEgUasixVPFkNRHUrG
 2Y01UJioD3mWGgAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F3B67134AB;
 Mon, 15 Jul 2024 09:39:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 2J85OmLulGbTEgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 15 Jul 2024 09:39:46 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 4/7] drm/ast: Remove struct ast_bmc_connector
Date: Mon, 15 Jul 2024 11:39:00 +0200
Message-ID: <20240715093936.793552-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240715093936.793552-1-tzimmermann@suse.de>
References: <20240715093936.793552-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 38E711F7FA
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

Ast's BMC connector tracks the status of an underlying physical
connector and set BMC status accordingly. This functionality has
been moved into probe helpers. The BMC is always connected and the
helpers compute the correct status. Hence, remove the driver's
dedicated code.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_drv.h  | 17 +------------
 drivers/gpu/drm/ast/ast_mode.c | 46 ++++------------------------------
 2 files changed, 6 insertions(+), 57 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index ba3d86973995..faafb696dc74 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -146,21 +146,6 @@ static inline struct ast_plane *to_ast_plane(struct drm_plane *plane)
 	return container_of(plane, struct ast_plane, base);
 }
 
-/*
- * BMC
- */
-
-struct ast_bmc_connector {
-	struct drm_connector base;
-	struct drm_connector *physical_connector;
-};
-
-static inline struct ast_bmc_connector *
-to_ast_bmc_connector(struct drm_connector *connector)
-{
-	return container_of(connector, struct ast_bmc_connector, base);
-}
-
 /*
  * Device
  */
@@ -208,7 +193,7 @@ struct ast_device {
 		} astdp;
 		struct {
 			struct drm_encoder encoder;
-			struct ast_bmc_connector bmc_connector;
+			struct drm_connector connector;
 		} bmc;
 	} output;
 
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index ac8a3c6b8bf8..f59cb0f8fbb2 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1761,30 +1761,6 @@ static const struct drm_encoder_funcs ast_bmc_encoder_funcs = {
 	.destroy = drm_encoder_cleanup,
 };
 
-static int ast_bmc_connector_helper_detect_ctx(struct drm_connector *connector,
-					       struct drm_modeset_acquire_ctx *ctx,
-					       bool force)
-{
-	struct ast_bmc_connector *bmc_connector = to_ast_bmc_connector(connector);
-	struct drm_connector *physical_connector = bmc_connector->physical_connector;
-
-	/*
-	 * Most user-space compositors cannot handle more than one connected
-	 * connector per CRTC. Hence, we only mark the BMC as connected if the
-	 * physical connector is disconnected. If the physical connector's status
-	 * is connected or unknown, the BMC remains disconnected. This has no
-	 * effect on the output of the BMC.
-	 *
-	 * FIXME: Remove this logic once user-space compositors can handle more
-	 *        than one connector per CRTC. The BMC should always be connected.
-	 */
-
-	if (physical_connector && physical_connector->status == connector_status_disconnected)
-		return connector_status_connected;
-
-	return connector_status_disconnected;
-}
-
 static int ast_bmc_connector_helper_get_modes(struct drm_connector *connector)
 {
 	return drm_add_modes_noedid(connector, 4096, 4096);
@@ -1792,7 +1768,6 @@ static int ast_bmc_connector_helper_get_modes(struct drm_connector *connector)
 
 static const struct drm_connector_helper_funcs ast_bmc_connector_helper_funcs = {
 	.get_modes = ast_bmc_connector_helper_get_modes,
-	.detect_ctx = ast_bmc_connector_helper_detect_ctx,
 };
 
 static const struct drm_connector_funcs ast_bmc_connector_funcs = {
@@ -1804,10 +1779,8 @@ static const struct drm_connector_funcs ast_bmc_connector_funcs = {
 };
 
 static int ast_bmc_connector_init(struct drm_device *dev,
-				  struct ast_bmc_connector *bmc_connector,
-				  struct drm_connector *physical_connector)
+				  struct drm_connector *connector)
 {
-	struct drm_connector *connector = &bmc_connector->base;
 	int ret;
 
 	ret = drm_connector_init(dev, connector, &ast_bmc_connector_funcs,
@@ -1817,19 +1790,15 @@ static int ast_bmc_connector_init(struct drm_device *dev,
 
 	drm_connector_helper_add(connector, &ast_bmc_connector_helper_funcs);
 
-	bmc_connector->physical_connector = physical_connector;
-
 	return 0;
 }
 
-static int ast_bmc_output_init(struct ast_device *ast,
-			       struct drm_connector *physical_connector)
+static int ast_bmc_output_init(struct ast_device *ast)
 {
 	struct drm_device *dev = &ast->base;
 	struct drm_crtc *crtc = &ast->crtc;
 	struct drm_encoder *encoder = &ast->output.bmc.encoder;
-	struct ast_bmc_connector *bmc_connector = &ast->output.bmc.bmc_connector;
-	struct drm_connector *connector = &bmc_connector->base;
+	struct drm_connector *connector = &ast->output.bmc.connector;
 	int ret;
 
 	ret = drm_encoder_init(dev, encoder,
@@ -1839,7 +1808,7 @@ static int ast_bmc_output_init(struct ast_device *ast,
 		return ret;
 	encoder->possible_crtcs = drm_crtc_mask(crtc);
 
-	ret = ast_bmc_connector_init(dev, bmc_connector, physical_connector);
+	ret = ast_bmc_connector_init(dev, connector);
 	if (ret)
 		return ret;
 
@@ -1901,7 +1870,6 @@ static const struct drm_mode_config_funcs ast_mode_config_funcs = {
 int ast_mode_config_init(struct ast_device *ast)
 {
 	struct drm_device *dev = &ast->base;
-	struct drm_connector *physical_connector = NULL;
 	int ret;
 
 	ret = drmm_mutex_init(dev, &ast->modeset_lock);
@@ -1946,27 +1914,23 @@ int ast_mode_config_init(struct ast_device *ast)
 		ret = ast_vga_output_init(ast);
 		if (ret)
 			return ret;
-		physical_connector = &ast->output.vga.connector;
 	}
 	if (ast->tx_chip_types & AST_TX_SIL164_BIT) {
 		ret = ast_sil164_output_init(ast);
 		if (ret)
 			return ret;
-		physical_connector = &ast->output.sil164.connector;
 	}
 	if (ast->tx_chip_types & AST_TX_DP501_BIT) {
 		ret = ast_dp501_output_init(ast);
 		if (ret)
 			return ret;
-		physical_connector = &ast->output.dp501.connector;
 	}
 	if (ast->tx_chip_types & AST_TX_ASTDP_BIT) {
 		ret = ast_astdp_output_init(ast);
 		if (ret)
 			return ret;
-		physical_connector = &ast->output.astdp.connector;
 	}
-	ret = ast_bmc_output_init(ast, physical_connector);
+	ret = ast_bmc_output_init(ast);
 	if (ret)
 		return ret;
 
-- 
2.45.2

