Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6A9805605
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 14:34:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C35810E2AF;
	Tue,  5 Dec 2023 13:34:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61AE410E2AF;
 Tue,  5 Dec 2023 13:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701783243; x=1733319243;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=b2GfwFST1ueM5U/2wKHdX45CfQpeB2wtXVu/9e0FuVQ=;
 b=acfNOIG7zR+IoEGfbF8TBIr0Lgoz0b4yqiAwUlVcU2F+Ml1UwCoMjNvW
 zLYrnnstIGkPajMtYY/JB20bBDqBavvpCzO1WOILzMgyWrvhRLAGjD5LN
 BZ9YoT2pIefxvcosRB3FheYibkNkdHNyZ5z+ZtuZ1+yX6UAoIFkj1rmDD
 y4b8HGdMD69ZrQz+zHoEl1c9SMSh+W3Hb8Df1LpGI6ZJPh+HJXXc6NeKZ
 AkjmdF3C3r8x5YGGlsupMh0h4VvKHTO57u5FdDvdIIg4YdcHBXJR+vVV1
 h7ECpi11EkaBwCgFYsx2KXXlT6ubqCMPo22hmm9g6T6IcclSZ0KNprkOS Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="396688869"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; d="scan'208";a="396688869"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 05:34:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="747232424"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; d="scan'208";a="747232424"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
 by orsmga006.jf.intel.com with ESMTP; 05 Dec 2023 05:33:59 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rAVYg-000934-1P;
 Tue, 05 Dec 2023 13:33:54 +0000
Date: Tue, 5 Dec 2023 21:32:53 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [RFT PATCH v2 1/4] drm/msm/dpu: enable writeback on SM8150
Message-ID: <202312052138.qMYI7bXS-lkp@intel.com>
References: <20231203003203.1293087-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231203003203.1293087-2-dmitry.baryshkov@linaro.org>
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
patch link:    https://lore.kernel.org/r/20231203003203.1293087-2-dmitry.baryshkov%40linaro.org
patch subject: [RFT PATCH v2 1/4] drm/msm/dpu: enable writeback on SM8150
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20231205/202312052138.qMYI7bXS-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231205/202312052138.qMYI7bXS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312052138.qMYI7bXS-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c:658:
>> drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h:299:15: error: use of undeclared identifier 'WB_SDM845_MASK'
     299 |                 .features = WB_SDM845_MASK,
         |                             ^
>> drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h:404:14: error: invalid application of 'sizeof' to an incomplete type 'const struct dpu_wb_cfg[]'
     404 |         .wb_count = ARRAY_SIZE(sm8150_wb),
         |                     ^~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:32: note: expanded from macro 'ARRAY_SIZE'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                ^~~~~
   2 errors generated.


vim +/WB_SDM845_MASK +299 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h

   294	
   295	static const struct dpu_wb_cfg sm8150_wb[] = {
   296		{
   297			.name = "wb_2", .id = WB_2,
   298			.base = 0x65000, .len = 0x2c8,
 > 299			.features = WB_SDM845_MASK,
   300			.format_list = wb2_formats,
   301			.num_formats = ARRAY_SIZE(wb2_formats),
   302			.clk_ctrl = DPU_CLK_CTRL_WB2,
   303			.xin_id = 6,
   304			.vbif_idx = VBIF_RT,
   305			.maxlinewidth = 4096,
   306			.intr_wb_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 4),
   307		},
   308	};
   309	
   310	static const struct dpu_intf_cfg sm8150_intf[] = {
   311		{
   312			.name = "intf_0", .id = INTF_0,
   313			.base = 0x6a000, .len = 0x280,
   314			.features = INTF_SC7180_MASK,
   315			.type = INTF_DP,
   316			.controller_id = MSM_DP_CONTROLLER_0,
   317			.prog_fetch_lines_worst_case = 24,
   318			.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
   319			.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
   320		}, {
   321			.name = "intf_1", .id = INTF_1,
   322			.base = 0x6a800, .len = 0x2bc,
   323			.features = INTF_SC7180_MASK,
   324			.type = INTF_DSI,
   325			.controller_id = MSM_DSI_CONTROLLER_0,
   326			.prog_fetch_lines_worst_case = 24,
   327			.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
   328			.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
   329			.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2),
   330		}, {
   331			.name = "intf_2", .id = INTF_2,
   332			.base = 0x6b000, .len = 0x2bc,
   333			.features = INTF_SC7180_MASK,
   334			.type = INTF_DSI,
   335			.controller_id = MSM_DSI_CONTROLLER_1,
   336			.prog_fetch_lines_worst_case = 24,
   337			.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
   338			.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
   339			.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF2_TEAR_INTR, 2),
   340		}, {
   341			.name = "intf_3", .id = INTF_3,
   342			.base = 0x6b800, .len = 0x280,
   343			.features = INTF_SC7180_MASK,
   344			.type = INTF_DP,
   345			.controller_id = MSM_DP_CONTROLLER_1,
   346			.prog_fetch_lines_worst_case = 24,
   347			.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
   348			.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
   349		},
   350	};
   351	
   352	static const struct dpu_perf_cfg sm8150_perf_data = {
   353		.max_bw_low = 12800000,
   354		.max_bw_high = 12800000,
   355		.min_core_ib = 2400000,
   356		.min_llcc_ib = 800000,
   357		.min_dram_ib = 800000,
   358		.min_prefill_lines = 24,
   359		.danger_lut_tbl = {0xf, 0xffff, 0x0},
   360		.safe_lut_tbl = {0xfff8, 0xf000, 0xffff},
   361		.qos_lut_tbl = {
   362			{.nentry = ARRAY_SIZE(sm8150_qos_linear),
   363			.entries = sm8150_qos_linear
   364			},
   365			{.nentry = ARRAY_SIZE(sc7180_qos_macrotile),
   366			.entries = sc7180_qos_macrotile
   367			},
   368			{.nentry = ARRAY_SIZE(sc7180_qos_nrt),
   369			.entries = sc7180_qos_nrt
   370			},
   371			/* TODO: macrotile-qseed is different from macrotile */
   372		},
   373		.cdp_cfg = {
   374			{.rd_enable = 1, .wr_enable = 1},
   375			{.rd_enable = 1, .wr_enable = 0}
   376		},
   377		.clk_inefficiency_factor = 105,
   378		.bw_inefficiency_factor = 120,
   379	};
   380	
   381	static const struct dpu_mdss_version sm8150_mdss_ver = {
   382		.core_major_ver = 5,
   383		.core_minor_ver = 0,
   384	};
   385	
   386	const struct dpu_mdss_cfg dpu_sm8150_cfg = {
   387		.mdss_ver = &sm8150_mdss_ver,
   388		.caps = &sm8150_dpu_caps,
   389		.mdp = &sm8150_mdp,
   390		.ctl_count = ARRAY_SIZE(sm8150_ctl),
   391		.ctl = sm8150_ctl,
   392		.sspp_count = ARRAY_SIZE(sm8150_sspp),
   393		.sspp = sm8150_sspp,
   394		.mixer_count = ARRAY_SIZE(sm8150_lm),
   395		.mixer = sm8150_lm,
   396		.dspp_count = ARRAY_SIZE(sm8150_dspp),
   397		.dspp = sm8150_dspp,
   398		.dsc_count = ARRAY_SIZE(sm8150_dsc),
   399		.dsc = sm8150_dsc,
   400		.pingpong_count = ARRAY_SIZE(sm8150_pp),
   401		.pingpong = sm8150_pp,
   402		.merge_3d_count = ARRAY_SIZE(sm8150_merge_3d),
   403		.merge_3d = sm8150_merge_3d,
 > 404		.wb_count = ARRAY_SIZE(sm8150_wb),
   405		.wb = sm8150_wb,
   406		.intf_count = ARRAY_SIZE(sm8150_intf),
   407		.intf = sm8150_intf,
   408		.vbif_count = ARRAY_SIZE(sdm845_vbif),
   409		.vbif = sdm845_vbif,
   410		.perf = &sm8150_perf_data,
   411	};
   412	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
