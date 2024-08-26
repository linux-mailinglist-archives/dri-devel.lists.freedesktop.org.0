Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C61895F5FF
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2024 18:05:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BAAC10E186;
	Mon, 26 Aug 2024 16:05:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="by8VozW/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B163D10E116;
 Mon, 26 Aug 2024 16:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724688326; x=1756224326;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=cjE5B/SZVIFmO1112HhPXpzbCl/E5vIJc416GqAbodc=;
 b=by8VozW/Id745ClCu+RMn4QBqZpfRN3IL7gkwEDOrM8JmKH+er1E+zEG
 peeX5p9Rj5Hcw0nqW/fWf5iGhGW6oP3o1stS64rbFU3Z4Nh4Zt7xJB/Ox
 amub1CeW3byG6onTgzIxdjMnH998Lg+H6U7mqlA1ATwoLzP884qpKKmMn
 rpKGDYD4EVFKv/95V+t96IGDIgOIl/BQXaUXm4/oZHfzOdbxDpxae8jaS
 SgCnzXrfb+uGAgqGgfPb4DqLXy5arlrIDya9yVBRrdusvZ2sePyGjixzX
 aNOUJvbNSBIsGHzF3MPptOHbVnfTyYYl6ugIATQduFtpxbo2SUaZ9YPz6 A==;
X-CSE-ConnectionGUID: 2qwFH5sAT5GMDL/sWLb7Xw==
X-CSE-MsgGUID: AxN2qi6sReyGFIhEeAT5sw==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="23277578"
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; d="scan'208";a="23277578"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 09:05:20 -0700
X-CSE-ConnectionGUID: amHjYY4AS/mN3Akd2TuMHg==
X-CSE-MsgGUID: oIO6nL4HSdOnjw6hAYQ+KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; d="scan'208";a="67248333"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
 by fmviesa004.fm.intel.com with ESMTP; 26 Aug 2024 09:05:13 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sicDP-000HGS-1M;
 Mon, 26 Aug 2024 16:05:11 +0000
Date: Tue, 27 Aug 2024 00:05:06 +0800
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
Message-ID: <202408262328.MknfI1MV-lkp@intel.com>
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
[also build test ERROR on drm-misc/drm-misc-next next-20240826]
[cannot apply to linus/master v6.11-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jani-Nikula/drm-ensure-drm-headers-are-self-contained-and-pass-kernel-doc/20240826-134953
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20240823141110.3431423-2-jani.nikula%40intel.com
patch subject: [PATCH 2/2] drm: ensure drm headers are self-contained and pass kernel-doc
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20240826/202408262328.MknfI1MV-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240826/202408262328.MknfI1MV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408262328.MknfI1MV-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/sparc/include/asm/pgtable_64.h:16,
                    from arch/sparc/include/asm/pgtable.h:5,
                    from include/linux/pgtable.h:6,
                    from include/drm/ttm/ttm_caching.h:28,
                    from <command-line>:
   include/asm-generic/pgtable-nop4d.h:9:18: error: unknown type name 'pgd_t'; did you mean 'pid_t'?
       9 | typedef struct { pgd_t pgd; } p4d_t;
         |                  ^~~~~
         |                  pid_t
   include/asm-generic/pgtable-nop4d.h:21:28: error: unknown type name 'pgd_t'; did you mean 'p4d_t'?
      21 | static inline int pgd_none(pgd_t pgd)           { return 0; }
         |                            ^~~~~
         |                            p4d_t
   include/asm-generic/pgtable-nop4d.h:22:27: error: unknown type name 'pgd_t'; did you mean 'p4d_t'?
      22 | static inline int pgd_bad(pgd_t pgd)            { return 0; }
         |                           ^~~~~
         |                           p4d_t
   include/asm-generic/pgtable-nop4d.h:23:31: error: unknown type name 'pgd_t'; did you mean 'p4d_t'?
      23 | static inline int pgd_present(pgd_t pgd)        { return 1; }
         |                               ^~~~~
         |                               p4d_t
   include/asm-generic/pgtable-nop4d.h:24:30: error: unknown type name 'pgd_t'; did you mean 'p4d_t'?
      24 | static inline void pgd_clear(pgd_t *pgd)        { }
         |                              ^~~~~
         |                              p4d_t
   include/asm-generic/pgtable-nop4d.h:35:33: error: unknown type name 'pgd_t'; did you mean 'p4d_t'?
      35 | static inline p4d_t *p4d_offset(pgd_t *pgd, unsigned long address)
         |                                 ^~~~~
         |                                 p4d_t
   In file included from arch/sparc/include/asm/page.h:8,
                    from arch/sparc/include/asm/pgtable_64.h:23:
   include/linux/pgtable.h: In function 'pud_offset':
   arch/sparc/include/asm/page_64.h:79:29: error: request for member 'pgd' in something not a structure or union
      79 | #define pgd_val(x)      ((x).pgd)
         |                             ^
   arch/sparc/include/asm/page_64.h:147:60: note: in definition of macro '__va'
     147 | #define __va(x)                 ((void *)((unsigned long) (x) + PAGE_OFFSET))
         |                                                            ^
   include/asm-generic/pgtable-nop4d.h:40:50: note: in expansion of macro 'pgd_val'
      40 | #define p4d_val(x)                              (pgd_val((x).pgd))
         |                                                  ^~~~~~~
   arch/sparc/include/asm/pgtable_64.h:863:25: note: in expansion of macro 'p4d_val'
     863 |         ((pud_t *) __va(p4d_val(p4d)))
         |                         ^~~~~~~
   include/linux/pgtable.h:133:16: note: in expansion of macro 'p4d_pgtable'
     133 |         return p4d_pgtable(*p4d) + pud_index(address);
         |                ^~~~~~~~~~~
   include/linux/pgtable.h: In function 'pmd_off':
   include/linux/pgtable.h:165:38: error: implicit declaration of function 'p4d_offset'; did you mean 'pud_offset'? [-Wimplicit-function-declaration]
     165 |         return pmd_offset(pud_offset(p4d_offset(pgd_offset(mm, va), va), va), va);
         |                                      ^~~~~~~~~~
         |                                      pud_offset
>> include/linux/pgtable.h:165:38: error: passing argument 1 of 'pud_offset' makes pointer from integer without a cast [-Wint-conversion]
     165 |         return pmd_offset(pud_offset(p4d_offset(pgd_offset(mm, va), va), va), va);
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                      |
         |                                      int
   include/linux/pgtable.h:131:40: note: expected 'p4d_t *' but argument is of type 'int'
     131 | static inline pud_t *pud_offset(p4d_t *p4d, unsigned long address)
         |                                 ~~~~~~~^~~
   include/linux/pgtable.h: In function 'pmd_off_k':
   include/linux/pgtable.h:170:38: error: passing argument 1 of 'pud_offset' makes pointer from integer without a cast [-Wint-conversion]
     170 |         return pmd_offset(pud_offset(p4d_offset(pgd_offset_k(va), va), va), va);
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                      |
         |                                      int
   include/linux/pgtable.h:131:40: note: expected 'p4d_t *' but argument is of type 'int'
     131 | static inline pud_t *pud_offset(p4d_t *p4d, unsigned long address)
         |                                 ~~~~~~~^~~
   include/linux/pgtable.h: In function 'p4d_same':
   arch/sparc/include/asm/page_64.h:79:29: error: request for member 'pgd' in something not a structure or union
      79 | #define pgd_val(x)      ((x).pgd)
         |                             ^
   include/asm-generic/pgtable-nop4d.h:40:50: note: in expansion of macro 'pgd_val'
      40 | #define p4d_val(x)                              (pgd_val((x).pgd))
         |                                                  ^~~~~~~
   include/linux/pgtable.h:1042:16: note: in expansion of macro 'p4d_val'
    1042 |         return p4d_val(p4d_a) == p4d_val(p4d_b);
         |                ^~~~~~~
   arch/sparc/include/asm/page_64.h:79:29: error: request for member 'pgd' in something not a structure or union
      79 | #define pgd_val(x)      ((x).pgd)
         |                             ^
   include/asm-generic/pgtable-nop4d.h:40:50: note: in expansion of macro 'pgd_val'
      40 | #define p4d_val(x)                              (pgd_val((x).pgd))
         |                                                  ^~~~~~~
   include/linux/pgtable.h:1042:34: note: in expansion of macro 'p4d_val'
    1042 |         return p4d_val(p4d_a) == p4d_val(p4d_b);
         |                                  ^~~~~~~
   include/linux/pgtable.h:1040:34: warning: parameter 'p4d_a' set but not used [-Wunused-but-set-parameter]
    1040 | static inline int p4d_same(p4d_t p4d_a, p4d_t p4d_b)
         |                            ~~~~~~^~~~~
   include/linux/pgtable.h:1040:47: warning: parameter 'p4d_b' set but not used [-Wunused-but-set-parameter]
    1040 | static inline int p4d_same(p4d_t p4d_a, p4d_t p4d_b)
         |                                         ~~~~~~^~~~~
   include/linux/pgtable.h: In function 'pgd_none_or_clear_bad':
   include/linux/pgtable.h:1240:13: error: implicit declaration of function 'pgd_none'; did you mean 'p4d_none'? [-Wimplicit-function-declaration]
    1240 |         if (pgd_none(*pgd))
         |             ^~~~~~~~
         |             p4d_none
   In file included from arch/sparc/include/asm/pgtable_64.h:17:
   include/linux/pgtable.h:1242:22: error: implicit declaration of function 'pgd_bad'; did you mean 'pmd_bad'? [-Wimplicit-function-declaration]
    1242 |         if (unlikely(pgd_bad(*pgd))) {
         |                      ^~~~~~~
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/pgtable.h: In function 'p4d_none_or_clear_bad':
   arch/sparc/include/asm/page_64.h:79:29: error: request for member 'pgd' in something not a structure or union
      79 | #define pgd_val(x)      ((x).pgd)
         |                             ^
   include/asm-generic/pgtable-nop4d.h:40:50: note: in expansion of macro 'pgd_val'
      40 | #define p4d_val(x)                              (pgd_val((x).pgd))
         |                                                  ^~~~~~~
   arch/sparc/include/asm/pgtable_64.h:813:43: note: in expansion of macro 'p4d_val'
     813 | #define p4d_none(p4d)                   (!p4d_val(p4d))
         |                                           ^~~~~~~
   include/linux/pgtable.h:1251:13: note: in expansion of macro 'p4d_none'
    1251 |         if (p4d_none(*p4d))
         |             ^~~~~~~~
   arch/sparc/include/asm/page_64.h:79:29: error: request for member 'pgd' in something not a structure or union
      79 | #define pgd_val(x)      ((x).pgd)
         |                             ^
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/asm-generic/pgtable-nop4d.h:40:50: note: in expansion of macro 'pgd_val'
      40 | #define p4d_val(x)                              (pgd_val((x).pgd))
         |                                                  ^~~~~~~
   arch/sparc/include/asm/pgtable_64.h:815:42: note: in expansion of macro 'p4d_val'
     815 | #define p4d_bad(p4d)                    (p4d_val(p4d) & ~PAGE_MASK)
         |                                          ^~~~~~~
   include/linux/pgtable.h:1253:22: note: in expansion of macro 'p4d_bad'
    1253 |         if (unlikely(p4d_bad(*p4d))) {
         |                      ^~~~~~~


vim +/pud_offset +165 include/linux/pgtable.h

974b9b2c68f3d3 Mike Rapoport 2020-06-08  155  
e05c7b1f2bc4b7 Mike Rapoport 2020-06-08  156  /*
e05c7b1f2bc4b7 Mike Rapoport 2020-06-08  157   * In many cases it is known that a virtual address is mapped at PMD or PTE
e05c7b1f2bc4b7 Mike Rapoport 2020-06-08  158   * level, so instead of traversing all the page table levels, we can get a
e05c7b1f2bc4b7 Mike Rapoport 2020-06-08  159   * pointer to the PMD entry in user or kernel page table or translate a virtual
e05c7b1f2bc4b7 Mike Rapoport 2020-06-08  160   * address to the pointer in the PTE in the kernel page tables with simple
e05c7b1f2bc4b7 Mike Rapoport 2020-06-08  161   * helpers.
e05c7b1f2bc4b7 Mike Rapoport 2020-06-08  162   */
e05c7b1f2bc4b7 Mike Rapoport 2020-06-08  163  static inline pmd_t *pmd_off(struct mm_struct *mm, unsigned long va)
e05c7b1f2bc4b7 Mike Rapoport 2020-06-08  164  {
e05c7b1f2bc4b7 Mike Rapoport 2020-06-08 @165  	return pmd_offset(pud_offset(p4d_offset(pgd_offset(mm, va), va), va), va);
e05c7b1f2bc4b7 Mike Rapoport 2020-06-08  166  }
e05c7b1f2bc4b7 Mike Rapoport 2020-06-08  167  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
