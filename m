Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 714E26CCB90
	for <lists+dri-devel@lfdr.de>; Tue, 28 Mar 2023 22:40:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62D0A10E481;
	Tue, 28 Mar 2023 20:40:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06A2810E481;
 Tue, 28 Mar 2023 20:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680036025; x=1711572025;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=gvb2HmdFB0pZ7hrIpyWYWFwcMsyDepZT+cCpwZ9+i3U=;
 b=NPiAET3iVay2dtVpQfdTV8crem784OhM/cHGq0jq6zAUKaVqEj7JsxVS
 lqT2EzAk5hIWDoVjtB2DxUBaI+2T8VcfYMxLsZvSmSpr/RWE5wl4NqjJu
 cKLpsTB/4+eBYfrthIOq1zG1yNH2wqt0UZ7YhP2sw9h/hBJM0qC52lGs0
 T9kVXGhS5NhQ9fjL5nMIVHC/7lpp7CaSha4dDHffUh4xQZcPO2riCwlnl
 G5WhcTwqi7DE9bXcOYEWazT4Xd5aeEWkPWrdCFKHHvnCkC2IxuUNh+X0k
 ZjiCJbQSd/0+P53hgu63yIlzFKeA6w5Z9pHV/YIDp7jq8B0rQpeQWOEdQ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="320339020"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; d="scan'208";a="320339020"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2023 13:40:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="773297847"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; d="scan'208";a="773297847"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
 by FMSMGA003.fm.intel.com with ESMTP; 28 Mar 2023 13:40:21 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1phG7A-000It5-2N;
 Tue, 28 Mar 2023 20:40:20 +0000
Date: Wed, 29 Mar 2023 04:40:17 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tvrtko.ursulin@linux.intel.com, airlied@gmail.com, daniel@ffwll.ch,
 ville.syrjala@linux.intel.com, imre.deak@intel.com,
 tejas.upadhyay@intel.com, javierm@redhat.com
Subject: Re: [Intel-gfx] [PATCH 4/4] drm/i915: Implement fbdev emulation as
 in-kernel client
Message-ID: <202303290420.6rd5p4br-lkp@intel.com>
References: <20230328111422.23986-5-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230328111422.23986-5-tzimmermann@suse.de>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

I love your patch! Yet something to improve:

[auto build test ERROR on 6e5f96153989e454041848f66a5227be9bd0bbc3]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/drm-i915-Move-fbdev-functions/20230328-191627
base:   6e5f96153989e454041848f66a5227be9bd0bbc3
patch link:    https://lore.kernel.org/r/20230328111422.23986-5-tzimmermann%40suse.de
patch subject: [Intel-gfx] [PATCH 4/4] drm/i915: Implement fbdev emulation as in-kernel client
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20230329/202303290420.6rd5p4br-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/6db03fde4587438371c6f7871675cba6389a1319
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Thomas-Zimmermann/drm-i915-Move-fbdev-functions/20230328-191627
        git checkout 6db03fde4587438371c6f7871675cba6389a1319
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303290420.6rd5p4br-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/i915_driver.c:55:
>> drivers/gpu/drm/i915/display/intel_fbdev.h:22:1: error: expected identifier or '(' before '{' token
      22 | {
         | ^


vim +22 drivers/gpu/drm/i915/display/intel_fbdev.h

6dfccb95cf17cd drivers/gpu/drm/i915/intel_fbdev.h         Jani Nikula       2019-04-05  15  
6dfccb95cf17cd drivers/gpu/drm/i915/intel_fbdev.h         Jani Nikula       2019-04-05  16  #ifdef CONFIG_DRM_FBDEV_EMULATION
6db03fde458743 drivers/gpu/drm/i915/display/intel_fbdev.h Thomas Zimmermann 2023-03-28  17  void intel_fbdev_setup(struct drm_i915_private *dev_priv);
6dfccb95cf17cd drivers/gpu/drm/i915/intel_fbdev.h         Jani Nikula       2019-04-05  18  void intel_fbdev_set_suspend(struct drm_device *dev, int state, bool synchronous);
c1c04560ac038d drivers/gpu/drm/i915/display/intel_fbdev.h Jani Nikula       2022-02-15  19  struct intel_framebuffer *intel_fbdev_framebuffer(struct intel_fbdev *fbdev);
6dfccb95cf17cd drivers/gpu/drm/i915/intel_fbdev.h         Jani Nikula       2019-04-05  20  #else
6db03fde458743 drivers/gpu/drm/i915/display/intel_fbdev.h Thomas Zimmermann 2023-03-28  21  void intel_fbdev_setup(struct drm_i915_private *dev_priv);
6dfccb95cf17cd drivers/gpu/drm/i915/intel_fbdev.h         Jani Nikula       2019-04-05 @22  {
6dfccb95cf17cd drivers/gpu/drm/i915/intel_fbdev.h         Jani Nikula       2019-04-05  23  }
6dfccb95cf17cd drivers/gpu/drm/i915/intel_fbdev.h         Jani Nikula       2019-04-05  24  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
