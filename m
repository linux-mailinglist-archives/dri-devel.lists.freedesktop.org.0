Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A13D2989DE
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 10:56:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4421B6E10C;
	Mon, 26 Oct 2020 09:56:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B11B6E9F8
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Oct 2020 09:56:39 +0000 (UTC)
IronPort-SDR: pfJtrSqmIbBdyn3sNYhaEnova/O6ztmaLuaZoIpmAiDeSzMPazSiSKUMQH8nQWcDJama/1GH0w
 towhohXxMCNw==
X-IronPort-AV: E=McAfee;i="6000,8403,9785"; a="229533531"
X-IronPort-AV: E=Sophos;i="5.77,417,1596524400"; 
 d="gz'50?scan'50,208,50";a="229533531"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2020 02:56:39 -0700
IronPort-SDR: u0dnBM98zI18bPyXmLNN3PVXXwDm/dDTy7H4zHvLbol2sgpSvRxrnhMAtWcn0bUIjqUTRCgSmw
 qV+O+86WiSDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,417,1596524400"; 
 d="gz'50?scan'50,208,50";a="349846583"
Received: from lkp-server01.sh.intel.com (HELO 394efc4116ff) ([10.239.97.150])
 by orsmga008.jf.intel.com with ESMTP; 26 Oct 2020 02:56:36 -0700
Received: from kbuild by 394efc4116ff with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kWzEy-00005R-C5; Mon, 26 Oct 2020 09:56:36 +0000
Date: Mon, 26 Oct 2020 17:56:04 +0800
From: kernel test robot <lkp@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Madhav.Chauhan@amd.com, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 05/13] drm/ttm: new TT backend allocation pool
Message-ID: <202010261733.63p5ExHs-lkp@intel.com>
References: <20201025154100.16400-6-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="J2SCkAp4GZ/dPZZf"
Content-Disposition: inline
In-Reply-To: <20201025154100.16400-6-christian.koenig@amd.com>
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
Cc: clang-built-linux@googlegroups.com, Ray.Huang@amd.com,
 kbuild-all@lists.01.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--J2SCkAp4GZ/dPZZf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi "Christian,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm-tip/drm-tip]
[cannot apply to drm-exynos/exynos-drm-next drm-intel/for-linux-next tegra-drm/drm/tegra/for-next linus/master drm/drm-next v5.10-rc1 next-20201026]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Christian-K-nig/drm-ttm-nuke-ttm_tt_set_-un-populated-again/20201026-004114
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
config: s390-randconfig-r036-20201026 (attached as .config)
compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project 1c8371692dfe8245bc6690ff1262dcced4649d21)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/0day-ci/linux/commit/618def1bc3db379a76b7462ab38236bfeb3df3d3
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Christian-K-nig/drm-ttm-nuke-ttm_tt_set_-un-populated-again/20201026-004114
        git checkout 618def1bc3db379a76b7462ab38236bfeb3df3d3
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:119:21: note: expanded from macro '__swab32'
           ___constant_swab32(x) :                 \
                              ^
   include/uapi/linux/swab.h:19:12: note: expanded from macro '___constant_swab32'
           (((__u32)(x) & (__u32)0x000000ffUL) << 24) |            \
                     ^
   In file included from drivers/gpu/drm/ttm/ttm_pool.c:34:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:72:
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
   In file included from drivers/gpu/drm/ttm/ttm_pool.c:34:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:72:
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
   In file included from drivers/gpu/drm/ttm/ttm_pool.c:34:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:72:
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
   In file included from drivers/gpu/drm/ttm/ttm_pool.c:34:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:72:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:34:59: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:120:12: note: expanded from macro '__swab32'
           __fswab32(x))
                     ^
   In file included from drivers/gpu/drm/ttm/ttm_pool.c:34:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:72:
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
>> drivers/gpu/drm/ttm/ttm_pool.c:154:5: warning: no previous prototype for function 'ttm_pool_apply_caching' [-Wmissing-prototypes]
   int ttm_pool_apply_caching(struct page **first, struct page **last,
       ^
   drivers/gpu/drm/ttm/ttm_pool.c:154:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int ttm_pool_apply_caching(struct page **first, struct page **last,
   ^
   static 
   21 warnings generated.

vim +/ttm_pool_apply_caching +154 drivers/gpu/drm/ttm/ttm_pool.c

   152	
   153	/* Apply a new caching to an array of pages */
 > 154	int ttm_pool_apply_caching(struct page **first, struct page **last,
   155				   enum ttm_caching caching)
   156	{
   157	#ifdef CONFIG_X86
   158		unsigned int num_pages = last - first;
   159	
   160		if (!num_pages)
   161			return 0;
   162	
   163		switch (caching) {
   164		case ttm_cached:
   165			break;
   166		case ttm_write_combined:
   167			return set_pages_array_wc(first, num_pages);
   168			break;
   169		case ttm_uncached:
   170			return set_pages_array_uc(first, num_pages);
   171			break;
   172		}
   173	#endif
   174		return 0;
   175	}
   176	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--J2SCkAp4GZ/dPZZf
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--J2SCkAp4GZ/dPZZf
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--J2SCkAp4GZ/dPZZf--
