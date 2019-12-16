Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FFE8120790
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 14:49:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6919F6E560;
	Mon, 16 Dec 2019 13:49:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 886 seconds by postgrey-1.36 at gabe;
 Mon, 16 Dec 2019 13:49:10 UTC
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38BEE6E56A
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 13:49:10 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBGDYOcu130084;
 Mon, 16 Dec 2019 07:34:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1576503264;
 bh=9kTBc9xK4iPXygZu9ZgoOyjK9sJ1waR1JEMyqcNErqg=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=TYhd6rD+U5FWsjkFpmdmmdFMFgcn0eURamKrXmp76Q2606R6HmSi8GNl/UEZHQnP+
 XyhtG5d61hEgTTk04EMnSE6uk5NABtmpWhU6rlKAYirFF/M+QxUHnLqSiZ0tHovRjv
 YOQL7xncrTp21fWTWmTD4HWPEBxr1/ll8cLuEHYE=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBGDYOM3049581
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 16 Dec 2019 07:34:24 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 16
 Dec 2019 07:34:23 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 16 Dec 2019 07:34:23 -0600
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
 [128.247.22.53])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBGDYN0t065633;
 Mon, 16 Dec 2019 07:34:23 -0600
Received: from localhost ([10.250.79.55])
 by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id xBGDYMu29187; 
 Mon, 16 Dec 2019 07:34:22 -0600 (CST)
From: "Andrew F. Davis" <afd@ti.com>
To: Sumit Semwal <sumit.semwal@linaro.org>, John Stultz
 <john.stultz@linaro.org>
Subject: [PATCH 2/2] dma-buf: heaps: Remove redundant heap identifier from
 system heap name
Date: Mon, 16 Dec 2019 08:34:05 -0500
Message-ID: <20191216133405.1001-3-afd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191216133405.1001-1-afd@ti.com>
References: <20191216133405.1001-1-afd@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: dri-devel@lists.freedesktop.org, "Andrew F . Davis" <afd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The heaps are already in a directory of heaps, adding _heap to a heap
name is redundant. This patch is only a name change, no logic is changed.

Signed-off-by: Andrew F. Davis <afd@ti.com>
---
 drivers/dma-buf/heaps/system_heap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index 1aa01e98c595..0bf688e3c023 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -109,7 +109,7 @@ static int system_heap_create(void)
 	struct dma_heap_export_info exp_info;
 	int ret = 0;
 
-	exp_info.name = "system_heap";
+	exp_info.name = "system";
 	exp_info.ops = &system_heap_ops;
 	exp_info.priv = NULL;
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
