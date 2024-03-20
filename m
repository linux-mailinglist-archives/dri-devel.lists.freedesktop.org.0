Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61289880EC0
	for <lists+dri-devel@lfdr.de>; Wed, 20 Mar 2024 10:37:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FAE110E732;
	Wed, 20 Mar 2024 09:37:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="HaRxgi8i";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+69TAaqm";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HaRxgi8i";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+69TAaqm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF3C310E8B3
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 09:37:46 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6EDBF340EE;
 Wed, 20 Mar 2024 09:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1710927465; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0ZazCjhxEjywAUN/bztrQrCNB9pGpd993ou3gcI7sMM=;
 b=HaRxgi8i3domPloGseB7rVrcGCrwDC82Vz94jdj6c8SNYGUY3AYRyNqa/hDm4C9osHr4XD
 6QOVrrhqtZ5R/Qebcb9mcRFTL0xga+kU9JmJ6b81rd1W0Hs1kIM3CMsYmctOFNb0Rlo59J
 sPbKMZkkQLhq5hLkgzcJlGMpN8y15Rw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1710927465;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0ZazCjhxEjywAUN/bztrQrCNB9pGpd993ou3gcI7sMM=;
 b=+69TAaqm8x5FtFlGzGtIublqznnlC6aY4MbmTea2SsRtCaDv9W4OPAEhy0xCxNlxGmvJg+
 qn9kSxvVTwfSCiDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1710927465; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0ZazCjhxEjywAUN/bztrQrCNB9pGpd993ou3gcI7sMM=;
 b=HaRxgi8i3domPloGseB7rVrcGCrwDC82Vz94jdj6c8SNYGUY3AYRyNqa/hDm4C9osHr4XD
 6QOVrrhqtZ5R/Qebcb9mcRFTL0xga+kU9JmJ6b81rd1W0Hs1kIM3CMsYmctOFNb0Rlo59J
 sPbKMZkkQLhq5hLkgzcJlGMpN8y15Rw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1710927465;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0ZazCjhxEjywAUN/bztrQrCNB9pGpd993ou3gcI7sMM=;
 b=+69TAaqm8x5FtFlGzGtIublqznnlC6aY4MbmTea2SsRtCaDv9W4OPAEhy0xCxNlxGmvJg+
 qn9kSxvVTwfSCiDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 333AA136E4;
 Wed, 20 Mar 2024 09:37:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id EGkwC2mu+mWoWAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 20 Mar 2024 09:37:45 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, jani.nikula@linux.intel.com, airlied@gmail.com,
 daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v5 11/13] drm/ast: Use drm_connector_helper_get_modes()
Date: Wed, 20 Mar 2024 10:34:16 +0100
Message-ID: <20240320093738.6341-12-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240320093738.6341-1-tzimmermann@suse.de>
References: <20240320093738.6341-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: ***
X-Spam-Score: 3.36
X-Spamd-Result: default: False [3.36 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 BROKEN_CONTENT_TYPE(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; RCPT_COUNT_SEVEN(0.00)[9];
 MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 BAYES_HAM(-0.34)[76.04%]
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

The .get_modes() code for VGA and SIL164 connectors does not depend
on either type of connector. Replace the driver code with the common
helper drm_connector_helper_get_modes(). It reads EDID data via
DDC and updates the connector's EDID property.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_mode.c | 42 ++--------------------------------
 1 file changed, 2 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 8766a0f2eb3c7..71cc681d6188f 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1344,27 +1344,8 @@ static int ast_crtc_init(struct drm_device *dev)
  * VGA Connector
  */
 
-static int ast_vga_connector_helper_get_modes(struct drm_connector *connector)
-{
-	struct edid *edid;
-	int count;
-
-	edid = drm_get_edid(connector, connector->ddc);
-	if (!edid)
-		goto err_drm_get_edid;
-
-	count = drm_add_edid_modes(connector, edid);
-	kfree(edid);
-
-	return count;
-
-err_drm_get_edid:
-	drm_connector_update_edid_property(connector, NULL);
-	return 0;
-}
-
 static const struct drm_connector_helper_funcs ast_vga_connector_helper_funcs = {
-	.get_modes = ast_vga_connector_helper_get_modes,
+	.get_modes = drm_connector_helper_get_modes,
 };
 
 static const struct drm_connector_funcs ast_vga_connector_funcs = {
@@ -1431,27 +1412,8 @@ static int ast_vga_output_init(struct ast_device *ast)
  * SIL164 Connector
  */
 
-static int ast_sil164_connector_helper_get_modes(struct drm_connector *connector)
-{
-	struct edid *edid;
-	int count;
-
-	edid = drm_get_edid(connector, connector->ddc);
-	if (!edid)
-		goto err_drm_get_edid;
-
-	count = drm_add_edid_modes(connector, edid);
-	kfree(edid);
-
-	return count;
-
-err_drm_get_edid:
-	drm_connector_update_edid_property(connector, NULL);
-	return 0;
-}
-
 static const struct drm_connector_helper_funcs ast_sil164_connector_helper_funcs = {
-	.get_modes = ast_sil164_connector_helper_get_modes,
+	.get_modes = drm_connector_helper_get_modes,
 };
 
 static const struct drm_connector_funcs ast_sil164_connector_funcs = {
-- 
2.44.0

