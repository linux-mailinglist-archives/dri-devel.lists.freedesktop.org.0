Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7EB554D4C
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 16:34:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D46F112A9D;
	Wed, 22 Jun 2022 14:34:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4F86112A9D
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 14:34:23 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 9694F32009A4;
 Wed, 22 Jun 2022 10:34:22 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 22 Jun 2022 10:34:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655908462; x=1655994862; bh=MW
 HXyJwkXRLbman4diXiwT9pPen69dVGnvuo4p1r45A=; b=x1oIUxqogDKnOwhrcC
 7ua5fNhvTXgcCa1jB7cDkllr377yAia+kCvBgpyIbrnymT+cYqbemxFTRKQMGrm5
 CZCPdI0rFclugqC9R/jDuaAfoPuyVTycO7bWnrORV310pBqqKhbyAELDsAxa+ToL
 iWMLfWp7ijodW2e7gl7EwgK4EtRqci3tCTrAiP2x8DuESpgyn+r0LMDFJi6J3OfJ
 T+TU5P4n1eeHms1CAIUyv+oPKvS1dfamh8MNCRTHHVBsPuNFSxdamC0spFExZTQb
 8wvc7/tZK06sHuE0pUouYZZT4XVhCSFG7M6OV8coEAFZPjNuNN/UR8tWy3AN87GS
 W8UA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655908462; x=1655994862; bh=MWHXyJwkXRLbm
 an4diXiwT9pPen69dVGnvuo4p1r45A=; b=eHNP0ZWE4hAPefpZm5ECfCRXDy0Io
 FoMvJ97uHj9LV8Z+UE/lk4+qbnkjUuSYqcubczU/A1BS0wh+V8TB7Q+31lFiYtpF
 /EW8FLSwyoymtmYTvkk5368CqG54WFtgjtYBb8JKZKjnoleDZKosmPCsdNyN88nn
 k8aWYWO+f4fF8eUhTsJWGvziD4LIl4IEE4+8B8sb4r7Q7le9L37jfm3+NGZtzYIp
 gnBWBLIEEt+1Rg0KUgXh64gYKkQa/Ga0PL17gJU7R1TiTO9xBnyL42N6qbbN6fSe
 +jk9pb4zNWTHX1+P3gKTwu6iExkCysCoOGXw1xyFYjWEk3eqEDVYWxtgg==
X-ME-Sender: <xms:bSizYmfyhe5Kd9PBA22Qey8kDXdospLjd07PkLGqbcZIq6lmcEm18g>
 <xme:bSizYgPcuvdSY84FxAtHRK3vIMq560CuzDwwyneFAyVMHvIGYcsUic_r3CFXJ3g-q
 kH7HKTQ24rer-u0SOY>
X-ME-Received: <xmr:bSizYni3XsDkKNYbVPl8HSXrCMDAPg-lEQ0OutvbOv2LChXesvMfvPDSPFCoRs8p09nw2Br3ZIBnrg_tX6v0_P9GhqbX_ljsv-RtylI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefhedgjeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:bSizYj9arXiFQ1YozJNbr_Jty51vYzH24cPP51za4YZBHwYjpthf8g>
 <xmx:bSizYivLOzFKJvC4suWyZH-CeWC5ELbyQ3kL0ph1O0wBR48NHh2BXA>
 <xmx:bSizYqG_iMV4g-2GH3oPHK-rNKr133UCe2-TEShVpfeyJeMY3MJefg>
 <xmx:biizYkINdQHO-uswrCun-hsKZMgnsyklyOy2OdfIvxhDCl91wExaCQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jun 2022 10:34:21 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 40/68] drm/vc4: hdmi: Switch to device-managed ALSA
 initialization
Date: Wed, 22 Jun 2022 16:31:41 +0200
Message-Id: <20220622143209.600298-41-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220622143209.600298-1-maxime@cerno.tech>
References: <20220622143209.600298-1-maxime@cerno.tech>
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
index 2d1f87f89994..2de7532b6c78 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2022,6 +2022,14 @@ static struct hdmi_codec_pdata vc4_hdmi_codec_pdata = {
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
@@ -2063,6 +2071,30 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
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
@@ -2086,6 +2118,10 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
 	}
 	vc4_hdmi->audio.codec_pdev = codec_pdev;
 
+	ret = devm_add_action_or_reset(dev, vc4_hdmi_audio_codec_release, vc4_hdmi);
+	if (ret)
+		return ret;
+
 	dai_link->cpus		= &vc4_hdmi->audio.cpu;
 	dai_link->codecs	= &vc4_hdmi->audio.codec;
 	dai_link->platforms	= &vc4_hdmi->audio.platform;
@@ -2124,12 +2160,6 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
 
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
@@ -2993,7 +3023,6 @@ static void vc4_hdmi_unbind(struct device *dev, struct device *master,
 	kfree(vc4_hdmi->hdmi_regset.regs);
 	kfree(vc4_hdmi->hd_regset.regs);
 
-	vc4_hdmi_audio_exit(vc4_hdmi);
 	vc4_hdmi_cec_exit(vc4_hdmi);
 	vc4_hdmi_hotplug_exit(vc4_hdmi);
 
-- 
2.36.1

