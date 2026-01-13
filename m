Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF5CD19D50
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 16:21:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 310C410E501;
	Tue, 13 Jan 2026 15:21:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ly0psp9p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AEE010E4FA
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 15:21:35 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4775895d69cso38467485e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 07:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768317694; x=1768922494; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5Hce5C1nspfSp6lJoBmBcpKxG2pvG1GeGisuj2PvlXY=;
 b=Ly0psp9pRT/+A7YXkiu26qkYqSPJazmXK+tnXC9yBaiVnnw9mzgJL0y7bV5fuohgfw
 FbFBjjpcJktOsRTENv6dH3thn3YCzLTtWAUPBllddASrrY9gXXWA71Xft+M6ZxcpYJwU
 b87UNya85jdIiylN/nziKkw03NYSjn/Boy6n/3iS7pG8f0So3iqzQT38BzLsgpfgbhsZ
 DNrZ479savF1NxCM7bRB3aKFbnVkULDJopbdvnMEyhvAR3oWmZevuP+0eYG0dWHMXLAd
 1t6Oc47LW/LyXGhRoRESgeuc02G12150ldn4dlcv9YeOwew4+pPYpagMmmB1J3SBIIza
 axxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768317694; x=1768922494;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5Hce5C1nspfSp6lJoBmBcpKxG2pvG1GeGisuj2PvlXY=;
 b=D38dZWJ+ayPmxKRqina6IAsgfyQqNwqjtnAK236YMzCgS+U+yIKBsZ/6VSOdpXc8ye
 Z9o3mhTh7yN0hoNIEr8nLBWvX9ChzFw+GyZeE1hOp3loJasklWgl/V1T0LObUjJYLpj7
 GX+ZHmHMVhOkoowjwIBSan0n0h5maNXbhsnjam3vaGrwld39VXZ3Y294DZ8YSlcX/Oow
 eLXXEvB/PTRRAhHtH+3VeC8xk+St4rK/Y4w9p3ASXy5jgyIKGf4zg16O9kCdn/18gVfX
 rv0MnuhFUpfLaRuUPv1wZVosUIWx/h8kHDr6kIyfQ8Pdjd8boxoKSyK4zY83C0CjcMxv
 eNVw==
X-Gm-Message-State: AOJu0YzSupjTy7NzWIbSdWdFv+AZQxzZ2yZokEPv7CC0eWEh4dM7ctWG
 Ns7LCJhlPO/0zdo3YMo1f6TlQKQIMm8XWMVOyC4rmyaTCUAAy5YPDTOqu1stR4H+LXf0qg==
X-Gm-Gg: AY/fxX7LayIVF5zj3JZNEuHqMH/MxkMyEtN7q5j/f2gOuxKhT1OI1xVeHZl5VjCk3wX
 GMmZVZGJTlMS080x9KQj5ydBmvkwnwYAkfL/Um7YUp4FHFRVfD1+PXeH68dgbiXeLiBGNm/jGhB
 OYk7A4/03O9S8LkhnrcvI3m74C7Gu4QVlEwciMdSHuxb5O5SGcfNT5pU3C5yXUcHFAAEZvexExW
 loAaX8Rf1o61C2RAh3fXVi1Vv/kjk7o2cIeTqCAbmaystL1MMuAGVib1BkKlS93bu79FGt+kmoU
 lYqH8Tcc+w5ikE9ICRDE9QAfTdjfib3Jn7uYugNO8lETLcT6C2Db5idZ0z0B7wXW58IV0nVrBfl
 /+LuhVOxk6JTCK5N3x13H9u4ZEaCrtSfN7WtsUAFggACg2tp4RyEtViJ0updwx4JirqguKVNpdw
 XNiMyjTi/tU8lda/hmophfB+4=
X-Google-Smtp-Source: AGHT+IFNhxXTot9t1LrGSBJyT0aOraYgKRGpbDgTjokjGboiYf0YJbhZKNvkLegAfErabndXF8MfOA==
X-Received: by 2002:a05:600c:630f:b0:477:7658:572a with SMTP id
 5b1f17b1804b1-47d84b3b606mr210995195e9.20.1768317693960; 
 Tue, 13 Jan 2026 07:21:33 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:141c:9800:1651:dfa:9e48:25d5])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47ecf6a5466sm129518405e9.11.2026.01.13.07.21.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 07:21:33 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, tursulin@ursulin.net, matthew.brost@intel.com,
 sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 07/10] dma-buf: use inline lock for the stub fence v2
Date: Tue, 13 Jan 2026 16:16:14 +0100
Message-ID: <20260113152125.47380-8-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260113152125.47380-1-christian.koenig@amd.com>
References: <20260113152125.47380-1-christian.koenig@amd.com>
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

Using the inline lock is now the recommended way for dma_fence implementations.

So use this approach for the framework's internal fences as well.

Also saves about 4 bytes for the external spinlock.

v2: drop unecessary changes

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/dma-buf/dma-fence.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index b3c1fb990621..d1a9a1cdd64b 100644
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

