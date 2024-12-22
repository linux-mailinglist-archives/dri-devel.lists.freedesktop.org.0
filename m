Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DD09FA7F0
	for <lists+dri-devel@lfdr.de>; Sun, 22 Dec 2024 21:14:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0264F10E178;
	Sun, 22 Dec 2024 20:14:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hfjz8u/1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3A9010E16A
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Dec 2024 20:14:17 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-54020b0dcd2so4893031e87.1
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Dec 2024 12:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734898456; x=1735503256; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=bMOjIJYMkCZkdzI8XdUS0zg2r56dyv2msx5H0SoOmmY=;
 b=hfjz8u/1wwiVaCgWOqmlTf0l7BhIdQlz0q0ObxqQ8bGabuNaLy2UufNKLgkv4TJRZw
 /kdxEhJl6bkAlWGs7g13woQ8jOF1OveoN8fMiCpuIWEpImdp7VXbqhxFY4iuDtheS8aa
 HcQ9TYK5YwPexUN0fRX2QW/VYg02twCf6VRS/Y7CyBQx8gaT4MLEN2vEG98wRCbaEAF3
 zGQe9pcz46gKow4f66etpnnj5ZC7v6TIJzGCWv6TLPDwEJz7vnQTcdrxwzvTz2y7dSCt
 GHOOzN/OQESn1j/61GoXnMmEWyiGXPMjuAvfxxbNnl3ApyT5VwKib44vefhLcXVdXqaI
 X6XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734898456; x=1735503256;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bMOjIJYMkCZkdzI8XdUS0zg2r56dyv2msx5H0SoOmmY=;
 b=v9BTjU9ZS+KXq3/ft7P5xvv7dmAG+up6nt8TVEQe/544nn4gwqJm1y+8svgJ8u4tUF
 BUFgI74UbHeHJ5jp7z5wLXzDCCP9h3OfX7oRd0T8AxG9oA0LHasDtG2n+OPD03573jDg
 1Fiu36o9+MCACoif0uPKkHNWHNpuK000ejhYea9XJ7ccyDOmHT8sRuWN6t9i800LKIdH
 JwP+No+6bQaoEYOdzR8JhKdYF8SAt1tTwgXKIS7uaXZSE41EQkXCwEJ6DNE1C6uQkitt
 PN8pox5dw0SYR/OloHSg4lGWQouvYHTPyQtBnEVKQ3hKJ0WGicJLVx34cc7eJqmtQiuA
 IDIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgDXk0EN+LXxaEfdVX4KkSzLajfiCtyN9eAaaMhxg1Zbx4IA/V/ZDwPXMe3eelvhUWHd1Z8WXDRYg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxU/J+Ypmk2Xopr6cqobYEJuzWur1m7paIuAYi1UsH/mz5OSaL5
 NfaFFnfupF7PDSrT3/43968WaOKQUxEiNTCYfQS96kah3yn1TLaJleXVOb7XgKM=
X-Gm-Gg: ASbGncvMN3AZX3zCoFAwTW5uX3veUpfrWQmRZAexeh4SPDy7BJao3wAH5GAx17zLMf9
 yNkqKxTa1QEXf7YsyDaZsXjtXxP5kdC5F1P+5G1XDDS0PlTI03s0/nk80anqCfp4vCzE3Nl4Z4o
 ciZis05BOhev4uGJ7RccUxlErsygCUzXE+Iij+sEC4MUlhCpKohg7uBJHsrDHAUR+fqCqWt+XRr
 Wq7Gx5A5zHiMj1S9KDXJevyz0ZfFSwN7WQV8NYV4d1G2cRhjcxNMXYZxOcHqKuy
X-Google-Smtp-Source: AGHT+IGedMbZn/4rfYqFr0813A8hUMo2xZQzo8cpzM5MVqammLd5bn0a8yZ+oPiL/9HJxDtRKJpkwg==
X-Received: by 2002:a05:6512:2350:b0:542:2192:44dc with SMTP id
 2adb3069b0e04-54229474ee6mr2965350e87.28.1734898456086; 
 Sun, 22 Dec 2024 12:14:16 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542235f7765sm1034331e87.13.2024.12.22.12.14.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Dec 2024 12:14:15 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 22 Dec 2024 22:14:06 +0200
Subject: [PATCH v5 03/11] drm/msm/dp: pull I/O data out of
 msm_dp_catalog_private()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241222-fd-dp-audio-fixup-v5-3-370f09492cf6@linaro.org>
References: <20241222-fd-dp-audio-fixup-v5-0-370f09492cf6@linaro.org>
In-Reply-To: <20241222-fd-dp-audio-fixup-v5-0-370f09492cf6@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Paloma Arellano <quic_parellan@quicinc.com>
Cc: Douglas Anderson <dianders@chromium.org>, 
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=53354;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=bgo0Ml6ZqAfNankRrIkzsWBQ/A/dtrJQ+e9K/BawcAw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnaHMOBcyyRMhQrr5ZjbJNMNivNY4LywDDQQc/7
 UEW2weTBCWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2hzDgAKCRCLPIo+Aiko
 1bx0B/9d2tMI7EFS3t4pC2PVE8MfvMiPL0g5dXqev++Uy+V0jaUfN/3uiLlW5yiKcpE2zo2DbXU
 znJJRWkuP+p3ruhd3Cx60f39h3devMezifpjmS/viqivBDAHAwWe7CyDCtMACw5V2yJSy12pzwx
 L3pZEEoed9ub6GXXp41PrWOi/B/43NJXZol45b/p3C7XKcs7v9XgmLA/0PpOE1iiRmpt4ABsP8t
 4HMhwpXQjX1FRhteBllS/pYh6bbwEjar5hN3YH3Fs+L6RkgwQyWUzrIxhKd/oupvmUSw77favnR
 MclC4Kqq/TmEBqqRUMz2R7Rz/CaX28E0gEi9MT7/LtRuEgid
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Having I/O regions inside a msm_dp_catalog_private() results in extra
layers of one-line wrappers for accessing the data. Move I/O region base
and size to the globally visible struct msm_dp_catalog.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Tested-by: Stephen Boyd <swboyd@chromium.org> # sc7180-trogdor
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c | 536 +++++++++++++++---------------------
 drivers/gpu/drm/msm/dp/dp_catalog.h |  12 +
 2 files changed, 231 insertions(+), 317 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 23f9fcb75123a58b3a4b69d3dad0598135108eec..74ab86035f3b98b498756673229218558b6713c3 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -63,154 +63,127 @@
 #define DP_DEFAULT_P0_OFFSET	0x1000
 #define DP_DEFAULT_P0_SIZE	0x0400
 
-struct dss_io_region {
-	size_t len;
-	void __iomem *base;
-};
-
-struct dss_io_data {
-	struct dss_io_region ahb;
-	struct dss_io_region aux;
-	struct dss_io_region link;
-	struct dss_io_region p0;
-};
-
 struct msm_dp_catalog_private {
 	struct device *dev;
 	struct drm_device *drm_dev;
-	struct dss_io_data io;
 	struct msm_dp_catalog msm_dp_catalog;
 };
 
 void msm_dp_catalog_snapshot(struct msm_dp_catalog *msm_dp_catalog, struct msm_disp_state *disp_state)
 {
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-			struct msm_dp_catalog_private, msm_dp_catalog);
-	struct dss_io_data *dss = &catalog->io;
-
-	msm_disp_snapshot_add_block(disp_state, dss->ahb.len, dss->ahb.base, "dp_ahb");
-	msm_disp_snapshot_add_block(disp_state, dss->aux.len, dss->aux.base, "dp_aux");
-	msm_disp_snapshot_add_block(disp_state, dss->link.len, dss->link.base, "dp_link");
-	msm_disp_snapshot_add_block(disp_state, dss->p0.len, dss->p0.base, "dp_p0");
+	msm_disp_snapshot_add_block(disp_state,
+				    msm_dp_catalog->ahb_len, msm_dp_catalog->ahb_base, "dp_ahb");
+	msm_disp_snapshot_add_block(disp_state,
+				    msm_dp_catalog->aux_len, msm_dp_catalog->aux_base, "dp_aux");
+	msm_disp_snapshot_add_block(disp_state,
+				    msm_dp_catalog->link_len, msm_dp_catalog->link_base, "dp_link");
+	msm_disp_snapshot_add_block(disp_state,
+				    msm_dp_catalog->p0_len, msm_dp_catalog->p0_base, "dp_p0");
 }
 
-static inline u32 msm_dp_read_aux(struct msm_dp_catalog_private *catalog, u32 offset)
+static inline u32 msm_dp_read_aux(struct msm_dp_catalog *msm_dp_catalog, u32 offset)
 {
-	return readl_relaxed(catalog->io.aux.base + offset);
+	return readl_relaxed(msm_dp_catalog->aux_base + offset);
 }
 
-static inline void msm_dp_write_aux(struct msm_dp_catalog_private *catalog,
+static inline void msm_dp_write_aux(struct msm_dp_catalog *msm_dp_catalog,
 			       u32 offset, u32 data)
 {
 	/*
 	 * To make sure aux reg writes happens before any other operation,
 	 * this function uses writel() instread of writel_relaxed()
 	 */
-	writel(data, catalog->io.aux.base + offset);
+	writel(data, msm_dp_catalog->aux_base + offset);
 }
 
-static inline u32 msm_dp_read_ahb(const struct msm_dp_catalog_private *catalog, u32 offset)
+static inline u32 msm_dp_read_ahb(const struct msm_dp_catalog *msm_dp_catalog, u32 offset)
 {
-	return readl_relaxed(catalog->io.ahb.base + offset);
+	return readl_relaxed(msm_dp_catalog->ahb_base + offset);
 }
 
-static inline void msm_dp_write_ahb(struct msm_dp_catalog_private *catalog,
+static inline void msm_dp_write_ahb(struct msm_dp_catalog *msm_dp_catalog,
 			       u32 offset, u32 data)
 {
 	/*
 	 * To make sure phy reg writes happens before any other operation,
 	 * this function uses writel() instread of writel_relaxed()
 	 */
-	writel(data, catalog->io.ahb.base + offset);
+	writel(data, msm_dp_catalog->ahb_base + offset);
 }
 
-static inline void msm_dp_write_p0(struct msm_dp_catalog_private *catalog,
+static inline void msm_dp_write_p0(struct msm_dp_catalog *msm_dp_catalog,
 			       u32 offset, u32 data)
 {
 	/*
 	 * To make sure interface reg writes happens before any other operation,
 	 * this function uses writel() instread of writel_relaxed()
 	 */
-	writel(data, catalog->io.p0.base + offset);
+	writel(data, msm_dp_catalog->p0_base + offset);
 }
 
-static inline u32 msm_dp_read_p0(struct msm_dp_catalog_private *catalog,
+static inline u32 msm_dp_read_p0(struct msm_dp_catalog *msm_dp_catalog,
 			       u32 offset)
 {
 	/*
 	 * To make sure interface reg writes happens before any other operation,
 	 * this function uses writel() instread of writel_relaxed()
 	 */
-	return readl_relaxed(catalog->io.p0.base + offset);
+	return readl_relaxed(msm_dp_catalog->p0_base + offset);
 }
 
-static inline u32 msm_dp_read_link(struct msm_dp_catalog_private *catalog, u32 offset)
+static inline u32 msm_dp_read_link(struct msm_dp_catalog *msm_dp_catalog, u32 offset)
 {
-	return readl_relaxed(catalog->io.link.base + offset);
+	return readl_relaxed(msm_dp_catalog->link_base + offset);
 }
 
-static inline void msm_dp_write_link(struct msm_dp_catalog_private *catalog,
+static inline void msm_dp_write_link(struct msm_dp_catalog *msm_dp_catalog,
 			       u32 offset, u32 data)
 {
 	/*
 	 * To make sure link reg writes happens before any other operation,
 	 * this function uses writel() instread of writel_relaxed()
 	 */
-	writel(data, catalog->io.link.base + offset);
+	writel(data, msm_dp_catalog->link_base + offset);
 }
 
 /* aux related catalog functions */
 u32 msm_dp_catalog_aux_read_data(struct msm_dp_catalog *msm_dp_catalog)
 {
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
-
-	return msm_dp_read_aux(catalog, REG_DP_AUX_DATA);
+	return msm_dp_read_aux(msm_dp_catalog, REG_DP_AUX_DATA);
 }
 
 int msm_dp_catalog_aux_write_data(struct msm_dp_catalog *msm_dp_catalog, u32 data)
 {
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
-
-	msm_dp_write_aux(catalog, REG_DP_AUX_DATA, data);
+	msm_dp_write_aux(msm_dp_catalog, REG_DP_AUX_DATA, data);
 	return 0;
 }
 
 int msm_dp_catalog_aux_write_trans(struct msm_dp_catalog *msm_dp_catalog, u32 data)
 {
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
-
-	msm_dp_write_aux(catalog, REG_DP_AUX_TRANS_CTRL, data);
+	msm_dp_write_aux(msm_dp_catalog, REG_DP_AUX_TRANS_CTRL, data);
 	return 0;
 }
 
 int msm_dp_catalog_aux_clear_trans(struct msm_dp_catalog *msm_dp_catalog, bool read)
 {
 	u32 data;
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
 
 	if (read) {
-		data = msm_dp_read_aux(catalog, REG_DP_AUX_TRANS_CTRL);
+		data = msm_dp_read_aux(msm_dp_catalog, REG_DP_AUX_TRANS_CTRL);
 		data &= ~DP_AUX_TRANS_CTRL_GO;
-		msm_dp_write_aux(catalog, REG_DP_AUX_TRANS_CTRL, data);
+		msm_dp_write_aux(msm_dp_catalog, REG_DP_AUX_TRANS_CTRL, data);
 	} else {
-		msm_dp_write_aux(catalog, REG_DP_AUX_TRANS_CTRL, 0);
+		msm_dp_write_aux(msm_dp_catalog, REG_DP_AUX_TRANS_CTRL, 0);
 	}
 	return 0;
 }
 
 int msm_dp_catalog_aux_clear_hw_interrupts(struct msm_dp_catalog *msm_dp_catalog)
 {
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
-
-	msm_dp_read_aux(catalog, REG_DP_PHY_AUX_INTERRUPT_STATUS);
-	msm_dp_write_aux(catalog, REG_DP_PHY_AUX_INTERRUPT_CLEAR, 0x1f);
-	msm_dp_write_aux(catalog, REG_DP_PHY_AUX_INTERRUPT_CLEAR, 0x9f);
-	msm_dp_write_aux(catalog, REG_DP_PHY_AUX_INTERRUPT_CLEAR, 0);
+	msm_dp_read_aux(msm_dp_catalog, REG_DP_PHY_AUX_INTERRUPT_STATUS);
+	msm_dp_write_aux(msm_dp_catalog, REG_DP_PHY_AUX_INTERRUPT_CLEAR, 0x1f);
+	msm_dp_write_aux(msm_dp_catalog, REG_DP_PHY_AUX_INTERRUPT_CLEAR, 0x9f);
+	msm_dp_write_aux(msm_dp_catalog, REG_DP_PHY_AUX_INTERRUPT_CLEAR, 0);
 	return 0;
 }
 
@@ -229,47 +202,41 @@ int msm_dp_catalog_aux_clear_hw_interrupts(struct msm_dp_catalog *msm_dp_catalog
 void msm_dp_catalog_aux_reset(struct msm_dp_catalog *msm_dp_catalog)
 {
 	u32 aux_ctrl;
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
 
-	aux_ctrl = msm_dp_read_aux(catalog, REG_DP_AUX_CTRL);
+	aux_ctrl = msm_dp_read_aux(msm_dp_catalog, REG_DP_AUX_CTRL);
 
 	aux_ctrl |= DP_AUX_CTRL_RESET;
-	msm_dp_write_aux(catalog, REG_DP_AUX_CTRL, aux_ctrl);
+	msm_dp_write_aux(msm_dp_catalog, REG_DP_AUX_CTRL, aux_ctrl);
 	usleep_range(1000, 1100); /* h/w recommended delay */
 
 	aux_ctrl &= ~DP_AUX_CTRL_RESET;
-	msm_dp_write_aux(catalog, REG_DP_AUX_CTRL, aux_ctrl);
+	msm_dp_write_aux(msm_dp_catalog, REG_DP_AUX_CTRL, aux_ctrl);
 }
 
 void msm_dp_catalog_aux_enable(struct msm_dp_catalog *msm_dp_catalog, bool enable)
 {
 	u32 aux_ctrl;
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
 
-	aux_ctrl = msm_dp_read_aux(catalog, REG_DP_AUX_CTRL);
+	aux_ctrl = msm_dp_read_aux(msm_dp_catalog, REG_DP_AUX_CTRL);
 
 	if (enable) {
-		msm_dp_write_aux(catalog, REG_DP_TIMEOUT_COUNT, 0xffff);
-		msm_dp_write_aux(catalog, REG_DP_AUX_LIMITS, 0xffff);
+		msm_dp_write_aux(msm_dp_catalog, REG_DP_TIMEOUT_COUNT, 0xffff);
+		msm_dp_write_aux(msm_dp_catalog, REG_DP_AUX_LIMITS, 0xffff);
 		aux_ctrl |= DP_AUX_CTRL_ENABLE;
 	} else {
 		aux_ctrl &= ~DP_AUX_CTRL_ENABLE;
 	}
 
-	msm_dp_write_aux(catalog, REG_DP_AUX_CTRL, aux_ctrl);
+	msm_dp_write_aux(msm_dp_catalog, REG_DP_AUX_CTRL, aux_ctrl);
 }
 
 int msm_dp_catalog_aux_wait_for_hpd_connect_state(struct msm_dp_catalog *msm_dp_catalog,
 					      unsigned long wait_us)
 {
 	u32 state;
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
 
 	/* poll for hpd connected status every 2ms and timeout after wait_us */
-	return readl_poll_timeout(catalog->io.aux.base +
+	return readl_poll_timeout(msm_dp_catalog->aux_base +
 				REG_DP_DP_HPD_INT_STATUS,
 				state, state & DP_DP_HPD_STATE_STATUS_CONNECTED,
 				min(wait_us, 2000), wait_us);
@@ -277,15 +244,13 @@ int msm_dp_catalog_aux_wait_for_hpd_connect_state(struct msm_dp_catalog *msm_dp_
 
 u32 msm_dp_catalog_aux_get_irq(struct msm_dp_catalog *msm_dp_catalog)
 {
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
 	u32 intr, intr_ack;
 
-	intr = msm_dp_read_ahb(catalog, REG_DP_INTR_STATUS);
+	intr = msm_dp_read_ahb(msm_dp_catalog, REG_DP_INTR_STATUS);
 	intr &= ~DP_INTERRUPT_STATUS1_MASK;
 	intr_ack = (intr & DP_INTERRUPT_STATUS1)
 			<< DP_INTERRUPT_STATUS_ACK_SHIFT;
-	msm_dp_write_ahb(catalog, REG_DP_INTR_STATUS, intr_ack |
+	msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_STATUS, intr_ack |
 			DP_INTERRUPT_STATUS1_MASK);
 
 	return intr;
@@ -297,20 +262,14 @@ void msm_dp_catalog_ctrl_update_transfer_unit(struct msm_dp_catalog *msm_dp_cata
 				u32 msm_dp_tu, u32 valid_boundary,
 				u32 valid_boundary2)
 {
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
-
-	msm_dp_write_link(catalog, REG_DP_VALID_BOUNDARY, valid_boundary);
-	msm_dp_write_link(catalog, REG_DP_TU, msm_dp_tu);
-	msm_dp_write_link(catalog, REG_DP_VALID_BOUNDARY_2, valid_boundary2);
+	msm_dp_write_link(msm_dp_catalog, REG_DP_VALID_BOUNDARY, valid_boundary);
+	msm_dp_write_link(msm_dp_catalog, REG_DP_TU, msm_dp_tu);
+	msm_dp_write_link(msm_dp_catalog, REG_DP_VALID_BOUNDARY_2, valid_boundary2);
 }
 
 void msm_dp_catalog_ctrl_state_ctrl(struct msm_dp_catalog *msm_dp_catalog, u32 state)
 {
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
-
-	msm_dp_write_link(catalog, REG_DP_STATE_CTRL, state);
+	msm_dp_write_link(msm_dp_catalog, REG_DP_STATE_CTRL, state);
 }
 
 void msm_dp_catalog_ctrl_config_ctrl(struct msm_dp_catalog *msm_dp_catalog, u32 cfg)
@@ -320,13 +279,11 @@ void msm_dp_catalog_ctrl_config_ctrl(struct msm_dp_catalog *msm_dp_catalog, u32
 
 	drm_dbg_dp(catalog->drm_dev, "DP_CONFIGURATION_CTRL=0x%x\n", cfg);
 
-	msm_dp_write_link(catalog, REG_DP_CONFIGURATION_CTRL, cfg);
+	msm_dp_write_link(msm_dp_catalog, REG_DP_CONFIGURATION_CTRL, cfg);
 }
 
 void msm_dp_catalog_ctrl_lane_mapping(struct msm_dp_catalog *msm_dp_catalog)
 {
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
 	u32 ln_0 = 0, ln_1 = 1, ln_2 = 2, ln_3 = 3; /* One-to-One mapping */
 	u32 ln_mapping;
 
@@ -335,7 +292,7 @@ void msm_dp_catalog_ctrl_lane_mapping(struct msm_dp_catalog *msm_dp_catalog)
 	ln_mapping |= ln_2 << LANE2_MAPPING_SHIFT;
 	ln_mapping |= ln_3 << LANE3_MAPPING_SHIFT;
 
-	msm_dp_write_link(catalog, REG_DP_LOGICAL2PHYSICAL_LANE_MAPPING,
+	msm_dp_write_link(msm_dp_catalog, REG_DP_LOGICAL2PHYSICAL_LANE_MAPPING,
 			ln_mapping);
 }
 
@@ -343,17 +300,15 @@ void msm_dp_catalog_ctrl_psr_mainlink_enable(struct msm_dp_catalog *msm_dp_catal
 						bool enable)
 {
 	u32 val;
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
 
-	val = msm_dp_read_link(catalog, REG_DP_MAINLINK_CTRL);
+	val = msm_dp_read_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL);
 
 	if (enable)
 		val |= DP_MAINLINK_CTRL_ENABLE;
 	else
 		val &= ~DP_MAINLINK_CTRL_ENABLE;
 
-	msm_dp_write_link(catalog, REG_DP_MAINLINK_CTRL, val);
+	msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL, val);
 }
 
 void msm_dp_catalog_ctrl_mainlink_ctrl(struct msm_dp_catalog *msm_dp_catalog,
@@ -369,25 +324,25 @@ void msm_dp_catalog_ctrl_mainlink_ctrl(struct msm_dp_catalog *msm_dp_catalog,
 		 * To make sure link reg writes happens before other operation,
 		 * msm_dp_write_link() function uses writel()
 		 */
-		mainlink_ctrl = msm_dp_read_link(catalog, REG_DP_MAINLINK_CTRL);
+		mainlink_ctrl = msm_dp_read_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL);
 
 		mainlink_ctrl &= ~(DP_MAINLINK_CTRL_RESET |
 						DP_MAINLINK_CTRL_ENABLE);
-		msm_dp_write_link(catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
+		msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
 
 		mainlink_ctrl |= DP_MAINLINK_CTRL_RESET;
-		msm_dp_write_link(catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
+		msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
 
 		mainlink_ctrl &= ~DP_MAINLINK_CTRL_RESET;
-		msm_dp_write_link(catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
+		msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
 
 		mainlink_ctrl |= (DP_MAINLINK_CTRL_ENABLE |
 					DP_MAINLINK_FB_BOUNDARY_SEL);
-		msm_dp_write_link(catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
+		msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
 	} else {
-		mainlink_ctrl = msm_dp_read_link(catalog, REG_DP_MAINLINK_CTRL);
+		mainlink_ctrl = msm_dp_read_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL);
 		mainlink_ctrl &= ~DP_MAINLINK_CTRL_ENABLE;
-		msm_dp_write_link(catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
+		msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
 	}
 }
 
@@ -399,7 +354,7 @@ void msm_dp_catalog_ctrl_config_misc(struct msm_dp_catalog *msm_dp_catalog,
 	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
 				struct msm_dp_catalog_private, msm_dp_catalog);
 
-	misc_val = msm_dp_read_link(catalog, REG_DP_MISC1_MISC0);
+	misc_val = msm_dp_read_link(msm_dp_catalog, REG_DP_MISC1_MISC0);
 
 	/* clear bpp bits */
 	misc_val &= ~(0x07 << DP_MISC0_TEST_BITS_DEPTH_SHIFT);
@@ -409,23 +364,21 @@ void msm_dp_catalog_ctrl_config_misc(struct msm_dp_catalog *msm_dp_catalog,
 	misc_val |= DP_MISC0_SYNCHRONOUS_CLK;
 
 	drm_dbg_dp(catalog->drm_dev, "misc settings = 0x%x\n", misc_val);
-	msm_dp_write_link(catalog, REG_DP_MISC1_MISC0, misc_val);
+	msm_dp_write_link(msm_dp_catalog, REG_DP_MISC1_MISC0, misc_val);
 }
 
 void msm_dp_catalog_setup_peripheral_flush(struct msm_dp_catalog *msm_dp_catalog)
 {
 	u32 mainlink_ctrl;
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
 
-	mainlink_ctrl = msm_dp_read_link(catalog, REG_DP_MAINLINK_CTRL);
+	mainlink_ctrl = msm_dp_read_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL);
 
 	if (msm_dp_catalog->hw_revision >= DP_HW_VERSION_1_2)
 		mainlink_ctrl |= DP_MAINLINK_FLUSH_MODE_SDE_PERIPH_UPDATE;
 	else
 		mainlink_ctrl |= DP_MAINLINK_FLUSH_MODE_UPDATE_SDP;
 
-	msm_dp_write_link(catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
+	msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
 }
 
 void msm_dp_catalog_ctrl_config_msa(struct msm_dp_catalog *msm_dp_catalog,
@@ -483,8 +436,8 @@ void msm_dp_catalog_ctrl_config_msa(struct msm_dp_catalog *msm_dp_catalog,
 		nvid *= 3;
 
 	drm_dbg_dp(catalog->drm_dev, "mvid=0x%x, nvid=0x%x\n", mvid, nvid);
-	msm_dp_write_link(catalog, REG_DP_SOFTWARE_MVID, mvid);
-	msm_dp_write_link(catalog, REG_DP_SOFTWARE_NVID, nvid);
+	msm_dp_write_link(msm_dp_catalog, REG_DP_SOFTWARE_MVID, mvid);
+	msm_dp_write_link(msm_dp_catalog, REG_DP_SOFTWARE_NVID, nvid);
 }
 
 int msm_dp_catalog_ctrl_set_pattern_state_bit(struct msm_dp_catalog *msm_dp_catalog,
@@ -502,7 +455,7 @@ int msm_dp_catalog_ctrl_set_pattern_state_bit(struct msm_dp_catalog *msm_dp_cata
 	bit = BIT(state_bit - 1) << DP_MAINLINK_READY_LINK_TRAINING_SHIFT;
 
 	/* Poll for mainlink ready status */
-	ret = readx_poll_timeout(readl, catalog->io.link.base +
+	ret = readx_poll_timeout(readl, msm_dp_catalog->link_base +
 					REG_DP_MAINLINK_READY,
 					data, data & bit,
 					POLLING_SLEEP_US, POLLING_TIMEOUT_US);
@@ -528,31 +481,27 @@ int msm_dp_catalog_ctrl_set_pattern_state_bit(struct msm_dp_catalog *msm_dp_cata
 void msm_dp_catalog_ctrl_reset(struct msm_dp_catalog *msm_dp_catalog)
 {
 	u32 sw_reset;
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
 
-	sw_reset = msm_dp_read_ahb(catalog, REG_DP_SW_RESET);
+	sw_reset = msm_dp_read_ahb(msm_dp_catalog, REG_DP_SW_RESET);
 
 	sw_reset |= DP_SW_RESET;
-	msm_dp_write_ahb(catalog, REG_DP_SW_RESET, sw_reset);
+	msm_dp_write_ahb(msm_dp_catalog, REG_DP_SW_RESET, sw_reset);
 	usleep_range(1000, 1100); /* h/w recommended delay */
 
 	sw_reset &= ~DP_SW_RESET;
-	msm_dp_write_ahb(catalog, REG_DP_SW_RESET, sw_reset);
+	msm_dp_write_ahb(msm_dp_catalog, REG_DP_SW_RESET, sw_reset);
 
 	if (!msm_dp_catalog->hw_revision)
-		msm_dp_catalog->hw_revision = msm_dp_read_ahb(catalog, REG_DP_HW_VERSION);
+		msm_dp_catalog->hw_revision = msm_dp_read_ahb(msm_dp_catalog, REG_DP_HW_VERSION);
 }
 
 bool msm_dp_catalog_ctrl_mainlink_ready(struct msm_dp_catalog *msm_dp_catalog)
 {
 	u32 data;
 	int ret;
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
 
 	/* Poll for mainlink ready status */
-	ret = readl_poll_timeout(catalog->io.link.base +
+	ret = readl_poll_timeout(msm_dp_catalog->link_base +
 				REG_DP_MAINLINK_READY,
 				data, data & DP_MAINLINK_READY_FOR_VIDEO,
 				POLLING_SLEEP_US, POLLING_TIMEOUT_US);
@@ -567,17 +516,14 @@ bool msm_dp_catalog_ctrl_mainlink_ready(struct msm_dp_catalog *msm_dp_catalog)
 void msm_dp_catalog_ctrl_enable_irq(struct msm_dp_catalog *msm_dp_catalog,
 						bool enable)
 {
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
-
 	if (enable) {
-		msm_dp_write_ahb(catalog, REG_DP_INTR_STATUS,
+		msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_STATUS,
 				DP_INTERRUPT_STATUS1_MASK);
-		msm_dp_write_ahb(catalog, REG_DP_INTR_STATUS2,
+		msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_STATUS2,
 				DP_INTERRUPT_STATUS2_MASK);
 	} else {
-		msm_dp_write_ahb(catalog, REG_DP_INTR_STATUS, 0x00);
-		msm_dp_write_ahb(catalog, REG_DP_INTR_STATUS2, 0x00);
+		msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_STATUS, 0x00);
+		msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_STATUS2, 0x00);
 	}
 }
 
@@ -587,73 +533,63 @@ void msm_dp_catalog_hpd_config_intr(struct msm_dp_catalog *msm_dp_catalog,
 	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
 				struct msm_dp_catalog_private, msm_dp_catalog);
 
-	u32 config = msm_dp_read_aux(catalog, REG_DP_DP_HPD_INT_MASK);
+	u32 config = msm_dp_read_aux(msm_dp_catalog, REG_DP_DP_HPD_INT_MASK);
 
 	config = (en ? config | intr_mask : config & ~intr_mask);
 
 	drm_dbg_dp(catalog->drm_dev, "intr_mask=%#x config=%#x\n",
 					intr_mask, config);
-	msm_dp_write_aux(catalog, REG_DP_DP_HPD_INT_MASK,
+	msm_dp_write_aux(msm_dp_catalog, REG_DP_DP_HPD_INT_MASK,
 				config & DP_DP_HPD_INT_MASK);
 }
 
 void msm_dp_catalog_ctrl_hpd_enable(struct msm_dp_catalog *msm_dp_catalog)
 {
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
-
-	u32 reftimer = msm_dp_read_aux(catalog, REG_DP_DP_HPD_REFTIMER);
+	u32 reftimer = msm_dp_read_aux(msm_dp_catalog, REG_DP_DP_HPD_REFTIMER);
 
 	/* Configure REFTIMER and enable it */
 	reftimer |= DP_DP_HPD_REFTIMER_ENABLE;
-	msm_dp_write_aux(catalog, REG_DP_DP_HPD_REFTIMER, reftimer);
+	msm_dp_write_aux(msm_dp_catalog, REG_DP_DP_HPD_REFTIMER, reftimer);
 
 	/* Enable HPD */
-	msm_dp_write_aux(catalog, REG_DP_DP_HPD_CTRL, DP_DP_HPD_CTRL_HPD_EN);
+	msm_dp_write_aux(msm_dp_catalog, REG_DP_DP_HPD_CTRL, DP_DP_HPD_CTRL_HPD_EN);
 }
 
 void msm_dp_catalog_ctrl_hpd_disable(struct msm_dp_catalog *msm_dp_catalog)
 {
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
-
-	u32 reftimer = msm_dp_read_aux(catalog, REG_DP_DP_HPD_REFTIMER);
+	u32 reftimer = msm_dp_read_aux(msm_dp_catalog, REG_DP_DP_HPD_REFTIMER);
 
 	reftimer &= ~DP_DP_HPD_REFTIMER_ENABLE;
-	msm_dp_write_aux(catalog, REG_DP_DP_HPD_REFTIMER, reftimer);
+	msm_dp_write_aux(msm_dp_catalog, REG_DP_DP_HPD_REFTIMER, reftimer);
 
-	msm_dp_write_aux(catalog, REG_DP_DP_HPD_CTRL, 0);
+	msm_dp_write_aux(msm_dp_catalog, REG_DP_DP_HPD_CTRL, 0);
 }
 
-static void msm_dp_catalog_enable_sdp(struct msm_dp_catalog_private *catalog)
+static void msm_dp_catalog_enable_sdp(struct msm_dp_catalog *msm_dp_catalog)
 {
 	/* trigger sdp */
-	msm_dp_write_link(catalog, MMSS_DP_SDP_CFG3, UPDATE_SDP);
-	msm_dp_write_link(catalog, MMSS_DP_SDP_CFG3, 0x0);
+	msm_dp_write_link(msm_dp_catalog, MMSS_DP_SDP_CFG3, UPDATE_SDP);
+	msm_dp_write_link(msm_dp_catalog, MMSS_DP_SDP_CFG3, 0x0);
 }
 
 void msm_dp_catalog_ctrl_config_psr(struct msm_dp_catalog *msm_dp_catalog)
 {
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
 	u32 config;
 
 	/* enable PSR1 function */
-	config = msm_dp_read_link(catalog, REG_PSR_CONFIG);
+	config = msm_dp_read_link(msm_dp_catalog, REG_PSR_CONFIG);
 	config |= PSR1_SUPPORTED;
-	msm_dp_write_link(catalog, REG_PSR_CONFIG, config);
+	msm_dp_write_link(msm_dp_catalog, REG_PSR_CONFIG, config);
 
-	msm_dp_write_ahb(catalog, REG_DP_INTR_MASK4, DP_INTERRUPT_MASK4);
-	msm_dp_catalog_enable_sdp(catalog);
+	msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_MASK4, DP_INTERRUPT_MASK4);
+	msm_dp_catalog_enable_sdp(msm_dp_catalog);
 }
 
 void msm_dp_catalog_ctrl_set_psr(struct msm_dp_catalog *msm_dp_catalog, bool enter)
 {
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-			struct msm_dp_catalog_private, msm_dp_catalog);
 	u32 cmd;
 
-	cmd = msm_dp_read_link(catalog, REG_PSR_CMD);
+	cmd = msm_dp_read_link(msm_dp_catalog, REG_PSR_CMD);
 
 	cmd &= ~(PSR_ENTER | PSR_EXIT);
 
@@ -662,8 +598,8 @@ void msm_dp_catalog_ctrl_set_psr(struct msm_dp_catalog *msm_dp_catalog, bool ent
 	else
 		cmd |= PSR_EXIT;
 
-	msm_dp_catalog_enable_sdp(catalog);
-	msm_dp_write_link(catalog, REG_PSR_CMD, cmd);
+	msm_dp_catalog_enable_sdp(msm_dp_catalog);
+	msm_dp_write_link(msm_dp_catalog, REG_PSR_CMD, cmd);
 }
 
 u32 msm_dp_catalog_link_is_connected(struct msm_dp_catalog *msm_dp_catalog)
@@ -672,7 +608,7 @@ u32 msm_dp_catalog_link_is_connected(struct msm_dp_catalog *msm_dp_catalog)
 				struct msm_dp_catalog_private, msm_dp_catalog);
 	u32 status;
 
-	status = msm_dp_read_aux(catalog, REG_DP_DP_HPD_INT_STATUS);
+	status = msm_dp_read_aux(msm_dp_catalog, REG_DP_DP_HPD_INT_STATUS);
 	drm_dbg_dp(catalog->drm_dev, "aux status: %#x\n", status);
 	status >>= DP_DP_HPD_STATE_STATUS_BITS_SHIFT;
 	status &= DP_DP_HPD_STATE_STATUS_BITS_MASK;
@@ -682,14 +618,12 @@ u32 msm_dp_catalog_link_is_connected(struct msm_dp_catalog *msm_dp_catalog)
 
 u32 msm_dp_catalog_hpd_get_intr_status(struct msm_dp_catalog *msm_dp_catalog)
 {
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
 	int isr, mask;
 
-	isr = msm_dp_read_aux(catalog, REG_DP_DP_HPD_INT_STATUS);
-	msm_dp_write_aux(catalog, REG_DP_DP_HPD_INT_ACK,
+	isr = msm_dp_read_aux(msm_dp_catalog, REG_DP_DP_HPD_INT_STATUS);
+	msm_dp_write_aux(msm_dp_catalog, REG_DP_DP_HPD_INT_ACK,
 				 (isr & DP_DP_HPD_INT_MASK));
-	mask = msm_dp_read_aux(catalog, REG_DP_DP_HPD_INT_MASK);
+	mask = msm_dp_read_aux(msm_dp_catalog, REG_DP_DP_HPD_INT_MASK);
 
 	/*
 	 * We only want to return interrupts that are unmasked to the caller.
@@ -703,29 +637,25 @@ u32 msm_dp_catalog_hpd_get_intr_status(struct msm_dp_catalog *msm_dp_catalog)
 
 u32 msm_dp_catalog_ctrl_read_psr_interrupt_status(struct msm_dp_catalog *msm_dp_catalog)
 {
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
 	u32 intr, intr_ack;
 
-	intr = msm_dp_read_ahb(catalog, REG_DP_INTR_STATUS4);
+	intr = msm_dp_read_ahb(msm_dp_catalog, REG_DP_INTR_STATUS4);
 	intr_ack = (intr & DP_INTERRUPT_STATUS4)
 			<< DP_INTERRUPT_STATUS_ACK_SHIFT;
-	msm_dp_write_ahb(catalog, REG_DP_INTR_STATUS4, intr_ack);
+	msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_STATUS4, intr_ack);
 
 	return intr;
 }
 
 int msm_dp_catalog_ctrl_get_interrupt(struct msm_dp_catalog *msm_dp_catalog)
 {
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
 	u32 intr, intr_ack;
 
-	intr = msm_dp_read_ahb(catalog, REG_DP_INTR_STATUS2);
+	intr = msm_dp_read_ahb(msm_dp_catalog, REG_DP_INTR_STATUS2);
 	intr &= ~DP_INTERRUPT_STATUS2_MASK;
 	intr_ack = (intr & DP_INTERRUPT_STATUS2)
 			<< DP_INTERRUPT_STATUS_ACK_SHIFT;
-	msm_dp_write_ahb(catalog, REG_DP_INTR_STATUS2,
+	msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_STATUS2,
 			intr_ack | DP_INTERRUPT_STATUS2_MASK);
 
 	return intr;
@@ -733,13 +663,10 @@ int msm_dp_catalog_ctrl_get_interrupt(struct msm_dp_catalog *msm_dp_catalog)
 
 void msm_dp_catalog_ctrl_phy_reset(struct msm_dp_catalog *msm_dp_catalog)
 {
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
-
-	msm_dp_write_ahb(catalog, REG_DP_PHY_CTRL,
+	msm_dp_write_ahb(msm_dp_catalog, REG_DP_PHY_CTRL,
 			DP_PHY_CTRL_SW_RESET | DP_PHY_CTRL_SW_RESET_PLL);
 	usleep_range(1000, 1100); /* h/w recommended delay */
-	msm_dp_write_ahb(catalog, REG_DP_PHY_CTRL, 0x0);
+	msm_dp_write_ahb(msm_dp_catalog, REG_DP_PHY_CTRL, 0x0);
 }
 
 void msm_dp_catalog_ctrl_send_phy_pattern(struct msm_dp_catalog *msm_dp_catalog,
@@ -750,66 +677,66 @@ void msm_dp_catalog_ctrl_send_phy_pattern(struct msm_dp_catalog *msm_dp_catalog,
 	u32 value = 0x0;
 
 	/* Make sure to clear the current pattern before starting a new one */
-	msm_dp_write_link(catalog, REG_DP_STATE_CTRL, 0x0);
+	msm_dp_write_link(msm_dp_catalog, REG_DP_STATE_CTRL, 0x0);
 
 	drm_dbg_dp(catalog->drm_dev, "pattern: %#x\n", pattern);
 	switch (pattern) {
 	case DP_PHY_TEST_PATTERN_D10_2:
-		msm_dp_write_link(catalog, REG_DP_STATE_CTRL,
+		msm_dp_write_link(msm_dp_catalog, REG_DP_STATE_CTRL,
 				DP_STATE_CTRL_LINK_TRAINING_PATTERN1);
 		break;
 	case DP_PHY_TEST_PATTERN_ERROR_COUNT:
 		value &= ~(1 << 16);
-		msm_dp_write_link(catalog, REG_DP_HBR2_COMPLIANCE_SCRAMBLER_RESET,
+		msm_dp_write_link(msm_dp_catalog, REG_DP_HBR2_COMPLIANCE_SCRAMBLER_RESET,
 					value);
 		value |= SCRAMBLER_RESET_COUNT_VALUE;
-		msm_dp_write_link(catalog, REG_DP_HBR2_COMPLIANCE_SCRAMBLER_RESET,
+		msm_dp_write_link(msm_dp_catalog, REG_DP_HBR2_COMPLIANCE_SCRAMBLER_RESET,
 					value);
-		msm_dp_write_link(catalog, REG_DP_MAINLINK_LEVELS,
+		msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_LEVELS,
 					DP_MAINLINK_SAFE_TO_EXIT_LEVEL_2);
-		msm_dp_write_link(catalog, REG_DP_STATE_CTRL,
+		msm_dp_write_link(msm_dp_catalog, REG_DP_STATE_CTRL,
 					DP_STATE_CTRL_LINK_SYMBOL_ERR_MEASURE);
 		break;
 	case DP_PHY_TEST_PATTERN_PRBS7:
-		msm_dp_write_link(catalog, REG_DP_STATE_CTRL,
+		msm_dp_write_link(msm_dp_catalog, REG_DP_STATE_CTRL,
 				DP_STATE_CTRL_LINK_PRBS7);
 		break;
 	case DP_PHY_TEST_PATTERN_80BIT_CUSTOM:
-		msm_dp_write_link(catalog, REG_DP_STATE_CTRL,
+		msm_dp_write_link(msm_dp_catalog, REG_DP_STATE_CTRL,
 				DP_STATE_CTRL_LINK_TEST_CUSTOM_PATTERN);
 		/* 00111110000011111000001111100000 */
-		msm_dp_write_link(catalog, REG_DP_TEST_80BIT_CUSTOM_PATTERN_REG0,
+		msm_dp_write_link(msm_dp_catalog, REG_DP_TEST_80BIT_CUSTOM_PATTERN_REG0,
 				0x3E0F83E0);
 		/* 00001111100000111110000011111000 */
-		msm_dp_write_link(catalog, REG_DP_TEST_80BIT_CUSTOM_PATTERN_REG1,
+		msm_dp_write_link(msm_dp_catalog, REG_DP_TEST_80BIT_CUSTOM_PATTERN_REG1,
 				0x0F83E0F8);
 		/* 1111100000111110 */
-		msm_dp_write_link(catalog, REG_DP_TEST_80BIT_CUSTOM_PATTERN_REG2,
+		msm_dp_write_link(msm_dp_catalog, REG_DP_TEST_80BIT_CUSTOM_PATTERN_REG2,
 				0x0000F83E);
 		break;
 	case DP_PHY_TEST_PATTERN_CP2520:
-		value = msm_dp_read_link(catalog, REG_DP_MAINLINK_CTRL);
+		value = msm_dp_read_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL);
 		value &= ~DP_MAINLINK_CTRL_SW_BYPASS_SCRAMBLER;
-		msm_dp_write_link(catalog, REG_DP_MAINLINK_CTRL, value);
+		msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL, value);
 
 		value = DP_HBR2_ERM_PATTERN;
-		msm_dp_write_link(catalog, REG_DP_HBR2_COMPLIANCE_SCRAMBLER_RESET,
+		msm_dp_write_link(msm_dp_catalog, REG_DP_HBR2_COMPLIANCE_SCRAMBLER_RESET,
 				value);
 		value |= SCRAMBLER_RESET_COUNT_VALUE;
-		msm_dp_write_link(catalog, REG_DP_HBR2_COMPLIANCE_SCRAMBLER_RESET,
+		msm_dp_write_link(msm_dp_catalog, REG_DP_HBR2_COMPLIANCE_SCRAMBLER_RESET,
 					value);
-		msm_dp_write_link(catalog, REG_DP_MAINLINK_LEVELS,
+		msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_LEVELS,
 					DP_MAINLINK_SAFE_TO_EXIT_LEVEL_2);
-		msm_dp_write_link(catalog, REG_DP_STATE_CTRL,
+		msm_dp_write_link(msm_dp_catalog, REG_DP_STATE_CTRL,
 					DP_STATE_CTRL_LINK_SYMBOL_ERR_MEASURE);
-		value = msm_dp_read_link(catalog, REG_DP_MAINLINK_CTRL);
+		value = msm_dp_read_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL);
 		value |= DP_MAINLINK_CTRL_ENABLE;
-		msm_dp_write_link(catalog, REG_DP_MAINLINK_CTRL, value);
+		msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL, value);
 		break;
 	case DP_PHY_TEST_PATTERN_SEL_MASK:
-		msm_dp_write_link(catalog, REG_DP_MAINLINK_CTRL,
+		msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL,
 				DP_MAINLINK_CTRL_ENABLE);
-		msm_dp_write_link(catalog, REG_DP_STATE_CTRL,
+		msm_dp_write_link(msm_dp_catalog, REG_DP_STATE_CTRL,
 				DP_STATE_CTRL_LINK_TRAINING_PATTERN4);
 		break;
 	default:
@@ -821,26 +748,21 @@ void msm_dp_catalog_ctrl_send_phy_pattern(struct msm_dp_catalog *msm_dp_catalog,
 
 u32 msm_dp_catalog_ctrl_read_phy_pattern(struct msm_dp_catalog *msm_dp_catalog)
 {
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
-
-	return msm_dp_read_link(catalog, REG_DP_MAINLINK_READY);
+	return msm_dp_read_link(msm_dp_catalog, REG_DP_MAINLINK_READY);
 }
 
 /* panel related catalog functions */
 int msm_dp_catalog_panel_timing_cfg(struct msm_dp_catalog *msm_dp_catalog, u32 total,
 				u32 sync_start, u32 width_blanking, u32 msm_dp_active)
 {
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
 	u32 reg;
 
-	msm_dp_write_link(catalog, REG_DP_TOTAL_HOR_VER, total);
-	msm_dp_write_link(catalog, REG_DP_START_HOR_VER_FROM_SYNC, sync_start);
-	msm_dp_write_link(catalog, REG_DP_HSYNC_VSYNC_WIDTH_POLARITY, width_blanking);
-	msm_dp_write_link(catalog, REG_DP_ACTIVE_HOR_VER, msm_dp_active);
+	msm_dp_write_link(msm_dp_catalog, REG_DP_TOTAL_HOR_VER, total);
+	msm_dp_write_link(msm_dp_catalog, REG_DP_START_HOR_VER_FROM_SYNC, sync_start);
+	msm_dp_write_link(msm_dp_catalog, REG_DP_HSYNC_VSYNC_WIDTH_POLARITY, width_blanking);
+	msm_dp_write_link(msm_dp_catalog, REG_DP_ACTIVE_HOR_VER, msm_dp_active);
 
-	reg = msm_dp_read_p0(catalog, MMSS_DP_INTF_CONFIG);
+	reg = msm_dp_read_p0(msm_dp_catalog, MMSS_DP_INTF_CONFIG);
 
 	if (msm_dp_catalog->wide_bus_en)
 		reg |= DP_INTF_CONFIG_DATABUS_WIDEN;
@@ -850,43 +772,38 @@ int msm_dp_catalog_panel_timing_cfg(struct msm_dp_catalog *msm_dp_catalog, u32 t
 
 	DRM_DEBUG_DP("wide_bus_en=%d reg=%#x\n", msm_dp_catalog->wide_bus_en, reg);
 
-	msm_dp_write_p0(catalog, MMSS_DP_INTF_CONFIG, reg);
+	msm_dp_write_p0(msm_dp_catalog, MMSS_DP_INTF_CONFIG, reg);
 	return 0;
 }
 
 static void msm_dp_catalog_panel_send_vsc_sdp(struct msm_dp_catalog *msm_dp_catalog, struct dp_sdp *vsc_sdp)
 {
-	struct msm_dp_catalog_private *catalog;
 	u32 header[2];
 	u32 val;
 	int i;
 
-	catalog = container_of(msm_dp_catalog, struct msm_dp_catalog_private, msm_dp_catalog);
-
 	msm_dp_utils_pack_sdp_header(&vsc_sdp->sdp_header, header);
 
-	msm_dp_write_link(catalog, MMSS_DP_GENERIC0_0, header[0]);
-	msm_dp_write_link(catalog, MMSS_DP_GENERIC0_1, header[1]);
+	msm_dp_write_link(msm_dp_catalog, MMSS_DP_GENERIC0_0, header[0]);
+	msm_dp_write_link(msm_dp_catalog, MMSS_DP_GENERIC0_1, header[1]);
 
 	for (i = 0; i < sizeof(vsc_sdp->db); i += 4) {
 		val = ((vsc_sdp->db[i]) | (vsc_sdp->db[i + 1] << 8) | (vsc_sdp->db[i + 2] << 16) |
 		       (vsc_sdp->db[i + 3] << 24));
-		msm_dp_write_link(catalog, MMSS_DP_GENERIC0_2 + i, val);
+		msm_dp_write_link(msm_dp_catalog, MMSS_DP_GENERIC0_2 + i, val);
 	}
 }
 
 static void msm_dp_catalog_panel_update_sdp(struct msm_dp_catalog *msm_dp_catalog)
 {
-	struct msm_dp_catalog_private *catalog;
 	u32 hw_revision;
 
-	catalog = container_of(msm_dp_catalog, struct msm_dp_catalog_private, msm_dp_catalog);
 	hw_revision = msm_dp_catalog->hw_revision;
 
 	if (hw_revision < DP_HW_VERSION_1_2 &&
 	    hw_revision >= DP_HW_VERSION_1_0) {
-		msm_dp_write_link(catalog, MMSS_DP_SDP_CFG3, 0x01);
-		msm_dp_write_link(catalog, MMSS_DP_SDP_CFG3, 0x00);
+		msm_dp_write_link(msm_dp_catalog, MMSS_DP_SDP_CFG3, 0x01);
+		msm_dp_write_link(msm_dp_catalog, MMSS_DP_SDP_CFG3, 0x00);
 	}
 }
 
@@ -897,15 +814,15 @@ void msm_dp_catalog_panel_enable_vsc_sdp(struct msm_dp_catalog *msm_dp_catalog,
 
 	catalog = container_of(msm_dp_catalog, struct msm_dp_catalog_private, msm_dp_catalog);
 
-	cfg = msm_dp_read_link(catalog, MMSS_DP_SDP_CFG);
-	cfg2 = msm_dp_read_link(catalog, MMSS_DP_SDP_CFG2);
-	misc = msm_dp_read_link(catalog, REG_DP_MISC1_MISC0);
+	cfg = msm_dp_read_link(msm_dp_catalog, MMSS_DP_SDP_CFG);
+	cfg2 = msm_dp_read_link(msm_dp_catalog, MMSS_DP_SDP_CFG2);
+	misc = msm_dp_read_link(msm_dp_catalog, REG_DP_MISC1_MISC0);
 
 	cfg |= GEN0_SDP_EN;
-	msm_dp_write_link(catalog, MMSS_DP_SDP_CFG, cfg);
+	msm_dp_write_link(msm_dp_catalog, MMSS_DP_SDP_CFG, cfg);
 
 	cfg2 |= GENERIC0_SDPSIZE_VALID;
-	msm_dp_write_link(catalog, MMSS_DP_SDP_CFG2, cfg2);
+	msm_dp_write_link(msm_dp_catalog, MMSS_DP_SDP_CFG2, cfg2);
 
 	msm_dp_catalog_panel_send_vsc_sdp(msm_dp_catalog, vsc_sdp);
 
@@ -915,7 +832,7 @@ void msm_dp_catalog_panel_enable_vsc_sdp(struct msm_dp_catalog *msm_dp_catalog,
 	drm_dbg_dp(catalog->drm_dev, "vsc sdp enable=1\n");
 
 	pr_debug("misc settings = 0x%x\n", misc);
-	msm_dp_write_link(catalog, REG_DP_MISC1_MISC0, misc);
+	msm_dp_write_link(msm_dp_catalog, REG_DP_MISC1_MISC0, misc);
 
 	msm_dp_catalog_panel_update_sdp(msm_dp_catalog);
 }
@@ -927,15 +844,15 @@ void msm_dp_catalog_panel_disable_vsc_sdp(struct msm_dp_catalog *msm_dp_catalog)
 
 	catalog = container_of(msm_dp_catalog, struct msm_dp_catalog_private, msm_dp_catalog);
 
-	cfg = msm_dp_read_link(catalog, MMSS_DP_SDP_CFG);
-	cfg2 = msm_dp_read_link(catalog, MMSS_DP_SDP_CFG2);
-	misc = msm_dp_read_link(catalog, REG_DP_MISC1_MISC0);
+	cfg = msm_dp_read_link(msm_dp_catalog, MMSS_DP_SDP_CFG);
+	cfg2 = msm_dp_read_link(msm_dp_catalog, MMSS_DP_SDP_CFG2);
+	misc = msm_dp_read_link(msm_dp_catalog, REG_DP_MISC1_MISC0);
 
 	cfg &= ~GEN0_SDP_EN;
-	msm_dp_write_link(catalog, MMSS_DP_SDP_CFG, cfg);
+	msm_dp_write_link(msm_dp_catalog, MMSS_DP_SDP_CFG, cfg);
 
 	cfg2 &= ~GENERIC0_SDPSIZE_VALID;
-	msm_dp_write_link(catalog, MMSS_DP_SDP_CFG2, cfg2);
+	msm_dp_write_link(msm_dp_catalog, MMSS_DP_SDP_CFG2, cfg2);
 
 	/* switch back to MSA */
 	misc &= ~DP_MISC1_VSC_SDP;
@@ -943,7 +860,7 @@ void msm_dp_catalog_panel_disable_vsc_sdp(struct msm_dp_catalog *msm_dp_catalog)
 	drm_dbg_dp(catalog->drm_dev, "vsc sdp enable=0\n");
 
 	pr_debug("misc settings = 0x%x\n", misc);
-	msm_dp_write_link(catalog, REG_DP_MISC1_MISC0, misc);
+	msm_dp_write_link(msm_dp_catalog, REG_DP_MISC1_MISC0, misc);
 
 	msm_dp_catalog_panel_update_sdp(msm_dp_catalog);
 }
@@ -984,53 +901,47 @@ void msm_dp_catalog_panel_tpg_enable(struct msm_dp_catalog *msm_dp_catalog,
 	display_hctl = (hsync_end_x << 16) | hsync_start_x;
 
 
-	msm_dp_write_p0(catalog, MMSS_DP_INTF_HSYNC_CTL, hsync_ctl);
-	msm_dp_write_p0(catalog, MMSS_DP_INTF_VSYNC_PERIOD_F0, vsync_period *
+	msm_dp_write_p0(msm_dp_catalog, MMSS_DP_INTF_HSYNC_CTL, hsync_ctl);
+	msm_dp_write_p0(msm_dp_catalog, MMSS_DP_INTF_VSYNC_PERIOD_F0, vsync_period *
 			hsync_period);
-	msm_dp_write_p0(catalog, MMSS_DP_INTF_VSYNC_PULSE_WIDTH_F0, v_sync_width *
+	msm_dp_write_p0(msm_dp_catalog, MMSS_DP_INTF_VSYNC_PULSE_WIDTH_F0, v_sync_width *
 			hsync_period);
-	msm_dp_write_p0(catalog, MMSS_DP_INTF_VSYNC_PERIOD_F1, 0);
-	msm_dp_write_p0(catalog, MMSS_DP_INTF_VSYNC_PULSE_WIDTH_F1, 0);
-	msm_dp_write_p0(catalog, MMSS_DP_INTF_DISPLAY_HCTL, display_hctl);
-	msm_dp_write_p0(catalog, MMSS_DP_INTF_ACTIVE_HCTL, 0);
-	msm_dp_write_p0(catalog, MMSS_INTF_DISPLAY_V_START_F0, display_v_start);
-	msm_dp_write_p0(catalog, MMSS_DP_INTF_DISPLAY_V_END_F0, display_v_end);
-	msm_dp_write_p0(catalog, MMSS_INTF_DISPLAY_V_START_F1, 0);
-	msm_dp_write_p0(catalog, MMSS_DP_INTF_DISPLAY_V_END_F1, 0);
-	msm_dp_write_p0(catalog, MMSS_DP_INTF_ACTIVE_V_START_F0, 0);
-	msm_dp_write_p0(catalog, MMSS_DP_INTF_ACTIVE_V_END_F0, 0);
-	msm_dp_write_p0(catalog, MMSS_DP_INTF_ACTIVE_V_START_F1, 0);
-	msm_dp_write_p0(catalog, MMSS_DP_INTF_ACTIVE_V_END_F1, 0);
-	msm_dp_write_p0(catalog, MMSS_DP_INTF_POLARITY_CTL, 0);
-
-	msm_dp_write_p0(catalog, MMSS_DP_TPG_MAIN_CONTROL,
+	msm_dp_write_p0(msm_dp_catalog, MMSS_DP_INTF_VSYNC_PERIOD_F1, 0);
+	msm_dp_write_p0(msm_dp_catalog, MMSS_DP_INTF_VSYNC_PULSE_WIDTH_F1, 0);
+	msm_dp_write_p0(msm_dp_catalog, MMSS_DP_INTF_DISPLAY_HCTL, display_hctl);
+	msm_dp_write_p0(msm_dp_catalog, MMSS_DP_INTF_ACTIVE_HCTL, 0);
+	msm_dp_write_p0(msm_dp_catalog, MMSS_INTF_DISPLAY_V_START_F0, display_v_start);
+	msm_dp_write_p0(msm_dp_catalog, MMSS_DP_INTF_DISPLAY_V_END_F0, display_v_end);
+	msm_dp_write_p0(msm_dp_catalog, MMSS_INTF_DISPLAY_V_START_F1, 0);
+	msm_dp_write_p0(msm_dp_catalog, MMSS_DP_INTF_DISPLAY_V_END_F1, 0);
+	msm_dp_write_p0(msm_dp_catalog, MMSS_DP_INTF_ACTIVE_V_START_F0, 0);
+	msm_dp_write_p0(msm_dp_catalog, MMSS_DP_INTF_ACTIVE_V_END_F0, 0);
+	msm_dp_write_p0(msm_dp_catalog, MMSS_DP_INTF_ACTIVE_V_START_F1, 0);
+	msm_dp_write_p0(msm_dp_catalog, MMSS_DP_INTF_ACTIVE_V_END_F1, 0);
+	msm_dp_write_p0(msm_dp_catalog, MMSS_DP_INTF_POLARITY_CTL, 0);
+
+	msm_dp_write_p0(msm_dp_catalog, MMSS_DP_TPG_MAIN_CONTROL,
 				DP_TPG_CHECKERED_RECT_PATTERN);
-	msm_dp_write_p0(catalog, MMSS_DP_TPG_VIDEO_CONFIG,
+	msm_dp_write_p0(msm_dp_catalog, MMSS_DP_TPG_VIDEO_CONFIG,
 				DP_TPG_VIDEO_CONFIG_BPP_8BIT |
 				DP_TPG_VIDEO_CONFIG_RGB);
-	msm_dp_write_p0(catalog, MMSS_DP_BIST_ENABLE,
+	msm_dp_write_p0(msm_dp_catalog, MMSS_DP_BIST_ENABLE,
 				DP_BIST_ENABLE_DPBIST_EN);
-	msm_dp_write_p0(catalog, MMSS_DP_TIMING_ENGINE_EN,
+	msm_dp_write_p0(msm_dp_catalog, MMSS_DP_TIMING_ENGINE_EN,
 				DP_TIMING_ENGINE_EN_EN);
 	drm_dbg_dp(catalog->drm_dev, "%s: enabled tpg\n", __func__);
 }
 
 void msm_dp_catalog_panel_tpg_disable(struct msm_dp_catalog *msm_dp_catalog)
 {
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
-
-	msm_dp_write_p0(catalog, MMSS_DP_TPG_MAIN_CONTROL, 0x0);
-	msm_dp_write_p0(catalog, MMSS_DP_BIST_ENABLE, 0x0);
-	msm_dp_write_p0(catalog, MMSS_DP_TIMING_ENGINE_EN, 0x0);
+	msm_dp_write_p0(msm_dp_catalog, MMSS_DP_TPG_MAIN_CONTROL, 0x0);
+	msm_dp_write_p0(msm_dp_catalog, MMSS_DP_BIST_ENABLE, 0x0);
+	msm_dp_write_p0(msm_dp_catalog, MMSS_DP_TIMING_ENGINE_EN, 0x0);
 }
 
 void msm_dp_catalog_panel_clear_dsc_dto(struct msm_dp_catalog *msm_dp_catalog)
 {
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
-
-	msm_dp_write_p0(catalog, MMSS_DP_DSC_DTO, 0x0);
+	msm_dp_write_p0(msm_dp_catalog, MMSS_DP_DSC_DTO, 0x0);
 }
 
 static void __iomem *msm_dp_ioremap(struct platform_device *pdev, int idx, size_t *len)
@@ -1047,15 +958,15 @@ static void __iomem *msm_dp_ioremap(struct platform_device *pdev, int idx, size_
 
 static int msm_dp_catalog_get_io(struct msm_dp_catalog_private *catalog)
 {
+	struct msm_dp_catalog *msm_dp_catalog = &catalog->msm_dp_catalog;
 	struct platform_device *pdev = to_platform_device(catalog->dev);
-	struct dss_io_data *dss = &catalog->io;
 
-	dss->ahb.base = msm_dp_ioremap(pdev, 0, &dss->ahb.len);
-	if (IS_ERR(dss->ahb.base))
-		return PTR_ERR(dss->ahb.base);
+	msm_dp_catalog->ahb_base = msm_dp_ioremap(pdev, 0, &msm_dp_catalog->ahb_len);
+	if (IS_ERR(msm_dp_catalog->ahb_base))
+		return PTR_ERR(msm_dp_catalog->ahb_base);
 
-	dss->aux.base = msm_dp_ioremap(pdev, 1, &dss->aux.len);
-	if (IS_ERR(dss->aux.base)) {
+	msm_dp_catalog->aux_base = msm_dp_ioremap(pdev, 1, &msm_dp_catalog->aux_len);
+	if (IS_ERR(msm_dp_catalog->aux_base)) {
 		/*
 		 * The initial binding had a single reg, but in order to
 		 * support variation in the sub-region sizes this was split.
@@ -1063,34 +974,35 @@ static int msm_dp_catalog_get_io(struct msm_dp_catalog_private *catalog)
 		 * reg is specified, so fill in the sub-region offsets and
 		 * lengths based on this single region.
 		 */
-		if (PTR_ERR(dss->aux.base) == -EINVAL) {
-			if (dss->ahb.len < DP_DEFAULT_P0_OFFSET + DP_DEFAULT_P0_SIZE) {
+		if (PTR_ERR(msm_dp_catalog->aux_base) == -EINVAL) {
+			if (msm_dp_catalog->ahb_len < DP_DEFAULT_P0_OFFSET + DP_DEFAULT_P0_SIZE) {
 				DRM_ERROR("legacy memory region not large enough\n");
 				return -EINVAL;
 			}
 
-			dss->ahb.len = DP_DEFAULT_AHB_SIZE;
-			dss->aux.base = dss->ahb.base + DP_DEFAULT_AUX_OFFSET;
-			dss->aux.len = DP_DEFAULT_AUX_SIZE;
-			dss->link.base = dss->ahb.base + DP_DEFAULT_LINK_OFFSET;
-			dss->link.len = DP_DEFAULT_LINK_SIZE;
-			dss->p0.base = dss->ahb.base + DP_DEFAULT_P0_OFFSET;
-			dss->p0.len = DP_DEFAULT_P0_SIZE;
+			msm_dp_catalog->ahb_len = DP_DEFAULT_AHB_SIZE;
+			msm_dp_catalog->aux_base = msm_dp_catalog->ahb_base + DP_DEFAULT_AUX_OFFSET;
+			msm_dp_catalog->aux_len = DP_DEFAULT_AUX_SIZE;
+			msm_dp_catalog->link_base = msm_dp_catalog->ahb_base +
+				DP_DEFAULT_LINK_OFFSET;
+			msm_dp_catalog->link_len = DP_DEFAULT_LINK_SIZE;
+			msm_dp_catalog->p0_base = msm_dp_catalog->ahb_base + DP_DEFAULT_P0_OFFSET;
+			msm_dp_catalog->p0_len = DP_DEFAULT_P0_SIZE;
 		} else {
-			DRM_ERROR("unable to remap aux region: %pe\n", dss->aux.base);
-			return PTR_ERR(dss->aux.base);
+			DRM_ERROR("unable to remap aux region: %pe\n", msm_dp_catalog->aux_base);
+			return PTR_ERR(msm_dp_catalog->aux_base);
 		}
 	} else {
-		dss->link.base = msm_dp_ioremap(pdev, 2, &dss->link.len);
-		if (IS_ERR(dss->link.base)) {
-			DRM_ERROR("unable to remap link region: %pe\n", dss->link.base);
-			return PTR_ERR(dss->link.base);
+		msm_dp_catalog->link_base = msm_dp_ioremap(pdev, 2, &msm_dp_catalog->link_len);
+		if (IS_ERR(msm_dp_catalog->link_base)) {
+			DRM_ERROR("unable to remap link region: %pe\n", msm_dp_catalog->link_base);
+			return PTR_ERR(msm_dp_catalog->link_base);
 		}
 
-		dss->p0.base = msm_dp_ioremap(pdev, 3, &dss->p0.len);
-		if (IS_ERR(dss->p0.base)) {
-			DRM_ERROR("unable to remap p0 region: %pe\n", dss->p0.base);
-			return PTR_ERR(dss->p0.base);
+		msm_dp_catalog->p0_base = msm_dp_ioremap(pdev, 3, &msm_dp_catalog->p0_len);
+		if (IS_ERR(msm_dp_catalog->p0_base)) {
+			DRM_ERROR("unable to remap p0 region: %pe\n", msm_dp_catalog->p0_base);
+			return PTR_ERR(msm_dp_catalog->p0_base);
 		}
 	}
 
@@ -1118,72 +1030,62 @@ struct msm_dp_catalog *msm_dp_catalog_get(struct device *dev)
 void msm_dp_catalog_write_audio_stream(struct msm_dp_catalog *msm_dp_catalog,
 				       struct dp_sdp_header *sdp_hdr)
 {
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
 	u32 header[2];
 
 	msm_dp_utils_pack_sdp_header(sdp_hdr, header);
 
-	msm_dp_write_link(catalog, MMSS_DP_AUDIO_STREAM_0, header[0]);
-	msm_dp_write_link(catalog, MMSS_DP_AUDIO_STREAM_1, header[1]);
+	msm_dp_write_link(msm_dp_catalog, MMSS_DP_AUDIO_STREAM_0, header[0]);
+	msm_dp_write_link(msm_dp_catalog, MMSS_DP_AUDIO_STREAM_1, header[1]);
 }
 
 void msm_dp_catalog_write_audio_timestamp(struct msm_dp_catalog *msm_dp_catalog,
 					  struct dp_sdp_header *sdp_hdr)
 {
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
 	u32 header[2];
 
 	msm_dp_utils_pack_sdp_header(sdp_hdr, header);
 
-	msm_dp_write_link(catalog, MMSS_DP_AUDIO_TIMESTAMP_0, header[0]);
-	msm_dp_write_link(catalog, MMSS_DP_AUDIO_TIMESTAMP_1, header[1]);
+	msm_dp_write_link(msm_dp_catalog, MMSS_DP_AUDIO_TIMESTAMP_0, header[0]);
+	msm_dp_write_link(msm_dp_catalog, MMSS_DP_AUDIO_TIMESTAMP_1, header[1]);
 }
 
 void msm_dp_catalog_write_audio_infoframe(struct msm_dp_catalog *msm_dp_catalog,
 					  struct dp_sdp_header *sdp_hdr)
 {
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
 	u32 header[2];
 
 	msm_dp_utils_pack_sdp_header(sdp_hdr, header);
 
-	msm_dp_write_link(catalog, MMSS_DP_AUDIO_INFOFRAME_0, header[0]);
-	msm_dp_write_link(catalog, MMSS_DP_AUDIO_INFOFRAME_1, header[1]);
+	msm_dp_write_link(msm_dp_catalog, MMSS_DP_AUDIO_INFOFRAME_0, header[0]);
+	msm_dp_write_link(msm_dp_catalog, MMSS_DP_AUDIO_INFOFRAME_1, header[1]);
 }
 
 void msm_dp_catalog_write_audio_copy_mgmt(struct msm_dp_catalog *msm_dp_catalog,
 					  struct dp_sdp_header *sdp_hdr)
 {
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
 	u32 header[2];
 
 	msm_dp_utils_pack_sdp_header(sdp_hdr, header);
 
-	msm_dp_write_link(catalog, MMSS_DP_AUDIO_COPYMANAGEMENT_0, header[0]);
-	msm_dp_write_link(catalog, MMSS_DP_AUDIO_COPYMANAGEMENT_1, header[1]);
+	msm_dp_write_link(msm_dp_catalog, MMSS_DP_AUDIO_COPYMANAGEMENT_0, header[0]);
+	msm_dp_write_link(msm_dp_catalog, MMSS_DP_AUDIO_COPYMANAGEMENT_1, header[1]);
 }
 
 void msm_dp_catalog_write_audio_isrc(struct msm_dp_catalog *msm_dp_catalog,
 				     struct dp_sdp_header *sdp_hdr)
 {
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
 	struct dp_sdp_header tmp = *sdp_hdr;
 	u32 header[2];
 	u32 reg;
 
 	/* XXX: is it necessary to preserve this field? */
-	reg = msm_dp_read_link(catalog, MMSS_DP_AUDIO_ISRC_1);
+	reg = msm_dp_read_link(msm_dp_catalog, MMSS_DP_AUDIO_ISRC_1);
 	tmp.HB3 = FIELD_GET(HEADER_3_MASK, reg);
 
 	msm_dp_utils_pack_sdp_header(&tmp, header);
 
-	msm_dp_write_link(catalog, MMSS_DP_AUDIO_ISRC_0, header[0]);
-	msm_dp_write_link(catalog, MMSS_DP_AUDIO_ISRC_1, header[1]);
+	msm_dp_write_link(msm_dp_catalog, MMSS_DP_AUDIO_ISRC_0, header[0]);
+	msm_dp_write_link(msm_dp_catalog, MMSS_DP_AUDIO_ISRC_1, header[1]);
 }
 
 void msm_dp_catalog_audio_config_acr(struct msm_dp_catalog *msm_dp_catalog, u32 select)
@@ -1202,7 +1104,7 @@ void msm_dp_catalog_audio_config_acr(struct msm_dp_catalog *msm_dp_catalog, u32
 	drm_dbg_dp(catalog->drm_dev, "select: %#x, acr_ctrl: %#x\n",
 					select, acr_ctrl);
 
-	msm_dp_write_link(catalog, MMSS_DP_AUDIO_ACR_CTRL, acr_ctrl);
+	msm_dp_write_link(msm_dp_catalog, MMSS_DP_AUDIO_ACR_CTRL, acr_ctrl);
 }
 
 void msm_dp_catalog_audio_enable(struct msm_dp_catalog *msm_dp_catalog, bool enable)
@@ -1216,7 +1118,7 @@ void msm_dp_catalog_audio_enable(struct msm_dp_catalog *msm_dp_catalog, bool ena
 	catalog = container_of(msm_dp_catalog,
 		struct msm_dp_catalog_private, msm_dp_catalog);
 
-	audio_ctrl = msm_dp_read_link(catalog, MMSS_DP_AUDIO_CFG);
+	audio_ctrl = msm_dp_read_link(msm_dp_catalog, MMSS_DP_AUDIO_CFG);
 
 	if (enable)
 		audio_ctrl |= BIT(0);
@@ -1225,7 +1127,7 @@ void msm_dp_catalog_audio_enable(struct msm_dp_catalog *msm_dp_catalog, bool ena
 
 	drm_dbg_dp(catalog->drm_dev, "dp_audio_cfg = 0x%x\n", audio_ctrl);
 
-	msm_dp_write_link(catalog, MMSS_DP_AUDIO_CFG, audio_ctrl);
+	msm_dp_write_link(msm_dp_catalog, MMSS_DP_AUDIO_CFG, audio_ctrl);
 	/* make sure audio engine is disabled */
 	wmb();
 }
@@ -1242,7 +1144,7 @@ void msm_dp_catalog_audio_config_sdp(struct msm_dp_catalog *msm_dp_catalog)
 	catalog = container_of(msm_dp_catalog,
 		struct msm_dp_catalog_private, msm_dp_catalog);
 
-	sdp_cfg = msm_dp_read_link(catalog, MMSS_DP_SDP_CFG);
+	sdp_cfg = msm_dp_read_link(msm_dp_catalog, MMSS_DP_SDP_CFG);
 	/* AUDIO_TIMESTAMP_SDP_EN */
 	sdp_cfg |= BIT(1);
 	/* AUDIO_STREAM_SDP_EN */
@@ -1256,9 +1158,9 @@ void msm_dp_catalog_audio_config_sdp(struct msm_dp_catalog *msm_dp_catalog)
 
 	drm_dbg_dp(catalog->drm_dev, "sdp_cfg = 0x%x\n", sdp_cfg);
 
-	msm_dp_write_link(catalog, MMSS_DP_SDP_CFG, sdp_cfg);
+	msm_dp_write_link(msm_dp_catalog, MMSS_DP_SDP_CFG, sdp_cfg);
 
-	sdp_cfg2 = msm_dp_read_link(catalog, MMSS_DP_SDP_CFG2);
+	sdp_cfg2 = msm_dp_read_link(msm_dp_catalog, MMSS_DP_SDP_CFG2);
 	/* IFRM_REGSRC -> Do not use reg values */
 	sdp_cfg2 &= ~BIT(0);
 	/* AUDIO_STREAM_HB3_REGSRC-> Do not use reg values */
@@ -1266,7 +1168,7 @@ void msm_dp_catalog_audio_config_sdp(struct msm_dp_catalog *msm_dp_catalog)
 
 	drm_dbg_dp(catalog->drm_dev, "sdp_cfg2 = 0x%x\n", sdp_cfg2);
 
-	msm_dp_write_link(catalog, MMSS_DP_SDP_CFG2, sdp_cfg2);
+	msm_dp_write_link(msm_dp_catalog, MMSS_DP_SDP_CFG2, sdp_cfg2);
 }
 
 void msm_dp_catalog_audio_sfe_level(struct msm_dp_catalog *msm_dp_catalog, u32 safe_to_exit_level)
@@ -1280,7 +1182,7 @@ void msm_dp_catalog_audio_sfe_level(struct msm_dp_catalog *msm_dp_catalog, u32 s
 	catalog = container_of(msm_dp_catalog,
 		struct msm_dp_catalog_private, msm_dp_catalog);
 
-	mainlink_levels = msm_dp_read_link(catalog, REG_DP_MAINLINK_LEVELS);
+	mainlink_levels = msm_dp_read_link(msm_dp_catalog, REG_DP_MAINLINK_LEVELS);
 	mainlink_levels &= 0xFE0;
 	mainlink_levels |= safe_to_exit_level;
 
@@ -1288,5 +1190,5 @@ void msm_dp_catalog_audio_sfe_level(struct msm_dp_catalog *msm_dp_catalog, u32 s
 			"mainlink_level = 0x%x, safe_to_exit_level = 0x%x\n",
 			 mainlink_levels, safe_to_exit_level);
 
-	msm_dp_write_link(catalog, REG_DP_MAINLINK_LEVELS, mainlink_levels);
+	msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_LEVELS, mainlink_levels);
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 379fa4fef9ceb63b20c4aec2fca1e09003dc738b..5a757671d7310b43e7ca0155ffdc276c83d1e8bc 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -34,6 +34,18 @@
 struct msm_dp_catalog {
 	bool wide_bus_en;
 	u32 hw_revision;
+
+	void __iomem *ahb_base;
+	size_t ahb_len;
+
+	void __iomem *aux_base;
+	size_t aux_len;
+
+	void __iomem *link_base;
+	size_t link_len;
+
+	void __iomem *p0_base;
+	size_t p0_len;
 };
 
 /* Debug module */

-- 
2.39.5

