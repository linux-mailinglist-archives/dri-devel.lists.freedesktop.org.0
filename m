Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B60AD0BD2
	for <lists+dri-devel@lfdr.de>; Sat,  7 Jun 2025 10:03:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CEC110E294;
	Sat,  7 Jun 2025 08:03:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BRl9WB13";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92D1510E182;
 Sat,  7 Jun 2025 08:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749283407; x=1780819407;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Gs0/L07bwWRmKkXQfcoB3ZbYMxp58VlEV5ty/NWVzHE=;
 b=BRl9WB13S+VxninucD12Q8SGx07lsp0hS3WOWJnPeHEjS+dDQtV6r2Mk
 bRV7LBNdKhcFhaJoufa2R0cd9JS0wqsTMieImymsbkN+LAlg/18pU8BGE
 8g8+SG0ZAeVGASO8VpPF9+2YlEFWJsIosBUbSzpUA1Kk4dOWsVvjK39Vs
 m8FTv+iUe2h1zCUxT7581rbn+FBkOpOFYLEjjq76bbu8OFHoXA8NxBcKR
 80CN2bExJvO0+BGQXKvD34VWYrP6jyCjuxmkgnuqSQ7SFg7gT+wWd8uK8
 ib0Z2n0lRB8kYs7Unio0xYymM18eRi4lmgXk2GDbkZjWvB0SoKNHbW+9U w==;
X-CSE-ConnectionGUID: h0sGMOp5RyyWZD+75pISvg==
X-CSE-MsgGUID: wiYKGhdjQWOV/Y5k/DPlaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="61696884"
X-IronPort-AV: E=Sophos;i="6.16,217,1744095600"; d="scan'208";a="61696884"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2025 01:03:27 -0700
X-CSE-ConnectionGUID: MheFn8i6R9uGWhmdgN3QJQ==
X-CSE-MsgGUID: TI28mgLoTF67k20E3fuf+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,217,1744095600"; d="scan'208";a="150861704"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
 by orviesa003.jf.intel.com with ESMTP; 07 Jun 2025 01:03:23 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uNoWO-0005YD-2T;
 Sat, 07 Jun 2025 08:03:20 +0000
Date: Sat, 7 Jun 2025 16:02:27 +0800
From: kernel test robot <lkp@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, alexander.usyskin@intel.com,
 gregkh@linuxfoundation.org, daniele.ceraolospurio@intel.com, jgg@nvidia.com
Subject: Re: [PATCH v2 10/10] [CI]drm/xe/xe_late_bind_fw: Select
 INTEL_MEI_LATE_BIND for CI Do not review
Message-ID: <202506071532.WlVvupfu-lkp@intel.com>
References: <20250606175707.1403384-11-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250606175707.1403384-11-badal.nilawar@intel.com>
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

Hi Badal,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-xe/drm-xe-next]
[also build test WARNING on next-20250606]
[cannot apply to char-misc/char-misc-testing char-misc/char-misc-next char-misc/char-misc-linus drm-i915/for-linux-next drm-i915/for-linux-next-fixes linus/master v6.15]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Badal-Nilawar/mei-bus-add-mei_cldev_mtu-interface/20250607-015525
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20250606175707.1403384-11-badal.nilawar%40intel.com
patch subject: [PATCH v2 10/10] [CI]drm/xe/xe_late_bind_fw: Select INTEL_MEI_LATE_BIND for CI Do not review
config: alpha-kismet-CONFIG_INTEL_MEI_LATE_BIND-CONFIG_DRM_XE-0-0 (https://download.01.org/0day-ci/archive/20250607/202506071532.WlVvupfu-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250607/202506071532.WlVvupfu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506071532.WlVvupfu-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for INTEL_MEI_LATE_BIND when selected by DRM_XE
   WARNING: unmet direct dependencies detected for INTEL_MEI_LATE_BIND
     Depends on [n]: INTEL_MEI [=n] && DRM_XE [=y]
     Selected by [y]:
     - DRM_XE [=y] && HAS_IOMEM [=y] && DRM [=y] && PCI [=y] && MMU [=y] && (m [=m] && MODULES [=y] || KUNIT [=y]=y [=y]) && (INTEL_VSEC [=n] || !INTEL_VSEC [=n]) && (X86_PLATFORM_DEVICES [=n] || !X86 || !ACPI)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
