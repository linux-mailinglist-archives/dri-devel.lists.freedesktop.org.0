Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B93FB94FAC5
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 02:39:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3113D10E145;
	Tue, 13 Aug 2024 00:39:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E7A5c60M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5DF410E145;
 Tue, 13 Aug 2024 00:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723509590; x=1755045590;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=kKBDWhHjGWEtOgUPL2LtV+bhsd+NyypdZgjZaBPSHoY=;
 b=E7A5c60MlybMr1BlqpMGcEpEVK1mPRYpJLgKXTU8cr3fvY2oiCt/3rKc
 TNWCJQTx40TdVgVpIluL9ek3eJgnoBch8H8CqWLY8FB7XedzTlqzdLKPa
 bPv5sxX8E47Dxay4mGwSbVMelZOSoDozBUWyTLcHd8I1qFK8JNcSDTaEV
 xudwBldKAlhrGoyz2lIHBXeJEBHq5viXoVlka9q6GEOG/C+BciSurwc1E
 7Rk7U3RP1pMvXGnPxM0kYWvbTiTNY84tY6SJoTyEVPLSNknDekZMzRZ8R
 VYskc+Ezupm6pTVDvyAfeAnKTmnEnzv/u5vsbD6wqRZwod+1xe73pXtJR g==;
X-CSE-ConnectionGUID: lNZ2sThjQMyUfJ/aot+/TQ==
X-CSE-MsgGUID: lCCs//EzRYaAzcBs3CHFqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="21793827"
X-IronPort-AV: E=Sophos;i="6.09,284,1716274800"; d="scan'208";a="21793827"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 17:39:49 -0700
X-CSE-ConnectionGUID: lyaNmWkIRoe32jnzSRTaiQ==
X-CSE-MsgGUID: 6tKtG5pARo6uQ0whq2Or/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,284,1716274800"; d="scan'208";a="58553687"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
 by fmviesa010.fm.intel.com with ESMTP; 12 Aug 2024 17:39:45 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sdfZe-000CGl-19;
 Tue, 13 Aug 2024 00:39:42 +0000
Date: Tue, 13 Aug 2024 08:38:51 +0800
From: kernel test robot <lkp@intel.com>
To: Raag Jadav <raag.jadav@intel.com>, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tursulin@ursulin.net, airlied@gmail.com, daniel@ffwll.ch,
 linux@roeck-us.net, andi.shyti@linux.intel.com,
 andriy.shevchenko@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com,
 ashutosh.dixit@intel.com, karthik.poosa@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: Re: [PATCH v5] drm/i915/hwmon: expose fan speed
Message-ID: <202408130800.XtY6XxQ5-lkp@intel.com>
References: <20240812081538.1457396-1-raag.jadav@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240812081538.1457396-1-raag.jadav@intel.com>
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

Hi Raag,

kernel test robot noticed the following build errors:

[auto build test ERROR on groeck-staging/hwmon-next]
[also build test ERROR on linus/master v6.11-rc3 next-20240812]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Raag-Jadav/drm-i915-hwmon-expose-fan-speed/20240812-161645
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20240812081538.1457396-1-raag.jadav%40intel.com
patch subject: [PATCH v5] drm/i915/hwmon: expose fan speed
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20240813/202408130800.XtY6XxQ5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240813/202408130800.XtY6XxQ5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408130800.XtY6XxQ5-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/gpu/drm/i915/i915_hwmon.o: in function `hwm_read':
>> i915_hwmon.c:(.text+0xe60): undefined reference to `__udivdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
