Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33AFC751B6F
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 10:24:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3928E10E626;
	Thu, 13 Jul 2023 08:24:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF05A10E627
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 08:24:50 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJrcg-0005xv-Ep; Thu, 13 Jul 2023 10:24:26 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJrcf-00E4ju-Hb; Thu, 13 Jul 2023 10:24:25 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJrce-004VhS-Qy; Thu, 13 Jul 2023 10:24:24 +0200
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
Subject: [PATCH 12/17] drm/master: Rename struct drm_master::dev to drm
Date: Thu, 13 Jul 2023 10:24:03 +0200
Message-Id: <20230713082408.2266984-13-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230713082408.2266984-1-u.kleine-koenig@pengutronix.de>
References: <20230713082408.2266984-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=6809;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=zue23WgFV0mXOzopxMZGE1Y356Xp1QLywHuAYSLQtYM=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkr7SYOPzSuw50H90BB4EbdpheGf/KNCcTI931H
 9mp0dj1/paJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZK+0mAAKCRCPgPtYfRL+
 Tp8XB/9Pa3gx1RxQhAsjstAjckd0FuMlrhupCy96MHPt4WmHvNob/3QVwfoudnMuE9fSAQwws7u
 g7xERx94P4cMX3X/mvMeSWQnU6+V/PTOXgNZDUFRUNqHT9bNK+62k+etwRpSIvcqxcryhJvmsvb
 rbH3z1gZqOejOcoOeIEFbMdHmBoE+JxKXxHoPmhYSb5bPZtdyK2v2H4+TJRrvCKp9wNvZArlCbj
 L4eSyDNEEgf3ezXDCcreHJEYu7FnOZyaU/G/vvZkZQgBvj419VjkUGTrE8NLyQt7lcBWlsC8OqW
 T18RF49lpxL+xRNkU49EUV6JgDeexxS1zxF/Y9j6MYyle0bF
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
 drivers/gpu/drm/drm_auth.c  |  4 ++--
 drivers/gpu/drm/drm_lease.c | 32 ++++++++++++++++----------------
 include/drm/drm_auth.h      |  4 ++--
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
index cf92a9ae8034..c37032bccd0f 100644
--- a/drivers/gpu/drm/drm_auth.c
+++ b/drivers/gpu/drm/drm_auth.c
@@ -141,7 +141,7 @@ struct drm_master *drm_master_create(struct drm_device *dev)
 	kref_init(&master->refcount);
 	drm_master_legacy_init(master);
 	idr_init_base(&master->magic_map, 1);
-	master->dev = dev;
+	master->drm = dev;
 
 	/* initialize the tree of output resource lessees */
 	INIT_LIST_HEAD(&master->lessees);
@@ -423,7 +423,7 @@ EXPORT_SYMBOL(drm_file_get_master);
 static void drm_master_destroy(struct kref *kref)
 {
 	struct drm_master *master = container_of(kref, struct drm_master, refcount);
-	struct drm_device *dev = master->dev;
+	struct drm_device *dev = master->drm;
 
 	if (drm_core_check_feature(dev, DRIVER_MODESET))
 		drm_lease_destroy(master);
diff --git a/drivers/gpu/drm/drm_lease.c b/drivers/gpu/drm/drm_lease.c
index 150fe1555068..02d240897871 100644
--- a/drivers/gpu/drm/drm_lease.c
+++ b/drivers/gpu/drm/drm_lease.c
@@ -81,13 +81,13 @@ struct drm_master *drm_lease_owner(struct drm_master *master)
 static struct drm_master*
 _drm_find_lessee(struct drm_master *master, int lessee_id)
 {
-	lockdep_assert_held(&master->dev->mode_config.idr_mutex);
+	lockdep_assert_held(&master->drm->mode_config.idr_mutex);
 	return idr_find(&drm_lease_owner(master)->lessee_idr, lessee_id);
 }
 
 static int _drm_lease_held_master(struct drm_master *master, int id)
 {
-	lockdep_assert_held(&master->dev->mode_config.idr_mutex);
+	lockdep_assert_held(&master->drm->mode_config.idr_mutex);
 	if (master->lessor)
 		return idr_find(&master->leases, id) != NULL;
 	return true;
@@ -98,7 +98,7 @@ static bool _drm_has_leased(struct drm_master *master, int id)
 {
 	struct drm_master *lessee;
 
-	lockdep_assert_held(&master->dev->mode_config.idr_mutex);
+	lockdep_assert_held(&master->drm->mode_config.idr_mutex);
 	drm_for_each_lessee(lessee, master)
 		if (_drm_lease_held_master(lessee, id))
 			return true;
@@ -138,9 +138,9 @@ bool drm_lease_held(struct drm_file *file_priv, int id)
 		ret = true;
 		goto out;
 	}
-	mutex_lock(&master->dev->mode_config.idr_mutex);
+	mutex_lock(&master->drm->mode_config.idr_mutex);
 	ret = _drm_lease_held_master(master, id);
-	mutex_unlock(&master->dev->mode_config.idr_mutex);
+	mutex_unlock(&master->drm->mode_config.idr_mutex);
 
 out:
 	drm_master_put(&master);
@@ -169,10 +169,10 @@ uint32_t drm_lease_filter_crtcs(struct drm_file *file_priv, uint32_t crtcs_in)
 		crtcs_out = crtcs_in;
 		goto out;
 	}
-	dev = master->dev;
+	dev = master->drm;
 
 	count_in = count_out = 0;
-	mutex_lock(&master->dev->mode_config.idr_mutex);
+	mutex_lock(&master->drm->mode_config.idr_mutex);
 	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
 		if (_drm_lease_held_master(master, crtc->base.id)) {
 			uint32_t mask_in = 1ul << count_in;
@@ -186,7 +186,7 @@ uint32_t drm_lease_filter_crtcs(struct drm_file *file_priv, uint32_t crtcs_in)
 		}
 		count_in++;
 	}
-	mutex_unlock(&master->dev->mode_config.idr_mutex);
+	mutex_unlock(&master->drm->mode_config.idr_mutex);
 
 out:
 	drm_master_put(&master);
@@ -206,7 +206,7 @@ uint32_t drm_lease_filter_crtcs(struct drm_file *file_priv, uint32_t crtcs_in)
  */
 static struct drm_master *drm_lease_create(struct drm_master *lessor, struct idr *leases)
 {
-	struct drm_device *dev = lessor->dev;
+	struct drm_device *dev = lessor->drm;
 	int error;
 	struct drm_master *lessee;
 	int object;
@@ -215,7 +215,7 @@ static struct drm_master *drm_lease_create(struct drm_master *lessor, struct idr
 
 	drm_dbg_lease(dev, "lessor %d\n", lessor->lessee_id);
 
-	lessee = drm_master_create(lessor->dev);
+	lessee = drm_master_create(lessor->drm);
 	if (!lessee) {
 		drm_dbg_lease(dev, "drm_master_create failed\n");
 		return ERR_PTR(-ENOMEM);
@@ -265,7 +265,7 @@ static struct drm_master *drm_lease_create(struct drm_master *lessor, struct idr
 
 void drm_lease_destroy(struct drm_master *master)
 {
-	struct drm_device *dev = master->dev;
+	struct drm_device *dev = master->drm;
 
 	mutex_lock(&dev->mode_config.idr_mutex);
 
@@ -303,14 +303,14 @@ static void _drm_lease_revoke(struct drm_master *top)
 	void *entry;
 	struct drm_master *master = top;
 
-	lockdep_assert_held(&top->dev->mode_config.idr_mutex);
+	lockdep_assert_held(&top->drm->mode_config.idr_mutex);
 
 	/*
 	 * Walk the tree starting at 'top' emptying all leases. Because
 	 * the tree is fully connected, we can do this without recursing
 	 */
 	for (;;) {
-		drm_dbg_lease(master->dev, "revoke leases for %p %d\n",
+		drm_dbg_lease(master->drm, "revoke leases for %p %d\n",
 			      master, master->lessee_id);
 
 		/* Evacuate the lease */
@@ -338,9 +338,9 @@ static void _drm_lease_revoke(struct drm_master *top)
 
 void drm_lease_revoke(struct drm_master *top)
 {
-	mutex_lock(&top->dev->mode_config.idr_mutex);
+	mutex_lock(&top->drm->mode_config.idr_mutex);
 	_drm_lease_revoke(top);
-	mutex_unlock(&top->dev->mode_config.idr_mutex);
+	mutex_unlock(&top->drm->mode_config.idr_mutex);
 }
 
 static int validate_lease(struct drm_device *dev,
@@ -661,7 +661,7 @@ int drm_mode_get_lease_ioctl(struct drm_device *dev,
 
 	if (lessee->lessor == NULL)
 		/* owner can use all objects */
-		object_idr = &lessee->dev->mode_config.object_idr;
+		object_idr = &lessee->drm->mode_config.object_idr;
 	else
 		/* lessee can only use allowed object */
 		object_idr = &lessee->leases;
diff --git a/include/drm/drm_auth.h b/include/drm/drm_auth.h
index ba248ca8866f..cae829079594 100644
--- a/include/drm/drm_auth.h
+++ b/include/drm/drm_auth.h
@@ -56,7 +56,7 @@ struct drm_lock_data {
  * struct drm_master - drm master structure
  *
  * @refcount: Refcount for this master object.
- * @dev: Link back to the DRM device
+ * @drm: Link back to the DRM device
  * @driver_priv: Pointer to driver-private information.
  *
  * Note that master structures are only relevant for the legacy/primary device
@@ -64,7 +64,7 @@ struct drm_lock_data {
  */
 struct drm_master {
 	struct kref refcount;
-	struct drm_device *dev;
+	struct drm_device *drm;
 	/**
 	 * @unique: Unique identifier: e.g. busid. Protected by
 	 * &drm_device.master_mutex.
-- 
2.39.2

