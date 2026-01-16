Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E005D3867A
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 21:06:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19C4B10E922;
	Fri, 16 Jan 2026 20:06:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="aiZHUF2P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA44810E922
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 20:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1768593999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PAII7mTGSKHnVbVtbYqYnUY14STvK0vS9h+9Pl6qxlo=;
 b=aiZHUF2PFCXEbYNq+u/uKbwSE8ujPlYuodUy8Hs9+XgpGo55CpeZDzYYxjxZhtA58Xf5cf
 i6hLunR00AFLSPmGyxJ0FzvqVM+NMlPD4hST7b0+Ru6jv0Ax8kCg4pt/4z3jGF5ijXKgNm
 JnB2+vlT8ztPfbb8djUwduWzfX4ezQM=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-522-PxHUdz7_NNeJcBKAF8M0gA-1; Fri, 16 Jan 2026 15:06:38 -0500
X-MC-Unique: PxHUdz7_NNeJcBKAF8M0gA-1
X-Mimecast-MFC-AGG-ID: PxHUdz7_NNeJcBKAF8M0gA_1768593998
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-5029b0c3786so67326551cf.3
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 12:06:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768593998; x=1769198798;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=PAII7mTGSKHnVbVtbYqYnUY14STvK0vS9h+9Pl6qxlo=;
 b=QSq9VkRuHftx6fjleeGUVhukkG+fgK3hKeR0+jo1+HTAhbdr7rFKtBqhHExk65VFcQ
 1+cWj+//nK7f75Gb71PoM9NC8XhdePOHgTPqCrudTvQu3TuyhQNhRLPpPm8/xpF/E5mE
 oe0J9PURV6km2+roRMzipCOHHpq5fRDWQY8txHjJQomF8hEYb94ebHFgvOUG2axQ79SN
 SXMbxeUC5uvJLQy7mSCkri4ctsSgDyApqfcILYbByXtr3e5JorpgfkEw6Uzs8Vd0KCuV
 vW/RU2S5V7aoNRGg4yIhd+ao6El0N3KdOXycugTtRlQNpmSfOMqoV8EunMnHpHY0SaLi
 BDFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+xwNHBcP0rIDIGt+oq14e8jwqg3CvVBRk23U6UKRwdzzhiErZoqlrJjzpcoMVZJt6skq/WpzHudA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwKephpJ+AxI+8PCfEfpiorAxEw4V5RsIXe8Ru5HYphfxG+SBD6
 ba0gDB1cjOqrMJ3w/j1NH1Pgyo09usiWmHCdzLCINWUgAtYFsyLaVfmVlgxsGFwmJjojb2mz1g+
 zjBPWbxmikbFPbc7w2xIycmSdiU1foLuU7Tdc816h1iY7211OfTPodw3d08HcPB1CrX5WeQ==
X-Gm-Gg: AY/fxX7y4ydXNyV3B3n55mcbXNb/pV3wcUHK7/F/XkLfohzwtGhnC1v1Atb71pB5eTu
 wxRUDWViqAaOn09yRyevewy8OeDKqN62d/YZmJKKdWgXNyWm2PDT93vghMsizZ/zRJotJx+jikp
 Fxf1oGgP4tvqzVMD10Ic8kIv2O+TQs5kqTpccDxqyMMGPe6HJKAYoo4IELVeHjkHW2kmXFPecYH
 RmWptNi5Rs7uc+LfrJdRiIMpCJFO8r8sBglGZ3aVR30po6uTHvwYXkBI47OH3pujmqk8hryd/x0
 35VAgk9SypwrNd5KZShOpWummWZaR5iez2AHWz6U4+wjn6dJOwztEqTtSQhXStu6UzuzgL6CfQ8
 xo3/cFFI7s/LQK6Ed/1G/0BixsExQ9p5CO8/1FWNnKNbnKFJWTb0=
X-Received: by 2002:ac8:588f:0:b0:4f3:5816:bd8d with SMTP id
 d75a77b69052e-502a179ca4fmr63770341cf.62.1768593997954; 
 Fri, 16 Jan 2026 12:06:37 -0800 (PST)
X-Received: by 2002:ac8:588f:0:b0:4f3:5816:bd8d with SMTP id
 d75a77b69052e-502a179ca4fmr63769841cf.62.1768593997449; 
 Fri, 16 Jan 2026 12:06:37 -0800 (PST)
Received: from localhost (pool-100-17-20-16.bstnma.fios.verizon.net.
 [100.17.20.16]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-502a1efb0b2sm28738281cf.29.2026.01.16.12.06.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jan 2026 12:06:35 -0800 (PST)
From: Eric Chanudet <echanude@redhat.com>
Date: Fri, 16 Jan 2026 15:05:39 -0500
Subject: [PATCH v3 2/2] dma-buf: system_heap: account for system heap
 allocation in memcg
MIME-Version: 1.0
Message-Id: <20260116-dmabuf-heap-system-memcg-v3-2-ecc6b62cc446@redhat.com>
References: <20260116-dmabuf-heap-system-memcg-v3-0-ecc6b62cc446@redhat.com>
In-Reply-To: <20260116-dmabuf-heap-system-memcg-v3-0-ecc6b62cc446@redhat.com>
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
X-Mimecast-MFC-PROC-ID: pkjUvvATxObZd9Vr5xpl2QrvyJcm0M9Kk2u5VoLibbc_1768593998
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
 drivers/dma-buf/heaps/system_heap.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index 4c782fe33fd497a74eb5065797259576f9b651b6..4049d042afa14ec2f4d034f59f1740600a20c1e5 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -320,14 +320,17 @@ static struct page *alloc_largest_available(unsigned long size,
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

