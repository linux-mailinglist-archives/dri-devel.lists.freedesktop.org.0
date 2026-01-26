Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QNKVORjrd2nSmQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 23:30:48 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 472F68DF03
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 23:30:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D20B10E021;
	Mon, 26 Jan 2026 22:30:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kwWVieaK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5953D10E021
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 22:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769466643; x=1801002643;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=SDlHPRbnJB1XeB8p7QDzp8qp4nlasKsGSTn2yj84yhk=;
 b=kwWVieaK6oIDinCVoON3WUCf1HQdLmN29sH8f+W870VeoHxuspHzIzMU
 RIOfuodu0XPTlp2XNWYF1VN9tPd1E80hu6cNQg5V+gX5bPq05YKJbddpb
 lUpsIFDyXP9GBYve8SMvSmHsuRissY3zdlPM7myreYwv4Tp1KvobmHq4C
 hEcsab4pcOP729pne2zriSqY3ixgGG8Lkg+ovOrWdUu9D6zmoIjWlpa2C
 3QU6L5VFVBboL7oOvjy1y99hkDz9yX66lWOfd7UU19r1mArREqmZA7/Fi
 +dcAiwMsSSJOlfrRlTn5AH05abkUok8XujlcuEfPiasZEqxHpYxnxH2PC g==;
X-CSE-ConnectionGUID: qZCbYBVMQq2sE6+CaqonyA==
X-CSE-MsgGUID: u9UOGeDwQZmeyg+xYlJkVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="82021429"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="82021429"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 14:30:42 -0800
X-CSE-ConnectionGUID: Kg8CKuQ1QIO3ci8zzJ95cA==
X-CSE-MsgGUID: /mOcDF+HSoStiLCAx97Guw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="245407170"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
 by orviesa001.jf.intel.com with ESMTP; 26 Jan 2026 14:30:37 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vkV6P-00000000XkE-3Sha;
 Mon, 26 Jan 2026 22:30:33 +0000
Date: Tue, 27 Jan 2026 06:29:48 +0800
From: kernel test robot <lkp@intel.com>
To: pengfuyuan <pengfuyuan@kylinos.cn>, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Miguel Ojeda <ojeda@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Helge Deller <deller@gmx.de>, Hans de Goede <hansg@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Lee Jones <lee@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, Zsolt Kajtar <soci@c64.rulez.org>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 pengfuyuan <pengfuyuan@kylinos.cn>
Subject: Re: [PATCH v1 v1 3/4] rust: fb: add framebuffer driver support
Message-ID: <202601270630.FHzCSbVv-lkp@intel.com>
References: <20260126081744.781392-4-pengfuyuan@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126081744.781392-4-pengfuyuan@kylinos.cn>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORGED_SENDER(0.00)[lkp@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[lists.linux.dev,gmail.com,garyguo.net,protonmail.com,kernel.org,umich.edu,linuxfoundation.org,ffwll.ch,gmx.de,suse.de,ravnborg.org,c64.rulez.org,linux.intel.com,vger.kernel.org,lists.freedesktop.org,kylinos.cn];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:pengfuyuan@kylinos.cn,m:dakr@kernel.org,m:aliceryhl@google.com,m:daniel.almeida@collabora.com,m:ojeda@kernel.org,m:llvm@lists.linux.dev,m:oe-kbuild-all@lists.linux.dev,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:deller@gmx.de,m:hansg@kernel.org,m:tzimmermann@suse.de,m:lee@kernel.org,m:sam@ravnborg.org,m:soci@c64.rulez.org,m:ville.syrjala@linux.intel.com,m:rust-for-linux@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-fbdev@vger.kernel.org,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[git-scm.com:url,01.org:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 472F68DF03
X-Rspamd-Action: no action

Hi pengfuyuan,

kernel test robot noticed the following build errors:

[auto build test ERROR on rust/rust-next]
[also build test ERROR on driver-core/driver-core-linus linus/master v6.19-rc7]
[cannot apply to driver-core/driver-core-testing driver-core/driver-core-next next-20260123]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/pengfuyuan/rust-io-mem-add-ioremap_wc-support/20260126-162117
base:   https://github.com/Rust-for-Linux/linux rust-next
patch link:    https://lore.kernel.org/r/20260126081744.781392-4-pengfuyuan%40kylinos.cn
patch subject: [PATCH v1 v1 3/4] rust: fb: add framebuffer driver support
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260127/202601270630.FHzCSbVv-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260127/202601270630.FHzCSbVv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601270630.FHzCSbVv-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0308]: mismatched types
   --> rust/kernel/fb/device.rs:307:23
   |
   307 |         fb_read: Some(Self::read_callback),
   |                  ---- ^^^^^^^^^^^^^^^^^^^ expected fn pointer, found fn item
   |                  |
   |                  arguments to this enum variant are incorrect
   |
   = note: expected fn pointer `unsafe extern "C" fn(_, *mut u8, _, _) -> _`
   found fn item `extern "C" fn(_, *mut i8, _, _) -> _ {fb::device::Device::<T>::read_callback}`
   help: the type constructed contains `extern "C" fn(*mut fb_info, *mut i8, usize, *mut i64) -> isize {fb::device::Device::<T>::read_callback}` due to the type of the argument passed
   --> rust/kernel/fb/device.rs:307:18
   |
   307 |         fb_read: Some(Self::read_callback),
   |                  ^^^^^-------------------^
   |                       |
   |                       this argument influences the type of `Some`
   note: tuple variant defined here
   --> /opt/cross/rustc-1.88.0-bindgen-0.72.1/rustup/toolchains/1.88.0-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/option.rs:597:5
   |
   597 |     Some(#[stable(feature = "rust1", since = "1.0.0")] T),
   |     ^^^^
--
>> error[E0308]: mismatched types
   --> rust/kernel/fb/device.rs:308:24
   |
   308 |         fb_write: Some(Self::write_callback),
   |                   ---- ^^^^^^^^^^^^^^^^^^^^ expected fn pointer, found fn item
   |                   |
   |                   arguments to this enum variant are incorrect
   |
   = note: expected fn pointer `unsafe extern "C" fn(_, *const u8, _, _) -> _`
   found fn item `extern "C" fn(_, *const i8, _, _) -> _ {fb::device::Device::<T>::write_callback}`
   help: the type constructed contains `extern "C" fn(*mut fb_info, *const i8, usize, *mut i64) -> isize {fb::device::Device::<T>::write_callback}` due to the type of the argument passed
   --> rust/kernel/fb/device.rs:308:19
   |
   308 |         fb_write: Some(Self::write_callback),
   |                   ^^^^^--------------------^
   |                        |
   |                        this argument influences the type of `Some`
   note: tuple variant defined here
   --> /opt/cross/rustc-1.88.0-bindgen-0.72.1/rustup/toolchains/1.88.0-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/option.rs:597:5
   |
   597 |     Some(#[stable(feature = "rust1", since = "1.0.0")] T),
   |     ^^^^
--
>> error[E0308]: mismatched types
   --> rust/kernel/fb/io.rs:32:13
   |
   30     |         bindings::fb_io_read(
   |         -------------------- arguments to this function are incorrect
   31     |             device.as_raw(),
   32     |             buf.as_mut_ptr() as *mut core::ffi::c_char,
   |             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ expected `*mut u8`, found `*mut i8`
   |
   = note: expected raw pointer `*mut u8`
   found raw pointer `*mut i8`
   note: function defined here
   --> rust/bindings/bindings_generated.rs:123562:12
   |
   123562 |     pub fn fb_io_read(
   |            ^^^^^^^^^^
--
>> error[E0308]: mismatched types
   --> rust/kernel/fb/io.rs:58:13
   |
   56     |         bindings::fb_io_write(
   |         --------------------- arguments to this function are incorrect
   57     |             device.as_raw(),
   58     |             buf.as_ptr() as *const core::ffi::c_char,
   |             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ expected `*const u8`, found `*const i8`
   |
   = note: expected raw pointer `*const u8`
   found raw pointer `*const i8`
   note: function defined here
   --> rust/bindings/bindings_generated.rs:123570:12
   |
   123570 |     pub fn fb_io_write(
   |            ^^^^^^^^^^^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
