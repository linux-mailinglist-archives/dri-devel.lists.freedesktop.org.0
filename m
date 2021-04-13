Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD08D35E1FF
	for <lists+dri-devel@lfdr.de>; Tue, 13 Apr 2021 16:55:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DE236E7D1;
	Tue, 13 Apr 2021 14:55:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56CBD6E5D5
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 14:54:59 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.west.internal (Postfix) with ESMTP id 4CC381669;
 Tue, 13 Apr 2021 10:54:58 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Tue, 13 Apr 2021 10:54:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=G9sz3gHOptD32
 9jOHslDjEgRtBnjrnhiuADZ42Bml8M=; b=VUTpekGDDMeszkiOcQs79rrdfX1C9
 JrD5AOIsVDwkp8kRcwkz9ktwhvVMdh7edGmBKELBRCHXOSzRDmKFoZHXzaRqOodD
 vHmkGf/wfu4Qz/Fh985YsFvn4Zcnh+XLyeLH4Y37P2a9uwfGavNXO/xP6uplGJjx
 GfNrWo/kV4NF5H6/ooplz4JayRNRqFzhBfBT49qui0fvI9sIWUZ9eTPV8dzHfex5
 9msXmNsLbRTj0PAZZOTwsZyAsQEK1+r7F1A3aJsWmkYm5w9IskfyaQMK0iYajznK
 GPoGihnyzwOIDdXh35JsFcy3m60FaqdBGUcD8OPFizBwcPyL7vp333/xw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=G9sz3gHOptD329jOHslDjEgRtBnjrnhiuADZ42Bml8M=; b=Rro7i7hD
 WFMWtf6kKTtmGtbwlIwrFF/is3muLFVq7RAtIyQm9nfbTMk2cULlF0eK1gb4D8yQ
 SHHPvOCB/E9UnVn2jdyrOdbpMlkpK+J4nONsxVlg+n9efCZo5GZk1Wck95nJPBiD
 0qT5Z5cAI+OvEwcFFyIaBcNqgxIR89iltRZPssKEsjtL1xwUkCu9s68y0Mmx11JG
 2SQDfnwznVymu6UizMpE+II8r6H0H4UAt+pGoRkBqr7lD3WVoKDeGTFoyDJjXiKh
 KgHMU9Te/+0Etxfnj+SxDL+RS9JK1dG/Y68qhLMXy9AV4BFLRMHLvRe+zpE9vx24
 SDES/NNdfIVZjg==
X-ME-Sender: <xms:wbB1YGARAdJOsoBT3Tqkh4RW-H5ooi7Wm8mbZr7Be-yKLR0gE0RrwQ>
 <xme:wbB1YCGil23L_8hAZqoU6mLbdQ3HFxd5BzgmkB-GVD9G53sc5l0bZGZVKdFC543GV
 -NR5dPQLRk-vtTRvjA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudekledgkedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:wbB1YP6UcXFAPW6YwtWoesYfEKyWinQRSPDxPaheEJB96wxAmUzO-Q>
 <xmx:wbB1YAndBmvthG7dqxo-WdzBn5lg27eyqmcnqavhzPnwAfz7xX169Q>
 <xmx:wbB1YC40Q38yqtDANENRkyM6cXOiDOKUuJLBSSqhMTXNi2UTcTc9lA>
 <xmx:wbB1YNCg7cAsjeWtIsWVUDWIFuv36CfBj-nIIEftYwJII3VVRbzYXz1bEXo>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1358124005C;
 Tue, 13 Apr 2021 10:54:56 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v3 8/9] drm/vc4: hdmi: Enable the scrambler
Date: Tue, 13 Apr 2021 16:54:40 +0200
Message-Id: <20210413145441.483977-9-maxime@cerno.tech>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210413145441.483977-1-maxime@cerno.tech>
References: <20210413145441.483977-1-maxime@cerno.tech>
MIME-Version: 1.0
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Daniel Vetter <daniel.vetter@intel.com>,
 Phil Elwell <phil@raspberrypi.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The HDMI controller on the BCM2711 includes a scrambler in order to
reach the HDMI 2.0 modes that require it. Let's add the support for it.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c      | 64 +++++++++++++++++++++++++++++
 drivers/gpu/drm/vc4/vc4_hdmi_regs.h |  3 ++
 2 files changed, 67 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 01d24ce8a795..bda12fea0dce 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -35,6 +35,7 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
+#include <drm/drm_scdc_helper.h>
 #include <linux/clk.h>
 #include <linux/component.h>
 #include <linux/i2c.h>
@@ -76,6 +77,8 @@
 #define VC5_HDMI_VERTB_VSPO_SHIFT		16
 #define VC5_HDMI_VERTB_VSPO_MASK		VC4_MASK(29, 16)
 
+#define VC5_HDMI_SCRAMBLER_CTL_ENABLE		BIT(0)
+
 #define VC5_HDMI_DEEP_COLOR_CONFIG_1_INIT_PACK_PHASE_SHIFT	8
 #define VC5_HDMI_DEEP_COLOR_CONFIG_1_INIT_PACK_PHASE_MASK	VC4_MASK(10, 8)
 
@@ -462,6 +465,64 @@ static void vc4_hdmi_set_infoframes(struct drm_encoder *encoder)
 		vc4_hdmi_set_audio_infoframe(encoder);
 }
 
+static bool vc4_hdmi_supports_scrambling(struct drm_encoder *encoder,
+					 struct drm_display_mode *mode)
+{
+	struct vc4_hdmi_encoder *vc4_encoder = to_vc4_hdmi_encoder(encoder);
+	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
+	struct drm_display_info *display = &vc4_hdmi->connector.display_info;
+
+	if (!vc4_encoder->hdmi_monitor)
+		return false;
+
+	if (!display->hdmi.scdc.supported ||
+	    !display->hdmi.scdc.scrambling.supported)
+		return false;
+
+	return true;
+}
+
+static void vc4_hdmi_enable_scrambling(struct drm_encoder *encoder)
+{
+	struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
+	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
+
+	if (!vc4_hdmi_supports_scrambling(encoder, mode))
+		return;
+
+	if (!vc4_hdmi_mode_needs_scrambling(mode))
+		return;
+
+	drm_scdc_set_high_tmds_clock_ratio(vc4_hdmi->ddc, true);
+	drm_scdc_set_scrambling(vc4_hdmi->ddc, true);
+
+	HDMI_WRITE(HDMI_SCRAMBLER_CTL, HDMI_READ(HDMI_SCRAMBLER_CTL) |
+		   VC5_HDMI_SCRAMBLER_CTL_ENABLE);
+}
+
+static void vc4_hdmi_disable_scrambling(struct drm_encoder *encoder)
+{
+	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
+	struct drm_crtc *crtc = encoder->crtc;
+
+	/*
+	 * At boot, encoder->crtc will be NULL. Since we don't know the
+	 * state of the scrambler and in order to avoid any
+	 * inconsistency, let's disable it all the time.
+	 */
+	if (crtc && !vc4_hdmi_supports_scrambling(encoder, &crtc->mode))
+		return;
+
+	if (crtc && !vc4_hdmi_mode_needs_scrambling(&crtc->mode))
+		return;
+
+	HDMI_WRITE(HDMI_SCRAMBLER_CTL, HDMI_READ(HDMI_SCRAMBLER_CTL) &
+		   ~VC5_HDMI_SCRAMBLER_CTL_ENABLE);
+
+	drm_scdc_set_scrambling(vc4_hdmi->ddc, false);
+	drm_scdc_set_high_tmds_clock_ratio(vc4_hdmi->ddc, false);
+}
+
 static void vc4_hdmi_encoder_post_crtc_disable(struct drm_encoder *encoder,
 					       struct drm_atomic_state *state)
 {
@@ -474,6 +535,8 @@ static void vc4_hdmi_encoder_post_crtc_disable(struct drm_encoder *encoder,
 
 	HDMI_WRITE(HDMI_VID_CTL,
 		   HDMI_READ(HDMI_VID_CTL) | VC4_HD_VID_CTL_BLANKPIX);
+
+	vc4_hdmi_disable_scrambling(encoder);
 }
 
 static void vc4_hdmi_encoder_post_crtc_powerdown(struct drm_encoder *encoder,
@@ -924,6 +987,7 @@ static void vc4_hdmi_encoder_post_crtc_enable(struct drm_encoder *encoder,
 	}
 
 	vc4_hdmi_recenter_fifo(vc4_hdmi);
+	vc4_hdmi_enable_scrambling(encoder);
 }
 
 static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi_regs.h b/drivers/gpu/drm/vc4/vc4_hdmi_regs.h
index e1b58eac766f..19d2fdc446bc 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi_regs.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi_regs.h
@@ -100,6 +100,7 @@ enum vc4_hdmi_field {
 	HDMI_RM_FORMAT,
 	HDMI_RM_OFFSET,
 	HDMI_SCHEDULER_CONTROL,
+	HDMI_SCRAMBLER_CTL,
 	HDMI_SW_RESET_CONTROL,
 	HDMI_TX_PHY_CHANNEL_SWAP,
 	HDMI_TX_PHY_CLK_DIV,
@@ -238,6 +239,7 @@ static const struct vc4_hdmi_register __maybe_unused vc5_hdmi_hdmi0_fields[] = {
 	VC4_HDMI_REG(HDMI_GCP_CONFIG, 0x178),
 	VC4_HDMI_REG(HDMI_GCP_WORD_1, 0x17c),
 	VC4_HDMI_REG(HDMI_HOTPLUG, 0x1a8),
+	VC4_HDMI_REG(HDMI_SCRAMBLER_CTL, 0x1c4),
 
 	VC5_DVP_REG(HDMI_CLOCK_STOP, 0x0bc),
 	VC5_DVP_REG(HDMI_VEC_INTERFACE_XBAR, 0x0f0),
@@ -317,6 +319,7 @@ static const struct vc4_hdmi_register __maybe_unused vc5_hdmi_hdmi1_fields[] = {
 	VC4_HDMI_REG(HDMI_GCP_CONFIG, 0x178),
 	VC4_HDMI_REG(HDMI_GCP_WORD_1, 0x17c),
 	VC4_HDMI_REG(HDMI_HOTPLUG, 0x1a8),
+	VC4_HDMI_REG(HDMI_SCRAMBLER_CTL, 0x1c4),
 
 	VC5_DVP_REG(HDMI_CLOCK_STOP, 0x0bc),
 	VC5_DVP_REG(HDMI_VEC_INTERFACE_XBAR, 0x0f0),
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
