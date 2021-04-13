Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D042235E1FC
	for <lists+dri-devel@lfdr.de>; Tue, 13 Apr 2021 16:55:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A689F6E5A4;
	Tue, 13 Apr 2021 14:54:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DD6A6E5D1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 14:54:55 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.west.internal (Postfix) with ESMTP id 746C01686;
 Tue, 13 Apr 2021 10:54:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 13 Apr 2021 10:54:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=RZ+7cLdLCn5DR
 8uARNVItIzTOCh3S5LvTDfw4Uv7SZo=; b=B/5NhD6IEWByuPFJgYne/27AMRLz/
 rp0Cs9oKxSBvD3cExOb0Xe0OXHOYOQcR3RbK225E0d/aHSVayBfKBSfoiOqOFYRK
 JDBc7o8crL2HWBUQffMPGEzGxKJa4gqw+6BU/8bWJV4/CwFQMdiXqwDUS/QMQHa/
 Rl09ZeS4hGjAS+SRMF2yhAhtC3sw2r9VsmYicuoOvg8O9G34vswU9N1pfPPTrYrQ
 fGbKD/ZN+etfHRXMxsrpIrSTk6PVEOkN1In6ZCRV6Q17aDcs64ouqf/yPes6mYb8
 68bGeS78jXwrpdQ3TyiMMLePo68nW/RHmIDkWevgA1NPX8jRSYd/S4TjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=RZ+7cLdLCn5DR8uARNVItIzTOCh3S5LvTDfw4Uv7SZo=; b=VDyLPJSN
 uCUrw6zXR3GYutHovNegLnHv+xFHsRFpp/ROolZiVLQFV7qwyX1F+ldejy5VpPhJ
 +mthazeSFmUBpldtoxkFVRZEbRKH1qQeUgpRji2YnXZgeGygL/VdWPdBs77F2T8s
 T4FpCZmC5lHL38ylOY57SbRLBKrFnS8S5/s+qYGTJoFXhz0Zva4LoZRkddaDn2c0
 9O7cBs9QFqB9GpamBhIqDT9mvnvXvzK1Fm5AgK2NRCj9h1k38V1WCToWnAOEFjDg
 qPqhiYzjDakw4T7uMb/dl8O4DtLBl2YQ8fxTZ6IpQFMX3+HrGeDeLyWuw6KWt92j
 FXGoue+1goOlFg==
X-ME-Sender: <xms:vrB1YAdPI6QP1dW_XHJHxSwTy9N0bCACXF4L16kl-d1uvwCaRcwEVQ>
 <xme:vrB1YBoU5KONc-BFQrBE6taguCM8__hpS5nRk1EVmtMAL_pKHO3n0-shky9ntKyyN
 CoefPG62UEA6Fa7nfs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudekledgkedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:vrB1YCnwTlqBPaR43XkLYi0XlQsFagokGXKYBsFiK3ZRnRtIOP5oOQ>
 <xmx:vrB1YKSK14an1wN39WeW0gvtjTOHmUXsBBTse4NM5fmLJgA2a4avAw>
 <xmx:vrB1YAbQaHjIcOBvlnXaP_c6d-fVeiudPsGOVBrKxRD_2GWmphUYmA>
 <xmx:vrB1YBlQyBDdGwVU0ABe_EKWO_D9pzCY61U_JNtvEHSGslB6aPnn929A6QI>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id D277C24006A;
 Tue, 13 Apr 2021 10:54:53 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v3 6/9] drm/vc4: hdmi: Properly compute the BVB clock rate
Date: Tue, 13 Apr 2021 16:54:38 +0200
Message-Id: <20210413145441.483977-7-maxime@cerno.tech>
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

The BVB clock rate computation doesn't take into account a mode clock of
594MHz that we're going to need to support 4k60.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 9c919472ae84..c50dc5a59b2f 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -91,7 +91,6 @@
 # define VC4_HD_M_ENABLE			BIT(0)
 
 #define CEC_CLOCK_FREQ 40000
-#define VC4_HSM_MID_CLOCK 149985000
 
 #define HDMI_14_MAX_TMDS_CLK   (340 * 1000 * 1000)
 
@@ -739,7 +738,7 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
 		conn_state_to_vc4_hdmi_conn_state(conn_state);
 	struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
-	unsigned long pixel_rate, hsm_rate;
+	unsigned long bvb_rate, pixel_rate, hsm_rate;
 	int ret;
 
 	ret = pm_runtime_get_sync(&vc4_hdmi->pdev->dev);
@@ -793,12 +792,14 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
 
 	vc4_hdmi_cec_update_clk_div(vc4_hdmi);
 
-	/*
-	 * FIXME: When the pixel freq is 594MHz (4k60), this needs to be setup
-	 * at 300MHz.
-	 */
-	ret = clk_set_min_rate(vc4_hdmi->pixel_bvb_clock,
-			       (hsm_rate > VC4_HSM_MID_CLOCK ? 150000000 : 75000000));
+	if (pixel_rate > 297000000)
+		bvb_rate = 300000000;
+	else if (pixel_rate > 148500000)
+		bvb_rate = 150000000;
+	else
+		bvb_rate = 75000000;
+
+	ret = clk_set_min_rate(vc4_hdmi->pixel_bvb_clock, bvb_rate);
 	if (ret) {
 		DRM_ERROR("Failed to set pixel bvb clock rate: %d\n", ret);
 		clk_disable_unprepare(vc4_hdmi->hsm_clock);
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
