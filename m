Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DDC3AED923
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 11:56:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B5A410E229;
	Mon, 30 Jun 2025 09:56:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CzRWn/r2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9510F10E229
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 09:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751277398; x=1782813398;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=lRurOeZ7EKZfBhd+PazQpT0UPsCtzFmVV3p9ECRTaxo=;
 b=CzRWn/r2TjTMKm3l5tUKR3fGibva3aUl92K0crjh4Uo94Hs0tMrR1EMy
 2kb2kXiHpWgUCLz0xjHid1dEAe+Tm0ZAqN+86+zjJy/bJmxNotfSmGPJm
 aBCcNfCaL+iA1NCVKoCyjplU7gix2Gnvx30vXKzfbWquykqqgjKRwOSEI
 Fe3weER7mSTbDB+oO7fopUCJDdU+B8VAfFf8rD3r73QFzZHFGo1leGEW6
 nkygTG1D1Y6hT6hOGIKgtJsbunF50aEj94bww/XDUf1N1mUyEenHtDB+H
 hsTW3M6SIbLVDSmVpN9I8zYRORa9m28+8E2AgMXxtj/cLLiIDedChnYZq A==;
X-CSE-ConnectionGUID: J85WiWipRseghVuYQ3953Q==
X-CSE-MsgGUID: m7aTLBOgRj6H0FCFYqcYFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="70932091"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; d="scan'208";a="70932091"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 02:56:38 -0700
X-CSE-ConnectionGUID: dNZuO+IMSw25ZROr0r/Png==
X-CSE-MsgGUID: Slrx0BFzS4G/O/KiCbWXHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; d="scan'208";a="153044245"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
 by fmviesa007.fm.intel.com with ESMTP; 30 Jun 2025 02:56:35 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uWBFY-000Yks-2G;
 Mon, 30 Jun 2025 09:56:32 +0000
Date: Mon, 30 Jun 2025 17:56:00 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Johannes Weiner <hannes@cmpxchg.org>,
 Christian Koenig <christian.koenig@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Dave Chinner <david@fromorbit.com>,
 Kairui Song <kasong@tencent.com>, Dave Airlie <airlied@redhat.com>
Subject: Re: [PATCH 10/17] ttm: add a memcg accounting flag to the
 alloc/populate APIs
Message-ID: <202506301731.dRh8GUQZ-lkp@intel.com>
References: <20250630045005.1337339-11-airlied@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630045005.1337339-11-airlied@gmail.com>
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

Hi Dave,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm/drm-next]
[cannot apply to akpm-mm/mm-everything linus/master v6.16-rc4 next-20250630]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Airlie/drm-ttm-use-gpu-mm-stats-to-track-gpu-memory-allocations-v2/20250630-134938
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20250630045005.1337339-11-airlied%40gmail.com
patch subject: [PATCH 10/17] ttm: add a memcg accounting flag to the alloc/populate APIs
config: riscv-randconfig-001-20250630 (https://download.01.org/0day-ci/archive/20250630/202506301731.dRh8GUQZ-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250630/202506301731.dRh8GUQZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506301731.dRh8GUQZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/ttm/ttm_bo.c:1256 function parameter 'memcg_account' not described in 'ttm_bo_populate'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
