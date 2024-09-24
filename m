Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B43983AAE
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 03:10:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28ED310E273;
	Tue, 24 Sep 2024 01:09:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R7je+SYA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5767210E273
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 01:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727140197; x=1758676197;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=moV2zLeHFU9ICjjabYswCIKJ83Q3EhyizzysDPkZHb4=;
 b=R7je+SYAnxX8rWo8eMsehNsgj/pbeGswG/EJuv1l8t2/nTNNumGHVBIp
 EOLP0+i+MSECeGuI90RvUQRihEKSY1ap8fqhlDwh9hUi3M5C6jmoZgDba
 lcMrKtta0TfGCw8Qg3Uq/uZVeP6SOavg03kcTEGsmw9xcu+/xAP4f1t1Z
 jaOiIyB2c6sNyGhDP31BCt3pHxlBvenldugfXkE/WYNvAAeY10Hmb0dOJ
 n7fCx3tExve8WH4fD39/Efd8OehXGTq/U5LRhYUnNj4jPFnGlFA+A+EkE
 gen325wrMc9DAHG1mABY4OVFpZ6LO2uU1doE+sVnjDvSeC/2VG0z4aEjh A==;
X-CSE-ConnectionGUID: PRQDYeB1SHuWyttn8OrqxQ==
X-CSE-MsgGUID: nQ77nmaZQfmpbmb4y+HGag==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="37479262"
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; d="scan'208";a="37479262"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 18:09:56 -0700
X-CSE-ConnectionGUID: zxpuOZbGTD+sVOcZfs4p5A==
X-CSE-MsgGUID: 0LmOncA4T92wi79gKfhj1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; d="scan'208";a="71292986"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
 by orviesa009.jf.intel.com with ESMTP; 23 Sep 2024 18:09:52 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1ssu3p-000HlT-2m;
 Tue, 24 Sep 2024 01:09:49 +0000
Date: Tue, 24 Sep 2024 09:09:08 +0800
From: kernel test robot <lkp@intel.com>
To: Liankun Yang <liankun.yang@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 jitao.shi@mediatek.com, mac.shen@mediatek.com, peng.liu@mediatek.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 1/1] drm/mediatek: dp: Add sdp path reset
Message-ID: <202409240818.3cqdkw5o-lkp@intel.com>
References: <20240923133610.23728-1-liankun.yang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240923133610.23728-1-liankun.yang@mediatek.com>
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

Hi Liankun,

kernel test robot noticed the following build errors:

[auto build test ERROR on pza/reset/next]
[also build test ERROR on linus/master v6.11 next-20240923]
[cannot apply to pza/imx-drm/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Liankun-Yang/drm-mediatek-dp-Add-sdp-path-reset/20240923-213747
base:   https://git.pengutronix.de/git/pza/linux reset/next
patch link:    https://lore.kernel.org/r/20240923133610.23728-1-liankun.yang%40mediatek.com
patch subject: [PATCH v1 1/1] drm/mediatek: dp: Add sdp path reset
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240924/202409240818.3cqdkw5o-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 8663a75fa2f31299ab8d1d90288d9df92aadee88)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240924/202409240818.3cqdkw5o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409240818.3cqdkw5o-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/mediatek/mtk_dp.c:9:
   In file included from include/drm/display/drm_dp_helper.h:27:
   In file included from include/linux/i2c.h:13:
   In file included from include/linux/acpi.h:39:
   In file included from include/acpi/acpi_io.h:7:
   In file included from arch/arm64/include/asm/acpi.h:14:
   In file included from include/linux/memblock.h:12:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:503:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     503 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     504 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:510:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     510 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     511 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:517:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     517 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:523:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     523 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     524 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/mediatek/mtk_dp.c:1058:5: error: use of undeclared identifier 'SDP_RESET_SW_DP_ENC0_P0'
    1058 |                                 SDP_RESET_SW_DP_ENC0_P0,
         |                                 ^
   drivers/gpu/drm/mediatek/mtk_dp.c:1059:5: error: use of undeclared identifier 'SDP_RESET_SW_DP_ENC0_P0'
    1059 |                                 SDP_RESET_SW_DP_ENC0_P0);
         |                                 ^
   drivers/gpu/drm/mediatek/mtk_dp.c:1064:8: error: use of undeclared identifier 'SDP_RESET_SW_DP_ENC0_P0'
    1064 |                                 0, SDP_RESET_SW_DP_ENC0_P0);
         |                                    ^
   4 warnings and 3 errors generated.


vim +/SDP_RESET_SW_DP_ENC0_P0 +1058 drivers/gpu/drm/mediatek/mtk_dp.c

  1054	
  1055	static void mtk_dp_sdp_path_reset(struct mtk_dp *mtk_dp)
  1056	{
  1057		mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3004,
> 1058					SDP_RESET_SW_DP_ENC0_P0,
  1059					SDP_RESET_SW_DP_ENC0_P0);
  1060	
  1061		/* Wait for sdp path reset to complete */
  1062		usleep_range(1000, 5000);
  1063		mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3004,
  1064					0, SDP_RESET_SW_DP_ENC0_P0);
  1065	}
  1066	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
