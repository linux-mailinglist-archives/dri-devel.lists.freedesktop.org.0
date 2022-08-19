Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 831B0599A67
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 13:07:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B024910E8D7;
	Fri, 19 Aug 2022 11:07:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-130.freemail.mail.aliyun.com
 (out30-130.freemail.mail.aliyun.com [115.124.30.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5F9510E8D7
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 11:07:25 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R651e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046050;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=7; SR=0;
 TI=SMTPD_---0VMfyY1O_1660907223; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0VMfyY1O_1660907223) by smtp.aliyun-inc.com;
 Fri, 19 Aug 2022 19:07:21 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: benh@kernel.crashing.org
Subject: [PATCH] video: fbdev: radeon: Clean up some inconsistent indenting
Date: Fri, 19 Aug 2022 19:06:59 +0800
Message-Id: <20220819110659.110384-1-jiapeng.chong@linux.alibaba.com>
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 linux-fbdev@vger.kernel.org, deller@gmx.de,
 Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

No functional modification involved.

drivers/video/fbdev/aty/radeon_base.c:2107 radeon_identify_vram() warn: inconsistent indenting.

Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=1932
Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/video/fbdev/aty/radeon_base.c | 46 +++++++++++++--------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/video/fbdev/aty/radeon_base.c b/drivers/video/fbdev/aty/radeon_base.c
index 0a8199985d52..1e6ac7ef3e73 100644
--- a/drivers/video/fbdev/aty/radeon_base.c
+++ b/drivers/video/fbdev/aty/radeon_base.c
@@ -2095,34 +2095,34 @@ static void radeon_identify_vram(struct radeonfb_info *rinfo)
 	u32 tmp;
 
 	/* framebuffer size */
-        if ((rinfo->family == CHIP_FAMILY_RS100) ||
+	if ((rinfo->family == CHIP_FAMILY_RS100) ||
             (rinfo->family == CHIP_FAMILY_RS200) ||
             (rinfo->family == CHIP_FAMILY_RS300) ||
             (rinfo->family == CHIP_FAMILY_RC410) ||
             (rinfo->family == CHIP_FAMILY_RS400) ||
 	    (rinfo->family == CHIP_FAMILY_RS480) ) {
-          u32 tom = INREG(NB_TOM);
-          tmp = ((((tom >> 16) - (tom & 0xffff) + 1) << 6) * 1024);
-
- 		radeon_fifo_wait(6);
-          OUTREG(MC_FB_LOCATION, tom);
-          OUTREG(DISPLAY_BASE_ADDR, (tom & 0xffff) << 16);
-          OUTREG(CRTC2_DISPLAY_BASE_ADDR, (tom & 0xffff) << 16);
-          OUTREG(OV0_BASE_ADDR, (tom & 0xffff) << 16);
-
-          /* This is supposed to fix the crtc2 noise problem. */
-          OUTREG(GRPH2_BUFFER_CNTL, INREG(GRPH2_BUFFER_CNTL) & ~0x7f0000);
-
-          if ((rinfo->family == CHIP_FAMILY_RS100) ||
-              (rinfo->family == CHIP_FAMILY_RS200)) {
-             /* This is to workaround the asic bug for RMX, some versions
-                of BIOS doesn't have this register initialized correctly.
-             */
-             OUTREGP(CRTC_MORE_CNTL, CRTC_H_CUTOFF_ACTIVE_EN,
-                     ~CRTC_H_CUTOFF_ACTIVE_EN);
-          }
-        } else {
-          tmp = INREG(CNFG_MEMSIZE);
+		u32 tom = INREG(NB_TOM);
+
+		tmp = ((((tom >> 16) - (tom & 0xffff) + 1) << 6) * 1024);
+		radeon_fifo_wait(6);
+		OUTREG(MC_FB_LOCATION, tom);
+		OUTREG(DISPLAY_BASE_ADDR, (tom & 0xffff) << 16);
+		OUTREG(CRTC2_DISPLAY_BASE_ADDR, (tom & 0xffff) << 16);
+		OUTREG(OV0_BASE_ADDR, (tom & 0xffff) << 16);
+
+		/* This is supposed to fix the crtc2 noise problem. */
+		OUTREG(GRPH2_BUFFER_CNTL, INREG(GRPH2_BUFFER_CNTL) & ~0x7f0000);
+
+		if ((rinfo->family == CHIP_FAMILY_RS100) ||
+		    (rinfo->family == CHIP_FAMILY_RS200)) {
+			/* This is to workaround the asic bug for RMX, some versions
+			 * of BIOS doesn't have this register initialized correctly.
+			 */
+			OUTREGP(CRTC_MORE_CNTL, CRTC_H_CUTOFF_ACTIVE_EN,
+				~CRTC_H_CUTOFF_ACTIVE_EN);
+		}
+	} else {
+		tmp = INREG(CNFG_MEMSIZE);
         }
 
 	/* mem size is bits [28:0], mask off the rest */
-- 
2.20.1.7.g153144c

