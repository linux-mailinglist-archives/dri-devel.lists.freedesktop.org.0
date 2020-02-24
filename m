Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 357F416A2B9
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 10:40:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 587156E398;
	Mon, 24 Feb 2020 09:39:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C03E6E1D8
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 09:10:20 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 502D4643;
 Mon, 24 Feb 2020 04:10:19 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 24 Feb 2020 04:10:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=Q7poj5xWN6AzN
 TjjPFs4k90q/KRpUg8GyZ9jiP0nuXM=; b=jsyWhCuQxO1tJPG2gVPWEzqkbPCjC
 fZe+klLtanXwyjp0JJfojVxM6J4lOy90Rnqa8IdYDPO9Y6ljcAImnSTHh+7WjFM/
 HW7umzkuTF7mBjc7AYtfWRElJ2uyzbiI4UIzZv4iPGqfKzOvHOIp94Y89Z4GlOpj
 rqa0J9Tmoh+IFr0AbG/qHRrlNr/Rl20FgKIehnwrj93nw5uVI6LKsaCqeVqSIEMw
 E5BEcEjrDjgLvzwWVEHSX96obVMhpYNn4MpiIp4W0kuyN/PRsjCblnlZ0lV6NB8m
 TgAoiDOOpf9VEBX4UkW+yeAAkeusVATg6RKpSG9sMN5vtRNCXvKvrmZcA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=Q7poj5xWN6AzNTjjPFs4k90q/KRpUg8GyZ9jiP0nuXM=; b=aQGTHifL
 fdCu5sNWE+8UQ46BheHST35KROVFnbcvAprGGiIbTWHN9jHGlxbKqlFXCEsh63az
 l4yufUzEIS+zI4gl37GPZ7kskj4oRDvJST6bSlBB569ExdXnJq1b+SchKkI4tUWj
 ZvXI5q5yTAexZsbyDEwcqvsP6qfjPHoNKj0KoiGgnQeKeDnOr4gpX3EL0MV6hKZj
 1YHQdiLGzLhRDdK7G91PelahYgm3QXg0W0ZV51YO6PRJlyR9pG8SXQLGP+RO9xza
 2lrXra1YXR6cwXkdwhz3vy5xc/XOnNS5G14QKr0mzXPx/4Ra/r9d0SCN19dLjpjx
 xEij/bhKWrGgMg==
X-ME-Sender: <xms:-pJTXsYwwbLabRzXDbuNt7RbfzNRFGzE_sh4e05B_-lDvpJvJf6Mng>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrledtucetufdoteggodetrfdotffvucfrrh
 hofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgenuceurghi
 lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
 ephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcutfhi
 phgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltddrkeelrd
 eikedrjeeinecuvehluhhsthgvrhfuihiivgephedvnecurfgrrhgrmhepmhgrihhlfhhr
 ohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:-pJTXs6e-gB3TcyUvJIbP4j2CqIdEToQjxyy-1fZN4_hXRsjiPcIgg>
 <xmx:-pJTXpobzbn1flBAhg4BEMjYTbkkYAEQLVM-NeRtkE3zxWhdFV2uJA>
 <xmx:-pJTXkCcR2HzziambQsJHlL-HZuwWS1O7sPj57DtNHovZZv195h-pw>
 <xmx:-pJTXseu2jP7aEdfntSeX9MCMhkyI77yisbbtPg1gCi6e_zVoSmvOZn9aKA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 76C4D328005D;
 Mon, 24 Feb 2020 04:10:18 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH 62/89] drm/vc4: hdmi: Move structure to header
Date: Mon, 24 Feb 2020 10:07:04 +0100
Message-Id: <6a5d6a5ea93da19fb4484e188f7b62c60006a901.1582533919.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
References: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 24 Feb 2020 09:39:03 +0000
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

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 76 +-------------------------------
 drivers/gpu/drm/vc4/vc4_hdmi.h | 86 +++++++++++++++++++++++++++++++++++-
 2 files changed, 87 insertions(+), 75 deletions(-)
 create mode 100644 drivers/gpu/drm/vc4/vc4_hdmi.h

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 7fad602217c1..a31fdf1dc6cf 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -48,87 +48,13 @@
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
