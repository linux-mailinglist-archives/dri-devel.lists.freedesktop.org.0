Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D57376799
	for <lists+dri-devel@lfdr.de>; Fri,  7 May 2021 17:06:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B04086EE5E;
	Fri,  7 May 2021 15:06:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C33526EE5E
 for <dri-devel@lists.freedesktop.org>; Fri,  7 May 2021 15:06:10 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id 6FCA513F4;
 Fri,  7 May 2021 11:06:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 07 May 2021 11:06:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=JyD5t6WMst8Bq
 zCSoV9Z3JsakQ2ZIXpXMQ4jgAIt2oQ=; b=YzIWYS/7nsIMbwYecrk5YfEX+hIxk
 kk2AJomAFymwIqmEGkgto/a5dN0qu5s1sBEvqgoqJNIqgNWyhA3SuE9OTKrz0cyw
 rOk2tgfe3LKurHsAdomo+Dvql1+JfhzLQ3dY8tO+mcfLdv5mF47ZWMEB/oaKfKwt
 JSeicsLRO29PJ+6NjY6fSseC9ax0ouhDywj0nWk1h3Qx3xA6024KLfmk6wwnc+RL
 t4XImxCHv6OEot1Aq8gWikchZ+yplsfcGWwXATYC1El1kkzDtm65PZ3pzAHhjIgA
 RPInU6gpnVGqx9w12Oe27dOictsMMjqC+6P5JmAxOWiK8pTrnKSiIdC0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=JyD5t6WMst8BqzCSoV9Z3JsakQ2ZIXpXMQ4jgAIt2oQ=; b=gLNOBXp4
 6PELVWvfDslU4mLUkLiIuq9OhHnhMNScaoeLjq9SO3PFYoI6OZHtUk94n7iAz6VO
 +buw0uUK1EGkvY6eOsmnHTwPT78ncxkpeU6gAJbCOJuKy7NAhmJAeUujIuFZS+ts
 d1OqWy0TK4La5NbFHBtwIu2ZXmNOwAsXuJ7fKxWThWKhAcrEtWVfh5ifyIcXrLDl
 g539NQdvOz1KmGLHgEYO9MKoWgtRyDxwEmpIaCQS6Dz8M8O66aLkXGFEttqUQsSw
 04Dbphe1GsmJQ0cse5Ay7Ramo7n+vXKSNZH494lwbqNVg0444CZftYAOqf+U0VqU
 918nVIqNTcMifg==
X-ME-Sender: <xms:XleVYFh2SwAwQLZN78HtyV9aY4dHAPIUVja5701B8O0f4JSu9cLwpg>
 <xme:XleVYKCPip1se6ms21yO1JIIrqk03eOtFBE4pF_9R9SgYHGXhNmBase5GeSsegi2W
 PrdEXNSajGzCzaHKNU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdegvddgkeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepgeenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:XleVYFE_6a-cuvbdusynkSUCbq0aG8X7-BU8noR3Uwd8gZCdit_LwQ>
 <xmx:XleVYKQnwlZ9sevLVQ40NydmzgyDvFOtuFD39pb6O-uOlu6X3SYwwg>
 <xmx:XleVYCz9u1-Hfia3BS9wvhmPJEYjn-C5aUYcVG2afYzeohRr9siQGA>
 <xmx:YVeVYNoygNZ8h1KcsmNsq7e0IYHCNJZuXU5pFATYZj6GxGFAX_HYwX5JetY>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Fri,  7 May 2021 11:06:06 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>
Subject: [PATCH v4 09/12] drm/vc4: hdmi: Check and warn if we can't reach
 4kp60 frequencies
Date: Fri,  7 May 2021 17:05:12 +0200
Message-Id: <20210507150515.257424-10-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210507150515.257424-1-maxime@cerno.tech>
References: <20210507150515.257424-1-maxime@cerno.tech>
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
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to reach the frequencies needed to output at 594MHz, the
firmware needs to be configured with the appropriate parameters in the
config.txt file (enable_hdmi_4kp60 and force_turbo).

Let's detect it at bind time, warn the user if we can't, and filter out
the relevant modes.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 31 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/vc4/vc4_hdmi.h |  8 ++++++++
 2 files changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index c50dc5a59b2f..01d24ce8a795 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -94,6 +94,11 @@
 
 #define HDMI_14_MAX_TMDS_CLK   (340 * 1000 * 1000)
 
+static bool vc4_hdmi_mode_needs_scrambling(const struct drm_display_mode *mode)
+{
+	return (mode->clock * 1000) > HDMI_14_MAX_TMDS_CLK;
+}
+
 static int vc4_hdmi_debugfs_regs(struct seq_file *m, void *unused)
 {
 	struct drm_info_node *node = (struct drm_info_node *)m->private;
@@ -210,6 +215,18 @@ static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
 	ret = drm_add_edid_modes(connector, edid);
 	kfree(edid);
 
+	if (vc4_hdmi->disable_4kp60) {
+		struct drm_device *drm = connector->dev;
+		struct drm_display_mode *mode;
+
+		list_for_each_entry(mode, &connector->probed_modes, head) {
+			if (vc4_hdmi_mode_needs_scrambling(mode)) {
+				drm_warn_once(drm, "The core clock cannot reach frequencies high enough to support 4k @ 60Hz.");
+				drm_warn_once(drm, "Please change your config.txt file to add hdmi_enable_4kp60.");
+			}
+		}
+	}
+
 	return ret;
 }
 
@@ -959,6 +976,9 @@ static int vc4_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
 	if (pixel_rate > vc4_hdmi->variant->max_pixel_clock)
 		return -EINVAL;
 
+	if (vc4_hdmi->disable_4kp60 && (pixel_rate > HDMI_14_MAX_TMDS_CLK))
+		return -EINVAL;
+
 	vc4_state->pixel_rate = pixel_rate;
 
 	return 0;
@@ -978,6 +998,9 @@ vc4_hdmi_encoder_mode_valid(struct drm_encoder *encoder,
 	if ((mode->clock * 1000) > vc4_hdmi->variant->max_pixel_clock)
 		return MODE_CLOCK_HIGH;
 
+	if (vc4_hdmi->disable_4kp60 && vc4_hdmi_mode_needs_scrambling(mode))
+		return MODE_CLOCK_HIGH;
+
 	return MODE_OK;
 }
 
@@ -1993,6 +2016,14 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	vc4_hdmi->disable_wifi_frequencies =
 		of_property_read_bool(dev->of_node, "wifi-2.4ghz-coexistence");
 
+	if (variant->max_pixel_clock == 600000000) {
+		struct vc4_dev *vc4 = to_vc4_dev(drm);
+		long max_rate = clk_round_rate(vc4->hvs->core_clk, 550000000);
+
+		if (max_rate < 550000000)
+			vc4_hdmi->disable_4kp60 = true;
+	}
+
 	if (vc4_hdmi->variant->reset)
 		vc4_hdmi->variant->reset(vc4_hdmi);
 
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 3cebd1fd00fc..3cd021136402 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -154,6 +154,14 @@ struct vc4_hdmi {
 	 */
 	bool disable_wifi_frequencies;
 
+	/*
+	 * Even if HDMI0 on the RPi4 can output modes requiring a pixel
+	 * rate higher than 297MHz, it needs some adjustments in the
+	 * config.txt file to be able to do so and thus won't always be
+	 * available.
+	 */
+	bool disable_4kp60;
+
 	struct cec_adapter *cec_adap;
 	struct cec_msg cec_rx_msg;
 	bool cec_tx_ok;
-- 
2.31.1

