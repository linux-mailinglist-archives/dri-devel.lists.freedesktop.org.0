Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 464F2751B76
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 10:25:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 856F710E62B;
	Thu, 13 Jul 2023 08:25:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C3AD10E627
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 08:25:05 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJrch-0005zd-I8; Thu, 13 Jul 2023 10:24:27 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJrcg-00E4kB-Ki; Thu, 13 Jul 2023 10:24:26 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJrcf-004Vhe-Sp; Thu, 13 Jul 2023 10:24:25 +0200
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
Subject: [PATCH 15/17] drm/property_blob: Rename struct drm_property_blob::dev
 to drm
Date: Thu, 13 Jul 2023 10:24:06 +0200
Message-Id: <20230713082408.2266984-16-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230713082408.2266984-1-u.kleine-koenig@pengutronix.de>
References: <20230713082408.2266984-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2208;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=BvR/QEocHu3OeWqAz/vmlTZFNDu1xtjB/wxM1QxICQg=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkr7SdWg/5fAmvH4zLByYhq1435qg26nThNtlYF
 exLc5KZD7SJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZK+0nQAKCRCPgPtYfRL+
 Ti8AB/9MfNcEm691uCRfNu8iqeVzLtGMintHfWtJpf9HIg8Mt3Qz1/fZTlLJ3uA3jNLbcEc2CLO
 ScK/EOYBNAGt6gR+A9F8GFbK1k9P+vHtkD0ihix/7Pza0KXspoCMLiT30nC5Bx0MP0R4KtorlBS
 ecXDvAoAX80RO3NM34MG7/LFaw9TyGU8CzP49JRRtoptWkPqcYF0sBPLu8gCMiMyfS8dn2dtF8R
 vfaeLYZ6ixZMkzToZRr9wovXUhAipixFyA1Bx8CeyQ7fLPixQNVxZD/QVDm1F+SM16+hLVe2D0z
 Xs8GY/TKxc7XSMVhA5DKuXk8uFTXxuhxidVLO2dNaOOALtx8
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
 drivers/gpu/drm/drm_property.c | 8 ++++----
 include/drm/drm_property.h     | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_property.c b/drivers/gpu/drm/drm_property.c
index dfec479830e4..ab533c5b8cd4 100644
--- a/drivers/gpu/drm/drm_property.c
+++ b/drivers/gpu/drm/drm_property.c
@@ -528,11 +528,11 @@ static void drm_property_free_blob(struct kref *kref)
 	struct drm_property_blob *blob =
 		container_of(kref, struct drm_property_blob, base.refcount);
 
-	mutex_lock(&blob->dev->mode_config.blob_lock);
+	mutex_lock(&blob->drm->mode_config.blob_lock);
 	list_del(&blob->head_global);
-	mutex_unlock(&blob->dev->mode_config.blob_lock);
+	mutex_unlock(&blob->drm->mode_config.blob_lock);
 
-	drm_mode_object_unregister(blob->dev, &blob->base);
+	drm_mode_object_unregister(blob->drm, &blob->base);
 
 	kvfree(blob);
 }
@@ -570,7 +570,7 @@ drm_property_create_blob(struct drm_device *dev, size_t length,
 	INIT_LIST_HEAD(&blob->head_file);
 	blob->data = (void *)blob + sizeof(*blob);
 	blob->length = length;
-	blob->dev = dev;
+	blob->drm = dev;
 
 	if (data)
 		memcpy(blob->data, data, length);
diff --git a/include/drm/drm_property.h b/include/drm/drm_property.h
index 65bc9710a470..c6b570a8459e 100644
--- a/include/drm/drm_property.h
+++ b/include/drm/drm_property.h
@@ -200,7 +200,7 @@ struct drm_property {
 /**
  * struct drm_property_blob - Blob data for &drm_property
  * @base: base KMS object
- * @dev: DRM device
+ * @drm: DRM device
  * @head_global: entry on the global blob list in
  * 	&drm_mode_config.property_blob_list.
  * @head_file: entry on the per-file blob list in &drm_file.blobs list.
@@ -215,7 +215,7 @@ struct drm_property {
  */
 struct drm_property_blob {
 	struct drm_mode_object base;
-	struct drm_device *dev;
+	struct drm_device *drm;
 	struct list_head head_global;
 	struct list_head head_file;
 	size_t length;
-- 
2.39.2

