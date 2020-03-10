Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA99D17F593
	for <lists+dri-devel@lfdr.de>; Tue, 10 Mar 2020 12:02:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B7B56E892;
	Tue, 10 Mar 2020 11:02:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E80E899E6;
 Tue, 10 Mar 2020 11:02:49 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Mar 2020 04:02:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,536,1574150400"; d="scan'208";a="443123635"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by fmsmga006.fm.intel.com with ESMTP; 10 Mar 2020 04:02:47 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1jBces-0000Ci-Pd; Tue, 10 Mar 2020 19:02:46 +0800
Date: Tue, 10 Mar 2020 19:02:26 +0800
From: kbuild test robot <lkp@intel.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [drm-intel:topic/core-for-CI 18/20]
 arch/powerpc/platforms/embedded6xx/Kconfig:2: symbol EMBEDDED6xx depends on
 BROKEN_ON_SMP
Message-ID: <202003101908.mFLWJ9ce%lkp@intel.com>
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
config: powerpc-defconfig
compiler: powerpc64-linux-gcc (GCC) 9.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout 19f102d485b9f5e03677f73133d9922e2650686f
        GCC_VERSION=9.2.0 make.cross ARCH=powerpc  defconfig
        GCC_VERSION=9.2.0 make.cross ARCH=powerpc 

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   arch/powerpc/platforms/embedded6xx/Kconfig:2:error: recursive dependency detected!
>> arch/powerpc/platforms/embedded6xx/Kconfig:2: symbol EMBEDDED6xx depends on BROKEN_ON_SMP
   init/Kconfig:80: symbol BROKEN_ON_SMP depends on BROKEN
   init/Kconfig:77: symbol BROKEN is selected by DRM_I915_DEBUG
   drivers/gpu/drm/i915/Kconfig.debug:19: symbol DRM_I915_DEBUG depends on DRM_I915
   drivers/gpu/drm/i915/Kconfig:2: symbol DRM_I915 depends on DRM
   drivers/gpu/drm/Kconfig:8: symbol DRM depends on AGP
   drivers/char/agp/Kconfig:2: symbol AGP depends on PCI
>> drivers/pci/Kconfig:16: symbol PCI depends on HAVE_PCI
   drivers/pci/Kconfig:7: symbol HAVE_PCI is selected by FORCE_PCI
   drivers/pci/Kconfig:11: symbol FORCE_PCI is selected by MVME5100
>> arch/powerpc/platforms/embedded6xx/Kconfig:51: symbol MVME5100 depends on EMBEDDED6xx
   For a resolution refer to Documentation/kbuild/kconfig-language.rst
   subsection "Kconfig recursive dependency limitations"

vim +2 arch/powerpc/platforms/embedded6xx/Kconfig

a35e370cfd2ddf Arnd Bergmann         2007-08-30  @2  config EMBEDDED6xx
a35e370cfd2ddf Arnd Bergmann         2007-08-30   3  	bool "Embedded 6xx/7xx/7xxx-based boards"
be34fff07c3755 Christophe Leroy      2018-11-17   4  	depends on PPC_BOOK3S_32 && BROKEN_ON_SMP
14cf11af6cf608 Paul Mackerras        2005-09-26   5  
04d76b937bdf60 Guennadi Liakhovetski 2006-12-01   6  config LINKSTATION
04d76b937bdf60 Guennadi Liakhovetski 2006-12-01   7  	bool "Linkstation / Kurobox(HG) from Buffalo"
a35e370cfd2ddf Arnd Bergmann         2007-08-30   8  	depends on EMBEDDED6xx
04d76b937bdf60 Guennadi Liakhovetski 2006-12-01   9  	select MPIC
04d76b937bdf60 Guennadi Liakhovetski 2006-12-01  10  	select FSL_SOC
04d76b937bdf60 Guennadi Liakhovetski 2006-12-01  11  	select PPC_UDBG_16550 if SERIAL_8250
44d7631bdb1621 Segher Boessenkool    2007-02-22  12  	select DEFAULT_UIMAGE
3490cba56f7f8a Jon Loeliger          2008-01-23  13  	select MPC10X_BRIDGE
04d76b937bdf60 Guennadi Liakhovetski 2006-12-01  14  	help
04d76b937bdf60 Guennadi Liakhovetski 2006-12-01  15  	  Select LINKSTATION if configuring for one of PPC- (MPC8241)
04d76b937bdf60 Guennadi Liakhovetski 2006-12-01  16  	  based NAS systems from Buffalo Technology. So far only
04d76b937bdf60 Guennadi Liakhovetski 2006-12-01  17  	  KuroboxHG has been tested. In the future classical Kurobox,
04d76b937bdf60 Guennadi Liakhovetski 2006-12-01  18  	  Linkstation-I HD-HLAN and HD-HGLAN versions, and PPC-based
04d76b937bdf60 Guennadi Liakhovetski 2006-12-01  19  	  Terastation systems should be supported too.
04d76b937bdf60 Guennadi Liakhovetski 2006-12-01  20  
3490cba56f7f8a Jon Loeliger          2008-01-23  21  config STORCENTER
3490cba56f7f8a Jon Loeliger          2008-01-23  22  	bool "IOMEGA StorCenter"
3490cba56f7f8a Jon Loeliger          2008-01-23  23  	depends on EMBEDDED6xx
3490cba56f7f8a Jon Loeliger          2008-01-23  24  	select MPIC
3490cba56f7f8a Jon Loeliger          2008-01-23  25  	select FSL_SOC
3490cba56f7f8a Jon Loeliger          2008-01-23  26  	select PPC_UDBG_16550 if SERIAL_8250
3490cba56f7f8a Jon Loeliger          2008-01-23  27  	select MPC10X_BRIDGE
3490cba56f7f8a Jon Loeliger          2008-01-23  28  	help
3490cba56f7f8a Jon Loeliger          2008-01-23  29  	  Select STORCENTER if configuring for the iomega StorCenter
3490cba56f7f8a Jon Loeliger          2008-01-23  30  	  with an 8241 CPU in it.
3490cba56f7f8a Jon Loeliger          2008-01-23  31  
c5d56332fd6c2f Zang Roy-r61911       2006-06-13  32  config MPC7448HPC2
c5d56332fd6c2f Zang Roy-r61911       2006-06-13  33  	bool "Freescale MPC7448HPC2(Taiga)"
a35e370cfd2ddf Arnd Bergmann         2007-08-30  34  	depends on EMBEDDED6xx
c5d56332fd6c2f Zang Roy-r61911       2006-06-13  35  	select TSI108_BRIDGE
c5d56332fd6c2f Zang Roy-r61911       2006-06-13  36  	select DEFAULT_UIMAGE
c5d56332fd6c2f Zang Roy-r61911       2006-06-13  37  	select PPC_UDBG_16550
c5d56332fd6c2f Zang Roy-r61911       2006-06-13  38  	help
c5d56332fd6c2f Zang Roy-r61911       2006-06-13  39  	  Select MPC7448HPC2 if configuring for Freescale MPC7448HPC2 (Taiga)
c5d56332fd6c2f Zang Roy-r61911       2006-06-13  40  	  platform
cb9e4d10c448a3 Josh Boyer            2007-05-08  41  
cb9e4d10c448a3 Josh Boyer            2007-05-08  42  config PPC_HOLLY
cb9e4d10c448a3 Josh Boyer            2007-05-08  43  	bool "PPC750GX/CL with TSI10x bridge (Hickory/Holly)"
a35e370cfd2ddf Arnd Bergmann         2007-08-30  44  	depends on EMBEDDED6xx
cb9e4d10c448a3 Josh Boyer            2007-05-08  45  	select TSI108_BRIDGE
cb9e4d10c448a3 Josh Boyer            2007-05-08  46  	select PPC_UDBG_16550
cb9e4d10c448a3 Josh Boyer            2007-05-08  47  	help
cb9e4d10c448a3 Josh Boyer            2007-05-08  48  	  Select PPC_HOLLY if configuring for an IBM 750GX/CL Eval
cb9e4d10c448a3 Josh Boyer            2007-05-08  49  	  Board with TSI108/9 bridge (Hickory/Holly)
fd4ba7e2b7ce9a Dale Farnsworth       2007-05-12  50  
be2019816e4dcd Stephen Chivers       2014-01-09 @51  config MVME5100
be2019816e4dcd Stephen Chivers       2014-01-09  52  	bool "Motorola/Emerson MVME5100"
be2019816e4dcd Stephen Chivers       2014-01-09  53  	depends on EMBEDDED6xx
be2019816e4dcd Stephen Chivers       2014-01-09  54  	select MPIC
eb01d42a77785f Christoph Hellwig     2018-11-15  55  	select FORCE_PCI
be2019816e4dcd Stephen Chivers       2014-01-09  56  	select PPC_INDIRECT_PCI
be2019816e4dcd Stephen Chivers       2014-01-09  57  	select PPC_I8259
be2019816e4dcd Stephen Chivers       2014-01-09  58  	select PPC_NATIVE
13ae40370f62cd Stephen Chivers       2014-04-20  59  	select PPC_UDBG_16550
be2019816e4dcd Stephen Chivers       2014-01-09  60  	help
be2019816e4dcd Stephen Chivers       2014-01-09  61  	  This option enables support for the Motorola (now Emerson) MVME5100
be2019816e4dcd Stephen Chivers       2014-01-09  62  	  board.
be2019816e4dcd Stephen Chivers       2014-01-09  63  

:::::: The code at line 2 was first introduced by commit
:::::: a35e370cfd2ddfb5d2f0ceae376ffeda273b357c [POWERPC] Move embedded6xx into multiplatform

:::::: TO: Arnd Bergmann <arnd@arndb.de>
:::::: CC: Paul Mackerras <paulus@samba.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
