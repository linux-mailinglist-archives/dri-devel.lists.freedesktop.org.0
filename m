Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3A648D968
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 15:07:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7967F10E248;
	Thu, 13 Jan 2022 14:07:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEDBF10E18A
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 14:07:28 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 4A73F5807F2;
 Thu, 13 Jan 2022 09:07:28 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 13 Jan 2022 09:07:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=fm1; bh=
 IJZzb4vcDf7wRi6i17hi8bEFg9G7R0Xg25Sjj9P826A=; b=LmPdCIZSpfNtgFhR
 7MwpMIrQ84usXSOiRfMTwNW2zAWO8ZL1ImmGwvDZJzZUpXYp8z0ZJ9ogvFAz54d0
 TztOcozaceviTMJITSm9R52z7zMIGCjquEd+ipMwIaZH4/6zXCTCEk0U4OcyvXtt
 zWa9TlCLWfeg6YmC8rzqGAO+/fcwdWsfEucMX/SqO1W+RtL4ozf01l5J68QAIjaE
 uc9UE/tNa406bjZaz8W41MCw7vR3USUOvmEYs7DX+QH7t2RZZtRSBRNFuqE3UVOg
 z/YplPz+pM7toSx9TJXvr9ox1V6XAfzkt9FKJF+6yQtO1Tp71jlKZ2KWKZD3jBvy
 3PYZxg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=IJZzb4vcDf7wRi6i17hi8bEFg9G7R0Xg25Sjj9P82
 6A=; b=dczC1MZrEH3F+YfHtgZuRR7xI7K0JVmmLQsHv85rpzTEKjTyJy5e2UAtK
 vaTc1Ki9zXUxOazL21nkbxgOx6u9L+oCOxbRH7cPEBIFUIdRSLCIfHAsSKttIyOV
 eRTE9QLwLmJaCOz/o8eOEcTbIKIUWhkoUL+2/UXrbLKq5rqiYxLC3R34KkhpuTeE
 WwjG/TKw9eh6Xc1xfnEhW1LyO0FdTDTIiaJvVqKncvTrbv5dycytLcS886CLSTcC
 CLt2B6zi/pnoKqz+++spQpXvcYH0VXXKAQPtG5HKgccLD+lu7uT5WdiVeWV0Nsbz
 mqHnHz2U6NjiMuUPkDsYy/BCBlvGg==
X-ME-Sender: <xms:IDLgYQST0LhCNH-2tHlwH4hEBPIEzjVr_nddymzrIcnVqLzUKooVQw>
 <xme:IDLgYdxMilx_DVYRbLPWkVVJVa_o5luItNEbL-fHSXsz0aj7LXWr9fIsmSA00bQOQ
 G54KjUnwXVVxCnh-8I>
X-ME-Received: <xmr:IDLgYd25IEIibQITOOQQSYflXVDTQAkBp9bow--tS0uPDx8wTdMJDACd-RC5skq49xuWolsdcSzTE_ruRMNDeieATTUjydE1zxV7utY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrtdefgdehlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepjeeugfegkeffgfeuvedtvddufffhjeffjeejvddvudduteehhfefhfefgeei
 keeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:IDLgYUAdi9FZlTHYMGS0TiMZ7dDJuZQz5Ph73rLjco8fk4gjW1xqRw>
 <xmx:IDLgYZi4xufX5wtc31EW0tbNZ6pzqj81zA4X_rHqzsw03TjYsCAFjg>
 <xmx:IDLgYQrFe7Z-xrPP9V9kgH8Qt2xn6O4BzAOfLFR7ZLv3qYc5VeVflw>
 <xmx:IDLgYeagLJxIZsoafhM1PmoFpv16A5Z1m3C6N0tTEv-Bk-D2-xlWUg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Jan 2022 09:07:27 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v3 01/16] drm/edid: Rename drm_hdmi_avi_infoframe_colorspace
 to _colorimetry
Date: Thu, 13 Jan 2022 15:07:05 +0100
Message-Id: <20220113140720.1678907-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220113140720.1678907-1-maxime@cerno.tech>
References: <20220113140720.1678907-1-maxime@cerno.tech>
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
 Werner Sembach <wse@tuxedocomputers.com>, dri-devel@lists.freedesktop.org,
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

