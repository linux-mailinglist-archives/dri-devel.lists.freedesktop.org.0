Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F14998812D
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 11:21:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCC1D10EC9C;
	Fri, 27 Sep 2024 09:21:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iZpqccIc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 664BE10EC9D
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2024 09:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727428874; x=1758964874;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Feg1rJf+Ok5MuyDp5qFLYt1e9SPAPqpO16Fov4Dpznc=;
 b=iZpqccIcILVxD+iDtzn8CrWZZ4fs5xP0wEs6q1DXFGPZeaEQpWkIq9jp
 ADXEnKvRHlVgJ4+w0oFqWYhJnQNyVLg3Vxj3OV3eaU6/HL5bX0XgEOVR8
 4/aq7mErbcYk7dO3y9DbQ4+/yd0pGsUvuPEGf6ojDqsZzR259GwTxz3A7
 8OOuyvjldN1+0/DPMaXDTnm/TpBSiPycxxoQlanKJ31913jojpmQpiG2R
 4XKtQ322VViPjl3aH9taZDW/0CKk3GnOULd6plARIBGJnQx3zgXPlTsh2
 dbcD3aDik+xsuUvVdMtgngCNFTkvxLHRJQ4fTGhC1i2N/pgx7lyLaLCIM w==;
X-CSE-ConnectionGUID: xiV6ysV+RcaQ17PZeJ+etg==
X-CSE-MsgGUID: qr3ayiDgS5mUt+sMHxhTCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="44082373"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; d="scan'208";a="44082373"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 02:21:14 -0700
X-CSE-ConnectionGUID: AXRdLICrR9C1Rt4gFoKHdQ==
X-CSE-MsgGUID: 5EBYGRSSQzin8++YidxWgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; d="scan'208";a="76845810"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
 by fmviesa005.fm.intel.com with ESMTP; 27 Sep 2024 02:21:10 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1su79v-000Lkt-1g;
 Fri, 27 Sep 2024 09:21:07 +0000
Date: Fri, 27 Sep 2024 17:20:46 +0800
From: kernel test robot <lkp@intel.com>
To: Werner Sembach <wse@tuxedocomputers.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, bentiss@kernel.org,
 dri-devel@lists.freedesktop.org, jelle@vdwaa.nl, jikos@kernel.org,
 lee@kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
 miguel.ojeda.sandonis@gmail.com, ojeda@kernel.org,
 onitake@gmail.com, pavel@ucw.cz, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 1/1] platform/x86/tuxedo: Add virtual LampArray for
 TUXEDO NB04 devices
Message-ID: <202409271653.rAiw37rN-lkp@intel.com>
References: <20240926174405.110748-2-wse@tuxedocomputers.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240926174405.110748-2-wse@tuxedocomputers.com>
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

Hi Werner,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm-tip/drm-tip lee-leds/for-leds-next linus/master v6.11 next-20240927]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Werner-Sembach/platform-x86-tuxedo-Add-virtual-LampArray-for-TUXEDO-NB04-devices/20240927-014628
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240926174405.110748-2-wse%40tuxedocomputers.com
patch subject: [PATCH 1/1] platform/x86/tuxedo: Add virtual LampArray for TUXEDO NB04 devices
config: i386-buildonly-randconfig-002-20240927 (https://download.01.org/0day-ci/archive/20240927/202409271653.rAiw37rN-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240927/202409271653.rAiw37rN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409271653.rAiw37rN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_ab_virtual_lamp_array.c: In function 'll_raw_request':
>> <command-line>: warning: format '%lu' expects argument of type 'long unsigned int', but argument 6 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
   <command-line>: note: in definition of macro 'KBUILD_MODNAME'
   include/linux/dynamic_debug.h:224:29: note: in expansion of macro 'pr_fmt'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:9: note: in expansion of macro '__dynamic_func_call_cls'
     248 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:269:9: note: in expansion of macro '_dynamic_func_call'
     269 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/printk.h:589:9: note: in expansion of macro 'dynamic_pr_debug'
     589 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~
   drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_ab_virtual_lamp_array.c:669:9: note: in expansion of macro 'pr_debug'
     669 |         pr_debug("Recived report: rtype: %u, reqtype: %u, reportnum: %u, len: %lu buf:\n", rtype,
         |         ^~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
