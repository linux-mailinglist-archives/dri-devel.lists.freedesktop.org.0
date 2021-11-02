Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0113443115
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 16:00:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2C9B72E68;
	Tue,  2 Nov 2021 14:59:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CACC72E67
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Nov 2021 14:59:56 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 74F12580741;
 Tue,  2 Nov 2021 10:59:55 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 02 Nov 2021 10:59:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=C1yMSCxaCLRX3
 7njEgMsoHBlkqfeB2jS3S4zsx7cBZM=; b=lqyuF6F6ei9hH7UL5c+iAw7uwpW13
 k0FNemi84j9JMumeMRiRMAAsf+onqzFW5ftCfWxlLYtQsccJK84q4ow6D8vA4i6U
 kZxvEHmZAcQI+quG+YjQICgXDnSNLvPmzGuafF2wO3xB69iB/A3gx3M/HilrN488
 EslLX4zcQ2vKazcwuTPIWbo1lnJfX6FP3ofTveqZjzp6yE3PxgrvA+s8dqxGcwty
 DXI27bGLUTuIdTi+3b5Y2fKyu/IIDNVmpNeyTWn503r0daaZkIx+PlKkEwY7ynH4
 N45QIKvZGYjkzpnn9PSyvLYcBME/12zxk17L2D5LqPjiFkSUsQ/E30MHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=C1yMSCxaCLRX37njEgMsoHBlkqfeB2jS3S4zsx7cBZM=; b=kkIRSaKG
 jHxVvsY34Bmyj9yLfFtaDszFnO4gISZqhjDCjUd22eg43F1kZSz0hVGCmU5Ywr84
 pwim8JotQOPDZr1/JNEEtpDT6W/o8kINQOI5OIRnPmD2G6Qg4G9WxJ3yBAfaj/VP
 PqJf/+8y0KmhD3NnbbrYfUFihjw4XFjfMcIhC/P7VfAJAMJg+DkRuaac0hEV3L5v
 Ebkx8OFczGh4qnKgXRyCHUy4hxA6l9iHPDg56pnO78a83ZSkINQUOpKHu6Q7aqIB
 2lVu5mwdvzSafN+K3EQVFwfqXnzq/7J5v2hbE5Pq6MpS8n3/o4ZXQl+246+wiL8M
 lZP4d18DjxMogg==
X-ME-Sender: <xms:a1KBYZ-Zqha1rBEBBT_pw9JaPmjwF2KBtWjlGoP6K06VtTTKIAhkxQ>
 <xme:a1KBYdteMrUz2y11gQxh-QbrmkozfEd9PaE7wEQUPn2A88dY2_yDRrBQ41pErRVqy
 xjST5K2IP-l0_uYQFU>
X-ME-Received: <xmr:a1KBYXB977pm8FAMTY9EMfvFJd3CvYDukcJ-bh6UFffq4aCcg4qnndJW5aEPe1wfOOM4bBZZXGVctpVPSulqjuxC1RjpFFb0HJi6Ifkd>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrtddtgdeghecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:a1KBYdd0zsp84Dl7x6bcpydl4-Em_Yrr3LYi3p4du_SXrJWUJSD_bg>
 <xmx:a1KBYeOtWDsehXjfvMHKigFv9J_Td7HQNWjXpLMhv9tLrAQSYnQavg>
 <xmx:a1KBYfmXJpmoMNOApkvpOnNzYkCVxWS1SwO2Oypvtqec3GBCAdlRjQ>
 <xmx:a1KBYYsqlI6HJvPZRaCs1RQkli6vWU-RNFypnXAzp0oMNId8Bo2r9g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 2 Nov 2021 10:59:54 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 02/13] drm/connector: Add helper to check if a mode requires
 scrambling
Date: Tue,  2 Nov 2021 15:59:33 +0100
Message-Id: <20211102145944.259181-3-maxime@cerno.tech>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211102145944.259181-1-maxime@cerno.tech>
References: <20211102145944.259181-1-maxime@cerno.tech>
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
 dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, Emma Anholt <emma@anholt.net>,
 linux-tegra@vger.kernel.org, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Most drivers supporting the HDMI scrambling seem to have the HDMI 1.4
maximum frequency open-coded, and a function to test whether a display
mode is above that threshold to control whether or not scrambling should
be enabled.

Let's create a common define and helper for drivers to reuse.

Cc: Emma Anholt <emma@anholt.net>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/tegra/sor.c    |  4 ++--
 drivers/gpu/drm/vc4/vc4_hdmi.c | 21 +++++++++------------
 include/drm/drm_modes.h        | 15 +++++++++++++++
 3 files changed, 26 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 99a2d627bfeb..390bd04b0d22 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -2192,11 +2192,11 @@ static void tegra_sor_hdmi_scdc_work(struct work_struct *work)
 static void tegra_sor_hdmi_scdc_start(struct tegra_sor *sor)
 {
 	struct drm_scdc *scdc = &sor->output.connector.display_info.hdmi.scdc;
-	struct drm_display_mode *mode;
+	const struct drm_display_mode *mode;
 
 	mode = &sor->output.encoder.crtc->state->adjusted_mode;
 
-	if (mode->clock >= DRM_HDMI_14_MAX_TMDS_CLK_KHZ && scdc->supported) {
+	if (drm_mode_hdmi_requires_scrambling(mode) && scdc->supported) {
 		schedule_delayed_work(&sor->scdc, msecs_to_jiffies(5000));
 		tegra_sor_hdmi_scdc_enable(sor);
 		sor->scdc_enabled = true;
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index fc7247cc1022..fa76ae2c94e4 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -99,11 +99,6 @@
 
 #define HDMI_14_MAX_TMDS_CLK	(DRM_HDMI_14_MAX_TMDS_CLK_KHZ * 1000)
 
-static bool vc4_hdmi_mode_needs_scrambling(const struct drm_display_mode *mode)
-{
-	return mode->clock > DRM_HDMI_14_MAX_TMDS_CLK_KHZ;
-}
-
 static int vc4_hdmi_debugfs_regs(struct seq_file *m, void *unused)
 {
 	struct drm_info_node *node = (struct drm_info_node *)m->private;
@@ -260,10 +255,10 @@ static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
 
 	if (vc4_hdmi->disable_4kp60) {
 		struct drm_device *drm = connector->dev;
-		struct drm_display_mode *mode;
+		const struct drm_display_mode *mode;
 
 		list_for_each_entry(mode, &connector->probed_modes, head) {
-			if (vc4_hdmi_mode_needs_scrambling(mode)) {
+			if (drm_mode_hdmi_requires_scrambling(mode)) {
 				drm_warn_once(drm, "The core clock cannot reach frequencies high enough to support 4k @ 60Hz.");
 				drm_warn_once(drm, "Please change your config.txt file to add hdmi_enable_4kp60.");
 			}
@@ -574,7 +569,7 @@ static void vc4_hdmi_set_infoframes(struct drm_encoder *encoder)
 }
 
 static bool vc4_hdmi_supports_scrambling(struct drm_encoder *encoder,
-					 struct drm_display_mode *mode)
+					 const struct drm_display_mode *mode)
 {
 	struct vc4_hdmi_encoder *vc4_encoder = to_vc4_hdmi_encoder(encoder);
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
@@ -597,7 +592,7 @@ static bool vc4_hdmi_supports_scrambling(struct drm_encoder *encoder,
 static void vc4_hdmi_enable_scrambling(struct drm_encoder *encoder)
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
-	struct drm_display_mode *mode = &vc4_hdmi->saved_adjusted_mode;
+	const struct drm_display_mode *mode = &vc4_hdmi->saved_adjusted_mode;
 	unsigned long flags;
 
 	lockdep_assert_held(&vc4_hdmi->mutex);
@@ -605,7 +600,7 @@ static void vc4_hdmi_enable_scrambling(struct drm_encoder *encoder)
 	if (!vc4_hdmi_supports_scrambling(encoder, mode))
 		return;
 
-	if (!vc4_hdmi_mode_needs_scrambling(mode))
+	if (!drm_mode_hdmi_requires_scrambling(mode))
 		return;
 
 	drm_scdc_set_high_tmds_clock_ratio(vc4_hdmi->ddc, true);
@@ -1283,7 +1278,8 @@ static int vc4_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
 	if (pixel_rate > vc4_hdmi->variant->max_pixel_clock)
 		return -EINVAL;
 
-	if (vc4_hdmi->disable_4kp60 && (pixel_rate > HDMI_14_MAX_TMDS_CLK))
+	if (vc4_hdmi->disable_4kp60 &&
+	    drm_mode_hdmi_requires_scrambling(mode))
 		return -EINVAL;
 
 	vc4_state->pixel_rate = pixel_rate;
@@ -1305,7 +1301,8 @@ vc4_hdmi_encoder_mode_valid(struct drm_encoder *encoder,
 	if ((mode->clock * 1000) > vc4_hdmi->variant->max_pixel_clock)
 		return MODE_CLOCK_HIGH;
 
-	if (vc4_hdmi->disable_4kp60 && vc4_hdmi_mode_needs_scrambling(mode))
+	if (vc4_hdmi->disable_4kp60 &&
+	    drm_mode_hdmi_requires_scrambling(mode))
 		return MODE_CLOCK_HIGH;
 
 	return MODE_OK;
diff --git a/include/drm/drm_modes.h b/include/drm/drm_modes.h
index 29ba4adf0c53..d22816d55836 100644
--- a/include/drm/drm_modes.h
+++ b/include/drm/drm_modes.h
@@ -424,6 +424,21 @@ static inline bool drm_mode_is_stereo(const struct drm_display_mode *mode)
 	return mode->flags & DRM_MODE_FLAG_3D_MASK;
 }
 
+/**
+ * drm_mode_hdmi_requires_scrambling - Checks if a mode requires HDMI Scrambling
+ * @mode: DRM display mode
+ *
+ * Checks if a given display mode requires the scrambling to be enabled.
+ *
+ * Returns:
+ * A boolean stating whether it's required or not.
+ */
+static inline bool
+drm_mode_hdmi_requires_scrambling(const struct drm_display_mode *mode)
+{
+	return mode->clock > DRM_HDMI_14_MAX_TMDS_CLK_KHZ;
+}
+
 struct drm_connector;
 struct drm_cmdline_mode;
 
-- 
2.32.0

