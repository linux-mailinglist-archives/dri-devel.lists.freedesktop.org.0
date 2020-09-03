Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AC425D1FF
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 09:13:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64FA36EAB3;
	Fri,  4 Sep 2020 07:11:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8E7D6E45D
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 08:03:36 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id B2581BC0;
 Thu,  3 Sep 2020 04:03:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 03 Sep 2020 04:03:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=C+3iirefyHvAY
 uI/R6B0OlF2/TKBnBPTdXBuUVfZ3uQ=; b=h+h6C/Y3/uOORKvx0WvS0YVQ9OQoz
 addzL4wbgk5VtJxggyvVbSsD3zgP2tTbnn1+4uHnR/XyYSXdZjHFfgFaJq3zSzWj
 9RiEDE4oS4QIQFaTojLuz8tjCRxyberMMXRTOIgf/P7lcMMI5jRJquIra8GAiiQH
 GQRreeZAEElbYOkPXPrSkWjVPn7mq0x3zjCVcSoACJZckpOANmWaqyo0gyNC6joi
 3Ft+6+aTn6xf6+QRel4/xTz2CWhyeDMRjjyyiqz6zGTZclbZnJdNiXglBLTKNMwc
 ncKkje6LwSPdTWxMmNJeznLlxsXqOaNV/pYDUGE83JtAgBWDRcpzycFvQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=C+3iirefyHvAYuI/R6B0OlF2/TKBnBPTdXBuUVfZ3uQ=; b=SB7oSY+j
 8cdKzmyjwl69z+fyHwveU684AG20xnrFiF/PjbB4gVJWCPVgihB/L/3xGUbUzxbW
 TQbBURuoN8MBdPuGlmRW50Q3n3jwicD5JncUElqzaZr0MBlR+1Utp4xiyF36wHt5
 6BwPjrwwCP6vL6yrqLJu561bG+Xbn1qFwzg/QFpcKJn5bwb/i58nLkr14hsUJZsn
 rROquio6s/swxB5RM3StFncdGM7CU9ZesZHVV//7yor5IcoQKVAw7lN/oLfkcpnI
 Uc+UI0j4Q0GER9ow8riQEgipb4eJsXiXduQgHwlOLgIUtODH/sbNOlp1WjGNrWJN
 DEfDzLreDsOMaQ==
X-ME-Sender: <xms:V6NQX-e7gtvPCa_areSul3lMLqTxfLtw8dBM052LlHUdrGcN1a1x0A>
 <xme:V6NQX4OnZb6fZj2cRm1OMJMVPVSw_xEWJwHJoxTcMiPckkK_813zWAb5TA_FsoAd9
 tiLSZGRPCmemF0kIpo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudegtddguddviecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeefvefhvddviedvieehffdtvdetgfeigeffvefhieelgfefueetvedujeeg
 udelhfenucffohhmrghinhepsggrshgvrdhpohhsthenucfkphepledtrdekledrieekrd
 ejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehm
 rgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:V6NQX_hc7GMlp6jWzAu_cCfKIAKm6KiivOxnTDG0tMOjpbmYPSsMEA>
 <xmx:V6NQX7_RrfDLlMh-4SSIoBubOs5nmv67dWJJSVjVJsgWQcvjhGXwhQ>
 <xmx:V6NQX6usy9723w589khDglIOoioP8SxF81sCCH66TaLwaFFG6zlOAQ>
 <xmx:V6NQXyHgpT7xKFbeX3qw4h7XtvDxBBLHcpdGalVX-98GKFlb9xLiIMbaUTU>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id EA14E328005A;
 Thu,  3 Sep 2020 04:03:34 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v5 72/80] drm/vc4: hdmi: Implement finer-grained hooks
Date: Thu,  3 Sep 2020 10:01:44 +0200
Message-Id: <2e9226d971117065f3b97e597f04f7fe2f0c134c.1599120059.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.dddc064d8bb83e46744336af67dcb13139e5747d.1599120059.git-series.maxime@cerno.tech>
References: <cover.dddc064d8bb83e46744336af67dcb13139e5747d.1599120059.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 04 Sep 2020 07:11:29 +0000
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hoegeun Kwon <hoegeun.kwon@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, bcm-kernel-feedback-list@broadcom.com,
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

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Tested-by: Chanwoo Choi <cw00.choi@samsung.com>
Tested-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Tested-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 39 +++++++++++++++++++++++++++++++----
 1 file changed, 35 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index c9eae5352b9a..128d33c8c2c3 100644
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
@@ -1361,6 +1387,11 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
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
