Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59730397F71
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 05:25:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9BE76E02E;
	Wed,  2 Jun 2021 03:25:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m12-16.163.com (m12-16.163.com [220.181.12.16])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4B5466E02E
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 03:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=hCjNx
 bHkM7idDtVYQL2Q4f8U61IqG0gepdecr463U5U=; b=S4qRZUn8nSOGPmxQ0Nugq
 H6nwe8dTK5MEX9MBMAqZXiuuDfFX+pLQHr1dvfqrVPrvcLMcFxxRsuJ0Ljtf/RCW
 hKl4+LT8Fr66YZ4ISIPYAWuDn+MapflAGGen2cPshvAMUoi/8KxSXQl352cNYhu8
 lDSMGwe4Io5S0ntMk5Myok=
Received: from localhost.localdomain (unknown [218.17.89.92])
 by smtp12 (Coremail) with SMTP id EMCowAA3PBg8+rZgOTXqug--.28168S2;
 Wed, 02 Jun 2021 11:25:49 +0800 (CST)
From: lijian_8010a29@163.com
To: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] video: fbdev: kyro: STG4000OverlayDevice.c: Fix a typo
Date: Wed,  2 Jun 2021 11:24:50 +0800
Message-Id: <20210602032450.90703-1-lijian_8010a29@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: EMCowAA3PBg8+rZgOTXqug--.28168S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Jw4DWrWUur4rKr1rAF1fJFb_yoW3KFg_Cw
 1IvFsxX3y8GFW0g3ZxJry3ZryYvFWUZr95WF1qqas5Xry3X393Xw4jvr18KrnYqrZxu3Zr
 WFsFqr4rA3yfKjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUnu6wJUUUUU==
X-Originating-IP: [218.17.89.92]
X-CM-SenderInfo: 5olmxttqbyiikqdsmqqrwthudrp/xtbBER2lUFaEEj9bzwAAsS
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
Cc: lijian <lijian@yulong.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: lijian <lijian@yulong.com>

Change 'thses' to 'these'.

Signed-off-by: lijian <lijian@yulong.com>
---
 drivers/video/fbdev/kyro/STG4000OverlayDevice.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/kyro/STG4000OverlayDevice.c b/drivers/video/fbdev/kyro/STG4000OverlayDevice.c
index 7a09178024a6..46f17020c8cd 100644
--- a/drivers/video/fbdev/kyro/STG4000OverlayDevice.c
+++ b/drivers/video/fbdev/kyro/STG4000OverlayDevice.c
@@ -60,7 +60,10 @@ typedef struct _OVRL_SRC_DEST {
 	u32 ulDstX2;
 	u32 ulDstY2;
 
-	/*clipped pixel pos of source data within buffer thses need to be 128 bit word aligned */
+	/*
+	 * clipped pixel pos of source data within buffer
+	 * these need to be 128 bit word aligned
+	 */
 	u32 ulSrcX1;
 	u32 ulSrcY1;
 	u32 ulSrcX2;
-- 
2.25.1


