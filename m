Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 450BA645976
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 12:56:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12C1F10E39C;
	Wed,  7 Dec 2022 11:55:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 328FC10E38D
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Dec 2022 11:55:24 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 8C2215C01BF;
 Wed,  7 Dec 2022 06:55:23 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Wed, 07 Dec 2022 06:55:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1670414123; x=
 1670500523; bh=X2hQ875cJr6jux9kv8eLCChlul/kVrxgraf+5nmcpRo=; b=g
 kmn3P6sMXGAM+BdypeUKpEWc7LSr6tnHstqZkIccBqrb0h3X/Nq38zP0OAtNAESG
 9bmDvsRanMehMqZ9zX45WJouzGOJBjGlhDE19G4W2t5+qS0KUPBM9jHzOMpopfpB
 XxE9OQSvHO4sjm6QsHfYUJwEmHiEIMQkZi2Zr+TU9Km1thRw2rAHRMBgv4g0Rir+
 lmvgck5aVC0MPXzHz9f4TGUafPAUqpz50Iz0rY5sq6SACeVFctNpcaWa+9wtv+hj
 c6EA0WBCqT+CFTcFY9pDJcDa7VQBDuHc0falWpsp8yOSDKIW7ioLHxmIeaQ8Jmmz
 K/nF6OThRF/jiFr5EZQwQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1670414123; x=
 1670500523; bh=X2hQ875cJr6jux9kv8eLCChlul/kVrxgraf+5nmcpRo=; b=Q
 ngTnO4hnt4/eNHLcVPmYfcOrM/pY7tgK9ddH70o+9JiAPQdPWtVVV73HGzAIQm/b
 SjzEuJhwaxPYoJYjmhbNQQg5lD3bL1OULQv91v7yTUN61D8tdX+J4H0csv5ZyLzC
 cYBbX7eKQyTlvKvMT/YXqGPg/Kv5+D5UAD8Kcxd3HtDmx0nR4TxdTpn3rTVB0WRV
 N0NRnjTR01TGPoskcxNcUaELLU3MppMjLw6uRHLbJq7zqNT5GMjyEzwT48hc+qns
 z2ToX4aNV2fZW7LooUhb5JiETiwi0Ab3MknkRlRBJyx73QX8emeVVxvlDiqK0b3D
 wTZr5OkznjxIiiGJOxCKA==
X-ME-Sender: <xms:K3-QYy7vYOzZeTCdd8-yG-8MfFdX3MGTS45kSq-O0yP_wFP6zPSlXg>
 <xme:K3-QY75Gh2b3xRbjjjmkXxJAH6PJ3mI6jdDpIC5p8xqqVDd11x3DSPcWPrCxZ15uV
 q10QUycUHVSFj5ufeY>
X-ME-Received: <xmr:K3-QYxcrsCPtayennT-oW0fcHktTTgfXp9qp7GpSy4ZRG4LMLTm651D-C5fzsbQypXHIlTc-5BTv13-1gwCrtgwBopTO4dWHJQ2LjmTRQXR0TQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudekgdefgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeevvdelieejgedvkeffheekheeilefhgefgffehteekueelvddtueffheet
 ledtffenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:K3-QY_Ju0Gho3ZM7dYdw9WTQA9RANu2osv6TsfdP_HFOYyw7uLZACw>
 <xmx:K3-QY2JtyEM138QqmPuMJ3GqjkyjPEHI3NMEJfVsYtfuOBJLEizk5Q>
 <xmx:K3-QYww720GIqsBpvHlsRD1HsMBdqob8hQf2nMKIUpcCiSFizRDpdw>
 <xmx:K3-QY7BjZ4EQZV56OgK9xa2iY_umnKKNb9ZmoAAiHWiVNcahCzPQNg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Dec 2022 06:55:22 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Wed, 07 Dec 2022 12:53:17 +0100
Subject: [PATCH 06/15] drm/vc4: hvs: Fix colour order for xRGB1555 on HVS5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221207-rpi-hvs-crtc-misc-v1-6-1f8e0770798b@cerno.tech>
References: <20221207-rpi-hvs-crtc-misc-v1-0-1f8e0770798b@cerno.tech>
In-Reply-To: <20221207-rpi-hvs-crtc-misc-v1-0-1f8e0770798b@cerno.tech>
To: Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Eric Anholt <eric@anholt.net>
X-Mailer: b4 0.11.0-dev-8c583
X-Developer-Signature: v=1; a=openpgp-sha256; l=1057; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=/1kOYXeyAfVkMPpUTJD425tdluFPJeVWER3c4oJ8z4s=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMkT6la+mS9b5L5S1UQ8/WPN4b9b92xpYW1mff4x60HbsWL/
 jROXdZSyMIhxMciKKbLECJsviTs163UnG988mDmsTCBDGLg4BWAifuYM/8sDM3Y4RVX6cl2oXuE151
 /fzuNNr/8tjNebavm1oWHR8pUM/wO2Byx7tVR/VXKIjKyCY5ZhxBZj1QXq3HoutWs6xb5kMAIA
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
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
Cc: Maxime Ripard <maxime@cerno.tech>,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

Same as the xRGB8888 formats, HVS5 has managed to swap the colour
channels for the xRGB1555 formats as well. Add the relevant
config for pixel_order_hvs5.

Fixes: c54619b0bfb3 ("drm/vc4: Add support for the BCM2711 HVS5")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_plane.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index c212f8c10388..e60d6f1a7de1 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -75,11 +75,13 @@ static const struct hvs_format {
 		.drm = DRM_FORMAT_ARGB1555,
 		.hvs = HVS_PIXEL_FORMAT_RGBA5551,
 		.pixel_order = HVS_PIXEL_ORDER_ABGR,
+		.pixel_order_hvs5 = HVS_PIXEL_ORDER_ARGB,
 	},
 	{
 		.drm = DRM_FORMAT_XRGB1555,
 		.hvs = HVS_PIXEL_FORMAT_RGBA5551,
 		.pixel_order = HVS_PIXEL_ORDER_ABGR,
+		.pixel_order_hvs5 = HVS_PIXEL_ORDER_ARGB,
 	},
 	{
 		.drm = DRM_FORMAT_RGB888,

-- 
2.38.1
