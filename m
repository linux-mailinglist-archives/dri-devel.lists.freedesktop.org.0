Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF512A27517
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 15:59:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 315A010E683;
	Tue,  4 Feb 2025 14:59:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GoMWP7z/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FCA010E684
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 14:59:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B63245C69F0;
 Tue,  4 Feb 2025 14:59:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D692EC4CEE2;
 Tue,  4 Feb 2025 14:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738681183;
 bh=PdXpNhj44CIUPFVqmBPj/ISp1CrBH+MDwFRdwZ5zWoE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=GoMWP7z/+P8qZXrYQTv8I+8GthhsYf/v1M6qS7G9fR5qCdNTaDkome8oTojnMRA4X
 hOthzO2rHD60ulxKXme1QPeMG7F83jxSTqDvTh/PZfeqNat0QHqWbeiEcb8j432KjX
 hpr5fWFh94BciERBzOgHx1mKi5CJ6zhamrx3uKHfnbbQfQFwXibP4AymC+X2UE1oPX
 nN3czxVvpe+0OUww36E2CV4+02/lWYl5GPpFCsf0FTENtEy+CHD/Q+pBjL4dwUmnum
 cUgv/RBN5s8SzCzMuD6bJ4S5WqQVn5BCmTzOV8BCpDA7PwnFSa219jjKVk8goH/LH4
 utrnbrj6jcDWw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 04 Feb 2025 15:57:47 +0100
Subject: [PATCH v2 19/35] drm/bridge: Change parameter name of
 drm_atomic_bridge_chain_enable()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-bridge-connector-v2-19-35dd6c834e08@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1947; i=mripard@kernel.org;
 h=from:subject:message-id; bh=PdXpNhj44CIUPFVqmBPj/ISp1CrBH+MDwFRdwZ5zWoE=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOmLtD4uc1+QcmmztsuUs01Nwb4P5a5f+bTiy1Vl1yTx6
 n2OyfNyOqayMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmUCGMHBxCsBEtn5mbPjuc/i59JMU/565
 izb+dWMqtvGNqWN6dzJ7o819jyVlYkxMstMX31dNeNvJaSt8UT4jgbHhaW7G9ZbFO9VXTWkvbe+
 wkxR1DPhX+Pu7iWJI6ivuR1k9LpYLc9bseeSn1Hiiq72r/z8A
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
index 02ddfe962b99bed4316b2a7b0c72112e127afa8b..567400074d25aecd3174b24bae2f70ebea347071 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -762,31 +762,31 @@ void drm_atomic_bridge_chain_pre_enable(struct drm_bridge *bridge,
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

