Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAEA1475908
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 13:44:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E042510EC93;
	Wed, 15 Dec 2021 12:44:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56CD910EC93
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 12:44:29 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id CC4C02B0024D;
 Wed, 15 Dec 2021 07:44:27 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Wed, 15 Dec 2021 07:44:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=zSBHCb7fgzJiq
 tav6OZ8z83n/yX43s2VtjJr+582bo0=; b=H4D+nKGQaY9Qq1xn6c9p1xxHrDp1F
 P3Bybp5VGFsriTz/r33Py3gcxClzacxMJWqEhk6EMCELpwetLuKRNPWd7G1maT89
 ApfAWygi8pAgHrAqfM/g/W4XyNBiPjCOzoHkhcY4ZnvFxy0P2QZoUG518yT8n4pz
 CQI++S07oWNcsCGkDsd2gv4y0B21KZhJ2eAYFCNx1nDLpWqs9SRZFQz90dUdvMh+
 B/qWDoK+vDTL8aZi+r/PE61ri23dya1mZedFdsXzcggPVLGC5GelQ8GGJvXgp2kA
 izJxkFflMm4VgwuHt5DN/PaafGBHs8TJsQBLrM2b8cXGTBXNs52GtXC7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=zSBHCb7fgzJiqtav6OZ8z83n/yX43s2VtjJr+582bo0=; b=b/QkiuBn
 1P0sT65mKTFXoYNEzkWZ0QtWiiaABGWuZsLOwXAUixwAMLIJaTKqXqgCBWvSrLZj
 vEqJWGc5BQQwln3M/s56pIQj69yjbaBtntH766iL+3rlYd44EjaRaBbs4Pa6KWtK
 dETu1iCxSr7c09BXXJDVsgwuXIgboVzjOK7ZQgXFfCGxc3iFZZB95/LkrmehL36X
 P8zv4+ldzPwDPwAPIoS13XWRlQio8FjkE5mHOT1YO3bGuDKUHbO7xyUOQeNuKUp3
 BBnKVZYq8ZIDkx7w45rAGcyEoOFT4smcN2zTD8psX53M/P/IU7IPYftkYqo9pZpm
 bKZNzZWRXSfLIA==
X-ME-Sender: <xms:K-O5Yeol6bO-m8ByWkRQIuejBjGe0zC-UAUuT6jZIHhUdNDCyfo7Ig>
 <xme:K-O5Ycp8Azpz3Kb0AMpWZc2XYDNp_XIe0ztA_kjX085HbJNBCvB4YyS7oNkGkMMiT
 KmQiivj-r6kBe0i5-A>
X-ME-Received: <xmr:K-O5YTP2MQOeVeqvro3qiYKT2nNDhnHoJ6MjvBVMGL2g-5ZviT9JPBQmHF-LJNqmVc_CNO843pyj7SDDxE6iLff4VZ8Cu6pTzy_yvK8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrledvgdeghecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:K-O5Yd4RX7WrVa-Vgm7U3yW2uE6JE3aZ4-h-qoXE4zOA_K1xtytNeA>
 <xmx:K-O5Yd7Tc9xBAY3uLox4kywTxPClrqmmPHFTW-pKy_-I5qGSx_Q_dA>
 <xmx:K-O5YdhFOUOvJOjCe8PTjDNrD3LZFTIqEMO1rg44D7HPmHbhfmRQCg>
 <xmx:K-O5YawZD7IstBHDgeKYFMQfdhk9xWAlhiJUCpC8BmKks3_tn0EOFopviQk>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Dec 2021 07:44:26 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 04/14] drm/vc4: hdmi: Use full range helper in csc functions
Date: Wed, 15 Dec 2021 13:43:56 +0100
Message-Id: <20211215124406.340180-5-maxime@cerno.tech>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211215124406.340180-1-maxime@cerno.tech>
References: <20211215124406.340180-1-maxime@cerno.tech>
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
 dri-devel@lists.freedesktop.org, Werner Sembach <wse@tuxedocomputers.com>,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The CSC callbacks takes a boolean as an argument to tell whether we're
using the full range or limited range RGB.

However, with the upcoming YUV support, the logic will be a bit more
complex. In order to address this, let's make the callbacks take the
entire mode, and call our new helper to tell whether the full or limited
range RGB should be used.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 31 +++++++++++--------------------
 drivers/gpu/drm/vc4/vc4_hdmi.h |  4 ++--
 2 files changed, 13 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 7966e3b00332..47ff4507f017 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -490,7 +490,6 @@ static void vc4_hdmi_write_infoframe(struct drm_encoder *encoder,
 static void vc4_hdmi_set_avi_infoframe(struct drm_encoder *encoder)
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
-	struct vc4_hdmi_encoder *vc4_encoder = to_vc4_hdmi_encoder(encoder);
 	struct drm_connector *connector = &vc4_hdmi->connector;
 	struct drm_connector_state *cstate = connector->state;
 	const struct drm_display_mode *mode = &vc4_hdmi->saved_adjusted_mode;
@@ -508,9 +507,9 @@ static void vc4_hdmi_set_avi_infoframe(struct drm_encoder *encoder)
 
 	drm_hdmi_avi_infoframe_quant_range(&frame.avi,
 					   connector, mode,
-					   vc4_encoder->limited_rgb_range ?
-					   HDMI_QUANTIZATION_RANGE_LIMITED :
-					   HDMI_QUANTIZATION_RANGE_FULL);
+					   vc4_hdmi_is_full_range_rgb(vc4_hdmi, mode) ?
+					   HDMI_QUANTIZATION_RANGE_FULL :
+					   HDMI_QUANTIZATION_RANGE_LIMITED);
 	drm_hdmi_avi_infoframe_colorimetry(&frame.avi, cstate);
 	drm_hdmi_avi_infoframe_bars(&frame.avi, cstate);
 
@@ -735,7 +734,8 @@ static void vc4_hdmi_encoder_disable(struct drm_encoder *encoder)
 	mutex_unlock(&vc4_hdmi->mutex);
 }
 
-static void vc4_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi, bool enable)
+static void vc4_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
+			       const struct drm_display_mode *mode)
 {
 	unsigned long flags;
 	u32 csc_ctl;
@@ -745,7 +745,7 @@ static void vc4_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi, bool enable)
 	csc_ctl = VC4_SET_FIELD(VC4_HD_CSC_CTL_ORDER_BGR,
 				VC4_HD_CSC_CTL_ORDER);
 
-	if (enable) {
+	if (!vc4_hdmi_is_full_range_rgb(vc4_hdmi, mode)) {
 		/* CEA VICs other than #1 requre limited range RGB
 		 * output unless overridden by an AVI infoframe.
 		 * Apply a colorspace conversion to squash 0-255 down
@@ -775,7 +775,8 @@ static void vc4_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi, bool enable)
 	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
 }
 
-static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi, bool enable)
+static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
+			       const struct drm_display_mode *mode)
 {
 	unsigned long flags;
 	u32 csc_ctl;
@@ -784,7 +785,7 @@ static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi, bool enable)
 
 	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
 
-	if (enable) {
+	if (!vc4_hdmi_is_full_range_rgb(vc4_hdmi, mode)) {
 		/* CEA VICs other than #1 requre limited range RGB
 		 * output unless overridden by an AVI infoframe.
 		 * Apply a colorspace conversion to squash 0-255 down
@@ -1123,22 +1124,12 @@ static void vc4_hdmi_encoder_pre_crtc_enable(struct drm_encoder *encoder,
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 	struct drm_display_mode *mode = &vc4_hdmi->saved_adjusted_mode;
-	struct vc4_hdmi_encoder *vc4_encoder = to_vc4_hdmi_encoder(encoder);
 	unsigned long flags;
 
 	mutex_lock(&vc4_hdmi->mutex);
 
-	if (!vc4_hdmi_is_full_range_rgb(vc4_hdmi, mode)) {
-		if (vc4_hdmi->variant->csc_setup)
-			vc4_hdmi->variant->csc_setup(vc4_hdmi, true);
-
-		vc4_encoder->limited_rgb_range = true;
-	} else {
-		if (vc4_hdmi->variant->csc_setup)
-			vc4_hdmi->variant->csc_setup(vc4_hdmi, false);
-
-		vc4_encoder->limited_rgb_range = false;
-	}
+	if (vc4_hdmi->variant->csc_setup)
+		vc4_hdmi->variant->csc_setup(vc4_hdmi, mode);
 
 	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
 	HDMI_WRITE(HDMI_FIFO_CTL, VC4_HDMI_FIFO_CTL_MASTER_SLAVE_N);
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 36c0b082a43b..4a5536975bf6 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -12,7 +12,6 @@
 struct vc4_hdmi_encoder {
 	struct vc4_encoder base;
 	bool hdmi_monitor;
-	bool limited_rgb_range;
 };
 
 static inline struct vc4_hdmi_encoder *
@@ -77,7 +76,8 @@ struct vc4_hdmi_variant {
 	void (*reset)(struct vc4_hdmi *vc4_hdmi);
 
 	/* Callback to enable / disable the CSC */
-	void (*csc_setup)(struct vc4_hdmi *vc4_hdmi, bool enable);
+	void (*csc_setup)(struct vc4_hdmi *vc4_hdmi,
+			  const struct drm_display_mode *mode);
 
 	/* Callback to configure the video timings in the HDMI block */
 	void (*set_timings)(struct vc4_hdmi *vc4_hdmi,
-- 
2.33.1

