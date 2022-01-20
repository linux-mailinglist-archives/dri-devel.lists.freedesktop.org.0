Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8FF49513B
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 16:17:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BA3C10E47A;
	Thu, 20 Jan 2022 15:17:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D3A510E47D
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 15:17:14 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id D3E922B00155;
 Thu, 20 Jan 2022 10:17:12 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 20 Jan 2022 10:17:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; bh=B7qDpJfcTH19Ch5zaxHa4EsPUdIKPF
 /ULGmH4rUeL3I=; b=dg+fGsl0xRsXft1VAgYbL3mtDAzoRNO+NTVwIfTQImj7ML
 Da9uWnNnwRzU1Ne7mBf2zyd3QTiZlYPvdhOnmIDOaRNVgHLTVujrw/cBnKiJi/9I
 7S7Rl+Ae8xbeXrDR6uhM9Yrd1cikbmeUfqU2nC4zgfmVPKijbn+WCd8ccKFRPDeg
 63JO0FaTDEAghjbA54u6w73FbS4jgIZMJqeuaXQbZs3csDxuZKvkyL86zKbceWwi
 Q/TUgcTwWL9Phz2CFnhej4T2VY+p5gF9QQdnmi+ewZSFGFgsj1qXlDDYZZ2YTUgP
 hYPWT0R9GHuv7uHDF7cgO2luA5+qQP/qTiuvPAFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=B7qDpJ
 fcTH19Ch5zaxHa4EsPUdIKPF/ULGmH4rUeL3I=; b=dDPUEN3TRPxSAbd9xAlHWi
 2DZ3uxd6sb+h4HtmRTI32IvKlvl2s1XjIqufJuEfTqCiHNT6BztpRUWypZmLJpOj
 qWOBuEapUQ7EkTzG3D3iQ6kvqHnTjgxaMqmjafx88EwKjF9ujVlGu9x9b0g4TktR
 +/RSQxCF/cnV8CYBXm4kidMF6/SLHO74nx2zjV2xmYMquMjyAmLaqU7Rs8+vpmZ2
 /CPNZeztJCZG08Fb+jKU4RCGsBRlhRUUIyXatzcTrWewfslCF41C+DknjnojK7IV
 sMxeA+nPZq65VvXhz0W7jXMPlIQT5xd+jS1B7UfitybxpOZS9fxoWOVZD72NE0kw
 ==
X-ME-Sender: <xms:-HzpYSptm_iW6Vzq4vtWY-yZ5rE6OByFcCOP6UoZ3X5mlk7i5-6Xew>
 <xme:-HzpYQpT79S5S_oXGo796xBvtHGQu5lYgWn4joc1yXX8q8q-XYa-xXc5zznEfH6zp
 Zinysop8bpvwRlFuIE>
X-ME-Received: <xmr:-HzpYXOvGd_zmtsHadwrj9zxFn3-FVaepFgNAHFsqRmgckCz61GNpMcFCBu5vqrYV_mmvpVzKS3DYpTOA95Pci7wnoOOYVNJgOe6pXM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudekgdejvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:-HzpYR5yeM6TMLl86TD0rGkjfzWQFbEnaMQRMGiiyIloarSAkkPikg>
 <xmx:-HzpYR5Pu5NZgF56EKVmWk_HTor4howY70uYoOXVjwkgCev7MEY6qg>
 <xmx:-HzpYRhAZKTzpDHDJZ7YXAkajrO8RnyeDVFfluJ47OwgStnzNCaucA>
 <xmx:-HzpYezkK6PDAN4XEU5Rmr8RPh-ZraSfG-KTeAokXfzWgl2O_f0AfgrC86Y>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Jan 2022 10:17:11 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v4 11/16] drm/vc4: hdmi: Move clock validation to its own
 function
Date: Thu, 20 Jan 2022 16:16:20 +0100
Message-Id: <20220120151625.594595-12-maxime@cerno.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220120151625.594595-1-maxime@cerno.tech>
References: <20220120151625.594595-1-maxime@cerno.tech>
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

Our code is doing the same clock rate validation in multiple instances.
Let's create a helper to share the rate validation.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index d79a70bae7f2..1b75e8cfd5d5 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1262,6 +1262,19 @@ static void vc4_hdmi_encoder_atomic_mode_set(struct drm_encoder *encoder,
 	mutex_unlock(&vc4_hdmi->mutex);
 }
 
+static enum drm_mode_status
+vc4_hdmi_encoder_clock_valid(const struct vc4_hdmi *vc4_hdmi,
+			     unsigned long long clock)
+{
+	if (clock > vc4_hdmi->variant->max_pixel_clock)
+		return MODE_CLOCK_HIGH;
+
+	if (vc4_hdmi->disable_4kp60 && clock > HDMI_14_MAX_TMDS_CLK)
+		return MODE_CLOCK_HIGH;
+
+	return MODE_OK;
+}
+
 #define WIFI_2_4GHz_CH1_MIN_FREQ	2400000000ULL
 #define WIFI_2_4GHz_CH1_MAX_FREQ	2422000000ULL
 
@@ -1305,10 +1318,7 @@ static int vc4_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
 	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
 		pixel_rate = pixel_rate * 2;
 
-	if (pixel_rate > vc4_hdmi->variant->max_pixel_clock)
-		return -EINVAL;
-
-	if (vc4_hdmi->disable_4kp60 && (pixel_rate > HDMI_14_MAX_TMDS_CLK))
+	if (vc4_hdmi_encoder_clock_valid(vc4_hdmi, pixel_rate) != MODE_OK)
 		return -EINVAL;
 
 	vc4_state->pixel_rate = pixel_rate;
@@ -1327,13 +1337,7 @@ vc4_hdmi_encoder_mode_valid(struct drm_encoder *encoder,
 	     (mode->hsync_end % 2) || (mode->htotal % 2)))
 		return MODE_H_ILLEGAL;
 
-	if ((mode->clock * 1000) > vc4_hdmi->variant->max_pixel_clock)
-		return MODE_CLOCK_HIGH;
-
-	if (vc4_hdmi->disable_4kp60 && vc4_hdmi_mode_needs_scrambling(mode))
-		return MODE_CLOCK_HIGH;
-
-	return MODE_OK;
+	return vc4_hdmi_encoder_clock_valid(vc4_hdmi, mode->clock * 1000);
 }
 
 static const struct drm_encoder_helper_funcs vc4_hdmi_encoder_helper_funcs = {
-- 
2.34.1

