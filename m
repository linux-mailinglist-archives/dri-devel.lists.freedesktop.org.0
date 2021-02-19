Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8856831F47A
	for <lists+dri-devel@lfdr.de>; Fri, 19 Feb 2021 05:29:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BED306EAA5;
	Fri, 19 Feb 2021 04:29:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4B856EA78;
 Fri, 19 Feb 2021 04:29:45 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B602f3eb90000>; Thu, 18 Feb 2021 20:29:45 -0800
Received: from nvdebian.localnet (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 19 Feb
 2021 04:29:40 +0000
From: Alistair Popple <apopple@nvidia.com>
To: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 1/4] hmm: Device exclusive memory access
Date: Fri, 19 Feb 2021 15:29:38 +1100
Message-ID: <1921856.ipnSDt8Uia@nvdebian>
In-Reply-To: <202102191104.8PwQ82Oi-lkp@intel.com>
References: <20210219020750.16444-2-apopple@nvidia.com>
 <202102191104.8PwQ82Oi-lkp@intel.com>
MIME-Version: 1.0
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1613708985; bh=4RazHhYqMl6rmlDW/rVNtyCfznld0Neua58X8WgGEoM=;
 h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding:Content-Type:
 X-Originating-IP:X-ClientProxiedBy;
 b=hixsgKwaFwRN/pvvcDEYFWyB9b+6JHrdLv+OCJqTzicl0H7fZI31GEePmnGCaKfQ0
 lDj35EPoLqgh66iHSJzVo51l08GvJVLlmNwaKQBQQJDqBv64DHLsDUZ9Fe3kJNkZGz
 YZ0X/U36bbjR9RLdwmHEr4aDjnmxc8nSRolMQ7b7V1YbNtAhO5vVBNxCj1Uacyz9g4
 W8Rv7xEP+oSt6CMshsG3BtULfyElkQLvEGsfJkgYi2aps4Jmxgymb3bb6gUOWZLSSZ
 hyH5n5qOH4LfWI2HMixvFT3fNfCOI4u5o8oNQBQXHKcZAhhpFcT0hERApSzUqEV344
 YRfy3tseBPWWg==
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
Cc: rcampbell@nvidia.com, kbuild-all@lists.01.org,
 clang-built-linux@googlegroups.com, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org, linux-mm@kvack.org,
 bskeggs@redhat.com, jhubbard@nvidia.com, akpm@linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Apologies for the noise, looks like I don't have a CONFIG_DEVICE_PRIVATE=n 
build in my tests and missed creating definitions for the new static inline 
functions for that configuration.

I'll wait for some feedback on the overall approach and fix this in a v3.

 - Alistair

On Friday, 19 February 2021 3:04:07 PM AEDT kernel test robot wrote:
> External email: Use caution opening links or attachments
> 
> 
> Hi Alistair,
> 
> Thank you for the patch! Yet something to improve:
> 
> [auto build test ERROR on kselftest/next]
> [also build test ERROR on linus/master v5.11 next-20210218]
> [cannot apply to hnaz-linux-mm/master]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:    https://github.com/0day-ci/linux/commits/Alistair-Popple/Add-support-for-SVM-atomics-in-Nouveau/20210219-100858
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git next
> config: mips-randconfig-r036-20210218 (attached as .config)
> compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project 
c9439ca36342fb6013187d0a69aef92736951476)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/
make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install mips cross compiling tool for clang build
>         # apt-get install binutils-mips-linux-gnu
>         # https://github.com/0day-ci/linux/commit/
bb5444811772d30b2e3bbaa44baeb8a4b3f03cec
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Alistair-Popple/Add-support-for-
SVM-atomics-in-Nouveau/20210219-100858
>         git checkout bb5444811772d30b2e3bbaa44baeb8a4b3f03cec
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=mips
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All error/warnings (new ones prefixed by >>):
> 
> >> fs/proc/task_mmu.c:521:12: error: implicit declaration of function 
'is_device_exclusive_entry' [-Werror,-Wimplicit-function-declaration]
>                    else if (is_device_exclusive_entry(swpent))
>                             ^
>    fs/proc/task_mmu.c:521:12: note: did you mean 'is_device_private_entry'?
>    include/linux/swapops.h:176:20: note: 'is_device_private_entry' declared 
here
>    static inline bool is_device_private_entry(swp_entry_t entry)
>                       ^
> >> fs/proc/task_mmu.c:522:11: error: implicit declaration of function 
'device_exclusive_entry_to_page' [-Werror,-Wimplicit-function-declaration]
>                            page = device_exclusive_entry_to_page(swpent);
>                                   ^
>    fs/proc/task_mmu.c:522:11: note: did you mean 
'device_private_entry_to_page'?
>    include/linux/swapops.h:191:28: note: 'device_private_entry_to_page' 
declared here
>    static inline struct page *device_private_entry_to_page(swp_entry_t 
entry)
>                               ^
> >> fs/proc/task_mmu.c:522:9: warning: incompatible integer to pointer 
conversion assigning to 'struct page *' from 'int' [-Wint-conversion]
>                            page = device_exclusive_entry_to_page(swpent);
>                                 ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    fs/proc/task_mmu.c:1395:7: error: implicit declaration of function 
'is_device_exclusive_entry' [-Werror,-Wimplicit-function-declaration]
>                    if (is_device_exclusive_entry(entry))
>                        ^
>    fs/proc/task_mmu.c:1396:11: error: implicit declaration of function 
'device_exclusive_entry_to_page' [-Werror,-Wimplicit-function-declaration]
>                            page = device_exclusive_entry_to_page(entry);
>                                   ^
>    fs/proc/task_mmu.c:1396:9: warning: incompatible integer to pointer 
conversion assigning to 'struct page *' from 'int' [-Wint-conversion]
>                            page = device_exclusive_entry_to_page(entry);
>                                 ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    2 warnings and 4 errors generated.
> 
> 
> vim +/is_device_exclusive_entry +521 fs/proc/task_mmu.c
> 
>    490
>    491  static void smaps_pte_entry(pte_t *pte, unsigned long addr,
>    492                  struct mm_walk *walk)
>    493  {
>    494          struct mem_size_stats *mss = walk->private;
>    495          struct vm_area_struct *vma = walk->vma;
>    496          bool locked = !!(vma->vm_flags & VM_LOCKED);
>    497          struct page *page = NULL;
>    498
>    499          if (pte_present(*pte)) {
>    500                  page = vm_normal_page(vma, addr, *pte);
>    501          } else if (is_swap_pte(*pte)) {
>    502                  swp_entry_t swpent = pte_to_swp_entry(*pte);
>    503
>    504                  if (!non_swap_entry(swpent)) {
>    505                          int mapcount;
>    506
>    507                          mss->swap += PAGE_SIZE;
>    508                          mapcount = swp_swapcount(swpent);
>    509                          if (mapcount >= 2) {
>    510                                  u64 pss_delta = (u64)PAGE_SIZE << 
PSS_SHIFT;
>    511
>    512                                  do_div(pss_delta, mapcount);
>    513                                  mss->swap_pss += pss_delta;
>    514                          } else {
>    515                                  mss->swap_pss += (u64)PAGE_SIZE << 
PSS_SHIFT;
>    516                          }
>    517                  } else if (is_migration_entry(swpent))
>    518                          page = migration_entry_to_page(swpent);
>    519                  else if (is_device_private_entry(swpent))
>    520                          page = device_private_entry_to_page(swpent);
>  > 521                  else if (is_device_exclusive_entry(swpent))
>  > 522                          page = 
device_exclusive_entry_to_page(swpent);
>    523          } else if (unlikely(IS_ENABLED(CONFIG_SHMEM) && mss-
>check_shmem_swap
>    524                                                          && 
pte_none(*pte))) {
>    525                  page = xa_load(&vma->vm_file->f_mapping->i_pages,
>    526                                                  
linear_page_index(vma, addr));
>    527                  if (xa_is_value(page))
>    528                          mss->swap += PAGE_SIZE;
>    529                  return;
>    530          }
>    531
>    532          if (!page)
>    533                  return;
>    534
>    535          smaps_account(mss, page, false, pte_young(*pte), 
pte_dirty(*pte), locked);
>    536  }
>    537
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org




_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
