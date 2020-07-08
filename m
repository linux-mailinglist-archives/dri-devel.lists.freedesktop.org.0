Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A446221992B
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 09:06:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D840B6E9EC;
	Thu,  9 Jul 2020 07:05:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87F6A89D39
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 17:43:34 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 93C162F3;
 Wed,  8 Jul 2020 13:43:33 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 08 Jul 2020 13:43:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=xjRAKYXJlr75H
 eNKtRmO3ag0JBfeTFTn89R8oF4KPXc=; b=jWGhCJXwHCSYRqd+P9U6bViCBINP7
 wVeDSJPPvCSlCHZygc2auYq1+fCAV6p37V6KqNFlaQjmJzQsYdpMseGjtAji7Xas
 41SpfMqcQ80WX5KefXrTy5iN1r0zcXH7pQ7NVgBw3wY+O/KlIPe7zso4TL8xcfMu
 ZxAiMurrC7QKZGu3h4rUAqSE2FevJLXD4YtPwewKxEUVUKVVP+qgN4kLXcJrEflD
 a0eZPU7mOzPgH+fF8NU+HZgscN9YVs0jUEBzlvxX4dFhhAoFVDeylDd6oa95P674
 5924Ug8QCZqJWKYhP9pOPBIAQaUGPltvm2l16PsdVrNnws1ev18KW3zvg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=xjRAKYXJlr75HeNKtRmO3ag0JBfeTFTn89R8oF4KPXc=; b=kZHHYt5V
 r0jKncpdfBaCzR4CBOciY62HWdncGY+VymKC67Z82yJHaMP+4WO5l8yEHA8pxWAe
 eiCSlklhkOO8FZ6s/SEFBv9KGHzMlVSePckYrZMmIqe8uKxHm17X6JaR/3JnjwqZ
 k3zld9tEfdw/a9EHgCvH6YKgKiOl0E4TK99KKhJj68cLGp5KfqFobSfgoCrn0agB
 Ru8gDMR05nqiTtYnz5PlrFWRvujqPY0kiYW9Ft7eZ6oWho2NG+YTyqKazjMLoDA/
 R6gVKSJs0lBpPIdz/MCH+IArwvQbzZfsPDB2zbiOp2Fo5iHmyC0YQY25pG700Oq/
 wQ5L9BbF/NJdyw==
X-ME-Sender: <xms:xQUGXz-XMPz2Jf3a725DUHlB7r0cZG1F3eW4_owlbu5lwfOUMLiilg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudejgdduudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepfeelne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:xQUGX_sbnWA4vuqvTWB5Vf0Y0iS7GrnKqGJS_so-ipLeAGfdTLKdzg>
 <xmx:xQUGXxDEzLbD5IPacq5aDy8oSuvFTh3AZk4UhQSRe-LUET_ztfwy0w>
 <xmx:xQUGX_dG-bBuB3KboGVQ37WXFWzefzI8YaHJwMwtju8khZlgSPU3JA>
 <xmx:xQUGX_eaQYKYjJDTKNxcsOZ8e2lg-fOZse8qDGmd80q2p1zhRxPoxv-4z0M>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id CEC70306005F;
 Wed,  8 Jul 2020 13:43:32 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v4 43/78] drm/vc4: hdmi: Move accessors to vc4_hdmi
Date: Wed,  8 Jul 2020 19:41:51 +0200
Message-Id: <a1482fbb46efce4f453cb0919efa8e3c2714a515.1594230107.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
References: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 09 Jul 2020 07:05:03 +0000
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

The current driver only supports a single HDMI controller, and part of
the issue is that the main vc4_dev structure holds a pointer to its
(only) HDMI controller, and the HDMI registers accessors will use it to
retrieve the mapped addresses.

Let's modify those accessors to use directly the vc4_hdmi structure so
that we can eventually get rid of that single global pointer.

Reviewed-by: Eric Anholt <eric@anholt.net>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 22 ++++++++--------------
 drivers/gpu/drm/vc4/vc4_hdmi.h |  8 ++++----
 2 files changed, 12 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 5b7202f97883..8955b0cf76ed 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -123,6 +123,7 @@ vc4_hdmi_connector_detect(struct drm_connector *connector, bool force)
 {
 	struct drm_device *dev = connector->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
+	struct vc4_hdmi *vc4_hdmi = vc4->hdmi;
 
 	if (vc4->hdmi->hpd_gpio) {
 		if (gpio_get_value_cansleep(vc4->hdmi->hpd_gpio) ^
@@ -230,6 +231,7 @@ static int vc4_hdmi_stop_packet(struct drm_encoder *encoder,
 {
 	struct drm_device *dev = encoder->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
+	struct vc4_hdmi *vc4_hdmi = vc4->hdmi;
 	u32 packet_id = type - 0x80;
 
 	HDMI_WRITE(VC4_HDMI_RAM_PACKET_CONFIG,
@@ -244,6 +246,7 @@ static void vc4_hdmi_write_infoframe(struct drm_encoder *encoder,
 {
 	struct drm_device *dev = encoder->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
+	struct vc4_hdmi *vc4_hdmi = vc4->hdmi;
 	u32 packet_id = frame->any.type - 0x80;
 	u32 packet_reg = VC4_HDMI_RAM_PACKET(packet_id);
 	uint8_t buffer[VC4_HDMI_PACKET_STRIDE];
@@ -623,9 +626,6 @@ static const struct drm_encoder_helper_funcs vc4_hdmi_encoder_helper_funcs = {
 /* HDMI audio codec callbacks */
 static void vc4_hdmi_audio_set_mai_clock(struct vc4_hdmi *vc4_hdmi)
 {
-	struct drm_encoder *encoder = &vc4_hdmi->encoder.base.base;
-	struct drm_device *drm = encoder->dev;
-	struct vc4_dev *vc4 = to_vc4_dev(drm);
 	u32 hsm_clock = clk_get_rate(vc4_hdmi->hsm_clock);
 	unsigned long n, m;
 
@@ -645,8 +645,6 @@ static void vc4_hdmi_set_n_cts(struct vc4_hdmi *vc4_hdmi)
 {
 	struct drm_encoder *encoder = &vc4_hdmi->encoder.base.base;
 	struct drm_crtc *crtc = encoder->crtc;
-	struct drm_device *drm = encoder->dev;
-	struct vc4_dev *vc4 = to_vc4_dev(drm);
 	const struct drm_display_mode *mode = &crtc->state->adjusted_mode;
 	u32 samplerate = vc4_hdmi->audio.samplerate;
 	u32 n, cts;
@@ -683,7 +681,6 @@ static int vc4_hdmi_audio_startup(struct snd_pcm_substream *substream,
 	struct vc4_hdmi *vc4_hdmi = dai_to_hdmi(dai);
 	struct drm_encoder *encoder = &vc4_hdmi->encoder.base.base;
 	struct drm_connector *connector = &vc4_hdmi->connector.base;
-	struct vc4_dev *vc4 = to_vc4_dev(encoder->dev);
 	int ret;
 
 	if (vc4_hdmi->audio.substream && vc4_hdmi->audio.substream != substream)
@@ -714,9 +711,7 @@ static int vc4_hdmi_audio_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 static void vc4_hdmi_audio_reset(struct vc4_hdmi *vc4_hdmi)
 {
 	struct drm_encoder *encoder = &vc4_hdmi->encoder.base.base;
-	struct drm_device *drm = encoder->dev;
 	struct device *dev = &vc4_hdmi->pdev->dev;
-	struct vc4_dev *vc4 = to_vc4_dev(drm);
 	int ret;
 
 	ret = vc4_hdmi_stop_packet(encoder, HDMI_INFOFRAME_TYPE_AUDIO);
@@ -747,10 +742,7 @@ static int vc4_hdmi_audio_hw_params(struct snd_pcm_substream *substream,
 				    struct snd_soc_dai *dai)
 {
 	struct vc4_hdmi *vc4_hdmi = dai_to_hdmi(dai);
-	struct drm_encoder *encoder = &vc4_hdmi->encoder.base.base;
-	struct drm_device *drm = encoder->dev;
 	struct device *dev = &vc4_hdmi->pdev->dev;
-	struct vc4_dev *vc4 = to_vc4_dev(drm);
 	u32 audio_packet_config, channel_mask;
 	u32 channel_map, i;
 
@@ -821,8 +813,6 @@ static int vc4_hdmi_audio_trigger(struct snd_pcm_substream *substream, int cmd,
 {
 	struct vc4_hdmi *vc4_hdmi = dai_to_hdmi(dai);
 	struct drm_encoder *encoder = &vc4_hdmi->encoder.base.base;
-	struct drm_device *drm = encoder->dev;
-	struct vc4_dev *vc4 = to_vc4_dev(drm);
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
@@ -1083,7 +1073,8 @@ static irqreturn_t vc4_cec_irq_handler_thread(int irq, void *priv)
 
 static void vc4_cec_read_msg(struct vc4_dev *vc4, u32 cntrl1)
 {
-	struct cec_msg *msg = &vc4->hdmi->cec_rx_msg;
+	struct vc4_hdmi *vc4_hdmi = vc4->hdmi;
+	struct cec_msg *msg = &vc4_hdmi->cec_rx_msg;
 	unsigned int i;
 
 	msg->len = 1 + ((cntrl1 & VC4_HDMI_CEC_REC_WRD_CNT_MASK) >>
@@ -1129,6 +1120,7 @@ static irqreturn_t vc4_cec_irq_handler(int irq, void *priv)
 static int vc4_hdmi_cec_adap_enable(struct cec_adapter *adap, bool enable)
 {
 	struct vc4_dev *vc4 = cec_get_drvdata(adap);
+	struct vc4_hdmi *vc4_hdmi = vc4->hdmi;
 	/* clock period in microseconds */
 	const u32 usecs = 1000000 / CEC_CLOCK_FREQ;
 	u32 val = HDMI_READ(VC4_HDMI_CEC_CNTRL_5);
@@ -1172,6 +1164,7 @@ static int vc4_hdmi_cec_adap_enable(struct cec_adapter *adap, bool enable)
 static int vc4_hdmi_cec_adap_log_addr(struct cec_adapter *adap, u8 log_addr)
 {
 	struct vc4_dev *vc4 = cec_get_drvdata(adap);
+	struct vc4_hdmi *vc4_hdmi = vc4->hdmi;
 
 	HDMI_WRITE(VC4_HDMI_CEC_CNTRL_1,
 		   (HDMI_READ(VC4_HDMI_CEC_CNTRL_1) & ~VC4_HDMI_CEC_ADDR_MASK) |
@@ -1183,6 +1176,7 @@ static int vc4_hdmi_cec_adap_transmit(struct cec_adapter *adap, u8 attempts,
 				      u32 signal_free_time, struct cec_msg *msg)
 {
 	struct vc4_dev *vc4 = cec_get_drvdata(adap);
+	struct vc4_hdmi *vc4_hdmi = vc4->hdmi;
 	u32 val;
 	unsigned int i;
 
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 17079a39f1b1..cdc9d90f62ac 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -78,9 +78,9 @@ struct vc4_hdmi {
 	struct debugfs_regset32 hd_regset;
 };
 
-#define HDMI_READ(offset) readl(vc4->hdmi->hdmicore_regs + offset)
-#define HDMI_WRITE(offset, val) writel(val, vc4->hdmi->hdmicore_regs + offset)
-#define HD_READ(offset) readl(vc4->hdmi->hd_regs + offset)
-#define HD_WRITE(offset, val) writel(val, vc4->hdmi->hd_regs + offset)
+#define HDMI_READ(offset) readl(vc4_hdmi->hdmicore_regs + offset)
+#define HDMI_WRITE(offset, val) writel(val, vc4_hdmi->hdmicore_regs + offset)
+#define HD_READ(offset) readl(vc4_hdmi->hd_regs + offset)
+#define HD_WRITE(offset, val) writel(val, vc4_hdmi->hd_regs + offset)
 
 #endif /* _VC4_HDMI_H_ */
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
