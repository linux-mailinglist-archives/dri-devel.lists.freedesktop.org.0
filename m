Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A52E9986F89
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 11:05:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 604AA10EB1D;
	Thu, 26 Sep 2024 09:05:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VIqM1Aym";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05D4310EB1D
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 09:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727341506; x=1758877506;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=b6+jCnC/FvdrNVDaDF8tNm/ESaNNunVryxNFP3hGpHE=;
 b=VIqM1AymkDT1hMDm6lTrBVxjb+OQKxTHRXNCFkyQBWFLowakQRzDYMKb
 uG0BMnSc8Pvl+ppP6F2Bk6ODDI7sq4DczEBPWuBW/Z3dfOOtJJ5iT3G+r
 Amef39UnzdbAqyU9lj+Bfo1ojYkX+8KrcAIcd++vGYGgDPt3mxq1HEaUk
 Y3X0GSuQIQvngopxjCrRvVjajC/iZsdDxNqCJpcNwYyRFZQoZQ+lD0y5y
 TljVNm+0UTB1TEiQbTG4Mi5DbsI1HuwPpdgpnLFD4daCf0tTQf6yorJXd
 y32hGhBEhTvi23ey1EgxeJU0/ZLtlpx3u91ZjTIqCWrMPF8es/8kFsTQ/ g==;
X-CSE-ConnectionGUID: xNqyvq/WS2miV8PJzptE/w==
X-CSE-MsgGUID: gubeQgdkSw2sSRQg3oppGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="26291591"
X-IronPort-AV: E=Sophos;i="6.10,259,1719903600"; d="scan'208";a="26291591"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 02:04:09 -0700
X-CSE-ConnectionGUID: t6xjhyVyQwGjSswn/cVXqQ==
X-CSE-MsgGUID: HeO2LAgeQzupJqZuXX6N8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,260,1719903600"; d="scan'208";a="72877919"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
 by orviesa008.jf.intel.com with ESMTP; 26 Sep 2024 02:04:05 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1stkPr-000KUr-09;
 Thu, 26 Sep 2024 09:04:03 +0000
Date: Thu, 26 Sep 2024 17:03:37 +0800
From: kernel test robot <lkp@intel.com>
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Shawn Sung <shawn.sung@mediatek.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v5 2/2] drm/mediatek: Add blend_modes to mtk_plane_init()
 for different SoCs
Message-ID: <202409261653.FyqBL1w8-lkp@intel.com>
References: <20240925101927.17042-3-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240925101927.17042-3-jason-jh.lin@mediatek.com>
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

Hi Jason-JH.Lin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on linus/master next-20240926]
[cannot apply to v6.11]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jason-JH-Lin/drm-mediatek-ovl-Add-fmt_convert-function-pointer-to-driver-data/20240925-182056
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20240925101927.17042-3-jason-jh.lin%40mediatek.com
patch subject: [PATCH v5 2/2] drm/mediatek: Add blend_modes to mtk_plane_init() for different SoCs
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240926/202409261653.FyqBL1w8-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 7773243d9916f98ba0ffce0c3a960e4aa9f03e81)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240926/202409261653.FyqBL1w8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409261653.FyqBL1w8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/mediatek/mtk_crtc.c:7:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2232:
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
   In file included from drivers/gpu/drm/mediatek/mtk_crtc.c:22:
   In file included from drivers/gpu/drm/mediatek/mtk_crtc.h:10:
>> drivers/gpu/drm/mediatek/mtk_ddp_comp.h:83:2: warning: 'const' type qualifier on return type has no effect [-Wignored-qualifiers]
      83 |         const u32 (*get_blend_modes)(struct device *dev);
         |         ^~~~~
   drivers/gpu/drm/mediatek/mtk_ddp_comp.h:271:1: warning: 'const' type qualifier on return type has no effect [-Wignored-qualifiers]
     271 | const u32 mtk_ddp_comp_get_blend_modes(struct mtk_ddp_comp *comp)
         | ^~~~~
   6 warnings generated.
--
   In file included from drivers/gpu/drm/mediatek/mtk_ddp_comp.c:17:
   In file included from drivers/gpu/drm/mediatek/mtk_crtc.h:9:
   In file included from include/drm/drm_crtc.h:32:
   In file included from include/drm/drm_modes.h:33:
   In file included from include/drm/drm_connector.h:32:
   In file included from include/drm/drm_util.h:36:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2232:
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
   In file included from drivers/gpu/drm/mediatek/mtk_ddp_comp.c:17:
   In file included from drivers/gpu/drm/mediatek/mtk_crtc.h:10:
>> drivers/gpu/drm/mediatek/mtk_ddp_comp.h:83:2: warning: 'const' type qualifier on return type has no effect [-Wignored-qualifiers]
      83 |         const u32 (*get_blend_modes)(struct device *dev);
         |         ^~~~~
   drivers/gpu/drm/mediatek/mtk_ddp_comp.h:271:1: warning: 'const' type qualifier on return type has no effect [-Wignored-qualifiers]
     271 | const u32 mtk_ddp_comp_get_blend_modes(struct mtk_ddp_comp *comp)
         | ^~~~~
   In file included from drivers/gpu/drm/mediatek/mtk_ddp_comp.c:19:
>> drivers/gpu/drm/mediatek/mtk_disp_drv.h:106:1: warning: 'const' type qualifier on return type has no effect [-Wignored-qualifiers]
     106 | const u32 mtk_ovl_get_blend_modes(struct device *dev);
         | ^~~~~
   drivers/gpu/drm/mediatek/mtk_disp_drv.h:135:1: warning: 'const' type qualifier on return type has no effect [-Wignored-qualifiers]
     135 | const u32 mtk_ovl_adaptor_get_blend_modes(struct device *dev);
         | ^~~~~
   drivers/gpu/drm/mediatek/mtk_disp_drv.h:170:1: warning: 'const' type qualifier on return type has no effect [-Wignored-qualifiers]
     170 | const u32 mtk_mdp_rdma_get_blend_modes(struct device *dev);
         | ^~~~~
   9 warnings generated.
--
   In file included from drivers/gpu/drm/mediatek/mtk_disp_ovl.c:18:
   In file included from drivers/gpu/drm/mediatek/mtk_crtc.h:9:
   In file included from include/drm/drm_crtc.h:32:
   In file included from include/drm/drm_modes.h:33:
   In file included from include/drm/drm_connector.h:32:
   In file included from include/drm/drm_util.h:36:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2232:
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
   In file included from drivers/gpu/drm/mediatek/mtk_disp_ovl.c:18:
   In file included from drivers/gpu/drm/mediatek/mtk_crtc.h:10:
>> drivers/gpu/drm/mediatek/mtk_ddp_comp.h:83:2: warning: 'const' type qualifier on return type has no effect [-Wignored-qualifiers]
      83 |         const u32 (*get_blend_modes)(struct device *dev);
         |         ^~~~~
   drivers/gpu/drm/mediatek/mtk_ddp_comp.h:271:1: warning: 'const' type qualifier on return type has no effect [-Wignored-qualifiers]
     271 | const u32 mtk_ddp_comp_get_blend_modes(struct mtk_ddp_comp *comp)
         | ^~~~~
   In file included from drivers/gpu/drm/mediatek/mtk_disp_ovl.c:20:
>> drivers/gpu/drm/mediatek/mtk_disp_drv.h:106:1: warning: 'const' type qualifier on return type has no effect [-Wignored-qualifiers]
     106 | const u32 mtk_ovl_get_blend_modes(struct device *dev);
         | ^~~~~
   drivers/gpu/drm/mediatek/mtk_disp_drv.h:135:1: warning: 'const' type qualifier on return type has no effect [-Wignored-qualifiers]
     135 | const u32 mtk_ovl_adaptor_get_blend_modes(struct device *dev);
         | ^~~~~
   drivers/gpu/drm/mediatek/mtk_disp_drv.h:170:1: warning: 'const' type qualifier on return type has no effect [-Wignored-qualifiers]
     170 | const u32 mtk_mdp_rdma_get_blend_modes(struct device *dev);
         | ^~~~~
>> drivers/gpu/drm/mediatek/mtk_disp_ovl.c:219:1: warning: 'const' type qualifier on return type has no effect [-Wignored-qualifiers]
     219 | const u32 mtk_ovl_get_blend_modes(struct device *dev)
         | ^~~~~
   10 warnings generated.
--
   In file included from drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c:7:
   In file included from include/drm/drm_of.h:8:
   In file included from include/drm/drm_bridge.h:30:
   In file included from include/drm/drm_atomic.h:31:
   In file included from include/drm/drm_crtc.h:32:
   In file included from include/drm/drm_modes.h:33:
   In file included from include/drm/drm_connector.h:32:
   In file included from include/drm/drm_util.h:36:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2232:
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
   In file included from drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c:20:
>> drivers/gpu/drm/mediatek/mtk_ddp_comp.h:83:2: warning: 'const' type qualifier on return type has no effect [-Wignored-qualifiers]
      83 |         const u32 (*get_blend_modes)(struct device *dev);
         |         ^~~~~
   drivers/gpu/drm/mediatek/mtk_ddp_comp.h:271:1: warning: 'const' type qualifier on return type has no effect [-Wignored-qualifiers]
     271 | const u32 mtk_ddp_comp_get_blend_modes(struct mtk_ddp_comp *comp)
         | ^~~~~
   In file included from drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c:21:
>> drivers/gpu/drm/mediatek/mtk_disp_drv.h:106:1: warning: 'const' type qualifier on return type has no effect [-Wignored-qualifiers]
     106 | const u32 mtk_ovl_get_blend_modes(struct device *dev);
         | ^~~~~
   drivers/gpu/drm/mediatek/mtk_disp_drv.h:135:1: warning: 'const' type qualifier on return type has no effect [-Wignored-qualifiers]
     135 | const u32 mtk_ovl_adaptor_get_blend_modes(struct device *dev);
         | ^~~~~
   drivers/gpu/drm/mediatek/mtk_disp_drv.h:170:1: warning: 'const' type qualifier on return type has no effect [-Wignored-qualifiers]
     170 | const u32 mtk_mdp_rdma_get_blend_modes(struct device *dev);
         | ^~~~~
>> drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c:403:1: warning: 'const' type qualifier on return type has no effect [-Wignored-qualifiers]
     403 | const u32 mtk_ovl_adaptor_get_blend_modes(struct device *dev)
         | ^~~~~
   10 warnings generated.
--
   In file included from drivers/gpu/drm/mediatek/mtk_mdp_rdma.c:15:
   In file included from drivers/gpu/drm/mediatek/mtk_disp_drv.h:13:
   In file included from drivers/gpu/drm/mediatek/mtk_plane.h:10:
   In file included from include/drm/drm_crtc.h:32:
   In file included from include/drm/drm_modes.h:33:
   In file included from include/drm/drm_connector.h:32:
   In file included from include/drm/drm_util.h:36:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2232:
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
   In file included from drivers/gpu/drm/mediatek/mtk_mdp_rdma.c:15:
>> drivers/gpu/drm/mediatek/mtk_disp_drv.h:106:1: warning: 'const' type qualifier on return type has no effect [-Wignored-qualifiers]
     106 | const u32 mtk_ovl_get_blend_modes(struct device *dev);
         | ^~~~~
   drivers/gpu/drm/mediatek/mtk_disp_drv.h:135:1: warning: 'const' type qualifier on return type has no effect [-Wignored-qualifiers]
     135 | const u32 mtk_ovl_adaptor_get_blend_modes(struct device *dev);
         | ^~~~~
   drivers/gpu/drm/mediatek/mtk_disp_drv.h:170:1: warning: 'const' type qualifier on return type has no effect [-Wignored-qualifiers]
     170 | const u32 mtk_mdp_rdma_get_blend_modes(struct device *dev);
         | ^~~~~
   In file included from drivers/gpu/drm/mediatek/mtk_mdp_rdma.c:16:
   In file included from drivers/gpu/drm/mediatek/mtk_drm_drv.h:10:
>> drivers/gpu/drm/mediatek/mtk_ddp_comp.h:83:2: warning: 'const' type qualifier on return type has no effect [-Wignored-qualifiers]
      83 |         const u32 (*get_blend_modes)(struct device *dev);
         |         ^~~~~
   drivers/gpu/drm/mediatek/mtk_ddp_comp.h:271:1: warning: 'const' type qualifier on return type has no effect [-Wignored-qualifiers]
     271 | const u32 mtk_ddp_comp_get_blend_modes(struct mtk_ddp_comp *comp)
         | ^~~~~
>> drivers/gpu/drm/mediatek/mtk_mdp_rdma.c:236:1: warning: 'const' type qualifier on return type has no effect [-Wignored-qualifiers]
     236 | const u32 mtk_mdp_rdma_get_blend_modes(struct device *dev)
         | ^~~~~
   10 warnings generated.


vim +/const +83 drivers/gpu/drm/mediatek/mtk_ddp_comp.h

    48	
    49	struct mtk_ddp_comp;
    50	struct cmdq_pkt;
    51	struct mtk_ddp_comp_funcs {
    52		int (*power_on)(struct device *dev);
    53		void (*power_off)(struct device *dev);
    54		int (*clk_enable)(struct device *dev);
    55		void (*clk_disable)(struct device *dev);
    56		void (*config)(struct device *dev, unsigned int w,
    57			       unsigned int h, unsigned int vrefresh,
    58			       unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
    59		void (*start)(struct device *dev);
    60		void (*stop)(struct device *dev);
    61		void (*register_vblank_cb)(struct device *dev,
    62					   void (*vblank_cb)(void *),
    63					   void *vblank_cb_data);
    64		void (*unregister_vblank_cb)(struct device *dev);
    65		void (*enable_vblank)(struct device *dev);
    66		void (*disable_vblank)(struct device *dev);
    67		unsigned int (*supported_rotations)(struct device *dev);
    68		unsigned int (*layer_nr)(struct device *dev);
    69		int (*layer_check)(struct device *dev,
    70				   unsigned int idx,
    71				   struct mtk_plane_state *state);
    72		void (*layer_config)(struct device *dev, unsigned int idx,
    73				     struct mtk_plane_state *state,
    74				     struct cmdq_pkt *cmdq_pkt);
    75		unsigned int (*gamma_get_lut_size)(struct device *dev);
    76		void (*gamma_set)(struct device *dev,
    77				  struct drm_crtc_state *state);
    78		void (*bgclr_in_on)(struct device *dev);
    79		void (*bgclr_in_off)(struct device *dev);
    80		void (*ctm_set)(struct device *dev,
    81				struct drm_crtc_state *state);
    82		struct device * (*dma_dev_get)(struct device *dev);
  > 83		const u32 (*get_blend_modes)(struct device *dev);
    84		const u32 *(*get_formats)(struct device *dev);
    85		size_t (*get_num_formats)(struct device *dev);
    86		void (*connect)(struct device *dev, struct device *mmsys_dev, unsigned int next);
    87		void (*disconnect)(struct device *dev, struct device *mmsys_dev, unsigned int next);
    88		void (*add)(struct device *dev, struct mtk_mutex *mutex);
    89		void (*remove)(struct device *dev, struct mtk_mutex *mutex);
    90		unsigned int (*encoder_index)(struct device *dev);
    91		enum drm_mode_status (*mode_valid)(struct device *dev, const struct drm_display_mode *mode);
    92	};
    93	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
