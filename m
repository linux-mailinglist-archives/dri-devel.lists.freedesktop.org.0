Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30EA274924A
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 02:14:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19CBD10E198;
	Thu,  6 Jul 2023 00:14:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4774C10E086;
 Thu,  6 Jul 2023 00:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688602453; x=1720138453;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/J9nMUuxT4c86r11TohlVWN1RySoETq6kRxktqV5kmw=;
 b=dKJoPS0PHydn4ePeOdg9lsaCEPQ5qh156rexDyRciWN2J2n11VK8MQTE
 5vz/0ZZ+b2QR6AzbsSmc78Glta6XuwLK2OYMA0ULz7Hd3wg9SZEzgRgTG
 ofIRj5MOKtBRk2ylLTsDxx1id2DLUCdXH1pSolg4Bs8J9PZINzVzTL2O3
 E67wS8VOEztstTId+TS0O8wkyEl/2QC4i2PBieRC9VxYG7RVNouC+PWyw
 zRPzsuU8eyAnlB3sKrnkxiV5+uS2cHnMRLoNKxcmfhGPs4fq0xWdDfSac
 yvIjXmnICQD0/IGcC+bLabk0AQz5pBxiryu5LJ2jPAVcwGDUU/utJu5BP w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="449831436"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; d="scan'208";a="449831436"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2023 17:14:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="1049882533"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; d="scan'208";a="1049882533"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
 by fmsmga005.fm.intel.com with ESMTP; 05 Jul 2023 17:14:08 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qHCdM-0000tq-12;
 Thu, 06 Jul 2023 00:14:08 +0000
Date: Thu, 6 Jul 2023 08:13:57 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [PATCH v2 10/14] drm/msm/dpu: use dpu_perf_cfg in DPU core_perf
 code
Message-ID: <202307060717.Jqn298i0-lkp@intel.com>
References: <20230704150354.159882-11-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230704150354.159882-11-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 oe-kbuild-all@lists.linux.dev, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v6.4 next-20230705]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Baryshkov/drm-msm-dpu-drop-enum-dpu_core_perf_data_bus_id/20230704-230618
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230704150354.159882-11-dmitry.baryshkov%40linaro.org
patch subject: [PATCH v2 10/14] drm/msm/dpu: use dpu_perf_cfg in DPU core_perf code
config: arm-defconfig (https://download.01.org/0day-ci/archive/20230706/202307060717.Jqn298i0-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20230706/202307060717.Jqn298i0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307060717.Jqn298i0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c:251:25: warning: variable 'kms' is uninitialized when used here [-Wuninitialized]
           if (atomic_dec_return(&kms->bandwidth_ref) > 0)
                                  ^~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c:242:21: note: initialize the variable 'kms' to silence this warning
           struct dpu_kms *kms;
                              ^
                               = NULL
   1 warning generated.


vim +/kms +251 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c

25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  230  
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  231  /**
2785fd47959003 Lee Jones         2020-11-23  232   * dpu_core_perf_crtc_release_bw() - request zero bandwidth
2785fd47959003 Lee Jones         2020-11-23  233   * @crtc: pointer to a crtc
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  234   *
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  235   * Function checks a state variable for the crtc, if all pending commit
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  236   * requests are done, meaning no more bandwidth is needed, release
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  237   * bandwidth request.
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  238   */
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  239  void dpu_core_perf_crtc_release_bw(struct drm_crtc *crtc)
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  240  {
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  241  	struct dpu_crtc *dpu_crtc;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  242  	struct dpu_kms *kms;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  243  
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  244  	if (!crtc) {
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  245  		DPU_ERROR("invalid crtc\n");
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  246  		return;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  247  	}
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  248  
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  249  	dpu_crtc = to_dpu_crtc(crtc);
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  250  
241b507c166fef Rob Clark         2019-08-20 @251  	if (atomic_dec_return(&kms->bandwidth_ref) > 0)
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  252  		return;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  253  
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  254  	/* Release the bandwidth */
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  255  	if (kms->perf.enable_bw_release) {
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  256  		trace_dpu_cmd_release_bw(crtc->base.id);
5b702d787b47e1 Stephen Boyd      2021-04-30  257  		DRM_DEBUG_ATOMIC("Release BW crtc=%d\n", crtc->base.id);
cb88482e2570f6 Jayant Shekhar    2019-06-18  258  		dpu_crtc->cur_perf.bw_ctl = 0;
cb88482e2570f6 Jayant Shekhar    2019-06-18  259  		_dpu_core_perf_crtc_update_bus(kms, crtc);
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  260  	}
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  261  }
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  262  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
