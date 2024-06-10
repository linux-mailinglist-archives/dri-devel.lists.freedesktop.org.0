Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18FF79022D9
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 15:43:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1151110E161;
	Mon, 10 Jun 2024 13:43:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a5uXtp09";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F302F10E1A1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 13:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718027022; x=1749563022;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=S8rJy8A/aN7bWV7fwOvGiZynxXWXMSll8D/6JAsvi48=;
 b=a5uXtp09gT9tuJQJiRIxloE1h4pCTl4qU9m1lGi1ImNCoU9L0Pq7zO6v
 HBL4vCtAq8j0AI4/G0L+9IxMnqp23PDSzYFw2sSQStjzhmIrQf859eNSF
 XD7fE7f5ZEPFyqJeoxeY4mfWURWUqy3n9G7+QmmzmJqxQ/SUCBkTVtjef
 sA5lhaF595eA89QTEloEc3V4WibViU9SWvFiHbCeTQuOmjC2Bi84EprLD
 LeUsghOhCJTS3zEgIjb0h51Ril6ExIofWrIjWJYasGVtK9YepPE2SWpMi
 gk4XT0iZnR/L4+m6HGRVKule6ptm/ELzOzF09Jx3SxvYAtFV9pTyr77o5 g==;
X-CSE-ConnectionGUID: RXXrhEm+SuyJlBGmclBFeQ==
X-CSE-MsgGUID: ijKfbWRAQJud0E4N9UeeBg==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="14859598"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="14859598"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 06:43:41 -0700
X-CSE-ConnectionGUID: Y+Zxlr5GRE2IZnFJlDp7pQ==
X-CSE-MsgGUID: a35bNFGRTPy5va2gEZsRqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="39616437"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
 by orviesa008.jf.intel.com with ESMTP; 10 Jun 2024 06:43:40 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sGfJB-0002Ay-2n;
 Mon, 10 Jun 2024 13:43:37 +0000
Date: Mon, 10 Jun 2024 21:43:07 +0800
From: kernel test robot <lkp@intel.com>
To: Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Danilo Krummrich <dakr@redhat.com>
Subject: [drm-misc:topic/rust-drm 9/20] warning: unresolved link to
 `new_device_data`
Message-ID: <202406102138.EekFIgXB-lkp@intel.com>
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
commit: 28ea76b321b25ee422d9c9bd08f1bf605a9ae422 [9/20] rust: add device::Data
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240610/202406102138.EekFIgXB-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240610/202406102138.EekFIgXB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406102138.EekFIgXB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unresolved link to `new_device_data`
   --> rust/kernel/device.rs:106:38
   |
   106 |     /// It is recommended that the [`new_device_data`] macro be used as it automatically creates
   |                                      ^^^^^^^^^^^^^^^ no item named `new_device_data` in scope
   |
   = help: to escape `[` and `]` characters, add '' before them like `[` or `]`
   = note: `#[warn(rustdoc::broken_intra_doc_links)]` on by default

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
