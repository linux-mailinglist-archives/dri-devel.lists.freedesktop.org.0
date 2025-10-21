Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D55C0BF495B
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 06:20:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B675C10E099;
	Tue, 21 Oct 2025 04:20:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ag+zbiic";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CCFB10E099
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 04:20:47 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id
 41be03b00d2f7-b593def09e3so3423358a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 21:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761020447; x=1761625247; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SRLdP4GmC8TAaehpYwLWmY0fXaXzRogSZM1ApFlMens=;
 b=Ag+zbiic9WFm41n6QuQciFypxMcU/g4yOFEoXlFXE9uezjmb5BtCynsYkqaP02aUmN
 ToVsQjcPG1tFOwIH5tFrzGeTS+enLvWqBTCLg1Z3eUPP8gG+MvfD9r5SWrE/wdCmrKNY
 IgRbIVx8yza8oSheUW0cTk8JaHuUcbanncnndnpBPhEcvsZTZ50eoukTVaMdhJGhpXPV
 9Wv2FaqqhlKuKgSxztqVvlGG2XUuqWK2OQfHGWfV7Z3Ja21cXZYZznYsZjarasrFA5p5
 JSs8CUD6afuWEzST6JwkcsYzNvh0aJUfs8sgMJ8DndNiextjKmmQ1PSZmbUAQoDGEvL2
 DnWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761020447; x=1761625247;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SRLdP4GmC8TAaehpYwLWmY0fXaXzRogSZM1ApFlMens=;
 b=fpKTlIZLXMIc1TtKakAOhQxLNGA/7/8dbp8wK5VMscMYvuCBh9GuNkyQAxqezjBX9+
 D7SgKhAPnPJBqiK7H4MkvZXP5p7Z8JfUpzDQhszYH/QCwZe7aicRbwBW8qMQRAa+i9U0
 QBBSETHR9ZWHCqJ1zpYYuHE9ITY2M6UfjglU4BRmFU32e9Q73rkjp0qtUAMdslERWpGl
 G1kX3ov8itONZkWpG901bcs/aRp5D32rU0nwUq6UMK2u/oQ1hnTiVSRsuCUYbESTlYEO
 DwTfnHGHFwnCPlrdQfJqfQo4AjgRXW6cJya3iDz9srYMqQghUrkMxCQshNyY9DC7KZsR
 bZxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgeOOI8BHQudpF5iqWs/2tJrmSFcKl7GcCBSoW2SFxi4Jl44znTSdTRBw+DaZcgnTgR52qIYxivBU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxPxmGXkdpuyp9X3ctdSlsBgCBaC+C0q5ckAEv9vJUAH2j7aZPK
 2Y0E/ST9xjeSUx1xLCV6qg32EAwFNjWj4fXBM9sso4KRe31s3NpAg2XD
X-Gm-Gg: ASbGncsE96iZHJp+U5DUXf+jkLZTLEQxe7vJZnPhdOEFjK8LRzXyk4YQedJXjfDQlLZ
 y1ByLv8ZgtU845XtGsqROyEzrjO7lG4gg7VyVH+7uLn8DtX2vesD7wJTgrE6/HjgD98L3W6DQLF
 C0GqwsdI+bTJsEl9Bqo24nVbnDc8N/RsZcGIPW45t9dLRm5BCw7EB8hsPm6tiMumrt+kry2so/+
 lZGvCpz9wAFfJbcyxj5pEx7rSwmB1ktX5NixvSulSFF3ooOWiMh5IYsMyDL06GYYriztrG7fBdS
 9GCzSPrXEZjXDqe1HfhxsunyHkw33XUlk5UNrBDxXleGQZDN6NZYSq54iZzPpXGV3+I0M9EEm2I
 kQMvgQSBY7rnS7GbFFVPvz+hiKcZhgCWRC1hQJ9XjAuUfKM9UEeLaJBk0K6wDPdYu3aa4JPWd6U
 zvvw2l0096v1tW2rWxnFixtHfUx0HHCPJkEJLh0OgY52I=
X-Google-Smtp-Source: AGHT+IGuMYHt7WIQD1fK0EiihxrlnrbJ5cDcN1SmyPvVx87IncetjCE6sVwVUYILV4vleroj1LiXDQ==
X-Received: by 2002:a17:902:ce12:b0:27e:ec72:f62 with SMTP id
 d9443c01a7336-290c9c89b06mr180684945ad.6.1761020446906; 
 Mon, 20 Oct 2025 21:20:46 -0700 (PDT)
Received: from Barrys-MBP.hub ([47.72.128.212])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-292471fde15sm96162725ad.84.2025.10.20.21.20.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Oct 2025 21:20:46 -0700 (PDT)
From: Barry Song <21cnbao@gmail.com>
To: linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, sumit.semwal@linaro.org
Cc: 21cnbao@gmail.com, Brian.Starkey@arm.com, benjamin.gaignard@collabora.com,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 jstultz@google.com, tjmercier@google.com, v-songbaohua@oppo.com,
 zhengtangquan@oppo.com
Subject: [PATCH v2] dma-buf: system_heap: use larger contiguous mappings
 instead of per-page mmap
Date: Tue, 21 Oct 2025 17:20:22 +1300
Message-Id: <20251021042022.47919-1-21cnbao@gmail.com>
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
      struct dma_heap_allocation_data d =
            { .len = SIZE, .fd_flags = O_RDWR|O_CLOEXEC };
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

      long ns = (t1.tv_sec-t0.tv_sec)*1000000000L +
                (t1.tv_nsec-t0.tv_nsec);
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
Acked-by: John Stultz <jstultz@google.com>
---
 -v2: collect John's ack. thanks!

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

