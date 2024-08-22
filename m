Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA2C95B309
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 12:39:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9228710E847;
	Thu, 22 Aug 2024 10:39:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SQ+IkycK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8629E10E847
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 10:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724323144; x=1755859144;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=By0fQxIG06ZLRfs6G47zO6X9vuZE55gXLRUegu6W+hU=;
 b=SQ+IkycKDHauM7jsHdtQxUXXQ9NtNhYHTO55AVWQzsUFgmdKub0i5yb+
 Z2S4KU7oUXdXPaJnwVF3xmz5Rp4iKG+n7WECEjRDstREFSWLmnrcF2jo6
 qFwR26EH4oDsF1tZPjL26P2khUKyoaGGdZbt+SS0u6wmXpJiPxpmvGIZm
 7an7P2PGKMARSY+PHeCK+6nTbal0wki7FMB6hziJLhsyjPbo1D9KZtz0J
 3NmRisV5AhOjEGtYZKBMVSPhYrqgJcAxHgCg5CGuXntqPrTlRzPXd0dM/
 HOrMtK2vjXwKwMa4f7VpOVIEfVEWYd2grJoRewJiEcsROoWWK+WKDe9S2 w==;
X-CSE-ConnectionGUID: QYSr7RGdTzi88cMc2IKScw==
X-CSE-MsgGUID: BtlvYE+kRa+VFPvG+zBkpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="22250203"
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; d="scan'208";a="22250203"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 03:39:04 -0700
X-CSE-ConnectionGUID: eXF1aIU1Rfq3si9eK6Bgfg==
X-CSE-MsgGUID: dN4jdnZgQbG92KZZiP9kEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; d="scan'208";a="62123434"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
 by orviesa008.jf.intel.com with ESMTP; 22 Aug 2024 03:39:02 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sh5DX-000Cfs-1Q;
 Thu, 22 Aug 2024 10:38:59 +0000
Date: Thu, 22 Aug 2024 18:38:33 +0800
From: kernel test robot <lkp@intel.com>
To: "hongchi.peng" <hongchi.peng@siengine.com>, liviu.dudau@arm.com
Cc: oe-kbuild-all@lists.linux.dev, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org, hongchi.peng@siengine.com
Subject: Re: [PATCH] drm: komeda: Fix an issue related to normalized zpos
Message-ID: <202408222005.Pr9Vj8sj-lkp@intel.com>
References: <20240821085613.5408-1-hongchi.peng@siengine.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240821085613.5408-1-hongchi.peng@siengine.com>
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

Hi hongchi.peng,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on linus/master v6.11-rc4 next-20240822]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/hongchi-peng/drm-komeda-Fix-an-issue-related-to-normalized-zpos/20240822-045334
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240821085613.5408-1-hongchi.peng%40siengine.com
patch subject: [PATCH] drm: komeda: Fix an issue related to normalized zpos
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240822/202408222005.Pr9Vj8sj-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240822/202408222005.Pr9Vj8sj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408222005.Pr9Vj8sj-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   drivers/gpu/drm/arm/display/komeda/komeda_kms.c: In function 'komeda_crtc_normalize_zpos':
>> include/linux/compiler_types.h:510:45: error: call to '__compiletime_assert_301' declared with attribute error: max(slave_zpos, kcrtc_st->max_slave_zorder) signedness error
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:491:25: note: in definition of macro '__compiletime_assert'
     491 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:510:9: note: in expansion of macro '_compiletime_assert'
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:100:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     100 |         BUILD_BUG_ON_MSG(!__types_ok(x,y,ux,uy),        \
         |         ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:105:9: note: in expansion of macro '__careful_cmp_once'
     105 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:136:25: note: in expansion of macro '__careful_cmp'
     136 | #define max(x, y)       __careful_cmp(max, x, y)
         |                         ^~~~~~~~~~~~~
   drivers/gpu/drm/arm/display/komeda/komeda_kms.c:207:33: note: in expansion of macro 'max'
     207 |                                 max(slave_zpos, kcrtc_st->max_slave_zorder);
         |                                 ^~~


vim +/__compiletime_assert_301 +510 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  496  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  497  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  498  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  499  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  500  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  501   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  502   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  503   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  504   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  505   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  506   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  507   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  508   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  509  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @510  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  511  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
