Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4739C21E1
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2024 17:21:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D8FE10EA07;
	Fri,  8 Nov 2024 16:20:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="PiTeQx0g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com
 [209.85.128.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E224310EA07
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2024 16:20:57 +0000 (UTC)
Received: by mail-wm1-f74.google.com with SMTP id
 5b1f17b1804b1-431604a3b47so15111985e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Nov 2024 08:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1731082856; x=1731687656;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=djjKrUl0oR5lK1iUj5wBqHv7X6lVNwT0SqGCjb6L8ss=;
 b=PiTeQx0g09KVOLPS0BwdWudDhvb7qQus0o+u+RBWST3K+w6St3TcmyvwMKk/IH9VQX
 lyjbsAk5itRAd11GgRfSyyMmwFNTdppVnb5+gPgG4VA5Go8qZa2e4css7kDZ2fCbMTng
 DGRSfOrcJLT9GXl2roVXlOhUkv7XsJp/fEMp2pCn7J7VKVRlZI5yNDoxLeERWHwX+Lvm
 QX/Sn+K1qjN31ftdtgCB1lBHaVTwsxIGL3cURKbnVmF69+d41rKBm/WSgJ3uPqoXssoH
 2JrQuV+gbEb7X+8w3pWcs5LcyVFV/I7LCBtZsH7qfoI+OdKIdryd9nmxDdo34IGKLrQH
 y+Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731082856; x=1731687656;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=djjKrUl0oR5lK1iUj5wBqHv7X6lVNwT0SqGCjb6L8ss=;
 b=IGxioCBVwRvSAA1uAFkuCeBc4L8e791+UffrgtN7HStqX1FUnrD3JbWqjunbRvAv8f
 DYhvLms5NfkLluy6TT+hmNP9h/wN1B70K24+1N0VR2ayJdq2NcvzbYzi1XmPjUhWJ83M
 B+UMRA+gbNICuO7N8SxFW2vgsGcVUkMmSmHIQyHRZVsxg43eHUwBIVTlFzV+HX/2JVaX
 2GO9WPci8gvFux4QRn7JEQSWvO2Fv8QZDk1qvFr04rTcEmxP1Pcg89fpPDWq1ckRppQZ
 9qUCqdbpaGmXu9lPXUUML2thtXNaGJnHY1yk7STL2i91bLFITzdVNSLOYAIzX5d8MEmF
 uSdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIgqfnYi3K09o/JU0/SDqNJgSFjnJZ0DInDtR1mOOXOfz1zfjpWv1Z3ZmiP/lo5dgLrfEPUWwqhi8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyvC50JCREjC9Vdom4B73SYbesFbAV78pJH1DhbDg2mt+eS+RKl
 bHZq+lS2HbNfad2jt3WxSnpAXLEYx8SCh1W/lRRff2wUd28B0RwNtATKSRmV+PoqLuMWs/tQZQ=
 =
X-Google-Smtp-Source: AGHT+IG8oqeRtBHhwUKqiIKTnkqXE8W7GFfQboidk/t9PyUEaqaxv663mtEdw0kf/yfOyooXYNVI8Y+B3g==
X-Received: from fuad.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:1613])
 (user=tabba job=sendgmr) by 2002:a7b:c845:0:b0:42c:b995:20f1 with
 SMTP id
 5b1f17b1804b1-432b7515d74mr74205e9.4.1731082856332; Fri, 08 Nov 2024 08:20:56
 -0800 (PST)
Date: Fri,  8 Nov 2024 16:20:36 +0000
In-Reply-To: <20241108162040.159038-1-tabba@google.com>
Mime-Version: 1.0
References: <20241108162040.159038-1-tabba@google.com>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241108162040.159038-7-tabba@google.com>
Subject: [RFC PATCH v1 06/10] mm/hugetlb: use separate folio->_hugetlb_list
 for hugetlb-internals
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

From: David Hildenbrand <david@redhat.com>

Let's use a separate list head in the folio, as long as hugetlb folios are
not isolated. This way, we can reuse folio->lru for different purpose
(e.g., owner_ops) as long as they are not isolated.

Consequently, folio->lru will only be used while there is an additional
folio reference that cannot be dropped until putback/un-isolated.

Signed-off-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 include/linux/mm_types.h | 18 +++++++++
 mm/hugetlb.c             | 81 +++++++++++++++++++++-------------------
 mm/hugetlb_cgroup.c      |  4 +-
 mm/hugetlb_vmemmap.c     |  8 ++--
 4 files changed, 66 insertions(+), 45 deletions(-)

diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 80fef38d9d64..365c73be0bb4 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -310,6 +310,7 @@ typedef struct {
  * @_hugetlb_cgroup: Do not use directly, use accessor in hugetlb_cgroup.h.
  * @_hugetlb_cgroup_rsvd: Do not use directly, use accessor in hugetlb_cgroup.h.
  * @_hugetlb_hwpoison: Do not use directly, call raw_hwp_list_head().
+ * @_hugetlb_list: To be used in hugetlb core code only.
  * @_deferred_list: Folios to be split under memory pressure.
  * @_unused_slab_obj_exts: Placeholder to match obj_exts in struct slab.
  *
@@ -397,6 +398,17 @@ struct folio {
 		};
 		struct page __page_2;
 	};
+	union {
+		struct {
+			unsigned long _flags_3;
+			unsigned long _head_3;
+	/* public: */
+			struct list_head _hugetlb_list;
+	/* private: the union with struct page is transitional */
+		};
+		struct page __page_3;
+	};
+
 };
 
 #define FOLIO_MATCH(pg, fl)						\
@@ -433,6 +445,12 @@ FOLIO_MATCH(compound_head, _head_2);
 FOLIO_MATCH(flags, _flags_2a);
 FOLIO_MATCH(compound_head, _head_2a);
 #undef FOLIO_MATCH
+#define FOLIO_MATCH(pg, fl)						\
+	static_assert(offsetof(struct folio, fl) ==			\
+			offsetof(struct page, pg) + 3 * sizeof(struct page))
+FOLIO_MATCH(flags, _flags_3);
+FOLIO_MATCH(compound_head, _head_3);
+#undef FOLIO_MATCH
 
 /**
  * struct ptdesc -    Memory descriptor for page tables.
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index a64852280213..2308e94d8615 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -1316,7 +1316,7 @@ static void enqueue_hugetlb_folio(struct hstate *h, struct folio *folio)
 	lockdep_assert_held(&hugetlb_lock);
 	VM_BUG_ON_FOLIO(folio_ref_count(folio), folio);
 
-	list_move(&folio->lru, &h->hugepage_freelists[nid]);
+	list_move(&folio->_hugetlb_list, &h->hugepage_freelists[nid]);
 	h->free_huge_pages++;
 	h->free_huge_pages_node[nid]++;
 	folio_set_hugetlb_freed(folio);
@@ -1329,14 +1329,14 @@ static struct folio *dequeue_hugetlb_folio_node_exact(struct hstate *h,
 	bool pin = !!(current->flags & PF_MEMALLOC_PIN);
 
 	lockdep_assert_held(&hugetlb_lock);
-	list_for_each_entry(folio, &h->hugepage_freelists[nid], lru) {
+	list_for_each_entry(folio, &h->hugepage_freelists[nid], _hugetlb_list) {
 		if (pin && !folio_is_longterm_pinnable(folio))
 			continue;
 
 		if (folio_test_hwpoison(folio))
 			continue;
 
-		list_move(&folio->lru, &h->hugepage_activelist);
+		list_move(&folio->_hugetlb_list, &h->hugepage_activelist);
 		folio_ref_unfreeze(folio, 1);
 		folio_clear_hugetlb_freed(folio);
 		h->free_huge_pages--;
@@ -1599,7 +1599,7 @@ static void remove_hugetlb_folio(struct hstate *h, struct folio *folio,
 	if (hstate_is_gigantic(h) && !gigantic_page_runtime_supported())
 		return;
 
-	list_del(&folio->lru);
+	list_del(&folio->_hugetlb_list);
 
 	if (folio_test_hugetlb_freed(folio)) {
 		folio_clear_hugetlb_freed(folio);
@@ -1616,8 +1616,9 @@ static void remove_hugetlb_folio(struct hstate *h, struct folio *folio,
 	 * pages.  Otherwise, someone (memory error handling) may try to write
 	 * to tail struct pages.
 	 */
-	if (!folio_test_hugetlb_vmemmap_optimized(folio))
+	if (!folio_test_hugetlb_vmemmap_optimized(folio)) {
 		__folio_clear_hugetlb(folio);
+	}
 
 	h->nr_huge_pages--;
 	h->nr_huge_pages_node[nid]--;
@@ -1632,7 +1633,7 @@ static void add_hugetlb_folio(struct hstate *h, struct folio *folio,
 
 	lockdep_assert_held(&hugetlb_lock);
 
-	INIT_LIST_HEAD(&folio->lru);
+	INIT_LIST_HEAD(&folio->_hugetlb_list);
 	h->nr_huge_pages++;
 	h->nr_huge_pages_node[nid]++;
 
@@ -1640,8 +1641,8 @@ static void add_hugetlb_folio(struct hstate *h, struct folio *folio,
 		h->surplus_huge_pages++;
 		h->surplus_huge_pages_node[nid]++;
 	}
-
 	__folio_set_hugetlb(folio);
+
 	folio_change_private(folio, NULL);
 	/*
 	 * We have to set hugetlb_vmemmap_optimized again as above
@@ -1789,8 +1790,8 @@ static void bulk_vmemmap_restore_error(struct hstate *h,
 		 * hugetlb pages with vmemmap we will free up memory so that we
 		 * can allocate vmemmap for more hugetlb pages.
 		 */
-		list_for_each_entry_safe(folio, t_folio, non_hvo_folios, lru) {
-			list_del(&folio->lru);
+		list_for_each_entry_safe(folio, t_folio, non_hvo_folios, _hugetlb_list) {
+			list_del(&folio->_hugetlb_list);
 			spin_lock_irq(&hugetlb_lock);
 			__folio_clear_hugetlb(folio);
 			spin_unlock_irq(&hugetlb_lock);
@@ -1808,14 +1809,14 @@ static void bulk_vmemmap_restore_error(struct hstate *h,
 		 * If are able to restore vmemmap and free one hugetlb page, we
 		 * quit processing the list to retry the bulk operation.
 		 */
-		list_for_each_entry_safe(folio, t_folio, folio_list, lru)
+		list_for_each_entry_safe(folio, t_folio, folio_list, _hugetlb_list)
 			if (hugetlb_vmemmap_restore_folio(h, folio)) {
-				list_del(&folio->lru);
+				list_del(&folio->_hugetlb_list);
 				spin_lock_irq(&hugetlb_lock);
 				add_hugetlb_folio(h, folio, true);
 				spin_unlock_irq(&hugetlb_lock);
 			} else {
-				list_del(&folio->lru);
+				list_del(&folio->_hugetlb_list);
 				spin_lock_irq(&hugetlb_lock);
 				__folio_clear_hugetlb(folio);
 				spin_unlock_irq(&hugetlb_lock);
@@ -1856,12 +1857,12 @@ static void update_and_free_pages_bulk(struct hstate *h,
 	VM_WARN_ON(ret < 0);
 	if (!list_empty(&non_hvo_folios) && ret) {
 		spin_lock_irq(&hugetlb_lock);
-		list_for_each_entry(folio, &non_hvo_folios, lru)
+		list_for_each_entry(folio, &non_hvo_folios, _hugetlb_list)
 			__folio_clear_hugetlb(folio);
 		spin_unlock_irq(&hugetlb_lock);
 	}
 
-	list_for_each_entry_safe(folio, t_folio, &non_hvo_folios, lru) {
+	list_for_each_entry_safe(folio, t_folio, &non_hvo_folios, _hugetlb_list) {
 		update_and_free_hugetlb_folio(h, folio, false);
 		cond_resched();
 	}
@@ -1959,7 +1960,7 @@ static void __prep_account_new_huge_page(struct hstate *h, int nid)
 static void init_new_hugetlb_folio(struct hstate *h, struct folio *folio)
 {
 	__folio_set_hugetlb(folio);
-	INIT_LIST_HEAD(&folio->lru);
+	INIT_LIST_HEAD(&folio->_hugetlb_list);
 	hugetlb_set_folio_subpool(folio, NULL);
 	set_hugetlb_cgroup(folio, NULL);
 	set_hugetlb_cgroup_rsvd(folio, NULL);
@@ -2112,7 +2113,7 @@ static void prep_and_add_allocated_folios(struct hstate *h,
 
 	/* Add all new pool pages to free lists in one lock cycle */
 	spin_lock_irqsave(&hugetlb_lock, flags);
-	list_for_each_entry_safe(folio, tmp_f, folio_list, lru) {
+	list_for_each_entry_safe(folio, tmp_f, folio_list, _hugetlb_list) {
 		__prep_account_new_huge_page(h, folio_nid(folio));
 		enqueue_hugetlb_folio(h, folio);
 	}
@@ -2165,7 +2166,7 @@ static struct folio *remove_pool_hugetlb_folio(struct hstate *h,
 		if ((!acct_surplus || h->surplus_huge_pages_node[node]) &&
 		    !list_empty(&h->hugepage_freelists[node])) {
 			folio = list_entry(h->hugepage_freelists[node].next,
-					  struct folio, lru);
+					  struct folio, _hugetlb_list);
 			remove_hugetlb_folio(h, folio, acct_surplus);
 			break;
 		}
@@ -2491,7 +2492,7 @@ static int gather_surplus_pages(struct hstate *h, long delta)
 			alloc_ok = false;
 			break;
 		}
-		list_add(&folio->lru, &surplus_list);
+		list_add(&folio->_hugetlb_list, &surplus_list);
 		cond_resched();
 	}
 	allocated += i;
@@ -2526,7 +2527,7 @@ static int gather_surplus_pages(struct hstate *h, long delta)
 	ret = 0;
 
 	/* Free the needed pages to the hugetlb pool */
-	list_for_each_entry_safe(folio, tmp, &surplus_list, lru) {
+	list_for_each_entry_safe(folio, tmp, &surplus_list, _hugetlb_list) {
 		if ((--needed) < 0)
 			break;
 		/* Add the page to the hugetlb allocator */
@@ -2539,7 +2540,7 @@ static int gather_surplus_pages(struct hstate *h, long delta)
 	 * Free unnecessary surplus pages to the buddy allocator.
 	 * Pages have no ref count, call free_huge_folio directly.
 	 */
-	list_for_each_entry_safe(folio, tmp, &surplus_list, lru)
+	list_for_each_entry_safe(folio, tmp, &surplus_list, _hugetlb_list)
 		free_huge_folio(folio);
 	spin_lock_irq(&hugetlb_lock);
 
@@ -2588,7 +2589,7 @@ static void return_unused_surplus_pages(struct hstate *h,
 		if (!folio)
 			goto out;
 
-		list_add(&folio->lru, &page_list);
+		list_add(&folio->_hugetlb_list, &page_list);
 	}
 
 out:
@@ -3051,7 +3052,7 @@ struct folio *alloc_hugetlb_folio(struct vm_area_struct *vma,
 			folio_set_hugetlb_restore_reserve(folio);
 			h->resv_huge_pages--;
 		}
-		list_add(&folio->lru, &h->hugepage_activelist);
+		list_add(&folio->_hugetlb_list, &h->hugepage_activelist);
 		folio_ref_unfreeze(folio, 1);
 		/* Fall through */
 	}
@@ -3211,7 +3212,7 @@ static void __init prep_and_add_bootmem_folios(struct hstate *h,
 	/* Send list for bulk vmemmap optimization processing */
 	hugetlb_vmemmap_optimize_folios(h, folio_list);
 
-	list_for_each_entry_safe(folio, tmp_f, folio_list, lru) {
+	list_for_each_entry_safe(folio, tmp_f, folio_list, _hugetlb_list) {
 		if (!folio_test_hugetlb_vmemmap_optimized(folio)) {
 			/*
 			 * If HVO fails, initialize all tail struct pages
@@ -3260,7 +3261,7 @@ static void __init gather_bootmem_prealloc_node(unsigned long nid)
 		hugetlb_folio_init_vmemmap(folio, h,
 					   HUGETLB_VMEMMAP_RESERVE_PAGES);
 		init_new_hugetlb_folio(h, folio);
-		list_add(&folio->lru, &folio_list);
+		list_add(&folio->_hugetlb_list, &folio_list);
 
 		/*
 		 * We need to restore the 'stolen' pages to totalram_pages
@@ -3317,7 +3318,7 @@ static void __init hugetlb_hstate_alloc_pages_onenode(struct hstate *h, int nid)
 					&node_states[N_MEMORY], NULL);
 			if (!folio)
 				break;
-			list_add(&folio->lru, &folio_list);
+			list_add(&folio->_hugetlb_list, &folio_list);
 		}
 		cond_resched();
 	}
@@ -3379,7 +3380,7 @@ static void __init hugetlb_pages_alloc_boot_node(unsigned long start, unsigned l
 		if (!folio)
 			break;
 
-		list_move(&folio->lru, &folio_list);
+		list_move(&folio->_hugetlb_list, &folio_list);
 		cond_resched();
 	}
 
@@ -3544,13 +3545,13 @@ static void try_to_free_low(struct hstate *h, unsigned long count,
 	for_each_node_mask(i, *nodes_allowed) {
 		struct folio *folio, *next;
 		struct list_head *freel = &h->hugepage_freelists[i];
-		list_for_each_entry_safe(folio, next, freel, lru) {
+		list_for_each_entry_safe(folio, next, freel, _hugetlb_list) {
 			if (count >= h->nr_huge_pages)
 				goto out;
 			if (folio_test_highmem(folio))
 				continue;
 			remove_hugetlb_folio(h, folio, false);
-			list_add(&folio->lru, &page_list);
+			list_add(&folio->_hugetlb_list, &page_list);
 		}
 	}
 
@@ -3703,7 +3704,7 @@ static int set_max_huge_pages(struct hstate *h, unsigned long count, int nid,
 			goto out;
 		}
 
-		list_add(&folio->lru, &page_list);
+		list_add(&folio->_hugetlb_list, &page_list);
 		allocated++;
 
 		/* Bail for signals. Probably ctrl-c from user */
@@ -3750,7 +3751,7 @@ static int set_max_huge_pages(struct hstate *h, unsigned long count, int nid,
 		if (!folio)
 			break;
 
-		list_add(&folio->lru, &page_list);
+		list_add(&folio->_hugetlb_list, &page_list);
 	}
 	/* free the pages after dropping lock */
 	spin_unlock_irq(&hugetlb_lock);
@@ -3793,13 +3794,13 @@ static long demote_free_hugetlb_folios(struct hstate *src, struct hstate *dst,
 	 */
 	mutex_lock(&dst->resize_lock);
 
-	list_for_each_entry_safe(folio, next, src_list, lru) {
+	list_for_each_entry_safe(folio, next, src_list, _hugetlb_list) {
 		int i;
 
 		if (folio_test_hugetlb_vmemmap_optimized(folio))
 			continue;
 
-		list_del(&folio->lru);
+		list_del(&folio->_hugetlb_list);
 
 		split_page_owner(&folio->page, huge_page_order(src), huge_page_order(dst));
 		pgalloc_tag_split(folio, huge_page_order(src), huge_page_order(dst));
@@ -3814,7 +3815,7 @@ static long demote_free_hugetlb_folios(struct hstate *src, struct hstate *dst,
 			new_folio = page_folio(page);
 
 			init_new_hugetlb_folio(dst, new_folio);
-			list_add(&new_folio->lru, &dst_list);
+			list_add(&new_folio->_hugetlb_list, &dst_list);
 		}
 	}
 
@@ -3847,12 +3848,12 @@ static long demote_pool_huge_page(struct hstate *src, nodemask_t *nodes_allowed,
 		LIST_HEAD(list);
 		struct folio *folio, *next;
 
-		list_for_each_entry_safe(folio, next, &src->hugepage_freelists[node], lru) {
+		list_for_each_entry_safe(folio, next, &src->hugepage_freelists[node], _hugetlb_list) {
 			if (folio_test_hwpoison(folio))
 				continue;
 
 			remove_hugetlb_folio(src, folio, false);
-			list_add(&folio->lru, &list);
+			list_add(&folio->_hugetlb_list, &list);
 
 			if (++nr_demoted == nr_to_demote)
 				break;
@@ -3864,8 +3865,8 @@ static long demote_pool_huge_page(struct hstate *src, nodemask_t *nodes_allowed,
 
 		spin_lock_irq(&hugetlb_lock);
 
-		list_for_each_entry_safe(folio, next, &list, lru) {
-			list_del(&folio->lru);
+		list_for_each_entry_safe(folio, next, &list, _hugetlb_list) {
+			list_del(&folio->_hugetlb_list);
 			add_hugetlb_folio(src, folio, false);
 
 			nr_demoted--;
@@ -7427,7 +7428,8 @@ bool folio_isolate_hugetlb(struct folio *folio, struct list_head *list)
 		goto unlock;
 	}
 	folio_clear_hugetlb_migratable(folio);
-	list_move_tail(&folio->lru, list);
+	list_del_init(&folio->_hugetlb_list);
+	list_add_tail(&folio->lru, list);
 unlock:
 	spin_unlock_irq(&hugetlb_lock);
 	return ret;
@@ -7478,7 +7480,8 @@ void folio_putback_hugetlb(struct folio *folio)
 {
 	spin_lock_irq(&hugetlb_lock);
 	folio_set_hugetlb_migratable(folio);
-	list_move_tail(&folio->lru, &(folio_hstate(folio))->hugepage_activelist);
+	list_del_init(&folio->lru);
+	list_add_tail(&folio->_hugetlb_list, &(folio_hstate(folio))->hugepage_activelist);
 	spin_unlock_irq(&hugetlb_lock);
 	folio_put(folio);
 }
diff --git a/mm/hugetlb_cgroup.c b/mm/hugetlb_cgroup.c
index 1bdeaf25f640..ee720eeaf6b1 100644
--- a/mm/hugetlb_cgroup.c
+++ b/mm/hugetlb_cgroup.c
@@ -239,7 +239,7 @@ static void hugetlb_cgroup_css_offline(struct cgroup_subsys_state *css)
 	do {
 		for_each_hstate(h) {
 			spin_lock_irq(&hugetlb_lock);
-			list_for_each_entry(folio, &h->hugepage_activelist, lru)
+			list_for_each_entry(folio, &h->hugepage_activelist, _hugetlb_list)
 				hugetlb_cgroup_move_parent(hstate_index(h), h_cg, folio);
 
 			spin_unlock_irq(&hugetlb_lock);
@@ -933,7 +933,7 @@ void hugetlb_cgroup_migrate(struct folio *old_folio, struct folio *new_folio)
 	/* move the h_cg details to new cgroup */
 	set_hugetlb_cgroup(new_folio, h_cg);
 	set_hugetlb_cgroup_rsvd(new_folio, h_cg_rsvd);
-	list_move(&new_folio->lru, &h->hugepage_activelist);
+	list_move(&new_folio->_hugetlb_list, &h->hugepage_activelist);
 	spin_unlock_irq(&hugetlb_lock);
 	return;
 }
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 57b7f591eee8..b2cb8d328aac 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -519,7 +519,7 @@ long hugetlb_vmemmap_restore_folios(const struct hstate *h,
 	long ret = 0;
 	unsigned long flags = VMEMMAP_REMAP_NO_TLB_FLUSH | VMEMMAP_SYNCHRONIZE_RCU;
 
-	list_for_each_entry_safe(folio, t_folio, folio_list, lru) {
+	list_for_each_entry_safe(folio, t_folio, folio_list, _hugetlb_list) {
 		if (folio_test_hugetlb_vmemmap_optimized(folio)) {
 			ret = __hugetlb_vmemmap_restore_folio(h, folio, flags);
 			/* only need to synchronize_rcu() once for each batch */
@@ -531,7 +531,7 @@ long hugetlb_vmemmap_restore_folios(const struct hstate *h,
 		}
 
 		/* Add non-optimized folios to output list */
-		list_move(&folio->lru, non_hvo_folios);
+		list_move(&folio->_hugetlb_list, non_hvo_folios);
 	}
 
 	if (restored)
@@ -651,7 +651,7 @@ void hugetlb_vmemmap_optimize_folios(struct hstate *h, struct list_head *folio_l
 	LIST_HEAD(vmemmap_pages);
 	unsigned long flags = VMEMMAP_REMAP_NO_TLB_FLUSH | VMEMMAP_SYNCHRONIZE_RCU;
 
-	list_for_each_entry(folio, folio_list, lru) {
+	list_for_each_entry(folio, folio_list, _hugetlb_list) {
 		int ret = hugetlb_vmemmap_split_folio(h, folio);
 
 		/*
@@ -666,7 +666,7 @@ void hugetlb_vmemmap_optimize_folios(struct hstate *h, struct list_head *folio_l
 
 	flush_tlb_all();
 
-	list_for_each_entry(folio, folio_list, lru) {
+	list_for_each_entry(folio, folio_list, _hugetlb_list) {
 		int ret;
 
 		ret = __hugetlb_vmemmap_optimize_folio(h, folio, &vmemmap_pages, flags);
-- 
2.47.0.277.g8800431eea-goog

