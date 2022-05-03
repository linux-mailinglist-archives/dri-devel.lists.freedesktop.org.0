Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9267B517B5B
	for <lists+dri-devel@lfdr.de>; Tue,  3 May 2022 03:06:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 722F910E0A4;
	Tue,  3 May 2022 01:06:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4459310E0A4
 for <dri-devel@lists.freedesktop.org>; Tue,  3 May 2022 01:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651539972; x=1683075972;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=xcX7ZSUlfJN5lM63F+DM0r69oVAMDHJEKRwiRlW4Bp8=;
 b=f0RW/s1X5WmbhNWUSEcg0UmwC+l1ZJ7eORjf9GHi8XVNM1O+a9CGFQtK
 xmqza6nGCt6MdHHQ219Dp1OBrKySUJM8YOK/65syoDacSw7kDGwX6i1lG
 e+py+bByOKRtbaeiDCe9szYCm6s8GfAi+AaN3GCujBk89Hw4MK89zKWsc
 /6PdZGVcKOWzty6BkbJ02vcbeMSGZE6gQcAkQDHVYNQLZ8kElcOtrse58
 YT8Ju2KUBbcoElogUK3DVl+qsxk6/m/FvzN4xGVCG+4npfsCUm57fcu/T
 /d/26Bhkn8yJx+gHDqAqBbkWbL5t0W/nw2DbwEYSr1SpgT+GTKggtuFHf A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="247278560"
X-IronPort-AV: E=Sophos;i="5.91,193,1647327600"; d="scan'208";a="247278560"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2022 18:06:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,193,1647327600"; d="scan'208";a="546827160"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
 by orsmga002.jf.intel.com with ESMTP; 02 May 2022 18:06:09 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nlgzQ-000A1r-JU;
 Tue, 03 May 2022 01:06:08 +0000
Date: Tue, 3 May 2022 09:05:34 +0800
From: kernel test robot <lkp@intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] drm: Allow simpledrm to setup its emulated FB as
 firmware provided
Message-ID: <202205030810.VwAEOAqj-lkp@intel.com>
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
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
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
config: x86_64-randconfig-a011 (https://download.01.org/0day-ci/archive/20220503/202205030810.VwAEOAqj-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/28ef46724e385165777a21d9f661188fa2577a1e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Javier-Martinez-Canillas/drm-Allow-simpledrm-to-setup-its-emulated-FB-as-firmware-provided/20220502-234145
        git checkout 28ef46724e385165777a21d9f661188fa2577a1e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/gpu/drm/tiny/simpledrm.c: In function 'simpledrm_probe':
>> drivers/gpu/drm/tiny/simpledrm.c:904:38: error: implicit declaration of function 'DRM_FB_SET_OPTION'; did you mean 'DRM_FB_GET_OPTION'? [-Werror=implicit-function-declaration]
     904 |         drm_fbdev_generic_setup(dev, DRM_FB_SET_OPTION(DRM_FB_FW, 1));
         |                                      ^~~~~~~~~~~~~~~~~
         |                                      DRM_FB_GET_OPTION
>> drivers/gpu/drm/tiny/simpledrm.c:904:56: error: 'DRM_FB_FW' undeclared (first use in this function)
     904 |         drm_fbdev_generic_setup(dev, DRM_FB_SET_OPTION(DRM_FB_FW, 1));
         |                                                        ^~~~~~~~~
   drivers/gpu/drm/tiny/simpledrm.c:904:56: note: each undeclared identifier is reported only once for each function it appears in
   cc1: some warnings being treated as errors


vim +904 drivers/gpu/drm/tiny/simpledrm.c

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
