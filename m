Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 186854C5B44
	for <lists+dri-devel@lfdr.de>; Sun, 27 Feb 2022 13:54:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9E9A10E382;
	Sun, 27 Feb 2022 12:54:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55DC810E364;
 Sun, 27 Feb 2022 12:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645966477; x=1677502477;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=iLW7oaTGQXzq3N7TLnbeyXwX3Bu/Y182Dv8E5CXCKRE=;
 b=Kr/R3VD0oxziQuzj3s4fNt/yJUIPyoB49Q5BcOBduBNyXvHE/Hj/jmsZ
 XK1J1mXr+urPgjND2BwObAgHOF8v9L2BiTPADrXkfhEgUraC5LWxUbMpP
 pB2m+GojM88qzc4unL3vldbZMNHH3mvfoeWoxWVrrGG57cN+Ug1aeRkZh
 UyuvqZcBtR2eQvSuZpM+OQ+2326HPvDiQuMxPVkXyDQs5J9cuspA7l2KK
 oQCFyMGXoBbr6uCp6kCVfBfaDicx0u/NDdJCQ1DWKIW66BbPSm95cdX/8
 hdKIzEZxr9uT9GgFXd233WglJFinP3MCTCE2RmAKHINdrBiyqVPXSx2Db Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10270"; a="252925263"
X-IronPort-AV: E=Sophos;i="5.90,141,1643702400"; d="scan'208";a="252925263"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2022 04:54:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,141,1643702400"; d="scan'208";a="507147436"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
 by orsmga002.jf.intel.com with ESMTP; 27 Feb 2022 04:54:34 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nOJ4L-0006WG-Ab; Sun, 27 Feb 2022 12:54:33 +0000
Date: Sun, 27 Feb 2022 20:54:10 +0800
From: kernel test robot <lkp@intel.com>
To: Jordan Justen <jordan.l.justen@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v6 1/4] drm/i915/guc: Add fetch of hwconfig table
Message-ID: <202202272041.Kr2QxFem-lkp@intel.com>
References: <20220227081831.1089720-2-jordan.l.justen@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220227081831.1089720-2-jordan.l.justen@intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>, kbuild-all@lists.01.org,
 Jordan Justen <jordan.l.justen@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jon Bloomfield <jon.bloomfield@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jordan,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on drm-tip/drm-tip drm-exynos/exynos-drm-next drm/drm-next tegra-drm/drm/tegra/for-next v5.17-rc5 next-20220225]
[cannot apply to airlied/drm-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Jordan-Justen/GuC-HWCONFIG-with-documentation/20220227-161945
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
config: x86_64-randconfig-a011 (https://download.01.org/0day-ci/archive/20220227/202202272041.Kr2QxFem-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build):
        # https://github.com/0day-ci/linux/commit/7a92eba9714ffe68202fee73b9916d35b0da2968
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Jordan-Justen/GuC-HWCONFIG-with-documentation/20220227-161945
        git checkout 7a92eba9714ffe68202fee73b9916d35b0da2968
        # save the config file to linux build tree
        mkdir build_dir
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c:110: warning: Function parameter or member 'gt' not described in 'guc_hwconfig_init'
>> drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c:110: warning: expecting prototype for intel_guc_hwconfig_init(). Prototype was for guc_hwconfig_init() instead
   drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c:143: warning: Function parameter or member 'gt' not described in 'intel_gt_init_hwconfig'
   drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c:156: warning: Function parameter or member 'gt' not described in 'intel_gt_fini_hwconfig'


vim +110 drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c

   102	
   103	/**
   104	 * intel_guc_hwconfig_init - Initialize the HWConfig
   105	 *
   106	 * Retrieve the HWConfig table from the GuC and save it locally.
   107	 * It can then be queried on demand by other users later on.
   108	 */
   109	static int guc_hwconfig_init(struct intel_gt *gt)
 > 110	{
   111		struct intel_hwconfig *hwconfig = &gt->info.hwconfig;
   112		struct intel_guc *guc = &gt->uc.guc;
   113		int ret;
   114	
   115		if (!has_table(gt->i915))
   116			return 0;
   117	
   118		ret = guc_hwconfig_discover_size(guc, hwconfig);
   119		if (ret)
   120			return ret;
   121	
   122		hwconfig->ptr = kmalloc(hwconfig->size, GFP_KERNEL);
   123		if (!hwconfig->ptr) {
   124			hwconfig->size = 0;
   125			return -ENOMEM;
   126		}
   127	
   128		ret = guc_hwconfig_fill_buffer(guc, hwconfig);
   129		if (ret < 0) {
   130			intel_gt_fini_hwconfig(gt);
   131			return ret;
   132		}
   133	
   134		return 0;
   135	}
   136	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
