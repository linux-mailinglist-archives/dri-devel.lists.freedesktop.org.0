Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2FA475910
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 13:45:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 906DF10ECD0;
	Wed, 15 Dec 2021 12:45:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63A7D10ECD0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 12:45:00 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id BABE72B0024D;
 Wed, 15 Dec 2021 07:44:58 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Wed, 15 Dec 2021 07:45:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=/khx1lKzvXjZn
 6CWQzHxq/wtuRilS+Pxi/kNv9bxcZQ=; b=IuPXBLrnx7g6etU36bcmGhJFKdwfA
 eqx0NK0iWWEbC4WQhxKrdsBfc8iUdcQ65WpOKuFBn7Gp+FwidsxNbQZsXXZyc0j0
 T3YzgniCtjMLXVD+BnRgvXMS9hChkn4uUbFVP+QJyBFtCB92uyr1qTzVdmS9xWFQ
 OjjcVYvX/4lPIUNfVFSW6BeeLnXMC+awjTEmCci5KSZ/NTbKCk/xgkAjrTvzkaw+
 ovmNrCYUHDYloNlrm9pKx/lBOk0e5/crGaQtgg+oqpeHrU+oR+fVyNpQwdVppGdR
 DM1FkLndEPwslO+CRCBBw8wF3OT9cAizCQ8yHeXbNE2cARXR+vcGkODbw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=/khx1lKzvXjZn6CWQzHxq/wtuRilS+Pxi/kNv9bxcZQ=; b=IPhMwbq0
 jGWzncw6KK1tRJ1IJ/7upe7lm4sTKwmsas3j6IROfH8UjEu+DlqNFGj/FaVB88SD
 yN8VE2jiVfAv3FxeaVfPUJnJpqXsH+KcXbQZQcFWRRBfhwyK8uhA91M4N8+46Bte
 3YqIDMUlyFRABdtYX9XxjxuDVPnGIV6AMrd2+AUjOF4QR0LwpfJDAp7Mn+N2fmAN
 D9VaQvqKdIpfdAbUmJJ+Fak21YSbZuBUfIsiE6okfCz4rIIrEgdl+Rnp21DJ7D50
 p6OvJXAccDbF79oApWVc5T/FhjwAH4AUbPdB9WmfF+V/FjWMSRSn1ncsO3hQftgZ
 cdIDNY2AmnH81g==
X-ME-Sender: <xms:SuO5YSIg6NMC_MhIdF36gBrTNZR5wjE08OxHKs87LKrTQFoOa1R_VA>
 <xme:SuO5YaJWAiopkCx2rvRLhGut5Ddgj-3PZTPeSrlv43aRYgIA1CCp0C6VVEXoISBLD
 EDbXv5ZnXOf_9pSw5g>
X-ME-Received: <xmr:SuO5YSvHjE09Mf7dh6K4vaUkfavJ4STrE0TVGBPT0FJwdPqpnoVXG3h3wkJhH71huhPQ6YC-Cxwss_rukbiTVzwtdP7WXmcKN175BMU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrledvgdeghecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:SuO5YXbbaKrf656effcKxSnjUxEt-ex8tv_jNv8KM96rPpWJYKuZsQ>
 <xmx:SuO5YZY53aRnMDSwZ5JMbqsCudfsVJQdNHrPfQ6bboQHKmYDAmdGOA>
 <xmx:SuO5YTDlHJ9bozpbshFwnA6x6Sd7rlba4SNNi5b5ne0H8GarJR49hg>
 <xmx:SuO5YWRd_X55tQpoHlYl-TMsCDvL8Sbym35reXBjeoqfw0zZxwreQtYrHRI>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Dec 2021 07:44:57 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 12/14] drm/vc4: hdmi: Take bpp into account for the
 scrambler
Date: Wed, 15 Dec 2021 13:44:04 +0100
Message-Id: <20211215124406.340180-13-maxime@cerno.tech>
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

The current code only base its decision for whether the scrambler must be
enabled or not on the pixel clock of the mode, but doesn't take the bits
per color into account.

Let's leverage the new function to compute the clock rate in the
scrambler setup code.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 17 +++++++++++++----
 drivers/gpu/drm/vc4/vc4_hdmi.h |  5 +++++
 2 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index effc2d42e320..be640b8be58c 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -99,9 +99,17 @@
 
 #define HDMI_14_MAX_TMDS_CLK   (340 * 1000 * 1000)
 
-static bool vc4_hdmi_mode_needs_scrambling(const struct drm_display_mode *mode)
+
+static unsigned long long
+vc4_hdmi_encoder_compute_mode_clock(const struct drm_display_mode *mode,
+				    unsigned int bpc);
+
+static bool vc4_hdmi_mode_needs_scrambling(const struct drm_display_mode *mode,
+					   unsigned int bpc)
 {
-	return (mode->clock * 1000) > HDMI_14_MAX_TMDS_CLK;
+	unsigned long long clock = vc4_hdmi_encoder_compute_mode_clock(mode, bpc);
+
+	return clock > HDMI_14_MAX_TMDS_CLK;
 }
 
 static bool vc4_hdmi_is_full_range_rgb(struct vc4_hdmi *vc4_hdmi,
@@ -272,7 +280,7 @@ static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
 		struct drm_display_mode *mode;
 
 		list_for_each_entry(mode, &connector->probed_modes, head) {
-			if (vc4_hdmi_mode_needs_scrambling(mode)) {
+			if (vc4_hdmi_mode_needs_scrambling(mode, 8)) {
 				drm_warn_once(drm, "The core clock cannot reach frequencies high enough to support 4k @ 60Hz.");
 				drm_warn_once(drm, "Please change your config.txt file to add hdmi_enable_4kp60.");
 			}
@@ -613,7 +621,7 @@ static void vc4_hdmi_enable_scrambling(struct drm_encoder *encoder)
 	if (!vc4_hdmi_supports_scrambling(encoder, mode))
 		return;
 
-	if (!vc4_hdmi_mode_needs_scrambling(mode))
+	if (!vc4_hdmi_mode_needs_scrambling(mode, vc4_hdmi->output_bpc))
 		return;
 
 	drm_scdc_set_high_tmds_clock_ratio(vc4_hdmi->ddc, true);
@@ -1256,6 +1264,7 @@ static void vc4_hdmi_encoder_atomic_mode_set(struct drm_encoder *encoder,
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 
 	mutex_lock(&vc4_hdmi->mutex);
+	vc4_hdmi->output_bpc = conn_state->max_bpc;
 	memcpy(&vc4_hdmi->saved_adjusted_mode,
 	       &crtc_state->adjusted_mode,
 	       sizeof(vc4_hdmi->saved_adjusted_mode));
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 2b6aaafc020a..31b7d27deb8e 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -216,6 +216,11 @@ struct vc4_hdmi {
 	 * the scrambler on? Protected by @mutex.
 	 */
 	bool scdc_enabled;
+
+	/**
+	 * @output_bpc: BPC currently being used. Protected by @mutex.
+	 */
+	unsigned int output_bpc;
 };
 
 static inline struct vc4_hdmi *
-- 
2.33.1

