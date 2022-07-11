Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5151457092C
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 19:41:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EF4190331;
	Mon, 11 Jul 2022 17:41:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5A2490325
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 17:40:53 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id C0D5B5C00DA;
 Mon, 11 Jul 2022 13:40:52 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 11 Jul 2022 13:40:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657561252; x=1657647652; bh=N/
 3zUlv8qo2hrkNbnb38aHep8A5z0XkwuwmsUmuiD04=; b=CqMT69WZIAGsHul4VV
 HwdnVP5OpMjDeIUmd15bCXz7D37D3GwszE21fy+E+uyR3gfyOZM3tsP6nFMVTAgm
 6V3Hyrg/s+xHmiSpeXCl+1ECXRa4+S7lZ4Ofnd1P+z1LhXPpSsEYtgq74izxyloh
 Wn/9gz27QwdTRrcW3cnz9n14pmGITaeehFHYyf8h6jvuRGEMiDAv2P0OqWeMsPAP
 3HrB8cCuWctv79DF4OOlCsmLKgd+S1b29jEYErAoReXvNO1zpwJvPgzBPerzBrQM
 IVCqGH6WxhJT7DWDiRg3G3p64QUbzLs1rmZ2WdrMjhDBN3qQJKd+CvPX0G95MmVM
 7hiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657561252; x=1657647652; bh=N/3zUlv8qo2hr
 kNbnb38aHep8A5z0XkwuwmsUmuiD04=; b=wl2zTmwjd5gWmGiXvhYgQMhm+0bM0
 4osIqJOPIbAFVAvf5Sy6luyng8qz0SEwSjHb/LaFV3kAgiG0jd98j8vtUFDn7TUK
 l55NdH/+fVznWxOD4vmWojcDMleAh3NJfO2bgwICvF6xzomFaspVY+gcng0XIqH9
 9va3JAqlDPuMJYqtmEwX1JXj3T9T2rKwv/RZB25h4Pj01985bhX+nVA8syqJBILZ
 U+lw4e9WybLWvFeT7gnm+j74W8m5CJXu6/BymXcQZVS9iO5R6Zc+US67AzQgYqiB
 BB3DyU+A3vQrYYEgvyHR6PBVa2LtaNw4MBhjoawiqMTA/9+W7dUotkh0A==
X-ME-Sender: <xms:pGDMYuuU5Z0NZbw4XQrnHckiel_DhRak1K9re1yHoezHsrjLKNtBAg>
 <xme:pGDMYjemJdlIrXTAA4JJJiKhsyUy5rhBnumhhWJrM-bVeVBo4n8rP4OO28IhrsYt7
 qVwoXtmGnYd5Y6aY-8>
X-ME-Received: <xmr:pGDMYpyHcSxvHHNFwSWBkiUjbUiaWUy1osstxadGXXHJZ8oL95pAu_jhiBcpk9nPIKjkBckFoA_WhpO0e5YM5LU9nBz6RnDkel8mMxY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgudduhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfef
 uddvjefhnecuvehluhhsthgvrhfuihiivgepudegnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:pGDMYpNR4HzIujkwTWixNnc9SqtSep2P8SI7Sdtl0xLBiNz7gjUtVg>
 <xmx:pGDMYu-RlJ5e1uMxpG3oMLY-PHDm4q8_HOXjL0TEN3CsFzyhpFHIpg>
 <xmx:pGDMYhV5mUvZIn77KuScfw8soy7DmbU7O7a3qT5VEA7LLTBnpOxuRA>
 <xmx:pGDMYiYkDGLH6IcCz86zr_sK2l2wsaPvJ81zHH-gT0BHgt56EphFWA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 13:40:52 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 41/69] drm/vc4: hdmi: Switch to device-managed ALSA
 initialization
Date: Mon, 11 Jul 2022 19:39:11 +0200
Message-Id: <20220711173939.1132294-42-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220711173939.1132294-1-maxime@cerno.tech>
References: <20220711173939.1132294-1-maxime@cerno.tech>
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

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 43 ++++++++++++++++++++++++++++------
 1 file changed, 36 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index a49463251f2b..cf04f915ce7b 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2057,6 +2057,14 @@ static struct hdmi_codec_pdata vc4_hdmi_codec_pdata = {
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
@@ -2098,6 +2106,30 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
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
@@ -2121,6 +2153,10 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
 	}
 	vc4_hdmi->audio.codec_pdev = codec_pdev;
 
+	ret = devm_add_action_or_reset(dev, vc4_hdmi_audio_codec_release, vc4_hdmi);
+	if (ret)
+		return ret;
+
 	dai_link->cpus		= &vc4_hdmi->audio.cpu;
 	dai_link->codecs	= &vc4_hdmi->audio.codec;
 	dai_link->platforms	= &vc4_hdmi->audio.platform;
@@ -2159,12 +2195,6 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
 
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
@@ -3063,7 +3093,6 @@ static void vc4_hdmi_unbind(struct device *dev, struct device *master,
 	kfree(vc4_hdmi->hdmi_regset.regs);
 	kfree(vc4_hdmi->hd_regset.regs);
 
-	vc4_hdmi_audio_exit(vc4_hdmi);
 	vc4_hdmi_cec_exit(vc4_hdmi);
 	vc4_hdmi_hotplug_exit(vc4_hdmi);
 
-- 
2.36.1

