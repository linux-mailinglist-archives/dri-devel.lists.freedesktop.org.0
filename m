Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E7F8B2929
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 21:51:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81C7111A846;
	Thu, 25 Apr 2024 19:51:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UBlrNZtk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E2A511A845
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 19:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714074676; x=1745610676;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=g/7WY1PNa+eVzC8Vs0EclC277d1TuItoUpmgdey+meg=;
 b=UBlrNZtkNopfhlv7Un10nJ7p+PlurkgHskXAuR6/MmoSBdMNYXGWYSs4
 YaPUiHjs67+u5e2Oqlw14NaoAKKZyB/eao7Cg0pV7EXafr6lNAIvUtszj
 h3tZM/t8A6f9Qr+N74riFHovfzfwFlStNsSOxFfWx7UHPqBuFSdUVbEWq
 7hX7Noj7I8CEPEzafNOlA4FwBCmKMpaHcSoAY0MCAWzdg5N1tvJNToh4F
 ZbsNMbcAvkJsIpvA4ti5aCN+mOpYJ1QQod6RWvsk3m74UHBoMY2NgQ/vc
 Sw0grd/vhsWTtXHXMRClNil5P7GKlYBxEAMeaY3yzOuCNu/Ua9vgCJ75E w==;
X-CSE-ConnectionGUID: pgajDPc2Qx+BUFh737xAnA==
X-CSE-MsgGUID: ktikjY6uSSqcK1hRsTym0Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="20402917"
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; d="scan'208";a="20402917"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 12:51:16 -0700
X-CSE-ConnectionGUID: W/CLOaQJRDCbfbhpqI0e0A==
X-CSE-MsgGUID: G7pC3Cd0RzyWkiKZebrE8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; d="scan'208";a="62660915"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
 by orviesa001.jf.intel.com with ESMTP; 25 Apr 2024 12:51:15 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1s057f-0002o4-2g;
 Thu, 25 Apr 2024 19:51:11 +0000
Date: Fri, 26 Apr 2024 03:50:39 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [drm-misc:for-linux-next 2/2]
 drivers/gpu/drm/omapdrm/omap_fb.c:325:2: error: implicit declaration of
 function 'seq_printf' is invalid in C99
Message-ID: <202404260318.H7uZPwSq-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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

tree:   git://anongit.freedesktop.org/drm/drm-misc for-linux-next
head:   2bdb481bf7a93c22b9fea8daefa2834aab23a70f
commit: 9e2b84fb6cd7ee913aa61d461db65c1d6a08dcf2 [2/2] drm/print: drop include seq_file.h
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240426/202404260318.H7uZPwSq-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240426/202404260318.H7uZPwSq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404260318.H7uZPwSq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/omapdrm/omap_fb.c:325:2: error: implicit declaration of function 'seq_printf' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           seq_printf(m, "fb: %dx%d@%4.4s\n", fb->width, fb->height,
           ^
   1 error generated.


vim +/seq_printf +325 drivers/gpu/drm/omapdrm/omap_fb.c

b33f34d3d10b9b drivers/staging/omapdrm/omap_fb.c Rob Clark     2012-03-05  319  
f6b6036e56ca17 drivers/staging/omapdrm/omap_fb.c Rob Clark     2012-03-05  320  #ifdef CONFIG_DEBUG_FS
f6b6036e56ca17 drivers/staging/omapdrm/omap_fb.c Rob Clark     2012-03-05  321  void omap_framebuffer_describe(struct drm_framebuffer *fb, struct seq_file *m)
f6b6036e56ca17 drivers/staging/omapdrm/omap_fb.c Rob Clark     2012-03-05  322  {
bcb0b461454c9c drivers/gpu/drm/omapdrm/omap_fb.c Ville Syrjälä 2016-12-14  323  	int i, n = fb->format->num_planes;
f6b6036e56ca17 drivers/staging/omapdrm/omap_fb.c Rob Clark     2012-03-05  324  
f6b6036e56ca17 drivers/staging/omapdrm/omap_fb.c Rob Clark     2012-03-05 @325  	seq_printf(m, "fb: %dx%d@%4.4s\n", fb->width, fb->height,
438b74a5497c36 drivers/gpu/drm/omapdrm/omap_fb.c Ville Syrjälä 2016-12-14  326  			(char *)&fb->format->format);
f6b6036e56ca17 drivers/staging/omapdrm/omap_fb.c Rob Clark     2012-03-05  327  
f6b6036e56ca17 drivers/staging/omapdrm/omap_fb.c Rob Clark     2012-03-05  328  	for (i = 0; i < n; i++) {
f6b6036e56ca17 drivers/staging/omapdrm/omap_fb.c Rob Clark     2012-03-05  329  		seq_printf(m, "   %d: offset=%d pitch=%d, obj: ",
2ecceeb53b1945 drivers/gpu/drm/omapdrm/omap_fb.c Daniel Stone  2018-03-30  330  				i, fb->offsets[n], fb->pitches[i]);
3e44255260dc3c drivers/gpu/drm/omapdrm/omap_fb.c Daniel Stone  2018-03-30  331  		omap_gem_describe(fb->obj[i], m);
f6b6036e56ca17 drivers/staging/omapdrm/omap_fb.c Rob Clark     2012-03-05  332  	}
f6b6036e56ca17 drivers/staging/omapdrm/omap_fb.c Rob Clark     2012-03-05  333  }
f6b6036e56ca17 drivers/staging/omapdrm/omap_fb.c Rob Clark     2012-03-05  334  #endif
f6b6036e56ca17 drivers/staging/omapdrm/omap_fb.c Rob Clark     2012-03-05  335  

:::::: The code at line 325 was first introduced by commit
:::::: f6b6036e56ca17378dd0294b684db623abd6a901 staging: drm/omap: debugfs for object and fb tracking

:::::: TO: Rob Clark <rob@ti.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
