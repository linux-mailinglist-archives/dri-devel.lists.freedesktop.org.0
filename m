Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 932FD48E84E
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 11:24:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD3EF10E29A;
	Fri, 14 Jan 2022 10:24:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B23710E71D
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 10:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642155880; x=1673691880;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=lOhSjY4Ou3GeioAf8r0xF7ihXmhvtSs1PT+P9YKsQms=;
 b=A/Qhzr/890uZb3AkG31oJuAnFzC2iU5YFKkXRHSvD6dKG3fDmZxcAy9Y
 GJ1uDG7HnUtq9wC5mPfc4/754pACmduTQ7x/sH9yfkhsqypfMkI0UUBUp
 w5QfhTigV+LP4DOhE+NVmVVXK/CsDSqSA7U4S1SCrsjD3b6gSFE7Le7tR
 LL7X2WX3ORHjpas0mVqZA1CfD9wR51hhf0FEMdb2VxO9WSiI6ONOK8sxn
 /bbKQCkZx8b0y07TP5NMTeprcsml/EzKo03/8gWG8G1BqE7j7HLaHz/Ne
 QoIApIQScxnogyH+BGoE9wkwyuQTQY704DnolTxkewoOO4dIyBJJjfX3E Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10226"; a="244018701"
X-IronPort-AV: E=Sophos;i="5.88,288,1635231600"; d="scan'208";a="244018701"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2022 02:24:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,288,1635231600"; d="scan'208";a="624282638"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by orsmga004.jf.intel.com with ESMTP; 14 Jan 2022 02:24:37 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1n8Jl7-0008P5-7G; Fri, 14 Jan 2022 10:24:37 +0000
Date: Fri, 14 Jan 2022 18:24:29 +0800
From: kernel test robot <lkp@intel.com>
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 12/14] drm: bridge: icn6211: Add I2C configuration support
Message-ID: <202201141818.0EmBjuCm-lkp@intel.com>
References: <20220114034838.546267-12-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220114034838.546267-12-marex@denx.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Marek Vasut <marex@denx.de>, kbuild-all@lists.01.org,
 Robert Foss <robert.foss@linaro.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on drm-intel/for-linux-next drm-exynos/exynos-drm-next tegra-drm/drm/tegra/for-next v5.16 next-20220114]
[cannot apply to drm-tip/drm-tip airlied/drm-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Marek-Vasut/drm-bridge-icn6211-Fix-register-layout/20220114-115112
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: h8300-buildonly-randconfig-r001-20220113 (https://download.01.org/0day-ci/archive/20220114/202201141818.0EmBjuCm-lkp@intel.com/config)
compiler: h8300-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/730ece8a3c97460eaf81603bc246cd631d1f7461
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Marek-Vasut/drm-bridge-icn6211-Fix-register-layout/20220114-115112
        git checkout 730ece8a3c97460eaf81603bc246cd631d1f7461
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=h8300 SHELL=/bin/bash drivers/gpu/drm/bridge/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/bridge/chipone-icn6211.c: In function 'chipone_attach':
>> drivers/gpu/drm/bridge/chipone-icn6211.c:454:28: warning: variable 'abridge' set but not used [-Wunused-but-set-variable]
     454 |         struct drm_bridge *abridge = bridge;
         |                            ^~~~~~~


vim +/abridge +454 drivers/gpu/drm/bridge/chipone-icn6211.c

   450	
   451	static int chipone_attach(struct drm_bridge *bridge, enum drm_bridge_attach_flags flags)
   452	{
   453		struct chipone *icn = bridge_to_chipone(bridge);
 > 454		struct drm_bridge *abridge = bridge;
   455		int ret;
   456	
   457		if (icn->interface_i2c) {
   458			ret = chipone_dsi_setup(icn);
   459			if (ret)
   460				return ret;
   461	
   462			abridge = &icn->bridge;
   463		}
   464	
   465		return drm_bridge_attach(bridge->encoder, icn->panel_bridge,
   466					 bridge, flags);
   467	}
   468	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
