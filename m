Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1EEE7F562D
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 02:55:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2846F10E6C5;
	Thu, 23 Nov 2023 01:55:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11ADF10E6C2;
 Thu, 23 Nov 2023 01:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700704519; x=1732240519;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=lSkx3y0J9n5U+7y7kgBjxoaHDhGYZgqDu/5TrNRxgSM=;
 b=WAmBcIFiiv2HNaFGt3YBBdIpWRkKaKZ2G3JW0XAfX8Dw4k7UaIqEYO0G
 Sn0t4WvkeOrbiogHRMviOAOW7GEf7ZArOBrSZu7zQ8UaL/spobIcSyvys
 snqzDzojwHOk2J1s9u8Rh11PtYvgfgWipD3SoWz5iyxlJyl7LcRVeVSHT
 gdx7E3sYGwJ1qW7yv7UjmfJEYliFppUr/vq531YY7w8hgCNigfR0kO2dQ
 8vXzhKRIlwbwR6eoN6p4Hq5hsdyMuxDGWb6YBsjlxtzj2OwIt+DU7JBdc
 OLYMpgd2gXSdjiyFPE7MwETt0ujTshBq8XBunaOe0RVuSlTqXcMnuvmqU w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="13737202"
X-IronPort-AV: E=Sophos;i="6.04,220,1695711600"; d="scan'208";a="13737202"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 17:55:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="801909599"
X-IronPort-AV: E=Sophos;i="6.04,220,1695711600"; d="scan'208";a="801909599"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
 by orsmga001.jf.intel.com with ESMTP; 22 Nov 2023 17:55:14 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1r5yvv-00016S-2p;
 Thu, 23 Nov 2023 01:55:11 +0000
Date: Thu, 23 Nov 2023 09:54:42 +0800
From: kernel test robot <lkp@intel.com>
To: Samuel Holland <samuel.holland@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/3] riscv: Add support for kernel-mode FPU
Message-ID: <202311230628.TkL31MjJ-lkp@intel.com>
References: <20231122030621.3759313-2-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231122030621.3759313-2-samuel.holland@sifive.com>
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
Cc: Pan Xinhui <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Samuel Holland <samuel.holland@sifive.com>,
 amd-gfx@lists.freedesktop.org, oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Samuel,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on linus/master v6.7-rc2 next-20231122]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Samuel-Holland/riscv-Add-support-for-kernel-mode-FPU/20231122-111015
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20231122030621.3759313-2-samuel.holland%40sifive.com
patch subject: [PATCH 1/3] riscv: Add support for kernel-mode FPU
config: riscv-randconfig-r111-20231123 (https://download.01.org/0day-ci/archive/20231123/202311230628.TkL31MjJ-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231123/202311230628.TkL31MjJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311230628.TkL31MjJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/linkage.h:7,
                    from include/linux/printk.h:8,
                    from include/asm-generic/bug.h:22,
                    from arch/riscv/include/asm/bug.h:83,
                    from include/linux/bug.h:5,
                    from arch/riscv/include/asm/current.h:13,
                    from include/linux/sched.h:12,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from arch/riscv/kernel/process.c:10:
>> arch/riscv/kernel/process.c:229:19: error: '__fstate_save' undeclared here (not in a function); did you mean 'fstate_save'?
     229 | EXPORT_SYMBOL_GPL(__fstate_save);
         |                   ^~~~~~~~~~~~~
   include/linux/export.h:74:23: note: in definition of macro '__EXPORT_SYMBOL'
      74 |         extern typeof(sym) sym;                                 \
         |                       ^~~
   include/linux/export.h:87:41: note: in expansion of macro '_EXPORT_SYMBOL'
      87 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   arch/riscv/kernel/process.c:229:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     229 | EXPORT_SYMBOL_GPL(__fstate_save);
         | ^~~~~~~~~~~~~~~~~
>> arch/riscv/kernel/process.c:230:19: error: '__fstate_restore' undeclared here (not in a function); did you mean 'fstate_restore'?
     230 | EXPORT_SYMBOL_GPL(__fstate_restore);
         |                   ^~~~~~~~~~~~~~~~
   include/linux/export.h:74:23: note: in definition of macro '__EXPORT_SYMBOL'
      74 |         extern typeof(sym) sym;                                 \
         |                       ^~~
   include/linux/export.h:87:41: note: in expansion of macro '_EXPORT_SYMBOL'
      87 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   arch/riscv/kernel/process.c:230:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     230 | EXPORT_SYMBOL_GPL(__fstate_restore);
         | ^~~~~~~~~~~~~~~~~


vim +229 arch/riscv/kernel/process.c

   228	
 > 229	EXPORT_SYMBOL_GPL(__fstate_save);
 > 230	EXPORT_SYMBOL_GPL(__fstate_restore);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
