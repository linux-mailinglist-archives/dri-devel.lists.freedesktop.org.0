Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QLMzJDVZg2mJlQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 15:35:33 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA04CE72E3
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 15:35:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02A9410E146;
	Wed,  4 Feb 2026 14:35:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="La/bKhVv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2417510E146
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Feb 2026 14:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770215730; x=1801751730;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=S51Eo1kvBp2wy/E4Bblmv7YBpm0aNIOY3/VX+4k/fKI=;
 b=La/bKhVvTKG+MBJfkKc/DyOEtCuStDFf7/ulOCCW1dKV12jxPv3gU/k/
 4RC/SbYZ4OWtFQNGdbeb61CL0jIFtfusjepRkTInHF57uVOSkpe0y8Bma
 J6qIBUbuBIJZxXkQx23IxWj6Mr/4+XD5NPMo+C4lmghRDVl9rI/e5uuIg
 y6irenCV72F2Avx6S957XE/txU7petgxEySBV00nCEX955s1/9JPQWUSD
 A9/dDfzy+yInLcwz2U73o0qwTHzpIf+Pp8qO8srg59nzlHYKN6FW5EKNj
 pQQfN2xpi+pCtK6Cb8QsRWiobh3eeqrzVrPGXiMoit+D6WgrXvUX8uh04 Q==;
X-CSE-ConnectionGUID: 1JvPd8N/SDypUgyn9RYVhA==
X-CSE-MsgGUID: LZjLI/OGRlqTa/TU/7uiIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71437069"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="71437069"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 06:35:29 -0800
X-CSE-ConnectionGUID: SyvXr0fbSH+kd4UCZRcVRQ==
X-CSE-MsgGUID: hrhRM+DnT8Wy939zJfiStA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="209472705"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
 by orviesa010.jf.intel.com with ESMTP; 04 Feb 2026 06:35:28 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vndyX-00000000huS-2DtK;
 Wed, 04 Feb 2026 14:35:25 +0000
Date: Wed, 4 Feb 2026 22:34:28 +0800
From: kernel test robot <lkp@intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
 Helge Deller <deller@gmx.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Chen Ni <nichen@iscas.ac.cn>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v1 2/3] fbdev: au1100fb: Make driver compilable on
 non-mips platforms
Message-ID: <202602042224.CY8SSh3n-lkp@intel.com>
References: <474eca0c9ecb8a2e610e82922ad22ad7e8ff0b8b.1770196161.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:u.kleine-koenig@baylibre.com,m:deller@gmx.de,m:llvm@lists.linux.dev,m:oe-kbuild-all@lists.linux.dev,m:nichen@iscas.ac.cn,m:linux-fbdev@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[lkp@intel.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[baylibre.com,gmx.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,intel.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,01.org:url]
X-Rspamd-Queue-Id: EA04CE72E3
X-Rspamd-Action: no action

Hi Uwe,

kernel test robot noticed the following build errors:

[auto build test ERROR on 0636e6205beed850d985276dc56fd73d785bea5c]

url:    https://github.com/intel-lab-lkp/linux/commits/Uwe-Kleine-K-nig/fbdev-au1100fb-Mark-several-local-functions-as-static/20260204-171704
base:   0636e6205beed850d985276dc56fd73d785bea5c
patch link:    https://lore.kernel.org/r/474eca0c9ecb8a2e610e82922ad22ad7e8ff0b8b.1770196161.git.u.kleine-koenig%40baylibre.com
patch subject: [PATCH v1 2/3] fbdev: au1100fb: Make driver compilable on non-mips platforms
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260204/202602042224.CY8SSh3n-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260204/202602042224.CY8SSh3n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602042224.CY8SSh3n-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/video/fbdev/au1100fb.c:354:32: error: expression is not assignable
     354 |         pgprot_val(vma->vm_page_prot) |= (6 << 9); //CCA=6
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
   drivers/video/fbdev/au1100fb.c:473:6: warning: format specifies type 'int' but the argument has type 'size_t' (aka 'unsigned long') [-Wformat]
     472 |                 print_err("fail to allocate framebuffer (size: %dK))",
         |                                                                ~~
         |                                                                %zu
     473 |                           fbdev->fb_len / 1024);
         |                           ^~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/au1100fb.h:33:74: note: expanded from macro 'print_err'
      33 | #define print_err(f, arg...) printk(KERN_ERR DRIVER_NAME ": " f "\n", ## arg)
         |                                                               ~          ^~~
   include/linux/printk.h:512:60: note: expanded from macro 'printk'
     512 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:484:19: note: expanded from macro 'printk_index_wrap'
     484 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   1 warning and 1 error generated.


vim +354 drivers/video/fbdev/au1100fb.c

3b495f2bb749b82 drivers/video/au1100fb.c       Pete Popov        2005-04-04  343  
3b495f2bb749b82 drivers/video/au1100fb.c       Pete Popov        2005-04-04  344  /* fb_mmap
3b495f2bb749b82 drivers/video/au1100fb.c       Pete Popov        2005-04-04  345   * Map video memory in user space. We don't use the generic fb_mmap method mainly
3b495f2bb749b82 drivers/video/au1100fb.c       Pete Popov        2005-04-04  346   * to allow the use of the TLB streaming flag (CCA=6)
3b495f2bb749b82 drivers/video/au1100fb.c       Pete Popov        2005-04-04  347   */
0238b447706a72c drivers/video/fbdev/au1100fb.c Uwe Kleine-König  2026-02-04  348  static int au1100fb_fb_mmap(struct fb_info *fbi, struct vm_area_struct *vma)
3b495f2bb749b82 drivers/video/au1100fb.c       Pete Popov        2005-04-04  349  {
67f30ad19c4b329 drivers/video/fbdev/au1100fb.c Christoph Hellwig 2019-04-28  350  	struct au1100fb_device *fbdev = to_au1100fb_device(fbi);
c05b7f3d12b9455 drivers/video/au1100fb.c       Rodolfo Giometti  2006-05-30  351  
76f92201b821dd2 drivers/video/fbdev/au1100fb.c Thomas Zimmermann 2023-11-27  352  	vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
76f92201b821dd2 drivers/video/fbdev/au1100fb.c Thomas Zimmermann 2023-11-27  353  
^1da177e4c3f415 drivers/video/au1100fb.c       Linus Torvalds    2005-04-16 @354  	pgprot_val(vma->vm_page_prot) |= (6 << 9); //CCA=6
^1da177e4c3f415 drivers/video/au1100fb.c       Linus Torvalds    2005-04-16  355  
67f30ad19c4b329 drivers/video/fbdev/au1100fb.c Christoph Hellwig 2019-04-28  356  	return dma_mmap_coherent(fbdev->dev, vma, fbdev->fb_mem, fbdev->fb_phys,
67f30ad19c4b329 drivers/video/fbdev/au1100fb.c Christoph Hellwig 2019-04-28  357  			fbdev->fb_len);
^1da177e4c3f415 drivers/video/au1100fb.c       Linus Torvalds    2005-04-16  358  }
^1da177e4c3f415 drivers/video/au1100fb.c       Linus Torvalds    2005-04-16  359  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
