Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D492A4AC0CF
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 15:16:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3BCB10F189;
	Mon,  7 Feb 2022 14:15:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCEC810E338
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 14:15:48 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 49D8B21100;
 Mon,  7 Feb 2022 14:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1644243347; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sPBozBsgs1xEzCipaBOvneynsKGj0RJtcneeY4uRBCE=;
 b=pJAmk8c7lSByHCZ33xzpf+ESp2gxnMeaSPqcZzU7lUBGRGCzeuyw3TOc/VYQd4IW9iIAT0
 R2Be2brC3Vb9dNZF5Kg/Y2V4v973F57DnX6nafAOg46zP3hvpgp/2YwoX75cA+Nb8CGT2T
 K6ElKAEZZgUzaNXJeeB6n+JwdZyTChk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1644243347;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sPBozBsgs1xEzCipaBOvneynsKGj0RJtcneeY4uRBCE=;
 b=zEbClTdNYmmGyNbmqFMTJC9mU6Y1yuXpbcjZZTHGJHQYnBHa3BvFszXW3gIkmaO9qocGYC
 WuTWULqCGLI2hpDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0DA7E13BF5;
 Mon,  7 Feb 2022 14:15:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id cN47ApMpAWKePQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 07 Feb 2022 14:15:47 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, airlied@redhat.com, airlied@linux.ie, daniel@ffwll.ch,
 sam@ravnborg.org, kuohsiang_chou@aspeedtech.com,
 tommy_huang@aspeedtech.com, jenmin_yuan@aspeedtech.com,
 arc_sung@aspeedtech.com
Subject: [PATCH v2 4/9] drm/ast: Remove unused value dp501_maxclk
Date: Mon,  7 Feb 2022 15:15:39 +0100
Message-Id: <20220207141544.30015-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220207141544.30015-1-tzimmermann@suse.de>
References: <20220207141544.30015-1-tzimmermann@suse.de>
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

Remove reading the link-rate. The value is maintained by the connector
code but never used.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/ast/ast_dp501.c | 58 ---------------------------------
 drivers/gpu/drm/ast/ast_drv.h   |  1 -
 drivers/gpu/drm/ast/ast_mode.c  |  7 ++--
 3 files changed, 3 insertions(+), 63 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_dp501.c b/drivers/gpu/drm/ast/ast_dp501.c
index cd93c44f2662..204c926a18ea 100644
--- a/drivers/gpu/drm/ast/ast_dp501.c
+++ b/drivers/gpu/drm/ast/ast_dp501.c
@@ -272,64 +272,6 @@ static bool ast_launch_m68k(struct drm_device *dev)
 	return true;
 }
 
-u8 ast_get_dp501_max_clk(struct drm_device *dev)
-{
-	struct ast_private *ast = to_ast_private(dev);
-	u32 boot_address, offset, data;
-	u8 linkcap[4], linkrate, linklanes, maxclk = 0xff;
-	u32 *plinkcap;
-
-	if (ast->config_mode == ast_use_p2a) {
-		boot_address = get_fw_base(ast);
-
-		/* validate FW version */
-		offset = AST_DP501_GBL_VERSION;
-		data = ast_mindwm(ast, boot_address + offset);
-		if ((data & AST_DP501_FW_VERSION_MASK) != AST_DP501_FW_VERSION_1) /* version: 1x */
-			return maxclk;
-
-		/* Read Link Capability */
-		offset  = AST_DP501_LINKRATE;
-		plinkcap = (u32 *)linkcap;
-		*plinkcap  = ast_mindwm(ast, boot_address + offset);
-		if (linkcap[2] == 0) {
-			linkrate = linkcap[0];
-			linklanes = linkcap[1];
-			data = (linkrate == 0x0a) ? (90 * linklanes) : (54 * linklanes);
-			if (data > 0xff)
-				data = 0xff;
-			maxclk = (u8)data;
-		}
-	} else {
-		if (!ast->dp501_fw_buf)
-			return AST_DP501_DEFAULT_DCLK;	/* 1024x768 as default */
-
-		/* dummy read */
-		offset = 0x0000;
-		data = readl(ast->dp501_fw_buf + offset);
-
-		/* validate FW version */
-		offset = AST_DP501_GBL_VERSION;
-		data = readl(ast->dp501_fw_buf + offset);
-		if ((data & AST_DP501_FW_VERSION_MASK) != AST_DP501_FW_VERSION_1) /* version: 1x */
-			return maxclk;
-
-		/* Read Link Capability */
-		offset = AST_DP501_LINKRATE;
-		plinkcap = (u32 *)linkcap;
-		*plinkcap = readl(ast->dp501_fw_buf + offset);
-		if (linkcap[2] == 0) {
-			linkrate = linkcap[0];
-			linklanes = linkcap[1];
-			data = (linkrate == 0x0a) ? (90 * linklanes) : (54 * linklanes);
-			if (data > 0xff)
-				data = 0xff;
-			maxclk = (u8)data;
-		}
-	}
-	return maxclk;
-}
-
 bool ast_dp501_read_edid(struct drm_device *dev, u8 *ediddata)
 {
 	struct ast_private *ast = to_ast_private(dev);
diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 6e77be1d06d3..479bb120dd05 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -171,7 +171,6 @@ struct ast_private {
 	} config_mode;
 
 	enum ast_tx_chip tx_chip_type;
-	u8 dp501_maxclk;
 	u8 *dp501_fw_addr;
 	const struct firmware *dp501_fw;	/* dp501 fw */
 };
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index ab0a86cecbba..a70158b2e29f 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1284,16 +1284,15 @@ static int ast_get_modes(struct drm_connector *connector)
 	int ret;
 
 	if (ast->tx_chip_type == AST_TX_DP501) {
-		ast->dp501_maxclk = 0xff;
 		edid = kmalloc(128, GFP_KERNEL);
 		if (!edid)
 			return -ENOMEM;
 
 		flags = ast_dp501_read_edid(connector->dev, (u8 *)edid);
-		if (flags)
-			ast->dp501_maxclk = ast_get_dp501_max_clk(connector->dev);
-		else
+		if (!flags) {
 			kfree(edid);
+			edid = NULL;
+		}
 	}
 	if (!flags && ast_connector->i2c)
 		edid = drm_get_edid(connector, &ast_connector->i2c->adapter);
-- 
2.34.1

