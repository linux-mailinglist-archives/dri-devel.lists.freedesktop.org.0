Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FEAA89451A
	for <lists+dri-devel@lfdr.de>; Mon,  1 Apr 2024 20:59:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37BE410F407;
	Mon,  1 Apr 2024 18:59:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FHvi2J4U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17B9B10F406
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Apr 2024 18:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711997954; x=1743533954;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=E4LYyB1g+NzjiSmEYXbDoBDY5Nv9pqgj7lADa5zIguw=;
 b=FHvi2J4Ub7jdh7eXgRaltOWwOXjmyNi1GDF7JTv7dTDpQY3AYYmCnGZP
 xGoojFJ5Gy4dhU4pPyraZEcRL6nfrtzD0ukQv5k/V6pDnhfXaeIAIV89U
 KboBSGc4oS+H7Qv5aeQdMNC7DJx9Kutr0My4DR3c/esTkM3ktrWrgee5M
 lkvaSzryZfNqv+l2jQruHliDAkanVlEZCux/a/xAy30Ao5nv/hmp9AqC1
 YfkGUcDAiozFMjcsHbJ3Gg3Xw1XptIFPmCNMF9FAfrzBSh/ESyftG34le
 lu33re7EFcLy4u1z3/T1QZ4XQjXTxW+LRvfPHEcpkCrEo+2ziyvqiWjJL A==;
X-CSE-ConnectionGUID: k3igDeATTESQmQfDhNMA2Q==
X-CSE-MsgGUID: HFCSvTlGRSi5fFNVMEh4iw==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="10922446"
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000"; d="scan'208";a="10922446"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2024 11:59:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000"; d="scan'208";a="49009818"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
 by fmviesa001.fm.intel.com with ESMTP; 01 Apr 2024 11:59:12 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rrMsA-0000Yf-09;
 Mon, 01 Apr 2024 18:59:10 +0000
Date: Tue, 2 Apr 2024 02:58:24 +0800
From: kernel test robot <lkp@intel.com>
To: Andreas Hindborg <a.hindborg@samsung.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Danilo Krummrich <dakr@redhat.com>
Subject: [drm-misc:topic/rust-drm 8/18] error[E0308]: mismatched types
Message-ID: <202404020229.fdzDQ9lB-lkp@intel.com>
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
head:   fbe8094e2cd8106e88e348ed3ce97680d7ae9e7b
commit: 5aad7a29ba6037a224c3f8ff36bfb2c82a5d3f4d [8/18] rust: add revocable objects
config: x86_64-randconfig-003-20240401 (https://download.01.org/0day-ci/archive/20240402/202404020229.fdzDQ9lB-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240402/202404020229.fdzDQ9lB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404020229.fdzDQ9lB-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0308]: mismatched types
   --> rust/doctests_kernel_generated.rs:2184:20
   |
   2184 | assert_eq!(add_two(&v), Some(30));
   |            ------- ^^ expected `&Revocable<Example>`, found `&impl PinInit<Revocable<Example>>`
   |            |
   |            arguments to this function are incorrect
   |
   ::: rust/kernel/revocable.rs:90:42
   |
   90   |     pub fn new(data: impl PinInit<T>) -> impl PinInit<Self> {
   |                                          ------------------ the found opaque type
   |
   = note: expected reference `&Revocable<_doctest_main__kbuild_src_consumer_rust_kernel_revocable_rs_78_0::Example>`
   found reference `&impl rust_doctest_kernel_build_assert_rs_0::kernel::init::PinInit<Revocable<_doctest_main__kbuild_src_consumer_rust_kernel_revocable_rs_78_0::Example>>`
   note: function defined here
   --> rust/doctests_kernel_generated.rs:2178:4
   |
   2178 | fn add_two(v: &Revocable<Example>) -> Option<u32> {
   |    ^^^^^^^ ----------------------
--
>> error[E0599]: no method named `revoke` found for opaque type `impl PinInit<Revocable<Example>>` in the current scope
   --> rust/doctests_kernel_generated.rs:2185:3
   |
   2185 | v.revoke();
   |   ^^^^^^ method not found in `impl PinInit<Revocable<Example>>`
   |
   = note: the full type name has been written to 'rust/doctests_kernel_generated.long-type-7986498715854771358.txt'
--
>> error[E0308]: mismatched types
   --> rust/doctests_kernel_generated.rs:2186:20
   |
   2186 | assert_eq!(add_two(&v), None);
   |            ------- ^^ expected `&Revocable<Example>`, found `&impl PinInit<Revocable<Example>>`
   |            |
   |            arguments to this function are incorrect
   |
   ::: rust/kernel/revocable.rs:90:42
   |
   90   |     pub fn new(data: impl PinInit<T>) -> impl PinInit<Self> {
   |                                          ------------------ the found opaque type
   |
   = note: expected reference `&Revocable<_doctest_main__kbuild_src_consumer_rust_kernel_revocable_rs_78_0::Example>`
   found reference `&impl rust_doctest_kernel_build_assert_rs_0::kernel::init::PinInit<Revocable<_doctest_main__kbuild_src_consumer_rust_kernel_revocable_rs_78_0::Example>>`
   note: function defined here
   --> rust/doctests_kernel_generated.rs:2178:4
   |
   2178 | fn add_two(v: &Revocable<Example>) -> Option<u32> {
   |    ^^^^^^^ ----------------------
--
>> error[E0308]: mismatched types
   --> rust/doctests_kernel_generated.rs:2249:20
   |
   2249 | assert_eq!(add_two(&v), Some(30));
   |            ------- ^^ expected `&Revocable<Example>`, found `&impl PinInit<Revocable<Example>>`
   |            |
   |            arguments to this function are incorrect
   |
   ::: rust/kernel/revocable.rs:90:42
   |
   90   |     pub fn new(data: impl PinInit<T>) -> impl PinInit<Self> {
   |                                          ------------------ the found opaque type
   |
   = note: expected reference `&Revocable<_doctest_main__kbuild_src_consumer_rust_kernel_revocable_rs_99_0::Example>`
   found reference `&impl rust_doctest_kernel_build_assert_rs_0::kernel::init::PinInit<Revocable<_doctest_main__kbuild_src_consumer_rust_kernel_revocable_rs_99_0::Example>>`
   note: function defined here
   --> rust/doctests_kernel_generated.rs:2242:4
   |
   2242 | fn add_two(v: &Revocable<Example>) -> Option<u32> {
   |    ^^^^^^^ ----------------------
--
>> error[E0599]: no method named `revoke` found for opaque type `impl PinInit<Revocable<Example>>` in the current scope
   --> rust/doctests_kernel_generated.rs:2250:3
   |
   2250 | v.revoke();
   |   ^^^^^^ method not found in `impl PinInit<Revocable<Example>>`
   |
   = note: the full type name has been written to 'rust/doctests_kernel_generated.long-type-16004988436775023416.txt'
--
>> error[E0308]: mismatched types
   --> rust/doctests_kernel_generated.rs:2251:20
   |
   2251 | assert_eq!(add_two(&v), None);
   |            ------- ^^ expected `&Revocable<Example>`, found `&impl PinInit<Revocable<Example>>`
   |            |
   |            arguments to this function are incorrect
   |
   ::: rust/kernel/revocable.rs:90:42
   |
   90   |     pub fn new(data: impl PinInit<T>) -> impl PinInit<Self> {
   |                                          ------------------ the found opaque type
   |
   = note: expected reference `&Revocable<_doctest_main__kbuild_src_consumer_rust_kernel_revocable_rs_99_0::Example>`
   found reference `&impl rust_doctest_kernel_build_assert_rs_0::kernel::init::PinInit<Revocable<_doctest_main__kbuild_src_consumer_rust_kernel_revocable_rs_99_0::Example>>`
   note: function defined here
   --> rust/doctests_kernel_generated.rs:2242:4
   |
   2242 | fn add_two(v: &Revocable<Example>) -> Option<u32> {
   |    ^^^^^^^ ----------------------

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
