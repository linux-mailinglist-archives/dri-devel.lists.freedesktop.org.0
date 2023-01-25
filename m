Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8C167B26C
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 13:13:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FDCD10E7B5;
	Wed, 25 Jan 2023 12:13:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9818210E7B4;
 Wed, 25 Jan 2023 12:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674648782; x=1706184782;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=BlYL5ZWxfpIGJfWCOvZGguBgymIDRUM5a8fZph+HpbU=;
 b=IVms/xwalWAAxbxSySt4IZtjNoJfVX+X4bN6bFWWFIeJC4tNGsBhus6Y
 Bv+2jVbRe75jnV0o+m4bmtbRLZcaGpu/aKmB9ifJLs/MYpqRiAXS82j6v
 2yGtPPHHqWH9vcaEY/JhBdH5KyxGqlswSO9FK7ctcEtjVDUz6MWGAF0lQ
 TMABESVcDhXcoGhriDVw8iG32Uw5qchAasm6RGwVX0HbF1GTJHd9fz//v
 ZOxLM86mF/3lzcLlB2y4KYCTNUTt8IVaSEWRKWGYQYruBM80FzwSi4qP+
 XFh5tmLm9GpeV9g4CS6GoAJU9FXKhubop6iSwOf+7AXcMA4ljDyq4sGG1 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="391044963"
X-IronPort-AV: E=Sophos;i="5.97,245,1669104000"; d="scan'208";a="391044963"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2023 04:13:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="725833858"
X-IronPort-AV: E=Sophos;i="5.97,245,1669104000"; d="scan'208";a="725833858"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
 by fmsmga008.fm.intel.com with ESMTP; 25 Jan 2023 04:12:57 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pKee9-0007He-0L;
 Wed, 25 Jan 2023 12:12:57 +0000
Date: Wed, 25 Jan 2023 20:12:30 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, javierm@redhat.com
Subject: Re: [Intel-gfx] [PATCH v2 06/10] drm/fb-helper: Initialize
 fb-helper's preferred BPP in prepare function
Message-ID: <202301252016.vm7ksFra-lkp@intel.com>
References: <20230124134010.30263-7-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230124134010.30263-7-tzimmermann@suse.de>
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
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, llvm@lists.linux.dev,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, oe-kbuild-all@lists.linux.dev,
 linux-tegra@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

I love your patch! Yet something to improve:

[auto build test ERROR on 7d3e7f64a42d66ba8da6e7b66a8d85457ef84570]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/drm-client-Test-for-connectors-before-sending-hotplug-event/20230124-214220
base:   7d3e7f64a42d66ba8da6e7b66a8d85457ef84570
patch link:    https://lore.kernel.org/r/20230124134010.30263-7-tzimmermann%40suse.de
patch subject: [Intel-gfx] [PATCH v2 06/10] drm/fb-helper: Initialize fb-helper's preferred BPP in prepare function
config: x86_64-randconfig-a014-20230123 (https://download.01.org/0day-ci/archive/20230125/202301252016.vm7ksFra-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/70e38534e74e4d12bb02b3b352bba2aed417f541
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Thomas-Zimmermann/drm-client-Test-for-connectors-before-sending-hotplug-event/20230124-214220
        git checkout 70e38534e74e4d12bb02b3b352bba2aed417f541
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/drm/gma500/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/gma500/framebuffer.c:412:44: error: too many arguments to function call, expected 3, have 4
           drm_fb_helper_prepare(dev, fb_helper, 32, &psb_fb_helper_funcs);
           ~~~~~~~~~~~~~~~~~~~~~                     ^~~~~~~~~~~~~~~~~~~~
   include/drm/drm_fb_helper.h:295:20: note: 'drm_fb_helper_prepare' declared here
   static inline void drm_fb_helper_prepare(struct drm_device *dev,
                      ^
>> drivers/gpu/drm/gma500/framebuffer.c:421:46: error: too few arguments to function call, expected 2, have 1
           ret = drm_fb_helper_initial_config(fb_helper);
                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~          ^
   include/drm/drm_fb_helper.h:459:19: note: 'drm_fb_helper_initial_config' declared here
   static inline int drm_fb_helper_initial_config(struct drm_fb_helper *fb_helper,
                     ^
   2 errors generated.


vim +412 drivers/gpu/drm/gma500/framebuffer.c

   397	
   398	int psb_fbdev_init(struct drm_device *dev)
   399	{
   400		struct drm_fb_helper *fb_helper;
   401		struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
   402		int ret;
   403	
   404		fb_helper = kzalloc(sizeof(*fb_helper), GFP_KERNEL);
   405		if (!fb_helper) {
   406			dev_err(dev->dev, "no memory\n");
   407			return -ENOMEM;
   408		}
   409	
   410		dev_priv->fb_helper = fb_helper;
   411	
 > 412		drm_fb_helper_prepare(dev, fb_helper, 32, &psb_fb_helper_funcs);
   413	
   414		ret = drm_fb_helper_init(dev, fb_helper);
   415		if (ret)
   416			goto free;
   417	
   418		/* disable all the possible outputs/crtcs before entering KMS mode */
   419		drm_helper_disable_unused_functions(dev);
   420	
 > 421		ret = drm_fb_helper_initial_config(fb_helper);
   422		if (ret)
   423			goto fini;
   424	
   425		return 0;
   426	
   427	fini:
   428		drm_fb_helper_fini(fb_helper);
   429	free:
   430		kfree(fb_helper);
   431		return ret;
   432	}
   433	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
