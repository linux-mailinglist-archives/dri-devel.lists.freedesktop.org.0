Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E20E74D2EB
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 12:09:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAE6B10E257;
	Mon, 10 Jul 2023 10:09:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 865DA10E257
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 10:09:40 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8Axjuvh2KtkvRcDAA--.6181S3;
 Mon, 10 Jul 2023 18:09:37 +0800 (CST)
Received: from openarena.loongson.cn (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Cx_c7g2KtknCInAA--.45834S2; 
 Mon, 10 Jul 2023 18:09:36 +0800 (CST)
From: Sui Jingfeng <suijingfeng@loongson.cn>
To: Sui Jingfeng <suijingfeng@loongson.cn>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Li Yi <liyi@loongson.cn>
Subject: [PATCH] drm/loongson: Fix two warnings because of passing wrong type
Date: Mon, 10 Jul 2023 18:09:31 +0800
Message-Id: <20230710100931.255234-1-suijingfeng@loongson.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cx_c7g2KtknCInAA--.45834S2
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW7tw4fur45Gw15KFWUXFykXrc_yoW8Ar1kpF
 47Ca48trZ8Jr12yr4kG3WUZ34Fv3ZaqFZa9FZ7C3Z09w1DAF1UZF1kuFW5Kry7Zay2vrWa
 yr93G3yag3WqqwcCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUk2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
 xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
 1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv
 67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
 Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
 6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
 vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
 42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6x
 kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU2DUUUUUUU
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
Cc: loongson-kernel@lists.loongnix.cn, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When accessing I/O memory, we should pass '__iomem *' type instead of
'void *' simply, otherwise sparse tests will complain. After applied
this patch, the following two sparse warnings got fixed.

1) drivers/gpu/drm/loongson/lsdc_benchmark.c:27:35:
   sparse:     expected void volatile [noderef] __iomem *
   sparse:     got void *kptr

2) drivers/gpu/drm/loongson/lsdc_benchmark.c:42:51:
   sparse:     expected void const volatile [noderef] __iomem *
   sparse:     got void *kptr

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202307100243.v3hv6aes-lkp@intel.com/
Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/gpu/drm/loongson/lsdc_benchmark.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/loongson/lsdc_benchmark.c b/drivers/gpu/drm/loongson/lsdc_benchmark.c
index b088646a2ff9..36e352820bdb 100644
--- a/drivers/gpu/drm/loongson/lsdc_benchmark.c
+++ b/drivers/gpu/drm/loongson/lsdc_benchmark.c
@@ -24,7 +24,7 @@ static void lsdc_copy_gtt_to_vram_cpu(struct lsdc_bo *src_bo,
 	lsdc_bo_kmap(dst_bo);
 
 	while (n--)
-		memcpy_toio(dst_bo->kptr, src_bo->kptr, size);
+		memcpy_toio((void __iomem *)dst_bo->kptr, src_bo->kptr, size);
 
 	lsdc_bo_kunmap(src_bo);
 	lsdc_bo_kunmap(dst_bo);
@@ -39,7 +39,7 @@ static void lsdc_copy_vram_to_gtt_cpu(struct lsdc_bo *src_bo,
 	lsdc_bo_kmap(dst_bo);
 
 	while (n--)
-		memcpy_fromio(dst_bo->kptr, src_bo->kptr, size);
+		memcpy_fromio(dst_bo->kptr, (void __iomem *)src_bo->kptr, size);
 
 	lsdc_bo_kunmap(src_bo);
 	lsdc_bo_kunmap(dst_bo);
-- 
2.34.1

