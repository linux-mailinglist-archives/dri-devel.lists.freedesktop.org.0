Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98721517957
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 23:41:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60F3510EF3D;
	Mon,  2 May 2022 21:41:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56E9210EEF8
 for <dri-devel@lists.freedesktop.org>; Mon,  2 May 2022 21:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651527677; x=1683063677;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=whQ8TXX/TlgEcBTOl+OsYKGzR21rpHVKqhavg+yiwqk=;
 b=guLicNaehvd1Q3ekPqrtLU7byFswSv3yQC+ZhGw6BG8xHVtP3XIsjHb4
 Vv+Wlo4rMi/qZ3eIPWaCLJVV0G23WNkYaFX9mJlTJrkYjPxnyjtePvLbL
 0pcAJpcV2CW3c5SMiQJsqsqvCu9IPqFy4BMG80WTSbwYyn9KlAXWphit7
 ER68AtE4GGIY1E28jrut9TVTjn0iQHmnuD0Hz7P2CpW5TRMJJe+siV7dZ
 yD/WU2DpfybLVWxlNme7ukobwog4PtHeUcPqElH4cKar9AWtxyUdTTyEb
 bzJrdtuV3cB2Su6/wOigw+mbFp34U091diSCafZ9pIOyVN1w8Lu42peJa Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="266181861"
X-IronPort-AV: E=Sophos;i="5.91,193,1647327600"; d="scan'208";a="266181861"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2022 14:41:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,193,1647327600"; d="scan'208";a="631255792"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
 by fmsmga004.fm.intel.com with ESMTP; 02 May 2022 14:41:14 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nldn8-0009ta-8F;
 Mon, 02 May 2022 21:41:14 +0000
Date: Tue, 3 May 2022 05:40:53 +0800
From: kernel test robot <lkp@intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] drm: Allow simpledrm to setup its emulated FB as
 firmware provided
Message-ID: <202205030522.Y2Nq4tz7-lkp@intel.com>
References: <20220502153900.408522-4-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220502153900.408522-4-javierm@redhat.com>
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
Cc: kbuild-all@lists.01.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 llvm@lists.linux.dev, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier,

I love your patch! Yet something to improve:

[auto build test ERROR on drm/drm-next]
[also build test ERROR on shawnguo/for-next linus/master linux/master v5.18-rc5 next-20220502]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Javier-Martinez-Canillas/drm-Allow-simpledrm-to-setup-its-emulated-FB-as-firmware-provided/20220502-234145
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: hexagon-randconfig-r045-20220501 (https://download.01.org/0day-ci/archive/20220503/202205030522.Y2Nq4tz7-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 09325d36061e42b495d1f4c7e933e260eac260ed)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/28ef46724e385165777a21d9f661188fa2577a1e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Javier-Martinez-Canillas/drm-Allow-simpledrm-to-setup-its-emulated-FB-as-firmware-provided/20220502-234145
        git checkout 28ef46724e385165777a21d9f661188fa2577a1e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/gpu/drm/tiny/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/tiny/simpledrm.c:904:31: error: call to undeclared function 'DRM_FB_SET_OPTION'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           drm_fbdev_generic_setup(dev, DRM_FB_SET_OPTION(DRM_FB_FW, 1));
                                        ^
>> drivers/gpu/drm/tiny/simpledrm.c:904:49: error: use of undeclared identifier 'DRM_FB_FW'
           drm_fbdev_generic_setup(dev, DRM_FB_SET_OPTION(DRM_FB_FW, 1));
                                                          ^
   2 errors generated.


vim +/DRM_FB_SET_OPTION +904 drivers/gpu/drm/tiny/simpledrm.c

   884	
   885	/*
   886	 * Platform driver
   887	 */
   888	
   889	static int simpledrm_probe(struct platform_device *pdev)
   890	{
   891		struct simpledrm_device *sdev;
   892		struct drm_device *dev;
   893		int ret;
   894	
   895		sdev = simpledrm_device_create(&simpledrm_driver, pdev);
   896		if (IS_ERR(sdev))
   897			return PTR_ERR(sdev);
   898		dev = &sdev->dev;
   899	
   900		ret = drm_dev_register(dev, 0);
   901		if (ret)
   902			return ret;
   903	
 > 904		drm_fbdev_generic_setup(dev, DRM_FB_SET_OPTION(DRM_FB_FW, 1));
   905	
   906		return 0;
   907	}
   908	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
