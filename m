Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 606D79096DF
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jun 2024 10:17:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0F3510E07C;
	Sat, 15 Jun 2024 08:17:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vc1fYdfY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2E1E10E07C
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jun 2024 08:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718439472; x=1749975472;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=ztzIW+nBrv85EAmIVlKgjtahKcpyOcLSEe+KsSq8Cmk=;
 b=Vc1fYdfYvUZKyFVp8xyAar49DDTg5wri2qBnwEGqwhghMVsDEwgUzBKZ
 6zwciM5qzGpUUi1Y2V+peclpnp4NyQ+GFnbsapWyzrXR1N1ERKAvkYsJW
 WkG0Wx2XQZTI30inbuXqy1fmdEejhbg/6H29pGMR/8QuNK7P6DzF0ky40
 euTBPaEJW1mb9sxJLsvjzGaulCcFxcMzh9qWXt7kLVN6cmHTTYw2cXkYe
 4wUAW18Ieya3J9NhFZirJUKpxqBq/frrNWWidHa5NPQ5T4Xy7VpKlPPqD
 cHxASIMTMR7iJKunW6hzRPnKJG/wKTUCevyuRIUCWh8nvf29781w5un5y A==;
X-CSE-ConnectionGUID: nlUQ0n5YRQizudhqTR0x+w==
X-CSE-MsgGUID: JJGRkf8OQSGR24xsCBp9kg==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="15563275"
X-IronPort-AV: E=Sophos;i="6.08,240,1712646000"; d="scan'208";a="15563275"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2024 01:17:51 -0700
X-CSE-ConnectionGUID: 2cjg/osAQ6G20c6gqt1H5A==
X-CSE-MsgGUID: jMY2Y9clQNO+6Cd5tF8kRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,240,1712646000"; d="scan'208";a="78214498"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
 by orviesa001.jf.intel.com with ESMTP; 15 Jun 2024 01:17:50 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sIObb-0002Mz-2f;
 Sat, 15 Jun 2024 08:17:47 +0000
Date: Sat, 15 Jun 2024 16:17:33 +0800
From: kernel test robot <lkp@intel.com>
To: Danilo Krummrich <dakr@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 dri-devel@lists.freedesktop.org
Subject: [drm-misc:topic/rust-drm 3/21] error[E0050]: method `init` has 1
 parameter but the declaration in trait
 `rust_doctest_kernel_build_assert_rs_0::kernel::Module::init` has 2
Message-ID: <202406151629.Uqt0YkZz-lkp@intel.com>
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
head:   2e2592fb7d2165e68073020066789bd8860678d0
commit: f79700d8c6eee68d6d2c0eb92113211d22501860 [3/21] rust: pass module name to `Module::init`
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240615/202406151629.Uqt0YkZz-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240615/202406151629.Uqt0YkZz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406151629.Uqt0YkZz-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0050]: method `init` has 1 parameter but the declaration in trait `rust_doctest_kernel_build_assert_rs_0::kernel::Module::init` has 2
   --> rust/doctests_kernel_generated.rs:1649:1
   |
   1649 | / kernel::module_phy_driver! {
   1650 | |     drivers: [PhySample],
   1651 | |     device_table: [
   1652 | |         DeviceId::new_with_driver::<PhySample>()
   ...    |
   1657 | |     license: "GPL",
   1658 | | }
   | |_^ expected 2 parameters, found 1
   |
>> = note: `init` from trait: `fn(&'static rust_doctest_kernel_build_assert_rs_0::kernel::prelude::CStr, &'static rust_doctest_kernel_build_assert_rs_0::kernel::ThisModule) -> core::result::Result<Self, rust_doctest_kernel_build_assert_rs_0::kernel::error::Error>`
   = note: this error originates in the macro `kernel::module_phy_driver` (in Nightly builds, run with -Z macro-backtrace for more info)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
