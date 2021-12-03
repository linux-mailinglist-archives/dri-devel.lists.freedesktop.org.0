Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA6E4675AB
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 11:54:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DB2773373;
	Fri,  3 Dec 2021 10:54:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8187F73377
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Dec 2021 10:54:26 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id DBED55801B2;
 Fri,  3 Dec 2021 05:54:25 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Fri, 03 Dec 2021 05:54:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=4cAlWJtNFx+O/
 sPItMGrwDtqXVJOrEM9dSEm2k7z9tQ=; b=H0zAUMbIyGLtnNdd7NUOBoyrTqh4J
 WBka4PDYwEr3S/JN5LOO3u0NVd7E9VwVpTdwIHW7QipjkboCsJpgD3p/LpEaCVi9
 24b/VZiQbKetanG4oLJ/+fXLxcb267LSM2LlEV768STvy7bKONQrGMmPjJCe+r5k
 /cBTXq9I/9yKbpImPtNLogufX4XgaAn9EfwHX9zdOzEhA3sXFR1SB69EAbPuu1lZ
 pU6JxGdKnHvTRoDMejPog5b7aSv++Q9MbOtqYPLDVkBWJmZCYFUX0cRJyVSddKYe
 GVymkJ7xIFZLTYfXT5IoMimyX/hafBTpsJOZX58IILIw7Tf6yAoH0Td0g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=4cAlWJtNFx+O/sPItMGrwDtqXVJOrEM9dSEm2k7z9tQ=; b=TKzdUtIO
 F1uOZLrSTsSAL359PQuxu8uiUIjhjvDwsZduh5q2njzA+OSod5x+Lh91PPjBMnd8
 Pv4fhwm1XjLYgSDRjq7ejacEerzsXAH/tVUlyr4HpX95bOu8DyCkBPspmhQwzIuJ
 czq4o5oLsgRDtmjiPOfSNqJ20d3/Ob8f1Pf66+TsyCKdyCNSbYcPvoHPoqEUxIHz
 8P73L6aMp69KXXrOzjiIMYi9lakxKpgMb6zwTdpS50siJyUxLB5L0QDLjtBFgxru
 2lKO9v4dnAs6OKBumWlswwZbsWzahj5nDxXM8K9qE5niFGTFbl4e705AG+ETxo1B
 NxlnPs1ceYliFA==
X-ME-Sender: <xms:YfepYQsGvnW-4LVvq7V4AL0Z6PmwkkKma2x5fFM5icE82GLFyKlj6g>
 <xme:YfepYdeQcD-qU9Nq5AOINFJP4awW8FxZG2mg-q1H1a6HP4OwEQljoXTCMvtnv5Eeo
 XanjdePSU9Sc04-U0E>
X-ME-Received: <xmr:YfepYbwtoxQ7pCkz9HY0j8-Yjsz1UA7mBsi1_2SDLCSIA7OHmYWr-3V0iSpB_AhTMA1GNXLT1xmlxbJTgV9ryKErsVq2a-68am_9RILGmk_F6A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrieejgddvfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:YfepYTPNxNpeiesrUXeoObl_U68waiscg6IVoewwVQ7ZpJKysW7M3w>
 <xmx:YfepYQ_1bpeu1R53D6EFeGzM6_7GkfO70Q0exbAXCSnu2-_3XkDK8A>
 <xmx:YfepYbVtJJcFC3s0_m3oz1wUsNeNjr-L9GAqTjRCpWhujpr5_GaJGQ>
 <xmx:YfepYbagw02dHS_1TP2Z0pwZczQjOEnE0bdH8_qTFfc2XTRI1E4H5g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Dec 2021 05:54:25 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 01/11] drm/edid: Rename drm_hdmi_avi_infoframe_colorspace to
 _colorimetry
Date: Fri,  3 Dec 2021 11:54:10 +0100
Message-Id: <20211203105420.573494-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211203105420.573494-1-maxime@cerno.tech>
References: <20211203105420.573494-1-maxime@cerno.tech>
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
index 12893e7be89b..13644dd579b4 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5891,13 +5891,13 @@ static const u32 hdmi_colorimetry_val[] = {
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
@@ -5916,7 +5916,7 @@ drm_hdmi_avi_infoframe_colorspace(struct hdmi_avi_infoframe *frame,
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

