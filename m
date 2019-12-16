Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 214E511FFCB
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 09:31:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 445B06E450;
	Mon, 16 Dec 2019 08:31:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE1006E125
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 03:41:07 +0000 (UTC)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 5C7DF7B8C7547786065E;
 Mon, 16 Dec 2019 11:41:04 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.439.0; Mon, 16 Dec 2019
 11:40:55 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <bskeggs@redhat.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/nouveau/mmu: Remove unneeded semicolon
Date: Mon, 16 Dec 2019 11:48:16 +0800
Message-ID: <1576468096-63366-1-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 16 Dec 2019 08:30:48 +0000
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
Cc: zhengbin13@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes coccicheck warning:

drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c:583:2-3: Unneeded semicolon
drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h:307:2-3: Unneeded semicolon

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: zhengbin <zhengbin13@huawei.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
index 41640e0..199f94e 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
@@ -580,7 +580,7 @@ nvkm_vmm_iter(struct nvkm_vmm *vmm, const struct nvkm_vmm_page *page,
 				it.pte[it.lvl]++;
 			}
 		}
-	};
+	}

 	nvkm_vmm_flush(&it);
 	return ~0ULL;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h
index 5e55ecb..321bfca 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h
@@ -304,7 +304,7 @@ int tu102_vmm_new(struct nvkm_mmu *, bool, u64, u64, void *, u32,
 		FILL(VMM, PT, PTEI, _ptes, MAP, _addr);                        \
 		PTEI += _ptes;                                                 \
 		PTEN -= _ptes;                                                 \
-	};                                                                     \
+	}                                                                     \
 	nvkm_done((PT)->memory);                                               \
 } while(0)

--
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
