Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C00249E084
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 12:18:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4609510EEAF;
	Thu, 27 Jan 2022 11:17:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 063C810EEAF
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 11:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643282277; x=1674818277;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Ykv1WCQR8kOoFFZlF6ZKp4zk3VTUIsHHKg1EwefQ6T8=;
 b=j+bI8TNb67qIL6eynJT42BDHSgVgYoVEK/a+oYFAIqP2eDrKKjJ53uJS
 li2nHPu2clUQGtMTqa0BFsC+UjBECBiiWc4i4dbdYzeB/mLLlYfqffxGI
 gR9OEeeMZqizvcxOLWLd6eftQVDBegkRV1TOEErMbSF8/mtZB+ENMG+c4
 9n/vxxHnQEL9cNRlWYObKIK77CoHglo7RsKylUREpRZGsJMWIWb+yTWjY
 Tfe8hYyi05dA0BAnC2MpQkNVMPpuH6Bb+c9eNrnk9ADVCIJvWLpBaIC/U
 brF8Ct7Ty8dXKBGfGQiDsiWPvyzli0cK6XjjLdmnMaVldguoTtevygf5+ w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="244422660"
X-IronPort-AV: E=Sophos;i="5.88,320,1635231600"; d="scan'208";a="244422660"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2022 03:17:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,320,1635231600"; d="scan'208";a="696604870"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by orsmga005.jf.intel.com with ESMTP; 27 Jan 2022 03:17:54 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nD2mn-000MXe-Vv; Thu, 27 Jan 2022 11:17:53 +0000
Date: Thu, 27 Jan 2022 19:17:03 +0800
From: kernel test robot <lkp@intel.com>
To: Francesco Dolcini <francesco.dolcini@toradex.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v1] drm/panel: simple: Tune timing for ET057090DHU
Message-ID: <202201271923.eBYUUA3X-lkp@intel.com>
References: <20220126165506.222331-1-francesco.dolcini@toradex.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220126165506.222331-1-francesco.dolcini@toradex.com>
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
Cc: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>, kbuild-all@lists.01.org,
 Francesco Dolcini <francesco.dolcini@toradex.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Francesco,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on drm/drm-next]
[also build test ERROR on v5.17-rc1 next-20220127]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Francesco-Dolcini/drm-panel-simple-Tune-timing-for-ET057090DHU/20220127-153123
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: ia64-allmodconfig (https://download.01.org/0day-ci/archive/20220127/202201271923.eBYUUA3X-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/db3299763c5ae747c148fc1d85af84f9360189fc
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Francesco-Dolcini/drm-panel-simple-Tune-timing-for-ET057090DHU/20220127-153123
        git checkout db3299763c5ae747c148fc1d85af84f9360189fc
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/gpu/drm/panel/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/panel/panel-simple.c:1607:10: error: 'const struct drm_display_mode' has no member named 'vrefresh'
    1607 |         .vrefresh = 60,
         |          ^~~~~~~~


vim +1607 drivers/gpu/drm/panel/panel-simple.c

  1596	
  1597	static const struct drm_display_mode edt_et057090dhu_mode = {
  1598		.clock = 25175,
  1599		.hdisplay = 640,
  1600		.hsync_start = 640 + 16,
  1601		.hsync_end = 640 + 16 + 48,
  1602		.htotal = 640 + 16 + 48 + 96,
  1603		.vdisplay = 480,
  1604		.vsync_start = 480 + 10,
  1605		.vsync_end = 480 + 10 + 2,
  1606		.vtotal = 480 + 10 + 2 + 33,
> 1607		.vrefresh = 60,
  1608		.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
  1609	};
  1610	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
