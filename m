Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD84475906
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 13:44:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4907A10EC83;
	Wed, 15 Dec 2021 12:44:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD55C10EC83
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 12:44:21 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 102252B00254;
 Wed, 15 Dec 2021 07:44:19 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 15 Dec 2021 07:44:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=vFyasU1Zj80JP
 KfxeIvPb/EtyLtHaX0uVOoPCqWx9KA=; b=moMcT4XfxxbHilXZb1GaYDmZ6NPfr
 hqr/BjNBv5hg9a6nxpO9/I439fNtyRDTb8WZX5fc/+aQ/v4lLjoyn+E/XwES1MqO
 SjAGUUETooJAYLgPhatXS6B7DKCErPPTDNz0mFpjlTTJBQHEagCHVn2wyKOLYNYP
 axuyBsNsd2Q9qSMmwwC04bLQbvdCRnCxEkmVriF2xzH0L1A5yHoTLmxfejho155U
 mPny7mLdETHqjKFgbycJPNBQlmFgWobn7X7mzIHiywajQdc00or7Hi8L+7hDxTV5
 ibtGe+WZM4pA1tWJS7AlaHmxmZ1zyIp+1pWHZeImHyynBnylxdc0QxxKg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=vFyasU1Zj80JPKfxeIvPb/EtyLtHaX0uVOoPCqWx9KA=; b=kRNhpLSG
 ZfpW71SGRfS2wt1EOTLWCaPV5Ufl/c1b51k11/rD5F/XFKHJ2Ag3kMWBiufZiqVq
 Av/FdCv79avrSJI/avTLhhTZ4JjAyUZJmQ6QdEbIRY+k3hKJj/t7Yt7c3/v8BH85
 Kf9GxzqYQA3O62/tPAOa+An5rxitI0hInzWAErCvUaRPlttmIT7Zl3hbp30nasjK
 XKDOc9CcNL+4NgaVY/X1FK3KlGqCaO7lVGVxnyAPG6swlbOrcxgugFvzT+4GDZ3v
 nPTzaWfYVWEvbyqLIbbBRKLPRvg8xmjRJ+WXGwi7pcsBfE1mJwuLXwOkDeVPXdYd
 GRpiwN9elhvuQg==
X-ME-Sender: <xms:I-O5YQIY4rJp00epwEt6QCZm5e2Yher6skFdKEmKelAI5-PPBHPgsw>
 <xme:I-O5YQIhpHGoOBCsENaVQy846XNxnfffJ5wsVSm_lRn-vOyoCOTmvzWl28rPFxdZb
 mQRg3lauFvzvUhhUeY>
X-ME-Received: <xmr:I-O5YQsywvnP6ILH1Sly32ia6yaO4KV3UssJGYhjF3U_oRkD8CfGEnVcDT52DBxCYvGYVoHy_--agPEzeqQWZSkPKSQUTRyOjwsOJck>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrledvgdeghecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:I-O5YdacrMG7Gqd5kOz0ZbfSbnXNpk2o3Uqt7y-IKn12B6S5LhtHZw>
 <xmx:I-O5YXbP8vAb9qai6BcT0oIwGMkDErwQd1_z8W-V1fugz89LoNEtaw>
 <xmx:I-O5YZD1dNOSh4R9gTC6HutRXEB1i9x7BGNqsUwqCrJVNfBUPAJQnw>
 <xmx:I-O5YUQrJOVotRzu7T3MXGSAzP3wPHU9NSqOLR6JYLMKUhLBTUqYhCQVy7s>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Dec 2021 07:44:18 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 02/14] drm/edid: Rename drm_hdmi_avi_infoframe_colorspace
 to _colorimetry
Date: Wed, 15 Dec 2021 13:43:54 +0100
Message-Id: <20211215124406.340180-3-maxime@cerno.tech>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211215124406.340180-1-maxime@cerno.tech>
References: <20211215124406.340180-1-maxime@cerno.tech>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, Werner Sembach <wse@tuxedocomputers.com>,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The drm_hdmi_avi_infoframe_colorspace() function actually sets the
colorimetry and extended_colorimetry fields in the hdmi_avi_infoframe
structure with DRM_MODE_COLORIMETRY_* values.

To make things worse, the hdmi_avi_infoframe structure also has a
colorspace field used to signal whether an RGB or YUV output is being
used.

Let's remove the inconsistency and allow for the colorspace usage by
renaming the function.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_edid.c                  | 8 ++++----
 drivers/gpu/drm/i915/display/intel_hdmi.c   | 2 +-
 drivers/gpu/drm/i915/display/intel_lspcon.c | 2 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c              | 2 +-
 include/drm/drm_edid.h                      | 4 ++--
 5 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index e57d1b8cdaaa..dec7aecfc655 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5890,13 +5890,13 @@ static const u32 hdmi_colorimetry_val[] = {
 #undef ACE
 
 /**
- * drm_hdmi_avi_infoframe_colorspace() - fill the HDMI AVI infoframe
- *                                       colorspace information
+ * drm_hdmi_avi_infoframe_colorimetry() - fill the HDMI AVI infoframe
+ *                                       colorimetry information
  * @frame: HDMI AVI infoframe
  * @conn_state: connector state
  */
 void
-drm_hdmi_avi_infoframe_colorspace(struct hdmi_avi_infoframe *frame,
+drm_hdmi_avi_infoframe_colorimetry(struct hdmi_avi_infoframe *frame,
 				  const struct drm_connector_state *conn_state)
 {
 	u32 colorimetry_val;
@@ -5915,7 +5915,7 @@ drm_hdmi_avi_infoframe_colorspace(struct hdmi_avi_infoframe *frame,
 	frame->extended_colorimetry = (colorimetry_val >> 2) &
 					EXTENDED_COLORIMETRY_MASK;
 }
-EXPORT_SYMBOL(drm_hdmi_avi_infoframe_colorspace);
+EXPORT_SYMBOL(drm_hdmi_avi_infoframe_colorimetry);
 
 /**
  * drm_hdmi_avi_infoframe_quant_range() - fill the HDMI AVI infoframe
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 3b5b9e7b05b7..96e508ddc4af 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -730,7 +730,7 @@ intel_hdmi_compute_avi_infoframe(struct intel_encoder *encoder,
 	else
 		frame->colorspace = HDMI_COLORSPACE_RGB;
 
-	drm_hdmi_avi_infoframe_colorspace(frame, conn_state);
+	drm_hdmi_avi_infoframe_colorimetry(frame, conn_state);
 
 	/* nonsense combination */
 	drm_WARN_ON(encoder->base.dev, crtc_state->limited_color_range &&
diff --git a/drivers/gpu/drm/i915/display/intel_lspcon.c b/drivers/gpu/drm/i915/display/intel_lspcon.c
index 05d2d750fa53..092a925c6cf5 100644
--- a/drivers/gpu/drm/i915/display/intel_lspcon.c
+++ b/drivers/gpu/drm/i915/display/intel_lspcon.c
@@ -537,7 +537,7 @@ void lspcon_set_infoframes(struct intel_encoder *encoder,
 		frame.avi.colorspace = HDMI_COLORSPACE_RGB;
 
 	/* Set the Colorspace as per the HDMI spec */
-	drm_hdmi_avi_infoframe_colorspace(&frame.avi, conn_state);
+	drm_hdmi_avi_infoframe_colorimetry(&frame.avi, conn_state);
 
 	/* nonsense combination */
 	drm_WARN_ON(encoder->base.dev, crtc_state->limited_color_range &&
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 053fbaf765ca..be39e55ae113 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -502,7 +502,7 @@ static void vc4_hdmi_set_avi_infoframe(struct drm_encoder *encoder)
 					   vc4_encoder->limited_rgb_range ?
 					   HDMI_QUANTIZATION_RANGE_LIMITED :
 					   HDMI_QUANTIZATION_RANGE_FULL);
-	drm_hdmi_avi_infoframe_colorspace(&frame.avi, cstate);
+	drm_hdmi_avi_infoframe_colorimetry(&frame.avi, cstate);
 	drm_hdmi_avi_infoframe_bars(&frame.avi, cstate);
 
 	vc4_hdmi_write_infoframe(encoder, &frame);
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index 18f6c700f6d0..144c495b99c4 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -401,8 +401,8 @@ drm_hdmi_vendor_infoframe_from_display_mode(struct hdmi_vendor_infoframe *frame,
 					    const struct drm_display_mode *mode);
 
 void
-drm_hdmi_avi_infoframe_colorspace(struct hdmi_avi_infoframe *frame,
-				  const struct drm_connector_state *conn_state);
+drm_hdmi_avi_infoframe_colorimetry(struct hdmi_avi_infoframe *frame,
+				   const struct drm_connector_state *conn_state);
 
 void
 drm_hdmi_avi_infoframe_bars(struct hdmi_avi_infoframe *frame,
-- 
2.33.1

