Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97560A12D2F
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 22:06:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1D3710E7EC;
	Wed, 15 Jan 2025 21:06:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DuRZAKj3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D666110E7F0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 21:06:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 90E635C5CD8;
 Wed, 15 Jan 2025 21:05:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B25BDC4CED1;
 Wed, 15 Jan 2025 21:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736975181;
 bh=W7E34uIDD6EPQfuiAssvLwh6q5tyCyKBTh2H3DKKzSE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=DuRZAKj3zoUmxhCLSVuc8SguFHLiq/qCJyUgM30Hqo9T/JAByjNZYoUQhLNBVZika
 I/UXNATHTWccD89AtkgrC1JTHg7x9w7dT8oRAom2bPMhm8XgZ9WizHJKP5D8moKHhd
 b2jrV+MPHHpN7j4CHFAw+HwiF+3mq41KRItcUlM1QPIWNxrBLVNuI0QbG2hXoZ2bIn
 s76+fnA38CmQ8C9Ar395TR6s/Yq133bFQgWp7qpaf7BrE5vlDlMjo2w4zEDc25PHso
 7a0opgQ9wXUNkXkPUHRYJjpN24LHXVYI05grot1KNgfQ0Fj3j8VfRxIwakCRJLQWEE
 y7J/mksnSwF7g==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 15 Jan 2025 22:05:21 +0100
Subject: [PATCH 14/29] drm/bridge: Change parameter name of
 drm_atomic_bridge_chain_enable()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-bridge-connector-v1-14-9a2fecd886a6@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2108; i=mripard@kernel.org;
 h=from:subject:message-id; bh=W7E34uIDD6EPQfuiAssvLwh6q5tyCyKBTh2H3DKKzSE=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOkdytJvqlwT5vA8NXxRdtDhfGzy8mWp1VNtBAIPVVvG+
 1yZHRfdMZWFQZiTQVZMkeWJTNjp5e2LqxzsV/6AmcPKBDKEgYtTACZyZgtjw7rGZbsX75oolyjc
 k79qy+Xi8x6suU53pdnvHhTVe7b5hH+ksHLcvBtZPHJpdo6vvoTGMjZskfgz+8Mf9jmP9sX45W0
 86Ln1WoDNMsmaTSuKH4d7sybw7dRZuaTl2RTWz/fe1G9oWW8IAA==
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
index b060b699e059f0d4bd47dcc4aba49399ce45b332..c937980d6591fd98e33e37d799ebf84e7e6c5529 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -789,21 +789,21 @@ void drm_atomic_bridge_chain_pre_enable(struct drm_bridge *bridge,
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
@@ -812,11 +812,11 @@ void drm_atomic_bridge_chain_enable(struct drm_bridge *bridge,
 	list_for_each_entry_from(bridge, &encoder->bridge_chain, chain_node) {
 		if (bridge->funcs->atomic_enable) {
 			struct drm_bridge_state *old_bridge_state;
 
 			old_bridge_state =
-				drm_atomic_get_old_bridge_state(old_state,
+				drm_atomic_get_old_bridge_state(state,
 								bridge);
 			if (WARN_ON(!old_bridge_state))
 				return;
 
 			bridge->funcs->atomic_enable(bridge, old_bridge_state);

-- 
2.47.1

