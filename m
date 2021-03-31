Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F94350556
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 19:22:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20EE06EB25;
	Wed, 31 Mar 2021 17:22:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 550 seconds by postgrey-1.36 at gabe;
 Wed, 31 Mar 2021 13:21:09 UTC
Received: from mail-m121143.qiye.163.com (mail-m121143.qiye.163.com
 [115.236.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADB516EA97
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 13:21:09 +0000 (UTC)
Received: from ubuntu.localdomain (unknown [36.152.145.181])
 by mail-m121143.qiye.163.com (Hmail) with ESMTPA id C105C5403BF;
 Wed, 31 Mar 2021 21:13:19 +0800 (CST)
From: Bernard Zhao <bernard@vivo.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Jordan Crouse <jcrouse@codeaurora.org>,
 Zhenzhong Duan <zhenzhong.duan@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, Jonathan Marek <jonathan@marek.ca>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] /msm/adreno: fix different address spaces warning
Date: Wed, 31 Mar 2021 06:13:11 -0700
Message-Id: <20210331131313.60942-1-bernard@vivo.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZHU9MTUsZQ00aHkIaVkpNSkxKQk1PS0tLSEpVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS0hKTFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NyI6TTo4Tj8cDjVOCSg5Kzoy
 Lx8aCjxVSlVKTUpMSkJNT0tLT0lMVTMWGhIXVRkeCRUaCR87DRINFFUYFBZFWVdZEgtZQVlITVVK
 TklVSk9OVUpDSllXWQgBWUFMTkNPNwY+
X-HM-Tid: 0a78886abd7eb038kuuuc105c5403bf
X-Mailman-Approved-At: Wed, 31 Mar 2021 17:21:40 +0000
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
Cc: opensource.kernel@vivo.com, Bernard Zhao <bernard@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following sparse warnings:
drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:189:9:    expected void [noderef] __iomem *addr
drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:189:9:    got void *
drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:190:9: warning: incorrect type in argument 2 (different address spaces)
drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:190:9:    expected void [noderef] __iomem *addr
drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:190:9:    got void *
drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:191:9: warning: incorrect type in argument 2 (different address spaces)
drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:191:9:    expected void [noderef] __iomem *addr
drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:191:9:    got void *
drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:192:9: warning: incorrect type in argument 2 (different address spaces)
drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:192:9:    expected void [noderef] __iomem *addr
drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:192:9:    got void *
drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:197:19: warning: incorrect type in argument 1 (different address spaces)
drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:197:19:    expected void const [noderef] __iomem *addr
drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:197:19:    got void *
drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:198:19: warning: incorrect type in argument 1 (different address spaces)
drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:198:19:    expected void const [noderef] __iomem *addr
drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:198:19:    got void *
drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:315:41: warning: incorrect type in argument 1 (different address spaces)
drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:315:41:    expected void *[noderef] __iomem cxdbg
drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:315:41:    got void [noderef] __iomem *cxdbg
drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:189:9: warning: dereference of noderef expression
drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:190:9: warning: dereference of noderef expression
drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:191:9: warning: dereference of noderef expression
drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:192:9: warning: dereference of noderef expression
drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:197:19: warning: dereference of noderef expression
drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:198:19: warning: dereference of noderef expression

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 36 ++++++++++-----------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index c1699b4f9a89..e5558d09ddf9 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -186,16 +186,16 @@ static int cx_debugbus_read(void *__iomem cxdbg, u32 block, u32 offset,
 	u32 reg = A6XX_CX_DBGC_CFG_DBGBUS_SEL_A_PING_INDEX(offset) |
 		A6XX_CX_DBGC_CFG_DBGBUS_SEL_A_PING_BLK_SEL(block);
 
-	cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_SEL_A, reg);
-	cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_SEL_B, reg);
-	cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_SEL_C, reg);
-	cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_SEL_D, reg);
+	cxdbg_write(cxdbg, (void __iomem *)REG_A6XX_CX_DBGC_CFG_DBGBUS_SEL_A, reg);
+	cxdbg_write(cxdbg, (void __iomem *)REG_A6XX_CX_DBGC_CFG_DBGBUS_SEL_B, reg);
+	cxdbg_write(cxdbg, (void __iomem *)REG_A6XX_CX_DBGC_CFG_DBGBUS_SEL_C, reg);
+	cxdbg_write(cxdbg, (void __iomem *)REG_A6XX_CX_DBGC_CFG_DBGBUS_SEL_D, reg);
 
 	/* Wait 1 us to make sure the data is flowing */
 	udelay(1);
 
-	data[0] = cxdbg_read(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_TRACE_BUF2);
-	data[1] = cxdbg_read(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_TRACE_BUF1);
+	data[0] = cxdbg_read(cxdbg, (void __iomem *)REG_A6XX_CX_DBGC_CFG_DBGBUS_TRACE_BUF2);
+	data[1] = cxdbg_read(cxdbg, (void __iomem *)REG_A6XX_CX_DBGC_CFG_DBGBUS_TRACE_BUF1);
 
 	return 2;
 }
@@ -353,26 +353,26 @@ static void a6xx_get_debugbus(struct msm_gpu *gpu,
 		cxdbg = ioremap(res->start, resource_size(res));
 
 	if (cxdbg) {
-		cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_CNTLT,
+		cxdbg_write(cxdbg, (void __iomem *)REG_A6XX_CX_DBGC_CFG_DBGBUS_CNTLT,
 			A6XX_DBGC_CFG_DBGBUS_CNTLT_SEGT(0xf));
 
-		cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_CNTLM,
+		cxdbg_write(cxdbg, (void __iomem *)REG_A6XX_CX_DBGC_CFG_DBGBUS_CNTLM,
 			A6XX_DBGC_CFG_DBGBUS_CNTLM_ENABLE(0xf));
 
-		cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_IVTL_0, 0);
-		cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_IVTL_1, 0);
-		cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_IVTL_2, 0);
-		cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_IVTL_3, 0);
+		cxdbg_write(cxdbg, (void __iomem *)REG_A6XX_CX_DBGC_CFG_DBGBUS_IVTL_0, 0);
+		cxdbg_write(cxdbg, (void __iomem *)REG_A6XX_CX_DBGC_CFG_DBGBUS_IVTL_1, 0);
+		cxdbg_write(cxdbg, (void __iomem *)REG_A6XX_CX_DBGC_CFG_DBGBUS_IVTL_2, 0);
+		cxdbg_write(cxdbg, (void __iomem *)REG_A6XX_CX_DBGC_CFG_DBGBUS_IVTL_3, 0);
 
-		cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_BYTEL_0,
+		cxdbg_write(cxdbg, (void __iomem *)REG_A6XX_CX_DBGC_CFG_DBGBUS_BYTEL_0,
 			0x76543210);
-		cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_BYTEL_1,
+		cxdbg_write(cxdbg, (void __iomem *)REG_A6XX_CX_DBGC_CFG_DBGBUS_BYTEL_1,
 			0xFEDCBA98);
 
-		cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_MASKL_0, 0);
-		cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_MASKL_1, 0);
-		cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_MASKL_2, 0);
-		cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_MASKL_3, 0);
+		cxdbg_write(cxdbg, (void __iomem *)REG_A6XX_CX_DBGC_CFG_DBGBUS_MASKL_0, 0);
+		cxdbg_write(cxdbg, (void __iomem *)REG_A6XX_CX_DBGC_CFG_DBGBUS_MASKL_1, 0);
+		cxdbg_write(cxdbg, (void __iomem *)REG_A6XX_CX_DBGC_CFG_DBGBUS_MASKL_2, 0);
+		cxdbg_write(cxdbg, (void __iomem *)REG_A6XX_CX_DBGC_CFG_DBGBUS_MASKL_3, 0);
 	}
 
 	nr_debugbus_blocks = ARRAY_SIZE(a6xx_debugbus_blocks) +
-- 
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
