Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA51BB1F207
	for <lists+dri-devel@lfdr.de>; Sat,  9 Aug 2025 06:08:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E74810E04F;
	Sat,  9 Aug 2025 04:08:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X3ZuOBGq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4333110E04F;
 Sat,  9 Aug 2025 04:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754712509; x=1786248509;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=nLTH66A7etc3VgPR6sxDdDU5RW3WL7uD7qW4F3WgYcw=;
 b=X3ZuOBGqT4meGsxTK9xxLqXvuzTxoJwPcXVlUp8zHzuEGHORQPzZZUHK
 Nu0zVg7cCPLW3jIayZCL2kbLNrMpqqMcZQFazpNbE2r3Z5+wK6ol+HwvG
 w4450s792DiegWjn7mG+LHN703eaIBtbHQx6iku6SMt9o0iYUijkKjPiS
 6cithcsTlfYlWjTXGoSFErfbLFyeN4jx7H3N6wXsfyCPB/PJl4+U/tl83
 r2twF9SlCikkiIwrHKJ4zICRI/MTDK18YoaQWF+8qXXChRPS4a1Zj4wr6
 9REm6IPl0J5Ogr3FVYMOtHIEu8na0Tjyy5Y+CDhciyDelNd7sk5oWh4sP Q==;
X-CSE-ConnectionGUID: /Hw2aKbjRgupkN6eC96XIA==
X-CSE-MsgGUID: xrV4Z2XRRuS3mELexcx7CA==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="59667020"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="59667020"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 21:08:29 -0700
X-CSE-ConnectionGUID: uQt3nQFORbap7DXQpkIIpQ==
X-CSE-MsgGUID: qzaLRsITRb+s0C9xrv6OxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="164699862"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
 by orviesa010.jf.intel.com with ESMTP; 08 Aug 2025 21:08:24 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1ukarv-0004Uy-0o;
 Sat, 09 Aug 2025 04:07:57 +0000
Date: Sat, 9 Aug 2025 12:07:21 +0800
From: kernel test robot <lkp@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, matthew.brost@intel.com
Subject: Re: [PATCH] drm/ttm: WIP limit the TTM pool to 32bit CPUs
Message-ID: <202508091134.xJZroqY6-lkp@intel.com>
References: <20250806132838.1831-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250806132838.1831-1-christian.koenig@amd.com>
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

Hi Christian,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-exynos/exynos-drm-next]
[also build test ERROR on linus/master v6.16 next-20250808]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-K-nig/drm-ttm-WIP-limit-the-TTM-pool-to-32bit-CPUs/20250806-212941
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
patch link:    https://lore.kernel.org/r/20250806132838.1831-1-christian.koenig%40amd.com
patch subject: [PATCH] drm/ttm: WIP limit the TTM pool to 32bit CPUs
config: um-randconfig-001-20250809 (https://download.01.org/0day-ci/archive/20250809/202508091134.xJZroqY6-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 3769ce013be2879bf0b329c14a16f5cb766f26ce)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250809/202508091134.xJZroqY6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508091134.xJZroqY6-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "set_pages_array_wc" [drivers/gpu/drm/ttm/ttm.ko] undefined!
>> ERROR: modpost: "set_pages_array_uc" [drivers/gpu/drm/ttm/ttm.ko] undefined!
>> ERROR: modpost: "set_pages_wb" [drivers/gpu/drm/ttm/ttm.ko] undefined!
>> ERROR: modpost: "set_pages_array_wb" [drivers/gpu/drm/ttm/ttm.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
