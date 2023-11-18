Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 710997F03A5
	for <lists+dri-devel@lfdr.de>; Sun, 19 Nov 2023 00:41:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3A5B10E069;
	Sat, 18 Nov 2023 23:41:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BE4610E069;
 Sat, 18 Nov 2023 23:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700350891; x=1731886891;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=7GaA30VVy3TnzrQ3lsYbX9fMaj5n7eqRdnGe9El6YD4=;
 b=bpnrEy44dPQugrQGtUvmYCTwyH24mEE/lOue1cw8X/ni1XYotFoO0vAu
 vYLbsvznRhniaHvSbcjOWeeOcDy615qZEJZEQOVOY57CmQGN9lAVRK/4Y
 tbtc151FgaXMwARTqjB3OB+okuCIglFSNf3qIw2rX4Mo7EsHipwFyQTkq
 Nw9TtP8o7RP7FV0woZn22q2zJuAm5ljxXNIQxt4UK6iJosajQnLwMW102
 /xLgRsq9qCwsrL5iSVCYvfogrBn3QzJZMCN0ktlAnNjN5/pgTXXt/2zbz
 AdUmVRs8413aSDFUrP+ckhvuneolPLhGXg374HWAslbPoxB8jxt8pc2vu w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10898"; a="13012546"
X-IronPort-AV: E=Sophos;i="6.04,209,1695711600"; d="scan'208";a="13012546"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2023 15:41:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10898"; a="939464390"
X-IronPort-AV: E=Sophos;i="6.04,209,1695711600"; d="scan'208";a="939464390"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
 by orsmga005.jf.intel.com with ESMTP; 18 Nov 2023 15:41:27 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1r4UwH-0004RT-28;
 Sat, 18 Nov 2023 23:41:25 +0000
Date: Sun, 19 Nov 2023 07:41:13 +0800
From: kernel test robot <lkp@intel.com>
To: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH v2 03/11] drm/dp_mst: Add kunit tests for
 drm_dp_get_vc_payload_bw()
Message-ID: <202311190743.K2U2VXVT-lkp@intel.com>
References: <20231116131841.1588781-4-imre.deak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231116131841.1588781-4-imre.deak@intel.com>
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
Cc: llvm@lists.linux.dev, dri-devel@lists.freedesktop.org,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Imre,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Imre-Deak/drm-dp_mst-Store-the-MST-PBN-divider-value-in-fixed-point-format/20231116-212936
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20231116131841.1588781-4-imre.deak%40intel.com
patch subject: [Intel-gfx] [PATCH v2 03/11] drm/dp_mst: Add kunit tests for drm_dp_get_vc_payload_bw()
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20231119/202311190743.K2U2VXVT-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231119/202311190743.K2U2VXVT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311190743.K2U2VXVT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/tests/drm_dp_mst_helper_test.c:10:
   In file included from include/drm/display/drm_dp_mst_helper.h:26:
   In file included from include/drm/display/drm_dp_helper.h:27:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/gpu/drm/tests/drm_dp_mst_helper_test.c:10:
   In file included from include/drm/display/drm_dp_mst_helper.h:26:
   In file included from include/drm/display/drm_dp_helper.h:27:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/gpu/drm/tests/drm_dp_mst_helper_test.c:10:
   In file included from include/drm/display/drm_dp_mst_helper.h:26:
   In file included from include/drm/display/drm_dp_helper.h:27:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> drivers/gpu/drm/tests/drm_dp_mst_helper_test.c:197:13: warning: stack frame size (1664) exceeds limit (1024) in 'drm_test_dp_mst_calc_pbn_div' [-Wframe-larger-than]
     197 | static void drm_test_dp_mst_calc_pbn_div(struct kunit *test)
         |             ^
   7 warnings generated.


vim +/drm_test_dp_mst_calc_pbn_div +197 drivers/gpu/drm/tests/drm_dp_mst_helper_test.c

   196	
 > 197	static void drm_test_dp_mst_calc_pbn_div(struct kunit *test)
   198	{
   199		const struct drm_dp_mst_calc_pbn_div_test *params = test->param_value;
   200		/* mgr->dev is only needed by drm_dbg_kms(), but it's not called for the test cases. */
   201		struct drm_dp_mst_topology_mgr mgr = {};
   202	
   203		KUNIT_EXPECT_EQ(test, drm_dp_get_vc_payload_bw(&mgr, params->link_rate, params->lane_count).full,
   204				params->expected.full);
   205	}
   206	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
