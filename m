Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gB5wCh5/iWlx+AQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 07:30:54 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 894CE10C150
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 07:30:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E14310E328;
	Mon,  9 Feb 2026 06:30:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XxquKAcL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2059110E328
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Feb 2026 06:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770618649; x=1802154649;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=dh+fb6XzsJt1cp4AMc0cC7Q8+klw9ZHu4lNBecMgYpA=;
 b=XxquKAcLp7S8miQKxr4PEviOsXMdf5WQrKijZBQfcgacJGHviY4kBmsZ
 DcPOS4VNLc02qPaTTIk9FsPD636uVHzemugT6JhOaJ6atVg5+/noxY8oX
 Gtu/cFcChw07Bz7C81UPcdTNx8sRXDToXAsMWVqtsCWiupjB+SgUE8Bu/
 2ZebKjhUELXatnaSjgMIT+SuBJdQO8TkZwbhWU6vLU789bRZbZzVcrv5u
 +a41hcdPjBiPxD7Meuye3VMlFoXWsFOIi5+TNmEJF60NcX0fDfrkDPNTF
 LXDJRU2Lclrg0usGvLbEngfGMHTuC1XmzWCC7uXeKwCqOg/CtrdBW6m/2 Q==;
X-CSE-ConnectionGUID: aCyHku9HRAG0oCwMKWFAMA==
X-CSE-MsgGUID: PQ1LCfNYRnCU2vAr0hxJTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="82048954"
X-IronPort-AV: E=Sophos;i="6.21,281,1763452800"; d="scan'208";a="82048954"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2026 22:30:48 -0800
X-CSE-ConnectionGUID: O088DlCgQdC/BW5r5rKpcw==
X-CSE-MsgGUID: q8o/2qmoRgyZDTQ9EeDC1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,281,1763452800"; d="scan'208";a="210574153"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
 by orviesa006.jf.intel.com with ESMTP; 08 Feb 2026 22:30:46 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vpKnD-00000000mes-3BZz;
 Mon, 09 Feb 2026 06:30:43 +0000
Date: Mon, 9 Feb 2026 14:30:13 +0800
From: kernel test robot <lkp@intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
 Helge Deller <deller@gmx.de>
Cc: oe-kbuild-all@lists.linux.dev, Chen Ni <nichen@iscas.ac.cn>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 5/6] fbdev: au1100fb: Make driver compilable on
 non-mips platforms
Message-ID: <202602091447.3HeLynhy-lkp@intel.com>
References: <67b7aa0157b9cf5de111ab6b2725d207ec98aae9.1770572936.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67b7aa0157b9cf5de111ab6b2725d207ec98aae9.1770572936.git.u.kleine-koenig@baylibre.com>
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:u.kleine-koenig@baylibre.com,m:deller@gmx.de,m:oe-kbuild-all@lists.linux.dev,m:nichen@iscas.ac.cn,m:linux-fbdev@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[baylibre.com,gmx.de];
	FORGED_SENDER(0.00)[lkp@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-0.984];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,intel.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 894CE10C150
X-Rspamd-Action: no action

Hi Uwe,

kernel test robot noticed the following build errors:

[auto build test ERROR on 0636e6205beed850d985276dc56fd73d785bea5c]

url:    https://github.com/intel-lab-lkp/linux/commits/Uwe-Kleine-K-nig/fbdev-au1100fb-Don-t-store-device-specific-data-in-global-variables/20260209-015956
base:   0636e6205beed850d985276dc56fd73d785bea5c
patch link:    https://lore.kernel.org/r/67b7aa0157b9cf5de111ab6b2725d207ec98aae9.1770572936.git.u.kleine-koenig%40baylibre.com
patch subject: [PATCH v3 5/6] fbdev: au1100fb: Make driver compilable on non-mips platforms
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20260209/202602091447.3HeLynhy-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260209/202602091447.3HeLynhy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602091447.3HeLynhy-lkp@intel.com/

All errors (new ones prefixed by >>):

   csky-linux-ld: drivers/video/fbdev/au1100fb.o: in function `au1100fb_drv_remove':
   au1100fb.c:(.text+0x21c): undefined reference to `unregister_framebuffer'
>> csky-linux-ld: au1100fb.c:(.text+0x224): undefined reference to `fb_dealloc_cmap'
   csky-linux-ld: drivers/video/fbdev/au1100fb.o: in function `au1100fb_fb_mmap':
   au1100fb.c:(.text+0x2bc): undefined reference to `unregister_framebuffer'
   csky-linux-ld: au1100fb.c:(.text+0x2c0): undefined reference to `fb_dealloc_cmap'
   csky-linux-ld: drivers/video/fbdev/au1100fb.o: in function `au1100fb_drv_probe':
   au1100fb.c:(.text+0x540): undefined reference to `fb_get_options'
>> csky-linux-ld: au1100fb.c:(.text+0x6e4): undefined reference to `fb_get_options'
>> csky-linux-ld: au1100fb.c:(.text+0x7bc): undefined reference to `fb_alloc_cmap'
>> csky-linux-ld: au1100fb.c:(.text+0x7d8): undefined reference to `register_framebuffer'
   csky-linux-ld: au1100fb.c:(.text+0x818): undefined reference to `fb_dealloc_cmap'
   csky-linux-ld: au1100fb.c:(.text+0x850): undefined reference to `fb_alloc_cmap'
   csky-linux-ld: au1100fb.c:(.text+0x860): undefined reference to `register_framebuffer'
   csky-linux-ld: au1100fb.c:(.text+0x874): undefined reference to `fb_dealloc_cmap'
>> csky-linux-ld: drivers/video/fbdev/au1100fb.o:(.rodata+0xc): undefined reference to `fb_io_read'
>> csky-linux-ld: drivers/video/fbdev/au1100fb.o:(.rodata+0x10): undefined reference to `fb_io_write'
>> csky-linux-ld: drivers/video/fbdev/au1100fb.o:(.rodata+0x2c): undefined reference to `cfb_fillrect'
>> csky-linux-ld: drivers/video/fbdev/au1100fb.o:(.rodata+0x30): undefined reference to `cfb_copyarea'
>> csky-linux-ld: drivers/video/fbdev/au1100fb.o:(.rodata+0x34): undefined reference to `cfb_imageblit'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
