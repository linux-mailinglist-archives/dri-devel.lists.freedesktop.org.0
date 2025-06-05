Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4130ACF307
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 17:30:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0FEC10E912;
	Thu,  5 Jun 2025 15:30:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="BayX52uR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MMYJ+3J3";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BayX52uR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MMYJ+3J3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A39910E944
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 15:30:19 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2C87133749;
 Thu,  5 Jun 2025 15:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749137418; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l6Vo9jkp6nRTLsOVDh7iuvAeUkGSxLSxjOWtsLN8N1s=;
 b=BayX52uRiTj8tEDKlqssPp/rk6ofZRg1gnc5Dr0f0MxB5PcENODNu6YEl6q2Z7B7zReYMO
 Pg95wrA+Xq7l4x7RenwXBSbNoHf5uwEMJnKjT3Mdd0J9kKTmt90Z5t9EA4WRc4TRrrCeTs
 NZu5p+q2NMwFXcgohfp1q9RN0wFtD+o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749137418;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l6Vo9jkp6nRTLsOVDh7iuvAeUkGSxLSxjOWtsLN8N1s=;
 b=MMYJ+3J3qm+4mzScRJSiuXy8EpRAmd6/aaT4Qakn4FehEllBMSsWndxelMv9xl/r+JoBBl
 oYLWsgCZPgi0xjCw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=BayX52uR;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=MMYJ+3J3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749137418; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l6Vo9jkp6nRTLsOVDh7iuvAeUkGSxLSxjOWtsLN8N1s=;
 b=BayX52uRiTj8tEDKlqssPp/rk6ofZRg1gnc5Dr0f0MxB5PcENODNu6YEl6q2Z7B7zReYMO
 Pg95wrA+Xq7l4x7RenwXBSbNoHf5uwEMJnKjT3Mdd0J9kKTmt90Z5t9EA4WRc4TRrrCeTs
 NZu5p+q2NMwFXcgohfp1q9RN0wFtD+o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749137418;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l6Vo9jkp6nRTLsOVDh7iuvAeUkGSxLSxjOWtsLN8N1s=;
 b=MMYJ+3J3qm+4mzScRJSiuXy8EpRAmd6/aaT4Qakn4FehEllBMSsWndxelMv9xl/r+JoBBl
 oYLWsgCZPgi0xjCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B8C6513A1D;
 Thu,  5 Jun 2025 15:30:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id EILOKwm4QWj3XwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 05 Jun 2025 15:30:17 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: mhklinux@outlook.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 drawat.floss@gmail.com, javierm@redhat.com, kraxel@redhat.com,
 louis.chauvet@bootlin.com, hamohammed.sa@gmail.com, melissa.srw@gmail.com,
 fvogt@suse.com
Cc: dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 virtualization@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 2/6] drm/vkms: Use vblank timer
Date: Thu,  5 Jun 2025 17:24:40 +0200
Message-ID: <20250605152637.98493-3-tzimmermann@suse.de>
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
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_TRACE(0.00)[0:+];
 FREEMAIL_TO(0.00)[outlook.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch,redhat.com,bootlin.com,suse.com];
 RCPT_COUNT_TWELVE(0.00)[16]; ARC_NA(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid,suse.de:email];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FROM_HAS_DN(0.00)[];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
 RCVD_VIA_SMTP_AUTH(0.00)[]; TAGGED_RCPT(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; DKIM_TRACE(0.00)[suse.de:+];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 FROM_EQ_ENVFROM(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,outlook.com]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 2C87133749
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

Replace vkms' vblank timer with the DRM implementation. The DRM
code is mostly identical.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/vkms/vkms_crtc.c | 49 +++++++-------------------------
 drivers/gpu/drm/vkms/vkms_drv.h  |  6 ++--
 2 files changed, 15 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index 8c9898b9055d..5b7829e8c900 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -10,22 +10,14 @@
 
 #include "vkms_drv.h"
 
-static enum hrtimer_restart vkms_vblank_simulate(struct hrtimer *timer)
+static bool vkms_crtc_handle_vblank(struct drm_crtc *crtc)
 {
-	struct vkms_output *output = container_of(timer, struct vkms_output,
-						  vblank_hrtimer);
-	struct drm_crtc *crtc = &output->crtc;
+	struct vkms_output *output = drm_crtc_to_vkms_output(crtc);
 	struct vkms_crtc_state *state;
-	u64 ret_overrun;
 	bool ret, fence_cookie;
 
 	fence_cookie = dma_fence_begin_signalling();
 
-	ret_overrun = hrtimer_forward_now(&output->vblank_hrtimer,
-					  output->period_ns);
-	if (ret_overrun != 1)
-		pr_warn("%s: vblank timer overrun\n", __func__);
-
 	spin_lock(&output->lock);
 	ret = drm_crtc_handle_vblank(crtc);
 	if (!ret)
@@ -57,18 +49,14 @@ static enum hrtimer_restart vkms_vblank_simulate(struct hrtimer *timer)
 
 	dma_fence_end_signalling(fence_cookie);
 
-	return HRTIMER_RESTART;
+	return true;
 }
 
 static int vkms_enable_vblank(struct drm_crtc *crtc)
 {
-	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
 	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
 
-	hrtimer_setup(&out->vblank_hrtimer, &vkms_vblank_simulate, CLOCK_MONOTONIC,
-		      HRTIMER_MODE_REL);
-	out->period_ns = ktime_set(0, vblank->framedur_ns);
-	hrtimer_start(&out->vblank_hrtimer, out->period_ns, HRTIMER_MODE_REL);
+	drm_vblank_timer_start(&out->vtimer);
 
 	return 0;
 }
@@ -77,7 +65,7 @@ static void vkms_disable_vblank(struct drm_crtc *crtc)
 {
 	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
 
-	hrtimer_cancel(&out->vblank_hrtimer);
+	drm_vblank_timer_cancel(&out->vtimer);
 }
 
 static bool vkms_get_vblank_timestamp(struct drm_crtc *crtc,
@@ -85,28 +73,9 @@ static bool vkms_get_vblank_timestamp(struct drm_crtc *crtc,
 				      bool in_vblank_irq)
 {
 	struct vkms_output *output = drm_crtc_to_vkms_output(crtc);
-	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
-
-	if (!READ_ONCE(vblank->enabled)) {
-		*vblank_time = ktime_get();
-		return true;
-	}
-
-	*vblank_time = READ_ONCE(output->vblank_hrtimer.node.expires);
 
-	if (WARN_ON(*vblank_time == vblank->time))
-		return true;
-
-	/*
-	 * To prevent races we roll the hrtimer forward before we do any
-	 * interrupt processing - this is how real hw works (the interrupt is
-	 * only generated after all the vblank registers are updated) and what
-	 * the vblank core expects. Therefore we need to always correct the
-	 * timestampe by one frame.
-	 */
-	*vblank_time -= output->period_ns;
-
-	return true;
+	return drm_vblank_timer_get_vblank_timestamp(&output->vtimer, max_error,
+						     vblank_time, in_vblank_irq);
 }
 
 static struct drm_crtc_state *
@@ -274,6 +243,7 @@ struct vkms_output *vkms_crtc_init(struct drm_device *dev, struct drm_plane *pri
 {
 	struct vkms_output *vkms_out;
 	struct drm_crtc *crtc;
+	struct drm_vblank_timer *vtimer;
 	int ret;
 
 	vkms_out = drmm_crtc_alloc_with_planes(dev, struct vkms_output, crtc,
@@ -285,6 +255,7 @@ struct vkms_output *vkms_crtc_init(struct drm_device *dev, struct drm_plane *pri
 	}
 
 	crtc = &vkms_out->crtc;
+	vtimer = &vkms_out->vtimer;
 
 	drm_crtc_helper_add(crtc, &vkms_crtc_helper_funcs);
 
@@ -305,5 +276,7 @@ struct vkms_output *vkms_crtc_init(struct drm_device *dev, struct drm_plane *pri
 	if (!vkms_out->composer_workq)
 		return ERR_PTR(-ENOMEM);
 
+	drmm_vblank_timer_init(vtimer, crtc, vkms_crtc_handle_vblank);
+
 	return vkms_out;
 }
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index a74a7fc3a056..126016898285 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -10,6 +10,7 @@
 #include <drm/drm_gem.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_encoder.h>
+#include <drm/drm_vblank_timer.h>
 #include <drm/drm_writeback.h>
 
 #define DEFAULT_DEVICE_NAME "vkms"
@@ -180,8 +181,9 @@ struct vkms_output {
 	struct drm_crtc crtc;
 	struct drm_writeback_connector wb_connector;
 	struct drm_encoder wb_encoder;
-	struct hrtimer vblank_hrtimer;
-	ktime_t period_ns;
+	struct drm_vblank_timer vtimer;
+	struct drm_pending_vblank_event *event;
+	/* ordered wq for composer_work */
 	struct workqueue_struct *composer_workq;
 	spinlock_t lock;
 
-- 
2.49.0

