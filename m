Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F87569707
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 02:50:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21E3110E0FA;
	Thu,  7 Jul 2022 00:50:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F38D010E77D;
 Thu,  7 Jul 2022 00:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657155022; x=1688691022;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=z2kn5UrzMsmmqcJPLc55lis3ovPPGrDP2druIwjVJGI=;
 b=nRcoRGR7kYB4Cg6YeIhnkJSQbzP82ukn/Qh/mhJj5/zCPI96fS+PaiBH
 m64MTQy8AviPBnc1089/KYGJkTcc9PBSiH7H3bkeMcSNs4MvvwEIweM+n
 ethf8VQaX/IJDbCjsN0/3XmXsy9RLrsxNqEohsBcJJAZ2hoi4NgEyB5Xi
 6dgObVhknoJZjPKLiJVBhUyDR18MR6yH0HwKaez+8AcyoiWAj6eNyD147
 k/LGbXzk9JURXH5/IvOsiq4KUCvTxadGJCc+W+Y8FbBtAOn7AYhdlh/fe
 Rmfj98eMAoGX0FHsA87SZr3ZsmUWfxdC9wjC07w9Y/n79z2n7xAqQVZtT A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10400"; a="266929783"
X-IronPort-AV: E=Sophos;i="5.92,251,1650956400"; d="scan'208";a="266929783"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2022 17:50:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,251,1650956400"; d="scan'208";a="626111711"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
 by orsmga001.jf.intel.com with ESMTP; 06 Jul 2022 17:50:18 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1o9Fij-000LL4-Iq;
 Thu, 07 Jul 2022 00:50:17 +0000
Date: Thu, 7 Jul 2022 08:50:11 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH] drm/msm/dsi: switch to DRM_PANEL_BRIDGE
Message-ID: <202207070852.WWBrOFY1-lkp@intel.com>
References: <20220706200237.2118303-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220706200237.2118303-1-dmitry.baryshkov@linaro.org>
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
Cc: kbuild-all@lists.01.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

I love your patch! Yet something to improve:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on linus/master v5.19-rc5 next-20220706]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Baryshkov/drm-msm-dsi-switch-to-DRM_PANEL_BRIDGE/20220707-040414
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
config: arc-randconfig-r043-20220706 (https://download.01.org/0day-ci/archive/20220707/202207070852.WWBrOFY1-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/5eeb41ba36c536b30a6494df55ed441f005a6b11
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Dmitry-Baryshkov/drm-msm-dsi-switch-to-DRM_PANEL_BRIDGE/20220707-040414
        git checkout 5eeb41ba36c536b30a6494df55ed441f005a6b11
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash drivers/gpu/drm/msm/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   drivers/gpu/drm/msm/dsi/dsi_host.c: In function 'msm_dsi_host_modeset_init':
>> drivers/gpu/drm/msm/dsi/dsi_host.c:2159:17: error: implicit declaration of function 'msm_dsi_host_get_panel'; did you mean 'msm_dsi_host_get_bridge'? [-Werror=implicit-function-declaration]
    2159 |         panel = msm_dsi_host_get_panel(&msm_host->base);
         |                 ^~~~~~~~~~~~~~~~~~~~~~
         |                 msm_dsi_host_get_bridge
>> drivers/gpu/drm/msm/dsi/dsi_host.c:2159:15: warning: assignment to 'struct drm_panel *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    2159 |         panel = msm_dsi_host_get_panel(&msm_host->base);
         |               ^
   cc1: some warnings being treated as errors


vim +2159 drivers/gpu/drm/msm/dsi/dsi_host.c

a689554ba6ed81c Hai Li      2015-03-31  2149  
a689554ba6ed81c Hai Li      2015-03-31  2150  int msm_dsi_host_modeset_init(struct mipi_dsi_host *host,
a689554ba6ed81c Hai Li      2015-03-31  2151  					struct drm_device *dev)
a689554ba6ed81c Hai Li      2015-03-31  2152  {
a689554ba6ed81c Hai Li      2015-03-31  2153  	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
8f7ca5409063ade Sibi Sankar 2018-05-29  2154  	const struct msm_dsi_cfg_handler *cfg_hnd = msm_host->cfg_hnd;
0f40ba48de3b8a4 Vinod Koul  2022-04-06  2155  	struct drm_panel *panel;
a689554ba6ed81c Hai Li      2015-03-31  2156  	int ret;
a689554ba6ed81c Hai Li      2015-03-31  2157  
a689554ba6ed81c Hai Li      2015-03-31  2158  	msm_host->dev = dev;
0f40ba48de3b8a4 Vinod Koul  2022-04-06 @2159  	panel = msm_dsi_host_get_panel(&msm_host->base);
0f40ba48de3b8a4 Vinod Koul  2022-04-06  2160  
0f40ba48de3b8a4 Vinod Koul  2022-04-06  2161  	if (!IS_ERR(panel) && panel->dsc) {
0f40ba48de3b8a4 Vinod Koul  2022-04-06  2162  		struct msm_display_dsc_config *dsc = msm_host->dsc;
0f40ba48de3b8a4 Vinod Koul  2022-04-06  2163  
0f40ba48de3b8a4 Vinod Koul  2022-04-06  2164  		if (!dsc) {
0f40ba48de3b8a4 Vinod Koul  2022-04-06  2165  			dsc = devm_kzalloc(&msm_host->pdev->dev, sizeof(*dsc), GFP_KERNEL);
0f40ba48de3b8a4 Vinod Koul  2022-04-06  2166  			if (!dsc)
0f40ba48de3b8a4 Vinod Koul  2022-04-06  2167  				return -ENOMEM;
0f40ba48de3b8a4 Vinod Koul  2022-04-06  2168  			dsc->drm = panel->dsc;
0f40ba48de3b8a4 Vinod Koul  2022-04-06  2169  			msm_host->dsc = dsc;
0f40ba48de3b8a4 Vinod Koul  2022-04-06  2170  		}
0f40ba48de3b8a4 Vinod Koul  2022-04-06  2171  	}
0f40ba48de3b8a4 Vinod Koul  2022-04-06  2172  
8f7ca5409063ade Sibi Sankar 2018-05-29  2173  	ret = cfg_hnd->ops->tx_buf_alloc(msm_host, SZ_4K);
a689554ba6ed81c Hai Li      2015-03-31  2174  	if (ret) {
a689554ba6ed81c Hai Li      2015-03-31  2175  		pr_err("%s: alloc tx gem obj failed, %d\n", __func__, ret);
a689554ba6ed81c Hai Li      2015-03-31  2176  		return ret;
a689554ba6ed81c Hai Li      2015-03-31  2177  	}
a689554ba6ed81c Hai Li      2015-03-31  2178  
a689554ba6ed81c Hai Li      2015-03-31  2179  	return 0;
a689554ba6ed81c Hai Li      2015-03-31  2180  }
a689554ba6ed81c Hai Li      2015-03-31  2181  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
