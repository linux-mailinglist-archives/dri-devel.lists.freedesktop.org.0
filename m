Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABE7B1AB83
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 01:43:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C52D110E5C4;
	Mon,  4 Aug 2025 23:43:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YZdVaVx4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C35BF10E36F
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Aug 2025 16:39:19 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-76bc61152d8so3797290b3a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Aug 2025 09:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754325559; x=1754930359; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cVPrmbkZ73iVJwd3+ZUBlBPewKbjKO3MTkVJSkmJKWA=;
 b=YZdVaVx4MU+xf7sEzyRgBjJzS0x3ON1n6r1aD8opZrAUYcuXwOgsJbiyP2MmGGHy1Z
 87weNgE8eU/6/QfOvM7mWCU9C6rn8m+pb+tXYJcTMnjayhuN0n1ChFNQ7xC408fSi409
 f/EqgDHVg1JpeunCMn1pRGtCEYIS8HjAyfPfMZJcJbmXH/mFWQFoYaukBBksWC65CL3Y
 tlXbF83AMsLlOyvVSnEaneI784XHGMKvruheDBt514sNznhIk9P81WrbQQ8A1og86BU3
 xoMQw60614aLAs93COq9WsfM7Svyg6WP0RxSTbFc9LGQgrsI+Z0MPb4rtWi0368l962u
 r2FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754325559; x=1754930359;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cVPrmbkZ73iVJwd3+ZUBlBPewKbjKO3MTkVJSkmJKWA=;
 b=p8NmaPDY/TirqgQJP45ErhYhKaub/2b+TIbRPiCQyCS9NGy5GGjq9J2/M57bNWPKu7
 1GsemUS1XuF6ixB/Ou95dltBr5WSCpoyYEux4gn9yrqqHNah1JUb+q6alrqjw8yglzHe
 KGV5J8nHfesTUPPCn4GiJRh2Xc6jlBdtaEJ+KY89bLQPvBcssdJNLc9bOE2qNTAoFXYX
 te8QLC5baB0aDMzEHNnF9GiinQdyZOPhB76KrFjEBe4oMmhGD5NJLwkaVGe9y9AwERm9
 c/hkJhliPJnbTPVwAIMoltw2xTMNdSvXzY1xUohXEIt5Y444rXj4pxIE9XmZRW7H7r/k
 uBrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvQHJRXT+erjVlLR3qVukoN//QnRSKTof7+nrPRMLj3ZMLw0Z0AHFIgtjQr06SxB68/Z8aTLVrvKQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwJgLynXUm4NPvGnowdeauvckmQu8m5Mc/WpUoIxo5mz5yk5i4+
 DYdc4wBNdM5sk4+aQTF7TBa6q3ruwT430nO/Ckf4IpxhLI0tLXzmF+1oLng+pZaBWXo=
X-Gm-Gg: ASbGncujvQdNxgJQgBQE0nO+Q9Xw87RmpAn28w4S45kPsUJXV1jUVbq46Og/hJZATtE
 WXWnEaLEEVVklQXkYQ1C0By2XrzW//PngTVi8EtGsk7eHPuzAoXAWpOusBheO6zK0fceyUcparZ
 dLKHUCT+rIFR84AyQdHhv79wIBpxxpcyqsJB1gL5BxubnlRe/EfavmhYBnuIPnhFA6kJNXGZkvb
 4uFNSFLNXw9hVnPXKC7zSrhPsvwETU6k3KOp8aSya66ar3SjJmB5MOd8KLl6u7jXv37I+bf/e9U
 icvMOanFf0lzjifxw2V89aeD4NJozfb4j46Wdjljw7i2koNKsK35T0dZylUxCk8zI7sucXYead7
 ZwCzUEmQgxcjvkg1dxNAJ6mMB9IFhFNYy
X-Google-Smtp-Source: AGHT+IFi79lN/2bT4m6O+DU+KDLEB7fni7m9KzcUQy4aTZNiqS5EEpJ8WsqlPli1870xPayfoD6Bqw==
X-Received: by 2002:a05:6a21:99a0:b0:240:aa7:ba66 with SMTP id
 adf61e73a8af0-2400aa7bb53mr5414989637.16.1754325559025; 
 Mon, 04 Aug 2025 09:39:19 -0700 (PDT)
Received: from avinash ([2406:8800:9014:d938:f647:9d6a:9509:bc41])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b422bb0a4b0sm9500306a12.59.2025.08.04.09.39.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Aug 2025 09:39:18 -0700 (PDT)
From: Abinash Singh <abinashsinghlalotra@gmail.com>
To: min.ma@amd.com,
	lizhi.hou@amd.com
Cc: ogabbay@kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Abinash Singh <abinashsinghlalotra@gmail.com>
Subject: [RFC PATCH] drivers/accel/amdxdna : refactor resource cleanup in
 aie2_{ctx, error} to use scope-based helpers
Date: Mon,  4 Aug 2025 22:09:46 +0530
Message-ID: <20250804163947.630568-1-abinashsinghlalotra@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 04 Aug 2025 23:43:20 +0000
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

This refactors the `aie2_error_async_events_alloc` function in `aie2_ctx.c`
And `aie2_hwctx_init` function in `aie2_error.c` to replace traditional
goto-based error handling with scope-based cleanup helpers.

No functional changes intended.

Signed-off-by: Abinash Singh <abinashsinghlalotra@gmail.com>
---
Hi ,
This patch will improve code quaility and will support
using cleanup helpers in future.

Reference : https://docs.kernel.org/core-api/cleanup.html
......
The “goto error” pattern is notorious for introducing subtle resource leaks.
It is tedious and error prone to add new resource acquisition constraints into 
code paths that already have several unwind conditions. The “cleanup” helpers 
enable the compiler to help with this tedium and can aid in maintaining
LIFO (last in first out) unwind ordering to avoid unintentional leaks.
...

I will look into other places where we can use this auto cleanup feature.
If you have any suggestion/feedback I will be happy hearing that.

Thank You!
Have a great day..!!
---
 drivers/accel/amdxdna/aie2_ctx.c   | 9 +++------
 drivers/accel/amdxdna/aie2_error.c | 9 +++------
 2 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
index e04549f64d69..b860859c643d 100644
--- a/drivers/accel/amdxdna/aie2_ctx.c
+++ b/drivers/accel/amdxdna/aie2_ctx.c
@@ -13,7 +13,7 @@
 #include <linux/types.h>
 #include <linux/xarray.h>
 #include <trace/events/amdxdna.h>
-
+#include <linux/cleanup.h>
 #include "aie2_msg_priv.h"
 #include "aie2_pci.h"
 #include "aie2_solver.h"
@@ -528,7 +528,7 @@ int aie2_hwctx_init(struct amdxdna_hwctx *hwctx)
 		.dev = xdna->ddev.dev,
 	};
 	struct drm_gpu_scheduler *sched;
-	struct amdxdna_hwctx_priv *priv;
+	struct amdxdna_hwctx_priv *priv __free(kfree) = NULL;
 	struct amdxdna_gem_obj *heap;
 	struct amdxdna_dev_hdl *ndev;
 	int i, ret;
@@ -543,8 +543,7 @@ int aie2_hwctx_init(struct amdxdna_hwctx *hwctx)
 	if (!heap) {
 		XDNA_ERR(xdna, "The client dev heap object not exist");
 		mutex_unlock(&client->mm_lock);
-		ret = -ENOENT;
-		goto free_priv;
+		return -ENOENT;
 	}
 	drm_gem_object_get(to_gobj(heap));
 	mutex_unlock(&client->mm_lock);
@@ -648,8 +647,6 @@ int aie2_hwctx_init(struct amdxdna_hwctx *hwctx)
 	amdxdna_gem_unpin(heap);
 put_heap:
 	drm_gem_object_put(to_gobj(heap));
-free_priv:
-	kfree(priv);
 	return ret;
 }
 
diff --git a/drivers/accel/amdxdna/aie2_error.c b/drivers/accel/amdxdna/aie2_error.c
index 5ee905632a39..bea36e7fe14f 100644
--- a/drivers/accel/amdxdna/aie2_error.c
+++ b/drivers/accel/amdxdna/aie2_error.c
@@ -10,7 +10,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/kthread.h>
 #include <linux/kernel.h>
-
+#include <linux/cleanup.h>
 #include "aie2_msg_priv.h"
 #include "aie2_pci.h"
 #include "amdxdna_mailbox.h"
@@ -308,7 +308,7 @@ int aie2_error_async_events_alloc(struct amdxdna_dev_hdl *ndev)
 	struct amdxdna_dev *xdna = ndev->xdna;
 	u32 total_col = ndev->total_col;
 	u32 total_size = ASYNC_BUF_SIZE * total_col;
-	struct async_events *events;
+	struct async_events *events __free(kfree) = NULL;
 	int i, ret;
 
 	events = kzalloc(struct_size(events, event, total_col), GFP_KERNEL);
@@ -318,8 +318,7 @@ int aie2_error_async_events_alloc(struct amdxdna_dev_hdl *ndev)
 	events->buf = dma_alloc_noncoherent(xdna->ddev.dev, total_size, &events->addr,
 					    DMA_FROM_DEVICE, GFP_KERNEL);
 	if (!events->buf) {
-		ret = -ENOMEM;
-		goto free_events;
+		return -ENOMEM;
 	}
 	events->size = total_size;
 	events->event_cnt = total_col;
@@ -352,7 +351,5 @@ int aie2_error_async_events_alloc(struct amdxdna_dev_hdl *ndev)
 free_buf:
 	dma_free_noncoherent(xdna->ddev.dev, events->size, events->buf,
 			     events->addr, DMA_FROM_DEVICE);
-free_events:
-	kfree(events);
 	return ret;
 }
-- 
2.50.1

