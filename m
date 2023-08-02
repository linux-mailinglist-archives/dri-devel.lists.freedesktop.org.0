Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1EF976C3A1
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 05:41:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B8BD10E48D;
	Wed,  2 Aug 2023 03:41:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EEBA10E48F
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 03:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690947675; x=1722483675;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Alv4LIt+me26FKI8aUKd7sa+qxe9P74mpHMU0PpwyFA=;
 b=DbkUC1PyNyFzuJTPvy48D7D2BPZxjBCS+zqx7Zc0Go03Zx6Of8N2P3Ir
 Xo1rBx5X39IQhNshXdM5qsSqXzNAz3XJmrx8SE3+3T7oKWMYRojK8HL/P
 efIasv6z/K/zV7KLRHiGatZAaRXyKUQ4Or7jVCFQbFsa96uMeFcjf6zQ0
 KqTsqX4PCGM1fSvn1P7GeCf1cXmR6tvrLaJpbvWg/AyrT1XcaCVcJETc3
 UYdlpy6qeP0N3pviPn9+CdchhmYOx/dKFJQrl7p/JN43U3HKOO43y3a0w
 Ykj0+9pYl/JZvucMgBA4dwkRi0ksYNABcQ808cZ/9ovv52pfCJ7Jq+X3o g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="400418309"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; d="scan'208";a="400418309"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 20:41:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="1059661650"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; d="scan'208";a="1059661650"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
 by fmsmga005.fm.intel.com with ESMTP; 01 Aug 2023 20:41:05 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qR2jQ-0000og-2d;
 Wed, 02 Aug 2023 03:41:04 +0000
Date: Wed, 2 Aug 2023 11:40:17 +0800
From: kernel test robot <lkp@intel.com>
To: Sui Jingfeng <suijingfeng@loongson.cn>, Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH] PCI/VGA: Fixup the firmware fb address om demanding time
Message-ID: <202308021153.w0leLadx-lkp@intel.com>
References: <20230801183706.702567-1-suijingfeng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230801183706.702567-1-suijingfeng@loongson.cn>
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
Cc: loongson-kernel@lists.loongnix.cn, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sui,

kernel test robot noticed the following build errors:

[auto build test ERROR on pci/next]
[also build test ERROR on pci/for-linus linus/master v6.5-rc4 next-20230801]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sui-Jingfeng/PCI-VGA-Fixup-the-firmware-fb-address-om-demanding-time/20230802-023743
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20230801183706.702567-1-suijingfeng%40loongson.cn
patch subject: [PATCH] PCI/VGA: Fixup the firmware fb address om demanding time
config: parisc64-defconfig (https://download.01.org/0day-ci/archive/20230802/202308021153.w0leLadx-lkp@intel.com/config)
compiler: hppa64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230802/202308021153.w0leLadx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308021153.w0leLadx-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa64-linux-ld: drivers/pci/vgaarb.o: in function `vga_arb_firmware_fb_addr_tracker':
>> (.text+0x1d0): undefined reference to `screen_info'
>> hppa64-linux-ld: (.text+0x1d4): undefined reference to `screen_info'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
