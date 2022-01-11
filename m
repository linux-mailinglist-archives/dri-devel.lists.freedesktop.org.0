Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA2848AD37
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 13:01:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFFBC10E8AA;
	Tue, 11 Jan 2022 12:01:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1506610E5E3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 12:01:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A882221639;
 Tue, 11 Jan 2022 12:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1641902462; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R+i143KtOtbBmTdR26VnzWp+ZrC1KUD3FYmruu0ZOro=;
 b=onO/6O7Rk+hdosrXWYpVk1FqeqNxLr18jGdj0n4j00NEjqEn16MtofGrhTErUCDi9f67+i
 pTkQ2bSRfKF309pTZG9yrp1NaBhkKV17ylHGCR1MKfTLB+wE25LOSnydigR9fa7ywUk2tF
 KhlZXyyUAiauBhqHQb74Z0N/9m+Qw6o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1641902462;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R+i143KtOtbBmTdR26VnzWp+ZrC1KUD3FYmruu0ZOro=;
 b=JpFP/FZ6gRJnQ+Gk65ta7e0Xjdn1QEfBuLIkZPNza1/7fMPspjt41oItRw+hhs+KUKs+GR
 4aM7eTS2jZi5CKDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5F9B413DD4;
 Tue, 11 Jan 2022 12:01:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KPRoFn5x3WEeFQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 11 Jan 2022 12:01:02 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, airlied@linux.ie, daniel@ffwll.ch, sam@ravnborg.org,
 kuohsiang_chou@aspeedtech.com
Subject: [PATCH 5/8] drm/ast: Rename struct ast_connector to struct
 ast_vga_connector
Date: Tue, 11 Jan 2022 13:00:55 +0100
Message-Id: <20220111120058.10510-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220111120058.10510-1-tzimmermann@suse.de>
References: <20220111120058.10510-1-tzimmermann@suse.de>
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
Cc: jenmin_yuan@aspeedtech.com, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, tommy_huang@aspeedtech.com,
 arc_sung@aspeedtech.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prepare for introducing other connectors besides VGA. No functional
changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_drv.h  | 10 ++++----
 drivers/gpu/drm/ast/ast_mode.c | 45 +++++++++++++++++-----------------
 2 files changed, 27 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 479bb120dd05..e1cb31acdaac 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -129,15 +129,15 @@ struct ast_i2c_chan {
 	struct i2c_algo_bit_data bit;
 };
 
-struct ast_connector {
+struct ast_vga_connector {
 	struct drm_connector base;
 	struct ast_i2c_chan *i2c;
 };
 
-static inline struct ast_connector *
-to_ast_connector(struct drm_connector *connector)
+static inline struct ast_vga_connector *
+to_ast_vga_connector(struct drm_connector *connector)
 {
-	return container_of(connector, struct ast_connector, base);
+	return container_of(connector, struct ast_vga_connector, base);
 }
 
 /*
@@ -161,7 +161,7 @@ struct ast_private {
 	struct ast_cursor_plane cursor_plane;
 	struct drm_crtc crtc;
 	struct drm_encoder encoder;
-	struct ast_connector connector;
+	struct ast_vga_connector connector;
 
 	bool support_wide_screen;
 	enum {
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 0a8aa6e3aa38..f7f4034cc91e 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1269,12 +1269,12 @@ static int ast_encoder_init(struct drm_device *dev)
 }
 
 /*
- * Connector
+ * VGA Connector
  */
 
-static int ast_get_modes(struct drm_connector *connector)
+static int ast_vga_connector_helper_get_modes(struct drm_connector *connector)
 {
-	struct ast_connector *ast_connector = to_ast_connector(connector);
+	struct ast_vga_connector *ast_vga_connector = to_ast_vga_connector(connector);
 	struct ast_private *ast = to_ast_private(connector->dev);
 	struct edid *edid = NULL;
 	bool flags = false;
@@ -1291,23 +1291,23 @@ static int ast_get_modes(struct drm_connector *connector)
 			edid = NULL;
 		}
 	}
-	if (!flags && ast_connector->i2c)
-		edid = drm_get_edid(connector, &ast_connector->i2c->adapter);
+	if (!flags && ast_vga_connector->i2c)
+		edid = drm_get_edid(connector, &ast_vga_connector->i2c->adapter);
 	if (edid) {
-		drm_connector_update_edid_property(&ast_connector->base, edid);
+		drm_connector_update_edid_property(connector, edid);
 		ret = drm_add_edid_modes(connector, edid);
 		kfree(edid);
 		return ret;
 	}
-	drm_connector_update_edid_property(&ast_connector->base, NULL);
+	drm_connector_update_edid_property(connector, NULL);
 	return 0;
 }
 
-static const struct drm_connector_helper_funcs ast_connector_helper_funcs = {
-	.get_modes = ast_get_modes,
+static const struct drm_connector_helper_funcs ast_vga_connector_helper_funcs = {
+	.get_modes = ast_vga_connector_helper_get_modes,
 };
 
-static const struct drm_connector_funcs ast_connector_funcs = {
+static const struct drm_connector_funcs ast_vga_connector_funcs = {
 	.reset = drm_atomic_helper_connector_reset,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.destroy = drm_connector_cleanup,
@@ -1315,29 +1315,29 @@ static const struct drm_connector_funcs ast_connector_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
-static int ast_connector_init(struct drm_device *dev)
+static int ast_vga_connector_init(struct drm_device *dev)
 {
 	struct ast_private *ast = to_ast_private(dev);
-	struct ast_connector *ast_connector = &ast->connector;
-	struct drm_connector *connector = &ast_connector->base;
+	struct ast_vga_connector *ast_vga_connector = &ast->connector;
+	struct drm_connector *connector = &ast_vga_connector->base;
 	struct drm_encoder *encoder = &ast->encoder;
 	int ret;
 
-	ast_connector->i2c = ast_i2c_create(dev);
-	if (!ast_connector->i2c)
+	ast_vga_connector->i2c = ast_i2c_create(dev);
+	if (!ast_vga_connector->i2c)
 		drm_err(dev, "failed to add ddc bus for connector\n");
 
-	if (ast_connector->i2c)
-		ret = drm_connector_init_with_ddc(dev, connector, &ast_connector_funcs,
+	if (ast_vga_connector->i2c)
+		ret = drm_connector_init_with_ddc(dev, connector, &ast_vga_connector_funcs,
 						  DRM_MODE_CONNECTOR_VGA,
-						  &ast_connector->i2c->adapter);
+						  &ast_vga_connector->i2c->adapter);
 	else
-		ret = drm_connector_init(dev, connector, &ast_connector_funcs,
+		ret = drm_connector_init(dev, connector, &ast_vga_connector_funcs,
 					 DRM_MODE_CONNECTOR_VGA);
 	if (ret)
 		return ret;
 
-	drm_connector_helper_add(connector, &ast_connector_helper_funcs);
+	drm_connector_helper_add(connector, &ast_vga_connector_helper_funcs);
 
 	connector->interlace_allowed = 0;
 	connector->doublescan_allowed = 0;
@@ -1353,8 +1353,7 @@ static int ast_connector_init(struct drm_device *dev)
  * Mode config
  */
 
-static const struct drm_mode_config_helper_funcs
-ast_mode_config_helper_funcs = {
+static const struct drm_mode_config_helper_funcs ast_mode_config_helper_funcs = {
 	.atomic_commit_tail = drm_atomic_helper_commit_tail_rpm,
 };
 
@@ -1407,7 +1406,7 @@ int ast_mode_config_init(struct ast_private *ast)
 
 	ast_crtc_init(dev);
 	ast_encoder_init(dev);
-	ast_connector_init(dev);
+	ast_vga_connector_init(dev);
 
 	drm_mode_config_reset(dev);
 
-- 
2.34.1

