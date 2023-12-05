Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8EA805E1B
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 19:51:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30B1710E5FC;
	Tue,  5 Dec 2023 18:51:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F8DE10E5FC;
 Tue,  5 Dec 2023 18:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701802280; x=1733338280;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=dT4NRjW0RT7c2QCYobwRufBLK9f4E4s8VI2cqsOh2oU=;
 b=Qp1wgtWkQR0udpUGqOr/vIO6xOaB9b//oF5FwDtJjhDVqmebAPiYY6ax
 JNKsuks3NIRuWsVxYT8w6H3FViTbIUtjsfwGW6zqtIsgXJlXPy/qM87ap
 q6zoWrE6uTrLvhWh2aOQSJUVbxHCUP0PRXJg35ovg83avQIcddrRlSlUk
 qfSo2eKAWNencyIrL1mclST4ABAGNPqFo0UUP4VhOATcaBbmVD7habOgt
 Nwr1VMVpxMmwt4bxw+yWS2ahEORwbfRNB+U8swOYdE28PlJBpw9pMEqkl
 OM+M+CxMWBhp8c5gQ1pvKH3c6+6aee2mb7mLAN8GBCItgHIIe/ekW7G5e A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="458261260"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; d="scan'208";a="458261260"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 10:51:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="747336973"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; d="scan'208";a="747336973"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
 by orsmga006.jf.intel.com with ESMTP; 05 Dec 2023 10:51:14 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rAaVk-0009Zr-13;
 Tue, 05 Dec 2023 18:51:12 +0000
Date: Wed, 6 Dec 2023 02:50:14 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [RFT PATCH v2 2/4] drm/msm/dpu: enable writeback on SC8108X
Message-ID: <202312060251.UlwzdD4v-lkp@intel.com>
References: <20231203003203.1293087-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231203003203.1293087-3-dmitry.baryshkov@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 llvm@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, oe-kbuild-all@lists.linux.dev,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on linus/master v6.7-rc4 next-20231205]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Baryshkov/drm-msm-dpu-enable-writeback-on-SM8150/20231203-083350
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20231203003203.1293087-3-dmitry.baryshkov%40linaro.org
patch subject: [RFT PATCH v2 2/4] drm/msm/dpu: enable writeback on SC8108X
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20231206/202312060251.UlwzdD4v-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312060251.UlwzdD4v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312060251.UlwzdD4v-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c:658:
   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h:299:15: error: use of undeclared identifier 'WB_SDM845_MASK'
     299 |                 .features = WB_SDM845_MASK,
         |                             ^
   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h:404:14: error: invalid application of 'sizeof' to an incomplete type 'const struct dpu_wb_cfg[]'
     404 |         .wb_count = ARRAY_SIZE(sm8150_wb),
         |                     ^~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:32: note: expanded from macro 'ARRAY_SIZE'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                ^~~~~
   In file included from drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c:659:
>> drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h:306:15: error: use of undeclared identifier 'WB_SDM845_MASK'
     306 |                 .features = WB_SDM845_MASK,
         |                             ^
>> drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h:429:14: error: invalid application of 'sizeof' to an incomplete type 'const struct dpu_wb_cfg[]'
     429 |         .wb_count = ARRAY_SIZE(sc8180x_wb),
         |                     ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:32: note: expanded from macro 'ARRAY_SIZE'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                ^~~~~
   4 errors generated.


vim +/WB_SDM845_MASK +306 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h

   301	
   302	static const struct dpu_wb_cfg sc8180x_wb[] = {
   303		{
   304			.name = "wb_2", .id = WB_2,
   305			.base = 0x65000, .len = 0x2c8,
 > 306			.features = WB_SDM845_MASK,
   307			.format_list = wb2_formats,
   308			.num_formats = ARRAY_SIZE(wb2_formats),
   309			.clk_ctrl = DPU_CLK_CTRL_WB2,
   310			.xin_id = 6,
   311			.vbif_idx = VBIF_RT,
   312			.maxlinewidth = 4096,
   313			.intr_wb_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 4),
   314		},
   315	};
   316	
   317	static const struct dpu_intf_cfg sc8180x_intf[] = {
   318		{
   319			.name = "intf_0", .id = INTF_0,
   320			.base = 0x6a000, .len = 0x280,
   321			.features = INTF_SC7180_MASK,
   322			.type = INTF_DP,
   323			.controller_id = MSM_DP_CONTROLLER_0,
   324			.prog_fetch_lines_worst_case = 24,
   325			.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
   326			.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
   327		}, {
   328			.name = "intf_1", .id = INTF_1,
   329			.base = 0x6a800, .len = 0x2bc,
   330			.features = INTF_SC7180_MASK,
   331			.type = INTF_DSI,
   332			.controller_id = MSM_DSI_CONTROLLER_0,
   333			.prog_fetch_lines_worst_case = 24,
   334			.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
   335			.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
   336			.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2),
   337		}, {
   338			.name = "intf_2", .id = INTF_2,
   339			.base = 0x6b000, .len = 0x2bc,
   340			.features = INTF_SC7180_MASK,
   341			.type = INTF_DSI,
   342			.controller_id = MSM_DSI_CONTROLLER_1,
   343			.prog_fetch_lines_worst_case = 24,
   344			.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
   345			.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
   346			.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF2_TEAR_INTR, 2),
   347		},
   348		/* INTF_3 is for MST, wired to INTF_DP 0 and 1, use dummy index until this is supported */
   349		{
   350			.name = "intf_3", .id = INTF_3,
   351			.base = 0x6b800, .len = 0x280,
   352			.features = INTF_SC7180_MASK,
   353			.type = INTF_DP,
   354			.controller_id = 999,
   355			.prog_fetch_lines_worst_case = 24,
   356			.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
   357			.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
   358		}, {
   359			.name = "intf_4", .id = INTF_4,
   360			.base = 0x6c000, .len = 0x280,
   361			.features = INTF_SC7180_MASK,
   362			.type = INTF_DP,
   363			.controller_id = MSM_DP_CONTROLLER_1,
   364			.prog_fetch_lines_worst_case = 24,
   365			.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 20),
   366			.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 21),
   367		}, {
   368			.name = "intf_5", .id = INTF_5,
   369			.base = 0x6c800, .len = 0x280,
   370			.features = INTF_SC7180_MASK,
   371			.type = INTF_DP,
   372			.controller_id = MSM_DP_CONTROLLER_2,
   373			.prog_fetch_lines_worst_case = 24,
   374			.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 22),
   375			.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 23),
   376		},
   377	};
   378	
   379	static const struct dpu_perf_cfg sc8180x_perf_data = {
   380		.max_bw_low = 9600000,
   381		.max_bw_high = 9600000,
   382		.min_core_ib = 2400000,
   383		.min_llcc_ib = 800000,
   384		.min_dram_ib = 800000,
   385		.danger_lut_tbl = {0xf, 0xffff, 0x0},
   386		.qos_lut_tbl = {
   387			{.nentry = ARRAY_SIZE(sc7180_qos_linear),
   388			.entries = sc7180_qos_linear
   389			},
   390			{.nentry = ARRAY_SIZE(sc7180_qos_macrotile),
   391			.entries = sc7180_qos_macrotile
   392			},
   393			{.nentry = ARRAY_SIZE(sc7180_qos_nrt),
   394			.entries = sc7180_qos_nrt
   395			},
   396			/* TODO: macrotile-qseed is different from macrotile */
   397		},
   398		.cdp_cfg = {
   399			{.rd_enable = 1, .wr_enable = 1},
   400			{.rd_enable = 1, .wr_enable = 0}
   401		},
   402		.clk_inefficiency_factor = 105,
   403		.bw_inefficiency_factor = 120,
   404	};
   405	
   406	static const struct dpu_mdss_version sc8180x_mdss_ver = {
   407		.core_major_ver = 5,
   408		.core_minor_ver = 1,
   409	};
   410	
   411	const struct dpu_mdss_cfg dpu_sc8180x_cfg = {
   412		.mdss_ver = &sc8180x_mdss_ver,
   413		.caps = &sc8180x_dpu_caps,
   414		.mdp = &sc8180x_mdp,
   415		.ctl_count = ARRAY_SIZE(sc8180x_ctl),
   416		.ctl = sc8180x_ctl,
   417		.sspp_count = ARRAY_SIZE(sc8180x_sspp),
   418		.sspp = sc8180x_sspp,
   419		.mixer_count = ARRAY_SIZE(sc8180x_lm),
   420		.mixer = sc8180x_lm,
   421		.dspp_count = ARRAY_SIZE(sc8180x_dspp),
   422		.dspp = sc8180x_dspp,
   423		.dsc_count = ARRAY_SIZE(sc8180x_dsc),
   424		.dsc = sc8180x_dsc,
   425		.pingpong_count = ARRAY_SIZE(sc8180x_pp),
   426		.pingpong = sc8180x_pp,
   427		.merge_3d_count = ARRAY_SIZE(sc8180x_merge_3d),
   428		.merge_3d = sc8180x_merge_3d,
 > 429		.wb_count = ARRAY_SIZE(sc8180x_wb),
   430		.wb = sc8180x_wb,
   431		.intf_count = ARRAY_SIZE(sc8180x_intf),
   432		.intf = sc8180x_intf,
   433		.vbif_count = ARRAY_SIZE(sdm845_vbif),
   434		.vbif = sdm845_vbif,
   435		.perf = &sc8180x_perf_data,
   436	};
   437	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
