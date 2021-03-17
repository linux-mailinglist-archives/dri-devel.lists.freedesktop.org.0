Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCA233F418
	for <lists+dri-devel@lfdr.de>; Wed, 17 Mar 2021 16:44:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51A9F6E7FE;
	Wed, 17 Mar 2021 15:44:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C80DC6E7E5
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 15:44:11 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 3E014580A4F;
 Wed, 17 Mar 2021 11:44:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 17 Mar 2021 11:44:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=G8ptgUyh9Y9rK
 mbLIM/oOMAmhD9oxH+pATQFgMQ8ODE=; b=pgC5FclO7iAcXW0u+gcGJLyOnhiKm
 eFcLOopr4OCwJasvsv242Vxb9gdgifNzCWcMx4Qbfi8NhY4tNhSa4IRcubNGb1Ax
 E2HKJYoXoO/m4E9aoZ5GZOdC0AGSNMldj0reZXuj65s54A3GhsQZNjJ8IXZ0GMEV
 l0KetYHtoYTbUn+NOP1IAxxkO5nvJoD26cKVjb7AAVv50DTx4oTBgj3arSdCaEJl
 UjyybNennrL3kHUQZmgv7LrJjNWbkY/vgVaGFcl9X6MglgmQYePdJORUC18PZ9Xu
 8Qc7iSPm1K00ido7tmclUL8VflGJw/Uyip+GSYxIqo2A8iC1YWYcVZejA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=G8ptgUyh9Y9rKmbLIM/oOMAmhD9oxH+pATQFgMQ8ODE=; b=rj7XFqQQ
 tOcAD7tMWr+xgcri9nk8OATFCvt2I6lCwcpDXUOxc/1yLXoNKrfYYmubWMHu7VQM
 +/XqwDHt3RtKkf7mPlEaYOZtPEkOw9vRYgh5aiawVZezL4WiriuBvgFFqJQXO8C9
 8/7ydcAQVNs++FKx+Kv/S3EHKGJ+bwFZtaM6yLgDsoW9iGUJ0doQGwgw6gRIwlbf
 ijyEq022ovrIbc/jbDXxn+LToySdsfmAsFxM+bXLmbDFA3fbE9w0n0ZddR8+pLU+
 riRPJkvv3bF4AdoMnXODRyJ/1rLzbqEE4Ex+rda2GZS+loAMetCF1xMXHFzFXcQ9
 4DXM5jE6D5ADHA==
X-ME-Sender: <xms:ySNSYCSEh0TtM5UyIXnQWRsDRXndbv8Alv0G-TFWlO6Q4Oa2HfVMhg>
 <xme:ySNSYAsZYuGzLogp2jVTeZOLD_SuYAgEvJ3lo4_uKi7PnzimvMzphAFoB1sPSsNQu
 7VjDLFMNnXg7HkDs9A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefgedgkedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:ySNSYBx3AFfCU5ZUrPRdRKLUlkhVZDSY1_lGY3TC99X4f1XgJexzeg>
 <xmx:ySNSYK6RmmeDWma596-oKDi6T_A2bGLdK42UkAVxSO3vVOcdpZ9_wQ>
 <xmx:ySNSYLVS7N1enGhoxT4GBiEbdYtQ7x1-VVRljXFG5nfnkzQheOhmgA>
 <xmx:yyNSYEHH3ItyLpfgQHVCXOUWMAEN0Rxa1wk5Gzi4iBs4cFPXyo3FHg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id ABC9624005E;
 Wed, 17 Mar 2021 11:44:09 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 09/18] drm/vc4: hdmi: Remove limited_rgb_range
Date: Wed, 17 Mar 2021 16:43:43 +0100
Message-Id: <20210317154352.732095-10-maxime@cerno.tech>
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

The limited_rgb_range field in the vc4_hdmi_encoder structure is used to
tell whether we're supposed to output with a full or limited RGB range.

This is redundant with the new helper we introduced, so let's convert to
that helper and drop that field.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 21 +++++----------------
 drivers/gpu/drm/vc4/vc4_hdmi.h |  1 -
 2 files changed, 5 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index bb2fffa2d495..8f0af246f18f 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -384,7 +384,6 @@ static void vc4_hdmi_write_infoframe(struct drm_encoder *encoder,
 static void vc4_hdmi_set_avi_infoframe(struct drm_encoder *encoder)
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
-	struct vc4_hdmi_encoder *vc4_encoder = to_vc4_hdmi_encoder(encoder);
 	struct drm_connector *connector = &vc4_hdmi->connector;
 	struct drm_connector_state *cstate = connector->state;
 	struct drm_crtc *crtc = encoder->crtc;
@@ -401,9 +400,9 @@ static void vc4_hdmi_set_avi_infoframe(struct drm_encoder *encoder)
 
 	drm_hdmi_avi_infoframe_quant_range(&frame.avi,
 					   connector, mode,
-					   vc4_encoder->limited_rgb_range ?
-					   HDMI_QUANTIZATION_RANGE_LIMITED :
-					   HDMI_QUANTIZATION_RANGE_FULL);
+					   vc4_hdmi_is_full_range_rgb(vc4_hdmi, mode) ?
+					   HDMI_QUANTIZATION_RANGE_FULL :
+					   HDMI_QUANTIZATION_RANGE_LIMITED);
 
 	drm_hdmi_avi_infoframe_bars(&frame.avi, cstate);
 
@@ -841,20 +840,10 @@ static void vc4_hdmi_encoder_pre_crtc_enable(struct drm_encoder *encoder,
 					     struct drm_atomic_state *state)
 {
 	struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
-	struct vc4_hdmi_encoder *vc4_encoder = to_vc4_hdmi_encoder(encoder);
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 
-	if (vc4_hdmi_is_full_range_rgb(vc4_hdmi, mode) {
-		if (vc4_hdmi->variant->csc_setup)
-			vc4_hdmi->variant->csc_setup(vc4_hdmi, mode);
-
-		vc4_encoder->limited_rgb_range = true;
-	} else {
-		if (vc4_hdmi->variant->csc_setup)
-			vc4_hdmi->variant->csc_setup(vc4_hdmi, mode);
-
-		vc4_encoder->limited_rgb_range = false;
-	}
+	if (vc4_hdmi->variant->csc_setup)
+		vc4_hdmi->variant->csc_setup(vc4_hdmi, mode);
 
 	HDMI_WRITE(HDMI_FIFO_CTL, VC4_HDMI_FIFO_CTL_MASTER_SLAVE_N);
 }
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 3d88261d463e..8e42f9e7b3e2 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -12,7 +12,6 @@
 struct vc4_hdmi_encoder {
 	struct vc4_encoder base;
 	bool hdmi_monitor;
-	bool limited_rgb_range;
 };
 
 static inline struct vc4_hdmi_encoder *
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
