Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE50D439839
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 16:11:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E8546E055;
	Mon, 25 Oct 2021 14:11:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C138489FC3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 14:11:29 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 16F215805BE;
 Mon, 25 Oct 2021 10:11:29 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 25 Oct 2021 10:11:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=xHIG4HfKM5UwG
 kxCqm2tot0c9JHdrElLc7UQl3ZZFlM=; b=W3uGqaVp9D7WTRYRLhpIZI1Mkjcrn
 jEPaBif57KqGchdqqDbTfFll9K6sG9CkNVUn2RJm7YPSG3CqZKxLuzJyEL5yD4d4
 roaZcrep3QaVcPOrbFVlatBO5NV+f/rLiz0ZC+vl/agrNG7Bfo76GgKhh2Q2JXId
 Qmd2wE4R32cH09u9KU1OGf6z2jj+D1yTFmBH4SZboTdRkr54PFY13n/7+D/3HiOC
 DUnQZxl2tXGsK9Rvz6C1N7j++HEOi7+gRbxn+wpdmKh/p3fWVLPlWQJLxWN5sEcK
 w5ilCmxDvc95fViDYNjqC3sE6lvCNuYoLCQnr8QT1tMit3C6oh0KuXkhw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=xHIG4HfKM5UwGkxCqm2tot0c9JHdrElLc7UQl3ZZFlM=; b=WhCgKbsE
 AtN4T5XxOYOtZDydjhfUecUo9VeYakhf9U4LeEysQ77O4UNEPT0HSIL/c7scA68v
 +pypJ9YUCt3AKLTlD3yts/aS9w8nZRyDSUqnLVUVLbxFdotQrCKGWKHWNc7uxGr7
 tq4UX3vWUuJmkR2g4NJGm23MjAIcoueLwqtkA5zzQjiraF67qj+/+xjbTpXMNFCP
 MHZx3NrAzGz0KRTJKIyaEwxagzdmI8v2K3kuqXO80uJiMiQg7jcQ3wBq6QyutdhW
 4m4PQjPS0xhYdq/DT5ZenMR/sUt5GbiSfY5+3O85nbmnpIHTapLcxSEsXX6DIKMa
 NPWeYglCE7Pn9A==
X-ME-Sender: <xms:ELt2YV0zI19up7gw7U-gWwtxv0EkfvaTtIw8v_MyWmxOCEO56rPvDA>
 <xme:ELt2YcGI1Gnem4T9qRn_oUga99YnWiYOORTQhL26stwnro5Jfcqd0mBR_4xhP8h75
 LfRyw0r2XdJx-k3ewo>
X-ME-Received: <xmr:ELt2YV74p2mLO5l5j9ueATZ0xp09ohfDem6oKxRwHOQFaHAs8woxH_C1sW9biHEylQxCnvY_zZU-pfH_jg2S63v7LO8gxEzBRHYcRjJ4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdefhedgheehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:ELt2YS2gNKWeJeE_gaL7xBaVEbr6_uE8LJK1WXTgynqAS2sGuLO94A>
 <xmx:ELt2YYFlEItX3qESGmV1m4qTd9Fbl80rD2KwrYQzp1-KU7NYWOv-Rg>
 <xmx:ELt2YT-6_-I01JblEF59b0TsJGm4xnO39H3jOLKhvXlIKpuEdBpliQ>
 <xmx:Ebt2YTAmFu0riY2-yKQ0r5ID4T3SzmMSZhcTRQoxKNl0MacF8DmmfA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Oct 2021 10:11:28 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>, dri-devel@lists.freedesktop.org,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH 5/9] drm/vc4: hdmi: Use a mutex to prevent concurrent
 framework access
Date: Mon, 25 Oct 2021 16:11:09 +0200
Message-Id: <20211025141113.702757-6-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211025141113.702757-1-maxime@cerno.tech>
References: <20211025141113.702757-1-maxime@cerno.tech>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The vc4 HDMI controller registers into the KMS, CEC and ALSA
frameworks.

However, no particular care is done to prevent the concurrent execution
of different framework hooks from happening at the same time.

In order to protect against that scenario, let's introduce a mutex that
relevant ALSA and KMS hooks will need to take to prevent concurrent
execution.

CEC is left out at the moment though, since the .get_modes and .detect
KMS hooks, when running cec_s_phys_addr_from_edid, can end up calling
CEC's .adap_enable hook. This introduces some reentrancy that isn't easy
to deal with properly.

The CEC hooks also don't share much state with the rest of the driver:
the registers are entirely separate, we don't share any variable, the
only thing that can conflict is the CEC clock divider setup that can be
affected by a mode set.

However, after discussing it, it looks like CEC should be able to
recover from this if it was to happen.

Fixes: bb7d78568814 ("drm/vc4: Add HDMI audio support")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 118 +++++++++++++++++++++++++++++++--
 drivers/gpu/drm/vc4/vc4_hdmi.h |  14 ++++
 2 files changed, 126 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 484450831483..814f98414f2b 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -186,6 +186,8 @@ vc4_hdmi_connector_detect(struct drm_connector *connector, bool force)
 	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
 	bool connected = false;
 
+	mutex_lock(&vc4_hdmi->mutex);
+
 	WARN_ON(pm_runtime_resume_and_get(&vc4_hdmi->pdev->dev));
 
 	if (vc4_hdmi->hpd_gpio &&
@@ -217,11 +219,13 @@ vc4_hdmi_connector_detect(struct drm_connector *connector, bool force)
 		}
 
 		pm_runtime_put(&vc4_hdmi->pdev->dev);
+		mutex_unlock(&vc4_hdmi->mutex);
 		return connector_status_connected;
 	}
 
 	cec_phys_addr_invalidate(vc4_hdmi->cec_adap);
 	pm_runtime_put(&vc4_hdmi->pdev->dev);
+	mutex_unlock(&vc4_hdmi->mutex);
 	return connector_status_disconnected;
 }
 
@@ -238,10 +242,14 @@ static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
 	int ret = 0;
 	struct edid *edid;
 
+	mutex_lock(&vc4_hdmi->mutex);
+
 	edid = drm_get_edid(connector, vc4_hdmi->ddc);
 	cec_s_phys_addr_from_edid(vc4_hdmi->cec_adap, edid);
-	if (!edid)
-		return -ENODEV;
+	if (!edid) {
+		ret = -ENODEV;
+		goto out;
+	}
 
 	vc4_encoder->hdmi_monitor = drm_detect_hdmi_monitor(edid);
 
@@ -261,6 +269,9 @@ static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
 		}
 	}
 
+out:
+	mutex_unlock(&vc4_hdmi->mutex);
+
 	return ret;
 }
 
@@ -477,6 +488,8 @@ static void vc4_hdmi_set_avi_infoframe(struct drm_encoder *encoder)
 	union hdmi_infoframe frame;
 	int ret;
 
+	lockdep_assert_held(&vc4_hdmi->mutex);
+
 	ret = drm_hdmi_avi_infoframe_from_display_mode(&frame.avi,
 						       connector, mode);
 	if (ret < 0) {
@@ -528,6 +541,8 @@ static void vc4_hdmi_set_hdr_infoframe(struct drm_encoder *encoder)
 	struct drm_connector_state *conn_state = connector->state;
 	union hdmi_infoframe frame;
 
+	lockdep_assert_held(&vc4_hdmi->mutex);
+
 	if (!vc4_hdmi->variant->supports_hdr)
 		return;
 
@@ -544,6 +559,8 @@ static void vc4_hdmi_set_infoframes(struct drm_encoder *encoder)
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 
+	lockdep_assert_held(&vc4_hdmi->mutex);
+
 	vc4_hdmi_set_avi_infoframe(encoder);
 	vc4_hdmi_set_spd_infoframe(encoder);
 	/*
@@ -563,6 +580,8 @@ static bool vc4_hdmi_supports_scrambling(struct drm_encoder *encoder,
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 	struct drm_display_info *display = &vc4_hdmi->connector.display_info;
 
+	lockdep_assert_held(&vc4_hdmi->mutex);
+
 	if (!vc4_encoder->hdmi_monitor)
 		return false;
 
@@ -581,6 +600,8 @@ static void vc4_hdmi_enable_scrambling(struct drm_encoder *encoder)
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 	unsigned long flags;
 
+	lockdep_assert_held(&vc4_hdmi->mutex);
+
 	if (!vc4_hdmi_supports_scrambling(encoder, mode))
 		return;
 
@@ -650,6 +671,8 @@ static void vc4_hdmi_encoder_post_crtc_disable(struct drm_encoder *encoder,
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 	unsigned long flags;
 
+	mutex_lock(&vc4_hdmi->mutex);
+
 	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
 
 	HDMI_WRITE(HDMI_RAM_PACKET_CONFIG, 0);
@@ -666,6 +689,8 @@ static void vc4_hdmi_encoder_post_crtc_disable(struct drm_encoder *encoder,
 	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
 
 	vc4_hdmi_disable_scrambling(encoder);
+
+	mutex_unlock(&vc4_hdmi->mutex);
 }
 
 static void vc4_hdmi_encoder_post_crtc_powerdown(struct drm_encoder *encoder,
@@ -675,6 +700,8 @@ static void vc4_hdmi_encoder_post_crtc_powerdown(struct drm_encoder *encoder,
 	unsigned long flags;
 	int ret;
 
+	mutex_lock(&vc4_hdmi->mutex);
+
 	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
 	HDMI_WRITE(HDMI_VID_CTL,
 		   HDMI_READ(HDMI_VID_CTL) | VC4_HD_VID_CTL_BLANKPIX);
@@ -689,6 +716,8 @@ static void vc4_hdmi_encoder_post_crtc_powerdown(struct drm_encoder *encoder,
 	ret = pm_runtime_put(&vc4_hdmi->pdev->dev);
 	if (ret < 0)
 		DRM_ERROR("Failed to release power domain: %d\n", ret);
+
+	mutex_unlock(&vc4_hdmi->mutex);
 }
 
 static void vc4_hdmi_encoder_disable(struct drm_encoder *encoder)
@@ -985,6 +1014,8 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
 	unsigned long flags;
 	int ret;
 
+	mutex_lock(&vc4_hdmi->mutex);
+
 	/*
 	 * As stated in RPi's vc4 firmware "HDMI state machine (HSM) clock must
 	 * be faster than pixel clock, infinitesimally faster, tested in
@@ -1005,13 +1036,13 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
 	ret = clk_set_min_rate(vc4_hdmi->hsm_clock, hsm_rate);
 	if (ret) {
 		DRM_ERROR("Failed to set HSM clock rate: %d\n", ret);
-		return;
+		goto out;
 	}
 
 	ret = pm_runtime_resume_and_get(&vc4_hdmi->pdev->dev);
 	if (ret < 0) {
 		DRM_ERROR("Failed to retain power domain: %d\n", ret);
-		return;
+		goto out;
 	}
 
 	ret = clk_set_rate(vc4_hdmi->pixel_clock, pixel_rate);
@@ -1063,13 +1094,16 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
 	if (vc4_hdmi->variant->set_timings)
 		vc4_hdmi->variant->set_timings(vc4_hdmi, conn_state, mode);
 
+	mutex_unlock(&vc4_hdmi->mutex);
+
 	return;
 
 err_disable_pixel_clock:
 	clk_disable_unprepare(vc4_hdmi->pixel_clock);
 err_put_runtime_pm:
 	pm_runtime_put(&vc4_hdmi->pdev->dev);
-
+out:
+	mutex_unlock(&vc4_hdmi->mutex);
 	return;
 }
 
@@ -1081,6 +1115,8 @@ static void vc4_hdmi_encoder_pre_crtc_enable(struct drm_encoder *encoder,
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 	unsigned long flags;
 
+	mutex_lock(&vc4_hdmi->mutex);
+
 	if (vc4_encoder->hdmi_monitor &&
 	    drm_default_rgb_quant_range(mode) == HDMI_QUANTIZATION_RANGE_LIMITED) {
 		if (vc4_hdmi->variant->csc_setup)
@@ -1097,6 +1133,8 @@ static void vc4_hdmi_encoder_pre_crtc_enable(struct drm_encoder *encoder,
 	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
 	HDMI_WRITE(HDMI_FIFO_CTL, VC4_HDMI_FIFO_CTL_MASTER_SLAVE_N);
 	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
+
+	mutex_unlock(&vc4_hdmi->mutex);
 }
 
 static void vc4_hdmi_encoder_post_crtc_enable(struct drm_encoder *encoder,
@@ -1110,6 +1148,8 @@ static void vc4_hdmi_encoder_post_crtc_enable(struct drm_encoder *encoder,
 	unsigned long flags;
 	int ret;
 
+	mutex_lock(&vc4_hdmi->mutex);
+
 	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
 
 	HDMI_WRITE(HDMI_VID_CTL,
@@ -1169,6 +1209,8 @@ static void vc4_hdmi_encoder_post_crtc_enable(struct drm_encoder *encoder,
 
 	vc4_hdmi_recenter_fifo(vc4_hdmi);
 	vc4_hdmi_enable_scrambling(encoder);
+
+	mutex_unlock(&vc4_hdmi->mutex);
 }
 
 static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
@@ -1310,6 +1352,7 @@ static void vc4_hdmi_set_n_cts(struct vc4_hdmi *vc4_hdmi, unsigned int samplerat
 	u32 n, cts;
 	u64 tmp;
 
+	lockdep_assert_held(&vc4_hdmi->mutex);
 	lockdep_assert_held(&vc4_hdmi->hw_lock);
 
 	n = 128 * samplerate / 1000;
@@ -1343,13 +1386,17 @@ static int vc4_hdmi_audio_startup(struct device *dev, void *data)
 	struct drm_encoder *encoder = &vc4_hdmi->encoder.base.base;
 	unsigned long flags;
 
+	mutex_lock(&vc4_hdmi->mutex);
+
 	/*
 	 * If the HDMI encoder hasn't probed, or the encoder is
 	 * currently in DVI mode, treat the codec dai as missing.
 	 */
 	if (!encoder->crtc || !(HDMI_READ(HDMI_RAM_PACKET_CONFIG) &
-				VC4_HDMI_RAM_PACKET_ENABLE))
+				VC4_HDMI_RAM_PACKET_ENABLE)) {
+		mutex_unlock(&vc4_hdmi->mutex);
 		return -ENODEV;
+	}
 
 	vc4_hdmi->audio.streaming = true;
 
@@ -1365,6 +1412,8 @@ static int vc4_hdmi_audio_startup(struct device *dev, void *data)
 	if (vc4_hdmi->variant->phy_rng_enable)
 		vc4_hdmi->variant->phy_rng_enable(vc4_hdmi);
 
+	mutex_unlock(&vc4_hdmi->mutex);
+
 	return 0;
 }
 
@@ -1375,6 +1424,8 @@ static void vc4_hdmi_audio_reset(struct vc4_hdmi *vc4_hdmi)
 	unsigned long flags;
 	int ret;
 
+	lockdep_assert_held(&vc4_hdmi->mutex);
+
 	vc4_hdmi->audio.streaming = false;
 	ret = vc4_hdmi_stop_packet(encoder, HDMI_INFOFRAME_TYPE_AUDIO, false);
 	if (ret)
@@ -1394,6 +1445,8 @@ static void vc4_hdmi_audio_shutdown(struct device *dev, void *data)
 	struct vc4_hdmi *vc4_hdmi = dev_get_drvdata(dev);
 	unsigned long flags;
 
+	mutex_lock(&vc4_hdmi->mutex);
+
 	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
 
 	HDMI_WRITE(HDMI_MAI_CTL,
@@ -1408,6 +1461,8 @@ static void vc4_hdmi_audio_shutdown(struct device *dev, void *data)
 
 	vc4_hdmi->audio.streaming = false;
 	vc4_hdmi_audio_reset(vc4_hdmi);
+
+	mutex_unlock(&vc4_hdmi->mutex);
 }
 
 static int sample_rate_to_mai_fmt(int samplerate)
@@ -1466,6 +1521,8 @@ static int vc4_hdmi_audio_prepare(struct device *dev, void *data,
 	dev_dbg(dev, "%s: %u Hz, %d bit, %d channels\n", __func__,
 		sample_rate, params->sample_width, channels);
 
+	mutex_lock(&vc4_hdmi->mutex);
+
 	vc4_hdmi_audio_set_mai_clock(vc4_hdmi, sample_rate);
 
 	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
@@ -1520,6 +1577,8 @@ static int vc4_hdmi_audio_prepare(struct device *dev, void *data,
 	memcpy(&vc4_hdmi->audio.infoframe, &params->cea, sizeof(params->cea));
 	vc4_hdmi_set_audio_infoframe(encoder);
 
+	mutex_unlock(&vc4_hdmi->mutex);
+
 	return 0;
 }
 
@@ -1570,7 +1629,9 @@ static int vc4_hdmi_audio_get_eld(struct device *dev, void *data,
 	struct vc4_hdmi *vc4_hdmi = dev_get_drvdata(dev);
 	struct drm_connector *connector = &vc4_hdmi->connector;
 
+	mutex_lock(&vc4_hdmi->mutex);
 	memcpy(buf, connector->eld, min(sizeof(connector->eld), len));
+	mutex_unlock(&vc4_hdmi->mutex);
 
 	return 0;
 }
@@ -1901,6 +1962,17 @@ static int vc4_hdmi_cec_enable(struct cec_adapter *adap)
 	u32 val;
 	int ret;
 
+	/*
+	 * NOTE: This function should really take vc4_hdmi->mutex, but doing so
+	 * results in a reentrancy since cec_s_phys_addr_from_edid() called in
+	 * .detect or .get_modes might call .adap_enable, which leads to this
+	 * function being called with that mutex held.
+	 *
+	 * Concurrency is not an issue for the moment since we don't share any
+	 * state with KMS, so we can ignore the lock for now, but we need to
+	 * keep it in mind if we were to change that assumption.
+	 */
+
 	ret = pm_runtime_resume_and_get(&vc4_hdmi->pdev->dev);
 	if (ret)
 		return ret;
@@ -1947,6 +2019,17 @@ static int vc4_hdmi_cec_disable(struct cec_adapter *adap)
 	struct vc4_hdmi *vc4_hdmi = cec_get_drvdata(adap);
 	unsigned long flags;
 
+	/*
+	 * NOTE: This function should really take vc4_hdmi->mutex, but doing so
+	 * results in a reentrancy since cec_s_phys_addr_from_edid() called in
+	 * .detect or .get_modes might call .adap_enable, which leads to this
+	 * function being called with that mutex held.
+	 *
+	 * Concurrency is not an issue for the moment since we don't share any
+	 * state with KMS, so we can ignore the lock for now, but we need to
+	 * keep it in mind if we were to change that assumption.
+	 */
+
 	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
 
 	if (!vc4_hdmi->variant->external_irq_controller)
@@ -1975,6 +2058,17 @@ static int vc4_hdmi_cec_adap_log_addr(struct cec_adapter *adap, u8 log_addr)
 	struct vc4_hdmi *vc4_hdmi = cec_get_drvdata(adap);
 	unsigned long flags;
 
+	/*
+	 * NOTE: This function should really take vc4_hdmi->mutex, but doing so
+	 * results in a reentrancy since cec_s_phys_addr_from_edid() called in
+	 * .detect or .get_modes might call .adap_enable, which leads to this
+	 * function being called with that mutex held.
+	 *
+	 * Concurrency is not an issue for the moment since we don't share any
+	 * state with KMS, so we can ignore the lock for now, but we need to
+	 * keep it in mind if we were to change that assumption.
+	 */
+
 	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
 	HDMI_WRITE(HDMI_CEC_CNTRL_1,
 		   (HDMI_READ(HDMI_CEC_CNTRL_1) & ~VC4_HDMI_CEC_ADDR_MASK) |
@@ -1993,6 +2087,17 @@ static int vc4_hdmi_cec_adap_transmit(struct cec_adapter *adap, u8 attempts,
 	u32 val;
 	unsigned int i;
 
+	/*
+	 * NOTE: This function should really take vc4_hdmi->mutex, but doing so
+	 * results in a reentrancy since cec_s_phys_addr_from_edid() called in
+	 * .detect or .get_modes might call .adap_enable, which leads to this
+	 * function being called with that mutex held.
+	 *
+	 * Concurrency is not an issue for the moment since we don't share any
+	 * state with KMS, so we can ignore the lock for now, but we need to
+	 * keep it in mind if we were to change that assumption.
+	 */
+
 	if (msg->len > 16) {
 		drm_err(dev, "Attempting to transmit too much data (%d)\n", msg->len);
 		return -ENOMEM;
@@ -2348,6 +2453,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	vc4_hdmi = devm_kzalloc(dev, sizeof(*vc4_hdmi), GFP_KERNEL);
 	if (!vc4_hdmi)
 		return -ENOMEM;
+	mutex_init(&vc4_hdmi->mutex);
 	spin_lock_init(&vc4_hdmi->hw_lock);
 	INIT_DELAYED_WORK(&vc4_hdmi->scrambling_work, vc4_hdmi_scrambling_wq);
 
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 006142fe8d4e..cf9bb21a8ef7 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -183,6 +183,20 @@ struct vc4_hdmi {
 	 * @hw_lock: Spinlock protecting device register access.
 	 */
 	spinlock_t hw_lock;
+
+	/**
+	 * @mutex: Mutex protecting the driver access across multiple
+	 * frameworks (KMS, ALSA).
+	 *
+	 * NOTE: While supported, CEC has been left out since
+	 * cec_s_phys_addr_from_edid() might call .adap_enable and lead to a
+	 * reentrancy issue between .get_modes (or .detect) and .adap_enable.
+	 * Since we don't share any state between the CEC hooks and KMS', it's
+	 * not a big deal. The only trouble might come from updating the CEC
+	 * clock divider which might be affected by a modeset, but CEC should
+	 * be resilient to that.
+	 */
+	struct mutex mutex;
 };
 
 static inline struct vc4_hdmi *
-- 
2.31.1

