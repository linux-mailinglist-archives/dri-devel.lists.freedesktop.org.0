Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eOxXG6IzlmktcAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 22:48:18 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD9C15A643
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 22:48:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0A2E10E2C2;
	Wed, 18 Feb 2026 21:48:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OuAp+iYr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BCE110E2C2
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Feb 2026 21:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771451294; x=1802987294;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=IWjVj/f0p/cVs98D/JBHnUR2ir7uqscmcLwif2ekJKs=;
 b=OuAp+iYrU+1JqpymziuqPxiLihu2LjEeVnLek2NYKDPdsp1vQSkFVPK5
 FdKhL3huApPTBEFbXwRR5P/Ru0Iv3f4HUQUSh08NAfWXrTKgqv1qjob1+
 PQ2BavtURulydSYKIXr/I7q/ipUxgriNKlg1JBQ+yuJ5Yhlu30JUay8O2
 8ojsAV18i5qA24jwGtbgs9tdu9D/p1aR/fovMNNzahwYM+Vq8Jhmxjggn
 vr/aonf7izDXfuKSPv/eeUoxRSGBQxdb4pxEli3z9YIcOsdbnIwaVJIec
 q4Kfqn1dG9Ijvh7JVTd4Gl9k5H2uLGOKOVM5YfrKT8uG6bO3e1YgUllnB g==;
X-CSE-ConnectionGUID: V3Mt8n1hTn6WPa1/2i5lwg==
X-CSE-MsgGUID: XHX6o6m7RjOJ/c5WtoxLqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="72438601"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="72438601"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 13:48:13 -0800
X-CSE-ConnectionGUID: grLfGY/1RCSDZnjnbhpJaw==
X-CSE-MsgGUID: ycPOfQM0SR2vfb7xMqWRNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="218465029"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
 by orviesa003.jf.intel.com with ESMTP; 18 Feb 2026 13:48:10 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vspOy-000000012l2-0cJj;
 Wed, 18 Feb 2026 21:48:08 +0000
Date: Thu, 19 Feb 2026 05:47:36 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, gregkh@linuxfoundation.org,
 deller@gmx.de, sam@ravnborg.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 13/13] lib/fonts: Remove internal symbols and macros from
 public header file
Message-ID: <202602190548.KwDrx2RS-lkp@intel.com>
References: <20260218083855.10743-14-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260218083855.10743-14-tzimmermann@suse.de>
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
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tzimmermann@suse.de,m:gregkh@linuxfoundation.org,m:deller@gmx.de,m:sam@ravnborg.org,m:llvm@lists.linux.dev,m:oe-kbuild-all@lists.linux.dev,m:linux-fbdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[suse.de,linuxfoundation.org,gmx.de,ravnborg.org];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[lkp@intel.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 9BD9C15A643
X-Rspamd-Action: no action

Hi Thomas,

kernel test robot noticed the following build errors:

[auto build test ERROR on 0082025812a31eda451fb14f13f52683ed375c49]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/fbdev-Declare-src-parameter-of-fb_pad_-helpers-as-constant/20260218-164243
base:   0082025812a31eda451fb14f13f52683ed375c49
patch link:    https://lore.kernel.org/r/20260218083855.10743-14-tzimmermann%40suse.de
patch subject: [PATCH 13/13] lib/fonts: Remove internal symbols and macros from public header file
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260219/202602190548.KwDrx2RS-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e86750b29fa0ff207cd43213d66dabe565417638)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260219/202602190548.KwDrx2RS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602190548.KwDrx2RS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/sparc/kernel/btext.c:195:30: error: use of undeclared identifier 'font_sun_8x16'; did you mean 'font_vga_8x16'?
     195 |         const unsigned char *font       = font_sun_8x16.data + font_index;
         |                                           ^~~~~~~~~~~~~
         |                                           font_vga_8x16
   include/linux/font.h:99:31: note: 'font_vga_8x16' declared here
      99 | extern const struct font_desc font_vga_8x16;
         |                               ^
   1 error generated.


vim +195 arch/sparc/kernel/btext.c

c57ec52f2647e5 David S. Miller        2009-11-27  190  
c57ec52f2647e5 David S. Miller        2009-11-27  191  static void draw_byte(unsigned char c, long locX, long locY)
c57ec52f2647e5 David S. Miller        2009-11-27  192  {
c57ec52f2647e5 David S. Miller        2009-11-27  193  	unsigned char *base	= calc_base(locX << 3, locY << 4);
0f1991949d9bd5 Dr. David Alan Gilbert 2023-08-07  194  	unsigned int font_index = c * 16;
0f1991949d9bd5 Dr. David Alan Gilbert 2023-08-07 @195  	const unsigned char *font	= font_sun_8x16.data + font_index;
c57ec52f2647e5 David S. Miller        2009-11-27  196  	int rb			= dispDeviceRowBytes;
c57ec52f2647e5 David S. Miller        2009-11-27  197  
c57ec52f2647e5 David S. Miller        2009-11-27  198  	switch(dispDeviceDepth) {
c57ec52f2647e5 David S. Miller        2009-11-27  199  	case 24:
c57ec52f2647e5 David S. Miller        2009-11-27  200  	case 32:
c57ec52f2647e5 David S. Miller        2009-11-27  201  		draw_byte_32(font, (unsigned int *)base, rb);
c57ec52f2647e5 David S. Miller        2009-11-27  202  		break;
c57ec52f2647e5 David S. Miller        2009-11-27  203  	case 15:
c57ec52f2647e5 David S. Miller        2009-11-27  204  	case 16:
c57ec52f2647e5 David S. Miller        2009-11-27  205  		draw_byte_16(font, (unsigned int *)base, rb);
c57ec52f2647e5 David S. Miller        2009-11-27  206  		break;
c57ec52f2647e5 David S. Miller        2009-11-27  207  	case 8:
c57ec52f2647e5 David S. Miller        2009-11-27  208  		draw_byte_8(font, (unsigned int *)base, rb);
c57ec52f2647e5 David S. Miller        2009-11-27  209  		break;
c57ec52f2647e5 David S. Miller        2009-11-27  210  	}
c57ec52f2647e5 David S. Miller        2009-11-27  211  }
c57ec52f2647e5 David S. Miller        2009-11-27  212  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
