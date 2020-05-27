Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A791E59BE
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 09:47:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1F016E427;
	Thu, 28 May 2020 07:44:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 069936E340
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 15:51:58 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 6D84F582126;
 Wed, 27 May 2020 11:51:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 27 May 2020 11:51:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=BuUKiGuqk973s
 DDN5AZmCuX6+VtoVQEUzT93MfWaojA=; b=jTygBAYybWdJmfyo8k2Ct9ZWKqqdz
 6cr3EDlE1KyQn90HRJQ4yszEkjDwFHwNGpPuQAe7hEyFnGsktGzjTB9lYB9sPQLA
 mPIaNz4PqhauZYpuwLp1kh0rcJ6yDNKiifb2SSGV2o3Hu6z4PhCcQo1+2A40dWZl
 /natkAQ5x+kJDaNVYwvSIZwMzI8CIHsiEWlXjZ2AmXAILn/MW+rBFwAt8o2uk55j
 vKjoSGK/0UI2ldCMHuzeBFqPq/TeQwAXqz6Z+Q3f/0xcPquuzoshx5tEzZEDfUKm
 DRtyt+3XkKepuvAZZr7Q+FYhy+AA6hoH596QMK3wICNAUt1xylrHWz7aQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=BuUKiGuqk973sDDN5AZmCuX6+VtoVQEUzT93MfWaojA=; b=y5Rh7V3Z
 qWQN1KSDAMmzPoDI4HrmYqdhSxMjEQFFxyCvXBhX1X4TJkQqJlCkhFbG73UuPPYf
 CohwqFLzxJunDdf4/vytLXKd//rosgtBhI2+bg8uHGk8dip/2PQZqiNGwX/6OlVU
 fn3RUr76Yoe5SPN0cJWpgIlKVtQRzlmScSk/PGuprazeOUAIusAPMigSvqOQxiTj
 ZMigkVijCL7oESAxGsXk8cmwINyriVlrOttj01fcKCWikjUhyBPcVgMZjXYzt7qk
 yKau+41WP0eCWDlQIj2kYLQWvB5N9/KyNEkZGOwDh8ax41J2sqrJtBRDv6QQYcv/
 vhyHdjUs5PAn6A==
X-ME-Sender: <xms:nYzOXjaIKie76PkGruBk1ooHVnpOMbciA11H153PszCsXagxbrgF1w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddvgedgkeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepjeekne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:nYzOXiafOpEH5eKHLnoVjZpv8iE2jX9zjsGDa_HihT4zxkRx4yiwXQ>
 <xmx:nYzOXl8_WiMRM6P53D2nuYrzOftXluOEr7iKKfI-QcXk_cZfyjhOtg>
 <xmx:nYzOXprB0zTIQsW7eQg90RFEqoGxtrpiLh6KO98kP70BKgWkrAf5Dg>
 <xmx:nYzOXuI-wqTsJn3Mww78i4EHepYfaI2tkl20Aa1kw1IZeajGZAiHnA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1ED1A328005A;
 Wed, 27 May 2020 11:51:57 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v3 102/105] drm/vc4: hdmi: Switch to blank pixels when disabled
Date: Wed, 27 May 2020 17:49:12 +0200
Message-Id: <271605b39ee5e9bc7db5ac1d0ed9df6ecc4edc29.1590594512.git-series.maxime@cerno.tech>
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

In order to avoid pixels getting stuck in an unflushable FIFO, we need when
we disable the HDMI controller to switch away from getting our pixels from
the pixelvalve and instead use blank pixels, and switch back to the
pixelvalve when we enable the HDMI controller.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c |  9 +++++++++
 drivers/gpu/drm/vc4/vc4_regs.h |  3 +++
 2 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index d889a83a0f56..8c9cff9ce216 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -325,6 +325,12 @@ static void vc4_hdmi_encoder_post_crtc_disable(struct drm_encoder *encoder)
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 
 	HDMI_WRITE(HDMI_RAM_PACKET_CONFIG, 0);
+
+	HDMI_WRITE(HDMI_VID_CTL, HDMI_READ(HDMI_VID_CTL) |
+		   VC4_HD_VID_CTL_CLRRGB | VC4_HD_VID_CTL_CLRSYNC);
+
+	HDMI_WRITE(HDMI_VID_CTL,
+		   HDMI_READ(HDMI_VID_CTL) | VC4_HD_VID_CTL_BLANKPIX);
 }
 
 static void vc4_hdmi_encoder_post_crtc_powerdown(struct drm_encoder *encoder)
@@ -563,6 +569,9 @@ static void vc4_hdmi_encoder_post_crtc_enable(struct drm_encoder *encoder)
 		   (vsync_pos ? 0 : VC4_HD_VID_CTL_VSYNC_LOW) |
 		   (hsync_pos ? 0 : VC4_HD_VID_CTL_HSYNC_LOW));
 
+	HDMI_WRITE(HDMI_VID_CTL,
+		   HDMI_READ(HDMI_VID_CTL) & ~VC4_HD_VID_CTL_BLANKPIX);
+
 	if (vc4_encoder->hdmi_monitor) {
 		HDMI_WRITE(HDMI_SCHEDULER_CONTROL,
 			   HDMI_READ(HDMI_SCHEDULER_CONTROL) |
diff --git a/drivers/gpu/drm/vc4/vc4_regs.h b/drivers/gpu/drm/vc4/vc4_regs.h
index 5a3ee2030cff..ce103f925f05 100644
--- a/drivers/gpu/drm/vc4/vc4_regs.h
+++ b/drivers/gpu/drm/vc4/vc4_regs.h
@@ -723,6 +723,9 @@
 # define VC4_HD_VID_CTL_FRAME_COUNTER_RESET	BIT(29)
 # define VC4_HD_VID_CTL_VSYNC_LOW		BIT(28)
 # define VC4_HD_VID_CTL_HSYNC_LOW		BIT(27)
+# define VC4_HD_VID_CTL_CLRSYNC			BIT(24)
+# define VC4_HD_VID_CTL_CLRRGB			BIT(23)
+# define VC4_HD_VID_CTL_BLANKPIX		BIT(18)
 
 # define VC4_HD_CSC_CTL_ORDER_MASK		VC4_MASK(7, 5)
 # define VC4_HD_CSC_CTL_ORDER_SHIFT		5
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
