Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C0525D1CF
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 09:11:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92EAF6EA8A;
	Fri,  4 Sep 2020 07:11:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 203426E45D
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 08:02:50 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id E54A5CC1;
 Thu,  3 Sep 2020 04:02:48 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 03 Sep 2020 04:02:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=0YrB6rCm671h0
 yLZx7r8Z0z/1nMccwPir+vxSkZxMfw=; b=gxOvJ0XcojnSeRKOGvKbWcNy+fYt9
 EsZBgZhHwzKd1t4FWhARs2p69Rv8umw6gDj7i7BEqoUUZn4HWkfUoovIg7E5TRM9
 qlsFyatA42It6hJ2eYOSGkqZayk8uhm1uKKvEm6YhaK0d1VgoNoPpiZ18DWdZk8g
 JMsMFdtqahC/RbZaUcjiK6X5gw06moTMHWdva4ZpbHz7PCeEMdMoawv3AiR8iWBf
 sbIAyYRlqiBY1rX5K4ICeuHa7BW2qsbqSimrnJktrnjkJD5Lh15/1h1aD/Yp/9R6
 R71H0hq7yw1uC5fVgxrQXlzt8kkyIkwXWoSCW3wlDq/vn8HOTve+M333Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=0YrB6rCm671h0yLZx7r8Z0z/1nMccwPir+vxSkZxMfw=; b=ST2CoW7F
 3GwvsYYvJx/1RIPmiAq4LEcCTYUW+oXoTvyaUw+yPqnwv58eoysz8uri9dYDmBWk
 RxF0dGAKOwmRbNGhWZ4QM5kElU69is+VsZqIw/7+ZbqPGBEvSfebTyBVQpIpUnyo
 IkAf6ED7NpVuT0fxGoWa3O22HB8RaCI24Zi+GUDdKhdFWxdLQhvd004/lnf+7LfB
 qsTYKFVZPaTXh1l8XTUX2gJRBsKi5icwAeQ80qhSrjOIKaxOPwRO8jgs0NNwGfsW
 DFXp6SuTx6YRZrP5sWpPfHzEkdmw098DqS92kK699zSRgETMygOMCeFA2dwnvisl
 RBArZvlEV+ObNg==
X-ME-Sender: <xms:KKNQXzC0onf1VdpjaDOm2HHeOJgMEGs4jYQAGL8nfUEMBbmLA-V69A>
 <xme:KKNQX5j0XyI0gwBNSEpGtYCfHsl0yxSGXtya6d4GU1Agev8J9A9roYyzBf9_yxxMP
 qrRJ5-4wEcLA-OqD5g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudegtddguddviecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveev
 heehvdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpeefie
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:KKNQX-kMHBwnf8AM7gt__PVc_VgnD97BJoZHxp1IwKZyxor4aqtKPw>
 <xmx:KKNQX1xBOmWvcQLAsHitg9s0A5_q75U5VKJxTdPjsF97c21XopQTng>
 <xmx:KKNQX4RAmrWWSN9jmoOKdEx_frKRZRSWBeVPk4YsKoh77oh-XDyJEQ>
 <xmx:KKNQX8bsjErHzmk9N0IRBi-rxBtPf2UIktHZT8_r8Uz1cjQscWc78QTZpCw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 003C73060060;
 Thu,  3 Sep 2020 04:02:47 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v5 39/80] drm/vc4: hdmi: Move structure to header
Date: Thu,  3 Sep 2020 10:01:11 +0200
Message-Id: <db3ff2babc914e38e86f794c4e49128697aed887.1599120059.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.dddc064d8bb83e46744336af67dcb13139e5747d.1599120059.git-series.maxime@cerno.tech>
References: <cover.dddc064d8bb83e46744336af67dcb13139e5747d.1599120059.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 04 Sep 2020 07:11:29 +0000
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hoegeun Kwon <hoegeun.kwon@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We will need to share the vc4_hdmi and related structures with multiple
files, so let's create a header for it.

Reviewed-by: Eric Anholt <eric@anholt.net>
Tested-by: Chanwoo Choi <cw00.choi@samsung.com>
Tested-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Tested-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 76 +-------------------------------
 drivers/gpu/drm/vc4/vc4_hdmi.h | 86 +++++++++++++++++++++++++++++++++++-
 2 files changed, 87 insertions(+), 75 deletions(-)
 create mode 100644 drivers/gpu/drm/vc4/vc4_hdmi.h

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index ae8c4d53e239..5c4d2fee6b86 100644
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
