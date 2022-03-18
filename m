Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9094DD311
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 03:26:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AE5E10E18E;
	Fri, 18 Mar 2022 02:26:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A423110E1DE
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 02:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647570387; x=1679106387;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6BtreIqdM6t1Lqd3PDjlCcPfWohouuLMLA0X/DuYhUE=;
 b=YPZvEWpPMk/PqyXoqabdb1iv1Wkq9gJS14qdLRw5KNpvN1447GdGpClb
 16ZKt7yURXzKhpoG3EfoJfdMM4HQ/m6SD/llx4tjKM7ABaT0+b6P4adX4
 jiUmlT/3vuGTiZAo5bTx3FmlWbFNatMx2n0eI8yeYPMb/cDlXnCLY6MgX
 KeU8+/EZ1FYnZs9iemc4aejWqdaMdz56nOSXpy/7MUyoCekmGOw2+Pgyz
 c1bvqQL1r0wKo345zknb93rAZN3ixc0J6n/FsC7yfH99mFjy+xo+vMNM4
 BCvtefp7E5ThfRcAVMXdHHbpsg3RQvuluZ+Ihl/Rp9ezsN2CyIMIKyEJL A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10289"; a="236976206"
X-IronPort-AV: E=Sophos;i="5.90,191,1643702400"; d="scan'208";a="236976206"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 19:26:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,191,1643702400"; d="scan'208";a="635582672"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by FMSMGA003.fm.intel.com with ESMTP; 17 Mar 2022 19:26:25 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nV2Js-000EM7-V2; Fri, 18 Mar 2022 02:26:24 +0000
Date: Fri, 18 Mar 2022 10:25:33 +0800
From: kernel test robot <lkp@intel.com>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/4] drm/gma500: Move gma_intel_crtc_funcs into
 gma_display.c
Message-ID: <202203181032.rQkGG9w3-lkp@intel.com>
References: <20220317092555.17882-2-patrik.r.jakobsson@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220317092555.17882-2-patrik.r.jakobsson@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: daniel.vetter@ffwll.ch, kbuild-all@lists.01.org, tzimmermann@suse.de,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Patrik,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on drm-intel/for-linux-next drm-tip/drm-tip drm-exynos/exynos-drm-next tegra-drm/drm/tegra/for-next v5.17-rc8 next-20220317]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Patrik-Jakobsson/drm-gma500-Remove-unused-declarations-and-other-cruft/20220317-172741
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: i386-randconfig-s002 (https://download.01.org/0day-ci/archive/20220318/202203181032.rQkGG9w3-lkp@intel.com/config)
compiler: gcc-9 (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://github.com/0day-ci/linux/commit/cdcc3ba62afbe456eb16b00d5df129abf8db5ca1
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Patrik-Jakobsson/drm-gma500-Remove-unused-declarations-and-other-cruft/20220317-172741
        git checkout cdcc3ba62afbe456eb16b00d5df129abf8db5ca1
        # save the config file to linux build tree
        mkdir build_dir
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/gma500/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/gma500/gma_display.c:175:5: sparse: sparse: symbol 'gma_crtc_gamma_set' was not declared. Should it be static?
   drivers/gpu/drm/gma500/gma_display.c:401:25: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *tmp_dst @@     got unsigned char [noderef] [usertype] __iomem * @@
   drivers/gpu/drm/gma500/gma_display.c:401:25: sparse:     expected void *tmp_dst
   drivers/gpu/drm/gma500/gma_display.c:401:25: sparse:     got unsigned char [noderef] [usertype] __iomem *
>> drivers/gpu/drm/gma500/gma_display.c:322:5: sparse: sparse: symbol 'gma_crtc_cursor_set' was not declared. Should it be static?
>> drivers/gpu/drm/gma500/gma_display.c:440:5: sparse: sparse: symbol 'gma_crtc_cursor_move' was not declared. Should it be static?

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
