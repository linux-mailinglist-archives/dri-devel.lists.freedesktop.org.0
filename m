Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BBB368138
	for <lists+dri-devel@lfdr.de>; Thu, 22 Apr 2021 15:08:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A898B89E33;
	Thu, 22 Apr 2021 13:08:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A0C889BAF
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Apr 2021 13:08:10 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id d27so15200202lfv.9
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Apr 2021 06:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pmJr7udGenhHroV8BhxM4TWBA/MGEM7jtLhmDnAa3/I=;
 b=B82wHNuOrWtj5la07YYsokjzmWjjddXcJL0ZPdRbyg3D5rjKdeDkdmMf1mKKu1LgzW
 ZcTD3ed/+WqlYzGxXJs+C7tGAcnt7FSTm/2p4QAP3VH2R6R1eqN4+J/OTTPnH76o7Vbt
 XtDWEcnqD0jBEnVd0191uIiAnu/xE87XTZQgEaF4Low+w3Xj+9JITy2dGrwngEh2rRWI
 ShrXcUbSTitJpMOPbVVztfm1uPCMgzHPKFX1NhM8mFL6PRDN7Yt9oXMN4LUTgIyFGqUL
 zC0orFtAXzTKPoXKmY0p5K/L5b7DuyORUg5N+MnNw5E0rDi4o0UvirNSKFsT9nYR9xWv
 kegQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pmJr7udGenhHroV8BhxM4TWBA/MGEM7jtLhmDnAa3/I=;
 b=AXpkri709vfK3lh0/Q5nt0RNwLlNC1sKIV40FFMwTRmblbb0dtfaoyrBQ2/peLVQZF
 tQxifaJ+OGLkPOmZHkOrdgTIS0h+FHhR4hjgBpjYvJ0CyAyTTerds2/jivV4aBpEF6mf
 fpbL2NKZ4Zmx8qDx/anrNUZm6Y+29jbDm10xeejJ7WTP0xxclNTb9U9Tvp/NzJ0cYHAa
 O2Bw+3E796pOBK/wCHpdV1tM/Woga1KlqHMHbNfBdsmtfiGEyCdSoTttrqhZM9yzVtDT
 4JMgNQbWBQfYcrL3/HEKl14XKm2VvT83R8fB6iODSBDzwcphWyEdRWBEzb1BBKv7Qjmi
 6x6A==
X-Gm-Message-State: AOAM532fYVrrj1HcXpGeNIhg5O/I++HY2wE5a31JBGWxTI/tiika5FFi
 6c6s1hWAsD42657UJ5Z+yEVXWA==
X-Google-Smtp-Source: ABdhPJyRDotSTw2b+VGhjApTJMDFjb20a/kD1Q1cj4VL7Dk2Y7cL1fKHhr7H0K8Zfcgl5MX7kgDTsA==
X-Received: by 2002:ac2:5299:: with SMTP id q25mr2604475lfm.594.1619096888722; 
 Thu, 22 Apr 2021 06:08:08 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id v17sm259833lfr.35.2021.04.22.06.08.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 06:08:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH v2 2/3] drm/msm/dpu: drop dpu_hw_blk_destroy function
Date: Thu, 22 Apr 2021 16:08:03 +0300
Message-Id: <20210422130804.825030-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210422130804.825030-1-dmitry.baryshkov@linaro.org>
References: <20210422130804.825030-1-dmitry.baryshkov@linaro.org>
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
