Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A0833F41E
	for <lists+dri-devel@lfdr.de>; Wed, 17 Mar 2021 16:44:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7CAE6E827;
	Wed, 17 Mar 2021 15:44:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E693A6E827
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 15:44:16 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 5DC82580A4F;
 Wed, 17 Mar 2021 11:44:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 17 Mar 2021 11:44:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=+cWfWeje6U0Yf
 cbTNgTlVuEBJOAE00vm5CTJzIBmIV0=; b=aOYNDU4WFtJRbo3h3ECqQNGlFzyqH
 r/FIea1mjkfadjPbjpcYxZKrAIgZuIMVaC13OR1uywztvqFZGmKs2rqARZXp1Pnv
 cUAgCLR/Hl4sW06pvcLNNGeK2NWfeWx010yNoxB1amaQL7xo18toXj6nadyn2+Yi
 yzitq0O3EGyG3DSMVfu9FSlvI0ZCUX3OgjgxadePtjsxTycJ69uaB9GXk5NmNmnG
 50NoK16gXHICWhg+cdY0xduWTbtRPgBm9eKS1YoopGcvoDJxBGOLjKI6pjr2xbc8
 W4nJrfayMR6SZni6+asOPtVi4ohtUr0H5eRpuALkz87FKemG/loEFmD9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=+cWfWeje6U0YfcbTNgTlVuEBJOAE00vm5CTJzIBmIV0=; b=el9QfIlq
 AuhDvpBEAwNWxC79ffyeiDktaQZl4pGJlh63JajGt1NuF80mHhhdfFnQfldv7Zqt
 sbtlfBwaXweyurjp+/G7nah/vDNpFZ+C/63wb8ZpBZams6y0vBm69I/jKGzDqUU8
 ERzH3RvDUDp+h4rfmeaTkh82oIs0i2QkAF1Hf1MSbqY86L7Jc1cCnA67zxjCLevk
 RSC6JQVs3LBBxExrCVyaGkzgewskMKVwbv/U2f8ny3ZxPeVSIXxQrJCelKmnv7mF
 eStPartGfg9ATD4hv/Q4SESTloPWkkEVt+mRb/hO4V0idfqc0q7ycV1/bOpZmpJP
 Zz9UiyJia2aUpQ==
X-ME-Sender: <xms:0CNSYLbxQ9hrQIKOJwwdYAL0fFRtCkenGiPRkNRaqS_9AcHQcLzEWg>
 <xme:0CNSYAuynZxhd-CFVdpnyH_B4v8A-bFVR_wDnHDqf7bHN7qQPLdYB6Jd_mnTjCMM4
 _nlmM6BqGIfhIgPU7g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefgedgkeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:0CNSYKoHdx9Of4t5KjAPhFdFvAbySDxWwgs-lMNAIU1EmS_OeWWwOw>
 <xmx:0CNSYAR4AMtqnJZZKVnUJZNsKB81aPNUFBMFrx4jiuRz0ZjyNke6cA>
 <xmx:0CNSYPa4fwz3UEvSFbES6K9Su8RJi7l2tcVN3YMzy7AcrPxg4St1Mw>
 <xmx:0CNSYA3SMLfuBPi0NhnCczyV1TR_m_IWogkZj4WZqI1FX_wo7KgaeQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 20C1224005A;
 Wed, 17 Mar 2021 11:44:16 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 13/18] drm/vc4: hdmi: Define colorspace matrices
Date: Wed, 17 Mar 2021 16:43:47 +0100
Message-Id: <20210317154352.732095-14-maxime@cerno.tech>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210317154352.732095-1-maxime@cerno.tech>
References: <20210317154352.732095-1-maxime@cerno.tech>
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
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The current CSC setup code for the BCM2711 uses a sequence of register
writes to configure the CSC depending on whether we output using a full
or limited range.

However, with the upcoming introduction of the YUV output, we're going
to add new matrices to perform the conversions, so we should switch to
something a bit more flexible that takes the matrix as an argument and
programs the CSC accordingly.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 77 +++++++++++++++++++++-------------
 1 file changed, 48 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index b0e0cb533944..9614de7303b8 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -525,6 +525,50 @@ static void vc4_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
 	HDMI_WRITE(HDMI_CSC_CTL, csc_ctl);
 }
 
+
+/*
+ * If we need to output Full Range RGB, then use the unity matrix
+ *
+ * [ 1      0      0      0]
+ * [ 0      1      0      0]
+ * [ 0      0      1      0]
+ *
+ * Matrix is signed 2p13 fixed point, with signed 9p6 offsets
+ */
+static const u16 vc5_hdmi_csc_full_rgb_unity[3][4] = {
+	{ 0x2000, 0x0000, 0x0000, 0x0000 },
+	{ 0x0000, 0x2000, 0x0000, 0x0000 },
+	{ 0x0000, 0x0000, 0x2000, 0x0000 },
+};
+
+/*
+ * CEA VICs other than #1 require limited range RGB output unless
+ * overridden by an AVI infoframe. Apply a colorspace conversion to
+ * squash 0-255 down to 16-235. The matrix here is:
+ *
+ * [ 0.8594 0      0      16]
+ * [ 0      0.8594 0      16]
+ * [ 0      0      0.8594 16]
+ *
+ * Matrix is signed 2p13 fixed point, with signed 9p6 offsets
+ */
+static const u16 vc5_hdmi_csc_full_rgb_to_limited_rgb[3][4] = {
+	{ 0x1b80, 0x0000, 0x0000, 0x0400 },
+	{ 0x0000, 0x1b80, 0x0000, 0x0400 },
+	{ 0x0000, 0x0000, 0x1b80, 0x0400 },
+};
+
+static void vc5_hdmi_set_csc_coeffs(struct vc4_hdmi *vc4_hdmi,
+				    const u16 coeffs[3][4])
+{
+	HDMI_WRITE(HDMI_CSC_12_11, (coeffs[0][1] << 16) | coeffs[0][0]);
+	HDMI_WRITE(HDMI_CSC_14_13, (coeffs[0][3] << 16) | coeffs[0][2]);
+	HDMI_WRITE(HDMI_CSC_22_21, (coeffs[1][1] << 16) | coeffs[1][0]);
+	HDMI_WRITE(HDMI_CSC_24_23, (coeffs[1][3] << 16) | coeffs[1][2]);
+	HDMI_WRITE(HDMI_CSC_32_31, (coeffs[2][1] << 16) | coeffs[2][0]);
+	HDMI_WRITE(HDMI_CSC_34_33, (coeffs[2][3] << 16) | coeffs[2][2]);
+}
+
 static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
 			       const struct drm_display_mode *mode)
 {
@@ -533,35 +577,10 @@ static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
 
 	HDMI_WRITE(HDMI_VEC_INTERFACE_XBAR, 0x354021);
 
-	if (vc4_hdmi_is_full_range_rgb(vc4_hdmi, mode)) {
-		/* CEA VICs other than #1 requre limited range RGB
-		 * output unless overridden by an AVI infoframe.
-		 * Apply a colorspace conversion to squash 0-255 down
-		 * to 16-235.  The matrix here is:
-		 *
-		 * [ 0.8594 0      0      16]
-		 * [ 0      0.8594 0      16]
-		 * [ 0      0      0.8594 16]
-		 * [ 0      0      0       1]
-		 * Matrix is signed 2p13 fixed point, with signed 9p6 offsets
-		 */
-		HDMI_WRITE(HDMI_CSC_12_11, (0x0000 << 16) | 0x1b80);
-		HDMI_WRITE(HDMI_CSC_14_13, (0x0400 << 16) | 0x0000);
-		HDMI_WRITE(HDMI_CSC_22_21, (0x1b80 << 16) | 0x0000);
-		HDMI_WRITE(HDMI_CSC_24_23, (0x0400 << 16) | 0x0000);
-		HDMI_WRITE(HDMI_CSC_32_31, (0x0000 << 16) | 0x0000);
-		HDMI_WRITE(HDMI_CSC_34_33, (0x0400 << 16) | 0x1b80);
-	} else {
-		/* Still use the matrix for full range, but make it unity.
-		 * Matrix is signed 2p13 fixed point, with signed 9p6 offsets
-		 */
-		HDMI_WRITE(HDMI_CSC_12_11, (0x0000 << 16) | 0x2000);
-		HDMI_WRITE(HDMI_CSC_14_13, (0x0000 << 16) | 0x0000);
-		HDMI_WRITE(HDMI_CSC_22_21, (0x2000 << 16) | 0x0000);
-		HDMI_WRITE(HDMI_CSC_24_23, (0x0000 << 16) | 0x0000);
-		HDMI_WRITE(HDMI_CSC_32_31, (0x0000 << 16) | 0x0000);
-		HDMI_WRITE(HDMI_CSC_34_33, (0x0000 << 16) | 0x2000);
-	}
+	if (vc4_hdmi_is_full_range_rgb(vc4_hdmi, mode))
+		vc5_hdmi_set_csc_coeffs(vc4_hdmi, &vc5_hdmi_csc_full_rgb_unity);
+	else
+		vc5_hdmi_set_csc_coeffs(vc4_hdmi, &vc5_hdmi_csc_full_rgb_to_limited_rgb);
 
 	HDMI_WRITE(HDMI_CSC_CTL, csc_ctl);
 }
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
