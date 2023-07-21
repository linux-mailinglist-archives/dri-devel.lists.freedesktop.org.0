Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D3275D669
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 23:22:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7EA010E705;
	Fri, 21 Jul 2023 21:22:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EB8C10E705
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 21:22:11 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qMxZZ-0000wV-Ji; Fri, 21 Jul 2023 23:22:01 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qMxZW-0019cC-OX; Fri, 21 Jul 2023 23:21:58 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qMxZW-006k8d-2D; Fri, 21 Jul 2023 23:21:58 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH] drm/i915: Simplify expression &to_i915(dev)->drm
Date: Fri, 21 Jul 2023 23:21:33 +0200
Message-Id: <20230721212133.271118-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3495;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=sbqmHRZcBD5P/0WSezlMKbc3YcLiLV4w/2PhjjasNY8=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkuvbX/XjFSvuiwhOUVRGqeuARYdOIVFVqiHH3H
 ucQAr7n/a2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZLr21wAKCRCPgPtYfRL+
 TpmtCACAt4uPS9DIsDK9Zaotc+8Cmln8erQr6UcTILfN2LRSqHbhBZjDhjD0LzuAGnyIdrcxDOm
 N+tEgPz0VgvpaMxmhAj6xgNBvnROX/RombGe9/4jwWSDw0UvY8COlg1lq+zt1ZNJXYy8TUg63Xl
 SLLBIEMmhxnkyIAUhxQ77cjj18gyVPg7XIFhloVqkZH1oHUN6cE/m5LMv0MUZ9xCuE57j3l/yXZ
 cEl6FXKX0UG+EpF8U1y0lWHVZ7/Fn7n3tLLo3V+6HA1VJ8et1D2Y6V+9XNXHQHlr3HYmL00O7Ap
 7EEl+bYFf5UQqjByi0vPYw52wxhyZheIygtgxw4y8d7lJctD
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
Cc: intel-gfx@lists.freedesktop.org, kernel@pengutronix.de,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

to_i915 is defined as

	container_of(dev, struct drm_i915_private, drm);

So for a struct drm_device *dev, to_i915(dev)->drm is just dev. Simplify
accordingly.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/i915/display/intel_display_debugfs.c | 6 ++----
 drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c         | 2 +-
 drivers/gpu/drm/i915/i915_vma.c                      | 6 +++---
 3 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
index 165e2c7e3126..63c1fb9e479f 100644
--- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
+++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
@@ -819,8 +819,7 @@ static ssize_t i915_displayport_test_active_write(struct file *file,
 	if (IS_ERR(input_buffer))
 		return PTR_ERR(input_buffer);
 
-	drm_dbg(&to_i915(dev)->drm,
-		"Copied %d bytes from user\n", (unsigned int)len);
+	drm_dbg(dev, "Copied %d bytes from user\n", (unsigned int)len);
 
 	drm_connector_list_iter_begin(dev, &conn_iter);
 	drm_for_each_connector_iter(connector, &conn_iter) {
@@ -839,8 +838,7 @@ static ssize_t i915_displayport_test_active_write(struct file *file,
 			status = kstrtoint(input_buffer, 10, &val);
 			if (status < 0)
 				break;
-			drm_dbg(&to_i915(dev)->drm,
-				"Got %d for test active\n", val);
+			drm_dbg(dev, "Got %d for test active\n", val);
 			/* To prevent erroneous activation of the compliance
 			 * testing code, only accept an actual value of 1 here
 			 */
diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c b/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
index 37d0b0fe791d..40371b8a9bbb 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
@@ -818,7 +818,7 @@ i915_gem_object_save_bit_17_swizzle(struct drm_i915_gem_object *obj,
 	if (obj->bit_17 == NULL) {
 		obj->bit_17 = bitmap_zalloc(page_count, GFP_KERNEL);
 		if (obj->bit_17 == NULL) {
-			drm_err(&to_i915(obj->base.dev)->drm,
+			drm_err(obj->base.dev,
 				"Failed to allocate memory for bit 17 record\n");
 			return;
 		}
diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index ffb425ba591c..af2e49f90f2f 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -74,14 +74,14 @@ static void vma_print_allocator(struct i915_vma *vma, const char *reason)
 	char buf[512];
 
 	if (!vma->node.stack) {
-		drm_dbg(&to_i915(vma->obj->base.dev)->drm,
+		drm_dbg(vma->obj->base.dev,
 			"vma.node [%08llx + %08llx] %s: unknown owner\n",
 			vma->node.start, vma->node.size, reason);
 		return;
 	}
 
 	stack_depot_snprint(vma->node.stack, buf, sizeof(buf), 0);
-	drm_dbg(&to_i915(vma->obj->base.dev)->drm,
+	drm_dbg(vma->obj->base.dev,
 		"vma.node [%08llx + %08llx] %s: inserted at %s\n",
 		vma->node.start, vma->node.size, reason, buf);
 }
@@ -805,7 +805,7 @@ i915_vma_insert(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
 	 * attempt to find space.
 	 */
 	if (size > end - 2 * guard) {
-		drm_dbg(&to_i915(vma->obj->base.dev)->drm,
+		drm_dbg(vma->obj->base.dev,
 			"Attempting to bind an object larger than the aperture: request=%llu > %s aperture=%llu\n",
 			size, flags & PIN_MAPPABLE ? "mappable" : "total", end);
 		return -ENOSPC;

base-commit: 85a241cb128ac449b301d5b7da16a7c11f5fc094
-- 
2.39.2

