Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89011AB4BAC
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 08:09:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8947210E4DB;
	Tue, 13 May 2025 06:09:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F+nSsds1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95DBE10E4DB;
 Tue, 13 May 2025 06:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747116561; x=1778652561;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Hmx8otWf9AOsg//ZAqhxQIypiCudbdqpzPydYKjqlA0=;
 b=F+nSsds1PZTupftKgutkWsR2Wu6Ma3NskE3QTjKfsYYWcqN6fnLmFwSE
 Lb+Oq43xZd3Jo1JWoHxkjpVhiwgIBVFjdjz1RVLIRdIxbZ1/D4jBVfPup
 M5Vghb56khQZUDpeKZXshQrIMRtbqNncQNOteGmVEllXI3UGDOvvpSq3P
 08iB2k9HOeGSUKLaQhCIiW4DZ5X8GqeAykj77ZBModEL68fJjtXajzNpW
 TwCBa2gJd01eerDUoTt4C/7HeCq0A4iJ3AzDjEw9Ov3TGBJUVBDwGszJ0
 v4h9Squ1F1u0EWijIc1HB4vM/HyrIefrxs15SP6yIHdvux6KxJDnyoVJP g==;
X-CSE-ConnectionGUID: WeSB6DNMSOyq9w3jpmK+qA==
X-CSE-MsgGUID: ja2dB+UVSg6bEuo3He3GMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="59946169"
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; d="scan'208";a="59946169"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 23:09:21 -0700
X-CSE-ConnectionGUID: D2SUU/18SAukkO4owmYMcw==
X-CSE-MsgGUID: tdkg41Z3QSqlZ0e3f8ip+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; d="scan'208";a="160866821"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
 by fmviesa002.fm.intel.com with ESMTP; 12 May 2025 23:09:14 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uEipE-000FlH-1H;
 Tue, 13 May 2025 06:09:12 +0000
Date: Tue, 13 May 2025 14:09:11 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Ballance <andrewjballance@gmail.com>, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, akpm@linux-foundation.org,
 ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 gregkh@linuxfoundation.org, rafael@kernel.org, bhelgaas@google.com,
 kwilczynski@kernel.org, raag.jadav@intel.com,
 andriy.shevchenko@linux.intel.com, arnd@arndb.de, me@kloenk.dev,
 fujita.tomonori@gmail.com, daniel.almeida@collabora.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-pci@vger.kernel.org
Subject: Re: [PATCH 04/11] rust: io: add PortIo
Message-ID: <202505131314.ozIwFdR4-lkp@intel.com>
References: <20250509031524.2604087-5-andrewjballance@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509031524.2604087-5-andrewjballance@gmail.com>
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

Hi Andrew,

kernel test robot noticed the following build errors:

[auto build test ERROR on 92a09c47464d040866cf2b4cd052bc60555185fb]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrew-Ballance/rust-helpers-io-use-macro-to-generate-io-accessor-functions/20250509-111818
base:   92a09c47464d040866cf2b4cd052bc60555185fb
patch link:    https://lore.kernel.org/r/20250509031524.2604087-5-andrewjballance%40gmail.com
patch subject: [PATCH 04/11] rust: io: add PortIo
config: x86_64-randconfig-073-20250512 (https://download.01.org/0day-ci/archive/20250513/202505131314.ozIwFdR4-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250513/202505131314.ozIwFdR4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505131314.ozIwFdR4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0425]: cannot find function `inb` in crate `bindings`
   --> rust/kernel/io.rs:481:26
   |
   481 |         read8_unchecked, inb, write8_unchecked, outb, u8;
   |                          ^^^ not found in `bindings`
--
>> error[E0425]: cannot find function `outb` in crate `bindings`
   --> rust/kernel/io.rs:481:49
   |
   481 |         read8_unchecked, inb, write8_unchecked, outb, u8;
   |                                                 ^^^^ not found in `bindings`
--
>> error[E0425]: cannot find function `inw` in crate `bindings`
   --> rust/kernel/io.rs:482:27
   |
   482 |         read16_unchecked, inw, write16_unchecked, outw, u16;
   |                           ^^^ not found in `bindings`
--
>> error[E0425]: cannot find function `outw` in crate `bindings`
   --> rust/kernel/io.rs:482:51
   |
   482 |         read16_unchecked, inw, write16_unchecked, outw, u16;
   |                                                   ^^^^ not found in `bindings`
--
>> error[E0425]: cannot find function `inl` in crate `bindings`
   --> rust/kernel/io.rs:483:27
   |
   483 |         read32_unchecked, inl, write32_unchecked, outl, u32;
   |                           ^^^ not found in `bindings`
--
>> error[E0425]: cannot find function `outl` in crate `bindings`
   --> rust/kernel/io.rs:483:51
   |
   483 |         read32_unchecked, inl, write32_unchecked, outl, u32;
   |                                                   ^^^^ not found in `bindings`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
