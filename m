Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F392D1B680
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 22:33:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDF0B10E54C;
	Tue, 13 Jan 2026 21:33:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="HnFJOPDy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84E0010E54C
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 21:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1768340000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ix94cAHm6joBtNxj2zTeHiWa8RvsRVDwgdWzBk5YVco=;
 b=HnFJOPDyL76Hj+Np1PzN+ymyR6LcG34/wl4los9fa51VFUx8Y32qERAcsLZCrcH4Ts2+Xq
 qjh4ct9dxg9uYQNPNncWRiH4oEdkllp4iyxulptv4OWQMOJDUCvxmtWJ5PRCzY18v0jhJz
 XU2pa0pM4Iioyt+DTQ8Wx4i4OyNoFVw=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-34-txCEKvr6PQegJz9aWCN1Xg-1; Tue, 13 Jan 2026 16:33:19 -0500
X-MC-Unique: txCEKvr6PQegJz9aWCN1Xg-1
X-Mimecast-MFC-AGG-ID: txCEKvr6PQegJz9aWCN1Xg_1768339999
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8c52f07fbd0so119901085a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 13:33:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768339999; x=1768944799;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Ix94cAHm6joBtNxj2zTeHiWa8RvsRVDwgdWzBk5YVco=;
 b=XVWsmj+UiD22Nu7T6y9tJD7Fl2xqpQ1napVsmeKfSv3sQ2zMxwgR1ffCfpfFQMhqfd
 bhw6rETV8dW/5iMbAHv4egCTcE+RGzC8kdMkj/iyffsu5BTBfZXI0uBHx8iH4OtiADyQ
 BCymzPAUIde3FRgBnCLxzcqj/ZVGq4FC4eVW323LLcAIk3x9YQaHbk/Vm1iktp4p0+P9
 m1+YPgRjsVDJ5wRfVPohoD/3kOOYN7J1cWNmBDFKumEXhqdm1dn6Cc9d6vaegbXZt3Zj
 owqn2WXv8u15y9ryAXoYyIrrgYNVwY5/P4nq76NrnezR7n5da7yBuYM8WHiCr9XOJTGb
 Vk1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUK/Dk065wx/q96ChhBWN33dU1f5MrpSv0e4/88GPdmPrX68kAe17SpEnihQiPVsnX0biyFnsnm64Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx9cYUcQRqpfY3hGaglh/jvkctQ2JgLmaMK06ua6d/2SXjQRqMN
 V/NKSAkburFt8HKOPj73U++2eZiksvUNEreUQEpu+/5sc/6ig4MFrHbRQgLWRMavwyMIZ0f08f2
 mKoQ4flYGhJnmZsgtvUXiTATm17iMOXDUeeRh5DBP99EjD+aXl7sxxIdSp/rNGOBTuTZQOA==
X-Gm-Gg: AY/fxX6WdIpwGzFnDuQ9kJRBHtX/rtrLcNGO8sLxYSAYLVI0uWDIf/BZZctZVPqGVdO
 tm685UCpGmwX4ZIDvcFNIpUMxtQTeGm6yDSt3eO/6GDPesMYpXMDMOS4ylMAHUCusaC7uW1jToQ
 0Xm3KLqdk0m8pZkrsAAjJijVbML+eFGtQCiAkcAXdc4pUu/QxYm00yXfKxL+/gdGfnSgpYLpJzt
 +uS62cXgV/yuJUHwO1x6GDJ4p0EX6f6PNM72uioCiuDwHbDwZ71b4+bHDQVbYeRl9CY4ctfwipu
 wQltpH35F535R0f5grVYqA60DvD7Ww2CbYU+LGsGjJ+15foAc1kZuacGlTQCIHmvfRSmshdkjs4
 1GGSmh9uD/8JNBZGoPJ/Z52v7ggmcJJMi6cJX9Q09AgsmEXGMrWo=
X-Received: by 2002:a05:620a:1a1b:b0:8b2:77aa:73d3 with SMTP id
 af79cd13be357-8c52fb37f7cmr83797185a.2.1768339998755; 
 Tue, 13 Jan 2026 13:33:18 -0800 (PST)
X-Received: by 2002:a05:620a:1a1b:b0:8b2:77aa:73d3 with SMTP id
 af79cd13be357-8c52fb37f7cmr83793585a.2.1768339998302; 
 Tue, 13 Jan 2026 13:33:18 -0800 (PST)
Received: from localhost (pool-100-17-20-16.bstnma.fios.verizon.net.
 [100.17.20.16]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8907726041fsm172437926d6.45.2026.01.13.13.33.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 13:33:17 -0800 (PST)
From: Eric Chanudet <echanude@redhat.com>
Date: Tue, 13 Jan 2026 16:32:45 -0500
Subject: [PATCH v2 2/2] dma-buf: system_heap: account for system heap
 allocation in memcg
MIME-Version: 1.0
Message-Id: <20260113-dmabuf-heap-system-memcg-v2-2-e85722cc2f24@redhat.com>
References: <20260113-dmabuf-heap-system-memcg-v2-0-e85722cc2f24@redhat.com>
In-Reply-To: <20260113-dmabuf-heap-system-memcg-v2-0-e85722cc2f24@redhat.com>
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Maxime Ripard <mripard@redhat.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 Eric Chanudet <echanude@redhat.com>
X-Mailer: b4 0.14.2
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6nLVSdFio5_LDPfd4jHBg9CB62-0vSDQysbqclGhgWY_1768339999
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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

The system dma-buf heap lets userspace allocate buffers from the page
allocator. However, these allocations are not accounted for in memcg,
allowing processes to escape limits that may be configured.

Pass __GFP_ACCOUNT for system heap allocations, based on the
dma_heap.mem_accounting parameter, to use memcg and account for them.

Signed-off-by: Eric Chanudet <echanude@redhat.com>
---
 drivers/dma-buf/heaps/system_heap.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index 4c782fe33fd497a74eb5065797259576f9b651b6..139b50df64ed4c4a6fdd69f25fe48324fbe2c481 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -52,6 +52,8 @@ static gfp_t order_flags[] = {HIGH_ORDER_GFP, HIGH_ORDER_GFP, LOW_ORDER_GFP};
 static const unsigned int orders[] = {8, 4, 0};
 #define NUM_ORDERS ARRAY_SIZE(orders)
 
+extern bool mem_accounting;
+
 static int dup_sg_table(struct sg_table *from, struct sg_table *to)
 {
 	struct scatterlist *sg, *new_sg;
@@ -320,14 +322,17 @@ static struct page *alloc_largest_available(unsigned long size,
 {
 	struct page *page;
 	int i;
+	gfp_t flags;
 
 	for (i = 0; i < NUM_ORDERS; i++) {
 		if (size <  (PAGE_SIZE << orders[i]))
 			continue;
 		if (max_order < orders[i])
 			continue;
-
-		page = alloc_pages(order_flags[i], orders[i]);
+		flags = order_flags[i];
+		if (mem_accounting)
+			flags |= __GFP_ACCOUNT;
+		page = alloc_pages(flags, orders[i]);
 		if (!page)
 			continue;
 		return page;

-- 
2.52.0

