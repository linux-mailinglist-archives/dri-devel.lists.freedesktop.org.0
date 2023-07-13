Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E074751B6E
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 10:24:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0C0410E5F5;
	Thu, 13 Jul 2023 08:24:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE7D910E626
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 08:24:50 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJrch-00060j-Vp; Thu, 13 Jul 2023 10:24:28 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJrch-00E4kK-7Q; Thu, 13 Jul 2023 10:24:27 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJrcg-004Vhl-I4; Thu, 13 Jul 2023 10:24:26 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "Russell King (Oracle)" <linux@armlinux.org.uk>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Julia Lawall <julia.lawall@inria.fr>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sui Jingfeng <suijingfeng@loongson.cn>,
 Luben Tuikov <luben.tuikov@amd.com>, Jani Nikula <jani.nikula@intel.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Sean Paul <seanpaul@chromium.org>, Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 17/17] drm/vblank_crtc: Rename struct drm_vblank_crtc::dev to
 drm
Date: Thu, 13 Jul 2023 10:24:08 +0200
Message-Id: <20230713082408.2266984-18-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230713082408.2266984-1-u.kleine-koenig@pengutronix.de>
References: <20230713082408.2266984-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4760;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=Wd0xW8yHKC8uHsToF/cS2FncD5+P2cYXJskTGCcSS/Y=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkr7ShmlRZtqfUvBLyNFx4SLtQ/vZSopj69UCzQ
 XDmyNqXWueJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZK+0oQAKCRCPgPtYfRL+
 TnzdCACfqI26iYix7kLA5Zp2vmncVy5K1whdGLSQBwK58mjcDLShIWjWg3MtRKRxu55f62jfGLi
 Mr4jR6XTGw/oZdXs6F01jk2GwyVh7BwV5/eoDyWyZ3IUAS5YfdWstfT2Fc44r1gbZjgDsnZdEXX
 fmq7e5PRhJ8l0cpGO8KXZxuH/x207isQmwaw8v8k/uW00R5obyXTfEGfM4qGRjQS5kHf66M0MK/
 KWZUyt8HkYu/aI7ZKu9BOMMV8PcO3ZpOiFF4eqXZ9MCc2qC0JZYlxzBwY+FSKe3Tj53c9QdpkTK
 eCUGxJW4INTDOX88wMXpQ8NvLQDz/q0Uwmh7KIwt5hhfIWWs
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

"dev" is usually used for struct device pointers. Using it for struct
drm_device pointers is irritating (for me at least). Replace it
by "drm" and adapt all users.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/drm_vblank.c      |  4 ++--
 drivers/gpu/drm/drm_vblank_work.c | 18 +++++++++---------
 include/drm/drm_vblank.h          |  4 ++--
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 87e305c8f7f6..351b0e3d1361 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -485,7 +485,7 @@ void drm_vblank_disable_and_save(struct drm_device *dev, unsigned int pipe)
 static void vblank_disable_fn(struct timer_list *t)
 {
 	struct drm_vblank_crtc *vblank = from_timer(vblank, t, disable_timer);
-	struct drm_device *dev = vblank->dev;
+	struct drm_device *dev = vblank->drm;
 	unsigned int pipe = vblank->pipe;
 	unsigned long irqflags;
 
@@ -537,7 +537,7 @@ int drm_vblank_init(struct drm_device *dev, unsigned int num_crtcs)
 	for (i = 0; i < num_crtcs; i++) {
 		struct drm_vblank_crtc *vblank = &dev->vblank[i];
 
-		vblank->dev = dev;
+		vblank->drm = dev;
 		vblank->pipe = i;
 		init_waitqueue_head(&vblank->queue);
 		timer_setup(&vblank->disable_timer, vblank_disable_fn, 0);
diff --git a/drivers/gpu/drm/drm_vblank_work.c b/drivers/gpu/drm/drm_vblank_work.c
index f6e024bed6b5..acd551ff247d 100644
--- a/drivers/gpu/drm/drm_vblank_work.c
+++ b/drivers/gpu/drm/drm_vblank_work.c
@@ -49,14 +49,14 @@ void drm_handle_vblank_works(struct drm_vblank_crtc *vblank)
 	u64 count = atomic64_read(&vblank->count);
 	bool wake = false;
 
-	assert_spin_locked(&vblank->dev->event_lock);
+	assert_spin_locked(&vblank->drm->event_lock);
 
 	list_for_each_entry_safe(work, next, &vblank->pending_work, node) {
 		if (!drm_vblank_passed(count, work->count))
 			continue;
 
 		list_del_init(&work->node);
-		drm_vblank_put(vblank->dev, vblank->pipe);
+		drm_vblank_put(vblank->drm, vblank->pipe);
 		kthread_queue_work(vblank->worker, &work->base);
 		wake = true;
 	}
@@ -71,11 +71,11 @@ void drm_vblank_cancel_pending_works(struct drm_vblank_crtc *vblank)
 {
 	struct drm_vblank_work *work, *next;
 
-	assert_spin_locked(&vblank->dev->event_lock);
+	assert_spin_locked(&vblank->drm->event_lock);
 
 	list_for_each_entry_safe(work, next, &vblank->pending_work, node) {
 		list_del_init(&work->node);
-		drm_vblank_put(vblank->dev, vblank->pipe);
+		drm_vblank_put(vblank->drm, vblank->pipe);
 	}
 
 	wake_up_all(&vblank->work_wait_queue);
@@ -107,7 +107,7 @@ int drm_vblank_work_schedule(struct drm_vblank_work *work,
 			     u64 count, bool nextonmiss)
 {
 	struct drm_vblank_crtc *vblank = work->vblank;
-	struct drm_device *dev = vblank->dev;
+	struct drm_device *dev = vblank->drm;
 	u64 cur_vbl;
 	unsigned long irqflags;
 	bool passed, inmodeset, rescheduling = false, wake = false;
@@ -182,13 +182,13 @@ EXPORT_SYMBOL(drm_vblank_work_schedule);
 bool drm_vblank_work_cancel_sync(struct drm_vblank_work *work)
 {
 	struct drm_vblank_crtc *vblank = work->vblank;
-	struct drm_device *dev = vblank->dev;
+	struct drm_device *dev = vblank->drm;
 	bool ret = false;
 
 	spin_lock_irq(&dev->event_lock);
 	if (!list_empty(&work->node)) {
 		list_del_init(&work->node);
-		drm_vblank_put(vblank->dev, vblank->pipe);
+		drm_vblank_put(vblank->drm, vblank->pipe);
 		ret = true;
 	}
 
@@ -218,7 +218,7 @@ EXPORT_SYMBOL(drm_vblank_work_cancel_sync);
 void drm_vblank_work_flush(struct drm_vblank_work *work)
 {
 	struct drm_vblank_crtc *vblank = work->vblank;
-	struct drm_device *dev = vblank->dev;
+	struct drm_device *dev = vblank->drm;
 
 	spin_lock_irq(&dev->event_lock);
 	wait_event_lock_irq(vblank->work_wait_queue, list_empty(&work->node),
@@ -253,7 +253,7 @@ int drm_vblank_worker_init(struct drm_vblank_crtc *vblank)
 	INIT_LIST_HEAD(&vblank->pending_work);
 	init_waitqueue_head(&vblank->work_wait_queue);
 	worker = kthread_create_worker(0, "card%d-crtc%d",
-				       vblank->dev->primary->index,
+				       vblank->drm->primary->index,
 				       vblank->pipe);
 	if (IS_ERR(worker))
 		return PTR_ERR(worker);
diff --git a/include/drm/drm_vblank.h b/include/drm/drm_vblank.h
index 7f3957943dd1..a89fc63a94f5 100644
--- a/include/drm/drm_vblank.h
+++ b/include/drm/drm_vblank.h
@@ -90,9 +90,9 @@ struct drm_pending_vblank_event {
  */
 struct drm_vblank_crtc {
 	/**
-	 * @dev: Pointer to the &drm_device.
+	 * @drm: Pointer to the &drm_device.
 	 */
-	struct drm_device *dev;
+	struct drm_device *drm;
 	/**
 	 * @queue: Wait queue for vblank waiters.
 	 */
-- 
2.39.2

