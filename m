Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6608E37679A
	for <lists+dri-devel@lfdr.de>; Fri,  7 May 2021 17:06:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89C566EE5F;
	Fri,  7 May 2021 15:06:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF7BB6EE5F
 for <dri-devel@lists.freedesktop.org>; Fri,  7 May 2021 15:06:14 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id 7D239F90;
 Fri,  7 May 2021 11:06:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 07 May 2021 11:06:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=3AE/H9kHlPK+k
 8rMD5J1BnkXA6TC/TrzOJJlMp077Xw=; b=mbDdJpF6NT02B8vuLR25ofjz3meb+
 AWS2AZJZQd8A2C2cTx/z7HoerY36mt/+Hhi1th460HssV9s/kYDkp5ioNqldNZkG
 9ALbthN6zrw+P6pI9suGT3t6j9W8FMtoJW9lPMcy6eI8iHEmg889z0j/8yV8KBXW
 /Md+LjVhkQJrT+C2W1Z7eo1r9/lpw7saTPZABzqK1oXLQDKey617dE3x7XXyGDA0
 chMws+4opC0gWx6PW0BNuEUtaeUb21K+s2GiHsJuvWsclenQOQnbzx5tQ+jwlK3V
 PspexnZJi0jjxrYqaKxoPniL2lO+FVfINii/43KK2QvgnZ65a1ilKmrpg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=3AE/H9kHlPK+k8rMD5J1BnkXA6TC/TrzOJJlMp077Xw=; b=VQWaj0B+
 5VO0SKQeXiy6NQXN+qkiw6ngxuB1WEgGt/tk8v5SZ1EBSHSVWiXrIu/zAJ5+h4rF
 LApvVN+1CtAtklnMRWA4tSRDhlDy4u4TfwjtOT1rodKJjkaWaFMD2WFcKBsb5oZZ
 OX+dKyEJqmBG/4bDGaaXoyBFpQAhuwEoWXs3VQhzhDW5tfX3MV85QeRA5tqXExlw
 rfv8obf7+SdyzKaKHtuBBMDV2KaruGYrsTQcQz55laEm8ByaTuXxkEBejZxO8KVA
 gDst4XvK6AarsfqLW0HiIYRe0hx4+rVrpF2TzKJJZ7fNfvbrPG2W4tLKpEFIvY8Z
 AMiO+HnVkVWXHg==
X-ME-Sender: <xms:ZVeVYOtZc2aAa8vc7-7maiGud5Tj3VtfKoyEzsTP568IIYg4lJPLkA>
 <xme:ZVeVYDeHgDjGS7RVV-rp73SRzjc2pWKTMxud6EEZXC564jURf8XSi2ntdzAa6ixkV
 4HdXr-VNkGSTc7a9II>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdegvddgkeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepheenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:ZVeVYJxUSdhXY9m3MYZjkp4umelxFXlLyRHK5gML9RjRkTlzwXeWmw>
 <xmx:ZVeVYJOa8IWVrOv5J-YaMSKUPgCLcfMDG__J-TiiDc4HgDGIeuLGzQ>
 <xmx:ZVeVYO-mGWgd7CfJB0t8q03WH980J5Zk8gowc9D25hoNE-8oI4YSrw>
 <xmx:ZVeVYJUm9r_048YIb4xgV1lZba2EotlBAXKxJ5CqiGwh53_Mbv3IKIs5RmY>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Fri,  7 May 2021 11:06:12 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>
Subject: [PATCH v4 10/12] drm/vc4: hdmi: Enable the scrambler
Date: Fri,  7 May 2021 17:05:13 +0200
Message-Id: <20210507150515.257424-11-maxime@cerno.tech>
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
2.31.1

