Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOqxL+VKjWkq0wAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 04:37:09 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3627112A36E
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 04:37:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6478610E1FD;
	Thu, 12 Feb 2026 03:37:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OIiZXz7K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F8ED10E1FD
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 03:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770867426; x=1802403426;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=NKfao1ygz76tzoQRBfZlrExWua32iDkEJOkINJcRurs=;
 b=OIiZXz7KeF/bIJo6KBDHFV33oIy4of0XsT5g+YU5V2qHynisTKFoW7Oi
 CUvb8NhpzS/6fQFJVFjE84JacIGQnAoBRg1pJ6tiTYy+ywG77UwEdQ/wi
 IUa5LK9xi0Z74AxFen+/d3KfyZkhnAUzRuBSMoXoLaoucc8MVuh6X1K+W
 XE4KMJjwzGGVQ3tOuDHIZF+9SFB5U12SPETK5Oiuaux/hyT7Fjkpu+I3s
 sEqn532EsdkhFSUEZtl9exxt1oW+FsaCLOO1mCfb3yc8fGrReK/WXJBqs
 leODtXfOVxOrh2s+KWDL/K5Kw4Nv1WnWTBXoV7l63Hey5WdaY6QpE0/Wg w==;
X-CSE-ConnectionGUID: awBZwpGKSDSPfC9ASTNj/w==
X-CSE-MsgGUID: fzFiFNNiQuOJcxZUa03xxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="89437585"
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="89437585"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 19:37:05 -0800
X-CSE-ConnectionGUID: 4UDyxZNkRe+pwwQEoO+3Yw==
X-CSE-MsgGUID: k1ubzEQYRAmfo7N5rhdgsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="211554495"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
 by orviesa006.jf.intel.com with ESMTP; 11 Feb 2026 19:37:02 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vqNVj-00000000qc0-1kpV;
 Thu, 12 Feb 2026 03:36:59 +0000
Date: Thu, 12 Feb 2026 11:36:49 +0800
From: kernel test robot <lkp@intel.com>
To: Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
 daniel.almeida@collabora.com, aliceryhl@google.com, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
 broonie@kernel.org, ojeda@kernel.org, rust-for-linux@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>
Subject: Re: [PATCH v1] drm/tyr: make SRAM supply optional like panthor
Message-ID: <202602121116.499PMsGK-lkp@intel.com>
References: <20260211195406.289634-1-work@onurozkan.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260211195406.289634-1-work@onurozkan.dev>
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
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[lkp@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:work@onurozkan.dev,m:daniel.almeida@collabora.com,m:aliceryhl@google.com,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:ojeda@kernel.org,m:rust-for-linux@vger.kernel.org,m:llvm@lists.linux.dev,m:oe-kbuild-all@lists.linux.dev,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[onurozkan.dev,collabora.com,google.com,kernel.org,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:mid,intel.com:dkim,intel.com:email,01.org:url]
X-Rspamd-Queue-Id: 3627112A36E
X-Rspamd-Action: no action

Hi Onur,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-regulator/for-next]
[also build test ERROR on drm-i915/for-linux-next drm-i915/for-linux-next-fixes v6.19]
[cannot apply to drm-misc/drm-misc-next daeinki-drm-exynos/exynos-drm-next drm/drm-next drm-tip/drm-tip linus/master next-20260211]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Onur-zkan/drm-tyr-make-SRAM-supply-optional-like-panthor/20260212-035718
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next
patch link:    https://lore.kernel.org/r/20260211195406.289634-1-work%40onurozkan.dev
patch subject: [PATCH v1] drm/tyr: make SRAM supply optional like panthor
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260212/202602121116.499PMsGK-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260212/202602121116.499PMsGK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602121116.499PMsGK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0425]: cannot find function `regulator_get_optional` in crate `bindings`
   --> rust/kernel/regulator.rs:287:23
   |
   287  |             bindings::regulator_get_optional(dev.as_raw(), name.as_char_ptr())
   |                       ^^^^^^^^^^^^^^^^^^^^^^ help: a function with a similar name exists: `regulator_get_voltage`
   |
   ::: rust/bindings/bindings_helpers_generated.rs:1306:5
   |
   1306 |     pub fn regulator_get_voltage(regulator: *mut regulator) -> ffi::c_int;
   |     ---------------------------------------------------------------------- similarly named function `regulator_get_voltage` defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
