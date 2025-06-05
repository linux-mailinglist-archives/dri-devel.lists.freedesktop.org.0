Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B3CACF30E
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 17:30:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DDFE10E976;
	Thu,  5 Jun 2025 15:30:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="zS8Rhan5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GOpy4Uu4";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zS8Rhan5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GOpy4Uu4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C7E610E92F
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 15:30:28 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9884C1F791;
 Thu,  5 Jun 2025 15:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749137418; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UZt91+xBCK3ThE9eVIulfp4mGyzElXr3w5Qr8Fqo2+U=;
 b=zS8Rhan5EdlFDYBaPilXZO2Fh+r7ZJHROL/IYwEVbJYz7MRtCELoSNgKIySd5uquIJ5aXv
 Uv4fNWtTG1AtIhJOIVjJNsNedk+yTIkkkk449BYJk/OpPM76mqIDMEmY0HC0HolEZuJHiv
 YBuNqKAAtPdyG2NoAd7JCyog5qrekAk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749137418;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UZt91+xBCK3ThE9eVIulfp4mGyzElXr3w5Qr8Fqo2+U=;
 b=GOpy4Uu43HY109iBipMwObL7GMqBD54gNTWb+zm/uH0dj2Y2axWdVK/Vj7VwCophoVrEQr
 q05otgFw7xUZ7qAA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=zS8Rhan5;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=GOpy4Uu4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749137418; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UZt91+xBCK3ThE9eVIulfp4mGyzElXr3w5Qr8Fqo2+U=;
 b=zS8Rhan5EdlFDYBaPilXZO2Fh+r7ZJHROL/IYwEVbJYz7MRtCELoSNgKIySd5uquIJ5aXv
 Uv4fNWtTG1AtIhJOIVjJNsNedk+yTIkkkk449BYJk/OpPM76mqIDMEmY0HC0HolEZuJHiv
 YBuNqKAAtPdyG2NoAd7JCyog5qrekAk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749137418;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UZt91+xBCK3ThE9eVIulfp4mGyzElXr3w5Qr8Fqo2+U=;
 b=GOpy4Uu43HY109iBipMwObL7GMqBD54gNTWb+zm/uH0dj2Y2axWdVK/Vj7VwCophoVrEQr
 q05otgFw7xUZ7qAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3193B139CB;
 Thu,  5 Jun 2025 15:30:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ILPCCgq4QWj3XwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 05 Jun 2025 15:30:18 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: mhklinux@outlook.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 drawat.floss@gmail.com, javierm@redhat.com, kraxel@redhat.com,
 louis.chauvet@bootlin.com, hamohammed.sa@gmail.com, melissa.srw@gmail.com,
 fvogt@suse.com
Cc: dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 virtualization@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 3/6] drm/simpledrm: Use vblank timer
Date: Thu,  5 Jun 2025 17:24:41 +0200
Message-ID: <20250605152637.98493-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605152637.98493-1-tzimmermann@suse.de>
References: <20250605152637.98493-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_TO(0.00)[outlook.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch,redhat.com,bootlin.com,suse.com];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RCPT_COUNT_TWELVE(0.00)[16]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FROM_HAS_DN(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
 RCVD_VIA_SMTP_AUTH(0.00)[]; TAGGED_RCPT(0.00)[];
 RCVD_COUNT_TWO(0.00)[2];
 R_RATELIMIT(0.00)[to_ip_from(RL4xcm599wuy3aaiwfjdd1c6ky)];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 TO_DN_SOME(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,outlook.com]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 9884C1F791
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -1.51
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

Simpledrm hardware does not provide vblank interrupts. Use a vblank
timer to simulate the inerrup tin software. Rate-limits the display's
update frequency to the display-mode settings.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/sysfb/simpledrm.c | 81 +++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/drivers/gpu/drm/sysfb/simpledrm.c b/drivers/gpu/drm/sysfb/simpledrm.c
index a1c3119330de..b9766129f564 100644
--- a/drivers/gpu/drm/sysfb/simpledrm.c
+++ b/drivers/gpu/drm/sysfb/simpledrm.c
@@ -26,6 +26,8 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/drm_vblank.h>
+#include <drm/drm_vblank_timer.h>
 
 #include "drm_sysfb_helper.h"
 
@@ -229,11 +231,17 @@ struct simpledrm_device {
 	/* modesetting */
 	u32 formats[DRM_SYSFB_PLANE_NFORMATS(1)];
 	struct drm_plane primary_plane;
+	struct drm_vblank_timer vtimer;
 	struct drm_crtc crtc;
 	struct drm_encoder encoder;
 	struct drm_connector connector;
 };
 
+static struct simpledrm_device *to_simpledrm_device(struct drm_device *dev)
+{
+	return container_of(to_drm_sysfb_device(dev), struct simpledrm_device, sysfb);
+}
+
 /*
  * Hardware
  */
@@ -564,13 +572,79 @@ static const struct drm_plane_funcs simpledrm_primary_plane_funcs = {
 	.destroy = drm_plane_cleanup,
 };
 
+static void simpledrm_crtc_helper_atomic_flush(struct drm_crtc *crtc,
+					       struct drm_atomic_state *state)
+{
+	struct drm_device *dev = crtc->dev;
+	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+	struct drm_pending_vblank_event *event;
+
+	spin_lock_irq(&dev->event_lock);
+
+	event = crtc_state->event;
+	crtc_state->event = NULL;
+
+	if (event) {
+		if (drm_crtc_vblank_get(crtc) == 0)
+			drm_crtc_arm_vblank_event(crtc, event);
+		else
+			drm_crtc_send_vblank_event(crtc, event);
+	}
+
+	spin_unlock_irq(&dev->event_lock);
+}
+
+static void simpledrm_crtc_helper_atomic_enable(struct drm_crtc *crtc,
+						struct drm_atomic_state *state)
+{
+	drm_crtc_vblank_on(crtc);
+}
+
+static void simpledrm_crtc_helper_atomic_disable(struct drm_crtc *crtc,
+						 struct drm_atomic_state *state)
+{
+	drm_crtc_vblank_off(crtc);
+}
+
 static const struct drm_crtc_helper_funcs simpledrm_crtc_helper_funcs = {
 	DRM_SYSFB_CRTC_HELPER_FUNCS,
+	.atomic_flush = simpledrm_crtc_helper_atomic_flush,
+	.atomic_enable = simpledrm_crtc_helper_atomic_enable,
+	.atomic_disable = simpledrm_crtc_helper_atomic_disable,
 };
 
+static int simpledrm_crtc_enable_vblank(struct drm_crtc *crtc)
+{
+	struct simpledrm_device *sdev = to_simpledrm_device(crtc->dev);
+
+	drm_vblank_timer_start(&sdev->vtimer);
+
+	return 0;
+}
+
+static void simpledrm_crtc_disable_vblank(struct drm_crtc *crtc)
+{
+	struct simpledrm_device *sdev = to_simpledrm_device(crtc->dev);
+
+	drm_vblank_timer_cancel(&sdev->vtimer);
+}
+
+static bool simpledrm_crtc_get_vblank_timestamp(struct drm_crtc *crtc,
+						int *max_error, ktime_t *vblank_time,
+						bool in_vblank_irq)
+{
+	struct simpledrm_device *sdev = to_simpledrm_device(crtc->dev);
+
+	return drm_vblank_timer_get_vblank_timestamp(&sdev->vtimer, max_error,
+						     vblank_time, in_vblank_irq);
+}
+
 static const struct drm_crtc_funcs simpledrm_crtc_funcs = {
 	DRM_SYSFB_CRTC_FUNCS,
 	.destroy = drm_crtc_cleanup,
+	.enable_vblank = simpledrm_crtc_enable_vblank,
+	.disable_vblank = simpledrm_crtc_disable_vblank,
+	.get_vblank_timestamp = simpledrm_crtc_get_vblank_timestamp,
 };
 
 static const struct drm_encoder_funcs simpledrm_encoder_funcs = {
@@ -611,6 +685,7 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
 	struct drm_crtc *crtc;
 	struct drm_encoder *encoder;
 	struct drm_connector *connector;
+	struct drm_vblank_timer *vtimer;
 	unsigned long max_width, max_height;
 	size_t nformats;
 	int ret;
@@ -812,6 +887,12 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
 	if (ret)
 		return ERR_PTR(ret);
 
+	/* Vertical blanking */
+
+	vtimer = &sdev->vtimer;
+	drmm_vblank_timer_init(vtimer, crtc, NULL);
+	drm_vblank_init(dev, 1);
+
 	drm_mode_config_reset(dev);
 
 	return sdev;
-- 
2.49.0

