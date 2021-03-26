Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8200B34A5A5
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 11:32:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B39EB6F3B5;
	Fri, 26 Mar 2021 10:32:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BAAA6F3B5
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 10:32:25 +0000 (UTC)
Received: from guri.fritz.box (unknown
 [IPv6:2a02:810a:880:f54:c9ad:9cf9:303d:3688])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: dafna)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 805711F46CA2;
 Fri, 26 Mar 2021 10:32:23 +0000 (GMT)
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm: Fix 3 typos in the inline doc
Date: Fri, 26 Mar 2021 11:32:15 +0100
Message-Id: <20210326103216.7918-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
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
Cc: dafna.hirschfeld@collabora.com, airlied@linux.ie, dafna3@gmail.com,
 laurent.pinchart@ideasonboard.com, tzimmermann@suse.de,
 enric.balletbo@collabora.com, kernel@collabora.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following typos:

1. When mentioning a list of functions, the function
drm_atomic_helper_disable_plane is mentioned twice.

2. drop the word 'afterwards':
s/afterwards after that/after that/'

3. drop extra 'the':
s/but do not the support the full/but do not support the full/

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/gpu/drm/drm_atomic_helper.c | 15 +++++++--------
 include/drm/drm_drv.h               |  2 +-
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 560aaecba31b..eb527b63ceaa 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -61,9 +61,9 @@
  *
  * This library also provides implementations for all the legacy driver
  * interfaces on top of the atomic interface. See drm_atomic_helper_set_config(),
- * drm_atomic_helper_disable_plane(), drm_atomic_helper_disable_plane() and the
- * various functions to implement set_property callbacks. New drivers must not
- * implement these functions themselves but must use the provided helpers.
+ * drm_atomic_helper_disable_plane(), and the various functions to implement
+ * set_property callbacks. New drivers must not implement these functions
+ * themselves but must use the provided helpers.
  *
  * The atomic helper uses the same function table structures as all other
  * modesetting helpers. See the documentation for &struct drm_crtc_helper_funcs,
@@ -592,11 +592,10 @@ mode_valid(struct drm_atomic_state *state)
  *
  * Drivers which set &drm_crtc_state.mode_changed (e.g. in their
  * &drm_plane_helper_funcs.atomic_check hooks if a plane update can't be done
- * without a full modeset) _must_ call this function afterwards after that
- * change. It is permitted to call this function multiple times for the same
- * update, e.g. when the &drm_crtc_helper_funcs.atomic_check functions depend
- * upon the adjusted dotclock for fifo space allocation and watermark
- * computation.
+ * without a full modeset) _must_ call this function after that change. It is
+ * permitted to call this function multiple times for the same update, e.g.
+ * when the &drm_crtc_helper_funcs.atomic_check functions depend upon the
+ * adjusted dotclock for fifo space allocation and watermark computation.
  *
  * RETURNS:
  * Zero for success or -errno
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index 827838e0a97e..b439ae1921b8 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -74,7 +74,7 @@ enum drm_driver_feature {
 	 * @DRIVER_ATOMIC:
 	 *
 	 * Driver supports the full atomic modesetting userspace API. Drivers
-	 * which only use atomic internally, but do not the support the full
+	 * which only use atomic internally, but do not support the full
 	 * userspace API (e.g. not all properties converted to atomic, or
 	 * multi-plane updates are not guaranteed to be tear-free) should not
 	 * set this flag.
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
