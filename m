Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E5457FA25
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 09:23:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01D4511A1B8;
	Mon, 25 Jul 2022 07:23:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpbg.qq.com (biz-43-154-221-58.mail.qq.com [43.154.221.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EA98BEF5F;
 Sun, 24 Jul 2022 07:37:15 +0000 (UTC)
X-QQ-mid: bizesmtp80t1658648218tccj66q4
Received: from localhost.localdomain ( [125.70.163.183])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Sun, 24 Jul 2022 15:36:56 +0800 (CST)
X-QQ-SSF: 01000000002000007000B00A0000000
X-QQ-FEAT: 7jw2iSiCazoMav4Yzpx3ytw6EPmuPE4/jr5WrcEa/tATwFc9DCuRRags72aEm
 Ni4wJKPcbIzFuMp9rzpXMacoJrYGVH3rW/3F0kQ+/mgtJPAL1MOL57hrgwv4ZYZwPYfiCKM
 T8rwhYhM+7rwqqgy4cydyqW+VX6w8F+YgXIqnqrnd/Hona7FX0NSw0M9BTWNDtHPcHIFDxt
 t6zCE2HGk0bQZpekv88T2NWDfoI3fA6ghFcYA3yw2VKGa+FQLXPzPdHArsm6u0peE4dH+mU
 mNDfJblYFIwudRKXCOxpcsmC+QEaXdpRsLPfUTueF9Gl+Bf6jRTEKRUN8WIOxNA5vZebPeA
 4qqWGSF2YQnpSWSaPpaRc6Nlk/HI8E37yaR3YjmVD4lGMyMXuJ88gYJ3udjHQ==
X-QQ-GoodBg: 0
From: wangjianli <wangjianli@cdjrlc.com>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@linux.ie,
 daniel@ffwll.ch, wangqing@vivo.com, dan.carpenter@oracle.com,
 bjorn.andersson@linaro.org
Subject: [PATCH] msm/adreno: fix repeated words in comments
Date: Sun, 24 Jul 2022 15:36:50 +0800
Message-Id: <20220724073650.16460-1-wangjianli@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr7
X-Mailman-Approved-At: Mon, 25 Jul 2022 07:23:20 +0000
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
Cc: wangjianli <wangjianli@cdjrlc.com>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

 Delete the redundant word 'in'.

Signed-off-by: wangjianli <wangjianli@cdjrlc.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 9f76f5b15759..9303a011b81d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1277,7 +1277,7 @@ static int a6xx_gmu_rpmh_arc_votes_init(struct device *dev, u32 *votes,
 		}
 
 		/*
-		 * Look for a level in in the secondary list that matches. If
+		 * Look for a level in the secondary list that matches. If
 		 * nothing fits, use the maximum non zero vote
 		 */
 
-- 
2.36.1

