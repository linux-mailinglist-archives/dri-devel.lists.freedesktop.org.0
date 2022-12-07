Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC066457C8
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 11:27:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64CCD10E392;
	Wed,  7 Dec 2022 10:27:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B500910E38F
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Dec 2022 10:27:19 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 1B31D5C01C6;
 Wed,  7 Dec 2022 05:27:19 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 07 Dec 2022 05:27:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1670408839; x=
 1670495239; bh=Zn5jcj0nU0NQg/fB7GJUuCXybzPA29EmtUUxU6l8Xro=; b=E
 wuHCkoD5BEswQC9qUuPfaaqVKsMliy8vHaeLW61fXj/q8yKZCL5IvVJpI4alxzdV
 3gvWCzgR59199Zb9qSHkvTWzEYsinVkjSGrrpK3B66WKkgFDYGPJYehdcoU0HoVt
 uQZIb/1hdRf7wMSQnKEHzI6kYh+8lumue2V36gAP6DLZoEhWBMLlXeV/Tx1O3JOo
 G3+FeGOXbvJHIrmGU1KK8tsMenMODr9mCuZxviw9L1tE/+wTeRkl74XCJtXAMHvw
 nyznme2vhKyAc4J2RrUdFMDouDfffxusMkU4iG3UYCjrsUiNSOf8+zF+gZ2SOJ+Q
 IAT6ANuaUvC/P2gNZ+SOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1670408839; x=
 1670495239; bh=Zn5jcj0nU0NQg/fB7GJUuCXybzPA29EmtUUxU6l8Xro=; b=O
 Em7LebaaCIxXob7HuXAjoWNVUY9POi5Tpz7ddMXAxbL2X9EXwy56scD6DRJgeK/1
 ktJrzah4EKNRzd15gaCm6EtLAAKcK29psDPEXACESTZqRDAa66fmLmzsiE0Mew5w
 nWbRnECnSov4WgHpZ6r5xG934CNfFsMLwF6CDV+oNfBlHG7SgWH0nmrjvIU61l3O
 ZDIUhJmKFenPO9vhcz78QFu99FWe2XDf0f1bSivJwHOpr7fzaotHXSKOybLoZQ3u
 eI5Pt/bXDoNKWvhc4V8RX6fRHVlSR3LKLtCEPS22UFvvXBhfyKkQq2wXIVeqpgu5
 Up6ikjU3AFwbj1cLzKssg==
X-ME-Sender: <xms:hmqQY_nWgLKjeGi8t1b1ovx4PtIKpXQ4wnVg6uI2uZEjHkVBgjy-Ow>
 <xme:hmqQYy1agSVrWhhkKFU0g44QFr26R2fbz77DFafQ3qIMVsAdE8_spTEdqwxIz9siV
 8-uIfp6zwZAbO-lLnU>
X-ME-Received: <xmr:hmqQY1or9E1G1hBiqxV8YqQia-dCgohoDqyCEXK09D3uHLhPRcMnOmgEn8ZhiTlJwbHHIZZpO28E3bJDjsUvjct62mcXMJRgU8tIfuekNOC6Uw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudekgddugecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeevvdelieejgedvkeffheekheeilefhgefgffehteekueelvddtueffheet
 ledtffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:hmqQY3m9xNetr0JhaD4XnblOqrpUAX8BDHL8_cZMLn2M8foyVan5ew>
 <xmx:hmqQY90mz3YiOcEsEx_-Z_WFJWdYuDlUr2FfjwJEyV7O06n-APDZLA>
 <xmx:hmqQY2u2wK2BJALPeqYq0PIy5fS_ous5mgwuBvMiei5q_ZrWgPVG7w>
 <xmx:h2qQY3Mp2AwbpxThg4M4scdRoeF4EL0z_Rzp5QfvdxptTfnrEO-mCA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Dec 2022 05:27:18 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Wed, 07 Dec 2022 11:22:45 +0100
Subject: [PATCH 2/6] drm/vc4: dsi: Move initialisation to encoder_mode_set
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221207-rpi-dsi-bridge-v1-2-8f68ee0b0adb@cerno.tech>
References: <20221207-rpi-dsi-bridge-v1-0-8f68ee0b0adb@cerno.tech>
In-Reply-To: <20221207-rpi-dsi-bridge-v1-0-8f68ee0b0adb@cerno.tech>
To: Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.11.0-dev-8c583
X-Developer-Signature: v=1; a=openpgp-sha256; l=2358; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=3tiWtws48aAKGnXcNHWpHDYHrtyX9rE7+J92kYYHF9A=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMkTMkslXzLeKGBUO2H0unniv7QQ8z7lXy/O3b53qfvphBWp
 r8/xdZSyMIhxMciKKbLECJsviTs163UnG988mDmsTCBDGLg4BWAieiWMDN8+yBe1KEZtrjT42aOgsv
 fWNJs1WapSE1mNlALXfuQ+Is/IsOGY+TXVhZbcwVp3zpck1erx8t+JLt+6hS3kyIRDyz+8YwEA
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
Cc: Maxime Ripard <maxime@cerno.tech>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

Breaking the bridge chain does not work for atomic bridges/panels
and generally causes issues.
We need to initialise the DSI host before the bridge pre_enables
are called, so move that to encoder_mode_set in the same way that
dw-mipi-dsi does.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_dsi.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index d9d951e9ab7c..607ebe368409 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -867,18 +867,18 @@ static bool vc4_dsi_encoder_mode_fixup(struct drm_encoder *encoder,
 	return true;
 }
 
-static void vc4_dsi_encoder_enable(struct drm_encoder *encoder)
+static void vc4_dsi_encoder_mode_set(struct drm_encoder *encoder,
+				     struct drm_display_mode *mode,
+				     struct drm_display_mode *adjusted_mode)
 {
-	struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
 	struct vc4_dsi *dsi = to_vc4_dsi(encoder);
 	struct device *dev = &dsi->pdev->dev;
 	bool debug_dump_regs = false;
-	struct drm_bridge *iter;
 	unsigned long hs_clock;
 	u32 ui_ns;
 	/* Minimum LP state duration in escape clock cycles. */
 	u32 lpx = dsi_esc_timing(60);
-	unsigned long pixel_clock_hz = mode->clock * 1000;
+	unsigned long pixel_clock_hz = adjusted_mode->clock * 1000;
 	unsigned long dsip_clock;
 	unsigned long phy_clock;
 	int ret;
@@ -1105,6 +1105,13 @@ static void vc4_dsi_encoder_enable(struct drm_encoder *encoder)
 		       ~DSI_PORT_BIT(PHY_AFEC0_RESET));
 
 	vc4_dsi_ulps(dsi, false);
+}
+
+static void vc4_dsi_encoder_enable(struct drm_encoder *encoder)
+{
+	struct vc4_dsi *dsi = to_vc4_dsi(encoder);
+	bool debug_dump_regs = false;
+	struct drm_bridge *iter;
 
 	list_for_each_entry_reverse(iter, &dsi->bridge_chain, chain_node) {
 		if (iter->funcs->pre_enable)
@@ -1370,6 +1377,7 @@ static const struct drm_encoder_helper_funcs vc4_dsi_encoder_helper_funcs = {
 	.disable = vc4_dsi_encoder_disable,
 	.enable = vc4_dsi_encoder_enable,
 	.mode_fixup = vc4_dsi_encoder_mode_fixup,
+	.mode_set = vc4_dsi_encoder_mode_set,
 };
 
 static int vc4_dsi_late_register(struct drm_encoder *encoder)

-- 
2.38.1
