Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 695DF56001F
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 14:37:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F334814A634;
	Wed, 29 Jun 2022 12:37:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8913514A62C
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 12:37:24 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 5BCC8320016F;
 Wed, 29 Jun 2022 08:37:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 29 Jun 2022 08:37:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656506242; x=1656592642; bh=tF
 kMqYn3GXgilzzjRDMcYdDBkc2o5JcwGTC7SCF/dHo=; b=CvFPDS+X+Kf8B8+xnU
 OHSKxv1/w0UaMvvhv1GPXlXT7UNMYhbe1F23u3aNjbwBFnMMn356p5bE/41wGVaA
 CcTRbvYk+tozkud14qveuwZCKOekaXY0J7w5vR6hHkYtH7EznFbNzAEN64s/lbqa
 yvI77qxYCsysEF6MAvR1edXKcuTB+QvD2uomwwkDtEtmqnk+e+ZAcL3avPUfLZRM
 aUgIeIiICZ+xPB24dvZnSyTfRJPXrF2HPfiud8LOSTIwz0zUzNJRYPVjkQ1htgFk
 BDDyYgwebEK/w4DmVpLEVoDM+zgnlyFmAkHtwkzS+lWClDZ/sLQniTsimOFUvPGT
 cVAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656506242; x=1656592642; bh=tFkMqYn3GXgil
 zzjRDMcYdDBkc2o5JcwGTC7SCF/dHo=; b=Uk97kTAmfLv2J7iAikwKkknNTsVZP
 OvYoN+tU0vQ4jfJHC79y7dj1FMXjFGE/sY27tbYrG4hPHHn5xdqOd7R9pl0k4N8x
 DYR8EqoQbYfZPexBRk8W0Fhd9EpyffE4WJujhkOSK1KblAP9HI+gma6tGEqF+iYL
 fti0mZe0di1xyK1Rx1p0TO/CyNFQiLD+7Vw6/UFov5Y2F1rdri4eeO0tmk86Wf8d
 LpvpzIGVdpIF+2frfeW5g3+Gy38iisUVL8oDQpGzsjhktp0W8c8ZzxcSQA8aIKgu
 DIxqVxfx0KBxPP2DXtzkUKl5lW9yfiS+vmyYwLjAxIGSeuv9Foxk/N68A==
X-ME-Sender: <xms:gke8YtbByXIMAHd5FH5sC5_RR8rFk06PRn6tQbqoL1-Bss4-_1ZGIA>
 <xme:gke8YkboS7HcqQaLH0-2p9TW-UplC9UAhjX_THZc9flUjulPq3eHrVi835EdRMPOa
 YRJpTp4E7BOXX2lE2k>
X-ME-Received: <xmr:gke8Yv8h6XsQcIfqyK16OuqYbzJzMf01rWpXOrnPMzPxwr-STrAIx7YhW1_MEYQgdro-S3cik_39cU_EpvxLLpupQnDcZjOcj3dlg04>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegledgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeduvdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:gke8Yrr_xfQV1NmqJ_moAK6SXgbKMfmHYQD5U5_76FX3beixNLnGtw>
 <xmx:gke8YorCymMOeTsDaBEXnKgVKree-zpWTD94ShfBq1Q1LaKkbkeuHg>
 <xmx:gke8YhRtOyyRWZkUA0nImo1VbKrz6i8vybb-OZoRNUQbNntKI7T2VA>
 <xmx:gke8YhkhCTOC4rDeq8CCNBe2c3tzAtdAoRpXW_9iwIHXQ3n0vXXHkw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Jun 2022 08:37:22 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v3 43/71] drm/vc4: hdmi: Switch to device-managed ALSA
 initialization
Date: Wed, 29 Jun 2022 14:34:42 +0200
Message-Id: <20220629123510.1915022-44-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629123510.1915022-1-maxime@cerno.tech>
References: <20220629123510.1915022-1-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The current code to unregister our ALSA device needs to be undone manually
when we remove the HDMI driver.

Since ALSA doesn't seem to support any mechanism to defer freeing something
until the last user of the ALSA device is gone, we can either use a
device-managed or a DRM-managed action.

The consistent way would be to use a DRM-managed one, just like pretty much
any framework-facing structure should be doing. However, ALSA does a lot of
allocation and registration using device-managed calls. Thus, if we're
going that way, by the time the DRM-managed action would run all of those
allocation would have been freed and we would end up with a use-after-free.

Thus, let's do a device-managed action. It's been tested with KASAN enabled
and doesn't seem to trigger any issue, so it's as good as anything.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 43 ++++++++++++++++++++++++++++------
 1 file changed, 36 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 283fea78f3cf..bf7d56bbcba0 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2056,6 +2056,14 @@ static struct hdmi_codec_pdata vc4_hdmi_codec_pdata = {
 	.i2s = 1,
 };
 
+static void vc4_hdmi_audio_codec_release(void *ptr)
+{
+	struct vc4_hdmi *vc4_hdmi = ptr;
+
+	platform_device_unregister(vc4_hdmi->audio.codec_pdev);
+	vc4_hdmi->audio.codec_pdev = NULL;
+}
+
 static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
 {
 	const struct vc4_hdmi_register *mai_data =
@@ -2097,6 +2105,30 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
 	vc4_hdmi->audio.dma_data.addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
 	vc4_hdmi->audio.dma_data.maxburst = 2;
 
+	/*
+	 * NOTE: Strictly speaking, we should probably use a DRM-managed
+	 * registration there to avoid removing all the audio components
+	 * by the time the driver doesn't have any user anymore.
+	 *
+	 * However, the ASoC core uses a number of devm_kzalloc calls
+	 * when registering, even when using non-device-managed
+	 * functions (such as in snd_soc_register_component()).
+	 *
+	 * If we call snd_soc_unregister_component() in a DRM-managed
+	 * action, the device-managed actions have already been executed
+	 * and thus we would access memory that has been freed.
+	 *
+	 * Using device-managed hooks here probably leaves us open to a
+	 * bunch of issues if userspace still has a handle on the ALSA
+	 * device when the device is removed. However, this is mitigated
+	 * by the use of drm_dev_enter()/drm_dev_exit() in the audio
+	 * path to prevent the access to the device resources if it
+	 * isn't there anymore.
+	 *
+	 * Then, the vc4_hdmi structure is DRM-managed and thus only
+	 * freed whenever the last user has closed the DRM device file.
+	 * It should thus outlive ALSA in most situations.
+	 */
 	ret = devm_snd_dmaengine_pcm_register(dev, &pcm_conf, 0);
 	if (ret) {
 		dev_err(dev, "Could not register PCM component: %d\n", ret);
@@ -2120,6 +2152,10 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
 	}
 	vc4_hdmi->audio.codec_pdev = codec_pdev;
 
+	ret = devm_add_action_or_reset(dev, vc4_hdmi_audio_codec_release, vc4_hdmi);
+	if (ret)
+		return ret;
+
 	dai_link->cpus		= &vc4_hdmi->audio.cpu;
 	dai_link->codecs	= &vc4_hdmi->audio.codec;
 	dai_link->platforms	= &vc4_hdmi->audio.platform;
@@ -2158,12 +2194,6 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
 
 }
 
-static void vc4_hdmi_audio_exit(struct vc4_hdmi *vc4_hdmi)
-{
-	platform_device_unregister(vc4_hdmi->audio.codec_pdev);
-	vc4_hdmi->audio.codec_pdev = NULL;
-}
-
 static irqreturn_t vc4_hdmi_hpd_irq_thread(int irq, void *priv)
 {
 	struct vc4_hdmi *vc4_hdmi = priv;
@@ -3062,7 +3092,6 @@ static void vc4_hdmi_unbind(struct device *dev, struct device *master,
 	kfree(vc4_hdmi->hdmi_regset.regs);
 	kfree(vc4_hdmi->hd_regset.regs);
 
-	vc4_hdmi_audio_exit(vc4_hdmi);
 	vc4_hdmi_cec_exit(vc4_hdmi);
 	vc4_hdmi_hotplug_exit(vc4_hdmi);
 
-- 
2.36.1

