Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 690AF733299
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 15:54:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B18D10E624;
	Fri, 16 Jun 2023 13:54:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC66210E638
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 13:54:23 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:973f:5136:97a4:2046])
 by baptiste.telenet-ops.be with bizsmtp
 id 9puJ2A00X0Fik0k01puJQC; Fri, 16 Jun 2023 15:54:19 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qA9tf-008tCq-Gw;
 Fri, 16 Jun 2023 15:54:18 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qA9u6-008xAB-Hm;
 Fri, 16 Jun 2023 15:54:18 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>,
 Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH] drm/atomic-helper: Update reference to
 drm_crtc_force_disable_all()
Date: Fri, 16 Jun 2023 15:54:16 +0200
Message-Id: <87ece3775c9491fb2173f3bbe96cbe407b8ae756.1686923622.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_crtc_force_disable_all() was renamed to
drm_helper_force_disable_all(), but one reference was not updated.

Fixes: c2d88e06bcb98540 ("drm: Move the legacy kms disable_all helper to crtc helpers")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpu/drm/drm_atomic_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 41b8066f61fff4be..292e38eb621806a0 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -3332,7 +3332,7 @@ EXPORT_SYMBOL(drm_atomic_helper_disable_all);
  * that also takes a snapshot of the modeset state to be restored on resume.
  *
  * This is just a convenience wrapper around drm_atomic_helper_disable_all(),
- * and it is the atomic version of drm_crtc_force_disable_all().
+ * and it is the atomic version of drm_helper_force_disable_all().
  */
 void drm_atomic_helper_shutdown(struct drm_device *dev)
 {
-- 
2.34.1

