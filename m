Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7E2ADF54F
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 20:00:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52DF110E8F5;
	Wed, 18 Jun 2025 18:00:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BkhtZwe/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF20B10E8F6;
 Wed, 18 Jun 2025 18:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750269622; x=1781805622;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=AY51LktMBALPiD923VjW1Ue6ct2aMtypau/sy83niBU=;
 b=BkhtZwe//wAHMJLl6sYNLD0NCnZV0yURx9bb4Kelr1rizxup54osM6o1
 E0v4VwEmrLv1anLQ4M3jZS4hRQiSiwjDWfrkdk/jKSZhOvc9DfpCD5GAL
 ndFpt+ozQ1Hi1SLXPGDXFbCaSlwo2JdRKiv8Jf4f37FJDnjRGLJ/ZZEff
 c2/Nq7Y4HIvXF3t2jayRnUgxOZgY4/nQ10JwHeWmVqIEOHYh2F9ibUcjd
 lchzDP8pfwMq/7xf5/AMp/eWFb9lAdliM9WZZ47Ejo8h/7cthfSBk9uH9
 iG1g9GWKWBt6sevuBJrLBulN6R3mvgiN/rkHvNxMZgRdVGG2hlRXpA1Tq w==;
X-CSE-ConnectionGUID: 0Q0PrBcdTNqFJxqSV1O6RA==
X-CSE-MsgGUID: Zcq+HhJyS/2or7AVB5Nddg==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="51734835"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; d="scan'208";a="51734835"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 11:00:20 -0700
X-CSE-ConnectionGUID: kAiU2hH7TT2yv5Q4l9b6SA==
X-CSE-MsgGUID: +jFpxS40T4azDAtAI3NIMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; d="scan'208";a="150655742"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
 by orviesa008.jf.intel.com with ESMTP; 18 Jun 2025 11:00:13 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uRx50-000K1m-2p;
 Wed, 18 Jun 2025 18:00:10 +0000
Date: Thu, 19 Jun 2025 01:59:29 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 wayland-devel@lists.freedesktop.org, harry.wentland@amd.com,
 alex.hung@amd.com, leo.liu@amd.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com,
 shashank.sharma@amd.com, agoins@nvidia.com, joshua@froggi.es,
 mdaenzer@redhat.com, aleixpol@kde.org, xaver.hugl@gmail.com,
 victoria@system76.com, daniel@ffwll.ch, uma.shankar@intel.com,
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com,
 quic_abhinavk@quicinc.com, marcan@marcan.st, Liviu.Dudau@arm.com,
 sashamcintosh@google.com, chaitanya.kumar.borah@intel.com,
 louis.chauvet@bootlin.com, arthurgrillo@riseup.net
Subject: Re: [PATCH V10 15/46] drm/vkms: Add kunit tests for linear and sRGB
 LUTs
Message-ID: <202506190132.r51ujYGM-lkp@intel.com>
References: <20250617041746.2884343-16-alex.hung@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617041746.2884343-16-alex.hung@amd.com>
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

[auto build test ERROR on linus/master]
[also build test ERROR on v6.16-rc2]
[cannot apply to drm-exynos/exynos-drm-next drm/drm-next drm-misc/drm-misc-next next-20250618]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alex-Hung/drm-Add-helper-for-conversion-from-signed-magnitude/20250617-123027
base:   linus/master
patch link:    https://lore.kernel.org/r/20250617041746.2884343-16-alex.hung%40amd.com
patch subject: [PATCH V10 15/46] drm/vkms: Add kunit tests for linear and sRGB LUTs
config: riscv-randconfig-001-20250618 (https://download.01.org/0day-ci/archive/20250619/202506190132.r51ujYGM-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250619/202506190132.r51ujYGM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506190132.r51ujYGM-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "srgb_eotf" [drivers/gpu/drm/vkms/tests/vkms_color_test.ko] undefined!
>> ERROR: modpost: "srgb_inv_eotf" [drivers/gpu/drm/vkms/tests/vkms_color_test.ko] undefined!
>> ERROR: modpost: "linear_eotf" [drivers/gpu/drm/vkms/tests/vkms_color_test.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
