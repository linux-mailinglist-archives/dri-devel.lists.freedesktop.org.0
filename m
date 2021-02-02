Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDE730B9CB
	for <lists+dri-devel@lfdr.de>; Tue,  2 Feb 2021 09:28:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4629E6E8EB;
	Tue,  2 Feb 2021 08:27:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26D996E8D8
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Feb 2021 08:12:48 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id q72so385451pjq.2
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Feb 2021 00:12:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rjkiW+XLW06vCU5h8uhk5dbdlk9RBhNk59h0o+CGoEM=;
 b=ZuWPNbeDw480yQyQP3umt7xA8md0itCAkGSGUvJ62NxVCVnlQitV+rvjlMECy49vOO
 SLzVlIOrfZkOfJtYS+wXSmAwKhniY1ZIIR85+nXhz0Ln5q3p9FZ03Ck9l9hyAzXDuxqG
 hDDg7L57lDi4W7c0uxtwPguCnQN7vgIopPvZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rjkiW+XLW06vCU5h8uhk5dbdlk9RBhNk59h0o+CGoEM=;
 b=mNR/kbSqeR53v34hbZNU1Z4uzpbfoKY1kh6FSL6Dv9RGPYR6MHJNBYHaffJRn2Q5K9
 M9vDdbHAHy+BlyE/RqI1eoSTyFcRTfgv7G4evswORGZmXj3ZsE5sRz53WO5GdZSA+QPx
 qpXAKD2fk7TqlQoYBDBMP3gX1RbCB5VAG+KKF0JSbtJxSH1jsZ1hWykwRXUsI4dNnX2E
 HKC3zypVTHM0QgJG6OZTTpPvAVVY2Br4oGQspbzPaP2K1upgjxuns8AD2erXtMDJU31N
 vv4cBW0z/4KISc/sDWASXu+fTAB3nvmnRzwfBmpiwWlkJr6txR9JqnCIJoAw754sXoc+
 GGNg==
X-Gm-Message-State: AOAM532Eq30Ux0G2x3+DCyeuUf6ZNcNggyFlily8hslOinjJPCH7xUYh
 ZTwwCgnFIod+K6Kj6KFxTeio9Q==
X-Google-Smtp-Source: ABdhPJygjx/kvPGFD0rmfbQlJZ27a+UNM8xqhYv8IQ9UVMZD+uMUHoui2zAVP55fDlyjYkkAdzdlIg==
X-Received: by 2002:a17:902:6b43:b029:df:fb48:aecf with SMTP id
 g3-20020a1709026b43b02900dffb48aecfmr21050949plt.67.1612253567755; 
 Tue, 02 Feb 2021 00:12:47 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:743e:7944:50c8:ff72])
 by smtp.gmail.com with ESMTPSA id c8sm21343325pfo.148.2021.02.02.00.12.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 00:12:47 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v6 2/8] drm/mediatek: add component POSTMASK
Date: Tue,  2 Feb 2021 16:12:31 +0800
Message-Id: <20210202081237.774442-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
In-Reply-To: <20210202081237.774442-1-hsinyi@chromium.org>
References: <20210202081237.774442-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 02 Feb 2021 08:27:00 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Yongqiang Niu <yongqiang.niu@mediatek.com>

This patch add component POSTMASK.

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 102 ++++++++++++++------
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |   1 +
 2 files changed, 73 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index b6c4e73031ca6..0a84ae53eb72a 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -64,6 +64,12 @@
 
 #define AAL_EN					BIT(0)
 
+#define DISP_POSTMASK_EN			0x0000
+#define POSTMASK_EN				BIT(0)
+#define DISP_POSTMASK_CFG			0x0020
+#define POSTMASK_RELAY_MODE			BIT(0)
+#define DISP_POSTMASK_SIZE			0x0030
+
 #define DISP_DITHERING				BIT(2)
 #define DITHER_LSB_ERR_SHIFT_R(x)		(((x) & 0x7) << 28)
 #define DITHER_OVFLW_BIT_R(x)			(((x) & 0x7) << 24)
@@ -204,6 +210,32 @@ static void mtk_ufoe_start(struct device *dev)
 	writel(UFO_BYPASS, priv->regs + DISP_REG_UFO_START);
 }
 
+void mtk_postmask_config(struct device *dev, unsigned int w,
+			unsigned int h, unsigned int vrefresh,
+			unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
+{
+	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
+
+	mtk_ddp_write(cmdq_pkt, w << 16 | h, &priv->cmdq_reg, priv->regs,
+		      DISP_POSTMASK_SIZE);
+	mtk_ddp_write(cmdq_pkt, POSTMASK_RELAY_MODE, &priv->cmdq_reg,
+		      priv->regs, DISP_POSTMASK_CFG);
+}
+
+void mtk_postmask_start(struct device *dev)
+{
+	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
+
+	writel(POSTMASK_EN, priv->regs + DISP_POSTMASK_EN);
+}
+
+void mtk_postmask_stop(struct device *dev)
+{
+	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
+
+	writel_relaxed(0x0, priv->regs + DISP_POSTMASK_EN);
+}
+
 static void mtk_aal_config(struct device *dev, unsigned int w,
 			   unsigned int h, unsigned int vrefresh,
 			   unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
@@ -413,6 +445,14 @@ static const struct mtk_ddp_comp_funcs ddp_ovl = {
 	.bgclr_in_off = mtk_ovl_bgclr_in_off,
 };
 
+static const struct mtk_ddp_comp_funcs ddp_postmask = {
+	.clk_enable = mtk_ddp_clk_enable,
+	.clk_disable = mtk_ddp_clk_disable,
+	.config = mtk_postmask_config,
+	.start = mtk_postmask_start,
+	.stop = mtk_postmask_stop,
+};
+
 static const struct mtk_ddp_comp_funcs ddp_rdma = {
 	.clk_enable = mtk_rdma_clk_enable,
 	.clk_disable = mtk_rdma_clk_disable,
@@ -448,6 +488,7 @@ static const char * const mtk_ddp_comp_stem[MTK_DDP_COMP_TYPE_MAX] = {
 	[MTK_DISP_MUTEX] = "mutex",
 	[MTK_DISP_OD] = "od",
 	[MTK_DISP_BLS] = "bls",
+	[MTK_DISP_POSTMASK] = "postmask",
 };
 
 struct mtk_ddp_comp_match {
@@ -457,36 +498,37 @@ struct mtk_ddp_comp_match {
 };
 
 static const struct mtk_ddp_comp_match mtk_ddp_matches[DDP_COMPONENT_ID_MAX] = {
-	[DDP_COMPONENT_AAL0]	= { MTK_DISP_AAL,	0, &ddp_aal },
-	[DDP_COMPONENT_AAL1]	= { MTK_DISP_AAL,	1, &ddp_aal },
-	[DDP_COMPONENT_BLS]	= { MTK_DISP_BLS,	0, NULL },
-	[DDP_COMPONENT_CCORR]	= { MTK_DISP_CCORR,	0, &ddp_ccorr },
-	[DDP_COMPONENT_COLOR0]	= { MTK_DISP_COLOR,	0, &ddp_color },
-	[DDP_COMPONENT_COLOR1]	= { MTK_DISP_COLOR,	1, &ddp_color },
-	[DDP_COMPONENT_DITHER]	= { MTK_DISP_DITHER,	0, &ddp_dither },
-	[DDP_COMPONENT_DPI0]	= { MTK_DPI,		0, &ddp_dpi },
-	[DDP_COMPONENT_DPI1]	= { MTK_DPI,		1, &ddp_dpi },
-	[DDP_COMPONENT_DSI0]	= { MTK_DSI,		0, &ddp_dsi },
-	[DDP_COMPONENT_DSI1]	= { MTK_DSI,		1, &ddp_dsi },
-	[DDP_COMPONENT_DSI2]	= { MTK_DSI,		2, &ddp_dsi },
-	[DDP_COMPONENT_DSI3]	= { MTK_DSI,		3, &ddp_dsi },
-	[DDP_COMPONENT_GAMMA]	= { MTK_DISP_GAMMA,	0, &ddp_gamma },
-	[DDP_COMPONENT_OD0]	= { MTK_DISP_OD,	0, &ddp_od },
-	[DDP_COMPONENT_OD1]	= { MTK_DISP_OD,	1, &ddp_od },
-	[DDP_COMPONENT_OVL0]	= { MTK_DISP_OVL,	0, &ddp_ovl },
-	[DDP_COMPONENT_OVL1]	= { MTK_DISP_OVL,	1, &ddp_ovl },
-	[DDP_COMPONENT_OVL_2L0]	= { MTK_DISP_OVL_2L,	0, &ddp_ovl },
-	[DDP_COMPONENT_OVL_2L1]	= { MTK_DISP_OVL_2L,	1, &ddp_ovl },
-	[DDP_COMPONENT_OVL_2L2] = { MTK_DISP_OVL_2L,    2, &ddp_ovl },
-	[DDP_COMPONENT_PWM0]	= { MTK_DISP_PWM,	0, NULL },
-	[DDP_COMPONENT_PWM1]	= { MTK_DISP_PWM,	1, NULL },
-	[DDP_COMPONENT_PWM2]	= { MTK_DISP_PWM,	2, NULL },
-	[DDP_COMPONENT_RDMA0]	= { MTK_DISP_RDMA,	0, &ddp_rdma },
-	[DDP_COMPONENT_RDMA1]	= { MTK_DISP_RDMA,	1, &ddp_rdma },
-	[DDP_COMPONENT_RDMA2]	= { MTK_DISP_RDMA,	2, &ddp_rdma },
-	[DDP_COMPONENT_UFOE]	= { MTK_DISP_UFOE,	0, &ddp_ufoe },
-	[DDP_COMPONENT_WDMA0]	= { MTK_DISP_WDMA,	0, NULL },
-	[DDP_COMPONENT_WDMA1]	= { MTK_DISP_WDMA,	1, NULL },
+	[DDP_COMPONENT_AAL0]		= { MTK_DISP_AAL,	0, &ddp_aal },
+	[DDP_COMPONENT_AAL1]		= { MTK_DISP_AAL,	1, &ddp_aal },
+	[DDP_COMPONENT_BLS]		= { MTK_DISP_BLS,	0, NULL },
+	[DDP_COMPONENT_CCORR]		= { MTK_DISP_CCORR,	0, &ddp_ccorr },
+	[DDP_COMPONENT_COLOR0]		= { MTK_DISP_COLOR,	0, &ddp_color },
+	[DDP_COMPONENT_COLOR1]		= { MTK_DISP_COLOR,	1, &ddp_color },
+	[DDP_COMPONENT_DITHER]		= { MTK_DISP_DITHER,	0, &ddp_dither },
+	[DDP_COMPONENT_DPI0]		= { MTK_DPI,		0, &ddp_dpi },
+	[DDP_COMPONENT_DPI1]		= { MTK_DPI,		1, &ddp_dpi },
+	[DDP_COMPONENT_DSI0]		= { MTK_DSI,		0, &ddp_dsi },
+	[DDP_COMPONENT_DSI1]		= { MTK_DSI,		1, &ddp_dsi },
+	[DDP_COMPONENT_DSI2]		= { MTK_DSI,		2, &ddp_dsi },
+	[DDP_COMPONENT_DSI3]		= { MTK_DSI,		3, &ddp_dsi },
+	[DDP_COMPONENT_GAMMA]		= { MTK_DISP_GAMMA,	0, &ddp_gamma },
+	[DDP_COMPONENT_OD0]		= { MTK_DISP_OD,	0, &ddp_od },
+	[DDP_COMPONENT_OD1]		= { MTK_DISP_OD,	1, &ddp_od },
+	[DDP_COMPONENT_OVL0]		= { MTK_DISP_OVL,	0, &ddp_ovl },
+	[DDP_COMPONENT_OVL1]		= { MTK_DISP_OVL,	1, &ddp_ovl },
+	[DDP_COMPONENT_OVL_2L0]		= { MTK_DISP_OVL_2L,	0, &ddp_ovl },
+	[DDP_COMPONENT_OVL_2L1]		= { MTK_DISP_OVL_2L,	1, &ddp_ovl },
+	[DDP_COMPONENT_OVL_2L2]		= { MTK_DISP_OVL_2L,    2, &ddp_ovl },
+	[DDP_COMPONENT_POSTMASK0]	= { MTK_DISP_POSTMASK,	0, &ddp_postmask },
+	[DDP_COMPONENT_PWM0]		= { MTK_DISP_PWM,	0, NULL },
+	[DDP_COMPONENT_PWM1]		= { MTK_DISP_PWM,	1, NULL },
+	[DDP_COMPONENT_PWM2]		= { MTK_DISP_PWM,	2, NULL },
+	[DDP_COMPONENT_RDMA0]		= { MTK_DISP_RDMA,	0, &ddp_rdma },
+	[DDP_COMPONENT_RDMA1]		= { MTK_DISP_RDMA,	1, &ddp_rdma },
+	[DDP_COMPONENT_RDMA2]		= { MTK_DISP_RDMA,	2, &ddp_rdma },
+	[DDP_COMPONENT_UFOE]		= { MTK_DISP_UFOE,	0, &ddp_ufoe },
+	[DDP_COMPONENT_WDMA0]		= { MTK_DISP_WDMA,	0, NULL },
+	[DDP_COMPONENT_WDMA1]		= { MTK_DISP_WDMA,	1, NULL },
 };
 
 static bool mtk_drm_find_comp_in_ddp(struct device *dev,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
index bb914d976cf5d..cd1dec6b4cdf2 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
@@ -30,6 +30,7 @@ enum mtk_ddp_comp_type {
 	MTK_DISP_UFOE,
 	MTK_DSI,
 	MTK_DPI,
+	MTK_DISP_POSTMASK,
 	MTK_DISP_PWM,
 	MTK_DISP_MUTEX,
 	MTK_DISP_OD,
-- 
2.30.0.365.g02bc693789-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
