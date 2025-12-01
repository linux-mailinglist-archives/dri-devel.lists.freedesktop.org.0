Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 720E1C97D4E
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 15:22:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02CEA10E3E2;
	Mon,  1 Dec 2025 14:22:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B0dVMBgE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DFE810E2B9;
 Mon,  1 Dec 2025 14:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764598923; x=1796134923;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=n3Dp5GLmrKfysZMBJHMWpL6GCub8YBOyNrqyFvRytHg=;
 b=B0dVMBgEcPTcWvBT+6xKECPEjWzJmYKNKnXLTJBBjRpaq0TtnZZc07s7
 BzB4un1xCMJcJ0t9EO779Nz1V5kWKxjBNFls4jQd7MdQt4s35koNooLAC
 9f6EiMfHwjzB+LXVBStRSBczyELhdst7GfYPACVpvTdX1qKiVIwTfFsbr
 yjbi0r4WxwsIoaVbG0xelWrj2F+PiuqEgcdCVVEZhIeLwLzMk9kHQkeSx
 5puje3DVY5UrO8n7O5T/kvU/U02W9hTLUvAsksYb6/TwQTiauWdvVITEa
 RMyNjf8SaMx9dr0G4G9qsEg8br4BOcUcLSkVxQTbA2ysqcuMRDDfqls6x w==;
X-CSE-ConnectionGUID: x3NDKQepT+uZjX/bRXCEKw==
X-CSE-MsgGUID: K61ThVxBRi+yAFgmc3ItnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="83930474"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="83930474"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 06:22:02 -0800
X-CSE-ConnectionGUID: +j1YOhCXRuWkPkryA7iL3A==
X-CSE-MsgGUID: s3vVmGQaQdaz8163i6kEww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="193907437"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
 by orviesa009.jf.intel.com with ESMTP; 01 Dec 2025 06:21:57 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vQ4mp-000000008oz-27CC;
 Mon, 01 Dec 2025 14:21:55 +0000
Date: Mon, 1 Dec 2025 22:21:47 +0800
From: kernel test robot <lkp@intel.com>
To: Uma Shankar <uma.shankar@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, chaitanya.kumar.borah@intel.com,
 ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com,
 contact@emersion.fr, harry.wentland@amd.com, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com,
 swati2.sharma@intel.com, alex.hung@amd.com, jani.nikula@intel.com,
 suraj.kandpal@intel.com, Uma Shankar <uma.shankar@intel.com>
Subject: Re: [v7 02/15] drm/i915: Add intel_color_op
Message-ID: <202512012214.cxi2Gair-lkp@intel.com>
References: <20251201064655.3579280-3-uma.shankar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201064655.3579280-3-uma.shankar@intel.com>
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

Hi Uma,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20251201]
[also build test ERROR on linus/master v6.18]
[cannot apply to drm-xe/drm-xe-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip v6.18 v6.18-rc7 v6.18-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Uma-Shankar/drm-i915-display-Add-identifiers-for-driver-specific-blocks/20251201-150245
base:   next-20251201
patch link:    https://lore.kernel.org/r/20251201064655.3579280-3-uma.shankar%40intel.com
patch subject: [v7 02/15] drm/i915: Add intel_color_op
config: i386-buildonly-randconfig-006-20251201 (https://download.01.org/0day-ci/archive/20251201/202512012214.cxi2Gair-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251201/202512012214.cxi2Gair-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512012214.cxi2Gair-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/display/intel_colorop.h:9,
                    from drivers/gpu/drm/i915/display/intel_colorop.c:5:
   drivers/gpu/drm/i915/display/intel_display_types.h:1989:28: error: field 'base' has incomplete type
    1989 |         struct drm_colorop base;
         |                            ^~~~
   In file included from include/linux/container_of.h:5,
                    from include/linux/plist.h:76,
                    from include/linux/pm_qos.h:15,
                    from drivers/gpu/drm/i915/display/intel_display_types.h:29:
   drivers/gpu/drm/i915/display/intel_colorop.c: In function 'to_intel_colorop':
>> include/linux/compiler_types.h:552:27: error: expression in static assertion is not an integer
     552 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_colorop.c:9:16: note: in expansion of macro 'container_of'
       9 |         return container_of(colorop, struct intel_colorop, base);
         |                ^~~~~~~~~~~~
>> drivers/gpu/drm/i915/display/intel_colorop.c:10:1: warning: control reaches end of non-void function [-Wreturn-type]
      10 | }
         | ^


vim +10 drivers/gpu/drm/i915/display/intel_colorop.c

     6	
     7	struct intel_colorop *to_intel_colorop(struct drm_colorop *colorop)
     8	{
     9		return container_of(colorop, struct intel_colorop, base);
  > 10	}

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
