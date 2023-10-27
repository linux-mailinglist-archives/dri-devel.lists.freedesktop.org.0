Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 000857D8D39
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 04:44:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E2C510E0BB;
	Fri, 27 Oct 2023 02:44:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF4C910E0BB
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 02:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698374641; x=1729910641;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=4mugV94xtN6ArBLC2Bi9kr38jFoJqH6EP/V0ryBenk8=;
 b=M4Lt4mfQp2CYgkFtHka9ZakSRZwYsvKoud+Xo3tfJ0rBbU7Bt8ifq5ke
 rX61wPp5l+S2zaVJ83ZHBwv82l76RTn2/I+YnQtS9OD66z1aURGbQEWpt
 tc8mEZEDh5lW0zl+WDMT2Lhwh+0dFohR9lW/zKlFRQutwrJy/MGA2zH/4
 +DnF0TCQaNdU47qsBR9wqOEWwawGI2hJajLSxUiE41uMn2H2r3WWBJ1l8
 dzqyL8xIcNuOeq4H/t3sWXpMRQSdPcgUIYWj2vCbeFrRBgYA7Fl3cVISL
 ehaM4VwFFS4UtqZ1FjbIp5iqSPjqZIUHoKI0T70Em5SunKcqIVcPmWfJH A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="509282"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="509282"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2023 19:44:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="788695581"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; d="scan'208";a="788695581"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
 by orsmga008.jf.intel.com with ESMTP; 26 Oct 2023 19:43:58 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qwCpI-000AMR-26;
 Fri, 27 Oct 2023 02:43:56 +0000
Date: Fri, 27 Oct 2023 10:43:34 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Skeggs <bskeggs@redhat.com>
Subject: [drm:topic/nvidia-gsp 41/48] ld: disp.c:undefined reference to
 `__udivdi3'
Message-ID: <202310271011.kL4E5dY2-lkp@intel.com>
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
Cc: Dave Airlie <airlied@redhat.com>, dri-devel@lists.freedesktop.org,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree:   git://anongit.freedesktop.org/drm/drm topic/nvidia-gsp
head:   c09ddadcb054bbbb45b46e1dd0554a3ee1a96328
commit: e9ad7a2f99667b6ba6ac966050e5d7d6b5e485dd [41/48] drm/nouveau/disp/r535: initial support
config: i386-buildonly-randconfig-002-20231027 (https://download.01.org/0day-ci/archive/20231027/202310271011.kL4E5dY2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231027/202310271011.kL4E5dY2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310271011.kL4E5dY2-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/gpu/drm/nouveau/dispnv50/disp.o: in function `nv50_sor_dp_watermark_sst.isra.0':
   disp.c:(.text+0x18c3): undefined reference to `__udivdi3'
>> ld: disp.c:(.text+0x1943): undefined reference to `__udivdi3'
   ld: disp.c:(.text+0x195f): undefined reference to `__udivdi3'
   ld: disp.c:(.text+0x197d): undefined reference to `__udivdi3'
   ld: disp.c:(.text+0x19eb): undefined reference to `__udivdi3'
   ld: drivers/gpu/drm/nouveau/dispnv50/disp.o:disp.c:(.text+0x1a09): more undefined references to `__udivdi3' follow

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
