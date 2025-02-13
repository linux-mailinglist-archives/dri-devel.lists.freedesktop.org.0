Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD3BA3430C
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 15:44:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2F8110EAD6;
	Thu, 13 Feb 2025 14:44:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oSonWZAd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9429F10EAD6
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 14:44:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 7BBE2A4262E;
 Thu, 13 Feb 2025 14:42:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E0D4C4CEE2;
 Thu, 13 Feb 2025 14:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739457871;
 bh=QW0K6/TUL7ANO4S8LAs5lkdu+V3Tohf9KAVCMciYxXQ=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=oSonWZAdPv40XLQPvhK1ODIybvmeoCfzTKbeSPVkxX65Q+OsIXpd7o1Rb7LBs3Qc+
 7HAzpODxxKA8SgUKVI5M7dj7YuK72GGNDkil6Vd98rk+18RcN60ngtIadPH4A+tp6o
 Wiy77VxaTnyCvCZhshWnVuzEL2LKFZwSnYp9agNyiC6WsFCSXqMSWZeYOc1AoUAaQ8
 XwXam6B3I27dZB//aG6FkW+F924O/W6efOAK4SNZxw7ia4HOP880pj9xJZv1qFbbwc
 2h12MfURVKGZ2Y1CX7ECG4JEBeXhKCGoWQY4ffVk1H+2nFiFCLEgi9L5O59seRaxNH
 9sGKoy4o3uROg==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 13 Feb 2025 15:43:32 +0100
Subject: [PATCH v3 13/37] drm/bridge: Change parameter name of
 drm_atomic_bridge_chain_post_disable()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-bridge-connector-v3-13-e71598f49c8f@kernel.org>
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
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2838; i=mripard@kernel.org;
 h=from:subject:message-id; bh=QW0K6/TUL7ANO4S8LAs5lkdu+V3Tohf9KAVCMciYxXQ=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOnrWKXn8Bl03dg5Z4ab36rQ/6zhs9P3hv/QPLvGSmrRd
 N6S5a+nd0xlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJLA9gbFj7xvBNXVRJJEtA
 zBrPCUVTMtIvaHudlw/g3/EvoWHqjKtGB553nnl/vbLJPL+W9/4bFcaGec+q2Zfd8j8h6up4qm7
 P2S1ziqqzrwZ2dKts1ZgTZh6sJLiaL3LlY9HVgllWs4rDQz8DAA==
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
 drivers/gpu/drm/drm_bridge.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index b21b43af3d1de69c1aa9a4925922e0b2f522f026..b63ec3d0b285949ebe75f28b526e2833d0e6a850 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -581,23 +581,23 @@ void drm_atomic_bridge_chain_disable(struct drm_bridge *bridge,
 	}
 }
 EXPORT_SYMBOL(drm_atomic_bridge_chain_disable);
 
 static void drm_atomic_bridge_call_post_disable(struct drm_bridge *bridge,
-						struct drm_atomic_state *old_state)
+						struct drm_atomic_state *state)
 {
-	if (old_state && bridge->funcs->atomic_post_disable)
-		bridge->funcs->atomic_post_disable(bridge, old_state);
+	if (state && bridge->funcs->atomic_post_disable)
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
@@ -614,11 +614,11 @@ static void drm_atomic_bridge_call_post_disable(struct drm_bridge *bridge,
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
@@ -661,16 +661,16 @@ void drm_atomic_bridge_chain_post_disable(struct drm_bridge *bridge,
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

