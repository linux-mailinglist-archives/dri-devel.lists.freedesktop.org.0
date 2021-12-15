Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 940F547590E
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 13:44:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4578410ECC7;
	Wed, 15 Dec 2021 12:44:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A9CF10ECC7
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 12:44:52 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id EEF212B0024D;
 Wed, 15 Dec 2021 07:44:50 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 15 Dec 2021 07:44:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=iSZxoAss2QNPT
 zCWdPkvQ0so1lBcYb7UlKiFggnw9vU=; b=TNwnCmWDbGjMmSt1RtpKSE9sLnoLF
 yBaE7//Eq8MufwyAk9yVL2LF0z/kDS7vpWh75q6c6df3+WB9t6xAFi9d/xU3QX4k
 cBrfjM3aL8Nh6PyFGrAM66LoErXyEyz+TfDCrQxVX+pXwoz0RQ+xr5gTdxkqOyPN
 WFCWxilwPmarPymyK/eTL97CV/t5FJx2EowFAJ16ivCK7yF2I7eYRDcxgKH67ncm
 wpZz1qmL5qTV6GZ4uMM4g0u3wu4tWqokQ5me1AvaNbggL3b7RtH0+m+5qouMZPEJ
 W8qovokBov90/qG1ZKmmj2i6Ci2IMzJ9JcfBSTOobLw0/50XTKGyPBrBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=iSZxoAss2QNPTzCWdPkvQ0so1lBcYb7UlKiFggnw9vU=; b=WkUZtfYm
 qm3c3IJw/ULOxbCV+o7/6RgbRfpY7kHLyF/EGsRgotpBVYoSY6c+wfqf7hArC+zG
 5tJKbcXbMxJyDMzZaYFaBbXXHK3qLmtB4aScqNoHzORSb8BrspCearPsZ0nCJWum
 enqgtadRv0l86Q07IB6d3L5RfcsBAxxwT410c+XHlNVAHi58Nb5bXyT6ZRT9vjNu
 7xBJdRERdP9buTZYeyDlz1ADkC/JDgZtGAywYlACgUnf8mwQWkY9C1830hw1tooM
 5/ijkj5mJIZpYd3KemRdPtvQdPXqupoNX0wWHgov/bMpYc6wstb3WGZx9VYbObMC
 KYLKqles4IMriw==
X-ME-Sender: <xms:QuO5YbVQmf1pc-CoMo-kYzlc6RRBPKRWsuCZb6PxSPNJBD5BL10zlQ>
 <xme:QuO5YTkXnF1GWWCNaSJPVqbxbHJ2VZ1JVn52J0UJW-mg3p9buoFEqP49up51LrVDj
 83nZk93y9WW9QiFPuU>
X-ME-Received: <xmr:QuO5YXZxP-bo7EEe4tZ5uSVYbMEpFVKQtkSNIM1A3tqXuw8GBig5avq_E3BM6Owm9wIMOZzbboDnljje9ny8806mfr-yte0xXzYZ2sM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrledvgdeghecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:QuO5YWW_njpTaWuQMuAJ_0akVoEtYhg4FBkXoFgz2YKVAKROLXy2Pg>
 <xmx:QuO5YVkA7Nil4CzPe0LaJQHCwNp7OawGuR98vH3dSLO7ub6rxCgEpw>
 <xmx:QuO5YTe4vmWJxGYpaMANFREOW5plfsGjesNVTOq9_NHzPyaVMJHwBA>
 <xmx:QuO5YedapwQvh6_cwngWiy7-G78-VZiyYHoq5bjZRJKndXCB_C_tDHL0A1Y>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Dec 2021 07:44:49 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 10/14] drm/vc4: hdmi: Move clock calculation into its own
 function
Date: Wed, 15 Dec 2021 13:44:02 +0100
Message-Id: <20211215124406.340180-11-maxime@cerno.tech>
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

The code to compute our clock rate for a given setup will be called in
multiple places in the next patches, so let's create a separate function
for it.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 49 +++++++++++++++++++++++-----------
 1 file changed, 34 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 8b6204df66bb..02a5d5a8847e 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1275,6 +1275,35 @@ vc4_hdmi_encoder_clock_valid(const struct vc4_hdmi *vc4_hdmi,
 	return MODE_OK;
 }
 
+static unsigned long long
+vc4_hdmi_encoder_compute_mode_clock(const struct drm_display_mode *mode,
+				    unsigned int bpc)
+{
+	unsigned long long clock = mode->crtc_clock * 1000;
+
+	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
+		clock = clock * 2;
+
+	return clock * bpc / 8;
+}
+
+static int
+vc4_hdmi_encoder_compute_clock(const struct vc4_hdmi *vc4_hdmi,
+			       struct vc4_hdmi_connector_state *vc4_state,
+			       const struct drm_display_mode *mode,
+			       unsigned int bpc)
+{
+	unsigned long long clock;
+
+	clock = vc4_hdmi_encoder_compute_mode_clock(mode, bpc);
+	if (vc4_hdmi_encoder_clock_valid(vc4_hdmi, clock) != MODE_OK)
+		return -EINVAL;
+
+	vc4_state->pixel_rate = clock;
+
+	return 0;
+}
+
 #define WIFI_2_4GHz_CH1_MIN_FREQ	2400000000ULL
 #define WIFI_2_4GHz_CH1_MAX_FREQ	2422000000ULL
 
@@ -1287,6 +1316,7 @@ static int vc4_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 	unsigned long long pixel_rate = mode->clock * 1000;
 	unsigned long long tmds_rate;
+	int ret;
 
 	if (vc4_hdmi->variant->unsupported_odd_h_timings &&
 	    ((mode->hdisplay % 2) || (mode->hsync_start % 2) ||
@@ -1307,21 +1337,10 @@ static int vc4_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
 		pixel_rate = mode->clock * 1000;
 	}
 
-	if (conn_state->max_bpc == 12) {
-		pixel_rate = pixel_rate * 150;
-		do_div(pixel_rate, 100);
-	} else if (conn_state->max_bpc == 10) {
-		pixel_rate = pixel_rate * 125;
-		do_div(pixel_rate, 100);
-	}
-
-	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
-		pixel_rate = pixel_rate * 2;
-
-	if (vc4_hdmi_encoder_clock_valid(vc4_hdmi, pixel_rate) != MODE_OK)
-		return -EINVAL;
-
-	vc4_state->pixel_rate = pixel_rate;
+	ret = vc4_hdmi_encoder_compute_clock(vc4_hdmi, vc4_state, mode,
+					     conn_state->max_bpc);
+	if (ret)
+		return ret;
 
 	return 0;
 }
-- 
2.33.1

