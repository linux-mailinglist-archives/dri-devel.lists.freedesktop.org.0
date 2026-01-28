Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id PovJMEB0eWkSxQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 03:28:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE069C408
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 03:28:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3D2610E60B;
	Wed, 28 Jan 2026 02:28:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JQIhNAyT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B144810E60B
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 02:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769567292; x=1801103292;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=AsLaV6WjLigGQB+1fL0zxdBAPWzCg6IZSXz0Q9HxAG8=;
 b=JQIhNAyT/l0MdqE5FS+0uokeWUkYeMu9WENXfnMhl09vj0iTiddrJZ8v
 qiL2Mze7eo8DFteI09+v5jYgKHQsyA8NvskseibfjqOBG5iySm79nHbrB
 XpfrpjCeBHiy9xFoZaxwofu+9RaJaSRMeSwLKmO8HP+PKdW5JzgjTsR8S
 RKT9f9GKfXEVMN3rN8WpYA8TXbss12ulmyFfGONUsnEBbiPYexPeOgFJk
 uUZEQJbHihFxZBGiOprphQG2rWoE9NW8szCmYrUAtUrmGNUlahfW3py1s
 rUIZionkKNyuQlFk5rWhdtDTDSJYT7wpRX5LPrHH0PRd5bzsX8jdIadmQ w==;
X-CSE-ConnectionGUID: OCu4g6xASve8FZB7dLEmgA==
X-CSE-MsgGUID: WKmspE5tSSWjkm3eWq6Y5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="81881449"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="81881449"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 18:28:11 -0800
X-CSE-ConnectionGUID: Y8t6OJ+RTyODRg9E9tlaNw==
X-CSE-MsgGUID: 1pnRvin1TRWKvOKkPfe5QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="207277691"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
 by orviesa006.jf.intel.com with ESMTP; 27 Jan 2026 18:28:07 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vkvHo-00000000Z8y-1XK9;
 Wed, 28 Jan 2026 02:28:04 +0000
Date: Wed, 28 Jan 2026 10:27:05 +0800
From: kernel test robot <lkp@intel.com>
To: Joey Lu <a0987203069@gmail.com>, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, ychuang3@nuvoton.com, schung@nuvoton.com,
 yclu4@nuvoton.com, a0987203069@gmail.com,
 linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] drm/nuvoton: add MA35D1 display controller driver
Message-ID: <202601281037.qP5gX0kK-lkp@intel.com>
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:a0987203069@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:oe-kbuild-all@lists.linux.dev,m:ychuang3@nuvoton.com,m:schung@nuvoton.com,m:yclu4@nuvoton.com,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER(0.00)[lkp@intel.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[lists.linux.dev,nuvoton.com,gmail.com,lists.infradead.org,lists.freedesktop.org,vger.kernel.org];
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
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,01.org:url,intel.com:email,intel.com:dkim,intel.com:mid,gitlab.freedesktop.org:url,git-scm.com:url]
X-Rspamd-Queue-Id: DDE069C408
X-Rspamd-Action: no action

Hi Joey,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm/drm-next]
[cannot apply to robh/for-next linus/master v6.19-rc7 next-20260127]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Joey-Lu/dt-bindings-display-nuvoton-add-MA35D1-DCU-binding/20260126-170258
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20260126085727.2568958-4-a0987203069%40gmail.com
patch subject: [PATCH 3/3] drm/nuvoton: add MA35D1 display controller driver
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260128/202601281037.qP5gX0kK-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260128/202601281037.qP5gX0kK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601281037.qP5gX0kK-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/nuvoton/ma35_drm.h:18,
                    from drivers/gpu/drm/nuvoton/ma35_plane.c:23:
   drivers/gpu/drm/nuvoton/ma35_plane.c: In function 'ma35_layer_blend_mode_select':
>> drivers/gpu/drm/nuvoton/ma35_plane.h:141:9: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
     141 |         FIELD_PREP(MA35_SRC_BLENDING_MODE, MA35_ALPHA_BLEND_ONE)
         |         ^~~~~~~~~~
   drivers/gpu/drm/nuvoton/ma35_plane.c:177:24: note: in expansion of macro 'MA35_BLEND_MODE_SRC'
     177 |                 *reg = MA35_BLEND_MODE_SRC;
         |                        ^~~~~~~~~~~~~~~~~~~
--
   drivers/gpu/drm/nuvoton/ma35_crtc.c: In function 'ma35_crtc_atomic_enable':
>> drivers/gpu/drm/nuvoton/ma35_crtc.c:97:15: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
      97 |         reg = FIELD_PREP(MA35_DISPLAY_TOTAL_MASK, mode->htotal) |
         |               ^~~~~~~~~~
   drivers/gpu/drm/nuvoton/ma35_crtc.c: In function 'ma35_crtc_get_scanout_position':
>> drivers/gpu/drm/nuvoton/ma35_crtc.c:228:17: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]
     228 |         *hpos = FIELD_GET(MA35_DISPLAY_CURRENT_X, reg);
         |                 ^~~~~~~~~


vim +/FIELD_PREP +141 drivers/gpu/drm/nuvoton/ma35_plane.h

   137	
   138	/* configs for blend modes */
   139	#define MA35_BLEND_MODE_CLEAR	0
   140	#define MA35_BLEND_MODE_SRC	\
 > 141		FIELD_PREP(MA35_SRC_BLENDING_MODE, MA35_ALPHA_BLEND_ONE)
   142	#define MA35_BLEND_MODE_DST \
   143		FIELD_PREP(MA35_DST_BLENDING_MODE, MA35_ALPHA_BLEND_ONE)
   144	#define MA35_BLEND_MODE_SRC_OVER \
   145		(FIELD_PREP(MA35_SRC_BLENDING_MODE, MA35_ALPHA_BLEND_ONE) | \
   146		FIELD_PREP(MA35_DST_BLENDING_MODE, MA35_ALPHA_BLEND_INVERSED))
   147	#define MA35_BLEND_MODE_DST_OVER \
   148		(FIELD_PREP(MA35_SRC_BLENDING_MODE, MA35_ALPHA_BLEND_INVERSED) | \
   149		FIELD_PREP(MA35_DST_BLENDING_MODE, MA35_ALPHA_BLEND_ONE))
   150	#define MA35_BLEND_MODE_SRC_IN \
   151		FIELD_PREP(MA35_SRC_BLENDING_MODE, MA35_ALPHA_BLEND_NORMAL)
   152	#define MA35_BLEND_MODE_DST_IN \
   153		FIELD_PREP(MA35_DST_BLENDING_MODE, MA35_ALPHA_BLEND_NORMAL)
   154	#define MA35_BLEND_MODE_SRC_OUT \
   155		FIELD_PREP(MA35_SRC_BLENDING_MODE, MA35_ALPHA_BLEND_INVERSED)
   156	#define MA35_BLEND_MODE_DST_OUT \
   157		FIELD_PREP(MA35_DST_BLENDING_MODE, MA35_ALPHA_BLEND_INVERSED)
   158	#define MA35_BLEND_MODE_SRC_ATOP \
   159		(FIELD_PREP(MA35_SRC_BLENDING_MODE, MA35_ALPHA_BLEND_NORMAL) | \
   160		FIELD_PREP(MA35_DST_BLENDING_MODE, MA35_ALPHA_BLEND_INVERSED))
   161	#define MA35_BLEND_MODE_DST_ATOP \
   162		(FIELD_PREP(MA35_SRC_BLENDING_MODE, MA35_ALPHA_BLEND_INVERSED) | \
   163		FIELD_PREP(MA35_DST_BLENDING_MODE, MA35_ALPHA_BLEND_NORMAL))
   164	#define MA35_BLEND_MODE_XOR \
   165		(FIELD_PREP(MA35_SRC_BLENDING_MODE, MA35_ALPHA_BLEND_INVERSED) | \
   166		FIELD_PREP(MA35_DST_BLENDING_MODE, MA35_ALPHA_BLEND_INVERSED))
   167	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
