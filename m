Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E77EA34314
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 15:44:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AA8B10EAE4;
	Thu, 13 Feb 2025 14:44:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KnCH+Iri";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DEB710EAE6
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 14:44:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 85020A4201C;
 Thu, 13 Feb 2025 14:43:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CF4EC4CED1;
 Thu, 13 Feb 2025 14:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739457887;
 bh=zI++OHT/zy7L9G9KDHxBKDrJcggygqGsKRhGcwsf6Lk=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=KnCH+Iri2ipZjz6Lo8wxFce3DLvf5nmPey55BQdMzFogCaBAu/9E9uMaHXQZpcGeS
 UYqztzNnY/BkKKv+B3/efZS4LbaqhI2AzG+tFbQIXIy/unSg1jTh8drA/W48H4dk0b
 K4+te6/xhVocQOORCO7sOFSguuoUfvH3wfTKAHtSqW28sL+RFHJhONF3IKPR/SaFAY
 OU4J17dRjwvQCKs1sqL5O9lwBNjJVU7MvhDzQl5Hh/W14+idK2mritaj/KuPekrOl1
 e3PhQ2S7oIy4w2D+ROE57VNFpXbellaEA/rlpDBS2ZboqMaKUttIdDENYnQWvuRqF6
 gGG0TWGMfhKiA==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 13 Feb 2025 15:43:38 +0100
Subject: [PATCH v3 19/37] drm/bridge: Change parameter name of
 drm_atomic_bridge_chain_enable()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-bridge-connector-v3-19-e71598f49c8f@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1947; i=mripard@kernel.org;
 h=from:subject:message-id; bh=zI++OHT/zy7L9G9KDHxBKDrJcggygqGsKRhGcwsf6Lk=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOnrWOVqthzrf+kbm+AdXZjLo27b1VLkJuRweaqaSnPXh
 AZDQYeOqSwMwpwMsmKKLE9kwk4vb19c5WC/8gfMHFYmkCEMXJwCMJHbhxkbbh63vdhauGt76OtX
 MclJe6/dP5OV8pqJzzXT/c1vk6Ns4hzS6zuts4xSjvNe6ypZfTmUseH8PLX/ZzNat+7oX3ZthUq
 L/fzDaoInZadJLlhswBkguOXtOXbpO56+xYvFBcXYciPqbAE=
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

drm_atomic_bridge_chain_enable() enables all bridges affected by a new
commit. It takes the drm_atomic_state being committed as a parameter.

However, that parameter name is called (and documented) as old_state,
which is pretty confusing. Let's rename that variable as state.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_bridge.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 41bb3700ca7b6f267a75481ae942b9357b5777c9..fa2794217a903b6c61e58edf14756a72f99dad38 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -766,31 +766,31 @@ void drm_atomic_bridge_chain_pre_enable(struct drm_bridge *bridge,
 EXPORT_SYMBOL(drm_atomic_bridge_chain_pre_enable);
 
 /**
  * drm_atomic_bridge_chain_enable - enables all bridges in the encoder chain
  * @bridge: bridge control structure
- * @old_state: old atomic state
+ * @state: atomic state being committed
  *
  * Calls &drm_bridge_funcs.atomic_enable (falls back on
  * &drm_bridge_funcs.enable) op for all the bridges in the encoder chain,
  * starting from the first bridge to the last. These are called after completing
  * &drm_encoder_helper_funcs.atomic_enable
  *
  * Note: the bridge passed should be the one closest to the encoder
  */
 void drm_atomic_bridge_chain_enable(struct drm_bridge *bridge,
-				    struct drm_atomic_state *old_state)
+				    struct drm_atomic_state *state)
 {
 	struct drm_encoder *encoder;
 
 	if (!bridge)
 		return;
 
 	encoder = bridge->encoder;
 	list_for_each_entry_from(bridge, &encoder->bridge_chain, chain_node) {
 		if (bridge->funcs->atomic_enable) {
-			bridge->funcs->atomic_enable(bridge, old_state);
+			bridge->funcs->atomic_enable(bridge, state);
 		} else if (bridge->funcs->enable) {
 			bridge->funcs->enable(bridge);
 		}
 	}
 }

-- 
2.48.0

