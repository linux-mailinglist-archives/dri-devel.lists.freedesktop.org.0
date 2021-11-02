Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5DA443126
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 16:00:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E44472E91;
	Tue,  2 Nov 2021 15:00:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9CF372E8D
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Nov 2021 15:00:17 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 294F2580741;
 Tue,  2 Nov 2021 11:00:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 02 Nov 2021 11:00:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=x7GIVaqY6OZ9b
 XwTw3ASuS7xm781pvCrNvcLS0nkQBU=; b=mVJEByfHum4Aq3J/Mlqu0m1eYWBSR
 dRtMarCmUTnNVKJzMR8a4u85ee3xVwHzif51GoIhWRZ80aDXf1FCJEQy4foQyqhZ
 F/rC7ssFnJylDXqu9d+O4CLVhhzm6iYlSsZCnmIQH8VZGUs/cOdSUupzfgU4+kZP
 cgPh4NaE8MU/Wt92WcQutT49+aMNOWO8K3PUGh4ZjM/jlouc9lELAmtZKB/JyFGw
 Q2SweO32Z1/QDEBHMsBgeWUlPcLh1QME9VFMAEZ1kX5xCASuJ5suywoD93S+06JZ
 9GljEDpGkZVas030IfATd3sx1yV0m/YmzJZtSDSbjGfmRPihlawU7HwdQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=x7GIVaqY6OZ9bXwTw3ASuS7xm781pvCrNvcLS0nkQBU=; b=RCCjKCoI
 +28LvfgWFhdA/9B1lw4ZmVz1DZY9tJRvhcQyT53PFcnFarOblXqIUAPsS0jTd+Ip
 s5ZTTuMIdbjGuzxQFoxuCIzIUoqogEkJKHD/LFb9UYq04/md4PGTBqe/22rzNLEm
 OVnLp3cyJ23x6IBnNoLAHlOTjcuUnRXrDuL6gbGCpYvJaVSlgnkWNbbsm63BJnBV
 lOuXNYDElkCV0QG0L6a5uesigZKqcqFW0B8jjQdqPNl0CQQGt+suw21/y60KujbG
 1cpKtwyIQsplV82qqYAi4jnRxnHZswfyzJPlBfimy9Y7mpS3PtsZFI9P1LuATcUL
 YTXYQfzqfazCOQ==
X-ME-Sender: <xms:gVKBYaoz85r0_dz78n1OdhSec5bwN0j41-SFVY5cGhrIBh4cbP8uVQ>
 <xme:gVKBYYrXpc6kTw_iY7iEJAd7Yb8pSrA637MKAEAEBpTyNasmIdvFq4M-hV_56S70J
 GvDeOhIx5xTIpjs5lo>
X-ME-Received: <xmr:gVKBYfMZ21L66IHERk3s_yMmc1HlzI0EYuUuj7MyKt_2SEtQfm17U-B97RFc_pt_Fs8rmRmzfvc-FQ0HNoZ91ahYs9TYlANAcLquyOlq>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrtddtgdeghecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:gVKBYZ7KgQuqcdtptZht0BQHqv7FS6BHDAF56FVugOCwrTY5BTw8wg>
 <xmx:gVKBYZ79OIxRNR9wN9L4dzpEiCeBwP8ccAFwES76zSrLEhvx79p98A>
 <xmx:gVKBYZiMrjpxpOgs3UZZIgTBg3Ne042iDNrOGvKmdXtKjAMQpGA-SQ>
 <xmx:gVKBYeHONhy86H4X5VlwHY0FozonyJ6BgswfxnJn_ArKqLS0tsrhZA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 2 Nov 2021 11:00:16 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 12/13] drm/vc4: hdmi: Leverage new SCDC atomic_check
Date: Tue,  2 Nov 2021 15:59:43 +0100
Message-Id: <20211102145944.259181-13-maxime@cerno.tech>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211102145944.259181-1-maxime@cerno.tech>
References: <20211102145944.259181-1-maxime@cerno.tech>
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
 dri-devel@lists.freedesktop.org, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that we have a generic helper to fill the scrambling status, let's
use it.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 32 ++++++++++----------------------
 drivers/gpu/drm/vc4/vc4_hdmi.h |  6 ++++++
 2 files changed, 16 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 82878718e5fc..aa6700622797 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -297,6 +297,14 @@ static int vc4_hdmi_connector_atomic_check(struct drm_connector *connector,
 	struct drm_connector_state *new_state =
 		drm_atomic_get_new_connector_state(state, connector);
 	struct drm_crtc *crtc = new_state->crtc;
+	int ret;
+
+	ret = drm_atomic_helper_connector_hdmi_check(connector, state);
+	if (ret)
+		return ret;
+
+	if (new_state->hdmi_needs_scrambling != new_state->hdmi_needs_high_tmds_ratio)
+		return -EINVAL;
 
 	if (!crtc)
 		return 0;
@@ -586,37 +594,16 @@ static void vc4_hdmi_set_infoframes(struct drm_encoder *encoder)
 	vc4_hdmi_set_hdr_infoframe(encoder);
 }
 
-static bool vc4_hdmi_supports_scrambling(struct drm_encoder *encoder)
-{
-	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
-	struct drm_display_info *display = &vc4_hdmi->connector.display_info;
-
-	lockdep_assert_held(&vc4_hdmi->mutex);
-
-	if (!display->is_hdmi)
-		return false;
-
-	if (!display->hdmi.scdc.supported ||
-	    !display->hdmi.scdc.scrambling.supported)
-		return false;
-
-	return true;
-}
-
 #define SCRAMBLING_POLLING_DELAY_MS	1000
 
 static void vc4_hdmi_enable_scrambling(struct drm_encoder *encoder)
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
-	const struct drm_display_mode *mode = &vc4_hdmi->saved_adjusted_mode;
 	unsigned long flags;
 
 	lockdep_assert_held(&vc4_hdmi->mutex);
 
-	if (!vc4_hdmi_supports_scrambling(encoder))
-		return;
-
-	if (!drm_mode_hdmi_requires_scrambling(mode))
+	if (!vc4_hdmi->scdc_needed)
 		return;
 
 	drm_scdc_set_high_tmds_clock_ratio(vc4_hdmi->ddc, true);
@@ -1228,6 +1215,7 @@ static void vc4_hdmi_encoder_atomic_mode_set(struct drm_encoder *encoder,
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 
 	mutex_lock(&vc4_hdmi->mutex);
+	vc4_hdmi->scdc_needed = conn_state->hdmi_needs_scrambling;
 	memcpy(&vc4_hdmi->saved_adjusted_mode,
 	       &crtc_state->adjusted_mode,
 	       sizeof(vc4_hdmi->saved_adjusted_mode));
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 460112d68948..1aabc51ede03 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -206,6 +206,12 @@ struct vc4_hdmi {
 	 * the scrambler on? Protected by @mutex.
 	 */
 	bool scdc_enabled;
+
+	/**
+	 * @scdc_needed: Is the HDMI controller needs to have the
+	 * scrambling on? Protected by @mutex.
+	 */
+	bool scdc_needed;
 };
 
 static inline struct vc4_hdmi *
-- 
2.32.0

