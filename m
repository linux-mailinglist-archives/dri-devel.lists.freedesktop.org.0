Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0975348D973
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 15:07:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB70810E4E0;
	Thu, 13 Jan 2022 14:07:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11CE410E474
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 14:07:50 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 3BB8B580802;
 Thu, 13 Jan 2022 09:07:49 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 13 Jan 2022 09:07:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=B7qDpJfcTH19C
 h5zaxHa4EsPUdIKPF/ULGmH4rUeL3I=; b=gktEGLEYp3IMNBFFr3oe/cw/Kfwyn
 CT5SyR1Pdp9EspArWgDPOFmUkhoywgLvhwjFu0F0vC8jruIOknWacEkrgUDjHC5C
 w7XfoeNY+c2SXYsXjV4LCdBw2vSVMkQFKqCf9AhWyrnPwGOF4LjFOn3mI2oEnYO2
 /P4QXgP7yveQ91yFQhc1H+zZbZUSBsys5/wjVMWpvHIsdw4n5mL7I2RsHwRrKXHY
 Cpe5p6vWvfu0OIGG5LeFSMwy8hNfG+LsI0bmEOuuIgkJUUA0qDTy1by5p40l1uhA
 bxZS5oEYgFFNZiL3UTqEZKSw3pbeEOxVlmP7C2ZQ2Luw58ntZpQwQmU4A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=B7qDpJfcTH19Ch5zaxHa4EsPUdIKPF/ULGmH4rUeL3I=; b=fldF88QL
 2nGK9WBYgN9ov7o3lRpYzt3De98eIhk35blf9tgluvFfBRmkMWrZ4CMUWkh/vXMc
 7U0K2a9Vgx4U+OYGSBeDFK04MW5D3gWRaMk1U+foTEuANvuuiDmWNG838vWZukOg
 z4a2a+TpTym3GT8h1dIxBLcpAzfbHp0ax5eeSSVC5fs4Re4e/7Hgl9dFJPqPyTQ4
 1tSZky4LLTQvQU9T8q+KkKWHotPFy5Vz4UITKxuyUOtn+pOE7+BS2nwiTdpI2XCh
 5xoJUMtDw17KTaVHiMCN2zuY7WP3cJv82+hMqLywS8F0oolmC7MBj1cwKN0NMB16
 orO0b9dOB8c2nQ==
X-ME-Sender: <xms:NTLgYTw7mgqtz5Aa-8DFkGQYYR_mA-fOni58PnjN8mg-MWrX_JA0zw>
 <xme:NTLgYbQ8KQCxAK8sG166KD4WsHzvsC9BridFn72RQUR7ohIYp57strvZpCQG9VJWb
 bRuF10yPsF6stYsxEs>
X-ME-Received: <xmr:NTLgYdXoaCO7XI43XmAhhMJM0oTrVUaUsL-T08LOpy68roAplu4yT7VWB9JRTyQebC5pD9idfUfRnJrIlg8vArYVayscRvbqtFiXt4Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrtdefgdehlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:NTLgYdjsGfRrkSKgjv9HoAiOpvLp-TFDd6f2A3Xs4WS7q1tjMdwmog>
 <xmx:NTLgYVCsNx2hwS773R_MVT0o-kj9G26y3nwwj9LOTvorodNG1D93dQ>
 <xmx:NTLgYWLaKjB1RfYcM4XvE6gZCuKYYnEshzBhFqAIg2_U80m1_7z3Qg>
 <xmx:NTLgYZ7yIX8mDuFFgFxgL1J7fEZsu1npIvxHPR2Tv-_agwMqMw1big>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Jan 2022 09:07:48 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v3 11/16] drm/vc4: hdmi: Move clock validation to its own
 function
Date: Thu, 13 Jan 2022 15:07:15 +0100
Message-Id: <20220113140720.1678907-12-maxime@cerno.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220113140720.1678907-1-maxime@cerno.tech>
References: <20220113140720.1678907-1-maxime@cerno.tech>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Werner Sembach <wse@tuxedocomputers.com>, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Our code is doing the same clock rate validation in multiple instances.
Let's create a helper to share the rate validation.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index d79a70bae7f2..1b75e8cfd5d5 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1262,6 +1262,19 @@ static void vc4_hdmi_encoder_atomic_mode_set(struct drm_encoder *encoder,
 	mutex_unlock(&vc4_hdmi->mutex);
 }
 
+static enum drm_mode_status
+vc4_hdmi_encoder_clock_valid(const struct vc4_hdmi *vc4_hdmi,
+			     unsigned long long clock)
+{
+	if (clock > vc4_hdmi->variant->max_pixel_clock)
+		return MODE_CLOCK_HIGH;
+
+	if (vc4_hdmi->disable_4kp60 && clock > HDMI_14_MAX_TMDS_CLK)
+		return MODE_CLOCK_HIGH;
+
+	return MODE_OK;
+}
+
 #define WIFI_2_4GHz_CH1_MIN_FREQ	2400000000ULL
 #define WIFI_2_4GHz_CH1_MAX_FREQ	2422000000ULL
 
@@ -1305,10 +1318,7 @@ static int vc4_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
 	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
 		pixel_rate = pixel_rate * 2;
 
-	if (pixel_rate > vc4_hdmi->variant->max_pixel_clock)
-		return -EINVAL;
-
-	if (vc4_hdmi->disable_4kp60 && (pixel_rate > HDMI_14_MAX_TMDS_CLK))
+	if (vc4_hdmi_encoder_clock_valid(vc4_hdmi, pixel_rate) != MODE_OK)
 		return -EINVAL;
 
 	vc4_state->pixel_rate = pixel_rate;
@@ -1327,13 +1337,7 @@ vc4_hdmi_encoder_mode_valid(struct drm_encoder *encoder,
 	     (mode->hsync_end % 2) || (mode->htotal % 2)))
 		return MODE_H_ILLEGAL;
 
-	if ((mode->clock * 1000) > vc4_hdmi->variant->max_pixel_clock)
-		return MODE_CLOCK_HIGH;
-
-	if (vc4_hdmi->disable_4kp60 && vc4_hdmi_mode_needs_scrambling(mode))
-		return MODE_CLOCK_HIGH;
-
-	return MODE_OK;
+	return vc4_hdmi_encoder_clock_valid(vc4_hdmi, mode->clock * 1000);
 }
 
 static const struct drm_encoder_helper_funcs vc4_hdmi_encoder_helper_funcs = {
-- 
2.34.1

