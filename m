Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7D9610ACE
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 08:55:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AA3A10E77C;
	Fri, 28 Oct 2022 06:55:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A2C210E77C
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Oct 2022 06:55:42 +0000 (UTC)
X-UUID: f56dba9acbb249abaeed337066c527f0-20221028
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=Om6e9HJa3Y2xbqqlidvMSIavVsT9gkHzqKrxqv9RHmM=; 
 b=anKIvAMl8gYU0EQ1LtLet6Zb1/AHJF/raCeGXrbsW3dbd9BJxf4AgKd7s6V9C+njJl+msVYIJhICS2WX4q2q1vhTvvkZsN80p1+u3WCMs+sjKsd94kDT2q/xehT+efwShxYUbD/3i6+lUBv9Wo+K127JSMbgLp7+/VKp+LqiEfA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12, REQID:bbf317af-822f-4da6-9921-2a58100b0b80, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:62cd327, CLOUDID:0ae76827-9eb1-469f-b210-e32d06cfa36e,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: f56dba9acbb249abaeed337066c527f0-20221028
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw02.mediatek.com (envelope-from <mark-pk.tsai@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 2077977924; Fri, 28 Oct 2022 14:55:35 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Fri, 28 Oct 2022 14:55:34 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 28 Oct 2022 14:55:34 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: Sumit Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Liam Mark <lmark@codeaurora.org>, "Laura
 Abbott" <labbott@redhat.com>, Brian Starkey <Brian.Starkey@arm.com>, "John
 Stultz" <jstultz@google.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v3] dma-buf: cma_heap: Remove duplicated 'by' in comment
Date: Fri, 28 Oct 2022 14:55:26 +0800
Message-ID: <20221028065533.23856-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
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
Cc: yj.chiang@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Mark-PK Tsai <mark-pk.tsai@mediatek.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove duplicated 'by' from comment in cma_heap_allocate().

Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
---
 drivers/dma-buf/heaps/cma_heap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index 28fb04eccdd0..cd386ce639f3 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -316,7 +316,7 @@ static struct dma_buf *cma_heap_allocate(struct dma_heap *heap,
 			kunmap_atomic(vaddr);
 			/*
 			 * Avoid wasting time zeroing memory if the process
-			 * has been killed by by SIGKILL
+			 * has been killed by SIGKILL
 			 */
 			if (fatal_signal_pending(current))
 				goto free_cma;
-- 
2.18.0

