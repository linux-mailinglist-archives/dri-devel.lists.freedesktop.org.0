Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF6241B3CB
	for <lists+dri-devel@lfdr.de>; Tue, 28 Sep 2021 18:24:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B3886E8C1;
	Tue, 28 Sep 2021 16:24:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7200089E32;
 Tue, 28 Sep 2021 16:24:24 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id t4so14611300plo.0;
 Tue, 28 Sep 2021 09:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FHlhAnJc71taZr/+BkaaA8wu8hR4fcgSNUCat/tWerI=;
 b=daUOaWa3DRPTu4mbZ1dBxI6Jqoe5tBfdeHvSmVmieVSsPj2tzkn1WUfOOG0takYkdZ
 xWFd1ua+TFmGjqcMBx9AWSxn5C3jzjzwzkRnFdlK1VBl51Xgeol6oyj5TvRpzBnLRC/o
 qv7c1/QCbV+rKwAA6lQbfPDcmJJb9Z1FCkt+D8fLlbLWbOkC4PyVw5TryjBMOyUlv7p2
 KvwczCZy2wRBzVDRNKtNe4x9ZSJcfHW91XErR09/yG9TAe09rGRmqknEPxuL7DL3etvA
 gcLRSGoyqfZcx0DL2NAZ7pPCZE7fCrzE+IyyRunakQmtKgaW9hV688+pG/agoW84Kc16
 VdIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FHlhAnJc71taZr/+BkaaA8wu8hR4fcgSNUCat/tWerI=;
 b=2bHZJLd1NKJbkL/44pqULJKcUc0oLn3Sxjdm3llbuTh+6GlpewOKN6mv7Dy/bJ2M9S
 2kxCPribnKJzQsiZQGh/r3bmzFmg0h7CPNRV7Coc8j+wMC5GhQ8ks+tyF5RmQjvUtr6A
 3ZF8zQJbSWZLQ8Yt1zq+qU3RZvjGvFXxcey2+JGgvall1qcg3SByw+Mm5lvj8lHbbj0f
 HTmw98HfhdiGUxbkj/to37QBjN+8uKRL70xx8mrXg/ypuXhfbsGtpf8WUWkBHlHzzf1P
 QO6KSXUTd/194I9EEh/yq0UiPmgQ6jGZb6rzS9bnW99XiDLaeU4I9xQOpFALLbU8YWa1
 cbkQ==
X-Gm-Message-State: AOAM533ORMbhnFS88wkernfrsPrf+xem1wnIaGmXdtDCePO5T6giyorT
 PIECsaMJ5tvpHC4jfOkP4fdMbJT5asA=
X-Google-Smtp-Source: ABdhPJxRoIfwR6j3nkdfKPAphyQ2MJbzLyba1v5zHwK/OM3EMGR2rXvXK833SIEOuAE3eVmE9y8roA==
X-Received: by 2002:a17:90a:514e:: with SMTP id
 k14mr918232pjm.154.1632846263013; 
 Tue, 28 Sep 2021 09:24:23 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id c7sm20537216pfd.75.2021.09.28.09.24.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 09:24:21 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Krishna Manikandan <mkrishn@codeaurora.org>,
 Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm/dpu: Remove some nonsense
Date: Tue, 28 Sep 2021 09:28:59 -0700
Message-Id: <20210928162903.1104847-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
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

From: Rob Clark <robdclark@chromium.org>

These aren't used.  And if we add use for them later, we should probably
do something a bit more structured than string parsing.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 6 ------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 8 --------
 2 files changed, 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index b131fd376192..e32dbb06aad1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -958,12 +958,6 @@ static const struct dpu_perf_cfg sdm845_perf_data = {
 	.min_core_ib = 2400000,
 	.min_llcc_ib = 800000,
 	.min_dram_ib = 800000,
-	.core_ib_ff = "6.0",
-	.core_clk_ff = "1.0",
-	.comp_ratio_rt =
-	"NV12/5/1/1.23 AB24/5/1/1.23 XB24/5/1/1.23",
-	.comp_ratio_nrt =
-	"NV12/5/1/1.25 AB24/5/1/1.25 XB24/5/1/1.25",
 	.undersized_prefill_lines = 2,
 	.xtra_prefill_lines = 2,
 	.dest_scale_prefill_lines = 3,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index d2a945a27cfa..4ade44bbd37e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -676,10 +676,6 @@ struct dpu_perf_cdp_cfg {
  * @min_core_ib        minimum mnoc ib vote in kbps
  * @min_llcc_ib        minimum llcc ib vote in kbps
  * @min_dram_ib        minimum dram ib vote in kbps
- * @core_ib_ff         core instantaneous bandwidth fudge factor
- * @core_clk_ff        core clock fudge factor
- * @comp_ratio_rt      string of 0 or more of <fourcc>/<ven>/<mod>/<comp ratio>
- * @comp_ratio_nrt     string of 0 or more of <fourcc>/<ven>/<mod>/<comp ratio>
  * @undersized_prefill_lines   undersized prefill in lines
  * @xtra_prefill_lines         extra prefill latency in lines
  * @dest_scale_prefill_lines   destination scaler latency in lines
@@ -702,10 +698,6 @@ struct dpu_perf_cfg {
 	u32 min_core_ib;
 	u32 min_llcc_ib;
 	u32 min_dram_ib;
-	const char *core_ib_ff;
-	const char *core_clk_ff;
-	const char *comp_ratio_rt;
-	const char *comp_ratio_nrt;
 	u32 undersized_prefill_lines;
 	u32 xtra_prefill_lines;
 	u32 dest_scale_prefill_lines;
-- 
2.31.1

