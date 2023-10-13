Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FDBB7C7BF6
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 05:21:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A91A10E58A;
	Fri, 13 Oct 2023 03:21:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-98.freemail.mail.aliyun.com
 (out30-98.freemail.mail.aliyun.com [115.124.30.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F06B310E080;
 Fri, 13 Oct 2023 03:21:40 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R571e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045192;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=10; SR=0;
 TI=SMTPD_---0Vu0XCf7_1697167290; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0Vu0XCf7_1697167290) by smtp.aliyun-inc.com;
 Fri, 13 Oct 2023 11:21:35 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: alexander.deucher@amd.com
Subject: [PATCH] drm/amdkfd: clean up some inconsistent indenting
Date: Fri, 13 Oct 2023 11:21:29 +0800
Message-Id: <20231013032129.55504-1-jiapeng.chong@linux.alibaba.com>
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, Xinhui.Pan@amd.com,
 Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

No functional modification involved.

drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_svm.c:305 svm_range_free() warn: inconsistent indenting.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=6804
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index f4038b33c404..eef76190800c 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -302,7 +302,7 @@ static void svm_range_free(struct svm_range *prange, bool do_unmap)
 	for (gpuidx = 0; gpuidx < MAX_GPU_INSTANCE; gpuidx++) {
 		if (prange->dma_addr[gpuidx]) {
 			kvfree(prange->dma_addr[gpuidx]);
-				prange->dma_addr[gpuidx] = NULL;
+			prange->dma_addr[gpuidx] = NULL;
 		}
 	}
 
-- 
2.20.1.7.g153144c

