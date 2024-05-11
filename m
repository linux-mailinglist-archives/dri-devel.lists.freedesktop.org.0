Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C528C3194
	for <lists+dri-devel@lfdr.de>; Sat, 11 May 2024 15:20:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7BB410E10C;
	Sat, 11 May 2024 13:20:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I02cSKKb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E375610E10C
 for <dri-devel@lists.freedesktop.org>; Sat, 11 May 2024 13:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715433610; x=1746969610;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=K9e7CGMRNiwYwLpoZvPadE9hQ5NIkzNn0htkS/G5b84=;
 b=I02cSKKbKSu4kcT5Hu+5RCNSCuBTg6M4uSqbZeMEhpNxpQsvV+LvG05I
 7jdGdCAQB+Y4Hjsy2rJ0Z9SS5okqiJISyA/mMr89Yjavv76TiAv/YxkgV
 WNX91p/XEaehU614wjAJurAFTzr8PSHKHujExMP17seL1S8gfQfO51EnY
 /lQRJkm0AWvOFqI5IrAWS6VbbzicsluUwYTM3VUutSg6MA3spLU3qZvS0
 VZD38g3GwAOEGS8xiyWQ2yeIzuCMfWUyDPPUQ7cCkYW9EJwuKnJH9vmrp
 P8J6URsgsK5PeTes+o9TXVrAHR84rSruTwhQ7LxZtUVn90Ww0SDzvD0bt Q==;
X-CSE-ConnectionGUID: bWdKN2sETlyLRo2+ODwsfQ==
X-CSE-MsgGUID: BecjCq49TSayIrTbLdaGBA==
X-IronPort-AV: E=McAfee;i="6600,9927,11070"; a="14370621"
X-IronPort-AV: E=Sophos;i="6.08,154,1712646000"; d="scan'208";a="14370621"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2024 06:20:09 -0700
X-CSE-ConnectionGUID: cz3JUcKEQqOJWArRG1YvtQ==
X-CSE-MsgGUID: wv2PsVeeShyL4H1MbL02EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,154,1712646000"; d="scan'208";a="29866115"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
 by fmviesa008.fm.intel.com with ESMTP; 11 May 2024 06:20:07 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1s5mdx-0007R5-2V;
 Sat, 11 May 2024 13:20:05 +0000
Date: Sat, 11 May 2024 21:19:34 +0800
From: kernel test robot <lkp@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [drm-misc:drm-misc-next 7/10] omap_gem.c:undefined reference to
 `vmf_insert_mixed'
Message-ID: <202405112139.ccwvjn0U-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

tree:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
head:   11cdc8f2bde4bc548da6f995556c4b7183431088
commit: dc6fcaaba5a5411237d042a26c4d46689f3346bb [7/10] drm/omap: Allow build with COMPILE_TEST=y
config: arm-randconfig-004-20240511 (https://download.01.org/0day-ci/archive/20240511/202405112139.ccwvjn0U-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240511/202405112139.ccwvjn0U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405112139.ccwvjn0U-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/gpu/drm/omapdrm/omap_gem.o: in function `omap_gem_fault_2d':
>> omap_gem.c:(.text+0x4c0): undefined reference to `vmf_insert_mixed'
   arm-linux-gnueabi-ld: drivers/gpu/drm/omapdrm/omap_gem.o: in function `omap_gem_fault':
   omap_gem.c:(.text+0x99a): undefined reference to `vmf_insert_mixed'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
