Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E296139D97F
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 12:21:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AB756E342;
	Mon,  7 Jun 2021 10:21:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ADAD6E342
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jun 2021 10:21:12 +0000 (UTC)
IronPort-SDR: 5t7J8zIMm2ORhLTVi8fvlRHOuiSl1uGGGZeLFT4r0ZlS1As9WW142Sit8QXGXLwxlmCV6ImKc9
 HRdykVLVNyiA==
X-IronPort-AV: E=McAfee;i="6200,9189,10007"; a="201575225"
X-IronPort-AV: E=Sophos;i="5.83,254,1616482800"; 
 d="gz'50?scan'50,208,50";a="201575225"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 03:21:12 -0700
IronPort-SDR: tb8+P4K2YgcDMoFc/3cOWwxju9BETmxfL++by80UjyRGD5npyRvhapzRf/8h5Cw3B5x5xc6Q+w
 mVtESXCTkD6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,254,1616482800"; 
 d="gz'50?scan'50,208,50";a="447439529"
Received: from lkp-server02.sh.intel.com (HELO 1ec8406c5392) ([10.239.97.151])
 by orsmga008.jf.intel.com with ESMTP; 07 Jun 2021 03:21:10 -0700
Received: from kbuild by 1ec8406c5392 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lqCNZ-0008IB-FF; Mon, 07 Jun 2021 10:21:09 +0000
Date: Mon, 7 Jun 2021 18:20:58 +0800
From: kernel test robot <lkp@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] RDMA/umem: fix missing automated rename
Message-ID: <202106071834.7vO9Y8MY-lkp@intel.com>
References: <20210607070658.11586-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="PNTmBPCT7hxwcZjr"
Content-Disposition: inline
In-Reply-To: <20210607070658.11586-1-christian.koenig@amd.com>
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
Cc: clang-built-linux@googlegroups.com, kbuild-all@lists.01.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--PNTmBPCT7hxwcZjr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi "Christian,

I love your patch! Yet something to improve:

[auto build test ERROR on rdma/for-next]
[also build test ERROR on tegra-drm/drm/tegra/for-next v5.13-rc5 next-20210604]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Christian-K-nig/RDMA-umem-fix-missing-automated-rename/20210607-150846
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git for-next
config: powerpc-randconfig-r035-20210607 (attached as .config)
compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project ae973380c5f6be77ce395022be40350942260be9)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://github.com/0day-ci/linux/commit/6a174683a13a824a00a001d656d1a1c2fb469ab8
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Christian-K-nig/RDMA-umem-fix-missing-automated-rename/20210607-150846
        git checkout 6a174683a13a824a00a001d656d1a1c2fb469ab8
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=powerpc 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from include/linux/dma-buf-map.h:9:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:619:
   arch/powerpc/include/asm/io-defs.h:43:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(insb, (unsigned long p, void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:175:1: note: expanded from here
   __do_insb
   ^
   arch/powerpc/include/asm/io.h:556:56: note: expanded from macro '__do_insb'
   #define __do_insb(p, b, n)      readsb((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/infiniband/core/umem_dmabuf.c:6:
   In file included from include/linux/dma-buf.h:16:
   In file included from include/linux/dma-buf-map.h:9:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:619:
   arch/powerpc/include/asm/io-defs.h:45:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(insw, (unsigned long p, void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:179:1: note: expanded from here
   __do_insw
   ^
   arch/powerpc/include/asm/io.h:557:56: note: expanded from macro '__do_insw'
   #define __do_insw(p, b, n)      readsw((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/infiniband/core/umem_dmabuf.c:6:
   In file included from include/linux/dma-buf.h:16:
   In file included from include/linux/dma-buf-map.h:9:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:619:
   arch/powerpc/include/asm/io-defs.h:47:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(insl, (unsigned long p, void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:183:1: note: expanded from here
   __do_insl
   ^
   arch/powerpc/include/asm/io.h:558:56: note: expanded from macro '__do_insl'
   #define __do_insl(p, b, n)      readsl((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/infiniband/core/umem_dmabuf.c:6:
   In file included from include/linux/dma-buf.h:16:
   In file included from include/linux/dma-buf-map.h:9:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:619:
   arch/powerpc/include/asm/io-defs.h:49:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsb, (unsigned long p, const void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:187:1: note: expanded from here
   __do_outsb
   ^
   arch/powerpc/include/asm/io.h:559:58: note: expanded from macro '__do_outsb'
   #define __do_outsb(p, b, n)     writesb((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
                                           ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/infiniband/core/umem_dmabuf.c:6:
   In file included from include/linux/dma-buf.h:16:
   In file included from include/linux/dma-buf-map.h:9:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:619:
   arch/powerpc/include/asm/io-defs.h:51:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsw, (unsigned long p, const void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:191:1: note: expanded from here
   __do_outsw
   ^
   arch/powerpc/include/asm/io.h:560:58: note: expanded from macro '__do_outsw'
   #define __do_outsw(p, b, n)     writesw((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
                                           ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/infiniband/core/umem_dmabuf.c:6:
   In file included from include/linux/dma-buf.h:16:
   In file included from include/linux/dma-buf-map.h:9:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:619:
   arch/powerpc/include/asm/io-defs.h:53:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsl, (unsigned long p, const void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:195:1: note: expanded from here
   __do_outsl
   ^
   arch/powerpc/include/asm/io.h:561:58: note: expanded from macro '__do_outsl'
   #define __do_outsl(p, b, n)     writesl((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
                                           ~~~~~~~~~~~~~~~~~~~~~^
>> drivers/infiniband/core/umem_dmabuf.c:69:10: error: implicit declaration of function 'dma_resv_excl_fence' [-Werror,-Wimplicit-function-declaration]
           fence = dma_resv_excl_fence(umem_dmabuf->attach->dmabuf->resv);
                   ^
   drivers/infiniband/core/umem_dmabuf.c:69:10: note: did you mean 'dma_resv_add_excl_fence'?
   include/linux/dma-resv.h:279:6: note: 'dma_resv_add_excl_fence' declared here
   void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence);
        ^
   drivers/infiniband/core/umem_dmabuf.c:69:8: warning: incompatible integer to pointer conversion assigning to 'struct dma_fence *' from 'int' [-Wint-conversion]
           fence = dma_resv_excl_fence(umem_dmabuf->attach->dmabuf->resv);
                 ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   14 warnings and 1 error generated.


vim +/dma_resv_excl_fence +69 drivers/infiniband/core/umem_dmabuf.c

    11	
    12	int ib_umem_dmabuf_map_pages(struct ib_umem_dmabuf *umem_dmabuf)
    13	{
    14		struct sg_table *sgt;
    15		struct scatterlist *sg;
    16		struct dma_fence *fence;
    17		unsigned long start, end, cur = 0;
    18		unsigned int nmap = 0;
    19		int i;
    20	
    21		dma_resv_assert_held(umem_dmabuf->attach->dmabuf->resv);
    22	
    23		if (umem_dmabuf->sgt)
    24			goto wait_fence;
    25	
    26		sgt = dma_buf_map_attachment(umem_dmabuf->attach, DMA_BIDIRECTIONAL);
    27		if (IS_ERR(sgt))
    28			return PTR_ERR(sgt);
    29	
    30		/* modify the sg list in-place to match umem address and length */
    31	
    32		start = ALIGN_DOWN(umem_dmabuf->umem.address, PAGE_SIZE);
    33		end = ALIGN(umem_dmabuf->umem.address + umem_dmabuf->umem.length,
    34			    PAGE_SIZE);
    35		for_each_sgtable_dma_sg(sgt, sg, i) {
    36			if (start < cur + sg_dma_len(sg) && cur < end)
    37				nmap++;
    38			if (cur <= start && start < cur + sg_dma_len(sg)) {
    39				unsigned long offset = start - cur;
    40	
    41				umem_dmabuf->first_sg = sg;
    42				umem_dmabuf->first_sg_offset = offset;
    43				sg_dma_address(sg) += offset;
    44				sg_dma_len(sg) -= offset;
    45				cur += offset;
    46			}
    47			if (cur < end && end <= cur + sg_dma_len(sg)) {
    48				unsigned long trim = cur + sg_dma_len(sg) - end;
    49	
    50				umem_dmabuf->last_sg = sg;
    51				umem_dmabuf->last_sg_trim = trim;
    52				sg_dma_len(sg) -= trim;
    53				break;
    54			}
    55			cur += sg_dma_len(sg);
    56		}
    57	
    58		umem_dmabuf->umem.sg_head.sgl = umem_dmabuf->first_sg;
    59		umem_dmabuf->umem.sg_head.nents = nmap;
    60		umem_dmabuf->umem.nmap = nmap;
    61		umem_dmabuf->sgt = sgt;
    62	
    63	wait_fence:
    64		/*
    65		 * Although the sg list is valid now, the content of the pages
    66		 * may be not up-to-date. Wait for the exporter to finish
    67		 * the migration.
    68		 */
  > 69		fence = dma_resv_excl_fence(umem_dmabuf->attach->dmabuf->resv);
    70		if (fence)
    71			return dma_fence_wait(fence, false);
    72	
    73		return 0;
    74	}
    75	EXPORT_SYMBOL(ib_umem_dmabuf_map_pages);
    76	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--PNTmBPCT7hxwcZjr
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
D10BAA==

--PNTmBPCT7hxwcZjr--
