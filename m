Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CACEB28734
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 22:35:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B419310E99A;
	Fri, 15 Aug 2025 20:35:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BA5PQv+F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46CCB10E03E;
 Fri, 15 Aug 2025 20:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755290136; x=1786826136;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6/seuBhNy/r0/ZvsBHWbqeaVlQZm6Hl7cU7V8oDuh7g=;
 b=BA5PQv+FdSwl7eiTm+r1cVZGvyrGjVV2LYn0Hnh9xduqea7e9h3o2sgV
 RFulpkCbb1etXrlv9RB38xPTE6AAyJYwxNGmncwWJz/Y3xhpobu5UVaTO
 wfTwucgd4Te7DJuMssM90FIdeJmRe+tB76hrYQmAuGnJi2dUXSCuoiLgD
 I/HtUxIBAHu0/4K9ns6Ao3mBMAyGqHvow7nIFbL9P6LaXO9sdUOhur8U7
 cDyET1E2hJ0GPcERPNBYkXmmLIK7yb00ddD/z7n3Oib3UAMxGSBPdC3iJ
 606eIEk8q9967wlFMqEAfN8OzQUAGpSCURE0ULu/PgoVOo8LbnWKP6L+x A==;
X-CSE-ConnectionGUID: urrrApmeT3i7aQvAmJrZwA==
X-CSE-MsgGUID: Vg+uTzXKQuCbj67zVOJ4Jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="57541316"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="57541316"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 13:35:36 -0700
X-CSE-ConnectionGUID: /gUBN50jTAWPtDPX+DdnDg==
X-CSE-MsgGUID: C5YlJRYURTmAjx4761y+Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="166271616"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
 by orviesa006.jf.intel.com with ESMTP; 15 Aug 2025 13:35:29 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1un194-000CK4-1P;
 Fri, 15 Aug 2025 20:35:26 +0000
Date: Sat, 16 Aug 2025 04:34:56 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, wayland-devel@lists.freedesktop.org,
 harry.wentland@amd.com, alex.hung@amd.com, leo.liu@amd.com,
 ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com,
 contact@emersion.fr, mwen@igalia.com, jadahl@redhat.com,
 sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com,
 aleixpol@kde.org, xaver.hugl@gmail.com, victoria@system76.com,
 daniel@ffwll.ch, uma.shankar@intel.com, quic_naseer@quicinc.com,
 quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com,
 marcan@marcan.st, Liviu.Dudau@arm.com, sashamcintosh@google.com,
 chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com,
 mcanal@igalia.com
Subject: Re: [PATCH V11 15/47] drm/vkms: Add kunit tests for linear and sRGB
 LUTs
Message-ID: <202508160408.6Oo4aZ4X-lkp@intel.com>
References: <20250815035047.3319284-16-alex.hung@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250815035047.3319284-16-alex.hung@amd.com>
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

Hi Alex,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-exynos/exynos-drm-next]
[also build test ERROR on linus/master v6.17-rc1 next-20250815]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alex-Hung/drm-Add-helper-for-conversion-from-signed-magnitude/20250815-120435
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
patch link:    https://lore.kernel.org/r/20250815035047.3319284-16-alex.hung%40amd.com
patch subject: [PATCH V11 15/47] drm/vkms: Add kunit tests for linear and sRGB LUTs
config: arc-randconfig-001-20250816 (https://download.01.org/0day-ci/archive/20250816/202508160408.6Oo4aZ4X-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250816/202508160408.6Oo4aZ4X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508160408.6Oo4aZ4X-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/vkms/vkms_composer.c:15:
   drivers/gpu/drm/vkms/vkms_composer.h:21:32: warning: 'struct vkms_color_lut' declared inside parameter list will not be visible outside of this definition or declaration
    s64 get_lut_index(const struct vkms_color_lut *lut, u16 channel_value);
                                   ^~~~~~~~~~~~~~
   drivers/gpu/drm/vkms/vkms_composer.h:22:45: warning: 'struct vkms_color_lut' declared inside parameter list will not be visible outside of this definition or declaration
    u16 apply_lut_to_channel_value(const struct vkms_color_lut *lut, u16 channel_value,
                                                ^~~~~~~~~~~~~~
   drivers/gpu/drm/vkms/vkms_composer.c:77:22: error: conflicting types for 'get_lut_index'
    VISIBLE_IF_KUNIT s64 get_lut_index(const struct vkms_color_lut *lut, u16 channel_value)
                         ^~~~~~~~~~~~~
   In file included from drivers/gpu/drm/vkms/vkms_composer.c:15:
   drivers/gpu/drm/vkms/vkms_composer.h:21:5: note: previous declaration of 'get_lut_index' was here
    s64 get_lut_index(const struct vkms_color_lut *lut, u16 channel_value);
        ^~~~~~~~~~~~~
   In file included from include/linux/linkage.h:7,
                    from include/linux/preempt.h:10,
                    from include/linux/spinlock.h:56,
                    from include/drm/drm_crtc.h:28,
                    from include/drm/drm_atomic.h:31,
                    from drivers/gpu/drm/vkms/vkms_composer.c:5:
   drivers/gpu/drm/vkms/vkms_composer.c:83:24: error: conflicting types for 'get_lut_index'
    EXPORT_SYMBOL_IF_KUNIT(get_lut_index);
                           ^~~~~~~~~~~~~
   include/linux/export.h:76:21: note: in definition of macro '__EXPORT_SYMBOL'
     extern typeof(sym) sym;     \
                        ^~~
   include/kunit/visibility.h:27:44: note: in expansion of macro 'EXPORT_SYMBOL_NS'
        #define EXPORT_SYMBOL_IF_KUNIT(symbol) EXPORT_SYMBOL_NS(symbol, "EXPORTED_FOR_KUNIT_TESTING")
                                               ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/vkms/vkms_composer.c:83:1: note: in expansion of macro 'EXPORT_SYMBOL_IF_KUNIT'
    EXPORT_SYMBOL_IF_KUNIT(get_lut_index);
    ^~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/vkms/vkms_composer.c:15:
   drivers/gpu/drm/vkms/vkms_composer.h:21:5: note: previous declaration of 'get_lut_index' was here
    s64 get_lut_index(const struct vkms_color_lut *lut, u16 channel_value);
        ^~~~~~~~~~~~~
>> drivers/gpu/drm/vkms/vkms_composer.c:85:22: error: conflicting types for 'apply_lut_to_channel_value'
    VISIBLE_IF_KUNIT u16 apply_lut_to_channel_value(const struct vkms_color_lut *lut, u16 channel_value,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/vkms/vkms_composer.c:15:
   drivers/gpu/drm/vkms/vkms_composer.h:22:5: note: previous declaration of 'apply_lut_to_channel_value' was here
    u16 apply_lut_to_channel_value(const struct vkms_color_lut *lut, u16 channel_value,
        ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/linkage.h:7,
                    from include/linux/preempt.h:10,
                    from include/linux/spinlock.h:56,
                    from include/drm/drm_crtc.h:28,
                    from include/drm/drm_atomic.h:31,
                    from drivers/gpu/drm/vkms/vkms_composer.c:5:
   drivers/gpu/drm/vkms/vkms_composer.c:111:24: error: conflicting types for 'apply_lut_to_channel_value'
    EXPORT_SYMBOL_IF_KUNIT(apply_lut_to_channel_value);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:76:21: note: in definition of macro '__EXPORT_SYMBOL'
     extern typeof(sym) sym;     \
                        ^~~
   include/kunit/visibility.h:27:44: note: in expansion of macro 'EXPORT_SYMBOL_NS'
        #define EXPORT_SYMBOL_IF_KUNIT(symbol) EXPORT_SYMBOL_NS(symbol, "EXPORTED_FOR_KUNIT_TESTING")
                                               ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/vkms/vkms_composer.c:111:1: note: in expansion of macro 'EXPORT_SYMBOL_IF_KUNIT'
    EXPORT_SYMBOL_IF_KUNIT(apply_lut_to_channel_value);
    ^~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/vkms/vkms_composer.c:15:
   drivers/gpu/drm/vkms/vkms_composer.h:22:5: note: previous declaration of 'apply_lut_to_channel_value' was here
    u16 apply_lut_to_channel_value(const struct vkms_color_lut *lut, u16 channel_value,
        ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/apply_lut_to_channel_value +85 drivers/gpu/drm/vkms/vkms_composer.c

    76	
    77	VISIBLE_IF_KUNIT s64 get_lut_index(const struct vkms_color_lut *lut, u16 channel_value)
    78	{
    79		s64 color_channel_fp = drm_int2fixp(channel_value);
    80	
    81		return drm_fixp_mul(color_channel_fp, lut->channel_value2index_ratio);
    82	}
  > 83	EXPORT_SYMBOL_IF_KUNIT(get_lut_index);
    84	
  > 85	VISIBLE_IF_KUNIT u16 apply_lut_to_channel_value(const struct vkms_color_lut *lut, u16 channel_value,
    86							enum lut_channel channel)
    87	{
    88		s64 lut_index = get_lut_index(lut, channel_value);
    89		u16 *floor_lut_value, *ceil_lut_value;
    90		u16 floor_channel_value, ceil_channel_value;
    91	
    92		/*
    93		 * This checks if `struct drm_color_lut` has any gap added by the compiler
    94		 * between the struct fields.
    95		 */
    96		static_assert(sizeof(struct drm_color_lut) == sizeof(__u16) * 4);
    97	
    98		floor_lut_value = (__u16 *)&lut->base[drm_fixp2int(lut_index)];
    99		if (drm_fixp2int(lut_index) == (lut->lut_length - 1))
   100			/* We're at the end of the LUT array, use same value for ceil and floor */
   101			ceil_lut_value = floor_lut_value;
   102		else
   103			ceil_lut_value = (__u16 *)&lut->base[drm_fixp2int_ceil(lut_index)];
   104	
   105		floor_channel_value = floor_lut_value[channel];
   106		ceil_channel_value = ceil_lut_value[channel];
   107	
   108		return lerp_u16(floor_channel_value, ceil_channel_value,
   109				lut_index & DRM_FIXED_DECIMAL_MASK);
   110	}
   111	EXPORT_SYMBOL_IF_KUNIT(apply_lut_to_channel_value);
   112	
   113	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
