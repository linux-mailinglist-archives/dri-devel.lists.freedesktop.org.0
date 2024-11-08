Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 513F59C21EC
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2024 17:21:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF49910EA14;
	Fri,  8 Nov 2024 16:21:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="LhgKyQZB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com
 [209.85.221.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B08E110EA13
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2024 16:21:06 +0000 (UTC)
Received: by mail-wr1-f74.google.com with SMTP id
 ffacd0b85a97d-37d5a3afa84so1365218f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Nov 2024 08:21:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1731082865; x=1731687665;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=LLzT0eDLF6iAMaTBJqJboYyOg2pJMFOgkBQWEqDLmNQ=;
 b=LhgKyQZBCvMVXJtubPNbXy2Jf5pGVywD7PNS+d4B/LadJEP4tnGjufHT2oV2dYl7IS
 VF3iyeQBj1zEq8FsqMjE0kq9EycmMvAPm+tbpkgT31/GlmYedNEUvEdQ/D1ZGA3aH38K
 yJXAhZkaL9lHIcCrXDUs0Z2auTED6LbGA6Myhvdrr2/6xn191vcxaJbhGWmeVcIoKdM/
 VWyMnQ1Wih66XtV/yqM1/XrA9cT5+EfUxr78PtQ8mDvBtnv6EgR4KafXDftcZ61e+VAC
 /442vxB0zmwyTz/qg6f3VK3GYIQUVb62DOAvAl3wrucq/UR0m7Cbc62/ggDWLkVEQHMS
 TsyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731082865; x=1731687665;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LLzT0eDLF6iAMaTBJqJboYyOg2pJMFOgkBQWEqDLmNQ=;
 b=UrLNh4SL+5UZKHI7P2ZuRO0HgXoxUTLoFnKM+xDHc0rCSUGdGA8y4FYfOSb0UR0h1t
 StKrNSvZBVSq+xXeCngGkfiZ9HkuQ6Bz2CWbpf3/pOTzpC+1gxJouB6CnjoUyW1rYCHR
 urTuIlAYCzlDUJ5UmUl1nh95h9Ba0vHt/vriheark5TczN9NLCJR9ynhKMb95H1Ou1K0
 AtDAe4xmickfHCH6lf7nlcjHXm+wCDeIKfGBSJg1h5UBei85iiu1ZMYOJ6wa40xBLg1w
 ZGheeBMGV97Wb59vwsQRL3RQ/f/9tqqLpI/keBu0hChLgSOfveUizK1Gq3uBR/RnMwXj
 xafQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqDlXK/zehPB05nl2Y+GgMHlr2vB/MW6pH3Et85GEEOjO601t2oHLWDsDU1vU4Jp5MeQYql4OLCkc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyXjF0RLzT8piT0XSiXKP0b7jVyOPNCeC1BcOs1WTvcOrPaF9zA
 4fqVKdh5kFr4yNChINS/btyUY+A5iYruhWuWsUNtdJQaRpzDeVIisF2KlkQyu5ceMOJfWhTc+g=
 =
X-Google-Smtp-Source: AGHT+IHHoxyjGs1AUxhryPf5sywJLDUszI7O7sOrCReyd47RhmaPFBz34fv43FAG+LKSgY7icD6Ea0HGQw==
X-Received: from fuad.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:1613])
 (user=tabba job=sendgmr) by 2002:a05:6000:1b02:b0:37d:4850:c3be
 with SMTP id
 ffacd0b85a97d-381f18881dfmr2466f8f.10.1731082865212; Fri, 08 Nov 2024
 08:21:05 -0800 (PST)
Date: Fri,  8 Nov 2024 16:20:40 +0000
In-Reply-To: <20241108162040.159038-1-tabba@google.com>
Mime-Version: 1.0
References: <20241108162040.159038-1-tabba@google.com>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241108162040.159038-11-tabba@google.com>
Subject: [RFC PATCH v1 10/10] mm: hugetlb: Use owner_ops on folio_put for
 hugetlb
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

Now that we have the folio_owner_ops callback, use it for hugetlb
pages instead of using a dedicated callback.

Since owner_ops is overlaid with lru, we need to unset owner_ops
to allow the use of lru when its isolated. At that point we know
that the reference count is elevated, will not reach 0, and thus
not trigger a callback. Therefore, it is safe to do so provided
we restore it before we put the folio back.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 include/linux/hugetlb.h |  2 --
 mm/hugetlb.c            | 57 +++++++++++++++++++++++++++++++++--------
 mm/swap.c               | 14 ----------
 3 files changed, 47 insertions(+), 26 deletions(-)

diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index e846d7dac77c..500848862702 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -20,8 +20,6 @@ struct user_struct;
 struct mmu_gather;
 struct node;
 
-void free_huge_folio(struct folio *folio);
-
 #ifdef CONFIG_HUGETLB_PAGE
 
 #include <linux/pagemap.h>
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 2308e94d8615..4e1c87e37968 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -89,6 +89,33 @@ static void __hugetlb_vma_unlock_write_free(struct vm_area_struct *vma);
 static void hugetlb_unshare_pmds(struct vm_area_struct *vma,
 		unsigned long start, unsigned long end);
 static struct resv_map *vma_resv_map(struct vm_area_struct *vma);
+static void free_huge_folio(struct folio *folio);
+
+static const struct folio_owner_ops hugetlb_owner_ops = {
+	.free = free_huge_folio,
+};
+
+/*
+ * Mark this folio as a hugetlb-owned folio.
+ *
+ * Set the folio hugetlb flag and owner operations.
+ */
+static void folio_set_hugetlb_owner(struct folio *folio)
+{
+	__folio_set_hugetlb(folio);
+	folio_set_owner_ops(folio, &hugetlb_owner_ops);
+}
+
+/*
+ * Unmark this folio from being a hugetlb-owned folio.
+ *
+ * Clear the folio hugetlb flag and owner operations.
+ */
+static void folio_clear_hugetlb_owner(struct folio *folio)
+{
+	folio_clear_owner_ops(folio);
+	__folio_clear_hugetlb(folio);
+}
 
 static void hugetlb_free_folio(struct folio *folio)
 {
@@ -1617,7 +1644,7 @@ static void remove_hugetlb_folio(struct hstate *h, struct folio *folio,
 	 * to tail struct pages.
 	 */
 	if (!folio_test_hugetlb_vmemmap_optimized(folio)) {
-		__folio_clear_hugetlb(folio);
+		folio_clear_hugetlb_owner(folio);
 	}
 
 	h->nr_huge_pages--;
@@ -1641,7 +1668,7 @@ static void add_hugetlb_folio(struct hstate *h, struct folio *folio,
 		h->surplus_huge_pages++;
 		h->surplus_huge_pages_node[nid]++;
 	}
-	__folio_set_hugetlb(folio);
+	folio_set_hugetlb_owner(folio);
 
 	folio_change_private(folio, NULL);
 	/*
@@ -1692,7 +1719,7 @@ static void __update_and_free_hugetlb_folio(struct hstate *h,
 	 */
 	if (folio_test_hugetlb(folio)) {
 		spin_lock_irq(&hugetlb_lock);
-		__folio_clear_hugetlb(folio);
+		folio_clear_hugetlb_owner(folio);
 		spin_unlock_irq(&hugetlb_lock);
 	}
 
@@ -1793,7 +1820,7 @@ static void bulk_vmemmap_restore_error(struct hstate *h,
 		list_for_each_entry_safe(folio, t_folio, non_hvo_folios, _hugetlb_list) {
 			list_del(&folio->_hugetlb_list);
 			spin_lock_irq(&hugetlb_lock);
-			__folio_clear_hugetlb(folio);
+			folio_clear_hugetlb_owner(folio);
 			spin_unlock_irq(&hugetlb_lock);
 			update_and_free_hugetlb_folio(h, folio, false);
 			cond_resched();
@@ -1818,7 +1845,7 @@ static void bulk_vmemmap_restore_error(struct hstate *h,
 			} else {
 				list_del(&folio->_hugetlb_list);
 				spin_lock_irq(&hugetlb_lock);
-				__folio_clear_hugetlb(folio);
+				folio_clear_hugetlb_owner(folio);
 				spin_unlock_irq(&hugetlb_lock);
 				update_and_free_hugetlb_folio(h, folio, false);
 				cond_resched();
@@ -1851,14 +1878,14 @@ static void update_and_free_pages_bulk(struct hstate *h,
 	 * should only be pages on the non_hvo_folios list.
 	 * Do note that the non_hvo_folios list could be empty.
 	 * Without HVO enabled, ret will be 0 and there is no need to call
-	 * __folio_clear_hugetlb as this was done previously.
+	 * folio_clear_hugetlb_owner as this was done previously.
 	 */
 	VM_WARN_ON(!list_empty(folio_list));
 	VM_WARN_ON(ret < 0);
 	if (!list_empty(&non_hvo_folios) && ret) {
 		spin_lock_irq(&hugetlb_lock);
 		list_for_each_entry(folio, &non_hvo_folios, _hugetlb_list)
-			__folio_clear_hugetlb(folio);
+			folio_clear_hugetlb_owner(folio);
 		spin_unlock_irq(&hugetlb_lock);
 	}
 
@@ -1879,7 +1906,7 @@ struct hstate *size_to_hstate(unsigned long size)
 	return NULL;
 }
 
-void free_huge_folio(struct folio *folio)
+static void free_huge_folio(struct folio *folio)
 {
 	/*
 	 * Can't pass hstate in here because it is called from the
@@ -1959,7 +1986,7 @@ static void __prep_account_new_huge_page(struct hstate *h, int nid)
 
 static void init_new_hugetlb_folio(struct hstate *h, struct folio *folio)
 {
-	__folio_set_hugetlb(folio);
+	folio_set_hugetlb_owner(folio);
 	INIT_LIST_HEAD(&folio->_hugetlb_list);
 	hugetlb_set_folio_subpool(folio, NULL);
 	set_hugetlb_cgroup(folio, NULL);
@@ -7428,6 +7455,14 @@ bool folio_isolate_hugetlb(struct folio *folio, struct list_head *list)
 		goto unlock;
 	}
 	folio_clear_hugetlb_migratable(folio);
+	/*
+	 * Clear folio->owner_ops; now we can use folio->lru.
+	 * Note that the folio cannot get freed because we are holding a
+	 * reference. The reference will be put in folio_putback_hugetlb(),
+	 * after restoring folio->owner_ops.
+	 */
+	folio_clear_owner_ops(folio);
+	INIT_LIST_HEAD(&folio->lru);
 	list_del_init(&folio->_hugetlb_list);
 	list_add_tail(&folio->lru, list);
 unlock:
@@ -7480,7 +7515,9 @@ void folio_putback_hugetlb(struct folio *folio)
 {
 	spin_lock_irq(&hugetlb_lock);
 	folio_set_hugetlb_migratable(folio);
-	list_del_init(&folio->lru);
+	list_del(&folio->lru);
+	/* Restore folio->owner_ops since we can no longer use folio->lru. */
+	folio_set_owner_ops(folio, &hugetlb_owner_ops);
 	list_add_tail(&folio->_hugetlb_list, &(folio_hstate(folio))->hugepage_activelist);
 	spin_unlock_irq(&hugetlb_lock);
 	folio_put(folio);
diff --git a/mm/swap.c b/mm/swap.c
index d2578465e270..9798ca47f26a 100644
--- a/mm/swap.c
+++ b/mm/swap.c
@@ -117,11 +117,6 @@ void __folio_put(struct folio *folio)
 		return;
 	}
 
-	if (folio_test_hugetlb(folio)) {
-		free_huge_folio(folio);
-		return;
-	}
-
 	page_cache_release(folio);
 	folio_unqueue_deferred_split(folio);
 	mem_cgroup_uncharge(folio);
@@ -953,15 +948,6 @@ void folios_put_refs(struct folio_batch *folios, unsigned int *refs)
 		if (!folio_ref_sub_and_test(folio, nr_refs))
 			continue;
 
-		/* hugetlb has its own memcg */
-		if (folio_test_hugetlb(folio)) {
-			if (lruvec) {
-				unlock_page_lruvec_irqrestore(lruvec, flags);
-				lruvec = NULL;
-			}
-			free_huge_folio(folio);
-			continue;
-		}
 		folio_unqueue_deferred_split(folio);
 		__page_cache_release(folio, &lruvec, &flags);
 
-- 
2.47.0.277.g8800431eea-goog

