Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FE7B12ABB
	for <lists+dri-devel@lfdr.de>; Sat, 26 Jul 2025 15:42:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CA9B10E27D;
	Sat, 26 Jul 2025 13:42:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LTbwpSAr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F5B310E042;
 Sat, 26 Jul 2025 13:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753537369; x=1785073369;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=zAaAstL0To9KWT9Rj9lxk81BjFGPdkdW1scybp7HolQ=;
 b=LTbwpSAr3Ufz1w6U4qjDeoFjAORsF5rGw4rSiRfnLzFD8e+MEbpDHTOn
 IEwcVz08pivCkYcsrM3Cn6ZBb7+oz/WUb76IoFOy6Y/q1fn86ROfoVi+R
 CVz3lHBuGK+r+LUeofZ4LBkgVYIv54c6YzSu2D5jMXQMRSk50ERQSMA9G
 8RbH6sZEQ2FjKtCP7/xBYVEA161ri2LeJy3h+SBiPsbfZeTeul9ZKqr8I
 QV42iTDiiilgULhhr/rfUxur6vh55T9sa8P2Lzg2PS5MyXF+c9+tLfi1m
 eekbZyJ7zIqariVHOnZWBioCwmpLN0US3IIbYSiWAvW4jLXbwy5gB6Brv Q==;
X-CSE-ConnectionGUID: jIu3t/2PSMmJLVCfzAMT8A==
X-CSE-MsgGUID: ubrDSjE4RTK9pTsTiqxaFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="55550006"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="55550006"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2025 06:42:48 -0700
X-CSE-ConnectionGUID: ibJek+eJQeatvVV0vhWRRg==
X-CSE-MsgGUID: fJ5WMpIfSiil0VrgFAIf9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="192477743"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
 by fmviesa001.fm.intel.com with ESMTP; 26 Jul 2025 06:42:44 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uffAg-000M0V-1W;
 Sat, 26 Jul 2025 13:42:42 +0000
Date: Sat, 26 Jul 2025 21:42:18 +0800
From: kernel test robot <lkp@intel.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 uma.shankar@intel.com, Suraj Kandpal <suraj.kandpal@intel.com>
Subject: Re: [PATCH 14/28] drm/i915/writeback: Define function for prepare
 and cleanup hooks
Message-ID: <202507262142.wObleFKc-lkp@intel.com>
References: <20250725050409.2687242-15-suraj.kandpal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250725050409.2687242-15-suraj.kandpal@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Suraj,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on v6.16-rc7 next-20250725]
[cannot apply to linus/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Suraj-Kandpal/drm-writeback-Add-function-that-takes-preallocated-connector/20250725-133017
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/20250725050409.2687242-15-suraj.kandpal%40intel.com
patch subject: [PATCH 14/28] drm/i915/writeback: Define function for prepare and cleanup hooks
config: i386-buildonly-randconfig-006-20250725 (https://download.01.org/0day-ci/archive/20250726/202507262142.wObleFKc-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250726/202507262142.wObleFKc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507262142.wObleFKc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/display/intel_writeback.c:139:60: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
     139 |                 drm_err(job->fb->dev, "Failed to map framebuffer: %d\n", ret);
         |                                                                          ^~~
   include/drm/drm_print.h:628:46: note: expanded from macro 'drm_err'
     628 |         __drm_printk((drm), err,, "*ERROR* " fmt, ##__VA_ARGS__)
         |                                                     ^~~~~~~~~~~
   include/drm/drm_print.h:615:55: note: expanded from macro '__drm_printk'
     615 |         dev_##level##type(__drm_to_dev(drm), "[drm] " fmt, ##__VA_ARGS__)
         |                                                              ^~~~~~~~~~~
   include/linux/dev_printk.h:154:65: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_writeback.c:125:9: note: initialize the variable 'ret' to silence this warning
     125 |         int ret;
         |                ^
         |                 = 0
   drivers/gpu/drm/i915/display/intel_writeback.c:260:3: error: fallthrough annotation does not directly precede switch label
     260 |                 fallthrough;
         |                 ^
   include/linux/compiler_attributes.h:214:41: note: expanded from macro 'fallthrough'
     214 | # define fallthrough                    __attribute__((__fallthrough__))
         |                                         ^
   1 warning and 1 error generated.


vim +/ret +139 drivers/gpu/drm/i915/display/intel_writeback.c

   113	
   114	static int intel_writeback_prepare_job(struct drm_writeback_connector *wb_connector,
   115					       struct drm_writeback_job *job)
   116	{
   117		struct intel_writeback_connector *wb_conn =
   118			to_intel_writeback_connector(wb_connector);
   119		struct i915_vma *vma;
   120		struct intel_writeback_job *wb_job;
   121		unsigned long out_flags = 0;
   122		const struct i915_gtt_view view = {
   123			.type = I915_GTT_VIEW_NORMAL,
   124		};
   125		int ret;
   126	
   127		if (!job->fb)
   128			return 0;
   129	
   130		if (job->fb->modifier != DRM_FORMAT_MOD_LINEAR)
   131			return -EINVAL;
   132	
   133		wb_job = kzalloc(sizeof(*wb_job), GFP_KERNEL);
   134		if (!wb_job)
   135			return -ENOMEM;
   136	
   137		vma = intel_fb_pin_to_ggtt(job->fb, &view, 4 * 1024, 0, 0, true, &out_flags);
   138		if (IS_ERR(vma)) {
 > 139			drm_err(job->fb->dev, "Failed to map framebuffer: %d\n", ret);
   140			ret = PTR_ERR(vma);
   141			goto err;
   142		}
   143	
   144		wb_job->fb = job->fb;
   145		wb_job->vma = vma;
   146		wb_job->wb_connector = wb_connector;
   147		drm_framebuffer_get(wb_job->fb);
   148		job->priv = wb_job;
   149		wb_conn->job = wb_job;
   150	
   151		return 0;
   152	
   153	err:
   154		kfree(wb_job);
   155		return ret;
   156	}
   157	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
