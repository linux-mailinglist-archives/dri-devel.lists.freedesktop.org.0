Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4039976681B
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 11:04:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E910D10E1EB;
	Fri, 28 Jul 2023 09:04:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D88510E1EB
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 09:03:58 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:12b0:7b7e:d1ff:7873])
 by michel.telenet-ops.be with bizsmtp
 id SZ3v2A0070d1nm806Z3voj; Fri, 28 Jul 2023 11:03:57 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qPJNt-002lhW-Uw;
 Fri, 28 Jul 2023 11:03:55 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qPJO7-00AnzN-2F;
 Fri, 28 Jul 2023 11:03:55 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>,
 Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH v2] drm/atomic-helper: Update reference to
 drm_crtc_force_disable_all()
Date: Fri, 28 Jul 2023 11:03:53 +0200
Message-Id: <b8c9c1a8a05dbf0be8e8be98cfdeafa9cecd8cef.1690535002.git.geert+renesas@glider.be>
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Sui Jingfeng <suijingfeng@loongson.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_crtc_force_disable_all() was renamed to
drm_helper_force_disable_all(), but one reference was not updated.

Fixes: c2d88e06bcb98540 ("drm: Move the legacy kms disable_all helper to crtc helpers")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
v2:
  - Add Reviewed-by.
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

