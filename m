Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QMNsIdVwlmlqfQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 03:09:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB34C15B8A5
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 03:09:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE30710E651;
	Thu, 19 Feb 2026 02:09:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ByYpSEL1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6AFB10E651
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 02:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771466960; x=1803002960;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=7m30KQ51G2XBIZqrYYiXK7MzBNceBX0PbiFcf364MuU=;
 b=ByYpSEL1J/FBgKYw55EkWiG0pu5dcHbBAsiOLE7+1bqfgGiMuBkLMTvp
 tMmYHAjZh2OqSfZPYUMFWGwPQP1W1+hbaiFijoCb7FZNju4FeO0yBqStW
 fKfoYlfbpbtrhxV+fd92LpkCTi9k6tGWV62YSv6Rih2mbgF0tsNoP6f59
 7vY5CibhICb710D906WkK+0uFQu/g3V/7Ws9u8HLPGjkKF4osWJQW4YWj
 4bobHpfTCMmw1XZ9WLsn+/XBDvfTpLuJyX7nRi82MFM6wr3tkWXSMPT3/
 ByVMhHbCnF0E4ubYFx1ci/XkZirP1tRZYuq4F4NIgXK0h9mKaJLsjHfsl w==;
X-CSE-ConnectionGUID: R7JcVJsBTtaXd3L7DHK17g==
X-CSE-MsgGUID: x23NmbZJSUmKNCEEAo18qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="71753754"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="71753754"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 18:09:19 -0800
X-CSE-ConnectionGUID: pLBckp4rS0C2M5q/V9Eabg==
X-CSE-MsgGUID: XgxoqCM3QVmbKj/kGVpR+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="252075932"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
 by orviesa001.jf.intel.com with ESMTP; 18 Feb 2026 18:09:17 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vstTe-000000012tE-3GYS;
 Thu, 19 Feb 2026 02:09:14 +0000
Date: Thu, 19 Feb 2026 10:08:49 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, gregkh@linuxfoundation.org,
 deller@gmx.de, sam@ravnborg.org
Cc: oe-kbuild-all@lists.linux.dev, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 13/13] lib/fonts: Remove internal symbols and macros from
 public header file
Message-ID: <202602191044.XKx5ACdn-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:tzimmermann@suse.de,m:gregkh@linuxfoundation.org,m:deller@gmx.de,m:sam@ravnborg.org,m:oe-kbuild-all@lists.linux.dev,m:linux-fbdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[lkp@intel.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[suse.de,linuxfoundation.org,gmx.de,ravnborg.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,intel.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,01.org:url,font_sun_8x16.data:url]
X-Rspamd-Queue-Id: CB34C15B8A5
X-Rspamd-Action: no action

Hi Thomas,

kernel test robot noticed the following build errors:

[auto build test ERROR on 0082025812a31eda451fb14f13f52683ed375c49]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/fbdev-Declare-src-parameter-of-fb_pad_-helpers-as-constant/20260218-164243
base:   0082025812a31eda451fb14f13f52683ed375c49
patch link:    https://lore.kernel.org/r/20260218083855.10743-14-tzimmermann%40suse.de
patch subject: [PATCH 13/13] lib/fonts: Remove internal symbols and macros from public header file
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20260219/202602191044.XKx5ACdn-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260219/202602191044.XKx5ACdn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602191044.XKx5ACdn-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/powerpc/kernel/btext.c:23:
   arch/powerpc/kernel/btext.c: In function 'draw_byte':
>> arch/powerpc/kernel/btext.c:467:46: error: 'font_sun_8x16' undeclared (first use in this function); did you mean 'font_vga_8x16'?
     467 |         const unsigned char *font = PTRRELOC(font_sun_8x16.data) + font_index;
         |                                              ^~~~~~~~~~~~~
   arch/powerpc/include/asm/setup.h:19:34: note: in definition of macro 'PTRRELOC'
      19 | #define PTRRELOC(x)     ((typeof(x)) add_reloc_offset((unsigned long)(x)))
         |                                  ^
   arch/powerpc/kernel/btext.c:467:46: note: each undeclared identifier is reported only once for each function it appears in
     467 |         const unsigned char *font = PTRRELOC(font_sun_8x16.data) + font_index;
         |                                              ^~~~~~~~~~~~~
   arch/powerpc/include/asm/setup.h:19:34: note: in definition of macro 'PTRRELOC'
      19 | #define PTRRELOC(x)     ((typeof(x)) add_reloc_offset((unsigned long)(x)))
         |                                  ^


vim +467 arch/powerpc/kernel/btext.c

7191b615759ec1 Benjamin Herrenschmidt 2013-07-25  462  
7191b615759ec1 Benjamin Herrenschmidt 2013-07-25  463  static noinline void draw_byte(unsigned char c, long locX, long locY)
7191b615759ec1 Benjamin Herrenschmidt 2013-07-25  464  {
7191b615759ec1 Benjamin Herrenschmidt 2013-07-25  465  	unsigned char *base	= calc_base(locX << 3, locY << 4);
0ebc7feae79ac0 Dr. David Alan Gilbert 2023-08-25  466  	unsigned int font_index = c * 16;
b94b7356756164 Finn Thain             2025-11-10 @467  	const unsigned char *font = PTRRELOC(font_sun_8x16.data) + font_index;
7191b615759ec1 Benjamin Herrenschmidt 2013-07-25  468  	int rb			= dispDeviceRowBytes;
7191b615759ec1 Benjamin Herrenschmidt 2013-07-25  469  
7191b615759ec1 Benjamin Herrenschmidt 2013-07-25  470  	rmci_maybe_on();
7191b615759ec1 Benjamin Herrenschmidt 2013-07-25  471  	switch(dispDeviceDepth) {
7191b615759ec1 Benjamin Herrenschmidt 2013-07-25  472  	case 24:
7191b615759ec1 Benjamin Herrenschmidt 2013-07-25  473  	case 32:
7191b615759ec1 Benjamin Herrenschmidt 2013-07-25  474  		draw_byte_32(font, (unsigned int *)base, rb);
7191b615759ec1 Benjamin Herrenschmidt 2013-07-25  475  		break;
7191b615759ec1 Benjamin Herrenschmidt 2013-07-25  476  	case 15:
7191b615759ec1 Benjamin Herrenschmidt 2013-07-25  477  	case 16:
7191b615759ec1 Benjamin Herrenschmidt 2013-07-25  478  		draw_byte_16(font, (unsigned int *)base, rb);
7191b615759ec1 Benjamin Herrenschmidt 2013-07-25  479  		break;
7191b615759ec1 Benjamin Herrenschmidt 2013-07-25  480  	case 8:
7191b615759ec1 Benjamin Herrenschmidt 2013-07-25  481  		draw_byte_8(font, (unsigned int *)base, rb);
7191b615759ec1 Benjamin Herrenschmidt 2013-07-25  482  		break;
7191b615759ec1 Benjamin Herrenschmidt 2013-07-25  483  	}
7191b615759ec1 Benjamin Herrenschmidt 2013-07-25  484  	rmci_maybe_off();
7191b615759ec1 Benjamin Herrenschmidt 2013-07-25  485  }
7191b615759ec1 Benjamin Herrenschmidt 2013-07-25  486  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
