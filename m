Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 762007D8E18
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 07:23:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0133D10E91A;
	Fri, 27 Oct 2023 05:23:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 805C710E91A
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 05:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698384189; x=1729920189;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=Dbdb9UD1MUdZ/QApxxwvUaC0j5cqW0ciKnr+yH5q7UM=;
 b=eYKQ1EEvrPbSnM7eRgp59J+lWwRfQUnWXjmzJ2hlBDWSu+ZOfcpLyPy9
 4Wae0tfMY5WCIynYHaAKlpDW05SfGzvBMdXXykjgRcY2kKO3dx8suUtkX
 cIcboMkqiF7yhWw8vih2c8Hq9PnnJiWtE1FlFexI7acKCQOLiL4J520WD
 lttus6aAlNPxKgS/cUhzmoZzIoWzncdRHEeN6BwYJXGGDPXoOxNVZo8we
 HqVr+cfmZVx6Gph6l67pVbmDGKbMAvHdl69EQeH74QT4otYXsK57ZMOlu
 CXbutpY0sWqYQTuCLnI+5h844fLx6Lntr3Ta1d1ostlFz6yaO5NBhXliL w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="367055410"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; d="scan'208";a="367055410"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2023 22:23:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="1006642523"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; d="scan'208";a="1006642523"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
 by fmsmga006.fm.intel.com with ESMTP; 26 Oct 2023 22:23:07 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qwFJJ-000AVH-2B;
 Fri, 27 Oct 2023 05:23:05 +0000
Date: Fri, 27 Oct 2023 13:22:27 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Skeggs <bskeggs@redhat.com>
Subject: [drm:topic/nvidia-gsp 41/48] disp.c:undefined reference to `__udivdi3'
Message-ID: <202310271316.3nkC9uV0-lkp@intel.com>
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
config: powerpc-randconfig-003-20231026 (https://download.01.org/0day-ci/archive/20231027/202310271316.3nkC9uV0-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231027/202310271316.3nkC9uV0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310271316.3nkC9uV0-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: drivers/gpu/drm/nouveau/dispnv50/disp.o: in function `nv50_sor_dp_watermark_sst.isra.0':
>> disp.c:(.text+0x1710): undefined reference to `__udivdi3'
>> powerpc-linux-ld: disp.c:(.text+0x1768): undefined reference to `__udivdi3'
   powerpc-linux-ld: disp.c:(.text+0x1790): undefined reference to `__udivdi3'
   powerpc-linux-ld: disp.c:(.text+0x17b4): undefined reference to `__udivdi3'
   powerpc-linux-ld: disp.c:(.text+0x1864): undefined reference to `__udivdi3'
   powerpc-linux-ld: drivers/gpu/drm/nouveau/dispnv50/disp.o:disp.c:(.text+0x1928): more undefined references to `__udivdi3' follow

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
