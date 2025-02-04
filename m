Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EDCA2750F
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 15:59:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CA5510E67D;
	Tue,  4 Feb 2025 14:59:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Fiz0TsHf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18FE910E67C
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 14:59:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 909D6A42820;
 Tue,  4 Feb 2025 14:57:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9911C4CEE2;
 Tue,  4 Feb 2025 14:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738681155;
 bh=CjbknWkLO9FJHKbmEf1EyUy4YFmhOLb2lsRfYnj48EY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Fiz0TsHfzJ9rM8V7NcpHH/Vk8ZjH55jN/ykoi2n17nP55/m8Ab8BwqDeJ+PZESaxP
 adbEmOgE08CEo6YkOYfABCQOrn+m2B4jwz6ByscmOwdV6fyH0Qs5/33xxVPXKEqhIF
 x3d5ghBJkZsT264258tHl4LHlSnCNq4EQhNJa1xQrpzIWkX3pciKybpfT5vCg9A91y
 E6ZE9DjDbWjPpFjk6v8jhiUPeMkeZFruIgJEqjj9Z3JgJNbl2XACWUdmOmLpIT9L7j
 OeHQuSt2YkVw2YMjP0kFyaUnk2z5x55BtUEh/FL41aL2hyMfFamB5KIgAzfKnN20VF
 PE6ba0XS4PliQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 04 Feb 2025 15:57:41 +0100
Subject: [PATCH v2 13/35] drm/bridge: Change parameter name of
 drm_atomic_bridge_chain_post_disable()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-bridge-connector-v2-13-35dd6c834e08@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2784; i=mripard@kernel.org;
 h=from:subject:message-id; bh=CjbknWkLO9FJHKbmEf1EyUy4YFmhOLb2lsRfYnj48EY=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOmLtN7pctz97zBhr9BWny/lweGlGV31x/eJJN2qSbD6q
 mij9FmuYyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAEykoZ2xYUV9/BoBBkevwgnH
 zH1eM+1Zw9aroFr03lPTP3bGvXZ3v0NfZ+W9WWr/5fejxgzWPUsFGRt2v1no+kX4iQ1rRcbnzQm
 +GsExr/UsdttHvDh6zeT5+xc/tganFOfJVXI9r3J8/X2Z1FYA
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

drm_atomic_bridge_chain_post_disable() disables all bridges affected by
a new commit. It takes the drm_atomic_state being committed as a
parameter.

However, that parameter name is called (and documented) as old_state,
which is pretty confusing. Let's rename that variable as state.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_bridge.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 0a8c7176959d13937124d2a3bf7e69309898b947..ab166972b1b0df239ca014296be49846a857df6e 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -577,23 +577,23 @@ void drm_atomic_bridge_chain_disable(struct drm_bridge *bridge,
 	}
 }
 EXPORT_SYMBOL(drm_atomic_bridge_chain_disable);
 
 static void drm_atomic_bridge_call_post_disable(struct drm_bridge *bridge,
-						struct drm_atomic_state *old_state)
+						struct drm_atomic_state *state)
 {
 	if (old_state && bridge->funcs->atomic_post_disable)
-		bridge->funcs->atomic_post_disable(bridge, old_state);
+		bridge->funcs->atomic_post_disable(bridge, state);
 	else if (bridge->funcs->post_disable)
 		bridge->funcs->post_disable(bridge);
 }
 
 /**
  * drm_atomic_bridge_chain_post_disable - cleans up after disabling all bridges
  *					  in the encoder chain
  * @bridge: bridge control structure
- * @old_state: old atomic state
+ * @state: atomic state being committed
  *
  * Calls &drm_bridge_funcs.atomic_post_disable (falls back on
  * &drm_bridge_funcs.post_disable) op for all the bridges in the encoder chain,
  * starting from the first bridge to the last. These are called after completing
  * &drm_encoder_helper_funcs.atomic_disable
@@ -610,11 +610,11 @@ static void drm_atomic_bridge_call_post_disable(struct drm_bridge *bridge,
  * Bridge B, Bridge A, Bridge E, Bridge D, Bridge C.
  *
  * Note: the bridge passed should be the one closest to the encoder
  */
 void drm_atomic_bridge_chain_post_disable(struct drm_bridge *bridge,
-					  struct drm_atomic_state *old_state)
+					  struct drm_atomic_state *state)
 {
 	struct drm_encoder *encoder;
 	struct drm_bridge *next, *limit;
 
 	if (!bridge)
@@ -657,16 +657,16 @@ void drm_atomic_bridge_chain_post_disable(struct drm_bridge *bridge,
 								 chain_node) {
 					if (next == bridge)
 						break;
 
 					drm_atomic_bridge_call_post_disable(next,
-									    old_state);
+									    state);
 				}
 			}
 		}
 
-		drm_atomic_bridge_call_post_disable(bridge, old_state);
+		drm_atomic_bridge_call_post_disable(bridge, state);
 
 		if (limit)
 			/* Jump all bridges that we have already post_disabled */
 			bridge = limit;
 	}

-- 
2.48.0

