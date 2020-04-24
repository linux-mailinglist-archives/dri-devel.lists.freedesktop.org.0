Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2F21B800D
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 22:10:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1E006EB73;
	Fri, 24 Apr 2020 20:08:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D00B089F38
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 15:37:23 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id CF7D410EF;
 Fri, 24 Apr 2020 11:37:22 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 24 Apr 2020 11:37:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=keBY/Uir/i0X7
 TWpf1/ONHNrRD7jDvj3x0skqfltgfE=; b=gdhcugnNiyP4+z4eWw64C4k1ngT2T
 8eMF6H9yOlR8gXIJOpJK8pr9t6GSebrZa/7SpW5wECDp5hB7NC3tbOkjg+ucUCI/
 L/GiSsrVydD6bshuRXwPNvg9nmWNUQdoXLbiCcmcgNplE3OiDtxEQiqCI/014iTA
 CHscbZMhtmX4XGOgY2EVxOYHV30hiBWDX9WyaD+idxkKZpNSGmbpq3o0HCcX5QXa
 IUFrh0S5KL9T9Wmau6ri5rgdFxFWOya3KCNHLH/E6A/hXq610V+d/D08MTOpvHmh
 X1VxtECxIX+XYfGEU5W9gUfR6o5l5UdgPLx265CRRC6q5QSM6kWNJ9Bjw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=keBY/Uir/i0X7TWpf1/ONHNrRD7jDvj3x0skqfltgfE=; b=tbMSjNsJ
 xaSpFQJklYTf742bgqw0c3OnplNDFtPbvFyuvzfHMqeCWcg51+6xaLlZHGQcHj4c
 sGATju6aqL6AORD7gwu3aQTG9/bmgpZMlb/pzdP9yyu6sjfX5WWNm556qvGM7uqV
 hurS/1HRcNCcLoWe6rslnQBfGgSQrntNuuEp+OzPMSPv674fVIumvZorhxE3i63B
 x70CgWsa/oM0vXehH5q8XqNbmCm7RyXZ0ki2AXXCK9/Ex4vwjvvSyfgCYvhTdjOK
 vx5vpYhVYa3Jg6yWaE/Y1oYwy+uuSqPGqRSrTSfhkWU9PlnjhZpA3/jGNSLhttg+
 wkljMMCyVCS16Q==
X-ME-Sender: <xms:sgejXhYhJqbYPBv7_LfGNGcuKXGTuscZfFe10DuJxFTXbIRm8n4-nA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrhedugdekiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrd
 ekledrieekrdejieenucevlhhushhtvghrufhiiigvpeejkeenucfrrghrrghmpehmrghi
 lhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:sgejXkbY9XQypNzgK9IpeT_Tm5PGubRcTQoBh9ZB-9idbWYebwfFuA>
 <xmx:sgejXmJKR0SPzYWNfHPOKA4w2peSAsU7Z0YGFqitE53RbuASN3mSyA>
 <xmx:sgejXguYOuD_j_nGh47-N0WtGZzA74pHtz7BUdkTafIoC5vOtrnsyQ>
 <xmx:sgejXrEfSKKYoqdKG17W5FWVZTECdT9ccHWlewrlmms9ANXXkDmz93hYnqc>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1877F3280064;
 Fri, 24 Apr 2020 11:37:22 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v2 86/91] drm/vc4: hdmi: Reset audio infoframe on
 encoder_enable if previously streaming
Date: Fri, 24 Apr 2020 17:35:07 +0200
Message-Id: <b91d9f9de4a55d8bba5bcce4ae2b35ac6b94dfca.1587742492.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech>
References: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 24 Apr 2020 20:08:26 +0000
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

If the encoder is disabled and re-enabled (eg mode change) all infoframes
are reset, whilst the audio subsystem know nothing about this change.
The driver therefore needs to reinstate the audio infoframe for
itself.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 12 ++++++++++++
 drivers/gpu/drm/vc4/vc4_hdmi.h |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 07304d156eeb..cac55386236f 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -310,8 +310,16 @@ static void vc4_hdmi_set_audio_infoframe(struct drm_encoder *encoder)
 
 static void vc4_hdmi_set_infoframes(struct drm_encoder *encoder)
 {
+	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
+
 	vc4_hdmi_set_avi_infoframe(encoder);
 	vc4_hdmi_set_spd_infoframe(encoder);
+	/*
+	 * If audio was streaming, then we need to reenabled the audio
+	 * infoframe here during encoder_enable.
+	 */
+	if (vc4_hdmi->audio.streaming)
+		vc4_hdmi_set_audio_infoframe(encoder);
 }
 
 static void vc4_hdmi_encoder_disable(struct drm_encoder *encoder)
@@ -696,6 +704,7 @@ static void vc4_hdmi_audio_reset(struct vc4_hdmi *vc4_hdmi)
 	struct device *dev = &vc4_hdmi->pdev->dev;
 	int ret;
 
+	vc4_hdmi->audio.streaming = false;
 	ret = vc4_hdmi_stop_packet(encoder, HDMI_INFOFRAME_TYPE_AUDIO);
 	if (ret)
 		dev_err(dev, "Failed to stop audio infoframe: %d\n", ret);
@@ -799,6 +808,7 @@ static int vc4_hdmi_audio_trigger(struct snd_pcm_substream *substream, int cmd,
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 		vc4_hdmi_set_audio_infoframe(encoder);
+		vc4_hdmi->audio.streaming = true;
 
 		if (vc4_hdmi->variant->phy_rng_enable)
 			vc4_hdmi->variant->phy_rng_enable(vc4_hdmi);
@@ -817,6 +827,8 @@ static int vc4_hdmi_audio_trigger(struct snd_pcm_substream *substream, int cmd,
 		if (vc4_hdmi->variant->phy_rng_disable)
 			vc4_hdmi->variant->phy_rng_disable(vc4_hdmi);
 
+		vc4_hdmi->audio.streaming = false;
+
 		break;
 	default:
 		break;
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 9a6831b941d9..eb0f91b57316 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -85,6 +85,8 @@ struct vc4_hdmi_audio {
 	int channels;
 	struct snd_dmaengine_dai_dma_data dma_data;
 	struct snd_pcm_substream *substream;
+
+	bool streaming;
 };
 
 /* General HDMI hardware state. */
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
