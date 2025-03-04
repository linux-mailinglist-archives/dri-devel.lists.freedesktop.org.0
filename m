Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D055A4ED2B
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 20:22:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6743110E258;
	Tue,  4 Mar 2025 19:22:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OEwLgpoM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34F8E10E258;
 Tue,  4 Mar 2025 19:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741116132; x=1772652132;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=EWww6dka3LvQi0O5gZUXT8FQu5sFnMWxMNRLzJRcR7s=;
 b=OEwLgpoMFW3GoaOFTM+7IIusGAjM9EVLoI7IREQnpaOM3UCNDQdTcDhI
 dk9mIvYcWawv5NLRXssDOquCt5K9OVCWolZSAcpR42jofOtIMfTBrrOsb
 0lts5RopSed5Q853sCLes6ISJCw1ylWd7V/8+tHyXXr7LJkR629yyr32G
 z341eaEDCWSKUNJHTTaVsUpTlKAbuTgFS8AHMK1UoegTT3o0oc4I7vzKq
 9GFdHShPiom8Ra8VMT42aUJ5ts5R4mAnuvOjYg2ydmAWukXl4eiiEmMIo
 qgZD5c6jGRuMYJLmpXcDf5tb5+NV2ehUMVpHYarVk/pNcAGLurKPEjlF4 Q==;
X-CSE-ConnectionGUID: rB4N9VG3TcClekAXacgy+g==
X-CSE-MsgGUID: DNvz6YAiSGWYk6pfcV3Dwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="67424346"
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; d="scan'208";a="67424346"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 11:22:09 -0800
X-CSE-ConnectionGUID: 9+eGOiPxTIGpbUDmXlX+ig==
X-CSE-MsgGUID: CbAXLgcJTLOqszXti+rVHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; d="scan'208";a="118614705"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
 by fmviesa008.fm.intel.com with ESMTP; 04 Mar 2025 11:22:05 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tpXq6-000KBC-1z;
 Tue, 04 Mar 2025 19:22:02 +0000
Date: Wed, 5 Mar 2025 03:21:04 +0800
From: kernel test robot <lkp@intel.com>
To: Su Hui <suhui@nfschina.com>, lucas.demarchi@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Su Hui <suhui@nfschina.com>, ilpo.jarvinen@linux.intel.com,
 andriy.shevchenko@linux.intel.com, michael.j.ruhl@intel.com,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/xe: Select INTEL_VSEC to fix build dependency
Message-ID: <202503050332.hlxQQDQk-lkp@intel.com>
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

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-xe/drm-xe-next]
[also build test ERROR on linus/master v6.14-rc5 next-20250304]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Su-Hui/drm-xe-Select-INTEL_VSEC-to-fix-build-dependency/20250227-153437
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20250227073205.1248282-1-suhui%40nfschina.com
patch subject: [PATCH] drm/xe: Select INTEL_VSEC to fix build dependency
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20250305/202503050332.hlxQQDQk-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250305/202503050332.hlxQQDQk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503050332.hlxQQDQk-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: intel_vsec_register
   >>> referenced by xe_vsec.c
   >>>               drivers/gpu/drm/xe/xe_vsec.o:(xe_vsec_init) in archive vmlinux.a

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_VSEC
   Depends on [n]: X86_PLATFORM_DEVICES [=n] && PCI [=y]
   Selected by [y]:
   - DRM_XE [=y] && HAS_IOMEM [=y] && DRM [=y] && PCI [=y] && MMU [=y] && (m [=m] && MODULES [=y] || KUNIT [=y]=y [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
