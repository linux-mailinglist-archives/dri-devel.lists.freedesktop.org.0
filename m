Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E1590144D
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jun 2024 05:09:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9169A10E068;
	Sun,  9 Jun 2024 03:09:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EDIGVoPY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5562910E068
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Jun 2024 03:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717902581; x=1749438581;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=kv8E7meS0VchpCBhCFww8IHwDWtFgD8k0nDXCuh/ESE=;
 b=EDIGVoPYJ02Qmwbcqop0jhg/1GUYZE80xEPMK1PFujHkxJMpubyQtYL+
 OCGQ47eJbDz4kWokGErim+5jFX/vH6yq1piU7M4V9gQGRnU35j6ezcKqd
 e00Q2dyUy/iRVgGKQ+Sb88mV7oKLFq1WUJYcpZB4E0q+tvjqQKHeJ2PIW
 xC1ZddJXuGS7RsQGzEHGJmv28En280NblaDIJqRXpiK8dAyJNtfsH0DPO
 JoXbtxLcxJ6wb6xJnhKbqjtW90w9ityo3qNerO7Kkr4kh8Wb0/G8DA/Ut
 oLv95KMvwgrdB0anx/ethokwJDj8sEQbw3+obse/vpqsW+eKG5HnI4Z19 w==;
X-CSE-ConnectionGUID: r/RdY34aSNuSENVYagWfOA==
X-CSE-MsgGUID: CBSHpp6fTOq0s6x6pa5Sug==
X-IronPort-AV: E=McAfee;i="6600,9927,11097"; a="14328884"
X-IronPort-AV: E=Sophos;i="6.08,224,1712646000"; d="scan'208";a="14328884"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2024 20:09:39 -0700
X-CSE-ConnectionGUID: W5l7cB0qS9qRN3hMBT8ocA==
X-CSE-MsgGUID: vBhJ/sp7Tn+ds0ICCJbfNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,224,1712646000"; d="scan'208";a="43654344"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
 by orviesa005.jf.intel.com with ESMTP; 08 Jun 2024 20:09:38 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sG8w3-0000nW-3C;
 Sun, 09 Jun 2024 03:09:35 +0000
Date: Sun, 9 Jun 2024 11:09:23 +0800
From: kernel test robot <lkp@intel.com>
To: Philipp Stanner <pstanner@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Danilo Krummrich <dakr@redhat.com>
Subject: [drm-misc:topic/rust-drm 14/20] error: unreachable `pub` item
Message-ID: <202406091152.bphP4HCO-lkp@intel.com>
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
commit: 3fa8443d0fca31d3e103e3a2651d2c38904895a2 [14/20] rust: PCI: add BAR request and ioremap
config: x86_64-buildonly-randconfig-005-20240609 (https://download.01.org/0day-ci/archive/20240609/202406091152.bphP4HCO-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240609/202406091152.bphP4HCO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406091152.bphP4HCO-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: unreachable `pub` item
   --> rust/kernel/iomem.rs:68:5
   |
   68 |     pub fn readl_relaxed(&self, offset: usize) -> Result<u32> {
   |     ---^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |     |
   |     help: consider restricting its visibility: `pub(crate)`
--
>> error: unreachable `pub` item
   --> rust/kernel/iomem.rs:74:5
   |
   74 |     pub fn readq_relaxed(&self, offset: usize) -> Result<u64> {
   |     ---^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |     |
   |     help: consider restricting its visibility: `pub(crate)`
--
>> error: unreachable `pub` item
   --> rust/kernel/iomem.rs:80:5
   |
   80 |     pub fn writeb(&self, byte: u8, offset: usize) -> Result {
   |     ---^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |     |
   |     help: consider restricting its visibility: `pub(crate)`
--
>> error: unreachable `pub` item
   --> rust/kernel/iomem.rs:87:5
   |
   87 |     pub fn writew(&self, word: u16, offset: usize) -> Result {
   |     ---^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |     |
   |     help: consider restricting its visibility: `pub(crate)`
--
>> error: unreachable `pub` item
   --> rust/kernel/iomem.rs:94:5
   |
   94 |     pub fn writel(&self, lword: u32, offset: usize) -> Result {
   |     ---^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |     |
   |     help: consider restricting its visibility: `pub(crate)`
--
>> error: unreachable `pub` item
   --> rust/kernel/iomem.rs:101:5
   |
   101 |     pub fn writeq(&self, qword: u64, offset: usize) -> Result {
   |     ---^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |     |
   |     help: consider restricting its visibility: `pub(crate)`
--
>> error: unreachable `pub` item
   --> rust/kernel/iomem.rs:108:5
   |
   108 |     pub fn writeb_relaxed(&self, byte: u8, offset: usize) -> Result {
   |     ---^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |     |
   |     help: consider restricting its visibility: `pub(crate)`
--
>> error: unreachable `pub` item
   --> rust/kernel/iomem.rs:115:5
   |
   115 |     pub fn writew_relaxed(&self, word: u16, offset: usize) -> Result {
   |     ---^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |     |
   |     help: consider restricting its visibility: `pub(crate)`
--
>> error: unreachable `pub` item
   --> rust/kernel/iomem.rs:122:5
   |
   122 |     pub fn writel_relaxed(&self, lword: u32, offset: usize) -> Result {
   |     ---^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |     |
   |     help: consider restricting its visibility: `pub(crate)`
--
>> error: unreachable `pub` item
   --> rust/kernel/iomem.rs:129:5
   |
   129 |     pub fn writeq_relaxed(&self, qword: u64, offset: usize) -> Result {
   |     ---^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |     |
   |     help: consider restricting its visibility: `pub(crate)`
--
>> error: unreachable `pub` item
   --> rust/kernel/iomem.rs:10:1
   |
   10 | pub struct IoMem {
   | ---^^^^^^^^^^^^^
   | |
   | help: consider restricting its visibility: `pub(crate)`
   |
   = help: or consider exporting it for use by other crates
   = note: requested on the command line with `-D unreachable-pub`
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
