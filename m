Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E861886F4A7
	for <lists+dri-devel@lfdr.de>; Sun,  3 Mar 2024 12:59:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C85310E8F2;
	Sun,  3 Mar 2024 11:59:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GM52UpqA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB90D10E8E2
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Mar 2024 11:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709467190; x=1741003190;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=6bZhClnY52mrGNGVoNAbpqb3IpUlB4hdKauBYKa2rh4=;
 b=GM52UpqAp12AGaaZf+mNgCG95opJ0g2gLPHiV8gZ5F+axAJdLXHy5e+a
 hDYAASRfnbkz4gjWPVFPLcoonykfFfwT7sZeIUC+qBtoHZXFptSIEZOyM
 s90xOUUrbF3AImWoHFuodDt2AKjmQQBvQ1IO/zhQyvoJouLO7Xol0f5QJ
 hMNrN4D7Zh0DhjivM1wCfoKR1Z7IIkAlDdZwu76zRb+kN/XGTaMl4SOiB
 kh3d/p1IVCDQTUkQemGL0OmKuLViV6nCZ/cLTbE1MAd1BNuklkXs7qjUG
 IdWrjdBJPvuQgqtD5fEzdaFQQ0xbL0lhMZpNvMR2X+wPey+r9Kbj7r6SM w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11001"; a="4087949"
X-IronPort-AV: E=Sophos;i="6.06,200,1705392000"; 
   d="scan'208";a="4087949"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2024 03:59:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,200,1705392000"; d="scan'208";a="31849676"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
 by fmviesa002.fm.intel.com with ESMTP; 03 Mar 2024 03:59:47 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rgkVM-0001ke-2X;
 Sun, 03 Mar 2024 11:59:44 +0000
Date: Sun, 3 Mar 2024 19:58:54 +0800
From: kernel test robot <lkp@intel.com>
To: Boris Brezillon <bbrezillon@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>
Subject: [drm-misc:drm-misc-next 12/14] s390-linux-ld:
 drivers/gpu/drm/panthor/panthor_drv.o:undefined reference to
 `panthor_device_suspend'
Message-ID: <202403031944.EOimQ8WK-lkp@intel.com>
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
head:   216c1282dde38ca87ebdf1ccacee5a0682901574
commit: d72f049087d4f973f6332b599c92177e718107de [12/14] drm/panthor: Allow driver compilation
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240303/202403031944.EOimQ8WK-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240303/202403031944.EOimQ8WK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403031944.EOimQ8WK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> s390-linux-ld: drivers/gpu/drm/panthor/panthor_drv.o:(.data.rel.ro+0x170): undefined reference to `panthor_device_suspend'
>> s390-linux-ld: drivers/gpu/drm/panthor/panthor_drv.o:(.data.rel.ro+0x178): undefined reference to `panthor_device_resume'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
