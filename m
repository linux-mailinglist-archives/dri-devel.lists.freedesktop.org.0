Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE2E35E1FD
	for <lists+dri-devel@lfdr.de>; Tue, 13 Apr 2021 16:55:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5AC76E5D1;
	Tue, 13 Apr 2021 14:54:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DEB86E5D5
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 14:54:57 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.west.internal (Postfix) with ESMTP id 1AEE3168E;
 Tue, 13 Apr 2021 10:54:56 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 13 Apr 2021 10:54:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=Sg7X/Nkl74Kaz
 rRy04DB7F1z+gxQFmfZlpg8dVc5VEw=; b=LoLapJIk541wUeAZVPkEz7ZQCvfxt
 wt5SziDaHDBYWc7/JK0UZurMjedTs/RCOFpl2mUDuINeBkLwj6bEnBLPrlIK/qXz
 ZvsfCD6vKtC+khFSoMM3a9oH75153JGNxK5t71xPjR3LJYXNTrx0EOonru+BUa33
 zI2AKBPNhiFoH497vuEloY4SkxV98qha2DrBAvOub118IE0e+oqu0DJU6F9q87ma
 dwXXqrQvenO3ztnYrGPItQ+V3pl8D7jazYpqpczmcFdM13RSyB4ORE8htbRfPQfu
 tdorsDQfIRYOzYaYef1wbhGCwIeciLCsY3QwxSgs8lduQm5g7YWV64hkg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=Sg7X/Nkl74KazrRy04DB7F1z+gxQFmfZlpg8dVc5VEw=; b=t5kVIkCD
 MgVCNnbGldE01+gnlfOR4eNLqceMkqUBEohJVliwPiDHBjE04SuAdKE2WMIkltag
 EsYXyNrJc8jSI2Bu/Z4rkQ1msKCZ9FaPYQiDM48UN3TmWtqHgbqVnmFuN5e4Xebm
 3m0HBcsQ32NJxraAIdmeScgpHZC+oKOuTPc7wdRsTEoiU1kl1pHl01b6i8q8+ANv
 sZ9R98CtqfCSQeZuGJ0oKuKM5RmrPWV2/7Sa6KZZkDAIDiJqtuIt8wB5RGPM52m1
 2veA7bUjXWUyxNL+kt/qYOp+9Obu0e7iXNfoIigW4xhDMRGpk58TfEND+vPC2PFO
 /11cnAGEF5zfpg==
X-ME-Sender: <xms:v7B1YHFDDK-QOpqq5uSoXb4qYPfBoK65jKoMCinOhsXyu64EOGbZtQ>
 <xme:v7B1YNHYJFRrXnYbdiGZFS4mYumX8qMUNCXJfvfS_AXeZKaVs1-DG7nVqmfLkydlY
 mU-ymrqNITxOcE2TNk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudekledgkedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:v7B1YH02x1cM4RkmZsKsoj_CN08ayTiOhdqidSxQHl1AVCUo3GL0PA>
 <xmx:v7B1YHcYHV6DocpuDf7x6iVdxUzNzIdLxi4GRL1S7ha0uwQzsqe0JQ>
 <xmx:v7B1YBIUyZHPnDVO9RKNVGlSx2oFkBcZ7y687PoKV3XN9SUXar7owA>
 <xmx:v7B1YCy7DRRhBXtk5ElA01MXAuRuBhjqgATALvkipRjeJnkeP668zplmtIE>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 789A6240068;
 Tue, 13 Apr 2021 10:54:55 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v3 7/9] drm/vc4: hdmi: Check and warn if we can't reach 4kp60
 frequencies
Date: Tue, 13 Apr 2021 16:54:39 +0200
Message-Id: <20210413145441.483977-8-maxime@cerno.tech>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210413145441.483977-1-maxime@cerno.tech>
References: <20210413145441.483977-1-maxime@cerno.tech>
MIME-Version: 1.0
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
 David Airlie <airlied@linux.ie>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Daniel Vetter <daniel.vetter@intel.com>,
 Phil Elwell <phil@raspberrypi.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
