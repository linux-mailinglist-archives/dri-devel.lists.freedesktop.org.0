Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAABAD02AE
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 14:59:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0622310E36F;
	Fri,  6 Jun 2025 12:59:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="thPak1wp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YcKnOUDP";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="thPak1wp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YcKnOUDP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BB0F10E36F
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jun 2025 12:59:39 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B52251FD85;
 Fri,  6 Jun 2025 12:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749214774; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=z5lYcTddPKhjIyAoVlQU6cj5CQGac8YbJHYY0qfaozc=;
 b=thPak1wpQF2el8Rjj/iKY6jH9phaMbwtS4/Ny/Gqkx/37OOOJslusUocyiAU/Njh8u0LCp
 YtOro1SJ/7wAMXKzrMSUB7jr1Tdj0KodfDvVmyHMj6kKIqrmIFicKhwNIPcwa0mYvM6aoH
 58s+ZtVq57250m2uyOXHj2pVcS8nWgQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749214774;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=z5lYcTddPKhjIyAoVlQU6cj5CQGac8YbJHYY0qfaozc=;
 b=YcKnOUDP5MPMFRUcaUIR6b1zifqPaFxqKOscJbvomOng9YWCHisXC10Lb3wIOUsLHTWsqj
 9UPwXCCu4Agk2kCg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=thPak1wp;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=YcKnOUDP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749214774; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=z5lYcTddPKhjIyAoVlQU6cj5CQGac8YbJHYY0qfaozc=;
 b=thPak1wpQF2el8Rjj/iKY6jH9phaMbwtS4/Ny/Gqkx/37OOOJslusUocyiAU/Njh8u0LCp
 YtOro1SJ/7wAMXKzrMSUB7jr1Tdj0KodfDvVmyHMj6kKIqrmIFicKhwNIPcwa0mYvM6aoH
 58s+ZtVq57250m2uyOXHj2pVcS8nWgQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749214774;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=z5lYcTddPKhjIyAoVlQU6cj5CQGac8YbJHYY0qfaozc=;
 b=YcKnOUDP5MPMFRUcaUIR6b1zifqPaFxqKOscJbvomOng9YWCHisXC10Lb3wIOUsLHTWsqj
 9UPwXCCu4Agk2kCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7BFFC1369F;
 Fri,  6 Jun 2025 12:59:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id /zT3HDbmQmjBbwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 06 Jun 2025 12:59:34 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: ville.syrjala@linux.intel.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm/vblank: Unexport drm_wait_one_vblank()
Date: Fri,  6 Jun 2025 14:55:36 +0200
Message-ID: <20250606125555.27070-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid,suse.de:email];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU]; ARC_NA(0.00)[];
 RCVD_TLS_ALL(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 RCPT_COUNT_SEVEN(0.00)[7];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCVD_COUNT_TWO(0.00)[2];
 FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 FROM_EQ_ENVFROM(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 FROM_HAS_DN(0.00)[]; DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: B52251FD85
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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

Make drm_wait_on_vblank() static. The function is an internal interface
and not invoked directly by drivers.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_vblank.c | 14 +-------------
 include/drm/drm_vblank.h     |  1 -
 2 files changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 78958ddf8485..f2ccab24e1d9 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -1273,18 +1273,7 @@ void drm_crtc_vblank_put(struct drm_crtc *crtc)
 }
 EXPORT_SYMBOL(drm_crtc_vblank_put);
 
-/**
- * drm_wait_one_vblank - wait for one vblank
- * @dev: DRM device
- * @pipe: CRTC index
- *
- * This waits for one vblank to pass on @pipe, using the irq driver interfaces.
- * It is a failure to call this when the vblank irq for @pipe is disabled, e.g.
- * due to lack of driver support or because the crtc is off.
- *
- * This is the legacy version of drm_crtc_wait_one_vblank().
- */
-void drm_wait_one_vblank(struct drm_device *dev, unsigned int pipe)
+static void drm_wait_one_vblank(struct drm_device *dev, unsigned int pipe)
 {
 	struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
 	int ret;
@@ -1308,7 +1297,6 @@ void drm_wait_one_vblank(struct drm_device *dev, unsigned int pipe)
 
 	drm_vblank_put(dev, pipe);
 }
-EXPORT_SYMBOL(drm_wait_one_vblank);
 
 /**
  * drm_crtc_wait_one_vblank - wait for one vblank
diff --git a/include/drm/drm_vblank.h b/include/drm/drm_vblank.h
index 151ab1e85b1b..72e727f1a599 100644
--- a/include/drm/drm_vblank.h
+++ b/include/drm/drm_vblank.h
@@ -274,7 +274,6 @@ bool drm_handle_vblank(struct drm_device *dev, unsigned int pipe);
 bool drm_crtc_handle_vblank(struct drm_crtc *crtc);
 int drm_crtc_vblank_get(struct drm_crtc *crtc);
 void drm_crtc_vblank_put(struct drm_crtc *crtc);
-void drm_wait_one_vblank(struct drm_device *dev, unsigned int pipe);
 void drm_crtc_wait_one_vblank(struct drm_crtc *crtc);
 void drm_crtc_vblank_off(struct drm_crtc *crtc);
 void drm_crtc_vblank_reset(struct drm_crtc *crtc);
-- 
2.49.0

