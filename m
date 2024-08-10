Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F9594DC93
	for <lists+dri-devel@lfdr.de>; Sat, 10 Aug 2024 13:46:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCFC010E103;
	Sat, 10 Aug 2024 11:45:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="maVue8W4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D288F10E103;
 Sat, 10 Aug 2024 11:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723290357; x=1754826357;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8DIEUv9amZ+E2lCgoLiQtJnnKGQaWds7ILyjPec/rbg=;
 b=maVue8W45+qEmCpoC0RdFy5FI75zJBa08cEet2kd2Fu+4Vm1d0SF7oyr
 Rc2phGWo8Zim0Xrd5cW3PFA80cLKUhWiQZlGZlagH8uwCP+lxJ+eqDOS5
 Swc7dTkNGoGZDmZnDBkasBXVstVa2/5KtjVilZTGEm2LAVTV5XilF0CN1
 FYt7ZbZCmAYwaH3hoBQJ3ZNjYueF7+kxW3T5F75AWgujHjeXNhOk+E/i8
 kj0apCq9CbYod9bNz3fwHhHVkFwYWRyybm9M6CG3IUsF/3o/nGMAnMcwl
 a45F40hHDGMovXaRUafnuwY9VcBv7MATVVkgkyCVQpicIIuREBsIWZZTP w==;
X-CSE-ConnectionGUID: nACKb57sTGiPVk7Ikllzrw==
X-CSE-MsgGUID: pQtm/QnnTuyGR4RqPbOIUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="21434575"
X-IronPort-AV: E=Sophos;i="6.09,279,1716274800"; d="scan'208";a="21434575"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2024 04:45:56 -0700
X-CSE-ConnectionGUID: ZE69ZQ+cRkaODyeSfuUf/A==
X-CSE-MsgGUID: 8yfBQNjpRaGLylUsHtViLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,279,1716274800"; d="scan'208";a="57701445"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
 by orviesa010.jf.intel.com with ESMTP; 10 Aug 2024 04:45:06 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sckWt-0009tr-0P;
 Sat, 10 Aug 2024 11:45:03 +0000
Date: Sat, 10 Aug 2024 19:44:16 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, intel-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Helge Deller <deller@gmx.de>, Sam Ravnborg <sam@ravnborg.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, stable@vger.kernel.org
Subject: Re: [PATCH] video/aperture: match the pci device when calling
 sysfb_disable()
Message-ID: <202408101951.tXyqYOzv-lkp@intel.com>
References: <20240809150327.2485848-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240809150327.2485848-1-alexander.deucher@amd.com>
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

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on linus/master v6.11-rc2 next-20240809]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alex-Deucher/video-aperture-match-the-pci-device-when-calling-sysfb_disable/20240810-021357
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240809150327.2485848-1-alexander.deucher%40amd.com
patch subject: [PATCH] video/aperture: match the pci device when calling sysfb_disable()
config: csky-randconfig-001-20240810 (https://download.01.org/0day-ci/archive/20240810/202408101951.tXyqYOzv-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240810/202408101951.tXyqYOzv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408101951.tXyqYOzv-lkp@intel.com/

All errors (new ones prefixed by >>):

   csky-linux-ld: drivers/video/aperture.o: in function `aperture_remove_conflicting_pci_devices':
>> aperture.c:(.text+0x222): undefined reference to `screen_info_pci_dev'
   csky-linux-ld: drivers/video/aperture.o: in function `devm_aperture_acquire_release':
>> aperture.c:(.text+0x2c0): undefined reference to `screen_info'
>> csky-linux-ld: aperture.c:(.text+0x2c4): undefined reference to `screen_info_pci_dev'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
