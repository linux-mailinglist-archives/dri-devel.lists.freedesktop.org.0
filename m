Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 342F4A2751F
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 16:00:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18C3110E685;
	Tue,  4 Feb 2025 15:00:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tfMlLjlX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7CFE10E685
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 15:00:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5932F5C69C4;
 Tue,  4 Feb 2025 14:59:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF70AC4CEDF;
 Tue,  4 Feb 2025 14:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738681200;
 bh=8/3ml+p+1WrqM0TycJc4SK99Pq4EdRuxnM+KSVtJATM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=tfMlLjlXleuWiQU909SO9dC/H9KY+PYn2EcfOBGLyROqDxhm1U43Y6vh9uKivd+88
 lXFbLT8vmfBISlkKFUqX3um+QW2FDGTZbhMqaZWSl6jhOP+d8CPVx5EQY6G+87wUMe
 5/fmjJa8i3Tg8xGWVx7UlEhHIV1mtWUdLJPnboy2R2Mvq/gvJKsVSeR92rl/b6a9oJ
 BFqtOq6uXKBpUiLSvDd3PtKPjlMvI7JOY1XcwljMjUwy6WBoeNiyItRMRZ5aQ6bqZ+
 dvHH9t7yjqmjkM0OswAXXJg0SCH7fNqp7D26I46NobyxldSkzPk83WcY0dDccPhjZp
 O3EXMlTsxfrOQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 04 Feb 2025 15:57:51 +0100
Subject: [PATCH v2 23/35] drm/atomic-helper: Change parameter name of
 drm_atomic_helper_wait_for_vblanks()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-bridge-connector-v2-23-35dd6c834e08@kernel.org>
References: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
In-Reply-To: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3197; i=mripard@kernel.org;
 h=from:subject:message-id; bh=8/3ml+p+1WrqM0TycJc4SK99Pq4EdRuxnM+KSVtJATM=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOmLtD4HNyZsTct5eaxMTur/d8WtL7O6TjGvePqTf9a7+
 d0MMc3nO6ayMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmUCGMHBxCsBEkmsZ68wDTm8UsKq0nla2
 xd29eJWAq4OQxUHBsPMSsRVHO76tLKiew+i7e5eYNMt7u08z3zb8Yqzh5Y06e5ixnWlS3Y39r3M
 ex3rF3guckh9oebBuEuuavXF7ew6Yuu7R1+fc/z54l6UqtwoA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_atomic_helper_wait_for_vblanks() waits for vblank events on all the
CRTCs affected by a commit. It takes the drm_atomic_state being
committed as a parameter.

However, that parameter name is called (and documented) as old_state,
which is pretty confusing. Let's rename that variable as state.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_helper.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 8541faf6a86c51074cd5d36996814e899382ae11..54df4f792dca8006a855ccc5fd4e279d111480d0 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1656,11 +1656,11 @@ int drm_atomic_helper_wait_for_fences(struct drm_device *dev,
 EXPORT_SYMBOL(drm_atomic_helper_wait_for_fences);
 
 /**
  * drm_atomic_helper_wait_for_vblanks - wait for vblank on CRTCs
  * @dev: DRM device
- * @old_state: atomic state object with old state structures
+ * @state: atomic state object being committed
  *
  * Helper to, after atomic commit, wait for vblanks on all affected
  * CRTCs (ie. before cleaning up old framebuffers using
  * drm_atomic_helper_cleanup_planes()). It will only wait on CRTCs where the
  * framebuffers have actually changed to optimize for the legacy cursor and
@@ -1670,44 +1670,44 @@ EXPORT_SYMBOL(drm_atomic_helper_wait_for_fences);
  * drm_atomic_helper_setup_commit() should look at
  * drm_atomic_helper_wait_for_flip_done() as an alternative.
  */
 void
 drm_atomic_helper_wait_for_vblanks(struct drm_device *dev,
-		struct drm_atomic_state *old_state)
+				   struct drm_atomic_state *state)
 {
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
 	int i, ret;
 	unsigned int crtc_mask = 0;
 
 	 /*
 	  * Legacy cursor ioctls are completely unsynced, and userspace
 	  * relies on that (by doing tons of cursor updates).
 	  */
-	if (old_state->legacy_cursor_update)
+	if (state->legacy_cursor_update)
 		return;
 
-	for_each_oldnew_crtc_in_state(old_state, crtc, old_crtc_state, new_crtc_state, i) {
+	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
 		if (!new_crtc_state->active)
 			continue;
 
 		ret = drm_crtc_vblank_get(crtc);
 		if (ret != 0)
 			continue;
 
 		crtc_mask |= drm_crtc_mask(crtc);
-		old_state->crtcs[i].last_vblank_count = drm_crtc_vblank_count(crtc);
+		state->crtcs[i].last_vblank_count = drm_crtc_vblank_count(crtc);
 	}
 
-	for_each_old_crtc_in_state(old_state, crtc, old_crtc_state, i) {
+	for_each_old_crtc_in_state(state, crtc, old_crtc_state, i) {
 		if (!(crtc_mask & drm_crtc_mask(crtc)))
 			continue;
 
 		ret = wait_event_timeout(dev->vblank[i].queue,
-				old_state->crtcs[i].last_vblank_count !=
-					drm_crtc_vblank_count(crtc),
-				msecs_to_jiffies(100));
+					 state->crtcs[i].last_vblank_count !=
+						drm_crtc_vblank_count(crtc),
+					 msecs_to_jiffies(100));
 
 		WARN(!ret, "[CRTC:%d:%s] vblank wait timed out\n",
 		     crtc->base.id, crtc->name);
 
 		drm_crtc_vblank_put(crtc);

-- 
2.48.0

