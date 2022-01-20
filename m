Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 236C249512E
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 16:16:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32D6210E41A;
	Thu, 20 Jan 2022 15:16:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 636A410E3DD
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 15:16:35 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 1ABF62B00152;
 Thu, 20 Jan 2022 10:16:34 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 20 Jan 2022 10:16:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; bh=IJZzb4vcDf7wRi
 6i17hi8bEFg9G7R0Xg25Sjj9P826A=; b=EV2vOdA7GsM20ql7pvD8aFRhpMIRcB
 aFLa2sktHGQ5OT8XDvopqAM8cSiQdfgycuobbnu09+LUB4ZzMh9DJ9rl6p/rn9RA
 jykJbL8a4tZi3ER2+b9sZxNU+J7JHhekaAs/snCJbypfdw/d1Es3t+ZNPmLLR96R
 xYNc8mZOuh8q4y0AjJucbvSMFrwgyWPkDM6hXQxk73YHNMRviSQwc0P0otyN/d6S
 m3IKWsX25izEuxpiS9TjGvQUMeGiS8jf7ENSGmz/dG6eCdfmpfVrE765iEBP3qFy
 BUt8Z+jgG8lV3aJOwF+t/XCbnZ/kHkfqUGGVBxb+ebC67/+jvbOOM5Ew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=IJZzb4vcDf7wRi6i17hi8bEFg9G7R0Xg25Sjj9P82
 6A=; b=baE0/6PAyxENAtrmV+/UKOHRuo7UHA8JCkZJnsiMS6BMkgrIYunLrlAe7
 iEL9pc2SpZTmskN9wUbpIDK6lTyfIzss334NwQYnVoXNPTY4q2Keg5bsQAKy3spW
 je3AXhFUPXesvX19UueERdHahsOnNfu3ZhvQupxbsxPzi28wza4QjodPiuuRIdWK
 sFFRDImv4oiGGQprjN4Groc6+3WUQl2EtoaG6HRRqRWFv+gSgdTI0bJnbfCE6dym
 YQ1fGCEr5HqlWJxhU8+1MUAm7kW1SELZPxuEU6xZTlj4BL0OmA6vCN5uO0ypc+8q
 G1JYzj/iecPafUcgeyx1XGVKMN+wg==
X-ME-Sender: <xms:0HzpYY5wtmKXDChONTmV91Abxxf81_C2k7cGlcNevSoRumqEGhZ2OA>
 <xme:0HzpYZ6cqx-SJ12aYbu30uC3yiZXX8jUJlxLi72OsTFlgJkaHKXY2zXy7E8lZ5178
 tIzzV3s-hW8FRVc5Y0>
X-ME-Received: <xmr:0HzpYXf7zwcmvOrAJliJJr2KWliCUrA0bB7XtFN0sRMvaJr7o3TG2kv6rtihuZ3mS_Hm1ylnlLY_bESoDdAivZCugTT6mTf0RDI__2I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudekgdejvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepjeeugfegkeffgfeuvedtvddufffhjeffjeejvddvudduteehhfefhfefgeei
 keeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:0HzpYdJnEnhW8eij_5jir2LVlLRiVwruwd245B3CuvMxf-ob-Yep6Q>
 <xmx:0HzpYcKk-LZMukAGTHh4P2oMmCO8Zl6gKtIm_U6-8p8sZIKUD_Zhqg>
 <xmx:0HzpYewOo-uM1Ul6t7JGIK7YBLdI68ukBwowk9yQiqPQvEqHAAf-4Q>
 <xmx:0XzpYZDruV762dW0KeepyBqYlp4CJJwqHjuPM6LS3W2MxU301yKcOO11DJk>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Jan 2022 10:16:32 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v4 01/16] drm/edid: Rename drm_hdmi_avi_infoframe_colorspace
 to _colorimetry
Date: Thu, 20 Jan 2022 16:16:10 +0100
Message-Id: <20220120151625.594595-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220120151625.594595-1-maxime@cerno.tech>
References: <20220120151625.594595-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
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
2.34.1

