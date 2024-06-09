Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A94C9016F8
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jun 2024 18:12:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 673E710E088;
	Sun,  9 Jun 2024 16:12:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z2ivZgEb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFA2310E088
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Jun 2024 16:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717949538; x=1749485538;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=Gw+qndGHPl4x+vHVL/0pw3/FQpdoCXyiuR2EuwIYGE0=;
 b=Z2ivZgEbh2DqvzMHykQ0GedK+nly9NwWdfs9Z7XURNc71fhRvUh74XVD
 CkjJO/8LMXdiBkJ8KXvdXRucH5MXrn6Xd9unzbDUM4L1fzhDL2powz04B
 Gx9pQaMBz8JaCpAMQrjtiIIbBQWEFPHdrHiXmz8qknciUq5ptm5lLeUZw
 /YRUZXK155RksHr6DOgTBGXTzID02N9nqRS/Ut0Kt6X3J7oZN5DTNn5fv
 IPd+kQGQqv3VBFPSSX8cTwPKbNMUvDfc3uWuvOb8hFA3UvH6d4aeyy0FG
 KxQALJXyb9TB/pzuEe0DrIvMwxvFkUBJmAnXdO4RLD3iKEtChgKQmaFBf A==;
X-CSE-ConnectionGUID: e8C8YAlZQDubyv2SL6zxKw==
X-CSE-MsgGUID: 1AN5NBXzQtC0/nMWIKamTw==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="14350810"
X-IronPort-AV: E=Sophos;i="6.08,225,1712646000"; d="scan'208";a="14350810"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2024 09:12:17 -0700
X-CSE-ConnectionGUID: GgnyuSvqT0mhOwPjfUJjFA==
X-CSE-MsgGUID: UV2Tw9h4R56Qn0NDQQUbnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,225,1712646000"; d="scan'208";a="43957576"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
 by orviesa004.jf.intel.com with ESMTP; 09 Jun 2024 09:12:17 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sGL9S-0001PE-1M;
 Sun, 09 Jun 2024 16:12:14 +0000
Date: Mon, 10 Jun 2024 00:12:09 +0800
From: kernel test robot <lkp@intel.com>
To: Danilo Krummrich <dakr@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Philipp Stanner <pstanner@redhat.com>
Subject: [drm-misc:topic/rust-drm 11/20] error: expected one of `:`, `@`, or
 `|`, found `paddr`
Message-ID: <202406100042.hx2LJmfc-lkp@intel.com>
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
head:   508348922df19178b613531fb6cc7beb624642ae
commit: e98a3de09cfc9fae923c259a48e3622cc2a6bb2e [11/20] rust: add devres abstraction
config: riscv-randconfig-r121-20240609 (https://download.01.org/0day-ci/archive/20240610/202406100042.hx2LJmfc-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
reproduce: (https://download.01.org/0day-ci/archive/20240610/202406100042.hx2LJmfc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406100042.hx2LJmfc-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: expected one of `:`, `@`, or `|`, found `paddr`
   --> rust/doctests_kernel_generated.rs:793:18
   |
   793 |     fn new(usize paddr, usize len) -> Result<Self>{
   |            ------^^^^^
   |            |     |
   |            |     expected one of `:`, `@`, or `|`
   |            help: declare the type after the parameter binding: `<identifier>: <type>`
--
>> error: expected one of `:`, `@`, or `|`, found `len`
   --> rust/doctests_kernel_generated.rs:793:31
   |
   793 |     fn new(usize paddr, usize len) -> Result<Self>{
   |                         ------^^^
   |                         |     |
   |                         |     expected one of `:`, `@`, or `|`
   |                         help: declare the type after the parameter binding: `<identifier>: <type>`
--
>> error[E0412]: cannot find type `IoMem` in this scope
   --> rust/doctests_kernel_generated.rs:790:16
   |
   790 | struct IoRemap(IoMem);
   |                ^^^^^ not found in this scope
--
>> error[E0405]: cannot find trait `Deref` in this scope
   --> rust/doctests_kernel_generated.rs:808:6
   |
   808 | impl Deref for IoRemap {
   |      ^^^^^ not found in this scope
   |
   help: consider importing this trait
   |
   3   + use core::ops::Deref;
   |
--
>> error[E0412]: cannot find type `IoMem` in this scope
   --> rust/doctests_kernel_generated.rs:809:18
   |
   809 |    type Target = IoMem;
   |                  ^^^^^ not found in this scope
--
>> error[E0425]: cannot find value `dev` in this scope
   --> rust/doctests_kernel_generated.rs:816:26
   |
   816 | let devres = Devres::new(dev, IoRemap::new(0xBAAAAAAD, 0x4)?, GFP_KERNEL)?;
   |                          ^^^ not found in this scope
--
>> error[E0433]: failed to resolve: use of undeclared type `IoMem`
   --> rust/doctests_kernel_generated.rs:796:21
   |
   796 |         let iomem = IoMem::new(addr, len)?;
   |                     ^^^^^ use of undeclared type `IoMem`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
