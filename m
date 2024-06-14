Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4B99094E2
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jun 2024 01:58:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6151310E0AB;
	Fri, 14 Jun 2024 23:58:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i4svqj1n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDBCB10E0AB
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 23:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718409510; x=1749945510;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=99uB7Cd/uOD/uoxvs4cOs2zbalcob2jqxeYr3FcXzhk=;
 b=i4svqj1nhqAs5nXIPdIgRQaJHrhGsY1A+ppMcK/sQFAwLWv785RvpnGM
 glG8mawBsJoNZotZmeLPRCqG9p6BxNYd6CDykRYuforlylTMmqY1IY9Ye
 SS/33drVRpcB2R5WXldV5/4MfSCynZFvNsOWKoPPK3wFDkWmZoWwFI3WN
 QNMcbWpzDc9OXgMv9VgvxOSqaSGy8VNZLcFG6qZlIYZqPI9bADtPo2MYu
 XwqLLOxAf5iGUtLWslOx5XU/sVSbYb/6TQaOoyeBleyD478rmxNe44/sR
 YOZP1l02DuRmqHK0da7b8AF2YIGKxTMR4QnRESTSFKmVnGQduB8Hr57md g==;
X-CSE-ConnectionGUID: O8QToTSLSmGCht2WTdnOkQ==
X-CSE-MsgGUID: XOD3ZvYURuuMuZdBC/Lbug==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="19143788"
X-IronPort-AV: E=Sophos;i="6.08,239,1712646000"; d="scan'208";a="19143788"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 16:58:30 -0700
X-CSE-ConnectionGUID: s7eKz1ViRzW+lQaQsi6rIQ==
X-CSE-MsgGUID: PLEkrzrOSRi/OdhW/NA6uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,239,1712646000"; d="scan'208";a="40754516"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
 by fmviesa009.fm.intel.com with ESMTP; 14 Jun 2024 16:58:28 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sIGoL-0001vR-2U;
 Fri, 14 Jun 2024 23:58:25 +0000
Date: Sat, 15 Jun 2024 07:58:25 +0800
From: kernel test robot <lkp@intel.com>
To: Danilo Krummrich <dakr@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 dri-devel@lists.freedesktop.org
Subject: [drm-misc:topic/rust-drm 3/21] error[E0050]: method `init` has 1
 parameter but the declaration in trait `kernel::Module::init` has 2
Message-ID: <202406150700.bk4MlPf7-lkp@intel.com>
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
head:   0a137e568c054362d0988cd65c2960de3172ff41
commit: f79700d8c6eee68d6d2c0eb92113211d22501860 [3/21] rust: pass module name to `Module::init`
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240615/202406150700.bk4MlPf7-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240615/202406150700.bk4MlPf7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406150700.bk4MlPf7-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0050]: method `init` has 1 parameter but the declaration in trait `kernel::Module::init` has 2
   --> drivers/net/phy/ax88796b_rust.rs:14:1
   |
   14 | / kernel::module_phy_driver! {
   15 | |     drivers: [PhyAX88772A, PhyAX88772C, PhyAX88796B],
   16 | |     device_table: [
   17 | |         DeviceId::new_with_driver::<PhyAX88772A>(),
   ...  |
   24 | |     license: "GPL",
   25 | | }
   | |_^ expected 2 parameters, found 1
   |
>> = note: `init` from trait: `fn(&'static kernel::prelude::CStr, &'static kernel::ThisModule) -> core::result::Result<Self, kernel::error::Error>`
   = note: this error originates in the macro `kernel::module_phy_driver` (in Nightly builds, run with -Z macro-backtrace for more info)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
