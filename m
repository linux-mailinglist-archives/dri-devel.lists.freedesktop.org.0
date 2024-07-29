Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4D393EF8B
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 10:12:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD1BC10E139;
	Mon, 29 Jul 2024 08:12:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35C4010E139
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2024 08:12:36 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.162.112])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4WXWFG3YGrz2Clf0;
 Mon, 29 Jul 2024 16:08:02 +0800 (CST)
Received: from kwepemm600007.china.huawei.com (unknown [7.193.23.208])
 by mail.maildlp.com (Postfix) with ESMTPS id B71A81400DB;
 Mon, 29 Jul 2024 16:12:33 +0800 (CST)
Received: from DESKTOP-8RFUVS3.china.huawei.com (10.174.178.219) by
 kwepemm600007.china.huawei.com (7.193.23.208) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 29 Jul 2024 16:12:32 +0800
From: Zenghui Yu <yuzenghui@huawei.com>
To: <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
CC: <sumit.semwal@linaro.org>, <benjamin.gaignard@collabora.com>,
 <Brian.Starkey@arm.com>, <jstultz@google.com>, <tjmercier@google.com>,
 <shuah@kernel.org>, <daniel.vetter@ffwll.ch>, <wanghaibin.wang@huawei.com>,
 Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH] MAINTAINERS: Add selftests to DMA-BUF HEAPS FRAMEWORK entry
Date: Mon, 29 Jul 2024 16:12:02 +0800
Message-ID: <20240729081202.937-1-yuzenghui@huawei.com>
X-Mailer: git-send-email 2.23.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.178.219]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm600007.china.huawei.com (7.193.23.208)
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

Include dmabuf-heaps selftests in the correct entry so that updates to it
can be sent to the right place.

Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 42decde38320..b7f24c9fb0e2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6660,6 +6660,7 @@ F:	drivers/dma-buf/dma-heap.c
 F:	drivers/dma-buf/heaps/*
 F:	include/linux/dma-heap.h
 F:	include/uapi/linux/dma-heap.h
+F:	tools/testing/selftests/dmabuf-heaps/
 
 DMC FREQUENCY DRIVER FOR SAMSUNG EXYNOS5422
 M:	Lukasz Luba <lukasz.luba@arm.com>
-- 
2.33.0

