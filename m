Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E5C386FD0
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 04:08:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79D056E59D;
	Tue, 18 May 2021 02:08:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CF306E59D
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 02:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621303721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5HZn2zwZ+EQ0KKX04x5vRJ0fP4FrUjaKDH82oMcdEz0=;
 b=UrQlm4IWV3tcffuUW8yDM2DiTYu1wnwZZ/O+1pGvjgttQXEnj2DEOLEngmDuqWZfUqT/Xo
 EMutSheCoYxyAOpkn3nIzdgG9NmOTbUMNmRm9vySolgECSqllZ/5KKPhLkeheX6NT9+leL
 jOv8LMl0Tl9BhCi8wfF4zat+6BHZpyU=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-CTnk4bvaNcWa4SV2cqGM4w-1; Mon, 17 May 2021 22:08:39 -0400
X-MC-Unique: CTnk4bvaNcWa4SV2cqGM4w-1
Received: by mail-qt1-f199.google.com with SMTP id
 e13-20020ac84e4d0000b02901e0f0a55411so6428028qtw.9
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 19:08:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5HZn2zwZ+EQ0KKX04x5vRJ0fP4FrUjaKDH82oMcdEz0=;
 b=YYFsaU2k2Q8VTEazgYwnTwNB3j16hE5F1kXfHePm8Zawsv40kTxycND+HWruXttWom
 SosuWIOMniuNdEUGiUIlCz+vf1w9Hybw+0yeW59HA/GSH4bjF8ky1UHY+JNnjoq9D1MX
 LV4BF/yEZbbeAwwfVqUQDqXp5ipUJKSCrWno3zjPmnvM5PL3znmmbDJrC3MacGKFAQUi
 0frYN9r7mJGH4yEfZuedm3nQp/JwbIuXqhmBRwGUAl+LfIHRUq6A98qFiaXLbV3WQu9e
 2JI3ZXuiQQmi9QNsCnP4Pjk4BCIlmQ5VyOmV1uIAlKF174DAZjxW+ahbRKQGRkdxnAZD
 SiOQ==
X-Gm-Message-State: AOAM533ekyJV1PSr5fIUcNshIARzWE0aQl8kz5W67OnKkXc2g3Ao+e5t
 9L/cgTOU9nRSMGfPUsPi9qQ9IKppFdjprK/q7TaAtLEINJCA597iXnLsoIXVSojJ0LtiGXHpLXF
 AnUYwZmxMuNT9T5ZiJyVbOKi4MfsR
X-Received: by 2002:a37:6688:: with SMTP id a130mr3144666qkc.168.1621303718498; 
 Mon, 17 May 2021 19:08:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxYj6AwIJiLzrjGL6q7FE5kdo5I8O4NWaZ2qcCywUJHzeBxPycP7Wv2MVdwYXcxTM2Krh3/IA==
X-Received: by 2002:a37:6688:: with SMTP id a130mr3144577qkc.168.1621303717355; 
 Mon, 17 May 2021 19:08:37 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-72-184-145-4-219.dsl.bell.ca.
 [184.145.4.219])
 by smtp.gmail.com with ESMTPSA id d6sm12134571qkf.109.2021.05.17.19.08.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 19:08:36 -0700 (PDT)
Date: Mon, 17 May 2021 22:08:34 -0400
From: Peter Xu <peterx@redhat.com>
To: Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v8 5/8] mm: Device exclusive memory access
Message-ID: <YKMhorngO2DVrxac@t490s>
References: <20210407084238.20443-1-apopple@nvidia.com>
 <20210407084238.20443-6-apopple@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20210407084238.20443-6-apopple@nvidia.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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
Cc: rcampbell@nvidia.com, willy@infradead.org, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, bsingharora@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hch@infradead.org, linux-mm@kvack.org, jglisse@redhat.com, bskeggs@redhat.com,
 jgg@nvidia.com, jhubbard@nvidia.com, akpm@linux-foundation.org,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Alistair,

The overall patch looks good to me, however I have a few comments or questions
inlined below.

On Wed, Apr 07, 2021 at 06:42:35PM +1000, Alistair Popple wrote:
> Some devices require exclusive write access to shared virtual
> memory (SVM) ranges to perform atomic operations on that memory. This
> requires CPU page tables to be updated to deny access whilst atomic
> operations are occurring.
> 
> In order to do this introduce a new swap entry
> type (SWP_DEVICE_EXCLUSIVE). When a SVM range needs to be marked for
> exclusive access by a device all page table mappings for the particular
> range are replaced with device exclusive swap entries. This causes any
> CPU access to the page to result in a fault.
> 
> Faults are resovled by replacing the faulting entry with the original
> mapping. This results in MMU notifiers being called which a driver uses
> to update access permissions such as revoking atomic access. After
> notifiers have been called the device will no longer have exclusive
> access to the region.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> 
> ---
> 
> v8:
> * Remove device exclusive entries on fork rather than copy them.
> 
> v7:
> * Added Christoph's Reviewed-by.
> * Minor cosmetic cleanups suggested by Christoph.
> * Replace mmu_notifier_range_init_migrate/exclusive with
>   mmu_notifier_range_init_owner as suggested by Christoph.
> * Replaced lock_page() with lock_page_retry() when handling faults.
> * Restrict to anonymous pages for now.
> 
> v6:
> * Fixed a bisectablity issue due to incorrectly applying the rename of
>   migrate_pgmap_owner to the wrong patches for Nouveau and hmm_test.
> 
> v5:
> * Renamed range->migrate_pgmap_owner to range->owner.

May be nicer to mention this rename in commit message (or make it a separate
patch)?

> * Added MMU_NOTIFY_EXCLUSIVE to allow passing of a driver cookie which
>   allows notifiers called as a result of make_device_exclusive_range() to
>   be ignored.
> * Added a check to try_to_protect_one() to detect if the pages originally
>   returned from get_user_pages() have been unmapped or not.
> * Removed check_device_exclusive_range() as it is no longer required with
>   the other changes.
> * Documentation update.
> 
> v4:
> * Add function to check that mappings are still valid and exclusive.
> * s/long/unsigned long/ in make_device_exclusive_entry().
> ---
>  Documentation/vm/hmm.rst              |  19 ++-
>  drivers/gpu/drm/nouveau/nouveau_svm.c |   2 +-
>  include/linux/mmu_notifier.h          |  26 ++--
>  include/linux/rmap.h                  |   4 +
>  include/linux/swap.h                  |   4 +-
>  include/linux/swapops.h               |  44 +++++-
>  lib/test_hmm.c                        |   2 +-
>  mm/hmm.c                              |   5 +
>  mm/memory.c                           | 176 +++++++++++++++++++--
>  mm/migrate.c                          |  10 +-
>  mm/mprotect.c                         |   8 +
>  mm/page_vma_mapped.c                  |   9 +-
>  mm/rmap.c                             | 210 ++++++++++++++++++++++++++
>  13 files changed, 487 insertions(+), 32 deletions(-)
> 
> diff --git a/Documentation/vm/hmm.rst b/Documentation/vm/hmm.rst
> index 09e28507f5b2..a14c2938e7af 100644
> --- a/Documentation/vm/hmm.rst
> +++ b/Documentation/vm/hmm.rst
> @@ -332,7 +332,7 @@ between device driver specific code and shared common code:
>     walks to fill in the ``args->src`` array with PFNs to be migrated.
>     The ``invalidate_range_start()`` callback is passed a
>     ``struct mmu_notifier_range`` with the ``event`` field set to
> -   ``MMU_NOTIFY_MIGRATE`` and the ``migrate_pgmap_owner`` field set to
> +   ``MMU_NOTIFY_MIGRATE`` and the ``owner`` field set to
>     the ``args->pgmap_owner`` field passed to migrate_vma_setup(). This is
>     allows the device driver to skip the invalidation callback and only
>     invalidate device private MMU mappings that are actually migrating.
> @@ -405,6 +405,23 @@ between device driver specific code and shared common code:
>  
>     The lock can now be released.
>  
> +Exclusive access memory
> +=======================
> +
> +Some devices have features such as atomic PTE bits that can be used to implement
> +atomic access to system memory. To support atomic operations to a shared virtual
> +memory page such a device needs access to that page which is exclusive of any
> +userspace access from the CPU. The ``make_device_exclusive_range()`` function
> +can be used to make a memory range inaccessible from userspace.
> +
> +This replaces all mappings for pages in the given range with special swap
> +entries. Any attempt to access the swap entry results in a fault which is
> +resovled by replacing the entry with the original mapping. A driver gets
> +notified that the mapping has been changed by MMU notifiers, after which point
> +it will no longer have exclusive access to the page. Exclusive access is
> +guranteed to last until the driver drops the page lock and page reference, at
> +which point any CPU faults on the page may proceed as described.
> +
>  Memory cgroup (memcg) and rss accounting
>  ========================================
>  
> diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
> index f18bd53da052..94f841026c3b 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_svm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
> @@ -265,7 +265,7 @@ nouveau_svmm_invalidate_range_start(struct mmu_notifier *mn,
>  	 * the invalidation is handled as part of the migration process.
>  	 */
>  	if (update->event == MMU_NOTIFY_MIGRATE &&
> -	    update->migrate_pgmap_owner == svmm->vmm->cli->drm->dev)
> +	    update->owner == svmm->vmm->cli->drm->dev)
>  		goto out;
>  
>  	if (limit > svmm->unmanaged.start && start < svmm->unmanaged.limit) {
> diff --git a/include/linux/mmu_notifier.h b/include/linux/mmu_notifier.h
> index b8200782dede..2e6068d3fb9f 100644
> --- a/include/linux/mmu_notifier.h
> +++ b/include/linux/mmu_notifier.h
> @@ -41,7 +41,12 @@ struct mmu_interval_notifier;
>   *
>   * @MMU_NOTIFY_MIGRATE: used during migrate_vma_collect() invalidate to signal
>   * a device driver to possibly ignore the invalidation if the
> - * migrate_pgmap_owner field matches the driver's device private pgmap owner.
> + * owner field matches the driver's device private pgmap owner.
> + *
> + * @MMU_NOTIFY_EXCLUSIVE: to signal a device driver that the device will no
> + * longer have exclusive access to the page. May ignore the invalidation that's
> + * part of make_device_exclusive_range() if the owner field
> + * matches the value passed to make_device_exclusive_range().
>   */
>  enum mmu_notifier_event {
>  	MMU_NOTIFY_UNMAP = 0,
> @@ -51,6 +56,7 @@ enum mmu_notifier_event {
>  	MMU_NOTIFY_SOFT_DIRTY,
>  	MMU_NOTIFY_RELEASE,
>  	MMU_NOTIFY_MIGRATE,
> +	MMU_NOTIFY_EXCLUSIVE,
>  };
>  
>  #define MMU_NOTIFIER_RANGE_BLOCKABLE (1 << 0)
> @@ -269,7 +275,7 @@ struct mmu_notifier_range {
>  	unsigned long end;
>  	unsigned flags;
>  	enum mmu_notifier_event event;
> -	void *migrate_pgmap_owner;
> +	void *owner;
>  };
>  
>  static inline int mm_has_notifiers(struct mm_struct *mm)
> @@ -521,14 +527,14 @@ static inline void mmu_notifier_range_init(struct mmu_notifier_range *range,
>  	range->flags = flags;
>  }
>  
> -static inline void mmu_notifier_range_init_migrate(
> -			struct mmu_notifier_range *range, unsigned int flags,
> +static inline void mmu_notifier_range_init_owner(
> +			struct mmu_notifier_range *range,
> +			enum mmu_notifier_event event, unsigned int flags,
>  			struct vm_area_struct *vma, struct mm_struct *mm,
> -			unsigned long start, unsigned long end, void *pgmap)
> +			unsigned long start, unsigned long end, void *owner)
>  {
> -	mmu_notifier_range_init(range, MMU_NOTIFY_MIGRATE, flags, vma, mm,
> -				start, end);
> -	range->migrate_pgmap_owner = pgmap;
> +	mmu_notifier_range_init(range, event, flags, vma, mm, start, end);
> +	range->owner = owner;
>  }
>  
>  #define ptep_clear_flush_young_notify(__vma, __address, __ptep)		\
> @@ -655,8 +661,8 @@ static inline void _mmu_notifier_range_init(struct mmu_notifier_range *range,
>  
>  #define mmu_notifier_range_init(range,event,flags,vma,mm,start,end)  \
>  	_mmu_notifier_range_init(range, start, end)
> -#define mmu_notifier_range_init_migrate(range, flags, vma, mm, start, end, \
> -					pgmap) \
> +#define mmu_notifier_range_init_owner(range, event, flags, vma, mm, start, \
> +					end, owner) \
>  	_mmu_notifier_range_init(range, start, end)
>  
>  static inline bool
> diff --git a/include/linux/rmap.h b/include/linux/rmap.h
> index 0e25d829f742..3a1ce4ef9276 100644
> --- a/include/linux/rmap.h
> +++ b/include/linux/rmap.h
> @@ -193,6 +193,10 @@ int page_referenced(struct page *, int is_locked,
>  bool try_to_migrate(struct page *page, enum ttu_flags flags);
>  bool try_to_unmap(struct page *, enum ttu_flags flags);
>  
> +int make_device_exclusive_range(struct mm_struct *mm, unsigned long start,
> +				unsigned long end, struct page **pages,
> +				void *arg);
> +
>  /* Avoid racy checks */
>  #define PVMW_SYNC		(1 << 0)
>  /* Look for migarion entries rather than present PTEs */
> diff --git a/include/linux/swap.h b/include/linux/swap.h
> index 516104b9334b..7a3c260146df 100644
> --- a/include/linux/swap.h
> +++ b/include/linux/swap.h
> @@ -63,9 +63,11 @@ static inline int current_is_kswapd(void)
>   * to a special SWP_DEVICE_* entry.
>   */

Should we add another short description for the newly added two types?
Otherwise the reader could get confused assuming the above comment is
explaining all four types, while it is for SWP_DEVICE_{READ|WRITE} only?

>  #ifdef CONFIG_DEVICE_PRIVATE
> -#define SWP_DEVICE_NUM 2
> +#define SWP_DEVICE_NUM 4
>  #define SWP_DEVICE_WRITE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM)
>  #define SWP_DEVICE_READ (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+1)
> +#define SWP_DEVICE_EXCLUSIVE_WRITE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+2)
> +#define SWP_DEVICE_EXCLUSIVE_READ (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+3)
>  #else
>  #define SWP_DEVICE_NUM 0
>  #endif
> diff --git a/include/linux/swapops.h b/include/linux/swapops.h
> index 4dfd807ae52a..4129bd2ff9d6 100644
> --- a/include/linux/swapops.h
> +++ b/include/linux/swapops.h
> @@ -120,6 +120,27 @@ static inline bool is_writable_device_private_entry(swp_entry_t entry)
>  {
>  	return unlikely(swp_type(entry) == SWP_DEVICE_WRITE);
>  }
> +
> +static inline swp_entry_t make_readable_device_exclusive_entry(pgoff_t offset)
> +{
> +	return swp_entry(SWP_DEVICE_EXCLUSIVE_READ, offset);
> +}
> +
> +static inline swp_entry_t make_writable_device_exclusive_entry(pgoff_t offset)
> +{
> +	return swp_entry(SWP_DEVICE_EXCLUSIVE_WRITE, offset);
> +}
> +
> +static inline bool is_device_exclusive_entry(swp_entry_t entry)
> +{
> +	return swp_type(entry) == SWP_DEVICE_EXCLUSIVE_READ ||
> +		swp_type(entry) == SWP_DEVICE_EXCLUSIVE_WRITE;
> +}
> +
> +static inline bool is_writable_device_exclusive_entry(swp_entry_t entry)
> +{
> +	return unlikely(swp_type(entry) == SWP_DEVICE_EXCLUSIVE_WRITE);
> +}
>  #else /* CONFIG_DEVICE_PRIVATE */
>  static inline swp_entry_t make_readable_device_private_entry(pgoff_t offset)
>  {
> @@ -140,6 +161,26 @@ static inline bool is_writable_device_private_entry(swp_entry_t entry)
>  {
>  	return false;
>  }
> +
> +static inline swp_entry_t make_readable_device_exclusive_entry(pgoff_t offset)
> +{
> +	return swp_entry(0, 0);
> +}
> +
> +static inline swp_entry_t make_writable_device_exclusive_entry(pgoff_t offset)
> +{
> +	return swp_entry(0, 0);
> +}
> +
> +static inline bool is_device_exclusive_entry(swp_entry_t entry)
> +{
> +	return false;
> +}
> +
> +static inline bool is_writable_device_exclusive_entry(swp_entry_t entry)
> +{
> +	return false;
> +}
>  #endif /* CONFIG_DEVICE_PRIVATE */
>  
>  #ifdef CONFIG_MIGRATION
> @@ -219,7 +260,8 @@ static inline struct page *pfn_swap_entry_to_page(swp_entry_t entry)
>   */
>  static inline bool is_pfn_swap_entry(swp_entry_t entry)
>  {
> -	return is_migration_entry(entry) || is_device_private_entry(entry);
> +	return is_migration_entry(entry) || is_device_private_entry(entry) ||
> +	       is_device_exclusive_entry(entry);
>  }
>  
>  struct page_vma_mapped_walk;
> diff --git a/lib/test_hmm.c b/lib/test_hmm.c
> index 80a78877bd93..5c9f5a020c1d 100644
> --- a/lib/test_hmm.c
> +++ b/lib/test_hmm.c
> @@ -218,7 +218,7 @@ static bool dmirror_interval_invalidate(struct mmu_interval_notifier *mni,
>  	 * the invalidation is handled as part of the migration process.
>  	 */
>  	if (range->event == MMU_NOTIFY_MIGRATE &&
> -	    range->migrate_pgmap_owner == dmirror->mdevice)
> +	    range->owner == dmirror->mdevice)
>  		return true;
>  
>  	if (mmu_notifier_range_blockable(range))
> diff --git a/mm/hmm.c b/mm/hmm.c
> index 11df3ca30b82..fad6be2bf072 100644
> --- a/mm/hmm.c
> +++ b/mm/hmm.c
> @@ -26,6 +26,8 @@
>  #include <linux/mmu_notifier.h>
>  #include <linux/memory_hotplug.h>
>  
> +#include "internal.h"
> +
>  struct hmm_vma_walk {
>  	struct hmm_range	*range;
>  	unsigned long		last;
> @@ -271,6 +273,9 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
>  		if (!non_swap_entry(entry))
>  			goto fault;
>  
> +		if (is_device_exclusive_entry(entry))
> +			goto fault;
> +
>  		if (is_migration_entry(entry)) {
>  			pte_unmap(ptep);
>  			hmm_vma_walk->last = addr;
> diff --git a/mm/memory.c b/mm/memory.c
> index 3a5705cfc891..556ff396f2e9 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -700,6 +700,84 @@ struct page *vm_normal_page_pmd(struct vm_area_struct *vma, unsigned long addr,
>  }
>  #endif
>  
> +static void restore_exclusive_pte(struct vm_area_struct *vma,
> +				  struct page *page, unsigned long address,
> +				  pte_t *ptep)
> +{
> +	pte_t pte;
> +	swp_entry_t entry;
> +
> +	pte = pte_mkold(mk_pte(page, READ_ONCE(vma->vm_page_prot)));
> +	if (pte_swp_soft_dirty(*ptep))
> +		pte = pte_mksoft_dirty(pte);
> +
> +	entry = pte_to_swp_entry(*ptep);
> +	if (pte_swp_uffd_wp(*ptep))
> +		pte = pte_mkuffd_wp(pte);
> +	else if (is_writable_device_exclusive_entry(entry))
> +		pte = maybe_mkwrite(pte_mkdirty(pte), vma);
> +
> +	set_pte_at(vma->vm_mm, address, ptep, pte);
> +
> +	/*
> +	 * No need to take a page reference as one was already
> +	 * created when the swap entry was made.
> +	 */
> +	if (PageAnon(page))
> +		page_add_anon_rmap(page, vma, address, false);
> +	else
> +		page_add_file_rmap(page, false);
> +
> +	if (vma->vm_flags & VM_LOCKED)
> +		mlock_vma_page(page);
> +
> +	/*
> +	 * No need to invalidate - it was non-present before. However
> +	 * secondary CPUs may have mappings that need invalidating.
> +	 */
> +	update_mmu_cache(vma, address, ptep);
> +}
> +
> +/*
> + * Tries to restore an exclusive pte if the page lock can be acquired without
> + * sleeping. Returns 0 on success or -EBUSY if the page could not be locked or
> + * the entry no longer points at locked_page in which case locked_page should be
> + * locked before retrying the call.
> + */
> +static unsigned long
> +try_restore_exclusive_pte(struct mm_struct *src_mm, pte_t *src_pte,
> +			  struct vm_area_struct *vma, unsigned long addr,
> +			  struct page **locked_page)
> +{
> +	swp_entry_t entry = pte_to_swp_entry(*src_pte);
> +	struct page *page = pfn_swap_entry_to_page(entry);
> +
> +	if (*locked_page) {
> +		/* The entry changed, retry */
> +		if (unlikely(*locked_page != page)) {
> +			unlock_page(*locked_page);
> +			put_page(*locked_page);
> +			*locked_page = page;
> +			return -EBUSY;
> +		}
> +		restore_exclusive_pte(vma, page, addr, src_pte);
> +		unlock_page(page);
> +		put_page(page);
> +		*locked_page = NULL;
> +		return 0;
> +	}
> +
> +	if (trylock_page(page)) {
> +		restore_exclusive_pte(vma, page, addr, src_pte);
> +		unlock_page(page);
> +		return 0;
> +	}
> +
> +	/* The page couldn't be locked so drop the locks and retry. */
> +	*locked_page = page;
> +	return -EBUSY;
> +}
> +
>  /*
>   * copy one vm_area from one task to the other. Assumes the page tables
>   * already present in the new task to be cleared in the whole range
> @@ -781,6 +859,12 @@ copy_nonpresent_pte(struct mm_struct *dst_mm, struct mm_struct *src_mm,
>  				pte = pte_swp_mkuffd_wp(pte);
>  			set_pte_at(src_mm, addr, src_pte, pte);
>  		}
> +	} else if (is_device_exclusive_entry(entry)) {
> +		/* COW mappings should be dealt with by removing the entry */
> +		VM_BUG_ON(is_cow_mapping(vm_flags));
> +		page = pfn_swap_entry_to_page(entry);
> +		get_page(page);
> +		rss[mm_counter(page)]++;
>  	}
>  	set_pte_at(dst_mm, addr, dst_pte, pte);
>  	return 0;
> @@ -947,6 +1031,7 @@ copy_pte_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
>  	int rss[NR_MM_COUNTERS];
>  	swp_entry_t entry = (swp_entry_t){0};
>  	struct page *prealloc = NULL;
> +	struct page *locked_page = NULL;
>  
>  again:
>  	progress = 0;
> @@ -980,13 +1065,36 @@ copy_pte_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
>  			continue;
>  		}
>  		if (unlikely(!pte_present(*src_pte))) {
> -			entry.val = copy_nonpresent_pte(dst_mm, src_mm,
> -							dst_pte, src_pte,
> -							src_vma, addr, rss);
> -			if (entry.val)
> -				break;
> -			progress += 8;
> -			continue;
> +			swp_entry_t swp_entry = pte_to_swp_entry(*src_pte);
> +
> +			if (unlikely(is_cow_mapping(src_vma->vm_flags) &&
> +			    is_device_exclusive_entry(swp_entry))) {
> +				/*
> +				 * Normally this would require sending mmu
> +				 * notifiers, but copy_page_range() has already
> +				 * done that for COW mappings.
> +				 */
> +				ret = try_restore_exclusive_pte(src_mm, src_pte,
> +								src_vma, addr,
> +								&locked_page);
> +				if (ret == -EBUSY)
> +					break;
> +			} else {
> +				entry.val = copy_nonpresent_pte(dst_mm, src_mm,
> +								dst_pte, src_pte,
> +								src_vma, addr,
> +								rss);
> +				if (entry.val)
> +					break;
> +				progress += 8;
> +				continue;
> +			}
> +		}
> +		/* a non-present pte became present after dropping the ptl */
> +		if (unlikely(locked_page)) {
> +			unlock_page(locked_page);
> +			put_page(locked_page);
> +			locked_page = NULL;
>  		}
>  		/* copy_present_pte() will clear `*prealloc' if consumed */
>  		ret = copy_present_pte(dst_vma, src_vma, dst_pte, src_pte,
> @@ -1023,6 +1131,11 @@ copy_pte_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
>  			goto out;
>  		}
>  		entry.val = 0;
> +	} else if (ret == -EBUSY) {
> +		if (get_page_unless_zero(locked_page))
> +			lock_page(locked_page);
> +		else
> +			locked_page = NULL;
>  	} else if (ret) {
>  		WARN_ON_ONCE(ret != -EAGAIN);
>  		prealloc = page_copy_prealloc(src_mm, src_vma, addr);
> @@ -1287,7 +1400,8 @@ static unsigned long zap_pte_range(struct mmu_gather *tlb,
>  		}
>  
>  		entry = pte_to_swp_entry(ptent);
> -		if (is_device_private_entry(entry)) {
> +		if (is_device_private_entry(entry) ||
> +		    is_device_exclusive_entry(entry)) {
>  			struct page *page = pfn_swap_entry_to_page(entry);
>  
>  			if (unlikely(details && details->check_mapping)) {
> @@ -1303,7 +1417,10 @@ static unsigned long zap_pte_range(struct mmu_gather *tlb,
>  
>  			pte_clear_not_present_full(mm, addr, pte, tlb->fullmm);
>  			rss[mm_counter(page)]--;
> -			page_remove_rmap(page, false);
> +
> +			if (is_device_private_entry(entry))
> +				page_remove_rmap(page, false);
> +
>  			put_page(page);
>  			continue;
>  		}
> @@ -3256,6 +3373,44 @@ void unmap_mapping_range(struct address_space *mapping,
>  }
>  EXPORT_SYMBOL(unmap_mapping_range);
>  
> +/*
> + * Restore a potential device exclusive pte to a working pte entry
> + */
> +static vm_fault_t remove_device_exclusive_entry(struct vm_fault *vmf)
> +{
> +	struct page *page = vmf->page;
> +	struct vm_area_struct *vma = vmf->vma;
> +	struct page_vma_mapped_walk pvmw = {
> +		.page = page,
> +		.vma = vma,
> +		.address = vmf->address,
> +		.flags = PVMW_SYNC,
> +	};
> +	vm_fault_t ret = 0;
> +	struct mmu_notifier_range range;
> +
> +	if (!lock_page_or_retry(page, vma->vm_mm, vmf->flags))
> +		return VM_FAULT_RETRY;
> +	mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, vma, vma->vm_mm,
> +				vmf->address & PAGE_MASK,
> +				(vmf->address & PAGE_MASK) + PAGE_SIZE);
> +	mmu_notifier_invalidate_range_start(&range);

I looked at MMU_NOTIFIER_CLEAR document and it tells me:

 * @MMU_NOTIFY_CLEAR: clear page table entry (many reasons for this like
 * madvise() or replacing a page by another one, ...).

Does MMU_NOTIFIER_CLEAR suite for this case?  Normally I think for such a case
(existing pte is invalid) we don't need to notify at all.  However from what I
read from the whole series, this seems to be a critical point where we'd like
to kick the owner/driver to synchronously stop doing atomic operations from the
device.  Not sure whether we'd like a new notifier type, or maybe at least
comment on why to use CLEAR?

> +
> +	while (page_vma_mapped_walk(&pvmw)) {

IIUC a while loop of page_vma_mapped_walk() handles thps, however here it's
already in do_swap_page() so it's small pte only?  Meanwhile...

> +		if (unlikely(!pte_same(*pvmw.pte, vmf->orig_pte))) {
> +			page_vma_mapped_walk_done(&pvmw);
> +			break;
> +		}
> +
> +		restore_exclusive_pte(vma, page, pvmw.address, pvmw.pte);

... I'm not sure whether passing in page would work for thp after all, as iiuc
we may need to pass in the subpage rather than the head page if so.

> +	}
> +
> +	unlock_page(page);
> +
> +	mmu_notifier_invalidate_range_end(&range);
> +	return ret;
> +}
> +
>  /*
>   * We enter with non-exclusive mmap_lock (to exclude vma changes,
>   * but allow concurrent faults), and pte mapped but not yet locked.
> @@ -3283,6 +3438,9 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
>  		if (is_migration_entry(entry)) {
>  			migration_entry_wait(vma->vm_mm, vmf->pmd,
>  					     vmf->address);
> +		} else if (is_device_exclusive_entry(entry)) {
> +			vmf->page = pfn_swap_entry_to_page(entry);
> +			ret = remove_device_exclusive_entry(vmf);
>  		} else if (is_device_private_entry(entry)) {
>  			vmf->page = pfn_swap_entry_to_page(entry);
>  			ret = vmf->page->pgmap->ops->migrate_to_ram(vmf);
> diff --git a/mm/migrate.c b/mm/migrate.c
> index cc4612e2a246..9cc9251d4802 100644
> --- a/mm/migrate.c
> +++ b/mm/migrate.c
> @@ -2570,8 +2570,8 @@ static void migrate_vma_collect(struct migrate_vma *migrate)
>  	 * that the registered device driver can skip invalidating device
>  	 * private page mappings that won't be migrated.
>  	 */
> -	mmu_notifier_range_init_migrate(&range, 0, migrate->vma,
> -		migrate->vma->vm_mm, migrate->start, migrate->end,
> +	mmu_notifier_range_init_owner(&range, MMU_NOTIFY_MIGRATE, 0,
> +		migrate->vma, migrate->vma->vm_mm, migrate->start, migrate->end,
>  		migrate->pgmap_owner);
>  	mmu_notifier_invalidate_range_start(&range);
>  
> @@ -3074,9 +3074,9 @@ void migrate_vma_pages(struct migrate_vma *migrate)
>  			if (!notified) {
>  				notified = true;
>  
> -				mmu_notifier_range_init_migrate(&range, 0,
> -					migrate->vma, migrate->vma->vm_mm,
> -					addr, migrate->end,
> +				mmu_notifier_range_init_owner(&range,
> +					MMU_NOTIFY_MIGRATE, 0, migrate->vma,
> +					migrate->vma->vm_mm, addr, migrate->end,
>  					migrate->pgmap_owner);

(As I read more, I feel more that maybe it's better to move this renaming
 change along with mmu_notifier_range_init_owner() rework into a separate
 patch, as even the changes are straightforward there're still quite a few
 places that need touch up; no strong opinion though)

>  				mmu_notifier_invalidate_range_start(&range);
>  			}
> diff --git a/mm/mprotect.c b/mm/mprotect.c
> index f21b760ec809..c6018541ea3d 100644
> --- a/mm/mprotect.c
> +++ b/mm/mprotect.c
> @@ -165,6 +165,14 @@ static unsigned long change_pte_range(struct vm_area_struct *vma, pmd_t *pmd,
>  				newpte = swp_entry_to_pte(entry);
>  				if (pte_swp_uffd_wp(oldpte))
>  					newpte = pte_swp_mkuffd_wp(newpte);
> +			} else if (is_writable_device_exclusive_entry(entry)) {
> +				entry = make_readable_device_exclusive_entry(
> +							swp_offset(entry));
> +				newpte = swp_entry_to_pte(entry);
> +				if (pte_swp_soft_dirty(oldpte))
> +					newpte = pte_swp_mksoft_dirty(newpte);
> +				if (pte_swp_uffd_wp(oldpte))
> +					newpte = pte_swp_mkuffd_wp(newpte);
>  			} else {
>  				newpte = oldpte;
>  			}
> diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
> index eed988ab2e81..29842f169219 100644
> --- a/mm/page_vma_mapped.c
> +++ b/mm/page_vma_mapped.c
> @@ -41,7 +41,8 @@ static bool map_pte(struct page_vma_mapped_walk *pvmw)
>  
>  				/* Handle un-addressable ZONE_DEVICE memory */
>  				entry = pte_to_swp_entry(*pvmw->pte);
> -				if (!is_device_private_entry(entry))
> +				if (!is_device_private_entry(entry) &&
> +				    !is_device_exclusive_entry(entry))
>  					return false;
>  			} else if (!pte_present(*pvmw->pte))
>  				return false;
> @@ -93,7 +94,8 @@ static bool check_pte(struct page_vma_mapped_walk *pvmw)
>  			return false;
>  		entry = pte_to_swp_entry(*pvmw->pte);
>  
> -		if (!is_migration_entry(entry))
> +		if (!is_migration_entry(entry) &&
> +		    !is_device_exclusive_entry(entry))
>  			return false;
>  
>  		pfn = swp_offset(entry);
> @@ -102,7 +104,8 @@ static bool check_pte(struct page_vma_mapped_walk *pvmw)
>  
>  		/* Handle un-addressable ZONE_DEVICE memory */
>  		entry = pte_to_swp_entry(*pvmw->pte);
> -		if (!is_device_private_entry(entry))
> +		if (!is_device_private_entry(entry) &&
> +		    !is_device_exclusive_entry(entry))
>  			return false;
>  
>  		pfn = swp_offset(entry);
> diff --git a/mm/rmap.c b/mm/rmap.c
> index 7f91f058f1f5..32b99a7bb358 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -2005,6 +2005,216 @@ void page_mlock(struct page *page)
>  	rmap_walk(page, &rwc);
>  }
>  
> +struct ttp_args {
> +	struct mm_struct *mm;
> +	unsigned long address;
> +	void *arg;
> +	bool valid;
> +};
> +
> +static bool try_to_protect_one(struct page *page, struct vm_area_struct *vma,
> +			unsigned long address, void *arg)
> +{
> +	struct mm_struct *mm = vma->vm_mm;
> +	struct page_vma_mapped_walk pvmw = {
> +		.page = page,
> +		.vma = vma,
> +		.address = address,
> +	};
> +	struct ttp_args *ttp = arg;
> +	pte_t pteval;
> +	struct page *subpage;
> +	bool ret = true;
> +	struct mmu_notifier_range range;
> +	swp_entry_t entry;
> +	pte_t swp_pte;
> +
> +	mmu_notifier_range_init_owner(&range, MMU_NOTIFY_EXCLUSIVE, 0, vma,
> +				      vma->vm_mm, address,
> +				      min(vma->vm_end,
> +					  address + page_size(page)),

(this indent looks odd; seems better to join with previous line?  Slightly over
 80 but seems kernel code is not extremely strict on that)

> +				      ttp->arg);
> +	if (PageHuge(page)) {
> +		/*
> +		 * If sharing is possible, start and end will be adjusted
> +		 * accordingly.
> +		 */
> +		adjust_range_if_pmd_sharing_possible(vma, &range.start,
> +						     &range.end);
> +	}

Is this for hugetlb specific?  Can we drop this chunk if we know it's
PageAnon(), or is this a preparation for the future?

IMHO if possible we shouldn't introduce code that may never run, so to me that
sounds still better to be postponed until the hugetlbfs support (if there will
be).  So raise this question up.

> +	mmu_notifier_invalidate_range_start(&range);
> +
> +	while (page_vma_mapped_walk(&pvmw)) {

Same here, not sure whether "if" would be easier.

> +		/* Unexpected PMD-mapped THP? */
> +		VM_BUG_ON_PAGE(!pvmw.pte, page);
> +
> +		if (!pte_present(*pvmw.pte)) {
> +			ret = false;
> +			page_vma_mapped_walk_done(&pvmw);
> +			break;
> +		}
> +
> +		subpage = page - page_to_pfn(page) + pte_pfn(*pvmw.pte);
> +		address = pvmw.address;

Same question here: could the subpage be not the same as page at all?

> +
> +		/* Nuke the page table entry. */
> +		flush_cache_page(vma, address, pte_pfn(*pvmw.pte));
> +		pteval = ptep_clear_flush(vma, address, pvmw.pte);
> +
> +		/* Move the dirty bit to the page. Now the pte is gone. */
> +		if (pte_dirty(pteval))
> +			set_page_dirty(page);
> +
> +		/* Update high watermark before we lower rss */
> +		update_hiwater_rss(mm);

We don't update RSS, right?  If so, can this be dropped?

> +
> +		if (arch_unmap_one(mm, vma, address, pteval) < 0) {
> +			set_pte_at(mm, address, pvmw.pte, pteval);
> +			ret = false;
> +			page_vma_mapped_walk_done(&pvmw);
> +			break;
> +		}
> +
> +		/*
> +		 * Check that our target page is still mapped at the expected
> +		 * address.
> +		 */
> +		if (ttp->mm == mm && ttp->address == address &&
> +		    pte_write(pteval))
> +			ttp->valid = true;

I think I get the point of doing this (as after GUP the pte could have been
changed to point to another page), however it smells a bit odd to me (or it's
also possible that I'm not familiar enough with the code base..).  IIUC this is
the _only_ reason that we passed in "address" into try_to_protect() too, and
further into the ttp_args.

The odd part is the remote GUP should have walked the page table already, so
since the target here is the vaddr to replace, the 1st page table walk should
be able to both trylock/lock the page, then modify the pte with pgtable lock
held, return the locked page, then walk the rmap again to remove all the rest
of the ptes that are mapping to this page.  In that case before we call the
rmap_walk() we know this must be the page we want to take care of, and no one
will be able to restore the original mm pte either (as we're with the page
lock).  Then we don't need this check, neither do we need ttp->address.

However frankly I didn't think deeper on how to best implement that and how
many code changes are needed.  So just raise it up as question too here.

> +
> +		/*
> +		 * Store the pfn of the page in a special migration
> +		 * pte. do_swap_page() will wait until the migration
> +		 * pte is removed and then restart fault handling.
> +		 */
> +		if (pte_write(pteval))
> +			entry = make_writable_device_exclusive_entry(
> +							page_to_pfn(subpage));
> +		else
> +			entry = make_readable_device_exclusive_entry(
> +							page_to_pfn(subpage));

(For my own preference I actually prefer make_device_exclusive_entry(writable)
 and helpers defined like that, then these lines can be written as oneliner by
 passing in pte_write(); however that's quite subjective opinion and I saw
 there're discussions around that on patch 2, so I'll avoid commenting more)

> +		swp_pte = swp_entry_to_pte(entry);
> +		if (pte_soft_dirty(pteval))
> +			swp_pte = pte_swp_mksoft_dirty(swp_pte);
> +		if (pte_uffd_wp(pteval))
> +			swp_pte = pte_swp_mkuffd_wp(swp_pte);
> +
> +		/* Take a reference for the swap entry */
> +		get_page(page);
> +		set_pte_at(mm, address, pvmw.pte, swp_pte);
> +
> +		page_remove_rmap(subpage, PageHuge(page));
> +		put_page(page);
> +	}
> +
> +	mmu_notifier_invalidate_range_end(&range);
> +
> +	return ret;
> +}
> +
> +/**
> + * try_to_protect - try to replace all page table mappings with swap entries

Is this too general?  Either on the word "protect" or the comment after it, as
there're a lot of types of swap entries (and a lot of types of protect too..),
while it seems this is only for the device exclusive swap entries.

How about rename it to try_to_mark_device_exclusive?  Or even dropping the
"try_to_" (e.g. device_exclusive_mark_page())?

> + * @page: the page to replace page table entries for
> + * @flags: action and flags

Obsolete line?

> + * @mm: the mm_struct where the page is expected to be mapped
> + * @address: address where the page is expected to be mapped
> + * @arg: passed to MMU_NOTIFY_EXCLUSIVE range notifier callbacks
> + *
> + * Tries to remove all the page table entries which are mapping this page and
> + * replace them with special swap entries to grant a device exclusive access to
> + * the page. Caller must hold the page lock.
> + *
> + * Returns false if the page is still mapped, or if it could not be unmapped
> + * from the expected address. Otherwise returns true (success).
> + */
> +static bool try_to_protect(struct page *page, struct mm_struct *mm,
> +			   unsigned long address, void *arg)
> +{
> +	struct ttp_args ttp = {
> +		.mm = mm,
> +		.address = address,
> +		.arg = arg,
> +		.valid = false,
> +	};
> +	struct rmap_walk_control rwc = {
> +		.rmap_one = try_to_protect_one,
> +		.done = page_not_mapped,
> +		.anon_lock = page_lock_anon_vma_read,
> +		.arg = &ttp,
> +	};
> +
> +	/*
> +	 * Restrict to anonymous pages for now to avoid potential writeback
> +	 * issues.
> +	 */
> +	if (!PageAnon(page))
> +		return false;
> +
> +	/*
> +	 * During exec, a temporary VMA is setup and later moved.
> +	 * The VMA is moved under the anon_vma lock but not the
> +	 * page tables leading to a race where migration cannot
> +	 * find the migration ptes. Rather than increasing the
> +	 * locking requirements of exec(), migration skips
> +	 * temporary VMAs until after exec() completes.
> +	 */
> +	if (!PageKsm(page) && PageAnon(page))

I think we can drop the PageAnon() check as it's just done above.

I feel like this chunk was copied over from try_to_unmap(), however is that
necessary?  Is it possible that the caller of make_device_exclusive_range()
pass in a temp stack vma during exec()?

> +		rwc.invalid_vma = invalid_migration_vma;
> +
> +	rmap_walk(page, &rwc);
> +
> +	return ttp.valid && !page_mapcount(page);
> +}
> +
> +/**
> + * make_device_exclusive_range() - Mark a range for exclusive use by a device
> + * @mm: mm_struct of assoicated target process
> + * @start: start of the region to mark for exclusive device access
> + * @end: end address of region
> + * @pages: returns the pages which were successfully marked for exclusive access
> + * @arg: passed to MMU_NOTIFY_EXCLUSIVE range notifier too allow filtering

s/too/to/?

> + *
> + * Returns: number of pages successfully marked for exclusive access

Hmm, I see that try_to_protect() can fail even if npages returned from GUP, so
perhaps "number of pages successfully GUPed, however the page is marked for
exclusive access only if the page pointer is non-NULL", or something like that?

> + *
> + * This function finds ptes mapping page(s) to the given address range, locks
> + * them and replaces mappings with special swap entries preventing userspace CPU

s/userspace//?  As same for kernel access?

(I don't think I fully read all the codes in this patch, but I'll stop here for
 today..)

Thanks,

> + * access. On fault these entries are replaced with the original mapping after
> + * calling MMU notifiers.
> + *
> + * A driver using this to program access from a device must use a mmu notifier
> + * critical section to hold a device specific lock during programming. Once
> + * programming is complete it should drop the page lock and reference after
> + * which point CPU access to the page will revoke the exclusive access.
> + */
> +int make_device_exclusive_range(struct mm_struct *mm, unsigned long start,
> +				unsigned long end, struct page **pages,
> +				void *arg)
> +{
> +	unsigned long npages = (end - start) >> PAGE_SHIFT;
> +	unsigned long i;
> +
> +	npages = get_user_pages_remote(mm, start, npages,
> +				       FOLL_GET | FOLL_WRITE | FOLL_SPLIT_PMD,
> +				       pages, NULL, NULL);
> +	for (i = 0; i < npages; i++, start += PAGE_SIZE) {
> +		if (!trylock_page(pages[i])) {
> +			put_page(pages[i]);
> +			pages[i] = NULL;
> +			continue;
> +		}
> +
> +		if (!try_to_protect(pages[i], mm, start, arg)) {
> +			unlock_page(pages[i]);
> +			put_page(pages[i]);
> +			pages[i] = NULL;
> +		}
> +	}
> +
> +	return npages;
> +}
> +EXPORT_SYMBOL_GPL(make_device_exclusive_range);
> +
>  void __put_anon_vma(struct anon_vma *anon_vma)
>  {
>  	struct anon_vma *root = anon_vma->root;
> -- 
> 2.20.1
> 
> 

-- 
Peter Xu

