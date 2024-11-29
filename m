Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F379F9DED33
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2024 23:19:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6864610E5A3;
	Fri, 29 Nov 2024 22:19:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hRBitV4q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CAD610E2BD;
 Fri, 29 Nov 2024 22:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732918742; x=1764454742;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0MDzU7fhM1KiH8xqSF00VqwJ0LVKa1QI7C+Ok2cGTDM=;
 b=hRBitV4qz2JM0k+gDTJtGevx3mCh84ViNP/sqaFaJ3IjnD56tsLpkLI0
 Dyjrqct6aZlkrSl688bXzOxMiUqiF/T0c+8SfSatD7VANDQTvvky+6PVv
 5VVDSKnm1q/dvvHiNBF6JSt+2C0RD+Um3n43P96tvi4rg9gatiM4XEW0l
 Q1yZGAuXTTZ2zzrCOl88UIs/R8lwm06DQmU/e8Uk719nleKAsth++g9cz
 SbyeXdO646BJcspfWPl5GeXJi3MzikpupISYBBdISXqMAGmycZLzXN10N
 Re2chLli0f94FdH3ZgYf16u0CQH7H3FShIkxOuxEoEo1vw5DsW+qi5VPn Q==;
X-CSE-ConnectionGUID: +oLhjJi1ROCxYFx9v/u2Lg==
X-CSE-MsgGUID: xoxhJOM7TpSLuPdTn8VWAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="33018190"
X-IronPort-AV: E=Sophos;i="6.12,196,1728975600"; d="scan'208";a="33018190"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2024 14:19:02 -0800
X-CSE-ConnectionGUID: qQ/ctr93TpuyXfh54qSuXg==
X-CSE-MsgGUID: HvaTQx/XTjKXCE7C8dqDkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,196,1728975600"; d="scan'208";a="130060506"
Received: from lkp-server01.sh.intel.com (HELO 5e2646291792) ([10.239.97.150])
 by orviesa001.jf.intel.com with ESMTP; 29 Nov 2024 14:18:59 -0800
Received: from kbuild by 5e2646291792 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tH9KC-0000jV-2a;
 Fri, 29 Nov 2024 22:18:56 +0000
Date: Sat, 30 Nov 2024 06:18:41 +0800
From: kernel test robot <lkp@intel.com>
To: Jocelyn Falempe <jfalempe@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [PATCH 5/5] drm/i915: Add drm_panic support
Message-ID: <202411300629.WmnBjFIu-lkp@intel.com>
References: <20241129162232.7594-6-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241129162232.7594-6-jfalempe@redhat.com>
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

Hi Jocelyn,

kernel test robot noticed the following build errors:

[auto build test ERROR on 44cff6c5b0b17a78bc0b30372bcd816cf6dd282a]

url:    https://github.com/intel-lab-lkp/linux/commits/Jocelyn-Falempe/drm-i915-fbdev-Add-intel_fbdev_getvaddr/20241130-002536
base:   44cff6c5b0b17a78bc0b30372bcd816cf6dd282a
patch link:    https://lore.kernel.org/r/20241129162232.7594-6-jfalempe%40redhat.com
patch subject: [PATCH 5/5] drm/i915: Add drm_panic support
config: i386-buildonly-randconfig-003-20241130 (https://download.01.org/0day-ci/archive/20241130/202411300629.WmnBjFIu-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241130/202411300629.WmnBjFIu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411300629.WmnBjFIu-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i915/display/intel_atomic_plane.c:46:10: fatal error: gem/i915_gem_object.h: No such file or directory
      46 | #include "gem/i915_gem_object.h"
         |          ^~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +46 drivers/gpu/drm/i915/display/intel_atomic_plane.c

    45	
  > 46	#include "gem/i915_gem_object.h"
    47	#include "i915_config.h"
    48	#include "i9xx_plane_regs.h"
    49	#include "intel_atomic_plane.h"
    50	#include "intel_cdclk.h"
    51	#include "intel_cursor.h"
    52	#include "intel_display_rps.h"
    53	#include "intel_display_trace.h"
    54	#include "intel_display_types.h"
    55	#include "intel_fb.h"
    56	#include "intel_fb_pin.h"
    57	#include "intel_fbdev.h"
    58	#include "skl_scaler.h"
    59	#include "skl_watermark.h"
    60	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
