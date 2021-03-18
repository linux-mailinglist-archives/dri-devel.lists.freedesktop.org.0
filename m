Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 206AD34020C
	for <lists+dri-devel@lfdr.de>; Thu, 18 Mar 2021 10:29:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF4A46E8AC;
	Thu, 18 Mar 2021 09:29:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 039C06E8AF
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 09:29:28 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 6E7CB580FC1;
 Thu, 18 Mar 2021 05:29:27 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 18 Mar 2021 05:29:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=oW22RVW/HS3Cv
 GmSAQgycBZ0fchJREtooJS0Fk/c5xI=; b=D1WFy/bMHVwEY/5orgg0fawvgdCLV
 rg7J61Y0yxLXu/QJGYHBMjFPN1WrjOC8DN7Q97D1ApQCfuMc3eBnAt4V2QCOBOny
 g2a2xCjzABpVBh0EJl9SZ1iIinvmh2V2jWy80sDtKwgtHoi/JucO5ztTNKEYqMDi
 z48OQko757ak6HCJWeWA0izNAV5decqGKXcvpEYfEar/JrE7OqsFLN9JwmqkPmuT
 L6AML+zBcu0IHNf5d0YNIT/tneJ5hOPB6B/Q2BWFQoGxD2kpnA2Fi6OdrnOs6+YN
 I+iAcU6jmiPCPr759Lasfo0xqdwFgMeo5lSqe8SBUxDAzZ6EE25XGOD7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=oW22RVW/HS3CvGmSAQgycBZ0fchJREtooJS0Fk/c5xI=; b=aIhR6BNE
 7FH/8Xvm9oebQF5fKj6sdPqppy7hAXfRTPa1fM+snRztdMHhB6v5RABmRMurXVWK
 G0xqrBgRIzGeBn32vk+ha8KgVi7kxeVrALzomocwgp1WbybLizG30f8UcEJSdmHk
 5oc0G4X/f72RjsY3/KmBVnLxL/fl/DqJd/tNUVvL0rr986oNQLCCAxeDwdu+oO4B
 VDHWxRnPY0+FP6g7Nh3O3+jGaaaH9UBdURQQUhi16yGHx4jPSzpJlcAjYX5olAIK
 7EdFS0LD5Bm6JuI0AMJiPFd4Q3siZZNF2uihgGrXzHTtZ/dyRzINCXt0QaLmpnxq
 k8ML80sPOK//Pw==
X-ME-Sender: <xms:dx1TYI9cHd8UULQ6Uwxb_c4l28WZW2nHmIysilcbHr5YooxCs57niA>
 <xme:dx1TYCMNHjz_ySqfzu-MdZVkTHtB_aksjG3vCWQL8FrYZyUKdWacg2ZsRdZMfowoa
 Ee2rgfcTKLgXYAei9g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefiedgtdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:dx1TYOHG8kP1ObpG5aln1SlpMGaD87LOP-dcxbUGGNcF-opGjxNvzQ>
 <xmx:dx1TYIQtdYb7nUKP5jtaNhWc5qltvx8EOG0mNcj2CwH60vCx6t1lTg>
 <xmx:dx1TYDtBskqMh9APuWvYwy6wxW1Yr1CDkryfzggwHRHsjCJe0wqvhg>
 <xmx:dx1TYN8aZ73IkrcRJw1PbwPYs9D8T6NiBC1-59_3yaMEf2FAaf2OQQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 19F0C1080054;
 Thu, 18 Mar 2021 05:29:27 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v2 4/5] drm/vc4: hdmi: Enable the scrambler
Date: Thu, 18 Mar 2021 10:29:16 +0100
Message-Id: <20210318092917.831995-5-maxime@cerno.tech>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210318092917.831995-1-maxime@cerno.tech>
References: <20210318092917.831995-1-maxime@cerno.tech>
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
reach the modes that require it. Let's add the support for it.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c      | 56 +++++++++++++++++++++++++++++
 drivers/gpu/drm/vc4/vc4_hdmi_regs.h |  3 ++
 2 files changed, 59 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 0924a1b9e186..530c83097b1a 100644
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
 
@@ -457,6 +460,56 @@ static void vc4_hdmi_set_infoframes(struct drm_encoder *encoder)
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
+	if ((mode->clock * 1000) < HDMI_14_MAX_TMDS_CLK)
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
+	drm_scdc_set_high_tmds_clock_ratio(vc4_hdmi->ddc, true);
+	drm_scdc_set_scrambling(vc4_hdmi->ddc, true);
+
+	HDMI_WRITE(HDMI_SCRAMBLER_CTL, HDMI_READ(HDMI_SCRAMBLER_CTL) |
+		   VC5_HDMI_SCRAMBLER_CTL_ENABLE);
+}
+
+static void vc4_hdmi_disable_scrambling(struct drm_encoder *encoder)
+{
+	struct drm_display_mode *mode = &encoder->crtc->mode;
+	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
+
+	if (!vc4_hdmi_supports_scrambling(encoder, mode))
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
@@ -469,6 +522,8 @@ static void vc4_hdmi_encoder_post_crtc_disable(struct drm_encoder *encoder,
 
 	HDMI_WRITE(HDMI_VID_CTL,
 		   HDMI_READ(HDMI_VID_CTL) | VC4_HD_VID_CTL_BLANKPIX);
+
+	vc4_hdmi_disable_scrambling(encoder);
 }
 
 static void vc4_hdmi_encoder_post_crtc_powerdown(struct drm_encoder *encoder,
@@ -919,6 +974,7 @@ static void vc4_hdmi_encoder_post_crtc_enable(struct drm_encoder *encoder,
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
