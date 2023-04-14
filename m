Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EEF6E1ACB
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 05:33:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05AA010E05F;
	Fri, 14 Apr 2023 03:33:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D796A10E10E
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 03:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681443201; x=1712979201;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=d9bYFb9mGWq+UdOaWT8JgAgu+2LDydqXaDPlXU6+OWU=;
 b=X6O5QM/v0CVXkL5n7sCUmespe1ETp4GjZqXpRjF/zrhqL5+x0ZULdo/P
 IfPWvwYU5NCoKZ2s8dwRED4qDK8azk0sXFn/X4g3mm8SWdYAdlX8EOl/Q
 4celeD5B29Rzck6d0UcnYgPb1w1A6oM/y/r1lj8e6eH+2++jpbRpn5tjj
 Nasih83DLqRoGepQzWrcBrxBZBau0Lt5srHQ2WW5mT+yR12yVs3yP9aJM
 r86Yxbk57/VU0VIxAXek5ZzuxAQ4h6BUokSDZqTi4S5HO1nnEsa7u3SCN
 OHRlGasBTqOMh0D0mC6B/sNPPIuK+0Miq0lQsp4/Mo2/X15ARIN2Geeuv Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="333137559"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; d="scan'208";a="333137559"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2023 20:33:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="833380646"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; d="scan'208";a="833380646"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
 by fmsmga001.fm.intel.com with ESMTP; 13 Apr 2023 20:33:13 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pnABU-000ZBh-2A;
 Fri, 14 Apr 2023 03:33:12 +0000
Date: Fri, 14 Apr 2023 11:32:29 +0800
From: kernel test robot <lkp@intel.com>
To: Jammy Huang <jammy_huang@aspeedtech.com>, airlied@redhat.com,
 tzimmermann@suse.de
Subject: Re: [PATCH] drm/ast: Fix long time waiting on s3/s4 resume
Message-ID: <202304141155.Hsgy2cN0-lkp@intel.com>
References: <20230414011147.3858-1-jammy_huang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230414011147.3858-1-jammy_huang@aspeedtech.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jammy,

kernel test robot noticed the following build errors:

[auto build test ERROR on e62252bc55b6d4eddc6c2bdbf95a448180d6a08d]

url:    https://github.com/intel-lab-lkp/linux/commits/Jammy-Huang/drm-ast-Fix-long-time-waiting-on-s3-s4-resume/20230414-091312
base:   e62252bc55b6d4eddc6c2bdbf95a448180d6a08d
patch link:    https://lore.kernel.org/r/20230414011147.3858-1-jammy_huang%40aspeedtech.com
patch subject: [PATCH] drm/ast: Fix long time waiting on s3/s4 resume
config: ia64-allyesconfig (https://download.01.org/0day-ci/archive/20230414/202304141155.Hsgy2cN0-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/120de3fe25a450d9918de8bc73a4fe079bc71d9c
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jammy-Huang/drm-ast-Fix-long-time-waiting-on-s3-s4-resume/20230414-091312
        git checkout 120de3fe25a450d9918de8bc73a4fe079bc71d9c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304141155.Hsgy2cN0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/ast/ast_dp.c:122:6: error: conflicting types for 'ast_dp_launch'; have 'void(struct drm_device *, u8)' {aka 'void(struct drm_device *, unsigned char)'}
     122 | void ast_dp_launch(struct drm_device *dev, u8 bPower)
         |      ^~~~~~~~~~~~~
   In file included from drivers/gpu/drm/ast/ast_dp.c:8:
   drivers/gpu/drm/ast/ast_drv.h:501:6: note: previous declaration of 'ast_dp_launch' with type 'void(struct drm_device *)'
     501 | void ast_dp_launch(struct drm_device *dev);
         |      ^~~~~~~~~~~~~


vim +122 drivers/gpu/drm/ast/ast_dp.c

594e9c04b5864b KuoHsiang Chou    2022-04-28  118  
594e9c04b5864b KuoHsiang Chou    2022-04-28  119  /*
594e9c04b5864b KuoHsiang Chou    2022-04-28  120   * Launch Aspeed DP
594e9c04b5864b KuoHsiang Chou    2022-04-28  121   */
594e9c04b5864b KuoHsiang Chou    2022-04-28 @122  void ast_dp_launch(struct drm_device *dev, u8 bPower)
594e9c04b5864b KuoHsiang Chou    2022-04-28  123  {
120de3fe25a450 Jammy Huang       2023-04-14  124  	u32 i = 0;
594e9c04b5864b KuoHsiang Chou    2022-04-28  125  	u8 bDPExecute = 1;
594e9c04b5864b KuoHsiang Chou    2022-04-28  126  	struct ast_private *ast = to_ast_private(dev);
594e9c04b5864b KuoHsiang Chou    2022-04-28  127  
594e9c04b5864b KuoHsiang Chou    2022-04-28  128  	// Wait one second then timeout.
594e9c04b5864b KuoHsiang Chou    2022-04-28  129  	while (ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xD1, COPROCESSOR_LAUNCH) !=
594e9c04b5864b KuoHsiang Chou    2022-04-28  130  		COPROCESSOR_LAUNCH) {
594e9c04b5864b KuoHsiang Chou    2022-04-28  131  		i++;
594e9c04b5864b KuoHsiang Chou    2022-04-28  132  		// wait 100 ms
594e9c04b5864b KuoHsiang Chou    2022-04-28  133  		msleep(100);
594e9c04b5864b KuoHsiang Chou    2022-04-28  134  
594e9c04b5864b KuoHsiang Chou    2022-04-28  135  		if (i >= 10) {
594e9c04b5864b KuoHsiang Chou    2022-04-28  136  			// DP would not be ready.
594e9c04b5864b KuoHsiang Chou    2022-04-28  137  			bDPExecute = 0;
594e9c04b5864b KuoHsiang Chou    2022-04-28  138  			break;
594e9c04b5864b KuoHsiang Chou    2022-04-28  139  		}
594e9c04b5864b KuoHsiang Chou    2022-04-28  140  	}
594e9c04b5864b KuoHsiang Chou    2022-04-28  141  
120de3fe25a450 Jammy Huang       2023-04-14  142  	if (!bDPExecute)
120de3fe25a450 Jammy Huang       2023-04-14  143  		drm_err(dev, "Wait DPMCU executing timeout\n");
594e9c04b5864b KuoHsiang Chou    2022-04-28  144  
594e9c04b5864b KuoHsiang Chou    2022-04-28  145  	ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xE5,
594e9c04b5864b KuoHsiang Chou    2022-04-28  146  			       (u8) ~ASTDP_HOST_EDID_READ_DONE_MASK,
594e9c04b5864b KuoHsiang Chou    2022-04-28  147  			       ASTDP_HOST_EDID_READ_DONE);
7f35680ada234c Thomas Zimmermann 2022-06-07  148  }
594e9c04b5864b KuoHsiang Chou    2022-04-28  149  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
