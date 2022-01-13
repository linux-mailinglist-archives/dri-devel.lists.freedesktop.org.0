Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BFD48D975
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 15:08:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B57B010E4B1;
	Thu, 13 Jan 2022 14:07:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E728310E445
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 14:07:55 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 4E3B3580800;
 Thu, 13 Jan 2022 09:07:55 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 13 Jan 2022 09:07:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=G4f+mKYUvZE9Z
 vWeBznATAoYZi3c0G0EF6ueZcw6SJA=; b=bGfmqkO8UJZaVImOuW++daMBVeGAu
 ouUHLekndFnXpwo+tbfBh0bYvNeXru99N9w8mRrHpd7bDNi8fA5mYQ7397hevl+e
 2iy114BGV+Mzgjk4bSpdZnW21Lach/fiX5dTFvFbGy6/vZnHgGli4cgXtIg851oZ
 i7PNie4Nb2GIehVpiyq8KzIrzvz18qhd9HDQoYzrsjjiGNvvz7IbA3+nojTJtqEm
 St9HCzLrUo4ox1fDRZOOJpywVDktgwRRnFyIfkJEPQ6hLgS6S3hKcZ/68NfV0q2J
 H7AKrisZjPGpQa89GCCYAzgnFuSLpM2+6M3w7N7PtugCVFFcWYlvgrcQA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=G4f+mKYUvZE9ZvWeBznATAoYZi3c0G0EF6ueZcw6SJA=; b=Dkz1IHzN
 /YNxFUdqui4Cy0ptXCDOw5k0R83dJjHN4tf5yGv2ycpORCBFRagxmS47d/caGd9u
 phfTFrB9P2JSbK3ukE+7X92D3lEWwIqlc6UhDXY4Q3Ki1XBLS3NFMriRsHpt/M1U
 YI9mf3CZLl4g5Liwp4nOVpOOdItZjdJkXR8SOqh1MfpYqNuNA7n6sialz8g5eVlC
 eQCnvU2TlYEogvUS+fM9Gkn0dmSBMr4uVmgZxUT5MU02UnoRzrDmepYX5AJOyY7G
 NwXKG6U96ulm5roBltnbPam4e0ejWg413l0uFtcbMhlNIREoHGdH0tf7tma+YprI
 GJuK5FZh4eOR1g==
X-ME-Sender: <xms:OzLgYSeRyyg0AC-rNcMpqwInHpUFyXhiLn0fcf8YY1RyN52jESnTKw>
 <xme:OzLgYcPz_yw0N-oDaZ-bywG-HJz9iNMWiuuetUoMXKzdGF60B4SoR_J3QXW26i0rf
 d27d8RoqtLURnVUvOw>
X-ME-Received: <xmr:OzLgYThUIOcUi2nL9S7pV77M6aWCrPTU8qkqdwuvdH_2P26TT1RJroNRO_WN77-aGQQvWdx-6BvGpjnwiTbSg85yAsCOr-4ok-EkdoA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrtdefgdehlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:OzLgYf-X8ewOcTTsSO6dx9dEo9g5QOUvtePScewi0Fl6wdyNfUqZsg>
 <xmx:OzLgYeuVxG6Rwe0Atv33km_E2BZHi1lEBSvCAbij4fkzqQKdn8GZfw>
 <xmx:OzLgYWGT70e8MBh7s4DDBkCUZiINn5b263j-huae6df7E4dtwTZp4w>
 <xmx:OzLgYfl4-EewclMpXGaM1kw2R6hIv7a6G7Q6drEfHuxbw6mrUZ3Bxw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Jan 2022 09:07:54 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v3 14/16] drm/vc4: hdmi: Take bpp into account for the
 scrambler
Date: Thu, 13 Jan 2022 15:07:18 +0100
Message-Id: <20220113140720.1678907-15-maxime@cerno.tech>
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

The current code only base its decision for whether the scrambler must be
enabled or not on the pixel clock of the mode, but doesn't take the bits
per color into account.

Let's leverage the new function to compute the clock rate in the
scrambler setup code.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 17 +++++++++++++----
 drivers/gpu/drm/vc4/vc4_hdmi.h |  5 +++++
 2 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index b68d3626d1a3..86801019ceb1 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -99,9 +99,17 @@
 
 #define HDMI_14_MAX_TMDS_CLK   (340 * 1000 * 1000)
 
-static bool vc4_hdmi_mode_needs_scrambling(const struct drm_display_mode *mode)
+
+static unsigned long long
+vc4_hdmi_encoder_compute_mode_clock(const struct drm_display_mode *mode,
+				    unsigned int bpc);
+
+static bool vc4_hdmi_mode_needs_scrambling(const struct drm_display_mode *mode,
+					   unsigned int bpc)
 {
-	return (mode->clock * 1000) > HDMI_14_MAX_TMDS_CLK;
+	unsigned long long clock = vc4_hdmi_encoder_compute_mode_clock(mode, bpc);
+
+	return clock > HDMI_14_MAX_TMDS_CLK;
 }
 
 static bool vc4_hdmi_is_full_range_rgb(struct vc4_hdmi *vc4_hdmi,
@@ -272,7 +280,7 @@ static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
 		struct drm_display_mode *mode;
 
 		list_for_each_entry(mode, &connector->probed_modes, head) {
-			if (vc4_hdmi_mode_needs_scrambling(mode)) {
+			if (vc4_hdmi_mode_needs_scrambling(mode, 8)) {
 				drm_warn_once(drm, "The core clock cannot reach frequencies high enough to support 4k @ 60Hz.");
 				drm_warn_once(drm, "Please change your config.txt file to add hdmi_enable_4kp60.");
 			}
@@ -613,7 +621,7 @@ static void vc4_hdmi_enable_scrambling(struct drm_encoder *encoder)
 	if (!vc4_hdmi_supports_scrambling(encoder, mode))
 		return;
 
-	if (!vc4_hdmi_mode_needs_scrambling(mode))
+	if (!vc4_hdmi_mode_needs_scrambling(mode, vc4_hdmi->output_bpc))
 		return;
 
 	drm_scdc_set_high_tmds_clock_ratio(vc4_hdmi->ddc, true);
@@ -1256,6 +1264,7 @@ static void vc4_hdmi_encoder_atomic_mode_set(struct drm_encoder *encoder,
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 
 	mutex_lock(&vc4_hdmi->mutex);
+	vc4_hdmi->output_bpc = conn_state->max_bpc;
 	memcpy(&vc4_hdmi->saved_adjusted_mode,
 	       &crtc_state->adjusted_mode,
 	       sizeof(vc4_hdmi->saved_adjusted_mode));
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 2b6aaafc020a..31b7d27deb8e 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -216,6 +216,11 @@ struct vc4_hdmi {
 	 * the scrambler on? Protected by @mutex.
 	 */
 	bool scdc_enabled;
+
+	/**
+	 * @output_bpc: BPC currently being used. Protected by @mutex.
+	 */
+	unsigned int output_bpc;
 };
 
 static inline struct vc4_hdmi *
-- 
2.34.1

