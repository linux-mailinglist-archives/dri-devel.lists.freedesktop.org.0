Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3418A4ADBA
	for <lists+dri-devel@lfdr.de>; Sat,  1 Mar 2025 21:10:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D94510E29E;
	Sat,  1 Mar 2025 20:10:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gc9Dn8ZS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF5D610E273;
 Sat,  1 Mar 2025 20:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740859812; x=1772395812;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=FBynrjpYhkx1HFfcCPVjap8bi0l955UavvMGpYL9ArM=;
 b=gc9Dn8ZSLywvBJR7p860lN1rgY2vxuriYQ7AcO0SKYHqj5HHAU18eV35
 gsK7ca/w/VEuY+ORflOqZXxuUdoav2ZH5vX+yu6Z/6Hi+ctOK3v8nwWct
 n+g8uIIWf24Lcpjc1p5pr1uF5sFK5xbrUnbXDwrU+lstNvTg9bW3ZO+n6
 WB/oPDS8EtLdVjutGR/pyjASmAll7i3T1CkuJrRZme6HLVkUEASs25xWe
 n0hfvI457dweZr8NhMEZzHe2DLU0rbDi8Z0UInM+npdIU0l6wACA7k9vw
 DsrWdyqVcDgBxdlJ99ZPOkWMu5tVp0vAPw8uN/dJDh4uhwEP9Xw7I2NHW w==;
X-CSE-ConnectionGUID: ZqJLXUObThOD5s+xybikNQ==
X-CSE-MsgGUID: 5ciWqxFBSP+VVsYrMMj6uA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="41959950"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="41959950"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2025 12:10:09 -0800
X-CSE-ConnectionGUID: gzFfgN1jRIuUQbHQm7LDzA==
X-CSE-MsgGUID: cDEiiL2+Q7q6mvz25U0Awg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,326,1732608000"; d="scan'208";a="117626677"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
 by fmviesa007.fm.intel.com with ESMTP; 01 Mar 2025 12:10:04 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1toT9u-000Gem-1E;
 Sat, 01 Mar 2025 20:10:02 +0000
Date: Sun, 2 Mar 2025 04:09:17 +0800
From: kernel test robot <lkp@intel.com>
To: Su Hui <suhui@nfschina.com>, lucas.demarchi@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, Su Hui <suhui@nfschina.com>,
 ilpo.jarvinen@linux.intel.com, andriy.shevchenko@linux.intel.com,
 michael.j.ruhl@intel.com, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/xe: Select INTEL_VSEC to fix build dependency
Message-ID: <202503020347.z00djbJE-lkp@intel.com>
References: <20250227073205.1248282-1-suhui@nfschina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227073205.1248282-1-suhui@nfschina.com>
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

Hi Su,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-xe/drm-xe-next]
[also build test WARNING on linus/master v6.14-rc4 next-20250228]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Su-Hui/drm-xe-Select-INTEL_VSEC-to-fix-build-dependency/20250227-153437
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20250227073205.1248282-1-suhui%40nfschina.com
patch subject: [PATCH] drm/xe: Select INTEL_VSEC to fix build dependency
config: x86_64-kismet-CONFIG_INTEL_VSEC-CONFIG_DRM_XE-0-0 (https://download.01.org/0day-ci/archive/20250302/202503020347.z00djbJE-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250302/202503020347.z00djbJE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503020347.z00djbJE-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for INTEL_VSEC when selected by DRM_XE
   WARNING: unmet direct dependencies detected for INTEL_VSEC
     Depends on [n]: X86_PLATFORM_DEVICES [=n] && PCI [=y]
     Selected by [y]:
     - DRM_XE [=y] && HAS_IOMEM [=y] && DRM [=y] && PCI [=y] && MMU [=y] && (m [=m] && MODULES [=y] || KUNIT [=y]=y [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
