Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D0553F981
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 11:20:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D0CD12AEFF;
	Tue,  7 Jun 2022 09:20:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 076FA12AEFF
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 09:20:47 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BA9591F97E;
 Tue,  7 Jun 2022 09:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1654593610; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8R9C0dglah0MP3mLVTk3S9e4dfLp5imsjOXdHOEjQLA=;
 b=j4N4ZLJdozAEOCqDYsysOpBYLrMggEhWyRtSt4dTohtMHw/T4grPRS+HvWdjepi+AfoEBD
 SRfi3bRuItBHaURjYG8vhfjBsvWOEoU2JPtbxtCYOBq2JGwjMFHDnOlEYcIlO0SykVfAZW
 ubdhBUbGoS60moImobc8abQuNZ5QOcQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1654593610;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8R9C0dglah0MP3mLVTk3S9e4dfLp5imsjOXdHOEjQLA=;
 b=/lDk62bpJwKvTwUeDi80JK+Z8BDXtQ2Y+6xUDji1BqxiYSxYp3MPu1eau2rI04I0kTlms8
 a41P5khztenhXxDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8AC7D13B40;
 Tue,  7 Jun 2022 09:20:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id IBfVIEoYn2JwLwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 07 Jun 2022 09:20:10 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, kuohsiang_chou@aspeedtech.com, airlied@linux.ie,
 patrik.r.jakobsson@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Subject: [PATCH v3 5/5] drm/ast: Remove struct ast_{vga,sil164}_connector
Date: Tue,  7 Jun 2022 11:20:08 +0200
Message-Id: <20220607092008.22123-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220607092008.22123-1-tzimmermann@suse.de>
References: <20220607092008.22123-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Both, struct ast_vga_connector and struct ast_sil164_connector, are
now wrappers around struct drm_connector. Remove them.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
---
 drivers/gpu/drm/ast/ast_drv.h  | 24 ++----------------------
 drivers/gpu/drm/ast/ast_mode.c | 18 ++++++------------
 2 files changed, 8 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index bc01090d0ad1..a85a2e66be25 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -135,26 +135,6 @@ struct ast_i2c_chan {
 	struct i2c_algo_bit_data bit;
 };
 
-struct ast_vga_connector {
-	struct drm_connector base;
-};
-
-static inline struct ast_vga_connector *
-to_ast_vga_connector(struct drm_connector *connector)
-{
-	return container_of(connector, struct ast_vga_connector, base);
-}
-
-struct ast_sil164_connector {
-	struct drm_connector base;
-};
-
-static inline struct ast_sil164_connector *
-to_ast_sil164_connector(struct drm_connector *connector)
-{
-	return container_of(connector, struct ast_sil164_connector, base);
-}
-
 /*
  * Device
  */
@@ -179,11 +159,11 @@ struct ast_private {
 	struct {
 		struct {
 			struct drm_encoder encoder;
-			struct ast_vga_connector vga_connector;
+			struct drm_connector connector;
 		} vga;
 		struct {
 			struct drm_encoder encoder;
-			struct ast_sil164_connector sil164_connector;
+			struct drm_connector connector;
 		} sil164;
 		struct {
 			struct drm_encoder encoder;
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 364035d22463..37a1519f96c0 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1330,10 +1330,8 @@ static const struct drm_connector_funcs ast_vga_connector_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
-static int ast_vga_connector_init(struct drm_device *dev,
-				  struct ast_vga_connector *ast_vga_connector)
+static int ast_vga_connector_init(struct drm_device *dev, struct drm_connector *connector)
 {
-	struct drm_connector *connector = &ast_vga_connector->base;
 	struct ast_i2c_chan *i2c;
 	int ret;
 
@@ -1364,8 +1362,7 @@ static int ast_vga_output_init(struct ast_private *ast)
 	struct drm_device *dev = &ast->base;
 	struct drm_crtc *crtc = &ast->crtc;
 	struct drm_encoder *encoder = &ast->output.vga.encoder;
-	struct ast_vga_connector *ast_vga_connector = &ast->output.vga.vga_connector;
-	struct drm_connector *connector = &ast_vga_connector->base;
+	struct drm_connector *connector = &ast->output.vga.connector;
 	int ret;
 
 	ret = drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_DAC);
@@ -1373,7 +1370,7 @@ static int ast_vga_output_init(struct ast_private *ast)
 		return ret;
 	encoder->possible_crtcs = drm_crtc_mask(crtc);
 
-	ret = ast_vga_connector_init(dev, ast_vga_connector);
+	ret = ast_vga_connector_init(dev, connector);
 	if (ret)
 		return ret;
 
@@ -1401,10 +1398,8 @@ static const struct drm_connector_funcs ast_sil164_connector_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
-static int ast_sil164_connector_init(struct drm_device *dev,
-				     struct ast_sil164_connector *ast_sil164_connector)
+static int ast_sil164_connector_init(struct drm_device *dev, struct drm_connector *connector)
 {
-	struct drm_connector *connector = &ast_sil164_connector->base;
 	struct ast_i2c_chan *i2c;
 	int ret;
 
@@ -1435,8 +1430,7 @@ static int ast_sil164_output_init(struct ast_private *ast)
 	struct drm_device *dev = &ast->base;
 	struct drm_crtc *crtc = &ast->crtc;
 	struct drm_encoder *encoder = &ast->output.sil164.encoder;
-	struct ast_sil164_connector *ast_sil164_connector = &ast->output.sil164.sil164_connector;
-	struct drm_connector *connector = &ast_sil164_connector->base;
+	struct drm_connector *connector = &ast->output.sil164.connector;
 	int ret;
 
 	ret = drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_TMDS);
@@ -1444,7 +1438,7 @@ static int ast_sil164_output_init(struct ast_private *ast)
 		return ret;
 	encoder->possible_crtcs = drm_crtc_mask(crtc);
 
-	ret = ast_sil164_connector_init(dev, ast_sil164_connector);
+	ret = ast_sil164_connector_init(dev, connector);
 	if (ret)
 		return ret;
 
-- 
2.36.1

