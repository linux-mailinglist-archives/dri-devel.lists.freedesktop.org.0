Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F643485C20
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 00:10:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 840D910E3C6;
	Wed,  5 Jan 2022 23:10:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56E3310E1F6
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jan 2022 23:10:37 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id r22so1209789ljk.11
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jan 2022 15:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aZJITrHaLDqpoh1LNoc2hiD4lg0tjTAyUfAgifRM0rA=;
 b=aWlYI8u5TkFDy9J3NQZpPP1kEduIY16PN4bV+28QLWeW/s80oujo6boD1wFVVrgxaJ
 RcnObfrAj1bKygsHLrtLBC/j6LAtEK6FKgZ9Rm0FqGu6cS/B92r/gY+hM/nHJ+XDk9Ab
 Vc1QIqgx9t8xrAl8HKUlGaKW8AXLVjqte0C+x3kGufiUzxsHm/Q982tyO9G+dd45KWdu
 kDJznTWLZnukUkmpaTPQZeXbr4p54IPaDpCyh+2X2SjF7MVZEMODU4JKuVcgBuYe5N8I
 FFNVFlnA+GP3w/zKEE+Th0uLUAHv8hVUmgZg5mQ0coHCMSfJ9egILAq4Lc5CjmnfQDXj
 WQ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aZJITrHaLDqpoh1LNoc2hiD4lg0tjTAyUfAgifRM0rA=;
 b=u30xdHjpqBgyzdCNTebxsB1k8pxsR+VLEJCrjAiVG4XExRwfwponEzBN2mWssy3G3D
 PjgsKCcvDBuc5AFQJdntsL9R7x70Mx1Tmv1/teLr/NAgUr16ETY+fgVI6CZTfCTdhSnt
 xpwP9IXK7QAYpaez9Dtke/kxhF/wc4IoF09y3/5LsqC5TkxFApWKe1JO79a5zcIdiNeY
 MCY5dLUPjPf5o67kj/Sjo9+avD71/Qmkt8HQgFbBpfnp54vqJvRL6OOE7oDdl8DjmCUB
 3TwHKmXoeZ6cQJ0c7/+Q08GEiPu8K8iw9Z5AK5qnisV3gIy5KslaraYNL7V6XR5bNy8q
 yWNA==
X-Gm-Message-State: AOAM530qkM8BjJBBAgorHnH2brh5aniTKXDJDqKxhohlhTznLZZ4w4cf
 1KJyt2fiZeJZpn/by6KP1AdsLQ==
X-Google-Smtp-Source: ABdhPJzQ4kzJ088Zo6a/PFh9lMAchUeaTYe2GTieSHAbMdDXUgGyneYXdop+ugmVuAwoDp2567qo6w==
X-Received: by 2002:a2e:2e18:: with SMTP id u24mr19424312lju.492.1641424235679; 
 Wed, 05 Jan 2022 15:10:35 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id a13sm27187lff.104.2022.01.05.15.10.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 15:10:35 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH v4 1/5] drm/msm/dpu: drop unused lm_max_width from RM
Date: Thu,  6 Jan 2022 02:10:27 +0300
Message-Id: <20220105231031.436020-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220105231031.436020-1-dmitry.baryshkov@linaro.org>
References: <20220105231031.436020-1-dmitry.baryshkov@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

No code uses lm_max_width from resource manager, so drop it. Instead of
calculating the lm_max_width, code can use max_mixer_width field from
the hw catalog.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 12 ------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h |  4 ----
 2 files changed, 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index f9c83d6e427a..b5b1ea1e4de6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -114,18 +114,6 @@ int dpu_rm_init(struct dpu_rm *rm,
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
 
 	for (i = 0; i < cat->merge_3d_count; i++) {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
index 1f12c8d5b8aa..0f27759211b5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
@@ -20,8 +20,6 @@ struct dpu_global_state;
  * @ctl_blks: array of ctl hardware resources
  * @intf_blks: array of intf hardware resources
  * @dspp_blks: array of dspp hardware resources
- * @lm_max_width: cached layer mixer maximum width
- * @rm_lock: resource manager mutex
  */
 struct dpu_rm {
 	struct dpu_hw_blk *pingpong_blks[PINGPONG_MAX - PINGPONG_0];
@@ -30,8 +28,6 @@ struct dpu_rm {
 	struct dpu_hw_blk *intf_blks[INTF_MAX - INTF_0];
 	struct dpu_hw_blk *dspp_blks[DSPP_MAX - DSPP_0];
 	struct dpu_hw_blk *merge_3d_blks[MERGE_3D_MAX - MERGE_3D_0];
-
-	uint32_t lm_max_width;
 };
 
 /**
-- 
2.34.1

