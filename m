Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0365F376797
	for <lists+dri-devel@lfdr.de>; Fri,  7 May 2021 17:06:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AF366EE5D;
	Fri,  7 May 2021 15:06:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9514E6EE5D
 for <dri-devel@lists.freedesktop.org>; Fri,  7 May 2021 15:06:04 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.west.internal (Postfix) with ESMTP id 5C8EE45D;
 Fri,  7 May 2021 11:06:03 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 07 May 2021 11:06:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=96379yQnsIehT
 01GQXKJhvZ6Q4y1tsFGCN7qprHXy5o=; b=aKRNwiYwytTmg6us6c2YqmK3DbMMQ
 imt97QJ73i/Y5fhJqkaasTjdM6+kJPucgk3ZkXKpnUv0I8YnEgT1u8hD+B1dF4Eq
 zp+mAACX8y+ZQQ7qzdf7ELaglz1KqmF9q7YWCGO03pzo/PGNK9rBOmWpggSt0wtb
 GcqEOddyLVNxJNsGquZMR3yZyDdTawy+CUh1I9LO/J6Erblic009KPKakuh1oVNq
 Fr4UQ1x502uEuijl1M9njQK9MXbdUSRB3aHfhpRGRP1rCD2ZgNitVkmVlJ0U6wAl
 xKUlK6KDAKT7TnEOu0N08q8xlSXcA9qXeDCnBHkneGwzojZwTw4Z5BWaQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=96379yQnsIehT01GQXKJhvZ6Q4y1tsFGCN7qprHXy5o=; b=HnLmjPIQ
 xQPS8chMTxbW3gKCQNKi51h7rUeEA/m/sali+GLSIqqEKbLD8K99nVpx+lAuTdnQ
 zM68unSZWGPYaqHfZICaM838iwtFCNST4eWIRMrfH2voBb4UQqukaHkYGLONiwRz
 +ep2K1jV59oaoXTRuspvKIhVCWa36AxQPwNhPAbSn4vWmvuQTgqraZ7kprR2fW9h
 RzZM1eniyYXhUgCH759yjCWz5hAwYi+xxg4nksrhAbzeEv3IWGNh8+C2zo5OWK9B
 sY0x16M1Ei+cNH3cFepOyW7XsHZf11/TjH6HWKHztGcLwzwUNzkZTiPQTNOvLPXr
 nGveZsPvHjOHxQ==
X-ME-Sender: <xms:WVeVYJOyi3cv5t_jwQRZKzv0gSlcYNU4mfGFaYah5CK5VvBcKnn0XQ>
 <xme:WVeVYL82Zcqfnbq5fiSiO44oZ_-p815Se0N6BM5VfWJqjFPoA67OOwEDAAEqgeT9r
 _eWqMb8Pyz_S5mj9nI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdegvddgkeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:WVeVYIRBvC2MtsABwYumrPALrWGE4rhdedQ_zRIFiBrqhv-7mrPfDA>
 <xmx:WVeVYFvpl74kaPiAD4GG3zH5SKLPu2qNQWFrJekhAMS5jO3WKRc7Dw>
 <xmx:WVeVYBfifegzFkcs25vKMGO56lA19sNhLMLxVTMdZA4e4OPKODkjYw>
 <xmx:WleVYP2jHeA40nGXL1bjqpjlqq0CKDg4PCkeMZgKb9ZfixIcOFa4LKuxgn0>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Fri,  7 May 2021 11:06:01 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>
Subject: [PATCH v4 08/12] drm/vc4: hdmi: Properly compute the BVB clock rate
Date: Fri,  7 May 2021 17:05:11 +0200
Message-Id: <20210507150515.257424-9-maxime@cerno.tech>
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
2.31.1

