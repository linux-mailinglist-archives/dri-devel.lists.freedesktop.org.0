Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A574BFF04
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 17:41:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CF1C10E859;
	Tue, 22 Feb 2022 16:40:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56CF910E850
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 16:40:56 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id B6058580118;
 Tue, 22 Feb 2022 11:40:55 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 22 Feb 2022 11:40:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=ZA9fJAhwzlq/qkh29fuN+QNBVStQzb
 gFzZ3ilIgOeXE=; b=d3WVtCtFl81/rId99cDtUuXga9gWzkB0fBy+TmA6GyMYTg
 EqR855mCcIIM0vsVIubiVkm05HkmQ7V2UkLSvTfkklwL5Z5V9zuR79Zglt6sN4Bq
 +WYI4tlM8/aam/rkDNx/Is9mJ2QyMSrzfaXVI94++1BmVK95mm7P+RH/zBqt+loq
 0kUwflH3f/ZY5EhZlZ0bHOwi0E1ZW93aPLq4JrRVkJufe4boM/G6K64s1GCUSvGR
 y4e8uhqVVo1BHiw7+oMAsty76FpURmjlL3bHyin89pO3627iWywHmZU76bqppj1W
 AsB483RJu53PWE2+0t97d30rBEM1bOmGIFcr3HhQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=ZA9fJA
 hwzlq/qkh29fuN+QNBVStQzbgFzZ3ilIgOeXE=; b=bElZId7j66ViDwJjU/Qyva
 U8hCHI+9Xb4wjiEWSKaEpDyldzzM4+NfPDPwke5zE7h4ii8yFPnPT220oG+SpC9J
 vjsO7Bsk45/C4E72PvPFU03dsTcTn9uqwP3NkaSrEk9nwOGJeX3vaL3cVTNrTVRw
 M+NK/ecvVPNxO/CcB6k5jCgHG3h5OzG9GfCK0sEZMiD/JXcuhc7bNKTp1H/sGwgs
 EPm092SD+ORkKkVpujL5Z4YPWQH0F4eDo+bBABdY4Xkp+2mSYoENMMYnbC6EDx/3
 rIegYqw1ATVVi0nrL5HlzbzyKA7HiM6sV0IVuc4bG4iHqLFYz4vtVZPTJcfZzGrA
 ==
X-ME-Sender: <xms:FxIVYpC69-P7Nq6KQfKq4cGWAXd086VXFDVSmbm_6CSQFWAkYMT4gw>
 <xme:FxIVYnjrzcbgiaPJKm9n4G2feJ2Xq1RaeVk4HmMqQEhX0t2NGGzFlWMusbElGJ74c
 ya50UhCeVgZAW8ti2c>
X-ME-Received: <xmr:FxIVYklqO8GGUS3S3XQUQBDjTMKdAVYlhjTkpTZrlo2ExYcz_dNVXjHdKq3QoyWNRUciWLUBl4S4ACcXKynhpi6D4ntFUQZ8YI7Jn3s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrkeekgdeltdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:FxIVYjxD-TU39r24YJ1HiKqUqPLwmi3W_U5uIGQLz7BaMR7QoIZ7vg>
 <xmx:FxIVYuRMHS16sGKGltG-qVvEGlmaGTT0pddF60He6svSL3Ag-_88pQ>
 <xmx:FxIVYmYxpaOv-oZYjvwCNjxb3v4y62EgA-G7XBE6uctYpkat9gOxVw>
 <xmx:FxIVYjLgwJasSi9a0GR5E9yT6rJqDxA4yJ8fHgTxBL7wNBTSgaTF6w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Feb 2022 11:40:54 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v6 3/7] drm/vc4: hdmi: Move clock calculation into its own
 function
Date: Tue, 22 Feb 2022 17:40:38 +0100
Message-Id: <20220222164042.403112-4-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222164042.403112-1-maxime@cerno.tech>
References: <20220222164042.403112-1-maxime@cerno.tech>
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

The code to compute our clock rate for a given setup will be called in
multiple places in the next patches, so let's create a separate function
for it.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 52 ++++++++++++++++++++++++----------
 1 file changed, 37 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index d4cebb524578..e5d9d54ce20a 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1258,6 +1258,38 @@ vc4_hdmi_encoder_clock_valid(const struct vc4_hdmi *vc4_hdmi,
 	return MODE_OK;
 }
 
+static unsigned long long
+vc4_hdmi_encoder_compute_mode_clock(const struct drm_display_mode *mode,
+				    unsigned int bpc)
+{
+	unsigned long long clock = mode->clock * 1000;
+
+	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
+		clock = clock * 2;
+
+	clock = clock * bpc;
+	do_div(clock, 8);
+
+	return clock;
+}
+
+static int
+vc4_hdmi_encoder_compute_clock(const struct vc4_hdmi *vc4_hdmi,
+			       struct vc4_hdmi_connector_state *vc4_state,
+			       const struct drm_display_mode *mode,
+			       unsigned int bpc)
+{
+	unsigned long long clock;
+
+	clock = vc4_hdmi_encoder_compute_mode_clock(mode, bpc);
+	if (vc4_hdmi_encoder_clock_valid(vc4_hdmi, clock) != MODE_OK)
+		return -EINVAL;
+
+	vc4_state->tmds_char_rate = clock;
+
+	return 0;
+}
+
 #define WIFI_2_4GHz_CH1_MIN_FREQ	2400000000ULL
 #define WIFI_2_4GHz_CH1_MAX_FREQ	2422000000ULL
 
@@ -1270,6 +1302,7 @@ static int vc4_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 	unsigned long long tmds_char_rate = mode->clock * 1000;
 	unsigned long long tmds_bit_rate;
+	int ret;
 
 	if (vc4_hdmi->variant->unsupported_odd_h_timings &&
 	    ((mode->hdisplay % 2) || (mode->hsync_start % 2) ||
@@ -1290,21 +1323,10 @@ static int vc4_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
 		tmds_char_rate = mode->clock * 1000;
 	}
 
-	if (conn_state->max_bpc == 12) {
-		tmds_char_rate = tmds_char_rate * 150;
-		do_div(tmds_char_rate, 100);
-	} else if (conn_state->max_bpc == 10) {
-		tmds_char_rate = tmds_char_rate * 125;
-		do_div(tmds_char_rate, 100);
-	}
-
-	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
-		tmds_char_rate = tmds_char_rate * 2;
-
-	if (vc4_hdmi_encoder_clock_valid(vc4_hdmi, tmds_char_rate) != MODE_OK)
-		return -EINVAL;
-
-	vc4_state->tmds_char_rate = tmds_char_rate;
+	ret = vc4_hdmi_encoder_compute_clock(vc4_hdmi, vc4_state, mode,
+					     conn_state->max_bpc);
+	if (ret)
+		return ret;
 
 	return 0;
 }
-- 
2.35.1

