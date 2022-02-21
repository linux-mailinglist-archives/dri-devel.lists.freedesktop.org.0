Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A535E4BD34D
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 03:02:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB6DD10E23F;
	Mon, 21 Feb 2022 02:02:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E16310E23F
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 02:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645408928; x=1676944928;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ANe90PhVs2NvQulYttBv9SXSMOH6MXgAMcwZn2L7kYA=;
 b=Dc8R8DdnZdYwZE4ABa9C+CPgEqjBz8uBpdBbJCEmtl3/y+Gvc0vsT9QE
 IICDNAfdBBpg3qQzY7Iu/XCycm+rPRYuUCTRPwMLR7Dj23aqiW2zYQ9QY
 jbV+XaafUbhcki0q/dgp75A6fzwinVevb20UVNiWjuFNaLRoFnTLXuRjt
 PcIYyJviB3/WpaLhqUW1V6+OMbRSF0Bgbi+UbcebO4K2OVlGPZl1G9vjy
 D7BVQVzlM8L7hbgJ6ZZ3IsbGPrj/+N5Qsev1Iahkx47kStt1bBiuM7aKX
 2PVyWot8ri0JU1EES0Zyl/MXEg034iFBAeb12Iptb6C/4JApX+Uq6h7Da Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10264"; a="251367101"
X-IronPort-AV: E=Sophos;i="5.88,384,1635231600"; d="scan'208";a="251367101"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2022 18:02:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,384,1635231600"; d="scan'208";a="590803938"
Received: from lkp-server01.sh.intel.com (HELO da3212ac2f54) ([10.239.97.150])
 by fmsmga008.fm.intel.com with ESMTP; 20 Feb 2022 18:02:02 -0800
Received: from kbuild by da3212ac2f54 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nLy1Z-0001AK-OW; Mon, 21 Feb 2022 02:02:01 +0000
Date: Mon, 21 Feb 2022 10:01:30 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>,
 tomba@kernel.org
Subject: Re: [PATCH] drm/omap: switch to drm_of_find_panel_or_bridge
Message-ID: <202202210942.gGqf3SNb-lkp@intel.com>
References: <20220220195212.1129437-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220220195212.1129437-1-jose.exposito89@gmail.com>
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
Cc: kbuild-all@lists.01.org, airlied@linux.ie, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 maxime@cerno.tech,
 =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi "José,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on drm/drm-next]
[also build test ERROR on v5.17-rc5 next-20220217]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Jos-Exp-sito/drm-omap-switch-to-drm_of_find_panel_or_bridge/20220221-035403
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: arm-randconfig-r022-20220220 (https://download.01.org/0day-ci/archive/20220221/202202210942.gGqf3SNb-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/0day-ci/linux/commit/9a465e2c1dba123efe08cf2f4a5ae11b07be4142
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Jos-Exp-sito/drm-omap-switch-to-drm_of_find_panel_or_bridge/20220221-035403
        git checkout 9a465e2c1dba123efe08cf2f4a5ae11b07be4142
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/omapdrm/dss/output.c:25:8: error: implicit declaration of function 'drm_of_find_panel_or_bridge' [-Werror,-Wimplicit-function-declaration]
           ret = drm_of_find_panel_or_bridge(out->dev->of_node, out->of_port, 0,
                 ^
   1 error generated.


vim +/drm_of_find_panel_or_bridge +25 drivers/gpu/drm/omapdrm/dss/output.c

    19	
    20	int omapdss_device_init_output(struct omap_dss_device *out,
    21				       struct drm_bridge *local_bridge)
    22	{
    23		int ret;
    24	
  > 25		ret = drm_of_find_panel_or_bridge(out->dev->of_node, out->of_port, 0,
    26						  &out->panel, &out->bridge);
    27		if (ret) {
    28			if (ret == -ENODEV) {
    29				dev_dbg(out->dev, "failed to find video sink\n");
    30				return 0;
    31			}
    32			goto error;
    33		}
    34	
    35		if (out->panel) {
    36			struct drm_bridge *bridge;
    37	
    38			bridge = drm_panel_bridge_add(out->panel);
    39			if (IS_ERR(bridge)) {
    40				dev_err(out->dev,
    41					"unable to create panel bridge (%ld)\n",
    42					PTR_ERR(bridge));
    43				ret = PTR_ERR(bridge);
    44				goto error;
    45			}
    46	
    47			out->bridge = bridge;
    48		}
    49	
    50		if (local_bridge) {
    51			if (!out->bridge) {
    52				ret = -EPROBE_DEFER;
    53				goto error;
    54			}
    55	
    56			out->next_bridge = out->bridge;
    57			out->bridge = local_bridge;
    58		}
    59	
    60		if (!out->bridge) {
    61			ret = -EPROBE_DEFER;
    62			goto error;
    63		}
    64	
    65		return 0;
    66	
    67	error:
    68		omapdss_device_cleanup_output(out);
    69		return ret;
    70	}
    71	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
