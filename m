Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CAA9044D8
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2024 21:35:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68E6810E0CD;
	Tue, 11 Jun 2024 19:35:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nz9S/0gk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 645E010E0CD
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 19:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718134511; x=1749670511;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=susaUDi/yz7Enip+SPo9XpTzH+CVEJDN9NuS79DVHfM=;
 b=nz9S/0gkaB5Co8W9nW68lae4xwaSvfvysJEugiDLWqn0So07GWfp0RRF
 XJUgmDXN772sudKszBSxOVP/1+nr4z1lorNx38PXGGMQSgEQbh3yGa8iK
 MiQf8NK0LLvR4segJ77qN8NRzA5Z2VSzl2KA5pC6X59QGzAVLbGqqSJxq
 DPp60kl+LDlpjDupr85i6a09/fboAHzFyjqMqY26Z2X6I9qGqeY6xR8um
 HxaKrR5uafZzjK/anxyMGUKDYs/KAxG4o4XVnHsF2evU62Xq89F6SHf29
 xozvtwBHwcgq0KcS1QP8eAREL0ISyo32ltbnlqQDTbWSqcBub0gn44udv A==;
X-CSE-ConnectionGUID: lGIdqBxyRQ+xP4UkGKOLgg==
X-CSE-MsgGUID: UeGR/jsQTBmMxygZQzxhIg==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="14997324"
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; d="scan'208";a="14997324"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 12:35:09 -0700
X-CSE-ConnectionGUID: XSryMGTlSDq3RqP+GGoarw==
X-CSE-MsgGUID: hKbXWze/Q4GB6LbrnaPW3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; d="scan'208";a="40007035"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
 by orviesa006.jf.intel.com with ESMTP; 11 Jun 2024 12:35:03 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sH7Gm-0000qE-1S;
 Tue, 11 Jun 2024 19:35:00 +0000
Date: Wed, 12 Jun 2024 03:34:07 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, shawn.sung@mediatek.com,
 yu-chang.lee@mediatek.com, ck.hu@mediatek.com,
 jitao.shi@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, wenst@chromium.org,
 kernel@collabora.com, sui.jinfeng@linux.dev, michael@walle.cc,
 Alexandre Mergnat <amergnat@baylibre.com>
Subject: Re: [PATCH v6 3/3] drm/mediatek: Implement OF graphs support for
 display paths
Message-ID: <202406120316.VAGmVBWN-lkp@intel.com>
References: <20240611082831.477566-4-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240611082831.477566-4-angelogioacchino.delregno@collabora.com>
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
[also build test ERROR on linus/master v6.10-rc3 next-20240611]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/dt-bindings-display-mediatek-Add-OF-graph-support-for-board-path/20240611-163327
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20240611082831.477566-4-angelogioacchino.delregno%40collabora.com
patch subject: [PATCH v6 3/3] drm/mediatek: Implement OF graphs support for display paths
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240612/202406120316.VAGmVBWN-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240612/202406120316.VAGmVBWN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406120316.VAGmVBWN-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/mediatek/mtk_dpi.c: In function 'mtk_dpi_bridge_attach':
>> drivers/gpu/drm/mediatek/mtk_dpi.c:711:31: error: 'dsi' undeclared (first use in this function); did you mean 'dpi'?
     711 |                 ret = PTR_ERR(dsi->next_bridge);
         |                               ^~~
         |                               dpi
   drivers/gpu/drm/mediatek/mtk_dpi.c:711:31: note: each undeclared identifier is reported only once for each function it appears in


vim +711 drivers/gpu/drm/mediatek/mtk_dpi.c

   702	
   703	static int mtk_dpi_bridge_attach(struct drm_bridge *bridge,
   704					 enum drm_bridge_attach_flags flags)
   705	{
   706		struct mtk_dpi *dpi = bridge_to_dpi(bridge);
   707		int ret;
   708	
   709		dpi->next_bridge = devm_drm_of_get_bridge(dpi->dev, dpi->dev->of_node, 1, -1);
   710		if (IS_ERR(dpi->next_bridge)) {
 > 711			ret = PTR_ERR(dsi->next_bridge);
   712			if (ret == -EPROBE_DEFER)
   713				return ret;
   714	
   715			/* Old devicetree has only one endpoint */
   716			dpi->next_bridge = devm_drm_of_get_bridge(dpi->dev, dpi->dev->of_node, 0, 0);
   717			if (IS_ERR(dpi->next_bridge))
   718				return dev_err_probe(dpi->dev, PTR_ERR(dpi->next_bridge),
   719						     "Failed to get bridge\n");
   720		}
   721	
   722		return drm_bridge_attach(bridge->encoder, dpi->next_bridge,
   723					 &dpi->bridge, flags);
   724	}
   725	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
