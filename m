Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7C3475911
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 13:45:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9E3110ECD6;
	Wed, 15 Dec 2021 12:45:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FF5A10ECD1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 12:45:04 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id B22C72B00252;
 Wed, 15 Dec 2021 07:45:02 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 15 Dec 2021 07:45:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=bYAdLm4BtajkR
 nZ3bqYGUPLZ8rc6EbodqelBsMU7g3I=; b=K0DXVPMzLbOuPuEIyomYi0CQYjOVZ
 sIycaXoMv3MLsmAwWvYAceVkfgOCEro+7Q7AulGmzDC8VSJJv0OqpIP6H9spxZHv
 aXgsfD451YWE4xRaf3oHDqr8UbC66JC0Da+mhSuhDX1hkYVO6FtUpSGGcY2uappI
 WHKXdkY7dW/H6+flNJDP8FVW5L5RO8AL1+CFl+iW6Fu6a7Cm4kPxfjoVEWW74EPJ
 K7l45W136aLLokgeKYuZ+zsi3x6OLmTynuKRFlXV3XX/FWVQXe0wVEIIE6tIvuAq
 vuB4c1En0qRkD9UFAWceqLwHUeSkF4npDms9VWMSElKBGYF2HXys45tMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=bYAdLm4BtajkRnZ3bqYGUPLZ8rc6EbodqelBsMU7g3I=; b=NBKbkXcm
 E6E0PCgyROFUPrFgnWcSUqeB2JtOsek+iPdSzfxP6J9kx+kJDK/MkB+qSKyX/IeB
 ySWREJnf74RkfU/Zjrz1aGXMgunlS62swSdyIR3MEs4Nru2j8EJS2wkYiedTd+j1
 Qj+/wizR77BAoro1bloaJ4blNi55OIOQ2imn5vkgX8X/E9RLc1JQiHQt0WhOLNMR
 /DRNzgnNp+qrGGYzN4enw4jU69tj05Fe+OKzGUbuc28U2VjWQP7JNVBgwiidpgSI
 Nbwd0ntqnhorjBl+2WhASc79T63ksf6alFl28VC0aAdhBYW7Qz02t85x976Oznx9
 bcZC/AzvyusF2A==
X-ME-Sender: <xms:TuO5YZ0pzvTd7l1OHDb_2T_skHAAKowPNG26tNrqxU2TNCfLYdFkFw>
 <xme:TuO5YQHi3D9YZoso9ECRL4VuZeC4q2JHhHyzBSqtZsMHeM2YIfxnATszFK-tqMGSC
 fWBFAtcce4bbxiUx90>
X-ME-Received: <xmr:TuO5YZ54ZdL-A5cfRQG1tJwiu42grLm1I-EB_3o1JLPBk1ceJAb95H7uQpJtUDnwlEVaOXJhfbn-3G4Lv_udPODNIGRzgKAhX_p7Hyc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrledvgdeggecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:TuO5YW27HTo__BHAVG2Sg_YXxux4hRpYkzAGtkf1rCe-qg7AOFlF6w>
 <xmx:TuO5YcF_zP8xNAR-FyEQabJnwffdQO7N9LE7mNUwnRW1QNfrZGKL1Q>
 <xmx:TuO5YX9nrEkZuHCJv9WvyFyFGw9p2WcuIDKGg7ZROs_qu6kEs3paRw>
 <xmx:TuO5YU-Exl_dhYn3ZlTSFqhW5pHxnWPN4chUVkpDej9u4E74yDyb1d2OHso>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Dec 2021 07:45:01 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 13/14] drm/vc4: hdmi: Always try to have the highest bpc
Date: Wed, 15 Dec 2021 13:44:05 +0100
Message-Id: <20211215124406.340180-14-maxime@cerno.tech>
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

Currently we take the max_bpc property as the bpc value and do not try
anything else.

However, what the other drivers seem to be doing is that they would try
with the highest bpc allowed by the max_bpc property and the hardware
capabilities, test if it results in an acceptable configuration, and if
not decrease the bpc and try again.

Let's use the same logic.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 44 ++++++++++++++++++++++++++++++----
 drivers/gpu/drm/vc4/vc4_hdmi.h |  4 +++-
 2 files changed, 43 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index be640b8be58c..b4aff3e0bba4 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -352,6 +352,7 @@ vc4_hdmi_connector_duplicate_state(struct drm_connector *connector)
 		return NULL;
 
 	new_state->pixel_rate = vc4_state->pixel_rate;
+	new_state->output_bpc = vc4_state->output_bpc;
 	__drm_atomic_helper_connector_duplicate_state(connector, &new_state->base);
 
 	return &new_state->base;
@@ -907,6 +908,8 @@ static void vc5_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
 				 struct drm_connector_state *state,
 				 struct drm_display_mode *mode)
 {
+	const struct vc4_hdmi_connector_state *vc4_state =
+		conn_state_to_vc4_hdmi_conn_state(state);
 	bool hsync_pos = mode->flags & DRM_MODE_FLAG_PHSYNC;
 	bool vsync_pos = mode->flags & DRM_MODE_FLAG_PVSYNC;
 	bool interlaced = mode->flags & DRM_MODE_FLAG_INTERLACE;
@@ -954,7 +957,7 @@ static void vc5_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
 	HDMI_WRITE(HDMI_VERTB0, vertb_even);
 	HDMI_WRITE(HDMI_VERTB1, vertb);
 
-	switch (state->max_bpc) {
+	switch (vc4_state->output_bpc) {
 	case 12:
 		gcp = 6;
 		gcp_en = true;
@@ -1262,9 +1265,11 @@ static void vc4_hdmi_encoder_atomic_mode_set(struct drm_encoder *encoder,
 					     struct drm_connector_state *conn_state)
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
+	struct vc4_hdmi_connector_state *vc4_state =
+		conn_state_to_vc4_hdmi_conn_state(conn_state);
 
 	mutex_lock(&vc4_hdmi->mutex);
-	vc4_hdmi->output_bpc = conn_state->max_bpc;
+	vc4_hdmi->output_bpc = vc4_state->output_bpc;
 	memcpy(&vc4_hdmi->saved_adjusted_mode,
 	       &crtc_state->adjusted_mode,
 	       sizeof(vc4_hdmi->saved_adjusted_mode));
@@ -1319,6 +1324,38 @@ vc4_hdmi_encoder_compute_clock(const struct vc4_hdmi *vc4_hdmi,
 	return 0;
 }
 
+static int
+vc4_hdmi_encoder_compute_config(const struct vc4_hdmi *vc4_hdmi,
+				struct vc4_hdmi_connector_state *vc4_state,
+				const struct drm_display_mode *mode)
+{
+	struct drm_connector_state *conn_state = &vc4_state->base;
+	unsigned int max_bpc = clamp_t(unsigned int, conn_state->max_bpc, 8, 12);
+	unsigned int bpc;
+	int ret;
+
+	for (bpc = max_bpc; bpc >= 8; bpc -= 2) {
+		drm_dbg(dev, "Trying with a %d bpc output\n", bpc);
+
+		ret = vc4_hdmi_encoder_compute_clock(vc4_hdmi, vc4_state,
+						     mode, bpc);
+		if (ret)
+			continue;
+
+		vc4_state->output_bpc = bpc;
+
+		drm_dbg(dev,
+			"Mode %ux%u @ %uHz: Found configuration: bpc: %u, clock: %llu\n",
+			mode->hdisplay, mode->vdisplay, drm_mode_vrefresh(mode),
+			vc4_state->output_bpc,
+			vc4_state->pixel_rate);
+
+		break;
+	}
+
+	return ret;
+}
+
 #define WIFI_2_4GHz_CH1_MIN_FREQ	2400000000ULL
 #define WIFI_2_4GHz_CH1_MAX_FREQ	2422000000ULL
 
@@ -1352,8 +1389,7 @@ static int vc4_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
 		pixel_rate = mode->clock * 1000;
 	}
 
-	ret = vc4_hdmi_encoder_compute_clock(vc4_hdmi, vc4_state, mode,
-					     conn_state->max_bpc);
+	ret = vc4_hdmi_encoder_compute_config(vc4_hdmi, vc4_state, mode);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 31b7d27deb8e..05d2b0eeaa9b 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -218,7 +218,8 @@ struct vc4_hdmi {
 	bool scdc_enabled;
 
 	/**
-	 * @output_bpc: BPC currently being used. Protected by @mutex.
+	 * @output_bpc: Copy of @vc4_connector_state.output_bpc for use
+	 * outside of KMS hooks. Protected by @mutex.
 	 */
 	unsigned int output_bpc;
 };
@@ -240,6 +241,7 @@ encoder_to_vc4_hdmi(struct drm_encoder *encoder)
 struct vc4_hdmi_connector_state {
 	struct drm_connector_state	base;
 	unsigned long long		pixel_rate;
+	unsigned int 			output_bpc;
 };
 
 static inline struct vc4_hdmi_connector_state *
-- 
2.33.1

