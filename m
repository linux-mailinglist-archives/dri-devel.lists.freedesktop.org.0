Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A9F4A039A
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 23:26:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18DE610E16A;
	Fri, 28 Jan 2022 22:26:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C797510E16A
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jan 2022 22:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643408767; x=1674944767;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=LapGqrb/shNRd/BNc1Z5g6f0GKlTsvQx7B1l+57jxmc=;
 b=jWH2zll6oaGP0+UAkxfzXrisi0vEmCb7JSb/lFKJJIvhKbYtQ5x701St
 o1i/qhTYamS6kl4bHpyODZqy2524+XcWfEEbzQMX8/6ZJQ5sSddk1iTDx
 P/eh+Im6ysed/dc/IKEqZw9SlKhcYZGPV/rH4o/lwnrDIyY8kvgM+Q6Ms
 vK0PSSLwAEbQzWeyRBc7FatIwr5emSRIiBVXQSlmoqbW2EIKtfhK8xEky
 0ivO4+T6nzQrgZhMy2lRM9ffeq4Ssex0wG/YwKc7eTJ1TxaKf865wrlFq
 OVda/NhNajhFV7DRU062NwmU0c21gboTLh728ZXms6PWF/IwKB8OmrYwa w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10241"; a="310520938"
X-IronPort-AV: E=Sophos;i="5.88,325,1635231600"; d="scan'208";a="310520938"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2022 14:26:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,325,1635231600"; d="scan'208";a="478429713"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by orsmga003.jf.intel.com with ESMTP; 28 Jan 2022 14:26:04 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nDZgy-000OOd-6L; Fri, 28 Jan 2022 22:26:04 +0000
Date: Sat, 29 Jan 2022 06:25:53 +0800
From: kernel test robot <lkp@intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 2/2] drm/imx/lcdc: Implement DRM driver for imx21
Message-ID: <202201290646.48sNgWm1-lkp@intel.com>
References: <20220128105849.368438-3-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220128105849.368438-3-u.kleine-koenig@pengutronix.de>
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
Cc: kbuild-all@lists.01.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi "Uwe,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on shawnguo/for-next]
[also build test ERROR on robh/for-next pza/reset/next v5.17-rc1 next-20220128]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Uwe-Kleine-K-nig/drm-imx-lcdc-drm-driver-for-imx21-25-27/20220128-190002
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git for-next
config: arc-randconfig-r012-20220128 (https://download.01.org/0day-ci/archive/20220129/202201290646.48sNgWm1-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/cba99931972f752a7b3105a3697b0cda88fe54d4
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Uwe-Kleine-K-nig/drm-imx-lcdc-drm-driver-for-imx21-25-27/20220128-190002
        git checkout cba99931972f752a7b3105a3697b0cda88fe54d4
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=arc distclean

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> scripts/Makefile.clean:15: drivers/gpu/drm/imx/imx21-lcdc/Makefile: No such file or directory
>> make[6]: *** No rule to make target 'drivers/gpu/drm/imx/imx21-lcdc/Makefile'.
   make[6]: Failed to remake makefile 'drivers/gpu/drm/imx/imx21-lcdc/Makefile'.
   make[5]: *** [scripts/Makefile.clean:68: drivers/gpu/drm/imx/imx21-lcdc] Error 2
   make[5]: Target '__clean' not remade because of errors.
   make[4]: *** [scripts/Makefile.clean:68: drivers/gpu/drm/imx] Error 2
   make[4]: Target '__clean' not remade because of errors.
   make[3]: *** [scripts/Makefile.clean:68: drivers/gpu/drm] Error 2
   make[3]: Target '__clean' not remade because of errors.
   make[2]: *** [scripts/Makefile.clean:68: drivers/gpu] Error 2
   make[2]: Target '__clean' not remade because of errors.
   make[1]: *** [Makefile:1838: _clean_drivers] Error 2
   make[1]: Target 'distclean' not remade because of errors.
   make: *** [Makefile:219: __sub-make] Error 2
   make: Target 'distclean' not remade because of errors.


vim +15 scripts/Makefile.clean

2315c6e4227815 Sam Ravnborg   2005-07-25  12  
2a691470345a00 Sam Ravnborg   2005-07-25  13  # The filename Kbuild has precedence over Makefile
db8c1a7b2ca25f Sam Ravnborg   2005-07-27  14  kbuild-dir := $(if $(filter /%,$(src)),$(src),$(srctree)/$(src))
db8c1a7b2ca25f Sam Ravnborg   2005-07-27 @15  include $(if $(wildcard $(kbuild-dir)/Kbuild), $(kbuild-dir)/Kbuild, $(kbuild-dir)/Makefile)
^1da177e4c3f41 Linus Torvalds 2005-04-16  16  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
