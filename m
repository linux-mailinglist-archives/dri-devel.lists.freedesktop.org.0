Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A38A0A369
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jan 2025 12:41:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6E0910E1EB;
	Sat, 11 Jan 2025 11:41:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oI+S0nNj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D8E010E1EB
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Jan 2025 11:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736595706; x=1768131706;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=kpTdDuh3MJpcoC0hYViYwGL9goAThPxJBrnYUuGGV/o=;
 b=oI+S0nNjJc9+egF7f5jgCdfFZ7FY/Fh/bKl2YvIeM5D2NAbsBNask7zM
 O31f41Vwoq7zqVWLVTk4C/Pkf7SBRgQZTwPjN27KsbJQ0Z/CQWkgGDsIt
 VW+AkZEza8llKhprot50bvbCmHbOPNQYc3th0JK1ZNHlJJdKeXRN54rh9
 1a7STCC814ZtFx5f7hRKx4ocW+5V8CyXHwEmhgbnirALQNJkg55Ij/jk1
 lySsvMWBaDdEkVHs6PIj6114vloaXeDabDEss3jPlqIHA9F8AX53BBAcB
 a7ItiWIHJ3zZPuXmi1ZCBZWbhYIm1x1JgjwxuVBj7U3kxTqqPAb+8GcjK Q==;
X-CSE-ConnectionGUID: 1/MqQq+cTNOOdCpLWbSpzw==
X-CSE-MsgGUID: R44q1nHdTbiQSv8OzI9F7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="47876719"
X-IronPort-AV: E=Sophos;i="6.12,307,1728975600"; d="scan'208";a="47876719"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2025 03:41:46 -0800
X-CSE-ConnectionGUID: gncxJD1ZRG2Sv60LQlcSKw==
X-CSE-MsgGUID: Lhc/Z98qQw6NCPhWHY/ikA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="104492304"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
 by orviesa007.jf.intel.com with ESMTP; 11 Jan 2025 03:41:42 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tWZs4-000Kat-19;
 Sat, 11 Jan 2025 11:41:40 +0000
Date: Sat, 11 Jan 2025 19:40:48 +0800
From: kernel test robot <lkp@intel.com>
To: Wayne Lin <Wayne.Lin@amd.com>, dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, lyude@redhat.com, harry.wentland@amd.com,
 imre.deak@intel.com, ville.syrjala@linux.intel.com,
 Wayne Lin <Wayne.Lin@amd.com>, Harry Wentland <hwentlan@amd.com>
Subject: Re: [Patch v3 2/2] drm/dp_mst: Add helper to get port number at
 specific LCT from RAD
Message-ID: <202501111927.qHX3ZcBP-lkp@intel.com>
References: <20250110023618.66401-3-Wayne.Lin@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110023618.66401-3-Wayne.Lin@amd.com>
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

Hi Wayne,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on drm-exynos/exynos-drm-next linus/master v6.13-rc6 next-20250110]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wayne-Lin/drm-dp_mst-Fix-drm-RAD-print/20250110-103837
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20250110023618.66401-3-Wayne.Lin%40amd.com
patch subject: [Patch v3 2/2] drm/dp_mst: Add helper to get port number at specific LCT from RAD
config: x86_64-randconfig-121-20250111 (https://download.01.org/0day-ci/archive/20250111/202501111927.qHX3ZcBP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501111927.qHX3ZcBP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501111927.qHX3ZcBP-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/display/drm_dp_mst_topology.c:201:81: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned char [usertype] *rad @@     got unsigned char const [usertype] *rad @@
   drivers/gpu/drm/display/drm_dp_mst_topology.c:201:81: sparse:     expected unsigned char [usertype] *rad
   drivers/gpu/drm/display/drm_dp_mst_topology.c:201:81: sparse:     got unsigned char const [usertype] *rad
   drivers/gpu/drm/display/drm_dp_mst_topology.c: note: in included file (through include/linux/smp.h, include/linux/lockdep.h, include/linux/spinlock.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +201 drivers/gpu/drm/display/drm_dp_mst_topology.c

   193	
   194	static int
   195	drm_dp_mst_rad_to_str(const u8 rad[8], u8 lct, char *out, size_t len)
   196	{
   197		int i;
   198		u8 unpacked_rad[16] = {};
   199	
   200		for (i = 0; i < lct; i++)
 > 201			unpacked_rad[i] = drm_dp_mst_get_ufp_num_at_lct_from_rad(i + 1, rad);
   202	
   203		/* TODO: Eventually add something to printk so we can format the rad
   204		 * like this: 1.2.3
   205		 */
   206		return snprintf(out, len, "%*phC", lct, unpacked_rad);
   207	}
   208	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
