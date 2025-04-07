Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71693A7F06D
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 00:44:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B300F10E3ED;
	Mon,  7 Apr 2025 22:43:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZALjdSfp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0F6910E3F8;
 Mon,  7 Apr 2025 22:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744065836; x=1775601836;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=uNM2vAT4T9rRdI5ssfHwnmd9JW15gSnXf3+n+ua55bc=;
 b=ZALjdSfpVy+0UiO+GIc5iwXGEkqPHkGEvlVmpVZH1TGBxevNjUQqKl/9
 n7uTvmN8EPBK0/VANgex25KCxa7GT4L26l6PkexgeZZ8GPsUQrvwx2SSd
 3Ht82Kjg4jzdnKvw3Se3jnwvrivY/dBEd1p+9Twq6B4h0kJhNr3uNBy2Z
 H0l5bqb7Ol4q15XGF+63UySnPyIOEn81mJ6MmhdWGCgdo8cE3Ytzj7YFB
 g9poGwUAvp8H1thNE+7JklwBgurkwbZ7Bvzp9Uw5/qhpvAJNUhvk4jag8
 xdc+TPqSp5WlEORQFW6Jpqt9PD9TKPhlr44CpO1WUU77EDsDPVYXpDbAL g==;
X-CSE-ConnectionGUID: F04YQLLIQHK5cY8PEFt5sA==
X-CSE-MsgGUID: wKuNuG6mQzWCWUlID6Mbnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="49324765"
X-IronPort-AV: E=Sophos;i="6.15,196,1739865600"; d="scan'208";a="49324765"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 15:43:55 -0700
X-CSE-ConnectionGUID: Xpm/jH9SS/aATrUuZeVSfQ==
X-CSE-MsgGUID: WtXlzF/YSqim4cpIXtU8XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,196,1739865600"; d="scan'208";a="132813110"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
 by fmviesa005.fm.intel.com with ESMTP; 07 Apr 2025 15:43:46 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1u1vBv-0003sD-34;
 Mon, 07 Apr 2025 22:43:43 +0000
Date: Tue, 8 Apr 2025 06:42:50 +0800
From: kernel test robot <lkp@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Danilo Krummrich <dakr@redhat.com>,
 Boris Brezillon <bbrezillon@kernel.org>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 16/32] Introduce drm_gpuvm_sm_map_ops_flags enums for
 sm_map_ops
Message-ID: <202504080624.tIlwDwWT-lkp@intel.com>
References: <20250407101719.3350996-17-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407101719.3350996-17-himal.prasad.ghimiray@intel.com>
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

Hi Himal,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-xe/drm-xe-next]
[cannot apply to linus/master v6.15-rc1 next-20250407]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Himal-Prasad-Ghimiray/drm-xe-Introduce-xe_vma_op_prefetch_range-struct-for-prefetch-of-ranges/20250407-215536
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20250407101719.3350996-17-himal.prasad.ghimiray%40intel.com
patch subject: [PATCH v2 16/32] Introduce drm_gpuvm_sm_map_ops_flags enums for sm_map_ops
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20250408/202504080624.tIlwDwWT-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250408/202504080624.tIlwDwWT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504080624.tIlwDwWT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> include/drm/drm_gpuvm.h:233: warning: expecting prototype for enum drm_gpuvm_madvise_flags. Prototype was for enum drm_gpuvm_sm_map_ops_flags instead


vim +233 include/drm/drm_gpuvm.h

   213	
   214	/**
   215	 * enum drm_gpuvm_madvise_flags - flags for drm_gpuvm split/merge ops
   216	 */
   217	enum drm_gpuvm_sm_map_ops_flags {
   218		/**
   219		 * @DRM_GPUVM_SM_MAP_NOT_MADVISE: DEFAULT sm_map ops
   220		 */
   221		DRM_GPUVM_SM_MAP_NOT_MADVISE = 0,
   222	
   223		/**
   224		 * @DRM_GPUVM_SKIP_GEM_OBJ_VA_SPLIT_MADVISE: This flag is used by
   225		 * drm_gpuvm_sm_map_ops_create to iterate over GPUVMA's in the
   226		 * user-provided range and split the existing non-GEM object VMA if the
   227		 * start or end of the input range lies within it. The operations can
   228		 * create up to 2 REMAPS and 2 MAPs. Unlike drm_gpuvm_sm_map_ops_flags
   229		 * in default mode, the operation with this flag will never have UNMAPs and
   230		 * merges, and can be without any final operations.
   231		 */
   232		DRM_GPUVM_SKIP_GEM_OBJ_VA_SPLIT_MADVISE = BIT(0),
 > 233	};
   234	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
