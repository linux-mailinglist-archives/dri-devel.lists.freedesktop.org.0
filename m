Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A029F17F582
	for <lists+dri-devel@lfdr.de>; Tue, 10 Mar 2020 11:58:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C49D6E181;
	Tue, 10 Mar 2020 10:58:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26F9D89949;
 Tue, 10 Mar 2020 10:58:45 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Mar 2020 03:58:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,536,1574150400"; d="scan'208";a="415152424"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by orsmga005.jf.intel.com with ESMTP; 10 Mar 2020 03:58:42 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1jBcaw-000Dg2-77; Tue, 10 Mar 2020 18:58:42 +0800
Date: Tue, 10 Mar 2020 18:58:05 +0800
From: kbuild test robot <lkp@intel.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [drm-intel:topic/core-for-CI 18/20] init/Kconfig:77: symbol BROKEN
 is selected by DRM_I915_DEBUG
Message-ID: <202003101855.mZzvr5AM%lkp@intel.com>
MIME-Version: 1.0
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
Cc: intel-gfx@lists.freedesktop.org, kbuild-all@lists.01.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree:   git://anongit.freedesktop.org/drm-intel topic/core-for-CI
head:   72212a758bdd916331477e782bdad1fa3f625322
commit: 19f102d485b9f5e03677f73133d9922e2650686f [18/20] Revert "drm/i915: Don't select BROKEN"
config: powerpc-randconfig-a001-20200310
compiler: powerpc-linux-gcc (GCC) 9.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout 19f102d485b9f5e03677f73133d9922e2650686f
        GCC_VERSION=9.2.0 make.cross ARCH=powerpc  randconfig
        GCC_VERSION=9.2.0 make.cross ARCH=powerpc 

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/powerpc/platforms/embedded6xx/Kconfig:2:error: recursive dependency detected!
   arch/powerpc/platforms/embedded6xx/Kconfig:2: symbol EMBEDDED6xx depends on BROKEN_ON_SMP
>> init/Kconfig:80: symbol BROKEN_ON_SMP depends on BROKEN
>> init/Kconfig:77: symbol BROKEN is selected by DRM_I915_DEBUG
>> drivers/gpu/drm/i915/Kconfig.debug:19: symbol DRM_I915_DEBUG depends on DRM_I915
>> drivers/gpu/drm/i915/Kconfig:2: symbol DRM_I915 depends on DRM
>> drivers/gpu/drm/Kconfig:8: symbol DRM depends on AGP
>> drivers/char/agp/Kconfig:2: symbol AGP depends on PCI
   drivers/pci/Kconfig:16: symbol PCI depends on HAVE_PCI
>> drivers/pci/Kconfig:7: symbol HAVE_PCI is selected by FORCE_PCI
>> drivers/pci/Kconfig:11: symbol FORCE_PCI is selected by MVME5100
   arch/powerpc/platforms/embedded6xx/Kconfig:51: symbol MVME5100 depends on EMBEDDED6xx
   For a resolution refer to Documentation/kbuild/kconfig-language.rst
   subsection "Kconfig recursive dependency limitations"

vim +77 init/Kconfig

^1da177e4c3f41 Linus Torvalds 2005-04-16  76  
^1da177e4c3f41 Linus Torvalds 2005-04-16 @77  config BROKEN
^1da177e4c3f41 Linus Torvalds 2005-04-16  78  	bool
^1da177e4c3f41 Linus Torvalds 2005-04-16  79  
^1da177e4c3f41 Linus Torvalds 2005-04-16 @80  config BROKEN_ON_SMP
^1da177e4c3f41 Linus Torvalds 2005-04-16  81  	bool
^1da177e4c3f41 Linus Torvalds 2005-04-16  82  	depends on BROKEN || !SMP
^1da177e4c3f41 Linus Torvalds 2005-04-16  83  	default y
^1da177e4c3f41 Linus Torvalds 2005-04-16  84  

:::::: The code at line 77 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
