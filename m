Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA8D94674C
	for <lists+dri-devel@lfdr.de>; Sat,  3 Aug 2024 05:59:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FA3110E066;
	Sat,  3 Aug 2024 03:59:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jUA2e/4p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 190E410E066
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Aug 2024 03:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722657564; x=1754193564;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=e+qVDXBmsBwNXODWzwvDL5ZBlopEsbgmumKXw1KF5h8=;
 b=jUA2e/4pbSFSW/qA5GtgMI+jbUAzlsG6IHD89GYl4UBsgpoKAtWy0kgb
 H1y7vHcWQapfnQTqeTnJbrneOCQJVXBoF+A4Q0MFiMSJwaYuunpxuR0yt
 zC1f8em1GrSQKKSD0PfOmMaoHoHGyR2hvhrd/XHtsFvdbpqcMQboqjEE5
 8mIjASWSMw2xN1w1bNHcuMXIlmO0fGYNvphWB0tI7W5+yH/oF6HrVztUD
 z8w0ueItgtvyQtktfJV0V9i0jNjIEQmXCxaguZgMXR/KX8pXRdT95mQAU
 fjAu+8/MZlFgv45fRngP86a3pJ9BFwdFqaquYsAUEs+rSRvMDmnOA3KAS Q==;
X-CSE-ConnectionGUID: wU3WPVu/RkGILgyi79EXzw==
X-CSE-MsgGUID: mKBwltSRRoqgnNPTmEUjEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="43208570"
X-IronPort-AV: E=Sophos;i="6.09,259,1716274800"; d="scan'208";a="43208570"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2024 20:59:23 -0700
X-CSE-ConnectionGUID: oB8BBBZRTGqgHkGvqrfHtg==
X-CSE-MsgGUID: 9MktIYu1Tp2YXj16ZesuCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,259,1716274800"; d="scan'208";a="59978477"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
 by fmviesa005.fm.intel.com with ESMTP; 02 Aug 2024 20:59:21 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sa5vL-000xzl-05;
 Sat, 03 Aug 2024 03:59:19 +0000
Date: Sat, 3 Aug 2024 11:59:15 +0800
From: kernel test robot <lkp@intel.com>
To: Sui Jingfeng <sui.jingfeng@linux.dev>,
 Markus Elfring <elfring@users.sourceforge.net>
Cc: oe-kbuild-all@lists.linux.dev, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: Re: [PATCH v5 1/2] drm/loongson: Introduce component framework support
Message-ID: <202408031152.PavM0ToR-lkp@intel.com>
References: <20240728152858.346211-2-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240728152858.346211-2-sui.jingfeng@linux.dev>
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

Hi Sui,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v6.11-rc1 next-20240802]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sui-Jingfeng/drm-loongson-Introduce-component-framework-support/20240728-233029
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240728152858.346211-2-sui.jingfeng%40linux.dev
patch subject: [PATCH v5 1/2] drm/loongson: Introduce component framework support
config: mips-randconfig-r111-20240802 (https://download.01.org/0day-ci/archive/20240803/202408031152.PavM0ToR-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 430b90f04533b099d788db2668176038be38c53b)
reproduce: (https://download.01.org/0day-ci/archive/20240803/202408031152.PavM0ToR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408031152.PavM0ToR-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/loongson/lsdc_drv.c:154:28: sparse: sparse: symbol 'lsdc_pci_component_ops' was not declared. Should it be static?

vim +/lsdc_pci_component_ops +154 drivers/gpu/drm/loongson/lsdc_drv.c

   153	
 > 154	const struct component_ops lsdc_pci_component_ops = {
   155		.bind = lsdc_pci_component_bind,
   156		.unbind = lsdc_pci_component_unbind,
   157	};
   158	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
