Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kNihHQK9oGkDmQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 22:37:06 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4E11AFE4E
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 22:37:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5073510E9CF;
	Thu, 26 Feb 2026 21:37:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gN1lRxSM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD79010E9CF
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 21:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772141820; x=1803677820;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=n/uXtIE/7Q8NvOvfZpt0TUHV791gQBLA+O3rf+O+rAc=;
 b=gN1lRxSM/APMyMcpYl2ALnddxTy/ppImSJxG9V/rusZO6qA/byEBHSoU
 kgkAUbKSje7CFXjG6XGb9r5asGySPJSkG0DS5sJsA/MhzU+8BONaZcLUo
 o2Rub6zT3oYTYBrcPizNDX0QSGAVXccqDGKpVn2CRmVnbIoEGeSDCdjlt
 IwnNWhJPQOw6/nm76yKUJZsOy3EdxuZUKmSCz8BXJhx2KdfDEo0bT+POs
 itcobgzimHliDbCbb0Mu3HAIxhlGQvYkb3yr3rkod+TwPgYuhsbOog5VS
 TXtaqcuU6GmlfDjPlH/L3oWhmksD2CWB2a3mY+Vh7un8FCLE33+wnAdJp Q==;
X-CSE-ConnectionGUID: FvJuX4b2Rt2kP3n8DbPFQQ==
X-CSE-MsgGUID: 9XB+Z20kSOqAvmwKhntrxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="72250774"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="72250774"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 13:36:59 -0800
X-CSE-ConnectionGUID: bmecPqJLSHu3mefQpv3h0Q==
X-CSE-MsgGUID: 9v+KlnlaRJiTHTlfgCQytQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="215386016"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
 by fmviesa008.fm.intel.com with ESMTP; 26 Feb 2026 13:36:57 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vvj2U-000000009tX-3HN7;
 Thu, 26 Feb 2026 21:36:54 +0000
Date: Fri, 27 Feb 2026 05:36:47 +0800
From: kernel test robot <lkp@intel.com>
To: dhyan19022009@gmail.com, Andy Shevchenko <andy@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: oe-kbuild-all@lists.linux.dev, Jason Donenfeld <Jason@zx2c4.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Dhyan K Prajapati <dhyan19022009@gmail.com>
Subject: Re: [PATCH] staging: fbtft: fix macro whitespace errors
Message-ID: <202602270527.UlXqo4xH-lkp@intel.com>
References: <20260226172531.13714-1-dhyan19022009@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226172531.13714-1-dhyan19022009@gmail.com>
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
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,zx2c4.com,lists.freedesktop.org,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dhyan19022009@gmail.com,m:andy@kernel.org,m:gregkh@linuxfoundation.org,m:oe-kbuild-all@lists.linux.dev,m:Jason@zx2c4.com,m:linux-fbdev@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[lkp@intel.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linuxfoundation.org];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:mid,intel.com:dkim,intel.com:email,01.org:url]
X-Rspamd-Queue-Id: AC4E11AFE4E
X-Rspamd-Action: no action

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/dhyan19022009-gmail-com/staging-fbtft-fix-macro-whitespace-errors/20260227-021646
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20260226172531.13714-1-dhyan19022009%40gmail.com
patch subject: [PATCH] staging: fbtft: fix macro whitespace errors
config: parisc-randconfig-001-20260227 (https://download.01.org/0day-ci/archive/20260227/202602270527.UlXqo4xH-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260227/202602270527.UlXqo4xH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602270527.UlXqo4xH-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/staging/fbtft/fbtft-bus.c:65:53: error: macro "define_fbtft_write_reg" requires 4 arguments, but only 3 given
    define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8)
                                                        ^
>> drivers/staging/fbtft/fbtft-bus.c:65:23: error: expected ';' before 'void'
    define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8)
                          ^
                          ;
   drivers/staging/fbtft/fbtft-bus.c:67:57: error: macro "define_fbtft_write_reg" requires 4 arguments, but only 3 given
    define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16)
                                                            ^
   drivers/staging/fbtft/fbtft-bus.c:67:23: error: expected ';' before 'void'
    define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16)
                          ^
                          ;
   drivers/staging/fbtft/fbtft-bus.c:69:1:
    void fbtft_write_reg8_bus9(struct fbtft_par *par, int len, ...)
    ~~~~                   


vim +/define_fbtft_write_reg +65 drivers/staging/fbtft/fbtft-bus.c

    64	
  > 65	define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8)
    66	define_fbtft_write_reg(fbtft_write_reg16_bus8, __be16, u16, cpu_to_be16)
    67	define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16)
    68	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
