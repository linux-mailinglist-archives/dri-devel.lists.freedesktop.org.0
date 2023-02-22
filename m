Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF1169EC00
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 01:33:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 292C910E1A4;
	Wed, 22 Feb 2023 00:33:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E1CF10E1A4
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Feb 2023 00:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677026034; x=1708562034;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=HZ7qV3HJaxeC6qoErnEzrOph34gANnvwZmAucwmNMZU=;
 b=jVgaEnd2S9HM0X2w5Q6nHif5y2CuMjvNXa4DiqmtoXPUEDNbAmFtS63k
 XMjMJiKbXoE3vm4J3sozE50Oeo2OP1ESLojww66xMh8tVroKkttscJcW6
 ht+YFqgE2S/B41VwR3sKRyIwVGnAdyyiiDSa5lRo8VYVgqJCDbt8A1cIk
 ti2DHWbOULICUNH2yiWtTXxKy/geoOc0tfjrMHrTTctodXWpS6ek+zAn+
 WtuWZ78hu1y7mvrShZiL6X6sd7x+fRl60HEdYNwdHEOtCvPu1ORd+dfUb
 E8APgFXcCq6+VD5ALREoHNImrbJnEBLy9zLkCX7U24ckgBgL9a3UXitKL g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="334158638"
X-IronPort-AV: E=Sophos;i="5.97,317,1669104000"; d="scan'208";a="334158638"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 16:33:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="781201446"
X-IronPort-AV: E=Sophos;i="5.97,317,1669104000"; d="scan'208";a="781201446"
Received: from lkp-server01.sh.intel.com (HELO eac18b5d7d93) ([10.239.97.150])
 by fmsmga002.fm.intel.com with ESMTP; 21 Feb 2023 16:33:51 -0800
Received: from kbuild by eac18b5d7d93 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pUd4w-0000PR-27;
 Wed, 22 Feb 2023 00:33:50 +0000
Date: Wed, 22 Feb 2023 08:33:10 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: [drm-misc:for-linux-next 1/1] drivers/gpu/drm/msm/msm_fbdev.c:144:6:
 warning: variable 'helper' is used uninitialized whenever 'if'
 condition is true
Message-ID: <202302220810.9dymwCQ8-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, llvm@lists.linux.dev,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree:   git://anongit.freedesktop.org/drm/drm-misc for-linux-next
head:   3fb1f62f80a1d249260db5ea9e22c51e52fab9ae
commit: 3fb1f62f80a1d249260db5ea9e22c51e52fab9ae [1/1] drm/fb-helper: Remove drm_fb_helper_unprepare() from drm_fb_helper_fini()
config: arm-buildonly-randconfig-r004-20230219 (https://download.01.org/0day-ci/archive/20230222/202302220810.9dymwCQ8-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        git remote add drm-misc git://anongit.freedesktop.org/drm/drm-misc
        git fetch --no-tags drm-misc for-linux-next
        git checkout 3fb1f62f80a1d249260db5ea9e22c51e52fab9ae
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/gpu/drm/msm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302220810.9dymwCQ8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/msm/msm_fbdev.c:144:6: warning: variable 'helper' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
           if (!fbdev)
               ^~~~~~
   drivers/gpu/drm/msm/msm_fbdev.c:173:26: note: uninitialized use occurs here
           drm_fb_helper_unprepare(helper);
                                   ^~~~~~
   drivers/gpu/drm/msm/msm_fbdev.c:144:2: note: remove the 'if' if its condition is always false
           if (!fbdev)
           ^~~~~~~~~~~
   drivers/gpu/drm/msm/msm_fbdev.c:140:30: note: initialize the variable 'helper' to silence this warning
           struct drm_fb_helper *helper;
                                       ^
                                        = NULL
   1 warning generated.


vim +144 drivers/gpu/drm/msm/msm_fbdev.c

c8afe684c95cd17 Rob Clark         2013-06-26  134  
c8afe684c95cd17 Rob Clark         2013-06-26  135  /* initialize fbdev helper */
c8afe684c95cd17 Rob Clark         2013-06-26  136  struct drm_fb_helper *msm_fbdev_init(struct drm_device *dev)
c8afe684c95cd17 Rob Clark         2013-06-26  137  {
c8afe684c95cd17 Rob Clark         2013-06-26  138  	struct msm_drm_private *priv = dev->dev_private;
c8afe684c95cd17 Rob Clark         2013-06-26  139  	struct msm_fbdev *fbdev = NULL;
c8afe684c95cd17 Rob Clark         2013-06-26  140  	struct drm_fb_helper *helper;
8f67da335d08bc0 Hai Li            2014-06-18  141  	int ret;
c8afe684c95cd17 Rob Clark         2013-06-26  142  
c8afe684c95cd17 Rob Clark         2013-06-26  143  	fbdev = kzalloc(sizeof(*fbdev), GFP_KERNEL);
c8afe684c95cd17 Rob Clark         2013-06-26 @144  	if (!fbdev)
c8afe684c95cd17 Rob Clark         2013-06-26  145  		goto fail;
c8afe684c95cd17 Rob Clark         2013-06-26  146  
c8afe684c95cd17 Rob Clark         2013-06-26  147  	helper = &fbdev->base;
c8afe684c95cd17 Rob Clark         2013-06-26  148  
6c80a93be62d398 Thomas Zimmermann 2023-01-25  149  	drm_fb_helper_prepare(dev, helper, 32, &msm_fb_helper_funcs);
c8afe684c95cd17 Rob Clark         2013-06-26  150  
2dea2d1182179e7 Pankaj Bharadiya  2020-03-05  151  	ret = drm_fb_helper_init(dev, helper);
c8afe684c95cd17 Rob Clark         2013-06-26  152  	if (ret) {
6a41da17e87dee2 Mamta Shukla      2018-10-20  153  		DRM_DEV_ERROR(dev->dev, "could not init fbdev: ret=%d\n", ret);
c8afe684c95cd17 Rob Clark         2013-06-26  154  		goto fail;
c8afe684c95cd17 Rob Clark         2013-06-26  155  	}
c8afe684c95cd17 Rob Clark         2013-06-26  156  
23c259722d0eddf Jeffrey Hugo      2019-06-28  157  	/* the fw fb could be anywhere in memory */
97c9bfe3f6605d4 Thomas Zimmermann 2021-06-29  158  	ret = drm_aperture_remove_framebuffers(false, dev->driver);
6848c291a54f8cd Thomas Zimmermann 2021-04-12  159  	if (ret)
6848c291a54f8cd Thomas Zimmermann 2021-04-12  160  		goto fini;
23c259722d0eddf Jeffrey Hugo      2019-06-28  161  
6c80a93be62d398 Thomas Zimmermann 2023-01-25  162  	ret = drm_fb_helper_initial_config(helper);
01934c2a6918821 Thierry Reding    2014-12-19  163  	if (ret)
01934c2a6918821 Thierry Reding    2014-12-19  164  		goto fini;
c8afe684c95cd17 Rob Clark         2013-06-26  165  
c8afe684c95cd17 Rob Clark         2013-06-26  166  	priv->fbdev = helper;
c8afe684c95cd17 Rob Clark         2013-06-26  167  
c8afe684c95cd17 Rob Clark         2013-06-26  168  	return helper;
c8afe684c95cd17 Rob Clark         2013-06-26  169  
01934c2a6918821 Thierry Reding    2014-12-19  170  fini:
01934c2a6918821 Thierry Reding    2014-12-19  171  	drm_fb_helper_fini(helper);
c8afe684c95cd17 Rob Clark         2013-06-26  172  fail:
3fb1f62f80a1d24 Thomas Zimmermann 2023-02-16  173  	drm_fb_helper_unprepare(helper);
c8afe684c95cd17 Rob Clark         2013-06-26  174  	kfree(fbdev);
c8afe684c95cd17 Rob Clark         2013-06-26  175  	return NULL;
c8afe684c95cd17 Rob Clark         2013-06-26  176  }
c8afe684c95cd17 Rob Clark         2013-06-26  177  

:::::: The code at line 144 was first introduced by commit
:::::: c8afe684c95cd17cf4f273d81af369a0fdfa5a74 drm/msm: basic KMS driver for snapdragon

:::::: TO: Rob Clark <robdclark@gmail.com>
:::::: CC: Rob Clark <robdclark@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
