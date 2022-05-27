Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E104C535989
	for <lists+dri-devel@lfdr.de>; Fri, 27 May 2022 08:44:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C5EE10ECAF;
	Fri, 27 May 2022 06:44:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0128A10E16F;
 Fri, 27 May 2022 06:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653633863; x=1685169863;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=fQI6cbTw2kPlUwwHwJseatTgtASIlX3ZxniUjFCz3CU=;
 b=T9V8jD1bp6SocM9p8qjSmqqvP/23RP3BEGGCdiVYK+2Bm2v5JF0WVLfE
 dMa/Knao9c97hsILqEbffG5xmKrsVKoqK8A8dnHpsTZML5Jg8TNkumm3I
 6Thx8cYSQyD294/hN7Y7hQPSlgxbAAqJ7aKEzaVfIlT1HJJwj1iTsKZBf
 XBmSZd+2c9urjG/lBvUGcV+TS9GBUheXQ1X30Da5ooNVMkMFFUyafQZxx
 xpTmh29TDxrOGUobBzd81hc7eXwC6cVkwxl8gJ6qtXHA1s0oCVKYIzOp0
 i7zUFqEOo7+tYPWF0BHuvyqj/pfTfNxdHdGulKrOYqaFHHjzZYMiqrysm g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10359"; a="337444449"
X-IronPort-AV: E=Sophos;i="5.91,254,1647327600"; d="scan'208";a="337444449"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2022 23:44:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,254,1647327600"; d="scan'208";a="718706904"
Received: from lkp-server01.sh.intel.com (HELO db63a1be7222) ([10.239.97.150])
 by fmsmga001.fm.intel.com with ESMTP; 26 May 2022 23:44:18 -0700
Received: from kbuild by db63a1be7222 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nuThp-0004Uk-Cr;
 Fri, 27 May 2022 06:44:17 +0000
Date: Fri, 27 May 2022 14:43:30 +0800
From: kernel test robot <lkp@intel.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, robdclark@gmail.com,
 sean@poorly.run, swboyd@chromium.org, dianders@chromium.org,
 vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie,
 agross@kernel.org, dmitry.baryshkov@linaro.org, bjorn.andersson@linaro.org
Subject: Re: [PATCH v2] drm/msm/dp: force link training for display
 resolution change
Message-ID: <202205271424.ApfrMbAm-lkp@intel.com>
References: <1653606555-18675-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1653606555-18675-1-git-send-email-quic_khsieh@quicinc.com>
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
Cc: quic_sbillaka@quicinc.com, kbuild-all@lists.01.org,
 linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, quic_khsieh@quicinc.com,
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kuogee,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on drm/drm-next]
[also build test ERROR on next-20220526]
[cannot apply to v5.18]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Kuogee-Hsieh/drm-msm-dp-force-link-training-for-display-resolution-change/20220527-071202
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20220527/202205271424.ApfrMbAm-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/42816831cad7ced23cdedbb77ef2ebf13247c623
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Kuogee-Hsieh/drm-msm-dp-force-link-training-for-display-resolution-change/20220527-071202
        git checkout 42816831cad7ced23cdedbb77ef2ebf13247c623
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/gpu/drm/msm/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/gpu/drm/msm/dp/dp_ctrl.c: In function 'dp_ctrl_on_stream':
>> drivers/gpu/drm/msm/dp/dp_ctrl.c:1852:13: error: 'force_link_tarin' undeclared (first use in this function); did you mean 'force_link_train'?
    1852 |         if (force_link_tarin || !dp_ctrl_channel_eq_ok(ctrl))
         |             ^~~~~~~~~~~~~~~~
         |             force_link_train
   drivers/gpu/drm/msm/dp/dp_ctrl.c:1852:13: note: each undeclared identifier is reported only once for each function it appears in


vim +1852 drivers/gpu/drm/msm/dp/dp_ctrl.c

  1810	
  1811	int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl, bool force_link_train)
  1812	{
  1813		int ret = 0;
  1814		bool mainlink_ready = false;
  1815		struct dp_ctrl_private *ctrl;
  1816		unsigned long pixel_rate_orig;
  1817	
  1818		if (!dp_ctrl)
  1819			return -EINVAL;
  1820	
  1821		ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
  1822	
  1823		ctrl->dp_ctrl.pixel_rate = ctrl->panel->dp_mode.drm_mode.clock;
  1824	
  1825		pixel_rate_orig = ctrl->dp_ctrl.pixel_rate;
  1826		if (dp_ctrl->wide_bus_en)
  1827			ctrl->dp_ctrl.pixel_rate >>= 1;
  1828	
  1829		drm_dbg_dp(ctrl->drm_dev, "rate=%d, num_lanes=%d, pixel_rate=%d\n",
  1830			ctrl->link->link_params.rate,
  1831			ctrl->link->link_params.num_lanes, ctrl->dp_ctrl.pixel_rate);
  1832	
  1833		if (!dp_power_clk_status(ctrl->power, DP_CTRL_PM)) { /* link clk is off */
  1834			ret = dp_ctrl_enable_mainlink_clocks(ctrl);
  1835			if (ret) {
  1836				DRM_ERROR("Failed to start link clocks. ret=%d\n", ret);
  1837				goto end;
  1838			}
  1839		}
  1840	
  1841		ret = dp_ctrl_enable_stream_clocks(ctrl);
  1842		if (ret) {
  1843			DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
  1844			goto end;
  1845		}
  1846	
  1847		if (ctrl->link->sink_request & DP_TEST_LINK_PHY_TEST_PATTERN) {
  1848			dp_ctrl_send_phy_test_pattern(ctrl);
  1849			return 0;
  1850		}
  1851	
> 1852		if (force_link_tarin || !dp_ctrl_channel_eq_ok(ctrl))
  1853			dp_ctrl_link_retrain(ctrl);
  1854	
  1855		/* stop txing train pattern to end link training */
  1856		dp_ctrl_clear_training_pattern(ctrl);
  1857	
  1858		/*
  1859		 * Set up transfer unit values and set controller state to send
  1860		 * video.
  1861		 */
  1862		reinit_completion(&ctrl->video_comp);
  1863	
  1864		dp_ctrl_configure_source_params(ctrl);
  1865	
  1866		dp_catalog_ctrl_config_msa(ctrl->catalog,
  1867			ctrl->link->link_params.rate,
  1868			pixel_rate_orig, dp_ctrl_use_fixed_nvid(ctrl));
  1869	
  1870		dp_ctrl_setup_tr_unit(ctrl);
  1871	
  1872		dp_catalog_ctrl_state_ctrl(ctrl->catalog, DP_STATE_CTRL_SEND_VIDEO);
  1873	
  1874		ret = dp_ctrl_wait4video_ready(ctrl);
  1875		if (ret)
  1876			return ret;
  1877	
  1878		mainlink_ready = dp_catalog_ctrl_mainlink_ready(ctrl->catalog);
  1879		drm_dbg_dp(ctrl->drm_dev,
  1880			"mainlink %s\n", mainlink_ready ? "READY" : "NOT READY");
  1881	
  1882	end:
  1883		return ret;
  1884	}
  1885	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
