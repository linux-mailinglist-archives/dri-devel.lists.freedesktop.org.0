Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CAB4714FB
	for <lists+dri-devel@lfdr.de>; Sat, 11 Dec 2021 18:38:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 868B410E2FB;
	Sat, 11 Dec 2021 17:38:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C0A510E2FB;
 Sat, 11 Dec 2021 17:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639244330; x=1670780330;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=ykuwn+tdex3+F1J38kt/JVcFBoUWKsuFDil94PvRK+U=;
 b=RRQ159IvTgH78s8uzFHHz3bquxg4yKdr7fglLp2UBsZUOB7O2wDlLT1f
 BvgWVp+JmhiGAdf4FNymHkltvU/oF5mejweFPnUaUmQa3UPQ3TLa28VF+
 q+n+3EH13byhWjxkzvmKyS9uiJ1SHgCT3vTC+wHiMEh3QXPCMHCIO9Co4
 ygDjJge6r2wEg+GxnQPCwZ89rNqacAlmfqwuvVPJiTnLNE273TTo4xXSh
 ehVsvwLTz9xKR3mfGhALV0xXu+GEu00/oXau3bS8z16ur8PMvb1nIkeP/
 VKifqezxMRznw8w45vVUQzx/rEzdx0qOtRHTmdgw5IQ2uss4vgGA4BMt0 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10195"; a="218568905"
X-IronPort-AV: E=Sophos;i="5.88,198,1635231600"; d="scan'208";a="218568905"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2021 09:38:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,198,1635231600"; d="scan'208";a="660212335"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
 by fmsmga001.fm.intel.com with ESMTP; 11 Dec 2021 09:38:47 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mw6Kd-0004sa-BJ; Sat, 11 Dec 2021 17:38:47 +0000
Date: Sun, 12 Dec 2021 01:38:04 +0800
From: kernel test robot <lkp@intel.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [drm-intel:topic/core-for-CI 16/25]
 arch/powerpc/platforms/embedded6xx/Kconfig:2:error: recursive dependency
 detected!
Message-ID: <202112120048.dsQgEDob-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: kbuild-all@lists.01.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, llvm@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree:   git://anongit.freedesktop.org/drm-intel topic/core-for-CI
head:   4c82fd0506b4cc196a375d1200361fb0c5439acd
commit: b3acf17eafd473e6e8f8f7c5ec7040efaaff22b8 [16/25] Revert "drm/i915: Don't select BROKEN"
config: powerpc64-randconfig-r015-20211210
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 097a1cb1d5ebb3a0ec4bcaed8ba3ff6a8e33c00a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc64 cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        git remote add drm-intel git://anongit.freedesktop.org/drm-intel
        git fetch --no-tags drm-intel topic/core-for-CI
        git checkout b3acf17eafd473e6e8f8f7c5ec7040efaaff22b8
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 ARCH=powerpc  randconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 ARCH=powerpc 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/powerpc/platforms/embedded6xx/Kconfig:2:error: recursive dependency detected!
   arch/powerpc/platforms/embedded6xx/Kconfig:2: symbol EMBEDDED6xx depends on BROKEN_ON_SMP
   init/Kconfig:113: symbol BROKEN_ON_SMP depends on BROKEN
   init/Kconfig:110: symbol BROKEN is selected by DRM_I915_DEBUG
   drivers/gpu/drm/i915/Kconfig.debug:19: symbol DRM_I915_DEBUG depends on DRM_I915
   drivers/gpu/drm/i915/Kconfig:2: symbol DRM_I915 depends on DRM
   drivers/gpu/drm/Kconfig:8: symbol DRM depends on AGP
   drivers/char/agp/Kconfig:2: symbol AGP depends on PCI
   drivers/pci/Kconfig:16: symbol PCI depends on HAVE_PCI
   drivers/pci/Kconfig:7: symbol HAVE_PCI is selected by FORCE_PCI
   drivers/pci/Kconfig:11: symbol FORCE_PCI is selected by MVME5100
   arch/powerpc/platforms/embedded6xx/Kconfig:51: symbol MVME5100 depends on EMBEDDED6xx
   For a resolution refer to Documentation/kbuild/kconfig-language.rst
   subsection "Kconfig recursive dependency limitations"


vim +2 arch/powerpc/platforms/embedded6xx/Kconfig

a35e370cfd2ddf Arnd Bergmann    2007-08-30 @2  config EMBEDDED6xx
a35e370cfd2ddf Arnd Bergmann    2007-08-30  3  	bool "Embedded 6xx/7xx/7xxx-based boards"
be34fff07c3755 Christophe Leroy 2018-11-17  4  	depends on PPC_BOOK3S_32 && BROKEN_ON_SMP
14cf11af6cf608 Paul Mackerras   2005-09-26  5  

:::::: The code at line 2 was first introduced by commit
:::::: a35e370cfd2ddfb5d2f0ceae376ffeda273b357c [POWERPC] Move embedded6xx into multiplatform

:::::: TO: Arnd Bergmann <arnd@arndb.de>
:::::: CC: Paul Mackerras <paulus@samba.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
