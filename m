Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 407B676E821
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 14:26:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26A7010E114;
	Thu,  3 Aug 2023 12:26:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACF2710E114
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 12:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691065586; x=1722601586;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2F5IYI+st9aRDs3eL22xgwh/NWyfWxHGIKX3hSkU1es=;
 b=SmCRG88uMeD7OY/JymmzY+kLc35jNU5UsYIjd8lupMzVE8/BMDQkJB7z
 +oJGXKfYufYplTWesPOMIsN7e2HxzwzIZJCwUCpAw+h6fhFOlkFW1OwbO
 LqQpBAlt3Zb6e/VM78Bqg2/5ABM5mx2TmyRJmqbH9bHWV//Cu42UVEdaN
 za//qYkON4G/hEWfJ5Q1QxceStCiEl9IZ1fKjEZuCd9ms6DUjHAvYXjzO
 GxoUkG9Cyp1eTTagvf8DEbEmgP/QRbLW7OzmHebiWImX6M+tvf94g6ggt
 OBafLrluIgkEBQvQNjbrQy+nq0zhQaLYfsIr5Ycs8uooa/my2dPEPpxKf Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="436165449"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; d="scan'208";a="436165449"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2023 05:26:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="706515734"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; d="scan'208";a="706515734"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
 by orsmga006.jf.intel.com with ESMTP; 03 Aug 2023 05:26:25 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qRXPM-00026d-1d;
 Thu, 03 Aug 2023 12:26:24 +0000
Date: Thu, 3 Aug 2023 20:25:45 +0800
From: kernel test robot <lkp@intel.com>
To: Sui Jingfeng <suijingfeng@loongson.cn>
Subject: Re: [PATCH] PCI/VGA: Make the vga_is_firmware_default()
 arch-independent
Message-ID: <202308032022.yiZngbbk-lkp@intel.com>
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
Cc: linux-pci@vger.kernel.org, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 loongson-kernel@lists.loongnix.cn, oe-kbuild-all@lists.linux.dev,
 bhelgaas@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sui,

kernel test robot noticed the following build errors:

[auto build test ERROR on pci/next]
[also build test ERROR on pci/for-linus linus/master v6.5-rc4 next-20230803]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sui-Jingfeng/PCI-VGA-Make-the-vga_is_firmware_default-arch-independent/20230803-161838
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20230803081758.968742-1-suijingfeng%40loongson.cn
patch subject: [PATCH] PCI/VGA: Make the vga_is_firmware_default() arch-independent
config: arm64-randconfig-r026-20230731 (https://download.01.org/0day-ci/archive/20230803/202308032022.yiZngbbk-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230803/202308032022.yiZngbbk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308032022.yiZngbbk-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: screen_info
   >>> referenced by vgaarb.c:86 (drivers/pci/vgaarb.c:86)
   >>>               drivers/pci/vgaarb.o:(vga_arb_firmware_fb_addr_tracker) in archive vmlinux.a
   >>> referenced by vgaarb.c:86 (drivers/pci/vgaarb.c:86)
   >>>               drivers/pci/vgaarb.o:(vga_arb_firmware_fb_addr_tracker) in archive vmlinux.a
   >>> referenced by vgaarb.c:88 (drivers/pci/vgaarb.c:88)
   >>>               drivers/pci/vgaarb.o:(vga_arb_firmware_fb_addr_tracker) in archive vmlinux.a
   >>> referenced 3 more times

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
