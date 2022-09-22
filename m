Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A4A5E67E7
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 18:00:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88EAD10EC3C;
	Thu, 22 Sep 2022 16:00:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB14F10EAD5
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 11:33:20 +0000 (UTC)
Received: from dggpeml500023.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MYChg332szMnbq;
 Thu, 22 Sep 2022 19:28:35 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.58) by
 dggpeml500023.china.huawei.com (7.185.36.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 22 Sep 2022 19:33:17 +0800
From: Xiu Jianfeng <xiujianfeng@huawei.com>
To: <sumit.semwal@linaro.org>, <benjamin.gaignard@collabora.com>,
 <lmark@codeaurora.org>, <labbott@redhat.com>, <Brian.Starkey@arm.com>,
 <jstultz@google.com>, <christian.koenig@amd.com>
Subject: [PATCH] dma-buf: Add __init annotation to module init func
Date: Thu, 22 Sep 2022 19:29:38 +0800
Message-ID: <20220922112938.147609-1-xiujianfeng@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.174.58]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpeml500023.china.huawei.com (7.185.36.114)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 22 Sep 2022 16:00:00 +0000
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
Cc: linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add missing __init annotation to module init func.

Signed-off-by: Xiu Jianfeng <xiujianfeng@huawei.com>
---
 drivers/dma-buf/heaps/cma_heap.c    | 2 +-
 drivers/dma-buf/heaps/system_heap.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index 28fb04eccdd0..62d0d0e8b10d 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -392,7 +392,7 @@ static int __add_cma_heap(struct cma *cma, void *data)
 	return 0;
 }
 
-static int add_default_cma_heap(void)
+static int __init add_default_cma_heap(void)
 {
 	struct cma *default_cma = dev_get_cma_area(NULL);
 	int ret = 0;
diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index fcf836ba9c1f..cbe445bc5bab 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -422,7 +422,7 @@ static const struct dma_heap_ops system_heap_ops = {
 	.allocate = system_heap_allocate,
 };
 
-static int system_heap_create(void)
+static int __init system_heap_create(void)
 {
 	struct dma_heap_export_info exp_info;
 
-- 
2.17.1

