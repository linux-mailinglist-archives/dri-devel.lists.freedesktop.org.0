Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D412B16947
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 01:23:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E67610E159;
	Wed, 30 Jul 2025 23:23:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="afX7mFn8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA67710E056;
 Wed, 30 Jul 2025 23:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753917810; x=1785453810;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=97Gbm9D0f3wusMe6mUOiZ+E5OPLz50mBZP+eodJOiNI=;
 b=afX7mFn8zD5nUDVMLVQDn3C59rSc+wUlb89djz3Wifh1ccjOgNt4EmT0
 4YiFj9x/p7Gr8iQ0BZRHxQeqxA2q+jV2n9feo8dgHUQDvPmwnTBbKP+Y0
 sKOdwchmwIAAbsEfdJnMcX9/cy0lSq7GiNHdXTTc7WBoJ2wKoXP/hMb5b
 RID2KJEv4Pi7oSVxwLMUcXW6IsFPO1Fs5J/7QnAW0lk1bjkJeXaXRXqz1
 UHpmJLUqGDAqHn9LL5JPwr9vivAM70+oXS74If5837KMSSt04cRJjoAHs
 748P246pdNp6eCDOF4tugvRlKehfBe+wqzAZUllLtfijR6fqhJmZ1AeBA A==;
X-CSE-ConnectionGUID: b8BimLukRx6YlF42YOpBEg==
X-CSE-MsgGUID: krFltzFqThK8l59+1Ddsfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="56098815"
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; d="scan'208";a="56098815"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 16:23:29 -0700
X-CSE-ConnectionGUID: /Few2qVnRFeFNU1Mk9juaw==
X-CSE-MsgGUID: //L3RPHQTc+hVIEvIvOX3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; d="scan'208";a="167596178"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
 by orviesa004.jf.intel.com with ESMTP; 30 Jul 2025 16:23:26 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uhG8p-0003EK-2u;
 Wed, 30 Jul 2025 23:23:23 +0000
Date: Thu, 31 Jul 2025 07:23:13 +0800
From: kernel test robot <lkp@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, Matthew Brost <matthew.brost@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Danilo Krummrich <dakr@redhat.com>,
 Caterina Shablia <caterina.shablia@collabora.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v5 01/25] drm/gpuvm: Pass map arguments through a struct
Message-ID: <202507310715.d6MBnXvv-lkp@intel.com>
References: <20250730130050.1001648-2-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250730130050.1001648-2-himal.prasad.ghimiray@intel.com>
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

[auto build test WARNING on next-20250730]
[cannot apply to drm-xe/drm-xe-next linus/master v6.16 v6.16-rc7 v6.16-rc6 v6.16]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Himal-Prasad-Ghimiray/drm-gpuvm-Pass-map-arguments-through-a-struct/20250731-003813
base:   next-20250730
patch link:    https://lore.kernel.org/r/20250730130050.1001648-2-himal.prasad.ghimiray%40intel.com
patch subject: [PATCH v5 01/25] drm/gpuvm: Pass map arguments through a struct
config: i386-buildonly-randconfig-002-20250731 (https://download.01.org/0day-ci/archive/20250731/202507310715.d6MBnXvv-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250731/202507310715.d6MBnXvv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507310715.d6MBnXvv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/drm_gpuvm.c:2471 function parameter 'req' not described in 'drm_gpuvm_sm_map_exec_lock'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
