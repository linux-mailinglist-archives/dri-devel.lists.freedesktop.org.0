Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4171E59A8
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 09:46:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BC826E4A6;
	Thu, 28 May 2020 07:44:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54D4C6E339
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 15:51:07 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id BD9C55820F2;
 Wed, 27 May 2020 11:51:06 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 27 May 2020 11:51:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=YQuZyoxBv8vu5
 49NTT4wHZ6thTXny0W7gxB64WBauFs=; b=NAT2GKyHhhBLeBhG4ns9/NmJBhPLO
 sdVW3NsynoM49ui3KNkpPlTlNRg0pCpkKmaq2+eCVoWanpqMUuWBsAolNbHamtbh
 yCcLtyK+fh34lVmy4lAxIigmiS+o4c/xzSozirZofcDn3S3crebxeRTYjvorZbZc
 xmgYF/O3H/JlntrNKTvdToFIaxXGpZQ8QUJLzvFCvh1nY+Jh86LlWDwThDK+ECat
 gXHetG9ZsHUweLz/xGH+XJHU6ynhgAnLvwk+TKQH0ugorCvGqB9EzxN46oupC2es
 hlCYOxbUocp+CT+zLzaT+ELmYMWs0WiyCblpnuUGy91hY2CLoMbkoserQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=YQuZyoxBv8vu549NTT4wHZ6thTXny0W7gxB64WBauFs=; b=jp4khL+i
 DXon+XPeDxE4OcA9K0rOLM5/LJzKGub5nvlL7HC5oVJHyAQyLFqkxZiq49Nc3QHQ
 /hEHiTfp79Q746Oyjek+P+A4HeRpcrIAkXInMpKkrxZ5nV7vAFz5hceBEa26960T
 YT56KoKaoFccmiyDtcDEdiNX+eXk7cR4LMc6ORTx30CQiEI58Jt+xHVPnmfSBAR3
 qmKM7zNcCswd2sPJBRf6AFhux4xx+MBqp5eNjTScygLEJfhN8yac3VEtg+t3m3/I
 RAMTqJV2yKwI/zrbvqlzdPke+g12+wUxfl4mJj1EO/ZP5uysuusP9xnU5mPnovBo
 koTEAu/DeUMKlw==
X-ME-Sender: <xms:aozOXoydMd5l_qjs55pduftCZZ-bDbqyDxzYvubUlags9yRYTkDqYw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddvgedgkeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepgeekne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:aozOXsT4sRsC16QZ1KUxR3f9Ck_dzz_12ngK0pt6x9u9IN6TiHXXug>
 <xmx:aozOXqVbV_SCW23dfUmvhk_BqcDPBRcgQgU0rJmYWN-QxZcDBWVZ6Q>
 <xmx:aozOXmivh1wrB0_r4oj9_TuSp1oxDEmE4U_Qqw7CAoWnHwjdKGRtBg>
 <xmx:aozOXgA8W5f03kATEsP5ifc9F_zGpatRqYzZDB22oh9AMpU6NjJInQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5A5EF30618B7;
 Wed, 27 May 2020 11:51:06 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v3 069/105] drm/vc4: hdmi: Move structure to header
Date: Wed, 27 May 2020 17:48:39 +0200
Message-Id: <4c4da3823e4d1a8189e96a59a79451fff372f70b.1590594512.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
References: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 28 May 2020 07:43:50 +0000
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
index 38fe942a327b..41573fca5a40 100644
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
