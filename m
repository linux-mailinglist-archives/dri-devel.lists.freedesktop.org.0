Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0150032B44E
	for <lists+dri-devel@lfdr.de>; Wed,  3 Mar 2021 06:00:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FFD589948;
	Wed,  3 Mar 2021 05:00:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4FBB89948
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Mar 2021 05:00:47 +0000 (UTC)
IronPort-SDR: CVcXUrggG9loqSEBGjeio1n9PidupC+OvRHAp1b/cq6tH2G/mXu46gJQaupc2fLjWvuSjJcqrz
 HkWv9ohee3mA==
X-IronPort-AV: E=McAfee;i="6000,8403,9911"; a="174223823"
X-IronPort-AV: E=Sophos;i="5.81,219,1610438400"; 
 d="gz'50?scan'50,208,50";a="174223823"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 21:00:46 -0800
IronPort-SDR: +ZAnkNnDYpXEhCxSo6n7lW0YOV02WQNWzvlv0uPmZez9ghnhcgZDckBp0/EPKu138j5EaY6gFY
 maV1qKvzSD9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,219,1610438400"; 
 d="gz'50?scan'50,208,50";a="518135563"
Received: from lkp-server02.sh.intel.com (HELO 2482ff9f8ac0) ([10.239.97.151])
 by orsmga004.jf.intel.com with ESMTP; 02 Mar 2021 21:00:44 -0800
Received: from kbuild by 2482ff9f8ac0 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lHJcp-0000ub-C1; Wed, 03 Mar 2021 05:00:43 +0000
Date: Wed, 3 Mar 2021 12:59:43 +0800
From: kernel test robot <lkp@intel.com>
To: Oak Zeng <Oak.Zeng@amd.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/ttm: PLEASE ignore. Just test Intel build robot.
Message-ID: <202103031227.7Qw0y948-lkp@intel.com>
References: <1614733870-6751-1-git-send-email-Oak.Zeng@amd.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="XsQoSWH+UP9D9v3l"
Content-Disposition: inline
In-Reply-To: <1614733870-6751-1-git-send-email-Oak.Zeng@amd.com>
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
Cc: clang-built-linux@googlegroups.com, Oak Zeng <Oak.Zeng@amd.com>,
 kbuild-all@lists.01.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--XsQoSWH+UP9D9v3l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Oak,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on drm-intel/for-linux-next]
[also build test ERROR on drm-tip/drm-tip linus/master v5.12-rc1 next-20210303]
[cannot apply to tegra-drm/drm/tegra/for-next drm-exynos/exynos-drm-next drm/drm-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Oak-Zeng/drm-ttm-PLEASE-ignore-Just-test-Intel-build-robot/20210303-091234
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
config: s390-randconfig-r003-20210303 (attached as .config)
compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project a7cad6680b4087eff8994f1f99ac40c661a6621f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/0day-ci/linux/commit/00ccdcad822515e31482876e46504b6038e904aa
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Oak-Zeng/drm-ttm-PLEASE-ignore-Just-test-Intel-build-robot/20210303-091234
        git checkout 00ccdcad822515e31482876e46504b6038e904aa
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:119:21: note: expanded from macro '__swab32'
           ___constant_swab32(x) :                 \
                              ^
   include/uapi/linux/swab.h:19:12: note: expanded from macro '___constant_swab32'
           (((__u32)(x) & (__u32)0x000000ffUL) << 24) |            \
                     ^
   In file included from drivers/gpu/drm/ttm/ttm_bo_util.c:35:
   In file included from include/linux/dma-buf-map.h:9:
   In file included from include/linux/io.h:13:
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
   include/uapi/linux/swab.h:20:12: note: expanded from macro '___constant_swab32'
           (((__u32)(x) & (__u32)0x0000ff00UL) <<  8) |            \
                     ^
   In file included from drivers/gpu/drm/ttm/ttm_bo_util.c:35:
   In file included from include/linux/dma-buf-map.h:9:
   In file included from include/linux/io.h:13:
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
   In file included from drivers/gpu/drm/ttm/ttm_bo_util.c:35:
   In file included from include/linux/dma-buf-map.h:9:
   In file included from include/linux/io.h:13:
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
   In file included from drivers/gpu/drm/ttm/ttm_bo_util.c:35:
   In file included from include/linux/dma-buf-map.h:9:
   In file included from include/linux/io.h:13:
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
   In file included from drivers/gpu/drm/ttm/ttm_bo_util.c:35:
   In file included from include/linux/dma-buf-map.h:9:
   In file included from include/linux/io.h:13:
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
>> drivers/gpu/drm/ttm/ttm_bo_util.c:500:18: error: implicit declaration of function 'ioremap_cache' [-Werror,-Wimplicit-function-declaration]
                           vaddr_iomem = ioremap_cache(mem->bus.offset,
                                         ^
>> drivers/gpu/drm/ttm/ttm_bo_util.c:500:16: warning: incompatible integer to pointer conversion assigning to 'void *' from 'int' [-Wint-conversion]
                           vaddr_iomem = ioremap_cache(mem->bus.offset,
                                       ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   21 warnings and 1 error generated.


vim +/ioremap_cache +500 drivers/gpu/drm/ttm/ttm_bo_util.c

   481	
   482	int ttm_bo_vmap(struct ttm_buffer_object *bo, struct dma_buf_map *map)
   483	{
   484		struct ttm_resource *mem = &bo->mem;
   485		int ret;
   486	
   487		ret = ttm_mem_io_reserve(bo->bdev, mem);
   488		if (ret)
   489			return ret;
   490	
   491		if (mem->bus.is_iomem) {
   492			void __iomem *vaddr_iomem;
   493	
   494			if (mem->bus.addr)
   495				vaddr_iomem = (void __iomem *)mem->bus.addr;
   496			else if (mem->bus.caching == ttm_write_combined)
   497				vaddr_iomem = ioremap_wc(mem->bus.offset,
   498							 bo->base.size);
   499			else if (mem->bus.caching == ttm_cached)
 > 500				vaddr_iomem = ioremap_cache(mem->bus.offset,
   501							  bo->base.size);
   502			else
   503				vaddr_iomem = ioremap(mem->bus.offset, bo->base.size);
   504	
   505			if (!vaddr_iomem)
   506				return -ENOMEM;
   507	
   508			dma_buf_map_set_vaddr_iomem(map, vaddr_iomem);
   509	
   510		} else {
   511			struct ttm_operation_ctx ctx = {
   512				.interruptible = false,
   513				.no_wait_gpu = false
   514			};
   515			struct ttm_tt *ttm = bo->ttm;
   516			pgprot_t prot;
   517			void *vaddr;
   518	
   519			ret = ttm_tt_populate(bo->bdev, ttm, &ctx);
   520			if (ret)
   521				return ret;
   522	
   523			/*
   524			 * We need to use vmap to get the desired page protection
   525			 * or to make the buffer object look contiguous.
   526			 */
   527			prot = ttm_io_prot(bo, mem, PAGE_KERNEL);
   528			vaddr = vmap(ttm->pages, ttm->num_pages, 0, prot);
   529			if (!vaddr)
   530				return -ENOMEM;
   531	
   532			dma_buf_map_set_vaddr(map, vaddr);
   533		}
   534	
   535		return 0;
   536	}
   537	EXPORT_SYMBOL(ttm_bo_vmap);
   538	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--XsQoSWH+UP9D9v3l
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
QG/mPwEA

--XsQoSWH+UP9D9v3l
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--XsQoSWH+UP9D9v3l--
