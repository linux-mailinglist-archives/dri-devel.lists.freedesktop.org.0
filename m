Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F56476367
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 21:36:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E27010F86C;
	Wed, 15 Dec 2021 20:36:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FA8A10F86C
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 20:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639600580; x=1671136580;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=hunyGAa0xASiELB1C/3/BZUpwTc7F6peoAwd1eFU9eA=;
 b=Xz2Pxj5PDzvEVM51nYoNDfPmBsRgeGwX5LL2GXf/IoYY+1TXfoHnb2Qj
 W4SDMoREPh5XKjekNPEt3y0B7Kl4gmA7GmezI+1ZZxPNWbMw5gAwTOzyp
 p0BBgdrALp7rL/nbjoil10XhlkSSM9goiypjC6kGdUrOttiMpwZVIUOgT
 q7x+Pl0vOMnNnZv5j5O5gWuiDQ0nB9rpol+Xsnz1JxlnTpBRjCpIigcOB
 FnpUPsugyNB7EXEnIfHbeZPM5oc9A+LSZQaCkoA3trRJiTLW6ERhjr+ce
 TMnfLPtTBdn1hgQEb6ArdC+WOVk1txzTav3AFwjPreh3TzA6Rb7dvvwY/ g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10199"; a="239553614"
X-IronPort-AV: E=Sophos;i="5.88,209,1635231600"; d="scan'208";a="239553614"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 12:36:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,209,1635231600"; d="scan'208";a="464413491"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
 by orsmga003.jf.intel.com with ESMTP; 15 Dec 2021 12:36:17 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mxb0a-0002Ia-Q5; Wed, 15 Dec 2021 20:36:16 +0000
Date: Thu, 16 Dec 2021 04:35:33 +0800
From: kernel test robot <lkp@intel.com>
To: Xiang wangx <wangxiang@cdjrlc.com>, jyri.sarha@iki.fi
Subject: Re: [PATCH] drm/tilcdc: add const to of_device_id
Message-ID: <202112160411.sNrSELAY-lkp@intel.com>
References: <20211215161803.5900-1-wangxiang@cdjrlc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211215161803.5900-1-wangxiang@cdjrlc.com>
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
Cc: Xiang wangx <wangxiang@cdjrlc.com>, kbuild-all@lists.01.org,
 tomba@kernel.org, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Xiang,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on drm/drm-next]
[also build test ERROR on v5.16-rc5 next-20211214]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Xiang-wangx/drm-tilcdc-add-const-to-of_device_id/20211216-002326
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: arm-randconfig-c002-20211214 (https://download.01.org/0day-ci/archive/20211216/202112160411.sNrSELAY-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/5698eadb76d94a4fc5298f5bea88b839399ddef0
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Xiang-wangx/drm-tilcdc-add-const-to-of_device_id/20211216-002326
        git checkout 5698eadb76d94a4fc5298f5bea88b839399ddef0
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=arm SHELL=/bin/bash drivers/gpu/drm/tilcdc/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/tilcdc/tilcdc_drv.c:590:34: error: conflicting types for 'tilcdc_of_match'; have 'const struct of_device_id[]'
     590 | static const struct of_device_id tilcdc_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~
   drivers/gpu/drm/tilcdc/tilcdc_drv.c:63:28: note: previous declaration of 'tilcdc_of_match' with type 'struct of_device_id[]'
      63 | static struct of_device_id tilcdc_of_match[];
         |                            ^~~~~~~~~~~~~~~
   drivers/gpu/drm/tilcdc/tilcdc_drv.c:63:28: error: array 'tilcdc_of_match' assumed to have one element [-Werror]
>> drivers/gpu/drm/tilcdc/tilcdc_drv.c:63:28: error: 'tilcdc_of_match' defined but not used [-Werror=unused-variable]
   cc1: all warnings being treated as errors


vim +590 drivers/gpu/drm/tilcdc/tilcdc_drv.c

   589	
 > 590	static const struct of_device_id tilcdc_of_match[] = {
   591			{ .compatible = "ti,am33xx-tilcdc", },
   592			{ .compatible = "ti,da850-tilcdc", },
   593			{ },
   594	};
   595	MODULE_DEVICE_TABLE(of, tilcdc_of_match);
   596	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
