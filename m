Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2FC7CEEEF
	for <lists+dri-devel@lfdr.de>; Thu, 19 Oct 2023 07:19:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3127B10E008;
	Thu, 19 Oct 2023 05:19:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65D8310E008;
 Thu, 19 Oct 2023 05:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697692740; x=1729228740;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=CHgu8VDG/VsrVs4cHfAZnVU204i5DaWqZKJi7cU7Wk4=;
 b=G96/tylF4JQThu2BATBMi+qIH5R8KiGvPuQ99vT5aEUWvjSGb9b2NXrc
 ppm1bs2pzp2R5JW/GR7tUsSGbjSqj7AmoXPwXGR58IiKcG9RY95w0fn7Y
 QcElSXy9Zn3QDxEln0Yjpp4Vo2qL0Sm5W5BQeeu2fgKQkRBp+RZk3SuWk
 590XoIbP/SlOk3+Pqgc8W2NBZklUzuP47Vs0lIqzYCJxHV4aWfsMKNY5A
 s5/i0QN8f5hW67qAySJBbxLcCR12WqWmpIOcWcRmfJDKLkWjPEuqwe4Zg
 vx2lWo5qAUiRa10mOXwaBmOuvJw6uMjxUO7HzkH4cVTa7HzYbAwcquaRm Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="452644718"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; d="scan'208";a="452644718"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2023 22:18:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="756866215"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; d="scan'208";a="756866215"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
 by orsmga002.jf.intel.com with ESMTP; 18 Oct 2023 22:18:51 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qtLQn-0001fi-1d;
 Thu, 19 Oct 2023 05:18:49 +0000
Date: Thu, 19 Oct 2023 13:18:24 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Acayan <mailingradian@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Vinod Polimera <quic_vpolimer@quicinc.com>,
 Ryan McCann <quic_rmccann@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Liu Shixin <liushixin2@huawei.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 5/6] drm/msm/dpu: Add hw revision 4.1 (SDM670)
Message-ID: <202310191232.PtdOnTbi-lkp@intel.com>
References: <20231017021805.1083350-14-mailingradian@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231017021805.1083350-14-mailingradian@gmail.com>
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
Cc: Richard Acayan <mailingradian@gmail.com>, oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Richard,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm/drm-next robh/for-next linus/master v6.6-rc6 next-20231018]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Richard-Acayan/dt-bindings-display-msm-dsi-controller-main-add-SDM670-compatible/20231017-155345
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20231017021805.1083350-14-mailingradian%40gmail.com
patch subject: [PATCH v4 5/6] drm/msm/dpu: Add hw revision 4.1 (SDM670)
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20231019/202310191232.PtdOnTbi-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231019/202310191232.PtdOnTbi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310191232.PtdOnTbi-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c:658:
>> drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h:29:26: error: 'dpu_vig_sblk_qseed3_1_3' undeclared here (not in a function)
      29 |                 .sblk = &dpu_vig_sblk_qseed3_1_3,
         |                          ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h:45:26: error: 'dpu_dma_sblk' undeclared here (not in a function); did you mean 'dpu_dsc_blk'?
      45 |                 .sblk = &dpu_dma_sblk,
         |                          ^~~~~~~~~~~~
         |                          dpu_dsc_blk


vim +/dpu_vig_sblk_qseed3_1_3 +29 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h

    23	
    24	static const struct dpu_sspp_cfg sdm670_sspp[] = {
    25		{
    26			.name = "sspp_0", .id = SSPP_VIG0,
    27			.base = 0x4000, .len = 0x1c8,
    28			.features = VIG_SDM845_MASK_SDMA,
  > 29			.sblk = &dpu_vig_sblk_qseed3_1_3,
    30			.xin_id = 0,
    31			.type = SSPP_TYPE_VIG,
    32			.clk_ctrl = DPU_CLK_CTRL_VIG0,
    33		}, {
    34			.name = "sspp_1", .id = SSPP_VIG1,
    35			.base = 0x6000, .len = 0x1c8,
    36			.features = VIG_SDM845_MASK_SDMA,
    37			.sblk = &dpu_vig_sblk_qseed3_1_3,
    38			.xin_id = 4,
    39			.type = SSPP_TYPE_VIG,
    40			.clk_ctrl = DPU_CLK_CTRL_VIG0,
    41		}, {
    42			.name = "sspp_8", .id = SSPP_DMA0,
    43			.base = 0x24000, .len = 0x1c8,
    44			.features = DMA_SDM845_MASK_SDMA,
  > 45			.sblk = &dpu_dma_sblk,
    46			.xin_id = 1,
    47			.type = SSPP_TYPE_DMA,
    48			.clk_ctrl = DPU_CLK_CTRL_DMA0,
    49		}, {
    50			.name = "sspp_9", .id = SSPP_DMA1,
    51			.base = 0x26000, .len = 0x1c8,
    52			.features = DMA_CURSOR_SDM845_MASK_SDMA,
    53			.sblk = &dpu_dma_sblk,
    54			.xin_id = 5,
    55			.type = SSPP_TYPE_DMA,
    56			.clk_ctrl = DPU_CLK_CTRL_DMA1,
    57		}, {
    58			.name = "sspp_10", .id = SSPP_DMA2,
    59			.base = 0x28000, .len = 0x1c8,
    60			.features = DMA_CURSOR_SDM845_MASK_SDMA,
    61			.sblk = &dpu_dma_sblk,
    62			.xin_id = 9,
    63			.type = SSPP_TYPE_DMA,
    64			.clk_ctrl = DPU_CLK_CTRL_DMA2,
    65		},
    66	};
    67	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
