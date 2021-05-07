Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F04537678C
	for <lists+dri-devel@lfdr.de>; Fri,  7 May 2021 17:05:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 698706EE58;
	Fri,  7 May 2021 15:05:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F125A6EE58
 for <dri-devel@lists.freedesktop.org>; Fri,  7 May 2021 15:05:39 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id BA54F1361;
 Fri,  7 May 2021 11:05:38 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 07 May 2021 11:05:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=18fpWr48RtAkP
 m/b4PbmAztbbn4pmVuXqk9uW+P5wP0=; b=D18NDZpJmMgS1//hpnUh4HzRpV4sv
 VUAA2G2xqWP09c3PD4qk4/aSCZ584m01LWdotLRwxzpMvjJmsQEklkwWmuLbDxxc
 xC8GTJAV0nY7ACA5plXsqoq0bi0gUMAKd16555c4TC7zK70gpxWDQhFyTBG8fWBa
 N0OKDy4NsKPvSvembVkEX9p5Oluaa0uyIwfGPOg92XjFL3x2Zdima85isRtKFG3I
 +qWz+iuBsZupNGVabo0Z6kSENNM/ZaxEedJFyWuRJwcbD7IE4pjegRmCnOIiM3Pq
 4cE0O5OZTso0v/ZTg/1POQWRVsht67N4YRzisgIZAGkOzetrh0EJAZk1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=18fpWr48RtAkPm/b4PbmAztbbn4pmVuXqk9uW+P5wP0=; b=BCCvO8cd
 F+I3OFmxu5BWKBD1NYGt77+C0aV/ek6XKKlhP0jTF8+381xtZbft0YoJAlMFvB8W
 j9X5a7d3MwVqnV4e1nA+lI0mbZ5MM2n9WeU32p4BPTtTYkPJoXENnwpSDl46Ephc
 9niJiz0nLNvxTD5Yoes6Br6X7NekHB9q1FlRridDkjJZiOpicIpbQP4Y4zGDlA5J
 9UcE/FwjWeqbmKMAorgiUOzb18YvYW3CVwYgIiyi2vfxlKv8MarYcYKXbRr7IyP1
 FknISSZqUWLDk3CPuVGepfyAS1myW2APhvVaTQQDjzEistO3eCIJ+6E2094/ZfxG
 lUkcBHQ47GgWig==
X-ME-Sender: <xms:QFeVYAsACpImVOFDIANu6UAaCvQUuylnLqPrvURk4mnxWEBYkqOngw>
 <xme:QFeVYNcCZgYJw3iGkx56iV-0VwPNYSB04XIU5sBPdWpuW-I0-76nLTgl23qEcK1Gn
 Rg6Vx82HKjZMhIbJAQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdegvddgkeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:QFeVYLy3kGcgCFrCZiDygGLegmC2A0oKmu4vmdIytARAM_mV-cHnDw>
 <xmx:QFeVYDOP5Mskppx56ANWIew0OaHqlqvzJxscJ-JRarvDaMILHeT_6Q>
 <xmx:QFeVYA-PQKKgPYaI5gXw8gId80JquAqtA7pzuIoF7JY4znkyGUBjtg>
 <xmx:QleVYLUjBIwiaWrMkUQvrW886UTQE-pv_HW2SD5EFoCPwV5GTX-84VLmodw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Fri,  7 May 2021 11:05:36 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>
Subject: [PATCH v4 03/12] drm/vc4: crtc: Pass the drm_atomic_state to config_pv
Date: Fri,  7 May 2021 17:05:06 +0200
Message-Id: <20210507150515.257424-4-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210507150515.257424-1-maxime@cerno.tech>
References: <20210507150515.257424-1-maxime@cerno.tech>
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
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The vc4_crtc_config_pv will need to access the drm_atomic_state
structure and its only parent function, vc4_crtc_atomic_enable already
has access to it. Let's pass it as a parameter.

Fixes: 792c3132bc1b ("drm/vc4: encoder: Add finer-grained encoder callbacks")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index f1f2e8cbce79..8a19d6c76605 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -288,7 +288,7 @@ static void vc4_crtc_pixelvalve_reset(struct drm_crtc *crtc)
 	CRTC_WRITE(PV_CONTROL, CRTC_READ(PV_CONTROL) | PV_CONTROL_FIFO_CLR);
 }
 
-static void vc4_crtc_config_pv(struct drm_crtc *crtc)
+static void vc4_crtc_config_pv(struct drm_crtc *crtc, struct drm_atomic_state *state)
 {
 	struct drm_device *dev = crtc->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
@@ -296,8 +296,8 @@ static void vc4_crtc_config_pv(struct drm_crtc *crtc)
 	struct vc4_encoder *vc4_encoder = to_vc4_encoder(encoder);
 	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
 	const struct vc4_pv_data *pv_data = vc4_crtc_to_vc4_pv_data(vc4_crtc);
-	struct drm_crtc_state *state = crtc->state;
-	struct drm_display_mode *mode = &state->adjusted_mode;
+	struct drm_crtc_state *crtc_state = crtc->state;
+	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
 	bool interlace = mode->flags & DRM_MODE_FLAG_INTERLACE;
 	u32 pixel_rep = (mode->flags & DRM_MODE_FLAG_DBLCLK) ? 2 : 1;
 	bool is_dsi = (vc4_encoder->type == VC4_ENCODER_TYPE_DSI0 ||
@@ -522,7 +522,7 @@ static void vc4_crtc_atomic_enable(struct drm_crtc *crtc,
 	if (vc4_encoder->pre_crtc_configure)
 		vc4_encoder->pre_crtc_configure(encoder, state);
 
-	vc4_crtc_config_pv(crtc);
+	vc4_crtc_config_pv(crtc, state);
 
 	CRTC_WRITE(PV_CONTROL, CRTC_READ(PV_CONTROL) | PV_CONTROL_EN);
 
-- 
2.31.1

