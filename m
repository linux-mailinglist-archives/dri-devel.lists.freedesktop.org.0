Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED24A955724
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2024 12:14:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D27510E057;
	Sat, 17 Aug 2024 10:14:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bYZ3+5a3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76F1310E037;
 Sat, 17 Aug 2024 10:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723889676; x=1755425676;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qn363W5Vxq2cwBv149RyNnUUhY+ADXHMAUkKKo3FvGY=;
 b=bYZ3+5a3WGgvDur0caJ4BALRUdf+RDkRN3hQKtDUyKa7PndklIOLwNkf
 L1aDzabdGcDcpdcU/iU06f3and8Qc0xyUDAviqktYiNH6FLmjp6Rn0mjV
 n5lx4jr5FPbbm711Frxoz9ktuDMPGk5ttgBKCfGzte2BrIaLxyDRgmB8C
 cQJAz/dJAAA/pG8udBltZB0FpFEYG1E+Y93jQ4qwOw27Rav4vlsvR6udX
 n/03vJbEn7lxMr8W0aDLLNnT13mVukS+UsSUr0VKVAjBaZyCNdWALoWJ6
 S5hcg1EFE/A6qg5pDydiZd91ujTZ9oXG0C8ZtLwfBe7oweyD+4qEHj339 g==;
X-CSE-ConnectionGUID: 9Q8KVxSySXuf4hNfvIbyuA==
X-CSE-MsgGUID: DAcss0nhSi+hfMSK4Uaxbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="22352445"
X-IronPort-AV: E=Sophos;i="6.10,154,1719903600"; d="scan'208";a="22352445"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2024 03:14:36 -0700
X-CSE-ConnectionGUID: rG9m58IYR3ulX2M5Cg016g==
X-CSE-MsgGUID: fYKMSDfgSDWpf+HHlwhyYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,154,1719903600"; d="scan'208";a="60074409"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
 by fmviesa010.fm.intel.com with ESMTP; 17 Aug 2024 03:14:33 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sfGS6-0007LW-1I;
 Sat, 17 Aug 2024 10:14:30 +0000
Date: Sat, 17 Aug 2024 18:14:24 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com, javierm@redhat.com
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 83/86] drm/{i915,xe}: Run DRM default client setup
Message-ID: <202408171746.ju5Kg2D3-lkp@intel.com>
References: <20240816125408.310253-84-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240816125408.310253-84-tzimmermann@suse.de>
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

Hi Thomas,

kernel test robot noticed the following build errors:

[auto build test ERROR on 70d6d55dea574b7b78ccf714699cc5d8d62fcc2c]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/drm-fbdev-helper-Move-color-mode-lookup-into-4CC-format-helper/20240816-210651
base:   70d6d55dea574b7b78ccf714699cc5d8d62fcc2c
patch link:    https://lore.kernel.org/r/20240816125408.310253-84-tzimmermann%40suse.de
patch subject: [PATCH 83/86] drm/{i915,xe}: Run DRM default client setup
config: openrisc-allyesconfig (https://download.01.org/0day-ci/archive/20240817/202408171746.ju5Kg2D3-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240817/202408171746.ju5Kg2D3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408171746.ju5Kg2D3-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/xe/xe_device.c:20:10: fatal error: intel_fbdev.h: No such file or directory
      20 | #include "intel_fbdev.h"
         |          ^~~~~~~~~~~~~~~
   compilation terminated.


vim +20 drivers/gpu/drm/xe/xe_device.c

    19	
  > 20	#include "intel_fbdev.h"
    21	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
