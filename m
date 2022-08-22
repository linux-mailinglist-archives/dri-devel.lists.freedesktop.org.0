Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CEB59C4F4
	for <lists+dri-devel@lfdr.de>; Mon, 22 Aug 2022 19:25:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 454AB9B66B;
	Mon, 22 Aug 2022 17:25:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1F8D9ACA4
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 17:24:58 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id m5so5584804lfj.4
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 10:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=JWuoaMhPoCYrN68iQTiKw3Xyik+rAwN10Yl4sr/ahzU=;
 b=f6q6TIV3VK+J93nQI1kLTXaNNxYsE3V9/haK8AfzXCOYGvLAHr3vKN+ZT39d5Lm5Zl
 y4JQhizivD0Ss+Cg00cS+Y8b5GQpKoG5q81CdI8+u1/CAP6gwWnF4scUffxoEyDjNCs9
 ih4xmf4MRwlBIioVpPQ8AsZBvFx5cF1TK5gSwVjnQCWMfKsYVXQEx+6BLIjFJ6rvbHFB
 Agi8RWW+JYDsjT7cKrnVhbZ7Dt3rjwStt+2qGF4aHTSoeBsbGnMLmudy6VKKjwKHw4o8
 cE1GAWSWfu3iFv69p7ileM1n3GzsuuiwQzmpCiLYe8zvoaAOB+wnfnZTArtN3JRzYS2p
 JVmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=JWuoaMhPoCYrN68iQTiKw3Xyik+rAwN10Yl4sr/ahzU=;
 b=ako07XPRFPCdFrGgzdVvKUmNLrKyyoH1Flnm3HqrIgVSEV+NHf0VqwDfuHcvejK3SJ
 UaGiSNbqdv8blq7XkS+TWXzGU2o95wWn4JDAciU7FEKUMlaPLtGxTfHY95rU36453Cq/
 b+yCIPoJ7y/rsHGmG3g/pZCZDmO9DqCYOschvnU9Wt4nM1EyOjPJGUybY17pD2Tz6Kr3
 YRptOfEV+yH+rn7/P53yCopKV0+DvbwNqhb97dKhxmd3LkO9BwRul7z9lO+9EHLcOyl9
 4WcOYmPC+qZ0CMs/pt2Xl8tzvN9RuYubS6QNmPsWWv6UbOd+xdTaKflJk/QITuflI7Bg
 EI3A==
X-Gm-Message-State: ACgBeo2/MKii1csXXYWWBs6fj2EQxmA+B9fe7a+Xu/g4j/BSuxzBr8Tm
 rnkTE7O8GzODuXfx2sXlp5dYzQ==
X-Google-Smtp-Source: AA6agR6alkF8nw1SuE7MWnj5Ag0t/49LhC6nM8UItPjcfwKrwY9mh3KdwAR2h9UYfS7mybb6ZNs6oQ==
X-Received: by 2002:a05:6512:3409:b0:48a:ef04:4ec2 with SMTP id
 i9-20020a056512340900b0048aef044ec2mr7905189lfr.230.1661189096986; 
 Mon, 22 Aug 2022 10:24:56 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 v15-20020ac2560f000000b0048af4dc964asm2012603lfd.73.2022.08.22.10.24.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 10:24:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH] drm/msm/dpu: drop unused memory allocation
Date: Mon, 22 Aug 2022 20:24:55 +0300
Message-Id: <20220822172455.282923-1-dmitry.baryshkov@linaro.org>
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
Cc: kernel test robot <lkp@intel.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drop the dpu_cfg variable and corresponding kzalloc, which became unused
after changing hw catalog to static configuration.

Fixes: de7d480f5e8c ("drm/msm/dpu: make dpu hardware catalog static const")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 0239a811d5ec..50ab17c9afd2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -1939,11 +1939,6 @@ static const struct dpu_mdss_hw_cfg_handler cfg_handler[] = {
 const struct dpu_mdss_cfg *dpu_hw_catalog_init(u32 hw_rev)
 {
 	int i;
-	struct dpu_mdss_cfg *dpu_cfg;
-
-	dpu_cfg = kzalloc(sizeof(*dpu_cfg), GFP_KERNEL);
-	if (!dpu_cfg)
-		return ERR_PTR(-ENOMEM);
 
 	for (i = 0; i < ARRAY_SIZE(cfg_handler); i++) {
 		if (cfg_handler[i].hw_rev == hw_rev)
-- 
2.35.1

