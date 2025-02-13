Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8EEA3430D
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 15:44:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DCB210EAE2;
	Thu, 13 Feb 2025 14:44:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JgEJUvYg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DEC810EAE2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 14:44:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 02A0EA4262F;
 Thu, 13 Feb 2025 14:42:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A49E3C4CED1;
 Thu, 13 Feb 2025 14:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739457874;
 bh=FISC0+yVHRMCMSVo8YKKQvJ8/x3d6MANikyEom061Rw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=JgEJUvYgjlwPhoUA1qr91Ltmx2WRaRCIRKtBAMXjwGaQA74QtBQHW6mOnC1aIzsdv
 ovrOd3NBZzw6MnaGRwmElv8O5Djc3FQ+166KBoLGV2nUUelV+TnGG8hYIkTfpwroaB
 WYolpYG9poaNbiYZXWi3iRi380EQC2vlylmOEwMiGyFfkqg+hy/DdJMjDKk2OnyZ+Z
 7XE+afzJUNYYngaruOuN7bu+ZWxK6SYjRU1fZuzfwtb7MtsZtRQG1nQDpwc6Jylxcj
 20nAGAN6+FuKkJPjMJOapgZgeUXwdobQn5R5B6faHulmJiq1c1QPmXu0gWPlRqhCVX
 CAKgMXZx/QuJw==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 13 Feb 2025 15:43:33 +0100
Subject: [PATCH v3 14/37] drm/atomic-helper: Change parameter name of
 drm_atomic_helper_update_legacy_modeset_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-bridge-connector-v3-14-e71598f49c8f@kernel.org>
References: <20250213-bridge-connector-v3-0-e71598f49c8f@kernel.org>
In-Reply-To: <20250213-bridge-connector-v3-0-e71598f49c8f@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3670; i=mripard@kernel.org;
 h=from:subject:message-id; bh=FISC0+yVHRMCMSVo8YKKQvJ8/x3d6MANikyEom061Rw=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOnrWGWmHplQrX49gfmIbw/70ZYkx3kTFu2fLqrceej7+
 QCz5o1eHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAiU84x1rvZHrZNzahvarp5
 bvHZZYpMU5g0OXv6bvrMOTFp4QejVBmXldaVky3+MeT+TmaLX8lwlLHh4jPuFmfmTz/n7egu+fT
 ykbJDV+vPi+/0D1p1Hz5gnyJ18OLmo3uyOQTfvdifwONzK4YNAA==
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

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_helper.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 7d83ea99477ae3dee1f828f17946070903b29ba7..b118cd44cf9d95908223a2d297c4b74308613f63 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1275,11 +1275,11 @@ disable_outputs(struct drm_device *dev, struct drm_atomic_state *state)
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
@@ -1291,20 +1291,20 @@ disable_outputs(struct drm_device *dev, struct drm_atomic_state *state)
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
@@ -1321,11 +1321,11 @@ drm_atomic_helper_update_legacy_modeset_state(struct drm_device *dev,
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
@@ -1333,19 +1333,19 @@ drm_atomic_helper_update_legacy_modeset_state(struct drm_device *dev,
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
2.48.0

