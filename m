Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A0CD070E1
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 05:01:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 726C710E00F;
	Fri,  9 Jan 2026 04:01:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hGzHp6tZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE28F10E00F
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 04:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767931263; x=1799467263;
 h=date:from:to:cc:subject:message-id;
 bh=saFZSJmuMiuBIWF9XZCd1sOYeBzdrHzEKEvXdyvwvxY=;
 b=hGzHp6tZZrF/dsobpyQKTOdeq+3j2alyrK2cJzLrdgZD9UWlKOGsoyys
 vTNmKrNm4CczkBKXSUMHP787tAxC7uZdgIjBCVajcUtwO5WdzTHHabqGI
 bDyirnTFPEsbixIMxEcCIYN4JlZOEQ5Vo0b2NIm5KghLvdxCHdR1W/7DY
 zv2ik1WnikzXlzUguKRm1OzSBx1Bv2dO7ofLjlqLmrAiumzo/uPEo50+H
 3ztp2Syk6TEP7HLAb/u6yov00yBvDjaGr4vE+PNuOpVhrI8DtfdJ4SN52
 p5OuVO3fPhHrOBLQWSEYWJ1XaKlS8c1oqRcknOOLF02KVYVO46zGwdv/+ A==;
X-CSE-ConnectionGUID: pfV2UtZ4TgmAfj7ryYPhBw==
X-CSE-MsgGUID: OGoJFuP6TO2u28AbR7LWMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="71889675"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="71889675"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 20:01:02 -0800
X-CSE-ConnectionGUID: TY+9HRgFRmez5RV+pTjqRA==
X-CSE-MsgGUID: v+WGRbh/TpS/HjKhuLfD3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="226764774"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
 by fmviesa002.fm.intel.com with ESMTP; 08 Jan 2026 20:01:00 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1ve3gI-000000005Sq-1I2a;
 Fri, 09 Jan 2026 04:00:58 +0000
Date: Fri, 09 Jan 2026 12:00:36 +0800
From: kernel test robot <lkp@intel.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Danilo Krummrich <dakr@kernel.org>, Boris Brezillon <bbrezillon@kernel.org>
Subject: [drm-misc:for-linux-next 1/2] Warning:
 drivers/gpu/drm/drm_gpuvm.c:1836 expecting prototype for
 drm_gpuvm_bo_obtain(). Prototype was for drm_gpuvm_bo_obtain_locked() instead
Message-ID: <202601091113.0b0WuRML-lkp@intel.com>
User-Agent: s-nail v14.9.25
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

tree:   https://gitlab.freedesktop.org/drm/misc/kernel.git for-linux-next
head:   ec27500c8f2b65a3be6ce39a5844d6d246d1b2b0
commit: 9bf4ca1e699c272defe9636f9812ff33a448d650 [1/2] drm/gpuvm: drm_gpuvm_bo_obtain() requires lock and staged mode
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260109/202601091113.0b0WuRML-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260109/202601091113.0b0WuRML-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601091113.0b0WuRML-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/drm_gpuvm.c:1836 expecting prototype for drm_gpuvm_bo_obtain(). Prototype was for drm_gpuvm_bo_obtain_locked() instead

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
