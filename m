Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7E11E5975
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 09:45:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 274166E48C;
	Thu, 28 May 2020 07:44:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C4506E339
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 15:51:55 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 7372958211E;
 Wed, 27 May 2020 11:51:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 27 May 2020 11:51:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=f1NqZpRqKGWmV
 ec/byPyNo9gaPc7flByeuHa+FEKKrI=; b=MJ2QZ8Gyj4piq2fhlUC+NDk3sNUSK
 s0JwN8QdIWM/1JuyLv+hxosLb7cQzkfDYKHSegFXBcqp+CARYtrxdHXwiYF3MRgY
 WoTRlxEoq4c6OLMwHX+cg1+Lh3VFB8+NzZH8a2ImDpgzkuhYMWea7heD//6TVewq
 GBZuAE3DdJ2+Pwuz2CFdIZlFXhG6hqBvglR2AEJl3y5tnwSOMcK98BPPkbWqseS6
 Y9/P+TmjKR9KXO+7Bjo54kSwATyfIh0lYXYravphA7zTXkjAsALO7kPJV1NJ444q
 rYptzxl5tvOdE9xq2Wj5vljMeZxaylo/uwO+4xPQwdnbGFIvd6A/d98JA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=f1NqZpRqKGWmVec/byPyNo9gaPc7flByeuHa+FEKKrI=; b=2DgVVI/C
 99L6n67wBvSN5IDdEt/Gdw7BjL7TT28f+QrNJzcOmUUhPLc35LizRytSuC3aq1Fd
 yC4dBxQlxzX8D3QKLCSsEyYw3KDDRZfg57WJPIpJkGYKaMIAGSRMjYTplxSy84R4
 oI/TvdEkSDf6aaT6VbAYyEejbFFQlZ72+Il9wzp1CRujK9SXsYKRP1aeOohdX0NK
 uxfKPMI8h+IPVBolYLY7GveZdHHGtZvXtjPAZkp4smgPsaAdIO/XyXnmP682CuMI
 I9pIcWrjsiO3qdilwcZ7WuEqZ604gaMdGu5JBFnaZfw42NiDB/jGkfwwS1jwS8Yl
 ajauQz3qolhENg==
X-ME-Sender: <xms:mozOXsuRsU4YPvuWmtF1Y354v1WF3OPkEoHghZkiiFPxH0SmAfasZw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddvgedgkeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepfeevhfdvvdeivdeihefftddvtefgieegffevhfeilefgfeeuteevudejgedu
 lefhnecuffhomhgrihhnpegsrghsvgdrphhoshhtnecukfhppeeltddrkeelrdeikedrje
 einecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgr
 gihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:mozOXpeRscOZJhp0_8Hu9VmPeK5ZV7C0F-SGnfJ9o5Z0aBkrl1kPRA>
 <xmx:mozOXnz__Pu-jf2SeNjyJGSDPVR-64GRwG6kYPL15TBfkjIyxFt__g>
 <xmx:mozOXvObdeus82BYhQCJ5Uu51_NmpmYhjyVOUBB52ll4s7qlfasFzg>
 <xmx:mozOXpOvDp6XRvfZM7AYBSwfPGQ1OTHQAZa4XGubO_y2TWFFOXZXpw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0F0BB328005D;
 Wed, 27 May 2020 11:51:53 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v3 100/105] drm/vc4: hdmi: Implement finer-grained hooks
Date: Wed, 27 May 2020 17:49:10 +0200
Message-Id: <a13583f0ae9ae8239a75bffe653b145895aed164.1590594512.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
References: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 28 May 2020 07:43:53 +0000
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to prevent some pixels getting stuck in an unflushable FIFO on
bcm2711, we need to enable the HVS, the pixelvalve (the CRTC) and the HDMI
controller (the encoder) in an intertwined way, and with tight delays.

However, the atomic callbacks don't really provide a way to work with
either constraints, so we need to roll our own callbacks so that we can
provide those guarantees.

Since those callbacks have been implemented and called in the CRTC code, we
can just implement them in the HDMI driver now.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 43 +++++++++++++++++++++++++++++++----
 1 file changed, 39 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index a97f378c6d2d..86ce8d247a00 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -320,18 +320,28 @@ static void vc4_hdmi_set_infoframes(struct drm_encoder *encoder)
 		vc4_hdmi_set_audio_infoframe(encoder);
 }
 
-static void vc4_hdmi_encoder_disable(struct drm_encoder *encoder)
+static void vc4_hdmi_encoder_post_crtc_disable(struct drm_encoder *encoder)
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
-	int ret;
 
 	HDMI_WRITE(HDMI_RAM_PACKET_CONFIG, 0);
+}
+
+static void vc4_hdmi_encoder_post_crtc_powerdown(struct drm_encoder *encoder)
+{
+	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 
 	if (vc4_hdmi->variant->phy_disable)
 		vc4_hdmi->variant->phy_disable(vc4_hdmi);
 
 	HDMI_WRITE(HDMI_VID_CTL,
 		   HDMI_READ(HDMI_VID_CTL) & ~VC4_HD_VID_CTL_ENABLE);
+}
+
+static void vc4_hdmi_encoder_disable(struct drm_encoder *encoder)
+{
+	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
+	int ret;
 
 	clk_disable_unprepare(vc4_hdmi->hsm_clock);
 	clk_disable_unprepare(vc4_hdmi->pixel_clock);
@@ -449,11 +459,10 @@ static void vc4_hdmi_recenter_fifo(struct vc4_hdmi *vc4_hdmi)
 		  "VC4_HDMI_FIFO_CTL_RECENTER_DONE");
 }
 
-static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
+static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder)
 {
 	struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
-	struct vc4_hdmi_encoder *vc4_encoder = to_vc4_hdmi_encoder(encoder);
 	unsigned long pixel_rate, hsm_rate;
 	int ret;
 
@@ -521,6 +530,13 @@ static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
 
 	if (vc4_hdmi->variant->set_timings)
 		vc4_hdmi->variant->set_timings(vc4_hdmi, mode);
+}
+
+static void vc4_hdmi_encoder_pre_crtc_enable(struct drm_encoder *encoder)
+{
+	struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
+	struct vc4_hdmi_encoder *vc4_encoder = to_vc4_hdmi_encoder(encoder);
+	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 
 	if (vc4_encoder->hdmi_monitor &&
 	    drm_default_rgb_quant_range(mode) == HDMI_QUANTIZATION_RANGE_LIMITED) {
@@ -536,6 +552,16 @@ static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
 	}
 
 	HDMI_WRITE(HDMI_FIFO_CTL, VC4_HDMI_FIFO_CTL_MASTER_SLAVE_N);
+}
+
+static void vc4_hdmi_encoder_post_crtc_enable(struct drm_encoder *encoder)
+{
+	struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
+	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
+	struct vc4_hdmi_encoder *vc4_encoder = to_vc4_hdmi_encoder(encoder);
+	bool hsync_pos = mode->flags & DRM_MODE_FLAG_PHSYNC;
+	bool vsync_pos = mode->flags & DRM_MODE_FLAG_PVSYNC;
+	int ret;
 
 	HDMI_WRITE(HDMI_VID_CTL,
 		   HDMI_READ(HDMI_VID_CTL) |
@@ -582,6 +608,10 @@ static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
 	vc4_hdmi_recenter_fifo(vc4_hdmi);
 }
 
+static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
+{
+}
+
 static enum drm_mode_status
 vc4_hdmi_encoder_mode_valid(struct drm_encoder *encoder,
 			    const struct drm_display_mode *mode)
@@ -1359,6 +1389,11 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	variant = of_device_get_match_data(dev);
 	vc4_hdmi->variant = variant;
 	vc4_hdmi->encoder.base.type = variant->encoder_type;
+	vc4_hdmi->encoder.base.pre_crtc_configure = vc4_hdmi_encoder_pre_crtc_configure;
+	vc4_hdmi->encoder.base.pre_crtc_enable = vc4_hdmi_encoder_pre_crtc_enable;
+	vc4_hdmi->encoder.base.post_crtc_enable = vc4_hdmi_encoder_post_crtc_enable;
+	vc4_hdmi->encoder.base.post_crtc_disable = vc4_hdmi_encoder_post_crtc_disable;
+	vc4_hdmi->encoder.base.post_crtc_powerdown = vc4_hdmi_encoder_post_crtc_powerdown;
 	encoder = &vc4_hdmi->encoder.base.base;
 
 	ret = variant->init_resources(vc4_hdmi);
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
