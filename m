Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFC847141E
	for <lists+dri-devel@lfdr.de>; Sat, 11 Dec 2021 15:03:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4173910E315;
	Sat, 11 Dec 2021 14:03:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 678BC10E315;
 Sat, 11 Dec 2021 14:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639231426; x=1670767426;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=wx2ObUwR2MFDRkcI2QYDH9vcVbUYFf3j0pYXk4K2/zU=;
 b=i+GFg4dHU8Zhzmto3cAc2AnOsGf0nDbthrqRUoy4GJ8IzxNG49RXJnyE
 5KvFw2vRYRvsHavXbq/yLaBMXzg1YE2WonJYgF69zWkaEbwFmUuq1jQY7
 eTOhhK8wTx/++x/I20K1ixiyykpIXhfV9UA3j+0De7cj18f55M/y+Z6DU
 uyKbfHxr/z2jej+uWMWIua0VmOCrCVY9u9l83WYwxP4kb4/wFWty58FRw
 0/ACzNptaAQ36J48lG30+s2a5e82GQl85qDGUJ8rARBIXT+CkI8r/VC47
 Es2BxQV5n/4evHHWuNYHqwwi1qxOFxRYZ3J0OVVLGL7RTWlUGkt/tBZtc w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10194"; a="299321029"
X-IronPort-AV: E=Sophos;i="5.88,198,1635231600"; d="scan'208";a="299321029"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2021 06:03:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,198,1635231600"; d="scan'208";a="681080905"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
 by orsmga005.jf.intel.com with ESMTP; 11 Dec 2021 06:03:42 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mw2yT-0004eQ-Dc; Sat, 11 Dec 2021 14:03:41 +0000
Date: Sat, 11 Dec 2021 22:03:25 +0800
From: kernel test robot <lkp@intel.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [drm-intel:topic/core-for-CI 16/25]
 arch/powerpc/platforms/embedded6xx/Kconfig:2:error: recursive dependency
 detected!
Message-ID: <202112112108.sBHm7HdB-lkp@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 kbuild-all@lists.01.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree:   git://anongit.freedesktop.org/drm-intel topic/core-for-CI
head:   4c82fd0506b4cc196a375d1200361fb0c5439acd
commit: b3acf17eafd473e6e8f8f7c5ec7040efaaff22b8 [16/25] Revert "drm/i915: Don't select BROKEN"
config: powerpc-randconfig-r035-20211210
compiler: powerpc-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add drm-intel git://anongit.freedesktop.org/drm-intel
        git fetch --no-tags drm-intel topic/core-for-CI
        git checkout b3acf17eafd473e6e8f8f7c5ec7040efaaff22b8
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross ARCH=powerpc  randconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross ARCH=powerpc 

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
