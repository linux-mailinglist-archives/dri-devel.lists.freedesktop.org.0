Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CEAB27528C
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 09:53:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32B256E44D;
	Wed, 23 Sep 2020 07:53:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8931389BB2
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 07:46:04 +0000 (UTC)
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id A0169698CB3418CF2C0F;
 Tue, 22 Sep 2020 15:46:00 +0800 (CST)
Received: from linux-lmwb.huawei.com (10.175.103.112) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.487.0; Tue, 22 Sep 2020 15:45:53 +0800
From: Zou Wei <zou_wei@huawei.com>
To: <sumit.semwal@linaro.org>, <afd@ti.com>, <benjamin.gaignard@linaro.org>,
 <lmark@codeaurora.org>, <labbott@redhat.com>, <Brian.Starkey@arm.com>,
 <john.stultz@linaro.org>, <christian.koenig@amd.com>
Subject: [PATCH -next] dma-buf: heaps: Remove unused variable ret
Date: Tue, 22 Sep 2020 15:53:28 +0800
Message-ID: <1600761208-45229-1-git-send-email-zou_wei@huawei.com>
X-Mailer: git-send-email 2.6.2
MIME-Version: 1.0
X-Originating-IP: [10.175.103.112]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 23 Sep 2020 07:53:19 +0000
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
Cc: linaro-mm-sig@lists.linaro.org, Zou Wei <zou_wei@huawei.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch fixes below warnings reported by coccicheck

./drivers/dma-buf/heaps/heap-helpers.c:202:5-8: Unneeded variable: "ret". Return "0" on line 215

Signed-off-by: Zou Wei <zou_wei@huawei.com>
---
 drivers/dma-buf/heaps/heap-helpers.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/dma-buf/heaps/heap-helpers.c b/drivers/dma-buf/heaps/heap-helpers.c
index d0696cf..7969510 100644
--- a/drivers/dma-buf/heaps/heap-helpers.c
+++ b/drivers/dma-buf/heaps/heap-helpers.c
@@ -199,7 +199,6 @@ static int dma_heap_dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
 {
 	struct heap_helper_buffer *buffer = dmabuf->priv;
 	struct dma_heaps_attachment *a;
-	int ret = 0;
 
 	mutex_lock(&buffer->lock);
 
@@ -212,7 +211,7 @@ static int dma_heap_dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
 	}
 	mutex_unlock(&buffer->lock);
 
-	return ret;
+	return 0;
 }
 
 static int dma_heap_dma_buf_end_cpu_access(struct dma_buf *dmabuf,
-- 
2.6.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
