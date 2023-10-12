Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C409E7C62FC
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 04:44:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7275E10E3E8;
	Thu, 12 Oct 2023 02:44:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-100.freemail.mail.aliyun.com
 (out30-100.freemail.mail.aliyun.com [115.124.30.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 709B810E3E6
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 02:44:35 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R431e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046060;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=13; SR=0;
 TI=SMTPD_---0Vtyh2Z6_1697078662; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0Vtyh2Z6_1697078662) by smtp.aliyun-inc.com;
 Thu, 12 Oct 2023 10:44:31 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: robdclark@gmail.com
Subject: [PATCH] drm/msm/a6xx: Remove some unused functions
Date: Thu, 12 Oct 2023 10:44:21 +0800
Message-Id: <20231012024421.102832-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

These functions are defined in the a6xx_gpu_state.h file, but not called
elsewhere, so delete these unused functions.

drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h:356:36: warning: ‘a7xx_ahb_reglist’ defined but not used.
drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h:360:36: warning: ‘a7xx_gbif_reglist’ defined but not used.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=6785
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
index 8d7e6f26480a..76e021063732 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
@@ -353,13 +353,6 @@ static const u32 a7xx_gbif_registers[] = {
 	0x3cc0, 0x3cd1,
 };
 
-static const struct a6xx_registers a7xx_ahb_reglist[] = {
-	REGS(a7xx_ahb_registers, 0, 0),
-};
-
-static const struct a6xx_registers a7xx_gbif_reglist =
-	REGS(a7xx_gbif_registers, 0, 0);
-
 static const u32 a6xx_gmu_gx_registers[] = {
 	/* GMU GX */
 	0x0000, 0x0000, 0x0010, 0x0013, 0x0016, 0x0016, 0x0018, 0x001b,
-- 
2.20.1.7.g153144c

