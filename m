Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BA151A136
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 15:45:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAB8510ECC3;
	Wed,  4 May 2022 13:45:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-44.freemail.mail.aliyun.com
 (out30-44.freemail.mail.aliyun.com [115.124.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16B3D10ECC3
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 13:45:18 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R181e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04395; MF=yang.lee@linux.alibaba.com;
 NM=1; PH=DS; RN=8; SR=0; TI=SMTPD_---0VCBzW9x_1651671915; 
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0VCBzW9x_1651671915) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 04 May 2022 21:45:16 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: deller@gmx.de
Subject: [PATCH -next] video: fbdev: clean up some inconsistent indenting
Date: Wed,  4 May 2022 21:45:14 +0800
Message-Id: <20220504134514.19623-1-yang.lee@linux.alibaba.com>
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
Cc: linux-fbdev@vger.kernel.org, adaplas@gmail.com, thomas@winischhofer.net,
 Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yang Li <yang.lee@linux.alibaba.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Eliminate the follow smatch warnings:
drivers/video/fbdev/nvidia/nv_hw.c:1512 NVLoadStateExt() warn:
inconsistent indenting
drivers/video/fbdev/sis/sis_main.c:4265 sisfb_post_300_rwtest() warn:
inconsistent indenting

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/video/fbdev/nvidia/nv_hw.c | 8 ++++----
 drivers/video/fbdev/sis/sis_main.c | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/video/fbdev/nvidia/nv_hw.c b/drivers/video/fbdev/nvidia/nv_hw.c
index 9b0a324bb1b4..75afaa07e7eb 100644
--- a/drivers/video/fbdev/nvidia/nv_hw.c
+++ b/drivers/video/fbdev/nvidia/nv_hw.c
@@ -1509,10 +1509,10 @@ void NVLoadStateExt(struct nvidia_par *par, RIVA_HW_STATE * state)
 	NV_WR32(par->PFIFO, 0x0495 * 4, 0x00000001);
 	NV_WR32(par->PFIFO, 0x0140 * 4, 0x00000001);
 
-    if (!state) {
-	    par->CurrentState = NULL;
-	    return;
-    }
+	if (!state) {
+		par->CurrentState = NULL;
+		return;
+	}
 
 	if (par->Architecture >= NV_ARCH_10) {
 		if (par->twoHeads) {
diff --git a/drivers/video/fbdev/sis/sis_main.c b/drivers/video/fbdev/sis/sis_main.c
index f28fd69d5eb7..07acbe72fbaa 100644
--- a/drivers/video/fbdev/sis/sis_main.c
+++ b/drivers/video/fbdev/sis/sis_main.c
@@ -4262,7 +4262,7 @@ static int sisfb_post_300_rwtest(struct sis_video_info *ivideo, int iteration,
 	unsigned int k, RankCapacity, PageCapacity, BankNumHigh, BankNumMid;
 	unsigned int PhysicalAdrOtherPage, PhysicalAdrHigh, PhysicalAdrHalfPage;
 
-	 for(k = 0; k < ARRAY_SIZE(SiS_DRAMType); k++) {
+	for (k = 0; k < ARRAY_SIZE(SiS_DRAMType); k++) {
 
 		RankCapacity = buswidth * SiS_DRAMType[k][3];
 
-- 
2.20.1.7.g153144c

