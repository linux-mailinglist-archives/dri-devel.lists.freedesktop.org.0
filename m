Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4AE62F649
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 14:35:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2135710E73E;
	Fri, 18 Nov 2022 13:35:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6DCF10E73D
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 13:35:39 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 218FF22811;
 Fri, 18 Nov 2022 13:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1668778538; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2SaJGSuEq70+ztl7mqnPMjPAV3YObNsiD/W/hn/Oj7A=;
 b=u7v8pHY60slLt3P7JcWLKPZAHXfjZQ9P/MQczVAJI9wxs+VSI9jW1+8VCNvCi+9FzBT1vA
 albE8SFltzj+QfXzoRUrhCZ0hnW3iWr5sE0/pMdfvdLImvQfV2co4R2jKH0OTchLIu/KmJ
 Fv6LmoL9dCBaYMLJZAkfwUjJSCwhtwo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1668778538;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2SaJGSuEq70+ztl7mqnPMjPAV3YObNsiD/W/hn/Oj7A=;
 b=QpTENXTcjcAHbbEqCborwztC2fMg1FQ2k/8ymmlBdJowJPJkxedzYvndma6QwL7NdOVulq
 arWUATdLjbG3S9DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F1D4413A66;
 Fri, 18 Nov 2022 13:35:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id cAsdOimKd2PHLAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 18 Nov 2022 13:35:37 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org
Subject: [PATCH 1/3] Revert "drm/fb-helper: Remove damage worker"
Date: Fri, 18 Nov 2022 14:35:33 +0100
Message-Id: <20221118133535.9739-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221118133535.9739-1-tzimmermann@suse.de>
References: <20221118133535.9739-1-tzimmermann@suse.de>
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

This reverts commit 27c3e9452d552ea86369a94f23287a9675f2d7a1.

Needed to restore the fbdev damage worker. There have been bug reports
about locking order [1] and incorrectly takens branches. [2] Restore
the damage worker until these problems have been resovled.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: https://intel-gfx-ci.01.org/tree/drm-tip/fi-kbl-8809g.html # 1
Link: https://lore.kernel.org/dri-devel/20221115115819.23088-6-tzimmermann@suse.de/T/#m06eedc0a468940e4cbbd14ca026733b639bc445a # 2
---
 drivers/gpu/drm/drm_fb_helper.c | 9 +++++++++
 include/drm/drm_fb_helper.h     | 2 ++
 2 files changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index a1f86e436ae8e..c0e9a977a3b3c 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -403,6 +403,13 @@ static void drm_fb_helper_fb_dirty(struct drm_fb_helper *helper)
 	spin_unlock_irqrestore(&helper->damage_lock, flags);
 }
 
+static void drm_fb_helper_damage_work(struct work_struct *work)
+{
+	struct drm_fb_helper *helper = container_of(work, struct drm_fb_helper, damage_work);
+
+	drm_fb_helper_fb_dirty(helper);
+}
+
 /**
  * drm_fb_helper_prepare - setup a drm_fb_helper structure
  * @dev: DRM device
@@ -418,6 +425,7 @@ void drm_fb_helper_prepare(struct drm_device *dev, struct drm_fb_helper *helper,
 	INIT_LIST_HEAD(&helper->kernel_fb_list);
 	spin_lock_init(&helper->damage_lock);
 	INIT_WORK(&helper->resume_work, drm_fb_helper_resume_worker);
+	INIT_WORK(&helper->damage_work, drm_fb_helper_damage_work);
 	helper->damage_clip.x1 = helper->damage_clip.y1 = ~0;
 	mutex_init(&helper->lock);
 	helper->funcs = funcs;
@@ -549,6 +557,7 @@ void drm_fb_helper_fini(struct drm_fb_helper *fb_helper)
 		return;
 
 	cancel_work_sync(&fb_helper->resume_work);
+	cancel_work_sync(&fb_helper->damage_work);
 
 	info = fb_helper->info;
 	if (info) {
diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
index 455f6c2b8117a..b111dc7ada78d 100644
--- a/include/drm/drm_fb_helper.h
+++ b/include/drm/drm_fb_helper.h
@@ -116,6 +116,7 @@ struct drm_fb_helper_funcs {
  * @damage_clip: clip rectangle used with deferred_io to accumulate damage to
  *                the screen buffer
  * @damage_lock: spinlock protecting @damage_clip
+ * @damage_work: worker used to flush the framebuffer
  * @resume_work: worker used during resume if the console lock is already taken
  *
  * This is the main structure used by the fbdev helpers. Drivers supporting
@@ -145,6 +146,7 @@ struct drm_fb_helper {
 	u32 pseudo_palette[17];
 	struct drm_clip_rect damage_clip;
 	spinlock_t damage_lock;
+	struct work_struct damage_work;
 	struct work_struct resume_work;
 
 	/**
-- 
2.38.1

