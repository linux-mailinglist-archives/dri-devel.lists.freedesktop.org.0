Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A8C750397
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 11:47:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEAA110E3E6;
	Wed, 12 Jul 2023 09:47:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A796010E3F0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 09:47:15 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWR9-0001G7-4n; Wed, 12 Jul 2023 11:47:07 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWR7-00Dr32-PC; Wed, 12 Jul 2023 11:47:05 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWR6-004GS0-WA; Wed, 12 Jul 2023 11:47:05 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH RFC v1 01/52] drm/crtc: Start renaming struct drm_crtc::dev to
 drm_dev
Date: Wed, 12 Jul 2023 11:46:11 +0200
Message-Id: <20230712094702.1770121-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1226;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=nPtmTl3kpoxhfYP7T8CubA998XsOq6HnatfsASqDzNs=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkrnZXwGB6BbWds1gwhuxSMHsQ+T0GrKAtaanj8
 FnM4pODGXSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZK52VwAKCRCPgPtYfRL+
 TpLQB/9l7sYQnCXrXirIYRYJGLaIXNjuwfPSgbe438iRU0llR/zzWiJOKYqfME85J6xo9UQdiSx
 MLoZO6ixmQgJpS8P51rqXjRjyKaMlteSNgnUtAweE5yGet/rWM37Bh9b0GKXd4LF8Awu2Jx8IfV
 AzPKI19eHjz/1H5FEEdd8tVfVw/TtemoOfmM5usDu3o70P+tes3Aq8Ik1zzVLL/2Cc1nbq1k8Kf
 DDAoPP8idYeLfFwN4qMphRdAP0A/pppnaDDTk8bzyzECIxknxKeNP8wr0x9xI5As0vcoxovL9P1
 y79NpXJC77HjeDDr0vM9+751ZlWOlQFhYV5XlIusMh247sWO
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
drm_device pointers is irritating (for me at least). Introduce a
"drm_dev" as an alias with the intention to remove "dev" once all
drivers are adapted.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 include/drm/drm_crtc.h | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index 8e1cbc75143e..66b65108024e 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -935,8 +935,16 @@ struct drm_crtc_funcs {
  * allows the CRTC to be controlled.
  */
 struct drm_crtc {
-	/** @dev: parent DRM device */
-	struct drm_device *dev;
+	/** @drm_dev: parent DRM device */
+	union {
+		/* "dev" is a name that is typically (only) used for struct
+		 * device pointers. It's about to be renamed to "drm_dev" to be
+		 * easier to parse for humans. To not have to convert all
+		 * drivers in a single step keep the old name around for now.
+		 */
+		struct drm_device *drm_dev;
+		struct drm_device *dev;
+	};
 	/** @port: OF node used by drm_of_find_possible_crtcs(). */
 	struct device_node *port;
 	/**
-- 
2.39.2

