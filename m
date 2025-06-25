Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D29F9AE8308
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 14:45:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E598A10E705;
	Wed, 25 Jun 2025 12:45:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WZ3JmVn9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D970910E6FA
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 12:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750855542; x=1782391542;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=JM1dsCTTMKSVO7veZW6xF7seieqF91knIU3zOqPtYe4=;
 b=WZ3JmVn9ZoPwgcC1CZVRyKVcPegcGbvJ1r+5wfPx4n7Ch59KU0h0bI5X
 Nd8UJvFsaH1DQOArNj4DF3Vp3tv9NUfQ/LVwA3sgEdvUrcnteaLI/onwC
 CBS+Qu7ninWuvYaj4I9AwAD3F1D22996FC5HPrQWVXdyXVrathDcQwcFI
 1fEke1q+9TNeWOezistiERUO42D0Zm0g6ZY0nfAmob70Hxr5DbRc26VsY
 lIqqE6ylQBvN5oYFqe+X9eEkPyt+zAIZcn/GsAXNEmZStUZOzSq+4qgX6
 ldUUtwKxyj4LDZNhDgNZUk0homiBypar4TmxuoDmyHrLj15bdCydzRFKO A==;
X-CSE-ConnectionGUID: VU6vm5H9Qsal5l+0iQguXA==
X-CSE-MsgGUID: dSsd4wVVQHKAYHjyEI6tOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="75661891"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; d="scan'208";a="75661891"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 05:45:42 -0700
X-CSE-ConnectionGUID: cW31pKh0S+KsTFQLo7x2ZQ==
X-CSE-MsgGUID: saZoJ8aRTkmSx/Qs3ISaQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; d="scan'208";a="183245285"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
 by orviesa002.jf.intel.com with ESMTP; 25 Jun 2025 05:45:37 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uUPVP-000T6o-0L;
 Wed, 25 Jun 2025 12:45:35 +0000
Date: Wed, 25 Jun 2025 20:45:08 +0800
From: kernel test robot <lkp@intel.com>
To: Alice Ryhl <aliceryhl@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alice Ryhl <aliceryhl@google.com>
Subject: Re: [PATCH v2 2/2] rust: types: rename Opaque::raw_get to cast_into
Message-ID: <202506252207.uYOBf8SU-lkp@intel.com>
References: <20250624-opaque-from-raw-v2-2-e4da40bdc59c@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624-opaque-from-raw-v2-2-e4da40bdc59c@google.com>
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

Hi Alice,

kernel test robot noticed the following build errors:

[auto build test ERROR on 19272b37aa4f83ca52bdf9c16d5d81bdd1354494]

url:    https://github.com/intel-lab-lkp/linux/commits/Alice-Ryhl/rust-types-add-Opaque-cast_from/20250624-232939
base:   19272b37aa4f83ca52bdf9c16d5d81bdd1354494
patch link:    https://lore.kernel.org/r/20250624-opaque-from-raw-v2-2-e4da40bdc59c%40google.com
patch subject: [PATCH v2 2/2] rust: types: rename Opaque::raw_get to cast_into
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250625/202506252207.uYOBf8SU-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250625/202506252207.uYOBf8SU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506252207.uYOBf8SU-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0599]: no function or associated item named `cast_into` found for struct `HrTimer` in the current scope
   --> rust/kernel/time/hrtimer.rs:175:45
   |
   96  | #[pin_data]
   | ----------- function or associated item `cast_into` not found for this struct
   ...
   175 |         let c_timer_ptr = unsafe { HrTimer::cast_into(this) };
   |                                             ^^^^^^^^^ function or associated item not found in `HrTimer<_>`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
