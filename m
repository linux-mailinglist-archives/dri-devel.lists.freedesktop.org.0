Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A4987C9BB
	for <lists+dri-devel@lfdr.de>; Fri, 15 Mar 2024 09:12:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 689F110FFCF;
	Fri, 15 Mar 2024 08:12:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gxvzQozU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A99E10FDF8
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Mar 2024 08:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710490323; x=1742026323;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=5VWUsHeYs6S1FeLSBLwrRckp4B+PKbhUEW0W6hLzVdQ=;
 b=gxvzQozUxZrY2ECc/0HvxP7eLtxzha+LmfDdLsfGicmFqkMdB3HxPR4x
 ipsbo+omPa0yUMGaIyBbPyxtEaLJ8bUi8FHzGRgsb39afVI3ehXC6SAy9
 Tk7omAnmLQcY7I2e8YeyJVLcYYK1eJdOuRyisEJPcP6hYijkgLvRKcHi4
 kLu5Qx9YKtQVHxUVlXc2bEEJ/cCrJXu/LgVp6sEJPlKex56xfh0ubvjYD
 8+WcQ5PZQ8F5xXdyVNJN7d4GE4X5ezEnQ7E0YZYMkBa+/45NJ5FwjHeAw
 Hu6V5dk4rJZZJ3dyaoqitE4flFndqCKx9hsx0bOTqXFRAsJb2n/evmYDU g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="16748232"
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; d="scan'208";a="16748232"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2024 01:12:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; d="scan'208";a="12549318"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
 by fmviesa009.fm.intel.com with ESMTP; 15 Mar 2024 01:12:00 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rl2fW-000EFJ-0r;
 Fri, 15 Mar 2024 08:11:58 +0000
Date: Fri, 15 Mar 2024 16:11:52 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Danilo Krummrich <dakr@redhat.com>
Subject: [drm-misc:topic/rust-drm 5/18] warning: unresolved link to
 `RawDeviceId::to_rawid`
Message-ID: <202403151651.nhMv8q3A-lkp@intel.com>
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
head:   42abbd1bc1f3362a9adee3d05e54518de90f2205
commit: 536aa252b05694f74a7aca913fe25fe7e218df4f [5/18] driver, of: Mangle the device ID machinery further to remove const_trait_impl
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240315/202403151651.nhMv8q3A-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240315/202403151651.nhMv8q3A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403151651.nhMv8q3A-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unresolved link to `RawDeviceId::to_rawid`
   --> rust/kernel/driver.rs:120:11
   |
   120 | ///   - [`RawDeviceId::to_rawid`] stores `offset` in the context/data field of the raw device id so
   |           ^^^^^^^^^^^^^^^^^^^^^ the trait `RawDeviceId` has no associated item named `to_rawid`
   |
   = note: `#[warn(rustdoc::broken_intra_doc_links)]` on by default

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
