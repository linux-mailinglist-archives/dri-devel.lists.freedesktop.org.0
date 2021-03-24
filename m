Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 653DC347B54
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 16:00:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1DB16EC56;
	Wed, 24 Mar 2021 15:00:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 085286EC06
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 15:00:41 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id u4so30586893ljo.6
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 08:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AHRJn3HeD8IJU2kEBHlBE7mssbK+pfVkIEgT2l1YUTM=;
 b=cxYmsvKjXhJjLy3e9DksD1CayKvLvTfTmZH0sVaTZ7cB7jjVCe9KeRuYSijoLFMyKZ
 X9v9Jp09fef0JVJiKf5rwZLtgN+k+4B14w1RQD0qS8cLZPKxHS3ULBIhUCJ/QG+fSpze
 I71JnFaX/hjoQsXf4O7PQ6p8u4BelyoJsr5IuKr/Berx4JNttfJvaCKtzRLJHjoG0HHu
 DSH+qzfRUH7LQr4ODgP2TeWHXBoJhDBWiFE4A2WbF59l6vCZZJC9nmy1Y+TYigEygOdA
 cdb58TQ0+SfWDyCYYpZEIriXa7mlYz5bBGrR2poKk9ToK62dCcooaoA71ejbqCu9JvaB
 CRpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AHRJn3HeD8IJU2kEBHlBE7mssbK+pfVkIEgT2l1YUTM=;
 b=bGkf05rNazdQV9F26GqGrEx9xT3nUKj+nAlVC0M29kGvQj0wP0pRkie486EwdA0cNu
 7HjlgJ8/fUFU4lnxayoHX1xt01WSIqLV8X0ROjxgu2xWjg77J2liRgHy9pgCPdbwk1Wq
 LkDcFFYISJFclQga+hlRm+45QkkIe8gX9KPvAb3+N4/R6uysHeoyJlM8stNH6B46xnSM
 SHoHmUFI+DbYJ/PY+eeMa0BCti7ohld7JmQXDmpu/SrSThQNLj5h2Wsf7MFcdzy5h85A
 hjb7XWoKMxMTVLQ1YcBKSf8zOMYLftSJtYjW6PnPxMGK9y5E9tqWIWvPpEOSBDGzN3Y6
 tsRA==
X-Gm-Message-State: AOAM531gWgORDMHeDbTVMwIa6NI/2p84bVe8wEoTlDJeBsA1KfBgNfRM
 F3fFBVGMO26bjKi9Q56a3CimXFkM9ezIhQ==
X-Google-Smtp-Source: ABdhPJyVRmXnobLh21+0UZoLstd0UTYvuDgQT5sp6teUqBtBlDADaY3Q6uDvRmbOqLK4Uh4jE4EWZQ==
X-Received: by 2002:a2e:b0d4:: with SMTP id g20mr2400673ljl.127.1616598039471; 
 Wed, 24 Mar 2021 08:00:39 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id p5sm252463lfe.154.2021.03.24.08.00.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 08:00:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH 07/21] drm/msm/dpu: drop unused lm_max_width from RM
Date: Wed, 24 Mar 2021 18:00:10 +0300
Message-Id: <20210324150024.2768215-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324150024.2768215-1-dmitry.baryshkov@linaro.org>
References: <20210324150024.2768215-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

No code uses lm_max_width from resource manager, so drop it.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 12 ------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h |  4 ----
 2 files changed, 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 7792dff60bcd..dbcf4929810b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -134,18 +134,6 @@ int dpu_rm_init(struct dpu_rm *rm,
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
 
 	return 0;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
index a618c0ef43db..3f68a1c0dc1e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
@@ -18,15 +18,11 @@ struct dpu_global_state;
  * @mixer_blks: array of layer mixer hardware resources
  * @ctl_blks: array of ctl hardware resources
  * @intf_blks: array of intf hardware resources
- * @lm_max_width: cached layer mixer maximum width
- * @rm_lock: resource manager mutex
  */
 struct dpu_rm {
 	struct dpu_hw_blk *mixer_blks[LM_MAX - LM_0];
 	struct dpu_hw_blk *ctl_blks[CTL_MAX - CTL_0];
 	struct dpu_hw_blk *intf_blks[INTF_MAX - INTF_0];
-
-	uint32_t lm_max_width;
 };
 
 struct dpu_kms;
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
