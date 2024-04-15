Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5428A5222
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 15:48:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 941AD1125B7;
	Mon, 15 Apr 2024 13:48:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gZpAzXgg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C0E41125AF
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 13:48:24 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-41551639550so19746115e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 06:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713188902; x=1713793702; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=DSOSja9v2Y/T55xjyxPWiR7Nvli7ATRHRt+5nBZCv50=;
 b=gZpAzXgg9ncLOAKlHarFXkuQ9ILU0SQV3gyA8zLZKvzuJRsd5POGJ9E3bEIZJ9hc9u
 8o+zbaVu9Jysl8EAWVcvXWzlsV+9nEr4wFdiXhCdzORsf6q7TUVFHzIGf+//4DHoVrqq
 ks2sAqxwR1BOophUeTQPSPwnBBcYdXpmpJNDfnkRQGVSGw0S3fMW+sSl2OytMDmQYkDf
 j1HsEAZTLqsOsHQ6GIAFhiu/f4C3VBly9qgVU3fFxdyNLRpJVf+tzdlfRqACwD73/FJH
 EhRXNpJHS/qLelZBJq+TZz+4IpGZDbJBU13UIdRhT2f3xoo1ho4c6zCe+tD/3VOURbN6
 53ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713188902; x=1713793702;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DSOSja9v2Y/T55xjyxPWiR7Nvli7ATRHRt+5nBZCv50=;
 b=MTS9/AXs7KWkh4uFBQ9yw5shdRTlRJskRmtp3OMquIjMKO7FKbO/2+00DdPY+k5rAw
 iIbL+5qpcb2t+yK5sfOm3pmDeOGUmH5ltcLo7UOl5GcpBGlK42SqjW24k27l01Ptk7pf
 1zcJdp12PAPBJSZn+MQhhHl1et1UEeAVta3lqceK58a+uvxVHa1kLFD8VFb3kw8E0+ts
 +VlEiVZndpZ0JdYKRqG2PO0U6rFwkAUOIPYXVPqfKBUsb9Rj8A0W24I106jkX0lyV4Qj
 LX7RT86qfRlPCfmh1YDvp9ALhy27PI7nNV02TIY0oKJCqs0uXHYUbLig1uuYjcA7wuFI
 Vxng==
X-Forwarded-Encrypted: i=1;
 AJvYcCWaUWjPgVuKmKIMYyH4O47cJhvylbcYx081rh77UzNNkpkBXv5JTD9qNdVXGnIGPLR2YHo8Un+lBVYhZNq4NedQBemX95oMe/v9kXfzLFWJ
X-Gm-Message-State: AOJu0YxQ1Mnlm4FgoIaO3NfFJCPdRpgqRPP8YksVsOBpOWC8bRgvSXyr
 UxnZ8lQCX4ocBZb31Feb2DEEBYL0/oVdSJSHXMZbtC43q01PuLdcoRv/GNwV
X-Google-Smtp-Source: AGHT+IHvAAP1Ualj1sbjGrDilHsKDHTwlwi5XYKmackmw/h5q/rY3TB2bOe8E8M+BKexxCPXNtyYwA==
X-Received: by 2002:a05:600c:5656:b0:417:d4f6:22eb with SMTP id
 js22-20020a05600c565600b00417d4f622ebmr8343675wmb.24.1713188902342; 
 Mon, 15 Apr 2024 06:48:22 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1547:ec00:9df2:9377:bbec:bd0b])
 by smtp.gmail.com with ESMTPSA id
 h15-20020a05600c314f00b00417ee886977sm14086772wmo.4.2024.04.15.06.48.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Apr 2024 06:48:21 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: Felix.Kuehling@amd.com, Alexander.Deucher@amd.com,
 Rajneesh.Bhardwaj@amd.com, Steven.Roberts@amd.com,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/ttm: stop pooling cached NUMA pages v2
Date: Mon, 15 Apr 2024 15:48:21 +0200
Message-Id: <20240415134821.1919-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Christian König <ckoenig.leichtzumerken@gmail.com>

We only pool write combined and uncached allocations because they
require extra overhead on allocation and release.

If we also pool cached NUMA it not only means some extra unnecessary
overhead, but also that under memory pressure it can happen that
pages from the wrong NUMA node enters the pool and are re-used
over and over again.

This can lead to performance reduction after running into memory
pressure.

v2: restructure and cleanup the code a bit from the internal hack to
    test this.

Signed-off-by: Christian König <christian.koenig@amd.com>
Fixes: 4482d3c94d7f ("drm/ttm: add NUMA node id to the pool")
CC: stable@vger.kernel.org
---
 drivers/gpu/drm/ttm/ttm_pool.c | 38 +++++++++++++++++++++++++---------
 1 file changed, 28 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index 112438d965ff..6e1fd6985ffc 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -288,17 +288,23 @@ static struct ttm_pool_type *ttm_pool_select_type(struct ttm_pool *pool,
 						  enum ttm_caching caching,
 						  unsigned int order)
 {
-	if (pool->use_dma_alloc || pool->nid != NUMA_NO_NODE)
+	if (pool->use_dma_alloc)
 		return &pool->caching[caching].orders[order];
 
 #ifdef CONFIG_X86
 	switch (caching) {
 	case ttm_write_combined:
+		if (pool->nid != NUMA_NO_NODE)
+			return &pool->caching[caching].orders[order];
+
 		if (pool->use_dma32)
 			return &global_dma32_write_combined[order];
 
 		return &global_write_combined[order];
 	case ttm_uncached:
+		if (pool->nid != NUMA_NO_NODE)
+			return &pool->caching[caching].orders[order];
+
 		if (pool->use_dma32)
 			return &global_dma32_uncached[order];
 
@@ -566,11 +572,17 @@ void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
 	pool->use_dma_alloc = use_dma_alloc;
 	pool->use_dma32 = use_dma32;
 
-	if (use_dma_alloc || nid != NUMA_NO_NODE) {
-		for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i)
-			for (j = 0; j < NR_PAGE_ORDERS; ++j)
-				ttm_pool_type_init(&pool->caching[i].orders[j],
-						   pool, i, j);
+	for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i) {
+		for (j = 0; j < NR_PAGE_ORDERS; ++j) {
+			struct ttm_pool_type *pt;
+
+			/* Initialize only pool types which are actually used */
+			pt = ttm_pool_select_type(pool, i, j);
+			if (pt != &pool->caching[i].orders[j])
+				continue;
+
+			ttm_pool_type_init(pt, pool, i, j);
+		}
 	}
 }
 EXPORT_SYMBOL(ttm_pool_init);
@@ -599,10 +611,16 @@ void ttm_pool_fini(struct ttm_pool *pool)
 {
 	unsigned int i, j;
 
-	if (pool->use_dma_alloc || pool->nid != NUMA_NO_NODE) {
-		for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i)
-			for (j = 0; j < NR_PAGE_ORDERS; ++j)
-				ttm_pool_type_fini(&pool->caching[i].orders[j]);
+	for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i) {
+		for (j = 0; j < NR_PAGE_ORDERS; ++j) {
+			struct ttm_pool_type *pt;
+
+			pt = ttm_pool_select_type(pool, i, j);
+			if (pt != &pool->caching[i].orders[j])
+				continue;
+
+			ttm_pool_type_fini(pt);
+		}
 	}
 
 	/* We removed the pool types from the LRU, but we need to also make sure
-- 
2.34.1

