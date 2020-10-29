Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2743229FFC0
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 09:24:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDDE66E99C;
	Fri, 30 Oct 2020 08:23:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 238916E8D1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 12:25:29 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 483C658069D;
 Thu, 29 Oct 2020 08:25:27 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 29 Oct 2020 08:25:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=sj0ZK7YlwpJ37
 nKxGGRrrVoyymkfNaSOlwxUZNAQL4U=; b=aSLczaU6x3rnfe1dZn2r+iI+k0JWr
 XfrLXQjpQZFtB8PjzU7z4HL5+byXB++Hodu8auiGn+PZVskqRWvK4hXHJJwLud8z
 s41UWtvugfzn6abtvJra2jM/HopNgj22OkjL4YEswvRTbTYLqBv0DUeyhd9vUETd
 Cz/8MF/8T4QoQvw15IP48hDIbcQ5j/lhsOnzzitqiKwZ4WpSI8XcsUe1W/6EYKp0
 kFzqbwu/m5XXrzUPpO85OTIU9msEttadLHsLx3rkuLYU9PmfXz+IsqhEkFFitXg5
 yBOrZDaw0EKBfm5ho0pvNQJOKOys9fCDleF3J+EA3nIKkGbFFww68EYEw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=sj0ZK7YlwpJ37nKxGGRrrVoyymkfNaSOlwxUZNAQL4U=; b=HE3vHdS9
 jC258RXt9REaWO40GvI/Z3sAudIzzi+7uQy0Y1Uy/U5uqH98Rbj77nYdLLTP4lIo
 LJYbSROpYbsZnO4rXREMxABi20VwYEk4YzJCaudO6RdLgAJxdYOvCUxocGNzC8FT
 Aw0JugK9ECym5H5gYvXwX/GxYHEyjCf47iqWRAYq64B60TnwlCmkJn0WIrgnSDcp
 Xf7kFmgUCZRfkHlAK9c7Q87I99+ZzKepDdjEsCIMqIVa5noWTbdI6Z/xcr4IMc0D
 cMzLSJPsKJkHQOuq39zLPKSA5nksxY4n4rIWL85gixkXzVT7H6spI5e8RN8GqlMv
 CyBuEqlVgiwv7g==
X-ME-Sender: <xms:t7SaXyd9n3tBlZ6lS-AyP25Wj-YII3EcwLqmJrMfShxWN2WzlAcgfg>
 <xme:t7SaX8NvQ2c6fWmYXv_d6xG0_01tgiNkEYRIKaaq2okA5FEJjyNCv5ON8i9gXfEHy
 10P-fjUy8c3ezJYXYI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrleefgdegtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:t7SaXzggRKfnYYltP2Wa-sdcBxU9Znv4gGp_NxQt1sCedJ3jM7fAPg>
 <xmx:t7SaX_9zd_U8WOQYDyqB_sp3pmb6z7XJX4ykd2OOA9cXSZKaC8lNUA>
 <xmx:t7SaX-tBayPpJffkX8DE8W_U6fpwOfLhK0U46ppXWwvPHMKLQqpF-Q>
 <xmx:t7SaX-F-e72g15F5yTnr5ejB3yT-3Z0xkET34SSI8iQtm-xuqlzPuQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id C0FAC3064682;
 Thu, 29 Oct 2020 08:25:26 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v2 2/2] drm/vc4: hdmi: Block odd horizontal timings
Date: Thu, 29 Oct 2020 13:25:22 +0100
Message-Id: <20201029122522.1917579-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201029122522.1917579-1-maxime@cerno.tech>
References: <20201029122522.1917579-1-maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 30 Oct 2020 08:23:17 +0000
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
Cc: devicetree@vger.kernel.org, Tim Gover <tim.gover@raspberrypi.com>,
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

Changes from v1:
  - s/broken/unsupported/
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 12 ++++++++++++
 drivers/gpu/drm/vc4/vc4_hdmi.h |  3 +++
 2 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 3d0338822cd2..506c12454086 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -768,6 +768,11 @@ static int vc4_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 	unsigned long long pixel_rate = mode->clock * 1000;
 
+	if (vc4_hdmi->variant->unsupported_odd_h_timings &&
+	    ((mode->hdisplay % 2) || (mode->hsync_start % 2) ||
+	     (mode->hsync_end % 2) || (mode->htotal % 2)))
+		return -EINVAL;
+
 	if (pixel_rate > vc4_hdmi->variant->max_pixel_clock)
 		return -EINVAL;
 
@@ -780,6 +785,11 @@ vc4_hdmi_encoder_mode_valid(struct drm_encoder *encoder,
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 
+	if (vc4_hdmi->variant->unsupported_odd_h_timings &&
+	    ((mode->hdisplay % 2) || (mode->hsync_start % 2) ||
+	     (mode->hsync_end % 2) || (mode->htotal % 2)))
+		return MODE_H_ILLEGAL;
+
 	if ((mode->clock * 1000) > vc4_hdmi->variant->max_pixel_clock)
 		return MODE_CLOCK_HIGH;
 
@@ -1830,6 +1840,7 @@ static const struct vc4_hdmi_variant bcm2711_hdmi0_variant = {
 		PHY_LANE_2,
 		PHY_LANE_CK,
 	},
+	.unsupported_odd_h_timings	= true,
 
 	.init_resources		= vc5_hdmi_init_resources,
 	.csc_setup		= vc5_hdmi_csc_setup,
@@ -1855,6 +1866,7 @@ static const struct vc4_hdmi_variant bcm2711_hdmi1_variant = {
 		PHY_LANE_CK,
 		PHY_LANE_2,
 	},
+	.unsupported_odd_h_timings	= true,
 
 	.init_resources		= vc5_hdmi_init_resources,
 	.csc_setup		= vc5_hdmi_csc_setup,
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 63c6f8bddf1d..6815e93b1a48 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -62,6 +62,9 @@ struct vc4_hdmi_variant {
 	 */
 	enum vc4_hdmi_phy_channel phy_lane_mapping[4];
 
+	/* The BCM2711 cannot deal with odd horizontal pixel timings */
+	bool unsupported_odd_h_timings;
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
