Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57641672B66
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 23:42:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD62D10E062;
	Wed, 18 Jan 2023 22:42:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D333F10E062
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 22:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674081740; x=1705617740;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=1seZwJJ5fjHzmEGGMsg+2W0Ii9vh1jkN8H3OpnOyVUk=;
 b=b7+Q0MS2Q9iceApVpml0/Oc1aGApTUrACujWKbumvD0NRIOkIAlEJ1Bt
 5l95amdYtqtdqiJbj3ax9NREfyrqjq70qwuE/A1lbI/SvGb5np3KXxxkz
 0Eq73EisyknYD/KfchZj2a+3zXJzR5QnVbFcBS1To2dkuJ1tf1RZ+FBBm
 uRBJL5biegJNfCvqqiGnEnQENPSDgz06xf6YkMHRBzR66H7xiUiIozZJj
 yZkft9cdAIZxWeqiQVOI6k00ITbXExm/hsgaqKpGJPtMe94UK1jFafcq0
 6+O3mDHtJkaMNYfIBx54LhDW30wtKp8x1c7fB7t4qcytu4ll1V/23Sr/f A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="312998241"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="312998241"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 14:42:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="833766911"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="833766911"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
 by orsmga005.jf.intel.com with ESMTP; 18 Jan 2023 14:42:18 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pIH8L-0000mQ-11;
 Wed, 18 Jan 2023 22:42:17 +0000
Date: Thu, 19 Jan 2023 06:41:22 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: [drm-misc:for-linux-next-fixes 1/2]
 drivers/gpu/drm/i915/i915_driver.c:1072:34: error: unused variable 'i915'
Message-ID: <202301190659.FxGwhJ82-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Cc: Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree:   git://anongit.freedesktop.org/drm/drm-misc for-linux-next-fixes
head:   2293a73ad4f3b6c37c06713ff1b67659d92ef43d
commit: a273e95721e96885971a05f1b34cb6d093904d9d [1/2] drm/i915: Allow switching away via vga-switcheroo if uninitialized
config: x86_64-rhel-8.3-syz (https://download.01.org/0day-ci/archive/20230119/202301190659.FxGwhJ82-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        git remote add drm-misc git://anongit.freedesktop.org/drm/drm-misc
        git fetch --no-tags drm-misc for-linux-next-fixes
        git checkout a273e95721e96885971a05f1b34cb6d093904d9d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

Note: the drm-misc/for-linux-next-fixes HEAD 2293a73ad4f3b6c37c06713ff1b67659d92ef43d builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   drivers/gpu/drm/i915/i915_driver.c: In function 'i915_driver_lastclose':
>> drivers/gpu/drm/i915/i915_driver.c:1072:34: error: unused variable 'i915' [-Werror=unused-variable]
    1072 |         struct drm_i915_private *i915 = to_i915(dev);
         |                                  ^~~~
   cc1: all warnings being treated as errors


vim +/i915 +1072 drivers/gpu/drm/i915/i915_driver.c

71386ef9008817f drivers/gpu/drm/i915/i915_drv.c Oscar Mateo           2014-07-24  1057  
0673ad472b9849a drivers/gpu/drm/i915/i915_drv.c Chris Wilson          2016-06-24  1058  /**
0673ad472b9849a drivers/gpu/drm/i915/i915_drv.c Chris Wilson          2016-06-24  1059   * i915_driver_lastclose - clean up after all DRM clients have exited
0673ad472b9849a drivers/gpu/drm/i915/i915_drv.c Chris Wilson          2016-06-24  1060   * @dev: DRM device
0673ad472b9849a drivers/gpu/drm/i915/i915_drv.c Chris Wilson          2016-06-24  1061   *
0673ad472b9849a drivers/gpu/drm/i915/i915_drv.c Chris Wilson          2016-06-24  1062   * Take care of cleaning up after all DRM clients have exited.  In the
0673ad472b9849a drivers/gpu/drm/i915/i915_drv.c Chris Wilson          2016-06-24  1063   * mode setting case, we want to restore the kernel's initial mode (just
0673ad472b9849a drivers/gpu/drm/i915/i915_drv.c Chris Wilson          2016-06-24  1064   * in case the last client left us in a bad state).
0673ad472b9849a drivers/gpu/drm/i915/i915_drv.c Chris Wilson          2016-06-24  1065   *
0673ad472b9849a drivers/gpu/drm/i915/i915_drv.c Chris Wilson          2016-06-24  1066   * Additionally, in the non-mode setting case, we'll tear down the GTT
0673ad472b9849a drivers/gpu/drm/i915/i915_drv.c Chris Wilson          2016-06-24  1067   * and DMA structures, since the kernel won't be using them, and clea
0673ad472b9849a drivers/gpu/drm/i915/i915_drv.c Chris Wilson          2016-06-24  1068   * up any GEM state.
0673ad472b9849a drivers/gpu/drm/i915/i915_drv.c Chris Wilson          2016-06-24  1069   */
0673ad472b9849a drivers/gpu/drm/i915/i915_drv.c Chris Wilson          2016-06-24  1070  static void i915_driver_lastclose(struct drm_device *dev)
0673ad472b9849a drivers/gpu/drm/i915/i915_drv.c Chris Wilson          2016-06-24  1071  {
5df7bd130818dfd drivers/gpu/drm/i915/i915_drv.c José Roberto de Souza 2021-04-08 @1072  	struct drm_i915_private *i915 = to_i915(dev);
5df7bd130818dfd drivers/gpu/drm/i915/i915_drv.c José Roberto de Souza 2021-04-08  1073  
0673ad472b9849a drivers/gpu/drm/i915/i915_drv.c Chris Wilson          2016-06-24  1074  	intel_fbdev_restore_mode(dev);
5df7bd130818dfd drivers/gpu/drm/i915/i915_drv.c José Roberto de Souza 2021-04-08  1075  
0673ad472b9849a drivers/gpu/drm/i915/i915_drv.c Chris Wilson          2016-06-24  1076  	vga_switcheroo_process_delayed_switch();
0673ad472b9849a drivers/gpu/drm/i915/i915_drv.c Chris Wilson          2016-06-24  1077  }
2911a35b2e4eb87 drivers/gpu/drm/i915/i915_drv.c Ben Widawsky          2012-04-05  1078  

:::::: The code at line 1072 was first introduced by commit
:::::: 5df7bd130818dfdc9047c2a81b19737d66e55f9a drm/i915: skip display initialization when there is no display

:::::: TO: José Roberto de Souza <jose.souza@intel.com>
:::::: CC: José Roberto de Souza <jose.souza@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
