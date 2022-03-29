Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E73B24EB4DD
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 22:51:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FB4610E1FB;
	Tue, 29 Mar 2022 20:51:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2517110E1FB;
 Tue, 29 Mar 2022 20:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648587089; x=1680123089;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=Pr5LK0LMYOaeYOzmmOcE3MxXJKaOpBhC1bdUtIu7pYM=;
 b=ZW4/wpnda06eD+4Hr34sDADB96GJ9EJtjElYuT0v2gSwI3jdqB/k2Bka
 Ln37GDLCYBP1cU5PZoCVbDatUZ1bDUZ67wcGSiG97q/NOVh2cLh+qSeoI
 bQZMcrZIlyyc/uwJT1/I/Jv3H2NRWb0eXVwUdSrOru40C4TIyz9KJsVyK
 TI4MkKonaFKTbNo0XALk8civ8g60Ux6KrQ+3gAufktvSHV9IF7qLPnl8f
 5ws+oVGfh5sTApVXepJ8bHFYYSD/g2X8rAqzq8A4Dm2vNOfu/0ECZZ6aq
 SRy0WPzyD4HeOuDpo/CoNeTCmR+JZFpNMDqj2nb4NlA6NZ/6SJtJ2X2wi w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="258197181"
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; d="scan'208";a="258197181"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2022 13:51:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; d="scan'208";a="519210507"
Received: from lkp-server01.sh.intel.com (HELO 3965e2759b93) ([10.239.97.150])
 by orsmga002.jf.intel.com with ESMTP; 29 Mar 2022 13:51:26 -0700
Received: from kbuild by 3965e2759b93 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nZIoH-0000ej-Oj; Tue, 29 Mar 2022 20:51:25 +0000
Date: Wed, 30 Mar 2022 04:50:29 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: [drm-tip:drm-tip 4/8]
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c:200:33: error: no member named
 'tbo' in 'struct ttm_range_mgr_node'
Message-ID: <202203300449.ngUe9zXn-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Cc: intel-gfx@lists.freedesktop.org, llvm@lists.linux.dev,
 kbuild-all@lists.01.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
head:   a8459e73b79b7c55405331f36fe8a48e1bad5c33
commit: 752f483905202334e91d2d5b87a3904df72aa147 [4/8] Merge remote-tracking branch 'drm-misc/drm-misc-next' into drm-tip
config: s390-randconfig-r006-20220327 (https://download.01.org/0day-ci/archive/20220330/202203300449.ngUe9zXn-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d9501cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        git remote add drm-tip git://anongit.freedesktop.org/drm/drm-tip
        git fetch --no-tags drm-tip drm-tip
        git checkout 752f483905202334e91d2d5b87a3904df72aa147
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/gpu/drm/amd/amdgpu/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c:25:
   In file included from include/drm/ttm/ttm_range_manager.h:6:
   In file included from include/drm/ttm/ttm_resource.h:31:
   In file included from include/linux/iosys-map.h:9:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:464:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:477:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                                                             ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                                                        ^
   In file included from drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c:25:
   In file included from include/drm/ttm/ttm_range_manager.h:6:
   In file included from include/drm/ttm/ttm_resource.h:31:
   In file included from include/linux/iosys-map.h:9:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
   #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
                                                        ^
   In file included from drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c:25:
   In file included from include/drm/ttm/ttm_range_manager.h:6:
   In file included from include/drm/ttm/ttm_resource.h:31:
   In file included from include/linux/iosys-map.h:9:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
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
>> drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c:200:33: error: no member named 'tbo' in 'struct ttm_range_mgr_node'
                   amdgpu_ttm_recover_gart(node->tbo);
                                           ~~~~  ^
   12 warnings and 1 error generated.


vim +200 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c

bb990bb09235a3 Christian König 2016-09-09  182  
a614b336f1c16d Christian König 2021-02-11  183  /**
a614b336f1c16d Christian König 2021-02-11  184   * amdgpu_gtt_mgr_recover - re-init gart
a614b336f1c16d Christian König 2021-02-11  185   *
1dd8b1b987fad9 Nirmoy Das      2022-01-07  186   * @mgr: amdgpu_gtt_mgr pointer
a614b336f1c16d Christian König 2021-02-11  187   *
a614b336f1c16d Christian König 2021-02-11  188   * Re-init the gart for each known BO in the GTT.
a614b336f1c16d Christian König 2021-02-11  189   */
1b08dfb889b2c5 Christian König 2022-01-18  190  void amdgpu_gtt_mgr_recover(struct amdgpu_gtt_mgr *mgr)
c1c7ce8f5687bb Christian König 2017-10-16  191  {
77ef271faee9c3 Christian König 2021-07-16  192  	struct ttm_range_mgr_node *node;
c1c7ce8f5687bb Christian König 2017-10-16  193  	struct drm_mm_node *mm_node;
1dd8b1b987fad9 Nirmoy Das      2022-01-07  194  	struct amdgpu_device *adev;
c1c7ce8f5687bb Christian König 2017-10-16  195  
19a1d9350be632 Nirmoy Das      2021-05-28  196  	adev = container_of(mgr, typeof(*adev), mman.gtt_mgr);
c1c7ce8f5687bb Christian König 2017-10-16  197  	spin_lock(&mgr->lock);
c1c7ce8f5687bb Christian König 2017-10-16  198  	drm_mm_for_each_node(mm_node, &mgr->mm) {
77ef271faee9c3 Christian König 2021-07-16  199  		node = container_of(mm_node, typeof(*node), mm_nodes[0]);
1b08dfb889b2c5 Christian König 2022-01-18 @200  		amdgpu_ttm_recover_gart(node->tbo);
c1c7ce8f5687bb Christian König 2017-10-16  201  	}
c1c7ce8f5687bb Christian König 2017-10-16  202  	spin_unlock(&mgr->lock);
c1c7ce8f5687bb Christian König 2017-10-16  203  
19a1d9350be632 Nirmoy Das      2021-05-28  204  	amdgpu_gart_invalidate_tlb(adev);
c1c7ce8f5687bb Christian König 2017-10-16  205  }
c1c7ce8f5687bb Christian König 2017-10-16  206  

:::::: The code at line 200 was first introduced by commit
:::::: 1b08dfb889b2c584b444538c9500af24ba0a6dc7 drm/amdgpu: remove gart.ready flag

:::::: TO: Christian König <christian.koenig@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
