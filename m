Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A86A905AEC
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 20:31:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D85E10E737;
	Wed, 12 Jun 2024 18:31:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cz0ni2MF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B832410E03A
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 18:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718217071; x=1749753071;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=p3dWe+63QeDhzAeSSz5f4FpmOpXQTay3pv96SHXwz+U=;
 b=cz0ni2MFm56Asz6rlly0qVFXKejbzNQ/n50hV/76pQ88H4RkSM/+QzaD
 HNgUSNYNW63ESmWt9nODfOeT3CwWRqFFcNxWJlXsilr2DfbG8BwEM6ua4
 YmaXB6G9/Ip5X5sTwJ2z4pXdh1keV/8KH3kup+RGjOA0X6y+KeCZbLAY5
 nBZGKZ+2Jbd3m6u7SZstVqG1QcmTxL+EvwxDWhtb5/b8KG+xRaiDYdsj3
 9l4pVsOUXJWqmEsX/KRoy0P5lSnK0zgAqK4GN4yC7RWDWkdYR2qtcl9Aj
 AYJ7DvswAuHvEmmfZnUK7UUs85HfennC+UotCNamHZ/PS0fsUPRqpeJ23 w==;
X-CSE-ConnectionGUID: c4nI+IsZTLSM3XcaHm3GCg==
X-CSE-MsgGUID: b8AfyLFrQZiVcvpIKl66Eg==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="14722617"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="14722617"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 11:31:10 -0700
X-CSE-ConnectionGUID: kkuxxgBnQEanR0lh1dGImg==
X-CSE-MsgGUID: T8L4/o74T5W2IPWNGBFmXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="44268202"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
 by fmviesa003.fm.intel.com with ESMTP; 12 Jun 2024 11:31:08 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sHSkU-0001ou-1d;
 Wed, 12 Jun 2024 18:31:06 +0000
Date: Thu, 13 Jun 2024 02:30:57 +0800
From: kernel test robot <lkp@intel.com>
To: Danilo Krummrich <dakr@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 dri-devel@lists.freedesktop.org
Subject: [drm-misc:topic/rust-drm 3/21] error[E0050]: method `init` has 1
 parameter but the declaration in trait
 `rust_doctest_kernel_build_assert_rs_0::kernel::Module::init` has 2
Message-ID: <202406130231.e4T7rPcH-lkp@intel.com>
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
head:   8f5d38cf42672216b6162952b8ad13a9b15ba78c
commit: 7d4e13685931d292d28484e486b5eb9ad7dba420 [3/21] rust: pass module name to `Module::init`
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240613/202406130231.e4T7rPcH-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240613/202406130231.e4T7rPcH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406130231.e4T7rPcH-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0050]: method `init` has 1 parameter but the declaration in trait `rust_doctest_kernel_build_assert_rs_0::kernel::Module::init` has 2
   --> rust/doctests_kernel_generated.rs:1700:1
   |
   1700 | / kernel::module_phy_driver! {
   1701 | |     drivers: [PhySample],
   1702 | |     device_table: [
   1703 | |         DeviceId::new_with_driver::<PhySample>()
   ...    |
   1708 | |     license: "GPL",
   1709 | | }
   | |_^ expected 2 parameters, found 1
   |
>> = note: `init` from trait: `fn(&'static rust_doctest_kernel_build_assert_rs_0::kernel::prelude::CStr, &'static rust_doctest_kernel_build_assert_rs_0::kernel::ThisModule) -> core::result::Result<Self, rust_doctest_kernel_build_assert_rs_0::kernel::error::Error>`
   = note: this error originates in the macro `kernel::module_phy_driver` (in Nightly builds, run with -Z macro-backtrace for more info)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
