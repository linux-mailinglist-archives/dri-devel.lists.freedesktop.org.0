Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF632C6BD6
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 20:11:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89B996EEB0;
	Fri, 27 Nov 2020 19:10:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B962D6EEB0
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 19:10:57 +0000 (UTC)
IronPort-SDR: aYlVpKhHtgiFRhZDc1sjAkOBqfX1npaS432uq0oaP6FjGZeG8BBDNcMSQWg2IudW5/S77pj4TE
 3+RakNDvdpIw==
X-IronPort-AV: E=McAfee;i="6000,8403,9818"; a="171644293"
X-IronPort-AV: E=Sophos;i="5.78,375,1599548400"; 
 d="gz'50?scan'50,208,50";a="171644293"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 11:10:56 -0800
IronPort-SDR: lv84ARpM1gxEUqLfF1C2WKsqjBIz6NtCwsx3QSRx3Bwpy+cHmsrblQXmw1XQ4kTJpnLt2Io0Gf
 MCYGpqk7Njyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,375,1599548400"; 
 d="gz'50?scan'50,208,50";a="344290222"
Received: from lkp-server01.sh.intel.com (HELO b5888d13d5a5) ([10.239.97.150])
 by orsmga002.jf.intel.com with ESMTP; 27 Nov 2020 11:10:52 -0800
Received: from kbuild by b5888d13d5a5 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kij8t-00008y-Kc; Fri, 27 Nov 2020 19:10:51 +0000
Date: Sat, 28 Nov 2020 03:10:40 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 17/17] mm: add mmu_notifier argument to follow_pfn
Message-ID: <202011280356.rPWHFNW4-lkp@intel.com>
References: <20201127164131.2244124-18-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="mYCpIKhGyMATD0i+"
Content-Disposition: inline
In-Reply-To: <20201127164131.2244124-18-daniel.vetter@ffwll.ch>
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
Cc: Jason Gunthorpe <jgg@ziepe.ca>, linux-samsung-soc@vger.kernel.org,
 kbuild-all@lists.01.org, kvm@vger.kernel.org, linux-mm@kvack.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Christoph Hellwig <hch@infradead.org>,
 clang-built-linux@googlegroups.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--mYCpIKhGyMATD0i+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Daniel,

I love your patch! Yet something to improve:

[auto build test ERROR on linuxtv-media/master]
[also build test ERROR on char-misc/char-misc-testing v5.10-rc5]
[cannot apply to hnaz-linux-mm/master next-20201127]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Daniel-Vetter/follow_pfn-and-other-iomap-races/20201128-004421
base:   git://linuxtv.org/media_tree.git master
config: s390-randconfig-r032-20201127 (attached as .config)
compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project f095ac11a9550530a4a54298debb8b04b36422be)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/0day-ci/linux/commit/d76a3489433ce67d45da86aa12953385427f0ac9
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Daniel-Vetter/follow_pfn-and-other-iomap-races/20201128-004421
        git checkout d76a3489433ce67d45da86aa12953385427f0ac9
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/s390/include/asm/kvm_para.h:25:
   In file included from arch/s390/include/asm/diag.h:12:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:31:
   In file included from include/linux/dma-mapping.h:10:
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
   In file included from arch/s390/kvm/../../../virt/kvm/kvm_main.c:18:
   In file included from include/linux/kvm_host.h:32:
   In file included from include/linux/kvm_para.h:5:
   In file included from include/uapi/linux/kvm_para.h:36:
   In file included from arch/s390/include/asm/kvm_para.h:25:
   In file included from arch/s390/include/asm/diag.h:12:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:31:
   In file included from include/linux/dma-mapping.h:10:
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
   In file included from arch/s390/kvm/../../../virt/kvm/kvm_main.c:18:
   In file included from include/linux/kvm_host.h:32:
   In file included from include/linux/kvm_para.h:5:
   In file included from include/uapi/linux/kvm_para.h:36:
   In file included from arch/s390/include/asm/kvm_para.h:25:
   In file included from arch/s390/include/asm/diag.h:12:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:31:
   In file included from include/linux/dma-mapping.h:10:
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
   In file included from arch/s390/kvm/../../../virt/kvm/kvm_main.c:18:
   In file included from include/linux/kvm_host.h:32:
   In file included from include/linux/kvm_para.h:5:
   In file included from include/uapi/linux/kvm_para.h:36:
   In file included from arch/s390/include/asm/kvm_para.h:25:
   In file included from arch/s390/include/asm/diag.h:12:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:31:
   In file included from include/linux/dma-mapping.h:10:
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
>> arch/s390/kvm/../../../virt/kvm/kvm_main.c:1894:40: error: no member named 'mmu_notifier' in 'struct kvm'
           r = follow_pfn(vma, addr, &pfn, &kvm->mmu_notifier);
                                            ~~~  ^
   arch/s390/kvm/../../../virt/kvm/kvm_main.c:1909:41: error: no member named 'mmu_notifier' in 'struct kvm'
                   r = follow_pfn(vma, addr, &pfn, &kvm->mmu_notifier);
                                                    ~~~  ^
   20 warnings and 2 errors generated.

vim +1894 arch/s390/kvm/../../../virt/kvm/kvm_main.c

  1885	
  1886	static int hva_to_pfn_remapped(struct kvm *kvm, struct vm_area_struct *vma,
  1887				       unsigned long addr, bool *async,
  1888				       bool write_fault, bool *writable,
  1889				       kvm_pfn_t *p_pfn)
  1890	{
  1891		unsigned long pfn;
  1892		int r;
  1893	
> 1894		r = follow_pfn(vma, addr, &pfn, &kvm->mmu_notifier);
  1895		if (r) {
  1896			/*
  1897			 * get_user_pages fails for VM_IO and VM_PFNMAP vmas and does
  1898			 * not call the fault handler, so do it here.
  1899			 */
  1900			bool unlocked = false;
  1901			r = fixup_user_fault(current->mm, addr,
  1902					     (write_fault ? FAULT_FLAG_WRITE : 0),
  1903					     &unlocked);
  1904			if (unlocked)
  1905				return -EAGAIN;
  1906			if (r)
  1907				return r;
  1908	
  1909			r = follow_pfn(vma, addr, &pfn, &kvm->mmu_notifier);
  1910			if (r)
  1911				return r;
  1912	
  1913		}
  1914	
  1915		if (writable)
  1916			*writable = true;
  1917	
  1918		/*
  1919		 * Get a reference here because callers of *hva_to_pfn* and
  1920		 * *gfn_to_pfn* ultimately call kvm_release_pfn_clean on the
  1921		 * returned pfn.  This is only needed if the VMA has VM_MIXEDMAP
  1922		 * set, but the kvm_get_pfn/kvm_release_pfn_clean pair will
  1923		 * simply do nothing for reserved pfns.
  1924		 *
  1925		 * Whoever called remap_pfn_range is also going to call e.g.
  1926		 * unmap_mapping_range before the underlying pages are freed,
  1927		 * causing a call to our MMU notifier.
  1928		 */ 
  1929		kvm_get_pfn(pfn);
  1930	
  1931		*p_pfn = pfn;
  1932		return 0;
  1933	}
  1934	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--mYCpIKhGyMATD0i+
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
egvkuP8AiGG8uRMxAQA=

--mYCpIKhGyMATD0i+
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--mYCpIKhGyMATD0i+--
