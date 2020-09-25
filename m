Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0333027A84B
	for <lists+dri-devel@lfdr.de>; Mon, 28 Sep 2020 09:08:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 589476E423;
	Mon, 28 Sep 2020 07:07:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 656106E203
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Sep 2020 13:00:53 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 7743E7DB;
 Fri, 25 Sep 2020 09:00:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 25 Sep 2020 09:00:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=O7zys1SiDDN/VUVcFcM3e3Lvwo
 5yIKrUOPZV/VBJ9sQ=; b=EqHUBXV9mVa7Ayo/q61gjB97OYCizv79oQ+HL2A1sS
 pNq3lUJH7JpjWW341BjuGrzMXgxI4NcD762o9D4cOh8XFmHa1i7ttGq0qzTuMC5u
 +HgBnPlVrKnqjlMvFn4o1yEA6MJB2xYqWdblksq267h23urtS21Mq3uD7cF7YgRa
 AeMqDEhF/ffPDT4fn5IjTCmWv0ohL/O/8Hh+3Xh91w+0cVkg1tle8MnLePgf8j3/
 yE/J/vfxX6F3lNrdDc1DrLZPJRFo0C9foy/GlX34IxAem7qb7K7ETXKWzARKk1zr
 U/u7GKVeTC7XQLpqLAckH8DnbVR2lUQwCxbE8s46c2Xw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=O7zys1SiDDN/VUVcF
 cM3e3Lvwo5yIKrUOPZV/VBJ9sQ=; b=Kq5UJ7SL6vzbC9HP/QElMq1RwO2m+NKWj
 EdniTBCxgVjDz0ZS721PmG58RpGtu9+SAnQy2mZdH0Ey8EFm3TRFZjxJ8+6U9hlm
 jvMcyTKM0r/L0e9GxOGqYCdWLT4M6Fvi5BELxzkusshyRkzwn6fMaZA8F6lgGXE5
 uNE8kGKl7YML+6OG6jD2A6vUH9bGiUJf4929qIzK7vFk9BsvotWnBu9KxkSk+AKM
 0aOqY4RDFEp+on78xYZrvAol7Ljik1bH1xa84GEFP+N6np56zfFMczqcNiiw5C4k
 cALhTU6URH+Jyw81taa2O96pKHkKmonxuprO9j+/yWHOcBWP6WUeA==
X-ME-Sender: <xms:AOptX1Qt8JM4Cw5twJsmDMBk8QizX_fMZjX8zg8jxpBs9sXGl7epwg>
 <xme:AOptX-zgYq9Na3sT5LghBJeKjtgqNLKYcvT836KphvRwZQx9ihBXNNNCYjlXnMIya
 fxuFim5qvH39j7bmac>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvddtgdehjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucft
 ihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrh
 hnpeejffehuddvvddvlefhgeelleffgfeijedvhefgieejtdeiueetjeetfeeukeejgeen
 ucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
 grmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:AOptX60kHny_JDfmKX9Y5p84NCPsjViZ9RE2Q0V0qHAJ_aJJHL3NOg>
 <xmx:AOptX9B3KAjgn4qs98IZicDzNsYy6aDsbwPSSYIhzuqKbIcVIPHypw>
 <xmx:AOptX-in4-QOMdShNOpEckJ3UwFINqb3163HD2t5CROlNWq8gRLltg>
 <xmx:AeptXzYEpIq9VcHyaO3aVdWyJ4XbHmzYgkU86GVhqiingrBvSAzvQYqYi8U>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id CE173328005D;
 Fri, 25 Sep 2020 09:00:47 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH] drm/vc4: hdmi: Block odd horizontal timings
Date: Fri, 25 Sep 2020 15:00:44 +0200
Message-Id: <20200925130044.574220-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 28 Sep 2020 07:06:24 +0000
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
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The FIFO between the pixelvalve and the HDMI controller runs at 2 pixels
per clock cycle, and cannot deal with odd timings.

Let's reject any mode with such timings.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 12 ++++++++++++
 drivers/gpu/drm/vc4/vc4_hdmi.h |  3 +++
 2 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 1c4dc774d56e..acfb4e235214 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -879,6 +879,11 @@ static int vc4_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 	unsigned long long pixel_rate = mode->clock * 1000;
 
+	if (vc4_hdmi->variant->broken_odd_h_timings &&
+	    ((mode->hdisplay % 2) || (mode->hsync_start % 2) ||
+	     (mode->hsync_end % 2) || (mode->htotal % 2)))
+		return -EINVAL;
+
 	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
 		pixel_rate *= 2;
 
@@ -901,6 +906,11 @@ vc4_hdmi_encoder_mode_valid(struct drm_encoder *encoder,
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 
+	if (vc4_hdmi->variant->broken_odd_h_timings &&
+	    ((mode->hdisplay % 2) || (mode->hsync_start % 2) ||
+	     (mode->hsync_end % 2) || (mode->htotal % 2)))
+		return MODE_H_ILLEGAL;
+
 	if ((mode->clock * 1000) > vc4_hdmi->variant->max_pixel_clock)
 		return MODE_CLOCK_HIGH;
 
@@ -1950,6 +1960,7 @@ static const struct vc4_hdmi_variant bcm2711_hdmi0_variant = {
 		PHY_LANE_2,
 		PHY_LANE_CK,
 	},
+	.broken_odd_h_timings	= true,
 
 	.init_resources		= vc5_hdmi_init_resources,
 	.csc_setup		= vc5_hdmi_csc_setup,
@@ -1975,6 +1986,7 @@ static const struct vc4_hdmi_variant bcm2711_hdmi1_variant = {
 		PHY_LANE_CK,
 		PHY_LANE_2,
 	},
+	.broken_odd_h_timings	= true,
 
 	.init_resources		= vc5_hdmi_init_resources,
 	.csc_setup		= vc5_hdmi_csc_setup,
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index af45b0d81dec..40e51ece8efe 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -62,6 +62,9 @@ struct vc4_hdmi_variant {
 	 */
 	enum vc4_hdmi_phy_channel phy_lane_mapping[4];
 
+	/* The BCM2711 cannot deal with odd horizontal pixel timings */
+	bool broken_odd_h_timings;
+
 	/* Callback to get the resources (memory region, interrupts,
 	 * clocks, etc) for that variant.
 	 */
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
