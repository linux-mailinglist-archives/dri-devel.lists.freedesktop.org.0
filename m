Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1C8219952
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 09:07:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 309896EA14;
	Thu,  9 Jul 2020 07:05:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3DA889C88
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 17:43:28 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id BAAAD2F2;
 Wed,  8 Jul 2020 13:43:27 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 08 Jul 2020 13:43:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=36amJ90GA7/BE
 JEIivplraKXPNZreK344q/SCuKeQWg=; b=JLRDaBb1teDjonWV79f7dgv+G27o1
 5UyjFRFhPlCymrlDT/fSXl99+ypd01X+QLgtFqdqllNLUqqKkI6Y4EEJ9036sycr
 UJdyPBFw20QgLi/81FeHDNFC3LShEy7A3/Badp0/ynKCVgi7sWPD7k5ohtN6RmUy
 rVHFejniq1yrBpV7S9sxQxM4Pk7nw6UjW8Yi1o5KaAtumz1JO2Pspdwoer1jDWh0
 V4iuBupifKo2nWfDtGkIGV29eL4s93Y2SdIXo4pmXwxjCLg1Xqui+f0OSdVTDrem
 ewdLAWyg0u5krbP032k3R551pAFtAxOo7SgZHooyEue5AbOtDXe2qiSVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=36amJ90GA7/BEJEIivplraKXPNZreK344q/SCuKeQWg=; b=mMgkD3U2
 +PIgbNZhUB1i1lxRRr0bY64Jpip2M00WbpWRClBQhiUYEiXD6ML2Ycc7slzrlpoP
 MGzPRxBHJKZj0HHf+bd3nTAi8iGcWEaBSHBZOO4ZRxzJIfByBITH/XOphahO2wL2
 2O+IRUzxQNBtPY7hO7QY9cz43wYN9qv6F2HZng3gqOBxgALMNwinxxwtTkCWgXj2
 JzqBDPdgtIeiRqbwnxwnI0zy8bxsGEoT4D6ZfD904t9I+CzflVJx+dKAZLxoeJ6M
 eiqaPLmtIkoguiSOfMVGm9Nz4RzPR/TuyYaBLDf0EJMANJ0YIFLwNswUUwmz9LL5
 V2V7PD9BnDfJrQ==
X-ME-Sender: <xms:vwUGX1TjOHzB8L0S8N7CboKmDcPRLZ3bg0NSpo4fj-ciQBPpcaVeQw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudejgdduudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepfeeine
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:vwUGX-xe3LEWn8_rd2_vArxmhMHrEb5qbEStdNc5btyEYG3_xAI7Ng>
 <xmx:vwUGX63KDNnKp2ctCgcBTR9BCTyw7FRjuVPb0PvvheCoP-ufwcdhWQ>
 <xmx:vwUGX9Al6QqO25Ymqc_HlIkQa3Ic-EKnp-EYW-xVGmXkzNltwZINPA>
 <xmx:vwUGXyh8C1chSv8_HZTEtlv9um_-FRE6xNw9IRkumX3dqzdQxZsBBE25I9s>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 06A35306005F;
 Wed,  8 Jul 2020 13:43:26 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v4 39/78] drm/vc4: hdmi: Move structure to header
Date: Wed,  8 Jul 2020 19:41:47 +0200
Message-Id: <6070ac45cd27d6b551aafc3bc67f78987a43a47f.1594230107.git-series.maxime@cerno.tech>
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

We will need to share the vc4_hdmi and related structures with multiple
files, so let's create a header for it.

Reviewed-by: Eric Anholt <eric@anholt.net>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 76 +-------------------------------
 drivers/gpu/drm/vc4/vc4_hdmi.h | 86 +++++++++++++++++++++++++++++++++++-
 2 files changed, 87 insertions(+), 75 deletions(-)
 create mode 100644 drivers/gpu/drm/vc4/vc4_hdmi.h

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index f6b4a05a7d96..db79e0d88625 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -49,87 +49,13 @@
 #include <sound/soc.h>
 #include "media/cec.h"
 #include "vc4_drv.h"
+#include "vc4_hdmi.h"
 #include "vc4_regs.h"
 
 #define HSM_CLOCK_FREQ 163682864
 #define CEC_CLOCK_FREQ 40000
 #define CEC_CLOCK_DIV  (HSM_CLOCK_FREQ / CEC_CLOCK_FREQ)
 
-/* HDMI audio information */
-struct vc4_hdmi_audio {
-	struct snd_soc_card card;
-	struct snd_soc_dai_link link;
-	struct snd_soc_dai_link_component cpu;
-	struct snd_soc_dai_link_component codec;
-	struct snd_soc_dai_link_component platform;
-	int samplerate;
-	int channels;
-	struct snd_dmaengine_dai_dma_data dma_data;
-	struct snd_pcm_substream *substream;
-};
-
-/* General HDMI hardware state. */
-struct vc4_hdmi {
-	struct platform_device *pdev;
-
-	struct drm_encoder *encoder;
-	struct drm_connector *connector;
-
-	struct vc4_hdmi_audio audio;
-
-	struct i2c_adapter *ddc;
-	void __iomem *hdmicore_regs;
-	void __iomem *hd_regs;
-	int hpd_gpio;
-	bool hpd_active_low;
-
-	struct cec_adapter *cec_adap;
-	struct cec_msg cec_rx_msg;
-	bool cec_tx_ok;
-	bool cec_irq_was_rx;
-
-	struct clk *pixel_clock;
-	struct clk *hsm_clock;
-
-	struct debugfs_regset32 hdmi_regset;
-	struct debugfs_regset32 hd_regset;
-};
-
-#define HDMI_READ(offset) readl(vc4->hdmi->hdmicore_regs + offset)
-#define HDMI_WRITE(offset, val) writel(val, vc4->hdmi->hdmicore_regs + offset)
-#define HD_READ(offset) readl(vc4->hdmi->hd_regs + offset)
-#define HD_WRITE(offset, val) writel(val, vc4->hdmi->hd_regs + offset)
-
-/* VC4 HDMI encoder KMS struct */
-struct vc4_hdmi_encoder {
-	struct vc4_encoder base;
-	bool hdmi_monitor;
-	bool limited_rgb_range;
-};
-
-static inline struct vc4_hdmi_encoder *
-to_vc4_hdmi_encoder(struct drm_encoder *encoder)
-{
-	return container_of(encoder, struct vc4_hdmi_encoder, base.base);
-}
-
-/* VC4 HDMI connector KMS struct */
-struct vc4_hdmi_connector {
-	struct drm_connector base;
-
-	/* Since the connector is attached to just the one encoder,
-	 * this is the reference to it so we can do the best_encoder()
-	 * hook.
-	 */
-	struct drm_encoder *encoder;
-};
-
-static inline struct vc4_hdmi_connector *
-to_vc4_hdmi_connector(struct drm_connector *connector)
-{
-	return container_of(connector, struct vc4_hdmi_connector, base);
-}
-
 static const struct debugfs_reg32 hdmi_regs[] = {
 	VC4_REG32(VC4_HDMI_CORE_REV),
 	VC4_REG32(VC4_HDMI_SW_RESET_CONTROL),
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
new file mode 100644
index 000000000000..5ec5d1f6b1e6
--- /dev/null
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -0,0 +1,86 @@
+#ifndef _VC4_HDMI_H_
+#define _VC4_HDMI_H_
+
+#include <drm/drm_connector.h>
+#include <media/cec.h>
+#include <sound/dmaengine_pcm.h>
+#include <sound/soc.h>
+
+#include "vc4_drv.h"
+
+/* HDMI audio information */
+struct vc4_hdmi_audio {
+	struct snd_soc_card card;
+	struct snd_soc_dai_link link;
+	struct snd_soc_dai_link_component cpu;
+	struct snd_soc_dai_link_component codec;
+	struct snd_soc_dai_link_component platform;
+	int samplerate;
+	int channels;
+	struct snd_dmaengine_dai_dma_data dma_data;
+	struct snd_pcm_substream *substream;
+};
+
+/* General HDMI hardware state. */
+struct vc4_hdmi {
+	struct platform_device *pdev;
+
+	struct drm_encoder *encoder;
+	struct drm_connector *connector;
+
+	struct vc4_hdmi_audio audio;
+
+	struct i2c_adapter *ddc;
+	void __iomem *hdmicore_regs;
+	void __iomem *hd_regs;
+	int hpd_gpio;
+	bool hpd_active_low;
+
+	struct cec_adapter *cec_adap;
+	struct cec_msg cec_rx_msg;
+	bool cec_tx_ok;
+	bool cec_irq_was_rx;
+
+	struct clk *pixel_clock;
+	struct clk *hsm_clock;
+
+	struct debugfs_regset32 hdmi_regset;
+	struct debugfs_regset32 hd_regset;
+};
+
+#define HDMI_READ(offset) readl(vc4->hdmi->hdmicore_regs + offset)
+#define HDMI_WRITE(offset, val) writel(val, vc4->hdmi->hdmicore_regs + offset)
+#define HD_READ(offset) readl(vc4->hdmi->hd_regs + offset)
+#define HD_WRITE(offset, val) writel(val, vc4->hdmi->hd_regs + offset)
+
+/* VC4 HDMI encoder KMS struct */
+struct vc4_hdmi_encoder {
+	struct vc4_encoder base;
+	bool hdmi_monitor;
+	bool limited_rgb_range;
+};
+
+static inline struct vc4_hdmi_encoder *
+to_vc4_hdmi_encoder(struct drm_encoder *encoder)
+{
+	return container_of(encoder, struct vc4_hdmi_encoder, base.base);
+}
+
+/* VC4 HDMI connector KMS struct */
+struct vc4_hdmi_connector {
+	struct drm_connector base;
+
+	/* Since the connector is attached to just the one encoder,
+	 * this is the reference to it so we can do the best_encoder()
+	 * hook.
+	 */
+	struct drm_encoder *encoder;
+};
+
+static inline struct vc4_hdmi_connector *
+to_vc4_hdmi_connector(struct drm_connector *connector)
+{
+	return container_of(connector, struct vc4_hdmi_connector, base);
+}
+
+#endif /* _VC4_HDMI_H_ */
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
