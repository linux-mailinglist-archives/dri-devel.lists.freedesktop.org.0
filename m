Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05AA7381BA9
	for <lists+dri-devel@lfdr.de>; Sun, 16 May 2021 00:58:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C67AE6E479;
	Sat, 15 May 2021 22:58:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 986CD6E457
 for <dri-devel@lists.freedesktop.org>; Sat, 15 May 2021 22:58:05 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id v5so2735582ljg.12
 for <dri-devel@lists.freedesktop.org>; Sat, 15 May 2021 15:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ALt2xpqxR2M7ID0/lSTYxo899aEF0TaxPvxXAG/ycDA=;
 b=gvXEsRJs033GcqK2sH1Iyi/TjQHWKRC+qN8Ak/KNQd+PQsq7r659fLB/3hCUzmK+T1
 aXtxVuxw0vsnxFpV58u+qgoSKhHQvZRg9EaqykOAXGe/8wfFsmYzV2tk0PyFOF5ZQqVj
 hMXiMQtcBnxFlmULIHYH2BmktuhSk7RxsQl4+OFYTuVdnx0QLjeATmpcIdnUQCfXyVTQ
 4us/PzwIB1MauLsrLjGHG8nKWI3CbWccHFIG0hKABubseVKwgP/rOkDjwKMN3jXIiD/m
 acc8wQJkqhj26mxeUeGHda0Lu3zdHnqo5jwO2RRPD8at0wu2M9Fl4fGA6njNFkKmttfN
 3JAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ALt2xpqxR2M7ID0/lSTYxo899aEF0TaxPvxXAG/ycDA=;
 b=Ksk6MShfgzKQ1CcXoWYKs++zI16U1xcILhExRPVGrV5515P1iBzrWVo8lzyoM8wdnS
 LNpOwDkUAs/zeGS9lWbpJcah5hBuaTKLBxkRgkrPPmpD1ll+og0HEmKRVCwxDMk5XFDw
 G0VkHohqb6s51wmNOLEha0FOuTJD7BMQIqTotiCXszxYaBTxfRcpXEFTrZ9YjetnF802
 nK1vpQfV+tiv6wjnZK/ubIeaCzS40zSerWGZanlKiCcSGVKv3ni7+arjjIpMvEJM1nP9
 wNanESYdQXsyDPl9Rw8g4HiLsMkLF456WLhX9MndxUqJZtMYZbRGCgipSEbTClwkCROr
 I1wA==
X-Gm-Message-State: AOAM530/BYvB7CbqIYF8YSUxInB6dmKtKdHDCVB9RmPYBRjlvneDIInz
 aBHiO1J0x3JIFGmkCiW5IHERnw==
X-Google-Smtp-Source: ABdhPJxVomA6+KwMCBCYalVwu8xNGF3Q1k/Cfb94TZzmYw24i1yt/uCu6UzbmXdojge9FbhmJX0aQQ==
X-Received: by 2002:a2e:a370:: with SMTP id i16mr25862713ljn.90.1621119484091; 
 Sat, 15 May 2021 15:58:04 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id j3sm1499729lfe.5.2021.05.15.15.58.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 May 2021 15:58:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH v2 5/6] drm/msm/dpu: drop unused lm_max_width from RM
Date: Sun, 16 May 2021 01:57:56 +0300
Message-Id: <20210515225757.1989955-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210515225757.1989955-1-dmitry.baryshkov@linaro.org>
References: <20210515225757.1989955-1-dmitry.baryshkov@linaro.org>
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

No code uses lm_max_width from resource manager, so drop it.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 12 ------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h |  4 ----
 2 files changed, 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index c36700a06ff2..ec4387ad1182 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -88,18 +88,6 @@ int dpu_rm_init(struct dpu_rm *rm,
 			goto fail;
 		}
 		rm->mixer_blks[lm->id - LM_0] = &hw->base;
-
-		if (!rm->lm_max_width) {
-			rm->lm_max_width = lm->sblk->maxwidth;
-		} else if (rm->lm_max_width != lm->sblk->maxwidth) {
-			/*
-			 * Don't expect to have hw where lm max widths differ.
-			 * If found, take the min.
-			 */
-			DPU_ERROR("unsupported: lm maxwidth differs\n");
-			if (rm->lm_max_width > lm->sblk->maxwidth)
-				rm->lm_max_width = lm->sblk->maxwidth;
-		}
 	}
 
 	for (i = 0; i < cat->ctl_count; i++) {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
index ee90b1233430..0c9113581d71 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
@@ -17,14 +17,10 @@ struct dpu_global_state;
  * struct dpu_rm - DPU dynamic hardware resource manager
  * @mixer_blks: array of layer mixer hardware resources
  * @ctl_blks: array of ctl hardware resources
- * @lm_max_width: cached layer mixer maximum width
- * @rm_lock: resource manager mutex
  */
 struct dpu_rm {
 	struct dpu_hw_blk *mixer_blks[LM_MAX - LM_0];
 	struct dpu_hw_blk *ctl_blks[CTL_MAX - CTL_0];
-
-	uint32_t lm_max_width;
 };
 
 struct dpu_kms;
-- 
2.30.2

