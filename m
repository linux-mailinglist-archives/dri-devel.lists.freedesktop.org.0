Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB98B455939
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 11:38:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B387F6EA3D;
	Thu, 18 Nov 2021 10:38:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 104F36EA3A
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 10:38:44 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 64830580810;
 Thu, 18 Nov 2021 05:38:43 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 18 Nov 2021 05:38:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=OnKhOoKGXC3xr
 yTcIvIu29XIMPhSZohfyDwYrsn4r1w=; b=kTyBQK5Se9jVUsU6c5ZC/+mbNYH4n
 QtoBIxrFRUwhfrS8bFhtRgYZk2kluraiuBKYLA6N3UskNqeDYmLZ0rzNhX8xndEz
 dshpPaXtaTv8geZdiHW3t00Xty5mZAwof8SOkUmjcv3zIU9KO4xKclko/WpqPbdx
 8v5uIwSDRRmdAGeNhRLMxebZgvuWx8DbSx5yh4v8tzj9kZwf8rffnf6H0cq3A5Sw
 lhJeNNYWW/2Oj9+RWVo9929dhmeqlQSj1JwSZ9GD/+FWXkq5AKhFzM9D7Na+MJej
 /hjDObIeuFQl+5NwultKWS4y/2UrC7QS4PwzGTmPhA+sJAqrrNSMv6WXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=OnKhOoKGXC3xryTcIvIu29XIMPhSZohfyDwYrsn4r1w=; b=JYzNUwmy
 9eelsfZKvFX7YQ0kc638uURkA9EqVi6m5qCQQm0ML7fXscF5FqDCTnVtqneWDsQH
 DdQLic5UZOXizKfCnqVoWyOhOpyAwgCgGx3IUscp42+PBgF0PMxq+TZV6GA69z89
 dcRjsmVXW8r9JkV4L4WML/QO10QcsD6ojEAP0D8PO4plzs3rU82Fm3yHzV+ZI1E9
 3fBUsmbqhLcD+3MwEF+A+l0vk9AmO0YuCfuaWwRJMIF+4HB/8Vkz1l0ZzgHg4dOy
 85EYbBUI/JpfQeRs3uqnFMgfw/yJiaF2IfY5o8L4S/jynbWknL/Kkm+AhO8v5kKQ
 WMaJ3auGEWyXyA==
X-ME-Sender: <xms:My2WYcqu-pCFlIYvbV5NLYBdTCZuQwWKj5LXJqSdm0e2D9M-mQ92Ag>
 <xme:My2WYSoE9IlqJaKQIFaTfCEMBmdKxK7DuRebHlmv6Vcz78ogrS-7lA-4I5vbR6FGZ
 h-X31Dtt86rmnOiLAI>
X-ME-Received: <xmr:My2WYRPauzKDHGcNi0GElhRu6iL_IoXgeck0rFD61jklMUWn8qrKmVULGpUMn-YDZpan1peF0SP41CxSnzxVXn8vf7Sj9nsLT85yyWaxN9U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrfeeigdduiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:My2WYT5YUCgCqXVmUBoizdbv9RDfhwT9PlDUiqT7WcL9yjcfSLwsFw>
 <xmx:My2WYb4K6bJWFez28A9YSrhn9q09Nda3uDjythwwav9XborW9bfRRQ>
 <xmx:My2WYTjj7rgVFAoiNl3cjL_2wZKLT96J9LbOSJkWnGySx3-6sE-TaQ>
 <xmx:My2WYYEERDY0IBk4Bmu98mjiG99HRQDRfdYFk2C4yD_OpIgYQm6Z7A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 18 Nov 2021 05:38:42 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 12/13] drm/vc4: hdmi: Leverage new SCDC atomic_check
Date: Thu, 18 Nov 2021 11:38:13 +0100
Message-Id: <20211118103814.524670-13-maxime@cerno.tech>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211118103814.524670-1-maxime@cerno.tech>
References: <20211118103814.524670-1-maxime@cerno.tech>
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
 dri-devel@lists.freedesktop.org, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that we have a generic helper to fill the scrambling status, let's
use it.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 46 +++++++++++-----------------------
 drivers/gpu/drm/vc4/vc4_hdmi.h |  6 +++++
 2 files changed, 21 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 5858058165a2..ba939dab35c0 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -99,11 +99,6 @@
 
 #define HDMI_14_MAX_TMDS_CLK   (340 * 1000 * 1000)
 
-static bool vc4_hdmi_mode_needs_scrambling(const struct drm_display_mode *mode)
-{
-	return (mode->clock * 1000) > HDMI_14_MAX_TMDS_CLK;
-}
-
 static int vc4_hdmi_debugfs_regs(struct seq_file *m, void *unused)
 {
 	struct drm_info_node *node = (struct drm_info_node *)m->private;
@@ -296,7 +291,7 @@ static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
 		const struct drm_display_mode *mode;
 
 		list_for_each_entry(mode, &connector->probed_modes, head) {
-			if (vc4_hdmi_mode_needs_scrambling(mode)) {
+			if (drm_mode_hdmi_requires_scrambling(mode, 8)) {
 				drm_warn_once(drm, "The core clock cannot reach frequencies high enough to support 4k @ 60Hz.");
 				drm_warn_once(drm, "Please change your config.txt file to add hdmi_enable_4kp60.");
 			}
@@ -314,6 +309,14 @@ static int vc4_hdmi_connector_atomic_check(struct drm_connector *connector,
 	struct drm_connector_state *new_state =
 		drm_atomic_get_new_connector_state(state, connector);
 	struct drm_crtc *crtc = new_state->crtc;
+	int ret;
+
+	ret = drm_atomic_helper_connector_hdmi_check(connector, state);
+	if (ret)
+		return ret;
+
+	if (new_state->hdmi_needs_scrambling != new_state->hdmi_needs_high_tmds_ratio)
+		return -EINVAL;
 
 	if (!crtc)
 		return 0;
@@ -603,37 +606,16 @@ static void vc4_hdmi_set_infoframes(struct drm_encoder *encoder)
 	vc4_hdmi_set_hdr_infoframe(encoder);
 }
 
-static bool vc4_hdmi_supports_scrambling(struct drm_encoder *encoder)
-{
-	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
-	struct drm_display_info *display = &vc4_hdmi->connector.display_info;
-
-	lockdep_assert_held(&vc4_hdmi->mutex);
-
-	if (!display->is_hdmi)
-		return false;
-
-	if (!display->hdmi.scdc.supported ||
-	    !display->hdmi.scdc.scrambling.supported)
-		return false;
-
-	return true;
-}
-
 #define SCRAMBLING_POLLING_DELAY_MS	1000
 
 static void vc4_hdmi_enable_scrambling(struct drm_encoder *encoder)
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
-	const struct drm_display_mode *mode = &vc4_hdmi->saved_adjusted_mode;
 	unsigned long flags;
 
 	lockdep_assert_held(&vc4_hdmi->mutex);
 
-	if (!vc4_hdmi_supports_scrambling(encoder))
-		return;
-
-	if (!vc4_hdmi_mode_needs_scrambling(mode))
+	if (!vc4_hdmi->scdc_needed)
 		return;
 
 	drm_scdc_set_high_tmds_clock_ratio(vc4_hdmi->ddc, true);
@@ -1245,6 +1227,7 @@ static void vc4_hdmi_encoder_atomic_mode_set(struct drm_encoder *encoder,
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 
 	mutex_lock(&vc4_hdmi->mutex);
+	vc4_hdmi->scdc_needed = conn_state->hdmi_needs_scrambling;
 	memcpy(&vc4_hdmi->saved_adjusted_mode,
 	       &crtc_state->adjusted_mode,
 	       sizeof(vc4_hdmi->saved_adjusted_mode));
@@ -1275,7 +1258,7 @@ static int vc4_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
 	 * bandwidth). Slightly lower the frequency to bring it out of
 	 * the WiFi range.
 	 */
-	tmds_rate = pixel_rate * 10;
+	tmds_rate = pixel_rate * (conn_state->hdmi_needs_high_tmds_ratio ? 40 : 10);
 	if (vc4_hdmi->disable_wifi_frequencies &&
 	    (tmds_rate >= WIFI_2_4GHz_CH1_MIN_FREQ &&
 	     tmds_rate <= WIFI_2_4GHz_CH1_MAX_FREQ)) {
@@ -1297,7 +1280,7 @@ static int vc4_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
 	if (pixel_rate > vc4_hdmi->variant->max_pixel_clock)
 		return -EINVAL;
 
-	if (vc4_hdmi->disable_4kp60 && (pixel_rate > HDMI_14_MAX_TMDS_CLK))
+	if (vc4_hdmi->disable_4kp60 && conn_state->hdmi_needs_scrambling)
 		return -EINVAL;
 
 	vc4_state->pixel_rate = pixel_rate;
@@ -1319,7 +1302,8 @@ vc4_hdmi_encoder_mode_valid(struct drm_encoder *encoder,
 	if ((mode->clock * 1000) > vc4_hdmi->variant->max_pixel_clock)
 		return MODE_CLOCK_HIGH;
 
-	if (vc4_hdmi->disable_4kp60 && vc4_hdmi_mode_needs_scrambling(mode))
+	if (vc4_hdmi->disable_4kp60 &&
+	    drm_mode_hdmi_requires_scrambling(mode, 8))
 		return MODE_CLOCK_HIGH;
 
 	return MODE_OK;
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 4b9175f8aaaf..36f6a208b729 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -206,6 +206,12 @@ struct vc4_hdmi {
 	 * the scrambler on? Protected by @mutex.
 	 */
 	bool scdc_enabled;
+
+	/**
+	 * @scdc_needed: Is the HDMI controller needs to have the
+	 * scrambling on? Protected by @mutex.
+	 */
+	bool scdc_needed;
 };
 
 static inline struct vc4_hdmi *
-- 
2.33.1

