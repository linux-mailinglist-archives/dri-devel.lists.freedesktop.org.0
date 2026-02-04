Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8CwJEelig2nAmAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 16:16:57 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77703E83A0
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 16:16:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45C6310E67B;
	Wed,  4 Feb 2026 15:16:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="caItZR+n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4E1B10E67B
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Feb 2026 15:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770218213; x=1801754213;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=LAS0EkVBgtrNL60SSrA5BOjIsofdR08gLvcrjcrN/r0=;
 b=caItZR+nAk+LdmkjMi2l0RSWfXrVhlbXNG5pjjGBWML+I1qYcUs7r9Fw
 JbOYj5Aaxb6RgRA8bHOujzsEuWBK9Ib81Wz7w1Vi1LrkJ/d3mRTd1OrI2
 gpC4yxY8ZAZD7ZdNz6lG/KTTuNN83gKLtS6NZPqmPr5e5NYBDc0NZiMx4
 L5F8fcqFVM7z4y2HRf+J3wFLeQnQi2aWweOPEbhXYrzmiLGoBTgGoUlPv
 akTUcYTrZVMN75xtpWAjNwI5XB22YcHav9gTfLIm5s9kgWsy2DFLvpcV6
 2owCtxN5G4H5+FUjYXQHRXf+LousvRwVqF7t/t6CELe7FMLx8rID/6iHG w==;
X-CSE-ConnectionGUID: jF2jT+efRPSOm/qogGiv+A==
X-CSE-MsgGUID: SB30fEmCRTqj0WTc7Ykwew==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71391214"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="71391214"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 07:16:52 -0800
X-CSE-ConnectionGUID: YsXuTrHrR5OvoMFxxH70BQ==
X-CSE-MsgGUID: d1cXLsZCSf2uiD2pONH8ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="240967509"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
 by fmviesa001.fm.intel.com with ESMTP; 04 Feb 2026 07:16:50 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vneca-00000000iLA-25QB;
 Wed, 04 Feb 2026 15:16:48 +0000
Date: Wed, 4 Feb 2026 23:16:23 +0800
From: kernel test robot <lkp@intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
 Helge Deller <deller@gmx.de>
Cc: oe-kbuild-all@lists.linux.dev, Chen Ni <nichen@iscas.ac.cn>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v1 2/3] fbdev: au1100fb: Make driver compilable on
 non-mips platforms
Message-ID: <202602042342.RXu7sDV7-lkp@intel.com>
References: <474eca0c9ecb8a2e610e82922ad22ad7e8ff0b8b.1770196161.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <474eca0c9ecb8a2e610e82922ad22ad7e8ff0b8b.1770196161.git.u.kleine-koenig@baylibre.com>
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,intel.com:mid,01.org:url]
X-Rspamd-Queue-Id: 77703E83A0
X-Rspamd-Action: no action

Hi Uwe,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 0636e6205beed850d985276dc56fd73d785bea5c]

url:    https://github.com/intel-lab-lkp/linux/commits/Uwe-Kleine-K-nig/fbdev-au1100fb-Mark-several-local-functions-as-static/20260204-171704
base:   0636e6205beed850d985276dc56fd73d785bea5c
patch link:    https://lore.kernel.org/r/474eca0c9ecb8a2e610e82922ad22ad7e8ff0b8b.1770196161.git.u.kleine-koenig%40baylibre.com
patch subject: [PATCH v1 2/3] fbdev: au1100fb: Make driver compilable on non-mips platforms
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20260204/202602042342.RXu7sDV7-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260204/202602042342.RXu7sDV7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602042342.RXu7sDV7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/video/fbdev/au1100fb.c: In function 'au1100fb_fb_mmap':
   drivers/video/fbdev/au1100fb.c:354:39: error: lvalue required as left operand of assignment
     354 |         pgprot_val(vma->vm_page_prot) |= (6 << 9); //CCA=6
         |                                       ^~
   In file included from include/asm-generic/bug.h:31,
                    from arch/s390/include/asm/bug.h:60,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from arch/s390/include/asm/cmpxchg.h:11,
                    from arch/s390/include/asm/atomic.h:16,
                    from include/linux/atomic.h:7,
                    from include/asm-generic/bitops/atomic.h:5,
                    from arch/s390/include/asm/bitops.h:75,
                    from include/linux/bitops.h:67,
                    from include/linux/kernel.h:23,
                    from include/linux/clk.h:13,
                    from drivers/video/fbdev/au1100fb.c:44:
   drivers/video/fbdev/au1100fb.c: In function 'au1100fb_drv_probe':
>> include/linux/kern_levels.h:5:25: warning: format '%d' expects argument of type 'int', but argument 2 has type 'size_t' {aka 'long unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:484:25: note: in definition of macro 'printk_index_wrap'
     484 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   drivers/video/fbdev/au1100fb.h:33:30: note: in expansion of macro 'printk'
      33 | #define print_err(f, arg...) printk(KERN_ERR DRIVER_NAME ": " f "\n", ## arg)
         |                              ^~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   drivers/video/fbdev/au1100fb.h:33:37: note: in expansion of macro 'KERN_ERR'
      33 | #define print_err(f, arg...) printk(KERN_ERR DRIVER_NAME ": " f "\n", ## arg)
         |                                     ^~~~~~~~
   drivers/video/fbdev/au1100fb.c:472:17: note: in expansion of macro 'print_err'
     472 |                 print_err("fail to allocate framebuffer (size: %dK))",
         |                 ^~~~~~~~~


vim +5 include/linux/kern_levels.h

314ba3520e513a Joe Perches 2012-07-30  4  
04d2c8c83d0e3a Joe Perches 2012-07-30 @5  #define KERN_SOH	"\001"		/* ASCII Start Of Header */
04d2c8c83d0e3a Joe Perches 2012-07-30  6  #define KERN_SOH_ASCII	'\001'
04d2c8c83d0e3a Joe Perches 2012-07-30  7  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
