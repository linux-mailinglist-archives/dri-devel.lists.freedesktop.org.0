Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0424A027D
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 22:04:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4E9810E11C;
	Fri, 28 Jan 2022 21:04:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 864DE10E11C
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jan 2022 21:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643403847; x=1674939847;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=SNvLCqfcZM2KLMjbSsNE8wsk30HgtXVLn4ERV+eBhwA=;
 b=jAs13UCl7UPJTQxJoiMH+cClxwhQHhP8fpWHDT2hjvZ1rMLlUGu86GoY
 2WLUiKTfHNr4k0R8IYnGCsYO+20+Xy1JU87V1t69aohjh2SuFlh3o0Cpk
 k59lma9Co98IbOjkgh1SgFXMO02mSMRoAyVyvu9TJsEs1gqdRqpg+b0ME
 sAZR3SsMiO5KiVZZMD3nXGdfMbspnoKSamONqiVacGhCRGCKaTPDvwfFr
 6Md+asDndT43K/c61L1sOARGzeB5d4Wj5oiC6xpY18W13MC/OeptRgSpZ
 aWE3IN+EGcXTuQd9yKH9VIVRvPGcYLEYMqxHWn/20RdytyLjec3YbaBw3 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10241"; a="333550471"
X-IronPort-AV: E=Sophos;i="5.88,324,1635231600"; d="scan'208";a="333550471"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2022 13:04:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,324,1635231600"; d="scan'208";a="697218045"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by orsmga005.jf.intel.com with ESMTP; 28 Jan 2022 13:04:02 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nDYPa-000OJv-6p; Fri, 28 Jan 2022 21:04:02 +0000
Date: Sat, 29 Jan 2022 05:03:18 +0800
From: kernel test robot <lkp@intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 2/2] drm/imx/lcdc: Implement DRM driver for imx21
Message-ID: <202201290246.pin2pNs4-lkp@intel.com>
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
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20220129/202201290246.pin2pNs4-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/cba99931972f752a7b3105a3697b0cda88fe54d4
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Uwe-Kleine-K-nig/drm-imx-lcdc-drm-driver-for-imx21-25-27/20220128-190002
        git checkout cba99931972f752a7b3105a3697b0cda88fe54d4
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> scripts/Makefile.build:44: drivers/gpu/drm/imx/imx21-lcdc/Makefile: No such file or directory
>> make[6]: *** No rule to make target 'drivers/gpu/drm/imx/imx21-lcdc/Makefile'.
   make[6]: Failed to remake makefile 'drivers/gpu/drm/imx/imx21-lcdc/Makefile'.


vim +44 scripts/Makefile.build

20a468b51325b3 Sam Ravnborg   2006-01-22  40  
2a691470345a00 Sam Ravnborg   2005-07-25  41  # The filename Kbuild has precedence over Makefile
db8c1a7b2ca25f Sam Ravnborg   2005-07-27  42  kbuild-dir := $(if $(filter /%,$(src)),$(src),$(srctree)/$(src))
0c53c8e6eb456c Sam Ravnborg   2007-10-14  43  kbuild-file := $(if $(wildcard $(kbuild-dir)/Kbuild),$(kbuild-dir)/Kbuild,$(kbuild-dir)/Makefile)
0c53c8e6eb456c Sam Ravnborg   2007-10-14 @44  include $(kbuild-file)
^1da177e4c3f41 Linus Torvalds 2005-04-16  45  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
