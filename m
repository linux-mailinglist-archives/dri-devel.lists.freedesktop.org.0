Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4A3983A78
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 01:47:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC89210E1C5;
	Mon, 23 Sep 2024 23:47:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IhRVnrq3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6C7C10E1C5
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 23:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727135246; x=1758671246;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5Uj5mtdoOAx4kTnVRoWRzMXPTIVr/7eKH1rcTgJl9kw=;
 b=IhRVnrq3ZRxKgKll0WUA2xlOCyJNTuOY33HKoU0a5W1nbrMYKulDRQTo
 TC8bLrPrBbqMwsh6yY+E+M8hfo88ruKzLfFjY/3vpYKlr7x1U1dj4fHZP
 /9l7qhXVBrs+8endJVV77H7qYhSQ53Qn+E+F+iVqrWxfekVUtJtEdgF3Q
 PabzHZQ3sZ/kKemO1LP/AV3QcMJ9Ds3/qccf16uTsYR4yQQWO5awSogqH
 MmNdXgmXeOz1PRmNvZnF1PvHBmfBTjQJtvUqPw3y2tRXRQR8Lgj1PBSe9
 SIyBUkoYfkcmcytqqqejlp0i7LjvDNpVP0Ghu6EKnzwQVvWSw+Z2N/bOs g==;
X-CSE-ConnectionGUID: rWDMToFWQX2iFgtchGBMLQ==
X-CSE-MsgGUID: pMiWzjFpQmKvHo3axek5EQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="26201997"
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; d="scan'208";a="26201997"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 16:47:25 -0700
X-CSE-ConnectionGUID: Ka2oBSuyTKOd3Z5PG+7EYQ==
X-CSE-MsgGUID: ZyAwx6NvSC2ErgBnx4lVTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; d="scan'208";a="94575117"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
 by fmviesa002.fm.intel.com with ESMTP; 23 Sep 2024 16:44:51 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sssjX-000HhL-0L;
 Mon, 23 Sep 2024 23:44:47 +0000
Date: Tue, 24 Sep 2024 07:44:06 +0800
From: kernel test robot <lkp@intel.com>
To: Liankun Yang <liankun.yang@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 jitao.shi@mediatek.com, mac.shen@mediatek.com, peng.liu@mediatek.com
Cc: oe-kbuild-all@lists.linux.dev,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 1/1] drm/mediatek: dp: Add sdp path reset
Message-ID: <202409240700.ARp9pDUk-lkp@intel.com>
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
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20240924/202409240700.ARp9pDUk-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240924/202409240700.ARp9pDUk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409240700.ARp9pDUk-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/mediatek/mtk_dp.c: In function 'mtk_dp_sdp_path_reset':
>> drivers/gpu/drm/mediatek/mtk_dp.c:1058:33: error: 'SDP_RESET_SW_DP_ENC0_P0' undeclared (first use in this function); did you mean 'SDP_PACKET_W_DP_ENC1_P0'?
    1058 |                                 SDP_RESET_SW_DP_ENC0_P0,
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~
         |                                 SDP_PACKET_W_DP_ENC1_P0
   drivers/gpu/drm/mediatek/mtk_dp.c:1058:33: note: each undeclared identifier is reported only once for each function it appears in


vim +1058 drivers/gpu/drm/mediatek/mtk_dp.c

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
