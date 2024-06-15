Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F529098AC
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jun 2024 16:37:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96EEC10E04B;
	Sat, 15 Jun 2024 14:37:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TEH9tBc0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FBC110E04B
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jun 2024 14:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718462243; x=1749998243;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=08UJ5SiSS9g5bbdEdTId3IcN/Pnqg2RemH/CHhXvSOY=;
 b=TEH9tBc02aNMApOj7ms5b7iqKek2KimLakOQUGePrQwkzgnxoFZvX6t7
 1hiheeiEeh/gSe0hmb9A9daRqo5w1zGT5eKlxm0G6zGrXqevYOimlFqXd
 Ki5khOwD9MdVDeToLs9Ki+xrg75usCALcnyqdJzmfb0q+tVhGP3YwxG/4
 UkKUhGcWxfGCdJ/ZAxElNuEAkNeFfFEABo6Dr6SGKiNH8PAr3vuKbHCTI
 NWMxVqKuo34PALq6r0xPvVXl6KU5eSBmOw13CkwgxI7bUIEp7wampb5AM
 furyAyCvKAD2ojyKXIffpsZ3QrmBW47DXwuP0/FR72OHvp33VXl3TOuIm A==;
X-CSE-ConnectionGUID: 7lb1x/0lQ0WY0rc0EmSivg==
X-CSE-MsgGUID: F/Fp+XZtTZeAWOuBO4v2Cw==
X-IronPort-AV: E=McAfee;i="6700,10204,11104"; a="37869944"
X-IronPort-AV: E=Sophos;i="6.08,240,1712646000"; d="scan'208";a="37869944"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2024 07:37:22 -0700
X-CSE-ConnectionGUID: mQrfOByJTUGVHS1L/DgZDQ==
X-CSE-MsgGUID: Gn5POfc0RKKxqdEGk2RbIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,240,1712646000"; d="scan'208";a="45709164"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
 by orviesa003.jf.intel.com with ESMTP; 15 Jun 2024 07:37:21 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sIUWt-00007E-0Q;
 Sat, 15 Jun 2024 14:37:19 +0000
Date: Sat, 15 Jun 2024 22:36:39 +0800
From: kernel test robot <lkp@intel.com>
To: Wedson Almeida Filho <walmeida@microsoft.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Danilo Krummrich <dakr@redhat.com>
Subject: [drm-misc:topic/rust-drm 5/21] error[E0425]: cannot find value
 `THIS_MODULE` in the crate root
Message-ID: <202406152203.flX7Kviw-lkp@intel.com>
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
commit: b7222062b14f6c9e501a405305052fe88c5ff51e [5/21] rust: introduce `InPlaceModule`
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240615/202406152203.flX7Kviw-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240615/202406152203.flX7Kviw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406152203.flX7Kviw-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0425]: cannot find value `THIS_MODULE` in the crate root
   --> rust/doctests_kernel_generated.rs:1649:1
   |
   1649 | / kernel::module_phy_driver! {
   1650 | |     drivers: [PhySample],
   1651 | |     device_table: [
   1652 | |         DeviceId::new_with_driver::<PhySample>()
   ...    |
   1657 | |     license: "GPL",
   1658 | | }
   | |_^ not found in the crate root
   |
   = note: this error originates in the macro `$crate::prelude::module` which comes from the expansion of the macro `kernel::module_phy_driver` (in Nightly builds, run with -Z macro-backtrace for more info)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
