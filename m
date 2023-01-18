Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A487671750
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 10:19:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 012A910E6E4;
	Wed, 18 Jan 2023 09:18:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-56.freemail.mail.aliyun.com
 (out30-56.freemail.mail.aliyun.com [115.124.30.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92B0F10E1F5
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 09:18:42 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R171e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046049;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=12; SR=0;
 TI=SMTPD_---0VZpkENK_1674033514; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0VZpkENK_1674033514) by smtp.aliyun-inc.com;
 Wed, 18 Jan 2023 17:18:37 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: robdclark@gmail.com
Subject: [PATCH v2] drm/msm/dpu: Remove some unused variables
Date: Wed, 18 Jan 2023 17:18:33 +0800
Message-Id: <20230118091833.87708-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
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
Cc: freedreno@lists.freedesktop.org,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, sean@poorly.run,
 Abaci Robot <abaci@linux.alibaba.com>, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Variables 'sc8280xp_regdma' and 'sm8350_regdma' are defined in the
dpu_hw_catalog.c file, but not used elsewhere, so remove these unused
variables.

drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c:2029:37: warning: unused
variable 'sc8280xp_regdma'.
drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c:2053:37: warning: unused
variable 'sm8350_regdma'.

Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=3722
Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
Changes in v2:
  -Adding the regdma entries to .dma_cfg of these chipsets.

 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 0f3da480b066..3318e1d18a0e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -2677,6 +2677,8 @@ static const struct dpu_mdss_cfg sc8280xp_dpu_cfg = {
 	.intf = sc8280xp_intf,
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
 	.vbif = sdm845_vbif,
+	.reg_dma_count = 1,
+	.dma_cfg = &sc8280xp_regdma,
 	.perf = &sc8280xp_perf_data,
 	.mdss_irqs = IRQ_SC8280XP_MASK,
 };
@@ -2732,7 +2734,7 @@ static const struct dpu_mdss_cfg sm8350_dpu_cfg = {
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
 	.vbif = sdm845_vbif,
 	.reg_dma_count = 1,
-	.dma_cfg = &sm8250_regdma,
+	.dma_cfg = &sm8350_regdma,
 	.perf = &sm8350_perf_data,
 	.mdss_irqs = IRQ_SM8350_MASK,
 };
-- 
2.20.1.7.g153144c

