Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E89039E60CD
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 23:49:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EF6310EFBB;
	Thu,  5 Dec 2024 22:49:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="huQB4W93";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2924110EFBB
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 22:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733438954; x=1764974954;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=eQJA8gt/+Gn9iJvh/y6xFlkCm3roALrW99s5s7lFyB4=;
 b=huQB4W93jK93TayzOhVvaZbPuIaIklFtK2us2WYmrEoycdMoL2MwrbZl
 VlqgU8y3tdAsIC26AqYGu9jU5Egfxs5eFx6wsNgpHQP0BCcy/1iwsmt17
 HA93jsKM1uGx/PYY8YyTKUrbEYcUOMIcF3reO9vhXT4GtaRJfB+sLVqWF
 OTAjKHIKnoK4aUUh0dZBCus4JxPhWqB2h+0Iaip5dERV3C6egYP7FuIqI
 oaEcBxLuTuEHH6u/vbvnJj5frCzT58sb6RmBibGdJAmur7C7KoCnDgP18
 bWz+kP5boerUs487HTj5KxbZaDeb2WP79E3NwLjCKZnn3hvhiU2ZksGhl A==;
X-CSE-ConnectionGUID: NojHRw14Q92dJoYAF38dCA==
X-CSE-MsgGUID: 7/ZwUl5CRD2Uya2zPe8tFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="59182020"
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; d="scan'208";a="59182020"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 14:49:13 -0800
X-CSE-ConnectionGUID: JX65fdsCRgKOoxGGtSwVMA==
X-CSE-MsgGUID: m5jj8HO8Trak+cnRf2CGEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; d="scan'208";a="93909721"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
 by fmviesa006.fm.intel.com with ESMTP; 05 Dec 2024 14:49:07 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tJKef-0000Sd-28;
 Thu, 05 Dec 2024 22:49:05 +0000
Date: Fri, 6 Dec 2024 06:48:57 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, ck.hu@mediatek.com,
 jitao.shi@mediatek.com, jie.qiu@mediatek.com,
 junzhi.zhao@mediatek.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com
Subject: Re: [PATCH v2 15/15] drm/mediatek: Introduce HDMI/DDC v2 for
 MT8195/MT8188
Message-ID: <202412060636.00bzNpm9-lkp@intel.com>
References: <20241205114518.53527-16-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205114518.53527-16-angelogioacchino.delregno@collabora.com>
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

Hi AngeloGioacchino,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on pza/reset/next linus/master drm-misc/drm-misc-next v6.13-rc1 next-20241205]
[cannot apply to pza/imx-drm/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/dt-bindings-display-mediatek-dpi-Add-MT8195-and-MT8188-compat/20241205-194853
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20241205114518.53527-16-angelogioacchino.delregno%40collabora.com
patch subject: [PATCH v2 15/15] drm/mediatek: Introduce HDMI/DDC v2 for MT8195/MT8188
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20241206/202412060636.00bzNpm9-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241206/202412060636.00bzNpm9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412060636.00bzNpm9-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:15:
   In file included from include/linux/i2c.h:13:
   In file included from include/linux/acpi.h:39:
   In file included from include/acpi/acpi_io.h:7:
   In file included from arch/arm64/include/asm/acpi.h:14:
   In file included from include/linux/memblock.h:12:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:389:47: error: expected ';' after top level declarator
     389 | MODULE_DEVICE_TABLE(of, mtk_hdmi_ddc_v2_match)
         |                                               ^
         |                                               ;
   4 warnings and 1 error generated.


vim +389 drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c

   384	
   385	static const struct of_device_id mtk_hdmi_ddc_v2_match[] = {
   386		{ .compatible = "mediatek,mt8195-hdmi-ddc" },
   387		{ /* sentinel */ }
   388	};
 > 389	MODULE_DEVICE_TABLE(of, mtk_hdmi_ddc_v2_match)
   390	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
