Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC128EE36
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 16:32:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F39126E9CB;
	Thu, 15 Aug 2019 14:32:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADB0B6E9CB
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 14:32:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D9414AEE5;
 Thu, 15 Aug 2019 14:32:24 +0000 (UTC)
Subject: Re: [Bug 204407] New: Bad page state in process Xorg
To: Petr Vandrovec <petr@vandrovec.name>, Matthew Wilcox <willy@infradead.org>
References: <bug-204407-27@https.bugzilla.kernel.org/>
 <20190802132306.e945f4420bc2dcddd8d34f75@linux-foundation.org>
 <20190802203344.GD5597@bombadil.infradead.org>
 <1564780650.11067.50.camel@lca.pw>
 <20190802225939.GE5597@bombadil.infradead.org>
 <CA+i2_Dc-VrOUk8EVThwAE5HZ1-zFqONuW8Gojv+16UPsAqoM1Q@mail.gmail.com>
From: Vlastimil Babka <vbabka@suse.cz>
Openpgp: preference=signencrypt
Autocrypt: addr=vbabka@suse.cz; prefer-encrypt=mutual; keydata=
 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
Message-ID: <45258da8-2ce7-68c2-1ba0-84f6c0e634b1@suse.cz>
Date: Thu, 15 Aug 2019 16:32:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CA+i2_Dc-VrOUk8EVThwAE5HZ1-zFqONuW8Gojv+16UPsAqoM1Q@mail.gmail.com>
Content-Type: multipart/mixed; boundary="------------F75BE80D724DEE18C4FE2B15"
Content-Language: en-US
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: David Airlie <airlied@linux.ie>, bugzilla-daemon@bugzilla.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Huang Rui <ray.huang@amd.com>, Qian Cai <cai@lca.pw>,
 Andrew Morton <akpm@linux-foundation.org>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------F75BE80D724DEE18C4FE2B15
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 8/3/19 1:29 AM, Petr Vandrovec wrote:
> On Fri, Aug 2, 2019, 3:59 PM Matthew Wilcox <willy@infradead.org
> <mailto:willy@infradead.org>> wrote:
> 
>     That doesn't help because we call reset_page_owner() in the free
>     page path.
> 
>     We could turn on tracing because we call trace_mm_page_free() in this
>     path.  That requires the reporter to be able to reproduce the problem,
>     and it's not clear to me whether this is a "happened once" or "every
>     time I do this, it happens" problem.
> 
> 
> It happened on 3 of the boots with that kernel.  4th time box either
> spontaneously rebooted when X started, or watchdog restarted box shortly
> after starting X server.
> 
> So I believe I should be able to reproduce it with additional patches or
> extra flags enabled.

Does the issue still happen with rc4? Could you apply the 3 attached
patches (work in progress), configure-enable CONFIG_DEBUG_PAGEALLOC and
CONFIG_PAGE_OWNER and boot kernel with debug_pagealloc=on page_owner=on
parameters? That should print stacktraces of allocation and first
freeing (assuming this is a double free).

Vlastimil


--------------F75BE80D724DEE18C4FE2B15
Content-Type: text/x-patch;
 name="0001-mm-page_owner-record-page-owner-for-each-subpage.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename*0="0001-mm-page_owner-record-page-owner-for-each-subpage.patch"

From 5b4c46cb1d7a8bca3e8d98433b19e60b28fb5796 Mon Sep 17 00:00:00 2001
From: Vlastimil Babka <vbabka@suse.cz>
Date: Thu, 15 Aug 2019 14:06:50 +0200
Subject: [PATCH 1/3] mm, page_owner: record page owner for each subpage

Currently, page owner info is only recorded for the first page of a high-order
allocation, and copied to tail pages in the event of a split page. With the
plan to keep previous owner info after freeing the page, it would be benefical
to record page owner for each subpage upon allocation. This increases the
overhead for high orders, but that should be acceptable for a debugging option.

Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
---
 mm/page_owner.c | 33 +++++++++++++++++++++------------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/mm/page_owner.c b/mm/page_owner.c
index addcbb2ae4e4..695cd5fdf7fd 100644
--- a/mm/page_owner.c
+++ b/mm/page_owner.c
@@ -154,18 +154,23 @@ static noinline depot_stack_handle_t save_stack(gfp_t flags)
 	return handle;
 }
 
-static inline void __set_page_owner_handle(struct page_ext *page_ext,
-	depot_stack_handle_t handle, unsigned int order, gfp_t gfp_mask)
+static inline void __set_page_owner_handle(struct page *page,
+	struct page_ext *page_ext, depot_stack_handle_t handle,
+	unsigned int order, gfp_t gfp_mask)
 {
 	struct page_owner *page_owner;
+	int i;
 
-	page_owner = get_page_owner(page_ext);
-	page_owner->handle = handle;
-	page_owner->order = order;
-	page_owner->gfp_mask = gfp_mask;
-	page_owner->last_migrate_reason = -1;
+	for (i = 0; i < (1 << order); i++) {
+		page_owner = get_page_owner(page_ext);
+		page_owner->handle = handle;
+		page_owner->order = order;
+		page_owner->gfp_mask = gfp_mask;
+		page_owner->last_migrate_reason = -1;
+		__set_bit(PAGE_EXT_OWNER, &page_ext->flags);
 
-	__set_bit(PAGE_EXT_OWNER, &page_ext->flags);
+		page_ext = lookup_page_ext(page + i);
+	}
 }
 
 noinline void __set_page_owner(struct page *page, unsigned int order,
@@ -178,7 +183,7 @@ noinline void __set_page_owner(struct page *page, unsigned int order,
 		return;
 
 	handle = save_stack(gfp_mask);
-	__set_page_owner_handle(page_ext, handle, order, gfp_mask);
+	__set_page_owner_handle(page, page_ext, handle, order, gfp_mask);
 }
 
 void __set_page_owner_migrate_reason(struct page *page, int reason)
@@ -204,8 +209,11 @@ void __split_page_owner(struct page *page, unsigned int order)
 
 	page_owner = get_page_owner(page_ext);
 	page_owner->order = 0;
-	for (i = 1; i < (1 << order); i++)
-		__copy_page_owner(page, page + i);
+	for (i = 1; i < (1 << order); i++) {
+		page_ext = lookup_page_ext(page + i);
+		page_owner = get_page_owner(page_ext);
+		page_owner->order = 0;
+	}
 }
 
 void __copy_page_owner(struct page *oldpage, struct page *newpage)
@@ -562,7 +570,8 @@ static void init_pages_in_zone(pg_data_t *pgdat, struct zone *zone)
 				continue;
 
 			/* Found early allocated page */
-			__set_page_owner_handle(page_ext, early_handle, 0, 0);
+			__set_page_owner_handle(page, page_ext, early_handle,
+						0, 0);
 			count++;
 		}
 		cond_resched();
-- 
2.22.0


--------------F75BE80D724DEE18C4FE2B15
Content-Type: text/x-patch;
 name="0002-mm-page_owner-keep-owner-info-when-freeing-the-page.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename*0="0002-mm-page_owner-keep-owner-info-when-freeing-the-page.pat";
 filename*1="ch"

From 063f233cc154819bb39a005726260496eea12265 Mon Sep 17 00:00:00 2001
From: Vlastimil Babka <vbabka@suse.cz>
Date: Thu, 15 Aug 2019 14:48:54 +0200
Subject: [PATCH 2/3] mm, page_owner: keep owner info when freeing the page

For debugging purposes it might be useful to keep the owner info even after
page has been freed and include it in e.g. dump_page() when detecting a bad
page state. For that, change the PAGE_EXT_OWNER flag meaning to "page owner
info has been set at least once" and add new PAGE_EXT_OWNER_ACTIVE for tracking
whether page is supposed to be currently allocated or free. Adjust dump_page()
and page_owner file printing accordingly.

Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
---
 include/linux/page_ext.h |  1 +
 mm/page_owner.c          | 38 +++++++++++++++++++++++++-------------
 2 files changed, 26 insertions(+), 13 deletions(-)

diff --git a/include/linux/page_ext.h b/include/linux/page_ext.h
index 09592951725c..682fd465df06 100644
--- a/include/linux/page_ext.h
+++ b/include/linux/page_ext.h
@@ -18,6 +18,7 @@ struct page_ext_operations {
 
 enum page_ext_flags {
 	PAGE_EXT_OWNER,
+	PAGE_EXT_OWNER_ACTIVE,
 #if defined(CONFIG_IDLE_PAGE_TRACKING) && !defined(CONFIG_64BIT)
 	PAGE_EXT_YOUNG,
 	PAGE_EXT_IDLE,
diff --git a/mm/page_owner.c b/mm/page_owner.c
index 695cd5fdf7fd..c4c33d569f4d 100644
--- a/mm/page_owner.c
+++ b/mm/page_owner.c
@@ -111,7 +111,7 @@ void __reset_page_owner(struct page *page, unsigned int order)
 		page_ext = lookup_page_ext(page + i);
 		if (unlikely(!page_ext))
 			continue;
-		__clear_bit(PAGE_EXT_OWNER, &page_ext->flags);
+		__clear_bit(PAGE_EXT_OWNER_ACTIVE, &page_ext->flags);
 	}
 }
 
@@ -168,6 +168,7 @@ static inline void __set_page_owner_handle(struct page *page,
 		page_owner->gfp_mask = gfp_mask;
 		page_owner->last_migrate_reason = -1;
 		__set_bit(PAGE_EXT_OWNER, &page_ext->flags);
+		__set_bit(PAGE_EXT_OWNER_ACTIVE, &page_ext->flags);
 
 		page_ext = lookup_page_ext(page + i);
 	}
@@ -243,6 +244,7 @@ void __copy_page_owner(struct page *oldpage, struct page *newpage)
 	 * the new page, which will be freed.
 	 */
 	__set_bit(PAGE_EXT_OWNER, &new_ext->flags);
+	__set_bit(PAGE_EXT_OWNER_ACTIVE, &new_ext->flags);
 }
 
 void pagetypeinfo_showmixedcount_print(struct seq_file *m,
@@ -302,7 +304,7 @@ void pagetypeinfo_showmixedcount_print(struct seq_file *m,
 			if (unlikely(!page_ext))
 				continue;
 
-			if (!test_bit(PAGE_EXT_OWNER, &page_ext->flags))
+			if (!test_bit(PAGE_EXT_OWNER_ACTIVE, &page_ext->flags))
 				continue;
 
 			page_owner = get_page_owner(page_ext);
@@ -331,7 +333,7 @@ void pagetypeinfo_showmixedcount_print(struct seq_file *m,
 static ssize_t
 print_page_owner(char __user *buf, size_t count, unsigned long pfn,
 		struct page *page, struct page_owner *page_owner,
-		depot_stack_handle_t handle)
+		depot_stack_handle_t handle, bool page_active)
 {
 	int ret, pageblock_mt, page_mt;
 	unsigned long *entries;
@@ -344,7 +346,9 @@ print_page_owner(char __user *buf, size_t count, unsigned long pfn,
 		return -ENOMEM;
 
 	ret = snprintf(kbuf, count,
-			"Page allocated via order %u, mask %#x(%pGg)\n",
+			"%s via order %u, mask %#x(%pGg)\n",
+			page_active ? "Page allocated" :
+				      "Free page previously allocated",
 			page_owner->order, page_owner->gfp_mask,
 			&page_owner->gfp_mask);
 
@@ -413,21 +417,26 @@ void __dump_page_owner(struct page *page)
 	mt = gfpflags_to_migratetype(gfp_mask);
 
 	if (!test_bit(PAGE_EXT_OWNER, &page_ext->flags)) {
-		pr_alert("page_owner info is not active (free page?)\n");
+		pr_alert("page_owner info is not present (never set?)\n");
 		return;
 	}
 
+	if (test_bit(PAGE_EXT_OWNER_ACTIVE, &page_ext->flags))
+		pr_alert("page_owner tracks the page as allocated\n");
+	else
+		pr_alert("page_owner tracks the page as freed\n");
+
+	pr_alert("page last allocated via order %u, migratetype %s, gfp_mask %#x(%pGg)\n",
+		 page_owner->order, migratetype_names[mt], gfp_mask, &gfp_mask);
+
 	handle = READ_ONCE(page_owner->handle);
 	if (!handle) {
-		pr_alert("page_owner info is not active (free page?)\n");
-		return;
+		pr_alert("page_owner allocation stack trace missing\n");
+	} else {
+		nr_entries = stack_depot_fetch(handle, &entries);
+		stack_trace_print(entries, nr_entries, 0);
 	}
 
-	nr_entries = stack_depot_fetch(handle, &entries);
-	pr_alert("page allocated via order %u, migratetype %s, gfp_mask %#x(%pGg)\n",
-		 page_owner->order, migratetype_names[mt], gfp_mask, &gfp_mask);
-	stack_trace_print(entries, nr_entries, 0);
-
 	if (page_owner->last_migrate_reason != -1)
 		pr_alert("page has been migrated, last migrate reason: %s\n",
 			migrate_reason_names[page_owner->last_migrate_reason]);
@@ -441,6 +450,7 @@ read_page_owner(struct file *file, char __user *buf, size_t count, loff_t *ppos)
 	struct page_ext *page_ext;
 	struct page_owner *page_owner;
 	depot_stack_handle_t handle;
+	bool page_active;
 
 	if (!static_branch_unlikely(&page_owner_inited))
 		return -EINVAL;
@@ -489,6 +499,8 @@ read_page_owner(struct file *file, char __user *buf, size_t count, loff_t *ppos)
 		if (!test_bit(PAGE_EXT_OWNER, &page_ext->flags))
 			continue;
 
+		page_active = test_bit(PAGE_EXT_OWNER_ACTIVE, &page_ext->flags);
+
 		page_owner = get_page_owner(page_ext);
 
 		/*
@@ -503,7 +515,7 @@ read_page_owner(struct file *file, char __user *buf, size_t count, loff_t *ppos)
 		*ppos = (pfn - min_low_pfn) + 1;
 
 		return print_page_owner(buf, count, pfn, page,
-				page_owner, handle);
+				page_owner, handle, page_active);
 	}
 
 	return 0;
-- 
2.22.0


--------------F75BE80D724DEE18C4FE2B15
Content-Type: text/x-patch;
 name="0003-mm-page_owner-debug_pagealloc-save-freeing-stack-tra.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename*0="0003-mm-page_owner-debug_pagealloc-save-freeing-stack-tra.pa";
 filename*1="tch"

From 4df89531903b8f0a056d3ec7f21825d0a22df355 Mon Sep 17 00:00:00 2001
From: Vlastimil Babka <vbabka@suse.cz>
Date: Thu, 15 Aug 2019 16:28:14 +0200
Subject: [PATCH 3/3] mm, page_owner, debug_pagealloc: save freeing stack trace

Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
---
 mm/page_owner.c | 53 +++++++++++++++++++++++++++++++++++++------------
 1 file changed, 40 insertions(+), 13 deletions(-)

diff --git a/mm/page_owner.c b/mm/page_owner.c
index c4c33d569f4d..f2eccea86210 100644
--- a/mm/page_owner.c
+++ b/mm/page_owner.c
@@ -24,6 +24,9 @@ struct page_owner {
 	short last_migrate_reason;
 	gfp_t gfp_mask;
 	depot_stack_handle_t handle;
+#ifdef CONFIG_DEBUG_PAGEALLOC
+	depot_stack_handle_t free_handle;
+#endif
 };
 
 static bool page_owner_disabled = true;
@@ -102,19 +105,6 @@ static inline struct page_owner *get_page_owner(struct page_ext *page_ext)
 	return (void *)page_ext + page_owner_ops.offset;
 }
 
-void __reset_page_owner(struct page *page, unsigned int order)
-{
-	int i;
-	struct page_ext *page_ext;
-
-	for (i = 0; i < (1 << order); i++) {
-		page_ext = lookup_page_ext(page + i);
-		if (unlikely(!page_ext))
-			continue;
-		__clear_bit(PAGE_EXT_OWNER_ACTIVE, &page_ext->flags);
-	}
-}
-
 static inline bool check_recursive_alloc(unsigned long *entries,
 					 unsigned int nr_entries,
 					 unsigned long ip)
@@ -154,6 +144,32 @@ static noinline depot_stack_handle_t save_stack(gfp_t flags)
 	return handle;
 }
 
+void __reset_page_owner(struct page *page, unsigned int order)
+{
+	int i;
+	struct page_ext *page_ext;
+#ifdef CONFIG_DEBUG_PAGEALLOC
+	depot_stack_handle_t handle = 0;
+	struct page_owner *page_owner;
+
+	if (debug_pagealloc_enabled())
+		handle = save_stack(GFP_NOWAIT | __GFP_NOWARN);
+#endif
+
+	for (i = 0; i < (1 << order); i++) {
+		page_ext = lookup_page_ext(page + i);
+		if (unlikely(!page_ext))
+			continue;
+		__clear_bit(PAGE_EXT_OWNER_ACTIVE, &page_ext->flags);
+#ifdef CONFIG_DEBUG_PAGEALLOC
+		if (debug_pagealloc_enabled()) {
+			page_owner = get_page_owner(page_ext);
+			page_owner->free_handle = handle;
+		}
+#endif
+	}
+}
+
 static inline void __set_page_owner_handle(struct page *page,
 	struct page_ext *page_ext, depot_stack_handle_t handle,
 	unsigned int order, gfp_t gfp_mask)
@@ -437,6 +453,17 @@ void __dump_page_owner(struct page *page)
 		stack_trace_print(entries, nr_entries, 0);
 	}
 
+#ifdef CONFIG_DEBUG_PAGEALLOC
+	handle = READ_ONCE(page_owner->free_handle);
+	if (!handle) {
+		pr_alert("page_owner free stack trace missing\n");
+	} else {
+		nr_entries = stack_depot_fetch(handle, &entries);
+		pr_alert("page last free stack trace:\n");
+		stack_trace_print(entries, nr_entries, 0);
+	}
+#endif
+
 	if (page_owner->last_migrate_reason != -1)
 		pr_alert("page has been migrated, last migrate reason: %s\n",
 			migrate_reason_names[page_owner->last_migrate_reason]);
-- 
2.22.0


--------------F75BE80D724DEE18C4FE2B15
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--------------F75BE80D724DEE18C4FE2B15--
