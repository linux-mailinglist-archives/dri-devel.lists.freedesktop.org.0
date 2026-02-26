Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGCUM2XZoGkDngQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 00:38:13 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 779A71B0F2A
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 00:38:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E62F10E008;
	Thu, 26 Feb 2026 23:38:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aES+IuGY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 727B410E008
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 23:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772149084; x=1803685084;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ycrKLDU4IpRTv1hmXNWpEDbPGZFK9jRLJ8UpYmjOn3w=;
 b=aES+IuGYDLEDHdGKcX+T8b63u7sfmyAlNr5De705Ez6746b5yUrqmwqG
 UNBUWvhkycx0ORa3aPk/vTjn5VaQzxcGrqX9DPc5NZ4Ii40HvAfZWiaan
 8Y+AZN0siDUwxyLkCCB+37pw3WpUfdxBqxKNpBkaMTatKoS7VQjfOke7k
 JZ/wKaQV4DkyyFovvKERwnno7Zh+xglPHCxaLROPSM2+yZNp3/nJCL42i
 9CcPkGpafauV2HWjsGl9AQZ2P9OKT/tJRxurHL4jilFGeDrSGqBY0AZXy
 1Z29WIjFOzEy4e8omFOC6QuduPyWzra8VL8s7seQxDhP76VAjI/lUPDoi Q==;
X-CSE-ConnectionGUID: LPf5gdsAQ7iyGj6VrJkjSw==
X-CSE-MsgGUID: /CHCyvHBRPeQCJ6YHDcolw==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="72433809"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="72433809"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 15:38:04 -0800
X-CSE-ConnectionGUID: +Qj5ItRiRouYZ/kocrgejA==
X-CSE-MsgGUID: j7DXUfKnRi6gS8lI5hcXuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="220859566"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
 by orviesa003.jf.intel.com with ESMTP; 26 Feb 2026 15:37:58 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vvkti-00000000A0R-3SDC;
 Thu, 26 Feb 2026 23:37:21 +0000
Date: Fri, 27 Feb 2026 07:35:08 +0800
From: kernel test robot <lkp@intel.com>
To: dhyan19022009@gmail.com, Andy Shevchenko <andy@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Jason Donenfeld <Jason@zx2c4.com>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, Dhyan K Prajapati <dhyan19022009@gmail.com>
Subject: Re: [PATCH] staging: fbtft: fix macro whitespace errors
Message-ID: <202602270720.2J4j3gHF-lkp@intel.com>
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
X-Spamd-Result: default: False [-0.11 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dhyan19022009@gmail.com,m:andy@kernel.org,m:gregkh@linuxfoundation.org,m:llvm@lists.linux.dev,m:oe-kbuild-all@lists.linux.dev,m:Jason@zx2c4.com,m:linux-fbdev@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[lists.linux.dev,zx2c4.com,lists.freedesktop.org,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[lkp@intel.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linuxfoundation.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	R_SPF_DNSFAIL(0.00)[temporary DNS error];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,intel.com:email,01.org:url]
X-Rspamd-Queue-Id: 779A71B0F2A
X-Rspamd-Action: no action

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/dhyan19022009-gmail-com/staging-fbtft-fix-macro-whitespace-errors/20260227-021646
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20260226172531.13714-1-dhyan19022009%40gmail.com
patch subject: [PATCH] staging: fbtft: fix macro whitespace errors
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260227/202602270720.2J4j3gHF-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260227/202602270720.2J4j3gHF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602270720.2J4j3gHF-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/staging/fbtft/fbtft-bus.c:65:53: error: too few arguments provided to function-like macro invocation
      65 | define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8)
         |                                                     ^
   drivers/staging/fbtft/fbtft-bus.c:14:9: note: macro 'define_fbtft_write_reg' defined here
      14 | #define define_fbtft_write_reg(func, buffer_type, data_type, modifier)        \
         |         ^
>> drivers/staging/fbtft/fbtft-bus.c:65:1: error: unknown type name 'define_fbtft_write_reg'
      65 | define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8)
         | ^
   drivers/staging/fbtft/fbtft-bus.c:67:57: error: too few arguments provided to function-like macro invocation
      67 | define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16)
         |                                                         ^
   drivers/staging/fbtft/fbtft-bus.c:14:9: note: macro 'define_fbtft_write_reg' defined here
      14 | #define define_fbtft_write_reg(func, buffer_type, data_type, modifier)        \
         |         ^
   drivers/staging/fbtft/fbtft-bus.c:67:1: error: unknown type name 'define_fbtft_write_reg'
      67 | define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16)
         | ^
   4 errors generated.


vim +65 drivers/staging/fbtft/fbtft-bus.c

    64	
  > 65	define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8)
    66	define_fbtft_write_reg(fbtft_write_reg16_bus8, __be16, u16, cpu_to_be16)
    67	define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16)
    68	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
