Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A0BAC3534
	for <lists+dri-devel@lfdr.de>; Sun, 25 May 2025 16:47:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B28F10E035;
	Sun, 25 May 2025 14:47:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FdpaqHuT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A59210E035
 for <dri-devel@lists.freedesktop.org>; Sun, 25 May 2025 14:47:00 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-22e331215dbso16281415ad.1
 for <dri-devel@lists.freedesktop.org>; Sun, 25 May 2025 07:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748184420; x=1748789220; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mUBZLDan2eHNaNoZcWdVDsVnGQBcMSxMokkMwlfK4G4=;
 b=FdpaqHuTSrxx/yvYF5pmEvWHv356zn4p/X791OS5cdE/bqGEHGuZMOPDglIvmDd07e
 L36BPnRX54MPfRGIXQAhd52fNRQSJk22jfKCbUySa60sHCzNc2VAvsD1lshh8LJSl7ih
 aQFeWAmYP/dycq+VOfPpvkevepDXBIydbw1r7fNP4JopYF3bX9hyPm+lk46ahGPr4qGf
 2KYCxTeJ/zf2D2bOHjFfqJ04uAKuNg6iYyJ5CFjjEAnKfqI/72TFq6VuzB4vQFs5gWXk
 YJ+080JHgH5DrwKw/JVnsKfOmhscNJ8GoW1p2s5sSwGNO1+Exvnq4E3lLlnVFSZhpoQl
 pgXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748184420; x=1748789220;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mUBZLDan2eHNaNoZcWdVDsVnGQBcMSxMokkMwlfK4G4=;
 b=cbMg3nzWu28chzELYqEHn+xQI8GOGk62j1/neugKx2RK748aRjNcKYSBfG0ZyBLWVa
 px/MVrWhwTfVdiRKJMZxF3K8z6N2H4qFct6NjXzm0DCd5kpOy4ZMY2JOPiZXJl476OCO
 CUnzqVGyJHIIcCmgtP/uEHsIkqIXP0qfw2c7FNDc5Bwc1L1/1ROJoSd92K4e2zZDKun6
 66h4jMBhy9Bp1Ry0AKTBpLuLvk9d71jhwKMnr8cHMdY/Wk3TIfkny8cSTCSQpumZO9J5
 aVBTn4j+Hafso2DP4spIu0Osfa0/zyqcEoXS+K77RZDDuDLAIvAaYtjr1QicjWMpeOgk
 NmPw==
X-Gm-Message-State: AOJu0YzQiNJqgALni0yafcBLPa0B2xUP5gdoLc3cBVRNC0e5huzB+sVn
 RhSicYFiW+GjAZews5V6fcfPPnTKP3LXERYQuLtzjYrt0OwNb+QV3ZBn
X-Gm-Gg: ASbGncuuRYcUyvvHmZZJMso7xjKTXyLusaLulsBRwRyE0ZF1KsF+FYuvUr3eyRCZweM
 DaMfnRwzZHE8DxEhEcC6zzOK+dTwot7I3FOxQT4H/O5NAFTJ5zWPspEI7E0YSosV0bpmM3MrmzG
 ZrB5NqG6N0wFt0D5oiDeZrNhMOcu1YC2RrCzNBzT7LRkxr89OHWPhsg0zGhiIUcPnNWtzeYniPE
 Utxwq1g8TfT+PtsWSl0I+Djd4bi9LqQjGe5IZUNiZJGjY158Ooqg1/gCgQ4zESUOc5uBa2PoKQR
 dG8GC1761uxANft2pLfOjc6lOfvVb2EzEK9Y/f9J/Zej5Jlf/14KxqeZ
X-Google-Smtp-Source: AGHT+IHZ4ZVvOSCTSKofCdJ6GvvfD60Ebge+g2JstzGYgmfkSNm08awAgjeBbuyIeU+QYdMtvOSe3A==
X-Received: by 2002:a17:903:2b03:b0:234:557d:a4cb with SMTP id
 d9443c01a7336-234557da6f4mr15822185ad.20.1748184419704; 
 Sun, 25 May 2025 07:46:59 -0700 (PDT)
Received: from eleanor-wkdl.. ([140.116.96.205])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2341b732b58sm25121925ad.180.2025.05.25.07.46.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 May 2025 07:46:59 -0700 (PDT)
From: Yu-Chun Lin <eleanor15x@gmail.com>
To: thierry.reding@gmail.com, mperttunen@nvidia.com, airlied@gmail.com,
 simona@ffwll.ch, jonathanh@nvidia.com, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 jserv@ccns.ncku.edu.tw, visitorckw@gmail.com,
 Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [PATCH] drm: tegra: Fix undefined behavior in left shift operation
Date: Sun, 25 May 2025 22:46:50 +0800
Message-ID: <20250525144650.2365704-1-eleanor15x@gmail.com>
X-Mailer: git-send-email 2.43.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

According to the C11 standard (ISO/IEC 9899:2011, 6.5.7):
"If E1 has a signed type and E1 x 2^E2 is not representable in the result
type, the behavior is undefined."

Shifting 1 << 31 causes signed integer overflow, which leads to undefined
behavior.

Fix this by explicitly using 'BIT(31)' to ensure the shift operates on an
unsigned type, avoiding undefined behavior.

Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
---
Compile test only

 drivers/gpu/drm/tegra/dc.c    |  2 +-
 drivers/gpu/drm/tegra/hdmi.c  |  8 ++++----
 drivers/gpu/drm/tegra/hdmi.h  |  8 ++++----
 drivers/gpu/drm/tegra/riscv.c |  2 +-
 drivers/gpu/drm/tegra/sor.h   | 14 +++++++-------
 5 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 430b2eededb2..3047a380bb83 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -2171,7 +2171,7 @@ static void tegra_crtc_atomic_enable(struct drm_crtc *crtc,
 		u32 syncpt = host1x_syncpt_id(dc->syncpt), enable;
 
 		if (dc->soc->has_nvdisplay)
-			enable = 1 << 31;
+			enable = BIT(31);
 		else
 			enable = 1 << 8;
 
diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index e705f8590c13..524b46a297be 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -1719,7 +1719,7 @@ static const struct tegra_hdmi_config tegra20_hdmi_config = {
 	.tmds = tegra20_tmds_config,
 	.num_tmds = ARRAY_SIZE(tegra20_tmds_config),
 	.fuse_override_offset = HDMI_NV_PDISP_SOR_LANE_DRIVE_CURRENT,
-	.fuse_override_value = 1 << 31,
+	.fuse_override_value = BIT(31),
 	.has_sor_io_peak_current = false,
 	.has_hda = false,
 	.has_hbr = false,
@@ -1729,7 +1729,7 @@ static const struct tegra_hdmi_config tegra30_hdmi_config = {
 	.tmds = tegra30_tmds_config,
 	.num_tmds = ARRAY_SIZE(tegra30_tmds_config),
 	.fuse_override_offset = HDMI_NV_PDISP_SOR_LANE_DRIVE_CURRENT,
-	.fuse_override_value = 1 << 31,
+	.fuse_override_value = BIT(31),
 	.has_sor_io_peak_current = false,
 	.has_hda = true,
 	.has_hbr = false,
@@ -1739,7 +1739,7 @@ static const struct tegra_hdmi_config tegra114_hdmi_config = {
 	.tmds = tegra114_tmds_config,
 	.num_tmds = ARRAY_SIZE(tegra114_tmds_config),
 	.fuse_override_offset = HDMI_NV_PDISP_SOR_PAD_CTLS0,
-	.fuse_override_value = 1 << 31,
+	.fuse_override_value = BIT(31),
 	.has_sor_io_peak_current = true,
 	.has_hda = true,
 	.has_hbr = true,
@@ -1749,7 +1749,7 @@ static const struct tegra_hdmi_config tegra124_hdmi_config = {
 	.tmds = tegra124_tmds_config,
 	.num_tmds = ARRAY_SIZE(tegra124_tmds_config),
 	.fuse_override_offset = HDMI_NV_PDISP_SOR_PAD_CTLS0,
-	.fuse_override_value = 1 << 31,
+	.fuse_override_value = BIT(31),
 	.has_sor_io_peak_current = true,
 	.has_hda = true,
 	.has_hbr = true,
diff --git a/drivers/gpu/drm/tegra/hdmi.h b/drivers/gpu/drm/tegra/hdmi.h
index 8deb04223c18..57727703779b 100644
--- a/drivers/gpu/drm/tegra/hdmi.h
+++ b/drivers/gpu/drm/tegra/hdmi.h
@@ -119,7 +119,7 @@
 
 #define ACR_SUBPACK_CTS(x) (((x) & 0xffffff) << 8)
 #define ACR_SUBPACK_N(x)   (((x) & 0xffffff) << 0)
-#define ACR_ENABLE         (1 << 31)
+#define ACR_ENABLE         BIT(31)
 
 #define HDMI_NV_PDISP_HDMI_CTRL					0x44
 #define HDMI_CTRL_REKEY(x)         (((x) & 0x7f) <<  0)
@@ -130,7 +130,7 @@
 #define HDMI_NV_PDISP_HDMI_VSYNC_WINDOW				0x46
 #define VSYNC_WINDOW_END(x)   (((x) & 0x3ff) <<  0)
 #define VSYNC_WINDOW_START(x) (((x) & 0x3ff) << 16)
-#define VSYNC_WINDOW_ENABLE   (1 << 31)
+#define VSYNC_WINDOW_ENABLE   BIT(31)
 
 #define HDMI_NV_PDISP_HDMI_GCP_CTRL				0x47
 #define HDMI_NV_PDISP_HDMI_GCP_STATUS				0x48
@@ -158,8 +158,8 @@
 #define SOR_PWR_SAFE_STATE_PD       (0 << 16)
 #define SOR_PWR_SAFE_STATE_PU       (1 << 16)
 #define SOR_PWR_SETTING_NEW_DONE    (0 << 31)
-#define SOR_PWR_SETTING_NEW_PENDING (1 << 31)
-#define SOR_PWR_SETTING_NEW_TRIGGER (1 << 31)
+#define SOR_PWR_SETTING_NEW_PENDING BIT(31)
+#define SOR_PWR_SETTING_NEW_TRIGGER BIT(31)
 
 #define HDMI_NV_PDISP_SOR_TEST					0x56
 #define HDMI_NV_PDISP_SOR_PLL0					0x57
diff --git a/drivers/gpu/drm/tegra/riscv.c b/drivers/gpu/drm/tegra/riscv.c
index 6580416408f8..a5941239b194 100644
--- a/drivers/gpu/drm/tegra/riscv.c
+++ b/drivers/gpu/drm/tegra/riscv.c
@@ -19,7 +19,7 @@
 #define RISCV_BCR_CTRL_CORE_SELECT_RISCV		(1 << 4)
 #define RISCV_BCR_DMACFG				0x466c
 #define RISCV_BCR_DMACFG_TARGET_LOCAL_FB		(0 << 0)
-#define RISCV_BCR_DMACFG_LOCK_LOCKED			(1 << 31)
+#define RISCV_BCR_DMACFG_LOCK_LOCKED			BIT(31)
 #define RISCV_BCR_DMAADDR_PKCPARAM_LO			0x4670
 #define RISCV_BCR_DMAADDR_PKCPARAM_HI			0x4674
 #define RISCV_BCR_DMAADDR_FMCCODE_LO			0x4678
diff --git a/drivers/gpu/drm/tegra/sor.h b/drivers/gpu/drm/tegra/sor.h
index 00e09d5dca30..4f404f22dd04 100644
--- a/drivers/gpu/drm/tegra/sor.h
+++ b/drivers/gpu/drm/tegra/sor.h
@@ -74,7 +74,7 @@
 #define SOR_CAP 0x14
 
 #define SOR_PWR 0x15
-#define  SOR_PWR_TRIGGER			(1 << 31)
+#define  SOR_PWR_TRIGGER			BIT(31)
 #define  SOR_PWR_MODE_SAFE			(1 << 28)
 #define  SOR_PWR_NORMAL_STATE_PU		(1 << 0)
 
@@ -154,7 +154,7 @@
 #define  SOR_SEQ_CTL_PU_PC(x)		(((x) & 0xf) <<  0)
 
 #define SOR_LANE_SEQ_CTL 0x21
-#define  SOR_LANE_SEQ_CTL_TRIGGER		(1 << 31)
+#define  SOR_LANE_SEQ_CTL_TRIGGER		BIT(31)
 #define  SOR_LANE_SEQ_CTL_STATE_BUSY		(1 << 28)
 #define  SOR_LANE_SEQ_CTL_SEQUENCE_UP		(0 << 20)
 #define  SOR_LANE_SEQ_CTL_SEQUENCE_DOWN		(1 << 20)
@@ -163,7 +163,7 @@
 #define  SOR_LANE_SEQ_CTL_DELAY(x)		(((x) & 0xf) << 12)
 
 #define SOR_SEQ_INST(x) (0x22 + (x))
-#define  SOR_SEQ_INST_PLL_PULLDOWN (1 << 31)
+#define  SOR_SEQ_INST_PLL_PULLDOWN BIT(31)
 #define  SOR_SEQ_INST_POWERDOWN_MACRO (1 << 30)
 #define  SOR_SEQ_INST_ASSERT_PLL_RESET (1 << 29)
 #define  SOR_SEQ_INST_BLANK_V (1 << 28)
@@ -192,7 +192,7 @@
 #define  SOR_PWM_DIV_MASK			0xffffff
 
 #define SOR_PWM_CTL 0x33
-#define  SOR_PWM_CTL_TRIGGER			(1 << 31)
+#define  SOR_PWM_CTL_TRIGGER			BIT(31)
 #define  SOR_PWM_CTL_CLK_SEL			(1 << 30)
 #define  SOR_PWM_CTL_DUTY_CYCLE_MASK		0xffffff
 
@@ -261,7 +261,7 @@
 #define  SOR_LANE_POSTCURSOR_LANE0(x) (((x) & 0xff) << 0)
 
 #define SOR_DP_CONFIG0 0x58
-#define SOR_DP_CONFIG_DISPARITY_NEGATIVE	(1 << 31)
+#define SOR_DP_CONFIG_DISPARITY_NEGATIVE	BIT(31)
 #define SOR_DP_CONFIG_ACTIVE_SYM_ENABLE		(1 << 26)
 #define SOR_DP_CONFIG_ACTIVE_SYM_POLARITY	(1 << 24)
 #define SOR_DP_CONFIG_ACTIVE_SYM_FRAC_MASK	(0xf << 16)
@@ -370,7 +370,7 @@
 #define  SOR_HDMI_ACR_SUBPACK_LOW_SB1(x) (((x) & 0xff) << 24)
 
 #define SOR_HDMI_ACR_0320_SUBPACK_HIGH 0xb3
-#define  SOR_HDMI_ACR_SUBPACK_HIGH_ENABLE (1 << 31)
+#define  SOR_HDMI_ACR_SUBPACK_HIGH_ENABLE BIT(31)
 
 #define SOR_HDMI_ACR_0441_SUBPACK_LOW 0xb4
 #define SOR_HDMI_ACR_0441_SUBPACK_HIGH 0xb5
@@ -382,7 +382,7 @@
 #define  SOR_HDMI_CTRL_REKEY(x) (((x) & 0x7f) << 0)
 
 #define SOR_HDMI_SPARE 0xcb
-#define  SOR_HDMI_SPARE_ACR_PRIORITY_HIGH (1 << 31)
+#define  SOR_HDMI_SPARE_ACR_PRIORITY_HIGH BIT(31)
 #define  SOR_HDMI_SPARE_CTS_RESET(x) (((x) & 0x7) << 16)
 #define  SOR_HDMI_SPARE_HW_CTS_ENABLE (1 << 0)
 
-- 
2.43.0

