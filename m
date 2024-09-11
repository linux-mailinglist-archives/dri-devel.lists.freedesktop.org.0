Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C35EF97512D
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 13:54:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B07910E9C8;
	Wed, 11 Sep 2024 11:53:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="QwtXRYfI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ydPQ+mPz";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QwtXRYfI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ydPQ+mPz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AE6510E9C3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 11:53:53 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C424521AA2;
 Wed, 11 Sep 2024 11:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1726055631; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hYPo6W2Z4TioVneanx/HWPsuPqBt1FqZ6Ht8zkq/hJQ=;
 b=QwtXRYfInpOFFmAq5oBexotoCzwgzxJQh2UBRcxV4zUxQqKmThOABwjy1z9aTv2aI2Hq8u
 R8Ua85rwekeDJIsmXJp5xgK1vQyfEqOyUbg9lV5ZTqZygHqaaW/R5t4RFQqV03+gl/Y87S
 WKSlt0tkYzlmgMW/IuRslD9uH3WiLyU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1726055631;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hYPo6W2Z4TioVneanx/HWPsuPqBt1FqZ6Ht8zkq/hJQ=;
 b=ydPQ+mPzKP2/86QaC7tFe53LTFoeUOadkhF0/x/HsrkYc77u/uQ1Txrdu09ad5PijFtbAE
 H9qt94RGV5Hp8tAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1726055631; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hYPo6W2Z4TioVneanx/HWPsuPqBt1FqZ6Ht8zkq/hJQ=;
 b=QwtXRYfInpOFFmAq5oBexotoCzwgzxJQh2UBRcxV4zUxQqKmThOABwjy1z9aTv2aI2Hq8u
 R8Ua85rwekeDJIsmXJp5xgK1vQyfEqOyUbg9lV5ZTqZygHqaaW/R5t4RFQqV03+gl/Y87S
 WKSlt0tkYzlmgMW/IuRslD9uH3WiLyU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1726055631;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hYPo6W2Z4TioVneanx/HWPsuPqBt1FqZ6Ht8zkq/hJQ=;
 b=ydPQ+mPzKP2/86QaC7tFe53LTFoeUOadkhF0/x/HsrkYc77u/uQ1Txrdu09ad5PijFtbAE
 H9qt94RGV5Hp8tAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9C98013A7E;
 Wed, 11 Sep 2024 11:53:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id +EXZJM+E4WbGIgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 11 Sep 2024 11:53:51 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 03/10] drm/ast: astdp: Replace power_on helpers
Date: Wed, 11 Sep 2024 13:51:21 +0200
Message-ID: <20240911115347.899148-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240911115347.899148-1-tzimmermann@suse.de>
References: <20240911115347.899148-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MIME_TRACE(0.00)[0:+]; TO_DN_SOME(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[4];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -6.80
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

Replace the helper for controlling power on the physical connector,
ast_dp_power_on_off(), with ast_dp_set_phy_sleep(). The new name
reflects the effect of the operation. Simplify the implementation.
The call now controls sleeping, hence semantics are inversed. Each
'on' becomes an 'off' operation and vice versa.

Do the same for ast_dp_power_is_on() and also align naming of the
register constant with the rest of the code.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_dp.c  | 39 +++++++++++++++--------------------
 drivers/gpu/drm/ast/ast_drv.h |  3 ---
 drivers/gpu/drm/ast/ast_reg.h |  2 +-
 3 files changed, 18 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
index 2b5129c6f8b0..d4362807d777 100644
--- a/drivers/gpu/drm/ast/ast_dp.c
+++ b/drivers/gpu/drm/ast/ast_dp.c
@@ -149,27 +149,22 @@ int ast_dp_launch(struct ast_device *ast)
 	return 0;
 }
 
-static bool ast_dp_power_is_on(struct ast_device *ast)
+static bool ast_dp_get_phy_sleep(struct ast_device *ast)
 {
-	u8 vgacre3;
+	u8 vgacre3 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xe3);
 
-	vgacre3 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xe3);
-
-	return !(vgacre3 & AST_DP_PHY_SLEEP);
+	return (vgacre3 & AST_IO_VGACRE3_DP_PHY_SLEEP);
 }
 
-static void ast_dp_power_on_off(struct ast_device *ast, bool on)
+static void ast_dp_set_phy_sleep(struct ast_device *ast, bool sleep)
 {
-	// Read and Turn off DP PHY sleep
-	u8 bE3 = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xE3, AST_DP_VIDEO_ENABLE);
-
-	// Turn on DP PHY sleep
-	if (!on)
-		bE3 |= AST_DP_PHY_SLEEP;
+	u8 vgacre3 = 0x00;
 
-	// DP Power on/off
-	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xE3, (u8) ~AST_DP_PHY_SLEEP, bE3);
+	if (sleep)
+		vgacre3 |= AST_IO_VGACRE3_DP_PHY_SLEEP;
 
+	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xe3, (u8)~AST_IO_VGACRE3_DP_PHY_SLEEP,
+			       vgacre3);
 	msleep(50);
 }
 
@@ -319,7 +314,7 @@ static void ast_astdp_encoder_helper_atomic_enable(struct drm_encoder *encoder,
 	struct ast_connector *ast_connector = &ast->output.astdp.connector;
 
 	if (ast_connector->physical_status == connector_status_connected) {
-		ast_dp_power_on_off(ast, AST_DP_POWER_ON);
+		ast_dp_set_phy_sleep(ast, false);
 		ast_dp_link_training(ast);
 
 		ast_wait_for_vretrace(ast);
@@ -333,7 +328,7 @@ static void ast_astdp_encoder_helper_atomic_disable(struct drm_encoder *encoder,
 	struct ast_device *ast = to_ast_device(encoder->dev);
 
 	ast_dp_set_on_off(ast, 0);
-	ast_dp_power_on_off(ast, AST_DP_POWER_OFF);
+	ast_dp_set_phy_sleep(ast, true);
 }
 
 static const struct drm_encoder_helper_funcs ast_astdp_encoder_helper_funcs = {
@@ -382,19 +377,19 @@ static int ast_astdp_connector_helper_detect_ctx(struct drm_connector *connector
 	struct ast_connector *ast_connector = to_ast_connector(connector);
 	struct ast_device *ast = to_ast_device(connector->dev);
 	enum drm_connector_status status = connector_status_disconnected;
-	bool power_is_on;
+	bool phy_sleep;
 
 	mutex_lock(&ast->modeset_lock);
 
-	power_is_on = ast_dp_power_is_on(ast);
-	if (!power_is_on)
-		ast_dp_power_on_off(ast, true);
+	phy_sleep = ast_dp_get_phy_sleep(ast);
+	if (phy_sleep)
+		ast_dp_set_phy_sleep(ast, false);
 
 	if (ast_astdp_is_connected(ast))
 		status = connector_status_connected;
 
-	if (!power_is_on && status == connector_status_disconnected)
-		ast_dp_power_on_off(ast, false);
+	if (phy_sleep && status == connector_status_disconnected)
+		ast_dp_set_phy_sleep(ast, true);
 
 	mutex_unlock(&ast->modeset_lock);
 
diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index b6ca14a3b967..cafc4234e839 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -403,9 +403,6 @@ int ast_mode_config_init(struct ast_device *ast);
 #define AST_DP501_LINKRATE	0xf014
 #define AST_DP501_EDID_DATA	0xf020
 
-#define AST_DP_POWER_ON			true
-#define AST_DP_POWER_OFF			false
-
 /*
  * ASTDP resoultion table:
  * EX:	ASTDP_A_B_C:
diff --git a/drivers/gpu/drm/ast/ast_reg.h b/drivers/gpu/drm/ast/ast_reg.h
index 040961cc1a19..d7a22cea8271 100644
--- a/drivers/gpu/drm/ast/ast_reg.h
+++ b/drivers/gpu/drm/ast/ast_reg.h
@@ -41,6 +41,7 @@
 #define AST_IO_VGACRD7_EDID_VALID_FLAG	BIT(0)
 #define AST_IO_VGACRDC_LINK_SUCCESS	BIT(0)
 #define AST_IO_VGACRDF_HPD		BIT(0)
+#define AST_IO_VGACRE3_DP_PHY_SLEEP	BIT(4)
 #define AST_IO_VGACRE5_EDID_READ_DONE	BIT(0)
 
 #define AST_IO_VGAIR1_R			(0x5A)
@@ -69,7 +70,6 @@
  */
 
 /* Define for Soc scratched reg used on ASTDP */
-#define AST_DP_PHY_SLEEP		BIT(4)
 #define AST_DP_VIDEO_ENABLE		BIT(0)
 
 /*
-- 
2.46.0

