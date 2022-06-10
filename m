Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 228C0546252
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 11:30:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD8D911B781;
	Fri, 10 Jun 2022 09:30:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB06011B356
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 09:30:34 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 54E695C01AF;
 Fri, 10 Jun 2022 05:30:34 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 10 Jun 2022 05:30:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1654853434; x=1654939834; bh=gE
 FjTZRKOq2S0tDzDT4q6zB+jCyRY5+Kd7l9kEsL4co=; b=K6KWW+AcZ+50zjqwKa
 lAIQBM09hXmGryfWA6RLCKHI7lhJnORNnHBi9AyjcHqxntADzJDQwu8TtEvjU70W
 gezax53G3YhyZyf+XSCIkug6lzwKLdigJrfiGYeZSj13Q/l1/dekDx0eP9ZaKbhm
 ELLVo79090teRp1HgUj8Mf4LW73kvqw1J/J+9EKtLpOLHSJV01k5Uy4BzwnJHYui
 SZhKwqkzkYKHqXQcpijg9RP0AOA5BveuejKY38VC/sPUV0ydHSOSECjM+q9lR86h
 sUOGn3VQR23B3BjeBRiW0lsS8wN/UflDNgAE1kQkwUpnbiR3TZ35iTzUZ5jGJWms
 Mohg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1654853434; x=1654939834; bh=gEFjTZRKOq2S0
 tDzDT4q6zB+jCyRY5+Kd7l9kEsL4co=; b=p+CYNrOStnzMm7nYAueW3jXDpXpe8
 ttMRr7gKuAot9C3+Zh8jBW6zY+bzdHuja65Vk6oIT1Zc5sJpiRRMwwXilVDJcRCi
 fj+lUiZ017zFfHeB1oFjQFErHx/maIjdUfrXeoL3+k+qqGzjmAl4A3NvZ6fL+Nao
 TXKxHTykAbkJXAwsmQYC8XMWwi2XnEG5HA5ApC8WwvegUvRUY1s8R6dchAbQkwVF
 5NtXjHo7O04jndw1u/Cj9VZws/qZjHEatz80PaqLtKYbxUns7HCGogHq7LxKChhP
 kpo4n1BtwRC6bPrXtuLQ8zqSjgogad+WEkdua2HKc9ukzaGGtJVUJDG7A==
X-ME-Sender: <xms:Og-jYkvRsr-yf8aBCwAQyLSkWqaEf8mobnK7YDUBUuIoofOdfZ85dw>
 <xme:Og-jYhebRooRV1xUzsx4E5a1oXSjyzE65omt2cK3LUhiwC881J629EASsxz_-shXd
 _LojdLui_t2ZXxuD-8>
X-ME-Received: <xmr:Og-jYvwK-zGBAef3RKEjubfdNxiZaKjf3PUzHwh7AM8wwlJK-6wWm_KsnS1ZTKSvfm7hpbrxtTrTBxqt_sCyc2W6OWU2TdQaWQArY0Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudduuddgudeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeehnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Og-jYnOB9cBgaZuz3eheks_dkaGvr_zVEa2qjZwtJeUU3dIMTgQAjw>
 <xmx:Og-jYk80HQe69UhKfrzjPBngslIc0Bc6iMlIxcKYM9lWM4duUfOZRw>
 <xmx:Og-jYvXbKIBKPEdxl9-5XCVr51Tl8Btt1tjmw03hVKkptqq7dVskaQ>
 <xmx:Og-jYoZJHOlxYrg6IFtlkcQIe8ojD6haoIloMUGNmsw1rT5i2MxyQg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jun 2022 05:30:33 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 37/64] drm/vc4: hdmi: Switch to device-managed ALSA
 initialization
Date: Fri, 10 Jun 2022 11:28:57 +0200
Message-Id: <20220610092924.754942-38-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610092924.754942-1-maxime@cerno.tech>
References: <20220610092924.754942-1-maxime@cerno.tech>
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
index 63d9a91f5038..8f71f5a5e4ce 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2021,6 +2021,14 @@ static struct hdmi_codec_pdata vc4_hdmi_codec_pdata = {
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
@@ -2062,6 +2070,30 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
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
@@ -2085,6 +2117,10 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
 	}
 	vc4_hdmi->audio.codec_pdev = codec_pdev;
 
+	ret = devm_add_action_or_reset(dev, vc4_hdmi_audio_codec_release, vc4_hdmi);
+	if (ret)
+		return ret;
+
 	dai_link->cpus		= &vc4_hdmi->audio.cpu;
 	dai_link->codecs	= &vc4_hdmi->audio.codec;
 	dai_link->platforms	= &vc4_hdmi->audio.platform;
@@ -2123,12 +2159,6 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
 
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
@@ -2989,7 +3019,6 @@ static void vc4_hdmi_unbind(struct device *dev, struct device *master,
 	kfree(vc4_hdmi->hdmi_regset.regs);
 	kfree(vc4_hdmi->hd_regset.regs);
 
-	vc4_hdmi_audio_exit(vc4_hdmi);
 	vc4_hdmi_cec_exit(vc4_hdmi);
 	vc4_hdmi_hotplug_exit(vc4_hdmi);
 
-- 
2.36.1

