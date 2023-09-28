Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A967B1BEC
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 14:16:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB71A10E636;
	Thu, 28 Sep 2023 12:16:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7769110E633
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 12:16:25 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:e207:8adb:af22:7f1e])
 by michel.telenet-ops.be with bizsmtp
 id rQGH2A00K3w8i7m06QGHFt; Thu, 28 Sep 2023 14:16:22 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qlpvt-004mR8-5t;
 Thu, 28 Sep 2023 14:16:17 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qlpwH-001OAj-M2;
 Thu, 28 Sep 2023 14:16:17 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 2/3] drm: Spelling s/preceeding/preceding/g
Date: Thu, 28 Sep 2023 14:16:12 +0200
Message-Id: <b88ab4501bad5494ea64a558a198d69798b83db8.1695903065.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695903065.git.geert+renesas@glider.be>
References: <cover.1695903065.git.geert+renesas@glider.be>
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

Fix misspellings of "preceding".

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpu/drm/drm_atomic_helper.c      | 4 ++--
 include/drm/drm_modeset_helper_vtables.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 71d3993971075eea..10aadd324cc370ee 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -2373,10 +2373,10 @@ int drm_atomic_helper_setup_commit(struct drm_atomic_state *state,
 EXPORT_SYMBOL(drm_atomic_helper_setup_commit);
 
 /**
- * drm_atomic_helper_wait_for_dependencies - wait for required preceeding commits
+ * drm_atomic_helper_wait_for_dependencies - wait for required preceding commits
  * @old_state: atomic state object with old state structures
  *
- * This function waits for all preceeding commits that touch the same CRTC as
+ * This function waits for all preceding commits that touch the same CRTC as
  * @old_state to both be committed to the hardware (as signalled by
  * drm_atomic_helper_commit_hw_done()) and executed by the hardware (as signalled
  * by calling drm_crtc_send_vblank_event() on the &drm_crtc_state.event).
diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
index bbc516f313913254..91860372be6c064e 100644
--- a/include/drm/drm_modeset_helper_vtables.h
+++ b/include/drm/drm_modeset_helper_vtables.h
@@ -1464,7 +1464,7 @@ struct drm_mode_config_helper_funcs {
 	 * swapped into the various state pointers. The passed in state
 	 * therefore contains copies of the old/previous state. This hook should
 	 * commit the new state into hardware. Note that the helpers have
-	 * already waited for preceeding atomic commits and fences, but drivers
+	 * already waited for preceding atomic commits and fences, but drivers
 	 * can add more waiting calls at the start of their implementation, e.g.
 	 * to wait for driver-internal request for implicit syncing, before
 	 * starting to commit the update to the hardware.
-- 
2.34.1

