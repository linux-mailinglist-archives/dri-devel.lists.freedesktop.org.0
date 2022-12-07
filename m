Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA06A6457CD
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 11:27:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EDD710E396;
	Wed,  7 Dec 2022 10:27:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35A1910E392
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Dec 2022 10:27:23 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 9044B5C0113;
 Wed,  7 Dec 2022 05:27:22 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 07 Dec 2022 05:27:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1670408842; x=
 1670495242; bh=j72BaHFyaTxFOjEUAha4RtUDZFCZoWNUBdI79nsXaTQ=; b=R
 TxHcrcOJG43IWsUGKtFeTz45rZzwmVW1r2KFSQXX1Xf4tFxpC14QNFMLp5HJkYzF
 mV7gJaH1rU5YIxMFkHac+XJQPosI6Lf2/WVc5u9Uf/34zUCa47UE32MF5AoCI+nm
 otQQ2pRvyeWAwbK5SyzqTrrPPWI5gG/Ueud9IlicdoSQyZ5WKy5YQbdPNT0lM8wx
 D31yBK4ziALKFMmMDLOHmg3j5RDrN3Xq/dd1W21p5Jf+iJL91+ozIdexDB5F7tki
 flSV8aC7k6EiVVtEtCVlQnKAG+ybWVGb5DJicr6y8y2lRVLPklDtOQVvhR4YHBAv
 G5o9llUwDedG/PbLK/Ipw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1670408842; x=
 1670495242; bh=j72BaHFyaTxFOjEUAha4RtUDZFCZoWNUBdI79nsXaTQ=; b=s
 0Xs//yopxl2aiiorM0laR64MDvfw0i7gJIRWRfrXyK0Ni8GnzRcJ1CoPaDS3A/te
 OL4oMVD5UgHunRLSSyrMy2q4z2xd8kDtC9VqkwXtKupMIR/W0d797CshUJTiG2vN
 MZLzI9UuOC3IV1g4A7PQOm+u0pxWUJ3vIuCqbjCM7n2D5icW+LU7IqSaLqdboR7/
 fR3p7DbEy7PTPvFijvbeyvkoRiBVmVu2zObPrCggyAshLP+Dmkv/orJ+se3/jXxA
 GKmPgl/ptRjAWsz4yt8qNtiAzPRdh+NHPrHUQlWZK2jfN+nAWOAZzDIVRwu3nL4l
 B9i/btWB7m7hvA8MGD60Q==
X-ME-Sender: <xms:imqQYzSrqI5Mh-ZL5l3WGJeFHRUCJjDGveVivJ5QbkoGvi999_ZWrw>
 <xme:imqQY0y5h3ueePRniOdIfObaxD5Xpu1HXhkdtDN41tDydjTptwGU_h0FCqWrWdr-Q
 iJgtUxiJVVLJueQ1qs>
X-ME-Received: <xmr:imqQY42FtDrGULKvzlryj__geJy47AcLllBLttdAWTTrnp0PCvMqp396SmRZ7nzQBJdssMs9TdV5qijaanrvbRAlGF7eHBCTGcg4EpFLfBWhRg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudekgdduhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeevvdelieejgedvkeffheekheeilefhgefgffehteekueelvddtueffheet
 ledtffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:imqQYzD3uNd2wZSmQFN_vNIfmqEkDA7ZSN264wyhBPIqdV7EbIuSgg>
 <xmx:imqQY8gjWsQ9BKehDp86x676o8G2Hr_i7cZw3nCI9Dbyl9dt6iJ78A>
 <xmx:imqQY3qIzYNtjvZsd6FqxNNk_c5AEIYPDGVv5BB9aB0jBSEsC1kN-g>
 <xmx:imqQY86GD7XmE9YSaQlL8ccBDCLnk61-_UDwiFlZvSzq2tmvqGjjKQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Dec 2022 05:27:21 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Wed, 07 Dec 2022 11:22:47 +0100
Subject: [PATCH 4/6] drm/vc4: dsi: Convert to use atomic operations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221207-rpi-dsi-bridge-v1-4-8f68ee0b0adb@cerno.tech>
References: <20221207-rpi-dsi-bridge-v1-0-8f68ee0b0adb@cerno.tech>
In-Reply-To: <20221207-rpi-dsi-bridge-v1-0-8f68ee0b0adb@cerno.tech>
To: Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.11.0-dev-8c583
X-Developer-Signature: v=1; a=openpgp-sha256; l=3055; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=CXisU7c7qlb5YkMujGkhm32rlKYH8x7P9zn1D9smdLI=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMkTMkulWlkX6qxZeGDyZBmP1WLT60yuaa2Wc3DoZVouFyx0
 JUKno5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABPpqGf4p8l4XMD6u0TzO2a1Xytnzv
 K+aX5l8U+LkoiVoWem/VT+2MLwz/Tzf94Foa0lnfpPT5dduqr2K+TF4TMmr9fdbNl/b/VeRS4A
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

The atomic calls are preferred as the non-atomic ones
are deprecated. In preparation for conversion to a bridge,
switch to the atomic calls.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_dsi.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index 53d73a6590b7..b90186f38749 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -789,7 +789,8 @@ dsi_esc_timing(u32 ns)
 	return DIV_ROUND_UP(ns, ESC_TIME_NS);
 }
 
-static void vc4_dsi_encoder_disable(struct drm_encoder *encoder)
+static void vc4_dsi_encoder_disable(struct drm_encoder *encoder,
+				    struct drm_atomic_state *state)
 {
 	struct vc4_dsi *dsi = to_vc4_dsi(encoder);
 	struct device *dev = &dsi->pdev->dev;
@@ -853,17 +854,18 @@ static bool vc4_dsi_encoder_mode_fixup(struct drm_encoder *encoder,
 }
 
 static void vc4_dsi_encoder_mode_set(struct drm_encoder *encoder,
-				     struct drm_display_mode *mode,
-				     struct drm_display_mode *adjusted_mode)
+				     struct drm_crtc_state *crtc_state,
+				     struct drm_connector_state *conn_state)
 {
 	struct vc4_dsi *dsi = to_vc4_dsi(encoder);
 	struct device *dev = &dsi->pdev->dev;
+	const struct drm_display_mode *mode;
 	bool debug_dump_regs = false;
 	unsigned long hs_clock;
 	u32 ui_ns;
 	/* Minimum LP state duration in escape clock cycles. */
 	u32 lpx = dsi_esc_timing(60);
-	unsigned long pixel_clock_hz = adjusted_mode->clock * 1000;
+	unsigned long pixel_clock_hz;
 	unsigned long dsip_clock;
 	unsigned long phy_clock;
 	int ret;
@@ -880,6 +882,10 @@ static void vc4_dsi_encoder_mode_set(struct drm_encoder *encoder,
 		drm_print_regset32(&p, &dsi->regset);
 	}
 
+	mode = &crtc_state->adjusted_mode;
+
+	pixel_clock_hz = mode->clock * 1000;
+
 	/* Round up the clk_set_rate() request slightly, since
 	 * PLLD_DSI1 is an integer divider and its rate selection will
 	 * never round up.
@@ -1092,7 +1098,8 @@ static void vc4_dsi_encoder_mode_set(struct drm_encoder *encoder,
 	vc4_dsi_ulps(dsi, false);
 }
 
-static void vc4_dsi_encoder_enable(struct drm_encoder *encoder)
+static void vc4_dsi_encoder_enable(struct drm_encoder *encoder,
+				   struct drm_atomic_state *state)
 {
 	struct vc4_dsi *dsi = to_vc4_dsi(encoder);
 	bool debug_dump_regs = false;
@@ -1348,10 +1355,10 @@ static const struct mipi_dsi_host_ops vc4_dsi_host_ops = {
 };
 
 static const struct drm_encoder_helper_funcs vc4_dsi_encoder_helper_funcs = {
-	.disable = vc4_dsi_encoder_disable,
-	.enable = vc4_dsi_encoder_enable,
+	.atomic_disable = vc4_dsi_encoder_disable,
+	.atomic_enable = vc4_dsi_encoder_enable,
 	.mode_fixup = vc4_dsi_encoder_mode_fixup,
-	.mode_set = vc4_dsi_encoder_mode_set,
+	.atomic_mode_set = vc4_dsi_encoder_mode_set,
 };
 
 static int vc4_dsi_late_register(struct drm_encoder *encoder)

-- 
2.38.1
