Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 410BB3F71C2
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 11:33:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 377A46E170;
	Wed, 25 Aug 2021 09:33:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpproxy21.qq.com (smtpbg703.qq.com [203.205.195.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E2F46E170
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 09:33:05 +0000 (UTC)
X-QQ-mid: bizesmtp39t1629883939tmjexs0h
Received: from localhost.localdomain (unknown [111.207.172.18])
 by esmtp6.qq.com (ESMTP) with 
 id ; Wed, 25 Aug 2021 17:32:17 +0800 (CST)
X-QQ-SSF: 0140000000200040D000B00F0000000
X-QQ-FEAT: DgJAXuPMHm6yIFA8xHOBJw9pfIUs9YKEUj1RCAMLUimR7RCn5pitq417UmVnE
 GOYBvZGt1MkL1Saq3zmmOA0wO6hW0ieBICxf3ThOTCWoa7x1JzEd2fW79UiqByZKsQs6QqW
 0dp4m3Kuk3J0MQv4azXyf1cO5u/Wfu2sUomBIrhMGRlvzR8WRBR/AzjXzXM7/O8bpZxveEb
 mvUksTIvB8oruiqHAt1nWDwbjqncbX/UV39vupXltJvY0ZE4miiLi7sUqLUMLk2Bwmr0hZe
 rcisp/x9LqiRuYnz6cKpssjd8G7ufjhDeZvLtFZRttDKEx57uXdHWGF9f2kD5uzSM1dHQJi
 S4A34d1
X-QQ-GoodBg: 2
From: zhaoxiao <zhaoxiao@uniontech.com>
To: robdclark@gmail.com, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch
Cc: jordan@cosmicpenguin.net, saiprakash.ranjan@codeaurora.org,
 jonathan@marek.ca, airlied@redhat.com, smasetty@codeaurora.org,
 konrad.dybcio@somainline.org, akhilpo@codeaurora.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 zhaoxiao <zhaoxiao@uniontech.com>
Subject: [PATCH] drm: msm: adreno_gpu.c: Add and use pr_fmt(fmt)
Date: Wed, 25 Aug 2021 17:32:16 +0800
Message-Id: <20210825093216.15032-1-zhaoxiao@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign5
X-QQ-Bgrelay: 1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt

Signed-off-by: zhaoxiao <zhaoxiao@uniontech.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 9f5a30234b33..6b75fbd39121 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -20,6 +20,8 @@
 #include "msm_gem.h"
 #include "msm_mmu.h"
 
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
 static bool zap_available = true;
 
 static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
@@ -753,7 +755,7 @@ void adreno_dump_info(struct msm_gpu *gpu)
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	int i;
 
-	printk("revision: %d (%d.%d.%d.%d)\n",
+	pr_info("revision: %d (%d.%d.%d.%d)\n",
 			adreno_gpu->info->revn, adreno_gpu->rev.core,
 			adreno_gpu->rev.major, adreno_gpu->rev.minor,
 			adreno_gpu->rev.patchid);
@@ -761,12 +763,12 @@ void adreno_dump_info(struct msm_gpu *gpu)
 	for (i = 0; i < gpu->nr_rings; i++) {
 		struct msm_ringbuffer *ring = gpu->rb[i];
 
-		printk("rb %d: fence:    %d/%d\n", i,
+		pr_info("rb %d: fence:    %d/%d\n", i,
 			ring->memptrs->fence,
 			ring->seqno);
 
-		printk("rptr:     %d\n", get_rptr(adreno_gpu, ring));
-		printk("rb wptr:  %d\n", get_wptr(ring));
+		pr_info("rptr:     %d\n", get_rptr(adreno_gpu, ring));
+		pr_info("rb wptr:  %d\n", get_wptr(ring));
 	}
 }
 
@@ -780,7 +782,7 @@ void adreno_dump(struct msm_gpu *gpu)
 		return;
 
 	/* dump these out in a form that can be parsed by demsm: */
-	printk("IO:region %s 00000000 00020000\n", gpu->name);
+	pr_info("IO:region %s 00000000 00020000\n", gpu->name);
 	for (i = 0; adreno_gpu->registers[i] != ~0; i += 2) {
 		uint32_t start = adreno_gpu->registers[i];
 		uint32_t end   = adreno_gpu->registers[i+1];
@@ -788,7 +790,7 @@ void adreno_dump(struct msm_gpu *gpu)
 
 		for (addr = start; addr <= end; addr++) {
 			uint32_t val = gpu_read(gpu, addr);
-			printk("IO:R %08x %08x\n", addr<<2, val);
+			pr_info("IO:R %08x %08x\n", addr<<2, val);
 		}
 	}
 }
-- 
2.20.1



