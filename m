Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C350176FB84
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 09:58:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70D8E10E245;
	Fri,  4 Aug 2023 07:58:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-132.freemail.mail.aliyun.com
 (out30-132.freemail.mail.aliyun.com [115.124.30.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A974310E245
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 07:58:01 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R201e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046060;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=13; SR=0;
 TI=SMTPD_---0Vp.kmf6_1691135867; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0Vp.kmf6_1691135867) by smtp.aliyun-inc.com;
 Fri, 04 Aug 2023 15:57:55 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: robdclark@gmail.com
Subject: [PATCH] drm/msm/dpu: clean up some inconsistent indenting
Date: Fri,  4 Aug 2023 15:57:46 +0800
Message-Id: <20230804075746.77435-1-jiapeng.chong@linux.alibaba.com>
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
 linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
 marijn.suijten@somainline.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

No functional modification involved.

drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c:183 dpu_core_perf_crtc_check() warn: inconsistent indenting.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=6096
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 0b54a659a940..1c0e7e5480e4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -177,10 +177,10 @@ int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
 				to_dpu_crtc_state(tmp_crtc->state);
 
 			DRM_DEBUG_ATOMIC("crtc:%d bw:%llu ctrl:%d\n",
-				tmp_crtc->base.id, tmp_cstate->new_perf.bw_ctl,
-				tmp_cstate->bw_control);
+					 tmp_crtc->base.id, tmp_cstate->new_perf.bw_ctl,
+					 tmp_cstate->bw_control);
 
-				bw_sum_of_intfs += tmp_cstate->new_perf.bw_ctl;
+			bw_sum_of_intfs += tmp_cstate->new_perf.bw_ctl;
 		}
 
 		/* convert bandwidth to kb */
-- 
2.20.1.7.g153144c

