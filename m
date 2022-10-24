Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6067609E19
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 11:36:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 812C410E2D8;
	Mon, 24 Oct 2022 09:36:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4938910E2D8
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 09:36:43 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 56DC732007F9;
 Mon, 24 Oct 2022 05:36:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 24 Oct 2022 05:36:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm3; t=1666604198; x=1666690598; bh=tJAnVECZiyVGGs7MSXOQSHaKE
 3Egf/NEHXYWLpNgpb8=; b=Nklllfv0xF24dHTRPYhSnQ9xJqTvjCSlg4FE0Srh2
 piptaO3aJHfWEvUWiu30j8G6dLXAYd8N1uKo9ciID8ts2CgE7r6a/GrpCtNYaoeb
 /J0Z1xN+i9E4RF2cjBMCBPCiJhbyecGI1Mj8mWUchTDMl4D7Q/WZ3jZTnk6xi2tD
 acb29wDbnRG54wW5/eDrOV7c2ZjXk7PyK3E5/vNRM8Hz0MGi3gJMrIGLyEFHrPTu
 yVLbO0KmDVfsZt+jbq2IJNwanm2izU1AXqx6gvUVnG82k3Ci2ywusURb8MZeh9vl
 j1p4FSWgIUIgtlJVWvoZkO50T7krZ+gDj073yKnZswzCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1666604198; x=1666690598; bh=tJAnVECZiyVGGs7MSXOQSHaKE3Egf/NEHXY
 WLpNgpb8=; b=D1wOzAWLsAT4Kh/Jl55nFJXI9Ed6F3x81WaBr/CK5zi91waYuYW
 7mn1i29Zx10PzbEIGluEvE1bKVQhU2sR/itdT3SrF/XLf8XMG7XejP3YMpHqLZpX
 MKLNfo4wUt/E5FihV1oy6q62xY61jUcHrJXCRNWu2t6ryBkubUE3eADi5TjR9zUA
 91lw+g6OZ7QlYGj1rFmNr6sj3RgZVkbVczt7SSGSUb8zrSrpBdBj8HpKSwdVPmlR
 TPdMSGLLyCdRfsGAvAH0MxbDSCiKUiRjPNBoGl37/rREE9FAfMlPIAJD/UGn+sNu
 V0gL5OcHkNi9Us3s9lk597j2+QhhJHPH/qQ==
X-ME-Sender: <xms:pVxWY7o4CPXk71Wid2kiBqduLGQmEDPKSNwiXbTWVNkY5ATCnkes4Q>
 <xme:pVxWY1pf5ZY6yiNUZx873SUb9Zb1wIGyaGsO5IY4xlO-aIw898YhAbTGvTEv3yaPB
 T4qaL-PImIIaaXZCwc>
X-ME-Received: <xmr:pVxWY4PNrD1ua_Xj09f8MX618KPINo5lrGqBRLudpqesKeYrDj8n_2QZj0vUhLQ8NTNRbw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgedtgedgudefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepmhgrgihimhgv
 segtvghrnhhordhtvggthhenucggtffrrghtthgvrhhnpefgteffteegvdffheelheekhe
 ekfeeuledujeeikeelfffgfefhteefvddtheettdenucevlhhushhtvghrufhiiigvpedt
 necurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:plxWY-6e3tZcewKOoieDsToCSH49CjY7LENHil0MqRoLdtJjmChoWw>
 <xmx:plxWY65DP6OlJFKUndDBIyFDmUFZK_B77Bh3Uq7I9vEWhC9KtEd4Fg>
 <xmx:plxWY2jBDCJoUJzXcl59LtWQ8huSNxIfqL3BDZm6gCMeyOLS87VRKQ>
 <xmx:plxWY3zCmqtT32znDL8k7vGIbTYY_TewbE5XzcyQ0EFE5I7uxiAjDA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 24 Oct 2022 05:36:37 -0400 (EDT)
From: maxime@cerno.tech
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 1/2] drm/vc4: hdmi: Take our lock to reset the link
Date: Mon, 24 Oct 2022 11:36:33 +0200
Message-Id: <20221024093634.118190-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.37.3
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
Cc: Tim Gover <tim.gover@raspberrypi.com>, Dom Cobley <dom@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We access some fields protected by our internal mutex in
vc4_hdmi_reset_link() (saved_adjusted_mode, output_bpc, output_format)
and are calling functions that need to have that lock taken
(vc4_hdmi_supports_scrambling()).

However, the current code doesn't lock that mutex. Let's make sure it
does.

Fixes: 6bed2ea3cb38 ("drm/vc4: hdmi: Reset link on hotplug")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 596e311d6e58..9e549fa07467 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -349,27 +349,40 @@ static int vc4_hdmi_reset_link(struct drm_connector *connector,
 	if (!crtc_state->active)
 		return 0;
 
-	if (!vc4_hdmi_supports_scrambling(encoder))
+	mutex_lock(&vc4_hdmi->mutex);
+
+	if (!vc4_hdmi_supports_scrambling(encoder)) {
+		mutex_unlock(&vc4_hdmi->mutex);
 		return 0;
+	}
 
 	scrambling_needed = vc4_hdmi_mode_needs_scrambling(&vc4_hdmi->saved_adjusted_mode,
 							   vc4_hdmi->output_bpc,
 							   vc4_hdmi->output_format);
-	if (!scrambling_needed)
+	if (!scrambling_needed) {
+		mutex_unlock(&vc4_hdmi->mutex);
 		return 0;
+	}
 
 	if (conn_state->commit &&
-	    !try_wait_for_completion(&conn_state->commit->hw_done))
+	    !try_wait_for_completion(&conn_state->commit->hw_done)) {
+		mutex_unlock(&vc4_hdmi->mutex);
 		return 0;
+	}
 
 	ret = drm_scdc_readb(connector->ddc, SCDC_TMDS_CONFIG, &config);
 	if (ret < 0) {
 		drm_err(drm, "Failed to read TMDS config: %d\n", ret);
+		mutex_unlock(&vc4_hdmi->mutex);
 		return 0;
 	}
 
-	if (!!(config & SCDC_SCRAMBLING_ENABLE) == scrambling_needed)
+	if (!!(config & SCDC_SCRAMBLING_ENABLE) == scrambling_needed) {
+		mutex_unlock(&vc4_hdmi->mutex);
 		return 0;
+	}
+
+	mutex_unlock(&vc4_hdmi->mutex);
 
 	/*
 	 * HDMI 2.0 says that one should not send scrambled data
-- 
2.37.3

