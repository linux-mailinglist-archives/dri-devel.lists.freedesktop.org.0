Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7443905D99
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 23:24:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 764F310E916;
	Wed, 12 Jun 2024 21:24:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DyPgKF1o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FDB010E916
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 21:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718227456; x=1749763456;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=/PdC9bYF2lDp3zBv4EiDku23lZNz9ClJOma1Ss23JUY=;
 b=DyPgKF1od2rakNAxHTcmJUW5QdTa4IRfbxDzZm9kNgrzLfKgYBoKOdM1
 XtJlSftSYyEq0X2yMEzQZ1r1x/NMs9eIbWUzalF9cvGFahCb3ycZNfMua
 M21S8AQA+K0nc2rs/f1fbxL0pn8m5xWkivIl5RJ4hLAjwbilQ7zCFJtRS
 e5YGogP4oExRQDr2VciTKvZettILeZax+Of5IE0JAb2/Rw/Dr2ehJRdgU
 bOcKWIE6JvYCvhVGjgOyPkWyBmHcfCRHlsjn/1+27mkt+aJ17yAbux0Jq
 gjk7Z0qesv5k+IqLRQkAZd/J93caPUSzdiK3ODGAFQEyMYNK1FGwaV8W6 g==;
X-CSE-ConnectionGUID: 1IwvJnBTR0uVULPMGmyDhA==
X-CSE-MsgGUID: uUJejq8oQXG/hyINDIreSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="17940591"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="17940591"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 14:24:15 -0700
X-CSE-ConnectionGUID: 4ZrWRg6aRvWROyp//YV5qA==
X-CSE-MsgGUID: ygFPzSiBRMG118XbUwi4mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="44304653"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
 by fmviesa003.fm.intel.com with ESMTP; 12 Jun 2024 14:24:13 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sHVRz-0001vl-1d;
 Wed, 12 Jun 2024 21:24:11 +0000
Date: Thu, 13 Jun 2024 05:23:51 +0800
From: kernel test robot <lkp@intel.com>
To: Wedson Almeida Filho <walmeida@microsoft.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Danilo Krummrich <dakr@redhat.com>
Subject: [drm-misc:topic/rust-drm 5/21] error[E0425]: cannot find value
 `THIS_MODULE` in the crate root
Message-ID: <202406130541.ArC78zvs-lkp@intel.com>
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
commit: 456e8d5810088a0b3ded31a3936062bab3984e86 [5/21] rust: introduce `InPlaceModule`
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240613/202406130541.ArC78zvs-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240613/202406130541.ArC78zvs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406130541.ArC78zvs-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0425]: cannot find value `THIS_MODULE` in the crate root
   --> rust/doctests_kernel_generated.rs:1700:1
   |
   1700 | / kernel::module_phy_driver! {
   1701 | |     drivers: [PhySample],
   1702 | |     device_table: [
   1703 | |         DeviceId::new_with_driver::<PhySample>()
   ...    |
   1708 | |     license: "GPL",
   1709 | | }
   | |_^ not found in the crate root
   |
   = note: this error originates in the macro `$crate::prelude::module` which comes from the expansion of the macro `kernel::module_phy_driver` (in Nightly builds, run with -Z macro-backtrace for more info)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
