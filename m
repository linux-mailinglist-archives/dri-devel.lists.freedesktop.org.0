Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F11EC4BBD5
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 07:54:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C613510E337;
	Tue, 11 Nov 2025 06:53:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DN22A1Fg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FB1910E337;
 Tue, 11 Nov 2025 06:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762844038; x=1794380038;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=EC2gxUnljDATsyKRjwf6LU4khea07FYDr3Y7yqvUHXQ=;
 b=DN22A1FgcQmzA0lfRv1jrK6Cn+WglxywwNy9RVB84SA/cwfGct335iVz
 bPGro+XdRpeDpQ5ekHwBEYDdimQ0OVcohznsDbY0to5KNU85aGqr5oXNy
 UNK2QDJrnZytoiDv/mnqEg4aNYaJ3pF2ocl9QyYyeWLjoNfDttN1eVTU7
 GdtJqkzcsM3021xv4k6D2RAnh1OcTMSPnmrco7E9W9NVhagJDIlw+mlrb
 DagYvH4uiBnPuHQANU6nvs4LKqiiE5oaJIbbQUp5vbKmLL0dC6Ru8iFDO
 1YY852dQimiAxmEolJPxrcxfYaemRr8xDrMxfYLXsIZDKCzd/GklWcNv6 g==;
X-CSE-ConnectionGUID: VEjSg3BMTK+8u338TZv94w==
X-CSE-MsgGUID: w1TZEFkHRWudKZ5EgLGBXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="65058780"
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="65058780"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 22:53:58 -0800
X-CSE-ConnectionGUID: 5ScXENYnSbibb+G69kMoLw==
X-CSE-MsgGUID: IYpuK8w5T/+x+omZ2UJn9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="194075963"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
 by orviesa005.jf.intel.com with ESMTP; 10 Nov 2025 22:53:56 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1vIiGH-0002sB-1a;
 Tue, 11 Nov 2025 06:53:53 +0000
Date: Tue, 11 Nov 2025 14:52:55 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 13/24] drm/vblank: pass vblank to
 drm_vblank_count_and_time()
Message-ID: <202511111453.UaceJIMy-lkp@intel.com>
References: <39a203dcc71aa4bfcf349d9c85672a6b9db4201f.1762791343.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <39a203dcc71aa4bfcf349d9c85672a6b9db4201f.1762791343.git.jani.nikula@intel.com>
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

Hi Jani,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20251110]
[cannot apply to drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip drm-misc/drm-misc-next linus/master v6.18-rc5 v6.18-rc4 v6.18-rc3 v6.18-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jani-Nikula/drm-vblank-Unexport-drm_wait_one_vblank/20251111-024823
base:   next-20251110
patch link:    https://lore.kernel.org/r/39a203dcc71aa4bfcf349d9c85672a6b9db4201f.1762791343.git.jani.nikula%40intel.com
patch subject: [PATCH 13/24] drm/vblank: pass vblank to drm_vblank_count_and_time()
config: openrisc-randconfig-r071-20251111 (https://download.01.org/0day-ci/archive/20251111/202511111453.UaceJIMy-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251111/202511111453.UaceJIMy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511111453.UaceJIMy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/drm_vblank.c:954 function parameter 'vblank' not described in 'drm_vblank_count_and_time'
>> Warning: drivers/gpu/drm/drm_vblank.c:954 function parameter 'vblank' not described in 'drm_vblank_count_and_time'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
