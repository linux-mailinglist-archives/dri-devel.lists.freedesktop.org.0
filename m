Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A95E50854C
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 11:58:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F3B010E76F;
	Wed, 20 Apr 2022 09:58:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDC3189294
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 09:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650448700; x=1681984700;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=trrHFL7bIpVdCRcSGzbp0komwu6+rthAc9Zo3KrMj/o=;
 b=gPESC9sYS3wxXfnN8l1ZBVG8l87LX1ZAEK4H2e0jC8DmtgDyJ/uGE27q
 M0v5/6hxVE+Jas+s7Ymmv4Ub5Edc3s19hhRgom2b4tsIkoCEN+7SjkfHn
 DmIAI3/5Nigl4bjmOMBMNoDAB/SvML3cahGogMvikSOyWYr/odtECiIK1
 5dZ2iXCYHGM5/SuuKfXBL5wmY2vS/U9mELmC8Yp3H+jcoRNGTtGphl2gG
 iD20ia/2wSywSNebzHSIYGWyFz9eLGwl/7Kl31jUSkbhIFXPz9ynA+Mpn
 Dly0fsxE5PXxcNcWzNvAvcNItzjX0Ir4UZziOheaOrXRc9NScrYAycm9Q w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10322"; a="324430710"
X-IronPort-AV: E=Sophos;i="5.90,275,1643702400"; d="scan'208";a="324430710"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2022 02:58:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,275,1643702400"; d="scan'208";a="562049243"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
 by fmsmga007.fm.intel.com with ESMTP; 20 Apr 2022 02:58:17 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nh76G-0006qx-IU;
 Wed, 20 Apr 2022 09:58:16 +0000
Date: Wed, 20 Apr 2022 17:57:43 +0800
From: kernel test robot <lkp@intel.com>
To: Cai Huoqing <cai.huoqing@linux.dev>
Subject: Re: [PATCH 2/2] drm/nvdla: Add driver support for NVDLA
Message-ID: <202204201710.5Gcg1PUu-lkp@intel.com>
References: <20220419135908.39606-3-cai.huoqing@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220419135908.39606-3-cai.huoqing@linux.dev>
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
Cc: kbuild-all@lists.01.org, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Cai,

I love your patch! Yet something to improve:

[auto build test ERROR on drm/drm-next]
[also build test ERROR on drm-intel/for-linux-next drm-tip/drm-tip linus/master v5.18-rc3 next-20220419]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Cai-Huoqing/drm-nvdla-Add-driver-support-for-NVDLA/20220419-220255
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20220420/202204201710.5Gcg1PUu-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/7539e5487eb7d0c6f13c03bba596e51a2238106d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Cai-Huoqing/drm-nvdla-Add-driver-support-for-NVDLA/20220419-220255
        git checkout 7539e5487eb7d0c6f13c03bba596e51a2238106d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> make[5]: *** No rule to make target 'drivers/gpu/drm/nvdla/nvdla_engine_data.o', needed by 'drivers/gpu/drm/nvdla/nvdla-drm.o'.
>> make[5]: *** No rule to make target 'drivers/gpu/drm/nvdla/nvdla_engine_debug.o', needed by 'drivers/gpu/drm/nvdla/nvdla-drm.o'.
   make[5]: Target '__build' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
