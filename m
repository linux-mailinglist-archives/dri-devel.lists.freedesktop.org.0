Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DACD954F14
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2024 18:43:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 085FB10E80D;
	Fri, 16 Aug 2024 16:43:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JRI3UACH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E292F10E80D
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2024 16:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723826587; x=1755362587;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=s+RQV6PGC3uVHE7m6vUGArXaA2d1pLNwa8KRwlQhtxg=;
 b=JRI3UACHr5TfrZ/gq1H/MrEtSau5eeNd8X7dXlO+0KkORtOiFSTyCvd6
 C9Ch/N3BZEsg1/8xOA8NJPZrBw9GzcrfnbqynBArkxnYLGnfrSPdA7zas
 3Cln3rZv1GROS8OU2mMK1tLmmAzMBwObn79oAc8+VNOw1HMq45yWdId1w
 G36ehCtnnjLrkN6BZTRlmuHS3ar+R20ts1Lm2eeRCLK1RAExqmpC9rf3U
 c87RwC2J+Yl2DNQn3BeMlCOjsQiYwqeyRU8pANzj+og8/NRI/9zzKrK1q
 a9MEG6t6zlDBW3g0MIBA21I4N9QOfXVQTUida0ppIfSe/Oh/81a9zPYqn A==;
X-CSE-ConnectionGUID: aFSErB1fTZqgDx4vf+XOXw==
X-CSE-MsgGUID: xUD7xgl0RP26nbWN0Uf8NA==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="22275354"
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; d="scan'208";a="22275354"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 09:43:06 -0700
X-CSE-ConnectionGUID: DACMLw01TR2IEgF6vZ9iMg==
X-CSE-MsgGUID: r5nXrdmxR42MnH/wvDMqEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; d="scan'208";a="59745117"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
 by fmviesa009.fm.intel.com with ESMTP; 16 Aug 2024 09:43:05 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sf02Y-0006eY-2T;
 Fri, 16 Aug 2024 16:43:02 +0000
Date: Sat, 17 Aug 2024 00:42:40 +0800
From: kernel test robot <lkp@intel.com>
To: Danilo Krummrich <dakr@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Philipp Stanner <pstanner@redhat.com>
Subject: [drm-misc:topic/rust-drm 9/19] error[E0425]: cannot find function
 `iounmap` in crate `bindings`
Message-ID: <202408170035.K8VPd6FK-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

tree:   git://anongit.freedesktop.org/drm/drm-misc topic/rust-drm
head:   ac3b90930f007514defbf06ec63a07122b02ba8a
commit: 41bf8ed78cc51e13c60dbc7ff755a74ca968b91f [9/19] rust: add `io::Io` base type
config: um-randconfig-001-20240816 (https://download.01.org/0day-ci/archive/20240817/202408170035.K8VPd6FK-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 26670e7fa4f032a019d23d56c6a02926e854e8af)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240817/202408170035.K8VPd6FK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408170035.K8VPd6FK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0425]: cannot find function `iounmap` in crate `bindings`
   --> rust/doctests_kernel_generated.rs:2439:28
   |
   2439 |         unsafe { bindings::iounmap(self.0.base_addr() as _); };
   |                            ^^^^^^^ not found in `bindings`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
