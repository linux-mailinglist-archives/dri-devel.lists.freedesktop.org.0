Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 495CA9C21E4
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2024 17:21:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9124D10EA0E;
	Fri,  8 Nov 2024 16:21:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="oSeBQdXk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com
 [209.85.221.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30D3410EA0D
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2024 16:21:00 +0000 (UTC)
Received: by mail-wr1-f73.google.com with SMTP id
 ffacd0b85a97d-37d5016d21eso1218048f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Nov 2024 08:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1731082858; x=1731687658;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=Z1UKVDyubm+0FNKQOmqAnK7wACyIXxMp06jV3hLqPe8=;
 b=oSeBQdXkP8KLppn0kAAqaKGsckQkBsphvEhQm4zAP/M+xO3CYEui4NZEqBiLJQ5ViE
 rcOp7oQLhYTQFNAjcOcjozJap0pdF1WM5aKJWHBjGSU30ybyC5zSN6pytVy5N4n+4/eh
 K/ee8nkXzNC27O6Yq90XZbF0SDm19YQqDpcA+U4DzU1b8bFQpgroRDQyT5lIK8ABdNAj
 huvR3kExiRdGXh2NYKLFmcQhIAqleKSphz46h/1kBmjUwnoC7/g6VHQkPTD5dw3le9ix
 FyrqNORkoK5Cdr5dv/Ert8nqDIy/+bT4a+YRvq77tiFRazRrq5/aQYwvLGfhb+fsef/F
 5/Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731082858; x=1731687658;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Z1UKVDyubm+0FNKQOmqAnK7wACyIXxMp06jV3hLqPe8=;
 b=W6rwUc1hWVYxCD4znos+q3ervt5LlaPOEbOoiSakcWqb9q51+7riS/NrYmeHZ0+sev
 p4y47GR8PHwyDZuguIoq/RypD2edOjb66Nxfx4NJVgiV/vePqSGw8yNXZF/JjDHc46wz
 j5IksqL9JA+nuLCCUTg+5zuYAuS68aJ3IGHU5mh23XsWo/i3kqo/2UIH0oxcw3xioua+
 LsqLv/OSjgzC/lUbByr29dfWQkQH6ta+XUFiaTk9N+q/xq0pfHvFS3hNjyEWmP2WhZDz
 TyAw5/1xi+azqZ4cce6tyiMp9UtFM1kf/SRsSjQfhwuWik4BaOxVpq/jYLhlmxh8x20o
 aVmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMygxywZ46Gtl5vbGFeucJmJhAzw7b8KExLxCifuI0SRrqIsq40jMnZUldiJVpmpcFBlqwccL8MxI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw7WgRM06Itzy5WhgFvUzMkDZ//PSlnzlXanzWv3EAWFluRGsSs
 HgPRt4RRMAMF9kButlhabqz3lzT/l5feBNbfFh5WGm1vDaqugjxKA6kB2Hh+OIZcL2uNx867UQ=
 =
X-Google-Smtp-Source: AGHT+IHkZAD0auPV4emIDnQo0+EU0NmTafyVDODnqw54sbX8+2pfhiQ95jeQsPF/8IsVn+XR42DkmZua1Q==
X-Received: from fuad.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:1613])
 (user=tabba job=sendgmr) by 2002:adf:ffca:0:b0:37d:4cee:559 with
 SMTP id
 ffacd0b85a97d-381f1862148mr2432f8f.3.1731082858585; Fri, 08 Nov 2024 08:20:58
 -0800 (PST)
Date: Fri,  8 Nov 2024 16:20:37 +0000
In-Reply-To: <20241108162040.159038-1-tabba@google.com>
Mime-Version: 1.0
References: <20241108162040.159038-1-tabba@google.com>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241108162040.159038-8-tabba@google.com>
Subject: [RFC PATCH v1 07/10] mm: Introduce struct folio_owner_ops
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

Introduce struct folio_owner_ops, a method table that contains
callbacks to owners of folios that need special handling for
certain operations. For now, it only contains a callback for
folio free(), which is called immediately after the folio
refcount drops to 0.

Add a pointer to this struct overlaid on struct page
compound_head, pgmap, and struct page/folio lru. The users of
this struct either will not use lru (e.g., zone device), or would
be able to easily isolate when lru is being used (e.g., hugetlb)
and handle it accordingly. While folios are isolated, they cannot
get freed and the owner_ops are unstable. This is sufficient for
the current use case of returning these folios to a custom
allocator.

To identify that a folio has owner_ops, we set bit 1 of the
field, in a similar way to that bit 0 of compound_head is used to
identify compound pages.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 include/linux/mm_types.h | 64 +++++++++++++++++++++++++++++++++++++---
 mm/swap.c                | 19 ++++++++++++
 2 files changed, 79 insertions(+), 4 deletions(-)

diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 365c73be0bb4..6e06286f44f1 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -41,10 +41,12 @@ struct mem_cgroup;
  *
  * If you allocate the page using alloc_pages(), you can use some of the
  * space in struct page for your own purposes.  The five words in the main
- * union are available, except for bit 0 of the first word which must be
- * kept clear.  Many users use this word to store a pointer to an object
- * which is guaranteed to be aligned.  If you use the same storage as
- * page->mapping, you must restore it to NULL before freeing the page.
+ * union are available, except for bit 0 (used for compound_head pages)
+ * and bit 1 (used for owner_ops) of the first word, which must be kept
+ * clear and used with care.  Many users use this word to store a pointer
+ * to an object which is guaranteed to be aligned.  If you use the same
+ * storage as page->mapping, you must restore it to NULL before freeing
+ * the page.
  *
  * The mapcount field must not be used for own purposes.
  *
@@ -283,10 +285,16 @@ typedef struct {
 	unsigned long val;
 } swp_entry_t;
 
+struct folio_owner_ops;
+
 /**
  * struct folio - Represents a contiguous set of bytes.
  * @flags: Identical to the page flags.
  * @lru: Least Recently Used list; tracks how recently this folio was used.
+ * @owner_ops: Pointer to callback operations of the folio owner. Valid if bit 1
+ *    is set.
+ *    NOTE: Cannot be used with lru, since it is overlaid with it. To use lru,
+ *          owner_ops must be cleared first, and restored once done with lru.
  * @mlock_count: Number of times this folio has been pinned by mlock().
  * @mapping: The file this page belongs to, or refers to the anon_vma for
  *    anonymous memory.
@@ -330,6 +338,7 @@ struct folio {
 			unsigned long flags;
 			union {
 				struct list_head lru;
+				const struct folio_owner_ops *owner_ops; /* Bit 1 is set */
 	/* private: avoid cluttering the output */
 				struct {
 					void *__filler;
@@ -417,6 +426,7 @@ FOLIO_MATCH(flags, flags);
 FOLIO_MATCH(lru, lru);
 FOLIO_MATCH(mapping, mapping);
 FOLIO_MATCH(compound_head, lru);
+FOLIO_MATCH(compound_head, owner_ops);
 FOLIO_MATCH(index, index);
 FOLIO_MATCH(private, private);
 FOLIO_MATCH(_mapcount, _mapcount);
@@ -452,6 +462,13 @@ FOLIO_MATCH(flags, _flags_3);
 FOLIO_MATCH(compound_head, _head_3);
 #undef FOLIO_MATCH
 
+struct folio_owner_ops {
+	/*
+	 * Called once the folio refcount reaches 0.
+	 */
+	void (*free)(struct folio *folio);
+};
+
 /**
  * struct ptdesc -    Memory descriptor for page tables.
  * @__page_flags:     Same as page flags. Powerpc only.
@@ -560,6 +577,45 @@ static inline void *folio_get_private(struct folio *folio)
 	return folio->private;
 }
 
+/*
+ * Use bit 1, since bit 0 is used to indicate a compound page in compound_head,
+ * which owner_ops is overlaid with.
+ */
+#define FOLIO_OWNER_OPS_BIT    1UL
+#define FOLIO_OWNER_OPS        (1UL << FOLIO_OWNER_OPS_BIT)
+
+/*
+ * Set the folio owner_ops as well as bit 1 of the pointer to indicate that the
+ * folio has owner_ops.
+ */
+static inline void folio_set_owner_ops(struct folio *folio, const struct folio_owner_ops *owner_ops)
+{
+	owner_ops = (const struct folio_owner_ops *)((unsigned long)owner_ops | FOLIO_OWNER_OPS);
+	folio->owner_ops = owner_ops;
+}
+
+/*
+ * Clear the folio owner_ops including bit 1 of the pointer.
+ */
+static inline void folio_clear_owner_ops(struct folio *folio)
+{
+	folio->owner_ops = NULL;
+}
+
+/*
+ * Return the folio's owner_ops if it has them, otherwise, return NULL.
+ */
+static inline const struct folio_owner_ops *folio_get_owner_ops(struct folio *folio)
+{
+	const struct folio_owner_ops *owner_ops = folio->owner_ops;
+
+	if (!((unsigned long)owner_ops & FOLIO_OWNER_OPS))
+		return NULL;
+
+	owner_ops = (const struct folio_owner_ops *)((unsigned long)owner_ops & ~FOLIO_OWNER_OPS);
+	return owner_ops;
+}
+
 struct page_frag_cache {
 	void * va;
 #if (PAGE_SIZE < PAGE_FRAG_CACHE_MAX_SIZE)
diff --git a/mm/swap.c b/mm/swap.c
index 638a3f001676..767ff6d8f47b 100644
--- a/mm/swap.c
+++ b/mm/swap.c
@@ -110,6 +110,13 @@ static void page_cache_release(struct folio *folio)
 
 void __folio_put(struct folio *folio)
 {
+	const struct folio_owner_ops *owner_ops = folio_get_owner_ops(folio);
+
+	if (unlikely(owner_ops)) {
+		owner_ops->free(folio);
+		return;
+	}
+
 	if (unlikely(folio_is_zone_device(folio))) {
 		free_zone_device_folio(folio);
 		return;
@@ -929,10 +936,22 @@ void folios_put_refs(struct folio_batch *folios, unsigned int *refs)
 	for (i = 0, j = 0; i < folios->nr; i++) {
 		struct folio *folio = folios->folios[i];
 		unsigned int nr_refs = refs ? refs[i] : 1;
+		const struct folio_owner_ops *owner_ops;
 
 		if (is_huge_zero_folio(folio))
 			continue;
 
+		owner_ops = folio_get_owner_ops(folio);
+		if (unlikely(owner_ops)) {
+			if (lruvec) {
+				unlock_page_lruvec_irqrestore(lruvec, flags);
+				lruvec = NULL;
+			}
+			if (folio_ref_sub_and_test(folio, nr_refs))
+				owner_ops->free(folio);
+			continue;
+		}
+
 		if (folio_is_zone_device(folio)) {
 			if (lruvec) {
 				unlock_page_lruvec_irqrestore(lruvec, flags);
-- 
2.47.0.277.g8800431eea-goog

