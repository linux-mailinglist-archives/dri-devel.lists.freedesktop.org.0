Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 858B9381AB2
	for <lists+dri-devel@lfdr.de>; Sat, 15 May 2021 21:09:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B68C6E438;
	Sat, 15 May 2021 19:09:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BED356E438
 for <dri-devel@lists.freedesktop.org>; Sat, 15 May 2021 19:09:14 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id p12so2421955ljg.1
 for <dri-devel@lists.freedesktop.org>; Sat, 15 May 2021 12:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pmJr7udGenhHroV8BhxM4TWBA/MGEM7jtLhmDnAa3/I=;
 b=qv80nCJXwOs0h3kQWAg3aKTuAJjKZpAU0wA6O6r0HcMzmYwxgnU6MKA7MiNl/oKAmK
 SpM7t1zRg7v3YdBxw5RA2VOE4k5qy/2OlvB7T+BjMPJa7eB420yrfVqrExDYSFTnVvVJ
 guSqmtppABHeQ3CPSlCcPCJrvwHDnFaT8ubnExXCqNa0+iA+FPA/sKrCBfgg3RblFH9V
 ZUqexMZfyThnK7H/VxtqvXpeaSxjb1sXwq9KV5rFlxPVXLlQaQRYWpoUweM5VLWmGe9P
 6ctYzeAQM46jZHQrX27VWinxXbFXZa0oNJO5HAFtu+L9r215jGEbe4ZXd3r0d2KWDm6/
 jxLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pmJr7udGenhHroV8BhxM4TWBA/MGEM7jtLhmDnAa3/I=;
 b=W8PUybkReBWNLqSxeyuCYMx/S//SvL7NCa41NQ+vu6lMlsQXUry3x0F3iYMO8U5Kui
 9+5RcHLTXm8AwLM8R4DmlYlykOmiCbBTZuc4OGN++wmOB6cQczmLWJ5yfQCseDxoLgmo
 P3VyQMeJzags66PQX+MQQuxu4yhqI3OQPkHOlfkLLtlBUeEz4xux50dhjeBKpDewL/jL
 bAw1JgY90BnZLW5Td8z58CL0OC12ofxavZdElnIhzdceRqdG8qNwx6+SAgDTGZusaTDs
 JgrC+NnyDmqnahecK5gBJzDwPx4agqamo518OLacLssKb9VKaY5+qHoTVlAm02rUA4Eo
 3vsw==
X-Gm-Message-State: AOAM5338tpiT+se9dAzqUXiBWMQX+KkEUIEODLjIjZYoIek1wKsV+z2P
 m3MQV5cvRxbCj5bILXkQL/V58A==
X-Google-Smtp-Source: ABdhPJz5yW689PxCmtLmpbqr/Hfhx5DBp+MzRaLQxAvnZk8a2ovkzeEzf5fQ0MBr9LF8nj8ljyaZ2A==
X-Received: by 2002:a05:651c:b07:: with SMTP id
 b7mr11197957ljr.218.1621105753214; 
 Sat, 15 May 2021 12:09:13 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id t15sm2184107ljk.99.2021.05.15.12.09.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 May 2021 12:09:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH v3 2/4] drm/msm/dpu: drop dpu_hw_blk_destroy function
Date: Sat, 15 May 2021 22:09:07 +0300
Message-Id: <20210515190909.1809050-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210515190909.1809050-1-dmitry.baryshkov@linaro.org>
References: <20210515190909.1809050-1-dmitry.baryshkov@linaro.org>
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

The dpu_hw_blk_destroy() function is empty, so we can drop it now.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c      | 13 -------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.h      |  1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c      |  2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c     |  3 ---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c     |  2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c       |  2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c  |  2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c |  2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c     |  2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c      |  2 --
 10 files changed, 31 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c
index abad043f35f5..1f2b74b9eb65 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c
@@ -22,16 +22,3 @@ void dpu_hw_blk_init(struct dpu_hw_blk *hw_blk, u32 type, int id)
 	hw_blk->type = type;
 	hw_blk->id = id;
 }
-
-/**
- * dpu_hw_blk_destroy - destroy hw block object.
- * @hw_blk:  pointer to hw block object
- * return: none
- */
-void dpu_hw_blk_destroy(struct dpu_hw_blk *hw_blk)
-{
-	if (!hw_blk) {
-		pr_err("invalid parameters\n");
-		return;
-	}
-}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.h
index fb3be9a36a50..7768694b558a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.h
@@ -24,5 +24,4 @@ struct dpu_hw_blk {
 };
 
 void dpu_hw_blk_init(struct dpu_hw_blk *hw_blk, u32 type, int id);
-void dpu_hw_blk_destroy(struct dpu_hw_blk *hw_blk);
 #endif /*_DPU_HW_BLK_H */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 04a2c4b9a357..441f66a4fb37 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -620,7 +620,5 @@ struct dpu_hw_ctl *dpu_hw_ctl_init(enum dpu_ctl idx,
 
 void dpu_hw_ctl_destroy(struct dpu_hw_ctl *ctx)
 {
-	if (ctx)
-		dpu_hw_blk_destroy(&ctx->base);
 	kfree(ctx);
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
index d2f1045a736a..977b25968f34 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
@@ -117,9 +117,6 @@ struct dpu_hw_dspp *dpu_hw_dspp_init(enum dpu_dspp idx,
 
 void dpu_hw_dspp_destroy(struct dpu_hw_dspp *dspp)
 {
-	if (dspp)
-		dpu_hw_blk_destroy(&dspp->base);
-
 	kfree(dspp);
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index 6ffe97601716..17224556d5a8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -332,8 +332,6 @@ struct dpu_hw_intf *dpu_hw_intf_init(enum dpu_intf idx,
 
 void dpu_hw_intf_destroy(struct dpu_hw_intf *intf)
 {
-	if (intf)
-		dpu_hw_blk_destroy(&intf->base);
 	kfree(intf);
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
index 554bb881de3a..76f8b8f75b82 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
@@ -189,7 +189,5 @@ struct dpu_hw_mixer *dpu_hw_lm_init(enum dpu_lm idx,
 
 void dpu_hw_lm_destroy(struct dpu_hw_mixer *lm)
 {
-	if (lm)
-		dpu_hw_blk_destroy(&lm->base);
 	kfree(lm);
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c
index 863229dd0140..406ba950a066 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c
@@ -86,7 +86,5 @@ struct dpu_hw_merge_3d *dpu_hw_merge_3d_init(enum dpu_merge_3d idx,
 
 void dpu_hw_merge_3d_destroy(struct dpu_hw_merge_3d *hw)
 {
-	if (hw)
-		dpu_hw_blk_destroy(&hw->base);
 	kfree(hw);
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
index 334d5b28f533..92cd724263ce 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
@@ -289,7 +289,5 @@ struct dpu_hw_pingpong *dpu_hw_pingpong_init(enum dpu_pingpong idx,
 
 void dpu_hw_pingpong_destroy(struct dpu_hw_pingpong *pp)
 {
-	if (pp)
-		dpu_hw_blk_destroy(&pp->base);
 	kfree(pp);
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index ceb2488ea270..8734a47040aa 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -740,8 +740,6 @@ struct dpu_hw_pipe *dpu_hw_sspp_init(enum dpu_sspp idx,
 
 void dpu_hw_sspp_destroy(struct dpu_hw_pipe *ctx)
 {
-	if (ctx)
-		dpu_hw_blk_destroy(&ctx->base);
 	kfree(ctx);
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
index 5d2c33ec1de7..dae77d9c2c74 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
@@ -329,8 +329,6 @@ struct dpu_hw_mdp *dpu_hw_mdptop_init(enum dpu_mdp idx,
 
 void dpu_hw_mdp_destroy(struct dpu_hw_mdp *mdp)
 {
-	if (mdp)
-		dpu_hw_blk_destroy(&mdp->base);
 	kfree(mdp);
 }
 
-- 
2.30.2

