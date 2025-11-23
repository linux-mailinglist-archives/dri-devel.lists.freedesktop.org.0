Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A16FBC7DB4E
	for <lists+dri-devel@lfdr.de>; Sun, 23 Nov 2025 04:49:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1F0410E04E;
	Sun, 23 Nov 2025 03:49:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="P487AdA8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D6DA10E04E
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Nov 2025 03:49:04 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4777771ed1aso21032765e9.2
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Nov 2025 19:49:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763869743; x=1764474543; darn=lists.freedesktop.org;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:reply-to:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ZXsBhl22c1IQvTlRBqL+lM/+0Tdw6EnkyTO43xiSs+M=;
 b=P487AdA8k7w6ED5l3Ggd0Nn2Iz/db8B5NlGTx/GrntR0pzlrLKzIWPpfbDVBOBJQ6l
 ueJviVRmevc+pmKvYNNUbiIoLTN7QLG72CCgX7rOzGi9TLEjuUPOjOjhM/Vj5qAWTwyY
 Wz9SUDk9AG6Znulr3i7E8uzIxTVuG66nVScqb6Ac80uMlzdiN9M4ApGa4b33pV/zOgIY
 Gfnc2lM/QOJGIwOw8W7GB948io/whur38kASJVbxDX1sZVUEzzDkbpplAQOSERr1lZlo
 257n1p3xP5woSpPD5spZoCE0C4b84uorJEAbqyWBjcA9o5VMWnGKdmS2fzwRXuP9YCx2
 8uig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763869743; x=1764474543;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:reply-to:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZXsBhl22c1IQvTlRBqL+lM/+0Tdw6EnkyTO43xiSs+M=;
 b=Sv5e58pQjXZkMnlzmcUf4lS1Gfb2BGFerNTfuGE9VFohgXKGCFUlZH15lQVNpfwi8E
 lVovsZW1N9fr83B8KLgwm1ErIIfBYczc3cyEg0V9DUAb+SN9gd3A2Og0ro3YYZIO84pM
 Dre6tbVGZoHsdL9tXgvc89S3pJsJFfIXj05wY6YSv9tLnJRpbVJa6laG2wuGJCNTo/dW
 diVwTyextZqq0hvaR7G52q2ldCAsbCKzEiSF6cQJ3490P4bFgYbimme4vCdDzFA2SR7d
 oPNPkNY0vJD4SjG8BwW6JXZrpMlrFsEOXstQyL9wrGyPXyKERTF/FYpVyR1xFqIFzLYB
 TzQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwldcxYP1Qnwb9vzszcZ1ZPRzMlMX8QOTZETXmlxC/PQQezOODgPUSuhsxadRCGWxogP6iVovj0kQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxk9fPUJT8tErbm6NLAGvFt4KL8ZBWajdPE4d+4yijgTRRFoR2V
 pm6Y/bvCCrWYNctNyJOLEo9YkolO9bXt5ge9EMMw9W+7zqzr0GI9ze/H
X-Gm-Gg: ASbGncsl4v9QrqKxh4x81LpEKpGUG2lqXsXxGCgO18HFlLc+YcOBjeZw7VxuIu3Eb/C
 lxOgaKdu/k5w8dk4QXaSMxmX24uiYW9q1A2kEK9r/51ygWU52qHo490OAXqqNH2dbHjhQpgZGSa
 F59esVweU0/ZqB6LmJIdAl5agVPJlqgw0c/gej8UaX0vezjXChQVGfa16hgfeSzwrk7yuqYLZwt
 p388pIUNEnT4Hp6vIdRqyc/TRMtx0F+4a2pepd3opMibfyNVtB6UROWqFQOhZzCRhGppBuESJce
 kj5V23bcWzfQ2WjGLprVav707Lmg8a44l9l6cUSxXDWezdQjetdJeEtsU6tzPwedYT8zr48cZ5V
 xkc3BNPaqpm9XzljZopIUMN5hT289RQCxHxfDsY61w5cm/56JBeXHO3538f1TTnXRh8quqQQiQw
 c0u0FUxB0SLtCnkg==
X-Google-Smtp-Source: AGHT+IEbvlAKnsPBP96si9Xg/bJce/BPX2dyx8MBR559zWC8AHAjifETllRpS9g3zzpJlP7SUwQaJg==
X-Received: by 2002:a05:6000:22c9:b0:42b:2eb3:c910 with SMTP id
 ffacd0b85a97d-42cc1cd9466mr7001715f8f.3.1763869742340; 
 Sat, 22 Nov 2025 19:49:02 -0800 (PST)
Received: from localhost ([185.92.221.13]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7fa35c2sm19232083f8f.25.2025.11.22.19.49.01
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 22 Nov 2025 19:49:01 -0800 (PST)
Date: Sun, 23 Nov 2025 03:49:01 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Balbir Singh <balbirs@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Ralph Campbell <rcampbell@nvidia.com>,
 Mika =?iso-8859-1?Q?Penttil=E4?= <mpenttil@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: Re: [PATCH v2] fixup: mm/huge_memory.c: introduce folio_split_unmapped
Message-ID: <20251123034901.nqza7nlg57ivobzu@master>
References: <20251120134232.3588203-1-balbirs@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251120134232.3588203-1-balbirs@nvidia.com>
User-Agent: NeoMutt/20170113 (1.7.2)
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
Reply-To: Wei Yang <richard.weiyang@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 21, 2025 at 12:42:32AM +1100, Balbir Singh wrote:
>Code refactoring of __folio_split() via helper
>__folio_freeze_and_split_unmapped() caused a regression with clang-20
>with CONFIG_SHMEM=n, the compiler was not able to optimize away the
>call to shmem_uncharge() due to changes in nr_shmem_dropped.
>Fix this by adding a stub function for shmem_uncharge when
>CONFIG_SHMEM is not defined.
>
>smatch also complained about parameter end being used without
>initialization, which is a false positive, but keep the tool happy
>by sending in initialized parameters. end is initialized to 0.
>smatch still complains about mapping being NULL and nr_shmem_dropped
>may not be 0, but that is not true prior to or after the changes.
>
>Add detailed documentation comments for folio_split_unmapped()
>
>Cc: Andrew Morton <akpm@linux-foundation.org>
>Cc: David Hildenbrand <david@redhat.com>
>Cc: Zi Yan <ziy@nvidia.com>
>Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
>Cc: Rakie Kim <rakie.kim@sk.com>
>Cc: Byungchul Park <byungchul@sk.com>
>Cc: Gregory Price <gourry@gourry.net>
>Cc: Ying Huang <ying.huang@linux.alibaba.com>
>Cc: Alistair Popple <apopple@nvidia.com>
>Cc: Oscar Salvador <osalvador@suse.de>
>Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
>Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
>Cc: Nico Pache <npache@redhat.com>
>Cc: Ryan Roberts <ryan.roberts@arm.com>
>Cc: Dev Jain <dev.jain@arm.com>
>Cc: Barry Song <baohua@kernel.org>
>Cc: Lyude Paul <lyude@redhat.com>
>Cc: Danilo Krummrich <dakr@kernel.org>
>Cc: David Airlie <airlied@gmail.com>
>Cc: Simona Vetter <simona@ffwll.ch>
>Cc: Ralph Campbell <rcampbell@nvidia.com>
>Cc: Mika Penttilä <mpenttil@redhat.com>
>Cc: Matthew Brost <matthew.brost@intel.com>
>Cc: Francois Dugast <francois.dugast@intel.com>
>
>Suggested-by: David Hildenbrand <david@redhat.com>
>Signed-off-by: Balbir Singh <balbirs@nvidia.com>
>---
>This fixup should be squashed into the patch "mm/huge_memory.c:
>introduce folio_split_unmapped" in mm/mm-unstable
>
> include/linux/shmem_fs.h |  6 +++++-
> mm/huge_memory.c         | 30 +++++++++++++++++++++---------
> 2 files changed, 26 insertions(+), 10 deletions(-)
>
>diff --git a/include/linux/shmem_fs.h b/include/linux/shmem_fs.h
>index 5b368f9549d6..7a412dd6eb4f 100644
>--- a/include/linux/shmem_fs.h
>+++ b/include/linux/shmem_fs.h
>@@ -136,11 +136,16 @@ static inline bool shmem_hpage_pmd_enabled(void)
> 
> #ifdef CONFIG_SHMEM
> extern unsigned long shmem_swap_usage(struct vm_area_struct *vma);
>+extern void shmem_uncharge(struct inode *inode, long pages);
> #else
> static inline unsigned long shmem_swap_usage(struct vm_area_struct *vma)
> {
> 	return 0;
> }
>+
>+static void shmem_uncharge(struct inode *inode, long pages)
>+{
>+}
> #endif
> extern unsigned long shmem_partial_swap_usage(struct address_space *mapping,
> 						pgoff_t start, pgoff_t end);
>@@ -194,7 +199,6 @@ static inline pgoff_t shmem_fallocend(struct inode *inode, pgoff_t eof)
> }
> 
> extern bool shmem_charge(struct inode *inode, long pages);
>-extern void shmem_uncharge(struct inode *inode, long pages);
> 
> #ifdef CONFIG_USERFAULTFD
> #ifdef CONFIG_SHMEM
>diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>index 78a31a476ad3..18c12876f5e8 100644
>--- a/mm/huge_memory.c
>+++ b/mm/huge_memory.c
>@@ -3751,6 +3751,7 @@ static int __folio_freeze_and_split_unmapped(struct folio *folio, unsigned int n
> 	int ret = 0;
> 	struct deferred_split *ds_queue;
> 
>+	VM_WARN_ON_ONCE(!mapping && end);
> 	/* Prevent deferred_split_scan() touching ->_refcount */
> 	ds_queue = folio_split_queue_lock(folio);
> 	if (folio_ref_freeze(folio, 1 + extra_pins)) {
>@@ -3919,7 +3920,7 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
> 	int nr_shmem_dropped = 0;
> 	int remap_flags = 0;
> 	int extra_pins, ret;
>-	pgoff_t end;
>+	pgoff_t end = 0;
> 	bool is_hzp;
> 
> 	VM_WARN_ON_ONCE_FOLIO(!folio_test_locked(folio), folio);
>@@ -4092,16 +4093,27 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
> 	return ret;
> }
> 
>-/*
>- * This function is a helper for splitting folios that have already been unmapped.
>- * The use case is that the device or the CPU can refuse to migrate THP pages in
>- * the middle of migration, due to allocation issues on either side
>+/**
>+ * folio_split_unmapped() - split a large anon folio that is already unmapped
>+ * @folio: folio to split
>+ * @new_order: the order of folios after split
>+ *
>+ * This function is a helper for splitting folios that have already been
>+ * unmapped. The use case is that the device or the CPU can refuse to migrate
>+ * THP pages in the middle of migration, due to allocation issues on either
>+ * side.
>+ *
>+ * anon_vma_lock is not required to be held, mmap_read_lock() or
>+ * mmap_write_lock() should be held. @folio is expected to be locked by the

Took a look into its caller:

  __migrate_device_pages()
    migrate_vma_split_unmapped_folio()
      folio_split_unmapped()

I don't see where get the folio lock.

Would you mind giving me a hint where we toke the lock? Seems I missed that.

>+ * caller. device-private and non device-private folios are supported along
>+ * with folios that are in the swapcache. @folio should also be unmapped and
>+ * isolated from LRU (if applicable)
>  *
>- * The high level code is copied from __folio_split, since the pages are anonymous
>- * and are already isolated from the LRU, the code has been simplified to not
>- * burden __folio_split with unmapped sprinkled into the code.
>+ * Upon return, the folio is not remapped, split folios are not added to LRU,
>+ * free_folio_and_swap_cache() is not called, and new folios remain locked.
>  *
>- * None of the split folios are unlocked
>+ * Return: 0 on success, -EAGAIN if the folio cannot be split (e.g., due to
>+ *         insufficient reference count or extra pins).
>  */
> int folio_split_unmapped(struct folio *folio, unsigned int new_order)
> {
>-- 
>2.51.1
>

-- 
Wei Yang
Help you, Help me
