Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B31754EC00
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 23:06:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ABFF10EB47;
	Thu, 16 Jun 2022 21:06:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C81E810E7CC;
 Thu, 16 Jun 2022 21:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655413580; x=1686949580;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=WK2j77TFJ/70U37ZeB4rzHVUzdPEhxO1yxy3ztiMc/4=;
 b=TsDrAkC3ymJtbIriuDIrXYkmzS7EnbqUNK8pXgslS8QHoH+YDxN3yHEc
 DM6fXSZB3l6hy8lspHfD0x/hJGFXlTUYiBPkABRDlWhEx5hY1vnJdDDL9
 2jpbAQ8OGIzVd1jRUKYwKqe+AWIZZmeov6xmEmORzbUKeESslR4kSmT4j
 u3blMg4fN+s3TknfwPeEW7Ze/AtWCL/iONantGko/1tP72ioyNkOX+Hmt
 b/ED83T/ACvAv5lG/1MqCb8gKsDrVsSOkE7loKby74s1BvKHoznjr3Oht
 E6JVw0mNKYLdG/JIlYBRa1hveYA2r66K2gmHDdKNAeXgH2/cM9pck4pLe w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="276926349"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="276926349"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 14:06:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="619027433"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
 by orsmga001.jf.intel.com with ESMTP; 16 Jun 2022 14:06:15 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1o1wgw-000OmT-UJ;
 Thu, 16 Jun 2022 21:06:14 +0000
Date: Fri, 17 Jun 2022 05:06:10 +0800
From: kernel test robot <lkp@intel.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch,
 airlied@linux.ie, agross@kernel.org, dmitry.baryshkov@linaro.org,
 bjorn.andersson@linaro.org
Subject: Re: [PATCH v8 2/2] drm/msm/dp: clean up pixel_rate from dp_ctrl.c
Message-ID: <202206170505.2U1jLZVk-lkp@intel.com>
References: <1655399361-10842-3-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1655399361-10842-3-git-send-email-quic_khsieh@quicinc.com>
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
 Kuogee Hsieh <quic_khsieh@quicinc.com>, quic_aravindh@quicinc.com,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kuogee,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on drm-exynos/exynos-drm-next drm-tip/drm-tip linus/master v5.19-rc2 next-20220616]
[cannot apply to drm-intel/for-linux-next tegra-drm/drm/tegra/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Kuogee-Hsieh/force-link-training-for-display-resolution-change/20220617-011110
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20220617/202206170505.2U1jLZVk-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/b04f0b39a03a9fc3728e9414157f9d5f0b8b2366
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Kuogee-Hsieh/force-link-training-for-display-resolution-change/20220617-011110
        git checkout b04f0b39a03a9fc3728e9414157f9d5f0b8b2366
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/gpu/drm/msm/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/msm/dp/dp_ctrl.c:1587:5: warning: no previous prototype for 'dp_ctrl_on_stream_phy_test_report' [-Wmissing-prototypes]
    1587 | int dp_ctrl_on_stream_phy_test_report(struct dp_ctrl *dp_ctrl)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/dp_ctrl_on_stream_phy_test_report +1587 drivers/gpu/drm/msm/dp/dp_ctrl.c

  1586	
> 1587	int dp_ctrl_on_stream_phy_test_report(struct dp_ctrl *dp_ctrl)
  1588	{
  1589		int ret = 0;
  1590		struct dp_ctrl_private *ctrl;
  1591		unsigned long pixel_rate;
  1592	
  1593		ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
  1594	
  1595		pixel_rate = ctrl->panel->dp_mode.drm_mode.clock;
  1596		ret = dp_ctrl_enable_stream_clocks(ctrl, pixel_rate);
  1597		if (ret) {
  1598			DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
  1599			return ret;
  1600		}
  1601	
  1602		dp_ctrl_send_phy_test_pattern(ctrl);
  1603	
  1604		return 0;
  1605	}
  1606	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
