Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qLBwO3vceGnbtgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 16:40:43 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 314B496EAB
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 16:40:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B45BC10E06E;
	Tue, 27 Jan 2026 15:40:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y7YPzRTA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B743A10E06E
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 15:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769528440; x=1801064440;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=XhBC5KV+PtVVZ/Z9sK8gsPhmkVrcEIqlnIPPBjBhYdM=;
 b=Y7YPzRTApFepT3xt9yjjHUWv/KgZtbneSfzC5Ayba9TrLH7B/lz0CyLo
 fhrmgKmXrLByI9Y6wnsraSmtjrKNfGrJofKBT+c5dKjZ77V9ta49KcjEJ
 6JK3MPTRY8x8DjifD2ei8v3PIqLh8A4gOPdLt6+S5uu0rG1md5zErDG9X
 mUc5nwe4wPAyIt7n394B+1q0zLb13mU0/g5Bz8I7nEvDbui/wxXqEMkXN
 /1khU51AOsnthcqwLcweNDk3lzL7lett3r7fRO5kDchjGvEY5Bi/Rabvk
 5ixB+UwuO6C30K8OivSkUoS1rE86/wHncfxI7K2UJZC1aTGwK/g87TCSd Q==;
X-CSE-ConnectionGUID: tQnsDlU7QaScuVIUgLeLzw==
X-CSE-MsgGUID: 1nRpu0r/S3C/AronDCUrFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70816142"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="70816142"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 07:40:39 -0800
X-CSE-ConnectionGUID: YkjinVAERv2ujCwRoSLWag==
X-CSE-MsgGUID: XSHPA9EtQ96q7JmKxOnzAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="208058802"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
 by orviesa007.jf.intel.com with ESMTP; 27 Jan 2026 07:40:35 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vklB9-00000000YcG-3qcQ;
 Tue, 27 Jan 2026 15:40:31 +0000
Date: Tue, 27 Jan 2026 23:39:34 +0800
From: kernel test robot <lkp@intel.com>
To: Joey Lu <a0987203069@gmail.com>, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com,
 a0987203069@gmail.com, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] drm/nuvoton: add MA35D1 display controller driver
Message-ID: <202601272315.09SFioVt-lkp@intel.com>
References: <20260126085727.2568958-4-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126085727.2568958-4-a0987203069@gmail.com>
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,nuvoton.com,gmail.com,lists.infradead.org,lists.freedesktop.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:a0987203069@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:llvm@lists.linux.dev,m:oe-kbuild-all@lists.linux.dev,m:ychuang3@nuvoton.com,m:schung@nuvoton.com,m:yclu4@nuvoton.com,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER(0.00)[lkp@intel.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
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
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[01.org:url,intel.com:email,intel.com:dkim,intel.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 314B496EAB
X-Rspamd-Action: no action

Hi Joey,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm/drm-next]
[cannot apply to robh/for-next linus/master v6.19-rc7 next-20260126]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Joey-Lu/dt-bindings-display-nuvoton-add-MA35D1-DCU-binding/20260126-170258
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20260126085727.2568958-4-a0987203069%40gmail.com
patch subject: [PATCH 3/3] drm/nuvoton: add MA35D1 display controller driver
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260127/202601272315.09SFioVt-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260127/202601272315.09SFioVt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601272315.09SFioVt-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/gpu/drm/nuvoton/ma35_plane.c:177:10: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     177 |                 *reg = MA35_BLEND_MODE_SRC;
         |                        ^
   drivers/gpu/drm/nuvoton/ma35_plane.h:141:2: note: expanded from macro 'MA35_BLEND_MODE_SRC'
     141 |         FIELD_PREP(MA35_SRC_BLENDING_MODE, MA35_ALPHA_BLEND_ONE)
         |         ^
   drivers/gpu/drm/nuvoton/ma35_plane.c:337:8: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     337 |         reg = FIELD_PREP(MA35_OVERLAY_POSITION_X_MASK, x) |
         |               ^
   drivers/gpu/drm/nuvoton/ma35_plane.c:360:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     360 |                 reg = FIELD_PREP(MA35_PRIMARY_FORMAT_MASK, format) |
         |                       ^
   drivers/gpu/drm/nuvoton/ma35_plane.c:384:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     384 |                 reg = FIELD_PREP(MA35_OVERLAY_FORMAT_MASK, format) |
         |                       ^
   drivers/gpu/drm/nuvoton/ma35_plane.c:441:8: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     441 |         reg = FIELD_PREP(MA35_CURSOR_X_MASK, x) |
         |               ^
   drivers/gpu/drm/nuvoton/ma35_plane.c:483:4: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     483 |                         FIELD_PREP(MA35_CURSOR_HOTSPOT_X_MASK, new_state->hotspot_x) |
         |                         ^
   drivers/gpu/drm/nuvoton/ma35_plane.c:537:4: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     537 |                         FIELD_PREP(MA35_CURSOR_HOTSPOT_X_MASK, new_state->hotspot_x) |
         |                         ^
   7 errors generated.
--
>> drivers/gpu/drm/nuvoton/ma35_crtc.c:97:8: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      97 |         reg = FIELD_PREP(MA35_DISPLAY_TOTAL_MASK, mode->htotal) |
         |               ^
>> drivers/gpu/drm/nuvoton/ma35_crtc.c:228:10: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     228 |         *hpos = FIELD_GET(MA35_DISPLAY_CURRENT_X, reg);
         |                 ^
   drivers/gpu/drm/nuvoton/ma35_crtc.c:284:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     284 |                 reg = FIELD_PREP(MA35_GAMMA_RED_MASK, r[i]) |
         |                       ^
   3 errors generated.
--
>> drivers/gpu/drm/nuvoton/ma35_interface.c:150:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     150 |         if (!interface) {
         |             ^~~~~~~~~~
   drivers/gpu/drm/nuvoton/ma35_interface.c:191:9: note: uninitialized use occurs here
     191 |         return ret;
         |                ^~~
   drivers/gpu/drm/nuvoton/ma35_interface.c:150:2: note: remove the 'if' if its condition is always false
     150 |         if (!interface) {
         |         ^~~~~~~~~~~~~~~~~
     151 |                 drm_err(drm_dev, "Failed to initialize encoder\n");
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     152 |                 goto error_early;
         |                 ~~~~~~~~~~~~~~~~~
     153 |         }
         |         ~
   drivers/gpu/drm/nuvoton/ma35_interface.c:145:9: note: initialize the variable 'ret' to silence this warning
     145 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.


vim +/FIELD_PREP +177 drivers/gpu/drm/nuvoton/ma35_plane.c

   167	
   168	static int ma35_layer_blend_mode_select(u32 mode, u32 *reg)
   169	{
   170		u32 ret = 0;
   171	
   172		switch (mode) {
   173		case MA35_ALPHA_CLEAR:
   174			*reg = MA35_BLEND_MODE_CLEAR;
   175			break;
   176		case MA35_ALPHA_SRC:
 > 177			*reg = MA35_BLEND_MODE_SRC;
   178			break;
   179		case MA35_ALPHA_DST:
   180			*reg = MA35_BLEND_MODE_DST;
   181			break;
   182		case MA35_ALPHA_SRC_OVER:
   183			*reg = MA35_BLEND_MODE_SRC_OVER;
   184			break;
   185		case MA35_ALPHA_DST_OVER:
   186			*reg = MA35_BLEND_MODE_DST_OVER;
   187			break;
   188		case MA35_ALPHA_SRC_IN:
   189			*reg = MA35_BLEND_MODE_SRC_IN;
   190			break;
   191		case MA35_ALPHA_DST_IN:
   192			*reg = MA35_BLEND_MODE_DST_IN;
   193			break;
   194		case MA35_ALPHA_SRC_OUT:
   195			*reg = MA35_BLEND_MODE_SRC_OUT;
   196			break;
   197		case MA35_ALPHA_DST_OUT:
   198			*reg = MA35_BLEND_MODE_DST_OUT;
   199			break;
   200		case MA35_ALPHA_SRC_ATOP:
   201			*reg = MA35_BLEND_MODE_SRC_ATOP;
   202			break;
   203		case MA35_ALPHA_DST_ATOP:
   204			*reg = MA35_BLEND_MODE_DST_ATOP;
   205			break;
   206		case MA35_ALPHA_XOR:
   207			*reg = MA35_BLEND_MODE_XOR;
   208			break;
   209		default:
   210			ret = -EINVAL;
   211		}
   212	
   213		return ret;
   214	}
   215	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
