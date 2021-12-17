Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 234E94790CF
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 16:59:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E320F10E58F;
	Fri, 17 Dec 2021 15:59:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDBA210E58F
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 15:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639756769; x=1671292769;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=spt2TZS4capHt+wzFhSAQnCBn7Fh2qkwHcRnr0zaM0U=;
 b=L+K3MxFQsk7oWNUtByVItObAe+FVtfNL+ZMbHhUOhhmBzEicF7pOG1cP
 8L0kIj5EA9fwLUovC29L2bHTur46E4/Fm9Vw0j8rR9Ad/Sv6qGEpP8RT1
 dQZyKb4gxWm8tOsxCT8ceUrfKbbM04poxVwmQHItVjziHXNgnZQSubEPw
 5KfFZQYNf6TVchWVBYHeeH7k/oj6pPmUHZ7XRf5qQTUku+ZDbU+WE7BTg
 WC3BAHTenVrb5oEuS5NQEcN8RoLoxR+1BM4A+yxhDverM3jelpo7OoquB
 bhEIynpfYh9nHkKdHrHMvh/8aOp/pmmX4rs4Wjc0RR4HWZD+HDj2zpx32 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10201"; a="240000444"
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; d="scan'208";a="240000444"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2021 07:59:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; d="scan'208";a="465158376"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
 by orsmga003.jf.intel.com with ESMTP; 17 Dec 2021 07:59:18 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1myFdd-0004tT-Gh; Fri, 17 Dec 2021 15:59:17 +0000
Date: Fri, 17 Dec 2021 23:58:28 +0800
From: kernel test robot <lkp@intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 10/37] drm/imx/dcss: Use drm_module_platform_driver()
 to register the driver
Message-ID: <202112172338.SdP9K7tX-lkp@intel.com>
References: <20211217003752.3946210-11-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211217003752.3946210-11-javierm@redhat.com>
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
Cc: kbuild-all@lists.01.org, Javier Martinez Canillas <javierm@redhat.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier,

I love your patch! Yet something to improve:

[auto build test ERROR on next-20211215]
[also build test ERROR on v5.16-rc5]
[cannot apply to drm/drm-next shawnguo/for-next pinchartl-media/drm/du/next drm-exynos/exynos-drm-next v5.16-rc5 v5.16-rc4 v5.16-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Javier-Martinez-Canillas/drm-Make-drivers-to-honour-the-nomodeset-parameter/20211217-084031
base:    93bf6eee76c0e716f6b32de690b1c52991547bb4
config: arm64-randconfig-r034-20211216 (https://download.01.org/0day-ci/archive/20211217/202112172338.SdP9K7tX-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/c7b8e02dcec35660bbc9101ae0c1db11e5f7d1ab
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Javier-Martinez-Canillas/drm-Make-drivers-to-honour-the-nomodeset-parameter/20211217-084031
        git checkout c7b8e02dcec35660bbc9101ae0c1db11e5f7d1ab
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/gpu/drm/imx/dcss/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

>> drivers/gpu/drm/imx/dcss/dcss-drv.c:134:1: warning: data definition has no type or storage class
     134 | drm_module_platform_driver(dcss_platform_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/imx/dcss/dcss-drv.c:134:1: error: type defaults to 'int' in declaration of 'drm_module_platform_driver' [-Werror=implicit-int]
>> drivers/gpu/drm/imx/dcss/dcss-drv.c:134:1: warning: parameter names (without types) in function declaration
   drivers/gpu/drm/imx/dcss/dcss-drv.c:124:31: warning: 'dcss_platform_driver' defined but not used [-Wunused-variable]
     124 | static struct platform_driver dcss_platform_driver = {
         |                               ^~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +134 drivers/gpu/drm/imx/dcss/dcss-drv.c

   133	
 > 134	drm_module_platform_driver(dcss_platform_driver);
   135	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
