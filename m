Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 671E56BD554
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 17:18:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7971810E21E;
	Thu, 16 Mar 2023 16:17:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEE3410ED3D
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 16:17:22 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id z42so2236975ljq.13
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 09:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678983442;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aEd53pRitmksoY7VkZU7ktA54Q36GJy+bm03pjYtpTI=;
 b=UHYPJCQxD1wjB04q4JJlUPexhYgAf+8HK1KvBuOPfuwDSH/X7RXavlarBDwfGex2g9
 ZNmdk0i6Iv15KpD/BDaRjEr91ihldyr0Nvn1x6dPOtgNVw7JdscgsDpHyr5bIsJeBtPn
 pMRrWJgnGbg8iwOgQ8DJnCU0zkIXbqhJJ1jMYc+4NUKbobJvhMgGaFOqH9G9wCsvw3v9
 ul6NN/7PKDtakO5pgk18S6uWconUuaAARI+p9WNUEQdGHUguQfThaakI7HZZcRAQV/sa
 dUiT3gDdW3htMK3SzZpSZTK4awcO6EoIMhRWoGgCuolDAN/t9lZ2F2cH0MNSDKZavTTf
 33ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678983442;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aEd53pRitmksoY7VkZU7ktA54Q36GJy+bm03pjYtpTI=;
 b=ezsI3LNnezP5LJJFTmu5PkF1RDX6R1n7M7FW+MFhkuLW9jKHL8wXZqlTlPXCWq5uBO
 buDb4UIQXqOCSAUiZTucGGeQ/pJh9nJxNK52y2CRMbkst3/JE0f15utMpV0sOzQpjSFf
 M4c49ZxWaDslqBhC5L6shWdRpXHKewHGMo0ve/or+wyU9HvLZhp2LpsDLw8zCKvSjj9a
 nRwDlYityRWR0kT3pjXE+ZGLu5ka3BRCEew2K6nd4Ya5gIohSpuwIJ0KSNFGwKrKC8Q8
 gpQE/dl0m5DR0btekf/+aCYqhc0EyKv7WdEy3GyjHdBJCzwquqs4m1Vgd5zhN3qmkumh
 6Z6Q==
X-Gm-Message-State: AO0yUKWwdvOCX9L5uXx6S6bAtxI26jAtFTzuPXUW650eRFnXaIoSO1+8
 r5i6qFsK1KGJUhf2aEdbNPmLNQ==
X-Google-Smtp-Source: AK7set8V7dP8pc7HDho57UjhUqR1U5samg4oNaJgxFvS2OpKkNHcR+FRSNa8Z4RRLjSKR0rg9EYaZA==
X-Received: by 2002:a2e:9402:0:b0:298:97d7:8fc3 with SMTP id
 i2-20020a2e9402000000b0029897d78fc3mr2343629ljh.4.1678983442270; 
 Thu, 16 Mar 2023 09:17:22 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a2e8342000000b00298b33afe1csm549152ljh.87.2023.03.16.09.17.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 09:17:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v7 30/32] drm/msm/dpu: drop smart_dma_rev from dpu_caps
Date: Thu, 16 Mar 2023 19:16:51 +0300
Message-Id: <20230316161653.4106395-31-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230316161653.4106395-1-dmitry.baryshkov@linaro.org>
References: <20230316161653.4106395-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The code doesn't use dpu_caps::smart_dma_rev field. It checks if the
corresponding feature is enabled in the SSPP features. Drop the
smart_dma_rev field completely.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 13 -------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  2 --
 2 files changed, 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 443a300df92d..50c302d1d17b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -306,7 +306,6 @@ static const struct dpu_caps msm8998_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0x7,
 	.qseed_type = DPU_SSPP_SCALER_QSEED3,
-	.smart_dma_rev = DPU_SSPP_SMART_DMA_V1,
 	.ubwc_version = DPU_HW_UBWC_VER_10,
 	.has_src_split = true,
 	.has_dim_layer = true,
@@ -321,7 +320,6 @@ static const struct dpu_caps msm8998_dpu_caps = {
 static const struct dpu_caps qcm2290_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_LINE_WIDTH,
 	.max_mixer_blendstages = 0x4,
-	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
 	.max_linewidth = 2160,
@@ -332,7 +330,6 @@ static const struct dpu_caps sdm845_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.qseed_type = DPU_SSPP_SCALER_QSEED3,
-	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2,
 	.ubwc_version = DPU_HW_UBWC_VER_20,
 	.has_src_split = true,
 	.has_dim_layer = true,
@@ -348,7 +345,6 @@ static const struct dpu_caps sc7180_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0x9,
 	.qseed_type = DPU_SSPP_SCALER_QSEED4,
-	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2,
 	.ubwc_version = DPU_HW_UBWC_VER_20,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
@@ -360,7 +356,6 @@ static const struct dpu_caps sm6115_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_LINE_WIDTH,
 	.max_mixer_blendstages = 0x4,
 	.qseed_type = DPU_SSPP_SCALER_QSEED4,
-	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
 	.ubwc_version = DPU_HW_UBWC_VER_10,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
@@ -372,7 +367,6 @@ static const struct dpu_caps sm8150_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.qseed_type = DPU_SSPP_SCALER_QSEED3,
-	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
 	.ubwc_version = DPU_HW_UBWC_VER_30,
 	.has_src_split = true,
 	.has_dim_layer = true,
@@ -388,7 +382,6 @@ static const struct dpu_caps sc8180x_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.qseed_type = DPU_SSPP_SCALER_QSEED3,
-	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
 	.ubwc_version = DPU_HW_UBWC_VER_30,
 	.has_src_split = true,
 	.has_dim_layer = true,
@@ -404,7 +397,6 @@ static const struct dpu_caps sc8280xp_dpu_caps = {
 	.max_mixer_width = 2560,
 	.max_mixer_blendstages = 11,
 	.qseed_type = DPU_SSPP_SCALER_QSEED4,
-	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
 	.ubwc_version = DPU_HW_UBWC_VER_40,
 	.has_src_split = true,
 	.has_dim_layer = true,
@@ -418,7 +410,6 @@ static const struct dpu_caps sm8250_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.qseed_type = DPU_SSPP_SCALER_QSEED4,
-	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
 	.ubwc_version = DPU_HW_UBWC_VER_40,
 	.has_src_split = true,
 	.has_dim_layer = true,
@@ -432,7 +423,6 @@ static const struct dpu_caps sm8350_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.qseed_type = DPU_SSPP_SCALER_QSEED4,
-	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
 	.ubwc_version = DPU_HW_UBWC_VER_40,
 	.has_src_split = true,
 	.has_dim_layer = true,
@@ -446,7 +436,6 @@ static const struct dpu_caps sm8450_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.qseed_type = DPU_SSPP_SCALER_QSEED4,
-	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
 	.ubwc_version = DPU_HW_UBWC_VER_40,
 	.has_src_split = true,
 	.has_dim_layer = true,
@@ -460,7 +449,6 @@ static const struct dpu_caps sm8550_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.qseed_type = DPU_SSPP_SCALER_QSEED4,
-	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
 	.ubwc_version = DPU_HW_UBWC_VER_40,
 	.has_src_split = true,
 	.has_dim_layer = true,
@@ -474,7 +462,6 @@ static const struct dpu_caps sc7280_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0x7,
 	.qseed_type = DPU_SSPP_SCALER_QSEED4,
-	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2,
 	.ubwc_version = DPU_HW_UBWC_VER_30,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index ae85b40e282b..89b372cdca92 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -395,7 +395,6 @@ struct dpu_rotation_cfg {
  * @max_mixer_blendstages max layer mixer blend stages or
  *                       supported z order
  * @qseed_type         qseed2 or qseed3 support.
- * @smart_dma_rev      Supported version of SmartDMA feature.
  * @ubwc_version       UBWC feature version (0x0 for not supported)
  * @has_src_split      source split feature status
  * @has_dim_layer      dim layer feature status
@@ -410,7 +409,6 @@ struct dpu_caps {
 	u32 max_mixer_width;
 	u32 max_mixer_blendstages;
 	u32 qseed_type;
-	u32 smart_dma_rev;
 	u32 ubwc_version;
 	bool has_src_split;
 	bool has_dim_layer;
-- 
2.30.2

