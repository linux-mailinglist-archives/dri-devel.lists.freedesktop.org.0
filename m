Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE31F33336F
	for <lists+dri-devel@lfdr.de>; Wed, 10 Mar 2021 04:00:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A941A6E9AD;
	Wed, 10 Mar 2021 03:00:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 360626E9AD;
 Wed, 10 Mar 2021 03:00:05 +0000 (UTC)
IronPort-SDR: 4+K/2iykkW/NfOW25hn9nm1tNZxadvXWi8mM4BW2c4LdBJ6KHYgXcMl89Xrw5LfL1Ns5vk2jzS
 oJkLTzQk6eog==
X-IronPort-AV: E=McAfee;i="6000,8403,9917"; a="167644511"
X-IronPort-AV: E=Sophos;i="5.81,236,1610438400"; 
 d="gz'50?scan'50,208,50";a="167644511"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2021 19:00:04 -0800
IronPort-SDR: k25VscePTIcfTRVConsaOAwJ04UZT7Vbm5fUOiz7cyuE2FbozwsVwywWPaoZVuCLJOAXlwKlfY
 6aj9ylHRpqig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,236,1610438400"; 
 d="gz'50?scan'50,208,50";a="588664746"
Received: from lkp-server01.sh.intel.com (HELO 3e992a48ca98) ([10.239.97.150])
 by orsmga005.jf.intel.com with ESMTP; 09 Mar 2021 19:00:00 -0800
Received: from kbuild by 3e992a48ca98 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lJp4p-0001yK-FV; Wed, 10 Mar 2021 02:59:59 +0000
Date: Wed, 10 Mar 2021 10:59:12 +0800
From: kernel test robot <lkp@intel.com>
To: Alistair Popple <apopple@nvidia.com>, linux-mm@kvack.org,
 nouveau@lists.freedesktop.org, bskeggs@redhat.com,
 akpm@linux-foundation.org
Subject: Re: [PATCH v5 1/8] mm: Remove special swap entry functions
Message-ID: <202103101013.fBso26u8-lkp@intel.com>
References: <20210309121505.23608-2-apopple@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="uAKRQypu60I7Lcqm"
Content-Disposition: inline
In-Reply-To: <20210309121505.23608-2-apopple@nvidia.com>
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
 dri-devel@lists.freedesktop.org, clang-built-linux@googlegroups.com,
 kvm-ppc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--uAKRQypu60I7Lcqm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alistair,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on s390/features]
[also build test ERROR on kselftest/next linus/master v5.12-rc2 next-20210309]
[cannot apply to hnaz-linux-mm/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Alistair-Popple/Add-support-for-SVM-atomics-in-Nouveau/20210310-064003
base:   https://git.kernel.org/pub/scm/linux/kernel/git/s390/linux.git features
config: s390-randconfig-r021-20210308 (attached as .config)
compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project cd9a69289c7825d54450cb6829fef2c8e0f1963a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/0day-ci/linux/commit/d262b019576bfc423b79d789df09702fde6f1abc
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Alistair-Popple/Add-support-for-SVM-atomics-in-Nouveau/20210310-064003
        git checkout d262b019576bfc423b79d789df09702fde6f1abc
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:119:21: note: expanded from macro '__swab32'
           ___constant_swab32(x) :                 \
                              ^
   include/uapi/linux/swab.h:20:12: note: expanded from macro '___constant_swab32'
           (((__u32)(x) & (__u32)0x0000ff00UL) <<  8) |            \
                     ^
   In file included from arch/s390/mm/pgtable.c:12:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:22:
   In file included from include/linux/writeback.h:14:
   In file included from include/linux/blk-cgroup.h:23:
   In file included from include/linux/blkdev.h:26:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:80:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:34:59: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:119:21: note: expanded from macro '__swab32'
           ___constant_swab32(x) :                 \
                              ^
   include/uapi/linux/swab.h:21:12: note: expanded from macro '___constant_swab32'
           (((__u32)(x) & (__u32)0x00ff0000UL) >>  8) |            \
                     ^
   In file included from arch/s390/mm/pgtable.c:12:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:22:
   In file included from include/linux/writeback.h:14:
   In file included from include/linux/blk-cgroup.h:23:
   In file included from include/linux/blkdev.h:26:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:80:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:34:59: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:119:21: note: expanded from macro '__swab32'
           ___constant_swab32(x) :                 \
                              ^
   include/uapi/linux/swab.h:22:12: note: expanded from macro '___constant_swab32'
           (((__u32)(x) & (__u32)0xff000000UL) >> 24)))
                     ^
   In file included from arch/s390/mm/pgtable.c:12:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:22:
   In file included from include/linux/writeback.h:14:
   In file included from include/linux/blk-cgroup.h:23:
   In file included from include/linux/blkdev.h:26:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:80:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:34:59: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:120:12: note: expanded from macro '__swab32'
           __fswab32(x))
                     ^
   In file included from arch/s390/mm/pgtable.c:12:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:22:
   In file included from include/linux/writeback.h:14:
   In file included from include/linux/blk-cgroup.h:23:
   In file included from include/linux/blkdev.h:26:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:80:
   include/asm-generic/io.h:501:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:511:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:521:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:609:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:617:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:625:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:634:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:643:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:652:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
>> arch/s390/mm/pgtable.c:694:52: error: extraneous ')' before ';'
                   struct page *page = pfn_swap_entry_to_page(entry));
                                                                    ^
   20 warnings and 1 error generated.


vim +694 arch/s390/mm/pgtable.c

   688	
   689	static void ptep_zap_swap_entry(struct mm_struct *mm, swp_entry_t entry)
   690	{
   691		if (!non_swap_entry(entry))
   692			dec_mm_counter(mm, MM_SWAPENTS);
   693		else if (is_migration_entry(entry)) {
 > 694			struct page *page = pfn_swap_entry_to_page(entry));
   695	
   696			dec_mm_counter(mm, mm_counter(page));
   697		}
   698		free_swap_and_cache(entry);
   699	}
   700	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--uAKRQypu60I7Lcqm
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--uAKRQypu60I7Lcqm
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--uAKRQypu60I7Lcqm--
