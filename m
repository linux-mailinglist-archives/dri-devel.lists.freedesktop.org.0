Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A0534020F
	for <lists+dri-devel@lfdr.de>; Thu, 18 Mar 2021 10:29:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 933746E8B4;
	Thu, 18 Mar 2021 09:29:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 799926E8B4
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 09:29:26 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id E36A6580F05;
 Thu, 18 Mar 2021 05:29:25 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 18 Mar 2021 05:29:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=zegqIkSkey0l/
 WgzefoRNIU2TetspFViNxx+QFkODNw=; b=jiy2h7MdG1EVLAIyJJqMITUur+V/X
 wU+w09UGO5mYbBdmTiA7PlfCQcGsx1nCxbYjUVwbBgRnt4MglxcXOSrn0KM04RRP
 mnlFtoaoVfUHAnoheeIr12y2esNm4X5wYxpbH97PHlN3qiAmZFrC7iBtuo3LgazF
 0i5HvnRCoHfvbCrahxa/DzDEajBj3E3MHs0efxDCqNHzePAeaR5XoOoRzWtqjoVI
 Lkpve4s11Hil9Pj1D//LZyaQU0uMrugDGN0JjdpTDmjOAOGMGSyIB6OGT2Fo0+7W
 WPTGFf9f6M+7cv7ju4KZeIEkQY84HZFT5m0qlCNQXe+2XkWsvrKVFPpDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=zegqIkSkey0l/WgzefoRNIU2TetspFViNxx+QFkODNw=; b=pB/mL2Li
 2s24sP9tCCagq01Ld7/N4kTxsJoVebG1j5VKlRhu0i9a2k3xRVAz6+27UPWQYRsE
 ogUkSZ7bgPxVMkespsErm5II1js8hWVfomscLCN0mD5dDD9NoV3ox9GITSqZE0qE
 iYpYU640le/U9nShxBil3V6gpBcthSYEVdZHrMOYto9WeVWpPr8RGrVbeMuY2LoK
 RDczV5wp9ud/Lu+jBzT1Mq5A6PQQI6ipRtggDLaweutbJcGxgp608d0zMo8kviRi
 qWEtDmh2Mji5uWeDqOXgNWXgYPNKuEN7l9eyICbqL5zYaP1O2xjgRPrkIhiBbgMf
 OQbBw/pLIcBVzw==
X-ME-Sender: <xms:dR1TYEvzHq9gOTvTmNqpSy5Blwr9i4M9Qkwt6xjSqp6TOEExOpvyuw>
 <xme:dR1TYBcV3fnB9a_Eto8DTcxwAlaDVnFjjLT3lcU-dB90GOGQdQHQ5tbEgZAQAIv57
 pSHlZh74DXrFl77yqQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefiedgtdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:dR1TYPz8qF5b9jRccy24y7MSG4Iy2HF9refL4THwbAs6VbHj54Szzw>
 <xmx:dR1TYHOLcSb9NNqzQxnoUGxKMakj-aZ58XVc1xcs6Xkfe7Tzj4hDFQ>
 <xmx:dR1TYE926eXiat8qSTLetXmViYZhY2FVMz2JmFAGERWPp5Xxpl36XQ>
 <xmx:dR1TYPZuHBOR2C19yfCoEWYezrGFNtnrnLFH_7F8LHqSonDfT9yeJw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 73C6C1080054;
 Thu, 18 Mar 2021 05:29:25 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v2 3/5] drm/vc4: hdmi: Check and warn if we can't reach 4kp60
 frequencies
Date: Thu, 18 Mar 2021 10:29:15 +0100
Message-Id: <20210318092917.831995-4-maxime@cerno.tech>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210318092917.831995-1-maxime@cerno.tech>
References: <20210318092917.831995-1-maxime@cerno.tech>
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

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 26 ++++++++++++++++++++++++++
 drivers/gpu/drm/vc4/vc4_hdmi.h |  8 ++++++++
 2 files changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index eaee853bb404..0924a1b9e186 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -210,6 +210,18 @@ static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
 	ret = drm_add_edid_modes(connector, edid);
 	kfree(edid);
 
+	if (vc4_hdmi->disable_4kp60) {
+		struct drm_device *drm = connector->dev;
+		struct drm_display_mode *mode;
+
+		list_for_each_entry(mode, &connector->probed_modes, head) {
+			if ((mode->clock * 1000) > HDMI_14_MAX_TMDS_CLK) {
+				drm_warn_once(drm, "The core clock cannot reach frequencies high enough to support 4k @ 60Hz.");
+				drm_warn_once(drm, "Please change your config.txt file to add hdmi_enable_4kp60.");
+			}
+		}
+	}
+
 	return ret;
 }
 
@@ -959,6 +971,9 @@ static int vc4_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
 	if (pixel_rate > vc4_hdmi->variant->max_pixel_clock)
 		return -EINVAL;
 
+	if (vc4_hdmi->disable_4kp60 && (pixel_rate > HDMI_14_MAX_TMDS_CLK))
+		return -EINVAL;
+
 	vc4_state->pixel_rate = pixel_rate;
 
 	return 0;
@@ -978,6 +993,9 @@ vc4_hdmi_encoder_mode_valid(struct drm_encoder *encoder,
 	if ((mode->clock * 1000) > vc4_hdmi->variant->max_pixel_clock)
 		return MODE_CLOCK_HIGH;
 
+	if (vc4_hdmi->disable_4kp60 && ((mode->clock * 1000) > HDMI_14_MAX_TMDS_CLK))
+		return MODE_CLOCK_HIGH;
+
 	return MODE_OK;
 }
 
@@ -1992,6 +2010,14 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
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
