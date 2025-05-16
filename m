Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 337F7AB960B
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 08:35:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE87710E9AC;
	Fri, 16 May 2025 06:35:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JbqquFFh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2588D10E9AC
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 06:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747377314; x=1778913314;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=EWO6CZzwsD8bIRRFpNMF4OS0mHTBB1Wpe5eviDCIk8E=;
 b=JbqquFFh9xA0jdxALp0pS4LemT/FLd3B1VClT8EJ4OuSjqlWR/rUDWbl
 K0Kb6DQJiivozyW9+4e/9/pfRmuurZI1n3ov90thvY+LdMTDErpVsoyKN
 bGc2RyEZy4eqKvTMuldb+t/jz0fJb8aMUjtkoyDJvbPE3fGvIARzLd+v4
 +m32UT6yZeTbNPL9GWrYnkKa+Sx7FaLZrEubSePM8MaYstYmVO9zC7zcP
 XO0pROfGYI5dHa8TVFVkId2IxkpV0t/hmrNYX81voRD+hULnSNoLIm1kF
 bEXEkG4V62Rg7aogwQ/tgKwtwBQb5KxmQs82HOD/hhx6ZfDIDFnQSbdJS Q==;
X-CSE-ConnectionGUID: rZ8nM/9+RKWJ2349deIVjw==
X-CSE-MsgGUID: wCZIN7PASpGnzecSZX1pRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="49323336"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; d="scan'208";a="49323336"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 23:35:14 -0700
X-CSE-ConnectionGUID: FdBqF5OARzSE8VaoJNoetw==
X-CSE-MsgGUID: 4TNMa49+RSqU+LxFVGFPHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; d="scan'208";a="138990800"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
 by fmviesa008.fm.intel.com with ESMTP; 15 May 2025 23:35:09 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uFoew-000J3N-2g;
 Fri, 16 May 2025 06:35:06 +0000
Date: Fri, 16 May 2025 14:34:47 +0800
From: kernel test robot <lkp@intel.com>
To: "paul-pl.chen" <paul-pl.chen@mediatek.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, chunkuang.hu@kernel.org,
 angelogioacchino.delregno@collabora.com
Cc: oe-kbuild-all@lists.linux.dev, matthias.bgg@gmail.com,
 p.zabel@pengutronix.de, jason-jh.lin@mediatek.com,
 nancy.lin@mediatek.com, singo.chang@mediatek.com,
 xiandong.wang@mediatek.com, sirius.wang@mediatek.com,
 paul-pl.chen@mediatek.com, sunny.shen@mediatek.com,
 fshao@chromium.org, treapking@chromium.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v3 15/17] drm/mediatek: add ovlsys_adaptor support for
 MT8196
Message-ID: <202505161422.JeAeW3Pd-lkp@intel.com>
References: <20250515093454.1729720-16-paul-pl.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515093454.1729720-16-paul-pl.chen@mediatek.com>
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

Hi paul-pl.chen,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.15-rc6 next-20250515]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/paul-pl-chen/dt-bindings-soc-mediatek-add-mutex-yaml-for-MT8196/20250515-173733
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250515093454.1729720-16-paul-pl.chen%40mediatek.com
patch subject: [PATCH v3 15/17] drm/mediatek: add ovlsys_adaptor support for MT8196
config: arm64-randconfig-001-20250516 (https://download.01.org/0day-ci/archive/20250516/202505161422.JeAeW3Pd-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250516/202505161422.JeAeW3Pd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505161422.JeAeW3Pd-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/gpu/drm/mediatek/mtk_drm_drv.c: In function 'mtk_drm_ovl_adaptor_probe':
>> drivers/gpu/drm/mediatek/mtk_drm_drv.c:1071:32: error: storage size of 'ovlsys_priv' isn't known
    1071 |  struct mtk_drm_ovlsys_private ovlsys_priv;
         |                                ^~~~~~~~~~~
>> drivers/gpu/drm/mediatek/mtk_drm_drv.c:1071:32: warning: unused variable 'ovlsys_priv' [-Wunused-variable]
   drivers/gpu/drm/mediatek/mtk_drm_drv.c: In function 'mtk_drm_probe':
   drivers/gpu/drm/mediatek/mtk_drm_drv.c:1145:50: error: 'DDP_COMPONENT_DRM_OVLSYS_ADAPTOR2' undeclared (first use in this function); did you mean 'DDP_COMPONENT_DRM_OVLSYS_ADAPTOR0'?
    1145 |  mtk_drm_ovl_adaptor_probe(dev, private, &match, DDP_COMPONENT_DRM_OVLSYS_ADAPTOR2);
         |                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                                  DDP_COMPONENT_DRM_OVLSYS_ADAPTOR0
   drivers/gpu/drm/mediatek/mtk_drm_drv.c:1145:50: note: each undeclared identifier is reported only once for each function it appears in


vim +1071 drivers/gpu/drm/mediatek/mtk_drm_drv.c

  1066	
  1067	static void mtk_drm_ovl_adaptor_probe(struct device *dev, struct mtk_drm_private *private,
  1068					      struct component_match **match, enum mtk_ddp_comp_id id)
  1069	{
  1070		struct platform_device *ovl_adaptor;
> 1071		struct mtk_drm_ovlsys_private ovlsys_priv;
  1072		bool is_ovlsys = (id != DDP_COMPONENT_DRM_OVL_ADAPTOR);
  1073		char *dev_name = is_ovlsys ? "mediatek-disp-ovlsys-adaptor" : "mediatek-disp-ovl-adaptor";
  1074		void *drv_data = is_ovlsys ? (void *)&ovlsys_priv : (void *)private->mmsys_dev;
  1075		size_t data_size = is_ovlsys ? sizeof(ovlsys_priv) : sizeof(*private->mmsys_dev);
  1076	
  1077		if (mtk_drm_find_mmsys_comp(private, id, &ovlsys_priv.use_path)) {
  1078			ovlsys_priv.mmsys_dev = private->mmsys_dev;
  1079			ovl_adaptor = platform_device_register_data(dev, dev_name, PLATFORM_DEVID_AUTO,
  1080								    drv_data, data_size);
  1081			private->ddp_comp[id].dev = &ovl_adaptor->dev;
  1082			mtk_ddp_comp_init(NULL, &private->ddp_comp[id], id);
  1083			component_match_add(dev, match, compare_dev, &ovl_adaptor->dev);
  1084		}
  1085	}
  1086	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
