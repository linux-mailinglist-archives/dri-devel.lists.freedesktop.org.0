Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBE75F13AC
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 22:31:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD60A10EDA6;
	Fri, 30 Sep 2022 20:31:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CDC110EC9A;
 Fri, 30 Sep 2022 11:27:04 +0000 (UTC)
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.55])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Mf7DV3SHhzHq0v;
 Fri, 30 Sep 2022 19:24:42 +0800 (CST)
Received: from dggpemm500013.china.huawei.com (7.185.36.172) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 30 Sep 2022 19:27:01 +0800
Received: from huawei.com (10.67.174.245) by dggpemm500013.china.huawei.com
 (7.185.36.172) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 30 Sep
 2022 19:27:01 +0800
From: Chen Zhongjin <chenzhongjin@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>
Subject: [PATCH -next] drm/msm: Remove unused variables 'top'
Date: Mon, 10 Oct 2022 10:40:10 +0800
Message-ID: <20221010024010.2873633-1-chenzhongjin@huawei.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.245]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500013.china.huawei.com (7.185.36.172)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 30 Sep 2022 20:31:08 +0000
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
Cc: dianders@chromium.org, sean@poorly.run, andersson@kernel.org,
 quic_abhinavk@quicinc.com, swboyd@chromium.org, chenzhongjin@huawei.com,
 dmitry.baryshkov@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

'commit 1e5df24b996c ("drm/msm/dpu: drop length from struct dpu_hw_blk_reg_map")'
'commit 9403f9a42c88 ("drm/msm/dpu: merge base_off with blk_off in struct dpu_hw_blk_reg_map")'
These commits had merged hw.blk_off and hw.blk_off to mdp.
So we don't need to get dpu_hw_mdp in dpu_kms_mdp_snapshot() now.

Since there is no code using 'top' in this function. Remove it.

Signed-off-by: Chen Zhongjin <chenzhongjin@huawei.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 008e1420e6e5..79e81f1443be 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -902,13 +902,9 @@ static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_k
 	int i;
 	struct dpu_kms *dpu_kms;
 	const struct dpu_mdss_cfg *cat;
-	struct dpu_hw_mdp *top;
 
 	dpu_kms = to_dpu_kms(kms);
-
 	cat = dpu_kms->catalog;
-	top = dpu_kms->hw_mdp;
-
 	pm_runtime_get_sync(&dpu_kms->pdev->dev);
 
 	/* dump CTL sub-blocks HW regs info */
-- 
2.33.0

