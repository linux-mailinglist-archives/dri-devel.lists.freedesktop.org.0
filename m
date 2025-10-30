Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7991BC21AD1
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 19:07:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7C1010E31E;
	Thu, 30 Oct 2025 18:07:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OzR1+CTa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC05410E31E
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 18:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761847677; x=1793383677;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=iP/s4UAA9B2nPL0oz7dCcsbvxDo5KsExttoOXbiI4jw=;
 b=OzR1+CTaqF1mLQwL5NeOqUBtdVdcbuSiMYT6605CO7d83+mMLUkNTKvQ
 +cJqPyFZ19QJxpHL7w3PjaHHQzRAmTIToUkJVT/MNEpmAptjfmIpHGZ4k
 KWU3islokpTYpwOXFkhYnWimF6NATPzs2OnPV5XU7yTA4AahT3luYkBuj
 JuBqXsIv9QXf77/vi2/riwXDFq0FSD+72z7Y6kf58TQQRsoTFibnWHgru
 i33tP5Xa7SAfdrkFpoWi43mDunehjd4decOI1t2ZyfaM8A6d8VcIi9Aix
 3qltfaArs08eRYTVQ+mKt6PZ2KhHLvTfzj9FzU2DiC4oNsOGL2doIMniq w==;
X-CSE-ConnectionGUID: 34QIimjRRw2XbFADQJJ1mA==
X-CSE-MsgGUID: MemyQPitSjCPTbAetw3FyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="63885987"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="63885987"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 11:07:57 -0700
X-CSE-ConnectionGUID: 9p/tDAhTRCCj2jfvrIEJuA==
X-CSE-MsgGUID: lUJf09szRfOicaHLR05gkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="185232151"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
 by orviesa006.jf.intel.com with ESMTP; 30 Oct 2025 11:07:52 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1vEX3p-000MNw-1s;
 Thu, 30 Oct 2025 18:07:46 +0000
Date: Fri, 31 Oct 2025 02:06:32 +0800
From: kernel test robot <lkp@intel.com>
To: Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Danilo Krummrich <dakr@kernel.org>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>
Subject: Re: [PATCH] rust/dma: Take &mut self in
 CoherentAllocation::field_write()
Message-ID: <202510310102.NdHj0ur8-lkp@intel.com>
References: <20251028211801.85215-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251028211801.85215-1-lyude@redhat.com>
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

Hi Lyude,

kernel test robot noticed the following build errors:

[auto build test ERROR on 3b83f5d5e78ac5cddd811a5e431af73959864390]

url:    https://github.com/intel-lab-lkp/linux/commits/Lyude-Paul/rust-dma-Take-mut-self-in-CoherentAllocation-field_write/20251029-052034
base:   3b83f5d5e78ac5cddd811a5e431af73959864390
patch link:    https://lore.kernel.org/r/20251028211801.85215-1-lyude%40redhat.com
patch subject: [PATCH] rust/dma: Take &mut self in CoherentAllocation::field_write()
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251031/202510310102.NdHj0ur8-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251031/202510310102.NdHj0ur8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510310102.NdHj0ur8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0596]: cannot borrow value as mutable, as it is not declared as mutable
   --> samples/rust/rust_dma.rs:70:13
   |
   70 |             kernel::dma_write!(ca[i] = MyStruct::new(value.0, value.1))?;
   |             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ cannot borrow as mutable
   |
   = note: this error originates in the macro `$crate::dma_write` which comes from the expansion of the macro `kernel::dma_write` (in Nightly builds, run with -Z macro-backtrace for more info)
   help: consider changing this to be mutable
   |
   66 |         let mut ca: CoherentAllocation<MyStruct> =
   |             +++

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
