Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8188959C4ED
	for <lists+dri-devel@lfdr.de>; Mon, 22 Aug 2022 19:22:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 218679B5B6;
	Mon, 22 Aug 2022 17:22:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5735E9B5B6
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 17:22:07 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id z20so11277060ljq.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 10:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=gV99h850BV8Dr0PlTOQumJqcQf34/H3P1jjF5nBzAOA=;
 b=q1fnZE6pADu+MYiFWXjkuSN6QqzfRQqpOZfPheVPHjtSS7CIsK0cSwBkJMcjXbsW2c
 jtgAzAXxhNI/xyQYHy8shBhCzUW5o4MRHuAC7Kql9r2CtCdjkCz6fZjUqcBeoPnzONOJ
 JoRt6caVpUgRk2Lr59OGAG3Y5fHoKDibOE/4oTkzYQpcDRFziWOqMg6c+752RWOVu54H
 PYpsQuDFTbpNPvitX3ATDlKZ1JrjSPeKpm0FSNUGzBNDJNCfmEKUupC06Div8OxxYw/G
 rNyMyUki0pc4kDIY9tHzhCPasbBGZ+PVdCxNn4FrAcqNBhMeEIZKH0hDH3erom6k8zdh
 rrkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=gV99h850BV8Dr0PlTOQumJqcQf34/H3P1jjF5nBzAOA=;
 b=wn8jkL5tRDnD/FIt0y9iqOu8PrmE7H7AYe/QwQm1VZe7YbazzxZ8+RSMu/FEjUZRJV
 koGvfvWQ5iBSYI1TcSP06D13S+rnlO3FNDEENwhy6i7wIZQ2UlbUGqk6Ui3pjAADYmdZ
 mKsRCc8mcljfe/xdan2fvOtSoyrKoU/cxkc4cZFCSeR+tz/vBB2wcqFcIlSZi0e9wZke
 mCyleLXhoWVXxdK+y6MfeLPwvsZTcXi+Bga4rI6uwRc9gz01soxl2OsO6XXKeASKBKEq
 H6ohNe+AKr8RH8SlG1gngNO63DlTf3itSXTueaGWO/LgVNUiqSLjU88noKU/XHHbqDKN
 BXUA==
X-Gm-Message-State: ACgBeo21Ah4Xq/d/y3ZC5Oeh06EZumdYlhDJTMhYYi8peKKfGLHjMPN5
 6CYL5IJQfDyA5YLUmxsm4GjpPNJKtdYk2g==
X-Google-Smtp-Source: AA6agR76jtgZmVZm3TxRE8LqNNbVi7Ko7rJwmyuGxiGmlsfJr9ylxwz74DoU1WAA2XMDLTXIPrSGkw==
X-Received: by 2002:a2e:a307:0:b0:261:ce0c:365f with SMTP id
 l7-20020a2ea307000000b00261ce0c365fmr1654327lje.288.1661188925728; 
 Mon, 22 Aug 2022 10:22:05 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 y16-20020a2e5450000000b00261cbe3bd83sm680794ljd.85.2022.08.22.10.22.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 10:22:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH] drm/msm/dpu: drop unused variable from dpu_kms_mdp_snapshot()
Date: Mon, 22 Aug 2022 20:22:04 +0300
Message-Id: <20220822172204.281045-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Follow up the merge of address fields and drop the variable that became
unused after the commit 9403f9a42c88 ("drm/msm/dpu: merge base_off with
blk_off in struct dpu_hw_blk_reg_map").

Fixes: 9403f9a42c88 ("drm/msm/dpu: merge base_off with blk_off in struct dpu_hw_blk_reg_map")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 008e1420e6e5..1e1f45409aba 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -902,12 +902,10 @@ static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_k
 	int i;
 	struct dpu_kms *dpu_kms;
 	const struct dpu_mdss_cfg *cat;
-	struct dpu_hw_mdp *top;
 
 	dpu_kms = to_dpu_kms(kms);
 
 	cat = dpu_kms->catalog;
-	top = dpu_kms->hw_mdp;
 
 	pm_runtime_get_sync(&dpu_kms->pdev->dev);
 
-- 
2.35.1

