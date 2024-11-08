Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA60C9C21D6
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2024 17:20:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC2EE10E9EB;
	Fri,  8 Nov 2024 16:20:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="1Oegflka";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com
 [209.85.128.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A66310E9EB
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2024 16:20:46 +0000 (UTC)
Received: by mail-wm1-f74.google.com with SMTP id
 5b1f17b1804b1-4315cefda02so16608905e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Nov 2024 08:20:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1731082845; x=1731687645;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=Kl2W4EtzrNZ1cJuCyrufhU34bgPSAtiEFnUtuMhqv3Y=;
 b=1OegflkaCpwvG8dn3r+lyb7k7m6ysuEO5qSnF82aO2bqMs+G/ReopPpi3CrHPXaXw1
 oipFQjpYRdgc1mouNmRyjf8imvBt1/qLH8fAPrtB4r9tzZhjN+0ybv3Q1Y1Rdrz/QjFj
 OgkncRWvU2RMoGkYZJQEZ2j3D6RdfBDzEFZYi7guvnVYo/SxEXoJcyzEBIhUPnqsNPvU
 GWkxegPLl5++2XVNW5EaZsSzdet6wf6VLs+4nVorAJOVYmsLxBaRkYcZQJ+9aFpaYnD3
 AdmAZxFKirFI0at4/Jzr2HoIbCGiT0UxMuhBTuQq3MMsDY4RGt/7tNP333HusBUr/Fny
 GLQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731082845; x=1731687645;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Kl2W4EtzrNZ1cJuCyrufhU34bgPSAtiEFnUtuMhqv3Y=;
 b=VNzysgPZ44T6w5d+KtVyeOXz7vNFCalG0WjaWmwSVUMQnpu0ygOleqhtei1hdfEYzv
 WwUeGDZwvzvDbzQTWEjxpN3Q3jaaFzqrFF/ivrw1PEDZRpCYPKjTUx7hG9ajzEeug4h0
 SWtj9WzGKb/b69qqHagCWUgpQ5mnNS71lGAtz165/4xDOrZ1F/W5i/czEU/9PS//UBbC
 hHZwierCW3mk+pQSwJBKZVTY44ksErDJpCuggFBX76+7r32lnQo17eqRjF3SN/0qL9+6
 IHrnLLnyc1yYJ38X4JE2L5C9KxBNr+XzWPNJLVtIHvDzaBpdm1Nkidams93hncZvMh3L
 x3YQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUN9QdqbrJo4xl0iTZtKgPriNhw0IqUm61JS5AVVt1ITq8Yscdkns4nI1oMyvUnuh/zXGQU1v3sHfg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyyoD97QU8mrKUgAzJZrFN4ymp34bNscBj2Ko4KaOsQAikS1z3y
 dWE+qm86edVdFItdWyZFq6Hg8W6t7up/N4SdsPr0Nb3BIQ4HUZdPpxpyD41v93T+7WSrn1sEtw=
 =
X-Google-Smtp-Source: AGHT+IGpbTMLKH3Z//v+mS0oCFNNN5K9KgwxRuxW+vMV7GiwPseAyRHtw03enomMXvu4TmjvVSMQK6Mc+A==
X-Received: from fuad.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:1613])
 (user=tabba job=sendgmr) by 2002:a05:600c:4a21:b0:431:43e6:adfc
 with SMTP id
 5b1f17b1804b1-432b7527703mr24725e9.8.1731082844948; Fri, 08 Nov 2024 08:20:44
 -0800 (PST)
Date: Fri,  8 Nov 2024 16:20:31 +0000
In-Reply-To: <20241108162040.159038-1-tabba@google.com>
Mime-Version: 1.0
References: <20241108162040.159038-1-tabba@google.com>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241108162040.159038-2-tabba@google.com>
Subject: [RFC PATCH v1 01/10] mm/hugetlb: rename isolate_hugetlb() to
 folio_isolate_hugetlb()
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

Let's make the function name match "folio_isolate_lru()", and add some
kernel doc.

Signed-off-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 include/linux/hugetlb.h |  4 ++--
 mm/gup.c                |  2 +-
 mm/hugetlb.c            | 23 ++++++++++++++++++++---
 mm/mempolicy.c          |  2 +-
 mm/migrate.c            |  6 +++---
 5 files changed, 27 insertions(+), 10 deletions(-)

diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index ae4fe8615bb6..b0cf8dbfeb6a 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -153,7 +153,7 @@ bool hugetlb_reserve_pages(struct inode *inode, long from, long to,
 						vm_flags_t vm_flags);
 long hugetlb_unreserve_pages(struct inode *inode, long start, long end,
 						long freed);
-bool isolate_hugetlb(struct folio *folio, struct list_head *list);
+bool folio_isolate_hugetlb(struct folio *folio, struct list_head *list);
 int get_hwpoison_hugetlb_folio(struct folio *folio, bool *hugetlb, bool unpoison);
 int get_huge_page_for_hwpoison(unsigned long pfn, int flags,
 				bool *migratable_cleared);
@@ -414,7 +414,7 @@ static inline pte_t *huge_pte_offset(struct mm_struct *mm, unsigned long addr,
 	return NULL;
 }
 
-static inline bool isolate_hugetlb(struct folio *folio, struct list_head *list)
+static inline bool folio_isolate_hugetlb(struct folio *folio, struct list_head *list)
 {
 	return false;
 }
diff --git a/mm/gup.c b/mm/gup.c
index 28ae330ec4dd..40bbcffca865 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -2301,7 +2301,7 @@ static unsigned long collect_longterm_unpinnable_folios(
 			continue;
 
 		if (folio_test_hugetlb(folio)) {
-			isolate_hugetlb(folio, movable_folio_list);
+			folio_isolate_hugetlb(folio, movable_folio_list);
 			continue;
 		}
 
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index cec4b121193f..e17bb2847572 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -2868,7 +2868,7 @@ static int alloc_and_dissolve_hugetlb_folio(struct hstate *h,
 		 * Fail with -EBUSY if not possible.
 		 */
 		spin_unlock_irq(&hugetlb_lock);
-		isolated = isolate_hugetlb(old_folio, list);
+		isolated = folio_isolate_hugetlb(old_folio, list);
 		ret = isolated ? 0 : -EBUSY;
 		spin_lock_irq(&hugetlb_lock);
 		goto free_new;
@@ -2953,7 +2953,7 @@ int isolate_or_dissolve_huge_page(struct page *page, struct list_head *list)
 	if (hstate_is_gigantic(h))
 		return -ENOMEM;
 
-	if (folio_ref_count(folio) && isolate_hugetlb(folio, list))
+	if (folio_ref_count(folio) && folio_isolate_hugetlb(folio, list))
 		ret = 0;
 	else if (!folio_ref_count(folio))
 		ret = alloc_and_dissolve_hugetlb_folio(h, folio, list);
@@ -7396,7 +7396,24 @@ __weak unsigned long hugetlb_mask_last_page(struct hstate *h)
 
 #endif /* CONFIG_ARCH_WANT_GENERAL_HUGETLB */
 
-bool isolate_hugetlb(struct folio *folio, struct list_head *list)
+/**
+ * folio_isolate_hugetlb: try to isolate an allocated hugetlb folio
+ * @folio: the folio to isolate
+ * @list: the list to add the folio to on success
+ *
+ * Isolate an allocated (refcount > 0) hugetlb folio, marking it as
+ * isolated/non-migratable, and moving it from the active list to the
+ * given list.
+ *
+ * Isolation will fail if @folio is not an allocated hugetlb folio, or if
+ * it is already isolated/non-migratable.
+ *
+ * On success, an additional folio reference is taken that must be dropped
+ * using folio_putback_active_hugetlb() to undo the isolation.
+ *
+ * Return: True if isolation worked, otherwise False.
+ */
+bool folio_isolate_hugetlb(struct folio *folio, struct list_head *list)
 {
 	bool ret = true;
 
diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index bb37cd1a51d8..41bdff67757c 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -647,7 +647,7 @@ static int queue_folios_hugetlb(pte_t *pte, unsigned long hmask,
 	 */
 	if ((flags & MPOL_MF_MOVE_ALL) ||
 	    (!folio_likely_mapped_shared(folio) && !hugetlb_pmd_shared(pte)))
-		if (!isolate_hugetlb(folio, qp->pagelist))
+		if (!folio_isolate_hugetlb(folio, qp->pagelist))
 			qp->nr_failed++;
 unlock:
 	spin_unlock(ptl);
diff --git a/mm/migrate.c b/mm/migrate.c
index dfb5eba3c522..55585b5f57ec 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -136,7 +136,7 @@ static void putback_movable_folio(struct folio *folio)
  *
  * This function shall be used whenever the isolated pageset has been
  * built from lru, balloon, hugetlbfs page. See isolate_migratepages_range()
- * and isolate_hugetlb().
+ * and folio_isolate_hugetlb().
  */
 void putback_movable_pages(struct list_head *l)
 {
@@ -177,7 +177,7 @@ bool isolate_folio_to_list(struct folio *folio, struct list_head *list)
 	bool isolated, lru;
 
 	if (folio_test_hugetlb(folio))
-		return isolate_hugetlb(folio, list);
+		return folio_isolate_hugetlb(folio, list);
 
 	lru = !__folio_test_movable(folio);
 	if (lru)
@@ -2208,7 +2208,7 @@ static int __add_folio_for_migration(struct folio *folio, int node,
 		return -EACCES;
 
 	if (folio_test_hugetlb(folio)) {
-		if (isolate_hugetlb(folio, pagelist))
+		if (folio_isolate_hugetlb(folio, pagelist))
 			return 1;
 	} else if (folio_isolate_lru(folio)) {
 		list_add_tail(&folio->lru, pagelist);
-- 
2.47.0.277.g8800431eea-goog

