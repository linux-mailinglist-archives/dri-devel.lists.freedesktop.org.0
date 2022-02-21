Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB1A4BD8DE
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 11:00:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06CB310EE6D;
	Mon, 21 Feb 2022 10:00:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CA0F10E592
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 09:59:48 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id B111D580259;
 Mon, 21 Feb 2022 04:59:47 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 21 Feb 2022 04:59:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=Esm2do0nmj72SvXO6N2Mer4L5GKfLq
 5MKLEQEdP4jfI=; b=aZWIikjF+oY59WWCb4r+CEU+KQyDBlFZZF9wNA4uBC8/NV
 kg5M+5q9v1AsbHfwFKXx5a4ZXlwaf8cs8tQNHYJRspohIW54/rkN0Rl+/9TFbk6f
 azrsUj/IumQDx6f5vyjjQlZNODtiAVbfKpJPlDgTLmMrWGrlC51v15DYHz4DIlA6
 RBTAiZrbEh7aaE0cJ9o2jyGta3za/MMGpOnY7FNfM01Hwymxi5VlsYUN2RLmMmAn
 GD16JsHAIrF8SCQkvU3iwGfZLZ4yebv8ctGp4fdp5tIU9ikrWm+E3e5jTwhTzqPe
 9pyZyZDYdAe1RyrU8UjXYWe0moW6YLe8hN38fZbA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Esm2do
 0nmj72SvXO6N2Mer4L5GKfLq5MKLEQEdP4jfI=; b=NCTQutcVUHpA45a4KxyMkp
 6jUaLSq5JsTYgfo4Bv7/RlhzoQcQKIS4cwXPo3ug2+NoPJ1HeegOOvQsFN64beGA
 mcSC4/IrHzRDbnzZBY7jFqIuLzVEIRY26lIL66GSk52tW1rFCqwWOEYXGTGc4gcc
 DjCfMofgbD5O7bbvHbL2lZwvcJSneu7RBPNpu9WzUBtfvLJy4HjB5lHXxkiURNdl
 mMB7m6jtT9yfIiyVvkaNoEqUhDY+NwmAop53O1jM5THGIJEJkVHjdY4Qx5CSmB7W
 S2PZ/1eDHXysjN7GUQLn8YOcYTDH6Yf+xexFrl85aBvMnK3xxCtyVuct0/vSVucw
 ==
X-ME-Sender: <xms:k2ITYg1DJ9r2IhFfcfvSMzNI7kEXjoMtPSalk2csgJvn-Lpnc_dqqA>
 <xme:k2ITYrFW54bv4Ud56JCYIQT0SU9e45QiiNWrTaO5bTj8xKzICSF_7ecIwTL2iC3xI
 75fJooC3tD4TBd9duw>
X-ME-Received: <xmr:k2ITYo5H76hJSDqzC3Al226i425t-ykezK6FeQqEtea1SkvLU2fp_9lDHgMMb1U_jMyE7EiulnDnG59V6bX8JXoBGpIOwpJMJIA1r04>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrkeeigddtlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:k2ITYp139kdH45Y02HzSBkPoQd_5dSVtMjyG1WLTnY8Amj3w4Hq_nw>
 <xmx:k2ITYjHAZ7py4G8q-95E59O_SFy0sn3rrvjsR_yhm-mBDJhvPgn31Q>
 <xmx:k2ITYi9368BPsO05RHkjajZT5Axvm6blhi1lMva1nvKoEYqDihZ_Hw>
 <xmx:k2ITYtHT8WR5X1zkbNdfqSI1bmRGcaszeSlZ47gcaci6Okmh0sRixw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Feb 2022 04:59:46 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>,
	David Airlie <airlied@linux.ie>
Subject: [PATCH v2 11/22] drm/imx: ipuv3-plane: Remove redundant zpos
 initialisation
Date: Mon, 21 Feb 2022 10:59:07 +0100
Message-Id: <20220221095918.18763-12-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220221095918.18763-1-maxime@cerno.tech>
References: <20220221095918.18763-1-maxime@cerno.tech>
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
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The imx KMS driver will call drm_plane_create_zpos_property() with an
init value depending on the plane purpose.

Since the initial value wasn't carried over in the state, the driver had
to set it again in ipu_plane_state_reset(). However, the helpers have
been adjusted to set it properly at reset, so this is not needed
anymore.

Cc: linux-arm-kernel@lists.infradead.org
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/imx/ipuv3-plane.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3-plane.c b/drivers/gpu/drm/imx/ipuv3-plane.c
index 846c1aae69c8..414bdf08d0b0 100644
--- a/drivers/gpu/drm/imx/ipuv3-plane.c
+++ b/drivers/gpu/drm/imx/ipuv3-plane.c
@@ -297,7 +297,6 @@ void ipu_plane_disable_deferred(struct drm_plane *plane)
 
 static void ipu_plane_state_reset(struct drm_plane *plane)
 {
-	unsigned int zpos = (plane->type == DRM_PLANE_TYPE_PRIMARY) ? 0 : 1;
 	struct ipu_plane_state *ipu_state;
 
 	if (plane->state) {
@@ -311,8 +310,6 @@ static void ipu_plane_state_reset(struct drm_plane *plane)
 
 	if (ipu_state) {
 		__drm_atomic_helper_plane_reset(plane, &ipu_state->base);
-		ipu_state->base.zpos = zpos;
-		ipu_state->base.normalized_zpos = zpos;
 		ipu_state->base.color_encoding = DRM_COLOR_YCBCR_BT601;
 		ipu_state->base.color_range = DRM_COLOR_YCBCR_LIMITED_RANGE;
 	}
-- 
2.35.1

