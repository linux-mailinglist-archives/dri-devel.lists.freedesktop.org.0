Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A24F9C21E9
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2024 17:21:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F2CF10EA15;
	Fri,  8 Nov 2024 16:21:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="yJnx4mi1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com
 [209.85.128.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3B4910EA10
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2024 16:21:03 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id
 00721157ae682-6ea82a5480fso45675677b3.0
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Nov 2024 08:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1731082863; x=1731687663;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=AGA0UiFmqkm5IQcmVA3JJZcNgt8jjwXyqomK1aijshk=;
 b=yJnx4mi1RMWVsvKrcCsdCjRLwkM93OrCxvqpo1oICWB1Jax67+xjCEc7/PI5AfLWyf
 mjcvK5Q008cUs6qFOxsJYHx8HR7QsPF0Piq1ZRHNublLRCaSpdAJ7GhYqPzBOQOSgDfa
 GDfTxjtwRhWFa8vt2+EZmc7WJph2mlUl8Ak3mawlKHFgXZjH2wjuI47spTpFvZsxe9dT
 uGz1zCZLac97BR7Qn6YtaSUNzCZSpLUqHkrU0GeLc5a4oQKxmg37zI+upE9L0wyKMJyo
 2VVCpA/vMVKSoJJrG/wBZ4XuLdxRO3Vk9bhzXHdHEGYshFVUxxxD7WpmQ2nElUoY2X6h
 ngjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731082863; x=1731687663;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AGA0UiFmqkm5IQcmVA3JJZcNgt8jjwXyqomK1aijshk=;
 b=ehGA2B5ib27XSimU8798yA4s1wgw+fX6Bu4lYBShRp7zleBllv25VTh6sj8MT9b3IM
 f6R51GNmMU/Hs6ilzer9AFd7pN14j8mTFMzFG+fyNQMwzbmeuO5X81WTi+oodPVg8uB/
 q7bhmNj/rRM6EEB3ksvXzLT3uFshyJLjSOsfr0HDHopfb4SVYGfWU6Z1gpAhVOwlLtne
 sRiMulcpIa5BBnUkhIB23I8lf5dtas7svxcPmdRXTZeh5B84eI4+ORYVVgr/eQWynf3H
 SzdewdUl+yAjJl169XpEPRIKqLt2c1++mj8yYXWC4YJpSXS0KfkTqE5vhTJUWGO4+1U9
 vlnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXm9PYl8dwY/L9xdLRYKvPQr5ENtsMW+XHHOBABU9XsvAW1oO/6QwZD/8jAr6lN9Kb0R+qIweO5JtQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzJmWQkzsZtcWZmXqVHfb1My2kBrsP+CMvg92YMBBZT6ZSEjRE2
 VPKGJ4aEPfdbyh94L3jfCe42BLYDxrZOV5ItB5MjMlOmkUlgF8F55i+jWWXLB5JobFeD525nFw=
 =
X-Google-Smtp-Source: AGHT+IGtaX0Xx+3549jHaKW8S9KxdS0O7fbxqd21Fy1uVBwd66gZLlXyQvWaaGo3amHvs3pcci25pPLu+w==
X-Received: from fuad.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:1613])
 (user=tabba job=sendgmr) by 2002:a25:dc4a:0:b0:e25:5cb1:77d8 with
 SMTP id
 3f1490d57ef6-e337f8ed8bbmr2122276.6.1731082862962; Fri, 08 Nov 2024 08:21:02
 -0800 (PST)
Date: Fri,  8 Nov 2024 16:20:39 +0000
In-Reply-To: <20241108162040.159038-1-tabba@google.com>
Mime-Version: 1.0
References: <20241108162040.159038-1-tabba@google.com>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241108162040.159038-10-tabba@google.com>
Subject: [RFC PATCH v1 09/10] mm: Use owner_ops on folio_put for zone device
 pages
From: Fuad Tabba <tabba@google.com>
To: linux-mm@kvack.org
Cc: kvm@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, david@redhat.com, rppt@kernel.org, 
 jglisse@redhat.com, akpm@linux-foundation.org, muchun.song@linux.dev, 
 simona@ffwll.ch, airlied@gmail.com, pbonzini@redhat.com, seanjc@google.com, 
 willy@infradead.org, jgg@nvidia.com, jhubbard@nvidia.com, 
 ackerleytng@google.com, vannapurve@google.com, mail@maciej.szmigiero.name, 
 kirill.shutemov@linux.intel.com, quic_eberman@quicinc.com, maz@kernel.org, 
 will@kernel.org, qperret@google.com, keirf@google.com, roypat@amazon.co.uk, 
 tabba@google.com
Content-Type: text/plain; charset="UTF-8"
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

Now that we have the folio_owner_ops callback, use it for zone
device pages instead of using a dedicated callback.

Note that struct dev_pagemap (pgmap) in struct page is overlaid
with struct folio owner_ops. Therefore, make struct dev_pagemap
contain an instance of struct folio_owner_ops, to handle it the
same way as struct folio_owner_ops.

Also note that, although struct dev_pagemap_ops has a page_free()
function, it does not have the same intention as the
folio_owner_ops free() callback nor does it have the same
behavior. The page_free() function is used as an optional
callback to drivers that use zone device to inform them of the
freeing of the page.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 include/linux/memremap.h |  8 +++++++
 include/linux/mm_types.h | 16 ++++++++++++--
 mm/internal.h            |  1 -
 mm/memremap.c            | 44 --------------------------------------
 mm/mm_init.c             | 46 ++++++++++++++++++++++++++++++++++++++++
 mm/swap.c                | 18 ++--------------
 6 files changed, 70 insertions(+), 63 deletions(-)

diff --git a/include/linux/memremap.h b/include/linux/memremap.h
index 060e27b6aee0..5b68bbc588a3 100644
--- a/include/linux/memremap.h
+++ b/include/linux/memremap.h
@@ -106,6 +106,7 @@ struct dev_pagemap_ops {
 
 /**
  * struct dev_pagemap - metadata for ZONE_DEVICE mappings
+ * @folio_ops: method table for folio operations.
  * @altmap: pre-allocated/reserved memory for vmemmap allocations
  * @ref: reference count that pins the devm_memremap_pages() mapping
  * @done: completion for @ref
@@ -125,6 +126,7 @@ struct dev_pagemap_ops {
  * @ranges: array of ranges to be mapped when nr_range > 1
  */
 struct dev_pagemap {
+	struct folio_owner_ops folio_ops;
 	struct vmem_altmap altmap;
 	struct percpu_ref ref;
 	struct completion done;
@@ -140,6 +142,12 @@ struct dev_pagemap {
 	};
 };
 
+/*
+ * The folio_owner_ops structure needs to be first since pgmap in struct page is
+ * overlaid with owner_ops in struct folio.
+ */
+static_assert(offsetof(struct dev_pagemap, folio_ops) == 0);
+
 static inline bool pgmap_has_memory_failure(struct dev_pagemap *pgmap)
 {
 	return pgmap->ops && pgmap->ops->memory_failure;
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 27075ea24e67..a72fda20d5e9 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -427,6 +427,7 @@ FOLIO_MATCH(lru, lru);
 FOLIO_MATCH(mapping, mapping);
 FOLIO_MATCH(compound_head, lru);
 FOLIO_MATCH(compound_head, owner_ops);
+FOLIO_MATCH(pgmap, owner_ops);
 FOLIO_MATCH(index, index);
 FOLIO_MATCH(private, private);
 FOLIO_MATCH(_mapcount, _mapcount);
@@ -618,15 +619,26 @@ static inline const struct folio_owner_ops *folio_get_owner_ops(struct folio *fo
 
 /*
  * Get the page dev_pagemap pgmap pointer.
+ *
+ * The page pgmap is overlaid with the folio owner_ops, where bit 1 is used to
+ * indicate that the page/folio has owner ops. The dev_pagemap contains
+ * owner_ops and is handled the same way. The getter returns a sanitized
+ * pointer.
  */
-#define page_get_pgmap(page)	((page)->pgmap)
+#define page_get_pgmap(page)							\
+	((struct dev_pagemap *)((unsigned long)(page)->pgmap & ~FOLIO_OWNER_OPS))
 
 /*
  * Set the page dev_pagemap pgmap pointer.
+ *
+ * The page pgmap is overlaid with the folio owner_ops, where bit 1 is used to
+ * indicate that the page/folio has owner ops. The dev_pagemap contains
+ * owner_ops and is handled the same way. The setter sets bit 1 to indicate
+ * that the page owner_ops.
  */
 static inline void page_set_pgmap(struct page *page, struct dev_pagemap *pgmap)
 {
-	page->pgmap = pgmap;
+	page->pgmap = (struct dev_pagemap *)((unsigned long)pgmap | FOLIO_OWNER_OPS);
 }
 
 struct page_frag_cache {
diff --git a/mm/internal.h b/mm/internal.h
index 5a7302baeed7..a041247bed10 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -1262,7 +1262,6 @@ int numa_migrate_check(struct folio *folio, struct vm_fault *vmf,
 		      unsigned long addr, int *flags, bool writable,
 		      int *last_cpupid);
 
-void free_zone_device_folio(struct folio *folio);
 int migrate_device_coherent_folio(struct folio *folio);
 
 struct vm_struct *__get_vm_area_node(unsigned long size,
diff --git a/mm/memremap.c b/mm/memremap.c
index 931bc85da1df..9fd5f57219eb 100644
--- a/mm/memremap.c
+++ b/mm/memremap.c
@@ -456,50 +456,6 @@ struct dev_pagemap *get_dev_pagemap(unsigned long pfn,
 }
 EXPORT_SYMBOL_GPL(get_dev_pagemap);
 
-void free_zone_device_folio(struct folio *folio)
-{
-	struct dev_pagemap *pgmap = page_get_pgmap(&folio->page);
-
-	if (WARN_ON_ONCE(!pgmap->ops || !pgmap->ops->page_free))
-		return;
-
-	mem_cgroup_uncharge(folio);
-
-	/*
-	 * Note: we don't expect anonymous compound pages yet. Once supported
-	 * and we could PTE-map them similar to THP, we'd have to clear
-	 * PG_anon_exclusive on all tail pages.
-	 */
-	if (folio_test_anon(folio)) {
-		VM_BUG_ON_FOLIO(folio_test_large(folio), folio);
-		__ClearPageAnonExclusive(folio_page(folio, 0));
-	}
-
-	/*
-	 * When a device managed page is freed, the folio->mapping field
-	 * may still contain a (stale) mapping value. For example, the
-	 * lower bits of folio->mapping may still identify the folio as an
-	 * anonymous folio. Ultimately, this entire field is just stale
-	 * and wrong, and it will cause errors if not cleared.
-	 *
-	 * For other types of ZONE_DEVICE pages, migration is either
-	 * handled differently or not done at all, so there is no need
-	 * to clear folio->mapping.
-	 */
-	folio->mapping = NULL;
-	pgmap->ops->page_free(folio_page(folio, 0));
-
-	if (pgmap->type != MEMORY_DEVICE_PRIVATE &&
-	    pgmap->type != MEMORY_DEVICE_COHERENT)
-		/*
-		 * Reset the refcount to 1 to prepare for handing out the page
-		 * again.
-		 */
-		folio_set_count(folio, 1);
-	else
-		put_dev_pagemap(pgmap);
-}
-
 void zone_device_page_init(struct page *page)
 {
 	/*
diff --git a/mm/mm_init.c b/mm/mm_init.c
index 279cdaebfd2b..47c1f8fd4914 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -974,6 +974,51 @@ static void __init memmap_init(void)
 }
 
 #ifdef CONFIG_ZONE_DEVICE
+
+static void free_zone_device_folio(struct folio *folio)
+{
+	struct dev_pagemap *pgmap = page_get_pgmap(&folio->page);
+
+	if (WARN_ON_ONCE(!pgmap->ops || !pgmap->ops->page_free))
+		return;
+
+	mem_cgroup_uncharge(folio);
+
+	/*
+	 * Note: we don't expect anonymous compound pages yet. Once supported
+	 * and we could PTE-map them similar to THP, we'd have to clear
+	 * PG_anon_exclusive on all tail pages.
+	 */
+	if (folio_test_anon(folio)) {
+		VM_BUG_ON_FOLIO(folio_test_large(folio), folio);
+		__ClearPageAnonExclusive(folio_page(folio, 0));
+	}
+
+	/*
+	 * When a device managed page is freed, the folio->mapping field
+	 * may still contain a (stale) mapping value. For example, the
+	 * lower bits of folio->mapping may still identify the folio as an
+	 * anonymous folio. Ultimately, this entire field is just stale
+	 * and wrong, and it will cause errors if not cleared.
+	 *
+	 * For other types of ZONE_DEVICE pages, migration is either
+	 * handled differently or not done at all, so there is no need
+	 * to clear folio->mapping.
+	 */
+	folio->mapping = NULL;
+	pgmap->ops->page_free(folio_page(folio, 0));
+
+	if (pgmap->type != MEMORY_DEVICE_PRIVATE &&
+	    pgmap->type != MEMORY_DEVICE_COHERENT)
+		/*
+		 * Reset the refcount to 1 to prepare for handing out the page
+		 * again.
+		 */
+		folio_set_count(folio, 1);
+	else
+		put_dev_pagemap(pgmap);
+}
+
 static void __ref __init_zone_device_page(struct page *page, unsigned long pfn,
 					  unsigned long zone_idx, int nid,
 					  struct dev_pagemap *pgmap)
@@ -995,6 +1040,7 @@ static void __ref __init_zone_device_page(struct page *page, unsigned long pfn,
 	 * and zone_device_data.  It is a bug if a ZONE_DEVICE page is
 	 * ever freed or placed on a driver-private list.
 	 */
+	pgmap->folio_ops.free = free_zone_device_folio;
 	page_set_pgmap(page, pgmap);
 	page->zone_device_data = NULL;
 
diff --git a/mm/swap.c b/mm/swap.c
index 767ff6d8f47b..d2578465e270 100644
--- a/mm/swap.c
+++ b/mm/swap.c
@@ -117,11 +117,6 @@ void __folio_put(struct folio *folio)
 		return;
 	}
 
-	if (unlikely(folio_is_zone_device(folio))) {
-		free_zone_device_folio(folio);
-		return;
-	}
-
 	if (folio_test_hugetlb(folio)) {
 		free_huge_folio(folio);
 		return;
@@ -947,20 +942,11 @@ void folios_put_refs(struct folio_batch *folios, unsigned int *refs)
 				unlock_page_lruvec_irqrestore(lruvec, flags);
 				lruvec = NULL;
 			}
-			if (folio_ref_sub_and_test(folio, nr_refs))
-				owner_ops->free(folio);
-			continue;
-		}
-
-		if (folio_is_zone_device(folio)) {
-			if (lruvec) {
-				unlock_page_lruvec_irqrestore(lruvec, flags);
-				lruvec = NULL;
-			}
+			/* fenced by folio_is_zone_device() */
 			if (put_devmap_managed_folio_refs(folio, nr_refs))
 				continue;
 			if (folio_ref_sub_and_test(folio, nr_refs))
-				free_zone_device_folio(folio);
+				owner_ops->free(folio);
 			continue;
 		}
 
-- 
2.47.0.277.g8800431eea-goog

