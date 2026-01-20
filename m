Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C790D3C64E
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 11:57:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAE4C10E5BA;
	Tue, 20 Jan 2026 10:57:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AZf2sqos";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E522510E5B9
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 10:57:05 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-47ee301a06aso48868895e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 02:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768906624; x=1769511424; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9F/asdx1RdQozRmoP01CvN+7ATqZls8uzpmMzLjSGbc=;
 b=AZf2sqosH8CiiVIyRRD7icVX/VCsNAThNLCx6ImC1eQj80qSPOF1PErgTq6S1MDyL6
 +nHQn0rJ2kRDhrVJbWvB98X8feMA0b/4GZ8UNhK9ErDuu6nfsJwy+UyH5p3WeFr4kSlC
 bcLnpCVfC9H21xdmWKinVr4YRk9XOxf81UNXBVpEMAlSL59PGwM0sxkYptkdLSjb1nQh
 5M0L3DLCji9q+tXAavss1b9nZZKmhkTkpyMH/yaVPRJeBDFnjLHvcSnRJJpDHnc531db
 TgGpArKWx8Xbj8zSuS+GkC1beiAi9erw4cIZkbmoB19RJQHnEqffnz6wdHgeVi/c3KMK
 YJeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768906624; x=1769511424;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9F/asdx1RdQozRmoP01CvN+7ATqZls8uzpmMzLjSGbc=;
 b=sNAvd/dCRW93jgz32BDqd2A1IlKgDqfsA00Rq26svOMB+xGvOSjlpkBErCN0llEwRi
 nfvw0Di9jqNfPE20iqIMimN+3V0YaQvQGHdEEsfITfyavrfJ6B4lmUBm9snotawXuPfd
 BeQwogRyt/yx4CZhnK3jN7MhOdnKXA2fDMfsorZqOnmJxydwFUwTYFPHupbBBf1QpvDK
 REC0hiDwtsD1w8z+/otS1Jd010ezeXzOyVnTktZXeudaDXm6YTvy296DY2shyON8e9b6
 CfenjFfFCb3tb10KFkUdJY0Yjp5igox3Anvuo6ew3uxGqrqg3GaUtm/vvKMpCKtSb0hi
 9W2A==
X-Gm-Message-State: AOJu0YxwkmqsvSWa0eEWmRy93wl4w3rQ69RIb0W4eydXKJ+oAkAXxViC
 QnDn3MQtrVSX6Xe6xr8vGdg5zPCO2fHQcyrPVtGfE2RUR1qIVTAa1cF8
X-Gm-Gg: AY/fxX7hlIIqh/ST3EfmCUPvBL+WaDUF/N0XnxkJGA2IvcB81aV9DXClKbfuuwKH5Di
 3EhgcqjwzyIQ5hksArxB/gAErLSYCg2cP/W0lHgJD3KaBnqQ0UMn/cI7kI65FJAZpT3l1vKyMNN
 xX4hn/dvse2omXSxHpbhC+kk6PN12R4k4+dJZATiEsL8dryvsoPJXbH1Dx1oqAA1X3EO6+4zqsB
 NJ74EefX1S7QWDRNZGmQuZch6N+0B5qqE8p7UTmhOW5cO7x2btAQwoG4Gffkm7HUwWOcTpTzAU/
 A+1KCL2K0LCYXX4mGxC42Q6BGRBCO501bIbyqy1QZWB2+rN+pzOBTiftawMRDVFAtTeO3KMPTIX
 iUvVG/bUv9OMoU35FpdDbelWtzaTuTYej/ir6Skz8T4IADYksZtkwWMaE1h9zML0Ia1el1xXt4F
 D6954EPlkPa3c61Efe5C2Nri714adJLP7sZ4c=
X-Received: by 2002:a05:600c:1552:b0:47e:e946:3a72 with SMTP id
 5b1f17b1804b1-4801eb0e021mr177148745e9.27.1768906624397; 
 Tue, 20 Jan 2026 02:57:04 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:1563:d000:1067:f6c4:3bf8:ea8a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4801fe67780sm99418105e9.16.2026.01.20.02.57.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jan 2026 02:57:03 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, tursulin@ursulin.net, matthew.brost@intel.com,
 sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 7/9] dma-buf: use inline lock for the stub fence v2
Date: Tue, 20 Jan 2026 11:54:46 +0100
Message-ID: <20260120105655.7134-8-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120105655.7134-1-christian.koenig@amd.com>
References: <20260120105655.7134-1-christian.koenig@amd.com>
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

Using the inline lock is now the recommended way for dma_fence
implementations.

So use this approach for the framework's internal fences as well.

Also saves about 4 bytes for the external spinlock.

v2: drop unnecessary changes

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/dma-buf/dma-fence.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index 36ff0e5098ee..03a09acdeaec 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -24,7 +24,6 @@ EXPORT_TRACEPOINT_SYMBOL(dma_fence_emit);
 EXPORT_TRACEPOINT_SYMBOL(dma_fence_enable_signal);
 EXPORT_TRACEPOINT_SYMBOL(dma_fence_signaled);
 
-static DEFINE_SPINLOCK(dma_fence_stub_lock);
 static struct dma_fence dma_fence_stub;
 
 /*
@@ -123,12 +122,9 @@ static const struct dma_fence_ops dma_fence_stub_ops = {
 
 static int __init dma_fence_init_stub(void)
 {
-	dma_fence_init(&dma_fence_stub, &dma_fence_stub_ops,
-		       &dma_fence_stub_lock, 0, 0);
-
+	dma_fence_init(&dma_fence_stub, &dma_fence_stub_ops, NULL, 0, 0);
 	set_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
 		&dma_fence_stub.flags);
-
 	dma_fence_signal(&dma_fence_stub);
 	return 0;
 }
@@ -160,11 +156,7 @@ struct dma_fence *dma_fence_allocate_private_stub(ktime_t timestamp)
 	if (fence == NULL)
 		return NULL;
 
-	dma_fence_init(fence,
-		       &dma_fence_stub_ops,
-		       &dma_fence_stub_lock,
-		       0, 0);
-
+	dma_fence_init(fence, &dma_fence_stub_ops, NULL, 0, 0);
 	set_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
 		&fence->flags);
 
-- 
2.43.0

