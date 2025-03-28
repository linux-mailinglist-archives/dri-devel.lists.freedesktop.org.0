Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 795C5A74641
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 10:22:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B939B10E9B0;
	Fri, 28 Mar 2025 09:22:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="DjBzpwhI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6u+VsFq3";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DjBzpwhI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6u+VsFq3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C8E810E9AE
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 09:22:10 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 617C61F45B;
 Fri, 28 Mar 2025 09:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1743153713; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UQxO5ijWVS1SeJJC6CnixaRaP7FOlg9n56GuWqnG7NM=;
 b=DjBzpwhIcCLF+5X5bLLx50OLvDhz0Yyk2AsbH9Nv3of+h9yduCm3rdH8V6KqdKizvyNtbt
 MRftrcRG1cFdUxVaF9dsFfAfj09Sg/Vqh2uUWtnP9gsSbjZwOO9uABRWvxovTWlKMcsM3e
 Zoqyx4O8iGasC3BvJbYss6n5icplGto=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1743153713;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UQxO5ijWVS1SeJJC6CnixaRaP7FOlg9n56GuWqnG7NM=;
 b=6u+VsFq3rYLk7Gct5n2WbVm+BIMo54NXq56niqWES0yf+Wg1W1KZExYS1OgLaQZTcDQQWv
 QJCWejm/kIwV/KDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1743153713; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UQxO5ijWVS1SeJJC6CnixaRaP7FOlg9n56GuWqnG7NM=;
 b=DjBzpwhIcCLF+5X5bLLx50OLvDhz0Yyk2AsbH9Nv3of+h9yduCm3rdH8V6KqdKizvyNtbt
 MRftrcRG1cFdUxVaF9dsFfAfj09Sg/Vqh2uUWtnP9gsSbjZwOO9uABRWvxovTWlKMcsM3e
 Zoqyx4O8iGasC3BvJbYss6n5icplGto=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1743153713;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UQxO5ijWVS1SeJJC6CnixaRaP7FOlg9n56GuWqnG7NM=;
 b=6u+VsFq3rYLk7Gct5n2WbVm+BIMo54NXq56niqWES0yf+Wg1W1KZExYS1OgLaQZTcDQQWv
 QJCWejm/kIwV/KDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2F122139D4;
 Fri, 28 Mar 2025 09:21:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id eOtVCjFq5mciEwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 28 Mar 2025 09:21:53 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kraxel@redhat.com,
	airlied@redhat.com
Cc: virtualization@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 4/4] drm/cirrus-qemu: Remove custom plane state
Date: Fri, 28 Mar 2025 10:17:08 +0100
Message-ID: <20250328091821.195061-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250328091821.195061-1-tzimmermann@suse.de>
References: <20250328091821.195061-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -6.80
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MIME_TRACE(0.00)[0:+]; TO_DN_SOME(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_FIVE(0.00)[5];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 
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

Remove struct cirrus_primary_plane_state and its helpers, which
are all unused. Use struct drm_shadow_plane_state instead.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/tiny/cirrus-qemu.c | 59 +-----------------------------
 1 file changed, 1 insertion(+), 58 deletions(-)

diff --git a/drivers/gpu/drm/tiny/cirrus-qemu.c b/drivers/gpu/drm/tiny/cirrus-qemu.c
index 76744394e2a3b..ccf3f6551344a 100644
--- a/drivers/gpu/drm/tiny/cirrus-qemu.c
+++ b/drivers/gpu/drm/tiny/cirrus-qemu.c
@@ -70,16 +70,6 @@ struct cirrus_device {
 
 #define to_cirrus(_dev) container_of(_dev, struct cirrus_device, dev)
 
-struct cirrus_primary_plane_state {
-	struct drm_shadow_plane_state base;
-};
-
-static inline struct cirrus_primary_plane_state *
-to_cirrus_primary_plane_state(struct drm_plane_state *plane_state)
-{
-	return container_of(plane_state, struct cirrus_primary_plane_state, base.base);
-};
-
 /* ------------------------------------------------------------------ */
 /*
  * The meat of this driver. The core passes us a mode and we have to program
@@ -374,58 +364,11 @@ static const struct drm_plane_helper_funcs cirrus_primary_plane_helper_funcs = {
 	.atomic_update = cirrus_primary_plane_helper_atomic_update,
 };
 
-static struct drm_plane_state *
-cirrus_primary_plane_atomic_duplicate_state(struct drm_plane *plane)
-{
-	struct drm_plane_state *plane_state = plane->state;
-	struct cirrus_primary_plane_state *new_primary_plane_state;
-	struct drm_shadow_plane_state *new_shadow_plane_state;
-
-	if (!plane_state)
-		return NULL;
-
-	new_primary_plane_state = kzalloc(sizeof(*new_primary_plane_state), GFP_KERNEL);
-	if (!new_primary_plane_state)
-		return NULL;
-	new_shadow_plane_state = &new_primary_plane_state->base;
-
-	__drm_gem_duplicate_shadow_plane_state(plane, new_shadow_plane_state);
-
-	return &new_shadow_plane_state->base;
-}
-
-static void cirrus_primary_plane_atomic_destroy_state(struct drm_plane *plane,
-						      struct drm_plane_state *plane_state)
-{
-	struct cirrus_primary_plane_state *primary_plane_state =
-		to_cirrus_primary_plane_state(plane_state);
-
-	__drm_gem_destroy_shadow_plane_state(&primary_plane_state->base);
-	kfree(primary_plane_state);
-}
-
-static void cirrus_reset_primary_plane(struct drm_plane *plane)
-{
-	struct cirrus_primary_plane_state *primary_plane_state;
-
-	if (plane->state) {
-		cirrus_primary_plane_atomic_destroy_state(plane, plane->state);
-		plane->state = NULL; /* must be set to NULL here */
-	}
-
-	primary_plane_state = kzalloc(sizeof(*primary_plane_state), GFP_KERNEL);
-	if (!primary_plane_state)
-		return;
-	__drm_gem_reset_shadow_plane(plane, &primary_plane_state->base);
-}
-
 static const struct drm_plane_funcs cirrus_primary_plane_funcs = {
 	.update_plane = drm_atomic_helper_update_plane,
 	.disable_plane = drm_atomic_helper_disable_plane,
 	.destroy = drm_plane_cleanup,
-	.reset = cirrus_reset_primary_plane,
-	.atomic_duplicate_state = cirrus_primary_plane_atomic_duplicate_state,
-	.atomic_destroy_state = cirrus_primary_plane_atomic_destroy_state,
+	DRM_GEM_SHADOW_PLANE_FUNCS,
 };
 
 static int cirrus_crtc_helper_atomic_check(struct drm_crtc *crtc, struct drm_atomic_state *state)
-- 
2.48.1

