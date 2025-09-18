Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E82B85B94
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 17:45:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2F2810E205;
	Thu, 18 Sep 2025 15:45:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="uPvhbTQp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1k1nfsYk";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uPvhbTQp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1k1nfsYk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 921FE10E205
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 15:45:00 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 71F73336A4;
 Thu, 18 Sep 2025 15:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1758210295; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mf4/ME3PQI6vUHTP8Ls+lEex6g6HP6cAV51X9MGvl/w=;
 b=uPvhbTQpglA5FsGY3XobclXEmM4NjGRQl61hu5+X5G/D//v8dFnz3PfrK6xZj3NqOubKBe
 Xgl/KrVJTDBxuT/KZLU/DKZLpkplS+NzmLXkePtQ9iknvx0SF6EQT/VykIrOM157J90Zoe
 +SJLFDGXbbpaZeClfUch3/5VIqNXkE8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1758210295;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mf4/ME3PQI6vUHTP8Ls+lEex6g6HP6cAV51X9MGvl/w=;
 b=1k1nfsYkdsavrWbw30K9zQpOy/ln/3/Y4XHNzlgASenonoHHATD6UL+mOoe7kqMSR7b553
 jTUISchG9z1C+lCg==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=uPvhbTQp;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=1k1nfsYk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1758210295; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mf4/ME3PQI6vUHTP8Ls+lEex6g6HP6cAV51X9MGvl/w=;
 b=uPvhbTQpglA5FsGY3XobclXEmM4NjGRQl61hu5+X5G/D//v8dFnz3PfrK6xZj3NqOubKBe
 Xgl/KrVJTDBxuT/KZLU/DKZLpkplS+NzmLXkePtQ9iknvx0SF6EQT/VykIrOM157J90Zoe
 +SJLFDGXbbpaZeClfUch3/5VIqNXkE8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1758210295;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mf4/ME3PQI6vUHTP8Ls+lEex6g6HP6cAV51X9MGvl/w=;
 b=1k1nfsYkdsavrWbw30K9zQpOy/ln/3/Y4XHNzlgASenonoHHATD6UL+mOoe7kqMSR7b553
 jTUISchG9z1C+lCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3B67F13AAF;
 Thu, 18 Sep 2025 15:44:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id CDlIDfcozGh/YQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 18 Sep 2025 15:44:55 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 1/3] drm/sysfb: Add custom plane state
Date: Thu, 18 Sep 2025 17:39:49 +0200
Message-ID: <20250918154207.84714-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250918154207.84714-1-tzimmermann@suse.de>
References: <20250918154207.84714-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 71F73336A4
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 MIME_TRACE(0.00)[0:+];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 ARC_NA(0.00)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
 RCPT_COUNT_SEVEN(0.00)[7];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -3.01
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

The plane-state type struct drm_sysfb_plane_state will store the
helper for blitting to the scanout buffer.

v2:
- add variable for duplicated shadow-plane state (Javier)
- fix build error

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/sysfb/drm_sysfb_helper.h  | 20 ++++++++-
 drivers/gpu/drm/sysfb/drm_sysfb_modeset.c | 51 ++++++++++++++++++++++-
 2 files changed, 69 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/sysfb/drm_sysfb_helper.h b/drivers/gpu/drm/sysfb/drm_sysfb_helper.h
index 89633e30ca62..875dd6594760 100644
--- a/drivers/gpu/drm/sysfb/drm_sysfb_helper.h
+++ b/drivers/gpu/drm/sysfb/drm_sysfb_helper.h
@@ -10,6 +10,7 @@
 
 #include <drm/drm_crtc.h>
 #include <drm/drm_device.h>
+#include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_modes.h>
 
 struct drm_format_info;
@@ -93,6 +94,16 @@ static inline struct drm_sysfb_device *to_drm_sysfb_device(struct drm_device *de
  * Plane
  */
 
+struct drm_sysfb_plane_state {
+	struct drm_shadow_plane_state base;
+};
+
+static inline struct drm_sysfb_plane_state *
+to_drm_sysfb_plane_state(struct drm_plane_state *base)
+{
+	return container_of(to_drm_shadow_plane_state(base), struct drm_sysfb_plane_state, base);
+}
+
 size_t drm_sysfb_build_fourcc_list(struct drm_device *dev,
 				   const u32 *native_fourccs, size_t native_nfourccs,
 				   u32 *fourccs_out, size_t nfourccs_out);
@@ -120,10 +131,17 @@ int drm_sysfb_plane_helper_get_scanout_buffer(struct drm_plane *plane,
 	.atomic_disable = drm_sysfb_plane_helper_atomic_disable, \
 	.get_scanout_buffer = drm_sysfb_plane_helper_get_scanout_buffer
 
+void drm_sysfb_plane_reset(struct drm_plane *plane);
+struct drm_plane_state *drm_sysfb_plane_atomic_duplicate_state(struct drm_plane *plane);
+void drm_sysfb_plane_atomic_destroy_state(struct drm_plane *plane,
+					  struct drm_plane_state *plane_state);
+
 #define DRM_SYSFB_PLANE_FUNCS \
+	.reset = drm_sysfb_plane_reset, \
 	.update_plane = drm_atomic_helper_update_plane, \
 	.disable_plane = drm_atomic_helper_disable_plane, \
-	DRM_GEM_SHADOW_PLANE_FUNCS
+	.atomic_duplicate_state = drm_sysfb_plane_atomic_duplicate_state, \
+	.atomic_destroy_state = drm_sysfb_plane_atomic_destroy_state
 
 /*
  * CRTC
diff --git a/drivers/gpu/drm/sysfb/drm_sysfb_modeset.c b/drivers/gpu/drm/sysfb/drm_sysfb_modeset.c
index ddb4a7523ee6..e7c5f8b3b99c 100644
--- a/drivers/gpu/drm/sysfb/drm_sysfb_modeset.c
+++ b/drivers/gpu/drm/sysfb/drm_sysfb_modeset.c
@@ -11,7 +11,6 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
-#include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_panic.h>
 #include <drm/drm_print.h>
@@ -185,6 +184,13 @@ size_t drm_sysfb_build_fourcc_list(struct drm_device *dev,
 }
 EXPORT_SYMBOL(drm_sysfb_build_fourcc_list);
 
+static void drm_sysfb_plane_state_destroy(struct drm_sysfb_plane_state *sysfb_plane_state)
+{
+	__drm_gem_destroy_shadow_plane_state(&sysfb_plane_state->base);
+
+	kfree(sysfb_plane_state);
+}
+
 int drm_sysfb_plane_helper_atomic_check(struct drm_plane *plane,
 					struct drm_atomic_state *new_state)
 {
@@ -321,6 +327,49 @@ int drm_sysfb_plane_helper_get_scanout_buffer(struct drm_plane *plane,
 }
 EXPORT_SYMBOL(drm_sysfb_plane_helper_get_scanout_buffer);
 
+void drm_sysfb_plane_reset(struct drm_plane *plane)
+{
+	struct drm_sysfb_plane_state *sysfb_plane_state;
+
+	if (plane->state)
+		drm_sysfb_plane_state_destroy(to_drm_sysfb_plane_state(plane->state));
+
+	sysfb_plane_state = kzalloc(sizeof(*sysfb_plane_state), GFP_KERNEL);
+	if (sysfb_plane_state)
+		__drm_gem_reset_shadow_plane(plane, &sysfb_plane_state->base);
+	else
+		__drm_gem_reset_shadow_plane(plane, NULL);
+}
+EXPORT_SYMBOL(drm_sysfb_plane_reset);
+
+struct drm_plane_state *drm_sysfb_plane_atomic_duplicate_state(struct drm_plane *plane)
+{
+	struct drm_device *dev = plane->dev;
+	struct drm_plane_state *plane_state = plane->state;
+	struct drm_sysfb_plane_state *new_sysfb_plane_state;
+	struct drm_shadow_plane_state *new_shadow_plane_state;
+
+	if (drm_WARN_ON(dev, !plane_state))
+		return NULL;
+
+	new_sysfb_plane_state = kzalloc(sizeof(*new_sysfb_plane_state), GFP_KERNEL);
+	if (!new_sysfb_plane_state)
+		return NULL;
+	new_shadow_plane_state = &new_sysfb_plane_state->base;
+
+	__drm_gem_duplicate_shadow_plane_state(plane, new_shadow_plane_state);
+
+	return &new_shadow_plane_state->base;
+}
+EXPORT_SYMBOL(drm_sysfb_plane_atomic_duplicate_state);
+
+void drm_sysfb_plane_atomic_destroy_state(struct drm_plane *plane,
+					  struct drm_plane_state *plane_state)
+{
+	drm_sysfb_plane_state_destroy(to_drm_sysfb_plane_state(plane_state));
+}
+EXPORT_SYMBOL(drm_sysfb_plane_atomic_destroy_state);
+
 /*
  * CRTC
  */
-- 
2.51.0

