Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF87402729
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 12:28:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE9D889DFD;
	Tue,  7 Sep 2021 10:28:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D48A89DA8
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Sep 2021 08:39:33 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id v10so13233693wrd.4
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Sep 2021 01:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fWFH+q1s5Q4ylY5bYRIggM+3UOzIYPXpbxDIy5K2J5c=;
 b=tzIFxi3eyBm+sC2DPzAIIIW+3WLUs2Pl/hiNjYmXk1wA9kFbF+Rf8b39S2UiEkWikD
 EMaUFRl/OW3UcI31kqQpEgetCjWvN9QQqVnzAESxuTno0mKlZu8/DL6PhorHLe/F6Gcc
 Oavtwn7zYp+LlZ6JrzYgWkxjfbXimWpx0YiXkm6bqJRrEqI/hlSGlwKyAcBFakv1xoCO
 Vv9RTtR2hmSOiIinYCqO7PARjgKVYnQNAYQ2yRpmMPJDrPgOohjcRlconiluqp8HzoPR
 KLV0cv7HrMAV/rGrKBTR/hUbVqNepZVXMRlv1JSRW3HcBVf6QxSPRKkSS1FyyCi1D+Y0
 Qztw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fWFH+q1s5Q4ylY5bYRIggM+3UOzIYPXpbxDIy5K2J5c=;
 b=aNGeB+D9L/E4y0jLh7Z5TBByF4EwRt6j5FlVgU5jB49oA8ff2fnPxZDPMRdU3ijS8O
 3OAIuQPjmBUMmqiVBhuQ0biuL0oGNbWogkeRNZBY+kRlkdeBu023gLAV3eoOFzNb4cNi
 0F7sbZOuHG4e3fuCR7R4Opd503pQW8zQzOL6aPuviatQoiAsPq7H+UjodBADOQX9Kp/l
 384mXdqcJTcNhIEQGf47R26rVuNOrve/2zO5cR5nmA9jA+5elke0eQWoj7Y+IIA3PmFW
 x3lsdmYbxaBqvBahKq0XFbzOIZeMJSlA7eNhcCqz9YuTL6mvuMVQNaVLjuObnxUdjX+X
 ax8Q==
X-Gm-Message-State: AOAM531uswhF5I/gFC+47MN052b+uuPsCXvXPVfWxNB1npTv8IZ9KX3O
 +q33Guc9nknaAdIXwsEnXYZfVQ==
X-Google-Smtp-Source: ABdhPJxX7SeM/XWciMAsSIz5V2TVMxS3PMvEjv9dCNSaxZEb0M7XHqcWSXCmkgLjkLCkr70U4GzWIw==
X-Received: by 2002:a5d:4647:: with SMTP id j7mr17625894wrs.149.1631003971096; 
 Tue, 07 Sep 2021 01:39:31 -0700 (PDT)
Received: from localhost.localdomain
 (2a02-8440-6141-3317-3074-96af-9642-0002.rev.sfr.net.
 [2a02:8440:6141:3317:3074:96af:9642:2])
 by smtp.gmail.com with ESMTPSA id m186sm1737027wme.48.2021.09.07.01.39.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 01:39:30 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
To: 
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 CK Hu <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH 2/4] drm/mediatek: add mt8195 hdmi TX support
Date: Tue,  7 Sep 2021 10:37:19 +0200
Message-Id: <20210907083723.7725-3-granquet@baylibre.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210907083723.7725-1-granquet@baylibre.com>
References: <20210907083723.7725-1-granquet@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 07 Sep 2021 10:28:27 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add basic hdmi TX support for the mediatek mt8195 SoCs

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
 drivers/gpu/drm/mediatek/Kconfig              |   10 +
 drivers/gpu/drm/mediatek/Makefile             |    4 +-
 drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.c    | 2413 +++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.h    |  147 +
 .../gpu/drm/mediatek/mtk_mt8195_hdmi_ddc.c    |  541 ++++
 .../gpu/drm/mediatek/mtk_mt8195_hdmi_ddc.h    |   20 +
 .../gpu/drm/mediatek/mtk_mt8195_hdmi_regs.h   |  276 ++
 7 files changed, 3410 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.h
 create mode 100644 drivers/gpu/drm/mediatek/mtk_mt8195_hdmi_ddc.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_mt8195_hdmi_ddc.h
 create mode 100644 drivers/gpu/drm/mediatek/mtk_mt8195_hdmi_regs.h

diff --git a/drivers/gpu/drm/mediatek/Kconfig b/drivers/gpu/drm/mediatek/Kconfig
index 2976d21e9a34..cda4672d29a7 100644
--- a/drivers/gpu/drm/mediatek/Kconfig
+++ b/drivers/gpu/drm/mediatek/Kconfig
@@ -28,3 +28,13 @@ config DRM_MEDIATEK_HDMI
 	select PHY_MTK_HDMI
 	help
 	  DRM/KMS HDMI driver for Mediatek SoCs
+
+config DRM_MEDIATEK_HDMI_SUSPEND_LOW_POWER
+	tristate "DRM HDMI SUSPEND LOW POWER Support for Mediatek SoCs"
+	depends on DRM_MEDIATEK_HDMI
+	help
+	  DRM/KMS HDMI SUSPEND_LOW_POWER for Mediatek SoCs.
+	  Choose this option if you want to disable/enable
+	  clock and power domain when platform enter suspend,
+	  and this config depends on DRM_MEDIATEK_HDMI.
+
diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
index 3abd27d7c91d..b86c860161ba 100644
--- a/drivers/gpu/drm/mediatek/Makefile
+++ b/drivers/gpu/drm/mediatek/Makefile
@@ -22,6 +22,8 @@ obj-$(CONFIG_DRM_MEDIATEK) += mediatek-drm.o
 
 mediatek-drm-hdmi-objs := mtk_cec.o \
 			  mtk_hdmi.o \
-			  mtk_hdmi_ddc.o
+			  mtk_hdmi_ddc.o \
+			  mtk_mt8195_hdmi.o \
+			  mtk_mt8195_hdmi_ddc.o \
 
 obj-$(CONFIG_DRM_MEDIATEK_HDMI) += mediatek-drm-hdmi.o
diff --git a/drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.c b/drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.c
new file mode 100644
index 000000000000..0dc1b7670186
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.c
@@ -0,0 +1,2413 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2019 MediaTek Inc.
+ */
+
+#include <linux/arm-smccc.h>
+#include <linux/delay.h>
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/mfd/syscon.h>
+#include <linux/of_platform.h>
+#include <linux/of.h>
+#include <linux/of_irq.h>
+#include <linux/of_gpio.h>
+#include <linux/of_graph.h>
+#include <linux/phy/phy.h>
+#include <linux/kthread.h>
+#include <linux/timer.h>
+#include <linux/pm_wakeup.h>
+
+#include <drm/drm_scdc_helper.h>
+#include <drm/drm_displayid.h>
+#include <drm/drm_probe_helper.h>
+#include <drm/drm_edid.h>
+
+#include "mtk_drm_crtc.h"
+#include "mtk_mt8195_hdmi_ddc.h"
+#include "mtk_mt8195_hdmi.h"
+#include "mtk_mt8195_hdmi_regs.h"
+
+#include <linux/debugfs.h>
+
+enum hdmi_aud_input_type {
+	HDMI_AUD_INPUT_I2S = 0,
+	HDMI_AUD_INPUT_SPDIF,
+};
+
+enum hdmi_aud_i2s_fmt {
+	HDMI_I2S_MODE_RJT_24BIT = 0,
+	HDMI_I2S_MODE_RJT_16BIT,
+	HDMI_I2S_MODE_LJT_24BIT,
+	HDMI_I2S_MODE_LJT_16BIT,
+	HDMI_I2S_MODE_I2S_24BIT,
+	HDMI_I2S_MODE_I2S_16BIT
+};
+
+enum hdmi_aud_mclk {
+	HDMI_AUD_MCLK_128FS,
+	HDMI_AUD_MCLK_192FS,
+	HDMI_AUD_MCLK_256FS,
+	HDMI_AUD_MCLK_384FS,
+	HDMI_AUD_MCLK_512FS,
+	HDMI_AUD_MCLK_768FS,
+	HDMI_AUD_MCLK_1152FS,
+};
+
+enum hdmi_aud_channel_type {
+	HDMI_AUD_CHAN_TYPE_1_0 = 0,
+	HDMI_AUD_CHAN_TYPE_1_1,
+	HDMI_AUD_CHAN_TYPE_2_0,
+	HDMI_AUD_CHAN_TYPE_2_1,
+	HDMI_AUD_CHAN_TYPE_3_0,
+	HDMI_AUD_CHAN_TYPE_3_1,
+	HDMI_AUD_CHAN_TYPE_4_0,
+	HDMI_AUD_CHAN_TYPE_4_1,
+	HDMI_AUD_CHAN_TYPE_5_0,
+	HDMI_AUD_CHAN_TYPE_5_1,
+	HDMI_AUD_CHAN_TYPE_6_0,
+	HDMI_AUD_CHAN_TYPE_6_1,
+	HDMI_AUD_CHAN_TYPE_7_0,
+	HDMI_AUD_CHAN_TYPE_7_1,
+	HDMI_AUD_CHAN_TYPE_3_0_LRS,
+	HDMI_AUD_CHAN_TYPE_3_1_LRS,
+	HDMI_AUD_CHAN_TYPE_4_0_CLRS,
+	HDMI_AUD_CHAN_TYPE_4_1_CLRS,
+	HDMI_AUD_CHAN_TYPE_6_1_CS,
+	HDMI_AUD_CHAN_TYPE_6_1_CH,
+	HDMI_AUD_CHAN_TYPE_6_1_OH,
+	HDMI_AUD_CHAN_TYPE_6_1_CHR,
+	HDMI_AUD_CHAN_TYPE_7_1_LH_RH,
+	HDMI_AUD_CHAN_TYPE_7_1_LSR_RSR,
+	HDMI_AUD_CHAN_TYPE_7_1_LC_RC,
+	HDMI_AUD_CHAN_TYPE_7_1_LW_RW,
+	HDMI_AUD_CHAN_TYPE_7_1_LSD_RSD,
+	HDMI_AUD_CHAN_TYPE_7_1_LSS_RSS,
+	HDMI_AUD_CHAN_TYPE_7_1_LHS_RHS,
+	HDMI_AUD_CHAN_TYPE_7_1_CS_CH,
+	HDMI_AUD_CHAN_TYPE_7_1_CS_OH,
+	HDMI_AUD_CHAN_TYPE_7_1_CS_CHR,
+	HDMI_AUD_CHAN_TYPE_7_1_CH_OH,
+	HDMI_AUD_CHAN_TYPE_7_1_CH_CHR,
+	HDMI_AUD_CHAN_TYPE_7_1_OH_CHR,
+	HDMI_AUD_CHAN_TYPE_7_1_LSS_RSS_LSR_RSR,
+	HDMI_AUD_CHAN_TYPE_6_0_CS,
+	HDMI_AUD_CHAN_TYPE_6_0_CH,
+	HDMI_AUD_CHAN_TYPE_6_0_OH,
+	HDMI_AUD_CHAN_TYPE_6_0_CHR,
+	HDMI_AUD_CHAN_TYPE_7_0_LH_RH,
+	HDMI_AUD_CHAN_TYPE_7_0_LSR_RSR,
+	HDMI_AUD_CHAN_TYPE_7_0_LC_RC,
+	HDMI_AUD_CHAN_TYPE_7_0_LW_RW,
+	HDMI_AUD_CHAN_TYPE_7_0_LSD_RSD,
+	HDMI_AUD_CHAN_TYPE_7_0_LSS_RSS,
+	HDMI_AUD_CHAN_TYPE_7_0_LHS_RHS,
+	HDMI_AUD_CHAN_TYPE_7_0_CS_CH,
+	HDMI_AUD_CHAN_TYPE_7_0_CS_OH,
+	HDMI_AUD_CHAN_TYPE_7_0_CS_CHR,
+	HDMI_AUD_CHAN_TYPE_7_0_CH_OH,
+	HDMI_AUD_CHAN_TYPE_7_0_CH_CHR,
+	HDMI_AUD_CHAN_TYPE_7_0_OH_CHR,
+	HDMI_AUD_CHAN_TYPE_7_0_LSS_RSS_LSR_RSR,
+	HDMI_AUD_CHAN_TYPE_8_0_LH_RH_CS,
+	HDMI_AUD_CHAN_TYPE_UNKNOWN = 0xFF
+};
+
+enum hdmi_aud_channel_swap_type {
+	HDMI_AUD_SWAP_LR,
+	HDMI_AUD_SWAP_LFE_CC,
+	HDMI_AUD_SWAP_LSRS,
+	HDMI_AUD_SWAP_RLS_RRS,
+	HDMI_AUD_SWAP_LR_STATUS,
+};
+
+struct hdmi_audio_param {
+	enum hdmi_audio_coding_type aud_codec;
+	enum hdmi_audio_sample_size aud_sampe_size;
+	enum hdmi_aud_input_type aud_input_type;
+	enum hdmi_aud_i2s_fmt aud_i2s_fmt;
+	enum hdmi_aud_mclk aud_mclk;
+	enum hdmi_aud_channel_type aud_input_chan_type;
+	struct hdmi_codec_params codec_params;
+};
+
+static const char *const mtk_hdmi_clk_names[MTK_HDMI_CLK_COUNT] = {
+	[MTK_HDMI_CLK_UNIVPLL_D6D4] = "univpll_d6_d4",
+	[MTK_HDMI_CLK_MSDCPLL_D2] = "msdcpll_d2",
+	[MTK_HDMI_CLK_HDMI_APB_SEL] = "hdmi_apb_sel",
+	[MTK_HDMI_UNIVPLL_D4D8] = "univpll_d4_d8",
+	[MTK_HDIM_HDCP_SEL] = "hdcp_sel",
+	[MTK_HDMI_HDCP_24M_SEL] = "hdcp24_sel",
+	[MTK_HDMI_VPP_SPLIT_HDMI] = "split_hdmi",
+};
+
+static inline struct mtk_hdmi *hdmi_ctx_from_bridge(struct drm_bridge *b)
+{
+	return container_of(b, struct mtk_hdmi, bridge);
+}
+
+static inline struct mtk_hdmi *hdmi_ctx_from_conn(struct drm_connector *c)
+{
+	return container_of(c, struct mtk_hdmi, conn);
+}
+
+static struct mtk_hdmi_ddc *hdmi_ddc_ctx_from_mtk_hdmi(struct mtk_hdmi *hdmi)
+{
+	return container_of(hdmi->ddc_adpt, struct mtk_hdmi_ddc, adap);
+}
+
+static u32 mtk_hdmi_read(struct mtk_hdmi *hdmi, u32 offset)
+{
+	return readl(hdmi->regs + offset);
+}
+
+static void mtk_hdmi_write(struct mtk_hdmi *hdmi, u32 offset, u32 val)
+{
+	writel(val, hdmi->regs + offset);
+}
+
+static inline void mtk_hdmi_clear_bits(struct mtk_hdmi *hdmi, u32 offset,
+				       u32 bits)
+{
+	void __iomem *reg = hdmi->regs + offset;
+	u32 tmp;
+
+	tmp = readl(reg);
+	tmp &= ~bits;
+	writel(tmp, reg);
+}
+
+static inline void mtk_hdmi_set_bits(struct mtk_hdmi *hdmi, u32 offset,
+				     u32 bits)
+{
+	void __iomem *reg = hdmi->regs + offset;
+	u32 tmp;
+
+	tmp = readl(reg);
+	tmp |= bits;
+	writel(tmp, reg);
+}
+
+static void mtk_hdmi_mask(struct mtk_hdmi *hdmi, u32 offset, u32 val, u32 mask)
+{
+	void __iomem *reg = hdmi->regs + offset;
+	u32 tmp;
+
+	tmp = readl(reg);
+	tmp = (tmp & ~mask) | (val & mask);
+	writel(tmp, reg);
+}
+
+static inline void mtk_hdmi_clr_all_int_status(struct mtk_hdmi *hdmi)
+{
+	/*clear all tx irq*/
+	mtk_hdmi_write(hdmi, TOP_INT_CLR00, 0xffffffff);
+	mtk_hdmi_write(hdmi, TOP_INT_CLR00, 0x00000000);
+	mtk_hdmi_write(hdmi, TOP_INT_CLR01, 0xffffffff);
+	mtk_hdmi_write(hdmi, TOP_INT_CLR01, 0x00000000);
+}
+
+static inline void mtk_hdmi_disable_all_int(struct mtk_hdmi *hdmi)
+{
+	/*disable all tx irq*/
+	mtk_hdmi_write(hdmi, TOP_INT_MASK00, 0x00000000);
+	mtk_hdmi_write(hdmi, TOP_INT_MASK01, 0x00000000);
+}
+
+static inline void mtk_hdmi_en_hdcp_reauth_int(struct mtk_hdmi *hdmi,
+					       bool enable)
+{
+	if (enable)
+		mtk_hdmi_mask(hdmi, TOP_INT_MASK00,
+			      HDCP2X_RX_REAUTH_REQ_DDCM_INT_UNMASK,
+			      HDCP2X_RX_REAUTH_REQ_DDCM_INT_UNMASK);
+	else
+		mtk_hdmi_mask(hdmi, TOP_INT_MASK00,
+			      HDCP2X_RX_REAUTH_REQ_DDCM_INT_MASK,
+			      HDCP2X_RX_REAUTH_REQ_DDCM_INT_UNMASK);
+}
+
+static inline void mtk_hdmi_enable_hpd_pord_irq(struct mtk_hdmi *hdmi,
+						bool enable)
+{
+	if (enable)
+		mtk_hdmi_mask(hdmi, TOP_INT_MASK00, 0x0000000f, 0x0000000f);
+	else
+		mtk_hdmi_mask(hdmi, TOP_INT_MASK00, 0x00000000, 0x0000000f);
+}
+
+static inline void mtk_hdmi_clr_htplg_pord_irq(struct mtk_hdmi *hdmi)
+{
+	mtk_hdmi_mask(hdmi, TOP_INT_CLR00, 0x0000000f, 0x0000000f);
+	mtk_hdmi_mask(hdmi, TOP_INT_CLR00, 0x00000000, 0x0000000f);
+}
+
+static inline void mtk_hdmi_set_sw_hpd(struct mtk_hdmi *hdmi, bool high)
+{
+	if (high)
+		mtk_hdmi_mask(hdmi, HDMITX_CONFIG, 0x1 << HDMITX_SW_HPD_SHIFT,
+			      HDMITX_SW_HPD);
+	else
+		mtk_hdmi_mask(hdmi, HDMITX_CONFIG, 0x0 << HDMITX_SW_HPD_SHIFT,
+			      HDMITX_SW_HPD);
+}
+
+static inline void mtk_hdmi_force_hdcp_hpd(struct mtk_hdmi *hdmi)
+{
+	/* force HDCP HPD to 1*/
+	mtk_hdmi_mask(hdmi, HDCP2X_CTRL_0, HDCP2X_HPD_OVR, HDCP2X_HPD_OVR);
+	mtk_hdmi_mask(hdmi, HDCP2X_CTRL_0, HDCP2X_HPD_SW, HDCP2X_HPD_SW);
+}
+
+static void mtk_hdmi_disable_hdcp_encrypt(struct mtk_hdmi *hdmi)
+{
+	mtk_hdmi_mask(hdmi, HDCP2X_CTRL_0, 0x0 << HDCP2X_ENCRYPT_EN_SHIFT,
+		      HDCP2X_ENCRYPT_EN);
+	mtk_hdmi_mask(hdmi, HDCP1X_CTRL, 0x0 << HDCP1X_ENC_EN_SHIFT,
+		      HDCP1X_ENC_EN);
+}
+
+static void mtk_hdmi_yuv420_downsample(struct mtk_hdmi *hdmi, bool enable)
+{
+	if (enable) {
+		mtk_hdmi_mask(hdmi, HDMITX_CONFIG,
+			      HDMI_YUV420_MODE | HDMITX_SW_HPD,
+			      HDMI_YUV420_MODE | HDMITX_SW_HPD);
+		mtk_hdmi_mask(hdmi, VID_DOWNSAMPLE_CONFIG,
+			      C444_C422_CONFIG_ENABLE, C444_C422_CONFIG_ENABLE);
+		mtk_hdmi_mask(hdmi, VID_DOWNSAMPLE_CONFIG,
+			      C422_C420_CONFIG_ENABLE, C422_C420_CONFIG_ENABLE);
+		mtk_hdmi_mask(hdmi, VID_DOWNSAMPLE_CONFIG, 0,
+			      C422_C420_CONFIG_BYPASS);
+		mtk_hdmi_mask(hdmi, VID_DOWNSAMPLE_CONFIG,
+			      C422_C420_CONFIG_OUT_CB_OR_CR,
+			      C422_C420_CONFIG_OUT_CB_OR_CR);
+		mtk_hdmi_mask(hdmi, VID_OUT_FORMAT,
+			      OUTPUT_FORMAT_DEMUX_420_ENABLE,
+			      OUTPUT_FORMAT_DEMUX_420_ENABLE);
+	} else {
+		mtk_hdmi_mask(hdmi, HDMITX_CONFIG, 0 | HDMITX_SW_HPD,
+			      HDMI_YUV420_MODE | HDMITX_SW_HPD);
+		mtk_hdmi_mask(hdmi, VID_DOWNSAMPLE_CONFIG, 0,
+			      C444_C422_CONFIG_ENABLE);
+		mtk_hdmi_mask(hdmi, VID_DOWNSAMPLE_CONFIG, 0,
+			      C422_C420_CONFIG_ENABLE);
+		mtk_hdmi_mask(hdmi, VID_DOWNSAMPLE_CONFIG,
+			      C422_C420_CONFIG_BYPASS, C422_C420_CONFIG_BYPASS);
+		mtk_hdmi_mask(hdmi, VID_DOWNSAMPLE_CONFIG, 0,
+			      C422_C420_CONFIG_OUT_CB_OR_CR);
+		mtk_hdmi_mask(hdmi, VID_OUT_FORMAT, 0,
+			      OUTPUT_FORMAT_DEMUX_420_ENABLE);
+	}
+}
+
+static bool mtk_hdmi_tmds_over_340M(struct mtk_hdmi *hdmi)
+{
+	unsigned long pixel_clk, tmds_clk;
+
+	pixel_clk = hdmi->mode.clock * 1000; //in HZ
+
+	/* TMDS clk frequency */
+	if (hdmi->color_depth == HDMI_8_BIT)
+		tmds_clk = pixel_clk;
+	else if (hdmi->color_depth == HDMI_10_BIT)
+		tmds_clk = pixel_clk * 5 / 4; // *1.25
+	else if (hdmi->color_depth == HDMI_12_BIT)
+		tmds_clk = pixel_clk * 3 / 2; // *1.5
+	else if (hdmi->color_depth == HDMI_16_BIT)
+		tmds_clk = pixel_clk * 2; // *2
+	else
+		return -EINVAL;
+
+	if ((tmds_clk >= 340000000) && (hdmi->csp != HDMI_COLORSPACE_YUV420))
+		return true;
+
+	return false;
+}
+
+static inline void mtk_hdmi_enable_scrambling(struct mtk_hdmi *hdmi,
+					      bool enable)
+{
+	udelay(100);
+
+	if (enable)
+		mtk_hdmi_mask(hdmi, TOP_CFG00, SCR_ON | HDMI2_ON,
+			      SCR_ON | HDMI2_ON);
+	else
+		mtk_hdmi_mask(hdmi, TOP_CFG00, SCR_OFF | HDMI2_OFF,
+			      SCR_ON | HDMI2_ON);
+}
+
+static inline void mtk_hdmi_high_tmds_clock_ratio(struct mtk_hdmi *hdmi,
+						  bool enable)
+{
+}
+
+static void mtk_hdmi_480p_576p_setting(struct mtk_hdmi *hdmi)
+{
+}
+
+static void mtk_hdmi_hw_vid_black(struct mtk_hdmi *hdmi, bool black)
+{
+	if (black)
+		mtk_hdmi_mask(hdmi, TOP_VMUTE_CFG1, REG_VMUTE_EN, REG_VMUTE_EN);
+	else
+		mtk_hdmi_mask(hdmi, TOP_VMUTE_CFG1, 0, REG_VMUTE_EN);
+}
+
+static void mtk_hdmi_hw_aud_mute(struct mtk_hdmi *hdmi)
+{
+	if (mtk_hdmi_read(hdmi, AIP_CTRL) & DSD_EN)
+		mtk_hdmi_mask(hdmi, AIP_TXCTRL,
+			      DSD_MUTE_DATA | AUD_MUTE_FIFO_EN,
+			      DSD_MUTE_DATA | AUD_MUTE_FIFO_EN);
+	else
+		mtk_hdmi_mask(hdmi, AIP_TXCTRL, AUD_MUTE_FIFO_EN,
+			      AUD_MUTE_FIFO_EN);
+}
+
+static void mtk_hdmi_hw_aud_unmute(struct mtk_hdmi *hdmi)
+{
+	mtk_hdmi_mask(hdmi, AIP_TXCTRL, AUD_MUTE_DIS, AUD_MUTE_FIFO_EN);
+}
+
+static void mtk_hdmi_hw_reset(struct mtk_hdmi *hdmi)
+{
+	mtk_hdmi_mask(hdmi, HDMITX_CONFIG, 0x0 << HDMITX_SW_RSTB_SHIFT,
+		      HDMITX_SW_RSTB);
+	udelay(1);
+	mtk_hdmi_mask(hdmi, HDMITX_CONFIG, 0x1 << HDMITX_SW_RSTB_SHIFT,
+		      HDMITX_SW_RSTB);
+}
+
+static void mtk_hdmi_enable_hdmi_mode(struct mtk_hdmi *hdmi, bool enable)
+{
+	if (enable)
+		mtk_hdmi_mask(hdmi, TOP_CFG00, HDMI_MODE_HDMI, HDMI_MODE_HDMI);
+	else
+		mtk_hdmi_mask(hdmi, TOP_CFG00, HDMI_MODE_DVI, HDMI_MODE_HDMI);
+}
+
+static bool mtk_hdmi_sink_is_hdmi_device(struct mtk_hdmi *hdmi)
+{
+	if (hdmi->dvi_mode)
+		return false;
+	else
+		return true;
+}
+
+static void mtk_hdmi_set_deep_color(struct mtk_hdmi *hdmi, bool is_hdmi_sink)
+{
+	unsigned int deep_color = 0;
+
+	//ycbcr422 12bit not deep color
+	if (hdmi->csp == HDMI_COLORSPACE_YUV422)
+		deep_color = DEEPCOLOR_MODE_8BIT;
+	else
+		if (hdmi->color_depth == HDMI_8_BIT)
+			deep_color = DEEPCOLOR_MODE_8BIT;
+		else if (hdmi->color_depth == HDMI_10_BIT)
+			deep_color = DEEPCOLOR_MODE_10BIT;
+		else if (hdmi->color_depth == HDMI_12_BIT)
+			deep_color = DEEPCOLOR_MODE_12BIT;
+		else if (hdmi->color_depth == HDMI_16_BIT)
+			deep_color = DEEPCOLOR_MODE_16BIT;
+		else
+			WARN_ON(1);
+
+	mtk_hdmi_mask(hdmi, TOP_CFG00, deep_color, DEEPCOLOR_MODE_MASKBIT);
+
+	/* GCP */
+	mtk_hdmi_mask(hdmi, TOP_CFG00, 0, DEEPCOLOR_PAT_EN);
+	if ((is_hdmi_sink) && (deep_color != DEEPCOLOR_MODE_8BIT))
+		mtk_hdmi_mask(hdmi, TOP_MISC_CTLR, DEEP_COLOR_ADD,
+			      DEEP_COLOR_ADD);
+	else
+		mtk_hdmi_mask(hdmi, TOP_MISC_CTLR, 0, DEEP_COLOR_ADD);
+}
+
+static void mtk_hdmi_hw_audio_infoframe(struct mtk_hdmi *hdmi, u8 *buffer,
+					u8 len)
+{
+	enum hdmi_infoframe_type frame_type;
+	u8 frame_ver;
+	u8 frame_len;
+	u8 checksum;
+
+	frame_type = buffer[0];
+	frame_ver = buffer[1];
+	frame_len = buffer[2];
+	checksum = buffer[3];
+
+	mtk_hdmi_mask(hdmi, TOP_INFO_EN, AUD_DIS_WR | AUD_DIS,
+		      AUD_EN_WR | AUD_EN);
+	mtk_hdmi_mask(hdmi, TOP_INFO_RPT, AUD_RPT_DIS, AUD_RPT_EN);
+
+	mtk_hdmi_write(hdmi, TOP_AIF_HEADER,
+		       (frame_len << 16) + (frame_ver << 8) +
+			       (frame_type << 0));
+	mtk_hdmi_write(hdmi, TOP_AIF_PKT00,
+		       (buffer[6] << 24) + (buffer[5] << 16) +
+			       (buffer[4] << 8) + (buffer[3] << 0));
+	mtk_hdmi_write(hdmi, TOP_AIF_PKT01,
+		       (buffer[8] << 8) + (buffer[7] << 0));
+	mtk_hdmi_write(hdmi, TOP_AIF_PKT02, 0);
+	mtk_hdmi_write(hdmi, TOP_AIF_PKT03, 0);
+
+	mtk_hdmi_mask(hdmi, TOP_INFO_RPT, AUD_RPT_EN, AUD_RPT_EN);
+	mtk_hdmi_mask(hdmi, TOP_INFO_EN, AUD_EN_WR | AUD_EN,
+		      AUD_EN_WR | AUD_EN);
+}
+
+static void mtk_hdmi_hw_avi_infoframe(struct mtk_hdmi *hdmi, u8 *buffer, u8 len)
+{
+	mtk_hdmi_mask(hdmi, TOP_INFO_EN, AVI_DIS_WR | AVI_DIS,
+		      AVI_EN_WR | AVI_EN);
+	mtk_hdmi_mask(hdmi, TOP_INFO_RPT, AVI_RPT_DIS, AVI_RPT_EN);
+
+	mtk_hdmi_write(hdmi, TOP_AVI_HEADER,
+		       (buffer[2] << 16) + (buffer[1] << 8) + (buffer[0] << 0));
+
+	mtk_hdmi_write(hdmi, TOP_AVI_PKT00,
+		       (buffer[6] << 24) + (buffer[5] << 16) +
+			       (buffer[4] << 8) + (buffer[3] << 0));
+
+	mtk_hdmi_write(hdmi, TOP_AVI_PKT01,
+		       (buffer[9] << 16) + (buffer[8] << 8) + (buffer[7] << 0));
+
+	mtk_hdmi_write(hdmi, TOP_AVI_PKT02,
+		       (buffer[13] << 24) + (buffer[12] << 16) +
+			       (buffer[11] << 8) + (buffer[10] << 0));
+
+	mtk_hdmi_write(hdmi, TOP_AVI_PKT03,
+		       (buffer[16] << 16) + (buffer[15] << 8) +
+			       (buffer[14] << 0));
+
+	mtk_hdmi_write(hdmi, TOP_AVI_PKT04, 0);
+	mtk_hdmi_write(hdmi, TOP_AVI_PKT05, 0);
+
+	mtk_hdmi_mask(hdmi, TOP_INFO_RPT, AVI_RPT_EN, AVI_RPT_EN);
+	mtk_hdmi_mask(hdmi, TOP_INFO_EN, AVI_EN_WR | AVI_EN,
+		      AVI_EN_WR | AVI_EN);
+}
+
+static void mtk_hdmi_hw_spd_infoframe(struct mtk_hdmi *hdmi, u8 *buffer, u8 len)
+{
+	mtk_hdmi_mask(hdmi, TOP_INFO_EN, SPD_DIS_WR | SPD_DIS,
+		      SPD_EN_WR | SPD_EN);
+	mtk_hdmi_mask(hdmi, TOP_INFO_RPT, SPD_RPT_DIS, SPD_RPT_EN);
+
+	mtk_hdmi_write(hdmi, TOP_SPDIF_HEADER,
+		       (buffer[2] << 16) + (buffer[1] << 8) + (buffer[0] << 0));
+
+	mtk_hdmi_write(hdmi, TOP_SPDIF_PKT00,
+		       (buffer[6] << 24) + (buffer[5] << 16) +
+			       (buffer[4] << 8) + (buffer[3] << 0));
+
+	mtk_hdmi_write(hdmi, TOP_SPDIF_PKT01,
+		       (buffer[9] << 16) + (buffer[8] << 8) + (buffer[7] << 0));
+
+	mtk_hdmi_write(hdmi, TOP_SPDIF_PKT02,
+		       (buffer[13] << 24) + (buffer[12] << 16) +
+			       (buffer[11] << 8) + (buffer[10] << 0));
+
+	mtk_hdmi_write(hdmi, TOP_SPDIF_PKT03,
+		       (buffer[16] << 16) + (buffer[15] << 8) +
+			       (buffer[14] << 0));
+
+	mtk_hdmi_write(hdmi, TOP_SPDIF_PKT04,
+		       (buffer[20] << 24) + (buffer[19] << 16) +
+			       (buffer[18] << 8) + (buffer[17] << 0));
+
+	mtk_hdmi_write(hdmi, TOP_SPDIF_PKT05,
+		       (buffer[23] << 16) + (buffer[22] << 8) +
+			       (buffer[21] << 0));
+
+	mtk_hdmi_write(hdmi, TOP_SPDIF_PKT06,
+		       (buffer[27] << 24) + (buffer[26] << 16) +
+			       (buffer[25] << 8) + (buffer[24] << 0));
+
+	mtk_hdmi_write(hdmi, TOP_SPDIF_PKT07,
+		       (buffer[30] << 16) + (buffer[29] << 8) +
+			       (buffer[28] << 0));
+
+	mtk_hdmi_mask(hdmi, TOP_INFO_RPT, SPD_RPT_EN, SPD_RPT_EN);
+	mtk_hdmi_mask(hdmi, TOP_INFO_EN, SPD_EN_WR | SPD_EN,
+		      SPD_EN_WR | SPD_EN);
+}
+
+static int mtk_hdmi_setup_audio_infoframe(struct mtk_hdmi *hdmi)
+{
+	struct hdmi_codec_params *params = &hdmi->aud_param->codec_params;
+	struct hdmi_audio_infoframe frame;
+	u8 buffer[14];
+	ssize_t err;
+
+	pr_info("HDMI_CODEC_PARAMS: audio infoframe\n");
+	pr_info("type %d\n", params->cea.type);
+	pr_info("version %d\n", params->cea.version);
+	pr_info("length %d\n", params->cea.length);
+	pr_info("channels %d\n", params->cea.channels);
+	pr_info("coding_type %d\n", params->cea.coding_type);
+	pr_info("sample_size %d\n", params->cea.sample_size);
+	pr_info("sample_frequency %d\n", params->cea.sample_frequency);
+	pr_info("coding_type_ext %d\n", params->cea.coding_type_ext);
+	pr_info("channel_allocation %d\n", params->cea.channel_allocation);
+
+	memcpy(&frame, &params->cea, sizeof(struct hdmi_audio_infoframe));
+
+	err = hdmi_audio_infoframe_pack(&frame, buffer, sizeof(buffer));
+	if (err < 0)
+		return err;
+
+	mtk_hdmi_hw_audio_infoframe(hdmi, buffer, sizeof(buffer));
+	return 0;
+}
+
+static void mtk_hdmi_hw_send_aud_packet(struct mtk_hdmi *hdmi, bool enable)
+{
+	if (!enable)
+		mtk_hdmi_mask(hdmi, AIP_TXCTRL, AUD_PACKET_DROP,
+			      AUD_PACKET_DROP);
+	else
+		mtk_hdmi_mask(hdmi, AIP_TXCTRL, 0, AUD_PACKET_DROP);
+}
+
+static inline void mtk_hdmi_hw_send_av_mute(struct mtk_hdmi *hdmi)
+{
+	/*GCP packet */
+	mtk_hdmi_mask(hdmi, TOP_CFG01, 0, CP_CLR_MUTE_EN);
+	mtk_hdmi_mask(hdmi, TOP_CFG01, 0, CP_SET_MUTE_EN);
+	mtk_hdmi_mask(hdmi, TOP_INFO_RPT, 0, CP_RPT_EN);
+	mtk_hdmi_mask(hdmi, TOP_INFO_EN, 0, CP_EN | CP_EN_WR);
+
+	mtk_hdmi_mask(hdmi, TOP_CFG01, 0, CP_CLR_MUTE_EN);
+	mtk_hdmi_mask(hdmi, TOP_CFG01, CP_SET_MUTE_EN, CP_SET_MUTE_EN);
+	mtk_hdmi_mask(hdmi, TOP_INFO_RPT, CP_RPT_EN, CP_RPT_EN);
+	mtk_hdmi_mask(hdmi, TOP_INFO_EN, CP_EN | CP_EN_WR, CP_EN | CP_EN_WR);
+}
+
+static inline void mtk_hdmi_hw_send_av_unmute(struct mtk_hdmi *hdmi)
+{
+	/*GCP packet */
+	mtk_hdmi_mask(hdmi, TOP_CFG01, 0, CP_CLR_MUTE_EN);
+	mtk_hdmi_mask(hdmi, TOP_CFG01, 0, CP_SET_MUTE_EN);
+	mtk_hdmi_mask(hdmi, TOP_INFO_RPT, 0, CP_RPT_EN);
+	mtk_hdmi_mask(hdmi, TOP_INFO_EN, 0, CP_EN | CP_EN_WR);
+
+	mtk_hdmi_mask(hdmi, TOP_CFG01, CP_CLR_MUTE_EN, CP_CLR_MUTE_EN);
+	mtk_hdmi_mask(hdmi, TOP_CFG01, 0, CP_SET_MUTE_DIS);
+	mtk_hdmi_mask(hdmi, TOP_INFO_RPT, CP_RPT_EN, CP_RPT_EN);
+	mtk_hdmi_mask(hdmi, TOP_INFO_EN, CP_EN | CP_EN_WR, CP_EN | CP_EN_WR);
+}
+
+static void mtk_hdmi_hw_ncts_enable(struct mtk_hdmi *hdmi, bool enable)
+{
+	unsigned int data;
+
+	data = mtk_hdmi_read(hdmi, AIP_CTRL);
+
+	if (enable)
+		data |= CTS_SW_SEL;
+	else
+		data &= ~CTS_SW_SEL;
+
+	mtk_hdmi_write(hdmi, AIP_CTRL, data);
+}
+
+static void mtk_hdmi_hw_aud_set_channel_status(struct mtk_hdmi *hdmi,
+					       u8 *channel_status)
+{
+	/* actually, only the first 5 or 7 bytes of Channel Status
+	 * contain useful information
+	 */
+	mtk_hdmi_write(hdmi, AIP_I2S_CHST0,
+		       (channel_status[3] << 24) + (channel_status[2] << 16) +
+			       (channel_status[1] << 8) +
+			       (channel_status[0] << 0));
+	mtk_hdmi_write(hdmi, AIP_I2S_CHST1,
+		       (channel_status[6] << 16) + (channel_status[5] << 8) +
+			       (channel_status[4] << 0));
+}
+
+struct hdmi_acr_n {
+	unsigned int clock;
+	unsigned int n[3];
+};
+
+/* Recommended N values from HDMI specification, tables 7-1 to 7-3 */
+static const struct hdmi_acr_n hdmi_rec_n_table[] = {
+	/* Clock, N: 32kHz 44.1kHz 48kHz */
+	{ 25175, { 4576, 7007, 6864 } },
+	{ 74176, { 11648, 17836, 11648 } },
+	{ 148352, { 11648, 8918, 5824 } },
+	{ 296703, { 5824, 4459, 5824 } },
+	{ 297000, { 3072, 4704, 5120 } },
+	{ 0, { 4096, 6272, 6144 } }, /* all other TMDS clocks */
+};
+
+/**
+ * hdmi_recommended_n() - Return N value recommended by HDMI specification
+ * @freq: audio sample rate in Hz
+ * @clock: rounded TMDS clock in kHz
+ */
+static unsigned int hdmi_recommended_n(unsigned int freq, unsigned int clock)
+{
+	const struct hdmi_acr_n *recommended;
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(hdmi_rec_n_table) - 1; i++) {
+		if (clock == hdmi_rec_n_table[i].clock)
+			break;
+	}
+	recommended = hdmi_rec_n_table + i;
+
+	switch (freq) {
+	case 32000:
+		return recommended->n[0];
+	case 44100:
+		return recommended->n[1];
+	case 48000:
+		return recommended->n[2];
+	case 88200:
+		return recommended->n[1] * 2;
+	case 96000:
+		return recommended->n[2] * 2;
+	case 176400:
+		return recommended->n[1] * 4;
+	case 192000:
+		return recommended->n[2] * 4;
+	default:
+		return (128 * freq) / 1000;
+	}
+}
+
+static unsigned int hdmi_mode_clock_to_hz(unsigned int clock)
+{
+	switch (clock) {
+	case 25175:
+		return 25174825; /* 25.2/1.001 MHz */
+	case 74176:
+		return 74175824; /* 74.25/1.001 MHz */
+	case 148352:
+		return 148351648; /* 148.5/1.001 MHz */
+	case 296703:
+		return 296703297; /* 297/1.001 MHz */
+	default:
+		return clock * 1000;
+	}
+}
+
+static unsigned int hdmi_expected_cts(unsigned int audio_sample_rate,
+				      unsigned int tmds_clock, unsigned int n)
+{
+	return DIV_ROUND_CLOSEST_ULL((u64)hdmi_mode_clock_to_hz(tmds_clock) * n,
+				     128 * audio_sample_rate);
+}
+
+static void mtk_hdmi_hw_aud_set_ncts(struct mtk_hdmi *hdmi,
+				     unsigned int sample_rate,
+				     unsigned int clock)
+{
+	unsigned int n, ncts;
+
+	n = hdmi_recommended_n(sample_rate, clock);
+	ncts = hdmi_expected_cts(sample_rate, clock, n);
+	mtk_hdmi_write(hdmi, AIP_N_VAL, n);
+	mtk_hdmi_write(hdmi, AIP_CTS_SVAL, ncts);
+}
+
+static int mtk_hdmi_aud_enable_packet(struct mtk_hdmi *hdmi, bool enable)
+{
+	mtk_hdmi_hw_send_aud_packet(hdmi, enable);
+	return 0;
+}
+
+static int mtk_hdmi_aud_on_off_hw_ncts(struct mtk_hdmi *hdmi, bool on)
+{
+	mtk_hdmi_hw_ncts_enable(hdmi, on);
+	return 0;
+}
+
+static void mtk_hdmi_audio_dsd_config(struct mtk_hdmi *hdmi,
+				      unsigned char chNum, bool dsd_bypass)
+{
+	mtk_hdmi_mask(hdmi, AIP_CTRL, DSD_EN, SPDIF_EN | DSD_EN | HBRA_ON);
+	mtk_hdmi_mask(hdmi, AIP_TXCTRL, DSD_MUTE_DATA, DSD_MUTE_DATA);
+	if (dsd_bypass)
+		mtk_hdmi_write(hdmi, TOP_AUD_MAP, 0x75316420);
+	/* 0x13570246 */
+	else
+		mtk_hdmi_write(hdmi, TOP_AUD_MAP, 0x04230150);
+	/* 0 FL;1 SL;2 CENT;3 FR;4 SR;5 LFE 0x32400510 */
+
+	/* rxtx bypass */
+	mtk_hdmi_mask(hdmi, AIP_SPDIF_CTRL, 0, I2S2DSD_EN);
+}
+
+static inline void mtk_hdmi_hw_i2s_fifo_map(struct mtk_hdmi *hdmi,
+					    unsigned int fifo_mapping)
+{
+	mtk_hdmi_mask(hdmi, AIP_I2S_CTRL, fifo_mapping,
+		      FIFO3_MAP | FIFO2_MAP | FIFO1_MAP | FIFO0_MAP);
+}
+
+static inline void mtk_hdmi_hw_i2s_ch_number(struct mtk_hdmi *hdmi,
+					     unsigned int chNum)
+{
+	mtk_hdmi_mask(hdmi, AIP_CTRL, chNum << I2S_EN_SHIFT, I2S_EN);
+}
+
+static void mtk_hdmi_hw_i2s_ch_mapping(struct mtk_hdmi *hdmi,
+				       unsigned char chNum,
+				       unsigned char mapping)
+{
+	unsigned int bData, bData1, bData2, bData3;
+
+	if (chNum == 2) { /* I2S 2ch */
+		bData = 0x1; /* 2ch data */
+		bData1 = 0x50; /* data0 */
+
+	} else if ((chNum == 3) || (chNum == 4)) { /* I2S 2ch */
+		if ((chNum == 4) && (mapping == 0x08))
+			bData = 0x3; /* 4ch data */
+		else
+			bData = 0x03; /* 4ch data */
+
+		bData1 = 0x50; /* data0 */
+
+	} else if ((chNum == 6) || (chNum == 5)) { /* I2S 5.1ch */
+		if ((chNum == 6) && (mapping == 0x0E)) {
+			bData = 0xf; /* 6.0 ch data */
+			bData1 = 0x50; /* data0 */
+		} else {
+			bData = 0x7; /* 5.1ch data, 5/0ch */
+			bData1 = 0x50; /* data0 */
+		}
+
+	} else if (chNum == 8) { /* I2S 5.1ch */
+		bData = 0xf; /* 7.1ch data */
+		bData1 = 0x50; /* data0 */
+	} else if (chNum == 7) { /* I2S 6.1ch */
+		bData = 0xf; /* 6.1ch data */
+		bData1 = 0x50; /* data0 */
+	} else {
+		bData = 0x01; /* 2ch data */
+		bData1 = 0x50; /* data0 */
+	}
+
+	bData2 = 0xc6;
+	bData3 = 0xfa;
+
+	mtk_hdmi_hw_i2s_fifo_map(hdmi, (MAP_SD3 << 6) | (MAP_SD2 << 4) |
+					       (MAP_SD1 << 2) | (MAP_SD0 << 0));
+	mtk_hdmi_hw_i2s_ch_number(hdmi, bData);
+
+	if (chNum == 2)
+		mtk_hdmi_mask(hdmi, AIP_TXCTRL, LAYOUT0, LAYOUT1);
+	else
+		mtk_hdmi_mask(hdmi, AIP_TXCTRL, LAYOUT1, LAYOUT1);
+}
+
+static void mtk_hdmi_i2s_data_fmt(struct mtk_hdmi *hdmi, unsigned char fmt)
+{
+	unsigned int u4Data;
+
+	u4Data = mtk_hdmi_read(hdmi, AIP_I2S_CTRL);
+	u4Data &= ~(WS_HIGH | I2S_1ST_BIT_NOSHIFT | JUSTIFY_RIGHT);
+
+	switch (fmt) {
+	case HDMI_I2S_MODE_RJT_24BIT:
+		u4Data |= (WS_HIGH | I2S_1ST_BIT_NOSHIFT | JUSTIFY_RIGHT);
+		break;
+
+	case HDMI_I2S_MODE_RJT_16BIT:
+		u4Data |= (WS_HIGH | I2S_1ST_BIT_NOSHIFT | JUSTIFY_RIGHT);
+		break;
+
+	case HDMI_I2S_MODE_LJT_24BIT:
+		u4Data |= (WS_HIGH | I2S_1ST_BIT_NOSHIFT);
+		break;
+
+	case HDMI_I2S_MODE_LJT_16BIT:
+		u4Data |= (WS_HIGH | I2S_1ST_BIT_NOSHIFT);
+		break;
+
+	case HDMI_I2S_MODE_I2S_24BIT:
+		break;
+
+	case HDMI_I2S_MODE_I2S_16BIT:
+		break;
+
+	default:
+		break;
+	}
+	mtk_hdmi_write(hdmi, AIP_I2S_CTRL, u4Data);
+
+	u4Data = mtk_hdmi_read(hdmi, AIP_I2S_CTRL);
+}
+
+static inline void mtk_hdmi_i2s_sck_edge(struct mtk_hdmi *hdmi,
+					 unsigned int edge)
+{
+	mtk_hdmi_mask(hdmi, AIP_I2S_CTRL, edge, SCK_EDGE_RISE);
+}
+
+static inline void mtk_hdmi_i2s_cbit_order(struct mtk_hdmi *hdmi,
+					   unsigned int cbit)
+{
+	mtk_hdmi_mask(hdmi, AIP_I2S_CTRL, cbit, CBIT_ORDER_SAME);
+}
+
+static inline void mtk_hdmi_i2s_vbit(struct mtk_hdmi *hdmi, unsigned int vbit)
+{
+	mtk_hdmi_mask(hdmi, AIP_I2S_CTRL, vbit, VBIT_COM);
+}
+
+static inline void mtk_hdmi_i2s_data_direction(struct mtk_hdmi *hdmi,
+					       unsigned int data_dir)
+{
+	mtk_hdmi_mask(hdmi, AIP_I2S_CTRL, data_dir, DATA_DIR_LSB);
+}
+
+static inline void mtk_hdmi_hw_audio_type(struct mtk_hdmi *hdmi,
+					  unsigned int spdif_i2s)
+{
+	mtk_hdmi_mask(hdmi, AIP_CTRL, spdif_i2s << SPDIF_EN_SHIFT, SPDIF_EN);
+}
+
+static unsigned char mtk_hdmi_get_i2s_ch_mapping(struct mtk_hdmi *hdmi,
+						 unsigned char channel_type)
+{
+	unsigned char FR, FL, FC, LFE, RR, RL, RRC, RLC, RC;
+	unsigned char ch_number = 0;
+	unsigned char ChannelMap = 0x00;
+
+	switch (channel_type) {
+	case HDMI_AUD_CHAN_TYPE_1_0:
+	case HDMI_AUD_CHAN_TYPE_2_0:
+		FR = 1;
+		FL = 1;
+		LFE = 0;
+		ch_number = 2;
+		break;
+
+	case HDMI_AUD_CHAN_TYPE_1_1:
+	case HDMI_AUD_CHAN_TYPE_2_1:
+		FR = 1;
+		FL = 1;
+		LFE = 1;
+		ch_number = 3;
+		break;
+
+	case HDMI_AUD_CHAN_TYPE_3_0:
+		FR = 1;
+		FL = 1;
+		FC = 1;
+		LFE = 0;
+		ch_number = 3;
+		break;
+
+	case HDMI_AUD_CHAN_TYPE_3_0_LRS:
+		FR = 1;
+		FL = 1;
+		RR = 1;
+		RL = 1;
+		LFE = 0;
+		ch_number = 4;
+		break;
+
+	case HDMI_AUD_CHAN_TYPE_3_1_LRS:
+		FR = 1;
+		FL = 1;
+		FC = 0;
+		LFE = 1;
+		RR = 1;
+		RL = 1;
+		ch_number = 5;
+		break;
+
+	case HDMI_AUD_CHAN_TYPE_4_0_CLRS:
+		FR = 1;
+		FL = 1;
+		FC = 1;
+		LFE = 0;
+		RR = 1;
+		RL = 1;
+		ch_number = 5;
+		break;
+
+	case HDMI_AUD_CHAN_TYPE_4_1_CLRS:
+		FR = 1;
+		FL = 1;
+		FC = 1;
+		LFE = 1;
+		RR = 1;
+		RL = 1;
+		ch_number = 6;
+		break;
+
+	case HDMI_AUD_CHAN_TYPE_3_1:
+		FR = 1;
+		FL = 1;
+		FC = 1;
+		LFE = 1;
+		ch_number = 4;
+		break;
+
+	case HDMI_AUD_CHAN_TYPE_4_0:
+		FR = 1;
+		FL = 1;
+		RR = 1;
+		RL = 1;
+		LFE = 0;
+		ch_number = 4;
+		break;
+
+	case HDMI_AUD_CHAN_TYPE_4_1:
+		FR = 1;
+		FL = 1;
+		RR = 1;
+		RL = 1;
+		LFE = 1;
+		ch_number = 5;
+		break;
+
+	case HDMI_AUD_CHAN_TYPE_5_0:
+		FR = 1;
+		FL = 1;
+		FC = 1;
+		LFE = 0;
+		RR = 1;
+		RL = 1;
+		ch_number = 5;
+		break;
+
+	case HDMI_AUD_CHAN_TYPE_5_1:
+		FR = 1;
+		FL = 1;
+		FC = 1;
+		LFE = 1;
+		RR = 1;
+		RL = 1;
+		ch_number = 6;
+		break;
+
+	case HDMI_AUD_CHAN_TYPE_6_0:
+	case HDMI_AUD_CHAN_TYPE_6_0_CS:
+	case HDMI_AUD_CHAN_TYPE_6_0_CH:
+	case HDMI_AUD_CHAN_TYPE_6_0_OH:
+	case HDMI_AUD_CHAN_TYPE_6_0_CHR:
+		FR = 1;
+		FL = 1;
+		FC = 1;
+		LFE = 0;
+		RR = 1;
+		RL = 1;
+		RC = 1;
+		ch_number = 6;
+		break;
+
+	case HDMI_AUD_CHAN_TYPE_6_1:
+	case HDMI_AUD_CHAN_TYPE_6_1_CS:
+	case HDMI_AUD_CHAN_TYPE_6_1_CH:
+	case HDMI_AUD_CHAN_TYPE_6_1_OH:
+	case HDMI_AUD_CHAN_TYPE_6_1_CHR:
+		FR = 1;
+		FL = 1;
+		FC = 1;
+		LFE = 1;
+		RR = 1;
+		RL = 1;
+		RC = 1;
+		ch_number = 7;
+		break;
+
+	case HDMI_AUD_CHAN_TYPE_7_0:
+	case HDMI_AUD_CHAN_TYPE_7_0_LH_RH:
+	case HDMI_AUD_CHAN_TYPE_7_0_LSR_RSR:
+	case HDMI_AUD_CHAN_TYPE_7_0_LC_RC:
+	case HDMI_AUD_CHAN_TYPE_7_0_LW_RW:
+	case HDMI_AUD_CHAN_TYPE_7_0_LSD_RSD:
+	case HDMI_AUD_CHAN_TYPE_7_0_LSS_RSS:
+	case HDMI_AUD_CHAN_TYPE_7_0_LHS_RHS:
+	case HDMI_AUD_CHAN_TYPE_7_0_CS_CH:
+	case HDMI_AUD_CHAN_TYPE_7_0_CS_OH:
+	case HDMI_AUD_CHAN_TYPE_7_0_CS_CHR:
+	case HDMI_AUD_CHAN_TYPE_7_0_CH_OH:
+	case HDMI_AUD_CHAN_TYPE_7_0_CH_CHR:
+	case HDMI_AUD_CHAN_TYPE_7_0_OH_CHR:
+	case HDMI_AUD_CHAN_TYPE_7_0_LSS_RSS_LSR_RSR:
+	case HDMI_AUD_CHAN_TYPE_8_0_LH_RH_CS:
+		FR = 1;
+		FL = 1;
+		FC = 1;
+		LFE = 0;
+		RR = 1;
+		RL = 1;
+		RRC = 1;
+		RLC = 1;
+		ch_number = 7;
+		break;
+
+	case HDMI_AUD_CHAN_TYPE_7_1:
+	case HDMI_AUD_CHAN_TYPE_7_1_LH_RH:
+	case HDMI_AUD_CHAN_TYPE_7_1_LSR_RSR:
+	case HDMI_AUD_CHAN_TYPE_7_1_LC_RC:
+	case HDMI_AUD_CHAN_TYPE_7_1_LW_RW:
+	case HDMI_AUD_CHAN_TYPE_7_1_LSD_RSD:
+	case HDMI_AUD_CHAN_TYPE_7_1_LSS_RSS:
+	case HDMI_AUD_CHAN_TYPE_7_1_LHS_RHS:
+	case HDMI_AUD_CHAN_TYPE_7_1_CS_CH:
+	case HDMI_AUD_CHAN_TYPE_7_1_CS_OH:
+	case HDMI_AUD_CHAN_TYPE_7_1_CS_CHR:
+	case HDMI_AUD_CHAN_TYPE_7_1_CH_OH:
+	case HDMI_AUD_CHAN_TYPE_7_1_CH_CHR:
+	case HDMI_AUD_CHAN_TYPE_7_1_OH_CHR:
+	case HDMI_AUD_CHAN_TYPE_7_1_LSS_RSS_LSR_RSR:
+		FR = 1;
+		FL = 1;
+		FC = 1;
+		LFE = 1;
+		RR = 1;
+		RL = 1;
+		RRC = 1;
+		RLC = 1;
+		ch_number = 8;
+		break;
+
+	default:
+		FR = 1;
+		FL = 1;
+		ch_number = 2;
+		break;
+	}
+
+	switch (ch_number) {
+	case 8:
+		break;
+
+	case 7:
+		break;
+
+	case 6:
+		if ((FR == 1) && (FL == 1) && (FC == 1) && (RR == 1) &&
+		    (RL == 1) && (RC == 1) && (LFE == 0)) {
+			/* 6.0 */
+			ChannelMap = 0x0E;
+		} else if ((FR == 1) && (FL == 1) && (FC == 1) && (RR == 1) &&
+			   (RL == 1) && (RC == 0) && (LFE == 1)) {
+			/* 5.1 */
+			ChannelMap = 0x0B;
+		}
+		break;
+
+	case 5:
+		break;
+
+	case 4:
+		if ((FR == 1) && (FL == 1) && (RR == 1) && (RL == 1) &&
+		    (LFE == 0))
+			ChannelMap = 0x08;
+		else if ((FR == 1) && (FL == 1) && (FC == 1) && (LFE == 1))
+			ChannelMap = 0x03;
+		break;
+
+	case 3:
+		if ((FR == 1) && (FL == 1) && (FC == 1))
+			ChannelMap = 0x02;
+		else if ((FR == 1) && (FL == 1) && (LFE == 1))
+			ChannelMap = 0x01;
+		break;
+
+	case 2:
+		if ((FR == 1) && (FL == 1))
+			ChannelMap = 0x00;
+		break;
+
+	default:
+		break;
+	}
+
+	return ChannelMap;
+}
+
+static inline void mtk_hdmi_hw_i2s_ch_swap(struct mtk_hdmi *hdmi,
+					   unsigned char SwapBit)
+{
+	mtk_hdmi_mask(hdmi, AIP_SPDIF_CTRL, SwapBit << 20, 0x0F << 20);
+}
+
+static void mtk_hdmi_hbr_config(struct mtk_hdmi *hdmi, bool dsd_bypass)
+{
+	if (dsd_bypass) {
+		mtk_hdmi_mask(hdmi, AIP_CTRL, HBRA_ON,
+			      SPDIF_EN | DSD_EN | HBRA_ON);
+		mtk_hdmi_mask(hdmi, AIP_CTRL, I2S_EN, I2S_EN);
+	} else {
+		mtk_hdmi_mask(hdmi, AIP_CTRL, SPDIF_EN,
+			      SPDIF_EN | DSD_EN | HBRA_ON);
+		mtk_hdmi_mask(hdmi, AIP_CTRL, SPDIF_INTERNAL_MODULE,
+			      SPDIF_INTERNAL_MODULE);
+		mtk_hdmi_mask(hdmi, AIP_CTRL, HBR_FROM_SPDIF, HBR_FROM_SPDIF);
+		mtk_hdmi_mask(hdmi, AIP_CTRL, CTS_CAL_N4, CTS_CAL_N4);
+	}
+}
+
+static inline void mtk_hdmi_hw_spdif_config(struct mtk_hdmi *hdmi)
+{
+	mtk_hdmi_mask(hdmi, AIP_SPDIF_CTRL, WR_1UI_UNLOCK, WR_1UI_LOCK);
+	mtk_hdmi_mask(hdmi, AIP_SPDIF_CTRL, FS_UNOVERRIDE, FS_OVERRIDE_WRITE);
+	mtk_hdmi_mask(hdmi, AIP_SPDIF_CTRL, WR_2UI_UNLOCK, WR_2UI_LOCK);
+	mtk_hdmi_mask(hdmi, AIP_SPDIF_CTRL, 0x4 << MAX_1UI_WRITE_SHIFT,
+		      MAX_1UI_WRITE);
+	mtk_hdmi_mask(hdmi, AIP_SPDIF_CTRL, 0x9 << MAX_2UI_WRITE_SHIFT,
+		      MAX_2UI_WRITE);
+	mtk_hdmi_mask(hdmi, AIP_SPDIF_CTRL, 0x4 << AUD_ERR_THRESH_SHIFT,
+		      AUD_ERR_THRESH);
+	mtk_hdmi_mask(hdmi, AIP_SPDIF_CTRL, I2S2DSD_EN, I2S2DSD_EN);
+}
+
+static int mtk_hdmi_aud_set_input(struct mtk_hdmi *hdmi)
+{
+	unsigned char ChMapping;
+
+	mtk_hdmi_write(hdmi, TOP_AUD_MAP,
+		       C_SD7 + C_SD6 + C_SD5 + C_SD4 + C_SD3 + C_SD2 + C_SD1 +
+			       C_SD0);
+	mtk_hdmi_mask(hdmi, AIP_SPDIF_CTRL, 0, 0x0F << 20);
+	mtk_hdmi_mask(hdmi, AIP_CTRL, 0,
+		      SPDIF_EN | DSD_EN | HBRA_ON | CTS_CAL_N4 |
+			      HBR_FROM_SPDIF | SPDIF_INTERNAL_MODULE);
+	mtk_hdmi_mask(hdmi, AIP_TXCTRL, 0, DSD_MUTE_DATA | LAYOUT1);
+
+	if (hdmi->aud_param->aud_input_type == HDMI_AUD_INPUT_I2S) {
+		if (hdmi->aud_param->aud_codec == HDMI_AUDIO_CODING_TYPE_DSD) {
+			mtk_hdmi_audio_dsd_config(
+				hdmi, hdmi->aud_param->codec_params.channels,
+				0);
+			mtk_hdmi_hw_i2s_ch_mapping(
+				hdmi, hdmi->aud_param->codec_params.channels,
+				1);
+		} else {
+			mtk_hdmi_i2s_data_fmt(hdmi,
+					      hdmi->aud_param->aud_i2s_fmt);
+			mtk_hdmi_i2s_sck_edge(hdmi, SCK_EDGE_RISE);
+			mtk_hdmi_i2s_cbit_order(hdmi, CBIT_ORDER_SAME);
+			mtk_hdmi_i2s_vbit(hdmi, VBIT_PCM);
+			mtk_hdmi_i2s_data_direction(hdmi, DATA_DIR_MSB);
+			mtk_hdmi_hw_audio_type(hdmi, HDMI_AUD_INPUT_I2S);
+			ChMapping = mtk_hdmi_get_i2s_ch_mapping(
+				hdmi, hdmi->aud_param->aud_input_chan_type);
+			mtk_hdmi_hw_i2s_ch_mapping(
+				hdmi, hdmi->aud_param->codec_params.channels,
+				ChMapping);
+			mtk_hdmi_hw_i2s_ch_swap(hdmi, LFE_CC_SWAP);
+		}
+	} else {
+		if ((hdmi->aud_param->aud_input_type == HDMI_AUD_INPUT_SPDIF) &&
+		    ((hdmi->aud_param->aud_codec ==
+		      HDMI_AUDIO_CODING_TYPE_DTS_HD) ||
+		     (hdmi->aud_param->aud_codec ==
+		      HDMI_AUDIO_CODING_TYPE_MLP)) &&
+		    (hdmi->aud_param->codec_params.sample_rate == 768000)) {
+			mtk_hdmi_hbr_config(hdmi, false);
+		} else {
+			mtk_hdmi_hw_spdif_config(hdmi);
+			mtk_hdmi_hw_i2s_ch_mapping(hdmi, 2, 0);
+		}
+	}
+
+	return 0;
+}
+
+static int mtk_hdmi_aud_set_sw_ncts(struct mtk_hdmi *hdmi,
+				    struct drm_display_mode *display_mode)
+{
+	unsigned int sample_rate = hdmi->aud_param->codec_params.sample_rate;
+
+	mtk_hdmi_aud_on_off_hw_ncts(hdmi, false);
+
+	mtk_hdmi_hw_aud_set_ncts(hdmi, sample_rate, display_mode->clock);
+
+	return 0;
+}
+
+static inline void mtk_hdmi_hw_audio_input_enable(struct mtk_hdmi *hdmi,
+						  unsigned int enable)
+{
+	if (enable)
+		mtk_hdmi_mask(hdmi, AIP_CTRL, AUD_IN_EN, AUD_IN_EN);
+	else
+		mtk_hdmi_mask(hdmi, AIP_CTRL, 0x0 << AUD_IN_EN_SHIFT,
+			      AUD_IN_EN);
+}
+
+static void mtk_hdmi_aip_ctrl_init(struct mtk_hdmi *hdmi)
+{
+	mtk_hdmi_mask(hdmi, AIP_CTRL,
+		      AUD_SEL_OWRT | NO_MCLK_CTSGEN_SEL | CTS_REQ_EN,
+		      AUD_SEL_OWRT | NO_MCLK_CTSGEN_SEL | MCLK_EN | CTS_REQ_EN);
+	mtk_hdmi_mask(hdmi, AIP_TPI_CTRL, TPI_AUDIO_LOOKUP_DIS,
+		      TPI_AUDIO_LOOKUP_EN);
+}
+
+static void mtk_hdmi_audio_reset(struct mtk_hdmi *hdmi, bool rst)
+{
+	if (rst)
+		mtk_hdmi_mask(hdmi, AIP_TXCTRL,
+			      RST4AUDIO | RST4AUDIO_FIFO | RST4AUDIO_ACR,
+			      RST4AUDIO | RST4AUDIO_FIFO | RST4AUDIO_ACR);
+	else
+		mtk_hdmi_mask(hdmi, AIP_TXCTRL, 0,
+			      RST4AUDIO | RST4AUDIO_FIFO | RST4AUDIO_ACR);
+}
+
+static int mtk_hdmi_aud_output_config(struct mtk_hdmi *hdmi,
+				      struct drm_display_mode *display_mode)
+{
+	mtk_hdmi_hw_aud_mute(hdmi);
+	mtk_hdmi_aud_enable_packet(hdmi, false);
+	mtk_hdmi_audio_reset(hdmi, true);
+	mtk_hdmi_aip_ctrl_init(hdmi);
+
+	mtk_hdmi_aud_set_input(hdmi);
+
+	mtk_hdmi_hw_aud_set_channel_status(
+		hdmi, hdmi->aud_param->codec_params.iec.status);
+
+	mtk_hdmi_setup_audio_infoframe(hdmi);
+
+	mtk_hdmi_hw_audio_input_enable(hdmi, true);
+
+	mtk_hdmi_audio_reset(hdmi, false);
+
+	mtk_hdmi_aud_set_sw_ncts(hdmi, display_mode);
+
+	udelay(25);
+	mtk_hdmi_aud_on_off_hw_ncts(hdmi, true);
+
+	mtk_hdmi_aud_enable_packet(hdmi, true);
+	mtk_hdmi_hw_aud_unmute(hdmi);
+	return 0;
+}
+
+static int mtk_hdmi_setup_avi_infoframe(struct mtk_hdmi *hdmi,
+					struct drm_display_mode *mode)
+{
+	struct hdmi_avi_infoframe frame;
+	u8 buffer[17];
+	ssize_t err;
+	bool is_hdmi2x_sink = false;
+
+	if (hdmi->conn.display_info.hdmi.scdc.supported)
+		is_hdmi2x_sink =
+			true; //if support scdc, then the sink support HDMI2.0
+
+	err = drm_hdmi_avi_infoframe_from_display_mode(&frame, &hdmi->conn,
+						       mode);
+
+	if (err < 0) {
+		dev_err(hdmi->dev,
+			"Failed to get AVI infoframe from mode: %zd\n", err);
+		return err;
+	}
+
+	frame.colorimetry = hdmi->colorimtery;
+	//no need, since we cannot support other extended colorimetry?
+	if (frame.colorimetry == HDMI_COLORIMETRY_EXTENDED)
+		frame.extended_colorimetry = hdmi->extended_colorimetry;
+
+	/* quantiation range:limited or full */
+	if (frame.colorspace == HDMI_COLORSPACE_RGB)
+		frame.quantization_range = hdmi->quantization_range;
+	else
+		frame.ycc_quantization_range = hdmi->ycc_quantization_range;
+	err = hdmi_avi_infoframe_pack(&frame, buffer, sizeof(buffer));
+
+	if (err < 0) {
+		dev_err(hdmi->dev, "Failed to pack AVI infoframe: %zd\n", err);
+		return err;
+	}
+
+	mtk_hdmi_hw_avi_infoframe(hdmi, buffer, sizeof(buffer));
+	return 0;
+}
+
+static int mtk_hdmi_setup_spd_infoframe(struct mtk_hdmi *hdmi,
+					const char *vendor, const char *product)
+{
+	struct hdmi_spd_infoframe frame;
+	u8 buffer[29];
+	ssize_t err;
+
+	err = hdmi_spd_infoframe_init(&frame, vendor, product);
+	if (err < 0) {
+		dev_err(hdmi->dev, "Failed to initialize SPD infoframe: %zd\n",
+			err);
+		return err;
+	}
+
+	err = hdmi_spd_infoframe_pack(&frame, buffer, sizeof(buffer));
+	if (err < 0) {
+		dev_err(hdmi->dev, "Failed to pack SDP infoframe: %zd\n", err);
+		return err;
+	}
+
+	mtk_hdmi_hw_spd_infoframe(hdmi, buffer, sizeof(buffer));
+	return 0;
+}
+
+static int mtk_hdmi_output_init(struct mtk_hdmi *hdmi)
+{
+	struct hdmi_audio_param *aud_param = hdmi->aud_param;
+
+	aud_param->aud_codec = HDMI_AUDIO_CODING_TYPE_PCM;
+	aud_param->aud_sampe_size = HDMI_AUDIO_SAMPLE_SIZE_16;
+	aud_param->aud_input_type = HDMI_AUD_INPUT_I2S;
+	aud_param->aud_i2s_fmt = HDMI_I2S_MODE_I2S_24BIT;
+	aud_param->aud_mclk = HDMI_AUD_MCLK_128FS;
+	aud_param->aud_input_chan_type = HDMI_AUD_CHAN_TYPE_2_0;
+
+	hdmi->hpd = HDMI_PLUG_OUT;
+	hdmi->set_csp_depth = RGB444_8bit;
+	hdmi->csp = HDMI_COLORSPACE_RGB;
+	hdmi->color_depth = HDMI_8_BIT;
+	hdmi->colorimtery = HDMI_COLORIMETRY_NONE;
+	hdmi->extended_colorimetry = HDMI_EXTENDED_COLORIMETRY_RESERVED;
+	hdmi->quantization_range = HDMI_QUANTIZATION_RANGE_DEFAULT;
+	hdmi->ycc_quantization_range = HDMI_YCC_QUANTIZATION_RANGE_LIMITED;
+
+	return 0;
+}
+
+static int mtk_hdmi_reset_colorspace_setting(struct mtk_hdmi *hdmi)
+{
+	hdmi->set_csp_depth = RGB444_8bit;
+	hdmi->csp = HDMI_COLORSPACE_RGB;
+	hdmi->color_depth = HDMI_8_BIT;
+	hdmi->colorimtery = HDMI_COLORIMETRY_NONE;
+	hdmi->extended_colorimetry = HDMI_EXTENDED_COLORIMETRY_RESERVED;
+	hdmi->quantization_range = HDMI_QUANTIZATION_RANGE_DEFAULT;
+	hdmi->ycc_quantization_range = HDMI_YCC_QUANTIZATION_RANGE_LIMITED;
+
+	return 0;
+}
+
+static void mtk_hdmi_audio_enable(struct mtk_hdmi *hdmi)
+{
+	mtk_hdmi_aud_enable_packet(hdmi, true);
+	hdmi->audio_enable = true;
+}
+
+static void mtk_hdmi_audio_disable(struct mtk_hdmi *hdmi)
+{
+	mtk_hdmi_aud_enable_packet(hdmi, false);
+	hdmi->audio_enable = false;
+}
+
+static int mtk_hdmi_audio_set_param(struct mtk_hdmi *hdmi,
+				    struct hdmi_audio_param *param)
+{
+	if (!hdmi->audio_enable)
+		return -EINVAL;
+
+	memcpy(hdmi->aud_param, param, sizeof(*param));
+	return mtk_hdmi_aud_output_config(hdmi, &hdmi->mode);
+}
+
+static void mtk_hdmi_change_video_resolution(struct mtk_hdmi *hdmi)
+{
+	bool is_over_340M = false;
+	bool is_hdmi_sink = false;
+
+	mtk_hdmi_hw_reset(hdmi);
+	mtk_hdmi_set_sw_hpd(hdmi, true);
+	udelay(2);
+
+	mtk_hdmi_write(hdmi, HDCP_TOP_CTRL, 0x0);
+	mtk_hdmi_en_hdcp_reauth_int(hdmi, true);
+	mtk_hdmi_enable_hpd_pord_irq(hdmi, true);
+	mtk_hdmi_force_hdcp_hpd(hdmi);
+
+	is_hdmi_sink = mtk_hdmi_sink_is_hdmi_device(hdmi);
+	mtk_hdmi_set_deep_color(hdmi, is_hdmi_sink);
+	mtk_hdmi_enable_hdmi_mode(hdmi, is_hdmi_sink);
+
+	udelay(5);
+	mtk_hdmi_hw_vid_black(hdmi, true);
+	mtk_hdmi_hw_aud_mute(hdmi);
+	mtk_hdmi_hw_send_av_unmute(hdmi);
+
+	mtk_hdmi_mask(hdmi, TOP_CFG01, NULL_PKT_VSYNC_HIGH_EN,
+		      NULL_PKT_VSYNC_HIGH_EN | NULL_PKT_EN);
+
+	is_over_340M = mtk_hdmi_tmds_over_340M(hdmi);
+	mtk_hdmi_enable_scrambling(hdmi, is_over_340M);
+	mtk_hdmi_high_tmds_clock_ratio(hdmi, is_over_340M);
+
+	if (hdmi->csp == HDMI_COLORSPACE_YUV420)
+		mtk_hdmi_yuv420_downsample(hdmi, true);
+	else
+		mtk_hdmi_yuv420_downsample(hdmi, false);
+
+	mtk_hdmi_480p_576p_setting(hdmi);
+}
+
+static int mtk_hdmi_output_set_display_mode(struct mtk_hdmi *hdmi,
+					    struct drm_display_mode *mode)
+{
+	mtk_hdmi_change_video_resolution(hdmi);
+	mtk_hdmi_aud_output_config(hdmi, mode);
+
+	return 0;
+}
+
+static int mtk_hdmi_get_all_clk(struct mtk_hdmi *hdmi, struct device_node *np)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(mtk_hdmi_clk_names); i++) {
+		hdmi->clk[i] =
+			of_clk_get_by_name(np, mtk_hdmi_clk_names[i]);
+
+		if (IS_ERR(hdmi->clk[i]))
+			return PTR_ERR(hdmi->clk[i]);
+	}
+
+	return 0;
+}
+
+static void mtk_hdmi_clk_enable(struct mtk_hdmi *hdmi)
+{
+	int i;
+
+	clk_set_parent(hdmi->clk[MTK_HDIM_HDCP_SEL],
+		       hdmi->clk[MTK_HDMI_UNIVPLL_D4D8]);
+
+	for (i = 0; i < ARRAY_SIZE(mtk_hdmi_clk_names); i++) {
+		if ((i == MTK_HDMI_UNIVPLL_D4D8) ||
+		    (i == MTK_HDMI_CLK_UNIVPLL_D6D4) ||
+		    (i == MTK_HDMI_CLK_MSDCPLL_D2) ||
+		    (i == MTK_HDMI_CLK_HDMI_APB_SEL))
+			continue;
+		else
+			clk_prepare_enable(hdmi->clk[i]);
+	}
+}
+
+static void mtk_hdmi_clk_disable(struct mtk_hdmi *hdmi)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(mtk_hdmi_clk_names); i++) {
+		if ((i == MTK_HDMI_UNIVPLL_D4D8) ||
+		    (i == MTK_HDMI_CLK_UNIVPLL_D6D4) ||
+		    (i == MTK_HDMI_CLK_MSDCPLL_D2) ||
+		    (i == MTK_HDMI_CLK_HDMI_APB_SEL))
+			continue;
+		else
+			clk_disable_unprepare(hdmi->clk[i]);
+	}
+}
+
+static void mtk_hdmi_hpd_event(enum HDMI_HPD_STATE hpd, struct device *dev)
+{
+	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
+
+	if (hdmi && hdmi->bridge.encoder && hdmi->bridge.encoder->dev)
+		drm_helper_hpd_irq_event(hdmi->bridge.encoder->dev);
+}
+
+enum HDMI_HPD_STATE mtk_hdmi_hpd_pord_status(struct mtk_hdmi *hdmi)
+{
+	unsigned int hpd_status;
+	enum HDMI_HPD_STATE hpd;
+
+	hpd_status = mtk_hdmi_read(hdmi, HPD_DDC_STATUS);
+	if ((hpd_status & (HPD_PIN_STA | PORD_PIN_STA)) ==
+	    (HPD_PIN_STA | PORD_PIN_STA))
+		hpd = HDMI_PLUG_IN_AND_SINK_POWER_ON;
+	else if ((hpd_status & (HPD_PIN_STA | PORD_PIN_STA)) == PORD_PIN_STA)
+		hpd = HDMI_PLUG_IN_ONLY;
+	else
+		hpd = HDMI_PLUG_OUT;
+
+	return hpd;
+}
+
+static irqreturn_t mtk_hdmi_isr(int irq, void *arg)
+{
+	struct mtk_hdmi *hdmi = arg;
+	unsigned int int_status;
+
+	int_status = mtk_hdmi_read(hdmi, TOP_INT_STA00);
+
+	/* handle hpd interrupt */
+	if (int_status & (PORD_F_INT_STA | PORD_R_INT_STA | HTPLG_F_INT_STA |
+			  HTPLG_R_INT_STA)) {
+		queue_delayed_work(hdmi->hdmi_wq, &hdmi->hpd_work,
+				   msecs_to_jiffies(40));
+		mtk_hdmi_enable_hpd_pord_irq(hdmi, false);
+		mtk_hdmi_clr_htplg_pord_irq(hdmi);
+	}
+
+	/*clear all tx irq*/
+	mtk_hdmi_clr_all_int_status(hdmi);
+
+	return IRQ_HANDLED;
+}
+
+void mtk_hdmi_hpd_work_handle(struct work_struct *data)
+{
+	struct mtk_hdmi *hdmi =
+		container_of(data, struct mtk_hdmi, hpd_work.work);
+	enum HDMI_HPD_STATE hpd;
+
+	hpd = mtk_hdmi_hpd_pord_status(hdmi);
+	if (hpd != hdmi->hpd) {
+		hdmi->hpd = hpd;
+		mtk_hdmi_hpd_event(hpd, hdmi->dev);
+	}
+
+	mtk_hdmi_enable_hpd_pord_irq(hdmi, true);
+}
+
+static int mtk_hdmi_init_workqueue(struct mtk_hdmi *hdmi)
+{
+	hdmi->hdmi_wq = create_singlethread_workqueue("hdmitx_wq");
+	if (!hdmi->hdmi_wq)
+		return -ENOMEM;
+
+	INIT_DELAYED_WORK(&hdmi->hpd_work, mtk_hdmi_hpd_work_handle);
+	return 0;
+}
+
+static enum drm_connector_status hdmi_conn_detect(struct drm_connector *conn,
+						  bool force)
+{
+	struct mtk_hdmi *hdmi = hdmi_ctx_from_conn(conn);
+
+	if (hdmi->hpd != HDMI_PLUG_IN_AND_SINK_POWER_ON &&
+	    hdmi->hpd != HDMI_PLUG_IN_ONLY) {
+		hdmi->support_csp_depth = RGB444_8bit;
+		hdmi->set_csp_depth = RGB444_8bit;
+		hdmi->csp = HDMI_COLORSPACE_RGB;
+		hdmi->color_depth = HDMI_8_BIT;
+		hdmi->colorimtery = HDMI_COLORIMETRY_NONE;
+		hdmi->extended_colorimetry = HDMI_EXTENDED_COLORIMETRY_RESERVED;
+		hdmi->quantization_range = HDMI_QUANTIZATION_RANGE_DEFAULT;
+		hdmi->ycc_quantization_range =
+			HDMI_YCC_QUANTIZATION_RANGE_LIMITED;
+	}
+
+	return (hdmi->hpd != HDMI_PLUG_OUT) ? connector_status_connected :
+						    connector_status_disconnected;
+}
+
+static void hdmi_conn_destroy(struct drm_connector *conn)
+{
+	drm_connector_cleanup(conn);
+}
+
+static int hdmi_conn_atomic_set_property(struct drm_connector *conn,
+					 struct drm_connector_state *state,
+					 struct drm_property *property,
+					 uint64_t val)
+{
+	struct mtk_hdmi *hdmi = hdmi_ctx_from_conn(conn);
+
+	spin_lock(&hdmi->property_lock);
+
+	if (property == hdmi->csp_depth_prop) {
+		if (val & (hdmi->support_csp_depth))
+			hdmi->set_csp_depth = val;
+		else {
+			spin_unlock(&hdmi->property_lock);
+			return -EINVAL;
+		}
+	} else {
+		spin_unlock(&hdmi->property_lock);
+		return -EINVAL;
+	}
+
+	spin_unlock(&hdmi->property_lock);
+	return 0;
+}
+
+static int
+hdmi_conn_atomic_get_property(struct drm_connector *conn,
+			      const struct drm_connector_state *state,
+			      struct drm_property *property, uint64_t *val)
+{
+	int ret = -EINVAL;
+	struct mtk_hdmi *hdmi = hdmi_ctx_from_conn(conn);
+
+	spin_lock(&hdmi->property_lock);
+
+	if (property == hdmi->csp_depth_prop) {
+		*val = hdmi->support_csp_depth;
+		ret = 0;
+	}
+
+	spin_unlock(&hdmi->property_lock);
+	return ret;
+}
+
+unsigned int get_hdmi_colorspace_colorimetry(
+	struct drm_bridge *bridge, enum hdmi_colorspace *colorspace,
+	enum hdmi_colorimetry *colorimtery,
+	enum hdmi_extended_colorimetry *extended_colorimetry,
+	enum hdmi_quantization_range *quantization_range,
+	enum hdmi_ycc_quantization_range *ycc_quantization_range)
+{
+	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
+
+	*colorspace = hdmi->csp;
+	*colorimtery = hdmi->colorimtery;
+	*extended_colorimetry = hdmi->extended_colorimetry;
+	*quantization_range = hdmi->quantization_range;
+	*ycc_quantization_range = hdmi->ycc_quantization_range;
+	//DPI cannot support BT2020 conversion, so no need extended_colorimetry information
+	return 0;
+}
+EXPORT_SYMBOL(get_hdmi_colorspace_colorimetry);
+
+static int mtk_hdmi_enable_disable(struct mtk_hdmi *hdmi, bool enable)
+{
+	int ret;
+
+	if (enable && !hdmi->hdmi_enabled) {
+		if (!hdmi->power_clk_enabled) {
+			/* power domain on */
+			ret = pm_runtime_get_sync(hdmi->dev);
+
+			/* clk on */
+			mtk_hdmi_clk_enable(hdmi);
+			hdmi->power_clk_enabled = true;
+		}
+
+		if (!hdmi->irq_registered) {
+			/* disable all tx interrupts */
+			mtk_hdmi_disable_all_int(hdmi);
+			/* request irq */
+			hdmi->hdmi_irq =
+				irq_of_parse_and_map(hdmi->dev->of_node, 0);
+			ret = request_irq(hdmi->hdmi_irq, mtk_hdmi_isr,
+					  IRQF_TRIGGER_HIGH, "hdmiirq", hdmi);
+			hdmi->irq_registered = true;
+			/* enable hpd interrupt */
+			mtk_hdmi_set_sw_hpd(hdmi, true);
+			mtk_hdmi_enable_hpd_pord_irq(hdmi, true);
+		}
+
+	} else if (!enable && hdmi->hdmi_enabled) {
+		if (hdmi->irq_registered) {
+			/* free irq */
+			free_irq(hdmi->hdmi_irq, NULL);
+			hdmi->irq_registered = false;
+		}
+
+		if (hdmi->power_clk_enabled) {
+			/* clk disable */
+			mtk_hdmi_clk_disable(hdmi);
+			/* power domain off */
+			ret = pm_runtime_put_sync(hdmi->dev);
+			hdmi->power_clk_enabled = false;
+		}
+	}
+
+	hdmi->hdmi_enabled = enable;
+
+	return 0;
+}
+
+static const struct drm_prop_enum_list csp_depth_props[] = {
+	{ __builtin_ffs(RGB444_8bit), "RGB444_8bit" },
+	{ __builtin_ffs(RGB444_10bit), "RGB444_10bit" },
+	{ __builtin_ffs(RGB444_12bit), "RGB444_10bit" },
+	{ __builtin_ffs(RGB444_16bit), "RGB444_16bit" },
+	{ __builtin_ffs(YCBCR444_8bit), "YCBCR444_8bit" },
+	{ __builtin_ffs(YCBCR444_10bit), "YCBCR444_10bit" },
+	{ __builtin_ffs(YCBCR444_12bit), "YCBCR444_12bit" },
+	{ __builtin_ffs(YCBCR444_16bit), "YCBCR444_16bit" },
+	{ __builtin_ffs(YCBCR422_8bit_NO_SUPPORT), "YCBCR422_8bit_NO_SUPPORT" },
+	{ __builtin_ffs(YCBCR422_10bit_NO_SUPPORT),
+	  "YCBCR422_10bit_NO_SUPPORT" },
+	{ __builtin_ffs(YCBCR422_12bit), "YCBCR422_12bit" },
+	{ __builtin_ffs(YCBCR422_16bit_NO_SUPPORT),
+	  "YCBCR422_16bit_NO_SUPPORT" },
+	{ __builtin_ffs(YCBCR420_8bit), "YCBCR420_8bit" },
+	{ __builtin_ffs(YCBCR420_10bit), "YCBCR420_10bit" },
+	{ __builtin_ffs(YCBCR420_12bit), "YCBCR420_12bit" },
+	{ __builtin_ffs(YCBCR420_16bit), "YCBCR420_16bit" },
+};
+
+static void mtk_hdmi_connetor_init_property(struct drm_device *drm_dev,
+					    struct drm_connector *conn)
+{
+	struct mtk_hdmi *hdmi = hdmi_ctx_from_conn(conn);
+	struct drm_property *prop;
+	/* ycbcr422 cannot support 8,10,16bit */
+	unsigned int supported_csp_depth_mask =
+		RGB444_8bit | RGB444_10bit | RGB444_12bit | RGB444_16bit |
+		YCBCR444_8bit | YCBCR444_10bit | YCBCR444_12bit |
+		YCBCR444_16bit | YCBCR422_12bit | YCBCR420_8bit |
+		YCBCR420_10bit | YCBCR420_12bit | YCBCR420_16bit;
+
+	spin_lock_init(&hdmi->property_lock);
+
+	/* create colorspace_depth bitmask property */
+	prop = drm_property_create_bitmask(
+		conn->dev, 0, "hdmi_colorspace_depth", csp_depth_props,
+		ARRAY_SIZE(csp_depth_props), supported_csp_depth_mask);
+
+	if (!prop)
+		return;
+
+	hdmi->csp_depth_prop = prop;
+	drm_object_attach_property(&conn->base, prop, 0);
+
+	/* create mtk_hdmi_blob property, include EDID parser info,
+	 * such as max_tmds_clock_rate, max_tmds_character_rate, support dolby vision
+	 */
+	prop = drm_property_create(conn->dev,
+				   DRM_MODE_PROP_BLOB | DRM_MODE_PROP_IMMUTABLE,
+				   "HDMI_INFO", 0);
+	if (!prop)
+		return;
+
+	hdmi->hdmi_info_blob = prop;
+	hdmi->hdmi_info_blob_ptr = NULL;
+	drm_object_attach_property(&conn->base, prop, 0);
+}
+
+static void mtk_hdmi_convert_colorspace_depth(struct mtk_hdmi *hdmi)
+{
+	switch (hdmi->set_csp_depth) {
+	case RGB444_8bit:
+		hdmi->csp = HDMI_COLORSPACE_RGB;
+		hdmi->color_depth = HDMI_8_BIT;
+		break;
+	case RGB444_10bit:
+		hdmi->csp = HDMI_COLORSPACE_RGB;
+		hdmi->color_depth = HDMI_10_BIT;
+		break;
+	case RGB444_12bit:
+		hdmi->csp = HDMI_COLORSPACE_RGB;
+		hdmi->color_depth = HDMI_12_BIT;
+		break;
+	case RGB444_16bit:
+		hdmi->csp = HDMI_COLORSPACE_RGB;
+		hdmi->color_depth = HDMI_16_BIT;
+		break;
+	case YCBCR444_8bit:
+		hdmi->csp = HDMI_COLORSPACE_YUV444;
+		hdmi->color_depth = HDMI_8_BIT;
+		break;
+	case YCBCR444_10bit:
+		hdmi->csp = HDMI_COLORSPACE_YUV444;
+		hdmi->color_depth = HDMI_10_BIT;
+		break;
+	case YCBCR444_12bit:
+		hdmi->csp = HDMI_COLORSPACE_YUV444;
+		hdmi->color_depth = HDMI_12_BIT;
+		break;
+	case YCBCR444_16bit:
+		hdmi->csp = HDMI_COLORSPACE_YUV444;
+		hdmi->color_depth = HDMI_16_BIT;
+		break;
+	case YCBCR422_12bit:
+		hdmi->csp = HDMI_COLORSPACE_YUV422;
+		hdmi->color_depth = HDMI_12_BIT;
+		break;
+	case YCBCR420_8bit:
+		hdmi->csp = HDMI_COLORSPACE_YUV420;
+		hdmi->color_depth = HDMI_8_BIT;
+		break;
+	case YCBCR420_10bit:
+		hdmi->csp = HDMI_COLORSPACE_YUV420;
+		hdmi->color_depth = HDMI_10_BIT;
+		break;
+	case YCBCR420_12bit:
+		hdmi->csp = HDMI_COLORSPACE_YUV420;
+		hdmi->color_depth = HDMI_12_BIT;
+		break;
+	case YCBCR420_16bit:
+		hdmi->csp = HDMI_COLORSPACE_YUV420;
+		hdmi->color_depth = HDMI_16_BIT;
+		break;
+	default:
+
+		hdmi->csp = HDMI_COLORSPACE_RGB;
+		hdmi->color_depth = HDMI_8_BIT;
+	}
+}
+
+static int mtk_hdmi_conn_get_modes(struct drm_connector *conn)
+{
+	struct mtk_hdmi *hdmi = hdmi_ctx_from_conn(conn);
+	struct edid *edid;
+	int ret;
+
+	if (!hdmi->ddc_adpt)
+		return -ENODEV;
+
+	edid = drm_get_edid(conn, hdmi->ddc_adpt);
+	if (!edid)
+		return -ENODEV;
+
+	hdmi->dvi_mode = !drm_detect_hdmi_monitor(edid);
+
+	drm_connector_update_edid_property(conn, edid);
+
+	ret = drm_add_edid_modes(conn, edid);
+
+	kfree(edid);
+
+	return ret;
+}
+
+static int mtk_hdmi_conn_mode_valid(struct drm_connector *conn,
+				    struct drm_display_mode *mode)
+{
+	if (mode->clock < 27000)
+		return MODE_CLOCK_LOW;
+	if (mode->clock > 594000)
+		return MODE_CLOCK_HIGH;
+
+	return drm_mode_validate_size(mode, 0x1fff, 0x1fff);
+}
+
+static struct drm_encoder *mtk_hdmi_conn_best_enc(struct drm_connector *conn)
+{
+	struct mtk_hdmi *hdmi = hdmi_ctx_from_conn(conn);
+
+	return hdmi->bridge.encoder;
+}
+
+static const struct drm_connector_funcs mtk_hdmi_connector_funcs = {
+	.detect = hdmi_conn_detect,
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.destroy = hdmi_conn_destroy,
+	.reset = drm_atomic_helper_connector_reset,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+	.atomic_set_property = hdmi_conn_atomic_set_property,
+	.atomic_get_property = hdmi_conn_atomic_get_property,
+};
+
+static const struct drm_connector_helper_funcs mtk_hdmi_connector_helper_funcs = {
+	.get_modes = mtk_hdmi_conn_get_modes,
+	.mode_valid = mtk_hdmi_conn_mode_valid,
+	.best_encoder = mtk_hdmi_conn_best_enc,
+};
+
+/*
+ * Bridge callbacks
+ */
+
+static int mtk_hdmi_bridge_attach(struct drm_bridge *bridge,
+				  enum drm_bridge_attach_flags flags)
+{
+	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
+	int ret;
+
+	ret = drm_connector_init(bridge->encoder->dev, &hdmi->conn,
+				 &mtk_hdmi_connector_funcs,
+				 DRM_MODE_CONNECTOR_HDMIA);
+	if (ret)
+		return ret;
+
+	drm_connector_helper_add(&hdmi->conn, &mtk_hdmi_connector_helper_funcs);
+
+	hdmi->conn.polled = DRM_CONNECTOR_POLL_HPD;
+	hdmi->conn.interlace_allowed = false;
+	hdmi->conn.doublescan_allowed = false;
+	hdmi->conn.ycbcr_420_allowed = true;
+
+	ret = drm_connector_attach_encoder(&hdmi->conn, bridge->encoder);
+	if (ret)
+		return ret;
+
+	mtk_hdmi_connetor_init_property(bridge->dev, &hdmi->conn);
+
+	pm_runtime_enable(hdmi->dev);
+	mtk_hdmi_enable_disable(hdmi, true);
+
+	return 0;
+}
+
+static struct edid *mtk_hdmi_bridge_get_edid(struct drm_bridge *bridge,
+					     struct drm_connector *connector)
+{
+	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
+	struct edid *edid;
+
+	if (!hdmi->ddc_adpt)
+		return NULL;
+	edid = drm_get_edid(connector, hdmi->ddc_adpt);
+	if (!edid)
+		return NULL;
+	hdmi->dvi_mode = !drm_detect_monitor_audio(edid);
+	return edid;
+}
+
+static bool mtk_hdmi_bridge_mode_fixup(struct drm_bridge *bridge,
+				       const struct drm_display_mode *mode,
+				       struct drm_display_mode *adjusted_mode)
+{
+	return true;
+}
+
+static void mtk_hdmi_bridge_disable(struct drm_bridge *bridge,
+					   struct drm_bridge_state *old_bridge_state)
+{
+	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
+
+	if (!hdmi->enabled)
+		return;
+
+	mtk_hdmi_hw_send_av_mute(hdmi);
+	usleep_range(50000, 50050);
+	mtk_hdmi_hw_vid_black(hdmi, true);
+	mtk_hdmi_hw_aud_mute(hdmi);
+	mtk_hdmi_disable_hdcp_encrypt(hdmi);
+	usleep_range(50000, 50050);
+
+	hdmi->enabled = false;
+}
+
+static void mtk_hdmi_handle_plugged_change(struct mtk_hdmi *hdmi, bool plugged)
+{
+	if (hdmi->plugged_cb && hdmi->codec_dev)
+		hdmi->plugged_cb(hdmi->codec_dev, plugged);
+}
+
+static void mtk_hdmi_bridge_post_disable(struct drm_bridge *bridge,
+						struct drm_bridge_state *old_state)
+{
+	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
+
+	if (!hdmi->powered)
+		return;
+
+	phy_power_off(hdmi->phy);
+
+	hdmi->powered = false;
+
+	mtk_hdmi_reset_colorspace_setting(hdmi);
+
+	/* signal the disconnect event to audio codec */
+	mtk_hdmi_handle_plugged_change(hdmi, false);
+}
+
+static void
+mtk_hdmi_bridge_mode_set(struct drm_bridge *bridge,
+			 const struct drm_display_mode *mode,
+			 const struct drm_display_mode *adjusted_mode)
+{
+	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
+
+	drm_mode_copy(&hdmi->mode, adjusted_mode);
+}
+
+static void mtk_hdmi_send_infoframe(struct mtk_hdmi *hdmi,
+				    struct drm_display_mode *mode)
+{
+	mtk_hdmi_setup_avi_infoframe(hdmi, mode);
+	mtk_hdmi_setup_spd_infoframe(hdmi, "mediatek", "On-chip HDMI");
+}
+
+static void mtk_hdmi_bridge_pre_enable(struct drm_bridge *bridge,
+					      struct drm_bridge_state *old_state)
+{
+	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
+
+	mtk_hdmi_convert_colorspace_depth(hdmi);
+	mtk_hdmi_output_set_display_mode(hdmi, &hdmi->mode);
+	mtk_hdmi_send_infoframe(hdmi, &hdmi->mode);
+
+	hdmi->powered = true;
+}
+
+static void mtk_hdmi_bridge_enable(struct drm_bridge *bridge,
+					      struct drm_bridge_state *old_state)
+{
+	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
+
+	phy_power_on(hdmi->phy);
+
+	mtk_hdmi_hw_vid_black(hdmi, false);
+	mtk_hdmi_hw_aud_unmute(hdmi);
+
+	/* signal the connect event to audio codec */
+	mtk_hdmi_handle_plugged_change(hdmi, true);
+
+	hdmi->enabled = true;
+}
+
+static const struct drm_bridge_funcs mtk_hdmi_bridge_funcs = {
+	.attach = mtk_hdmi_bridge_attach,
+	.mode_fixup = mtk_hdmi_bridge_mode_fixup,
+	.atomic_disable = mtk_hdmi_bridge_disable,
+	.atomic_post_disable = mtk_hdmi_bridge_post_disable,
+	.mode_set = mtk_hdmi_bridge_mode_set,
+	.atomic_pre_enable = mtk_hdmi_bridge_pre_enable,
+	.atomic_enable = mtk_hdmi_bridge_enable,
+	.get_edid = mtk_hdmi_bridge_get_edid,
+};
+
+static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
+				   struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct device_node *i2c_np;
+	struct resource *mem;
+	int ret;
+	struct mtk_hdmi_ddc *ddc;
+
+	ret = mtk_hdmi_get_all_clk(hdmi, np);
+	if (ret)
+		return ret;
+
+	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	hdmi->regs = devm_ioremap_resource(dev, mem);
+	if (IS_ERR(hdmi->regs))
+		return PTR_ERR(hdmi->regs);
+
+	i2c_np = of_parse_phandle(pdev->dev.of_node, "ddc-i2c-bus", 0);
+	if (!i2c_np) {
+		of_node_put(pdev->dev.of_node);
+		return -EINVAL;
+	}
+	of_node_put(pdev->dev.of_node);
+
+	hdmi->ddc_adpt = of_find_i2c_adapter_by_node(i2c_np);
+	if (!hdmi->ddc_adpt)
+		return -EINVAL;
+
+	ddc = hdmi_ddc_ctx_from_mtk_hdmi(hdmi);
+	ddc->regs = hdmi->regs;
+
+	return 0;
+}
+
+int mtk_hdmi_set_plugged_cb(struct mtk_hdmi *hdmi, hdmi_codec_plugged_cb fn,
+			    struct device *codec_dev)
+{
+	bool plugged;
+
+	hdmi->plugged_cb = fn;
+	hdmi->codec_dev = codec_dev;
+	plugged = (hdmi->hpd == HDMI_PLUG_IN_AND_SINK_POWER_ON) ? true : false;
+	mtk_hdmi_handle_plugged_change(hdmi, plugged);
+
+	return 0;
+}
+
+/*
+ * HDMI audio codec callbacks
+ */
+static int mtk_hdmi_audio_hook_plugged_cb(struct device *dev, void *data,
+					  hdmi_codec_plugged_cb fn,
+					  struct device *codec_dev)
+{
+	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
+
+	if (!hdmi)
+		return -ENODEV;
+
+	return mtk_hdmi_set_plugged_cb(hdmi, fn, codec_dev);
+}
+
+static int mtk_hdmi_audio_hw_params(struct device *dev, void *data,
+				    struct hdmi_codec_daifmt *daifmt,
+				    struct hdmi_codec_params *params)
+{
+	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
+	struct hdmi_audio_param hdmi_params;
+	unsigned int chan = params->cea.channels;
+
+	if (!hdmi->bridge.encoder)
+		return -ENODEV;
+
+	switch (chan) {
+	case 2:
+		hdmi_params.aud_input_chan_type = HDMI_AUD_CHAN_TYPE_2_0;
+		break;
+	case 4:
+		hdmi_params.aud_input_chan_type = HDMI_AUD_CHAN_TYPE_4_0;
+		break;
+	case 6:
+		hdmi_params.aud_input_chan_type = HDMI_AUD_CHAN_TYPE_5_1;
+		break;
+	case 8:
+		hdmi_params.aud_input_chan_type = HDMI_AUD_CHAN_TYPE_7_1;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	switch (params->sample_rate) {
+	case 32000:
+	case 44100:
+	case 48000:
+	case 88200:
+	case 96000:
+	case 176400:
+	case 192000:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	switch (daifmt->fmt) {
+	case HDMI_I2S:
+		hdmi_params.aud_codec = HDMI_AUDIO_CODING_TYPE_PCM;
+		hdmi_params.aud_sampe_size = HDMI_AUDIO_SAMPLE_SIZE_16;
+		hdmi_params.aud_input_type = HDMI_AUD_INPUT_I2S;
+		hdmi_params.aud_i2s_fmt = HDMI_I2S_MODE_I2S_24BIT;
+		hdmi_params.aud_mclk = HDMI_AUD_MCLK_128FS;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	memcpy(&hdmi_params.codec_params, params,
+	       sizeof(hdmi_params.codec_params));
+
+	mtk_hdmi_audio_set_param(hdmi, &hdmi_params);
+
+	return 0;
+}
+
+static int mtk_hdmi_audio_startup(struct device *dev, void *data)
+{
+	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
+
+	mtk_hdmi_audio_enable(hdmi);
+
+	return 0;
+}
+
+static void mtk_hdmi_audio_shutdown(struct device *dev, void *data)
+{
+	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
+
+	mtk_hdmi_audio_disable(hdmi);
+}
+
+static int mtk_hdmi_audio_mute(struct device *dev, void *data, bool enable,
+			       int direction)
+{
+	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
+
+	if (direction != SNDRV_PCM_STREAM_PLAYBACK)
+		return 0;
+
+	if (enable)
+		mtk_hdmi_hw_aud_mute(hdmi);
+	else
+		mtk_hdmi_hw_aud_unmute(hdmi);
+
+	return 0;
+}
+
+static int mtk_hdmi_audio_get_eld(struct device *dev, void *data, uint8_t *buf,
+				  size_t len)
+{
+	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
+	struct drm_connector *conn = &hdmi->conn;
+	unsigned int i;
+
+	dev_dbg(dev, "ELD data start\n");
+	for (i = 0; i < 128; i += 8) {
+		dev_dbg(dev, "%2x %2x %2x %2x %2x %2x %2x %2x\n", conn->eld[i],
+			conn->eld[i + 1], conn->eld[i + 2], conn->eld[i + 3],
+			conn->eld[i + 4], conn->eld[i + 5], conn->eld[i + 6],
+			conn->eld[i + 7]);
+	}
+	dev_dbg(dev, "ELD data end\n");
+
+	memcpy(buf, hdmi->conn.eld, min(sizeof(hdmi->conn.eld), len));
+
+	return 0;
+}
+
+static const struct hdmi_codec_ops mtk_hdmi_audio_codec_ops = {
+	.hw_params = mtk_hdmi_audio_hw_params,
+	.audio_startup = mtk_hdmi_audio_startup,
+	.audio_shutdown = mtk_hdmi_audio_shutdown,
+	.mute_stream = mtk_hdmi_audio_mute,
+	.get_eld = mtk_hdmi_audio_get_eld,
+	.hook_plugged_cb = mtk_hdmi_audio_hook_plugged_cb,
+};
+
+static void mtk_hdmi_register_audio_driver(struct device *dev)
+{
+	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
+	struct hdmi_codec_pdata codec_data = {
+		.ops = &mtk_hdmi_audio_codec_ops,
+		.max_i2s_channels = 8,
+		.i2s = 1,
+		.data = hdmi,
+	};
+	struct platform_device *pdev;
+
+	pdev = platform_device_register_data(dev, HDMI_CODEC_DRV_NAME,
+					     PLATFORM_DEVID_AUTO, &codec_data,
+					     sizeof(codec_data));
+	if (IS_ERR(pdev))
+		return;
+}
+
+static int mtk_drm_hdmi_probe(struct platform_device *pdev)
+{
+	struct mtk_hdmi *hdmi;
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	hdmi = devm_kzalloc(dev, sizeof(*hdmi), GFP_KERNEL);
+	if (!hdmi)
+		return -ENOMEM;
+
+	hdmi->dev = dev;
+
+	hdmi->aud_param =
+		devm_kzalloc(dev, sizeof(struct hdmi_audio_param), GFP_KERNEL);
+	if (!hdmi->aud_param)
+		return -ENOMEM;
+
+	hdmi->phy = devm_phy_get(dev, "hdmi");
+	if (IS_ERR(hdmi->phy)) {
+		ret = PTR_ERR(hdmi->phy);
+		return ret;
+	}
+
+	ret = mtk_hdmi_dt_parse_pdata(hdmi, pdev);
+	if (ret)
+		return ret;
+
+	platform_set_drvdata(pdev, hdmi);
+
+	ret = mtk_hdmi_output_init(hdmi);
+	if (ret)
+		return ret;
+
+	mtk_hdmi_register_audio_driver(dev);
+
+	mtk_hdmi_init_workqueue(hdmi);
+
+	hdmi->bridge.funcs = &mtk_hdmi_bridge_funcs;
+	hdmi->bridge.of_node = pdev->dev.of_node;
+	drm_bridge_add(&hdmi->bridge);
+
+	return 0;
+}
+
+static int mtk_drm_hdmi_remove(struct platform_device *pdev)
+{
+	struct mtk_hdmi *hdmi = platform_get_drvdata(pdev);
+
+	drm_bridge_remove(&hdmi->bridge);
+	mtk_hdmi_clk_disable(hdmi);
+
+	return 0;
+}
+
+#ifdef CONFIG_PM_SLEEP
+static int mtk_hdmi_suspend(struct device *dev)
+{
+	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
+#ifdef CONFIG_DRM_MEDIATEK_HDMI_SUSPEND_LOW_POWER
+
+	if (hdmi->power_clk_enabled) {
+		mtk_hdmi_clk_disable(hdmi);
+		pm_runtime_put_sync(hdmi->dev);
+		hdmi->power_clk_enabled = false;
+	}
+
+	dev_dbg(dev, "hdmi suspend success!\n");
+
+	return 0;
+
+#else
+
+	device_set_wakeup_path(dev);
+	dev_dbg(dev, "hdmi suspend success!\n");
+
+	return 0;
+#endif
+}
+
+static int mtk_hdmi_resume(struct device *dev)
+{
+	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
+#ifdef CONFIG_DRM_MEDIATEK_HDMI_SUSPEND_LOW_POWER
+
+	if (!hdmi->power_clk_enabled) {
+		pm_runtime_get_sync(hdmi->dev);
+
+		mtk_hdmi_clk_enable(hdmi);
+		hdmi->power_clk_enabled = true;
+	}
+
+	dev_dbg(dev, "hdmi resume success!\n");
+	return 0;
+
+#else
+
+	mtk_hdmi_clk_enable(hdmi);
+
+	dev_dbg(dev, "hdmi resume success!\n");
+
+	return 0;
+#endif
+}
+#endif
+static SIMPLE_DEV_PM_OPS(mtk_hdmi_pm_ops, mtk_hdmi_suspend, mtk_hdmi_resume);
+
+static const struct of_device_id mtk_drm_hdmi_of_ids[] = {
+	{
+		.compatible = "mediatek,mt8195-hdmi",
+	},
+	{}
+};
+
+static struct platform_driver mtk_hdmi_mt8195_driver = {
+	.probe = mtk_drm_hdmi_probe,
+	.remove = mtk_drm_hdmi_remove,
+	.driver = {
+		.name = "mediatek-drm-mt8195-hdmi",
+		.of_match_table = mtk_drm_hdmi_of_ids,
+		.pm = &mtk_hdmi_pm_ops,
+	},
+};
+
+static struct platform_driver *const mtk_hdmi_drivers[] = {
+	&mtk_hdmi_mt8195_ddc_driver,
+	&mtk_hdmi_mt8195_driver,
+};
+
+static int __init mtk_hdmitx_init(void)
+{
+	return platform_register_drivers(mtk_hdmi_drivers,
+					 ARRAY_SIZE(mtk_hdmi_drivers));
+}
+
+static void __exit mtk_hdmitx_exit(void)
+{
+	platform_unregister_drivers(mtk_hdmi_drivers,
+				    ARRAY_SIZE(mtk_hdmi_drivers));
+}
+
+module_init(mtk_hdmitx_init);
+module_exit(mtk_hdmitx_exit);
+
+MODULE_AUTHOR("Can Zeng <can.zeng@mediatek.com>");
+MODULE_DESCRIPTION("MediaTek HDMI Driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.h b/drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.h
new file mode 100644
index 000000000000..7d8427b6abed
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.h
@@ -0,0 +1,147 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2019 MediaTek Inc.
+ */
+
+#ifndef _MTK_HDMI_CTRL_H
+#define _MTK_HDMI_CTRL_H
+
+#include <linux/hdmi.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_crtc.h>
+#include <drm/drm_crtc_helper.h>
+#include <drm/drm_edid.h>
+#include <linux/platform_device.h>
+#include <linux/i2c.h>
+#include <sound/hdmi-codec.h>
+#include <linux/clk.h>
+#include <linux/mutex.h>
+
+#define RGB444_8bit BIT(0)
+#define RGB444_10bit BIT(1)
+#define RGB444_12bit BIT(2)
+#define RGB444_16bit BIT(3)
+#define YCBCR444_8bit BIT(4)
+#define YCBCR444_10bit BIT(5)
+#define YCBCR444_12bit BIT(6)
+#define YCBCR444_16bit BIT(7)
+#define YCBCR422_8bit_NO_SUPPORT BIT(8)
+#define YCBCR422_10bit_NO_SUPPORT BIT(9)
+#define YCBCR422_12bit BIT(10)
+#define YCBCR422_16bit_NO_SUPPORT BIT(11)
+#define YCBCR420_8bit BIT(12)
+#define YCBCR420_10bit BIT(13)
+#define YCBCR420_12bit BIT(14)
+#define YCBCR420_16bit BIT(15)
+
+enum hdmi_color_depth { HDMI_8_BIT, HDMI_10_BIT, HDMI_12_BIT, HDMI_16_BIT };
+
+enum mtk_hdmi_clk_id {
+	MTK_HDMI_CLK_UNIVPLL_D6D4,
+	MTK_HDMI_CLK_MSDCPLL_D2,
+	MTK_HDMI_CLK_HDMI_APB_SEL,
+	MTK_HDMI_UNIVPLL_D4D8,
+	MTK_HDIM_HDCP_SEL,
+	MTK_HDMI_HDCP_24M_SEL,
+	MTK_HDMI_VPP_SPLIT_HDMI,
+	MTK_HDMI_CLK_COUNT,
+};
+
+struct mtk_hdmi_edid {
+	unsigned char edid[EDID_LENGTH * 4];
+	unsigned char blk_num;
+};
+
+enum HDMI_HPD_STATE {
+	HDMI_PLUG_OUT = 0,
+	HDMI_PLUG_IN_AND_SINK_POWER_ON,
+	HDMI_PLUG_IN_ONLY,
+};
+
+struct hdmi_audio_param;
+
+struct mtk_hdmi {
+	struct drm_bridge bridge;
+	struct drm_connector conn;
+	struct device *dev;
+	struct phy *phy;
+	struct device *cec_dev;
+	struct cec_notifier *notifier;
+	struct i2c_adapter *ddc_adpt;
+	struct clk *clk[MTK_HDMI_CLK_COUNT];
+	struct drm_display_mode mode;
+	struct mtk_edid_params *edid_params;
+	struct mtk_hdmi_sink_av_cap *sink_avcap;
+	bool dvi_mode;
+	u32 max_hdisplay;
+	u32 max_vdisplay;
+	void __iomem *regs;
+	spinlock_t property_lock;
+	struct drm_property *hdmi_info_blob;
+	struct drm_property_blob *hdmi_info_blob_ptr;
+	struct drm_property *csp_depth_prop;
+	uint64_t support_csp_depth;
+	uint64_t set_csp_depth;
+	enum hdmi_colorspace csp;
+	enum hdmi_color_depth color_depth;
+	enum hdmi_colorimetry colorimtery;
+	enum hdmi_extended_colorimetry extended_colorimetry;
+	enum hdmi_quantization_range quantization_range;
+	enum hdmi_ycc_quantization_range ycc_quantization_range;
+	struct mtk_hdmi_edid raw_edid;
+
+	struct hdmi_audio_param *aud_param;
+	bool audio_enable;
+	struct device *codec_dev;
+	hdmi_codec_plugged_cb plugged_cb;
+
+	bool powered;
+	bool enabled;
+	unsigned int hdmi_irq;
+	enum HDMI_HPD_STATE hpd;
+	struct workqueue_struct *hdmi_wq;
+	struct delayed_work hpd_work;
+	struct delayed_work hdr10_delay_work;
+	struct delayed_work hdr10vsif_delay_work;
+	struct mutex hdr_mutex;
+
+	bool hdmi_enabled;
+	bool power_clk_enabled;
+	bool irq_registered;
+};
+
+extern struct platform_driver mtk_hdmi_mt8195_ddc_driver;
+
+#if defined(CONFIG_DRM_MEDIATEK_HDMI) ||                                       \
+	defined(CONFIG_DRM_MEDIATEK_HDMI_MODULE)
+unsigned int get_hdmi_colorspace_colorimetry(
+	struct drm_bridge *bridge, enum hdmi_colorspace *colorspace,
+	enum hdmi_colorimetry *colorimtery,
+	enum hdmi_extended_colorimetry *extended_colorimetry,
+	enum hdmi_quantization_range *quantization_range,
+	enum hdmi_ycc_quantization_range *ycc_quantization_range);
+#else
+inline unsigned int get_hdmi_colorspace_colorimetry(
+	struct drm_bridge *bridge, enum hdmi_colorspace *colorspace,
+	enum hdmi_colorimetry *colorimtery,
+	enum hdmi_extended_colorimetry *extended_colorimetry,
+	enum hdmi_quantization_range *quantization_range,
+	enum hdmi_ycc_quantization_range *ycc_quantization_range)
+{
+	return 0;
+}
+#endif
+
+/* struct mtk_hdmi_info is used to propagate blob property to userspace */
+struct mtk_hdmi_info {
+	unsigned short edid_sink_colorimetry;
+	unsigned char edid_sink_rgb_color_bit;
+	unsigned char edid_sink_ycbcr_color_bit;
+	unsigned char ui1_sink_dc420_color_bit;
+	unsigned short edid_sink_max_tmds_clock;
+	unsigned short edid_sink_max_tmds_character_rate;
+	unsigned char edid_sink_support_dynamic_hdr;
+};
+
+#endif /* _MTK_HDMI_CTRL_H */
diff --git a/drivers/gpu/drm/mediatek/mtk_mt8195_hdmi_ddc.c b/drivers/gpu/drm/mediatek/mtk_mt8195_hdmi_ddc.c
new file mode 100644
index 000000000000..e07f1a0aeee4
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/mtk_mt8195_hdmi_ddc.c
@@ -0,0 +1,541 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2019 MediaTek Inc.
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/time.h>
+#include <linux/delay.h>
+#include <linux/errno.h>
+#include <linux/err.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
+#include <linux/of_platform.h>
+#include <linux/semaphore.h>
+
+#include "mtk_mt8195_hdmi_ddc.h"
+#include "mtk_mt8195_hdmi_regs.h"
+#include "mtk_mt8195_hdmi.h"
+
+#define EDID_ID 0x50
+#define DDC2_CLOK 572 /* BIM=208M/(v*4) = 90Khz */
+#define DDC2_CLOK_EDID 832 /* BIM=208M/(v*4) = 62.5Khz */
+
+enum SIF_BIT_T_HDMI {
+	SIF_8_BIT_HDMI, /* /< [8 bits data address.] */
+	SIF_16_BIT_HDMI, /* /< [16 bits data address.] */
+};
+
+enum SIF_BIT_T {
+	SIF_8_BIT, /* /< [8 bits data address.] */
+	SIF_16_BIT, /* /< [16 bits data address.] */
+};
+
+static inline bool mtk_ddc_readbit(struct mtk_hdmi_ddc *ddc, unsigned short reg,
+				   unsigned int offset)
+{
+	return (readl(ddc->regs + reg) & offset) ? true : false;
+}
+
+static inline unsigned int mtk_ddc_read(struct mtk_hdmi_ddc *ddc,
+					unsigned short reg)
+{
+	return readl(ddc->regs + reg);
+}
+
+static inline void mtk_ddc_write(struct mtk_hdmi_ddc *ddc, unsigned short reg,
+				 unsigned int val)
+{
+	writel(val, ddc->regs + reg);
+}
+
+static inline void mtk_ddc_mask(struct mtk_hdmi_ddc *ddc, unsigned int reg,
+				unsigned int val, unsigned int mask)
+{
+	unsigned int tmp;
+
+	tmp = readl(ddc->regs + reg) & ~mask;
+	tmp |= (val & mask);
+	writel(tmp, ddc->regs + reg);
+}
+
+static void hdmi_ddc_request(struct mtk_hdmi_ddc *ddc)
+{
+	mtk_ddc_mask(ddc, HDCP2X_POL_CTRL, HDCP2X_DIS_POLL_EN,
+		     HDCP2X_DIS_POLL_EN);
+}
+
+static void DDC_WR_ONE(struct mtk_hdmi_ddc *ddc, unsigned int addr_id,
+		       unsigned int offset_id, unsigned char wr_data)
+{
+	unsigned int i;
+
+	if (mtk_ddc_read(ddc, HDCP2X_DDCM_STATUS) & DDC_I2C_BUS_LOW) {
+		mtk_ddc_mask(ddc, DDC_CTRL, (CLOCK_SCL << DDC_CMD_SHIFT),
+			     DDC_CMD);
+		udelay(250);
+	}
+	mtk_ddc_mask(ddc, HPD_DDC_CTRL, DDC2_CLOK << DDC_DELAY_CNT_SHIFT,
+		     DDC_DELAY_CNT);
+	mtk_ddc_write(ddc, SI2C_CTRL, SI2C_ADDR_READ << SI2C_ADDR_SHIFT);
+	mtk_ddc_mask(ddc, SI2C_CTRL, wr_data << SI2C_WDATA_SHIFT, SI2C_WDATA);
+	mtk_ddc_mask(ddc, SI2C_CTRL, SI2C_WR, SI2C_WR);
+
+	mtk_ddc_write(ddc, DDC_CTRL,
+		      (SEQ_WRITE_REQ_ACK << DDC_CMD_SHIFT) +
+			      (1 << DDC_DIN_CNT_SHIFT) +
+			      (offset_id << DDC_OFFSET_SHIFT) + (addr_id << 1));
+
+	for (i = 0; i < 5; i++)
+		udelay(200);
+
+	if ((mtk_ddc_read(ddc, HDCP2X_DDCM_STATUS) &
+	     (DDC_I2C_NO_ACK | DDC_I2C_BUS_LOW))) {
+		if (mtk_ddc_read(ddc, HDCP2X_DDCM_STATUS) & DDC_I2C_BUS_LOW) {
+			mtk_ddc_mask(ddc, DDC_CTRL,
+				     (CLOCK_SCL << DDC_CMD_SHIFT), DDC_CMD);
+			udelay(250);
+		}
+	}
+}
+
+static unsigned char
+_DDCMRead_hdmi(struct mtk_hdmi_ddc *ddc, unsigned char ucCurAddrMode,
+	       unsigned int u4ClkDiv, unsigned char ucDev, unsigned int u4Addr,
+	       enum SIF_BIT_T_HDMI ucAddrType, unsigned char *pucValue,
+	       unsigned int u4Count)
+{
+	unsigned int i, temp_length, loop_counter, temp_ksvlist, device_n;
+	unsigned int ucReadCount, ucIdx;
+	unsigned long DdcStartTime, DdcEndTime, DdcTimeOut;
+
+	if ((pucValue == NULL) || (u4Count == 0) || (u4ClkDiv == 0))
+		return 0;
+
+	ucIdx = 0;
+	if (mtk_ddc_read(ddc, HDCP2X_DDCM_STATUS) & DDC_I2C_BUS_LOW) {
+		mtk_ddc_mask(ddc, DDC_CTRL, (CLOCK_SCL << DDC_CMD_SHIFT),
+			     DDC_CMD);
+		udelay(250);
+	}
+
+	mtk_ddc_mask(ddc, DDC_CTRL, (CLEAR_FIFO << DDC_CMD_SHIFT), DDC_CMD);
+
+	if (u4Addr == 0x43) {
+		mtk_ddc_write(ddc, DDC_CTRL,
+			      (SEQ_READ_NO_ACK << DDC_CMD_SHIFT) +
+				      (u4Count << DDC_DIN_CNT_SHIFT) +
+				      (u4Addr << DDC_OFFSET_SHIFT) +
+				      (ucDev << 1));
+		udelay(250);
+		udelay(250);
+		udelay(200);
+
+		if (u4Count > 10)
+			temp_ksvlist = 10;
+		else
+			temp_ksvlist = u4Count;
+
+		for (ucIdx = 0; ucIdx < temp_ksvlist; ucIdx++) {
+			mtk_ddc_write(ddc, SI2C_CTRL,
+				      (SI2C_ADDR_READ << SI2C_ADDR_SHIFT) +
+					      SI2C_RD);
+			mtk_ddc_write(ddc, SI2C_CTRL,
+				      (SI2C_ADDR_READ << SI2C_ADDR_SHIFT) +
+					      SI2C_CONFIRM_READ);
+
+			pucValue[ucIdx] = (mtk_ddc_read(ddc, HPD_DDC_STATUS) &
+					   DDC_DATA_OUT) >>
+					  DDC_DATA_OUT_SHIFT;
+			udelay(100);
+		}
+
+		if (u4Count == temp_ksvlist)
+			return (ucIdx + 1);
+
+		udelay(250);
+		udelay(250);
+
+		if (u4Count / 5 == 3)
+			device_n = 5;
+		else
+			device_n = 10;
+
+		for (ucIdx = 10; ucIdx < (10 + device_n); ucIdx++) {
+			mtk_ddc_write(ddc, SI2C_CTRL,
+				      (SI2C_ADDR_READ << SI2C_ADDR_SHIFT) +
+					      SI2C_RD);
+			mtk_ddc_write(ddc, SI2C_CTRL,
+				      (SI2C_ADDR_READ << SI2C_ADDR_SHIFT) +
+					      SI2C_CONFIRM_READ);
+
+			pucValue[ucIdx] = (mtk_ddc_read(ddc, HPD_DDC_STATUS) &
+					   DDC_DATA_OUT) >>
+					  DDC_DATA_OUT_SHIFT;
+			udelay(100);
+		}
+
+		if (u4Count == (10 + device_n))
+			return (ucIdx + 1);
+
+		udelay(250);
+		udelay(250);
+
+		if (u4Count / 5 == 5)
+			device_n = 5;
+		else
+			device_n = 10;
+
+		for (ucIdx = 20; ucIdx < (20 + device_n); ucIdx++) {
+			mtk_ddc_write(ddc, SI2C_CTRL,
+				      (SI2C_ADDR_READ << SI2C_ADDR_SHIFT) +
+					      SI2C_RD);
+			mtk_ddc_write(ddc, SI2C_CTRL,
+				      (SI2C_ADDR_READ << SI2C_ADDR_SHIFT) +
+					      SI2C_CONFIRM_READ);
+
+			pucValue[ucIdx] = (mtk_ddc_read(ddc, HPD_DDC_STATUS) &
+					   DDC_DATA_OUT) >>
+					  DDC_DATA_OUT_SHIFT;
+			udelay(100);
+		}
+
+		if (u4Count == (20 + device_n))
+			return (ucIdx + 1);
+
+		udelay(250);
+		udelay(250);
+
+		if (u4Count / 5 == 7)
+			device_n = 5;
+		else
+			device_n = 10;
+
+		for (ucIdx = 30; ucIdx < (30 + device_n); ucIdx++) {
+			mtk_ddc_write(ddc, SI2C_CTRL,
+				      (SI2C_ADDR_READ << SI2C_ADDR_SHIFT) +
+					      SI2C_RD);
+			mtk_ddc_write(ddc, SI2C_CTRL,
+				      (SI2C_ADDR_READ << SI2C_ADDR_SHIFT) +
+					      SI2C_CONFIRM_READ);
+
+			pucValue[ucIdx] = (mtk_ddc_read(ddc, HPD_DDC_STATUS) &
+					   DDC_DATA_OUT) >>
+					  DDC_DATA_OUT_SHIFT;
+			udelay(100);
+		}
+
+		if (u4Count == (30 + device_n))
+			return (ucIdx + 1);
+
+		udelay(250);
+		udelay(250);
+
+		for (ucIdx = 40; ucIdx < (40 + 5); ucIdx++) {
+			mtk_ddc_write(ddc, SI2C_CTRL,
+				      (SI2C_ADDR_READ << SI2C_ADDR_SHIFT) +
+					      SI2C_RD);
+			mtk_ddc_write(ddc, SI2C_CTRL,
+				      (SI2C_ADDR_READ << SI2C_ADDR_SHIFT) +
+					      SI2C_CONFIRM_READ);
+
+			pucValue[ucIdx] = (mtk_ddc_read(ddc, HPD_DDC_STATUS) &
+					   DDC_DATA_OUT) >>
+					  DDC_DATA_OUT_SHIFT;
+			udelay(100);
+		}
+
+		if (u4Count == 45)
+			return (ucIdx + 1);
+	} else {
+		if (u4Count >= 16) {
+			temp_length = 16;
+			loop_counter =
+				u4Count / 16 + ((u4Count % 16 == 0) ? 0 : 1);
+		} else {
+			temp_length = u4Count;
+			loop_counter = 1;
+		}
+		if (ucDev >= EDID_ID) {
+			if (u4ClkDiv < DDC2_CLOK_EDID)
+				u4ClkDiv = DDC2_CLOK_EDID;
+		}
+		mtk_ddc_mask(ddc, HPD_DDC_CTRL, u4ClkDiv << DDC_DELAY_CNT_SHIFT,
+			     DDC_DELAY_CNT);
+		for (i = 0; i < loop_counter; i++) {
+			if ((i == (loop_counter - 1)) && (i != 0) &&
+			    (u4Count % 16))
+				temp_length = u4Count % 16;
+
+			if (ucDev > EDID_ID) {
+				mtk_ddc_mask(ddc, SCDC_CTRL,
+					     (ucDev - EDID_ID)
+						     << DDC_SEGMENT_SHIFT,
+					     DDC_SEGMENT);
+				mtk_ddc_write(
+					ddc, DDC_CTRL,
+					(ENH_READ_NO_ACK << DDC_CMD_SHIFT) +
+						(temp_length
+						 << DDC_DIN_CNT_SHIFT) +
+						((u4Addr + i * temp_length)
+						 << DDC_OFFSET_SHIFT) +
+						(EDID_ID << 1));
+			} else {
+				mtk_ddc_write(
+					ddc, DDC_CTRL,
+					(SEQ_READ_NO_ACK << DDC_CMD_SHIFT) +
+						(temp_length
+						 << DDC_DIN_CNT_SHIFT) +
+						((u4Addr + ((u4Addr == 0x43) ?
+									  0 :
+									  (i * 16)))
+						 << DDC_OFFSET_SHIFT) +
+						(ucDev << 1));
+			}
+			mdelay(2);
+			DdcStartTime = jiffies;
+			DdcTimeOut = temp_length + 5;
+			DdcEndTime = DdcStartTime + (DdcTimeOut)*HZ / 1000;
+			while (1) {
+				if ((mtk_ddc_read(ddc, HPD_DDC_STATUS) &
+				     DDC_I2C_IN_PROG) == 0)
+					break;
+
+				if (time_after(jiffies, DdcEndTime)) {
+					pr_info("[HDMI][DDC] error: time out\n");
+					return 0;
+				}
+				mdelay(1);
+			}
+			if ((mtk_ddc_read(ddc, HDCP2X_DDCM_STATUS) &
+			     (DDC_I2C_NO_ACK | DDC_I2C_BUS_LOW))) {
+				if (mtk_ddc_read(ddc, HDCP2X_DDCM_STATUS) &
+				    DDC_I2C_BUS_LOW) {
+					mtk_ddc_mask(ddc, DDC_CTRL,
+						     (CLOCK_SCL
+						      << DDC_CMD_SHIFT),
+						     DDC_CMD);
+					udelay(250);
+				}
+				return 0;
+			}
+			for (ucIdx = 0; ucIdx < temp_length; ucIdx++) {
+				mtk_ddc_write(ddc, SI2C_CTRL,
+					      (SI2C_ADDR_READ
+					       << SI2C_ADDR_SHIFT) +
+						      SI2C_RD);
+				mtk_ddc_write(ddc, SI2C_CTRL,
+					      (SI2C_ADDR_READ
+					       << SI2C_ADDR_SHIFT) +
+						      SI2C_CONFIRM_READ);
+
+				pucValue[i * 16 + ucIdx] =
+					(mtk_ddc_read(ddc, HPD_DDC_STATUS) &
+					 DDC_DATA_OUT) >>
+					DDC_DATA_OUT_SHIFT;
+				/*
+				 * when reading edid, if hdmi module been reset,
+				 * ddc will fail and it's
+				 *speed will be set to 400.
+				 */
+				if (((mtk_ddc_read(ddc, HPD_DDC_CTRL) >> 16) &
+				     0xFFFF) < DDC2_CLOK)
+					return 0;
+
+				ucReadCount = i * 16 + ucIdx + 1;
+			}
+		}
+		return ucReadCount;
+	}
+	return 0;
+}
+
+static unsigned char vDDCRead(struct mtk_hdmi_ddc *ddc, unsigned int u4ClkDiv,
+			      unsigned char ucDev, unsigned int u4Addr,
+			      enum SIF_BIT_T_HDMI ucAddrType,
+			      unsigned char *pucValue, unsigned int u4Count)
+{
+	unsigned int u4ReadCount = 0;
+	unsigned char ucReturnVaule = 0;
+
+	if ((pucValue == NULL) || (u4Count == 0) || (u4ClkDiv == 0) ||
+	    (ucAddrType > SIF_16_BIT_HDMI) ||
+	    ((ucAddrType == SIF_8_BIT_HDMI) && (u4Addr > 255)) ||
+	    ((ucAddrType == SIF_16_BIT_HDMI) && (u4Addr > 65535))) {
+		return 0;
+	}
+
+	if (ucAddrType == SIF_8_BIT_HDMI)
+		u4ReadCount = ((255 - u4Addr) + 1);
+	else if (ucAddrType == SIF_16_BIT_HDMI)
+		u4ReadCount = ((65535 - u4Addr) + 1);
+
+	u4ReadCount = (u4ReadCount > u4Count) ? u4Count : u4ReadCount;
+	ucReturnVaule = _DDCMRead_hdmi(ddc, 0, u4ClkDiv, ucDev, u4Addr,
+				       ucAddrType, pucValue, u4ReadCount);
+	return ucReturnVaule;
+}
+
+static unsigned char fgDDCDataRead(struct mtk_hdmi_ddc *ddc, unsigned char bDevice,
+			    unsigned char bData_Addr, unsigned char bDataCount,
+			    unsigned char *prData)
+{
+	bool flag;
+
+	mutex_lock(&ddc->mtx);
+
+	hdmi_ddc_request(ddc);
+	if (vDDCRead(ddc, DDC2_CLOK, (unsigned char)bDevice,
+		     (unsigned int)bData_Addr, SIF_8_BIT_HDMI,
+		     (unsigned char *)prData,
+		     (unsigned int)bDataCount) == bDataCount) {
+		flag = true;
+	} else {
+		flag = false;
+	}
+
+	mutex_unlock(&ddc->mtx);
+	return flag;
+}
+
+static unsigned char fgDDCDataWrite(struct mtk_hdmi_ddc *ddc,
+				    unsigned char bDevice,
+				    unsigned char bData_Addr,
+				    unsigned char bDataCount,
+				    unsigned char *prData)
+{
+	unsigned int i;
+
+	mutex_lock(&ddc->mtx);
+
+	hdmi_ddc_request(ddc);
+	for (i = 0; i < bDataCount; i++)
+		DDC_WR_ONE(ddc, bDevice, bData_Addr + i, *(prData + i));
+
+	mutex_unlock(&ddc->mtx);
+	return 1;
+}
+
+static int mtk_hdmi_ddc_xfer(struct i2c_adapter *adapter, struct i2c_msg *msgs,
+			     int num)
+{
+	struct mtk_hdmi_ddc *ddc = adapter->algo_data;
+	struct device *dev = adapter->dev.parent;
+	int ret;
+	int i;
+
+	if (!ddc)
+		return -EINVAL;
+
+	for (i = 0; i < num; i++) {
+		struct i2c_msg *msg = &msgs[i];
+
+		if (msg->flags & I2C_M_RD)
+			ret = fgDDCDataRead(ddc, msg->addr, msg->buf[0],
+					    (msg->len), &msg->buf[0]);
+		else
+			ret = fgDDCDataWrite(ddc, msg->addr, msg->buf[0],
+					     (msg->len - 1), &msg->buf[1]);
+
+		if (ret <= 0)
+			goto xfer_end;
+	}
+
+	return i;
+
+xfer_end:
+	dev_err(dev, "ddc failed!\n");
+	return ret;
+}
+
+static u32 mtk_hdmi_ddc_func(struct i2c_adapter *adapter)
+{
+	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
+}
+
+static const struct i2c_algorithm mtk_hdmi_ddc_algorithm = {
+	.master_xfer = mtk_hdmi_ddc_xfer,
+	.functionality = mtk_hdmi_ddc_func,
+};
+
+static int mtk_hdmi_ddc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mtk_hdmi_ddc *ddc;
+	int ret;
+
+	ddc = devm_kzalloc(dev, sizeof(struct mtk_hdmi_ddc), GFP_KERNEL);
+	if (!ddc)
+		return -ENOMEM;
+
+	ddc->clk = devm_clk_get(dev, "ddc-i2c");
+	if (IS_ERR(ddc->clk)) {
+		dev_err(dev, "get ddc_clk failed: %p ,\n", ddc->clk);
+		return PTR_ERR(ddc->clk);
+	}
+	ret = clk_prepare_enable(ddc->clk);
+	if (ret) {
+		dev_err(dev, "enable ddc clk failed!\n");
+		return ret;
+	}
+
+	mutex_init(&ddc->mtx);
+
+	strscpy(ddc->adap.name, "mediatek-hdmi-ddc", sizeof(ddc->adap.name));
+	ddc->adap.owner = THIS_MODULE;
+	ddc->adap.class = I2C_CLASS_DDC;
+	ddc->adap.algo = &mtk_hdmi_ddc_algorithm;
+	ddc->adap.retries = 3;
+	ddc->adap.dev.of_node = dev->of_node;
+	ddc->adap.algo_data = ddc;
+	ddc->adap.dev.parent = &pdev->dev;
+
+	ret = i2c_add_adapter(&ddc->adap);
+	if (ret < 0) {
+		dev_err(dev, "failed to add bus to i2c core\n");
+		goto err_clk_disable;
+	}
+
+	platform_set_drvdata(pdev, ddc);
+	return 0;
+
+err_clk_disable:
+	clk_disable_unprepare(ddc->clk);
+	return ret;
+}
+
+static int mtk_hdmi_ddc_remove(struct platform_device *pdev)
+{
+	struct mtk_hdmi_ddc *ddc = platform_get_drvdata(pdev);
+
+	mutex_destroy(&ddc->mtx);
+	i2c_del_adapter(&ddc->adap);
+	clk_disable_unprepare(ddc->clk);
+
+	return 0;
+}
+
+static const struct of_device_id mtk_hdmi_ddc_match[] = {
+	{
+		.compatible = "mediatek,mt8195-hdmi-ddc",
+	},
+	{},
+};
+
+struct platform_driver mtk_hdmi_mt8195_ddc_driver = {
+	.probe = mtk_hdmi_ddc_probe,
+	.remove = mtk_hdmi_ddc_remove,
+	.driver = {
+		.name = "mediatek-hdmi-mt8195-ddc",
+		.of_match_table = mtk_hdmi_ddc_match,
+	},
+};
+
+MODULE_AUTHOR("Can Zeng <can.zeng@mediatek.com>");
+MODULE_DESCRIPTION("MediaTek HDMI DDC Driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/gpu/drm/mediatek/mtk_mt8195_hdmi_ddc.h b/drivers/gpu/drm/mediatek/mtk_mt8195_hdmi_ddc.h
new file mode 100644
index 000000000000..40139120411c
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/mtk_mt8195_hdmi_ddc.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2019 MediaTek Inc.
+ */
+
+#ifndef _MTK_DDC_H
+#define _MTK_DDC_H
+
+#include <linux/clk.h>
+#include <linux/i2c.h>
+#include <linux/mutex.h>
+
+struct mtk_hdmi_ddc {
+	struct mutex mtx;
+	struct i2c_adapter adap;
+	struct clk *clk;
+	void __iomem *regs;
+};
+
+#endif /* _MTK_DDC_H */
diff --git a/drivers/gpu/drm/mediatek/mtk_mt8195_hdmi_regs.h b/drivers/gpu/drm/mediatek/mtk_mt8195_hdmi_regs.h
new file mode 100644
index 000000000000..d31dd50242f3
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/mtk_mt8195_hdmi_regs.h
@@ -0,0 +1,276 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2019 MediaTek Inc.
+ */
+
+#ifndef _MTK_HDMI_REGS_H
+#define _MTK_HDMI_REGS_H
+
+#define AIF_HEADER (0x00FFFFFF << 0)
+#define AIF_PKT00 (0xFFFFFFFF << 0)
+#define AIF_PKT01 (0x00FFFFFF << 0)
+#define AIF_PKT02 (0xFFFFFFFF << 0)
+#define AIF_PKT03 (0x00FFFFFF << 0)
+#define AIP_CTRL 0x400
+#define AIP_CTS_SVAL 0x408
+#define AIP_DOWNSAMPLE_CTRL 0x41C
+#define AIP_I2S_CHST0 0x414
+#define AIP_I2S_CHST1 0x418
+#define AIP_I2S_CTRL 0x410
+#define AIP_N_VAL 0x404
+#define AIP_SPDIF_CTRL 0x40C
+#define AIP_TPI_CTRL 0x428
+#define AIP_TXCTRL 0x424
+#define AUD_DIS (0x0 << 2)
+#define AUD_DIS_WR (0x0 << 18)
+#define AUD_EN (0x1 << 2)
+#define AUD_EN_WR (0x1 << 18)
+#define AUD_ERR_THRESH (0x3F << 24)
+#define AUD_ERR_THRESH_SHIFT 24
+#define AUD_IN_EN (1 << 8)
+#define AUD_IN_EN_SHIFT 8
+#define AUD_MUTE_DIS (0x0 << 5)
+#define AUD_MUTE_FIFO_EN (0x1 << 5)
+#define AUD_PACKET_DROP (0x1 << 6)
+#define AUD_RPT_DIS (0x0 << 2)
+#define AUD_RPT_EN (0x1 << 2)
+#define AUD_SEL_OWRT (1 << 9)
+#define AVI_DIS (0x0 << 0)
+#define AVI_DIS_WR (0x0 << 16)
+#define AVI_EN (0x1 << 0)
+#define AVI_EN_WR (0x1 << 16)
+#define AVI_HEADER (0xFFFFFF << 0)
+#define AVI_PKT00 (0xFFFFFFFF << 0)
+#define AVI_PKT01 (0xFFFFFF << 0)
+#define AVI_PKT02 (0xFFFFFFFF << 0)
+#define AVI_PKT03 (0xFFFFFF << 0)
+#define AVI_PKT04 (0xFFFFFFFF << 0)
+#define AVI_PKT05 (0xFFFFFF << 0)
+#define AVI_RPT_DIS (0x0 << 0)
+#define AVI_RPT_EN (0x1 << 0)
+#define C422_C420_CONFIG_BYPASS (0x1 << 5)
+#define C422_C420_CONFIG_ENABLE (0x1 << 4)
+#define C422_C420_CONFIG_OUT_CB_OR_CR (0x1 << 6)
+#define C444_C422_CONFIG_ENABLE (0x1 << 0)
+#define CBIT_ORDER_SAME (0x1 << 13)
+#define CEA_AUD_EN (1 << 9)
+#define CEA_AVI_EN (1 << 11)
+#define CEA_CP_EN (1 << 6)
+#define CEA_SPD_EN (1 << 10)
+#define CLEAR_FIFO 0x9
+#define CLOCK_SCL 0xA
+#define CP_CLR_MUTE_EN (1 << 1)
+#define CP_EN (0x1 << 5)
+#define CP_EN_WR (0x1 << 21)
+#define CP_RPT_EN (0x1 << 5)
+#define CP_SET_MUTE_DIS (0 << 0)
+#define CP_SET_MUTE_EN (1 << 0)
+#define CTS_CAL_N4 (1 << 23)
+#define CTS_REQ_EN (1 << 1)
+#define CTS_SW_SEL (1 << 0)
+#define C_SD0 (0x0 << 0)
+#define C_SD1 (0x1 << 4)
+#define C_SD2 (0x2 << 8)
+#define C_SD3 (0x3 << 12)
+#define C_SD4 (0x4 << 16)
+#define C_SD5 (0x5 << 20)
+#define C_SD6 (0x6 << 24)
+#define C_SD7 (0x7 << 28)
+#define DATA_DIR_LSB (0x1 << 9)
+#define DATA_DIR_MSB (0x0 << 9)
+#define DDC_CMD (0xF << 28)
+#define DDC_CMD_SHIFT (28)
+#define DDC_CTRL 0xC10
+#define DDC_DATA_OUT (0xFF << 16)
+#define DDC_DATA_OUT_CNT (0x1F << 8)
+#define DDC_DATA_OUT_SHIFT (16)
+#define DDC_DELAY_CNT (0xFFFF << 16)
+#define DDC_DELAY_CNT_SHIFT (16)
+#define DDC_DIN_CNT (0x3FF << 16)
+#define DDC_DIN_CNT_SHIFT (16)
+#define DDC_I2C_BUS_LOW (0x1 << 11)
+#define DDC_I2C_IN_PROG (0x1 << 13)
+#define DDC_I2C_IN_PROG_INT_CLR (1 << 29)
+#define DDC_I2C_IN_PROG_INT_MASK (0 << 29)
+#define DDC_I2C_IN_PROG_INT_STA (1 << 29)
+#define DDC_I2C_IN_PROG_INT_UNCLR (0 << 29)
+#define DDC_I2C_IN_PROG_INT_UNMASK (1 << 29)
+#define DDC_I2C_NO_ACK (0x1 << 10)
+#define DDC_OFFSET (0xFF << 8)
+#define DDC_OFFSET_SHIFT (8)
+#define DDC_SEGMENT (0xFF << 8)
+#define DDC_SEGMENT_SHIFT (8)
+#define DEEPCOLOR_MODE_10BIT (1 << 8)
+#define DEEPCOLOR_MODE_12BIT (2 << 8)
+#define DEEPCOLOR_MODE_16BIT (3 << 8)
+#define DEEPCOLOR_MODE_8BIT (0 << 8)
+#define DEEPCOLOR_MODE_MASKBIT (3 << 8)
+#define DEEPCOLOR_PAT_EN (1 << 12)
+#define DEEP_COLOR_ADD (0x1 << 4)
+#define DOWNSAMPLE 0x2
+#define DSD_EN (1 << 15)
+#define DSD_MUTE_DATA (0x1 << 7)
+#define ENH_READ_NO_ACK 0x4
+#define FIFO0_MAP (0x3 << 0)
+#define FIFO1_MAP (0x3 << 2)
+#define FIFO2_MAP (0x3 << 4)
+#define FIFO3_MAP (0x3 << 6)
+#define FS_OVERRIDE_WRITE (1 << 1)
+#define FS_UNOVERRIDE (0 << 1)
+#define HBRA_ON (1 << 14)
+#define HBR_FROM_SPDIF (1 << 20)
+#define HDCP1X_CTRL 0xCD0
+#define HDCP1X_ENC_EN (0x1 << 6)
+#define HDCP1X_ENC_EN_SHIFT (6)
+#define HDCP2X_CTRL_0 0xC20
+#define HDCP2X_DDCM_STATUS 0xC68
+#define HDCP2X_DIS_POLL_EN (0x1 << 16)
+#define HDCP2X_EN (0x1 << 0)
+#define HDCP2X_ENCRYPTING_ON (0x1 << 10)
+#define HDCP2X_ENCRYPT_EN (0x1 << 7)
+#define HDCP2X_ENCRYPT_EN_SHIFT (7)
+#define HDCP2X_HPD_OVR (0x1 << 10)
+#define HDCP2X_HPD_SW (0x1 << 11)
+#define HDCP2X_POL_CTRL 0xC54
+#define HDCP2X_RX_REAUTH_REQ_DDCM_INT_MASK (0 << 25)
+#define HDCP2X_RX_REAUTH_REQ_DDCM_INT_UNMASK (1 << 25)
+#define HDCP_ENABLE (0x0 << 0)
+#define HDCP_ENCRYPTING_ON (0x1 << 26)
+#define HDCP_TOP_CTRL 0xC00
+#define HDMI2_OFF (0 << 2)
+#define HDMI2_ON (1 << 2)
+#define HDMITX_CONFIG 0x900
+#define HDMITX_SW_HPD BIT(29)
+#define HDMITX_SW_HPD_SHIFT (29)
+#define HDMITX_SW_RSTB BIT(31)
+#define HDMITX_SW_RSTB_SHIFT (31)
+#define HDMI_MODE_DVI (0 << 3)
+#define HDMI_MODE_HDMI (1 << 3)
+#define HDMI_YUV420_MODE BIT(10)
+#define HDMI_YUV420_MODE_SHIFT (10)
+#define HPD_DDC_CTRL 0xC08
+#define HPD_DDC_STATUS 0xC60
+#define HPD_PIN_STA (0x1 << 4)
+#define HPD_STATE (0x3 << 0)
+#define HPD_STATE_CONNECTED (2)
+#define HPD_STATE_DISCONNECTED (0)
+#define HPD_STATE_SHIFT (0)
+#define HTPLG_F_INT_STA (1 << 1)
+#define HTPLG_R_INT_STA (1 << 0)
+#define I2S2DSD_EN (1 << 30)
+#define I2S_1ST_BIT_NOSHIFT (0x1 << 8)
+#define I2S_EN (0xF << 16)
+#define I2S_EN_SHIFT 16
+#define JUSTIFY_RIGHT (0x1 << 10)
+#define LAYOUT (0x1 << 18)
+#define LAYOUT0 (0x0 << 4)
+#define LAYOUT1 (0x1 << 4)
+#define LFE_CC_SWAP (0x01 << 1)
+#define MAP_SD0 0x0
+#define MAP_SD1 0x1
+#define MAP_SD2 0x2
+#define MAP_SD3 0x3
+#define MAX_1UI_WRITE (0xFF << 8)
+#define MAX_1UI_WRITE_SHIFT 8
+#define MAX_2UI_WRITE (0xFF << 16)
+#define MAX_2UI_WRITE_SHIFT 16
+#define MCLK_1152FS 0x6
+#define MCLK_128FS 0x0
+#define MCLK_192FS 0x7
+#define MCLK_256FS 0x1
+#define MCLK_384FS 0x2
+#define MCLK_512FS 0x3
+#define MCLK_768FS 0x4
+#define MCLK_CTSGEN_SEL (0 << 3)
+#define MCLK_EN (1 << 2)
+#define NO_MCLK_CTSGEN_SEL (1 << 3)
+#define NULL_PKT_EN (1 << 2)
+#define NULL_PKT_VSYNC_HIGH_EN (1 << 3)
+#define OUTPUT_FORMAT_DEMUX_420_ENABLE (0x1 << 10)
+#define PORD_F_INT_STA (1 << 3)
+#define PORD_PIN_STA (0x1 << 5)
+#define PORD_R_INT_STA (1 << 2)
+#define REG_VMUTE_EN (1 << 16)
+#define RST4AUDIO (0x1 << 0)
+#define RST4AUDIO_ACR (0x1 << 2)
+#define RST4AUDIO_FIFO (0x1 << 1)
+#define SCDC_CTRL 0xC18
+#define SCK_EDGE_RISE (0x1 << 14)
+#define SCR_OFF (0 << 4)
+#define SCR_ON (1 << 4)
+#define SEQ_READ_NO_ACK 0x2
+#define SEQ_WRITE_REQ_ACK 0x7
+#define SI2C_ADDR (0xFFFF << 16)
+#define SI2C_ADDR_READ (0xF4)
+#define SI2C_ADDR_SHIFT (16)
+#define SI2C_CONFIRM_READ (0x1 << 2)
+#define SI2C_CTRL 0xCAC
+#define SI2C_RD (0x1 << 1)
+#define SI2C_WDATA (0xFF << 8)
+#define SI2C_WDATA_SHIFT (8)
+#define SI2C_WR (0x1 << 0)
+#define SPDIF_EN (1 << 13)
+#define SPDIF_EN_SHIFT 13
+#define SPDIF_HEADER (0x00FFFFFF << 0)
+#define SPDIF_INTERNAL_MODULE (1 << 24)
+#define SPDIF_PKT00 (0xFFFFFFFF << 0)
+#define SPDIF_PKT01 (0x00FFFFFF << 0)
+#define SPDIF_PKT02 (0xFFFFFFFF << 0)
+#define SPDIF_PKT03 (0x00FFFFFF << 0)
+#define SPDIF_PKT04 (0xFFFFFFFF << 0)
+#define SPDIF_PKT05 (0x00FFFFFF << 0)
+#define SPDIF_PKT06 (0xFFFFFFFF << 0)
+#define SPDIF_PKT07 (0x00FFFFFF << 0)
+#define SPD_DIS (0x0 << 1)
+#define SPD_DIS_WR (0x0 << 17)
+#define SPD_EN (0x1 << 1)
+#define SPD_EN_WR (0x1 << 17)
+#define SPD_RPT_DIS (0x0 << 1)
+#define SPD_RPT_EN (0x1 << 1)
+#define TOP_AIF_HEADER 0x040
+#define TOP_AIF_PKT00 0x044
+#define TOP_AIF_PKT01 0x048
+#define TOP_AIF_PKT02 0x04C
+#define TOP_AIF_PKT03 0x050
+#define TOP_AUD_MAP 0x00C
+#define TOP_AVI_HEADER 0x024
+#define TOP_AVI_PKT00 0x028
+#define TOP_AVI_PKT01 0x02C
+#define TOP_AVI_PKT02 0x030
+#define TOP_AVI_PKT03 0x034
+#define TOP_AVI_PKT04 0x038
+#define TOP_AVI_PKT05 0x03C
+#define TOP_CFG00 0x000
+#define TOP_CFG01 0x004
+#define TOP_INFO_EN 0x01C
+#define TOP_INFO_EN_EXPAND 0x368
+#define TOP_INFO_RPT 0x020
+#define TOP_INT_CLR00 0x1B8
+#define TOP_INT_CLR01 0x1BC
+#define TOP_INT_MASK00 0x1B0
+#define TOP_INT_MASK01 0x1B4
+#define TOP_INT_STA00 0x1A8
+#define TOP_MISC_CTLR 0x1A4
+#define TOP_SPDIF_HEADER 0x054
+#define TOP_SPDIF_PKT00 0x058
+#define TOP_SPDIF_PKT01 0x05C
+#define TOP_SPDIF_PKT02 0x060
+#define TOP_SPDIF_PKT03 0x064
+#define TOP_SPDIF_PKT04 0x068
+#define TOP_SPDIF_PKT05 0x06C
+#define TOP_SPDIF_PKT06 0x070
+#define TOP_SPDIF_PKT07 0x074
+#define TOP_VMUTE_CFG1 0x1C8
+#define TPI_AUDIO_LOOKUP_DIS (0x0 << 2)
+#define TPI_AUDIO_LOOKUP_EN (0x1 << 2)
+#define VBIT_COM (0x1 << 12)
+#define VBIT_PCM (0x0 << 12)
+#define VID_DOWNSAMPLE_CONFIG 0x8F0
+#define VID_OUT_FORMAT 0x8FC
+#define WR_1UI_LOCK (1 << 0)
+#define WR_1UI_UNLOCK (0 << 0)
+#define WR_2UI_LOCK (1 << 2)
+#define WR_2UI_UNLOCK (0 << 2)
+#define WS_HIGH (0x1 << 11)
+
+#endif /* _MTK_HDMI_REGS_H */
-- 
2.31.1

