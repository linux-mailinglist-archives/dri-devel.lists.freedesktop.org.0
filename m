Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C85D7503C0
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 11:48:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BA1710E4B8;
	Wed, 12 Jul 2023 09:47:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0825410E3FB
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 09:47:24 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRJ-0001h0-4H; Wed, 12 Jul 2023 11:47:17 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRH-00Dr77-F2; Wed, 12 Jul 2023 11:47:15 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRG-004GVA-OK; Wed, 12 Jul 2023 11:47:14 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH RFC v1 52/52] drm/crtc: Complete renaming struct drm_crtc::dev
 to drm_dev
Date: Wed, 12 Jul 2023 11:47:02 +0200
Message-Id: <20230712094702.1770121-53-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1007;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=ue665e+Zf/92qnWwlUC4hFGdRhoJDAD7yvKUHU5HyOM=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkrnaSMO4JA+Z7H5bMX5/bUq57OA+Zn+BkYUbNy
 Zyn9rVE4AuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZK52kgAKCRCPgPtYfRL+
 TqxWCACSppBAucsymTjkdVa2BUvyG/WVGmY8S80yIV9G9Xa/zGpEDlw1WfzZ0G6w/axt8XaflAs
 Q/HjW/aNJuLrWDAWeRDsBZ9buknnuOQdxcbT/WI/zgSwwaQQvoeqAjyZ4JL/eJuQ51TrYxctS+M
 MZl4OhKdBmXUS6twd0RIU1ZC31xRczugL39W+7KS7oL2xlgWKgIHrIZ1/YjA+LbLxeB47WZaN7r
 h49ws6F6dWdof1imllmMChDm/zt8Zn7S+UKQGRGmJdDgkpsR8xrXgslYfDjxlPWkbS9q1O49Vb+
 lIt6/jWM+TwH7uNHB/ABSxnMn9WgbleqCbxt5XeeY4OmuR5f
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

Now that all drivers use the new and better name, the old one can be
dropped.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 include/drm/drm_crtc.h | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index 66b65108024e..33a6e90f8d19 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -936,15 +936,7 @@ struct drm_crtc_funcs {
  */
 struct drm_crtc {
 	/** @drm_dev: parent DRM device */
-	union {
-		/* "dev" is a name that is typically (only) used for struct
-		 * device pointers. It's about to be renamed to "drm_dev" to be
-		 * easier to parse for humans. To not have to convert all
-		 * drivers in a single step keep the old name around for now.
-		 */
-		struct drm_device *drm_dev;
-		struct drm_device *dev;
-	};
+	struct drm_device *drm_dev;
 	/** @port: OF node used by drm_of_find_possible_crtcs(). */
 	struct device_node *port;
 	/**
-- 
2.39.2

