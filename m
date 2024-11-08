Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 064439C130E
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2024 01:22:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B1BA10E912;
	Fri,  8 Nov 2024 00:22:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rtRR5E6O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9266B10E910
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2024 00:22:09 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-539f1292a9bso1692283e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Nov 2024 16:22:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731025328; x=1731630128; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Z5kQ4AmnSGpR1tsagb+JUR8SjjRR8sZ+27U7rHc8thc=;
 b=rtRR5E6OgavDrLaH4Gycf+pTBoZSyb+4c5A+HdQxplyyg/XxdGe04iqNYb5aAbd3Tk
 CFsp/jm6cs2ohmRJgcAfgv5mG2mj4XHOJ2ZKoAHvJQuoC4cCg8s8Ef5h6Xnp0OxHy0X/
 VNac/+eoKHkRminpdxVueaGad9gbXMjIZw8ub5mCqG/kk+tz2KCtuogg33XBiELBv+5V
 ECVZvkkCW9v/v1iyy6uwll6AP7t3XUT8MNnA5DLxc8JVwu5TQ1MofbDgdZySbQ2LhlFT
 /v0R+V24hYgEKqqH91CXZU0munwARnlGXht1FJi4oxjXVw8PCHEXw0QIGxCTvzP+7LD2
 77Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731025328; x=1731630128;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z5kQ4AmnSGpR1tsagb+JUR8SjjRR8sZ+27U7rHc8thc=;
 b=YsEkg8gt9nIzVC5Idf4qXWRyla/SbgG2Vv0o6UQWfDTe2H9Xea7bRNgLauOBNrv6wc
 sktShvh0u5uYsLMQfzZC7vx0SpThyxjksMadoWIkk92ZLjjZQYlkZI2pLlTsi3BSc2Xl
 JgTc9BNnYT4Z4qDDFoVff6Bs/siZKCu+VtvpisC2yYO6D0C25xgRfheyZt5Gdc/xXNqy
 K/w7VYpNZrXzcRRHs07MSdsRykgwO/GP4PuPo4Smo5kSBTs6WErzFtbmnymCxBhgi4X4
 KRMuRNNTEKTj3YM6+rlOEbSF/948p9ZYY3mQteYBUEu/yykBBox49SsLPmdsCuBLx1qq
 bxnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUJ/DJON1Y2i1mG4lgFGLB/kGrScI8pmJaytKaD2tBhr/tQEA7UjscL34mmEYZrGQ6QlviLVKefss=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YypDhmMq3fA5frY6fcIWkUOu0qLIp/0ZiQoW9iisk7U0pPKPqKl
 KX53+yTGdqRUNhey/ZHXPeJhPYrAFamH2SYlnxWXWRaKCnsBzZIyHmi0EZDlEkM=
X-Google-Smtp-Source: AGHT+IFtPSNKeO7vF9wCM86fTjU3dsWl3RKTsfudcRZdzKmu76nAD+5RkIhDSRgF9xUxHt70BZ39RA==
X-Received: by 2002:a05:651c:150c:b0:2fb:5d8a:4cd3 with SMTP id
 38308e7fff4ca-2ff2006084fmr4840981fa.0.1731025327552; 
 Thu, 07 Nov 2024 16:22:07 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ff17900a63sm4195191fa.47.2024.11.07.16.22.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Nov 2024 16:22:06 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 08 Nov 2024 02:21:42 +0200
Subject: [PATCH 11/14] drm/msm/dp: move/inline audio related functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241108-fd-dp-audio-fixup-v1-11-40c8eeb60cf5@linaro.org>
References: <20241108-fd-dp-audio-fixup-v1-0-40c8eeb60cf5@linaro.org>
In-Reply-To: <20241108-fd-dp-audio-fixup-v1-0-40c8eeb60cf5@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Paloma Arellano <quic_parellan@quicinc.com>
Cc: Douglas Anderson <dianders@chromium.org>, 
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8606;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=CJNeGuR1/hi3WdAk96FubFXJd9V4K8sajDyAH3cIEjU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnLVmQeBbtYi7rdedJFb/81mfZJGHDrLlk9stC7
 4/2bOapZWKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZy1ZkAAKCRCLPIo+Aiko
 1QYkB/9rDbCubMBn3heGWbrNxPet0AQvpG5JDcMUCKY+A2fLmhT50dnyI5FG7aaiKlly/VMv2ng
 tTYFVEtg4t/ESTsAcIuc6LOrxxyU4MffokBo7j8shuZd+uwTzNdU1KKAlb3UJDDMDHgFDi4BPln
 L3t86jimpIlb7CAxHDQOOzoI4cFdxd1ecJwyCtV11y/6xEzSpRV/cQm9KBPDs+8HmsTe8KXxLwz
 fera0F7J53nL3vEA5D0KbtMWA2sTH98BK64VSXHiXhyf/ScF8VeYzDypgipj1UnUogvgVf6PXu0
 SDw51FWsiiTgeKL1ljjUC0aXWdu29osm5Esgd1ZooR1GWr70
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

Move audio-related functions to dp_audio.c, following up the cleanup
done by the rest of the submodules. Inline functions with simple
register access patterns.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_audio.c   |  72 +++++++++++++++++++++----
 drivers/gpu/drm/msm/dp/dp_catalog.c | 105 ------------------------------------
 drivers/gpu/drm/msm/dp/dp_catalog.h |   6 ---
 3 files changed, 63 insertions(+), 120 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
index 63bdd57948401451426364796e608643c1ebfebe..63c4cd88edef07c54b2eb54d5b6ee494ee94723d 100644
--- a/drivers/gpu/drm/msm/dp/dp_audio.c
+++ b/drivers/gpu/drm/msm/dp/dp_audio.c
@@ -119,9 +119,41 @@ static void msm_dp_audio_isrc_sdp(struct msm_dp_audio_private *audio)
 	msm_dp_write_link(catalog, MMSS_DP_AUDIO_ISRC_1, header[1]);
 }
 
+static void msm_dp_audio_config_sdp(struct msm_dp_audio_private *audio)
+{
+	struct msm_dp_catalog *msm_dp_catalog = audio->catalog;
+	u32 sdp_cfg, sdp_cfg2;
+
+	sdp_cfg = msm_dp_read_link(msm_dp_catalog, MMSS_DP_SDP_CFG);
+	/* AUDIO_TIMESTAMP_SDP_EN */
+	sdp_cfg |= BIT(1);
+	/* AUDIO_STREAM_SDP_EN */
+	sdp_cfg |= BIT(2);
+	/* AUDIO_COPY_MANAGEMENT_SDP_EN */
+	sdp_cfg |= BIT(5);
+	/* AUDIO_ISRC_SDP_EN  */
+	sdp_cfg |= BIT(6);
+	/* AUDIO_INFOFRAME_SDP_EN  */
+	sdp_cfg |= BIT(20);
+
+	drm_dbg_dp(audio->drm_dev, "sdp_cfg = 0x%x\n", sdp_cfg);
+
+	msm_dp_write_link(msm_dp_catalog, MMSS_DP_SDP_CFG, sdp_cfg);
+
+	sdp_cfg2 = msm_dp_read_link(msm_dp_catalog, MMSS_DP_SDP_CFG2);
+	/* IFRM_REGSRC -> Do not use reg values */
+	sdp_cfg2 &= ~BIT(0);
+	/* AUDIO_STREAM_HB3_REGSRC-> Do not use reg values */
+	sdp_cfg2 &= ~BIT(1);
+
+	drm_dbg_dp(audio->drm_dev, "sdp_cfg2 = 0x%x\n", sdp_cfg2);
+
+	msm_dp_write_link(msm_dp_catalog, MMSS_DP_SDP_CFG2, sdp_cfg2);
+}
+
 static void msm_dp_audio_setup_sdp(struct msm_dp_audio_private *audio)
 {
-	msm_dp_catalog_audio_config_sdp(audio->catalog);
+	msm_dp_audio_config_sdp(audio);
 
 	msm_dp_audio_stream_sdp(audio);
 	msm_dp_audio_timestamp_sdp(audio);
@@ -132,8 +164,7 @@ static void msm_dp_audio_setup_sdp(struct msm_dp_audio_private *audio)
 
 static void msm_dp_audio_setup_acr(struct msm_dp_audio_private *audio)
 {
-	u32 select = 0;
-	struct msm_dp_catalog *catalog = audio->catalog;
+	u32 select, acr_ctrl;
 
 	switch (audio->msm_dp_audio.bw_code) {
 	case DP_LINK_BW_1_62:
@@ -154,13 +185,17 @@ static void msm_dp_audio_setup_acr(struct msm_dp_audio_private *audio)
 		break;
 	}
 
-	msm_dp_catalog_audio_config_acr(catalog, select);
+	acr_ctrl = select << 4 | BIT(31) | BIT(8) | BIT(14);
+
+	drm_dbg_dp(audio->drm_dev, "select: %#x, acr_ctrl: %#x\n",
+		   select, acr_ctrl);
+
+	msm_dp_write_link(audio->catalog, MMSS_DP_AUDIO_ACR_CTRL, acr_ctrl);
 }
 
 static void msm_dp_audio_safe_to_exit_level(struct msm_dp_audio_private *audio)
 {
-	struct msm_dp_catalog *catalog = audio->catalog;
-	u32 safe_to_exit_level = 0;
+	u32 safe_to_exit_level, mainlink_levels;
 
 	switch (audio->msm_dp_audio.lane_count) {
 	case 1:
@@ -180,14 +215,33 @@ static void msm_dp_audio_safe_to_exit_level(struct msm_dp_audio_private *audio)
 		break;
 	}
 
-	msm_dp_catalog_audio_sfe_level(catalog, safe_to_exit_level);
+	mainlink_levels = msm_dp_read_link(audio->catalog, REG_DP_MAINLINK_LEVELS);
+	mainlink_levels &= 0xFE0;
+	mainlink_levels |= safe_to_exit_level;
+
+	drm_dbg_dp(audio->drm_dev,
+		   "mainlink_level = 0x%x, safe_to_exit_level = 0x%x\n",
+		   mainlink_levels, safe_to_exit_level);
+
+	msm_dp_write_link(audio->catalog, REG_DP_MAINLINK_LEVELS, mainlink_levels);
 }
 
 static void msm_dp_audio_enable(struct msm_dp_audio_private *audio, bool enable)
 {
-	struct msm_dp_catalog *catalog = audio->catalog;
+	u32 audio_ctrl;
+
+	audio_ctrl = msm_dp_read_link(audio->catalog, MMSS_DP_AUDIO_CFG);
+
+	if (enable)
+		audio_ctrl |= BIT(0);
+	else
+		audio_ctrl &= ~BIT(0);
+
+	drm_dbg_dp(audio->drm_dev, "dp_audio_cfg = 0x%x\n", audio_ctrl);
 
-	msm_dp_catalog_audio_enable(catalog, enable);
+	msm_dp_write_link(audio->catalog, MMSS_DP_AUDIO_CFG, audio_ctrl);
+	/* make sure audio engine is disabled */
+	wmb();
 }
 
 static struct msm_dp_audio_private *msm_dp_audio_get_data(struct platform_device *pdev)
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 5071c86fd219cb1c933b32104a396982c5cc8ace..60ba6e0a204f536fd050591e891add17d286fb2d 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -298,108 +298,3 @@ struct msm_dp_catalog *msm_dp_catalog_get(struct device *dev)
 
 	return &catalog->msm_dp_catalog;
 }
-
-void msm_dp_catalog_audio_config_acr(struct msm_dp_catalog *msm_dp_catalog, u32 select)
-{
-	struct msm_dp_catalog_private *catalog;
-	u32 acr_ctrl;
-
-	if (!msm_dp_catalog)
-		return;
-
-	catalog = container_of(msm_dp_catalog,
-		struct msm_dp_catalog_private, msm_dp_catalog);
-
-	acr_ctrl = select << 4 | BIT(31) | BIT(8) | BIT(14);
-
-	drm_dbg_dp(catalog->drm_dev, "select: %#x, acr_ctrl: %#x\n",
-					select, acr_ctrl);
-
-	msm_dp_write_link(msm_dp_catalog, MMSS_DP_AUDIO_ACR_CTRL, acr_ctrl);
-}
-
-void msm_dp_catalog_audio_enable(struct msm_dp_catalog *msm_dp_catalog, bool enable)
-{
-	struct msm_dp_catalog_private *catalog;
-	u32 audio_ctrl;
-
-	if (!msm_dp_catalog)
-		return;
-
-	catalog = container_of(msm_dp_catalog,
-		struct msm_dp_catalog_private, msm_dp_catalog);
-
-	audio_ctrl = msm_dp_read_link(msm_dp_catalog, MMSS_DP_AUDIO_CFG);
-
-	if (enable)
-		audio_ctrl |= BIT(0);
-	else
-		audio_ctrl &= ~BIT(0);
-
-	drm_dbg_dp(catalog->drm_dev, "dp_audio_cfg = 0x%x\n", audio_ctrl);
-
-	msm_dp_write_link(msm_dp_catalog, MMSS_DP_AUDIO_CFG, audio_ctrl);
-	/* make sure audio engine is disabled */
-	wmb();
-}
-
-void msm_dp_catalog_audio_config_sdp(struct msm_dp_catalog *msm_dp_catalog)
-{
-	struct msm_dp_catalog_private *catalog;
-	u32 sdp_cfg = 0;
-	u32 sdp_cfg2 = 0;
-
-	if (!msm_dp_catalog)
-		return;
-
-	catalog = container_of(msm_dp_catalog,
-		struct msm_dp_catalog_private, msm_dp_catalog);
-
-	sdp_cfg = msm_dp_read_link(msm_dp_catalog, MMSS_DP_SDP_CFG);
-	/* AUDIO_TIMESTAMP_SDP_EN */
-	sdp_cfg |= BIT(1);
-	/* AUDIO_STREAM_SDP_EN */
-	sdp_cfg |= BIT(2);
-	/* AUDIO_COPY_MANAGEMENT_SDP_EN */
-	sdp_cfg |= BIT(5);
-	/* AUDIO_ISRC_SDP_EN  */
-	sdp_cfg |= BIT(6);
-	/* AUDIO_INFOFRAME_SDP_EN  */
-	sdp_cfg |= BIT(20);
-
-	drm_dbg_dp(catalog->drm_dev, "sdp_cfg = 0x%x\n", sdp_cfg);
-
-	msm_dp_write_link(msm_dp_catalog, MMSS_DP_SDP_CFG, sdp_cfg);
-
-	sdp_cfg2 = msm_dp_read_link(msm_dp_catalog, MMSS_DP_SDP_CFG2);
-	/* IFRM_REGSRC -> Do not use reg values */
-	sdp_cfg2 &= ~BIT(0);
-	/* AUDIO_STREAM_HB3_REGSRC-> Do not use reg values */
-	sdp_cfg2 &= ~BIT(1);
-
-	drm_dbg_dp(catalog->drm_dev, "sdp_cfg2 = 0x%x\n", sdp_cfg2);
-
-	msm_dp_write_link(msm_dp_catalog, MMSS_DP_SDP_CFG2, sdp_cfg2);
-}
-
-void msm_dp_catalog_audio_sfe_level(struct msm_dp_catalog *msm_dp_catalog, u32 safe_to_exit_level)
-{
-	struct msm_dp_catalog_private *catalog;
-	u32 mainlink_levels;
-
-	if (!msm_dp_catalog)
-		return;
-
-	catalog = container_of(msm_dp_catalog,
-		struct msm_dp_catalog_private, msm_dp_catalog);
-
-	mainlink_levels = msm_dp_read_link(msm_dp_catalog, REG_DP_MAINLINK_LEVELS);
-	mainlink_levels &= 0xFE0;
-	mainlink_levels |= safe_to_exit_level;
-
-	drm_dbg_dp(catalog->drm_dev,
-			"mainlink_level = 0x%x, safe_to_exit_level = 0x%x\n",
-			 mainlink_levels, safe_to_exit_level);
-
-	msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_LEVELS, mainlink_levels);
-}
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 24f1cf4ed5150c4e0e80880588641a01bb6a1596..e2fdccc332f874458709593c68a1d1a46b6cc406 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -134,10 +134,4 @@ u32 msm_dp_catalog_ctrl_read_psr_interrupt_status(struct msm_dp_catalog *msm_dp_
 
 struct msm_dp_catalog *msm_dp_catalog_get(struct device *dev);
 
-/* DP Audio APIs */
-void msm_dp_catalog_audio_config_acr(struct msm_dp_catalog *catalog, u32 select);
-void msm_dp_catalog_audio_enable(struct msm_dp_catalog *catalog, bool enable);
-void msm_dp_catalog_audio_config_sdp(struct msm_dp_catalog *catalog);
-void msm_dp_catalog_audio_sfe_level(struct msm_dp_catalog *catalog, u32 safe_to_exit_level);
-
 #endif /* _DP_CATALOG_H_ */

-- 
2.39.5

