Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B311F931169
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 11:39:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E70DC10E1EF;
	Mon, 15 Jul 2024 09:39:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="qPoNWcA6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iUXnRE0L";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qPoNWcA6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iUXnRE0L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A0CD10E1EF
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 09:39:48 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 618EB21B4F;
 Mon, 15 Jul 2024 09:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1721036386; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mUJYt0YFpnzi6c/1zXmO1ITb+dAIghKzV6hQxSwURQU=;
 b=qPoNWcA6UhxkGZXRW+SEBVVb6Qt2Lxi52OEBaWvLrUc3eXRWW9wv76REVKds5q16Emzy7S
 cDwtqmFR875UCSyUVI8+iJ+HCTDPYf0zbOOxd1+y0TwbMMFRhcIvUW7bVKECpjW3uk+Wjf
 XUbMm4lLSeMxhfKmvIaTWGZG9ax++zk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1721036386;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mUJYt0YFpnzi6c/1zXmO1ITb+dAIghKzV6hQxSwURQU=;
 b=iUXnRE0LIeVgClj9iZXFyaPMk9WrDr7iYRJowcwp6dYNJ7gKeAVg2vk16JskbV3C3dXvtg
 dFFC6SASrjZ6FDAA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=qPoNWcA6;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=iUXnRE0L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1721036386; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mUJYt0YFpnzi6c/1zXmO1ITb+dAIghKzV6hQxSwURQU=;
 b=qPoNWcA6UhxkGZXRW+SEBVVb6Qt2Lxi52OEBaWvLrUc3eXRWW9wv76REVKds5q16Emzy7S
 cDwtqmFR875UCSyUVI8+iJ+HCTDPYf0zbOOxd1+y0TwbMMFRhcIvUW7bVKECpjW3uk+Wjf
 XUbMm4lLSeMxhfKmvIaTWGZG9ax++zk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1721036386;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mUJYt0YFpnzi6c/1zXmO1ITb+dAIghKzV6hQxSwURQU=;
 b=iUXnRE0LIeVgClj9iZXFyaPMk9WrDr7iYRJowcwp6dYNJ7gKeAVg2vk16JskbV3C3dXvtg
 dFFC6SASrjZ6FDAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 27B3C1395F;
 Mon, 15 Jul 2024 09:39:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id QKB2CGLulGbTEgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 15 Jul 2024 09:39:46 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 1/7] drm/probe-helper: Call connector detect functions in
 single helper
Date: Mon, 15 Jul 2024 11:38:57 +0200
Message-ID: <20240715093936.793552-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240715093936.793552-1-tzimmermann@suse.de>
References: <20240715093936.793552-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_MATCH_ENVRCPT_ALL(0.00)[]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 TO_DN_SOME(0.00)[];
 FREEMAIL_TO(0.00)[redhat.com,ffwll.ch,gmail.com,kernel.org,linux.intel.com];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:dkim];
 RCPT_COUNT_SEVEN(0.00)[8];
 DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Queue-Id: 618EB21B4F
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

Move the logic to call the connector's detect helper into a single
internal function. Reduces code dupliction.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_probe_helper.c | 33 +++++++++++++++---------------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index bb49d552e671..f14301abf53f 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -338,10 +338,23 @@ void drm_kms_helper_poll_reschedule(struct drm_device *dev)
 }
 EXPORT_SYMBOL(drm_kms_helper_poll_reschedule);
 
+static int detect_connector_status(struct drm_connector *connector,
+				   struct drm_modeset_acquire_ctx *ctx,
+				   bool force)
+{
+	const struct drm_connector_helper_funcs *funcs = connector->helper_private;
+
+	if (funcs->detect_ctx)
+		return funcs->detect_ctx(connector, ctx, force);
+	else if (connector->funcs->detect)
+		return connector->funcs->detect(connector, force);
+
+	return connector_status_connected;
+}
+
 static enum drm_connector_status
 drm_helper_probe_detect_ctx(struct drm_connector *connector, bool force)
 {
-	const struct drm_connector_helper_funcs *funcs = connector->helper_private;
 	struct drm_modeset_acquire_ctx ctx;
 	int ret;
 
@@ -349,14 +362,8 @@ drm_helper_probe_detect_ctx(struct drm_connector *connector, bool force)
 
 retry:
 	ret = drm_modeset_lock(&connector->dev->mode_config.connection_mutex, &ctx);
-	if (!ret) {
-		if (funcs->detect_ctx)
-			ret = funcs->detect_ctx(connector, &ctx, force);
-		else if (connector->funcs->detect)
-			ret = connector->funcs->detect(connector, force);
-		else
-			ret = connector_status_connected;
-	}
+	if (!ret)
+		ret = detect_connector_status(connector, &ctx, force);
 
 	if (ret == -EDEADLK) {
 		drm_modeset_backoff(&ctx);
@@ -390,7 +397,6 @@ drm_helper_probe_detect(struct drm_connector *connector,
 			struct drm_modeset_acquire_ctx *ctx,
 			bool force)
 {
-	const struct drm_connector_helper_funcs *funcs = connector->helper_private;
 	struct drm_device *dev = connector->dev;
 	int ret;
 
@@ -401,12 +407,7 @@ drm_helper_probe_detect(struct drm_connector *connector,
 	if (ret)
 		return ret;
 
-	if (funcs->detect_ctx)
-		ret = funcs->detect_ctx(connector, ctx, force);
-	else if (connector->funcs->detect)
-		ret = connector->funcs->detect(connector, force);
-	else
-		ret = connector_status_connected;
+	ret = detect_connector_status(connector, ctx, force);
 
 	if (ret != connector->status)
 		connector->epoch_counter += 1;
-- 
2.45.2

