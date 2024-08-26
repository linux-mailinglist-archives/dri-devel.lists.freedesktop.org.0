Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F84495FCC2
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 00:28:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31B6110E29E;
	Mon, 26 Aug 2024 22:28:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TpcnYVwb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4902610E044;
 Mon, 26 Aug 2024 22:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724711318; x=1756247318;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0Qogogt71o7Y7M7XcFUPX/sDVPaFlsu14+gvAsGv0lY=;
 b=TpcnYVwbaTADnc7IfBzhz9doWWwIowBR3RsA2fB1nSh+ZsOdYvOOQDN+
 4n/ZF8yIprrtHVvNtFad6qWN+qsS10obJOK5SeYqZj2icFCdJHqNQ+uFw
 S1mH8kDVl9rU4IYbemkFYM6MYDj+nqNMZ9HWEjqPCwmu7WC0+kKRxjR6+
 WQsbiImdgBzOgXWohJ9VRl21Ct436HUXlJm2lX9d1dr2gU1iQXSaLQyOM
 M16HuA6cPOv5y8O9dUrz4BXiiTxqxPkY05JYrvXZ8Q4dbuagyvvEgTpMy
 dXdvOe3n9msspdc1EPngq0dIHrYjdxfCRcCUZapDetsFfJyC9zfZTOeN3 A==;
X-CSE-ConnectionGUID: EQt1ituYQoalVj+uxV9/dw==
X-CSE-MsgGUID: I8CQFSXvQW6dJGd6QP8xAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="26954812"
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; d="scan'208";a="26954812"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 15:28:38 -0700
X-CSE-ConnectionGUID: fC5v4AWrTU6vmRXNVb2QFg==
X-CSE-MsgGUID: NzcrWMc+SJqGXXtChWMO7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; d="scan'208";a="93383021"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
 by orviesa002.jf.intel.com with ESMTP; 26 Aug 2024 15:28:32 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1siiCL-000Hew-2R;
 Mon, 26 Aug 2024 22:28:29 +0000
Date: Tue, 27 Aug 2024 06:28:06 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, intel-gfx@lists.freedesktop.org,
 jani.nikula@intel.com, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH 2/2] drm: ensure drm headers are self-contained and pass
 kernel-doc
Message-ID: <202408270538.dEV4dXpq-lkp@intel.com>
References: <20240823141110.3431423-2-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240823141110.3431423-2-jani.nikula@intel.com>
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

Hi Jani,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm/drm-next]
[also build test ERROR on next-20240826]
[cannot apply to drm-misc/drm-misc-next linus/master v6.11-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jani-Nikula/drm-ensure-drm-headers-are-self-contained-and-pass-kernel-doc/20240826-134953
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20240823141110.3431423-2-jani.nikula%40intel.com
patch subject: [PATCH 2/2] drm: ensure drm headers are self-contained and pass kernel-doc
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20240827/202408270538.dEV4dXpq-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240827/202408270538.dEV4dXpq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408270538.dEV4dXpq-lkp@intel.com/

All errors (new ones prefixed by >>):

         |                                                  ^~~~~~~
   arch/arc/include/asm/pgtable-levels.h:160:34: note: in expansion of macro 'pmd_val'
     160 | #define pmd_page_vaddr(pmd)     (pmd_val(pmd) & PAGE_MASK)
         |                                  ^~~~~~~
   include/linux/pgtable.h:96:25: note: in expansion of macro 'pmd_page_vaddr'
      96 |         return (pte_t *)pmd_page_vaddr(*pmd) + pte_index(address);
         |                         ^~~~~~~~~~~~~~
   include/linux/pgtable.h: In function 'pmd_off':
   include/linux/pgtable.h:165:38: error: implicit declaration of function 'p4d_offset'; did you mean 'pmd_offset'? [-Werror=implicit-function-declaration]
     165 |         return pmd_offset(pud_offset(p4d_offset(pgd_offset(mm, va), va), va), va);
         |                                      ^~~~~~~~~~
         |                                      pmd_offset
   include/linux/pgtable.h:165:38: warning: passing argument 1 of 'pud_offset' makes pointer from integer without a cast [-Wint-conversion]
     165 |         return pmd_offset(pud_offset(p4d_offset(pgd_offset(mm, va), va), va), va);
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                      |
         |                                      int
   include/asm-generic/pgtable-nopud.h:42:40: note: expected 'p4d_t *' but argument is of type 'int'
      42 | static inline pud_t *pud_offset(p4d_t *p4d, unsigned long address)
         |                                 ~~~~~~~^~~
   include/linux/pgtable.h: In function 'pmd_off_k':
   include/linux/pgtable.h:170:38: warning: passing argument 1 of 'pud_offset' makes pointer from integer without a cast [-Wint-conversion]
     170 |         return pmd_offset(pud_offset(p4d_offset(pgd_offset_k(va), va), va), va);
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                      |
         |                                      int
   include/asm-generic/pgtable-nopud.h:42:40: note: expected 'p4d_t *' but argument is of type 'int'
      42 | static inline pud_t *pud_offset(p4d_t *p4d, unsigned long address)
         |                                 ~~~~~~~^~~
   include/linux/pgtable.h: In function 'virt_to_kpte':
   arch/arc/include/asm/page.h:41:29: error: request for member 'pgd' in something not a structure or union
      41 | #define pgd_val(x)      ((x).pgd)
         |                             ^
   include/asm-generic/pgtable-nop4d.h:40:50: note: in expansion of macro 'pgd_val'
      40 | #define p4d_val(x)                              (pgd_val((x).pgd))
         |                                                  ^~~~~~~
   include/asm-generic/pgtable-nopud.h:48:50: note: in expansion of macro 'p4d_val'
      48 | #define pud_val(x)                              (p4d_val((x).p4d))
         |                                                  ^~~~~~~
   include/asm-generic/pgtable-nopmd.h:52:50: note: in expansion of macro 'pud_val'
      52 | #define pmd_val(x)                              (pud_val((x).pud))
         |                                                  ^~~~~~~
   arch/arc/include/asm/pgtable-levels.h:156:35: note: in expansion of macro 'pmd_val'
     156 | #define pmd_none(x)             (!pmd_val(x))
         |                                   ^~~~~~~
   include/linux/pgtable.h:177:16: note: in expansion of macro 'pmd_none'
     177 |         return pmd_none(*pmd) ? NULL : pte_offset_kernel(pmd, vaddr);
         |                ^~~~~~~~
   include/linux/pgtable.h: In function 'ptep_test_and_clear_young':
   include/linux/pgtable.h:359:55: error: implicit declaration of function 'pte_mkold'; did you mean 'pmd_mkold'? [-Werror=implicit-function-declaration]
     359 |                 set_pte_at(vma->vm_mm, address, ptep, pte_mkold(pte));
         |                                                       ^~~~~~~~~
   include/linux/pgtable.h:280:66: note: in definition of macro 'set_pte_at'
     280 | #define set_pte_at(mm, addr, ptep, pte) set_ptes(mm, addr, ptep, pte, 1)
         |                                                                  ^~~
   include/linux/pgtable.h:359:55: error: incompatible type for argument 4 of 'set_ptes'
     359 |                 set_pte_at(vma->vm_mm, address, ptep, pte_mkold(pte));
         |                                                       ^~~~~~~~~~~~~~
         |                                                       |
         |                                                       int
   include/linux/pgtable.h:280:66: note: in definition of macro 'set_pte_at'
     280 | #define set_pte_at(mm, addr, ptep, pte) set_ptes(mm, addr, ptep, pte, 1)
         |                                                                  ^~~
   include/linux/pgtable.h:265:36: note: expected 'pte_t' but argument is of type 'int'
     265 |                 pte_t *ptep, pte_t pte, unsigned int nr)
         |                              ~~~~~~^~~
   include/linux/pgtable.h: In function 'pmdp_test_and_clear_young':
   arch/arc/include/asm/page.h:74:29: error: request for member 'pte' in something not a structure or union
      74 | #define pte_val(x)      ((x).pte)
         |                             ^
   arch/arc/include/asm/pgtable-bits-arcv2.h:82:34: note: in expansion of macro 'pte_val'
      82 | #define pte_young(pte)          (pte_val(pte) & _PAGE_ACCESSED)
         |                                  ^~~~~~~
   arch/arc/include/asm/hugepage.h:40:33: note: in expansion of macro 'pte_young'
      40 | #define pmd_young(pmd)          pte_young(pmd_pte(pmd))
         |                                 ^~~~~~~~~
   include/linux/pgtable.h:372:14: note: in expansion of macro 'pmd_young'
     372 |         if (!pmd_young(pmd))
         |              ^~~~~~~~~
   arch/arc/include/asm/hugepage.h:33:33: error: implicit declaration of function 'pte_pmd'; did you mean 'pfn_pmd'? [-Werror=implicit-function-declaration]
      33 | #define pmd_mkold(pmd)          pte_pmd(pte_mkold(pmd_pte(pmd)))
         |                                 ^~~~~~~
   include/linux/pgtable.h:375:55: note: in expansion of macro 'pmd_mkold'
     375 |                 set_pmd_at(vma->vm_mm, address, pmdp, pmd_mkold(pmd));
         |                                                       ^~~~~~~~~
   arch/arc/include/asm/hugepage.h:33:33: error: incompatible type for argument 4 of 'set_pmd_at'
      33 | #define pmd_mkold(pmd)          pte_pmd(pte_mkold(pmd_pte(pmd)))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                 |
         |                                 int
   include/linux/pgtable.h:375:55: note: in expansion of macro 'pmd_mkold'
     375 |                 set_pmd_at(vma->vm_mm, address, pmdp, pmd_mkold(pmd));
         |                                                       ^~~~~~~~~
   arch/arc/include/asm/hugepage.h:59:50: note: expected 'pmd_t' but argument is of type 'int'
      59 |                               pmd_t *pmdp, pmd_t pmd)
         |                                            ~~~~~~^~~
   include/linux/pgtable.h: In function 'clear_young_dirty_ptes':
   include/linux/pgtable.h:493:39: error: incompatible types when assigning to type 'pte_t' from type 'int'
     493 |                                 pte = pte_mkold(pte);
         |                                       ^~~~~~~~~
>> include/linux/pgtable.h:495:39: error: implicit declaration of function 'pte_mkclean'; did you mean 'pmd_mkclean'? [-Werror=implicit-function-declaration]
     495 |                                 pte = pte_mkclean(pte);
         |                                       ^~~~~~~~~~~
         |                                       pmd_mkclean
   include/linux/pgtable.h:495:39: error: incompatible types when assigning to type 'pte_t' from type 'int'
   include/linux/pgtable.h: In function 'pmdp_huge_get_and_clear':
   arch/arc/include/asm/page.h:41:29: error: request for member 'pgd' in something not a structure or union
      41 | #define pgd_val(x)      ((x).pgd)
         |                             ^
   include/asm-generic/pgtable-nop4d.h:40:50: note: in expansion of macro 'pgd_val'
      40 | #define p4d_val(x)                              (pgd_val((x).pgd))
         |                                                  ^~~~~~~
   include/asm-generic/pgtable-nopud.h:48:50: note: in expansion of macro 'p4d_val'
      48 | #define pud_val(x)                              (p4d_val((x).p4d))
         |                                                  ^~~~~~~
   include/asm-generic/pgtable-nopmd.h:52:50: note: in expansion of macro 'pud_val'
      52 | #define pmd_val(x)                              (pud_val((x).pud))
         |                                                  ^~~~~~~
   arch/arc/include/asm/pgtable-levels.h:159:38: note: in expansion of macro 'pmd_val'
     159 | #define pmd_clear(xp)           do { pmd_val(*(xp)) = 0; } while (0)
         |                                      ^~~~~~~
   include/linux/pgtable.h:603:9: note: in expansion of macro 'pmd_clear'
     603 |         pmd_clear(pmdp);
         |         ^~~~~~~~~
   include/linux/pgtable.h: In function 'get_and_clear_full_ptes':
>> include/linux/pgtable.h:684:31: error: implicit declaration of function 'pte_mkdirty'; did you mean 'pte_dirty'? [-Werror=implicit-function-declaration]
     684 |                         pte = pte_mkdirty(pte);
         |                               ^~~~~~~~~~~
         |                               pte_dirty
   include/linux/pgtable.h:684:31: error: incompatible types when assigning to type 'pte_t' from type 'int'
>> include/linux/pgtable.h:686:31: error: implicit declaration of function 'pte_mkyoung'; did you mean 'pte_young'? [-Werror=implicit-function-declaration]
     686 |                         pte = pte_mkyoung(pte);
         |                               ^~~~~~~~~~~
         |                               pte_young
   include/linux/pgtable.h:686:31: error: incompatible types when assigning to type 'pte_t' from type 'int'
   include/linux/pgtable.h: In function 'pte_mkwrite':
   include/linux/pgtable.h:807:16: error: implicit declaration of function 'pte_mkwrite_novma'; did you mean 'pmd_mkwrite_novma'? [-Werror=implicit-function-declaration]
     807 |         return pte_mkwrite_novma(pte);
         |                ^~~~~~~~~~~~~~~~~
         |                pmd_mkwrite_novma
   include/linux/pgtable.h:807:16: error: incompatible types when returning type 'int' but 'pte_t' was expected
     807 |         return pte_mkwrite_novma(pte);
         |                ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/pgtable.h: In function 'pmd_mkwrite':
   arch/arc/include/asm/hugepage.h:31:33: error: incompatible types when returning type 'int' but 'pmd_t' was expected
      31 | #define pmd_mkwrite_novma(pmd)  pte_pmd(pte_mkwrite_novma(pmd_pte(pmd)))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pgtable.h:814:16: note: in expansion of macro 'pmd_mkwrite_novma'
     814 |         return pmd_mkwrite_novma(pmd);
         |                ^~~~~~~~~~~~~~~~~
   include/linux/pgtable.h: In function 'ptep_set_wrprotect':
   include/linux/pgtable.h:823:39: error: implicit declaration of function 'pte_wrprotect'; did you mean 'pmd_wrprotect'? [-Werror=implicit-function-declaration]
     823 |         set_pte_at(mm, address, ptep, pte_wrprotect(old_pte));
         |                                       ^~~~~~~~~~~~~
   include/linux/pgtable.h:280:66: note: in definition of macro 'set_pte_at'
     280 | #define set_pte_at(mm, addr, ptep, pte) set_ptes(mm, addr, ptep, pte, 1)
         |                                                                  ^~~
   include/linux/pgtable.h:823:39: error: incompatible type for argument 4 of 'set_ptes'
     823 |         set_pte_at(mm, address, ptep, pte_wrprotect(old_pte));
         |                                       ^~~~~~~~~~~~~~~~~~~~~~
         |                                       |
         |                                       int
   include/linux/pgtable.h:280:66: note: in definition of macro 'set_pte_at'
     280 | #define set_pte_at(mm, addr, ptep, pte) set_ptes(mm, addr, ptep, pte, 1)
         |                                                                  ^~~
   include/linux/pgtable.h:265:36: note: expected 'pte_t' but argument is of type 'int'
     265 |                 pte_t *ptep, pte_t pte, unsigned int nr)
         |                              ~~~~~~^~~
   include/linux/pgtable.h: In function 'pmdp_set_wrprotect':
   arch/arc/include/asm/hugepage.h:30:33: error: incompatible type for argument 4 of 'set_pmd_at'
      30 | #define pmd_wrprotect(pmd)      pte_pmd(pte_wrprotect(pmd_pte(pmd)))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                 |
         |                                 int
   include/linux/pgtable.h:880:39: note: in expansion of macro 'pmd_wrprotect'
     880 |         set_pmd_at(mm, address, pmdp, pmd_wrprotect(old_pmd));
         |                                       ^~~~~~~~~~~~~
   arch/arc/include/asm/hugepage.h:59:50: note: expected 'pmd_t' but argument is of type 'int'
      59 |                               pmd_t *pmdp, pmd_t pmd)
         |                                            ~~~~~~^~~
   include/linux/pgtable.h: In function 'pmd_same':
   arch/arc/include/asm/page.h:41:29: error: request for member 'pgd' in something not a structure or union
      41 | #define pgd_val(x)      ((x).pgd)
         |                             ^
   include/asm-generic/pgtable-nop4d.h:40:50: note: in expansion of macro 'pgd_val'
      40 | #define p4d_val(x)                              (pgd_val((x).pgd))
         |                                                  ^~~~~~~
   include/asm-generic/pgtable-nopud.h:48:50: note: in expansion of macro 'p4d_val'
      48 | #define pud_val(x)                              (p4d_val((x).p4d))
         |                                                  ^~~~~~~
   include/asm-generic/pgtable-nopmd.h:52:50: note: in expansion of macro 'pud_val'
      52 | #define pmd_val(x)                              (pud_val((x).pud))
         |                                                  ^~~~~~~
   include/linux/pgtable.h:1027:16: note: in expansion of macro 'pmd_val'
    1027 |         return pmd_val(pmd_a) == pmd_val(pmd_b);
         |                ^~~~~~~
   arch/arc/include/asm/page.h:41:29: error: request for member 'pgd' in something not a structure or union
      41 | #define pgd_val(x)      ((x).pgd)
         |                             ^
   include/asm-generic/pgtable-nop4d.h:40:50: note: in expansion of macro 'pgd_val'
      40 | #define p4d_val(x)                              (pgd_val((x).pgd))
         |                                                  ^~~~~~~
   include/asm-generic/pgtable-nopud.h:48:50: note: in expansion of macro 'p4d_val'
      48 | #define pud_val(x)                              (p4d_val((x).p4d))
         |                                                  ^~~~~~~
   include/asm-generic/pgtable-nopmd.h:52:50: note: in expansion of macro 'pud_val'
      52 | #define pmd_val(x)                              (pud_val((x).pud))
         |                                                  ^~~~~~~
   include/linux/pgtable.h:1027:34: note: in expansion of macro 'pmd_val'
    1027 |         return pmd_val(pmd_a) == pmd_val(pmd_b);
         |                                  ^~~~~~~
   include/linux/pgtable.h:1025:34: warning: parameter 'pmd_a' set but not used [-Wunused-but-set-parameter]
    1025 | static inline int pmd_same(pmd_t pmd_a, pmd_t pmd_b)
         |                            ~~~~~~^~~~~
   include/linux/pgtable.h:1025:47: warning: parameter 'pmd_b' set but not used [-Wunused-but-set-parameter]
    1025 | static inline int pmd_same(pmd_t pmd_a, pmd_t pmd_b)
         |                                         ~~~~~~^~~~~
   include/linux/pgtable.h: In function 'pud_same':
   arch/arc/include/asm/page.h:41:29: error: request for member 'pgd' in something not a structure or union
      41 | #define pgd_val(x)      ((x).pgd)
         |                             ^
   include/asm-generic/pgtable-nop4d.h:40:50: note: in expansion of macro 'pgd_val'
      40 | #define p4d_val(x)                              (pgd_val((x).pgd))
         |                                                  ^~~~~~~
   include/asm-generic/pgtable-nopud.h:48:50: note: in expansion of macro 'p4d_val'
      48 | #define pud_val(x)                              (p4d_val((x).p4d))
         |                                                  ^~~~~~~
   include/linux/pgtable.h:1034:16: note: in expansion of macro 'pud_val'
    1034 |         return pud_val(pud_a) == pud_val(pud_b);
         |                ^~~~~~~
   arch/arc/include/asm/page.h:41:29: error: request for member 'pgd' in something not a structure or union


vim +495 include/linux/pgtable.h

e2cda322648122 include/asm-generic/pgtable.h Andrea Arcangeli   2011-01-13  461  
1b68112c40395b include/linux/pgtable.h       Lance Yang         2024-04-18  462  #ifndef clear_young_dirty_ptes
1b68112c40395b include/linux/pgtable.h       Lance Yang         2024-04-18  463  /**
1b68112c40395b include/linux/pgtable.h       Lance Yang         2024-04-18  464   * clear_young_dirty_ptes - Mark PTEs that map consecutive pages of the
1b68112c40395b include/linux/pgtable.h       Lance Yang         2024-04-18  465   *		same folio as old/clean.
1b68112c40395b include/linux/pgtable.h       Lance Yang         2024-04-18  466   * @mm: Address space the pages are mapped into.
1b68112c40395b include/linux/pgtable.h       Lance Yang         2024-04-18  467   * @addr: Address the first page is mapped at.
1b68112c40395b include/linux/pgtable.h       Lance Yang         2024-04-18  468   * @ptep: Page table pointer for the first entry.
1b68112c40395b include/linux/pgtable.h       Lance Yang         2024-04-18  469   * @nr: Number of entries to mark old/clean.
1b68112c40395b include/linux/pgtable.h       Lance Yang         2024-04-18  470   * @flags: Flags to modify the PTE batch semantics.
1b68112c40395b include/linux/pgtable.h       Lance Yang         2024-04-18  471   *
1b68112c40395b include/linux/pgtable.h       Lance Yang         2024-04-18  472   * May be overridden by the architecture; otherwise, implemented by
1b68112c40395b include/linux/pgtable.h       Lance Yang         2024-04-18  473   * get_and_clear/modify/set for each pte in the range.
1b68112c40395b include/linux/pgtable.h       Lance Yang         2024-04-18  474   *
1b68112c40395b include/linux/pgtable.h       Lance Yang         2024-04-18  475   * Note that PTE bits in the PTE range besides the PFN can differ. For example,
1b68112c40395b include/linux/pgtable.h       Lance Yang         2024-04-18  476   * some PTEs might be write-protected.
1b68112c40395b include/linux/pgtable.h       Lance Yang         2024-04-18  477   *
1b68112c40395b include/linux/pgtable.h       Lance Yang         2024-04-18  478   * Context: The caller holds the page table lock.  The PTEs map consecutive
1b68112c40395b include/linux/pgtable.h       Lance Yang         2024-04-18  479   * pages that belong to the same folio.  The PTEs are all in the same PMD.
1b68112c40395b include/linux/pgtable.h       Lance Yang         2024-04-18  480   */
1b68112c40395b include/linux/pgtable.h       Lance Yang         2024-04-18  481  static inline void clear_young_dirty_ptes(struct vm_area_struct *vma,
1b68112c40395b include/linux/pgtable.h       Lance Yang         2024-04-18  482  					  unsigned long addr, pte_t *ptep,
1b68112c40395b include/linux/pgtable.h       Lance Yang         2024-04-18  483  					  unsigned int nr, cydp_t flags)
1b68112c40395b include/linux/pgtable.h       Lance Yang         2024-04-18  484  {
1b68112c40395b include/linux/pgtable.h       Lance Yang         2024-04-18  485  	pte_t pte;
1b68112c40395b include/linux/pgtable.h       Lance Yang         2024-04-18  486  
1b68112c40395b include/linux/pgtable.h       Lance Yang         2024-04-18  487  	for (;;) {
1b68112c40395b include/linux/pgtable.h       Lance Yang         2024-04-18  488  		if (flags == CYDP_CLEAR_YOUNG)
1b68112c40395b include/linux/pgtable.h       Lance Yang         2024-04-18  489  			ptep_test_and_clear_young(vma, addr, ptep);
1b68112c40395b include/linux/pgtable.h       Lance Yang         2024-04-18  490  		else {
1b68112c40395b include/linux/pgtable.h       Lance Yang         2024-04-18  491  			pte = ptep_get_and_clear(vma->vm_mm, addr, ptep);
1b68112c40395b include/linux/pgtable.h       Lance Yang         2024-04-18  492  			if (flags & CYDP_CLEAR_YOUNG)
1b68112c40395b include/linux/pgtable.h       Lance Yang         2024-04-18  493  				pte = pte_mkold(pte);
1b68112c40395b include/linux/pgtable.h       Lance Yang         2024-04-18  494  			if (flags & CYDP_CLEAR_DIRTY)
1b68112c40395b include/linux/pgtable.h       Lance Yang         2024-04-18 @495  				pte = pte_mkclean(pte);
1b68112c40395b include/linux/pgtable.h       Lance Yang         2024-04-18  496  			set_pte_at(vma->vm_mm, addr, ptep, pte);
1b68112c40395b include/linux/pgtable.h       Lance Yang         2024-04-18  497  		}
1b68112c40395b include/linux/pgtable.h       Lance Yang         2024-04-18  498  		if (--nr == 0)
1b68112c40395b include/linux/pgtable.h       Lance Yang         2024-04-18  499  			break;
1b68112c40395b include/linux/pgtable.h       Lance Yang         2024-04-18  500  		ptep++;
1b68112c40395b include/linux/pgtable.h       Lance Yang         2024-04-18  501  		addr += PAGE_SIZE;
1b68112c40395b include/linux/pgtable.h       Lance Yang         2024-04-18  502  	}
1b68112c40395b include/linux/pgtable.h       Lance Yang         2024-04-18  503  }
1b68112c40395b include/linux/pgtable.h       Lance Yang         2024-04-18  504  #endif
1b68112c40395b include/linux/pgtable.h       Lance Yang         2024-04-18  505  
de8c8e52836d00 include/linux/pgtable.h       Tong Tiangen       2022-05-12  506  static inline void ptep_clear(struct mm_struct *mm, unsigned long addr,
de8c8e52836d00 include/linux/pgtable.h       Tong Tiangen       2022-05-12  507  			      pte_t *ptep)
de8c8e52836d00 include/linux/pgtable.h       Tong Tiangen       2022-05-12  508  {
de8c8e52836d00 include/linux/pgtable.h       Tong Tiangen       2022-05-12  509  	ptep_get_and_clear(mm, addr, ptep);
de8c8e52836d00 include/linux/pgtable.h       Tong Tiangen       2022-05-12  510  }
de8c8e52836d00 include/linux/pgtable.h       Tong Tiangen       2022-05-12  511  
6ca297d4784625 include/linux/pgtable.h       Peter Zijlstra     2022-10-21  512  #ifdef CONFIG_GUP_GET_PXX_LOW_HIGH
2a4a06da8a4b93 include/linux/pgtable.h       Peter Zijlstra     2020-11-13  513  /*
93b3037a148275 include/linux/pgtable.h       Peter Zijlstra     2020-11-26  514   * For walking the pagetables without holding any locks.  Some architectures
93b3037a148275 include/linux/pgtable.h       Peter Zijlstra     2020-11-26  515   * (eg x86-32 PAE) cannot load the entries atomically without using expensive
93b3037a148275 include/linux/pgtable.h       Peter Zijlstra     2020-11-26  516   * instructions.  We are guaranteed that a PTE will only either go from not
93b3037a148275 include/linux/pgtable.h       Peter Zijlstra     2020-11-26  517   * present to present, or present to not present -- it will not switch to a
93b3037a148275 include/linux/pgtable.h       Peter Zijlstra     2020-11-26  518   * completely different present page without a TLB flush inbetween; which we
93b3037a148275 include/linux/pgtable.h       Peter Zijlstra     2020-11-26  519   * are blocking by holding interrupts off.
2a4a06da8a4b93 include/linux/pgtable.h       Peter Zijlstra     2020-11-13  520   *
2a4a06da8a4b93 include/linux/pgtable.h       Peter Zijlstra     2020-11-13  521   * Setting ptes from not present to present goes:
2a4a06da8a4b93 include/linux/pgtable.h       Peter Zijlstra     2020-11-13  522   *
2a4a06da8a4b93 include/linux/pgtable.h       Peter Zijlstra     2020-11-13  523   *   ptep->pte_high = h;
2a4a06da8a4b93 include/linux/pgtable.h       Peter Zijlstra     2020-11-13  524   *   smp_wmb();
2a4a06da8a4b93 include/linux/pgtable.h       Peter Zijlstra     2020-11-13  525   *   ptep->pte_low = l;
2a4a06da8a4b93 include/linux/pgtable.h       Peter Zijlstra     2020-11-13  526   *
2a4a06da8a4b93 include/linux/pgtable.h       Peter Zijlstra     2020-11-13  527   * And present to not present goes:
2a4a06da8a4b93 include/linux/pgtable.h       Peter Zijlstra     2020-11-13  528   *
2a4a06da8a4b93 include/linux/pgtable.h       Peter Zijlstra     2020-11-13  529   *   ptep->pte_low = 0;
2a4a06da8a4b93 include/linux/pgtable.h       Peter Zijlstra     2020-11-13  530   *   smp_wmb();
2a4a06da8a4b93 include/linux/pgtable.h       Peter Zijlstra     2020-11-13  531   *   ptep->pte_high = 0;
2a4a06da8a4b93 include/linux/pgtable.h       Peter Zijlstra     2020-11-13  532   *
2a4a06da8a4b93 include/linux/pgtable.h       Peter Zijlstra     2020-11-13  533   * We must ensure here that the load of pte_low sees 'l' IFF pte_high sees 'h'.
2a4a06da8a4b93 include/linux/pgtable.h       Peter Zijlstra     2020-11-13  534   * We load pte_high *after* loading pte_low, which ensures we don't see an older
2a4a06da8a4b93 include/linux/pgtable.h       Peter Zijlstra     2020-11-13  535   * value of pte_high.  *Then* we recheck pte_low, which ensures that we haven't
2a4a06da8a4b93 include/linux/pgtable.h       Peter Zijlstra     2020-11-13  536   * picked up a changed pte high. We might have gotten rubbish values from
2a4a06da8a4b93 include/linux/pgtable.h       Peter Zijlstra     2020-11-13  537   * pte_low and pte_high, but we are guaranteed that pte_low will not have the
2a4a06da8a4b93 include/linux/pgtable.h       Peter Zijlstra     2020-11-13  538   * present bit set *unless* it is 'l'. Because get_user_pages_fast() only
2a4a06da8a4b93 include/linux/pgtable.h       Peter Zijlstra     2020-11-13  539   * operates on present ptes we're safe.
2a4a06da8a4b93 include/linux/pgtable.h       Peter Zijlstra     2020-11-13  540   */
2a4a06da8a4b93 include/linux/pgtable.h       Peter Zijlstra     2020-11-13  541  static inline pte_t ptep_get_lockless(pte_t *ptep)
2a4a06da8a4b93 include/linux/pgtable.h       Peter Zijlstra     2020-11-13  542  {
2a4a06da8a4b93 include/linux/pgtable.h       Peter Zijlstra     2020-11-13  543  	pte_t pte;
2a4a06da8a4b93 include/linux/pgtable.h       Peter Zijlstra     2020-11-13  544  
2a4a06da8a4b93 include/linux/pgtable.h       Peter Zijlstra     2020-11-13  545  	do {
2a4a06da8a4b93 include/linux/pgtable.h       Peter Zijlstra     2020-11-13  546  		pte.pte_low = ptep->pte_low;
2a4a06da8a4b93 include/linux/pgtable.h       Peter Zijlstra     2020-11-13  547  		smp_rmb();
2a4a06da8a4b93 include/linux/pgtable.h       Peter Zijlstra     2020-11-13  548  		pte.pte_high = ptep->pte_high;
2a4a06da8a4b93 include/linux/pgtable.h       Peter Zijlstra     2020-11-13  549  		smp_rmb();
2a4a06da8a4b93 include/linux/pgtable.h       Peter Zijlstra     2020-11-13  550  	} while (unlikely(pte.pte_low != ptep->pte_low));
2a4a06da8a4b93 include/linux/pgtable.h       Peter Zijlstra     2020-11-13  551  
2a4a06da8a4b93 include/linux/pgtable.h       Peter Zijlstra     2020-11-13  552  	return pte;
2a4a06da8a4b93 include/linux/pgtable.h       Peter Zijlstra     2020-11-13  553  }
024d232ae4fcd7 include/linux/pgtable.h       Peter Zijlstra     2020-11-26  554  #define ptep_get_lockless ptep_get_lockless
024d232ae4fcd7 include/linux/pgtable.h       Peter Zijlstra     2020-11-26  555  
024d232ae4fcd7 include/linux/pgtable.h       Peter Zijlstra     2020-11-26  556  #if CONFIG_PGTABLE_LEVELS > 2
024d232ae4fcd7 include/linux/pgtable.h       Peter Zijlstra     2020-11-26  557  static inline pmd_t pmdp_get_lockless(pmd_t *pmdp)
024d232ae4fcd7 include/linux/pgtable.h       Peter Zijlstra     2020-11-26  558  {
024d232ae4fcd7 include/linux/pgtable.h       Peter Zijlstra     2020-11-26  559  	pmd_t pmd;
024d232ae4fcd7 include/linux/pgtable.h       Peter Zijlstra     2020-11-26  560  
024d232ae4fcd7 include/linux/pgtable.h       Peter Zijlstra     2020-11-26  561  	do {
024d232ae4fcd7 include/linux/pgtable.h       Peter Zijlstra     2020-11-26  562  		pmd.pmd_low = pmdp->pmd_low;
024d232ae4fcd7 include/linux/pgtable.h       Peter Zijlstra     2020-11-26  563  		smp_rmb();
024d232ae4fcd7 include/linux/pgtable.h       Peter Zijlstra     2020-11-26  564  		pmd.pmd_high = pmdp->pmd_high;
024d232ae4fcd7 include/linux/pgtable.h       Peter Zijlstra     2020-11-26  565  		smp_rmb();
024d232ae4fcd7 include/linux/pgtable.h       Peter Zijlstra     2020-11-26  566  	} while (unlikely(pmd.pmd_low != pmdp->pmd_low));
024d232ae4fcd7 include/linux/pgtable.h       Peter Zijlstra     2020-11-26  567  
024d232ae4fcd7 include/linux/pgtable.h       Peter Zijlstra     2020-11-26  568  	return pmd;
024d232ae4fcd7 include/linux/pgtable.h       Peter Zijlstra     2020-11-26  569  }
024d232ae4fcd7 include/linux/pgtable.h       Peter Zijlstra     2020-11-26  570  #define pmdp_get_lockless pmdp_get_lockless
146b42e07494e4 include/linux/pgtable.h       Hugh Dickins       2023-07-11  571  #define pmdp_get_lockless_sync() tlb_remove_table_sync_one()
024d232ae4fcd7 include/linux/pgtable.h       Peter Zijlstra     2020-11-26  572  #endif /* CONFIG_PGTABLE_LEVELS > 2 */
6ca297d4784625 include/linux/pgtable.h       Peter Zijlstra     2022-10-21  573  #endif /* CONFIG_GUP_GET_PXX_LOW_HIGH */
024d232ae4fcd7 include/linux/pgtable.h       Peter Zijlstra     2020-11-26  574  
2a4a06da8a4b93 include/linux/pgtable.h       Peter Zijlstra     2020-11-13  575  /*
2a4a06da8a4b93 include/linux/pgtable.h       Peter Zijlstra     2020-11-13  576   * We require that the PTE can be read atomically.
2a4a06da8a4b93 include/linux/pgtable.h       Peter Zijlstra     2020-11-13  577   */
024d232ae4fcd7 include/linux/pgtable.h       Peter Zijlstra     2020-11-26  578  #ifndef ptep_get_lockless
2a4a06da8a4b93 include/linux/pgtable.h       Peter Zijlstra     2020-11-13  579  static inline pte_t ptep_get_lockless(pte_t *ptep)
2a4a06da8a4b93 include/linux/pgtable.h       Peter Zijlstra     2020-11-13  580  {
2a4a06da8a4b93 include/linux/pgtable.h       Peter Zijlstra     2020-11-13  581  	return ptep_get(ptep);
2a4a06da8a4b93 include/linux/pgtable.h       Peter Zijlstra     2020-11-13  582  }
024d232ae4fcd7 include/linux/pgtable.h       Peter Zijlstra     2020-11-26  583  #endif
024d232ae4fcd7 include/linux/pgtable.h       Peter Zijlstra     2020-11-26  584  
024d232ae4fcd7 include/linux/pgtable.h       Peter Zijlstra     2020-11-26  585  #ifndef pmdp_get_lockless
024d232ae4fcd7 include/linux/pgtable.h       Peter Zijlstra     2020-11-26  586  static inline pmd_t pmdp_get_lockless(pmd_t *pmdp)
024d232ae4fcd7 include/linux/pgtable.h       Peter Zijlstra     2020-11-26  587  {
024d232ae4fcd7 include/linux/pgtable.h       Peter Zijlstra     2020-11-26  588  	return pmdp_get(pmdp);
024d232ae4fcd7 include/linux/pgtable.h       Peter Zijlstra     2020-11-26  589  }
146b42e07494e4 include/linux/pgtable.h       Hugh Dickins       2023-07-11  590  static inline void pmdp_get_lockless_sync(void)
146b42e07494e4 include/linux/pgtable.h       Hugh Dickins       2023-07-11  591  {
146b42e07494e4 include/linux/pgtable.h       Hugh Dickins       2023-07-11  592  }
024d232ae4fcd7 include/linux/pgtable.h       Peter Zijlstra     2020-11-26  593  #endif
2a4a06da8a4b93 include/linux/pgtable.h       Peter Zijlstra     2020-11-13  594  
e2cda322648122 include/asm-generic/pgtable.h Andrea Arcangeli   2011-01-13  595  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
a00cc7d9dd93d6 include/asm-generic/pgtable.h Matthew Wilcox     2017-02-24  596  #ifndef __HAVE_ARCH_PMDP_HUGE_GET_AND_CLEAR
8809aa2d28d741 include/asm-generic/pgtable.h Aneesh Kumar K.V   2015-06-24  597  static inline pmd_t pmdp_huge_get_and_clear(struct mm_struct *mm,
e2cda322648122 include/asm-generic/pgtable.h Andrea Arcangeli   2011-01-13  598  					    unsigned long address,
e2cda322648122 include/asm-generic/pgtable.h Andrea Arcangeli   2011-01-13  599  					    pmd_t *pmdp)
e2cda322648122 include/asm-generic/pgtable.h Andrea Arcangeli   2011-01-13  600  {
e2cda322648122 include/asm-generic/pgtable.h Andrea Arcangeli   2011-01-13  601  	pmd_t pmd = *pmdp;
de8c8e52836d00 include/linux/pgtable.h       Tong Tiangen       2022-05-12  602  
2d28a2275c21d0 include/asm-generic/pgtable.h Catalin Marinas    2012-10-08  603  	pmd_clear(pmdp);
1831414cd729a3 include/linux/pgtable.h       Kemeng Shi         2023-07-14  604  	page_table_check_pmd_clear(mm, pmd);
de8c8e52836d00 include/linux/pgtable.h       Tong Tiangen       2022-05-12  605  
e2cda322648122 include/asm-generic/pgtable.h Andrea Arcangeli   2011-01-13  606  	return pmd;
49b24d6b41c576 include/asm-generic/pgtable.h Nicolas Kaiser     2011-06-15  607  }
a00cc7d9dd93d6 include/asm-generic/pgtable.h Matthew Wilcox     2017-02-24  608  #endif /* __HAVE_ARCH_PMDP_HUGE_GET_AND_CLEAR */
a00cc7d9dd93d6 include/asm-generic/pgtable.h Matthew Wilcox     2017-02-24  609  #ifndef __HAVE_ARCH_PUDP_HUGE_GET_AND_CLEAR
a00cc7d9dd93d6 include/asm-generic/pgtable.h Matthew Wilcox     2017-02-24  610  static inline pud_t pudp_huge_get_and_clear(struct mm_struct *mm,
a00cc7d9dd93d6 include/asm-generic/pgtable.h Matthew Wilcox     2017-02-24  611  					    unsigned long address,
a00cc7d9dd93d6 include/asm-generic/pgtable.h Matthew Wilcox     2017-02-24  612  					    pud_t *pudp)
a00cc7d9dd93d6 include/asm-generic/pgtable.h Matthew Wilcox     2017-02-24  613  {
a00cc7d9dd93d6 include/asm-generic/pgtable.h Matthew Wilcox     2017-02-24  614  	pud_t pud = *pudp;
a00cc7d9dd93d6 include/asm-generic/pgtable.h Matthew Wilcox     2017-02-24  615  
a00cc7d9dd93d6 include/asm-generic/pgtable.h Matthew Wilcox     2017-02-24  616  	pud_clear(pudp);
931c38e16499a0 include/linux/pgtable.h       Kemeng Shi         2023-07-14  617  	page_table_check_pud_clear(mm, pud);
de8c8e52836d00 include/linux/pgtable.h       Tong Tiangen       2022-05-12  618  
a00cc7d9dd93d6 include/asm-generic/pgtable.h Matthew Wilcox     2017-02-24  619  	return pud;
a00cc7d9dd93d6 include/asm-generic/pgtable.h Matthew Wilcox     2017-02-24  620  }
a00cc7d9dd93d6 include/asm-generic/pgtable.h Matthew Wilcox     2017-02-24  621  #endif /* __HAVE_ARCH_PUDP_HUGE_GET_AND_CLEAR */
e2cda322648122 include/asm-generic/pgtable.h Andrea Arcangeli   2011-01-13  622  #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
^1da177e4c3f41 include/asm-generic/pgtable.h Linus Torvalds     2005-04-16  623  
fcbe08d66f57c3 include/asm-generic/pgtable.h Martin Schwidefsky 2014-10-24  624  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
a00cc7d9dd93d6 include/asm-generic/pgtable.h Matthew Wilcox     2017-02-24  625  #ifndef __HAVE_ARCH_PMDP_HUGE_GET_AND_CLEAR_FULL
93a98695f2f9f9 include/asm-generic/pgtable.h Aneesh Kumar K.V   2020-05-05  626  static inline pmd_t pmdp_huge_get_and_clear_full(struct vm_area_struct *vma,
fcbe08d66f57c3 include/asm-generic/pgtable.h Martin Schwidefsky 2014-10-24  627  					    unsigned long address, pmd_t *pmdp,
fcbe08d66f57c3 include/asm-generic/pgtable.h Martin Schwidefsky 2014-10-24  628  					    int full)
fcbe08d66f57c3 include/asm-generic/pgtable.h Martin Schwidefsky 2014-10-24  629  {
93a98695f2f9f9 include/asm-generic/pgtable.h Aneesh Kumar K.V   2020-05-05  630  	return pmdp_huge_get_and_clear(vma->vm_mm, address, pmdp);
fcbe08d66f57c3 include/asm-generic/pgtable.h Martin Schwidefsky 2014-10-24  631  }
fcbe08d66f57c3 include/asm-generic/pgtable.h Martin Schwidefsky 2014-10-24  632  #endif
fcbe08d66f57c3 include/asm-generic/pgtable.h Martin Schwidefsky 2014-10-24  633  
a00cc7d9dd93d6 include/asm-generic/pgtable.h Matthew Wilcox     2017-02-24  634  #ifndef __HAVE_ARCH_PUDP_HUGE_GET_AND_CLEAR_FULL
f32928ab6fe5ab include/linux/pgtable.h       Aneesh Kumar K.V   2023-07-25  635  static inline pud_t pudp_huge_get_and_clear_full(struct vm_area_struct *vma,
a00cc7d9dd93d6 include/asm-generic/pgtable.h Matthew Wilcox     2017-02-24  636  					    unsigned long address, pud_t *pudp,
a00cc7d9dd93d6 include/asm-generic/pgtable.h Matthew Wilcox     2017-02-24  637  					    int full)
a00cc7d9dd93d6 include/asm-generic/pgtable.h Matthew Wilcox     2017-02-24  638  {
f32928ab6fe5ab include/linux/pgtable.h       Aneesh Kumar K.V   2023-07-25  639  	return pudp_huge_get_and_clear(vma->vm_mm, address, pudp);
a00cc7d9dd93d6 include/asm-generic/pgtable.h Matthew Wilcox     2017-02-24  640  }
a00cc7d9dd93d6 include/asm-generic/pgtable.h Matthew Wilcox     2017-02-24  641  #endif
a00cc7d9dd93d6 include/asm-generic/pgtable.h Matthew Wilcox     2017-02-24  642  #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
a00cc7d9dd93d6 include/asm-generic/pgtable.h Matthew Wilcox     2017-02-24  643  
a600388d284193 include/asm-generic/pgtable.h Zachary Amsden     2005-09-03  644  #ifndef __HAVE_ARCH_PTEP_GET_AND_CLEAR_FULL
e2cda322648122 include/asm-generic/pgtable.h Andrea Arcangeli   2011-01-13  645  static inline pte_t ptep_get_and_clear_full(struct mm_struct *mm,
e2cda322648122 include/asm-generic/pgtable.h Andrea Arcangeli   2011-01-13  646  					    unsigned long address, pte_t *ptep,
e2cda322648122 include/asm-generic/pgtable.h Andrea Arcangeli   2011-01-13  647  					    int full)
e2cda322648122 include/asm-generic/pgtable.h Andrea Arcangeli   2011-01-13  648  {
d3a89233583bf8 include/linux/pgtable.h       zhang songyi       2022-11-28  649  	return ptep_get_and_clear(mm, address, ptep);
e2cda322648122 include/asm-generic/pgtable.h Andrea Arcangeli   2011-01-13  650  }
a600388d284193 include/asm-generic/pgtable.h Zachary Amsden     2005-09-03  651  #endif
a600388d284193 include/asm-generic/pgtable.h Zachary Amsden     2005-09-03  652  
10ebac4f95e7a9 include/linux/pgtable.h       David Hildenbrand  2024-02-14  653  #ifndef get_and_clear_full_ptes
10ebac4f95e7a9 include/linux/pgtable.h       David Hildenbrand  2024-02-14  654  /**
10ebac4f95e7a9 include/linux/pgtable.h       David Hildenbrand  2024-02-14  655   * get_and_clear_full_ptes - Clear present PTEs that map consecutive pages of
10ebac4f95e7a9 include/linux/pgtable.h       David Hildenbrand  2024-02-14  656   *			     the same folio, collecting dirty/accessed bits.
10ebac4f95e7a9 include/linux/pgtable.h       David Hildenbrand  2024-02-14  657   * @mm: Address space the pages are mapped into.
10ebac4f95e7a9 include/linux/pgtable.h       David Hildenbrand  2024-02-14  658   * @addr: Address the first page is mapped at.
10ebac4f95e7a9 include/linux/pgtable.h       David Hildenbrand  2024-02-14  659   * @ptep: Page table pointer for the first entry.
10ebac4f95e7a9 include/linux/pgtable.h       David Hildenbrand  2024-02-14  660   * @nr: Number of entries to clear.
10ebac4f95e7a9 include/linux/pgtable.h       David Hildenbrand  2024-02-14  661   * @full: Whether we are clearing a full mm.
10ebac4f95e7a9 include/linux/pgtable.h       David Hildenbrand  2024-02-14  662   *
10ebac4f95e7a9 include/linux/pgtable.h       David Hildenbrand  2024-02-14  663   * May be overridden by the architecture; otherwise, implemented as a simple
10ebac4f95e7a9 include/linux/pgtable.h       David Hildenbrand  2024-02-14  664   * loop over ptep_get_and_clear_full(), merging dirty/accessed bits into the
10ebac4f95e7a9 include/linux/pgtable.h       David Hildenbrand  2024-02-14  665   * returned PTE.
10ebac4f95e7a9 include/linux/pgtable.h       David Hildenbrand  2024-02-14  666   *
10ebac4f95e7a9 include/linux/pgtable.h       David Hildenbrand  2024-02-14  667   * Note that PTE bits in the PTE range besides the PFN can differ. For example,
10ebac4f95e7a9 include/linux/pgtable.h       David Hildenbrand  2024-02-14  668   * some PTEs might be write-protected.
10ebac4f95e7a9 include/linux/pgtable.h       David Hildenbrand  2024-02-14  669   *
10ebac4f95e7a9 include/linux/pgtable.h       David Hildenbrand  2024-02-14  670   * Context: The caller holds the page table lock.  The PTEs map consecutive
10ebac4f95e7a9 include/linux/pgtable.h       David Hildenbrand  2024-02-14  671   * pages that belong to the same folio.  The PTEs are all in the same PMD.
10ebac4f95e7a9 include/linux/pgtable.h       David Hildenbrand  2024-02-14  672   */
10ebac4f95e7a9 include/linux/pgtable.h       David Hildenbrand  2024-02-14  673  static inline pte_t get_and_clear_full_ptes(struct mm_struct *mm,
10ebac4f95e7a9 include/linux/pgtable.h       David Hildenbrand  2024-02-14  674  		unsigned long addr, pte_t *ptep, unsigned int nr, int full)
10ebac4f95e7a9 include/linux/pgtable.h       David Hildenbrand  2024-02-14  675  {
10ebac4f95e7a9 include/linux/pgtable.h       David Hildenbrand  2024-02-14  676  	pte_t pte, tmp_pte;
10ebac4f95e7a9 include/linux/pgtable.h       David Hildenbrand  2024-02-14  677  
10ebac4f95e7a9 include/linux/pgtable.h       David Hildenbrand  2024-02-14  678  	pte = ptep_get_and_clear_full(mm, addr, ptep, full);
10ebac4f95e7a9 include/linux/pgtable.h       David Hildenbrand  2024-02-14  679  	while (--nr) {
10ebac4f95e7a9 include/linux/pgtable.h       David Hildenbrand  2024-02-14  680  		ptep++;
10ebac4f95e7a9 include/linux/pgtable.h       David Hildenbrand  2024-02-14  681  		addr += PAGE_SIZE;
10ebac4f95e7a9 include/linux/pgtable.h       David Hildenbrand  2024-02-14  682  		tmp_pte = ptep_get_and_clear_full(mm, addr, ptep, full);
10ebac4f95e7a9 include/linux/pgtable.h       David Hildenbrand  2024-02-14  683  		if (pte_dirty(tmp_pte))
10ebac4f95e7a9 include/linux/pgtable.h       David Hildenbrand  2024-02-14 @684  			pte = pte_mkdirty(pte);
10ebac4f95e7a9 include/linux/pgtable.h       David Hildenbrand  2024-02-14  685  		if (pte_young(tmp_pte))
10ebac4f95e7a9 include/linux/pgtable.h       David Hildenbrand  2024-02-14 @686  			pte = pte_mkyoung(pte);
10ebac4f95e7a9 include/linux/pgtable.h       David Hildenbrand  2024-02-14  687  	}
10ebac4f95e7a9 include/linux/pgtable.h       David Hildenbrand  2024-02-14  688  	return pte;
10ebac4f95e7a9 include/linux/pgtable.h       David Hildenbrand  2024-02-14  689  }
10ebac4f95e7a9 include/linux/pgtable.h       David Hildenbrand  2024-02-14  690  #endif
10ebac4f95e7a9 include/linux/pgtable.h       David Hildenbrand  2024-02-14  691  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
