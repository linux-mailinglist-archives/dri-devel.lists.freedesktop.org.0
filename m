Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4230DA12D29
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 22:06:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD21E10E7EB;
	Wed, 15 Jan 2025 21:06:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="o2JALqug";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C0A010E528
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 21:06:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EB6AD5C5E2A;
 Wed, 15 Jan 2025 21:05:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A301C4CEE4;
 Wed, 15 Jan 2025 21:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736975167;
 bh=mj6NM+PSrLMPxTlgg9EIkBu+YOWNcjioXwNh4JUXpAI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=o2JALquglnx8RnLtBofCg2ih33H4tu3g/093vrzsERl6elnUwiCINKbntNqbMtE98
 lsX8knGLNlQbOy3OjjwNmjKaAORxJcAHUJqG+ovaumh2w7Pp6SFLEgq6GfWdLRMG1/
 YuphMK8kEo8BdIgd7CfeHZymzPXv/CsU/kjSZl6f4LY301IUZ8k99/pVg5EVQqnu6M
 E5Xjxp2joX+H9oSEwXA599h/eZ4oLWb1Bw3gdv203UkbV5moLKIgC184qrzyB66nP8
 D6eRcAFy7i8zzjo07cpteWS75U74BTUYB00iKVLSFf2uS/3KPjm3CNzK0ZLdbAXZCk
 pTCLAMwa+W7tA==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 15 Jan 2025 22:05:16 +0100
Subject: [PATCH 09/29] drm/atomic-helper: Change parameter name of
 drm_atomic_helper_update_legacy_modeset_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-bridge-connector-v1-9-9a2fecd886a6@kernel.org>
References: <20250115-bridge-connector-v1-0-9a2fecd886a6@kernel.org>
In-Reply-To: <20250115-bridge-connector-v1-0-9a2fecd886a6@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3609; i=mripard@kernel.org;
 h=from:subject:message-id; bh=mj6NM+PSrLMPxTlgg9EIkBu+YOWNcjioXwNh4JUXpAI=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOkdypKexe13XohvfJBs3ybZ9Oryps17L7he1PsqmCY+e
 +O18NDEjqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjCRfFvGhvNGxhsO7GuVuvD8
 V/P+gwuWuXvXW2frlC8LK5512ExwlcGBXsEXXKbPNOJEbP7ZbeDMY6zPifq9KqNqd1P/8pQrm+d
 4TN5Q58uhPzc/NTxEpO6JrX3mhgD2SYXvPjff0sk/mnwufg4A
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

drm_atomic_helper_update_legacy_modeset_state() updates all the legacy
modeset pointers a connector, encoder or CRTC might have with the ones
being setup by a given commit. It takes the drm_atomic_state being
committed as a parameter.

However, that parameter name is called (and documented) as old_state,
which is pretty confusing. Let's rename that variable as state.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_helper.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 0d561b5c249a79a723e047f061d4103ef7742e87..50b3fdb033eaae8e852a4fd298d2e958be1201f3 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1265,11 +1265,11 @@ disable_outputs(struct drm_device *dev, struct drm_atomic_state *state)
 }
 
 /**
  * drm_atomic_helper_update_legacy_modeset_state - update legacy modeset state
  * @dev: DRM device
- * @old_state: atomic state object with old state structures
+ * @state: atomic state object being committed
  *
  * This function updates all the various legacy modeset state pointers in
  * connectors, encoders and CRTCs.
  *
  * Drivers can use this for building their own atomic commit if they don't have
@@ -1281,20 +1281,20 @@ disable_outputs(struct drm_device *dev, struct drm_atomic_state *state)
  * the legacy state pointers are only really useful for transitioning an
  * existing driver to the atomic world.
  */
 void
 drm_atomic_helper_update_legacy_modeset_state(struct drm_device *dev,
-					      struct drm_atomic_state *old_state)
+					      struct drm_atomic_state *state)
 {
 	struct drm_connector *connector;
 	struct drm_connector_state *old_conn_state, *new_conn_state;
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *new_crtc_state;
 	int i;
 
 	/* clear out existing links and update dpms */
-	for_each_oldnew_connector_in_state(old_state, connector, old_conn_state, new_conn_state, i) {
+	for_each_oldnew_connector_in_state(state, connector, old_conn_state, new_conn_state, i) {
 		if (connector->encoder) {
 			WARN_ON(!connector->encoder->crtc);
 
 			connector->encoder->crtc = NULL;
 			connector->encoder = NULL;
@@ -1311,11 +1311,11 @@ drm_atomic_helper_update_legacy_modeset_state(struct drm_device *dev,
 			connector->dpms = mode;
 		}
 	}
 
 	/* set new links */
-	for_each_new_connector_in_state(old_state, connector, new_conn_state, i) {
+	for_each_new_connector_in_state(state, connector, new_conn_state, i) {
 		if (!new_conn_state->crtc)
 			continue;
 
 		if (WARN_ON(!new_conn_state->best_encoder))
 			continue;
@@ -1323,19 +1323,19 @@ drm_atomic_helper_update_legacy_modeset_state(struct drm_device *dev,
 		connector->encoder = new_conn_state->best_encoder;
 		connector->encoder->crtc = new_conn_state->crtc;
 	}
 
 	/* set legacy state in the crtc structure */
-	for_each_new_crtc_in_state(old_state, crtc, new_crtc_state, i) {
+	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
 		struct drm_plane *primary = crtc->primary;
 		struct drm_plane_state *new_plane_state;
 
 		crtc->mode = new_crtc_state->mode;
 		crtc->enabled = new_crtc_state->enable;
 
 		new_plane_state =
-			drm_atomic_get_new_plane_state(old_state, primary);
+			drm_atomic_get_new_plane_state(state, primary);
 
 		if (new_plane_state && new_plane_state->crtc == crtc) {
 			crtc->x = new_plane_state->src_x >> 16;
 			crtc->y = new_plane_state->src_y >> 16;
 		}

-- 
2.47.1

