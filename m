Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC9131F494
	for <lists+dri-devel@lfdr.de>; Fri, 19 Feb 2021 06:10:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 949A26E1BD;
	Fri, 19 Feb 2021 05:10:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32DCE6E1BD;
 Fri, 19 Feb 2021 05:10:36 +0000 (UTC)
IronPort-SDR: QS8n7cAwxP71f++Jdp8M73a/5GhFdjAHnUKmHFNL2iRWL0MI/E9wb4aeSG3LWH/MQiRukmlko8
 DdobwCiWw0rA==
X-IronPort-AV: E=McAfee;i="6000,8403,9899"; a="203011319"
X-IronPort-AV: E=Sophos;i="5.81,189,1610438400"; 
 d="gz'50?scan'50,208,50";a="203011319"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2021 21:10:34 -0800
IronPort-SDR: NC0XWfXi+z/xuVbL1ifAQw/qzAwY/hylECOXocefuPuH9SmKyDtioMtcL4Si+ZpJyEsuoIdUzN
 wxkZZDv8CPIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,189,1610438400"; 
 d="gz'50?scan'50,208,50";a="513553393"
Received: from lkp-server02.sh.intel.com (HELO cd560a204411) ([10.239.97.151])
 by orsmga004.jf.intel.com with ESMTP; 18 Feb 2021 21:10:29 -0800
Received: from kbuild by cd560a204411 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lCy3g-000A8U-Io; Fri, 19 Feb 2021 05:10:28 +0000
Date: Fri, 19 Feb 2021 13:09:29 +0800
From: kernel test robot <lkp@intel.com>
To: Alistair Popple <apopple@nvidia.com>, linux-mm@kvack.org,
 nouveau@lists.freedesktop.org, bskeggs@redhat.com,
 akpm@linux-foundation.org
Subject: Re: [PATCH v2 1/4] hmm: Device exclusive memory access
Message-ID: <202102191328.B8Z6EJpE-lkp@intel.com>
References: <20210219020750.16444-2-apopple@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="YZ5djTAD1cGYuMQK"
Content-Disposition: inline
In-Reply-To: <20210219020750.16444-2-apopple@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: rcampbell@nvidia.com, kbuild-all@lists.01.org, linux-doc@vger.kernel.org,
 jhubbard@nvidia.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kvm-ppc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--YZ5djTAD1cGYuMQK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alistair,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on kselftest/next]
[also build test ERROR on linus/master v5.11 next-20210218]
[cannot apply to hnaz-linux-mm/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Alistair-Popple/Add-support-for-SVM-atomics-in-Nouveau/20210219-100858
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git next
config: x86_64-randconfig-s021-20210217 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.3-215-g0fb77bb6-dirty
        # https://github.com/0day-ci/linux/commit/bb5444811772d30b2e3bbaa44baeb8a4b3f03cec
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Alistair-Popple/Add-support-for-SVM-atomics-in-Nouveau/20210219-100858
        git checkout bb5444811772d30b2e3bbaa44baeb8a4b3f03cec
        # save the attached .config to linux build tree
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=x86_64 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   ld: warning: orphan section `.data..decrypted' from `arch/x86/kernel/cpu/vmware.o' being placed in section `.data..decrypted'
   ld: warning: orphan section `.data..decrypted' from `arch/x86/kernel/kvm.o' being placed in section `.data..decrypted'
   ld: mm/memory.o: in function `do_swap_page':
>> mm/memory.c:3300: undefined reference to `hmm_remove_exclusive_entry'


vim +3300 mm/memory.c

  3270	
  3271	/*
  3272	 * We enter with non-exclusive mmap_lock (to exclude vma changes,
  3273	 * but allow concurrent faults), and pte mapped but not yet locked.
  3274	 * We return with pte unmapped and unlocked.
  3275	 *
  3276	 * We return with the mmap_lock locked or unlocked in the same cases
  3277	 * as does filemap_fault().
  3278	 */
  3279	vm_fault_t do_swap_page(struct vm_fault *vmf)
  3280	{
  3281		struct vm_area_struct *vma = vmf->vma;
  3282		struct page *page = NULL, *swapcache;
  3283		swp_entry_t entry;
  3284		pte_t pte;
  3285		int locked;
  3286		int exclusive = 0;
  3287		vm_fault_t ret = 0;
  3288		void *shadow = NULL;
  3289	
  3290		if (!pte_unmap_same(vma->vm_mm, vmf->pmd, vmf->pte, vmf->orig_pte))
  3291			goto out;
  3292	
  3293		entry = pte_to_swp_entry(vmf->orig_pte);
  3294		if (unlikely(non_swap_entry(entry))) {
  3295			if (is_migration_entry(entry)) {
  3296				migration_entry_wait(vma->vm_mm, vmf->pmd,
  3297						     vmf->address);
  3298			} else if (is_device_exclusive_entry(entry)) {
  3299				vmf->page = device_exclusive_entry_to_page(entry);
> 3300				ret = hmm_remove_exclusive_entry(vmf);
  3301			} else if (is_device_private_entry(entry)) {
  3302				vmf->page = device_private_entry_to_page(entry);
  3303				ret = vmf->page->pgmap->ops->migrate_to_ram(vmf);
  3304			} else if (is_hwpoison_entry(entry)) {
  3305				ret = VM_FAULT_HWPOISON;
  3306			} else {
  3307				print_bad_pte(vma, vmf->address, vmf->orig_pte, NULL);
  3308				ret = VM_FAULT_SIGBUS;
  3309			}
  3310			goto out;
  3311		}
  3312	
  3313	
  3314		delayacct_set_flag(DELAYACCT_PF_SWAPIN);
  3315		page = lookup_swap_cache(entry, vma, vmf->address);
  3316		swapcache = page;
  3317	
  3318		if (!page) {
  3319			struct swap_info_struct *si = swp_swap_info(entry);
  3320	
  3321			if (data_race(si->flags & SWP_SYNCHRONOUS_IO) &&
  3322			    __swap_count(entry) == 1) {
  3323				/* skip swapcache */
  3324				page = alloc_page_vma(GFP_HIGHUSER_MOVABLE, vma,
  3325								vmf->address);
  3326				if (page) {
  3327					int err;
  3328	
  3329					__SetPageLocked(page);
  3330					__SetPageSwapBacked(page);
  3331					set_page_private(page, entry.val);
  3332	
  3333					/* Tell memcg to use swap ownership records */
  3334					SetPageSwapCache(page);
  3335					err = mem_cgroup_charge(page, vma->vm_mm,
  3336								GFP_KERNEL);
  3337					ClearPageSwapCache(page);
  3338					if (err) {
  3339						ret = VM_FAULT_OOM;
  3340						goto out_page;
  3341					}
  3342	
  3343					shadow = get_shadow_from_swap_cache(entry);
  3344					if (shadow)
  3345						workingset_refault(page, shadow);
  3346	
  3347					lru_cache_add(page);
  3348					swap_readpage(page, true);
  3349				}
  3350			} else {
  3351				page = swapin_readahead(entry, GFP_HIGHUSER_MOVABLE,
  3352							vmf);
  3353				swapcache = page;
  3354			}
  3355	
  3356			if (!page) {
  3357				/*
  3358				 * Back out if somebody else faulted in this pte
  3359				 * while we released the pte lock.
  3360				 */
  3361				vmf->pte = pte_offset_map_lock(vma->vm_mm, vmf->pmd,
  3362						vmf->address, &vmf->ptl);
  3363				if (likely(pte_same(*vmf->pte, vmf->orig_pte)))
  3364					ret = VM_FAULT_OOM;
  3365				delayacct_clear_flag(DELAYACCT_PF_SWAPIN);
  3366				goto unlock;
  3367			}
  3368	
  3369			/* Had to read the page from swap area: Major fault */
  3370			ret = VM_FAULT_MAJOR;
  3371			count_vm_event(PGMAJFAULT);
  3372			count_memcg_event_mm(vma->vm_mm, PGMAJFAULT);
  3373		} else if (PageHWPoison(page)) {
  3374			/*
  3375			 * hwpoisoned dirty swapcache pages are kept for killing
  3376			 * owner processes (which may be unknown at hwpoison time)
  3377			 */
  3378			ret = VM_FAULT_HWPOISON;
  3379			delayacct_clear_flag(DELAYACCT_PF_SWAPIN);
  3380			goto out_release;
  3381		}
  3382	
  3383		locked = lock_page_or_retry(page, vma->vm_mm, vmf->flags);
  3384	
  3385		delayacct_clear_flag(DELAYACCT_PF_SWAPIN);
  3386		if (!locked) {
  3387			ret |= VM_FAULT_RETRY;
  3388			goto out_release;
  3389		}
  3390	
  3391		/*
  3392		 * Make sure try_to_free_swap or reuse_swap_page or swapoff did not
  3393		 * release the swapcache from under us.  The page pin, and pte_same
  3394		 * test below, are not enough to exclude that.  Even if it is still
  3395		 * swapcache, we need to check that the page's swap has not changed.
  3396		 */
  3397		if (unlikely((!PageSwapCache(page) ||
  3398				page_private(page) != entry.val)) && swapcache)
  3399			goto out_page;
  3400	
  3401		page = ksm_might_need_to_copy(page, vma, vmf->address);
  3402		if (unlikely(!page)) {
  3403			ret = VM_FAULT_OOM;
  3404			page = swapcache;
  3405			goto out_page;
  3406		}
  3407	
  3408		cgroup_throttle_swaprate(page, GFP_KERNEL);
  3409	
  3410		/*
  3411		 * Back out if somebody else already faulted in this pte.
  3412		 */
  3413		vmf->pte = pte_offset_map_lock(vma->vm_mm, vmf->pmd, vmf->address,
  3414				&vmf->ptl);
  3415		if (unlikely(!pte_same(*vmf->pte, vmf->orig_pte)))
  3416			goto out_nomap;
  3417	
  3418		if (unlikely(!PageUptodate(page))) {
  3419			ret = VM_FAULT_SIGBUS;
  3420			goto out_nomap;
  3421		}
  3422	
  3423		/*
  3424		 * The page isn't present yet, go ahead with the fault.
  3425		 *
  3426		 * Be careful about the sequence of operations here.
  3427		 * To get its accounting right, reuse_swap_page() must be called
  3428		 * while the page is counted on swap but not yet in mapcount i.e.
  3429		 * before page_add_anon_rmap() and swap_free(); try_to_free_swap()
  3430		 * must be called after the swap_free(), or it will never succeed.
  3431		 */
  3432	
  3433		inc_mm_counter_fast(vma->vm_mm, MM_ANONPAGES);
  3434		dec_mm_counter_fast(vma->vm_mm, MM_SWAPENTS);
  3435		pte = mk_pte(page, vma->vm_page_prot);
  3436		if ((vmf->flags & FAULT_FLAG_WRITE) && reuse_swap_page(page, NULL)) {
  3437			pte = maybe_mkwrite(pte_mkdirty(pte), vma);
  3438			vmf->flags &= ~FAULT_FLAG_WRITE;
  3439			ret |= VM_FAULT_WRITE;
  3440			exclusive = RMAP_EXCLUSIVE;
  3441		}
  3442		flush_icache_page(vma, page);
  3443		if (pte_swp_soft_dirty(vmf->orig_pte))
  3444			pte = pte_mksoft_dirty(pte);
  3445		if (pte_swp_uffd_wp(vmf->orig_pte)) {
  3446			pte = pte_mkuffd_wp(pte);
  3447			pte = pte_wrprotect(pte);
  3448		}
  3449		set_pte_at(vma->vm_mm, vmf->address, vmf->pte, pte);
  3450		arch_do_swap_page(vma->vm_mm, vma, vmf->address, pte, vmf->orig_pte);
  3451		vmf->orig_pte = pte;
  3452	
  3453		/* ksm created a completely new copy */
  3454		if (unlikely(page != swapcache && swapcache)) {
  3455			page_add_new_anon_rmap(page, vma, vmf->address, false);
  3456			lru_cache_add_inactive_or_unevictable(page, vma);
  3457		} else {
  3458			do_page_add_anon_rmap(page, vma, vmf->address, exclusive);
  3459		}
  3460	
  3461		swap_free(entry);
  3462		if (mem_cgroup_swap_full(page) ||
  3463		    (vma->vm_flags & VM_LOCKED) || PageMlocked(page))
  3464			try_to_free_swap(page);
  3465		unlock_page(page);
  3466		if (page != swapcache && swapcache) {
  3467			/*
  3468			 * Hold the lock to avoid the swap entry to be reused
  3469			 * until we take the PT lock for the pte_same() check
  3470			 * (to avoid false positives from pte_same). For
  3471			 * further safety release the lock after the swap_free
  3472			 * so that the swap count won't change under a
  3473			 * parallel locked swapcache.
  3474			 */
  3475			unlock_page(swapcache);
  3476			put_page(swapcache);
  3477		}
  3478	
  3479		if (vmf->flags & FAULT_FLAG_WRITE) {
  3480			ret |= do_wp_page(vmf);
  3481			if (ret & VM_FAULT_ERROR)
  3482				ret &= VM_FAULT_ERROR;
  3483			goto out;
  3484		}
  3485	
  3486		/* No need to invalidate - it was non-present before */
  3487		update_mmu_cache(vma, vmf->address, vmf->pte);
  3488	unlock:
  3489		pte_unmap_unlock(vmf->pte, vmf->ptl);
  3490	out:
  3491		return ret;
  3492	out_nomap:
  3493		pte_unmap_unlock(vmf->pte, vmf->ptl);
  3494	out_page:
  3495		unlock_page(page);
  3496	out_release:
  3497		put_page(page);
  3498		if (page != swapcache && swapcache) {
  3499			unlock_page(swapcache);
  3500			put_page(swapcache);
  3501		}
  3502		return ret;
  3503	}
  3504	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--YZ5djTAD1cGYuMQK
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
Dor7DzTm5ZZ+HAIA

--YZ5djTAD1cGYuMQK
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--YZ5djTAD1cGYuMQK--
