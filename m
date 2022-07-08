Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD0656B6B4
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 12:11:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7933F10F89A;
	Fri,  8 Jul 2022 09:59:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E6A110F89A
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 09:59:13 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 6C6FE32009D0;
 Fri,  8 Jul 2022 05:59:12 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 08 Jul 2022 05:59:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657274351; x=1657360751; bh=N/
 3zUlv8qo2hrkNbnb38aHep8A5z0XkwuwmsUmuiD04=; b=mxZGnCbnE1En/KEVYr
 RpA6N6+Wt3IsqnPc6WlVV7D7bt108nFgwO9bpkrY4uUKDhxQJvLlrp3qMOR5/JLE
 HJw1aBUWCsmR7PBv4lYFplCDMWeJf8bRdXBf01MF0GZqoT2IilcgCUOME2KafWqn
 MKiXxXqXu0NvbBQ100/TZkoWaaOnPw7pb2oDT1QZik6h0pfbeDI9ZuF3W1zLb/CT
 YoHJxL9TUOxHlhzH6BBAnbBuJVNek/oEtvJ70gv+p0cXHJWbtLnMLAduSFMTGxYX
 nvnbi30CkyeaHhVkzngtgs6ofWBOLW0Lo1yNOF+zGs8783ahs3e+GDWsK9GDVlZt
 FPGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657274351; x=1657360751; bh=N/3zUlv8qo2hr
 kNbnb38aHep8A5z0XkwuwmsUmuiD04=; b=q51+AnvpbUMAinIdECc2Nn84/4sJW
 Qj98lHuzBHnMWC67+zfc4yMz196D0MZF1pVY9NcKbkiJNCFtHEpwE096baBL196z
 NkYslcebwRKxJjhpoxudTgvA6+5xGZjUljvtFEdEuKxzfWthLvkjrpa6LtZXmfmr
 7Te7B9Fm57ByaCGE2lUr7TD7VH2iEgvvcEZgxA0MNYgDlux2g0IcAvGlFY5Bf2db
 +/4kv6HBncsTLE4kED/Xat+8jChOpark3LEmisX7fLD4nyKFDI0juEyzbPMx+moI
 xCSOP8f4PUQctZdMVsZSFsxuG9erNchilJ3evcksNAq6y/Tb67VhBGADA==
X-ME-Sender: <xms:7__HYoUK45S41NsUurlQnOb1IjwnNwFWHnP7Gr5wUH09s7KnY5qJDA>
 <xme:7__HYskUsbARsxCdBdb1EYN85vCOlDtnPebUy0axNfZ3uEa6jI4CFkmoJRNCFnVTE
 jEXB3fzuaRmFdTtWKM>
X-ME-Received: <xmr:7__HYsbHvsJBp3LUXME6aDVtkewjoIHXetTUvurQUjVirPHS_YokDnJg8t3WB7G1tsix5opsHCYW8InVJzo3E5eY7p9zIbtyxiuNHSw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeijedgvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeejnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:7__HYnVfInbf-jDEVu0NosiqLSBS2ogqdHDppaaxOceYh6voISU1hg>
 <xmx:7__HYimHheCNNOCq_F0m38eeNsFFwFndFOODL2qTgqouEut-FAqD3w>
 <xmx:7__HYsf--ziBL85dp0dBzHQ2QEjw3Rb4SoYUjZtGQ9JdWMnb3OcULg>
 <xmx:7__HYjCMJyQUDIuMxyuOHZv__vv7Dn_97Wrojs_moN5OgpBocHwKsQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Jul 2022 05:59:11 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 41/69] drm/vc4: hdmi: Switch to device-managed ALSA
 initialization
Date: Fri,  8 Jul 2022 11:56:39 +0200
Message-Id: <20220708095707.257937-42-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220708095707.257937-1-maxime@cerno.tech>
References: <20220708095707.257937-1-maxime@cerno.tech>
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

