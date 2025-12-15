Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87436CBC907
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 06:31:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9089B10E129;
	Mon, 15 Dec 2025 05:31:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LGNTY2b2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C7F210E129
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 05:31:07 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-7aab061e7cbso3798012b3a.1
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Dec 2025 21:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765776667; x=1766381467; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uz3AkyAC19O+S8FUO5AbqCgspWmgP9i0gngDDNAJrGk=;
 b=LGNTY2b2pVJ3IaP5APqtVnY0Os662Ykz+OyohWGIcqwQ8Pyb8ext8SG3Ve4OR9Q2sB
 Xy+6/25z3XTiGEIvyJLNl/cuPEX2ahy9FU6oyKMwOW0a2WtNjlMTTx5D9LJD+YEDLOAj
 VcQerNq6PDYcpq7oGPR+fANO6ea/dNbftxVQ8Viy9deipDZqLVFXgv63CVQamQh2ub2R
 e1RRR784T8kPTxBbceXMmQXgtIyT2iztBy/7xXFa170TNP4iIWrJ8UA8w13W+nXwzHss
 bnzNWPxdWJcnlWGRtbzGAcLTn772UqMqWmU2ukKE1MkZZ0yBWSpHNFlYck1zsFsSrY9Y
 yPEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765776667; x=1766381467;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uz3AkyAC19O+S8FUO5AbqCgspWmgP9i0gngDDNAJrGk=;
 b=pDPPf4wH8vekNCDMrQ6mbSstaoqoEfP0hnVas+xhRP9Ya9GqxfmLukrwqs9kqlOpYF
 CAQgt5+SBRJkedYOnv0rtZExWrKfaZH5hIsM8uklX6K4UPphpGlYHLyKfX+mzPM6vHau
 3n0NH9x7E1XNsUbRIQOlgi5mhOUhC0asXJ8A4KkGZAwuTv4r0lIc+eGLn78lEir6iJrx
 aWOuOV8nyFOccpVuKXDlZ/BTdY12T9rnwo9ZCDaGLL6jIfNsemMhEDS+lrBF9PX+XI4Y
 eu1ivuuLlnbFnuqshJdW00ibOirHeRoLXcUYuQhFMNXRCq3o0fAcDrbhBhdyBhhaODyC
 65Og==
X-Gm-Message-State: AOJu0YxhG+blj0gzuL90/ybCUX3XV593Axvk1pB1iBGtwwSXIa0nlPO7
 1+1Uo/Cru9XDqAT3EjK8i5ALxrXxIvzKDyqPpUOz2w1ziv6p1dMn50IB
X-Gm-Gg: AY/fxX5FkUDLhTeFpzjeXaAMLyDltWPRrLm2atXizjl6TCQiSIJ4kZSMDyXJAbVBcM5
 lgjt1y3vK+QYSqtOySpjwfckZJ+boewrp51mqqR9Lya8R1MONzu6sHaTAT9mk4ubNupBMdOG+kT
 4GjaOFZf2oZGOsyVqjZ18l2bXbWXQecz26Tkj6qV3ma/6bueOQCPQa2VhyJ1qxxCeQpimegp24Z
 mWyhHu37gbl7cUhTmc5Q/J1489qZpP9ym9SEHmXwOotFnFFLepOvX7ADBwLmxlWVbd+KfOrnvVG
 qb4FKC2alsNlH7TlHIqhv3aQlGZOTnYz3mmr6koB8pYQncFDtpP71CSh08bVjAURhqqm/vZg6fx
 o0f99sb1znbZw4qQiE3dgcMkTeaiZF92IUYmiZYnUGVuuv4n8bvH2v+iv45yMs559uIWhejLWS/
 l3uGslm0kNIRzHIX6lbi98J3fzRg==
X-Google-Smtp-Source: AGHT+IHNaawrkiaB8tEzN2LJvPo55x1qDp7wzj9Mb1MNnfFeFzZwkDr8l2UABw6Bq3fG7Z2E49LeWQ==
X-Received: by 2002:a05:6a00:a381:b0:7e8:4433:8fa1 with SMTP id
 d2e1a72fcca58-7f6694aa660mr7586764b3a.41.1765776666944; 
 Sun, 14 Dec 2025 21:31:06 -0800 (PST)
Received: from Barrys-MBP.hub ([47.72.129.29])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7f4c509cb51sm11409151b3a.54.2025.12.14.21.31.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 14 Dec 2025 21:31:06 -0800 (PST)
From: Barry Song <21cnbao@gmail.com>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org
Cc: dri-devel@lists.freedesktop.org, jstultz@google.com,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>,
 David Hildenbrand <david@kernel.org>, Uladzislau Rezki <urezki@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Maxime Ripard <mripard@kernel.org>,
 Tangquan Zheng <zhengtangquan@oppo.com>
Subject: [PATCH] mm/vmalloc: map contiguous pages in batches for vmap()
 whenever possible
Date: Mon, 15 Dec 2025 13:30:50 +0800
Message-Id: <20251215053050.11599-1-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
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

From: Barry Song <v-songbaohua@oppo.com>

In many cases, the pages passed to vmap() may include high-order
pages allocated with __GFP_COMP flags. For example, the systemheap
often allocates pages in descending order: order 8, then 4, then 0.
Currently, vmap() iterates over every page individually—even pages
inside a high-order block are handled one by one.

This patch detects high-order pages and maps them as a single
contiguous block whenever possible.

An alternative would be to implement a new API, vmap_sg(), but that
change seems to be large in scope.

When vmapping a 128MB dma-buf using the systemheap, this patch
makes system_heap_do_vmap() roughly 17× faster.

W/ patch:
[   10.404769] system_heap_do_vmap took 2494000 ns
[   12.525921] system_heap_do_vmap took 2467008 ns
[   14.517348] system_heap_do_vmap took 2471008 ns
[   16.593406] system_heap_do_vmap took 2444000 ns
[   19.501341] system_heap_do_vmap took 2489008 ns

W/o patch:
[    7.413756] system_heap_do_vmap took 42626000 ns
[    9.425610] system_heap_do_vmap took 42500992 ns
[   11.810898] system_heap_do_vmap took 42215008 ns
[   14.336790] system_heap_do_vmap took 42134992 ns
[   16.373890] system_heap_do_vmap took 42750000 ns

Cc: David Hildenbrand <david@kernel.org>
Cc: Uladzislau Rezki <urezki@gmail.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: John Stultz <jstultz@google.com>
Cc: Maxime Ripard <mripard@kernel.org>
Tested-by: Tangquan Zheng <zhengtangquan@oppo.com>
Signed-off-by: Barry Song <v-songbaohua@oppo.com>
---
 * diff with rfc:
 Many code refinements based on David's suggestions, thanks!
 Refine comment and changelog according to Uladzislau, thanks!
 rfc link:
 https://lore.kernel.org/linux-mm/20251122090343.81243-1-21cnbao@gmail.com/

 mm/vmalloc.c | 45 +++++++++++++++++++++++++++++++++++++++------
 1 file changed, 39 insertions(+), 6 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 41dd01e8430c..8d577767a9e5 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -642,6 +642,29 @@ static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
 	return err;
 }
 
+static inline int get_vmap_batch_order(struct page **pages,
+		unsigned int stride, unsigned int max_steps, unsigned int idx)
+{
+	int nr_pages = 1;
+
+	/*
+	 * Currently, batching is only supported in vmap_pages_range
+	 * when page_shift == PAGE_SHIFT.
+	 */
+	if (stride != 1)
+		return 0;
+
+	nr_pages = compound_nr(pages[idx]);
+	if (nr_pages == 1)
+		return 0;
+	if (max_steps < nr_pages)
+		return 0;
+
+	if (num_pages_contiguous(&pages[idx], nr_pages) == nr_pages)
+		return compound_order(pages[idx]);
+	return 0;
+}
+
 /*
  * vmap_pages_range_noflush is similar to vmap_pages_range, but does not
  * flush caches.
@@ -655,23 +678,33 @@ int __vmap_pages_range_noflush(unsigned long addr, unsigned long end,
 		pgprot_t prot, struct page **pages, unsigned int page_shift)
 {
 	unsigned int i, nr = (end - addr) >> PAGE_SHIFT;
+	unsigned int stride;
 
 	WARN_ON(page_shift < PAGE_SHIFT);
 
+	/*
+	 * For vmap(), users may allocate pages from high orders down to
+	 * order 0, while always using PAGE_SHIFT as the page_shift.
+	 * We first check whether the initial page is a compound page. If so,
+	 * there may be an opportunity to batch multiple pages together.
+	 */
 	if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC) ||
-			page_shift == PAGE_SHIFT)
+			(page_shift == PAGE_SHIFT && !PageCompound(pages[0])))
 		return vmap_small_pages_range_noflush(addr, end, prot, pages);
 
-	for (i = 0; i < nr; i += 1U << (page_shift - PAGE_SHIFT)) {
-		int err;
+	stride = 1U << (page_shift - PAGE_SHIFT);
+	for (i = 0; i < nr; ) {
+		int err, order;
 
-		err = vmap_range_noflush(addr, addr + (1UL << page_shift),
+		order = get_vmap_batch_order(pages, stride, nr - i, i);
+		err = vmap_range_noflush(addr, addr + (1UL << (page_shift + order)),
 					page_to_phys(pages[i]), prot,
-					page_shift);
+					page_shift + order);
 		if (err)
 			return err;
 
-		addr += 1UL << page_shift;
+		addr += 1UL  << (page_shift + order);
+		i += 1U << (order + page_shift - PAGE_SHIFT);
 	}
 
 	return 0;
-- 
2.39.3 (Apple Git-146)

