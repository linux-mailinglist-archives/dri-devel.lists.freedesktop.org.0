Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +H9GLSPFh2lldAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 08 Feb 2026 00:05:07 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4AA1075FD
	for <lists+dri-devel@lfdr.de>; Sun, 08 Feb 2026 00:05:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5A6710E160;
	Sat,  7 Feb 2026 23:05:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d7GsxG/T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52BDE10E160
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Feb 2026 23:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770505501; x=1802041501;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=m+VN/OQZTHSoYlmzSsExz3e9qfTXW1hXW9zeX8jPSGQ=;
 b=d7GsxG/TaKAiwHbWe+/TwopRB2gEsNToSJAZSuJDHSYoHMQ+0roiRj6G
 +xNIPdVVU4gfQdQue85cXphqzHT7D+q+/Wl2PH6KEO5FCkEuhVv8mOgnr
 Ml0/aOGm2AujaCaYU7hObXTduCcUUr3swIn8IaBi+pwFKoRHZ7AWJ8mol
 ig6wATQsFmQeOyW9EFsS/l/ZLcz3IK4VuRfOvlFo/bojystpsWtCktTHA
 PLnzLSDvbLwUYE/MKU1+oKBBw946e3YC8xkQjiqLEcCJap3fjDkwj6PwK
 TDXTk79UAg+q65Ok1OvwjYJlGrCUgVz26Z64mi36mYNcUC/5ZPNvTVXoE g==;
X-CSE-ConnectionGUID: CUlTYQZURACeP1/lKQc01Q==
X-CSE-MsgGUID: PBjNn4OSQ26+ExCvFNWZgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11694"; a="89247593"
X-IronPort-AV: E=Sophos;i="6.21,279,1763452800"; d="scan'208";a="89247593"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2026 15:05:01 -0800
X-CSE-ConnectionGUID: lZph8QtEQs2QLXCGZ+6Yjw==
X-CSE-MsgGUID: Z0CVQe6TQC2j8UDwc+tYvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,279,1763452800"; d="scan'208";a="211023916"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
 by fmviesa008.fm.intel.com with ESMTP; 07 Feb 2026 15:04:59 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vorMG-00000000lvw-2M0V;
 Sat, 07 Feb 2026 23:04:56 +0000
Date: Sun, 8 Feb 2026 07:04:01 +0800
From: kernel test robot <lkp@intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
 Helge Deller <deller@gmx.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Chen Ni <nichen@iscas.ac.cn>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 4/4] fbdev: au1100fb: Make driver compilable on
 non-mips platforms
Message-ID: <202602080617.eBFEo4gK-lkp@intel.com>
References: <b894247689a7a920d9caa465dbcb840bca806cbf.1770483674.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b894247689a7a920d9caa465dbcb840bca806cbf.1770483674.git.u.kleine-koenig@baylibre.com>
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
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:u.kleine-koenig@baylibre.com,m:deller@gmx.de,m:llvm@lists.linux.dev,m:oe-kbuild-all@lists.linux.dev,m:nichen@iscas.ac.cn,m:linux-fbdev@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[lkp@intel.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
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
	NEURAL_HAM(-0.00)[-0.986];
	RCPT_COUNT_SEVEN(0.00)[7];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[01.org:url]
X-Rspamd-Queue-Id: CB4AA1075FD
X-Rspamd-Action: no action

Hi Uwe,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 0636e6205beed850d985276dc56fd73d785bea5c]

url:    https://github.com/intel-lab-lkp/linux/commits/Uwe-Kleine-K-nig/fbdev-au1100fb-Don-t-store-device-specific-data-in-global-variables/20260208-011505
base:   0636e6205beed850d985276dc56fd73d785bea5c
patch link:    https://lore.kernel.org/r/b894247689a7a920d9caa465dbcb840bca806cbf.1770483674.git.u.kleine-koenig%40baylibre.com
patch subject: [PATCH v2 4/4] fbdev: au1100fb: Make driver compilable on non-mips platforms
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260208/202602080617.eBFEo4gK-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260208/202602080617.eBFEo4gK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602080617.eBFEo4gK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/video/fbdev/au1100fb.c:551:29: warning: unused variable 'fbregs' [-Wunused-variable]
     551 | static struct au1100fb_regs fbregs;
         |                             ^~~~~~
   1 warning generated.


vim +/fbregs +551 drivers/video/fbdev/au1100fb.c

^1da177e4c3f415 drivers/video/au1100fb.c Linus Torvalds   2005-04-16  549  
f77f50ca1a236ae drivers/video/au1100fb.c Rodolfo Giometti 2006-06-26  550  #ifdef CONFIG_PM
f77f50ca1a236ae drivers/video/au1100fb.c Rodolfo Giometti 2006-06-26 @551  static struct au1100fb_regs fbregs;
f77f50ca1a236ae drivers/video/au1100fb.c Rodolfo Giometti 2006-06-26  552  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
