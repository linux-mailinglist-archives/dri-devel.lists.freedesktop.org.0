Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B7D87D2EB
	for <lists+dri-devel@lfdr.de>; Fri, 15 Mar 2024 18:38:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF0801123EC;
	Fri, 15 Mar 2024 17:38:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UN/D/HGm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E5E31123E9
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Mar 2024 17:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710524302; x=1742060302;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=CTcucCNyDkjPKR9Z8zgz/pCmmLiyHIz1XnumTxngFkM=;
 b=UN/D/HGmnADOf6u8E1txizHZJ/1QFhlX8Bm0KDIs0KAIAjkC/p52zpLw
 vqpKtyJ++jSvpa0D/SYRVRyE/1FCVhk7FEsa/Z3zJSAHprk7jdJHYEgse
 +uSNaHH3dkpkA7iEW3qtKopTnq6A5W2FVFMnARzvEN3S3Ir771MiR8RZv
 dMHIM9rPKEIhJNhPUjtDfHSnmg/rmtdwaS4a57UJ8rEaLdBN+JvwpRWPu
 AsAlXGfkx/G8Zu9uf7NW4mIyQNVQLRcknWqhTI8uLfe72UIghfeoIg3Ot
 a9Oo4MNSrwj9RhngW5nuNHwhtI/psAm46iESmo3I+v3JSESuiTvvC1rPQ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11014"; a="16128632"
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; d="scan'208";a="16128632"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2024 10:38:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; d="scan'208";a="50193539"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
 by orviesa001.jf.intel.com with ESMTP; 15 Mar 2024 10:38:19 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rlBVY-000EgH-1B;
 Fri, 15 Mar 2024 17:38:16 +0000
Date: Sat, 16 Mar 2024 01:38:07 +0800
From: kernel test robot <lkp@intel.com>
To: Andreas Hindborg <a.hindborg@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Danilo Krummrich <dakr@redhat.com>
Subject: [drm-misc:topic/rust-drm 8/18] error[E0599]: no method named
 `revoke` found for opaque type `impl PinInit<Revocable<Example>>` in the
 current scope
Message-ID: <202403160126.yOqyf2Sq-lkp@intel.com>
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
commit: 5aad7a29ba6037a224c3f8ff36bfb2c82a5d3f4d [8/18] rust: add revocable objects
config: x86_64-randconfig-r113-20240315 (https://download.01.org/0day-ci/archive/20240316/202403160126.yOqyf2Sq-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240316/202403160126.yOqyf2Sq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403160126.yOqyf2Sq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0599]: no method named `revoke` found for opaque type `impl PinInit<Revocable<Example>>` in the current scope
   --> rust/doctests_kernel_generated.rs:2185:3
   |
   2185 | v.revoke();
   |   ^^^^^^ method not found in `impl PinInit<Revocable<Example>>`
   |
   = note: the full type name has been written to 'rust/doctests_kernel_generated.long-type-11207499695041056550.txt'
--
>> error[E0599]: no method named `revoke` found for opaque type `impl PinInit<Revocable<Example>>` in the current scope
   --> rust/doctests_kernel_generated.rs:2250:3
   |
   2250 | v.revoke();
   |   ^^^^^^ method not found in `impl PinInit<Revocable<Example>>`
   |
   = note: the full type name has been written to 'rust/doctests_kernel_generated.long-type-11949269667377111354.txt'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
