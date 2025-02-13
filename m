Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 419BCA34308
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 15:44:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A96CA10EADE;
	Thu, 13 Feb 2025 14:44:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lNpC+9Ki";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDB6010EADE
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 14:44:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A0FD1A42633;
 Thu, 13 Feb 2025 14:42:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DB6AC4CED1;
 Thu, 13 Feb 2025 14:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739457868;
 bh=7JY8ITK80ol69Cjh+s2e0Bg9VnTdWWPoeH70KyOkKy0=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=lNpC+9Kiok/EPtiby6RfXkNDaPk724mQlkiba8EaSo69P7K+1sc9LNVJSGtZfxs42
 YP6VVxudZAc2UPiUo6rNcOjEA6E3ZfgZ1c5eXTJcaX4TzXUOk10VW8j/CXU+vOJwBv
 y1SQDFph9CXOviSWWbuR+sAc1bcnJutUPglfmml67JUmkSSt643bPQBTlL9scKfIYU
 ls6JxZBH1SWw2xOLHraQvRhao4TuaTGOBSRH6EK66VbrA71CcGrbQ7ZDInJ7/wP6WF
 7hjDvieK4LRrqi4MPQ8sy41ComZ8MMxTMHFRiSG3rlplhrYChA/jQFcb7vs+cRquhE
 Enp7Xpqxig+8Q==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 13 Feb 2025 15:43:31 +0100
Subject: [PATCH v3 12/37] drm/bridge: Change parameter name of
 drm_atomic_bridge_chain_disable()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-bridge-connector-v3-12-e71598f49c8f@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2034; i=mripard@kernel.org;
 h=from:subject:message-id; bh=7JY8ITK80ol69Cjh+s2e0Bg9VnTdWWPoeH70KyOkKy0=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOnrWKVLZ3TURDFyTL4g4psrJWZe/f2ZkIv3H7n/Bzjcv
 X69rnnTMZWFQZiTQVZMkeWJTNjp5e2LqxzsV/6AmcPKBDKEgYtTACZSGcRYK+G44WLl66+/852k
 1F87391u2dK8c+60vamNfneXaOfUuDxoctv094loyPcPdlvWcgZyMTb8e/TtUOhDFb5XZd7rEk8
 3zaoWvV+ytW7+4cTytWEOC1S2TjhjqFe4s+Y3457qDar3TSwB
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

drm_atomic_bridge_chain_disable() disables all bridges affected by a new
commit. It takes the drm_atomic_state being committed as a parameter.

However, that parameter name is called (and documented) as old_state,
which is pretty confusing. Let's rename that variable as state.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_bridge.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index cb71ec57c47af889c2028c74d0bbcfa2fed1f88b..b21b43af3d1de69c1aa9a4925922e0b2f522f026 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -548,32 +548,32 @@ void drm_bridge_chain_mode_set(struct drm_bridge *bridge,
 EXPORT_SYMBOL(drm_bridge_chain_mode_set);
 
 /**
  * drm_atomic_bridge_chain_disable - disables all bridges in the encoder chain
  * @bridge: bridge control structure
- * @old_state: old atomic state
+ * @state: atomic state being committed
  *
  * Calls &drm_bridge_funcs.atomic_disable (falls back on
  * &drm_bridge_funcs.disable) op for all the bridges in the encoder chain,
  * starting from the last bridge to the first. These are called before calling
  * &drm_encoder_helper_funcs.atomic_disable
  *
  * Note: the bridge passed should be the one closest to the encoder
  */
 void drm_atomic_bridge_chain_disable(struct drm_bridge *bridge,
-				     struct drm_atomic_state *old_state)
+				     struct drm_atomic_state *state)
 {
 	struct drm_encoder *encoder;
 	struct drm_bridge *iter;
 
 	if (!bridge)
 		return;
 
 	encoder = bridge->encoder;
 	list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_node) {
 		if (iter->funcs->atomic_disable) {
-			iter->funcs->atomic_disable(iter, old_state);
+			iter->funcs->atomic_disable(iter, state);
 		} else if (iter->funcs->disable) {
 			iter->funcs->disable(iter);
 		}
 
 		if (iter == bridge)

-- 
2.48.0

