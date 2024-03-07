Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F1787479A
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 06:28:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CB9C10EF85;
	Thu,  7 Mar 2024 05:28:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LmKopY2v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83C5F10EF84;
 Thu,  7 Mar 2024 05:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709789329; x=1741325329;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Hjp3imUHQZBbUxNfyaSiyjt/YiKmSwERnuzP/cIIy18=;
 b=LmKopY2vSZTLeGa8mTNlu2cj6SgM443NGt+7X8Q1HWRmlMwRDT3/Sggj
 M3agrINIkMnZdXjP0ethtWdFYJxighUMdkRRitU5s+ZlWvLAguJ4G3wYL
 RfnJURlpMX5f6OCs0AtxqiSTS1tlYYw9/kuTM7DNwMLnltbEYYKA7bR6Y
 CbJKn9b86SYK4yg99Zld+na69gG/LNaFfw81mBMoSQ75eGvMnTeEeHRc8
 IS521dd8FcVi+9vfCIK3RKhJ+e9yfwxWW6c+dvzSWybXdfPyd/4gKscxo
 x4/RUKrYmNtypOAStA264uNJtnf6FiSibMMgETjBfIkxBKiF49VC/3dhu w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="15849238"
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; d="scan'208";a="15849238"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 21:28:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; d="scan'208";a="47487229"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
 by orviesa001.jf.intel.com with ESMTP; 06 Mar 2024 21:28:45 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1ri6J8-0004pp-1A;
 Thu, 07 Mar 2024 05:28:42 +0000
Date: Thu, 7 Mar 2024 13:28:38 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, jani.nikula@intel.com,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH 22/22] drm: ensure drm headers are self-contained and
 pass kernel-doc
Message-ID: <202403071317.uoW18ZR3-lkp@intel.com>
References: <e22ab28836ee1689ea4781ed53fd2e4e4f84728e.1709749576.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e22ab28836ee1689ea4781ed53fd2e4e4f84728e.1709749576.git.jani.nikula@intel.com>
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

[auto build test ERROR on drm-misc/drm-misc-next]
[cannot apply to drm/drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes linus/master v6.8-rc7 next-20240306]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jani-Nikula/drm-crtc-make-drm_crtc_internal-h-self-contained/20240307-023603
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/e22ab28836ee1689ea4781ed53fd2e4e4f84728e.1709749576.git.jani.nikula%40intel.com
patch subject: [PATCH 22/22] drm: ensure drm headers are self-contained and pass kernel-doc
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240307/202403071317.uoW18ZR3-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240307/202403071317.uoW18ZR3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403071317.uoW18ZR3-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/asm-generic/pgtable-nopud.h:7,
                    from arch/m68k/include/asm/pgtable_mm.h:9,
                    from arch/m68k/include/asm/pgtable.h:8,
                    from include/linux/pgtable.h:6,
                    from include/drm/ttm/ttm_caching.h:28,
                    from <command-line>:
>> include/asm-generic/pgtable-nop4d.h:9:18: error: unknown type name 'pgd_t'
       9 | typedef struct { pgd_t pgd; } p4d_t;
         |                  ^~~~~
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
   In file included from arch/m68k/include/asm/thread_info.h:6,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/m68k/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from arch/m68k/include/asm/processor.h:11,
                    from arch/m68k/include/asm/pgtable_mm.h:15:
   arch/m68k/include/asm/motorola_pgtable.h: In function 'pud_set':
>> arch/m68k/include/asm/page.h:46:29: error: request for member 'pgd' in something not a structure or union
      46 | #define pgd_val(x)      ((x).pgd)
         |                             ^
   include/asm-generic/pgtable-nop4d.h:40:50: note: in expansion of macro 'pgd_val'
      40 | #define p4d_val(x)                              (pgd_val((x).pgd))
         |                                                  ^~~~~~~
   include/asm-generic/pgtable-nopud.h:48:50: note: in expansion of macro 'p4d_val'
      48 | #define pud_val(x)                              (p4d_val((x).p4d))
         |                                                  ^~~~~~~
   arch/m68k/include/asm/motorola_pgtable.h:103:9: note: in expansion of macro 'pud_val'
     103 |         pud_val(*pudp) = _PAGE_TABLE | _PAGE_ACCESSED | __pa(pmdp);
         |         ^~~~~~~
   include/linux/pgtable.h: In function 'pmd_offset':
>> arch/m68k/include/asm/page.h:46:29: error: request for member 'pgd' in something not a structure or union
      46 | #define pgd_val(x)      ((x).pgd)
         |                             ^
   include/asm-generic/pgtable-nop4d.h:40:50: note: in expansion of macro 'pgd_val'
      40 | #define p4d_val(x)                              (pgd_val((x).pgd))
         |                                                  ^~~~~~~
   include/asm-generic/pgtable-nopud.h:48:50: note: in expansion of macro 'p4d_val'
      48 | #define pud_val(x)                              (p4d_val((x).p4d))
         |                                                  ^~~~~~~
   arch/m68k/include/asm/motorola_pgtable.h:108:41: note: in expansion of macro 'pud_val'
     108 | #define pud_pgtable(pud) ((pmd_t *)__va(pud_val(pud) & _TABLE_MASK))
         |                                         ^~~~~~~
   include/linux/pgtable.h:123:16: note: in expansion of macro 'pud_pgtable'
     123 |         return pud_pgtable(*pud) + pmd_index(address);
         |                ^~~~~~~~~~~
   include/linux/pgtable.h: In function 'pmd_off':
>> include/linux/pgtable.h:165:38: error: implicit declaration of function 'p4d_offset'; did you mean 'pmd_offset'? [-Werror=implicit-function-declaration]
     165 |         return pmd_offset(pud_offset(p4d_offset(pgd_offset(mm, va), va), va), va);
         |                                      ^~~~~~~~~~
         |                                      pmd_offset
>> include/linux/pgtable.h:165:38: warning: passing argument 1 of 'pud_offset' makes pointer from integer without a cast [-Wint-conversion]
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
   include/linux/pgtable.h: In function 'pud_same':
>> arch/m68k/include/asm/page.h:46:29: error: request for member 'pgd' in something not a structure or union
      46 | #define pgd_val(x)      ((x).pgd)
         |                             ^
   include/asm-generic/pgtable-nop4d.h:40:50: note: in expansion of macro 'pgd_val'
      40 | #define p4d_val(x)                              (pgd_val((x).pgd))
         |                                                  ^~~~~~~
   include/asm-generic/pgtable-nopud.h:48:50: note: in expansion of macro 'p4d_val'
      48 | #define pud_val(x)                              (p4d_val((x).p4d))
         |                                                  ^~~~~~~
   include/linux/pgtable.h:829:16: note: in expansion of macro 'pud_val'
     829 |         return pud_val(pud_a) == pud_val(pud_b);
         |                ^~~~~~~
>> arch/m68k/include/asm/page.h:46:29: error: request for member 'pgd' in something not a structure or union
      46 | #define pgd_val(x)      ((x).pgd)
         |                             ^
   include/asm-generic/pgtable-nop4d.h:40:50: note: in expansion of macro 'pgd_val'
      40 | #define p4d_val(x)                              (pgd_val((x).pgd))
         |                                                  ^~~~~~~
   include/asm-generic/pgtable-nopud.h:48:50: note: in expansion of macro 'p4d_val'
      48 | #define pud_val(x)                              (p4d_val((x).p4d))
         |                                                  ^~~~~~~
   include/linux/pgtable.h:829:34: note: in expansion of macro 'pud_val'
     829 |         return pud_val(pud_a) == pud_val(pud_b);
         |                                  ^~~~~~~
>> include/linux/pgtable.h:827:34: warning: parameter 'pud_a' set but not used [-Wunused-but-set-parameter]
     827 | static inline int pud_same(pud_t pud_a, pud_t pud_b)
         |                            ~~~~~~^~~~~
>> include/linux/pgtable.h:827:47: warning: parameter 'pud_b' set but not used [-Wunused-but-set-parameter]
     827 | static inline int pud_same(pud_t pud_a, pud_t pud_b)
         |                                         ~~~~~~^~~~~
   include/linux/pgtable.h: In function 'p4d_same':
>> arch/m68k/include/asm/page.h:46:29: error: request for member 'pgd' in something not a structure or union
      46 | #define pgd_val(x)      ((x).pgd)
         |                             ^
   include/asm-generic/pgtable-nop4d.h:40:50: note: in expansion of macro 'pgd_val'
      40 | #define p4d_val(x)                              (pgd_val((x).pgd))
         |                                                  ^~~~~~~
   include/linux/pgtable.h:837:16: note: in expansion of macro 'p4d_val'
     837 |         return p4d_val(p4d_a) == p4d_val(p4d_b);
         |                ^~~~~~~
>> arch/m68k/include/asm/page.h:46:29: error: request for member 'pgd' in something not a structure or union
      46 | #define pgd_val(x)      ((x).pgd)
         |                             ^
   include/asm-generic/pgtable-nop4d.h:40:50: note: in expansion of macro 'pgd_val'
      40 | #define p4d_val(x)                              (pgd_val((x).pgd))
         |                                                  ^~~~~~~
   include/linux/pgtable.h:837:34: note: in expansion of macro 'p4d_val'
     837 |         return p4d_val(p4d_a) == p4d_val(p4d_b);
         |                                  ^~~~~~~
>> include/linux/pgtable.h:835:34: warning: parameter 'p4d_a' set but not used [-Wunused-but-set-parameter]
     835 | static inline int p4d_same(p4d_t p4d_a, p4d_t p4d_b)
         |                            ~~~~~~^~~~~
>> include/linux/pgtable.h:835:47: warning: parameter 'p4d_b' set but not used [-Wunused-but-set-parameter]
     835 | static inline int p4d_same(p4d_t p4d_a, p4d_t p4d_b)
         |                                         ~~~~~~^~~~~
   include/linux/pgtable.h: In function 'pgd_none_or_clear_bad':
>> include/linux/pgtable.h:1021:13: error: implicit declaration of function 'pgd_none'; did you mean 'p4d_none'? [-Werror=implicit-function-declaration]
    1021 |         if (pgd_none(*pgd))
         |             ^~~~~~~~
         |             p4d_none
   In file included from include/linux/export.h:5,
                    from include/linux/linkage.h:7,
                    from include/linux/preempt.h:10:
>> include/linux/pgtable.h:1023:22: error: implicit declaration of function 'pgd_bad'; did you mean 'p4d_bad'? [-Werror=implicit-function-declaration]
    1023 |         if (unlikely(pgd_bad(*pgd))) {
         |                      ^~~~~~~
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/pgtable.h: In function 'pud_none_or_clear_bad':
>> arch/m68k/include/asm/page.h:46:29: error: request for member 'pgd' in something not a structure or union
      46 | #define pgd_val(x)      ((x).pgd)
         |                             ^
   include/asm-generic/pgtable-nop4d.h:40:50: note: in expansion of macro 'pgd_val'
      40 | #define p4d_val(x)                              (pgd_val((x).pgd))
         |                                                  ^~~~~~~
   include/asm-generic/pgtable-nopud.h:48:50: note: in expansion of macro 'p4d_val'
      48 | #define pud_val(x)                              (p4d_val((x).p4d))
         |                                                  ^~~~~~~
   arch/m68k/include/asm/motorola_pgtable.h:134:35: note: in expansion of macro 'pud_val'
     134 | #define pud_none(pud)           (!pud_val(pud))
         |                                   ^~~~~~~
   include/linux/pgtable.h:1043:13: note: in expansion of macro 'pud_none'
    1043 |         if (pud_none(*pud))
         |             ^~~~~~~~
>> arch/m68k/include/asm/page.h:46:29: error: request for member 'pgd' in something not a structure or union
      46 | #define pgd_val(x)      ((x).pgd)
         |                             ^
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/asm-generic/pgtable-nop4d.h:40:50: note: in expansion of macro 'pgd_val'
      40 | #define p4d_val(x)                              (pgd_val((x).pgd))
         |                                                  ^~~~~~~
   include/asm-generic/pgtable-nopud.h:48:50: note: in expansion of macro 'p4d_val'
      48 | #define pud_val(x)                              (p4d_val((x).p4d))
         |                                                  ^~~~~~~
   arch/m68k/include/asm/motorola_pgtable.h:135:35: note: in expansion of macro 'pud_val'
     135 | #define pud_bad(pud)            ((pud_val(pud) & _DESCTYPE_MASK) != _PAGE_TABLE)
         |                                   ^~~~~~~
   include/linux/pgtable.h:1045:22: note: in expansion of macro 'pud_bad'
    1045 |         if (unlikely(pud_bad(*pud))) {
         |                      ^~~~~~~
   cc1: some warnings being treated as errors


vim +/pgd_t +9 include/asm-generic/pgtable-nop4d.h

048456dcf2c56a Kirill A. Shutemov 2017-03-09   8  
048456dcf2c56a Kirill A. Shutemov 2017-03-09  @9  typedef struct { pgd_t pgd; } p4d_t;
048456dcf2c56a Kirill A. Shutemov 2017-03-09  10  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
