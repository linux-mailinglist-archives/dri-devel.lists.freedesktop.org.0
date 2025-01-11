Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F099A0A15C
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jan 2025 07:52:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70B0F10E55C;
	Sat, 11 Jan 2025 06:52:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iHYfRKgf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A079D10E55C
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Jan 2025 06:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736578329; x=1768114329;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0+xtT6Jwc0s5xqbli+tXBZHABmdkXdLoSgGm0wilX8g=;
 b=iHYfRKgfyZbxudVRZa+oAho4HDkPdsrDsqHEUScZ+7THdhAlhGhvj0FN
 FQHc/9jKWzJ+S2fhqDryxsiGrlsAHsOxXMMHYkuHkkt3fvqIQGF8TiS17
 EU9+8nEEva0A+2tgYdZIRr6/oFYqam/ErJYMl0ALnXTrqziNmCzwvyZs1
 qZsbnxtedBn+Ar9QgftpGo6htZVSuAgZD7N1AsSScAzqMQ0U4hVL4x9B2
 3n+mIcpiz4NYAcNO8WISDXWqoZk/rGoxDyQovsYRhBNu/WWmRBOzZeWX/
 AQ8jX9m6uA3WYpEEuetItAHSAA2+530+EPLLDQ9/lzI4RTv0lXU58R68J Q==;
X-CSE-ConnectionGUID: fGmS4zXhSUu+LnOAYntHDA==
X-CSE-MsgGUID: Df2pifT9TU6+9XT9CSRWpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="62251782"
X-IronPort-AV: E=Sophos;i="6.12,306,1728975600"; d="scan'208";a="62251782"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2025 22:52:09 -0800
X-CSE-ConnectionGUID: Q7fcj4y8SJ6TUbzzPBJQqQ==
X-CSE-MsgGUID: G6Jfk25ER7CSQ9gpOrpSvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,306,1728975600"; d="scan'208";a="103873115"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
 by fmviesa007.fm.intel.com with ESMTP; 10 Jan 2025 22:52:07 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tWVLp-000KJU-0M;
 Sat, 11 Jan 2025 06:52:05 +0000
Date: Sat, 11 Jan 2025 14:51:23 +0800
From: kernel test robot <lkp@intel.com>
To: Wayne Lin <Wayne.Lin@amd.com>, dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, lyude@redhat.com, harry.wentland@amd.com,
 imre.deak@intel.com, ville.syrjala@linux.intel.com,
 Wayne Lin <Wayne.Lin@amd.com>, Harry Wentland <hwentlan@amd.com>
Subject: Re: [Patch v3 2/2] drm/dp_mst: Add helper to get port number at
 specific LCT from RAD
Message-ID: <202501111402.k6z2xVCI-lkp@intel.com>
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
[also build test WARNING on drm-exynos/exynos-drm-next linus/master drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip v6.13-rc6 next-20250110]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wayne-Lin/drm-dp_mst-Fix-drm-RAD-print/20250110-103837
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20250110023618.66401-3-Wayne.Lin%40amd.com
patch subject: [Patch v3 2/2] drm/dp_mst: Add helper to get port number at specific LCT from RAD
config: csky-randconfig-002-20250111 (https://download.01.org/0day-ci/archive/20250111/202501111402.k6z2xVCI-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501111402.k6z2xVCI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501111402.k6z2xVCI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/display/drm_dp_mst_topology.c: In function 'drm_dp_mst_rad_to_str':
>> drivers/gpu/drm/display/drm_dp_mst_topology.c:201:81: warning: passing argument 2 of 'drm_dp_mst_get_ufp_num_at_lct_from_rad' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     201 |                 unpacked_rad[i] = drm_dp_mst_get_ufp_num_at_lct_from_rad(i + 1, rad);
         |                                                                                 ^~~
   drivers/gpu/drm/display/drm_dp_mst_topology.c:179:52: note: expected 'u8 *' {aka 'unsigned char *'} but argument is of type 'const u8 *' {aka 'const unsigned char *'}
     179 | drm_dp_mst_get_ufp_num_at_lct_from_rad(u8 lct, u8 *rad)
         |                                                ~~~~^~~


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
