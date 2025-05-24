Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99998AC2E19
	for <lists+dri-devel@lfdr.de>; Sat, 24 May 2025 09:28:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B768C10E08C;
	Sat, 24 May 2025 07:28:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NXDs0tas";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66C7A10E08C
 for <dri-devel@lists.freedesktop.org>; Sat, 24 May 2025 07:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748071720; x=1779607720;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=08Ha9ZQm/alwbTSKW0NzYSY0G7SJtdgIjtObu/iwA7I=;
 b=NXDs0tastcOFz3nkMQtT112LRzqOpwp+fTsgaJWvpRpKqvOkVNfnyQTJ
 Q7XgOIsn+6tyx8l+vkNeHy47KkSNnr6THDo0tsgPB8MyK7QqlMo1dDyCk
 SEJffL9ca2moT6gC8+GWmP2bFxwmcwca2JxaT7CICCz421VJ+7T+q8Y0u
 ziOik3M4MzoKu8E0IqP717I52vvM5idpSDRGvIbhXHLAO75oF26lDoaLW
 573JP+66JXjXCHDlHSwXGYFxhamVPBcBDuuIdnkWU8TmbcWK2fOiGCTIP
 NFzHaFGZJLxL/Y3X0xtEfEXJTSXopOU1XcHis/L5bFeUZkr89T1q18UGC A==;
X-CSE-ConnectionGUID: L95+fCqKSs6IQeQbX2OlHQ==
X-CSE-MsgGUID: tbch4FC7T7aij9aEgMY8mQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="50271795"
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; d="scan'208";a="50271795"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2025 00:28:34 -0700
X-CSE-ConnectionGUID: E2J9CX0ERb6Kjnh+WjoNBg==
X-CSE-MsgGUID: Oi0FgC3LQQ++LyK+M10u1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; d="scan'208";a="141381350"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
 by orviesa010.jf.intel.com with ESMTP; 24 May 2025 00:28:30 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uIjIx-000R1I-2w;
 Sat, 24 May 2025 07:28:27 +0000
Date: Sat, 24 May 2025 15:28:27 +0800
From: kernel test robot <lkp@intel.com>
To: mhkelley58@gmail.com, simona@ffwll.ch, deller@gmx.de,
 haiyangz@microsoft.com, kys@microsoft.com, wei.liu@kernel.org,
 decui@microsoft.com, akpm@linux-foundation.org
Cc: oe-kbuild-all@lists.linux.dev, weh@microsoft.com, tzimmermann@suse.de,
 hch@lst.de, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hyperv@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v3 3/4] fbdev/deferred-io: Support contiguous kernel
 memory framebuffers
Message-ID: <202505241553.VSXoFOvX-lkp@intel.com>
References: <20250523161522.409504-4-mhklinux@outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523161522.409504-4-mhklinux@outlook.com>
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

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linus/master v6.15-rc7 next-20250523]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/mhkelley58-gmail-com/mm-Export-vmf_insert_mixed_mkwrite/20250524-001707
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250523161522.409504-4-mhklinux%40outlook.com
patch subject: [PATCH v3 3/4] fbdev/deferred-io: Support contiguous kernel memory framebuffers
config: arm-randconfig-001-20250524 (https://download.01.org/0day-ci/archive/20250524/202505241553.VSXoFOvX-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250524/202505241553.VSXoFOvX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505241553.VSXoFOvX-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "vmf_insert_pfn" [drivers/video/fbdev/core/fb.ko] undefined!
>> ERROR: modpost: "vmf_insert_mixed_mkwrite" [drivers/video/fbdev/core/fb.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
