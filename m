Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9728821993F
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 09:07:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 874AA6E9F9;
	Thu,  9 Jul 2020 07:05:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05D1F6E591
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 17:44:15 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 0F682FD0;
 Wed,  8 Jul 2020 13:44:13 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 08 Jul 2020 13:44:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=OPwpf7AJPvnM3
 wfC6Osbwbhj72RnySra1ptXGlxgjKQ=; b=Qn3zo2epNnLJX2+cTzS1mpRUixldV
 jg1JIHcy+Ky8Fo9I1bjz0qiq/TXkA8RgHxvOJju60uX5SOsLIIkso09921ffrBcA
 d3VNvINM87eFqgWjvQmlH3kKygvqFbOLTY+XnGGD6nw4MhQuRnZ8u9XHfObywizo
 fLM1VAVjPGXAF0vsJSXM6I+m64ryluoFdmKZfv6nTTuFV5vJfxQM3Jzp5uzkVGkp
 JPVSyP35naljP77ttykvnXBp1IX6lutBw+GCX8F9cB/19bv7JdygbroYPeVBBK4Z
 oyPnYAipc5lDAkKCaKddIH90fVjKZGjod8bVFRZLnVkp8etq7stl/n8Eg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=OPwpf7AJPvnM3wfC6Osbwbhj72RnySra1ptXGlxgjKQ=; b=plSLuGpG
 AxCPACYMy5oEzEYvxXVFICOEc/+N7f0zSih5y/MMBv2emIILWLG+6Yq2fR+lWxkQ
 EfuSrQaCpaF9cH/hUJGcxWW+G7cX51RrCx3YMdGPN+fNb7GN6aW+hLrOshhl7mIb
 NuTD1Az17E/gJncyJcRRTNBAnIjqYOcmzKVVsIIjjpHRLyp8IdzNDK/X6056PDWd
 oZ4q8BdZJO7nJ3oD1uvD30hIbP79MsYI93q420z+hgAqKrf6X0iQJqJ9Ryaldk6b
 5faWDGQrvRuktbD/FwtFNtBY6oV71WAyuZLgtLsTzgFAmZ/Z0AM+pbC0DAqvpEul
 V9TzILXS59f3sw==
X-ME-Sender: <xms:7QUGX4xaNJwbsVayfMcEKvNQ82L7JrIhaCxuLbVzIXae7M-YBIxqPQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudejgdduudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepfeevhfdvvdeivdeihefftddvtefgieegffevhfeilefgfeeuteevudejgedu
 lefhnecuffhomhgrihhnpegsrghsvgdrphhoshhtnecukfhppeeltddrkeelrdeikedrje
 einecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgr
 gihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:7QUGX8RxqrSy-2FuAq0GuxDJTMB5XRSjA-Te18pHw83xdDHeIfWAiA>
 <xmx:7QUGX6Xg2N5LVL2fUEtOMUHP_r7ZNF8LUYhtMAkeUfv2cDN8R72xBA>
 <xmx:7QUGX2hQKy_gjweOP-YlMDw7jroSeVpK_6tMoehxY-ZHfh3A1UTyZw>
 <xmx:7QUGXwD1YzM3PRJ7czDXgIRQj92FNScw7ywJbmhiTYMgx1g7QcrpEi3P3Ks>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4C41B306005F;
 Wed,  8 Jul 2020 13:44:13 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v4 71/78] drm/vc4: hdmi: Implement finer-grained hooks
Date: Wed,  8 Jul 2020 19:42:19 +0200
Message-Id: <496aecbe04aa460572d4ff02a64e77ca01368316.1594230107.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
References: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 09 Jul 2020 07:05:03 +0000
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
 drivers/gpu/drm/vc4/vc4_hdmi.c | 39 +++++++++++++++++++++++++++++++----
 1 file changed, 35 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 00592c1ada73..bbe521ab000b 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -320,12 +320,17 @@ static void vc4_hdmi_set_infoframes(struct drm_encoder *encoder)
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
+	int ret;
 
 	if (vc4_hdmi->variant->phy_disable)
 		vc4_hdmi->variant->phy_disable(vc4_hdmi);
@@ -341,6 +346,10 @@ static void vc4_hdmi_encoder_disable(struct drm_encoder *encoder)
 		DRM_ERROR("Failed to release power domain: %d\n", ret);
 }
 
+static void vc4_hdmi_encoder_disable(struct drm_encoder *encoder)
+{
+}
+
 static void vc4_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi, bool enable)
 {
 	u32 csc_ctl;
@@ -449,11 +458,10 @@ static void vc4_hdmi_recenter_fifo(struct vc4_hdmi *vc4_hdmi)
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
 
@@ -521,6 +529,13 @@ static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
 
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
@@ -536,6 +551,13 @@ static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
 	}
 
 	HDMI_WRITE(HDMI_FIFO_CTL, VC4_HDMI_FIFO_CTL_MASTER_SLAVE_N);
+}
+
+static void vc4_hdmi_encoder_post_crtc_enable(struct drm_encoder *encoder)
+{
+	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
+	struct vc4_hdmi_encoder *vc4_encoder = to_vc4_hdmi_encoder(encoder);
+	int ret;
 
 	HDMI_WRITE(HDMI_VID_CTL,
 		   HDMI_READ(HDMI_VID_CTL) |
@@ -582,6 +604,10 @@ static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
 	vc4_hdmi_recenter_fifo(vc4_hdmi);
 }
 
+static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
+{
+}
+
 static enum drm_mode_status
 vc4_hdmi_encoder_mode_valid(struct drm_encoder *encoder,
 			    const struct drm_display_mode *mode)
@@ -1362,6 +1388,11 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	dev_set_drvdata(dev, vc4_hdmi);
 	encoder = &vc4_hdmi->encoder.base.base;
 	vc4_hdmi->encoder.base.type = variant->encoder_type;
+	vc4_hdmi->encoder.base.pre_crtc_configure = vc4_hdmi_encoder_pre_crtc_configure;
+	vc4_hdmi->encoder.base.pre_crtc_enable = vc4_hdmi_encoder_pre_crtc_enable;
+	vc4_hdmi->encoder.base.post_crtc_enable = vc4_hdmi_encoder_post_crtc_enable;
+	vc4_hdmi->encoder.base.post_crtc_disable = vc4_hdmi_encoder_post_crtc_disable;
+	vc4_hdmi->encoder.base.post_crtc_powerdown = vc4_hdmi_encoder_post_crtc_powerdown;
 	vc4_hdmi->pdev = pdev;
 	vc4_hdmi->variant = variant;
 
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
