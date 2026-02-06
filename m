Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNx+HEFkhmmYMgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 22:59:29 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FDE1039F2
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 22:59:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D455510E1EE;
	Fri,  6 Feb 2026 21:59:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JC+hB3lW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 031DF10E1EE
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 21:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770415163; x=1801951163;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=pyQ6zRJBMkqV7zsMhN8TlMrSiWM9hl6CFt/g/wO4Jjc=;
 b=JC+hB3lWCgpDQMd816cxHmNn0h82q5eGLHeXBWRdYafJFsJA8FqBIN5z
 dOIy838Zl3Cjql9hmhF5XJfRsYXiym8U9mJ16/hrpZdYOsCo3kvAprpSo
 Gj0QEr3/SJhD7XoUHwDbjcEKhZQNy9YiZQNcSvIu4zwO5ECJCcu89XMDK
 96qFxRvG58s0cB9e1wpyz9TnQLBm6sERs1fcpqVxBOMqn47KSYf0Feulc
 cRM0dX+3HyRnZFAI+oxqenSPqeRAY6IRs1rk+QeGXse/9wzHsruUPB/LB
 NZICM1v4hcAEVNE0nbmjdUIByU1jQVmMjFg3ecYrMwdJcGJUKkmesKnVW Q==;
X-CSE-ConnectionGUID: P78MRqpgRBeU4Xo0eADnbA==
X-CSE-MsgGUID: DOPbMxrgQNixEfOQVEEMlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="75248613"
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; d="scan'208";a="75248613"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 13:59:22 -0800
X-CSE-ConnectionGUID: 28giitybSGm56aigh7emJg==
X-CSE-MsgGUID: xTPaPPxuT7CXzYhBTOqbBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; d="scan'208";a="210841562"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
 by fmviesa008.fm.intel.com with ESMTP; 06 Feb 2026 13:59:19 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1voTrA-00000000lCG-4ASs;
 Fri, 06 Feb 2026 21:59:16 +0000
Date: Sat, 7 Feb 2026 05:58:31 +0800
From: kernel test robot <lkp@intel.com>
To: Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Frank Binns <frank.binns@imgtec.com>,
 Brajesh Gupta <brajesh.gupta@imgtec.com>,
 Alessio Belle <alessio.belle@imgtec.com>,
 Alexandru Dadu <alexandru.dadu@imgtec.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Matt Coster <matt.coster@imgtec.com>
Subject: Re: [PATCH 1/2] drm/imagination: Define packed BVNCs in the uapi
Message-ID: <202602070500.zo0DrH6U-lkp@intel.com>
References: <20260206-bvnc-cleanup-v1-1-f3c818541fbe@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260206-bvnc-cleanup-v1-1-f3c818541fbe@imgtec.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[lkp@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:matt.coster@imgtec.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:llvm@lists.linux.dev,m:oe-kbuild-all@lists.linux.dev,m:frank.binns@imgtec.com,m:brajesh.gupta@imgtec.com,m:alessio.belle@imgtec.com,m:alexandru.dadu@imgtec.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[imgtec.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.987];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,intel.com:mid,01.org:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: C0FDE1039F2
X-Rspamd-Action: no action

Hi Matt,

kernel test robot noticed the following build errors:

[auto build test ERROR on 55473b60178060a4fdb4631bd0c91879cc7d18d8]

url:    https://github.com/intel-lab-lkp/linux/commits/Matt-Coster/drm-imagination-Define-packed-BVNCs-in-the-uapi/20260206-175844
base:   55473b60178060a4fdb4631bd0c91879cc7d18d8
patch link:    https://lore.kernel.org/r/20260206-bvnc-cleanup-v1-1-f3c818541fbe%40imgtec.com
patch subject: [PATCH 1/2] drm/imagination: Define packed BVNCs in the uapi
config: riscv-randconfig-001-20260206 (https://download.01.org/0day-ci/archive/20260207/202602070500.zo0DrH6U-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602070500.zo0DrH6U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602070500.zo0DrH6U-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/imagination/pvr_device.c:550:7: error: expression is not an integer constant expression
     550 |         case PVR_PACKED_BVNC(33, 15, 11, 3):
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/imagination/pvr_device.h:490:2: note: expanded from macro 'PVR_PACKED_BVNC'
     490 |         (FIELD_PREP(DRM_PVR_BVNC_B, b) | \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     491 |          FIELD_PREP(DRM_PVR_BVNC_V, v) | \
         |          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     492 |          FIELD_PREP(DRM_PVR_BVNC_N, n) | \
         |          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     493 |          FIELD_PREP(DRM_PVR_BVNC_C, c))
         |          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/imagination/pvr_device.c:550:7: note: this use of statement expressions is not supported in a constant expression
   drivers/gpu/drm/imagination/pvr_device.h:490:3: note: expanded from macro 'PVR_PACKED_BVNC'
     490 |         (FIELD_PREP(DRM_PVR_BVNC_B, b) | \
         |          ^
   include/linux/bitfield.h:137:3: note: expanded from macro 'FIELD_PREP'
     137 |                 __FIELD_PREP(_mask, _val, "FIELD_PREP: ");              \
         |                 ^
   include/linux/bitfield.h:90:3: note: expanded from macro '__FIELD_PREP'
      90 |                 __BF_FIELD_CHECK_MASK(mask, val, pfx);                  \
         |                 ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:631:2: note: expanded from macro 'compiletime_assert'
     631 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:619:2: note: expanded from macro '_compiletime_assert'
     619 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:603:2: note: expanded from macro '__compiletime_assert'
     603 |         do {                                                            \
         |         ^
   drivers/gpu/drm/imagination/pvr_device.c:551:7: error: expression is not an integer constant expression
     551 |         case PVR_PACKED_BVNC(36, 53, 104, 796):
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/imagination/pvr_device.h:490:2: note: expanded from macro 'PVR_PACKED_BVNC'
     490 |         (FIELD_PREP(DRM_PVR_BVNC_B, b) | \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     491 |          FIELD_PREP(DRM_PVR_BVNC_V, v) | \
         |          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     492 |          FIELD_PREP(DRM_PVR_BVNC_N, n) | \
         |          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     493 |          FIELD_PREP(DRM_PVR_BVNC_C, c))
         |          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/imagination/pvr_device.c:551:7: note: this use of statement expressions is not supported in a constant expression
   drivers/gpu/drm/imagination/pvr_device.h:490:3: note: expanded from macro 'PVR_PACKED_BVNC'
     490 |         (FIELD_PREP(DRM_PVR_BVNC_B, b) | \
         |          ^
   include/linux/bitfield.h:137:3: note: expanded from macro 'FIELD_PREP'
     137 |                 __FIELD_PREP(_mask, _val, "FIELD_PREP: ");              \
         |                 ^
   include/linux/bitfield.h:90:3: note: expanded from macro '__FIELD_PREP'
      90 |                 __BF_FIELD_CHECK_MASK(mask, val, pfx);                  \
         |                 ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:631:2: note: expanded from macro 'compiletime_assert'
     631 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:619:2: note: expanded from macro '_compiletime_assert'
     619 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:603:2: note: expanded from macro '__compiletime_assert'
     603 |         do {                                                            \
         |         ^
   drivers/gpu/drm/imagination/pvr_device.c:554:7: error: expression is not an integer constant expression
     554 |         case PVR_PACKED_BVNC(36, 52, 104, 182):
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/imagination/pvr_device.h:490:2: note: expanded from macro 'PVR_PACKED_BVNC'
     490 |         (FIELD_PREP(DRM_PVR_BVNC_B, b) | \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     491 |          FIELD_PREP(DRM_PVR_BVNC_V, v) | \
         |          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     492 |          FIELD_PREP(DRM_PVR_BVNC_N, n) | \
         |          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     493 |          FIELD_PREP(DRM_PVR_BVNC_C, c))
         |          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/imagination/pvr_device.c:554:7: note: this use of statement expressions is not supported in a constant expression
   drivers/gpu/drm/imagination/pvr_device.h:490:3: note: expanded from macro 'PVR_PACKED_BVNC'
     490 |         (FIELD_PREP(DRM_PVR_BVNC_B, b) | \
         |          ^
   include/linux/bitfield.h:137:3: note: expanded from macro 'FIELD_PREP'
     137 |                 __FIELD_PREP(_mask, _val, "FIELD_PREP: ");              \
         |                 ^
   include/linux/bitfield.h:90:3: note: expanded from macro '__FIELD_PREP'
      90 |                 __BF_FIELD_CHECK_MASK(mask, val, pfx);                  \
         |                 ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:631:2: note: expanded from macro 'compiletime_assert'
     631 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:619:2: note: expanded from macro '_compiletime_assert'
     619 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:603:2: note: expanded from macro '__compiletime_assert'
     603 |         do {                                                            \
         |         ^
   3 errors generated.


vim +550 drivers/gpu/drm/imagination/pvr_device.c

1c21f240fbc1e47 Matt Coster 2026-01-13  545  
1c21f240fbc1e47 Matt Coster 2026-01-13  546  static enum pvr_gpu_support_level
1c21f240fbc1e47 Matt Coster 2026-01-13  547  pvr_gpu_support_level(const struct pvr_gpu_id *gpu_id)
1c21f240fbc1e47 Matt Coster 2026-01-13  548  {
1c21f240fbc1e47 Matt Coster 2026-01-13  549  	switch (pvr_gpu_id_to_packed_bvnc(gpu_id)) {
1c21f240fbc1e47 Matt Coster 2026-01-13 @550  	case PVR_PACKED_BVNC(33, 15, 11, 3):
1c21f240fbc1e47 Matt Coster 2026-01-13  551  	case PVR_PACKED_BVNC(36, 53, 104, 796):
1c21f240fbc1e47 Matt Coster 2026-01-13  552  		return PVR_GPU_SUPPORTED;
1c21f240fbc1e47 Matt Coster 2026-01-13  553  
1c21f240fbc1e47 Matt Coster 2026-01-13  554  	case PVR_PACKED_BVNC(36, 52, 104, 182):
1c21f240fbc1e47 Matt Coster 2026-01-13  555  		return PVR_GPU_EXPERIMENTAL;
1c21f240fbc1e47 Matt Coster 2026-01-13  556  
1c21f240fbc1e47 Matt Coster 2026-01-13  557  	default:
1c21f240fbc1e47 Matt Coster 2026-01-13  558  		return PVR_GPU_UNKNOWN;
1c21f240fbc1e47 Matt Coster 2026-01-13  559  	}
1c21f240fbc1e47 Matt Coster 2026-01-13  560  }
1c21f240fbc1e47 Matt Coster 2026-01-13  561  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
