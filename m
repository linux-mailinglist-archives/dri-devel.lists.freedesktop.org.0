Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E131C48D974
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 15:08:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BEDE10E445;
	Thu, 13 Jan 2022 14:07:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2A8A10E445
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 14:07:51 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 49D91580804;
 Thu, 13 Jan 2022 09:07:51 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 13 Jan 2022 09:07:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=7nAf39eyUOGHQ
 Cxi1E+JIB69OCUrURQkvBDtCyY2nnk=; b=bmF7a70v0LedoxOP9CtbAjqOQE1YI
 8DwM412zKqw0CFFQBDJFlegj1x4c+GLEw8UT+x4+nz0PgigzG9tldcCFkQVLMCZF
 YtalSi9Y2Wn+ImzXvE6MUOjJbLYAKNwqjushNKVvSDLHNhvmPx6VKSNAe2uhCMaN
 xugvx0nmdMd+2boMdG9oB1L3mkDZalphFNuXEItkE6k07UcdGCi9g4NCER9xqf8d
 kBiEEOyLn4ZCkC/sxKSZZ7DqyieiS/mNSfPpjJmc/impuJmwWXqrNj2WTFFleyYG
 5we7t1MjjxlwLnRhNERrcNbYbrS9eJTuCsyA/Aqa3044pA9LkpgoycqIA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=7nAf39eyUOGHQCxi1E+JIB69OCUrURQkvBDtCyY2nnk=; b=en5qCFfd
 nKOa0D5RQhA8PLWcoyToTqcrP9WHqMtfEJU3EiYPMHd45+X+i4ZRmrPNT4qAB0V5
 v7T/AI3QVgRfU0M0Uyks1VlCZkROQywtLvbrA1WH9FO7AWkJa7B7mcF+lfFjjnir
 IWZX2O/0Wz5xVKzfFM/MQXlg49ukxO1jSYqpLBbyQpEVIb5R4gaUZ/DDQKtR20eb
 b5uUMm/lVjgJOWpGbkU/kl9mLoSijBT1sykEPBiAJyHQTQ1GFU+0tcOD4lDqaVY7
 AlpxZzce/9owySLXX1OFeIoM32TxyKfosbO0FafklaPdsX6BSwysdS5GwlF9Nc/k
 XQWzU7zGse0K3Q==
X-ME-Sender: <xms:NzLgYfz0UqkjgxCzyAMRxJiyzBNwaf1UvSIvygMCXKNVnXR1mDz3rQ>
 <xme:NzLgYXTTskiErz9v43tnqT76NNcJKAmdUNvx-L0eX1m6igwrOFoxfvDl17xO-JkLz
 UaOul6z3XTbMfGye8U>
X-ME-Received: <xmr:NzLgYZWYbhyNLPpzHs4dBFboHWx8vMn67aAhe6di1dsHuAR36AgPZbzBijvEU-oOH-0xQ7h3gfSa6FTIMC_KCKET8USNoEcvGZ7FP_g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrtdefgdehlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:NzLgYZhBbJwVOm1RTgJmitkvTxrEj0ykelO1itvj2kGrClERfenknQ>
 <xmx:NzLgYRBCamErOSIDYe-46i18-bA2E9ONP5ykaOGDS71ybMEIkTQP0w>
 <xmx:NzLgYSIdPzkXwuXT0CFvCw9sG7uuQjrXGQGWTfj-BkpfTphazFu-BA>
 <xmx:NzLgYV54JRBdbXnfHTERV_iU3RH5O8QnKJpIxWVh5EL9LV9HoW3Viw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Jan 2022 09:07:50 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v3 12/16] drm/vc4: hdmi: Move clock calculation into its own
 function
Date: Thu, 13 Jan 2022 15:07:16 +0100
Message-Id: <20220113140720.1678907-13-maxime@cerno.tech>
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

The code to compute our clock rate for a given setup will be called in
multiple places in the next patches, so let's create a separate function
for it.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 49 +++++++++++++++++++++++-----------
 1 file changed, 34 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 1b75e8cfd5d5..764f3c5cfa54 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1275,6 +1275,35 @@ vc4_hdmi_encoder_clock_valid(const struct vc4_hdmi *vc4_hdmi,
 	return MODE_OK;
 }
 
+static unsigned long long
+vc4_hdmi_encoder_compute_mode_clock(const struct drm_display_mode *mode,
+				    unsigned int bpc)
+{
+	unsigned long long clock = mode->crtc_clock * 1000;
+
+	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
+		clock = clock * 2;
+
+	return clock * bpc / 8;
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
+	vc4_state->pixel_rate = clock;
+
+	return 0;
+}
+
 #define WIFI_2_4GHz_CH1_MIN_FREQ	2400000000ULL
 #define WIFI_2_4GHz_CH1_MAX_FREQ	2422000000ULL
 
@@ -1287,6 +1316,7 @@ static int vc4_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 	unsigned long long pixel_rate = mode->clock * 1000;
 	unsigned long long tmds_rate;
+	int ret;
 
 	if (vc4_hdmi->variant->unsupported_odd_h_timings &&
 	    ((mode->hdisplay % 2) || (mode->hsync_start % 2) ||
@@ -1307,21 +1337,10 @@ static int vc4_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
 		pixel_rate = mode->clock * 1000;
 	}
 
-	if (conn_state->max_bpc == 12) {
-		pixel_rate = pixel_rate * 150;
-		do_div(pixel_rate, 100);
-	} else if (conn_state->max_bpc == 10) {
-		pixel_rate = pixel_rate * 125;
-		do_div(pixel_rate, 100);
-	}
-
-	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
-		pixel_rate = pixel_rate * 2;
-
-	if (vc4_hdmi_encoder_clock_valid(vc4_hdmi, pixel_rate) != MODE_OK)
-		return -EINVAL;
-
-	vc4_state->pixel_rate = pixel_rate;
+	ret = vc4_hdmi_encoder_compute_clock(vc4_hdmi, vc4_state, mode,
+					     conn_state->max_bpc);
+	if (ret)
+		return ret;
 
 	return 0;
 }
-- 
2.34.1

