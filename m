Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CDA778253
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 22:49:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64C1F10E606;
	Thu, 10 Aug 2023 20:49:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25E3F10E606
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 20:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691700562; x=1723236562;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Od6lWd4zxNR8Y6Tgtx0NCL3HysEsaLONUvRtKsCh7T4=;
 b=DMdMtOFFeXw7a2AOwa/NQ5YJ4M3+5bZ3UWRT6cLzEXPlu1khBAEDZbf6
 sHAC8vMcEOneYVtwbS8gdeJRyRDdz2Kp1CQ2wZqV6Su2K7wcwkRD3Q+ro
 UR23IQA5YfK1Vf4BP7gzMS7/huy+nbVSIystl2p31V/N2OQQJbaHW7wfW
 lDD0baXFi1w3Y1nDi6/Cd1eDsDBqOzJ+qU6+WXEQytpiuYPY4KCNacZmz
 IiseN697ahAtuWxdE1TieHWMc/aXhd1UP6BK2yEeagZKT0ogr3NVu5Oos
 sYIpbEMq7O2f7iJcazdAuOeaoI8mwKAnwlyVANxV8H9KbRfQcqXLELSr+ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="361657499"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; d="scan'208";a="361657499"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2023 13:49:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="732422532"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; d="scan'208";a="732422532"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
 by orsmga002.jf.intel.com with ESMTP; 10 Aug 2023 13:49:19 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qUCas-0007FA-2e;
 Thu, 10 Aug 2023 20:49:18 +0000
Date: Fri, 11 Aug 2023 04:49:04 +0800
From: kernel test robot <lkp@intel.com>
To: Sui Jingfeng <suijingfeng@loongson.cn>
Subject: Re: [PATCH] PCI/VGA: Make the vga_is_firmware_default()
 arch-independent
Message-ID: <202308110416.0wAKt0vo-lkp@intel.com>
References: <20230803081758.968742-1-suijingfeng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230803081758.968742-1-suijingfeng@loongson.cn>
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
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, loongson-kernel@lists.loongnix.cn,
 oe-kbuild-all@lists.linux.dev, bhelgaas@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sui,

kernel test robot noticed the following build errors:

[auto build test ERROR on pci/next]
[also build test ERROR on pci/for-linus linus/master v6.5-rc5 next-20230809]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sui-Jingfeng/PCI-VGA-Make-the-vga_is_firmware_default-arch-independent/20230803-161838
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20230803081758.968742-1-suijingfeng%40loongson.cn
patch subject: [PATCH] PCI/VGA: Make the vga_is_firmware_default() arch-independent
config: arm64-randconfig-r052-20230811 (https://download.01.org/0day-ci/archive/20230811/202308110416.0wAKt0vo-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230811/202308110416.0wAKt0vo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308110416.0wAKt0vo-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: drivers/pci/vgaarb.o: in function `vga_arb_firmware_fb_addr_tracker':
>> vgaarb.c:(.text+0x138): undefined reference to `screen_info'
   aarch64-linux-ld: drivers/pci/vgaarb.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `screen_info' which may bind externally can not be used when making a shared object; recompile with -fPIC
   vgaarb.c:(.text+0x138): dangerous relocation: unsupported relocation
>> aarch64-linux-ld: vgaarb.c:(.text+0x13c): undefined reference to `screen_info'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
