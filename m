Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3BA7E7F88
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 18:55:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E6B410E164;
	Fri, 10 Nov 2023 17:55:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 749A710E164;
 Fri, 10 Nov 2023 17:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699638943; x=1731174943;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=ZF63sDUiX4AR9mM26k2dZiMwcqoex5DR9VpSPPJi2CU=;
 b=YncOsfT5rBUhSMAQIW7mBtPMXuDXLpWD7OUBZ9+z/Kx3D4AlF4N0g/c0
 ObsfI5wvybIDg2De3EB6KD8wMvr3/xmVFCWktwsnjH+72np/uZZpmVSbr
 J5fuWgo0nbWaWnv4RkiOWzLlKz4q5TlIA9mNPomOG3BSfjenJdyY0HFL0
 XtCgOaZB0Kuv53imlB2eSFuuRBGhF25apEvUx2mWT4TYCqOfDd0Ihck17
 fUixW6rEt0akRfdju6G7/jk5XUf/voMhes1d4m/6nE1lOJsDB+GcV4joy
 24eBV3Ei+EF48x5kLvtc4Qxv4HBL+ldFNtyTDUhIEMBmiruyr5+iwaq61 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="369547602"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; d="scan'208";a="369547602"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2023 09:55:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="763800178"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; d="scan'208";a="763800178"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
 by orsmga002.jf.intel.com with ESMTP; 10 Nov 2023 09:55:41 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1r1VjG-0009nO-23;
 Fri, 10 Nov 2023 17:55:38 +0000
Date: Sat, 11 Nov 2023 01:55:14 +0800
From: kernel test robot <lkp@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Subject: [drm-intel:drm-intel-gt-next 1/6]
 drivers/gpu/drm/i915/i915_drm_client.h:81:1: warning: no return statement in
 function returning non-void
Message-ID: <202311110104.8TlHVxUI-lkp@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 dri-devel@lists.freedesktop.org, oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree:   git://anongit.freedesktop.org/drm-intel drm-intel-gt-next
head:   968853033d8aa4dbb80fbafa6f5d9b6a0ea21272
commit: e4ae85e364fc652ea15d85b0f3a6da304c9b5ce7 [1/6] drm/i915: Add ability for tracking buffer objects per client
config: x86_64-buildonly-randconfig-001-20231110 (https://download.01.org/0day-ci/archive/20231111/202311110104.8TlHVxUI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231111/202311110104.8TlHVxUI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311110104.8TlHVxUI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/i915_drv.h:54,
                    from drivers/gpu/drm/i915/gt/intel_context.h:14,
                    from drivers/gpu/drm/i915/gem/i915_gem_context.h:12,
                    from drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:8:
   drivers/gpu/drm/i915/i915_drm_client.h: In function 'i915_drm_client_remove_object':
>> drivers/gpu/drm/i915/i915_drm_client.h:81:1: warning: no return statement in function returning non-void [-Wreturn-type]
      81 | }
         | ^
--
   In file included from drivers/gpu/drm/i915/selftests/../i915_drv.h:54,
                    from drivers/gpu/drm/i915/selftests/igt_reset.c:12:
   drivers/gpu/drm/i915/selftests/../i915_drm_client.h: In function 'i915_drm_client_remove_object':
>> drivers/gpu/drm/i915/selftests/../i915_drm_client.h:81:1: warning: no return statement in function returning non-void [-Wreturn-type]
      81 | }
         | ^


vim +81 drivers/gpu/drm/i915/i915_drm_client.h

    78	
    79	static inline bool i915_drm_client_remove_object(struct drm_i915_gem_object *obj)
    80	{
  > 81	}
    82	#endif
    83	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
