Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC30B3D044
	for <lists+dri-devel@lfdr.de>; Sun, 31 Aug 2025 01:59:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05B2B10E290;
	Sat, 30 Aug 2025 23:58:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QzroMwDy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F5E710E290
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Aug 2025 23:58:49 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-248a61a27acso23395355ad.1
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Aug 2025 16:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756598328; x=1757203128; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PveN7MRoWDfCIrihbZGiJf7FxtVFx+3ubpFWOv24Cwk=;
 b=QzroMwDyPHBrcXpVsghnx7+iOmI0wV5LMU9+VU8kP705eN8l7SsWXLpX/p64mim4Ho
 zGn1aZUszXGUWiXiqUBkhnBeizLoKnv2usdEV2/HE67nkldl5watNq2aNpMce+LKtiFU
 /zoKlBU5R9lxY8Zfb0pO8PM4pW9jfoVLvgSvCFdt5JBCK7ERAIhIleH8O9lMkB/UtGDt
 x2MjqJOEm1NSxf9IAEUrNO0wQxC1gtbowDhoAagRmJmge/RSNGM1P7y2onmeSn4+WqmL
 P+/WcjzWiHEV3uJLMpIvmy7tkV/BIMgcbA3le6ouqpXas/yeu4cjzK+rYqua06UATq6D
 9FeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756598328; x=1757203128;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PveN7MRoWDfCIrihbZGiJf7FxtVFx+3ubpFWOv24Cwk=;
 b=sao8OJ9/eB7uo6JsUcbt0a/MEqNeOvLFKpjUb3Knj4iVoyQVr7tlGI8R2eVkhyaTgj
 IIuqD5Bndy6jOnC7zHjPNUzrs7NOKtcdqmn/MGQympM0XUopl4zfwimyhxrKBUMF6tAj
 RDqf1iH+3pTzQF14lwdvQLhcXeKxdX5hueY9N2Oww93ZrpUuHEPjLBWsPAoY4iEJQiA6
 DJieBu4Bx+5upA3wSygOl/KTEorTRqvEgTlakkfv6YJutMzOd7w4MDH4eBwXeiNiJBE5
 cDXOUeH7N4puR7naK3kR1RU6EYMp5O/bwTDWtpYkxpPjO1QbE5M66izG8h+ZBzjSU3yl
 0j/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNZ2TKyGXbc3s+LKRE0WRyJS5s+KnE73wY8NYczmlqBs1SPQcIqQI9yV3pMgrvwCWCpeD1wvWuTPI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxDQqot8YyApmFbKZJR/U33VKvDQ7yWdzIH4fChDKjx9pHYBtI7
 dPOX2bv2Xx3ldnWOPYR6WCVwA+dw6kVYvUbutNWYymB5eH++4Bfc72uj
X-Gm-Gg: ASbGncuseDZiu2LtUH+IbBABgub9zYiDdoj8KOaAwqw9MfujDjyHZvU/sx/nyNSdtjm
 EYGeMVLjnSXFMzIJRCmPK5s7lvU4L6znp9GncZkDWvaWKIMD4Ax/UAmWh8zrhcDO22LynPUfDa9
 EHRY6q/gZ7zU6brRKAJ/w0FvuJjVboQzufGLR0rqpRlfhvgkPb54BWIYGG/iuFM+041Tkfzzr2G
 QX5KhByiKRM6xkf+9O6s5fp+3Oe8ehxDAHQMRWf/oSkQt/EAiA5/X8O9ILbeCZzTc9kudvB1sca
 m7oygM9e49f0TJXjN9lSEljYDnIBwPj2ZBkZOMVj9/isV8CTwzNChIkvnubGOpMYsqhVDXrPgUS
 CCLF3EkVCrgbpsJc8JidsNeZywpQhbJLhGN/ZSA==
X-Google-Smtp-Source: AGHT+IHINaZd/OyqfQwD/ES7Eu7hfLJbxybfyzvV1FKp2OpH/dlzkxedX09+klQq8xVKQb/pnGM99g==
X-Received: by 2002:a17:902:e5cf:b0:248:fbba:964b with SMTP id
 d9443c01a7336-2493ee5428amr53871855ad.12.1756598328515; 
 Sat, 30 Aug 2025 16:58:48 -0700 (PDT)
Received: from Barrys-MBP.hub ([47.72.128.212])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b4cd28ae414sm5618654a12.33.2025.08.30.16.58.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 30 Aug 2025 16:58:48 -0700 (PDT)
From: Barry Song <21cnbao@gmail.com>
To: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 zhengtangquan@oppo.com, Barry Song <v-songbaohua@oppo.com>
Subject: [PATCH] dma-buf: system_heap: use larger contiguous mappings instead
 of per-page mmap
Date: Sun, 31 Aug 2025 07:58:38 +0800
Message-Id: <20250830235838.58067-1-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
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

From: Barry Song <v-songbaohua@oppo.com>

We can allocate high-order pages, but mapping them one by
one is inefficient. This patch changes the code to map
as large a chunk as possible. The code looks somewhat
complicated mainly because supporting mmap with a
non-zero offset is a bit tricky.

Using the micro-benchmark below, we see that mmap becomes
3.5X faster:

  #include <stdio.h>
  #include <fcntl.h>
  #include <linux/dma-heap.h>
  #include <sys/ioctl.h>
  #include <sys/mman.h>
  #include <time.h>
  #include <unistd.h>
  #include <stdlib.h>

  #define SIZE   (512UL * 1024 * 1024)
  #define PAGE   4096
  #define STRIDE (PAGE/sizeof(int))
  #define PAGES  (SIZE/PAGE)

  int main(void) {
      int heap = open("/dev/dma_heap/system", O_RDONLY);
      struct dma_heap_allocation_data d = { .len = SIZE, .fd_flags = O_RDWR|O_CLOEXEC };
      ioctl(heap, DMA_HEAP_IOCTL_ALLOC, &d);

      struct timespec t0, t1;
      clock_gettime(CLOCK_MONOTONIC, &t0);
      int *p = mmap(NULL, SIZE, PROT_READ|PROT_WRITE, MAP_SHARED, d.fd, 0);
      clock_gettime(CLOCK_MONOTONIC, &t1);

      for (int i = 0; i < PAGES; i++) p[i*STRIDE] = i;
      for (int i = 0; i < PAGES; i++)
          if (p[i*STRIDE] != i) {
              fprintf(stderr, "mismatch at page %d\n", i);
              exit(1);
          }

      long ns = (t1.tv_sec-t0.tv_sec)*1000000000L + (t1.tv_nsec-t0.tv_nsec);
      printf("mmap 512MB took %.3f us, verify OK\n", ns/1000.0);
      return 0;
  }

W/ patch:

~ # ./a.out
mmap 512MB took 200266.000 us, verify OK
~ # ./a.out
mmap 512MB took 198151.000 us, verify OK
~ # ./a.out
mmap 512MB took 197069.000 us, verify OK
~ # ./a.out
mmap 512MB took 196781.000 us, verify OK
~ # ./a.out
mmap 512MB took 198102.000 us, verify OK
~ # ./a.out
mmap 512MB took 195552.000 us, verify OK

W/o patch:

~ # ./a.out
mmap 512MB took 6987470.000 us, verify OK
~ # ./a.out
mmap 512MB took 6970739.000 us, verify OK
~ # ./a.out
mmap 512MB took 6984383.000 us, verify OK
~ # ./a.out
mmap 512MB took 6971311.000 us, verify OK
~ # ./a.out
mmap 512MB took 6991680.000 us, verify OK

Signed-off-by: Barry Song <v-songbaohua@oppo.com>
---
 drivers/dma-buf/heaps/system_heap.c | 33 +++++++++++++++++++++--------
 1 file changed, 24 insertions(+), 9 deletions(-)

diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index bbe7881f1360..4c782fe33fd4 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -186,20 +186,35 @@ static int system_heap_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
 	struct system_heap_buffer *buffer = dmabuf->priv;
 	struct sg_table *table = &buffer->sg_table;
 	unsigned long addr = vma->vm_start;
-	struct sg_page_iter piter;
-	int ret;
+	unsigned long pgoff = vma->vm_pgoff;
+	struct scatterlist *sg;
+	int i, ret;
+
+	for_each_sgtable_sg(table, sg, i) {
+		unsigned long n = sg->length >> PAGE_SHIFT;
 
-	for_each_sgtable_page(table, &piter, vma->vm_pgoff) {
-		struct page *page = sg_page_iter_page(&piter);
+		if (pgoff < n)
+			break;
+		pgoff -= n;
+	}
+
+	for (; sg && addr < vma->vm_end; sg = sg_next(sg)) {
+		unsigned long n = (sg->length >> PAGE_SHIFT) - pgoff;
+		struct page *page = sg_page(sg) + pgoff;
+		unsigned long size = n << PAGE_SHIFT;
+
+		if (addr + size > vma->vm_end)
+			size = vma->vm_end - addr;
 
-		ret = remap_pfn_range(vma, addr, page_to_pfn(page), PAGE_SIZE,
-				      vma->vm_page_prot);
+		ret = remap_pfn_range(vma, addr, page_to_pfn(page),
+				size, vma->vm_page_prot);
 		if (ret)
 			return ret;
-		addr += PAGE_SIZE;
-		if (addr >= vma->vm_end)
-			return 0;
+
+		addr += size;
+		pgoff = 0;
 	}
+
 	return 0;
 }
 
-- 
2.39.3 (Apple Git-146)

