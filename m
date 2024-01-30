Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B637842210
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 11:57:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A026C112F48;
	Tue, 30 Jan 2024 10:57:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9663112F2E
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 10:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706612241; x=1738148241;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=nBOpbCzEM+B6/GDqBTyixqW4/2KzPp9FGoi+VgHcK2s=;
 b=JWd8J+g3SRThcFCVfdNjwKIHyUMPbim1BD+xHrxVV/GF6Fs/fW5tb81z
 3tVVHdvOqoRnVb2Y/5fTmazy8qVfvtds8o/fkuAdhF9uLOHPIyKVP0mhs
 VqHjT9ZxU7C64+Btn8qkGeEF6aF+W2oyrb52hkaxUggEgsXKdtg/8QKpb
 mpDba2NqGraqvKz1lNWBCUZDhwTPU1gXh77KVilHglu2U/7zclgC0dRcL
 mNNCuxnesLsvXdQ20VPnjQfnilPr8cEqosZRxM2DZoMVq0MNZZ91h5uzO
 mC7nQmosXKRvaNccYPYfwsj3kWEzSJp9AKo5HAWEwM2j/ZizFRzKWfXsn A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="21764761"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; d="scan'208";a="21764761"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 02:56:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; d="scan'208";a="29867329"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
 by orviesa002.jf.intel.com with ESMTP; 30 Jan 2024 02:56:57 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rUlnT-0000D2-0H;
 Tue, 30 Jan 2024 10:56:55 +0000
Date: Tue, 30 Jan 2024 18:56:32 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: [drm-misc:drm-misc-next 1/3] ps3av.c:undefined reference to
 `video_get_options'
Message-ID: <202401301825.pVNLzuRt-lkp@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
head:   4db102dcb0396a4ccf89b1eac0f4eb3fd167a080
commit: a3b6792e990d63d47c4d2622a9704a01db50c3a2 [1/3] video/cmdline: Introduce CONFIG_VIDEO for video= parameter
config: powerpc-cell_defconfig (https://download.01.org/0day-ci/archive/20240130/202401301825.pVNLzuRt-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240130/202401301825.pVNLzuRt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401301825.pVNLzuRt-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc64-linux-ld: warning: discarding dynamic section .glink
   powerpc64-linux-ld: warning: discarding dynamic section .plt
   powerpc64-linux-ld: linkage table error against `video_get_options'
   powerpc64-linux-ld: stubs don't match calculated size
   powerpc64-linux-ld: can not build stubs: bad value
   powerpc64-linux-ld: drivers/ps3/ps3av.o: in function `ps3av_probe':
>> ps3av.c:(.text+0x13ec): undefined reference to `video_get_options'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
