Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26657970EA4
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 08:54:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EA4110E2DA;
	Mon,  9 Sep 2024 06:54:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i8uYuYiO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9C2B10E2DA
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2024 06:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725864885; x=1757400885;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5CUtr5c0Taa2cv5diyyUItk9tTuJ/bOmNRRQPiYqb3E=;
 b=i8uYuYiOpFRXbPsVKPQNbPHnQfNh+NnhEsxpJQqCm0j0zb5KJdUPZVeQ
 ziB4LvH7Vm8Tvez1aCXLODYBjeC0zntWGhTUUm4N+/9vDREX+2yXEWrkZ
 O8Wt5xvOilnYqVGaW0KXs/8xaPdjNvsFsXckAPPaSsCi65v0T8wzyZb2x
 8FsCbn5HzLAdZVOeN0mwwgAr0JLI+gaDRHcUTiY217R12LPugE0iaLiuq
 9oxKCUHvsB1gzK5SRlD0mienY8Rmj0956TNqU1MxTir7Sbtc9E9r2zy2L
 gy4NPVkut9yUbx4DJ31R9+Ibh2Ff9PQaZ1d5rR1sXkAmZdj7UM+s3XsGu g==;
X-CSE-ConnectionGUID: MlcSpetSQeCJU4h7h2V5sA==
X-CSE-MsgGUID: E07wp8ZKSdyfGNplKukPSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="24088214"
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; d="scan'208";a="24088214"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2024 23:54:44 -0700
X-CSE-ConnectionGUID: BS0doVCZT46N2bu1t/06Ew==
X-CSE-MsgGUID: Aie8GE95S4SuzoK+HwL02A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; d="scan'208";a="71368229"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
 by orviesa005.jf.intel.com with ESMTP; 08 Sep 2024 23:54:42 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1snYII-000EQU-2F;
 Mon, 09 Sep 2024 06:54:38 +0000
Date: Mon, 9 Sep 2024 14:54:25 +0800
From: kernel test robot <lkp@intel.com>
To: Hamza Mahfooz <hamza.mahfooz@amd.com>, dri-devel@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>,
 Rodrigo Siqueira <rodrigo.siqueira@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>, Karol Herbst <kherbst@redhat.com>
Subject: Re: [PATCH v3] drm/edid: add CTA Video Format Data Block support
Message-ID: <202409091450.S7bzV2ho-lkp@intel.com>
References: <20240906224307.423250-1-hamza.mahfooz@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240906224307.423250-1-hamza.mahfooz@amd.com>
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

Hi Hamza,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.11-rc7 next-20240906]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hamza-Mahfooz/drm-edid-add-CTA-Video-Format-Data-Block-support/20240907-064359
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240906224307.423250-1-hamza.mahfooz%40amd.com
patch subject: [PATCH v3] drm/edid: add CTA Video Format Data Block support
config: arm-nhk8815_defconfig (https://download.01.org/0day-ci/archive/20240909/202409091450.S7bzV2ho-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 05f5a91d00b02f4369f46d076411c700755ae041)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240909/202409091450.S7bzV2ho-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409091450.S7bzV2ho-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __aeabi_uldivmod
   >>> referenced by drm_edid.c:5470 (drivers/gpu/drm/drm_edid.c:5470)
   >>>               drivers/gpu/drm/drm_edid.o:(_drm_edid_connector_add_modes) in archive vmlinux.a
   >>> referenced by drm_edid.c:5508 (drivers/gpu/drm/drm_edid.c:5508)
   >>>               drivers/gpu/drm/drm_edid.o:(_drm_edid_connector_add_modes) in archive vmlinux.a
   >>> referenced by drm_edid.c:5509 (drivers/gpu/drm/drm_edid.c:5509)
   >>>               drivers/gpu/drm/drm_edid.o:(_drm_edid_connector_add_modes) in archive vmlinux.a
   >>> referenced 1 more times
   >>> did you mean: __aeabi_uidivmod
   >>> defined in: vmlinux.a(arch/arm/lib/lib1funcs.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
