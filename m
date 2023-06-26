Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D762E73E236
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jun 2023 16:33:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72D7B10E21A;
	Mon, 26 Jun 2023 14:33:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9003010E212
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 14:33:34 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8Cxbce8oZlki28CAA--.3795S3;
 Mon, 26 Jun 2023 22:33:32 +0800 (CST)
Received: from openarena.loongson.cn (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxvM67oZlk7cUJAA--.43395S3; 
 Mon, 26 Jun 2023 22:33:31 +0800 (CST)
From: Sui Jingfeng <suijingfeng@loongson.cn>
To: Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>
Subject: [PATCH 2/2] drm/tegra: Remove surplus else after return
Date: Mon, 26 Jun 2023 22:33:31 +0800
Message-Id: <20230626143331.640454-2-suijingfeng@loongson.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230626143331.640454-1-suijingfeng@loongson.cn>
References: <20230626143331.640454-1-suijingfeng@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxvM67oZlk7cUJAA--.43395S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW7Cw15JF4DAF4fuw1xur1Utwc_yoW8XF13pa
 yag34YkrZ0qF4DZF12yF4j9wn5ZaySgFyIkFWDJa9avF1DXr10v348tFZrtFy5Gr97JFsI
 yF4qyw43A347AwcCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUk2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
 xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
 1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv
 67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
 Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
 6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
 vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
 42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6x
 kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU2Z2-UUUUU
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

else is not generally useful after return

Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/gpu/drm/tegra/gem.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index 0ce22935fbd3..26d64f4545bd 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -180,15 +180,15 @@ static void *tegra_bo_mmap(struct host1x_bo *bo)
 	struct iosys_map map;
 	int ret;
 
-	if (obj->vaddr) {
+	if (obj->vaddr)
 		return obj->vaddr;
-	} else if (obj->gem.import_attach) {
+
+	if (obj->gem.import_attach) {
 		ret = dma_buf_vmap_unlocked(obj->gem.import_attach->dmabuf, &map);
 		return ret ? NULL : map.vaddr;
-	} else {
-		return vmap(obj->pages, obj->num_pages, VM_MAP,
-			    pgprot_writecombine(PAGE_KERNEL));
 	}
+
+	return vmap(obj->pages, obj->num_pages, VM_MAP, pgprot_writecombine(PAGE_KERNEL));
 }
 
 static void tegra_bo_munmap(struct host1x_bo *bo, void *addr)
@@ -198,10 +198,11 @@ static void tegra_bo_munmap(struct host1x_bo *bo, void *addr)
 
 	if (obj->vaddr)
 		return;
-	else if (obj->gem.import_attach)
-		dma_buf_vunmap_unlocked(obj->gem.import_attach->dmabuf, &map);
-	else
-		vunmap(addr);
+
+	if (obj->gem.import_attach)
+		return dma_buf_vunmap_unlocked(obj->gem.import_attach->dmabuf, &map);
+
+	vunmap(addr);
 }
 
 static struct host1x_bo *tegra_bo_get(struct host1x_bo *bo)
-- 
2.25.1

